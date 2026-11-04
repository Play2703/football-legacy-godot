shader_type spatial;
// LA CUADRÍCULA DEL MODO ACOMODO (2026-08-10).
//
// Va sobre un QuadMesh tumbado POR CUARTO —nacido oculto— y NO sobre el material
// del suelo. La losa es un StandardMaterial3D liso que sale en las 29 fotos de
// `tools/house_*.png` y en la galería de `showcase/`: cambiarle el sombreado
// fuera del modo acomodo rompería la vara con la que se comparan los cambios de
// arte. Un quad aparte no toca un solo píxel mientras el modo está apagado.
//
// Un quad POR CUARTO y no uno por planta: los suelos son de 1 a 6 cajas sueltas
// (`_add_floor`) y la envolvente de la mansión mide 33,5 × 14,0 m — un solo quad
// pintaría rejilla sobre el jardín del vecino, la calle y las dos filas de
// barrio de `_add_surroundings`. Con un quad por cuarto el recorte al contorno de
// la casa sale gratis por geometría, sin un `discard` por fragmento.
//
// UNSHADED a propósito: el suelo es plano y lo alumbra UNA sola direccional, así
// que su color sombreado es constante en toda la superficie. Una raya sin luz con
// el color ya elegido casa exactamente, y de paso la rejilla no se apaga cuando
// `_fade_walls` anda tocando alfas.
render_mode unshaded, blend_mix, depth_draw_never, cull_disabled;

// LA CELDA, en metros. Es `House.CELDA` y no un número suelto: la rejilla que se
// pinta tiene que ser LA MISMA sobre la que se valida, o el suelo estaría
// mintiendo sobre dónde cae la pieza.
uniform float celda = 0.5;

// EL GROSOR DE LA RAYA, EN METROS Y NO EN PÍXELES. El grano del juego es 1,78 m
// sobre 65 px de sprite: a la profundidad del jugador un téxel del personaje mide
// 6,7 px de pantalla. Una hairline de 1 px con antialias se leería de otro juego.
// A 0,03 m la raya mide ~7 px junto al jugador y ~4 a seis metros: el mismo grano
// que el resto del cuadro. `step()` duro, sin `fwidth`, porque suavizarla es
// justo lo que la haría parecer una textura sucia.
uniform float raya = 0.03;

uniform vec3 color_raya : source_color = vec3(0.62, 0.94, 0.62);
uniform float alfa = 0.55;

// LA HUELLA DE CADA MUEBLE, horneada a UNA CELDA POR TÉXEL (R8, filtro NEAREST).
// No se le pasa al shader la lista de muebles —serían decenas de rects por
// fragmento— sino el resultado ya cocinado: 0 = celda libre, 128 = la pisa algo
// BLANDO (una alfombra, un cuadro), 255 = la ocupa un mueble SÓLIDO. El mapa del
// salón de la mansión son 32×18 téxeles: 576 bytes.
uniform sampler2D mapa : hint_default_black, filter_nearest, repeat_disable;
// El rect del cuarto EN METROS, para pasar de mundo a téxel sin depender de la UV
// del quad: el quad se rota -90° en ejecución y acertar el signo de UV.y es una
// clase de bug que no hace falta pagar.
uniform vec2 origen = vec2(0.0);
uniform vec2 tam = vec2(1.0);

// EL FOCO ES EL JUGADOR, NO LA CÁMARA. La cámara vive a 8,91 m del suelo que pisas
// (CAM_UP 6,4 y CAM_BACK 6,2), así que medir el desvanecido desde ella lo empieza
// antes de que la rejilla exista: a tres metros por delante ya estaría al 10 %.
// Medido desde el jugador y EN PLANTA, "cerca" quiere decir lo que el ojo entiende
// por cerca de mí.
uniform vec3 foco = vec3(0.0);
uniform float lejos_a = 6.0;
uniform float lejos_b = 10.0;

void fragment() {
	// EN `fragment()` VERTEX ESTÁ EN ESPACIO DE VISTA, no en espacio de modelo
	// (en `vertex()` sí es local). Multiplicarlo por MODEL_MATRIX da un punto sin
	// significado que además baila con la cámara, y la cámara va en `lerp`
	// continuo (`_follow_cam`, CAM_LERP 6.0): la rejilla se arrastraría por el
	// suelo. INV_VIEW_MATRIX es la que devuelve el mundo.
	vec3 mundo = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	// Distancia al canto de celda más cercano, en los dos ejes del plano.
	vec2 d = abs(fract(mundo.xz / celda) - 0.5) * celda;
	float linea = 1.0 - step(raya * 0.5, min(d.x, d.y));

	// LAS CELDAS OCUPADAS NO SE RAYAN. La huella la pinta el otro quad
	// (`house_huella.gdshader`, en rayos X por encima del mueble), así que aquí
	// sólo estorbarían: una raya asomando bajo el canto de un sofá se lee como que
	// la rejilla se cuela por debajo, no como que esa celda está tomada.
	float m = texture(mapa, (mundo.xz - origen) / tam).r;
	float libre = 1.0 - step(0.75, m);

	float lejos = smoothstep(lejos_a, lejos_b, length(mundo.xz - foco.xz));
	ALBEDO = color_raya;
	ALPHA = linea * alfa * libre * (1.0 - lejos);
}
