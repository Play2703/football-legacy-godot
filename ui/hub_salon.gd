extends RefCounted





































const ASIENTOS: GDScript = preload("res://ui/house/asientos_pulidos.gd")


const NIVEL_ATICO: int = 1
const NIVEL_PISO: int = 2
const NIVEL_CUARTO: int = 3


const SOFA_YAW: float = 18.0
const SOFA_W: float = 2.0
const SOFA_D: float = 0.95


const ASIENTO_TOP: float = 0.48
const FILA_TRASERO: int = 69



const PLAZA_X: float = -0.4
const PLANO_Z: float = -0.52


const MESA_EN: Vector3 = Vector3(0.45, 0.0, -1.2)










const TELES: Dictionary = {
	NIVEL_ATICO: {"at": Vector3(-1.62, 0.0, 1.25), "yaw": 153.0,
		"pantalla": Vector2(1.86, 1.046), "centro_y": 1.34, "px": Vector2i(160, 90),
		"luz": 2.2, "alcance": 5.5, "crt": false},
	NIVEL_PISO: {"at": Vector3(-1.55, 0.0, 1.15), "yaw": 153.0,
		"pantalla": Vector2(1.3, 0.73), "centro_y": 0.98, "px": Vector2i(160, 90),
		"luz": 1.7, "alcance": 4.5, "crt": false},
	NIVEL_CUARTO: {"at": Vector3(-1.3, 0.0, 0.95), "yaw": 150.0,
		"pantalla": Vector2(0.56, 0.42), "centro_y": 0.62, "px": Vector2i(120, 90),
		"luz": 1.0, "alcance": 3.2, "crt": true},
}


const VENTANA_Z: float = 3.4
const CIUDAD_Z: float = 14.0
const CIUDAD_TAM: Vector2 = Vector2(16.0, 15.0)
const CIUDAD_Y: float = 4.3












const CAJAS: Dictionary = {
	NIVEL_PISO: {"fondo": 3.0, "ancho": 5.6, "techo": 4.3},
	NIVEL_CUARTO: {"fondo": 2.4, "ancho": 4.6, "techo": 4.0},
}


const TECHO_DESDE_Z: float = -15.0
const PARED_PPM: int = 32




const TINTES: Dictionary = {
	NIVEL_ATICO: Color(0.8, 0.84, 0.98),
	NIVEL_PISO: Color(0.9, 0.87, 0.86),
	NIVEL_CUARTO: Color(0.94, 0.86, 0.7),
}

var _box_parent: Node = null
var viewport: Node = null
var _walls: Array = []
var _pal: Dictionary = {"wood": Color("4a3527")}

static var _ciudad_tex: ImageTexture = null
static var _suelo_tex: ImageTexture = null

static var _texs: Dictionary = {}




static func nivel() -> int:
	return clampi(GameState.player_div(), NIVEL_ATICO, NIVEL_CUARTO)


static func tele(n: int) -> Dictionary:
	return TELES.get(n, TELES[NIVEL_ATICO])



static func tv_centro(n: int) -> Vector3:
	var t: Dictionary = tele(n)
	return (t["at"] as Vector3) + Vector3(0.0, float(t["centro_y"]), 0.0)


static func tinte(n: int) -> Color:
	return TINTES.get(n, TINTES[NIVEL_ATICO])



static func sofa_centro() -> Vector3:
	return - _gira(Vector3(PLAZA_X, 0.0, PLANO_Z), SOFA_YAW)




static func _gira(v: Vector3, yaw_deg: float) -> Vector3:
	var a: float = deg_to_rad(yaw_deg)
	return Vector3(v.x * cos(a) + v.z * sin(a), v.y, - v.x * sin(a) + v.z * cos(a))







func arma(vp: Node, tuya: Dictionary, rival: Dictionary, en_casa: bool = true,
		n: int = NIVEL_ATICO, club: Dictionary = {}) -> Node3D:
	viewport = vp
	var raiz: Node3D = Node3D.new()
	raiz.name = "Salon"
	raiz.set_meta("nivel", n)
	vp.add_child(raiz)
	_box_parent = raiz
	match n:
		NIVEL_PISO:
			_arma_piso(raiz, tuya, club)
		NIVEL_CUARTO:
			_arma_cuarto(raiz, tuya, club)
		_:
			_arma_atico(raiz, tuya)
	if en_casa:
		_tele(raiz, n, tuya, rival)
	else:
		_tele(raiz, n, rival, tuya)
	return raiz




func _arma_atico(raiz: Node3D, tuya: Dictionary) -> void:
	_entorno(raiz, Color("5b6a96"), 0.55, 0.35)
	_suelo(raiz, _parquet(), Vector2(14.0, 12.0), VENTANA_Z - 6.0, 1.2)
	_ventanal(raiz)
	_ciudad(raiz)
	_alfombra(raiz, Color("2c303c"), Color("3c4254"), Vector2(3.4, 2.5),
		Vector3(0.0, 0.0, -0.75))
	_sofa(raiz, tuya, Color("7d4f3f"), Color("2a1f18"), true)
	_mesita(raiz, tuya)
	_lampara(raiz)







func _arma_piso(raiz: Node3D, tuya: Dictionary, club: Dictionary) -> void:
	var caja: Dictionary = CAJAS[NIVEL_PISO]
	var fondo: float = float(caja["fondo"])
	_entorno(raiz, Color("474c63"), 0.5, 0.3)
	_caja(raiz, caja, "piso", Color("b8ad97"), Color("dcd6ca"), Color("d4cfc4"), false,
		_laminado(), 1.2)
	_ventana_piso(raiz, fondo)
	_camiseta_enmarcada(raiz, fondo, club)
	_planta(raiz, Vector3(2.3, 0.0, fondo - 0.35))
	_alfombra(raiz, Color("3f4249"), Color("555963"), Vector2(2.9, 2.0),
		Vector3(0.0, 0.0, -0.75))
	_sofa(raiz, tuya, Color("5d6679"), Color("1d1e22"), true)
	_mesa_pino(raiz, tuya)
	_colgante(raiz)







func _arma_cuarto(raiz: Node3D, tuya: Dictionary, club: Dictionary) -> void:
	var caja: Dictionary = CAJAS[NIVEL_CUARTO]
	var fondo: float = float(caja["fondo"])
	_entorno(raiz, Color("4a4636"), 0.5, 0.22)
	_caja(raiz, caja, "cuarto", Color("9b9a80"), Color("4a3a2a"), Color("a8a28a"), true,
		_baldosas(), 0.66)
	_ventanuco(raiz, fondo)
	_poster(raiz, fondo, club)
	_alfombra(raiz, Color("4d3530"), Color("62443b"), Vector2(1.6, 1.1), MESA_EN)
	_sofa(raiz, tuya, Color("8b7440"), Color("2a2018"), false)
	_manta_rayas(raiz)
	_caja_cervezas(raiz, tuya)
	_tendedero(raiz, club)
	_bolsa_y_balon(raiz, club)
	_bombilla(raiz)



func _add_box(at: Vector3, size: Vector3, col: Color, _block: int = 0) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mate(col)
	m.mesh = box
	m.position = at
	(_box_parent if _box_parent != null else viewport).add_child(m)
	return m




