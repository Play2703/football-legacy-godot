shader_type spatial;
render_mode unshaded, blend_mix, depth_draw_never, cull_disabled, shadows_disabled;

// Mancha de contacto sobre el suelo: no recibe un tinte verde de la luz ni
// conserva un borde de disco durante el vuelo. La altura controla intensidad.
uniform float intensidad : hint_range(0.0, 1.0) = 0.24;

void fragment() {
	float distancia = length((UV - vec2(0.5)) * 2.0);
	float nucleo = exp(-distancia * distancia * 3.6);
	float borde = 1.0 - smoothstep(0.55, 1.0, distancia);
	ALBEDO = vec3(0.10, 0.09, 0.08);
	ALPHA = intensidad * nucleo * borde;
}
