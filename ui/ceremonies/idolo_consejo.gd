extends Ceremony
























const SUELO: Color = Color("4a3024")
const PARED: Color = Color("5c2626")
const ZOCALO: Color = Color("2e1712")
const FONDO: Color = Color("0a0706")
const MANTEL: Color = Color("efe8d8")
const MADERA: Color = Color("4a2a1a")
const NOCHE: Color = Color("16233d")
const FAROLA: Color = Color("ffd27a")
const LATON: Color = Color("9a7a3a")
const CORTINA: Color = Color("5a1418")
const ALFOMBRA: Color = Color("3e1616")
const EDIFICIO: Color = Color("0c1222")
const LUNA: Color = Color("efe6c8")
const NEBLINA: Color = Color("150d09")
const FONDO_CUADRO: Color = Color("1d1612")
const CESPED_FOTO: Color = Color("3d5634")
const CAMISA_FOTO: Color = Color("d8d0c0")
const PIEL_FOTO: Color = Color("c89a74")
const BARRA_TAPA: Color = Color("2a1a10")
const ESPEJO: Color = Color("2a2222")
const CRISTAL: Color = Color(0.82, 0.86, 0.88, 0.45)
const VINO: Color = Color("6a1020")
const CUBIERTO: Color = Color("b8bcc0")
const BOTELLAS: Array[Color] = [Color("6a3a12"), Color("1f3a24"), Color("c8c0a0"),
	Color("7a1c22"), Color("3a2a10")]

const ANCHO_SALA: float = 26.0

const ALTO_FRISO: float = 1.1


const ALTO_TECHO: float = 4.3
const TECHO: Color = Color("1c120c")

const VENTANA: Rect2 = Rect2(-1.75, 1.7, 1.5, 1.65)

const SKYLINE: Array[Vector3] = [Vector3(0.0, 0.16, 0.42), Vector3(0.14, 0.3, 0.62),
	Vector3(0.3, 0.4, 0.35), Vector3(0.4, 0.58, 0.74), Vector3(0.58, 0.7, 0.48),
	Vector3(0.7, 0.86, 0.58), Vector3(0.86, 1.0, 0.38)]
const LUNA_EN: Vector2 = Vector2(0.8, 0.86)

const CAMISETA_EN: Vector2 = Vector2(1.0, 2.55)
const BALDAS_Y: Array[float] = [1.6, 2.1]

const HOJAS: Array = [[0.0, 0.75, 0.0, 0.5, 0.4, Color("1e3020")],
	[-0.18, 0.95, 0.0, 0.3, 0.35, Color("2a4028")], [0.2, 1.0, 0.02, 0.3, 0.4, Color("1e3020")],
	[0.0, 1.2, 0.0, 0.32, 0.3, Color("2a4028")], [-0.08, 1.36, 0.0, 0.2, 0.2, Color("1e3020")]]

const LAMPARA_Y: float = 2.3
const LLAMA_Y: float = 1.055
const WALL_Z: float = -3.6
const MESA_Z: float = -1.95
const SILLA_Z: float = -2.35


const YO_X: float = -0.5
const EL_X: float = 0.5

const MESAS_RECOGIDAS: Array = [Vector2(-2.7, -3.0), Vector2(2.7, -3.0), Vector2(-5.9, -2.3),
	Vector2(5.6, -1.5)]

const LUCES_CIUDAD: Array = [
	Vector2(-0.82, -0.55), Vector2(-0.6, -0.3), Vector2(-0.35, -0.62), Vector2(-0.1, -0.4),
	Vector2(0.18, -0.58), Vector2(0.4, -0.25), Vector2(0.66, -0.5), Vector2(0.85, -0.68),
	Vector2(-0.7, 0.05), Vector2(0.55, 0.1),
]


const SENTADO_HOJA: String = "res://assets/sprites/anim/sentado_foto_south_"






const TURNOS_T: Array = [
	Vector2(4.5, 9.0),
	Vector2(9.4, 11.6),
	Vector2(12.4, 16.0),
	Vector2(16.5, 21.3),
	Vector2(21.8, 27.2),
	Vector2(28.4, 30.8),
	Vector2(31.6, 37.3),
	Vector2(38.3, 40.5),
	Vector2(40.9, 43.1),
]



const CARAS: Array = [
	["alegria", "alegria"],
	["alegria", "buena"],
	["normal", "concentra"],
	["buena", "concentra"],
	["tristeza", "tristeza"],
	["tristeza", "tristeza"],
	["buena", "tristeza"],
	["llorar_alegria", "llorar_alegria"],
	["llorar_alegria", "llorar_alegria"],
]

