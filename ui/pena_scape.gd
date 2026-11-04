class_name PenaScape
extends Node3D



































const ROOM_W: float = 9.0
const ROOM_D: float = 7.0
const ROOM_H: float = 2.8
const WALL_Z: float = -3.5
const FRONT_Z: float = 3.5










const EXT_Z: float = 8.7



const BAR_Z: float = -1.9
const BAR_W: float = 6.6
const BAR_H: float = 1.06
const BAR_D: float = 0.64






const SHELF_Y: float = 1.28
const SHELF_D: float = 0.26







const CREST_M: float = 1.05
const CREST_Y: float = 2.05
const CREST_TELA: float = 1.4






const C_FLOOR: Color = Color("54463a")
const C_WALL: Color = Color("6d5f4e")
const C_WAINSCOT: Color = Color("4a3a2a")
const C_CEIL: Color = Color("463b31")
const C_BAR_TOP: Color = Color("7a5a36")
const C_BAR_BODY: Color = Color("4f3a24")
const C_SHELF: Color = Color("5c4630")
const C_METAL: Color = Color("8a8f96")

const BOTTLE_COLORS: Array[Color] = [
	Color("2f4a2a"), Color("6b3320"), Color("caa14a"), Color("3a3f52"),
	Color("7a2a2a"), Color("d8d2bd"),
]



var club_a: Color = Color("2e5cff")
var club_b: Color = Color("ffffff")


var crest: Texture2D = null



var fervor: float = 0.0
var seed_key: String = "pena"






var barra_y: float = BAR_H
var barra_z: float = BAR_Z

var _mats: Dictionary = {}
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()


func _ready() -> void:
	_rng.seed = hash(seed_key)
	_sala()
	_barra()
	_trasera()
	_pared_de_la_pena()
	_banderines()
	_mesas()
	_trastos()








func _mat(col: Color, emissive: float = 0.0) -> StandardMaterial3D:
	var key: String = "%s|%.2f" % [col.to_html(), emissive]
	if _mats.has(key):
		return _mats[key]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	if emissive > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emissive
	_mats[key] = mat
	return mat


func _box(at: Vector3, size: Vector3, col: Color, emissive: float = 0.0,
		into: Node = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emissive)
	m.mesh = box
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(into if into != null else self).add_child(m)
	return m





func _lote(size: Vector3, puntos: Array[Vector3], col: Color,
		emissive: float = 0.0) -> void:
	if puntos.is_empty():
		return
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emissive)
	mm.mesh = box
	mm.instance_count = puntos.size()
	for i in puntos.size():
		mm.set_instance_transform(i, Transform3D(Basis(), puntos[i]))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(mmi)








func _sala() -> void:



	var largo: float = EXT_Z - WALL_Z
	var cz: float =(WALL_Z + EXT_Z) * 0.5
	_box(Vector3(0.0, -0.06, cz), Vector3(ROOM_W, 0.12, largo), C_FLOOR)



	var juntas: Array[Vector3] = []
	var jz: float = WALL_Z + 0.9
	while jz < EXT_Z:
		var jx: float = - ROOM_W * 0.5 + 0.9
		while jx < ROOM_W * 0.5:
			juntas.append(Vector3(jx, 0.015, jz))
			jx += 1.3
		jz += 1.3
	_lote(Vector3(1.2, 0.05, 1.2), juntas, C_FLOOR.lightened(0.07))
	_box(Vector3(0.0, ROOM_H + 0.06, cz), Vector3(ROOM_W, 0.12, largo), C_CEIL)

	_box(Vector3(0.0, ROOM_H * 0.5, WALL_Z - 0.08),
		Vector3(ROOM_W, ROOM_H, 0.16), C_WALL)
	for s: float in [-1.0, 1.0]:
		_box(Vector3((ROOM_W * 0.5 + 0.08) * s, ROOM_H * 0.5, cz),
			Vector3(0.16, ROOM_H, largo), C_WALL.darkened(0.1))



	_box(Vector3(0.0, 0.46, WALL_Z + 0.03), Vector3(ROOM_W, 0.92, 0.08), C_WAINSCOT)
	for s: float in [-1.0, 1.0]:
		_box(Vector3((ROOM_W * 0.5 - 0.04) * s, 0.46, cz),
			Vector3(0.08, 0.92, largo), C_WAINSCOT.darkened(0.08))





