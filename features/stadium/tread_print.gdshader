shader_type spatial;
render_mode blend_mix, cull_disabled, unshaded, depth_draw_never;

// LA HUELLA QUE SE BORRA (2026-08-16, encargo del usuario: «se deben ir borrando
// en el clima de lluvia»). Ver el bloque TREAD_PRINTS de stadium.gd.
//
// EL DESVANECIDO VIVE AQUÍ Y NO EN GDSCRIPT, y no es una preferencia: son 2048
// instancias y bajarles el alfa por fotograma desde el CPU serían 2048 escrituras
// al buffer del MultiMesh SESENTA VECES POR SEGUNDO, en un juego de móvil, para
// animar algo que la GPU ya sabe hacer gratis. Aquí cuesta una resta por píxel
// dibujado, y sólo se dibujan los píxeles que ya se estaban dibujando.
//
// El reloj lo manda el CPU (`tread_now`) en vez de usar el TIME del shader a
// propósito: TIME va con `Engine.time_scale`, y el partido lo toca —el hit-stop
// de `MatchFx` mete cámaras lentas—, así que un rastro atado a TIME se borraría
// más despacio justo en las jugadas importantes. La edad de cada huella se
// guarda en INSTANCE_CUSTOM.x, que es un dato POR INSTANCIA: no hace falta una
// llamada por huella, se escribe una vez al nacer y ya.

uniform sampler2D suela : filter_linear, source_color;
// Segundos desde que arrancó el estadio, puestos por `Stadium._tick_tread`.
uniform float tread_now = 0.0;
// Cuánto tarda una huella en desaparecer. CERO = no se borra nunca, que es el
// caso de la NIEVE: la nieve no lava nada, y de hecho su máscara de desgaste
// tampoco se borra en todo el partido. Sólo la lluvia arrastra el barro.
uniform float tread_fade = 0.0;

varying float nacio;

void vertex() {
	nacio = INSTANCE_CUSTOM.x;
}

void fragment() {
	vec4 t = texture(suela, UV);
	float a = t.a * COLOR.a;
	if (tread_fade > 0.0) {
		// Lineal y no una curva: lo que se quiere es que el rastro CUENTE la
		// jugada —lo más viejo más pálido— y una caída con rodilla dejaría la
		// mitad del rastro plano y luego un salto.
		a *= clamp(1.0 - (tread_now - nacio) / tread_fade, 0.0, 1.0);
	}
	ALBEDO = COLOR.rgb;
	ALPHA = a;
}
