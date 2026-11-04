extends "res://ui/ceremonies/contract.gd"































const J_MESA_W: float = 4.4
const J_MESA_D: float = 1.7
const J_MESA_Z: float = -0.92 + J_MESA_D * 0.5


const J_ASIENTOS: Array = [-1.68, -0.84, 0.0, 0.84, 1.68]

const J_TU_X: float = -0.5
const J_TU_Z: float = -0.92 + J_MESA_D + 0.3



const J_TU_RESPALDO: float = 1.1

const J_TU_RESPALDO_W: float = 0.84
const J_TU_SILLA_Z: float = J_TU_Z + 0.24

const J_TUMBADO_ALZA: float = 0.3


const J_SILLON_Z: float = PEOPLE_Z - 0.24
const J_SILLON_ALTO: float = 1.95
const J_SILLON_W: float = 0.8
const J_SILLA_ALTO: float = 1.42
const J_SILLA_W: float = 0.6

const J_CUERO: Color = Color("2a1f1a")
const J_VASO: Color = Color("cfe3ea")

const J_FONDO: float = 8.0






const J_KEYS: Array = [
	{"t": 0.0, "dist": 3.4, "h": 1.95, "yaw": 178.0, "aim_y": 1.55, "fov": 26.0,
		"focus_x": 0.0, "focus_z": -1.0},
	{"t": 0.9, "dist": 3.4, "h": 1.95, "yaw": 178.0, "aim_y": 1.55, "fov": 26.0,
		"focus_x": 0.0, "focus_z": -1.0},
	{"t": 3.6, "dist": 5.6, "h": 2.25, "yaw": 174.0, "aim_y": 1.35, "fov": 36.0,
		"focus_x": 0.0, "focus_z": -0.4},
	{"t": 7.0, "dist": 5.9, "h": 2.3, "yaw": 173.0, "aim_y": 1.0, "fov": 36.0,
		"focus_x": 0.0, "focus_z": -0.4},
]
const J_CHYRON: float = 1.6
const J_CARD: float = 6.6
const J_NORTE: String = "res://assets/sprites/anim/coach_north_"


func _proyecto() -> int:
	return int(data.get("proyecto", ClubFinance.PROYECTO_DUENO))


func _crisis() -> bool:
	return _proyecto() == ClubFinance.PROYECTO_CRISIS


func _resaca() -> bool:
	return _crisis() and bool(data.get("resaca", false))




func _accent_for() -> Color:
	if _crisis():
		return CareerTheme.DANGER
	return CareerTheme.accent_of(team())


func _build() -> void:


	focus = Vector3.ZERO
	var wall: Color = _wall_color()
	var ink: Color = _ink_color(wall)
	_build_sala(wall)
	_build_crest(ink)
	_build_mesa(wall)
	_build_sillones()
	_build_junta()
	_build_tu()
	_camara_junta()
	orbit_speed = DRIFT
	make_card(J_CARD)
	if _crisis():
		_ficha_crisis()
	else:
		_ficha_dueno()
	card_cta(I18n.t("SEGUIR"))



func _tick(_delta: float) -> void:
	pass


func _skipped() -> void:
	pass



func _camara_junta() -> void:
	if not UiKit.es_horizontal():
		make_camera(J_KEYS, 36.0)
		cam.keep_aspect = Camera3D.KEEP_WIDTH
		return
	var llaves: Array = []
	for k in J_KEYS:
		var d: Dictionary =(k as Dictionary).duplicate()
		d["fov"] = float(d["fov"]) * FOV_TUMBADO_K

		d["aim_y"] = float(d["aim_y"]) + J_TUMBADO_ALZA
		llaves.append(d)
	make_camera(llaves, 36.0 * FOV_TUMBADO_K)
	cam.keep_aspect = Camera3D.KEEP_HEIGHT






func _build_sala(wall: Color) -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0a0b0e")
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	viewport.add_child(we)
	var w: float = _ancho_sala()
	_slab(Vector3(w, WALL_H, 0.1), Vector3(0.0, WALL_H * 0.5, WALL_Z - 0.05), _flat(wall))
	var lat: StandardMaterial3D = _flat(wall.darkened(0.22))
	for s in [-1.0, 1.0]:
		_slab(Vector3(0.1, WALL_H, J_FONDO), Vector3(s *(w * 0.5 + 0.05), WALL_H * 0.5,
			WALL_Z + J_FONDO * 0.5), lat)


	var zocalo: StandardMaterial3D = _flat(_desk_wood(wall).darkened(0.35))
	_slab(Vector3(w, 1.1, 0.04), Vector3(0.0, 0.55, WALL_Z + 0.02), zocalo)
	for s in [-1.0, 1.0]:
		_slab(Vector3(0.04, 1.1, J_FONDO), Vector3(s *(w * 0.5 - 0.02), 0.55,
			WALL_Z + J_FONDO * 0.5), zocalo)
	_slab(Vector3(w, 0.1, J_FONDO), Vector3(0.0, -0.05, WALL_Z + J_FONDO * 0.5),
		_flat(wall.darkened(0.62)))







