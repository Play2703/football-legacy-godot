shader_type spatial;
render_mode diffuse_lambert, specular_schlick_ggx;
// EL CÉSPED SE PINTA EN LA GPU (2026-08-04). Antes esto era sólo el brillo del
// viento sobre una textura que la CPU horneaba téxel a téxel: 1,2 M de píxeles
// con patrón de corte, calvas y lodo, interpretados por GDScript. Medía 2,0 s en
// 1ª y 3,0 s en 3ª —el 80-95 % de todo el armado del recinto— y el partido se lo
// comía en UN solo fotograma, porque el reparto a trozos (`build_async`) sólo lo
// usa la portada. Y la caché era de memoria: cada estadio de visita y cada
// arranque en frío lo pagaban entero otra vez.
//
// El bucle era, literalmente, un fragment shader escrito en el lenguaje
// equivocado: por cada punto del campo calculaba un color a partir de su
// posición. Aquí abajo está el MISMO cálculo, en el sitio donde cuesta cero.
//
// De la CPU sólo queda la CAL: las líneas, los arcos y el tartán de la pista se
// hornean en una textura de MARCAS con alfa (transparente donde hay pasto) que
// se compone encima. Son unos cuantos rectángulos y dos circunferencias — el
// coste que ya tenían, milisegundos.
//
// LA CUENTA TIENE QUE COINCIDIR CON LA DE ANTES. `x_m`/`z_m` se derivan de UV
// exactamente como la CPU las derivaba de (tx, ty), así que el pasto cae donde
// siempre y encaja con la cal al téxel. Y el ruido se muestrea con la MISMA
// bilineal de pesos suavizados de `_sample_flat` (ver `sample_grid`), no con la
// del hardware: la del hardware es lineal a secas y las celdas de la rejilla
// —que es gruesa a propósito— se empezaban a notar.

uniform sampler2D marks_texture : source_color, filter_nearest;
// Rejillas de ruido de `_noise_grid`, subidas tal cual (24x36 y 40x60 en R8).
// filter_nearest a propósito: la interpolación la hace `sample_grid` a mano.
uniform sampler2D wear_noise : filter_nearest, repeat_enable;
uniform sampler2D mud_noise : filter_nearest, repeat_enable;

// --- Encuadre de la textura sobre el mundo (ver Stadium._pitch_tex_bounds) ---
uniform vec2 world_origin = vec2(-42.67, -21.33);   // (_wx0, _wz0) en metros
uniform vec2 world_span = vec2(85.33, 133.33);      // (_tw, _th) / TEXELS_PER_M
// El ruido va anclado al MUNDO, no a la imagen: con pista de atletismo la
// textura crece y, medido en fracción de imagen, las manchas se estirarían.
uniform vec2 noise_origin = vec2(-42.67, -21.33);   // (WORLD_X0, WORLD_Z0)
uniform vec2 noise_span = vec2(85.33, 133.33);      // (TEX_W, TEX_H)/TEXELS_PER_M

// --- Cancha (Stadium.FIELD_*) ---
uniform float field_half_w = 34.0;
uniform float field_depth = 105.0;
uniform float half_line = 52.5;

// --- Estado del césped (Stadium._pitch_cfg + la firma del jardinero) ---
uniform vec3 grass_a : source_color = vec3(0.184, 0.545, 0.235);
uniform vec3 grass_b : source_color = vec3(0.172, 0.518, 0.220);
uniform vec3 grass_out : source_color = vec3(0.157, 0.478, 0.204);
uniform vec3 grass_dry : source_color = vec3(0.490, 0.561, 0.259);
uniform vec3 grass_mud : source_color = vec3(0.306, 0.231, 0.149);
uniform int mow_pattern = 0;        // 0 = SIN patrón; 1..8 firmas; 5 = el casero
uniform float mow_contrast = 0.5;
uniform float wear_amount = 0.0;
// Uso localizado, separado del barro y de la física del balón.
uniform float maintenance_wear = 0.0;
uniform float mud_amount = 0.0;
// PEDAZOS DE TIERRA PELADA, distinto de `wear_amount`: aquél quema el pasto y lo
// deja amarillo, éste lo quita y deja el suelo. A 0 no cuesta ni una instrucción.
uniform float bald_amount = 0.0;
uniform vec2 wear_size = vec2(24.0, 36.0);
uniform vec2 mud_size = vec2(40.0, 60.0);

// --- PASTO DE VERDAD: LA RAYA SE INCLINA Y LA HOJA TIENE GRANO --------------
// (2026-08-27, encargo de Cesar: «efecto más real al pasto»)
//
// Hasta hoy el campo tenía muchísimo COLOR —corte, calvas, tierra, barro,
// charcos, nieve, sombra de nube— y CERO detalle fino: el rasgo más pequeño que
// pintaba eran las celdas de `mud_noise`, de 2,2 m. A la cámara del partido eso
// es fieltro pintado, no hierba.
//
// Y la franja del corte era el peor sospechoso: `mix(grass_a, grass_b)` entre
// dos verdes que casi no se distinguen —#2f8b3c contra #2c8438, un 5 %— Y ADEMÁS
// QUIETA. La raya de un campo de verdad NO es pintura: son las mismas hojas
// tumbadas en sentidos opuestos por pasadas contrarias del tractor. La que te da
// el envés se ve CLARA, la que te da la sombra de la base se ve OSCURA, y por eso
// **se invierte cuando cambias de arco**. Ese giro es la señal que el ojo lee como
// «esto es césped» — más que cualquier verde que se elija.
//
// NO HAY TEXTURA Y ES A PROPÓSITO. El grano se calcula (24 ALU, 0 fetches): una
// textura obligaba a un asset con su `.import`, sus mipmaps y su generación
// asíncrona —un parpadeo de un fotograma mientras el hilo la termina— para
// ahorrar unos ALU que en un A12 son el 0,3 % del presupuesto. Es exactamente el
// mismo razonamiento por el que este shader existe: la cuenta, donde cuesta cero.
uniform float grass_real : hint_range(0.0, 1.0) = 1.0;
// Cuánto pesa la MIRADA en la franja, escalado por `mow_contrast`. A 0.20 con el
// contraste de 1ª son 40 puntos entre una franja y su vecina mirando a lo largo
// de la pasada — el rango de una raya de televisión (20-30 %) con algo de margen.
uniform float mow_aniso : hint_range(0.0, 0.5) = 0.20;
// Y cuánto pesa el SOL, que NO gira con la cámara: es lo que deja ver la firma
// del jardinero cuando miras perpendicular a las pasadas y el término de mirada
// vale cero. Sin él la raya desaparecía del todo de perfil y parecía un bug.
uniform float mow_sun : hint_range(0.0, 0.3) = 0.08;
uniform vec2 sun_xz = vec2(0.34, -0.94);   // el sol EN PLANTA, normalizado
// El grano, en dos escalas. La fina es la BRIZNA y la gruesa el MECHÓN; las dos
// se miden a lo largo y a lo ancho de la pasada, no en redondo, porque una hoja
// peinada tiene veta y un ruido isótropo se lee como arena.
// LAS MEDIDAS SE BAJARON TRAS LA PRIMERA LÁMINA (`capture_pasto`): con la celda
// fina en 62 x 8,5 cm —siete a uno— el campo de cerca no parecía hierba sino METAL
// CEPILLADO, y a la cámara de regate se leía como barrido de movimiento. El
// problema no era la cantidad de grano sino la proporción: una veta siete veces
// más larga que ancha es un rayón, no una hoja. A cuatro a uno vuelve a ser mata.
uniform vec2 grain_fine_m = vec2(0.20, 0.050);   // metros del lado de una celda
uniform vec2 grain_tuft_m = vec2(1.20, 0.850);
uniform float grain_fine : hint_range(0.0, 0.6) = 0.20;
// LA OCTAVA GRUESA NACE APAGADA (2026-08-27), y no por gusto: medida en el iPhone
// 15 Pro (A17 Pro, banco a 6,78 Mpx escalado a los 3,01 nativos), el efecto entero
// costaba 0,560 ms por fotograma y el reparto salió así —
//     franja por inclinación   ~0,06 ms   (y es un SUELO: su condición apagada
//                                          midió 8,277 ms, pegada al refresco)
//     octava fina (la brizna)  ~0,30 ms
//     octava gruesa (el mechón) ~0,21 ms
// — o sea que el 90 % del gasto se lo lleva el ruido y casi nada la franja, que es
// justo lo que hace el trabajo visual. El mechón es la peor relación de las tres:
// cuesta más de un tercio del total y aporta una modulación de metro y pico que a
// la cámara del partido queda por debajo de lo que ya modulan el corte y el
// desgaste. Se queda EN EL SHADER, con su uniform, para poder devolverlo desde
// `stadium.gd` si algún día sobra presupuesto — apagarlo por amplitud se salta su
// código entero (ver la puerta en `grass_grain`), así que a 0.0 no se paga nada.
uniform float grain_tuft : hint_range(0.0, 0.4) = 0.0;

