shader_type spatial;
render_mode diffuse_burley, specular_schlick_ggx;

// Coordenadas locales: no hay unión de UV ni textura que se quede fija al
// girar. Los tres círculos mayores dividen el cuero en ocho paneles curvos.
uniform vec3 naranja : source_color = vec3(0.906, 0.529, 0.188);
uniform vec3 costura : source_color = vec3(0.157, 0.125, 0.098);
uniform float radio = 0.115;
varying vec3 superficie;

float hash_cuero(vec3 p) {
	p = fract(p * 0.1031);
	p += dot(p, p.yzx + 33.33);
	return fract((p.x + p.y) * p.z);
}

float ruido_cuero(vec3 p) {
	vec3 celda = floor(p);
	vec3 f = fract(p);
	f = f * f * (3.0 - 2.0 * f);
	float abajo = mix(mix(hash_cuero(celda), hash_cuero(celda + vec3(1.0, 0.0, 0.0)), f.x),
		mix(hash_cuero(celda + vec3(0.0, 1.0, 0.0)), hash_cuero(celda + vec3(1.0, 1.0, 0.0)), f.x), f.y);
	float arriba = mix(mix(hash_cuero(celda + vec3(0.0, 0.0, 1.0)), hash_cuero(celda + vec3(1.0, 0.0, 1.0)), f.x),
		mix(hash_cuero(celda + vec3(0.0, 1.0, 1.0)), hash_cuero(celda + vec3(1.0, 1.0, 1.0)), f.x), f.y);
	return mix(abajo, arriba, f.z);
}

void vertex() {
	superficie = VERTEX / radio;
}

void fragment() {
	vec3 n = normalize(superficie);
	float distancia = min(abs(n.x), min(abs(n.y), abs(n.z)));
	// La suavidad sigue al píxel: conserva una línea fina desde cerca y evita
	// dientes o destellos en las costuras cuando el balón es pequeño.
	float suavidad = max(fwidth(distancia) * 0.75, 0.002);
	float canal = 1.0 - smoothstep(0.014 - suavidad, 0.014 + suavidad, distancia);
	float borde = 1.0 - smoothstep(0.024 - suavidad, 0.024 + suavidad, distancia);
	vec3 trama = n * 60.0;
	float detalle = 1.0 - smoothstep(0.6, 1.8, length(fwidth(trama)));
	float grano = ruido_cuero(trama);
	float tono = ruido_cuero(n * 7.0);
	vec3 cuero = naranja * (1.0 + (tono - 0.5) * 0.04 + (grano - 0.5) * detalle * 0.12);
	cuero *= 1.0 - borde * 0.10;
	ALBEDO = mix(cuero, costura, canal);
	METALLIC = 0.0;
	ROUGHNESS = mix(0.85 + (grano - 0.5) * detalle * 0.06, 0.94, canal);
	SPECULAR = 0.28;

	// Relieve muy bajo del cuero y una ranura hundida, sobre la misma esfera.
	// El gradiente se calcula en vista y funciona sin mapas normales ni UV.
	float altura = radio * ((grano - 0.5) * detalle * 0.0018 - canal * 0.012);
	vec3 dx = dFdx(VERTEX);
	vec3 dy = dFdy(VERTEX);
	vec3 cruz_x = cross(dy, NORMAL);
	vec3 cruz_y = cross(NORMAL, dx);
	float area = dot(dx, cruz_x);
	vec3 gradiente = (cruz_x * dFdx(altura) + cruz_y * dFdy(altura)) / max(abs(area), 0.00000001);
	NORMAL = normalize(NORMAL - gradiente * sign(area));
}