func _luce(at: Vector3, size: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = _add_box(at, size, col)
	((m.mesh as BoxMesh).material as StandardMaterial3D).shading_mode = \
			BaseMaterial3D.SHADING_MODE_UNSHADED
	return m


func _cilindro(at: Vector3, r_arriba: float, r_abajo: float, alto: float,
		col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r_arriba
	c.bottom_radius = r_abajo
	c.height = alto
	c.radial_segments = 16
	c.rings = 1
	c.material = _mate(col)
	m.mesh = c
	m.position = at
	_box_parent.add_child(m)
	return m


func _esfera(at: Vector3, r: float, col: Color, luce: bool = false) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var e: SphereMesh = SphereMesh.new()
	e.radius = r
	e.height = r * 2.0
	e.radial_segments = 12
	e.rings = 6
	var mat: StandardMaterial3D = _mate(col)
	if luce:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	e.material = mat
	m.mesh = e
	m.position = at
	_box_parent.add_child(m)
	return m






func _lamina(raiz: Node3D, at: Vector3, tam: Vector2, tex: Texture2D) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = tam
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material = mat
	m.mesh = q
	m.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	m.position = at
	raiz.add_child(m)


func _cojin(at: Vector3, tam: Vector3, col: Color) -> void:
	ASIENTOS.acolchado(self, at, tam, col)




func _en_el_sofa(raiz: Node3D, en: Vector3 = Vector3.ZERO) -> Node3D:
	var nodo: Node3D = Node3D.new()
	nodo.position = sofa_centro() + _gira(en, SOFA_YAW)
	nodo.rotation_degrees.y = SOFA_YAW
	raiz.add_child(nodo)
	_box_parent = nodo
	return nodo


static func _mate(col: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.95
	return mat






func _entorno(raiz: Node3D, ambiente: Color, energia: float, relleno_e: float) -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("070a14")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = ambiente
	env.ambient_light_energy = energia
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	raiz.add_child(we)
	var relleno: DirectionalLight3D = DirectionalLight3D.new()
	relleno.rotation_degrees = Vector3(-35.0, 180.0, 0.0)
	relleno.light_color = Color(0.7, 0.78, 1.0)
	relleno.light_energy = relleno_e
	raiz.add_child(relleno)




func _suelo(raiz: Node3D, tex: Texture2D, tam: Vector2, centro_z: float,
		baldosa: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var p: PlaneMesh = PlaneMesh.new()
	p.size = tam
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.uv1_scale = Vector3(tam.x / baldosa, tam.y / baldosa, 1.0)
	mat.roughness = 0.8
	p.material = mat
	m.mesh = p
	m.position = Vector3(0.0, 0.0, centro_z)
	raiz.add_child(m)




static func _parquet() -> ImageTexture:
	if _suelo_tex != null:
		return _suelo_tex
	var img: Image = Image.create_empty(64, 64, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 7117
	var tonos: Array[Color] = [Color("4a3426"), Color("553c2b"), Color("3f2d21"),
		Color("4f3829")]
	for tabla in 4:
		var x0: int = tabla * 16

		var junta: int = rng.randi_range(8, 56)
		for tramo in 2:
			var y0: int = 0 if tramo == 0 else junta
			var y1: int = junta if tramo == 0 else 64
			var col: Color = tonos[rng.randi_range(0, tonos.size() - 1)]
			img.fill_rect(Rect2i(x0, y0, 16, y1 - y0), col)

			for v in 2:
				var vx: int = x0 + rng.randi_range(3, 12)
				img.fill_rect(Rect2i(vx, y0, 1, y1 - y0), col.lightened(0.06))
			img.fill_rect(Rect2i(x0, y0, 16, 1), Color("2a1d15"))
		img.fill_rect(Rect2i(x0, 0, 1, 64), Color("2a1d15"))
	_suelo_tex = ImageTexture.create_from_image(img)
	return _suelo_tex




static func _laminado() -> ImageTexture:
	if _texs.has("laminado"):
		return _texs["laminado"]
	var img: Image = Image.create_empty(64, 64, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 2202
	var tonos: Array[Color] = [Color("a88458"), Color("b08c5e"), Color("9c7a50"),
		Color("a4825a")]
	for tabla in 4:
		var x0: int = tabla * 16
		var junta: int = 8 + tabla * 16
		for tramo in 2:
			var y0: int = 0 if tramo == 0 else junta
			var y1: int = junta if tramo == 0 else 64
			var col: Color = tonos[(tabla + tramo) % tonos.size()]
			img.fill_rect(Rect2i(x0, y0, 16, y1 - y0), col)
			for v in 3:
				var vx: int = x0 + rng.randi_range(2, 13)
				img.fill_rect(Rect2i(vx, y0, 1, y1 - y0),
					col.darkened(0.05) if v % 2 == 0 else col.lightened(0.05))
			img.fill_rect(Rect2i(x0, y0, 16, 1), col.darkened(0.22))
		img.fill_rect(Rect2i(x0, 0, 1, 64), Color("7a5c3e"))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texs["laminado"] = tex
	return tex




static func _baldosas() -> ImageTexture:
	if _texs.has("baldosas"):
		return _texs["baldosas"]
	var img: Image = Image.create_empty(32, 32, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 3303
	for by in 2:
		for bx in 2:
			var col: Color = Color("8a8575") if (bx + by) % 2 == 0 else Color("6c685c")
			img.fill_rect(Rect2i(bx * 16, by * 16, 16, 16), col)

			for i in 40:
				var px: int = bx * 16 + rng.randi_range(0, 15)
				var py: int = by * 16 + rng.randi_range(0, 15)
				img.set_pixel(px, py, col.darkened(rng.randf_range(0.05, 0.22))
					if rng.randf() < 0.7 else col.lightened(0.08))
	for i in 32:
		img.set_pixel(i, 0, Color("3a372f"))
		img.set_pixel(0, i, Color("3a372f"))
		img.set_pixel(i, 16, Color("3a372f"))
		img.set_pixel(16, i, Color("3a372f"))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texs["baldosas"] = tex
	return tex





func _caja(raiz: Node3D, caja: Dictionary, clave: String, pintura: Color, zocalo: Color,
		techo_col: Color, sucio: bool, suelo: Texture2D, baldosa: float) -> void:
	var fondo: float = float(caja["fondo"])
	var ancho: float = float(caja["ancho"])
	var techo: float = float(caja["techo"])
	var hondo: float = fondo + 9.0
	_suelo(raiz, suelo, Vector2(ancho, hondo), fondo - hondo * 0.5, baldosa)
	_pared(raiz, Vector3(0.0, techo * 0.5, fondo), Vector2(ancho, techo), 180.0,
		_pintura(clave + "_fondo", ancho, techo, pintura, zocalo, sucio))

	var lado_tex: ImageTexture = _pintura(clave + "_lado", hondo, techo,
		pintura.darkened(0.06), zocalo, sucio)
	for lado in [-1.0, 1.0]:

		_pared(raiz, Vector3(lado * ancho * 0.5, techo * 0.5, fondo - hondo * 0.5),
			Vector2(hondo, techo), -90.0 * lado, lado_tex)



	var largo: float = fondo - TECHO_DESDE_Z
	var m: MeshInstance3D = MeshInstance3D.new()
	var p: PlaneMesh = PlaneMesh.new()
	p.size = Vector2(ancho, largo)
	p.flip_faces = true
	p.material = _mate(techo_col)
	m.mesh = p
	m.position = Vector3(0.0, techo, fondo - largo * 0.5)
	raiz.add_child(m)


func _pared(raiz: Node3D, at: Vector3, tam: Vector2, yaw: float, tex: Texture2D) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = tam
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.95
	q.material = mat
	m.mesh = q
	m.rotation_degrees.y = yaw
	m.position = at
	raiz.add_child(m)





static func _pintura(clave: String, ancho_m: float, techo: float, pintura: Color,
		zocalo: Color, sucio: bool) -> ImageTexture:
	if _texs.has(clave):
		return _texs[clave]
	var w: int = maxi(8, int(ancho_m * PARED_PPM))
	var h: int = int(techo * PARED_PPM)
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	img.fill(pintura)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(clave)
	for i in w * h / 5:
		img.set_pixel(rng.randi_range(0, w - 1), rng.randi_range(0, h - 1),
			pintura.darkened(rng.randf() * 0.06) if rng.randf() < 0.5
			else pintura.lightened(rng.randf() * 0.04))
	if sucio:
		_humedades(img, rng, 0, pintura)
	var rh: int = maxi(2, int(0.1 * PARED_PPM))
	img.fill_rect(Rect2i(0, h - rh, w, rh), zocalo)
	img.fill_rect(Rect2i(0, h - rh, w, 1), zocalo.lightened(0.15))
	img.fill_rect(Rect2i(0, 0, w, 3), pintura.lightened(0.1))
	img.fill_rect(Rect2i(0, 3, w, 1), pintura.darkened(0.15))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texs[clave] = tex
	return tex





static func _humedades(img: Image, rng: RandomNumberGenerator, fila_techo: int,
		pintura: Color) -> void:
	var w: int = img.get_width()
	var h: int = img.get_height()
	var cerco: Color = Color("5e5238")
	for k in 7:
		var cx: int = rng.randi_range(0, w - 1)
		var cy: int = rng.randi_range(fila_techo + 2, fila_techo + 24) if k < 3 \
				else rng.randi_range(h - 34, h - 6)
		var r: int = rng.randi_range(7, 16)
		for dy in range(- r, r + 1):
			for dx in range(- r * 2, r * 2 + 1):
				var x: int = cx + dx
				var y: int = cy + dy
				if x < 0 or x >= w or y <= fila_techo or y >= h:
					continue
				var d: float = sqrt(float(dx * dx) / 4.0 + float(dy * dy)) / float(r)
				if d >= 1.0:
					continue
				var a: float = 0.1 + 0.22 * smoothstep(0.55, 1.0, d)
				img.set_pixel(x, y, img.get_pixel(x, y).lerp(cerco, a))
	for k in 3:
		var cx: int = rng.randi_range(4, w - 12)
		var cy: int = rng.randi_range(fila_techo + 30, h - 30)
		for p in 3:
			var r: Rect2i = Rect2i(cx + rng.randi_range(-3, 3), cy + rng.randi_range(-2, 2),
				rng.randi_range(2, 5), rng.randi_range(1, 3))
			img.fill_rect(r, pintura.lightened(0.16))

			img.fill_rect(Rect2i(r.position.x, r.end.y, r.size.x, 1), pintura.darkened(0.3))
	var x: int = rng.randi_range(w / 4, w * 3 / 4)
	var y: int = fila_techo + 2
	for i in rng.randi_range(50, 90):
		if y >= h - 8:
			break
		img.set_pixel(clampi(x, 0, w - 1), y, Color("3a3528"))
		x += rng.randi_range(-1, 1)
		y += 1





func _ventanal(raiz: Node3D) -> void:
	var marco: Color = Color("1a1d26")
	var x: float = -6.0
	while x <= 6.01:
		_add_box(Vector3(x, 4.5, VENTANA_Z), Vector3(0.09, 9.0, 0.12), marco)
		x += 1.5
	for y in [0.06, 3.0, 6.0]:
		_add_box(Vector3(0.0, y, VENTANA_Z), Vector3(12.2, 0.12 if y < 0.1 else 0.08, 0.12),
			marco)



func _ciudad(raiz: Node3D) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = CIUDAD_TAM
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = _skyline()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material = mat
	m.mesh = q

	m.rotation_degrees = Vector3(0.0, 180.0, 0.0)
	m.position = Vector3(0.0, CIUDAD_Y, CIUDAD_Z)
	raiz.add_child(m)





static func _skyline() -> ImageTexture:
	if _ciudad_tex != null:
		return _ciudad_tex
	var w: int = 256
	var h: int = 256
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	var horizonte: int = int((CIUDAD_Y + CIUDAD_TAM.y * 0.5 - 3.8) / CIUDAD_TAM.y * h)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 90210

	for y in horizonte:
		var t: float = float(y) / float(horizonte)
		img.fill_rect(Rect2i(0, y, w, 1),
			Color("0a0f2a").lerp(Color("2d2450"), pow(t, 1.8)))
	for i in 70:
		var sx: int = rng.randi_range(0, w - 1)
		var sy: int = rng.randi_range(0, int(horizonte * 0.7))
		img.set_pixel(sx, sy, Color(0.85, 0.88, 1.0, 1.0).darkened(rng.randf() * 0.5))


	var luna: Vector2i = Vector2i(170, 34)
	for dy in range(-6, 7):
		for dx in range(-6, 7):
			if dx * dx + dy * dy <= 36:
				img.set_pixel(luna.x + dx, luna.y + dy, Color("e9e4cf"))
	for dy in range(-6, 7):
		for dx in range(-6, 7):
			if (dx + 3) *(dx + 3) +(dy - 1) *(dy - 1) <= 25 and dx * dx + dy * dy <= 36:
				img.set_pixel(luna.x + dx, luna.y + dy, Color("c9c3ab"))

	img.fill_rect(Rect2i(0, horizonte, w, h - horizonte), Color("0c0f1c"))
	for i in 900:
		var px: int = rng.randi_range(0, w - 1)
		var py: int = rng.randi_range(horizonte + 1, h - 1)
		var calida: bool = rng.randf() < 0.7
		var c: Color = Color("e8b85a") if calida else Color("9cc3ff")
		img.set_pixel(px, py, c.darkened(rng.randf() * 0.55))

	for av in 2:
		var y0: int = horizonte + 18 + av * 40
		for x in w:
			if (x + av * 3) % 3 != 0:
				img.set_pixel(x, clampi(y0 + int(x *(0.08 if av == 0 else -0.05)),
					horizonte + 1, h - 1), Color("f09a3e"))


	for capa in 2:
		var x: int = 0
		var col: Color = Color("1a1f36") if capa == 0 else Color("0f1324")
		while x < w:
			var ancho: int = rng.randi_range(8, 20) if capa == 0 else rng.randi_range(10, 24)
			var alto: int = rng.randi_range(6, 26) if capa == 0 else rng.randi_range(4, 60)
			var top: int = horizonte - alto
			img.fill_rect(Rect2i(x, top, mini(ancho, w - x), horizonte - top + 2), col)

			var yy: int = top + 3
			while yy < horizonte - 1:
				var xx: int = x + 2
				while xx < x + ancho - 2 and xx < w:
					if rng.randf() <(0.35 if capa == 1 else 0.2):
						img.set_pixel(xx, yy,(Color("f2cf7a") if rng.randf() < 0.8
							else Color("a9d0ff")).darkened(rng.randf() * 0.4))
					xx += 3
				yy += 4

			if capa == 1 and alto > 40 and x + ancho / 2 < w:
				img.set_pixel(x + ancho / 2, top - 1, Color("ff3b30"))
				img.set_pixel(x + ancho / 2, top - 2, Color("ff3b30"))
			x += ancho + rng.randi_range(0, 3)
	_ciudad_tex = ImageTexture.create_from_image(img)
	return _ciudad_tex





static func _fachada() -> ImageTexture:
	if _texs.has("fachada"):
		return _texs["fachada"]
	var w: int = 48
	var h: int = 44
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	for y in 9:
		img.fill_rect(Rect2i(0, y, w, 1), Color("0f1630").lerp(Color("2a2442"), y / 8.0))
	img.fill_rect(Rect2i(0, 9, w, h - 9), Color("262733"))
	img.fill_rect(Rect2i(0, 9, w, 1), Color("1b1c25"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4404
	for fila in 3:
		for col in 4:
			var r: Rect2i = Rect2i(3 + col * 12, 13 + fila * 10, 7, 6)
			var dado: float = rng.randf()
			if dado < 0.45:
				img.fill_rect(r, Color("e3b865").darkened(rng.randf() * 0.3))
				img.fill_rect(Rect2i(r.position.x, r.position.y, 2, r.size.y), Color("a8834a"))
			elif dado < 0.62:
				img.fill_rect(r, Color("7fa6e0").darkened(0.35 + rng.randf() * 0.2))
			else:
				img.fill_rect(r, Color("15161d"))
			img.fill_rect(Rect2i(r.position.x - 1, r.end.y, r.size.x + 2, 1), Color("3a3b48"))

	for y in range(h - 4, h):
		img.fill_rect(Rect2i(0, y, w, 1), Color("262733").lerp(Color("8a5a32"),
			float(y -(h - 4)) / 4.0))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texs["fachada"] = tex
	return tex




static func _patio() -> ImageTexture:
	if _texs.has("patio"):
		return _texs["patio"]
	var w: int = 28
	var h: int = 24
	var img: Image = Image.create_empty(w, h, false, Image.FORMAT_RGBA8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 5505
	img.fill(Color("241c1a"))
	for fila in range(0, h, 3):
		var desfase: int = 0 if (fila / 3) % 2 == 0 else 3
		for x0 in range(- desfase, w, 6):
			img.fill_rect(Rect2i(x0, fila, 5, 2),
				Color("3d2d28").darkened(rng.randf() * 0.35))
	img.fill_rect(Rect2i(16, 6, 8, 9), Color("d9a55a"))
	img.fill_rect(Rect2i(19, 6, 1, 9), Color("5a3e22"))
	img.fill_rect(Rect2i(16, 10, 8, 1), Color("5a3e22"))
	img.fill_rect(Rect2i(5, 0, 2, h), Color("45474c"))
	img.fill_rect(Rect2i(4, 11, 4, 1), Color("5a5c62"))
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_texs["patio"] = tex
	return tex




func _alfombra(raiz: Node3D, borde: Color, centro: Color, tam: Vector2,
		en: Vector3) -> void:
	_en_el_sofa(raiz, en)
	_add_box(Vector3(0.0, 0.006, 0.0), Vector3(tam.x, 0.012, tam.y), borde)
	_add_box(Vector3(0.0, 0.008, 0.0), Vector3(tam.x - 0.3, 0.012, tam.y - 0.3), centro)
	_box_parent = raiz





func _sofa(raiz: Node3D, tuya: Dictionary, tela: Color, madera: Color, cojin: bool) -> void:
	_en_el_sofa(raiz)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_add_box(Vector3(sx *(SOFA_W * 0.5 - 0.1), 0.05, sz *(SOFA_D * 0.5 - 0.1)),
				Vector3(0.06, 0.1, 0.06), madera)
	_cojin(Vector3(0.0, 0.23, 0.0), Vector3(SOFA_W - 0.04, 0.22, SOFA_D - 0.04),
		tela.darkened(0.12))
	_cojin(Vector3(0.0, 0.62, SOFA_D * 0.5 - 0.11), Vector3(SOFA_W - 0.04, 0.56, 0.2),
		tela.darkened(0.08))
	for sx in [-1.0, 1.0]:
		_cojin(Vector3(sx * 0.4, 0.41, -0.1), Vector3(0.78, 0.14, SOFA_D - 0.32),
			tela.lightened(0.08))
		_cojin(Vector3(sx * 0.4, 0.72, SOFA_D * 0.5 - 0.26), Vector3(0.74, 0.44, 0.16),
			tela.lightened(0.04))
		_cojin(Vector3(sx *(SOFA_W * 0.5 - 0.11), 0.5, -0.02),
			Vector3(0.2, 0.36, SOFA_D - 0.06), tela)
	var kit: Color = _color(tuya, "kit", Color("c8303a"))
	var kit2: Color = _color(tuya, "kit2", Color("f3f1f4"))
	if cojin:
		_cojin(Vector3(0.62, 0.66, 0.1), Vector3(0.3, 0.3, 0.12), kit)

	var bx: float = -(SOFA_W * 0.5 - 0.11)
	for i in 5:
		_add_box(Vector3(bx, 0.69, -0.28 + i * 0.14), Vector3(0.22, 0.02, 0.14),
			kit if i % 2 == 0 else kit2)
	for i in 3:
		_add_box(Vector3(bx, 0.6 - i * 0.1, -(SOFA_D * 0.5) - 0.005),
			Vector3(0.16, 0.1, 0.02), kit if i % 2 == 0 else kit2)
	_box_parent = raiz




func _mesita(raiz: Node3D, tuya: Dictionary) -> void:
	_en_el_sofa(raiz, MESA_EN)
	var madera: Color = Color("5a4030")
	_add_box(Vector3(0.0, 0.4, 0.0), Vector3(0.95, 0.05, 0.55), madera)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_add_box(Vector3(sx * 0.4, 0.19, sz * 0.21), Vector3(0.05, 0.38, 0.05),
				madera.darkened(0.2))
	_cilindro(Vector3(-0.18, 0.465, 0.02), 0.14, 0.09, 0.08, Color("d8d2c4"))
	_cilindro(Vector3(-0.18, 0.51, 0.02), 0.12, 0.12, 0.02, Color("f0d890"))
	_cilindro(Vector3(0.16, 0.485, -0.08), 0.035, 0.035, 0.12,
		_color(tuya, "kit", Color("c8303a")))
	_cilindro(Vector3(0.28, 0.485, 0.06), 0.035, 0.035, 0.12, Color("c0c4cc"))
	_add_box(Vector3(0.1, 0.435, 0.16), Vector3(0.16, 0.02, 0.05), Color("15161a"))
	_box_parent = raiz




func _lampara(raiz: Node3D) -> void:
	var nodo: Node3D = Node3D.new()
	nodo.position = sofa_centro() + _gira(Vector3(SOFA_W * 0.5 + 0.28, 0.0, 0.18), SOFA_YAW)
	raiz.add_child(nodo)
	_box_parent = nodo
	_cilindro(Vector3(0.0, 0.015, 0.0), 0.16, 0.16, 0.03, Color("1c1c20"))
	_cilindro(Vector3(0.0, 0.8, 0.0), 0.018, 0.018, 1.56, Color("1c1c20"))
	var pantalla: MeshInstance3D = _cilindro(Vector3(0.0, 1.66, 0.0), 0.15, 0.22, 0.3,
		Color("f0d4a0"))
	var mat: StandardMaterial3D =(pantalla.mesh as CylinderMesh).material
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = Vector3(0.0, 1.5, 0.0)
	luz.light_color = Color(1.0, 0.76, 0.48)
	luz.light_energy = 1.5
	luz.omni_range = 4.5
	nodo.add_child(luz)
	_box_parent = raiz




func _ventana_piso(raiz: Node3D, fondo: float) -> void:
	var c: Vector3 = Vector3(1.5, 1.6, fondo)
	var tam: Vector2 = Vector2(1.4, 1.3)
	_lamina(raiz, c + Vector3(0.0, 0.0, -0.01), tam, _fachada())
	var blanco: Color = Color("dedbd3")
	for sy in [-1.0, 1.0]:
		_add_box(c + Vector3(0.0, sy *(tam.y * 0.5 + 0.03), -0.03),
			Vector3(tam.x + 0.12, 0.06, 0.06), blanco)
	for sx in [-1.0, 1.0]:
		_add_box(c + Vector3(sx *(tam.x * 0.5 + 0.03), 0.0, -0.03),
			Vector3(0.06, tam.y + 0.12, 0.06), blanco)
	_add_box(c + Vector3(0.0, 0.0, -0.03), Vector3(0.05, tam.y, 0.05), blanco)
	_add_box(c + Vector3(0.0, - tam.y * 0.5 - 0.08, -0.09), Vector3(tam.x + 0.3, 0.04, 0.16),
		Color("cfcbc2"))

	var radiador: Color = Color("d4d0c8")
	_add_box(Vector3(c.x, 0.45, fondo - 0.07), Vector3(1.0, 0.55, 0.07), radiador)
	for i in 9:
		_add_box(Vector3(c.x - 0.44 + i * 0.11, 0.45, fondo - 0.115),
			Vector3(0.035, 0.51, 0.025), radiador.darkened(0.1))

	var barra_y: float = c.y + tam.y * 0.5 + 0.17
	_add_box(Vector3(c.x, barra_y, fondo - 0.13), Vector3(tam.x + 0.9, 0.025, 0.025),
		Color("2a2a2e"))
	var abajo: float = c.y - tam.y * 0.5 - 0.12
	for sx in [-1.0, 1.0]:
		var cx: float = c.x + sx *(tam.x * 0.5 + 0.12)
		for f in 4:
			_add_box(Vector3(cx - 0.135 + f * 0.09,(barra_y + abajo) * 0.5,
				fondo - 0.13 -(0.03 if f % 2 == 0 else 0.0)),
				Vector3(0.09, barra_y - abajo, 0.03),
				Color("4c586b") if f % 2 == 0 else Color("56647a"))




func _camiseta_enmarcada(raiz: Node3D, fondo: float, club: Dictionary) -> void:
	var c: Vector3 = Vector3(-1.35, 1.95, fondo - 0.02)
	var kit: Color = _color(club, "kit", Color("c8303a"))
	var kit2: Color = _color(club, "kit2", Color("f3f1f4"))
	_add_box(c, Vector3(0.66, 0.78, 0.04), Color("2e241c"))
	_add_box(c + Vector3(0.0, 0.0, -0.022), Vector3(0.58, 0.7, 0.005), Color("e4e0d6"))
	_add_box(c + Vector3(0.0, -0.05, -0.028), Vector3(0.26, 0.36, 0.006), kit)
	for sx in [-1.0, 1.0]:

		var manga: MeshInstance3D = _add_box(c + Vector3(sx * 0.17, 0.08, -0.028),
			Vector3(0.14, 0.09, 0.006), kit)
		manga.rotation_degrees.z = -20.0 * sx
	_add_box(c + Vector3(0.0, 0.125, -0.031), Vector3(0.08, 0.03, 0.006), kit2)
	_add_box(c + Vector3(0.06, 0.05, -0.031), Vector3(0.04, 0.045, 0.006), kit2)



func _planta(raiz: Node3D, at: Vector3) -> void:
	_box_parent = raiz
	_cilindro(at + Vector3(0.0, 0.17, 0.0), 0.15, 0.11, 0.34, Color("a4583a"))
	_cilindro(at + Vector3(0.0, 0.345, 0.0), 0.13, 0.13, 0.01, Color("3a2a1e"))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 5150
	for i in 8:
		var alto: float = rng.randf_range(0.45, 0.85)
		var hoja: MeshInstance3D = _add_box(at + Vector3(rng.randf_range(-0.07, 0.07),
			0.34 + alto * 0.5, rng.randf_range(-0.07, 0.07)), Vector3(0.06, alto, 0.015),
			Color("3f6a3a").lerp(Color("6b8a3a"), rng.randf() * 0.4))
		hoja.rotation_degrees = Vector3(rng.randf_range(-12.0, 12.0),
			rng.randf_range(0.0, 180.0), rng.randf_range(-14.0, 14.0))





func _mesa_pino(raiz: Node3D, tuya: Dictionary) -> void:
	_en_el_sofa(raiz, MESA_EN)
	var pino: Color = Color("b58c5a")
	_add_box(Vector3(0.0, 0.4, 0.0), Vector3(0.9, 0.04, 0.5), pino)
	_add_box(Vector3(0.0, 0.14, 0.0), Vector3(0.84, 0.02, 0.44), pino.darkened(0.08))
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_add_box(Vector3(sx * 0.4, 0.19, sz * 0.2), Vector3(0.05, 0.38, 0.05),
				pino.darkened(0.12))
	var carton: Color = Color("c9a676")
	var pc: Vector3 = Vector3(0.18, 0.0, 0.0)
	_add_box(pc + Vector3(0.0, 0.435, 0.0), Vector3(0.38, 0.03, 0.38), carton)
	_cilindro(pc + Vector3(0.0, 0.456, 0.0), 0.16, 0.16, 0.012, Color("d9a24a"))
	for p in [Vector3(-0.06, 0.0, 0.05), Vector3(0.07, 0.0, -0.04), Vector3(0.02, 0.0, 0.09),
			Vector3(-0.08, 0.0, -0.07), Vector3(0.09, 0.0, 0.06)]:
		_cilindro(pc + p + Vector3(0.0, 0.464, 0.0), 0.025, 0.025, 0.006, Color("a8322a"))


	var tapa: MeshInstance3D = _add_box(pc + Vector3(0.0, 0.45 + 0.19 * cos(deg_to_rad(40.0)),
		0.19 + 0.19 * sin(deg_to_rad(40.0))), Vector3(0.38, 0.38, 0.012), carton.darkened(0.05))
	tapa.rotation_degrees.x = 40.0
	_cilindro(Vector3(-0.22, 0.48, -0.1), 0.033, 0.033, 0.12,
		_color(tuya, "kit", Color("c8303a")))
	var lata: MeshInstance3D = _cilindro(Vector3(-0.3, 0.453, 0.1), 0.033, 0.033, 0.12,
		Color("c0c4cc"))
	lata.rotation_degrees.z = 90.0
	_add_box(Vector3(-0.12, 0.43, 0.14), Vector3(0.16, 0.02, 0.05), Color("15161a"))
	_box_parent = raiz





func _colgante(raiz: Node3D) -> void:
	var nodo: Node3D = Node3D.new()
	nodo.position = Vector3(0.22, 2.2, -0.85)
	raiz.add_child(nodo)
	_box_parent = nodo
	var cable: float = float(CAJAS[NIVEL_PISO]["techo"]) - nodo.position.y
	_add_box(Vector3(0.0, cable * 0.5, 0.0), Vector3(0.012, cable, 0.012), Color("141414"))
	_cilindro(Vector3(0.0, cable - 0.02, 0.0), 0.07, 0.07, 0.04, Color("d4cfc4"))
	_cilindro(Vector3.ZERO, 0.05, 0.24, 0.22, Color("3a5a55"))
	_esfera(Vector3(0.0, -0.1, 0.0), 0.05, Color("fff1c8"), true)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = Vector3(0.0, -0.15, 0.0)
	luz.light_color = Color(1.0, 0.8, 0.55)
	luz.light_energy = 1.8
	luz.omni_range = 5.5
	nodo.add_child(luz)
	_box_parent = raiz




func _ventanuco(raiz: Node3D, fondo: float) -> void:
	var c: Vector3 = Vector3(-1.1, 1.85, fondo)
	var tam: Vector2 = Vector2(0.75, 0.6)
	_lamina(raiz, c + Vector3(0.0, 0.0, -0.01), tam, _patio())
	var madera: Color = Color("6e5c44")
	for sy in [-1.0, 1.0]:
		_add_box(c + Vector3(0.0, sy *(tam.y * 0.5 + 0.025), -0.03),
			Vector3(tam.x + 0.1, 0.05, 0.05), madera)
	for sx in [-1.0, 1.0]:
		_add_box(c + Vector3(sx *(tam.x * 0.5 + 0.025), 0.0, -0.03),
			Vector3(0.05, tam.y + 0.1, 0.05), madera)
	_add_box(c + Vector3(0.0, - tam.y * 0.5 - 0.06, -0.07), Vector3(tam.x + 0.14, 0.035, 0.12),
		Color("8a8578"))
	_add_box(c + Vector3(0.0, tam.y * 0.5 + 0.11, -0.07), Vector3(tam.x + 0.1, 0.12, 0.14),
		Color("cfc6aa"))
	for i in 6:
		var lama: MeshInstance3D = _add_box(c + Vector3(0.0, tam.y * 0.5 - 0.025 - i * 0.05,
			-0.05), Vector3(tam.x, 0.04, 0.012),
			Color("d9cfb2") if i % 2 == 0 else Color("cfc4a4"))
		if i == 4:
			lama.rotation_degrees.z = 7.0
			lama.position.x += 0.03




func _poster(raiz: Node3D, fondo: float, club: Dictionary) -> void:
	var nodo: Node3D = Node3D.new()
	nodo.position = Vector3(1.35, 1.95, fondo - 0.01)
	nodo.rotation_degrees.z = 4.0
	raiz.add_child(nodo)
	_box_parent = nodo
	var kit: Color = _color(club, "kit", Color("c8303a"))
	var kit2: Color = _color(club, "kit2", Color("f3f1f4"))
	_add_box(Vector3.ZERO, Vector3(0.5, 0.7, 0.004), kit)
	_add_box(Vector3(0.0, -0.25, -0.003), Vector3(0.5, 0.12, 0.004), kit2)
	_add_box(Vector3(0.0, 0.06, -0.003), Vector3(0.26, 0.3, 0.004), kit2)
	_add_box(Vector3(0.0, 0.07, -0.005), Vector3(0.2, 0.24, 0.004), kit)
	var banda: MeshInstance3D = _add_box(Vector3(0.0, 0.07, -0.007),
		Vector3(0.05, 0.26, 0.004), kit2)
	banda.rotation_degrees.z = 35.0
	for i in 3:
		_add_box(Vector3(0.0, -0.23 - i * 0.025, -0.006), Vector3(0.34 - i * 0.08, 0.012, 0.004),
			kit.darkened(0.3))
	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			var cinta: MeshInstance3D = _add_box(Vector3(sx * 0.24, sy * 0.34, -0.008),
				Vector3(0.09, 0.03, 0.004), Color("e6dcae"))
			cinta.rotation_degrees.z = 45.0 * sx * sy
	_box_parent = raiz




func _manta_rayas(raiz: Node3D) -> void:
	_en_el_sofa(raiz)
	var rayas: Array[Color] = [Color("7a2f2a"), Color("c9b48a"), Color("2f4a5a"),
		Color("c9b48a"), Color("7a2f2a")]
	for i in rayas.size():
		var x: float = 0.4 - 0.296 + i * 0.148
		_add_box(Vector3(x, 0.49, -0.12), Vector3(0.148, 0.02, 0.62), rayas[i])
		_add_box(Vector3(x, 0.3, -(SOFA_D * 0.5) - 0.012), Vector3(0.148, 0.4, 0.02),
			rayas[i].darkened(0.08))
	var bx: float = SOFA_W * 0.5 - 0.11
	_add_box(Vector3(bx, 0.55, -(SOFA_D * 0.5) - 0.012), Vector3(0.13, 0.12, 0.01),
		Color("6b5836"))
	_box_parent = raiz





func _caja_cervezas(raiz: Node3D, tuya: Dictionary) -> void:
	_en_el_sofa(raiz, MESA_EN)
	var rojo: Color = Color("b02a2e")
	_add_box(Vector3(0.0, 0.15, 0.0), Vector3(0.42, 0.3, 0.3), rojo)
	for i in 5:
		_add_box(Vector3(-0.16 + i * 0.08, 0.13, -0.151), Vector3(0.035, 0.16, 0.004),
			rojo.darkened(0.45))
	_add_box(Vector3(0.0, 0.255, -0.151), Vector3(0.14, 0.035, 0.004), rojo.darkened(0.6))
	_cilindro(Vector3(-0.06, 0.355, 0.02), 0.05, 0.038, 0.11, Color("ece8dc"))
	_cilindro(Vector3(-0.06, 0.37, 0.02), 0.049, 0.045, 0.03, Color("c8352a"))
	var tenedor: MeshInstance3D = _add_box(Vector3(-0.04, 0.44, 0.02),
		Vector3(0.012, 0.12, 0.006), Color("d8d8d8"))
	tenedor.rotation_degrees.z = -18.0
	_cilindro(Vector3(0.11, 0.36, -0.03), 0.033, 0.033, 0.12,
		_color(tuya, "kit", Color("2f6a3a")))
	_box_parent = raiz
	_en_el_sofa(raiz, Vector3(-0.1, 0.0, -1.3))
	var carton: Color = Color("c2a070")
	var caja: MeshInstance3D = _add_box(Vector3(0.0, 0.022, 0.0), Vector3(0.38, 0.045, 0.38),
		carton)
	caja.rotation_degrees.y = 12.0
	_add_box(Vector3(0.05, 0.046, -0.02), Vector3(0.1, 0.004, 0.08), carton.darkened(0.25))
	var aplastada: MeshInstance3D = _cilindro(Vector3(0.36, 0.035, 0.05), 0.035, 0.035,
		0.05, Color("b8bcc4"))
	aplastada.rotation_degrees.z = 80.0
	_box_parent = raiz




func _tendedero(raiz: Node3D, club: Dictionary) -> void:
	_box_parent = raiz
	var c: Vector3 = Vector3(1.75, 0.0, 1.95)
	var metal: Color = Color("b8bcc0")
	var barra_y: float = 1.02
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			var pata: MeshInstance3D = _add_box(Vector3(c.x + sx * 0.4, barra_y * 0.5,
				c.z + sz * 0.1), Vector3(0.015, barra_y / cos(deg_to_rad(18.0)), 0.015), metal)
			pata.rotation_degrees.x = 18.0 * sz
	for dz in [-0.12, 0.0, 0.12]:
		_add_box(Vector3(c.x, barra_y, c.z + dz), Vector3(0.82, 0.015, 0.015), metal)
	var kit: Color = _color(club, "kit", Color("c8303a"))
	var kit2: Color = _color(club, "kit2", Color("f3f1f4"))
	var z: float = c.z - 0.13

	_add_box(Vector3(c.x - 0.18, barra_y - 0.2, z), Vector3(0.36, 0.4, 0.02), kit)
	for sx in [-1.0, 1.0]:
		_add_box(Vector3(c.x - 0.18 + sx * 0.21, barra_y - 0.07, z), Vector3(0.08, 0.14, 0.02),
			kit.darkened(0.08))
	_add_box(Vector3(c.x - 0.18, barra_y - 0.02, z - 0.012), Vector3(0.36, 0.03, 0.005), kit2)
	for i in 2:
		_add_box(Vector3(c.x + 0.05 + i * 0.07, barra_y - 0.17, z), Vector3(0.05, 0.32, 0.02),
			kit2 if i == 0 else kit2.darkened(0.06))
	_add_box(Vector3(c.x + 0.28, barra_y - 0.13, z), Vector3(0.24, 0.26, 0.02), kit2.darkened(0.1))



func _bolsa_y_balon(raiz: Node3D, club: Dictionary) -> void:
	_box_parent = raiz
	var bolsa: MeshInstance3D = _add_box(Vector3(-2.0, 0.14, 1.75), Vector3(0.55, 0.28, 0.3),
		Color("1f2a3a"))
	bolsa.rotation_degrees.y = 20.0
	var franja: MeshInstance3D = _add_box(Vector3(-2.0, 0.14, 1.75),
		Vector3(0.56, 0.05, 0.31), _color(club, "kit", Color("c8303a")))
	franja.rotation_degrees.y = 20.0
	_esfera(Vector3(-0.72, 0.11, 0.55), 0.11, Color("e6e6e6"))
	for p in [Vector3(0.0, 0.0, -0.105), Vector3(0.07, 0.05, -0.08), Vector3(-0.07, 0.04, -0.08)]:
		_add_box(Vector3(-0.72, 0.11, 0.55) + p, Vector3(0.045, 0.045, 0.012), Color("202020"))




func _bombilla(raiz: Node3D) -> void:
	var nodo: Node3D = Node3D.new()
	nodo.position = Vector3(0.7, 2.45, -0.3)
	raiz.add_child(nodo)
	_box_parent = nodo
	var cable: float = float(CAJAS[NIVEL_CUARTO]["techo"]) - nodo.position.y
	_add_box(Vector3(0.0, cable * 0.5, 0.0), Vector3(0.01, cable, 0.01), Color("141414"))
	_cilindro(Vector3.ZERO, 0.022, 0.022, 0.07, Color("1a1a1a"))
	_esfera(Vector3(0.0, -0.075, 0.0), 0.045, Color("fff0b8"), true)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = Vector3(0.0, -0.08, 0.0)
	luz.light_color = Color(1.0, 0.86, 0.55)
	luz.light_energy = 1.6
	luz.omni_range = 4.8
	nodo.add_child(luz)
	_box_parent = raiz




func _tele(raiz: Node3D, n: int, local: Dictionary, visita: Dictionary) -> void:
	var t: Dictionary = tele(n)
	var nodo: Node3D = Node3D.new()
	nodo.position = t["at"]
	nodo.rotation_degrees.y = float(t["yaw"])
	raiz.add_child(nodo)
	_box_parent = nodo
	var frente: float
	match n:
		NIVEL_PISO:
			frente = _mueble_piso(t)
		NIVEL_CUARTO:
			frente = _mueble_cuarto(t)
		_:
			frente = _mueble_atico(t)
	_pantalla(nodo, t, frente, local, visita)
	_box_parent = raiz




func _mueble_atico(t: Dictionary) -> float:
	var pantalla: Vector2 = t["pantalla"]
	var cy: float = float(t["centro_y"])
	var mueble: Color = Color("2b2220")
	_add_box(Vector3(0.0, 0.21, -0.05), Vector3(1.8, 0.42, 0.42), mueble)
	_add_box(Vector3(0.0, 0.21, 0.165), Vector3(1.76, 0.02, 0.01), mueble.lightened(0.12))
	_add_box(Vector3(0.0, 0.45, 0.1), Vector3(0.9, 0.06, 0.08), Color("121216"))
	_add_box(Vector3(0.64, 0.45, 0.02), Vector3(0.26, 0.06, 0.22), Color("e6e6ea"))
	_add_box(Vector3(0.0, 0.43, -0.04), Vector3(0.5, 0.02, 0.25), Color("121216"))
	var baja: float = cy - pantalla.y * 0.5
	_add_box(Vector3(0.0,(0.42 + baja) * 0.5, -0.06), Vector3(0.08, baja - 0.42, 0.05),
		Color("121216"))
	_add_box(Vector3(0.0, cy, -0.02), Vector3(pantalla.x + 0.06, pantalla.y + 0.06, 0.05),
		Color("0d0d10"))
	return 0.006




func _mueble_piso(t: Dictionary) -> float:
	var pantalla: Vector2 = t["pantalla"]
	var cy: float = float(t["centro_y"])
	var blanco: Color = Color("d8d5ce")
	_add_box(Vector3(0.0, 0.2, -0.05), Vector3(1.5, 0.4, 0.4), blanco)
	_add_box(Vector3(0.0, 0.415, -0.05), Vector3(1.52, 0.03, 0.42), Color("9c7650"))
	_add_box(Vector3(0.0, 0.2, 0.151), Vector3(0.012, 0.36, 0.01), blanco.darkened(0.25))
	for sx in [-1.0, 1.0]:
		_add_box(Vector3(sx * 0.37, 0.32, 0.155), Vector3(0.14, 0.015, 0.012), Color("6a6a6a"))
	_add_box(Vector3(0.56, 0.455, -0.1), Vector3(0.2, 0.05, 0.14), Color("1a1b1f"))
	_luce(Vector3(0.5, 0.455, -0.028), Vector3(0.014, 0.014, 0.004), Color("5dff7a"))
	_add_box(Vector3(-0.54, 0.47, -0.08), Vector3(0.26, 0.08, 0.2), Color("f0f0f2"))
	var baja: float = cy - pantalla.y * 0.5
	_add_box(Vector3(0.0, 0.44, -0.08), Vector3(0.4, 0.02, 0.2), Color("202024"))
	_add_box(Vector3(0.0,(0.45 + baja) * 0.5, -0.09), Vector3(0.06, baja - 0.45, 0.04),
		Color("202024"))
	_add_box(Vector3(0.0, cy, -0.03), Vector3(pantalla.x + 0.05, pantalla.y + 0.05, 0.05),
		Color("141417"))
	return 0.001




func _mueble_cuarto(t: Dictionary) -> float:
	var pantalla: Vector2 = t["pantalla"]
	var cy: float = float(t["centro_y"])
	var madera: Color = Color("8e6d45")

	_add_box(Vector3(0.0, 0.305, 0.0), Vector3(0.72, 0.03, 0.44), madera)
	_add_box(Vector3(0.0, 0.015, 0.0), Vector3(0.72, 0.03, 0.44), madera.darkened(0.1))
	for sx in [-1.0, 1.0]:
		_add_box(Vector3(sx * 0.345, 0.16, 0.0), Vector3(0.03, 0.29, 0.44), madera)
	for y in [0.09, 0.22]:
		_add_box(Vector3(0.0, y, -0.2), Vector3(0.66, 0.08, 0.02), madera.darkened(0.2))
	_add_box(Vector3(0.05, 0.05, 0.02), Vector3(0.4, 0.04, 0.28), Color("7a8a9a"))

	var beige: Color = Color("cfc6ae")
	var alto: float = 0.58
	var y0: float = 0.32
	_add_box(Vector3(0.0, y0 + alto * 0.5, -0.02), Vector3(0.74, alto, 0.34), beige)
	_add_box(Vector3(0.0, y0 + alto * 0.5 - 0.01, -0.32), Vector3(0.5, 0.44, 0.28),
		beige.darkened(0.1))
	_add_box(Vector3(0.0, cy, 0.151), Vector3(pantalla.x + 0.05, pantalla.y + 0.05, 0.004),
		Color("2e2c28"))
	for i in 3:
		_add_box(Vector3(0.1 + i * 0.07, y0 + 0.045, 0.152), Vector3(0.04, 0.02, 0.008),
			Color("6a655a"))
	_luce(Vector3(-0.28, y0 + 0.045, 0.153), Vector3(0.015, 0.015, 0.004), Color("ff3b2a"))
	var base: Vector3 = Vector3(0.0, y0 + alto + 0.015, -0.1)
	_add_box(base, Vector3(0.12, 0.03, 0.08), Color("2a2a2a"))
	for sx in [-1.0, 1.0]:
		var a: float = deg_to_rad(28.0)
		var cuerno: MeshInstance3D = _add_box(base + Vector3(sx * sin(a) * 0.21,
			cos(a) * 0.21, 0.0), Vector3(0.008, 0.42, 0.008), Color("b0b0b0"))
		cuerno.rotation_degrees.z = -28.0 * sx
	return 0.156





func _pantalla(nodo: Node3D, t: Dictionary, frente: float, local: Dictionary,
		visita: Dictionary) -> void:
	var px: Vector2i = t["px"]
	var cy: float = float(t["centro_y"])
	var tv_vp: SubViewport = SubViewport.new()
	tv_vp.size = px
	tv_vp.disable_3d = true
	tv_vp.transparent_bg = false
	tv_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	tv_vp.canvas_item_default_texture_filter = \
			Viewport.DEFAULT_CANVAS_ITEM_TEXTURE_FILTER_NEAREST
	nodo.add_child(tv_vp)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = Vector3(0.0, cy, 0.7)
	luz.light_color = Color(0.55, 0.72, 1.0)
	luz.light_energy = float(t["luz"])
	luz.omni_range = float(t["alcance"])
	nodo.add_child(luz)
	var tv: TvPartido = TvPartido.new()
	tv.arma(local, visita, luz, px, bool(t["crt"]))
	tv_vp.add_child(tv)
	var m: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = t["pantalla"]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = tv_vp.get_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	q.material = mat
	m.mesh = q
	m.position = Vector3(0.0, cy, frente)
	nodo.add_child(m)


static func _color(team: Dictionary, llave: String, si_no: Color) -> Color:
	var v = team.get(llave)
	if v is Color:
		return v
	if v is String and Color.html_is_valid(v):
		return Color(v)
	return si_no










class TvPartido extends Control:
	const CIFRAS: Dictionary = {
		"0": [7, 5, 5, 5, 7], "1": [2, 6, 2, 2, 7], "2": [7, 1, 7, 4, 7],
		"3": [7, 1, 7, 1, 7], "4": [5, 5, 7, 1, 1], "5": [7, 4, 7, 1, 7],
		"6": [7, 4, 7, 5, 7], "7": [7, 1, 1, 1, 1], "8": [7, 5, 7, 5, 7],
		"9": [7, 5, 7, 1, 7], "-": [0, 0, 7, 0, 0],
	}
	const HORIZONTE: float = 28.0

	const CAL: Color = Color(0.93, 0.95, 0.93)
	var _kits: Array[Color] = []
	var _banderas: Array = []
	var _luz: OmniLight3D = null
	var _base: float = 0.0
	var _crt: bool = false
	var _t: float = 0.0
	var _gente: Array = []
	var _grada: ImageTexture = null










	var _campo: Control = null




	func arma(local: Dictionary, visita: Dictionary, luz: OmniLight3D,
			px: Vector2i = Vector2i(160, 90), crt: bool = false) -> void:
		size = Vector2(px)
		_crt = crt
		var gris: Color = Color("8a8f99")
		_kits = [_c(local, "kit", Color("c8303a")), _c(local, "kit2", Color("f3f1f4")),
			_c(visita, "kit", gris) if not visita.is_empty() else gris,
			_c(visita, "kit2", Color("3a3d44")) if not visita.is_empty() else Color("3a3d44")]
		_banderas = [Flags.for_team(local) if not local.is_empty() else null,
			Flags.for_team(visita) if not visita.is_empty() else null]
		_luz = luz
		_base = luz.light_energy if luz != null else 0.0

		var sitios: Array = [[0.1, 0.5], [0.25, 0.2], [0.25, 0.5], [0.25, 0.8],
			[0.4, 0.3], [0.4, 0.7], [0.46, 0.5]]
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.seed = 4242
		for eq in 2:
			for s in sitios:
				var u: float = s[0] if eq == 0 else 1.0 - s[0]
				_gente.append([u, s[1], rng.randf() * TAU, eq])
		_grada = _pinta_grada(rng, px.x)
		if _campo == null:
			_campo = Control.new()
			_campo.name = "Campo"
			_campo.show_behind_parent = true
			_campo.mouse_filter = Control.MOUSE_FILTER_IGNORE
			_campo.draw.connect(_pinta_campo)
			add_child(_campo)
		_campo.queue_redraw()

	func _c(team: Dictionary, llave: String, si_no: Color) -> Color:
		var v = team.get(llave)
		return v if v is Color else si_no

	func _pinta_grada(rng: RandomNumberGenerator, ancho: int) -> ImageTexture:
		var img: Image = Image.create_empty(ancho, 24, false, Image.FORMAT_RGBA8)
		img.fill(Color("1b2030"))
		for y in range(1, 24, 2):
			for x in ancho:
				if rng.randf() < 0.75:
					var r: float = rng.randf()
					var c: Color = _kits[0] if r < 0.45 else (_kits[1] if r < 0.6 \
							else (_kits[2] if r < 0.72 else Color("c9a27e").darkened(rng.randf() * 0.5)))
					img.set_pixel(x, y, c.darkened(0.25 + rng.randf() * 0.3))
		return ImageTexture.create_from_image(img)

	func _ready() -> void:
		set_process(true)

	func _process(delta: float) -> void:
		_t += delta
		queue_redraw()
		if _luz != null and is_instance_valid(_luz):

			_luz.light_energy = _base *(1.0 + 0.11 * sin(_t * 2.3) + 0.07 * sin(_t * 5.1 + 1.0))

	func _pelota() -> Vector2:
		return Vector2(0.5 + 0.28 * sin(_t * 0.37) + 0.08 * sin(_t * 1.13),
			0.5 + 0.3 * sin(_t * 0.53 + 1.0))

	func _a_pantalla(u: float, v: float) -> Vector2:
		var y: float = HORIZONTE + 3.0 + v *(size.y - HORIZONTE - 6.0)
		var ancho: float = lerpf(1.25, 1.875, v) * size.x
		return Vector2(size.x * 0.5 +(u - 0.5) * ancho, y)

	func _draw() -> void:
		var w: float = size.x
		var h: float = size.y
		draw_texture(_grada, Vector2.ZERO)

		var paso: int = int(_t * 12.0) % 20
		for i in range(-1, int(w / 20.0) + 1):
			var col: Color = _kits[0] if i % 2 == 0 else Color("20242e")
			draw_rect(Rect2(i * 20 + paso, HORIZONTE - 4.0, 20, 4), col.darkened(0.1))



		draw_line(Vector2(0, HORIZONTE), Vector2(w, HORIZONTE), CAL, 1.0)

		var pel: Vector2 = _pelota()
		var orden: Array = _gente.duplicate()
		orden.sort_custom(func(a, b): return a[1] < b[1])
		for p in orden:
			var u: float = p[0] +(pel.x - 0.5) * 0.3 + 0.03 * sin(_t * 0.9 + p[2])
			var v: float = p[1] +(pel.y - 0.5) * 0.25 + 0.04 * sin(_t * 0.7 + p[2] * 1.7)
			_figura(_a_pantalla(u, clampf(v, 0.0, 1.0)), int(p[3]), clampf(v, 0.0, 1.0))
		var pp: Vector2 = _a_pantalla(pel.x, pel.y)
		draw_rect(Rect2(pp.x - 1.0, pp.y, 3.0, 1.0), Color(0, 0, 0, 0.35))
		draw_rect(Rect2(pp.x - 1.0, pp.y - 2.0, 2.0, 2.0), Color.WHITE)
		_marcador()
		if _crt:
			_tubo()




	func _pinta_campo() -> void:
		var w: float = size.x
		var h: float = size.y

		_campo.draw_rect(Rect2(0, HORIZONTE, w, h - HORIZONTE), Color("3c8a3a"))
		for i in range(-9, 9):
			if i % 2 == 0:
				continue
			var a0: float = w * 0.5 + i * 14.0
			var b0: float = w * 0.5 + i * 22.0
			_campo.draw_colored_polygon(PackedVector2Array([Vector2(a0, HORIZONTE),
				Vector2(a0 + 14.0, HORIZONTE), Vector2(b0 + 22.0, h), Vector2(b0, h)]),
				Color("347c33"))
		_campo.draw_line(Vector2(w * 0.5, HORIZONTE), Vector2(w * 0.5, h), CAL, 1.0)
		_campo.draw_set_transform(Vector2(w * 0.5, 52.0), 0.0, Vector2(1.0, 0.42))
		_campo.draw_arc(Vector2.ZERO, 17.0, 0.0, TAU, 28, CAL, 1.0)
		_campo.draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE)

	func _figura(pie: Vector2, eq: int, v: float) -> void:
		var alto: float = roundf(lerpf(6.0, 9.0, v))
		var x: float = roundf(pie.x)
		var y: float = roundf(pie.y)
		var camiseta: Color = _kits[eq * 2]
		var short: Color = _kits[eq * 2 + 1]
		draw_rect(Rect2(x - 1, y - 2, 1, 2), Color("1a1a1a"))
		draw_rect(Rect2(x + 1, y - 2, 1, 2), Color("1a1a1a"))
		draw_rect(Rect2(x - 1, y - 3, 3, 1), short)
		draw_rect(Rect2(x - 1, y - alto + 2, 3, alto - 5), camiseta)
		draw_rect(Rect2(x - 1, y - alto, 2, 2), Color("c9926a"))



	func _marcador() -> void:
		var x: float = 3.0
		var y: float = 3.0
		draw_rect(Rect2(x, y, 52, 9), Color(0.05, 0.06, 0.09, 0.88))
		_bandera(0, Rect2(x + 1, y + 1, 10, 7))
		_texto("0-0", Vector2(x + 14, y + 2), Color.WHITE)
		_bandera(1, Rect2(x + 27, y + 1, 10, 7))
		var minuto: int = int(_t / 1.6) % 90 + 1
		draw_rect(Rect2(x + 39, y, 13, 9), Color(0.85, 0.12, 0.14, 0.95))
		_texto("%d" % minuto, Vector2(x + 41 +(0 if minuto >= 10 else 2), y + 2),
			Color.WHITE)

		if int(_t * 1.5) % 2 == 0:
			draw_rect(Rect2(size.x - 7, 4, 3, 3), Color(0.95, 0.15, 0.15))




	func _tubo() -> void:
		var w: float = size.x
		var h: float = size.y
		for y in range(0, int(h), 2):
			draw_rect(Rect2(0, y, w, 1), Color(0, 0, 0, 0.22))
		draw_rect(Rect2(0, fmod(_t * 14.0, h + 24.0) - 12.0, w, 8), Color(1, 1, 1, 0.07))
		for i in 30:
			draw_rect(Rect2(randi() % int(w), randi() % int(h), 1, 1),
				Color(1, 1, 1, randf() * 0.5))
		for k in 3:
			var c: Color = Color(0, 0, 0, 0.45 - k * 0.13)
			draw_rect(Rect2(k, k, w - 2 * k, 1), c)
			draw_rect(Rect2(k, h - 1 - k, w - 2 * k, 1), c)
			draw_rect(Rect2(k, k + 1, 1, h - 2 * k - 2), c)
			draw_rect(Rect2(w - 1 - k, k + 1, 1, h - 2 * k - 2), c)
		draw_rect(Rect2(0, 0, w, h), Color(0.55, 0.75, 0.55, 0.06))

	func _bandera(i: int, r: Rect2) -> void:
		var tex = _banderas[i]
		if tex is Texture2D:
			draw_texture_rect(tex, r, false)
		else:
			draw_rect(r, Color("5a5e66"))

	func _texto(s: String, at: Vector2, col: Color) -> void:
		var x: float = at.x
		for ch in s:
			var filas: Array = CIFRAS.get(ch, [])
			for fy in filas.size():
				for fx in 3:
					if int(filas[fy])&(4>>fx):
						draw_rect(Rect2(x + fx, at.y + fy, 1, 1), col)
			x += 4.0