const CARAS_ENTRADA: Array = ["normal", "normal"]
const T_CHYRON_CENA: float = 0.8
const T_CARD_CENA: float = 44.0



const KEYS_CENA: Array = [
	{"t": 0.0, "dist": 11.5, "h": 3.6, "yaw": 180.0, "aim_y": 1.4, "fov": 40.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 4.5, "dist": 8.0, "h": 2.7, "yaw": 181.0, "aim_y": 1.2, "fov": 36.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 21.0, "dist": 6.4, "h": 2.2, "yaw": 179.0, "aim_y": 1.15, "fov": 34.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 38.0, "dist": 5.4, "h": 1.9, "yaw": 180.0, "aim_y": 1.1, "fov": 33.0,
		"focus_x": 0.0, "focus_z": -2.2},
	{"t": 43.6, "dist": 10.5, "h": 3.3, "yaw": 181.0, "aim_y": 1.3, "fov": 38.0,
		"focus_x": 0.0, "focus_z": -2.2},
]
const DRIFT: float = 0.12


const CITA_ARRIBA_TUMBADO: float = 280.0

const CITA_LINEAS: int = 5




const AIM_TUMBADO: float = 0.45

var _yo: AnimatedSprite3D = null
var _el: AnimatedSprite3D = null
var _citas: Array[PanelContainer] = []
var _vela: OmniLight3D = null
var _llama: MeshInstance3D = null
var _materiales: Dictionary = {}
var _turno_visto: int = -2


func _build() -> void:
	_sala()
	focus = Vector3(0.0, 0.0, -2.2)
	make_camera(_keys_cena(), 36.0)
	orbit_speed = DRIFT
	_yo = _sentado(GameState.team_custom.duplicate(), YO_X, "YoCena")
	_el = _sentado(KitRecolor.appearance_for(String(data.get("cara", "")), {}), EL_X,
		"IdoloCena")


	player = _yo
	_mesa()
	_build_textos()
	_caras(-1)





func _sentado(cfg: Dictionary, x: float, nombre: String) -> AnimatedSprite3D:
	var gala: Dictionary = KitRecolor.GALA_WEAR.preview_cfg(cfg)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.set_animation_loop("default", true)
	frames.set_animation_speed("default", 4.5)
	var rutas: Array = []
	for i in range(1, 6):
		var path: String = "%s%02d.png" % [SENTADO_HOJA, i]
		if ResourceLoader.exists(path):
			frames.add_frame("default", KitRecolor.apply(load(path), gala))
			rutas.append(path)
	frames.rename_animation("default", "idle")
	frames.set_meta("look_cfg", gala)
	frames.set_meta("cara_fuentes", {"idle": rutas})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = nombre
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = frames
	spr.position = Vector3(x, feet_offset(spr.pixel_size, SENTADO_HOJA + "01.png"), SILLA_Z)
	spr.play("idle")
	viewport.add_child(spr)
	CaraViva.pon(spr)
	return spr





















