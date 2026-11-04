// EL EFECTO DE CADA DIFICULTAD (2026-10-07, Cesar: «agrega animaciones y colores más
// cool para diferenciar los botones de dificultad, por ejemplo extremo que tenga llamas
// de fuego en pixel»). Un efecto por peldaño, que crece con el nivel igual que el
// semáforo (`CareerUi.dif_colors`), para que la escala se lea antes que el rótulo:
//   0 FÁCIL   · BRISA:  césped de píxel que se mece en la base y polen que flota.
//   1 NORMAL  · CHISPA: un brillo que cruza en diagonal y alguna mota amarilla.
//   2 DIFÍCIL · BRASAS: calor rojo que late en la base y brasas que suben rápido.
//   3 EXTREMO · FUEGO:  llamas de verdad desde la base, con su núcleo amarillo, y
//                       chispas que saltan por encima.
//
// TODO EN PÍXEL: la rejilla del efecto es de `pix` px del control, no la del
// framebuffer, para que case con la pixel-font y los sprites — un fuego liso al lado
// de letras de Press Start se leería como de otro juego. Los colores del fuego van en
// CUATRO bandas fijas (núcleo, medio, borde y la punta en el magenta de EXTREMO), que
// es como se pinta el fuego a mano en pixel art; un degradado continuo lo delataría.
//
// Va en SHADER y no en partículas ni Tweens por lo mismo que `shine_sweep.gdshader`:
// el botón tiene esquinas redondeadas y la máscara es su SDF (nada asoma por las
// esquinas), el movimiento lo lleva TIME (cero CPU en el móvil y nada que resincronizar
// al repintar) y un material son cuatro uniforms, no un sistema de partículas por botón.
//
// Los colores llegan por uniform desde `CareerTheme` (el semáforo y `FUEGO_*`): aquí no
// se declara ninguno, que es la regla de la paleta.
shader_type canvas_item;

uniform vec2 rect_size = vec2(1000.0, 260.0);   // el tamaño del control EN PÍXELES
uniform float radius = 14.0;                     // UiKit.BTN_RADIUS
uniform int nivel = 0;                           // Settings.DIF_*
// 0 = apagado · ~0.4 = el peldaño que no está puesto (se ve, pero no compite) · 1 =
// el elegido · >1 = el golpe de elegirlo, que se desinfla a 1 (`CareerUi.dif_fx_golpe`).
uniform float fuerza : hint_range(0.0, 2.5) = 1.0;
uniform float sel = 0.0;          // 1 si el botón va relleno de su color (las motas se aclaran)
uniform float pix = 6.0;          // lado del píxel del efecto, en px del control
uniform float alto = 0.55;        // fracción del alto que ocupa el fuego / el calor
uniform float vel = 1.0;          // 0 = quieto (`Settings.reduce_motion`)
uniform float semilla = 0.0;      // desfase por botón: dos fuegos idénticos se leen como copia
uniform vec4 c_tono : source_color = vec4(1.0);
uniform vec4 c_nucleo : source_color = vec4(1.0);
uniform vec4 c_medio : source_color = vec4(1.0);
uniform vec4 c_borde : source_color = vec4(1.0);

