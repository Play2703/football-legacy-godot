// LA PANTALLA DEL VIDEOMARCADOR (2026-09-05). La textura viene de un SubViewport 2D,
// que entrega sus colores en sRGB; un StandardMaterial3D la lee como si fuera lineal,
// así que el negro del tablero salía GRIS y con la emisión de noche (0,4 + ads_led
// 1,6 = 2,0) el mueble entero se iba a blanco (medido en `_tmp_luces`, tres
// capturas). Aquí se decodifica a mano (pow 2.2) antes de pintar y de emitir.
shader_type spatial;
render_mode cull_back;

uniform sampler2D screen : source_color, filter_linear;
uniform float energy = 0.4;
uniform float rough = 0.6;

void fragment() {
	vec3 c = texture(screen, UV).rgb;
	ALBEDO = c;
	EMISSION = c * energy;
	ROUGHNESS = rough;
	METALLIC = 0.0;
}
