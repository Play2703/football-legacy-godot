shader_type spatial;
render_mode cull_disabled;

// Los cuatro paños comparten acabado, no estado: cada material conserva su
// impacto, viento y pandeo propios, también en la portería lejana y los replays.
uniform sampler2D net_tex : filter_linear_mipmap, repeat_enable;
uniform vec2 uv_scale = vec2(16.0, 5.5);
uniform vec2 panel_size = vec2(7.32, 2.44);
uniform vec3 net_tint : source_color = vec3(1.0);
uniform vec3 impact_local = vec3(0.0);
uniform float ripple = 0.0;
uniform float sag = 0.0;
uniform float wind = 0.0;
// LA RED SE CAE (2026-10-27): sin sus cuerdas, las esquinas de arriba del fondo no tienen quién
// las sujete. `cae_local` es adónde va una esquina suelta del todo, en el espacio del PAÑO;
// `cae_esq`, cuánto se ha soltado cada esquina del UV —(0,0), (1,0), (0,1), (1,1)—, y entre
// ellas se interpola: el borde cosido al travesaño o al suelo no se mueve.
uniform vec3 cae_local = vec3(0.0);
uniform vec4 cae_esq = vec4(0.0);

void vertex() {
	// Mismo desplazamiento anterior: cambiar la luz no cambia el golpe del
	// balón ni sus anclajes. El borde se dibuja sobre este mismo paño móvil.
	float pinned = sin(3.14159265 * UV.x) * UV.y;
	VERTEX.z += sag * pinned;
	float gust = 0.62 + 0.38 * sin(TIME * 1.15 + UV.x * 3.1)
		* (0.7 + 0.3 * sin(TIME * 0.43));
	VERTEX.z += wind * pinned * gust;
	float d = distance(VERTEX.xy, impact_local.xy);
	VERTEX.z -= ripple * exp(-d * 0.9) * sin(TIME * 24.0 - d * 5.0);
	VERTEX += cae_local * mix(mix(cae_esq.x, cae_esq.y, UV.x),
		mix(cae_esq.z, cae_esq.w, UV.x), UV.y);
}

void fragment() {
	vec4 hilo = texture(net_tex, UV * uv_scale);
	// Cordón cosido al perímetro, en metros: el lateral y el fondo llevan el
	// mismo calibre. Derivadas suavizan el borde en la cámara lejana sin
	// añadir tubos rígidos que se separen de la red al recibir un balonazo.
	vec2 borde = min(UV, vec2(1.0) - UV) * panel_size;
	float distancia = min(borde.x, borde.y);
	float suavizado = max(fwidth(distancia), 0.001);
	float costura = 1.0 - smoothstep(0.009 - suavizado, 0.009 + suavizado, distancia);
	vec3 cordon = net_tint * vec3(0.88, 0.88, 0.85);
	ALBEDO = mix(hilo.rgb * net_tint, cordon, costura);
	// LA RED LEJANA SE BORRABA: el mipmap promedia un hilo de 2 px con una celda
	// de 16 px vacía, y a distancia la cobertura cae a ~0,2 de alfa — la red se
	// volvía un velo casi transparente justo en la cámara de tiro. Se devuelve la
	// cobertura según cuántos texels caben en un píxel (el nivel de mip que usa
	// la GPU): de cerca no cambia nada, de lejos el velo vuelve a leerse como red.
	vec2 texels = fwidth(UV * uv_scale) * 48.0;
	float lod = log2(max(max(texels.x, texels.y), 1.0));
	float refuerzo = mix(1.0, 2.6, clamp(lod / 3.0, 0.0, 1.0));
	ALPHA = max(min(hilo.a * refuerzo, 0.8), costura * 0.94);
	ROUGHNESS = 0.88;
	SPECULAR = 0.18;
	// Suelo de lectura: el hilo recibe sol y focos, pero no se pierde contra una
	// grada oscura. Era 0,13 y con NUBLADO o lluvia (poca luz directa) la malla
	// blanca caía al mismo gris que la grada de detrás y «a veces no se veía»
	// (Cesar, 2026-09-26). 0,3 la sostiene en días grises sin que brille de sol.
	// No emite luz al escenario ni crea otra pasada.
	EMISSION = ALBEDO * 0.3;
}
