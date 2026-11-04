extends Ceremony





























const KEYS: Array = [
	{"t": 0.0, "dist": 5.4, "h": 1.8, "yaw": 180.0, "aim_y": 1.3, "fov": 62.0,
		"focus_x": 2.3, "focus_z": 2.4},
	{"t": 2.4, "dist": 3.4, "h": 1.56, "yaw": 180.0, "aim_y": 1.5, "fov": 44.0,
		"focus_x": TV_X, "focus_z": TV_Z + 0.05},
	{"t": 6.4, "dist": 3.4, "h": 1.56, "yaw": 180.0, "aim_y": 1.5, "fov": 44.0,
		"focus_x": TV_X, "focus_z": TV_Z + 0.05},
	{"t": 8.4, "dist": 4.8, "h": 1.7, "yaw": 172.0, "aim_y": 1.24, "fov": 48.0,
		"focus_x": 0.6, "focus_z": 1.7},
]

const DRIFT: float = 0.32

const T_CHYRON: float = 1.0
const T_CARD: float = 9.4



const TV_X: float = - LockerRoom.BOARD_X
const TV_Z: float = LockerRoom.BOARD_Z
const TV_Y: float = 1.5
const TV_W: float = 1.3
const LIENZO: Vector2i = Vector2i(1024, 640)




const T_CUENTA: Vector2 = Vector2(3.0, 4.1)
const T_BAJA: Vector2 = Vector2(4.3, 5.7)
const T_SELLO: float = 5.9
const SELLO_DUR: float = 0.22



const SALA_LUZ: float = 0.5
const SALA_AMBIENTE: float = 0.55

const TV_LUZ: float = 0.9
const TV_LUZ_ROJA: float = 2.2

var room: LockerRoom
var _tv_luz: OmniLight3D = null
var _sala_apagada: bool = false

var _filas: Array = []
var _rh: float = 0.0
var _y0: float = 0.0
var _mia: Dictionary = {}
var _sello: Control = null
var _pts: int = 12




func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	_pts = maxi(int(data.get("pts", ClubFinance.FFP_PUNTOS)), 1)
	focus = Vector3(2.3, 0.0, 2.4)
	room = LockerRoom.new()
	room.host_viewport = viewport

	room.force_club = true



	room.face_x = TV_X
	room.face_z = TV_Z
	var yaw: float = deg_to_rad(float(KEYS[0]["yaw"]))
	room.face_derecha = Vector3(- cos(yaw), 0.0, - sin(yaw))
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT

	make_locker_audio(false, -32.0)
	_build_tele()
	_anima(0.0)

	var club: Dictionary = team()
	var nombre: String = String(club.get("name", "?"))
	make_chyron(I18n.t("SANCION DE FAIR PLAY"), nombre.to_upper(), club, T_CHYRON)
	make_card(T_CARD)
	card_title("-%d %s" % [_pts, I18n.t("PTS")], 46)
	card_club(club)
	card_stats(_stats())
	card_note(I18n.t("{0} arranca la liga con -{1} puntos por el fair play").format(
		[nombre, _pts]))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var out: Array = [{"v": "-%d" % _pts, "k": I18n.t("puntos")}]
	if not _mia.is_empty():
		out.append({"v": "%d/%d" % [int(_mia["despues"]) + 1, _filas.size()],
			"k": I18n.t("puesto")})
	if data.has("caja"):
		out.append({"v": CareerUi.money(int(data["caja"])), "k": I18n.t("caja")})
	return out






func _build_tele() -> void:
	var metal: Color = Color(0.16, 0.17, 0.19)
	var alto: float = TV_W * float(LIENZO.y) / float(LIENZO.x)
	for sgn in [-1.0, 1.0]:
		_caja(Vector3(0.05, TV_Y - alto * 0.5, 0.05),
			Vector3(TV_X + sgn * 0.42,(TV_Y - alto * 0.5) * 0.5, TV_Z - 0.1), metal)
	_caja(Vector3(1.0, 0.04, 0.46), Vector3(TV_X, 0.42, TV_Z - 0.1), metal)
	_caja(Vector3(1.0, 0.06, 0.46), Vector3(TV_X, 0.1, TV_Z - 0.1), metal)

	_caja(Vector3(TV_W + 0.12, alto + 0.12, 0.07), Vector3(TV_X, TV_Y, TV_Z - 0.02),
		Color(0.03, 0.03, 0.035))

	var vp: SubViewport = SubViewport.new()
	vp.size = LIENZO
	vp.disable_3d = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	add_child(vp)
	_build_tabla(vp)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = TV_W / float(LIENZO.x)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
	spr.shaded = false


	spr.position = Vector3(TV_X, TV_Y, TV_Z + 0.025)
	viewport.add_child(spr)

	_tv_luz = OmniLight3D.new()
	_tv_luz.light_color = Color(0.7, 0.8, 1.0)
	_tv_luz.light_energy = TV_LUZ
	_tv_luz.omni_range = 5.5
	_tv_luz.position = Vector3(TV_X, TV_Y, TV_Z + 0.8)
	viewport.add_child(_tv_luz)


