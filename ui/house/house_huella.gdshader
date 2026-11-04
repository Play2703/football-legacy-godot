shader_type spatial;
// LA HUELLA DE LOS MUEBLES en el modo acomodo (2026-08-10), en RAYOS X.
//
// Es el hermano de `house_grid.gdshader` y existe por una razón concreta: la
// primera versión pintaba la huella en el mismo quad que las rayas, a ras de
// suelo, y NO SE VEÍA NINGUNA — la caja del sofá se dibuja encima de su propia
// base, así que las celdas que ocupa quedan justo debajo de él. Un mueble tapando
// la marca de lo que ocupa es exactamente lo contrario de lo que se pidió.
//
// La solución es `depth_test_disabled`: la huella gana el píxel esté lo que esté
// delante, así que se lee COMO SI el mueble fuera translúcido en su base. Es la
// convención de cualquier editor de planta, y aquí además es barata.
//
// Va en un shader aparte y no en un `uniform` porque `render_mode` se resuelve al
// compilar: dos modos de profundidad son dos shaders, no dos materiales. Y las
// rayas NO pueden llevar este modo — se dibujarían por encima del jugador y de los
// muros, y la casa se volvería un plano técnico.
render_mode unshaded, blend_mix, depth_draw_never, depth_test_disabled, cull_disabled;

// ROJO: es lo OCUPADO. `CareerTheme.DANGER` ya significa «no puedes» en todo el
// juego, así que una celda roja no hay que aprenderla — y contra el verde de las
// celdas libres el suelo se lee de un vistazo.
uniform vec3 color : source_color = vec3(0.83, 0.28, 0.25);
// 0 = celda libre · 128 = la pisa algo BLANDO (alfombra, cuadro) · 255 = la ocupa
// un mueble SÓLIDO. Una celda por téxel, R8, filtro NEAREST.
uniform sampler2D mapa : hint_default_black, filter_nearest, repeat_disable;
uniform vec2 origen = vec2(0.0);
uniform vec2 tam = vec2(1.0);
uniform vec3 foco = vec3(0.0);
uniform float lejos_a = 7.0;
uniform float lejos_b = 12.0;
// El canto de la celda, para orlar la huella: relleno plano a secas se lee como
// una mancha, y lo que hay que leer es CUÁNTAS CELDAS son.
uniform float celda = 0.5;
uniform float orla = 0.05;

void fragment() {
	// En `fragment()` VERTEX está en espacio de VISTA: INV_VIEW_MATRIX devuelve
	// el mundo. Con MODEL_MATRIX saldría un punto que además baila con la cámara.
	vec3 mundo = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	float m = texture(mapa, (mundo.xz - origen) / tam).r;
	float solido = step(0.75, m);
	float blando = step(0.25, m) - solido;

	// El canto de cada celda ocupada, más marcado que su interior: así se cuentan
	// los cuadros de un sofá de un vistazo en vez de ver un rectángulo verde.
	vec2 d = abs(fract(mundo.xz / celda) - 0.5) * celda;
	float canto = 1.0 - step(orla, min(d.x, d.y));

	// Lo blando pesa la mitad: encima de una alfombra SÍ se puede poner una mesa,
	// y encima de un sofá no. Pintarlas igual sería mentir sobre dónde se va a
	// dejar soltar.
	float a = solido * (0.30 + canto * 0.34) + blando * (0.11 + canto * 0.14);
	float lejos = smoothstep(lejos_a, lejos_b, length(mundo.xz - foco.xz));
	ALBEDO = color;
	ALPHA = a * (1.0 - lejos);
}