// --- Pista de atletismo (Stadium.TRACK_*), sólo en la planta "athletics" ---
uniform bool track_on = false;
uniform float track_inner_hx = 36.5;
uniform float track_straight_hz = 42.2;
uniform float track_w = 6.6;
uniform float track_lane_w = 1.1;                   // TRACK_W / TRACK_LANES
uniform vec3 track_surf : source_color = vec3(0.612, 0.290, 0.208);
uniform vec3 track_lane : source_color = vec3(0.847, 0.824, 0.784);

// --- CHARCOS (features/stadium/puddles.gd) ---
// Máscara horneada por `Puddles.bake_mask` en el MISMO rectángulo de mundo que
// la cal, así que se muestrea con el UV que ya hay y no necesita encuadre
// propio. `hint_default_black` = sin textura asignada no hay agua: el campo seco
// no necesita ni que se le monte la máscara (y de hecho `puddle_amount` a 0 se
// salta el bloque entero, así que ni se muestrea).
uniform sampler2D puddle_mask : filter_linear, hint_default_black;
uniform float puddle_amount : hint_range(0.0, 1.0) = 0.0;
uniform vec3 puddle_color : source_color = vec3(0.055, 0.075, 0.088);
// El cielo que el charco DEVUELVE. Lo fija apply_weather con el horizonte del
// preset: el agua no tiene color propio, tiene el del cielo que refleja.
uniform vec3 puddle_sky : source_color = vec3(0.55, 0.59, 0.64);
// EL REFLEJO DE LOS FOCOS EN EL AGUA (2026-08-19, encargo de Cesar).
// Un charco de noche no es un charco gris: es donde la única luz artificial del
// recinto se ve TOCANDO algo. Hasta hoy el bloque de arriba devolvía el CIELO
// (`puddle_sky`) y nada más, así que bajo las torres el agua seguía apagada.
//
// Va analítico y no por reflejo real porque el renderer es `mobile`: no hay SSR,
// no hay SDFGI, y un ReflectionProbe devuelve un cubemap borroso — justo lo
// contrario de una raya de luz. El campo es un espejo PLANO en y=0, así que la
// imagen de una lámpara es su propia posición con la Y negada, y el punto de
// brillo es donde el rayo cámara→imagen cruza el suelo. Eso lo resuelven cuatro
// líneas de aritmética, y encima sale view-dependent DE VERDAD: la raya se
// desliza al mover la cámara, que es lo único que separa un reflejo de una
// calcomanía pintada.
uniform float flood_on : hint_range(0.0, 1.0) = 0.0;   // 0 = torres apagadas, el término entero se salta
uniform vec3 flood_pos[4];                             // cabezas de las torres, METROS DE MUNDO
uniform int flood_count = 0;                           // 0 en 3ª (no hay mástiles) y en el campo de entrenamiento
uniform vec3 flood_color : source_color = vec3(0.93, 0.95, 1.0);  // el eef2ff de la lámpara
// El reloj de TODO lo que se mueve aquí (charco, anillos de lluvia, ondeo,
// deriva de nubes). Lo pone `Stadium._tick_tread`, el mismo que `tread_now` de
// las huellas, y no se usa TIME a propósito: TIME va con `Engine.time_scale`,
// que el hit-stop del partido toca — el agua y el pasto se frenaban en la
// cámara lenta mientras las huellas del mismo campo seguían a ritmo real (el
// razonamiento entero está en la cabecera de tread_print.gdshader).
uniform float grass_now = 0.0;
// Velocidad del temblor de la lámina. A 0 el agua se queda quieta: es la salida
// de `Settings.reduce_motion`, con el mismo criterio que ya usa `_apply_clouds`
// para congelar la deriva de las nubes.
uniform float ripple_speed : hint_range(0.0, 2.0) = 1.0;

// --- LA LLUVIA PICANDO EL CHARCO (2026-08-19, encargo de Cesar) ---
// Llueve y el charco estaba liso: sólo el temblor de fondo de `ripple_speed`,
// que es oleaje, no impactos. Una gota que cae en agua deja un ANILLO que nace
// donde pica, crece unos 30 cm y se apaga — y eso es lo que el ojo lee como
// "está lloviendo AQUÍ", no las partículas del aire (ésas pasan por delante de
// la cámara y no dicen nada del suelo).
//
// Va procedural, sin partículas ni una segunda pasada: las gotas se sortean por
// CELDAS del propio mundo dentro del fragment, y sólo se ejecutan donde ya hay
// agua (`w > 0.001`) y sólo si llueve. En un partido seco, o en uno de nieve,
// esto no cuesta ni una instrucción — igual que el resto del bloque del charco.
//
// 1.0 = lloviendo. Lo apaga `reduce_motion` por la vía de `ripple_speed`, que
// ya es 0 en ese caso: gotas congeladas a media onda serían peor que ninguna.
//
// Y ADEMÁS ES LA ALTURA del anillo (ver el bloque del charco). Durante un tiempo
// fue la ÚNICA palanca de intensidad, y ése era el defecto que reportó Cesar el
// 2026-08-24: con los tres niveles de lluvia ya montados, el charco de la
// llovizna y el de la tormenta picaban EXACTAMENTE IGUAL —las mismas celdas, al
// mismo ritmo— sólo que uno más flojito. Bajar la amplitud no es llover menos,
// es llover igual con el volumen bajo. Lo que cambia entre una llovizna y un
// aguacero es CUÁNTAS gotas caen y CADA CUÁNTO, y eso son los tres uniforms de
// abajo. Ver Weather.RAIN_TIERS.
uniform float rain_drops : hint_range(0.0, 1.0) = 0.0;
// CUÁNTAS CELDAS PICAN en cada ciclo, 0..1. Es la palanca de DENSIDAD y la que
// más se ve: en llovizna son anillos sueltos que aparecen y se apagan, en
// tormenta el charco HIERVE. 0.5 es el valor con el que nació el efecto, y por
// eso es el defecto: sin nadie que lo fije, el charco se ve como se veía.
uniform float rain_pick : hint_range(0.0, 1.0) = 0.5;
// CADA CUÁNTO pica cada celda (multiplica el reloj de los anillos). Va aparte de
// `rain_pick` porque son dos cosas distintas: una reparte las gotas en el ESPACIO
// y la otra en el TIEMPO, y con sólo la primera la tormenta salía densa pero
// lenta — un charco lleno de anillos que se mueven despacio se lee como aceite.
uniform float rain_rate : hint_range(0.1, 3.0) = 1.0;
// DE QUÉ TAMAÑO es el anillo. Una gota de tormenta es más gorda y abre más
// círculo. Tiene tope duro por geometría: ver `rain_rings`, el anillo no puede
// salirse de su celda o se ve la rejilla.
uniform float rain_ring : hint_range(0.5, 1.3) = 1.0;
// DE QUÉ TAMAÑO ES LA CELDA del sorteo (multiplica los 1.6 m y 2.3 m de las dos
// capas). Es la palanca que faltaba, y la que reportó Cesar el 2026-08-26: la
// niebla ya decía que llovía a cántaros, pero el charco no —porque `rain_pick`
// sólo elige QUÉ celdas pican, y CUÁNTAS CELDAS HAY por metro cuadrado no lo
// tocaba nadie. Con el techo de una gota por celda, ni con `rain_pick` a 1.0 se
// puede pasar de ~0.8 anillos/m² entre las dos capas: eso es lluvia, no
// tormenta. Encogiendo la celda el sorteo reparte MÁS gotas y MÁS PEQUEÑAS en
// el mismo trozo de agua, que es exactamente la diferencia que se ve. El radio
// del anillo va en fracción de celda (ver `rain_rings`), así que encoge solo:
// una tormenta no son gotones más grandes, son muchas gotas menudas.
uniform float rain_cell : hint_range(0.4, 1.6) = 1.0;

