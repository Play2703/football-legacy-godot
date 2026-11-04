// EL ARO SE DESCARGA (2026-08-06, pedido del usuario: «que el aro en vez de cambiar
// de color saliera como si se fuera descargando»).
//
// El desgaste del regate (`Duel.tire_step`) es una BATERÍA por jugada: sólo baja y
// no se recupera. Antes se leía como un TINTE (metal → rojo) y el usuario no lo veía;
// ahora se lee como lo que es: el anillo se APAGA girando, igual que se vacía una
// carga. El arco vivo arranca en las 12 y se come en el sentido del reloj.
//
// Va en shader y no re-horneando la textura por fotograma a propósito: el horno del
// aro (`match._make_bracket_texture`) es un bucle de 256×256 píxeles (~1 ms) y esto
// corre CADA fotograma mientras conduces. La textura sigue siendo la misma de siempre
// —banda del aro + el escalonado de `near_bias`— y aquí sólo se decide, por téxel, si
// cae en el tramo vivo o en el gastado.
shader_type spatial;
render_mode unshaded, cull_disabled;

// La textura del aro: sólo aporta la BANDA (su alfa) y el apagado de la mitad lejana.
uniform sampler2D aro : filter_nearest, source_color;
// El color vivo: tu metal (bronce/plata/oro/diamante) o el dorado de apuntado.
uniform vec4 col_vivo : source_color = vec4(1.0);
// El FANTASMA del tramo gastado. Su alfa es RELATIVA al alfa del tramo vivo: no se
// borra del todo porque el aro sigue siendo el BLANCO que acepta el dedo — un círculo
// a medias se leería como que ya no puedes tocar.
uniform vec4 col_gasto : source_color = vec4(0.0, 0.0, 0.0, 0.35);
// Carga restante 0..1 (ver match._ring_charge).
uniform float carga : hint_range(0.0, 1.0) = 1.0;
// El alfa del latido (ver match._pulse_drive_ring), que multiplica todo.
uniform float latido : hint_range(0.0, 1.0) = 1.0;
// Ancho del frente de descarga, en vueltas. Fino: es un corte, no un degradado —
// pero cero daría un canto que titila al girar la cámara.
uniform float frente = 0.012;

void fragment() {
	float a = texture(aro, UV).a;
	vec2 p = UV - vec2(0.5);
	// 0 en las 12 y creciendo en el sentido del reloj. La UV.y del quad crece hacia
	// la mitad CERCANA de la cámara (así la hornea `_make_bracket_texture`), o sea
	// hacia abajo en pantalla: por eso el arriba es -p.y.
	float ang = atan(p.x, -p.y);
	float t = fract(ang / TAU + 1.0);
	float vivo = 1.0 - smoothstep(carga - frente, carga + frente, t);
	ALBEDO = mix(col_gasto.rgb, col_vivo.rgb, vivo);
	ALPHA = a * latido * mix(col_gasto.a, 1.0, vivo);
}