func _barra() -> void:
	_box(Vector3(0.0, BAR_H * 0.5 - 0.05, BAR_Z), Vector3(BAR_W, BAR_H - 0.1, BAR_D),
		C_BAR_BODY)
	_box(Vector3(0.0, BAR_H, BAR_Z + 0.09), Vector3(BAR_W + 0.16, 0.1, BAR_D + 0.26),
		C_BAR_TOP)





	for px: float in [-2.35, -0.78, 0.78, 2.35]:
		_box(Vector3(px, BAR_H * 0.5 - 0.02, BAR_Z + BAR_D * 0.5 + 0.03),
			Vector3(1.32, BAR_H - 0.34, 0.05), C_BAR_BODY.lightened(0.1))
	barra_y = BAR_H + 0.05
	barra_z = BAR_Z + 0.09


	_box(Vector3(0.0, 0.16, BAR_Z + 0.36), Vector3(BAR_W, 0.06, 0.06),
		Color("b08a3a"), 0.25)

	_box(Vector3(2.05, BAR_H + 0.1, BAR_Z - 0.1), Vector3(0.52, 0.1, 0.22),
		C_METAL)
	for i in 3:
		_box(Vector3(1.86 + float(i) * 0.19, BAR_H + 0.32, BAR_Z - 0.1),
			Vector3(0.07, 0.36, 0.07), C_METAL.lightened(0.1))









	for x: float in [-3.4, -0.62, 0.62, 3.35]:
		_taburete(x + _rng.randf_range(-0.1, 0.1),
			BAR_Z + 0.62 + _rng.randf_range(-0.08, 0.12),
			_rng.randf_range(-24.0, 24.0))


func _taburete(x: float, z: float, giro: float) -> void:
	var asiento: MeshInstance3D = _box(Vector3(x, 0.74, z),
		Vector3(0.36, 0.08, 0.36), C_BAR_TOP.darkened(0.1))
	asiento.rotation_degrees = Vector3(0.0, giro, 0.0)
	_box(Vector3(x, 0.36, z), Vector3(0.07, 0.68, 0.07), C_METAL)
	_box(Vector3(x, 0.04, z), Vector3(0.34, 0.05, 0.34), C_METAL.darkened(0.15))






func _trasera() -> void:
	for piso in 1:
		var y: float = SHELF_Y
		_box(Vector3(0.0, y, WALL_Z + SHELF_D * 0.5 + 0.02),
			Vector3(ROOM_W * 0.72, 0.05, SHELF_D), C_SHELF)





		var pos: Array[Vector3] = []
		var tono: Array[int] = []
		var x: float = - ROOM_W * 0.34
		while x < ROOM_W * 0.34:
			pos.append(Vector3(x, y + 0.17,
				WALL_Z + 0.16 + _rng.randf_range(0.0, 0.06)))
			tono.append(_rng.randi() % BOTTLE_COLORS.size())
			x += _rng.randf_range(0.13, 0.22)
		for c in BOTTLE_COLORS.size():


			var pts: Array[Vector3] = []
			for i in pos.size():
				if tono[i] == c:
					pts.append(pos[i])
			_lote(Vector3(0.085, 0.3, 0.085), pts, BOTTLE_COLORS[c])

	var vasos: Array[Vector3] = []
	for i in 14:
		vasos.append(Vector3(-2.9 + float(i % 7) * 0.17, BAR_H + 0.14,
			BAR_Z - 0.14 + float(i / 7) * 0.17))
	_lote(Vector3(0.11, 0.14, 0.11), vasos, Color("cfd6dc"))





func _pared_de_la_pena() -> void:
	var zp: float = WALL_Z + 0.04


	_box(Vector3(0.0, CREST_Y, zp + 0.01),
		Vector3(CREST_TELA, CREST_TELA, 0.04), club_a)
	if crest != null:
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = crest
		spr.pixel_size = CREST_M / float(maxi(crest.get_height(), 1))


		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.position = Vector3(0.0, CREST_Y, zp + 0.04)
		add_child(spr)
	else:
		for f in 3:
			if f % 2 == 0:
				continue
			_box(Vector3(0.0, CREST_Y - 0.46 + float(f) * 0.46, zp + 0.03),
				Vector3(CREST_TELA * 0.92, 0.4, 0.03), club_b)




	var n_buf: int = int(round(lerpf(3.0, 7.0, fervor)))
	for i in n_buf:
		var x: float = lerpf(-3.55, 3.55,(float(i) + 0.5) / float(n_buf))
		if absf(x) < 1.05:
			continue
		var y: float = 2.06 + _rng.randf_range(-0.12, 0.1)
		var col: Color = club_a if i % 2 == 0 else club_b
		_box(Vector3(x, y, zp), Vector3(0.62, 0.1, 0.03), col)
		_box(Vector3(x, y - 0.2, zp), Vector3(0.44, 0.34, 0.03), col.darkened(0.1))
		for s: float in [-1.0, 1.0]:
			_box(Vector3(x + 0.27 * s, y - 0.05, zp), Vector3(0.1, 0.22, 0.03),
				club_b if i % 2 == 0 else club_a)


	for lado: float in [-1.0, 1.0]:
		for i in 2:
			var marco: MeshInstance3D = _box(
				Vector3((ROOM_W * 0.5 - 0.14) * lado, 1.62 + float(i) * 0.56,
					-1.1 + float(i) * 1.3),
				Vector3(0.04, 0.42, 0.56), Color("2b241c"))
			marco.rotation_degrees = Vector3(_rng.randf_range(-4.0, 4.0), 0.0, 0.0)
			_box(Vector3((ROOM_W * 0.5 - 0.18) * lado, 1.62 + float(i) * 0.56,
					-1.1 + float(i) * 1.3),
				Vector3(0.03, 0.32, 0.46), Color("8d8570"))


	_box(Vector3(-3.3, 2.22, WALL_Z + 0.3), Vector3(1.18, 0.68, 0.1),
		Color("15161a"))
	_box(Vector3(-3.3, 2.22, WALL_Z + 0.36), Vector3(1.04, 0.56, 0.05),
		Color("6f8fb8"), 1.8)