// --- EL RIEGO (2026-08-19, encargo de Cesar) ---
// Los aspersores dejan el campo EMPAPADO unos minutos: el mismo verde, apagado,
// y brillando. No entra por `grass_tint` (lo reescriben en caliente el clima, el
// acento de final y la azotea: pelea garantizada) ni por `puddle_amount` (ése es
// el agua que además FRENA el balón, y regar no es encharcar). Uniform propio,
// dueño propio, y a 0 no cuesta ni una comparación de más.
uniform float soak_amount : hint_range(0.0, 1.0) = 0.0;

// --- LA NIEVE (2026-08-10, ver Weather.PRESETS["snow"]) ---
// El manto no es una textura nueva: se pinta con el MISMO ruido de calvas que ya
// está montado (`wear_noise`), muestreado más fino. Es lo que evita el campo de
// papel: la nieve cuaja a manchones y entre ellos el pasto asoma.
//
// `snow_amount` a 0 se salta el bloque entero, igual que los charcos: el 99 % de
// los partidos no paga ni una muestra por esto.
uniform float snow_amount : hint_range(0.0, 1.0) = 0.0;
// Blanco frío, pero MUY poco: el azul de la nieve viene de la luz (el
// `grass_tint` del preset y el ambiente), no del manto. Pintarlo ya azulado
// aquí, sumado al tinte del clima, daba un campo lavanda (primera vuelta de
// capture_nieve). Y queda un punto por debajo del blanco puro a propósito,
// porque el blanco puro es la cal de las líneas y tiene que ganar.
uniform vec3 snow_color : source_color = vec3(0.94, 0.95, 0.97);
// LA CAL BARRIDA: la misma textura de marcas a un octavo de resolución (la
// hornea `Stadium._bake_sweep_mask`, y sólo la primera vez que nieva). Un téxel
// suyo son 0,67 m de campo, así que leída con filtro lineal da un HALO continuo
// a los dos lados de cada raya — la franja que los operarios dejan limpia.
// Su alfa vale POCO (una raya de 12 cm es un sexto de téxel), de ahí el
// smoothstep de abajo, que es lo que la convierte en una franja de verdad.
uniform sampler2D sweep_mask : filter_linear, hint_default_transparent;
// LAS HUELLAS (2026-08-12, encargo del usuario: «el dejar huellas estaría muy
// cool»). Máscara que se escribe EN VIVO —no horneada como las otras dos: la
// pintan las botas mientras se juega, ver `Stadium.tread_at`— en el MISMO
// rectángulo de mundo que la cal, así que se muestrea con el UV que ya hay.
// Rojo = cuánto se ha pisado ese punto, 0..1.
//
// Va sobre `snow_cover` y no sobre el color: una huella no es una mancha blanca
// encima de la nieve, es nieve que YA NO ESTÁ — debajo aparece el campo que el
// resto del shader ya pintó (pasto, lodo, cal). Por eso el efecto sale gratis en
// coherencia: la huella sobre la boca de gol enseña barro y sobre la banda,
// pasto, sin que nadie lo programe.
uniform sampler2D tread_mask : filter_linear, hint_default_black;
uniform float tread_amount : hint_range(0.0, 1.0) = 0.0;

// LA SOMBRA DE LAS NUBES (2026-08-17, encargo del usuario). Manchones lentos que
// cruzan el campo y le bajan la luz al pasar. Es lo que separa un campo AL AIRE
// LIBRE de un plano verde iluminado parejo: en un partido de tarde de verdad la
// cancha nunca tiene el mismo brillo de banda a banda.
//
// SÓLO CON SOL (ver `CLOUD_SHADOW` en `stadium.gd`): una nube tira sombra cuando
// hay un sol que tapar. Con cielo cerrado (`overcast`) la luz ya viene difusa y
// no hay nada que ensombrecer — poner manchones ahí sería pintar sombras que su
// propia iluminación desmiente. De noche, con lluvia o con nieve, cero.
//
// CUATRO MUESTRAS Y NADA MÁS. Se reusa `mud_noise` con una rejilla DELIBERADAMENTE
// gruesa (`cloud_grid`, 6x6 celdas por baldosa de `cloud_size` metros): cada celda
// mide 25 m, que es el tamaño de un borrego. Con la rejilla del lodo (40x60) cada
// celda caía a 3 m y el campo se llenaba de motas — ruido, no nubes. Y como
// `sample_grid` envuelve con `mod`, la baldosa es continua: la deriva puede correr
// indefinidamente sin costura.
uniform float cloud_amount : hint_range(0.0, 1.0) = 0.0;
uniform vec2 cloud_drift = vec2(0.0, 0.0);    // metros/segundo, del viento del partido
// LA CELDA MIDE ~25 m, y ese número se afinó a base de fotos. A 41 m (baldosa de
// 165 con rejilla 4×4) el campo entero cabía DENTRO de un solo manchón: la sombra
// existía y estaba bien calculada, pero como cubría las 68×105 m por igual, la
// foto era idéntica a la del campo sin nubes. Una sombra que no tiene borde
// dentro del encuadre no es una sombra, es un ajuste de brillo. Con 25 m siempre
// hay al menos un par de bordes cruzando la cancha.
uniform float cloud_size = 150.0;             // metros de lado de la baldosa
uniform vec2 cloud_grid = vec2(6.0, 6.0);     // 150/6 = 25 m por celda
uniform float cloud_dark : hint_range(0.0, 1.0) = 0.34;

// --- Brillo de las briznas al viento (lo único que ya vivía aquí) ---
uniform vec3 grass_tint : source_color = vec3(1.0, 1.0, 1.0);
uniform float grass_roughness : hint_range(0.0, 1.0) = 1.0;
uniform float wind_strength : hint_range(0.0, 0.2) = 0.05;
uniform float wind_speed : hint_range(0.0, 2.0) = 0.35;
// LA CAL QUE SE ENCIENDE (2026-09-23, revisión de la azotea). En la azotea, de
// noche y con sólo cuatro mástiles, la cal recibe la misma poca luz que el pasto y
// el área salía a 1,5:1 contra él (el círculo central, a 1,1-1,2:1): en PÉGALE y
// SIRVE AL ÁREA el área ES la referencia del ejercicio. Una fracción del color de la
// raya se suma como emisión, así no depende de la luz que le llegue — es la cal
// fresca bajo reflectores, que se ve más blanca que el pasto aunque la noche sea
// cerrada. 0 = apagado (todo recinto que no lo pide queda igual que antes).
uniform float marks_glow : hint_range(0.0, 2.0) = 0.0;