func _build_mesa(wall: Color) -> void:
	var top: Color = _desk_wood(wall)
	_slab(Vector3(J_MESA_W, TOP_T, J_MESA_D), Vector3(0.0, DESK_H - TOP_T * 0.5, J_MESA_Z),
		_flat(top))
	_slab(Vector3(J_MESA_W - 0.06, DESK_H - TOP_T, J_MESA_D - 0.06),
		Vector3(0.0,(DESK_H - TOP_T) * 0.5, J_MESA_Z), _flat(top.darkened(0.28)))
	var papel: StandardMaterial3D = _flat(PAPER_C)
	var vaso: StandardMaterial3D = _flat(J_VASO)
	var club: StandardMaterial3D = _flat(CareerTheme.accent_of(team()))
	for x in J_ASIENTOS:
		var cx: float = float(x)
		if cx == 0.0:
			_slab(Vector3(0.34, 0.02, 0.26), Vector3(0.0, DESK_H + 0.01, -0.6), club)
			continue
		_slab(Vector3(0.21, 0.004, 0.3), Vector3(cx, DESK_H + 0.002, -0.58), papel)
		_vaso(Vector3(cx + 0.22, DESK_H, -0.7), vaso)
	_slab(Vector3(0.34, 0.02, 0.26), Vector3(J_TU_X, DESK_H + 0.01, J_TU_Z - 0.48), club)
	_vaso(Vector3(J_TU_X + 0.3, DESK_H, J_TU_Z - 0.55), vaso)


func _vaso(base: Vector3, mat: Material) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.035
	cyl.bottom_radius = 0.03
	cyl.height = 0.11
	cyl.radial_segments = 8
	mi.mesh = cyl
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position = base + Vector3(0.0, 0.055, 0.0)
	viewport.add_child(mi)





func _build_sillones() -> void:
	var cuero: StandardMaterial3D = _flat(J_CUERO)
	for x in J_ASIENTOS:
		var cx: float = float(x)
		var alto: float = J_SILLON_ALTO if cx == 0.0 else J_SILLA_ALTO
		var ancho: float = J_SILLON_W if cx == 0.0 else J_SILLA_W
		_slab(Vector3(ancho, alto - 0.45, 0.12), Vector3(cx, 0.45 +(alto - 0.45) * 0.5,
			J_SILLON_Z), cuero)
	_silla_espaldas(J_TU_X)





func _silla_espaldas(x: float) -> void:
	_slab(Vector3(J_TU_RESPALDO_W, J_TU_RESPALDO - 0.45, 0.1),
		Vector3(x, 0.45 +(J_TU_RESPALDO - 0.45) * 0.5, J_TU_SILLA_Z), _flat(J_CUERO))
	_slab(Vector3(J_TU_RESPALDO_W - 0.08, 0.45, 0.5), Vector3(x, 0.225, J_TU_SILLA_Z - 0.22),
		_flat(J_CUERO.darkened(0.3)))







func _build_junta() -> void:
	var club_id: String = String(team().get("id", ""))
	var presi: Dictionary = directivo_look(club_id)
	var presi_x: float = 0.0
	if _resaca() or not _crisis():
		presi_x = 0.84
	if not _crisis():
		var dueno: Dictionary = KitRecolor.traits_for(_quien())
		_seat(player_frames(dueno, "south", SUIT_SHEET, true), 0.0)
	_seat(player_frames(presi, "south", BOSS_SHEET, true), presi_x)
	for x in J_ASIENTOS:
		var cx: float = float(x)
		if cx == 0.0 or cx == presi_x:
			continue
		var cara: Dictionary = Coach.look_de("consejero_%s_%d" % [club_id, roundi(cx * 100.0)])
		_seat(player_frames(cara, "south", BOSS_SHEET, true), cx)




func _quien() -> String:
	var who: String = String(data.get("who", ""))
	if not who.is_empty():
		return who
	return "dueno_%s" % String(team().get("id", ""))