func _sala() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("ffc89a")
	e.ambient_light_energy = 0.42
	e.fog_enabled = true
	e.fog_light_color = NEBLINA
	e.fog_density = 0.011
	e.fog_sky_affect = 0.0
	env.environment = e
	viewport.add_child(env)
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("ffe2b8")
	luz.light_energy = 0.22
	luz.rotation_degrees = Vector3(-60.0, 5.0, 0.0)
	viewport.add_child(luz)


	_plano(Vector3(0.0, 0.0, 0.0), Vector2(ANCHO_SALA, 16.0), _tex_tarima(),
		Vector2(1.28, 1.28), true)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(ANCHO_SALA, 1.0, 16.0), SUELO)
	_plano(Vector3(0.0,(ALTO_FRISO + ALTO_TECHO) * 0.5, WALL_Z),
		Vector2(ANCHO_SALA, ALTO_TECHO - ALTO_FRISO),
		_tex_papel(), Vector2(0.64, 0.64), false)
	_plano(Vector3(0.0, ALTO_FRISO * 0.5, WALL_Z + 0.01), Vector2(ANCHO_SALA, ALTO_FRISO),
		_tex_friso(), Vector2(1.0, ALTO_FRISO), false)
	_caja(Vector3(0.0, ALTO_TECHO * 0.5, WALL_Z - 0.12), Vector3(ANCHO_SALA, ALTO_TECHO, 0.2), FONDO)
	_caja(Vector3(0.0, 0.06, WALL_Z + 0.03), Vector3(ANCHO_SALA, 0.12, 0.05), ZOCALO)
	_caja(Vector3(0.0, ALTO_FRISO + 0.02, WALL_Z + 0.04), Vector3(ANCHO_SALA, 0.06, 0.07),
		MADERA.lightened(0.12))
	_caja(Vector3(0.0, ALTO_TECHO - 0.08, WALL_Z + 0.05), Vector3(ANCHO_SALA, 0.16, 0.12), MADERA)


	_caja(Vector3(0.0, ALTO_TECHO + 0.05, 4.5), Vector3(ANCHO_SALA, 0.1, 16.5), TECHO)
	for i in 8:
		_caja(Vector3(0.0, ALTO_TECHO - 0.09, WALL_Z + 0.6 + i * 1.8),
			Vector3(ANCHO_SALA, 0.18, 0.24), MADERA.darkened(0.35))
	_alfombra()
	_ventana()
	_camiseta_enmarcada()
	_cuadro(Vector2(-3.55, 2.45), Vector2(0.62, 0.48), "equipo")
	_cuadro(Vector2(3.55, 2.45), Vector2(0.62, 0.48), "copa")
	_cuadro(Vector2(-4.75, 2.85), Vector2(0.42, 0.32), "estadio")

	var ap: OmniLight3D = OmniLight3D.new()
	ap.light_color = Color("ffb870")
	ap.light_energy = 0.6
	ap.omni_range = 2.6
	ap.position = Vector3(-2.6, 2.75, WALL_Z + 0.4)
	viewport.add_child(ap)
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * 2.6, 2.6, WALL_Z + 0.06), Vector3(0.06, 0.22, 0.08), LATON)
		_caja(Vector3(lado * 2.6, 2.78, WALL_Z + 0.14), Vector3(0.2, 0.16, 0.16),
			Color("ffd890") if lado < 0.0 else Color("6a5a40"), lado < 0.0)
	_barra()
	_planta(Vector2(-4.55, -3.25))
	for m: Vector2 in MESAS_RECOGIDAS:
		_mesa_recogida(m)
	_lampara()




func _ventana() -> void:
	var r: Rect2 = VENTANA
	var cx: float = r.position.x + r.size.x * 0.5
	var cy: float = r.position.y + r.size.y * 0.5
	var z: float = WALL_Z
	_caja(Vector3(cx, cy, z + 0.03), Vector3(r.size.x + 0.16, r.size.y + 0.16, 0.05), MADERA)
	_caja(Vector3(cx, cy, z + 0.06), Vector3(r.size.x, r.size.y, 0.02), NOCHE, true)
	_caja(Vector3(r.position.x + r.size.x * LUNA_EN.x, r.position.y + r.size.y * LUNA_EN.y,
		z + 0.075), Vector3(0.1, 0.1, 0.01), LUNA, true)
	for b: int in SKYLINE.size():
		var ed: Vector3 = SKYLINE[b]
		var x0: float = r.position.x + r.size.x * ed.x
		var x1: float = r.position.x + r.size.x * ed.y
		var alto: float = r.size.y * ed.z
		_caja(Vector3((x0 + x1) * 0.5, r.position.y + alto * 0.5, z + 0.08),
			Vector3(x1 - x0, alto, 0.01), EDIFICIO, true)


		var i: int = 0
		var y: float = r.position.y + 0.08
		while y < r.position.y + alto - 0.06:
			var x: float = x0 + 0.045
			while x < x1 - 0.03:
				if (i * 7 + b * 5) % 4 == 0:
					_caja(Vector3(x, y, z + 0.09), Vector3(0.028, 0.034, 0.01), FAROLA, true)
				i += 1
				x += 0.07
			y += 0.085

	_caja(Vector3(cx, cy, z + 0.11), Vector3(0.05, r.size.y, 0.03), MADERA)
	_caja(Vector3(cx, r.position.y + r.size.y * 0.62, z + 0.11), Vector3(r.size.x, 0.05, 0.03),
		MADERA)
	_caja(Vector3(cx, r.position.y - 0.08, z + 0.1), Vector3(r.size.x + 0.3, 0.06, 0.2),
		MADERA.lightened(0.1))


	for lado: float in [-1.0, 1.0]:
		var x: float = cx + lado *(r.size.x * 0.5 + 0.22)
		_caja(Vector3(x, 2.55, z + 0.14), Vector3(0.4, 2.5, 0.06), CORTINA)
		for k: float in [-0.1, 0.08]:
			_caja(Vector3(x + k, 2.55, z + 0.175), Vector3(0.035, 2.5, 0.02),
				CORTINA.darkened(0.3))
		_caja(Vector3(x, 2.0, z + 0.19), Vector3(0.42, 0.06, 0.03), LATON)
	_caja(Vector3(cx, r.end.y + 0.32, z + 0.16), Vector3(r.size.x + 1.0, 0.28, 0.08),
		CORTINA.darkened(0.15))
	_caja(Vector3(cx, r.end.y + 0.47, z + 0.2), Vector3(r.size.x + 1.15, 0.03, 0.03), LATON)






