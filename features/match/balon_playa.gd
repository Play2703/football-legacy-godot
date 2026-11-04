class_name BalonPlaya
extends Node3D

































signal boto(fuerza: float, pos: Vector3)


signal cayo(pos: Vector3)




const R: float = 0.4





const ENTRA_ARCOS: Array[Vector2] = [Vector2(1.35, 3.6), Vector2(0.45, 0.85),
	Vector2(0.26, 0.22)]


const ENTRA_BOTE1_M: float = 1.7
const ENTRA_BOTE2_M: float = 0.45


const ENTRA_Z: float = -8.0
const ENTRA_Y: float = 3.2




const ENTRA_INTENTOS: int = 10
const ENTRA_BOTE_Z_MIN: float = 0.6
const ENTRA_HOLGURA: float = 0.08
const ENTRA_MUESTRAS: int = 48


const ENTRA_GIRO: float = 5.0

const G: float = 9.8




const VT: float = 7.0


const REBOTE_E: float = 0.62
const REBOTE_ROCE: float = 0.85
const BOTE_MIN_V: float = 0.9


const ROCE_SUELO: float = 1.8
const PARADO_V: float = 0.12




const EMPUJE: float = 1.45
const ARRASTRE: float = 0.15
const SALTO_GOLPE: float = 2.5
const V_MAX: float = 38.0


const EMPUJE_CD: float = 0.25


const VAIVEN_A: float = 0.1
const VAIVEN_HZ: float = 0.55


const VAIVEN_ENTRA_S: float = 1.0


const MURO_Z: float = -7.5 + R
const MURO_X: float = Stadium.AD_RING_X - R

const SOMBRA_A: float = 0.55
const SOMBRA_Y: float = 0.02



const GAJOS: Array[Color] = [Color("e8382f"), Color("f6f4ee"), Color("f8c630"),
	Color("f6f4ee"), Color("2f6fd8"), Color("f6f4ee")]
const TAPA_COL: Color = Color("f6f4ee")

const TAPA_V: float = 0.11


const CUERPO_GIRO: Vector3 = Vector3(1.05, 0.0, 0.4)
const RETRATO_PX: int = 64

enum Estado{ENTRA, QUIETO, SUELTO, GOLPEADO}

var _estado: int = Estado.QUIETO

var _reposo: Vector3 = Vector3(0.0, R, 0.0)

var _red: Vector3 = Vector3(3.66, 2.44, 2.1)
var _vel: Vector3 = Vector3.ZERO

var _w: Vector3 = Vector3.ZERO
var _t: float = 0.0
var _quieto_t: float = 0.0
var _empuje_cd: float = 0.0

var _arco: int = 0
var _ta: float = 0.0
var _puntos: Array[Vector3] = []
var _cayo: bool = false

var _en_red: bool = false

var _dormido: bool = false

var _vaiven: Node3D = null
var _cuerpo: MeshInstance3D = null
var _sombra: MeshInstance3D = null
var _fase: float = 0.0



var _rng: RandomNumberGenerator = RandomNumberGenerator.new()


func _init() -> void:
	_rng.randomize()
	_fase = _rng.randf() * TAU
	_armar()














static func entrada(reposo: Vector3, red: Vector3,
		rng: RandomNumberGenerator) -> Array[Vector3]:
	var fin: Vector3 = Vector3(reposo.x, R, reposo.z)
	for i in ENTRA_INTENTOS:
		var ini: Vector3 = Vector3(reposo.x * 0.45 + rng.randf_range(-2.5, 2.5),
			ENTRA_Y, ENTRA_Z)
		var dir: Vector3 = Vector3(fin.x - ini.x, 0.0, fin.z - ini.z)
		dir = dir.normalized() if dir.length_squared() > 1e-06 else Vector3(0.0, 0.0, 1.0)
		var puntos: Array[Vector3] = [ini, fin - dir * ENTRA_BOTE1_M,
			fin - dir * ENTRA_BOTE2_M, fin]
		if entrada_libre(puntos, red):
			return puntos
	return []








static func entrada_libre(puntos: Array[Vector3], red: Vector3) -> bool:
	if puntos.size() != ENTRA_ARCOS.size() + 1:
		return false
	for k in range(1, puntos.size()):
		if puntos[k].z < ENTRA_BOTE_Z_MIN:
			return false
	for k in ENTRA_ARCOS.size():
		for j in range(1, ENTRA_MUESTRAS):
			var p: Vector3 = entrada_en(puntos[k], puntos[k + 1], ENTRA_ARCOS[k].y,
				float(j) / float(ENTRA_MUESTRAS))
			if absf(p.x) < red.x + R and p.z > - red.z - R and p.z < R \
					and p.y - R < red.y + ENTRA_HOLGURA:
				return false
	return true