func _banderines() -> void:







	var tiras: int = 3 if fervor < 0.5 else 4
	for tira in tiras:
		var z0: float = -1.4 + float(tira) * 2.3
		var cuerda: Array[Vector3] = []
		var uno: Array[Vector3] = []
		var dos: Array[Vector3] = []
		var n: int = 26
		for i in n:
			var k: float = float(i) / float(n - 1)
			var x: float = lerpf(- ROOM_W * 0.46, ROOM_W * 0.46, k)


			var y: float = ROOM_H - 0.16 - sin(k * PI) * 0.34
			cuerda.append(Vector3(x, y, z0))



			if i % 2 == 0:
				uno.append(Vector3(x, y - 0.13, z0))
			else:
				dos.append(Vector3(x, y - 0.13, z0))
		_lote(Vector3(0.36, 0.02, 0.02), cuerda, Color("2e2823"))
		_lote(Vector3(0.16, 0.22, 0.02), uno, club_a)
		_lote(Vector3(0.16, 0.22, 0.02), dos, club_b)




func _mesas() -> void:
	for m: Array in [[-3.05, 1.3, 8.0], [3.1, 1.7, -12.0]]:
		var x: float = float(m[0])
		var z: float = float(m[1])
		var tablero: MeshInstance3D = _box(Vector3(x, 0.76, z),
			Vector3(0.86, 0.06, 0.86), C_BAR_TOP.darkened(0.06))
		tablero.rotation_degrees = Vector3(0.0, float(m[2]), 0.0)
		_box(Vector3(x, 0.38, z), Vector3(0.1, 0.72, 0.1), C_METAL.darkened(0.2))
		_box(Vector3(x, 0.03, z), Vector3(0.52, 0.05, 0.52), C_METAL.darkened(0.25))

		var vasos: Array[Vector3] = []
		for i in 4:
			vasos.append(Vector3(x + _rng.randf_range(-0.28, 0.28), 0.86,
				z + _rng.randf_range(-0.28, 0.28)))
		_lote(Vector3(0.1, 0.15, 0.1), vasos, Color("d8cfae"))

		for s: float in [-1.0, 1.0]:
			var silla: MeshInstance3D = _box(Vector3(x + 0.72 * s, 0.44, z + 0.14 * s),
				Vector3(0.4, 0.06, 0.4), C_WAINSCOT)
			silla.rotation_degrees = Vector3(0.0, _rng.randf_range(-30.0, 30.0), 0.0)
			_box(Vector3(x + 0.9 * s, 0.72, z + 0.14 * s),
				Vector3(0.08, 0.62, 0.4), C_WAINSCOT.darkened(0.1))





func _trastos() -> void:


	var jarras: Array[Vector3] = []
	for i in 7:
		jarras.append(Vector3(_rng.randf_range(-1.5, 1.5), BAR_H + 0.16,
			BAR_Z + _rng.randf_range(0.02, 0.2)))
	_lote(Vector3(0.12, 0.18, 0.12), jarras, Color("c9a047"))

	var pano: MeshInstance3D = _box(Vector3(-1.95, BAR_H + 0.08, BAR_Z + 0.14),
		Vector3(0.34, 0.03, 0.24), Color("b9b2a0"))
	pano.rotation_degrees = Vector3(0.0, 22.0, 0.0)


	_box(Vector3(2.95, 2.3, WALL_Z + 0.05), Vector3(0.4, 0.4, 0.05),
		Color("2b241c"))
	_box(Vector3(2.95, 2.3, WALL_Z + 0.08), Vector3(0.3, 0.3, 0.03),
		Color("e6dcc2"), 0.6)


	for x: float in [-2.1, 2.1]:
		_box(Vector3(x, ROOM_H - 0.24, BAR_Z + 1.3), Vector3(0.03, 0.48, 0.03),
			Color("2b241c"))
		_box(Vector3(x, ROOM_H - 0.52, BAR_Z + 1.3), Vector3(0.4, 0.16, 0.4),
			Color("ffd9a0"), 2.4)