func _caja(tam: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	m.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.6
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
	return m






func _build_tabla(vp: SubViewport) -> void:
	var hoja: Control = Control.new()
	hoja.size = Vector2(LIENZO)
	vp.add_child(hoja)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = Color(0.035, 0.045, 0.065)
	fondo.size = Vector2(LIENZO)
	hoja.add_child(fondo)
	var filas: Array = _filas_de_la_liga()
	var n: int = filas.size()


	var cab: float = 46.0
	var franja: ColorRect = ColorRect.new()
	franja.color = CareerTheme.accent_of(team())
	franja.size = Vector2(float(LIENZO.x), 6.0)
	hoja.add_child(franja)
	var pts_cab: Label = CareerUi.plain(26, CareerTheme.TEXT_DIM)
	pts_cab.text = I18n.t("PTS")
	pts_cab.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	pts_cab.position = Vector2(float(LIENZO.x) - 220.0, 10.0)
	pts_cab.size = Vector2(190.0, 32.0)
	pts_cab.clip_text = true
	hoja.add_child(pts_cab)
	_y0 = cab
	_rh = minf(56.0,(float(LIENZO.y) - cab - 8.0) / float(maxi(n, 1)))
	var letra: int = int(clampf(_rh * 0.66, 16.0, 36.0))

	for i in n:
		var num: Label = CareerUi.plain(letra, CareerTheme.TEXT_DIM)
		num.text = str(i + 1)
		num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		num.position = Vector2(20.0, _y0 + _rh * float(i))
		num.size = Vector2(60.0, _rh)
		hoja.add_child(num)

	for f in filas:
		var fila: Control = Control.new()
		fila.size = Vector2(float(LIENZO.x) - 100.0, _rh)
		fila.position = Vector2(96.0, _y0 + _rh * float(f["antes"]))
		hoja.add_child(fila)
		var bg: ColorRect = ColorRect.new()
		bg.size = Vector2(fila.size.x - 20.0, _rh - 3.0)
		bg.position = Vector2(0.0, 1.5)


		var tinta: Color = CareerTheme.accent_of(f["equipo"])
		bg.color = Color(tinta, 0.32) if bool(f["tu"]) \
				else Color(1, 1, 1, 0.035 if int(f["antes"]) % 2 == 0 else 0.0)
		fila.add_child(bg)
		if bool(f["tu"]):
			var filo: ColorRect = ColorRect.new()
			filo.color = tinta
			filo.position = Vector2(0.0, 1.5)
			filo.size = Vector2(8.0, _rh - 3.0)
			fila.add_child(filo)
		var esc: Texture2D = crest_texture(f["equipo"], 96, true)
		if esc != null:
			var tr: TextureRect = TextureRect.new()
			tr.texture = esc
			tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
			tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
			tr.position = Vector2(10.0, 3.0)
			tr.size = Vector2(_rh - 6.0, _rh - 6.0)
			fila.add_child(tr)
		var sig: Label = CareerUi.plain(letra, CareerTheme.TEXT)
		sig.text = String(f["siglas"])
		sig.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		sig.position = Vector2(_rh + 16.0, 0.0)
		sig.size = Vector2(fila.size.x * 0.6, _rh)
		sig.clip_text = true
		fila.add_child(sig)
		var pts: Label = CareerUi.plain(letra, CareerTheme.TEXT)
		pts.text = str(int(f["pts_antes"]))
		pts.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		pts.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		pts.position = Vector2(fila.size.x - 220.0, 0.0)
		pts.size = Vector2(190.0, _rh)
		pts.clip_text = true
		fila.add_child(pts)
		f["nodo"] = fila
		f["pts_label"] = pts
		if bool(f["tu"]):
			_mia = f
	_filas = filas
	_sello = _build_sello(hoja)




func _build_sello(hoja: Control) -> Control:
	var caja: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.DANGER, 0.16)
	sb.border_color = CareerTheme.DANGER
	sb.set_border_width_all(12)
	sb.set_corner_radius_all(18)
	sb.content_margin_left = 44.0
	sb.content_margin_right = 44.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	caja.add_theme_stylebox_override("panel", sb)
	var lbl: Label = CareerUi.plain(170, CareerTheme.DANGER)
	lbl.text = "-%d" % _pts
	lbl.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	caja.add_child(lbl)
	hoja.add_child(caja)
	caja.reset_size()
	caja.position =(Vector2(LIENZO) - caja.size) * 0.5 + Vector2(0.0, -20.0)
	caja.pivot_offset = caja.size * 0.5
	caja.rotation_degrees = -9.0
	caja.modulate.a = 0.0
	return caja








