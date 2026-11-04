// BRILLO QUE BARRE un botón: una banda de luz inclinada que cruza de izquierda a
// derecha, se apaga, y vuelve a pasar. Nació como el "resaltador animado" del botón
// de VALORAR EL JUEGO en la portada (ui/main_menu.gd), que lo perdió al fundirse en
// la fila de difusión; desde el 2026-09-19 marca el PUESTO EN USO de la columna de
// puestos del cromo (`PlayerCard._brillo`): Cesar pidió que ese resaltado fuera un
// EFECTO y no un color.
//
// Va en SHADER y no en un Tween sobre un TextureRect por el recorte: el botón
// tiene esquinas REDONDEADAS (UiKit.BTN_RADIUS), y un nodo hijo se recorta contra
// un rectángulo, así que la banda asomaría por las cuatro esquinas sobre el fondo.
// Aquí la máscara es la SDF del rectángulo redondeado, que es la forma real del
// botón, y de paso el borde de la banda sale suavizado en vez de con escalón.
//
// El movimiento lo lleva TIME y no un Tween: no hay nada que tejer, destejer ni
// resincronizar cuando la portada se repinta al cambiar de idioma, y no cuesta un
// solo frame de CPU en el móvil.
shader_type canvas_item;
render_mode blend_add;

// El tamaño del control EN PÍXELES. Hace falta para medir la SDF y el radio en las
// mismas unidades; lo pone quien crea el material en cada `resized`.
uniform vec2 rect_size = vec2(1000.0, 92.0);
uniform float radius = 14.0;          // UiKit.BTN_RADIUS
uniform vec4 tint : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float strength : hint_range(0.0, 1.0) = 0.5;
uniform float period = 3.2;           // ciclo completo: barrido + pausa
uniform float duty : hint_range(0.05, 1.0) = 0.28;   // parte del ciclo que barre
uniform float band : hint_range(0.02, 0.5) = 0.16;   // ancho de la banda (en UV)
uniform float skew = 0.35;            // inclinación: 0 = vertical
// LA OLA: desfase del ciclo según dónde cae el pixel en PANTALLA (0 = todos a la
// vez, que es lo de la portada). Existe por los cromos: once pastillas destellando
// al unísono en la cancha se leían como un parpadeo de la interfaz, y con el ciclo
// corrido según la posición la luz RECORRE el once, como un reflejo sobre cromos de
// verdad. Sale de `SCREEN_UV` y no de un uniform por cromo: nadie tiene que saber
// dónde quedó cada tarjeta, ni recalcularlo cuando la cancha la recoloca.
uniform float wave = 0.0;

void fragment() {
	// Máscara: dentro del rectángulo redondeado, 1; fuera, 0. La SDF clásica —
	// distancia al rectángulo encogido por el radio, menos el radio.
	vec2 half_size = rect_size * 0.5;
	vec2 d = abs(UV * rect_size - half_size) - (half_size - vec2(radius));
	float sdf = length(max(d, vec2(0.0))) + min(max(d.x, d.y), 0.0) - radius;
	float mask = 1.0 - smoothstep(-1.5, 0.5, sdf);

	// La banda: `t` recorre el ciclo; sólo la fracción `duty` de él la dibuja, el
	// resto es la pausa entre pasadas (sin pausa se lee como una luz estroboscópica).
	float t = fract(TIME / period - wave * (SCREEN_UV.x + SCREEN_UV.y * 0.5));
	float s = t / duty;
	float head = mix(-band, 1.0 + band, s);
	// La inclinación desplaza la banda según la altura: así cruza en diagonal, que
	// es como se lee un reflejo, y no como una persiana bajando de lado.
	float x = UV.x + (UV.y - 0.5) * skew;
	float g = s <= 1.0 ? smoothstep(band, 0.0, abs(x - head)) : 0.0;

	COLOR = vec4(tint.rgb, mask * g * strength);
}