func _camiseta_enmarcada() -> void:
	var c: Vector2 = CAMISETA_EN
	_caja(Vector3(c.x, c.y, WALL_Z + 0.04), Vector3(0.9, 1.08, 0.05), LATON.darkened(0.15))
	_caja(Vector3(c.x, c.y, WALL_Z + 0.07), Vector3(0.78, 0.96, 0.02), FONDO_CUADRO)
	_caja(Vector3(c.x, c.y - 0.64, WALL_Z + 0.06), Vector3(0.34, 0.07, 0.02), LATON, true)

	_caja(Vector3(c.x, c.y + 0.62, WALL_Z + 0.16), Vector3(0.4, 0.045, 0.06), LATON)
	var foco: OmniLight3D = OmniLight3D.new()
	foco.light_color = Color("ffd6a0")
	foco.light_energy = 0.55
	foco.omni_range = 1.4
	foco.position = Vector3(c.x, c.y + 0.5, WALL_Z + 0.45)
	viewport.add_child(foco)
	var club: String = String(data.get("club_idolo", ""))
	var dorsal: int = int(data.get("dorsal_idolo", 0))
	if club.is_empty() or dorsal <= 0:
		_foto_equipo(c, Vector2(0.7, 0.86), WALL_Z + 0.085)
		return
	var kit: Dictionary = GameState.kit_variant(Teams.by_id(club), 0).duplicate()
	kit["apellido"] = Espalda.apellido_de(String(data.get("nombre", "")))
	var cam: Sprite3D = make_jersey(kit, dorsal, 0.72, c.y)
	cam.name = "CamisetaEnmarcada"
	cam.position = Vector3(c.x, c.y, WALL_Z + 0.1)


	cam.no_depth_test = false
	cam.render_priority = 0
	for h: Node in cam.get_children():
		if h is Sprite3D:
			(h as Sprite3D).no_depth_test = false



func _cuadro(c: Vector2, size: Vector2, motivo: String) -> void:
	_caja(Vector3(c.x, c.y, WALL_Z + 0.04), Vector3(size.x + 0.08, size.y + 0.08, 0.04),
		LATON.darkened(0.2))
	_caja(Vector3(c.x, c.y, WALL_Z + 0.065), Vector3(size.x, size.y, 0.01), FONDO_CUADRO)
	var z: float = WALL_Z + 0.075
	match motivo:
		"equipo":
			_foto_equipo(c, size, z)
		"copa":
			_caja(Vector3(c.x, c.y + 0.06, z), Vector3(0.14, 0.14, 0.01), LATON, true)
			_caja(Vector3(c.x, c.y - 0.05, z), Vector3(0.04, 0.1, 0.01), LATON, true)
			_caja(Vector3(c.x, c.y - 0.12, z), Vector3(0.14, 0.04, 0.01), LATON, true)
			for lado: float in [-1.0, 1.0]:
				_caja(Vector3(c.x + lado * 0.1, c.y + 0.08, z), Vector3(0.04, 0.08, 0.01),
					LATON, true)
		"estadio":
			_caja(Vector3(c.x, c.y - size.y * 0.3, z), Vector3(size.x, size.y * 0.3, 0.01),
				CESPED_FOTO, true)
			for k in 5:
				_caja(Vector3(c.x - size.x * 0.4 + k * size.x * 0.2, c.y + size.y * 0.32, z),
					Vector3(0.025, 0.025, 0.01), FAROLA, true)



func _foto_equipo(c: Vector2, size: Vector2, z: float) -> void:
	_caja(Vector3(c.x, c.y - size.y * 0.32, z), Vector3(size.x, size.y * 0.36, 0.01),
		CESPED_FOTO, true)
	for fila in 2:
		var y: float = c.y - size.y * 0.08 + fila * size.y * 0.2
		for k in 6:
			var x: float = c.x - size.x * 0.38 + k * size.x * 0.152 + fila * size.x * 0.03
			_caja(Vector3(x, y, z + 0.004), Vector3(size.x * 0.08, size.y * 0.1, 0.01),
				CAMISA_FOTO, true)
			_caja(Vector3(x, y + size.y * 0.085, z + 0.004),
				Vector3(size.x * 0.05, size.y * 0.06, 0.01), PIEL_FOTO, true)