static func entrada_en(a: Vector3, b: Vector3, h: float, u: float) -> Vector3:
	var p: Vector3 = a.lerp(b, u)
	p.y += 4.0 * h * u *(1.0 - u)
	return p




func colocar(puntos: Array[Vector3], red: Vector3) -> void:
	_red = red
	_puntos = puntos.duplicate()
	_reposo = _puntos[_puntos.size() - 1]
	_estado = Estado.ENTRA
	_arco = 0
	_ta = 0.0
	position = _puntos[0]
	_pon_sombra()




func colocar_quieto(reposo: Vector3, red: Vector3) -> void:
	_red = red
	_reposo = Vector3(reposo.x, R, reposo.z)
	position = _reposo
	_estado = Estado.QUIETO
	_cayo = true
	_pon_sombra()







func centro() -> Vector3:
	if _estado == Estado.ENTRA:
		return _reposo
	return position





func vivo() -> bool:
	return _estado == Estado.ENTRA or _estado == Estado.QUIETO


func quieto() -> bool:
	return _estado == Estado.QUIETO


func golpeado() -> bool:
	return _estado == Estado.GOLPEADO




func empujable() -> bool:
	return (_estado == Estado.QUIETO or _estado == Estado.SUELTO) and _empuje_cd <= 0.0







func golpear(v_in: Vector3, punto: Vector3) -> void:
	if _estado == Estado.GOLPEADO:
		return
	if _estado == Estado.ENTRA:
		position = _reposo
	_suelta_vaiven()
	var n: Vector3 = position - punto
	if n.length_squared() > 1e-06:
		n = n.normalized()
	elif v_in.length_squared() > 1e-06:
		n = v_in.normalized()
	else:
		n = Vector3.UP
	var v: Vector3 = n * maxf(v_in.dot(n), 0.0) * EMPUJE + v_in * ARRASTRE
	v.y = maxf(v.y, 0.0) + SALTO_GOLPE
	if v.length() > V_MAX:
		v = v.normalized() * V_MAX
	_vel = v
	_estado = Estado.GOLPEADO
	_dormido = false


	var h: Vector3 = Vector3(v.x, 0.0, v.z)
	if h.length() > 0.1:
		_w = Vector3(h.z, 0.0, - h.x).normalized() * minf(h.length() / R, 40.0)





func empujar(dir: Vector3, v: float) -> void:
	if not empujable():
		return
	var h: Vector3 = Vector3(dir.x, 0.0, dir.z)
	if h.length_squared() < 1e-06:
		return
	_suelta_vaiven()
	_vel = h.normalized() * v + Vector3(0.0, v * 0.35, 0.0)
	_estado = Estado.SUELTO
	_empuje_cd = EMPUJE_CD



func avanza(dt: float) -> void:
	if dt <= 0.0:
		return
	_t += dt
	_empuje_cd = maxf(_empuje_cd - dt, 0.0)
	match _estado:
		Estado.ENTRA:
			_entra(dt)
		Estado.QUIETO:
			_quieto(dt)
		Estado.SUELTO, Estado.GOLPEADO:
			if not _dormido:
				_vuela(dt)
	_pon_sombra()


func _entra(dt: float) -> void:
	_ta += dt
	var arco: Vector2 = ENTRA_ARCOS[_arco]
	var u: float = clampf(_ta / arco.x, 0.0, 1.0)
	var a: Vector3 = _puntos[_arco]
	var b: Vector3 = _puntos[_arco + 1]
	position = entrada_en(a, b, arco.y, u)
	var h: Vector3 = Vector3(b.x - a.x, 0.0, b.z - a.z)
	if h.length_squared() > 1e-06:
		_rota(Vector3(h.z, 0.0, - h.x).normalized(), ENTRA_GIRO * dt)
	if u < 1.0:
		return


	var vy: float =((b.y - a.y) - 4.0 * arco.y) / arco.x
	boto.emit(minf(absf(vy), VT), position)
	if not _cayo:
		_cayo = true
		cayo.emit(position)
	_arco += 1
	_ta = 0.0
	if _arco >= ENTRA_ARCOS.size():
		position = _reposo
		_estado = Estado.QUIETO
		_quieto_t = 0.0


func _quieto(dt: float) -> void:
	position = _reposo
	_quieto_t += dt


	var k: float = clampf(_quieto_t / VAIVEN_ENTRA_S, 0.0, 1.0)
	var s: float = sin(_t * TAU * VAIVEN_HZ + _fase) * VAIVEN_A * k
	_vaiven.position = Vector3(s * R, 0.0, 0.0)
	_vaiven.rotation = Vector3(0.0, 0.0, - s)


