shader_type spatial;
// LA OLA QUE CORRE POR LA GENTE, NO POR LAS SECCIONES (2026-10-06, Cesar: «no se ve
// fluido. no parece ola, la ola no se debe ver dividido por secciones»).
//
// Es el material del público estático (`Stadium._add_static_fans`: StandardMaterial3D sin
// luz, recorte de alfa, filtro al píxel, billboard de eje Y que conserva la escala y el
// color de instancia como tinte) reescrito a mano para lo único que aquél no puede hacer:
// que cada aficionado del lote se levante en SU instante. Antes la ola cambiaba la lámina
// del lote entero y subía su nodo, así que se levantaban cientos de golpe y el frente
// avanzaba a saltos de sección, que es exactamente lo que se veía. Aquí el instante sale
// del ÁNGULO de cada uno alrededor del centro del campo, el mismo que ordena la ola
// (`b["ang"]`), y el frente pasa de un lote al siguiente sin costura.
//
// Sólo vive mientras la ola cruza el lote: `Stadium._ola_monta` lo pone de
// `material_override` un instante antes de que llegue el frente y `_ola_suelta` lo quita
// cuando el último se ha sentado. El resto del partido el lote lleva su material de
// siempre, y todo lo que le cambia la lámina (el ánimo, el clima, el gol) no se entera.
render_mode blend_mix, depth_draw_opaque, cull_back, unshaded;

uniform sampler2D lamina_base : source_color, filter_nearest, repeat_enable;  // reposo (`b["base"]`)
uniform sampler2D lamina_0 : source_color, filter_nearest, repeat_enable;     // `b["cheer"]`: brazos abiertos
uniform sampler2D lamina_1 : source_color, filter_nearest, repeat_enable;     // subiendo
uniform sampler2D lamina_2 : source_color, filter_nearest, repeat_enable;     // arriba del todo, la V
uniform sampler2D lamina_3 : source_color, filter_nearest, repeat_enable;     // arriba, ya bajando
uniform vec4 albedo : source_color = vec4(1.0);
uniform float occ_alpha = 1.0;   // la oclusión de la cámara (ver `Stadium._mat_alpha`)

uniform mat4 ola_inv;            // del mundo al espacio del estadio, donde se midió `ang`
uniform float ola_t = -100.0;    // segundos desde que el frente pasó por el centro del lote
uniform float ola_ang = 0.0;     // el ángulo de ese centro (`b["ang"]`)
uniform float ola_k = 1.0;       // segundos por radián, con el signo del sentido de la ola
uniform float ola_dur = 0.9;     // lo que tarda UNO en levantarse y volver a sentarse
uniform float ola_jit = 0.12;    // retraso al azar de cada uno: nadie va clavado al vecino
uniform float ola_alto = 0.36;   // cuánto despega

// El cuadro que toca, igual en los cuatro vértices: sale sólo del sitio de la instancia.
varying flat float v_cuadro;

void vertex() {
	vec3 mundo = MODEL_MATRIX[3].xyz;
	vec3 p = (ola_inv * vec4(mundo, 1.0)).xyz;
	// Distancia angular al centro del lote, en (-π, π]: un lote nunca abarca media vuelta.
	float d = atan(p.x, p.z - 52.5) - ola_ang;
	d -= 6.2831853 * floor((d + 3.14159265) / 6.2831853);
	// Un azar FIJO por aficionado. Sale del número de instancia y no de su sitio en el
	// mundo: el lote se asoma hacia el balón (`_tick_sway`) y con el sitio el azar
	// cambiaría en cada fotograma.
	float azar = fract(sin(float(INSTANCE_ID) * 12.9898 + ola_ang * 78.233) * 43758.5453);
	// En la cumbre justo cuando el frente le pasa por delante.
	float u = (ola_t - d * ola_k - azar * ola_jit) / ola_dur + 0.5;
	float alto = 0.0;
	float cuadro = -1.0;
	if (u > 0.0 && u < 1.0) {
		float s = sin(u * 3.14159265);
		alto = s * ola_alto * (0.85 + 0.3 * fract(azar * 7.31));
		// Los brazos acompañan al cuerpo: suben con él hasta la V y bajan por el cuadro
		// de los brazos doblados, que es el que tiene la caída.
		if (u < 0.5) {
			cuadro = s < 0.15 ? -1.0 : (s < 0.45 ? 0.0 : (s < 0.75 ? 1.0 : 2.0));
		} else {
			cuadro = s >= 0.75 ? 3.0 : (s >= 0.45 ? 1.0 : (s >= 0.15 ? 0.0 : -1.0));
		}
	}
	v_cuadro = cuadro;
	// El billboard de eje Y con escala, como lo genera StandardMaterial3D (con la cámara
	// PRINCIPAL, como el motor: ver `ui/pixel_nitido.gd`), con el ancla subida lo que toca.
	vec4 origen = MODEL_MATRIX[3] + vec4(0.0, alto, 0.0, 0.0);
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(
		vec4(normalize(cross(vec3(0.0, 1.0, 0.0), MAIN_CAM_INV_VIEW_MATRIX[2].xyz)), 0.0),
		vec4(0.0, 1.0, 0.0, 0.0),
		vec4(normalize(cross(MAIN_CAM_INV_VIEW_MATRIX[0].xyz, vec3(0.0, 1.0, 0.0))), 0.0),
		origen);
	MODELVIEW_MATRIX = MODELVIEW_MATRIX * mat4(
		vec4(length(MODEL_MATRIX[0].xyz), 0.0, 0.0, 0.0),
		vec4(0.0, length(MODEL_MATRIX[1].xyz), 0.0, 0.0),
		vec4(0.0, 0.0, length(MODEL_MATRIX[2].xyz), 0.0),
		vec4(0.0, 0.0, 0.0, 1.0));
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);
}

// Umbral de tramado ordenado 4×4, en [0, 1).
float bayer2(vec2 a) {
	a = floor(a);
	return fract(a.x * 0.5 + a.y * a.y * 0.75);
}

void fragment() {
	// `textureLod` y no `texture`: la rama cambia de un aficionado al vecino, y dentro de
	// un bloque de 2×2 píxeles partido entre dos la derivada no vale.
	vec4 tex;
	if (v_cuadro < -0.5) {
		tex = textureLod(lamina_base, UV, 0.0);
	} else if (v_cuadro < 0.5) {
		tex = textureLod(lamina_0, UV, 0.0);
	} else if (v_cuadro < 1.5) {
		tex = textureLod(lamina_1, UV, 0.0);
	} else if (v_cuadro < 2.5) {
		tex = textureLod(lamina_2, UV, 0.0);
	} else {
		tex = textureLod(lamina_3, UV, 0.0);
	}
	tex *= COLOR;
	ALBEDO = albedo.rgb * tex.rgb;
	float a = albedo.a * tex.a;
	// La oclusión FUNDE la grada y este material es de recorte: el fundido se trama por
	// píxel en vez de pasar al pase transparente, que es lo que hace el material de
	// siempre (`_mat_alpha`) y no hace falta para el instante que dura la ola.
	if (occ_alpha < 0.999) {
		float umbral = bayer2(FRAGCOORD.xy * 0.5) * 0.25 + bayer2(FRAGCOORD.xy);
		if (occ_alpha <= umbral) {
			a = 0.0;
		}
	}
	ALPHA = a;
	ALPHA_SCISSOR_THRESHOLD = 0.5;
}