func _barra() -> void:
	var x0: float = 4.5
	var x1: float = 7.6
	var cx: float =(x0 + x1) * 0.5
	var ancho: float = x1 - x0
	var zb: float = WALL_Z + 0.75
	_caja(Vector3(cx, 0.52, zb), Vector3(ancho, 1.04, 0.55), MADERA)
	for k in 5:
		_caja(Vector3(x0 + 0.3 + k *(ancho - 0.6) / 4.0, 0.52, zb + 0.28),
			Vector3(0.035, 0.9, 0.02), MADERA.darkened(0.3))
	_caja(Vector3(cx, 1.07, zb), Vector3(ancho + 0.1, 0.05, 0.64), BARRA_TAPA)
	_caja(Vector3(cx, 0.08, zb + 0.29), Vector3(ancho, 0.05, 0.04), LATON)

	_caja(Vector3(cx, 2.0, WALL_Z + 0.05), Vector3(ancho - 0.1, 1.2, 0.02), ESPEJO)
	for i in BALDAS_Y.size():
		var y: float = BALDAS_Y[i]
		_caja(Vector3(cx, y, WALL_Z + 0.14), Vector3(ancho - 0.2, 0.04, 0.22), MADERA)
		_caja(Vector3(cx, y - 0.035, WALL_Z + 0.2), Vector3(ancho - 0.3, 0.015, 0.02),
			FAROLA, true)
		for k in 10:
			var col: Color = BOTELLAS[(k + i * 3) % BOTELLAS.size()]
			var h: float = 0.2 + 0.04 * float((k * 3 + i) % 4)
			var x: float = x0 + 0.3 + k *(ancho - 0.6) / 9.0
			_caja(Vector3(x, y + 0.02 + h * 0.5, WALL_Z + 0.15), Vector3(0.07, h, 0.07), col)
			_caja(Vector3(x, y + 0.02 + h + 0.04, WALL_Z + 0.15), Vector3(0.028, 0.08, 0.028),
				col.darkened(0.2))

	_caja(Vector3(x0 + 0.5, 1.25, zb), Vector3(0.05, 0.34, 0.05), LATON)
	for k in 3:
		_caja(Vector3(x0 + 1.2 + k * 0.16, 1.14, zb + 0.1), Vector3(0.07, 0.09, 0.07), CRISTAL)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ffcf8a")
	luz.light_energy = 0.45
	luz.omni_range = 2.4
	luz.position = Vector3(cx, 2.1, WALL_Z + 0.6)
	viewport.add_child(luz)



func _planta(at: Vector2) -> void:
	_caja(Vector3(at.x, 0.25, at.y), Vector3(0.36, 0.5, 0.36), Color("7a3a22"))
	_caja(Vector3(at.x, 0.51, at.y), Vector3(0.4, 0.05, 0.4), Color("5a2a18"))
	for h: Array in HOJAS:
		_caja(Vector3(at.x + float(h[0]), float(h[1]), at.y + float(h[2])),
			Vector3(float(h[3]), float(h[4]), float(h[3])), h[5])



func _alfombra() -> void:
	_caja(Vector3(0.0, 0.004, MESA_Z - 0.2), Vector3(3.3, 0.008, 2.3), LATON.darkened(0.35))
	_caja(Vector3(0.0, 0.008, MESA_Z - 0.2), Vector3(3.1, 0.008, 2.1), ALFOMBRA)
	_caja(Vector3(0.0, 0.012, MESA_Z - 0.2), Vector3(2.6, 0.006, 1.6), ALFOMBRA.lightened(0.08))