func _vuela(dt: float) -> void:
	var prev: Vector3 = position
	var p: Vector3 = prev
	var v: Vector3 = _vel
	var suelo: float = _suelo_en(p)
	var rodando: bool = p.y <= suelo + 0.001 and absf(v.y) < BOTE_MIN_V
	if rodando:
		p.y = suelo
		v.y = 0.0
		var f: float = exp(- ROCE_SUELO * dt)
		v.x *= f
		v.z *= f
	else:
		v.y -= G * dt


		v /= 1.0 +(G /(VT * VT)) * v.length() * dt
	p += v * dt
	var res: Array = _contra_red(prev, p, v)
	p = res[0]
	v = res[1]
	suelo = _suelo_en(p)
	if p.y < suelo:
		p.y = suelo
		if v.y < - BOTE_MIN_V:
			boto.emit(- v.y, p)
			v.y = - v.y * REBOTE_E
			v.x *= REBOTE_ROCE
			v.z *= REBOTE_ROCE
		else:
			v.y = 0.0

	if p.z < MURO_Z:
		p.z = MURO_Z
		v.z = absf(v.z) * 0.2
		v.x *= 0.5
	if absf(p.x) > MURO_X:
		p.x = signf(p.x) * MURO_X
		v.x = - signf(p.x) * absf(v.x) * 0.2
		v.z *= 0.5
	position = p
	_vel = v
	_gira(dt, v, p.y <= suelo + 0.001 and absf(v.y) < 0.01)
	if p.y <= suelo + 0.001 and absf(v.y) < 0.01 \
			and Vector2(v.x, v.z).length() < PARADO_V:
		_vel = Vector3.ZERO
		_w = Vector3.ZERO
		if _estado == Estado.SUELTO:

			_reposo = Vector3(p.x, p.y, p.z)
			_estado = Estado.QUIETO
			_quieto_t = 0.0
		else:
			_dormido = true









func _suelo_en(p: Vector3) -> float:
	if not _en_red and p.z < 0.0 and p.z > - _red.z and absf(p.x) < _red.x \
			and p.y >= _red.y:
		return _red.y + R
	return R








func _contra_red(prev: Vector3, p: Vector3, v: Vector3) -> Array:
	if not _en_red and prev.z >= 0.0 and p.z < 0.0 and absf(p.x) < _red.x \
			and p.y < _red.y:
		_en_red = true
	elif _en_red and p.z > 0.0:
		_en_red = false
	if _en_red:
		if p.z < - _red.z + R:
			p.z = - _red.z + R
			v.z = absf(v.z) * 0.15
			v.x *= 0.6
			v.y *= 0.6
		if absf(p.x) > _red.x - R:
			p.x = signf(p.x) *(_red.x - R)
			v.x = - v.x * 0.2
		if p.y > _red.y - R:
			p.y = _red.y - R
			v.y = - absf(v.y) * 0.2
		return [p, v]
	var dentro_z: bool = p.z < 0.0 and p.z > - _red.z - R
	var bajo: bool = p.y < _red.y
	if dentro_z and bajo and absf(prev.x) >= _red.x + R and absf(p.x) < _red.x + R:
		p.x = signf(prev.x) *(_red.x + R)
		v.x = - v.x * 0.2
	if bajo and absf(p.x) < _red.x and prev.z <= - _red.z - R and p.z > - _red.z - R:
		p.z = - _red.z - R
		v.z = - v.z * 0.2
	return [p, v]




func _gira(dt: float, v: Vector3, en_suelo: bool) -> void:
	if en_suelo:
		var h: Vector3 = Vector3(v.x, 0.0, v.z)
		_w = Vector3(h.z, 0.0, - h.x) / R if h.length() > 0.01 else Vector3.ZERO
	else:
		_w *= exp(-0.6 * dt)
	var ang: float = _w.length() * dt
	if ang > 1e-05:
		_rota(_w.normalized(), ang)




func _rota(eje: Vector3, ang: float) -> void:
	_cuerpo.transform.basis =(Basis(eje, ang) * _cuerpo.transform.basis).orthonormalized()




func _suelta_vaiven() -> void:
	_vaiven.transform = Transform3D.IDENTITY
	_quieto_t = 0.0




