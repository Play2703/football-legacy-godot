// Fondo de los menús: color liso del club con un degradado vertical suave y
// franjas diagonales muy tenues que se desplazan despacio. La idea es que se
// note vivo sin competir con la UI, así que todo el contraste es mínimo.
// La fase (flow_phase) la avanza menu_background.gd cada frame en vez de usar
// TIME, para poder pausarla o interpolarla al cambiar de club.
//
// NOTA: este es el fondo COMÚN (hub y el resto de pantallas). El menú principal
// usa su propio fondo de estadio 2D (ui/theme/menu_stadium_bg.gdshader).
shader_type canvas_item;

uniform vec4 colour_top : source_color = vec4(0.09, 0.24, 0.45, 1.0);
uniform vec4 colour_bottom : source_color = vec4(0.03, 0.08, 0.14, 1.0);
uniform float stripe_strength = 0.035;  // contraste de las franjas (muy bajo)
uniform float stripe_scale = 9.0;       // cuántas franjas caben en pantalla
uniform float flow_phase = 0.0;

void fragment() {
	vec2 uv = SCREEN_UV;

	// Base: degradado vertical, más claro arriba.
	vec4 col = mix(colour_top, colour_bottom, smoothstep(0.0, 1.0, uv.y));

	// Franjas diagonales anchas desplazándose lento en diagonal.
	float band = sin((uv.x + uv.y) * stripe_scale - flow_phase * 0.35);
	col.rgb += band * stripe_strength;

	// Segunda onda a otra frecuencia para que el patrón no se lea repetitivo.
	float band2 = sin((uv.x - uv.y * 1.6) * (stripe_scale * 0.45) + flow_phase * 0.22);
	col.rgb += band2 * stripe_strength * 0.5;

	// Viñeta suave: oscurece los bordes para que la UI del centro resalte.
	float vig = distance(uv, vec2(0.5)) * 1.15;
	col.rgb *= 1.0 - smoothstep(0.35, 1.0, vig) * 0.45;

	COLOR = vec4(col.rgb, 1.0);
}