func _filas_de_la_liga() -> Array:
	var claves: Array = []
	if GameState.league_table.has(GameState.YOU_KEY):
		claves = GameState.league_table.keys()
	else:
		claves = [GameState.YOU_KEY]
		for r in GameState._league_rivals():
			claves.append(String((r as Dictionary).get("id", "")))
	var filas: Array = []
	var mio: String = String(team().get("id", ""))
	for k in claves:
		var key: String = String(k)
		var tu: bool = key == GameState.YOU_KEY


		if not tu and key == mio:
			continue
		var equipo: Dictionary = team() if tu else Teams.by_id(key)
		if equipo.is_empty():
			continue
		var base: int = 0 if tu else - Career.sancion_pts(key)
		filas.append({"tu": tu, "equipo": equipo,
			"siglas": String(equipo.get("abbrev", equipo.get("name", "?"))).to_upper(),
			"nombre": String(equipo.get("name", "")),
			"pts_antes": base, "pts_despues": - _pts if tu else base})
	for fase in ["antes", "despues"]:
		var orden: Array = filas.duplicate()
		var clave: String = "pts_" + fase
		orden.sort_custom(func(a, b):
			if int(a[clave]) != int(b[clave]):
				return int(a[clave]) > int(b[clave])
			return String(a["nombre"]) < String(b["nombre"]))
		for i in orden.size():
			(orden[i] as Dictionary)[fase] = i
	return filas


func _tick(_delta: float) -> void:
	if not _sala_apagada:
		_apaga_sala()
	_anima(t)





func _apaga_sala() -> void:
	_sala_apagada = true
	for n in viewport.find_children("*", "Light3D", true, false):
		if n == _tv_luz:
			continue
		(n as Light3D).light_energy *= SALA_LUZ
	for n in viewport.find_children("*", "WorldEnvironment", true, false):
		var env: Environment =(n as WorldEnvironment).environment
		if env != null:
			env.ambient_light_energy *= SALA_AMBIENTE





func _anima(s: float) -> void:
	if _filas.is_empty():
		return
	var k_cuenta: float = clampf((s - T_CUENTA.x) /(T_CUENTA.y - T_CUENTA.x), 0.0, 1.0)
	var k_baja: float = smoothstep(0.0, 1.0,
		clampf((s - T_BAJA.x) /(T_BAJA.y - T_BAJA.x), 0.0, 1.0))
	for f in _filas:
		var a: int = int(f["antes"])
		var d: int = int(f["despues"])
		(f["nodo"] as Control).position.y = _y0 + _rh * lerpf(float(a), float(d), k_baja)
	if not _mia.is_empty():
		var lbl: Label = _mia["pts_label"]
		var v: int = roundi(lerpf(0.0, float(- _pts), k_cuenta))
		lbl.text = str(v)
		lbl.add_theme_color_override("font_color",
			CareerTheme.TEXT.lerp(CareerTheme.DANGER, k_cuenta))
	if _sello != null:
		var k: float = clampf((s - T_SELLO) / SELLO_DUR, 0.0, 1.0)
		_sello.modulate.a = k
		_sello.scale = Vector2.ONE * lerpf(1.9, 1.0, k * k)
	if _tv_luz != null:
		var kr: float = clampf((s - T_SELLO) / 0.4, 0.0, 1.0)
		_tv_luz.light_color = Color(0.7, 0.8, 1.0).lerp(CareerTheme.DANGER, kr)
		_tv_luz.light_energy = lerpf(TV_LUZ, TV_LUZ_ROJA, kr)



func _skipped() -> void:
	_anima(T_SELLO + 1.0)
