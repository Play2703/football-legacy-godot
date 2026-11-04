shader_type spatial;
// EL GRANO DEL SUELO (2026-08-19, pedido de Cesar: «para los diferentes tipos de
// pisos me gustaría darles más detalle, no que sólo sean colores planos»).
//
// Hasta hoy cada acabado de suelo era UN `Color` liso en una caja de 10 cm
// (`_add_floor` y las manchas de la brocha). Con siete acabados el resultado era
// que ROBLE y NOGAL sólo se distinguían por claridad: dos rectángulos de tono
// distinto, sin decir de qué están hechos. Aquí no se cambia el color —el que
// elige el jugador en la pantalla de Casa sigue mandando, es `base`— sino que se
// le pone ENCIMA la junta y la veta que dicen «esto es duela» o «esto es losa».
//
// SE DIBUJA EN COORDENADAS DE MUNDO, no en UV: la losa de un cuarto es una caja
// de tamaño arbitrario y las manchas de la brocha son cajas de una celda. Con UV,
// una mancha de 0,5 m tendría una duela entera dentro y las juntas no casarían
// con las del cuarto de al lado. En mundo, todo el piso comparte la misma trama y
// pintar una celda queda invisible salvo por el color, que es justo lo que se
// espera de pintar.
//
// SHADED, al revés que la rejilla: el suelo recibe la direccional y las lámparas,
// y un suelo sin luz de noche se vería como un agujero de día.
render_mode blend_mix, cull_back, diffuse_burley;

uniform vec3 base : source_color = vec3(0.70, 0.63, 0.53);
// QUÉ ES ESTE SUELO. Mismo orden que `House.FLOOR_GRANO`: 0 liso · 1 duela ·
// 2 mármol · 3 pizarra · 4 hormigón · 5 damero · 6 pasto.
uniform int tipo = 0;
// CUÁNTO SE NOTA. Un solo mando para poder bajar el grano entero si una casa
// futura lo pide, sin tocar siete ramas.
uniform float fuerza = 1.0;