// UNA CAPA DE GOTAS sobre la lámina de agua. Devuelve
//   .x  = altura del anillo en ese punto (0..1, 0 = lámina quieta)
//   .yz = su PENDIENTE en x/z (para inclinar la normal y que el anillo brille)
//
// El sorteo es por CELDA de `cell` metros: cada celda recibe una gota por ciclo,
// con su instante y su punto de impacto propios. Eso da una sola muestra por
// capa —nada de recorrer los 3×3 vecinos, que en un shader de móvil son nueve
// hashes por píxel— y a cambio impone que el anillo NO puede salirse de su
// celda: por eso el impacto se sortea sólo en la mitad central y el radio máximo
// es un cuarto de celda. Sin esas dos bridas, el anillo se cortaba en recto al
// cruzar el borde y se veía la rejilla.
//
// La regularidad que deja una rejilla se rompe llamando a esto DOS VECES con
// tamaños y velocidades primos entre sí (ver el bloque del charco): dos capas
// bastan para que el ojo no encuentre el patrón, y siguen siendo dos hashes.
vec3 rain_rings(vec2 pm, float cell, float t, float salt) {
	vec2 g = pm / cell;
	vec2 ci = floor(g);
	vec2 fr = fract(g) - 0.5;                       // −0.5..0.5, 0 = centro de celda
	// Desfase de la celda: sin él todo el charco picaría a la vez y eso es un
	// latido, no lluvia.
	float h0 = fract(sin(dot(ci, vec2(127.1, 311.7)) + salt) * 43758.5453);
	float tt = t + h0;
	float cyc = floor(tt);                          // QUÉ gota de esta celda
	float ph = tt - cyc;                            // 0..1 desde que picó
	// Y el resto se sortea por GOTA (celda + ciclo), no por celda: si el punto de
	// impacto fuera fijo, cada celda picaría siempre en el mismo sitio y la
	// rejilla se leía a la primera (así salió la primera vuelta, ver
	// tools/capture_charcos).
	float h1 = fract(sin(dot(ci, vec2(269.5, 183.3)) + cyc * 57.3 + salt) * 24634.6345);
	float h2 = fract(sin(dot(ci, vec2(419.2, 371.9)) + cyc * 91.7 + salt) * 15731.7431);
	float h3 = fract(sin(dot(ci, vec2(113.5, 271.9)) + cyc * 13.1 + salt) * 39413.1234);
	// CUÁNTAS CELDAS PICAN EN ESTE CICLO. Es lo que separa "llueve" de "el agua
	// tiene lunares": con todas activas el charco era una rejilla de anillos
	// idénticos. Y como el sorteo depende del CICLO, el subconjunto que pasa
	// cambia entero cada vuelta — con un filtro por celda a secas habría celdas
	// que no picarían jamás y se leería como que el charco tiene zonas muertas.
	//
	// El umbral lo pone la INTENSIDAD de la lluvia (`rain_pick`, 0.5 = como nació).
	if (h3 > rain_pick) {
		return vec3(0.0);
	}
	// EL RADIO MÁXIMO Y EL PASEO DEL IMPACTO SON EL MISMO PRESUPUESTO, y por eso
	// se calculan juntos: una capa da UNA muestra por píxel (nada de recorrer los
	// 3×3 vecinos, que en un móvil son nueve hashes), así que el anillo NO PUEDE
	// asomar fuera de su celda — al cruzar el borde se cortaba en recto y la
	// rejilla se veía. La regla es `paseo + radio <= media celda`; al engordar el
	// anillo (`rain_ring`) hay que encoger el paseo, o vuelve el corte.
	float rmax = 0.18 * clamp(rain_ring, 0.5, 1.3);
	vec2 hit = (vec2(h1, h2) - 0.5) * (1.0 - 2.0 * rmax);
	vec2 d2 = (fr - hit) * cell;                    // vector al impacto, en METROS
	float d = length(d2);
	float r = ph * cell * rmax;                     // el anillo crece sin salirse de la celda
	// Nace de golpe (la gota pica) y se apaga al alejarse: un anillo real pierde
	// altura con el radio, no sólo con el tiempo.
	float env = (1.0 - ph) * (1.0 - ph) * smoothstep(0.0, 0.05, ph);
	// Cresta gaussiana centrada en el radio actual. Los 5 cm de grosor son un
	// mínimo de LECTURA, no de realismo: a la altura a la que se juega el charco
	// ocupa medio palmo de pantalla, y una cresta de 2 cm (la primera vuelta) no
	// llegaba ni a un píxel — el anillo estaba y no se veía.
	float u = (d - r) / 0.05;
	float ring = exp(-u * u);
	float hgt = ring * env;
	// Pendiente analítica: d(hgt)/dd = hgt · (−2u/0.022), proyectada al vector
	// que va del impacto al píxel. Sale gratis y es lo que hace que el anillo
	// tenga BRILLO propio y no sea una raya pintada.
	vec2 dir = d2 / max(d, 0.0001);
	return vec3(hgt, hgt * (-2.0 * u / 0.05) * dir);
}


// Bilineal con pesos suavizados sobre una rejilla de `_noise_grid`, gemela de
// `Stadium._sample_flat`: mismos cuatro vecinos, mismo smoothstep en los pesos.
// Ruido de valor para el GRANO. La rejilla se envuelve a 256 celdas antes de
// entrar al hash y no es cosmético: `ac / 0.085` llega a ~1.500 en el fondo del
// campo, y un hash de `fract(sin(...))` sobre números así se degrada en cuanto la
// plataforma no da highp — en iPhone salía a bandas. Envuelto, el argumento nunca
// pasa de 256 y la repetición cae cada 256 celdas (≈22 m de veta fina), que es
// justo lo que NO se ve en un ruido de grano.
float g_hash(vec2 p) {
	p = fract(mod(p, 256.0) * vec2(123.34, 456.21));
	p += dot(p, p + 45.32);
	return fract(p.x * p.y);
}


float g_noise(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	f = f * f * (3.0 - 2.0 * f);
	return mix(mix(g_hash(i), g_hash(i + vec2(1.0, 0.0)), f.x),
		mix(g_hash(i + vec2(0.0, 1.0)), g_hash(i + vec2(1.0, 1.0)), f.x), f.y);
}


// El grano de la hoja, peinado en la dirección de la pasada (`lean`). Devuelve un
// factor de brillo centrado en 0.
//
// EL DESVANECIDO POR `fwidth` ES OBLIGATORIO, no un adorno: cuando un píxel ya
// cubre más de una celda de ruido, seguir muestreando no añade detalle sino
// ALIAS — y un campo que HIERVE de lejos es mucho peor que uno liso. El umbral se
// mide sobre la derivada del propio uv, o sea sobre la huella real del píxel, así
// que se apaga exactamente donde empezaría a romperse y no a una distancia
// inventada que habría que retocar por cámara.
float grass_grain(vec2 pm, vec2 lean) {
	float al = dot(pm, lean);
	float ac = dot(pm, vec2(lean.y, -lean.x));
	float g = 0.0;
	// CADA OCTAVA SE SALTA POR SU PROPIA AMPLITUD, y no sólo por el desvanecido.
	// Es el escape de rendimiento de verdad: apagar `grain_tuft` tiene que dejar de
	// PAGAR la octava gruesa, no sólo de verla. Sin esto la puerta era `grass_real`
	// para las dos juntas — y el primer banco en el iPhone no pudo separar lo que
	// cuesta la franja de lo que cuesta el grano porque, con las amplitudes a cero,
	// el shader seguía evaluando los ocho hashes igual.
	if (grain_fine > 0.0) {
		vec2 uf = vec2(al, ac) / grain_fine_m;
		float ff = 1.0 - smoothstep(0.30, 0.95, fwidth(uf.y));
		if (ff > 0.0) {
			g += (g_noise(uf) - 0.5) * grain_fine * ff;
		}
	}
	if (grain_tuft > 0.0) {
		vec2 ut = vec2(al, ac) / grain_tuft_m;
		float ft = 1.0 - smoothstep(0.30, 0.95, fwidth(ut.y));
		if (ft > 0.0) {
			g += (g_noise(ut) - 0.5) * grain_tuft * ft;
		}
	}
	return g;
}


float sample_grid(sampler2D grid, vec2 grid_size, vec2 uv) {
	vec2 f = fract(uv) * grid_size;
	vec2 i0 = floor(f);
	vec2 t = f - i0;
	t = t * t * (3.0 - 2.0 * t);
	// +0.5 para caer en el centro del téxel (con nearest, acceso directo).
	vec2 p0 = (i0 + 0.5) / grid_size;
	vec2 p1 = (mod(i0 + 1.0, grid_size) + 0.5) / grid_size;
	float n00 = texture(grid, vec2(p0.x, p0.y)).r;
	float n10 = texture(grid, vec2(p1.x, p0.y)).r;
	float n01 = texture(grid, vec2(p0.x, p1.y)).r;
	float n11 = texture(grid, vec2(p1.x, p1.y)).r;
	return mix(mix(n00, n10, t.x), mix(n01, n11, t.x), t.y);
}


// Cuánto se PISA un punto de la cancha (0..1), gemela de `Stadium._traffic`:
// las dos bocas de gol, el círculo central y los pasillos de banda.
float traffic(float x_m, float zc) {
	float t = clamp(1.0 - length(vec2(x_m, zc)) / 14.0, 0.0, 1.0);
	t = max(t, clamp(1.0 - length(vec2(x_m, zc - field_depth)) / 14.0, 0.0, 1.0));
	t = max(t, clamp(1.0 - length(vec2(x_m, zc - half_line)) / 12.0, 0.0, 1.0) * 0.8);
	float edge = clamp((abs(x_m) - (field_half_w - 6.0)) / 6.0, 0.0, 1.0);
	return max(t, edge * 0.6);
}