func _pon_sombra() -> void:
	if _sombra == null:
		return
	_sombra.position = Vector3(0.0, SOMBRA_Y - position.y, 0.0)
	var alto: float = clampf((position.y - R) / 4.0, 0.0, 1.0)
	_sombra.scale = Vector3.ONE * lerpf(1.0, 1.5, alto)
	(_sombra.material_override as StandardMaterial3D).albedo_color.a = \
			SOMBRA_A * lerpf(1.0, 0.35, alto)


func _armar() -> void:
	_vaiven = Node3D.new()
	add_child(_vaiven)
	_cuerpo = MeshInstance3D.new()
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = R
	esfera.height = R * 2.0
	esfera.radial_segments = 32
	esfera.rings = 16
	_cuerpo.mesh = esfera
	var m: StandardMaterial3D = StandardMaterial3D.new()
	var tex: ImageTexture = ImageTexture.create_from_image(_textura())
	m.albedo_texture = tex


	m.roughness = 0.28
	m.metallic_specular = 0.7
	m.emission_enabled = true
	m.emission = Color.WHITE
	m.emission_texture = tex
	m.emission_energy_multiplier = 0.22
	_cuerpo.material_override = m


	_cuerpo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF



	_cuerpo.rotation = CUERPO_GIRO
	_vaiven.add_child(_cuerpo)
	_sombra = _armar_sombra()
	add_child(_sombra)






static func _textura() -> Image:
	var w: int = 128
	var h: int = 64
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for y in h:
		for x in w:
			img.set_pixel(x, y, _color_en((float(x) + 0.5) / float(w),
				(float(y) + 0.5) / float(h)))
	return img





static func _color_en(u: float, v: float) -> Color:
	if v < TAPA_V or v > 1.0 - TAPA_V:

		if absf(v - TAPA_V) < 0.025 or absf(v -(1.0 - TAPA_V)) < 0.025:
			return TAPA_COL.darkened(0.12)
		return TAPA_COL
	var n: int = GAJOS.size()
	var g: float = fposmod(u, 1.0) * float(n)
	var col: Color = GAJOS[int(g) % n]
	if minf(g - floorf(g), ceilf(g) - g) < 0.04:
		col = col.darkened(0.18)
	return col









func receta_repeticion() -> Dictionary:
	return {"frames": _cuadros_repeticion(), "pixel_size": R * 2.0 / float(RETRATO_PX)}




static var _retrato: SpriteFrames = null






static func _cuadros_repeticion() -> SpriteFrames:
	if _retrato != null:
		return _retrato
	var n: int = RETRATO_PX
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	var giro: Basis = Basis.from_euler(CUERPO_GIRO).inverse()
	var luz: Vector3 = Vector3(-0.45, 0.65, 0.6).normalized()
	var medio: Vector3 =(luz + Vector3(0.0, 0.0, 1.0)).normalized()
	for py in n:
		for px in n:
			var x: float =(float(px) + 0.5) / float(n) * 2.0 - 1.0
			var y: float = 1.0 -(float(py) + 0.5) / float(n) * 2.0
			var r2: float = x * x + y * y
			if r2 > 1.0:
				img.set_pixel(px, py, Color(0.0, 0.0, 0.0, 0.0))
				continue
			var nv: Vector3 = Vector3(x, y, sqrt(1.0 - r2))
			var nl: Vector3 = giro * nv
			var u: float = atan2(nl.x, nl.z) / TAU + 0.5
			var v: float = acos(clampf(nl.y, -1.0, 1.0)) / PI
			var col: Color = _color_en(u, v)
			var lambert: float = maxf(nv.dot(luz), 0.0)
			var brillo: float = pow(maxf(nv.dot(medio), 0.0), 30.0) * 0.55
			col = Color(col.r *(0.45 + 0.6 * lambert) + brillo,
				col.g *(0.45 + 0.6 * lambert) + brillo,
				col.b *(0.45 + 0.6 * lambert) + brillo, 1.0)
			img.set_pixel(px, py, col.clamp())
	var sf: SpriteFrames = SpriteFrames.new()
	sf.add_frame("default", ImageTexture.create_from_image(img))
	_retrato = sf
	return sf




func _armar_sombra() -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2.ONE * R * 2.3
	q.orientation = PlaneMesh.FACE_Y
	mi.mesh = q
	var g: Gradient = Gradient.new()
	g.set_color(0, Color(0.0, 0.0, 0.0, 1.0))
	g.set_color(1, Color(0.0, 0.0, 0.0, 0.0))
	g.add_point(0.5, Color(0.0, 0.0, 0.0, 0.85))
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = g
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = 32
	tex.height = 32
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_texture = tex
	m.albedo_color = Color(1.0, 1.0, 1.0, SOMBRA_A)
	mi.material_override = m
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return mi
