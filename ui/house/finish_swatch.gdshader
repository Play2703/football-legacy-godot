shader_type canvas_item;
// LA MUESTRA DE UN ACABADO, EN 2D (2026-08-19, pedido de Cesar: «las distintas
// paredes y suelos no salen actualizadas con su look actual y muestran colores
// lisos»).
//
// El mismo día en que `house_floor.gdshader` y `house_wall.gdshader` le dieron
// grano a la casa —duela, mármol, damero, ladrillo—, la TIENDA se quedó atrás:
// sus fichas siguen pintando el `color` pelado del catálogo, así que ROBLE y
// NOGAL se eligen a ciegas y LADRILLO se compra creyendo que es naranja liso. Una
// muestra que no se parece a lo que llega a la casa es peor que no tener muestra.
//
// POR QUÉ UN TERCER SHADER Y NO LOS DOS DE LA CASA: aquellos son `spatial` y leen
// la posición de MUNDO (`INV_VIEW_MATRIX * VERTEX`) — no hay forma de colgarlos de
// un `Control`, y montar un `SubViewport` 3D por ficha serían veinte mundos vivos
// dentro de un menú, justo lo que `HouseStage` existe para evitar. Aquí el "mundo"
// se finge: `p = UV * metros` es un recorte plano de esa misma trama.
//
// LAS RAMAS SON LAS MISMAS Y EN EL MISMO ORDEN que `House.FLOOR_GRANO` y
// `House.WALL_GRANO`. Si allí se añade un grano, aquí se añade su rama: la ficha
// tiene que mentir lo mínimo, y el único punto donde de verdad se aparta es la
// luz —la casa está sombreada y la muestra es plana, porque un cuadrito de 56 px
// con penumbra se lee como un color sucio, no como un material.
uniform vec3 base : source_color = vec3(0.70, 0.63, 0.53);
// 0 = suelo (usa la tabla de FLOOR_GRANO) · 1 = pared (la de WALL_GRANO).
uniform int zona = 0;
uniform int tipo = 0;
// CUÁNTOS METROS DE MATERIAL CABEN EN LA MUESTRA. Es lo que decide que se vean
// tres ladrillos y no medio: con el metro real, una ficha de 56 px enseñaría el
// interior de una sola pieza y volvería a ser un color plano.
uniform float metros = 1.1;
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

float pieza(vec2 uv, vec2 tam, float ancho) {
	vec2 d = abs(fract(uv / tam) - 0.5) * tam;
	return step(ancho * 0.5, min(d.x, d.y));
}

void fragment() {
	vec2 p = UV * metros;
	vec3 col = base;

	if (zona == 1) {
		// --- PAREDES (espejo de house_wall.gdshader) ---
		if (tipo == 5) {
			// LADRILLO: pieza de 0,24 × 0,08 con la hilada trabada a medio ladrillo
			// y el mortero CLARO, que es lo que de lejos dice «ladrillo».
			float hilada = floor(p.y / 0.08);
			vec2 q = vec2(p.x + mod(hilada, 2.0) * 0.12, p.y);
			vec2 celda = vec2(floor(q.x / 0.24), hilada);
			col *= 1.0 + (hash21(celda) - 0.5) * 0.26 * fuerza;
			col *= 1.0 + (ruido(q * 40.0) - 0.5) * 0.10 * fuerza;
			vec2 d = abs(fract(q / vec2(0.24, 0.08)) - 0.5) * vec2(0.24, 0.08);
			float junta = step(0.010, min(d.x, d.y));
			col = mix(mix(col, vec3(0.74, 0.71, 0.66), 0.40), col, junta);
		} else if (tipo == 2) {
			col *= 1.0 + (ruido(p * 55.0) - 0.5) * 0.13 * fuerza;
			col *= 1.0 + (ruido(p * 6.0) - 0.5) * 0.07 * fuerza;
		} else if (tipo == 4) {
			col *= 1.0 + (ruido(p * 24.0) - 0.5) * 0.07 * fuerza;
		} else if (tipo == 6) {
			col *= 1.0 + (ruido(p * 2.2) - 0.5) * 0.05 * fuerza;
		} else if (tipo == 1 || tipo == 3) {
			col *= 1.0 + (ruido(p * 3.0) - 0.5) * 0.07 * fuerza;
			col *= 1.0 + (ruido(p * 30.0) - 0.5) * 0.04 * fuerza;
		} else {
			col *= 1.0 + (ruido(p * 10.0) - 0.5) * 0.05 * fuerza;
		}
	} else {
		// --- SUELOS (espejo de house_floor.gdshader) ---
		if (tipo == 1) {
			float hilera = floor(p.y / 0.18);
			vec2 q = vec2(p.x + mod(hilera, 2.0) * 0.6, p.y);
			float tabla = floor(q.x / 1.2) * 7.0 + hilera;
			col *= 1.0 + (hash21(vec2(tabla, 3.0)) - 0.5) * 0.16 * fuerza;
			col *= 1.0 + (ruido(vec2(q.x * 3.0, q.y * 26.0)) - 0.5) * 0.14 * fuerza;
			col *= mix(0.74, 1.0, pieza(q, vec2(1.2, 0.18), 0.022));
		} else if (tipo == 2) {
			float v = sin((p.x + p.y * 0.6) * 1.6 + ruido(p * 0.9) * 3.5);
			col *= 1.0 + smoothstep(0.93, 1.0, abs(v)) * 0.09 * fuerza;
			col *= mix(0.90, 1.0, pieza(p, vec2(0.9, 0.9), 0.02));
		} else if (tipo == 3) {
			vec2 celda = floor(p / vec2(0.6, 0.4));
			col *= 1.0 + (hash21(celda) - 0.5) * 0.22 * fuerza;
			col *= 1.0 + (ruido(p * 22.0) - 0.5) * 0.16 * fuerza;
			col *= mix(0.68, 1.0, pieza(p, vec2(0.6, 0.4), 0.03));
		} else if (tipo == 4) {
			col *= 1.0 + (ruido(p * 30.0) - 0.5) * 0.13 * fuerza;
			col *= 1.0 + (ruido(p * 3.0) - 0.5) * 0.07 * fuerza;
			col *= mix(0.86, 1.0, pieza(p, vec2(1.8, 1.8), 0.02));
		} else if (tipo == 5) {
			vec2 c = floor(p / 0.5);
			col *= mix(1.0, 0.52, mod(c.x + c.y, 2.0) * fuerza);
			col *= 1.0 + (ruido(p * 5.0) - 0.5) * 0.05 * fuerza;
			col *= mix(0.82, 1.0, pieza(p, vec2(0.5, 0.5), 0.016));
		} else if (tipo == 6) {
			col *= 1.0 + (ruido(p * 0.65) - 0.5) * 0.16 * fuerza;
			col *= 1.0 + (ruido(p * 14.0) - 0.5) * 0.22 * fuerza;
			col *= 1.0 + (ruido(p * 45.0) - 0.5) * 0.16 * fuerza;
		} else {
			col *= 1.0 + (ruido(p * 12.0) - 0.5) * 0.06 * fuerza;
		}
	}

	COLOR = vec4(col, 1.0);
}
