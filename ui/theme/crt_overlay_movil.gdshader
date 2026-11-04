shader_type canvas_item;
// EL CRT DEL MÓVIL (D1 Android, 2026-10-04). Hermano de `crt_overlay.gdshader` SIN
// `hint_screen_texture`: leer la pantalla obliga al motor a copiar el fotograma entero a
// una textura antes de pintar el overlay (1080×1920, 60 veces por segundo), y en una GPU
// de móvil (Adreno 610) era el coste fijo más gordo de cualquier menú. Aquí no se lee
// nada: las líneas y la viñeta salen como un FACTOR que se multiplica encima
// (`blend_mul`), que es exactamente lo que hacían en el original (`col *= …`). Lo que se
// pierde es la aberración cromática, que desplaza canales y necesita leer; a la densidad
// de píxel de un teléfono no se distingue. Mismos uniformes y mismas constantes que el
// original para que `CareerTheme.crt_paper` y los ajustes valgan igual.
render_mode blend_mul;

uniform float scan_lines = 360.0;
uniform float scan_strength = 0.1;
uniform float vignette_strength = 0.3;
// 1.0 en el tema claro (papel): los efectos bajan a un tercio y la viñeta tira a sepia.
uniform float paper = 0.0;

const vec3 PAPER_EDGE = vec3(0.62, 0.52, 0.38);
const float PAPER_KEEP = 0.34;

void fragment() {
	vec2 uv = SCREEN_UV;
	float keep = mix(1.0, PAPER_KEEP, paper);
	float scan = 1.0 - scan_strength * keep * (0.5 + 0.5 * sin(uv.y * scan_lines * 6.2831853));
	float dist = distance(uv, vec2(0.5));
	vec3 edge = mix(vec3(0.0), PAPER_EDGE, paper);
	vec3 vig = mix(vec3(1.0), edge, vignette_strength * keep * smoothstep(0.12, 0.7, dist));
	// Alfa 1: con `blend_mul` lo que cuenta es el color, y un factor de 1 deja el píxel igual.
	COLOR = vec4(vig * scan, 1.0);
}
