shader_type spatial;
// EL GRANO DE LAS PAREDES (2026-08-19), hermano de `house_floor.gdshader` y por el
// mismo motivo: seis acabados de muro que sólo se distinguían por el tono. El caso
// sangrante era LADRILLO, que se llamaba ladrillo y era un rectángulo naranja liso.
//
// EN COORDENADAS DE MUNDO, y el eje horizontal es `x + z`: un muro corre en X o en
// Z, así que en cada tramo una de las dos es constante y la suma da una coordenada
// que avanza a lo largo de la pared sin tener que saber su orientación ni fabricar
// una UV. Los dos muros de una esquina comparten la hilada y el aparejo cruza el
// vértice sin salto.
//
// LO QUE NO SE TOCA: el color entra hecho (`base`) desde la paleta viva y el acabado
// por pared, y el remate, el rodapié y los marcos siguen siendo carpintería lisa —
// son el filo que separa lo que construyó el jugador de la obra de la casa.
render_mode blend_mix, cull_back, diffuse_burley;

uniform vec3 base : source_color = vec3(0.55, 0.52, 0.47);
// Mismo orden que `House.WALL_GRANO`: 0 liso · 1 cal · 2 arena · 3 niebla ·
// 4 carbón · 5 ladrillo · 6 leche.
uniform int tipo = 0;
uniform float fuerza = 1.0;

float hash21(vec2 p) {
	return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float ruido(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	f = f * f * (3.0 - 2.0 * f);
	return mix(mix(hash21(i), hash21(i + vec2(1.0, 0.0)), f.x),
		mix(hash21(i + vec2(0.0, 1.0)), hash21(i + vec2(1.0, 1.0)), f.x), f.y);
}

void fragment() {
	vec3 mundo = (INV_VIEW_MATRIX * vec4(VERTEX, 1.0)).xyz;
	// `u` avanza a lo largo del muro (una de x/z es constante); `v` es la altura.
	vec2 p = vec2(mundo.x + mundo.z, mundo.y);
	vec3 col = base;
	float rug = 1.0;

	if (tipo == 5) {
		// LADRILLO. Pieza de 0,24 × 0,08 m —la de verdad— con la hilada trabada a
		// medio ladrillo. Tono por pieza: un muro de ladrillo del mismo rojo exacto
		// se lee impreso, y lo que lo hace obra es que ninguna pieza salió igual.
		float hilada = floor(p.y / 0.08);
		vec2 q = vec2(p.x + mod(hilada, 2.0) * 0.12, p.y);
		vec2 celda = vec2(floor(q.x / 0.24), hilada);
		col *= 1.0 + (hash21(celda) - 0.5) * 0.26 * fuerza;
		col *= 1.0 + (ruido(q * 40.0) - 0.5) * 0.10 * fuerza;
		// LA JUNTA es de mortero y NO es el ladrillo oscurecido: un mortero gris
		// claro es lo que de lejos dice «ladrillo» de un vistazo.
		vec2 d = abs(fract(q / vec2(0.24, 0.08)) - 0.5) * vec2(0.24, 0.08);
		// Mortero al 40 % y junta de 10 mm: al 55 % y 12 la carta salía más junta que
		// ladrillo — un enrejado blanco con relleno rojo.
		float junta = step(0.010, min(d.x, d.y));
		col = mix(mix(col, vec3(0.74, 0.71, 0.66), 0.40), col, junta);
	} else if (tipo == 2) {
		// ARENA: estuco. Grano grueso, sin junta: lo que se ve es la llana.
		col *= 1.0 + (ruido(p * 55.0) - 0.5) * 0.13 * fuerza;
		col *= 1.0 + (ruido(p * 6.0) - 0.5) * 0.07 * fuerza;
	} else if (tipo == 4) {
		// CARBÓN: mate y profundo. El grano va MUY bajo porque sobre un oscuro
		// cualquier moteado se lee como ruido de compresión, no como material.
		col *= 1.0 + (ruido(p * 24.0) - 0.5) * 0.07 * fuerza;
		rug = 1.0;
	} else if (tipo == 6) {
		// LECHE: el caro. Casi liso, con un velo largo que le da la profundidad de
		// una pared bien dada; algo de brillo, que es lo que se paga.
		col *= 1.0 + (ruido(p * 2.2) - 0.5) * 0.05 * fuerza;
		rug = 0.7;
	} else if (tipo == 1 || tipo == 3) {
		// CAL y NIEBLA: yeso. Manchado de mano a escala grande y nada más — una
		// pared pintada de cerca no tiene textura, tiene desigualdad.
		col *= 1.0 + (ruido(p * 3.0) - 0.5) * 0.07 * fuerza;
		col *= 1.0 + (ruido(p * 30.0) - 0.5) * 0.04 * fuerza;
	} else {
		col *= 1.0 + (ruido(p * 10.0) - 0.5) * 0.05 * fuerza;
	}

	// SUCIEDAD DE RODAPIÉ: los primeros 25 cm, un pelo más oscuros. Es lo que hace
	// que una pared se apoye en el suelo en vez de flotar sobre él, y sale gratis.
	col *= mix(0.93, 1.0, smoothstep(0.0, 0.25, mundo.y));

	ALBEDO = col;
	ROUGHNESS = rug;
}