float hash(vec2 p) {
	return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

float vnoise(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	vec2 u = f * f * (3.0 - 2.0 * f);
	return mix(mix(hash(i), hash(i + vec2(1.0, 0.0)), u.x),
		mix(hash(i + vec2(0.0, 1.0)), hash(i + vec2(1.0, 1.0)), u.x), u.y);
}

float fbm(vec2 p) {
	float a = 0.5;
	float s = 0.0;
	for (int k = 0; k < 4; k++) {
		s += a * vnoise(p);
		p *= 2.03;
		a *= 0.5;
	}
	return s;
}

// MOTAS / BRASAS / CHISPAS: una por carril de `carril` celdas (sólo en los carriles
// que pasan el sorteo de `densidad`), que sube de la base a lo alto en un ciclo y se
// mece de lado. Devuelve el brillo de la celda (0 si no hay mota en ella). `vida`
// elige cómo se apaga: 0 se enciende y apaga en arco (la mota que flota), 1 nace
// encendida y se va apagando al subir (la brasa que se enfría).
float motas(vec2 celda, float t, float carril, float rapidez, float densidad,
		float mecida, float vida, float sal) {
	float filas = rect_size.y / pix;
	float c = floor(celda.x / carril);
	float h = hash(vec2(c, 7.31 + sal + semilla));
	if (h > densidad) {
		return 0.0;
	}
	float h2 = hash(vec2(c, 19.7 + sal));
	float ph = fract(t * rapidez * (0.6 + h2) + h * 13.0);
	float fy = floor(filas * (1.0 - ph));
	float fx = c * carril + floor(carril * 0.5 + sin(t * 1.7 + h2 * 20.0) * carril * mecida);
	float on = step(abs(celda.x - fx), 0.5) * step(abs(celda.y - fy), 0.5);
	float b = mix(sin(ph * 3.14159), 1.0 - ph, vida);
	return on * b;
}

void fragment() {
	// La máscara, con la forma REAL del botón (SDF del rectángulo redondeado), en
	// píxeles de verdad para que la esquina salga lisa aunque el efecto vaya en celdas.
	vec2 half_size = rect_size * 0.5;
	vec2 d = abs(UV * rect_size - half_size) - (half_size - vec2(radius));
	float sdf = length(max(d, vec2(0.0))) + min(max(d.x, d.y), 0.0) - radius;
	float mask = 1.0 - smoothstep(-1.5, 0.5, sdf);

	vec2 celda = floor(UV * rect_size / pix);
	vec2 q = (celda + 0.5) * pix;
	float y = 1.0 - q.y / rect_size.y;     // 0 en la base, 1 arriba
	float x = q.x / rect_size.y;           // en unidades de ALTO: el ruido no se estira con el ancho
	float t = TIME * vel + semilla * 17.0;
	float f = clamp(fuerza, 0.0, 1.0);
	float extra = max(fuerza - 1.0, 0.0);  // el golpe de elegirlo
	vec3 claro = mix(c_tono.rgb, vec3(1.0), 0.55 * sel);

	vec4 col = vec4(0.0);

	if (nivel == 3) {
		// FUEGO. El ruido sube con el tiempo (se muestrea más abajo cuanto más avanza),
		// se enfría con la altura y cada columna tiene su lengua, que es lo que lo hace
		// llama y no niebla. El golpe sube el calor y la llama crece de golpe.
		float h = y / max(alto * (0.55 + 0.45 * f + 0.35 * extra), 0.01);
		float n = fbm(vec2(x * 5.0, y * 3.2 - t * 2.4));
		float lengua = vnoise(vec2(x * 7.0 + 3.0, t * 1.3));
		float calor = n + 0.62 - h * (1.25 - 0.35 * lengua) + 0.25 * extra;
		calor *= mix(0.55, 1.0, f);
		if (calor > 0.74) {
			col = vec4(c_nucleo.rgb, 1.0);
		} else if (calor > 0.58) {
			col = vec4(c_medio.rgb, 1.0);
		} else if (calor > 0.44) {
			col = vec4(c_borde.rgb, 1.0);
		} else if (calor > 0.33) {
			col = vec4(c_tono.rgb, 0.9);
		}
		// Chispas que saltan POR ENCIMA de la llama.
		float ch = motas(celda, t, 3.0, 0.55, 0.45 + 0.3 * f, 0.5, 1.0, 1.0);
		if (col.a == 0.0 && ch > 0.15 && y > alto * 0.35) {
			col = vec4(mix(c_medio.rgb, c_nucleo.rgb, ch), ch * f);
		}
	} else if (nivel == 2) {
		// BRASAS. Un calor que LATE en la base (dos bandas, borde y punta) y brasas que
		// suben deprisa. Sin llama: la llama es el peldaño de arriba.
		float latido = 0.5 + 0.5 * sin(t * 3.4);
		float n = fbm(vec2(x * 6.0, y * 2.0 - t * 0.8));
		float calor = (n * 0.55 + 0.6 - y / max(alto * 0.45, 0.01)) * mix(0.6, 1.0, f)
			+ 0.08 * latido + 0.2 * extra;
		if (calor > 0.62) {
			col = vec4(c_medio.rgb, 0.85);
		} else if (calor > 0.45) {
			col = vec4(c_borde.rgb, 0.7);
		}
		float b = motas(celda, t, 3.0, 0.42, 0.3 + 0.3 * f, 0.25, 1.0, 2.0);
		if (b > 0.1) {
			col = vec4(b > 0.6 ? c_medio.rgb : c_borde.rgb, b * (0.5 + 0.5 * f));
		}
	} else if (nivel == 1) {
		// CHISPA. La banda de luz de `shine_sweep` en celdas, y alguna mota.
		float periodo = 2.6;
		float ph = fract(t / periodo);
		float s = ph / 0.32;
		float cabeza = mix(-0.2, 1.2, s);
		float u = (q.x / rect_size.x) + (0.5 - y) * 0.35;
		float banda = s <= 1.0 ? step(abs(u - cabeza), 0.05) : 0.0;
		if (banda > 0.0) {
			col = vec4(mix(claro, vec3(1.0), 0.5), 0.45 * f + 0.3 * extra);
		}
		float m = motas(celda, t, 5.0, 0.2, 0.3 + 0.2 * f, 0.4, 0.0, 3.0);
		if (m > 0.2) {
			col = vec4(claro, m * (0.6 + 0.4 * f));
		}
	} else {
		// BRISA. Césped de píxel en la base —es un juego de fútbol: lo tranquilo es la
		// hierba— que se mece más arriba que abajo, como una brizna de verdad, y polen
		// que flota. Sobre el botón relleno de verde, la hierba va en verde oscuro.
		float filas = rect_size.y / pix;
		float rb = floor((rect_size.y - q.y) / pix);   // fila contando desde la base
		float hmax = max(2.0, floor(filas * alto * 0.4 * (0.6 + 0.4 * f + 0.3 * extra)));
		float vaiven = sin(t * 1.4 + celda.x * 0.18) * (rb / hmax) * 1.4;
		float c0 = celda.x - floor(vaiven + 0.5);
		float hb = floor(hmax * (0.35 + 0.65 * hash(vec2(c0, 3.3 + semilla))));
		if (hash(vec2(c0, 5.1)) < 0.7 && rb < hb) {
			vec3 verde = sel > 0.5 ? c_tono.rgb * 0.55 : c_tono.rgb;
			col = vec4(mix(verde * 0.6, verde, rb / max(hb, 1.0)), 0.9);
		}
		float m = motas(celda, t, 6.0, 0.12, 0.35 + 0.25 * f, 0.9, 0.0, 4.0);
		if (m > 0.2) {
			col = vec4(claro, m * (0.6 + 0.4 * f));
		}
	}

	// El peldaño en reposo se ve a algo más de media voz; el tamaño del efecto (la
	// llama, la hierba, cuántas motas) ya lo encoge `f` arriba.
	COLOR = vec4(col.rgb, fuerza <= 0.0 ? 0.0 : col.a * mask * (0.55 + 0.45 * f));
}