// Ruido de valor barato: dos hash y un `mix` bilineal. Nada de simplex — esto
// corre por fragmento en el suelo de una mansión de 33 m en un iPhone.
float hash21(vec2 p) {
	return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float ruido(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	f = f * f * (3.0 - 2.0 * f);
	float a = hash21(i);
	float b = hash21(i + vec2(1.0, 0.0));
	float c = hash21(i + vec2(0.0, 1.0));
	float d = hash21(i + vec2(1.0, 1.0));
	return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

// La junta: 1 dentro de la pieza, 0 sobre la línea. `ancho` en metros, y duro
// (`step`, sin `fwidth`) por lo mismo que la rejilla — suavizar una junta de
// 3 cm a esta distancia la convierte en suciedad.
float pieza(vec2 uv, vec2 tam, float ancho) {
	vec2 d = abs(fract(uv / tam) - 0.5) * tam;
	return step(ancho * 0.5, min(d.x, d.y));
}

void fragment() {
	vec3 mundo = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	vec2 p = mundo.xz;
	vec3 col = base;
	float rug = 1.0;

	if (tipo == 1) {
		// DUELA. Tablas de 1,2 m × 0,18 m corridas en X, con el corte de cada
		// hilera desplazado media tabla: una duela con todas las juntas alineadas
		// se lee como rejilla, no como madera.
		float hilera = floor(p.y / 0.18);
		vec2 q = vec2(p.x + mod(hilera, 2.0) * 0.6, p.y);
		float tabla = floor(q.x / 1.2) * 7.0 + hilera;
		// Cada tabla, su propio tono: es lo único que de verdad hace que la
		// madera parezca cortada de un árbol y no impresa.
		col *= 1.0 + (hash21(vec2(tabla, 3.0)) - 0.5) * 0.16 * fuerza;
		// La veta, estirada a lo largo de la tabla.
		col *= 1.0 + (ruido(vec2(q.x * 3.0, q.y * 26.0)) - 0.5) * 0.14 * fuerza;
		float junta = pieza(q, vec2(1.2, 0.18), 0.022);
		col *= mix(0.74, 1.0, junta);
	} else if (tipo == 2) {
		// MÁRMOL. Losa grande (0,9 m) y vetas finas: el `sin` de un ruido estirado
		// da las betas ramificadas sin pagar un fractal.
		// LA VETA VA CALLADA. El primer intento (amplitud 9,0 en la fase, realce 0,20)
		// dibujaba anillos cerrados de curva de nivel por toda la sala: parecía un mapa
		// topográfico, no piedra. El mármol de esta casa tiene que leerse como una losa
		// clara con una raya, no como un patrón. Fase 3,5 y realce 0,09.
		float v = sin((p.x + p.y * 0.6) * 1.6 + ruido(p * 0.9) * 3.5);
		col *= 1.0 + smoothstep(0.93, 1.0, abs(v)) * 0.09 * fuerza;
		col *= mix(0.90, 1.0, pieza(p, vec2(0.9, 0.9), 0.02));
		rug = 0.55;
	} else if (tipo == 3) {
		// PIZARRA. Piezas de 0,6 × 0,4 con cada una a su tono, y grano grueso
		// dentro: la piedra natural nunca sale del horno igual dos veces.
		vec2 celda = floor(p / vec2(0.6, 0.4));
		col *= 1.0 + (hash21(celda) - 0.5) * 0.22 * fuerza;
		col *= 1.0 + (ruido(p * 22.0) - 0.5) * 0.16 * fuerza;
		col *= mix(0.68, 1.0, pieza(p, vec2(0.6, 0.4), 0.03));
	} else if (tipo == 4) {
		// HORMIGÓN. Losas de 1,8 m con junta de dilatación fina y moteado de
		// árido: sin el moteado, el hormigón es exactamente un gris plano.
		col *= 1.0 + (ruido(p * 30.0) - 0.5) * 0.13 * fuerza;
		col *= 1.0 + (ruido(p * 3.0) - 0.5) * 0.07 * fuerza;
		col *= mix(0.86, 1.0, pieza(p, vec2(1.8, 1.8), 0.02));
		rug = 0.9;
	} else if (tipo == 5) {
		// DAMERO. Casilla de 0,5 m —la MISMA celda con la que se valida y se
		// pinta— para que el ajedrez case con la rejilla del modo acomodo en vez
		// de pelearse con ella medio cuadro.
		vec2 c = floor(p / 0.5);
		float negra = mod(c.x + c.y, 2.0);
		col *= mix(1.0, 0.52, negra * fuerza);
		col *= 1.0 + (ruido(p * 5.0) - 0.5) * 0.05 * fuerza;
		col *= mix(0.82, 1.0, pieza(p, vec2(0.5, 0.5), 0.016));
		rug = 0.5;
	} else if (tipo == 6) {
		// PASTO. TRES escalas, y la gruesa no es adorno: el césped del mundo mide
		// 42 m y la cámara lo mira desde 8,9 m, así que una mata de 7 cm no llega ni
		// a un píxel de pantalla — con sólo las dos finas, el jardín tenía grano de
		// cerca y volvía a ser un verde plano en la foto de la casa entera. La de
		// ~1,5 m son los claros y las zonas pisadas, que sí se leen de lejos.
		col *= 1.0 + (ruido(p * 0.65) - 0.5) * 0.16 * fuerza;
		col *= 1.0 + (ruido(p * 14.0) - 0.5) * 0.22 * fuerza;
		col *= 1.0 + (ruido(p * 45.0) - 0.5) * 0.16 * fuerza;
	} else {
		col *= 1.0 + (ruido(p * 12.0) - 0.5) * 0.06 * fuerza;
	}

	ALBEDO = col;
	ROUGHNESS = rug;
}