func _lampara() -> void:
	var x: float = 0.0
	var z: float = MESA_Z - 0.1
	_caja(Vector3(x,(LAMPARA_Y + ALTO_TECHO) * 0.5, z), Vector3(0.012, ALTO_TECHO - LAMPARA_Y, 0.012),
		Color("141010"))
	var pantalla: MeshInstance3D = MeshInstance3D.new()
	var cil: CylinderMesh = CylinderMesh.new()
	cil.top_radius = 0.05
	cil.bottom_radius = 0.24
	cil.height = 0.2
	cil.radial_segments = 12
	cil.material = _material(LATON.darkened(0.1), false)
	pantalla.mesh = cil
	pantalla.position = Vector3(x, LAMPARA_Y, z)
	viewport.add_child(pantalla)
	var boca: MeshInstance3D = MeshInstance3D.new()
	var disco: CylinderMesh = CylinderMesh.new()
	disco.top_radius = 0.22
	disco.bottom_radius = 0.22
	disco.height = 0.01
	disco.radial_segments = 12
	disco.material = _material(Color("ffe2a8"), true)
	boca.mesh = disco
	boca.position = Vector3(x, LAMPARA_Y - 0.1, z)
	viewport.add_child(boca)
	var foco: SpotLight3D = SpotLight3D.new()
	foco.light_color = Color("ffcf8a")
	foco.light_energy = 1.6
	foco.spot_range = 3.4
	foco.spot_angle = 40.0
	foco.spot_attenuation = 0.8
	foco.position = Vector3(x, LAMPARA_Y - 0.12, z)
	foco.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	viewport.add_child(foco)


	var p: CPUParticles3D = CPUParticles3D.new()
	p.name = "PolvoCena"
	p.amount = 22
	p.lifetime = 7.0
	p.preprocess = 7.0
	p.randomness = 0.8
	p.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	p.emission_box_extents = Vector3(0.55, 0.45, 0.35)
	p.position = Vector3(x, LAMPARA_Y - 0.65, z)
	p.direction = Vector3.UP
	p.spread = 180.0
	p.initial_velocity_min = 0.01
	p.initial_velocity_max = 0.05
	p.gravity = Vector3(0.0, -0.006, 0.0)
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.018, 0.018)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.albedo_color = Color(1.0, 0.86, 0.6, 0.4)
	q.material = m
	p.mesh = q
	viewport.add_child(p)



func _mesa_recogida(at: Vector2) -> void:
	_caja(Vector3(at.x, 0.74, at.y), Vector3(1.1, 0.05, 0.7), MADERA)
	for x: float in [-0.48, 0.48]:
		_caja(Vector3(at.x + x, 0.37, at.y), Vector3(0.06, 0.74, 0.6), MADERA.darkened(0.2))
	for dx: float in [-0.25, 0.25]:
		_caja(Vector3(at.x + dx, 0.79, at.y), Vector3(0.42, 0.05, 0.42), MADERA.lightened(0.1))
		for px: float in [-0.18, 0.18]:
			for pz: float in [-0.18, 0.18]:
				_caja(Vector3(at.x + dx + px, 1.03, at.y + pz), Vector3(0.04, 0.44, 0.04),
					MADERA.lightened(0.1))






func _mesa() -> void:
	_caja(Vector3(0.0, 0.74, MESA_Z), Vector3(1.9, 0.05, 0.8), MANTEL)
	_caja(Vector3(0.0, 0.4, MESA_Z + 0.39), Vector3(1.9, 0.68, 0.03), MANTEL.darkened(0.08))
	for lado: float in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.94, 0.4, MESA_Z), Vector3(0.03, 0.68, 0.8), MANTEL.darkened(0.16))
	_caja(Vector3(0.0, 0.07, MESA_Z + 0.395), Vector3(1.9, 0.04, 0.035), MANTEL.darkened(0.25))
	for x: float in [YO_X, EL_X]:
		var hacia: float = 1.0 if x < 0.0 else -1.0
		_caja(Vector3(x, 0.775, MESA_Z + 0.12), Vector3(0.3, 0.02, 0.3), Color("fafafa"))
		_caja(Vector3(x, 0.79, MESA_Z + 0.12), Vector3(0.2, 0.012, 0.2), Color("e6e0d2"))
		for k: float in [-0.19, 0.19]:
			_caja(Vector3(x + k, 0.772, MESA_Z + 0.12), Vector3(0.022, 0.006, 0.22), CUBIERTO)

		var cx: float = x + hacia * 0.2
		var cz: float = MESA_Z - 0.05
		_caja(Vector3(cx, 0.772, cz), Vector3(0.07, 0.008, 0.07), CRISTAL)
		_caja(Vector3(cx, 0.82, cz), Vector3(0.014, 0.09, 0.014), CRISTAL)
		_caja(Vector3(cx, 0.9, cz), Vector3(0.08, 0.1, 0.08), CRISTAL)
		_caja(Vector3(cx, 0.885, cz), Vector3(0.066, 0.05, 0.066), VINO)

	_caja(Vector3(0.14, 0.92, MESA_Z - 0.22), Vector3(0.09, 0.32, 0.09), Color("1f3a24"))
	_caja(Vector3(0.14, 1.13, MESA_Z - 0.22), Vector3(0.035, 0.1, 0.035), Color("1f3a24"))
	_caja(Vector3(0.14, 1.19, MESA_Z - 0.22), Vector3(0.04, 0.035, 0.04), VINO)
	_caja(Vector3(0.14, 0.9, MESA_Z - 0.17), Vector3(0.092, 0.1, 0.01), Color("e8dcc0"))

	_caja(Vector3(-0.28, 0.8, MESA_Z - 0.2), Vector3(0.2, 0.06, 0.13), Color("8a6030"))
	_caja(Vector3(-0.3, 0.84, MESA_Z - 0.2), Vector3(0.13, 0.05, 0.08), Color("c89050"))

	_caja(Vector3(-0.05, 0.775, MESA_Z - 0.12), Vector3(0.11, 0.02, 0.11), LATON)
	_caja(Vector3(-0.05, 0.9, MESA_Z - 0.12), Vector3(0.06, 0.24, 0.06), Color("f4ecd0"))
	_llama = MeshInstance3D.new()
	_llama.name = "LlamaVela"
	var b: BoxMesh = BoxMesh.new()
	b.size = Vector3(0.03, 0.065, 0.03)
	b.material = _material(Color("ffc860"), true)
	_llama.mesh = b
	_llama.position = Vector3(-0.05, LLAMA_Y, MESA_Z - 0.12)
	viewport.add_child(_llama)
	_vela = OmniLight3D.new()
	_vela.light_color = Color("ffb050")
	_vela.light_energy = 1.5
	_vela.omni_range = 2.6
	_vela.position = Vector3(-0.05, 1.15, MESA_Z - 0.08)
	viewport.add_child(_vela)




