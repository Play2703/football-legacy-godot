shader_type spatial;
render_mode unshaded, cull_disabled;
// Veta adherida al alero: brillo descendente, sin transparencia ni partículas.
uniform float occ_alpha = 1.0;
varying vec3 sitio;
void vertex() { sitio = VERTEX; }
void fragment() {
	if (occ_alpha < 0.5) { discard; }
	float pulso = smoothstep(0.6, 0.9, fract(sitio.y * 5.0 + TIME * 2.2 + sitio.x));
	ALBEDO = mix(vec3(0.25, 0.32, 0.36), vec3(0.62, 0.72, 0.75), pulso);
}
