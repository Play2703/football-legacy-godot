shader_type spatial;
render_mode blend_mix, cull_disabled, diffuse_burley, specular_schlick_ggx;
// Coordenadas del vaso, no del mundo: la corriente gira con el mueble.
// Reloj explícito para respetar pausa y reproducir las capturas cuadro a cuadro.
uniform float tiempo = 0.0;
uniform bool holograma = false;
uniform vec3 tinte : source_color = vec3(1.0);
uniform float opacidad : hint_range(0.0, 1.0) = 1.0;
uniform sampler2D escena : hint_screen_texture, repeat_disable, filter_linear;
varying vec2 posicion_agua;
varying float elevacion;

float azar(vec2 p) {
	return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}
float ruido(vec2 p) {
	vec2 i = floor(p);
	vec2 f = fract(p);
	f = f*f*(3.0-2.0*f);
	return mix(mix(azar(i),azar(i+vec2(1.0,0.0)),f.x),
		mix(azar(i+vec2(0.0,1.0)),azar(i+vec2(1.0)),f.x),f.y);
}
float envolvente(vec2 p) {
	return smoothstep(0.0,.22,2.07-abs(p.x))
		* smoothstep(0.0,.25,p.y+1.15) * smoothstep(0.0,.25,1.20-p.y);
}
float fase(vec2 p) {
	return p.y*2.85+tiempo*1.72+.19*sin(p.x*2.4-tiempo*.51);
}
float altura(vec2 p) {
	float f = fase(p);
	// Dos armónicos hacen una cresta estrecha y un seno amplio. Las ondas
	// cruzadas rompen la recta perfecta del antiguo muro de agua.
	float ola = .20+.175*sin(f)+.052*sin(2.0*f-.70);
	ola += .021*sin(p.x*5.2+p.y*2.1-tiempo*2.25);
	ola += .013*sin(p.x*8.3-p.y*4.2+tiempo*1.35);
	return .405+envolvente(p)*ola;
}
void vertex() {
	posicion_agua = VERTEX.xz+vec2(0.0,.025);
	VERTEX.z = posicion_agua.y;
	elevacion = altura(posicion_agua);
	VERTEX.y = elevacion;
	float dx = (altura(posicion_agua+vec2(.012,0.0))-altura(posicion_agua-vec2(.012,0.0)))/.024;
	float dz = (altura(posicion_agua+vec2(0.0,.012))-altura(posicion_agua-vec2(0.0,.012)))/.024;
	NORMAL = normalize(vec3(-dx,1.0,-dz));
	TANGENT = normalize(vec3(1.0,dx,0.0));
	BINORMAL = normalize(cross(NORMAL,TANGENT));
}
void fragment() {
	vec2 p = posicion_agua;
	vec2 corriente = p*vec2(8.0,6.0)+vec2(tiempo*.12,tiempo*1.6);
	float n = ruido(corriente)+.45*ruido(corriente*2.8+vec2(7.0,-tiempo));
	float detalle_x = sin(p.x*38.0+p.y*14.0+tiempo*3.1)*.12 + sin(p.x*68.0-p.y*30.0-tiempo*4.0)*.045;
	float detalle_z = cos(p.x*23.0-p.y*45.0+tiempo*3.7)*.12;
	NORMAL_MAP = normalize(vec3(detalle_x,detalle_z,1.0))*.5+.5;
	NORMAL_MAP_DEPTH = .65;
	float fresnel = .035+.55*pow(1.0-clamp(dot(normalize(NORMAL),normalize(VIEW)),0.0,1.0),4.0);
	// Refracción de la loza real, visible en la pasada opaca. Absorción mayor
	// bajo la cresta; en las orillas se conserva el mosaico del fondo.
	float profundidad = max(0.0,elevacion-.19);
	vec2 distorsion = vec2(detalle_x+NORMAL.x*.20,detalle_z+NORMAL.y*.12)*.012*profundidad;
	vec3 fondo = texture(escena,clamp(SCREEN_UV+distorsion,vec2(.001),vec2(.999))).rgb;
	vec3 absorcion = exp(-vec3(2.7,.65,.40)*profundidad);
	vec3 agua = fondo*absorcion + vec3(.012,.19,.23)*(1.0-absorcion);
	vec3 reflejo = mix(vec3(.09,.20,.25),vec3(.54,.72,.77),smoothstep(-.25,.75,NORMAL.y));
	agua = mix(agua,reflejo,fresnel);
	// Filamentos de luz y espuma de varias escalas. No hay bolas blancas
	// pegadas a la cresta: se forman manchas finas que el flujo deshace.
	vec2 q = p*14.0+vec2(sin(tiempo*.4),tiempo*.35);
	float red = abs(sin(q.x+sin(q.y+tiempo*.7))+sin(q.y*.91+sin(q.x-tiempo*.6)));
	float caustica = pow(max(0.0,1.0-red*.5),16.0)*.075;
	float cresta = smoothstep(.72,.985,sin(fase(p)));
	float espuma = smoothstep(.76,1.10,n+cresta*.26)*cresta*envolvente(p);
	float cola = smoothstep(.88,1.24,n)*smoothstep(.05,.70,sin(fase(p)+.55))*.27*envolvente(p);
	espuma = clamp(espuma+cola,0.0,1.0);
	vec3 color = mix(agua+vec3(.30,.65,.62)*caustica,vec3(.78,.88,.83),espuma*.86);
	ALBEDO = color;
	EMISSION = agua*.12+vec3(.17,.35,.31)*caustica;
	ROUGHNESS = mix(.16,.65,espuma);
	SPECULAR = .65;
	METALLIC = 0.0;
	ALPHA = opacidad;
	if (holograma) {
		ALBEDO = mix(mix(vec3(.07,.27,.32),vec3(.26,.65,.70),smoothstep(.40,.90,elevacion)),tinte,.28);
		EMISSION = vec3(0.0);
		ALPHA = .88;
	}
}