func _build_tu() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	make_player(look, "north", J_NORTE, true, PS)
	player.position = Vector3(J_TU_X, _seat_y(player.sprite_frames), J_TU_Z)







func _ficha_dueno() -> void:



	var perfil: String = String(data.get("perfil", ""))
	make_chyron(I18n.t("EL CLUB CAMBIA DE DUEÑO"), team_name().to_upper(), team(), J_CHYRON)
	match perfil:
		Duenos.JEQUE:
			card_title(I18n.t("UN JEQUE"), 40)
			card_sub(I18n.t("LOS INGRESOS SE DOBLAN"), CareerTheme.MONEY)
		Duenos.FONDO:
			card_title(I18n.t("UN FONDO"), 40)
			card_sub(I18n.t("COMPRA PARA VENDER"), CareerTheme.DANGER)
		Duenos.MAGNATE:
			card_title(I18n.t("UN MAGNATE"), 40)
			card_sub(I18n.t("LOS INGRESOS SE DISPARAN"), CareerTheme.MONEY)
		_:
			card_title(I18n.t("DINERO DE FUERA"), 40)
			card_sub(I18n.t("LOS INGRESOS SE DISPARAN"), CareerTheme.MONEY)
	card_count(int(data.get("temporadas", ClubFinance.PROYECTO_TEMPORADAS)),
		I18n.t("TEMPORADAS DE PROYECTO"))
	card_stats([
		{"v": _dinero(int(data.get("ingreso_antes", 0))), "k": I18n.t("ingreso de antes"),
			"c": CareerTheme.MONEY},
		{"v": _dinero(int(data.get("ingreso", 0))), "k": I18n.t("ingreso ahora"),
			"c": CareerTheme.MONEY},
		{"v": _dinero(int(data.get("caja", 0))), "k": I18n.t("la caja"),
			"c": CareerTheme.DANGER if int(data.get("caja", 0)) < 0 else CareerTheme.MONEY},
	])
	match perfil:
		Duenos.JEQUE:
			card_note(I18n.t("Compra el club para ganarlo todo: el doble de presupuesto en GERENCIA, y la directiva te va a pedir mucho más arriba en la tabla."))
		Duenos.FONDO:
			card_note(I18n.t("Un fondo de inversión compra el club para revenderlo: algo más de presupuesto, y en su último año vende lo que más vale del vestuario."))
		_:
			card_note(I18n.t("Compra el club y trae dinero de fuera: habrá más presupuesto en GERENCIA, y el club va a fichar, también en tu puesto."))




func _ficha_crisis() -> void:

	var resaca: bool = _resaca()
	make_chyron(I18n.t("EL JEQUE SE VA") if resaca else I18n.t("EL CLUB ENTRA EN CRISIS"),
		team_name().to_upper(), team(), J_CHYRON)
	card_title(I18n.t("LA CAJA EN ROJO"), 40)



	var marca: String = String(data.get("naming", ""))
	if not marca.is_empty():
		card_sub(I18n.t("VENDE EL ESTADIO"), CareerTheme.DANGER)
	else:
		card_sub(I18n.t("AVISO DE FAIR PLAY"), CareerTheme.DANGER)
		card_count(ClubFinance.FFP_PUNTOS, I18n.t("PUNTOS EN JUEGO"))
	card_stats([
		{"v": _dinero(int(data.get("caja", 0))), "k": I18n.t("la caja"), "c": CareerTheme.DANGER},
		{"v": _dinero(int(data.get("raya", 0))), "k": I18n.t("la raya roja"),
			"c": CareerTheme.DANGER},
		{"v": _dinero(int(data.get("ingreso", 0))), "k": I18n.t("ingreso"), "c": CareerTheme.MONEY},
	])
	if not marca.is_empty():
		card_note(I18n.t("Sin rodeos: no hay dinero. Para tapar el agujero, el club vende el nombre del estadio, y aun así este verano tiene que vender."))
		return
	if resaca:
		card_note(I18n.tf("El jeque se ha ido y su dinero con él, pero la nómina que firmó se queda. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.",
			[ClubFinance.FFP_PUNTOS]))
		return
	card_note(I18n.tf("Sin rodeos: no hay dinero. Este verano el club tiene que vender, y si la caja sigue bajo la raya roja al cierre, la liga le quita {0} puntos.",
		[ClubFinance.FFP_PUNTOS]))






func _dinero(v: int) -> String:
	return ("-" if v < 0 else "") + CareerUi.short_money(absi(v))