func _caja(at: Vector3, size: Vector3, col: Color, brilla: bool = false) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _material(col, brilla)
	m.mesh = box
	m.position = at
	viewport.add_child(m)




func _plano(at: Vector3, size: Vector2, tex: Texture2D, tile: Vector2, suelo: bool) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.uv1_scale = Vector3(size.x / tile.x, size.y / tile.y, 1.0)
	if suelo:
		var pm: PlaneMesh = PlaneMesh.new()
		pm.size = size
		pm.material = mat
		mi.mesh = pm
	else:
		var qm: QuadMesh = QuadMesh.new()
		qm.size = size
		qm.material = mat
		mi.mesh = qm
	mi.position = at +(Vector3(0.0, 0.002, 0.0) if suelo else Vector3(0.0, 0.0, 0.002))
	viewport.add_child(mi)




func _material(col: Color, brilla: bool) -> StandardMaterial3D:
	var k: String = col.to_html() +("*" if brilla else "")
	if _materiales.has(k):
		return _materiales[k]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if brilla:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if col.a < 1.0:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_materiales[k] = mat
	return mat







func _tex_tarima() -> Texture2D:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	var tonos: Array[float] = [0.0, 0.07, -0.06, 0.03]
	var testas: Array[int] = [5, 21, 13, 28]
	for x in 32:
		var t: int = x>>3
		var base: Color = SUELO.lightened(tonos[t]) if tonos[t] >= 0.0 \
				else SUELO.darkened(- tonos[t])
		for y in 32:
			var c: Color = base
			if x % 8 == 0 or y == testas[t]:
				c = SUELO.darkened(0.45)
			elif (x % 8 == 3 and (y + t * 5) % 11 < 6) or (x % 8 == 6 and (y + t * 3) % 9 < 3):
				c = base.darkened(0.12)
			img.set_pixel(x, y, c)
	return ImageTexture.create_from_image(img)



func _tex_papel() -> Texture2D:
	var img: Image = Image.create(16, 16, false, Image.FORMAT_RGBA8)
	img.fill(PARED)
	for y in 16:
		img.set_pixel(0, y, PARED.lightened(0.07))
		img.set_pixel(8, y, PARED.darkened(0.1))
	for d: Vector2i in [Vector2i(4, 3), Vector2i(3, 4), Vector2i(5, 4), Vector2i(4, 5),
			Vector2i(12, 11), Vector2i(11, 12), Vector2i(13, 12), Vector2i(12, 13)]:
		img.set_pixel(d.x, d.y, PARED.lightened(0.12))
	return ImageTexture.create_from_image(img)




func _tex_friso() -> Texture2D:
	var img: Image = Image.create(32, 32, false, Image.FORMAT_RGBA8)
	img.fill(MADERA)
	for i in 32:
		img.set_pixel(i, 0, MADERA.darkened(0.4))
		img.set_pixel(0, i, MADERA.darkened(0.4))
		img.set_pixel(i, 1, MADERA.lightened(0.12))
		img.set_pixel(1, i, MADERA.lightened(0.12))
		img.set_pixel(i, 31, MADERA.darkened(0.3))
		img.set_pixel(31, i, MADERA.darkened(0.3))
	for i in range(6, 26):
		img.set_pixel(i, 6, MADERA.darkened(0.25))
		img.set_pixel(6, i, MADERA.darkened(0.25))
		img.set_pixel(i, 25, MADERA.lightened(0.1))
		img.set_pixel(25, i, MADERA.lightened(0.1))
	return ImageTexture.create_from_image(img)