// Distancia con signo al borde INTERIOR del óvalo del tartán, gemela de
// `Stadium._track_dist`: negativa dentro (césped), 0 en el bordillo, positiva
// hacia afuera. Dos rectas y dos semicírculos, como un tartán real.
float track_dist(float x_m, float z_m) {
	float ax = abs(x_m);
	float az = abs(z_m - field_depth * 0.5);
	if (az <= track_straight_hz) {
		return ax - track_inner_hx;
	}
	return length(vec2(ax, az - track_straight_hz)) - track_inner_hx;
}


void fragment() {
	// Metros del mundo en este punto, con la MISMA cuenta que hacía el bucle de
	// la CPU sobre (tx, ty) — por eso el pasto y la cal siguen encajando.
	float x_m = world_origin.x + UV.x * world_span.x;
	float z_m = world_origin.y + UV.y * world_span.y;

	// Fuera de la franja de pasto la imagen nacía del color de fuera y el bucle
	// ni la recorría: aquí es la misma condición, invertida.
	vec3 col = grass_out;
	if (z_m >= -0.5 && z_m <= field_depth + 6.0
			&& abs(x_m) <= field_half_w + 3.0) {
		float zc = max(z_m, 0.0);
		vec2 nuv = (vec2(x_m, z_m) - noise_origin) / noise_span;
		col = grass_a;
		// EL CORTE CASERO SE APLICA AL FINAL, no aquí (ver `mow_pattern == 5`).
		// Motivo medido en `capture_stadium_div`: en 3ª el desgaste es 1,0 y el
		// lodo 0,55, así que las calvas amarillas y el barro se COMEN cualquier
		// franja pintada antes que ellos — el campo salía a manchones y del corte
		// no quedaba rastro. Y físicamente el orden correcto es éste: una pasada
		// de tractor cambia hacia dónde mira la hoja, o sea el BRILLO de lo que
		// haya ahí, sea pasto, calva o barro.
		float mow_shade = 0.0;
		// HACIA DÓNDE TUMBÓ EL TRACTOR las hojas de ESTA franja, en planta y
		// normalizado. Es la dirección en la que iba la máquina, o sea a lo LARGO
		// de la banda, nunca a través: las franjas son el rastro de la pasada.
		// El respaldo (1,0) vale para el campo SIN corte de 3ª — sin pasada no hay
		// dirección privilegiada, y el grano sale peinado a lo ancho, que es tan
		// arbitrario como cualquier otra cosa y no dibuja ninguna raya (el término
		// de anisotropía sólo entra con `mow_pattern > 0`).
		vec2 mow_lean = vec2(1.0, 0.0);
		if (mow_pattern > 0) {
			// Firma del jardinero. OJO CON EL CERO: no es "franjas", es SIN CORTE — se
			// va por el `else` de abajo. Quien elige el índice (Stadium.MOW_CLUB) tiene
			// que saberlo, porque sortear el 0 entre las firmas de un club de 1ª le deja
			// el campo liso y eso no es una firma, es una ausencia.
			float band;
			if (mow_pattern == 1) {
				band = floor(zc / 4.0) + floor(x_m / 4.0);
				// EL DAMERO SE HACE CON DOS PASADAS PERPENDICULARES, y por eso es
				// un damero y no unas rayas: la columna de cuadros par se peina a
				// lo largo y la impar a lo ancho. Sin esto los cuadros salían
				// todos con la misma veta y el tablero se leía como una rejilla
				// pintada encima de un campo rayado.
				mow_lean = mod(abs(floor(x_m / 4.0)), 2.0) >= 1.0
					? vec2(0.0, 1.0) : vec2(1.0, 0.0);
			} else if (mow_pattern == 2) {
				band = floor((zc + x_m) / 5.0);
				// La banda corre perpendicular a (1,1), así que la máquina iba por
				// (1,-1). Normalizada a mano: no hay `normalize` que ahorrar aquí
				// porque los dos componentes son constantes.
				mow_lean = vec2(0.7071, -0.7071);
			} else if (mow_pattern == 3) {
				// AROS CONCÉNTRICOS desde el punto central: el corte de las
				// finales grandes, el único que tiene un CENTRO.
				band = floor(length(vec2(x_m, zc - half_line)) / 4.5);
				// Aros: la máquina va EN CÍRCULO, o sea tangente al radio. En el
				// punto central exacto el radio es cero y no hay tangente — de ahí
				// el respaldo, que sólo toca un puñado de píxeles.
				vec2 rad = vec2(x_m, zc - half_line);
				float rl = length(rad);
				mow_lean = rl > 0.05 ? vec2(-rad.y, rad.x) / rl : vec2(1.0, 0.0);
			} else if (mow_pattern == 4) {
				band = floor(zc / 2.0);
				mow_lean = vec2(1.0, 0.0);   // pasadas a lo ancho
			} else if (mow_pattern == 6) {
				// FRANJAS A LO LARGO, el corte más común que hay en un campo de
				// verdad — y hasta hoy el juego NO PODÍA sacarlo: los índices que
				// sorteaba el club eran 0, 1 y 2, o sea nada, damero y diagonal.
				// Las bandas van en x, así que las rayas corren de banda a banda
				// paralelas a los laterales.
				band = floor(x_m / 6.0);
				mow_lean = vec2(0.0, 1.0);   // pasadas de gol a gol
			} else if (mow_pattern == 7) {
				// ESPIGA: las pasadas se encuentran en el eje largo del campo y
				// forman un galón. `abs(x_m)` es todo el truco — la misma diagonal
				// del patrón 2 espejada en el centro.
				band = floor((abs(x_m) + zc) / 5.0);
				// La espiga es la diagonal ESPEJADA en el eje largo, así que la
				// dirección de la pasada también se espeja: si no, media cancha
				// tendría la veta cruzada respecto a su propia franja.
				mow_lean = vec2(x_m >= 0.0 ? 0.7071 : -0.7071, -0.7071);
			} else if (mow_pattern == 8) {
				// DAMERO GRANDE: el mismo gesto que el 1 pero con cuadros de 9 m en
				// vez de 4. A escala de cancha son dos cortes distintos, no uno con
				// otro número: el fino se lee como textura y el grueso como tablero.
				band = floor(zc / 9.0) + floor(x_m / 9.0);
				mow_lean = mod(abs(floor(x_m / 9.0)), 2.0) >= 1.0
					? vec2(0.0, 1.0) : vec2(1.0, 0.0);
			} else if (mow_pattern == 5) {
				// EL CORTE CASERO (3ª, 2026-08-18). No es "un patrón peor": es el
				// mismo gesto hecho SIN máquina de raya recta. Tres cosas lo
				// delatan y las tres van aquí: la franja SERPENTEA (el tractor no
				// va recto, `wobble`), es ANCHA porque se dan menos pasadas, y no
				// mide siempre igual — el ancho se modula con una onda lenta, así
				// que hay pasadas que se comen a la de al lado y otras que dejan
				// un canto sin cortar. Sin el ancho variable se leía como una
				// franja normal simplemente torcida, que es peor que no tenerla:
				// parecía un bug del shader y no un campo de pueblo.
				float wobble = sin(x_m * 0.11) * 1.15 + sin(x_m * 0.37 + 2.1) * 0.45;
				float paso = 6.2 + sin(zc * 0.055) * 1.4;
				band = floor((zc + wobble) / paso);
				// El casero también va a lo ancho, sólo que serpenteando: la
				// pendiente del `wobble` inclina la pasada igual que inclina la
				// franja, o si no la veta iría recta por encima de una raya torcida.
				float dw = cos(x_m * 0.11) * 0.1265 + cos(x_m * 0.37 + 2.1) * 0.1665;
				mow_lean = normalize(vec2(1.0, -dw));
				// La franja impar se OSCURECE un 12 % al final del fragmento, y
				// se marca aquí para no repetir el cálculo de `band`.
				// El 0,40 convierte el `contrast` de la tabla —que sigue siendo
				// "cuánto se nota el corte", y por eso 3ª tiene el más bajo de las
				// tres— en la fracción de sombra: 0,30 × 0,40 = un 12 % más oscura
				// la franja impar. Por debajo del 8 % no se ve con el campo
				// castigado; por encima del 18 % parece pintado, no cortado.
				mow_shade = mod(abs(band), 2.0) >= 1.0 ? -0.40 * mow_contrast : 0.0;
			} else {
				band = floor(zc / 4.0);
				mow_lean = vec2(1.0, 0.0);
			}
			// `band % 2 != 0` del GDScript, con el signo de posmod: en negativos
			// -3 % 2 vale -1, que también es "impar".
			// El casero no tiñe aquí: sale al final, sobre el campo ya castigado.
			float odd = mod(abs(band), 2.0) >= 1.0 ? 1.0 : 0.0;
			if (mow_pattern != 5) {
				// LO QUE HABÍA: la franja impar teñida hacia `grass_b`. Se queda
				// entero detrás de `grass_real` para poder apagarlo y comparar —
				// y porque a 0 el campo tiene que salir BIT A BIT como salía.
				vec3 flat_col = odd >= 0.5 ? mix(grass_a, grass_b, mow_contrast) : grass_a;
				// LO QUE HAY: las dos franjas comparten verde —el de en medio— y
				// lo que las separa es cómo miran las hojas. La MEDIA DE LUZ del
				// campo no se mueve (el término de abajo es simétrico y este verde
				// es el punto medio de los dos de antes), así que encender esto no
				// aclara ni oscurece el estadio: sólo cambia el mecanismo.
				vec3 lean_col = mix(grass_a, grass_b, 0.5 * mow_contrast);
				col = mix(flat_col, lean_col, grass_real);
			}
			if (grass_real > 0.0) {
				// El signo alterna con la banda: pasadas contrarias, hojas
				// contrarias. Esto es TODO el truco.
				vec2 lean = mow_lean * (odd >= 0.5 ? 1.0 : -1.0);
				// La mirada EN PLANTA. Sale de la posición de la cámara y del punto
				// del campo, no de `VIEW`: `VIEW` vive en espacio de vista y aquí
				// hace falta el mundo. Vale porque el pasto es un plano horizontal
				// en el origen — la misma licencia que ya se toma el reflejo de las
				// torres unas líneas más abajo.
				vec2 vd = vec2(x_m, z_m) - INV_VIEW_MATRIX[3].xz;
				float vl = length(vd);
				vd = vl > 0.001 ? vd / vl : vec2(0.0, 1.0);
				// Hoja tumbada EN CONTRA de ti: ves el envés, franja CLARA. A favor:
				// ves la sombra de la base, franja OSCURA. Y se invierte al cambiar
				// de arco, que es exactamente lo que hace un campo en televisión.
				// Va por `mow_shade` a propósito: ese término se aplica AL FINAL,
				// sobre el campo ya castigado, porque una pasada de tractor cambia
				// el brillo de lo que HAYA ahí —pasto, calva o barro—, que es el
				// mismo razonamiento que ya justificaba el orden del corte casero.
				mow_shade += grass_real * mow_contrast
					* (dot(lean, vd) * mow_aniso + dot(lean, sun_xz) * mow_sun);
			}
		} else {
			// Sin patrón (3ª): el verde varía a manchones, como pasto cortado a
			// máquina de mano y regado a trozos.
			float m = mud_amount > 0.0
				? sample_grid(mud_noise, mud_size, nuv) : 0.5;
			col = mix(grass_a, grass_b, m);
		}
		if (wear_amount > 0.0) {
			// Calvas secas: donde el ruido pasa el umbral, el pasto se quema.
			float w = sample_grid(wear_noise, wear_size, nuv);
			float t = smoothstep(1.0 - wear_amount * 0.55, 1.0, w);
			col = mix(col, grass_dry, t * (0.35 + 0.5 * wear_amount));
		}
		if (bald_amount > 0.0) {
			// PEDAZOS DE TIERRA (3ª, 2026-08-22, pedido de Cesar). `wear_amount`
			// QUEMA el pasto y lo deja amarillo, pero sigue siendo pasto; esto lo
			// quita del todo y deja el suelo. Es la diferencia entre un campo mal
			// regado y un campo de pueblo, y es lo que permite que la 3ª vuelva a
			// no tener corte sin que se lea como "falta cargar el césped": lo que
			// cuenta la categoría ya no es un gesto humilde hecho, es el suelo.
			//
			// Se muestrea el MISMO ruido de calvas a otra escala (×1.35) a
			// propósito: con la misma, las peladuras caerían exactamente dentro de
			// las manchas secas y se leerían como un borde más oscuro de lo mismo.
			// Desfasadas, la calva amarilla tiene tierra EN PARTE, que es como se
			// ve de verdad.
			// El DESPLAZAMIENTO en vez de un cambio de escala: así las peladuras
			// miden lo mismo que las calvas (que es el tamaño bueno, ~3 m) pero no
			// caen encima de ellas. Con la misma uv, la tierra sólo habría sido un
			// borde más oscuro de cada mancha seca en vez de un pedazo aparte.
			float b = sample_grid(wear_noise, wear_size, (nuv + vec2(0.37, 0.19)) * 0.9);
			// El umbral se abre MUCHO con `bald_amount` (0.55, no 0.34): a 0.6 eso es
			// el tercio alto del ruido, o sea pedazos de verdad. Con la ventana
			// estrecha de la primera versión salían motas, y una mota no dice "campo
			// de pueblo", dice "ruido de textura".
			col = mix(col, grass_mud,
				smoothstep(1.0 - bald_amount * 0.55, 1.0, b) * 0.95);
		}
		if (mud_amount > 0.0) {
			// Lodo sólo donde REALMENTE se pisa: un charco en el centro de la
			// nada no se lee como desgaste, se lee como bug de textura.
			float tr = traffic(x_m, zc);
			if (tr > 0.0) {
				float m2 = sample_grid(mud_noise, mud_size, nuv * 1.7);
				col = mix(col, grass_mud,
					smoothstep(0.62, 1.0, m2) * tr * mud_amount);
			}
		}
		// El portero pisa un área alargada; penaltis y bandas se gastan a otra
		// escala. Bordes irregulares y contraste suave evitan manchas geométricas.
		if (maintenance_wear > 0.0) {
			float goal_z = min(abs(z_m - 1.3), abs(z_m - (field_depth - 1.3)));
			float penalty_z = min(abs(z_m - 11.0), abs(z_m - (field_depth - 11.0)));
			float broken = sample_grid(wear_noise, wear_size, nuv * 3.1);
			float goal = 1.0 - smoothstep(0.48, 1.22, length(vec2(x_m / 5.8, goal_z / 3.6)) + (broken - 0.5) * 0.42);
			float spot = 1.0 - smoothstep(0.3, 1.0, length(vec2(x_m / 1.6, penalty_z / 1.5)));
			float side = (1.0 - smoothstep(0.25, 1.2, abs(abs(x_m) - (field_half_w - 0.7))))
				* smoothstep(4.0, 18.0, z_m) * (1.0 - smoothstep(field_depth - 18.0, field_depth - 4.0, z_m));
			float used = max(goal, max(spot * 0.6, side * 0.23)) * (0.62 + broken * 0.38);
			vec3 worn_grass = mix(grass_dry * 1.16, grass_mud * 1.32, maintenance_wear * 0.68);
			col = mix(col, worn_grass, used * maintenance_wear * 0.90);
		}
		// EL GRANO se suma al MISMO multiplicador que el corte, y no antes: los dos
		// son lo mismo —cuánta luz devuelve la hoja que hay en este punto— y hacerlo
		// en una sola pasada ahorra la segunda multiplicación de un vec3.
		float grain = grass_real > 0.0
			? grass_grain(vec2(x_m, z_m), mow_lean) * grass_real : 0.0;
		col *= 1.0 + mow_shade + grain;
	}

	// EL TARTÁN, entre el pasto y la cal: la línea de banda se pinta encima del
	// bordillo y no al revés, igual que cuando esto se horneaba en la textura.
	// Las calles se curvan solas porque el patrón se mide sobre la distancia al
	// óvalo, no sobre los ejes.
	if (track_on) {
		float d = track_dist(x_m, z_m);
		if (d > 0.0 && d < track_w) {
			col = (d < 0.12 || mod(d, track_lane_w) < 0.10) ? track_lane : track_surf;
		}
	}

	// La CAL, horneada en CPU, encima de todo. Alfa 0 = pasto a la vista.
	vec4 marks = texture(marks_texture, UV);
	col = mix(col, marks.rgb, marks.a);

	// EL AGUA (2026-08-10), lo último de todo: un charco TAPA la línea pintada,
	// no al revés.
	float rough = grass_roughness;
	if (puddle_amount > 0.0) {
		// La máscara guarda la HONDURA (es lo que frena el balón), pero para el
		// OJO "hay agua" es casi binario: una lámina de 4 cm y otra de 1 cm se
		// ven igual de mojadas. De ahí el smoothstep — la forma y el borde
		// siguen siendo EXACTAMENTE los de `Puddles.depth_at`, sólo satura la
		// apariencia. Sin él, los charcos flojos (hondura 0.37, que es la mitad
		// del sorteo) quedaban en un manchón que a la cámara de juego no se veía.
		float w = smoothstep(0.02, 0.34, texture(puddle_mask, UV).r) * puddle_amount;
		if (w > 0.001) {
			// UN CHARCO NO ES UNA MANCHA OSCURA: es un ESPEJO, y lo que se ve en
			// él depende de DESDE DÓNDE se mire. De pie encima devuelve poco y se
			// ve el fondo, casi negro; en rasante devuelve el cielo entero y se
			// pone plateado — que es como se reconoce un charco de verdad. Eso es
			// Fresnel, y va a mano porque el reflejo del entorno no llega a un
			// plano tendido con esta iluminación: fiarlo al ROUGHNESS bajo dejaba
			// el campo idéntico desde la cámara a la que se juega (medido en
			// tools/capture_charcos, primera vuelta).
			float fres = pow(1.0 - clamp(dot(NORMAL, VIEW), 0.0, 1.0), 3.0);
			// Temblor de la lámina: la lluvia la pica y el reflejo no se queda
			// quieto. Son dos ondas EN DIAGONAL que interfieren, no el producto
			// de dos senos: el producto es un damero y a cámara cenital el charco
			// se veía literalmente a cuadros (misma captura).
			float rt = grass_now * ripple_speed;
			float ra = x_m * 3.1 + z_m * 2.3 + rt * 3.0;
			float rb = x_m * 2.2 - z_m * 3.4 - rt * 2.1;
			float rip = sin(ra) + sin(rb);
			// LAS GOTAS. El oleaje de arriba es el agua MOVIÉNDOSE; esto es la
			// lluvia CAYENDO en ella, que es otra cosa y es la que se ve desde la
			// cámara de juego. Dos capas de anillos con celda y ritmo primos entre
			// sí (1.6 m a un ciclo de 1.4 s, y 2.3 m a 1.9 s, la segunda girada
			// 30°): ninguna rejilla coincide con la otra, así que no hay patrón
			// que cazar, y son dos hashes por píxel, no dieciocho.
			float drops = 0.0;
			vec2 dslope = vec2(0.0);
			if (rain_drops > 0.0) {
				vec2 pm = vec2(x_m, z_m);
				// Los dos relojes los inclina `rain_rate` a la vez: son primos
				// entre sí (0.72 y 0.53) y ahí está la gracia — escalarlos por el
				// mismo factor mantiene la relación, así que la tormenta va más
				// rápida sin que las dos rejillas empiecen a coincidir.
				float rr = rt * rain_rate;
				// Las dos celdas encogen JUNTAS con la intensidad (`rain_cell`):
				// siguen siendo primas entre sí porque el factor es el mismo,
				// así que la tormenta mete más gotas sin que las dos rejillas
				// se pongan de acuerdo y aparezca el patrón.
				float rc = clamp(rain_cell, 0.4, 1.6);
				vec3 r1 = rain_rings(pm, 1.6 * rc, rr * 0.72, 0.0);
				// La segunda capa va en ejes girados; su pendiente vuelve al mundo
				// con la rotación traspuesta, o el brillo del anillo apuntaría a
				// donde no pica.
				vec2 pr = vec2(pm.x * 0.866 - pm.y * 0.5, pm.x * 0.5 + pm.y * 0.866);
				vec3 r2 = rain_rings(pr, 2.3 * rc, rr * 0.53, 37.0);
				vec2 s2 = vec2(0.866 * r2.y + 0.5 * r2.z, -0.5 * r2.y + 0.866 * r2.z);
				drops = (r1.x + r2.x) * rain_drops;
				dslope = (r1.yz + s2) * rain_drops;
			}
			// El 0.18 de suelo del reflejo no es de adorno: sin él, mirando desde
			// arriba el charco se iba a negro y en la foto de la cámara de juego
			// parecía un agujero o la sombra de algo. Un charco visto de pie
			// sigue devolviendo algo de cielo.
			col = mix(col, puddle_color, w * 0.78);
			col = mix(col, puddle_sky,
				w * clamp(0.18 + 0.72 * fres + rip * 0.05 + drops * 0.60, 0.0, 1.0));
			// Y encima el brillo duro del sol/los focos, que es lo que hace que
			// un charco CENTELLEE al moverse la cámara.
			rough = mix(rough, 0.12, w);
			// LA LÁMINA TIENE RELIEVE (2026-08-19). Hasta hoy el charco era un
			// plano perfecto —normal +Y constante— y sobre un plano perfecto el
			// brillo especular de una lámpara es UN lóbulo gordo que casi nunca
			// cae dentro del encuadre. Estas dos pendientes son las derivadas de
			// las MISMAS dos ondas de `rip`, así que salen gratis: apartan la
			// normal 3-4°, y eso basta para romper el lóbulo en centelleo.
			// La normal lleva las DOS cosas: el oleaje de fondo y la pendiente de
			// los anillos. Sin este segundo término el anillo sería una raya más
			// clara y ya; con él se le engancha el especular del sol o de las
			// torres y CENTELLEA al crecer, que es como se ve una gota de verdad.
			// TRES ondas y no dos, y ésta es la diferencia entre agua y papel
			// pintado: dos senos en diagonal interfieren en un patrón EXACTAMENTE
			// periódico, y el especular lo delata como una rejilla de anillos
			// repetidos (se vio en `capture_fx_ambiente`, segunda vuelta). La
			// tercera, más fina y con otro ritmo, rompe la repetición. Y la
			// pendiente baja de 0.045 a 0.012: hace falta que la lámina no sea un
			// plano perfecto, no que parezca mar picado en dos dedos de agua. Con
			// 0.045 los cuatro focos rompían su especular en una malla de rayitas
			// que se leía como una TEXTURA de rejilla puesta encima del charco.
			float rc = x_m * 5.7 + z_m * 4.9 + rt * 1.3;
			vec3 nwat = normalize(vec3(
				-(3.1 * cos(ra) + 2.2 * cos(rb) + 2.6 * cos(rc)) * 0.012 - dslope.x * 0.006,
				1.0,
				-(2.3 * cos(ra) - 3.4 * cos(rb) + 2.2 * cos(rc)) * 0.012 - dslope.y * 0.006));
			// NORMAL vive en espacio de VISTA dentro de fragment(), y `nwat` está
			// en mundo: sin el VIEW_MATRIX el agua se inclinaría con la cámara.
			NORMAL = normalize(mix(NORMAL, (VIEW_MATRIX * vec4(nwat, 0.0)).xyz, w));
			// Y el especular sube POCO: es agua, no cromo. Con 0.85 el charco se
			// llenaba de chispas duras y perdía la lámina que ya tenía.
			SPECULAR = mix(0.5, 0.68, w);
			// EL REFLEJO DE LAS TORRES. Sólo si están encendidas: de día esto no
			// se ejecuta, y en 3ª `flood_count` es 0 porque no hay mástiles.
			if (flood_on > 0.0) {
				vec3 cam = INV_VIEW_MATRIX[3].xyz;
				vec2 here = vec2(x_m, z_m);
				float glint = 0.0;
				for (int i = 0; i < flood_count; i++) {
					vec3 lamp = flood_pos[i];
					// La imagen especular de la lámpara está a -Y (espejo plano en
					// y=0), y el brillo cae donde el rayo cámara→imagen cruza el
					// suelo. Ese punto DEPENDE DE LA CÁMARA: por eso la raya se
					// desliza al moverse y se lee como reflejo, no como pintura.
					float t = cam.y / max(cam.y + lamp.y, 0.001);
					vec2 p = cam.xz + (lamp.xz - cam.xz) * t;
					vec2 d = here - p;
					// Y se ESTIRA hacia el que mira: un reflejo sobre agua picada
					// nunca es una mancha redonda, es un camino. A lo largo del eje
					// al observador el brillo se alarga (0.06); a través, se
					// estrecha (1.6).
					vec2 u = normalize(cam.xz - p + vec2(0.0001, 0.0));
					float along = dot(d, u);
					float across = dot(d, vec2(-u.y, u.x));
					// UNA RAYA, no un resplandor. La primera vuelta iba con 0.06 y
					// 1.6 y el lóbulo cubría el charco ENTERO: al saturar, el
					// temblor lo troceaba y salía una REJILLA de puntos brillantes
					// —el aspecto exacto de una textura mal puesta—. Con 0.35 y 6.0
					// el camino mide ~3,4 m de largo por 0,8 de ancho, que es lo que
					// mide de verdad el reflejo de una lámpara en un charco.
					glint += exp(-(along * along * 0.22 + across * across * 5.0));
				}
				// El temblor PICA la raya. Sin esto es una barra sólida de neón,
				// que es exactamente el aspecto que delata una calcomanía.
				glint *= 0.55 + 0.45 * clamp(rip * 0.5 + 0.5, 0.0, 1.0);
				// Y SUMA POCO: es luz reflejada en dos dedos de agua, no una
				// segunda lámpara. Con 0.9 el charco se iba a blanco puro y perdía
				// hasta la lámina.
				col += flood_color * glint * w * flood_on * 1.0;
			}
		}
	}

	// EL RIEGO (2026-08-19). Va DESPUÉS del agua y ANTES de la nieve: si además
	// llueve, el campo regado y los charcos acaban brillando con la misma ley
	// porque comparten este mismo `rough`.
	if (soak_amount > 0.0) {
		// El pasto empapado es el MISMO verde, apagado — no un verde distinto, y
		// desde luego no una sombra. Lo que lo delata como agua es el BRILLO, de
		// ahí que el roughness baje a la par que el color.
		col = mix(col, col * 0.62, soak_amount);
		rough = mix(rough, 0.26, soak_amount);
	}

	// LA NIEVE, encima de todo — de la cal, del tartán y hasta del pasto de
	// fuera de la banda: cuando cuaja, cuaja en el recinto entero.
	float snow_cover = 0.0;
	if (snow_amount > 0.0) {
		vec2 snuv = (vec2(x_m, z_m) - noise_origin) / noise_span;
		// DOS OCTAVAS, no una. Con la rejilla de calvas sola (celdas de ~3,5 m) el
		// manto salía a cuadros gordos y difuminados — desde la cenital parecía
		// una imagen mal comprimida, no nieve. La segunda octava, más fina y con
		// menos peso, le pone el grano que hace que el borde de cada mancha se
		// lea como nieve y no como degradado.
		float n = 0.72 * sample_grid(wear_noise, wear_size, snuv * 2.3)
			+ 0.28 * sample_grid(mud_noise, mud_size, snuv * 3.4);
		// EL UMBRAL VA MUY ABAJO (0.12–0.40) y no en el medio del ruido, y ésa es
		// la diferencia entre nieve y camuflaje. Con el corte centrado salía mitad
		// blanco y mitad verde a manchas de dos metros: un campo de camuflaje
		// militar, no un campo nevado (segunda vuelta de capture_nieve). La nieve
		// CUAJA: cubre casi todo y deja unos pocos claros grandes. Así ~4/5 del
		// campo quedan blancos enteros y el verde sólo asoma donde el ruido cae
		// del todo — que es también donde el ojo lo lee como "aquí se derritió".
		snow_cover = clamp(smoothstep(0.12, 0.40, n) * snow_amount, 0.0, 1.0);
		// DONDE SE PISA, NO CUAJA. Las dos bocas de gol y el círculo central son
		// lo que más corre un partido, y ahí la nieve se vuelve barro pisado
		// antes que en las bandas. Es la misma `traffic` del lodo — y va acotada
		// a la cancha, porque fuera de la raya no pisa nadie (ahí `traffic`
		// devuelve el pasillo de banda, que aquí no significa nada).
		if (abs(x_m) <= field_half_w && z_m >= 0.0 && z_m <= field_depth) {
			snow_cover *= 1.0 - 0.8 * traffic(x_m, z_m);
		}
		// LAS LÍNEAS SE BARREN, que es literalmente lo que se hace cuando nieva:
		// si la cal desaparece, el campo pierde la forma y el partido deja de
		// poder leerse. Y se barre una FRANJA, no la raya, porque la cal es
		// BLANCA y sobre nieve blanca no se ve: lo que delata la línea es el
		// pasto oscuro a los dos lados.
		//
		// La franja sale de `sweep_mask` —la cal reducida y leída con filtro
		// lineal— y NO de dilatar `marks_texture` con cuatro muestras alrededor,
		// que fue el primer intento y está mal de raíz: una muestra puntual no
		// ENSANCHA una raya, la CLONA a esa distancia. El círculo central salía
		// como cuatro anillos concéntricos y el punto de penalti, cuadruplicado
		// (segunda vuelta de capture_nieve).
		float lime = max(marks.a,
			smoothstep(0.015, 0.13, texture(sweep_mask, UV).a));
		snow_cover *= 1.0 - 0.92 * lime;
		// LAS HUELLAS, lo último que come manto: se pisa DESPUÉS de que la nieve
		// cuaje. 0.85 y no 1.0 porque una huella no llega al pasto — deja una
		// lámina pisada, y a 1.0 el rastro se leía como si alguien hubiera
		// escarbado hasta la tierra.
		if (tread_amount > 0.0) {
			snow_cover *= 1.0 - 0.85 * clamp(
				texture(tread_mask, UV).r * tread_amount, 0.0, 1.0);
		}
		col = mix(col, snow_color, snow_cover);
		// Nieve fresca: mate, pero no tanto como el pasto seco. Y por debajo del
		// charco (0.12), que es lo único que de verdad centellea.
		rough = mix(rough, 0.86, snow_cover);
	}

	float wave = sin((UV.x * 18.0 + UV.y * 9.0) - grass_now * wind_speed * TAU) * 0.5 + 0.5;
	float gust = sin(grass_now * wind_speed * 0.6 + UV.y * 3.0) * 0.5 + 0.5;
	float shimmer = 1.0 + (wave * gust - 0.5) * wind_strength;
	// El brillo del viento es de las BRIZNAS. Bajo el manto no hay briznas que se
	// muevan, así que la nieve apaga el temblor en la misma proporción en la que
	// tapa: sin esto el campo nevado ondeaba como un trigal.
	shimmer = mix(shimmer, 1.0, snow_cover);
	// El manchón de nube, lo ÚLTIMO que toca el color: no es un material del campo
	// sino luz que falta, así que va sobre todo lo demás —pasto, cal, nieve, agua—
	// tal como una sombra de verdad cae sobre lo que haya debajo.
	float sun = 1.0;
	if (cloud_amount > 0.0) {
		vec2 cuv = (vec2(x_m, z_m) + cloud_drift * grass_now) / cloud_size;
		// LA VENTANA VA APRETADA ALREDEDOR DE LA MEDIANA (0.40..0.60) y no abierta
		// de par en par, y esto costó una vuelta de `capture_detalles`: con
		// 0.34..0.66 el ruido —que se agolpa cerca de 0.5— salía casi constante y
		// el resultado era el campo ENTERO un 15 % más oscuro, o sea nada. Lo que
		// hace falta no es una sombra suave, es un CONTRASTE: aquí hay nube y aquí
		// no. El borde sigue siendo blando porque el smoothstep se estira sobre los
		// 25 metros de una celda, así que la transición dura varios metros de campo.
		float shade = smoothstep(0.40, 0.60, sample_grid(mud_noise, cloud_grid, cuv));
		sun -= cloud_dark * cloud_amount * shade;
	}
	ALBEDO = col * grass_tint * shimmer * sun;
	// La emisión sale del COLOR FINAL del píxel de cal, no de `marks.rgb`: si un
	// charco o la nieve la tapan, lo que brilla es lo que se ve encima (el charco
	// oscuro apenas), y no una raya fantasma asomando a través del agua.
	if (marks_glow > 0.0) {
		EMISSION = col * marks.a * marks_glow * sun;
	}
	ROUGHNESS = rough;
}
