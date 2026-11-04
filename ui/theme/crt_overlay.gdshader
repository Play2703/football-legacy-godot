// Overlay CRT retro para los menús: aberración cromática, scanlines y viñeta.
// Lee la pantalla ya dibujada (hint_screen_texture), así que debe ir en un
// CanvasLayer por ENCIMA de la UI. No usar en el partido: la copia de pantalla
// por frame es cara sobre el render 3D en móvil.
//
// La curvatura de tubo (uniform warp) se QUITÓ: llevaba a 0.0 desde siempre
// porque abultaba la pantalla y ondulaba los botones (aspecto "Balatro"), y un
// uniform no se pliega en compilación — se pagaba el mad y la rama de
// fuera-de-tubo por píxel a pantalla completa sin dibujar nada. El código vive
// en el historial de git de este archivo.
shader_type canvas_item;

// filter_linear: el filtro global del proyecto es nearest, pero los offsets de
// la aberración son fraccionarios (sub-téxel en casi toda la pantalla) — con
// nearest se cuantizarían a 0 en la zona media y aliasearían en los bordes.
uniform sampler2D screen_tex : hint_screen_texture, filter_linear;
uniform float aberration = 1.2;
uniform float scan_lines = 360.0;
uniform float scan_strength : hint_range(0.0, 1.0) = 0.1;
uniform float vignette_strength : hint_range(0.0, 1.0) = 0.3;

// PAPEL (0 = tubo de noche, 1 = papel de día). Lo pone el fondo del menú desde
// GDScript según el tema (ver menu_background._apply_crt), y existe porque los
// TRES efectos de aquí abajo son MULTIPLICATIVOS: oscurecen lo que hay debajo.
// Sobre el casi-negro del tema oscuro eso no se nota —no hay nada que oscurecer—
// pero sobre el papel del tema claro se ve todo: la viñeta deja un marco gris
// sucio, las scanlines bajan el blanco a un gris rayado y los halos rojo/azul de
// la aberración, que de noche se funden con el fondo, quedan flotando sobre la
// tinta. Era la causa nº1 de que el tema claro "se viera sucio".
//
// La respuesta NO es apagar el overlay (el grano es la identidad del juego) ni
// invertirlo (un borde MÁS claro que el papel se lee como un fogonazo, no como
// una pantalla): es ATENUARLO y CAMBIAR SU COLOR. Un cromo viejo tiene los
// bordes tostados de tanto manoseo, no negros — así que en papel la viñeta ya no
// tira a negro sino a sepia, y los tres efectos bajan a un tercio.
uniform float paper : hint_range(0.0, 1.0) = 0.0;
// A dónde va el borde en modo papel. Multiplica al color de debajo, así que es
// un TINTE, no una tinta: mantiene la textura y sólo la entona.
const vec3 PAPER_EDGE = vec3(0.62, 0.52, 0.38);
// Cuánto queda de cada efecto sobre papel. Medido a ojo sobre las capturas de
// AJUSTES, que es la pantalla con más blanco seguido.
const float PAPER_KEEP = 0.34;

void fragment() {
	vec2 cc = SCREEN_UV - 0.5;
	float dist = dot(cc, cc);
	vec2 uv = SCREEN_UV;

	float keep = mix(1.0, PAPER_KEEP, paper);

	// Aberración cromática que crece hacia los bordes.
	vec2 ab_off = cc * dist * aberration * keep * 0.012;
	vec3 col;
	col.r = texture(screen_tex, uv + ab_off).r;
	col.g = texture(screen_tex, uv).g;
	col.b = texture(screen_tex, uv - ab_off).b;

	// Scanlines horizontales sutiles.
	col *= 1.0 - scan_strength * keep * (0.5 + 0.5 * sin(uv.y * scan_lines * 6.2831853));

	// Viñeta: de noche hacia negro, en papel hacia el sepia del borde gastado.
	// `mix(col, col * destino, v)` es la forma general del `col *= 1.0 - v` de
	// antes (con destino negro son idénticos), y es lo que permite entonar.
	vec3 edge = mix(vec3(0.0), PAPER_EDGE, paper);
	col = mix(col, col * edge, vignette_strength * keep * smoothstep(0.12, 0.7, dist));

	COLOR = vec4(col, 1.0);
}