func _build_textos() -> void:
	var nombre: String = String(data.get("nombre", ""))
	var anios: int = int(data.get("anios", IdoloEscenas.CONSEJO_ANIOS))
	for turno: Array in IdoloEscenas.consejo_turnos(bool(data.get("activo", false))):
		var suyo: bool = String(turno[0]) == "el"
		var texto: String = I18n.tf(String(turno[1]), [anios]) if suyo \
				else I18n.t(String(turno[1]))
		var cita: PanelContainer = make_cita_idolo(nombre if suyo else Career.player_name,
			texto, "" if suyo else I18n.t("TÚ"))


		cita.name = "IdoloCita%d" % _citas.size()



		for l: Node in cita.find_children("*", "Label", true, false):
			if (l as Label).autowrap_mode != TextServer.AUTOWRAP_OFF:
				(l as Label).max_lines_visible = CITA_LINEAS
		if UiKit.es_horizontal():
			cita.anchor_top = 0.0
			cita.anchor_bottom = 0.0
			cita.offset_top = UiKit.top_safe_inset(get_viewport()) + CITA_ARRIBA_TUMBADO
			cita.offset_bottom = cita.offset_top
			cita.grow_vertical = Control.GROW_DIRECTION_END
		_citas.append(cita)
	make_chyron(I18n.t("TE INVITO A CENAR"), CareerUi.display_name(nombre).to_upper(), {},
		T_CHYRON_CENA)
	make_card(T_CARD_CENA)
	card_title(I18n.t("SU ULTIMO CONSEJO"), 40)
	card_sub(I18n.t("LA CENA"))
	card_stats([{"v": str(anios), "k": I18n.t("temporadas después")}])
	card_note(I18n.t("La felicidad está en cada día."))
	card_cta(I18n.t("SEGUIR"))




func turno_en(tt: float) -> int:
	for i in TURNOS_T.size():
		var v: Vector2 = TURNOS_T[i]
		if tt >= v.x and tt < v.y:
			return i
	return -1



func _ultimo_turno(tt: float) -> int:
	var u: int = -1
	for i in TURNOS_T.size():
		if tt >=(TURNOS_T[i] as Vector2).x:
			u = i
	return u


func _caras(turno: int) -> void:
	var par: Array = CARAS_ENTRADA if turno < 0 else CARAS[turno]
	for k in 2:
		var cara: CaraViva = CaraViva.de(_el if k == 0 else _yo)
		if cara != null:
			cara.anima(String(par[k]))




func _tick(_delta: float) -> void:
	var ahora: int = turno_en(t)
	for i in _citas.size():
		var v: Vector2 = TURNOS_T[i]
		_citas[i].modulate.a = clampf(minf((t - v.x) / 0.25,(v.y - t) / 0.3), 0.0, 1.0)
	var ultimo: int = _ultimo_turno(t)
	if ultimo != _turno_visto:
		_turno_visto = ultimo
		_caras(ultimo)
	for k in 2:
		var spr: AnimatedSprite3D = _el if k == 0 else _yo
		var cara: CaraViva = CaraViva.de(spr) if spr != null else null
		if cara == null:
			continue
		var dice: bool = ahora >= 0 and t <(TURNOS_T[ahora] as Vector2).y - 0.4 \
				and String((IdoloEscenas.CONSEJO_TURNOS[ahora] as Array)[0]) ==("el" if k == 0 else "tu")
		if cara._hablando != dice:
			cara.habla(dice)
	if _vela != null:
		_vela.light_energy = 1.45 + 0.18 * sin(t * 13.0) + 0.1 * sin(t * 7.3 + 1.1)

	if _llama != null:
		_llama.scale = Vector3(1.0, 1.0 + 0.2 * sin(t * 13.0) + 0.08 * sin(t * 23.0), 1.0)
		_llama.position.x = -0.05 + 0.004 * sin(t * 5.0)



func _keys_cena() -> Array:
	if not UiKit.es_horizontal():
		return KEYS_CENA
	var out: Array = []
	for k: Dictionary in KEYS_CENA:
		var d: Dictionary = k.duplicate()
		d["aim_y"] = float(d["aim_y"]) + AIM_TUMBADO
		out.append(d)
	return out







func _armar_auto_seguir() -> void:
	if replay:
		super._armar_auto_seguir()


func _recuerdo() -> Dictionary:
	return data.duplicate(true)
