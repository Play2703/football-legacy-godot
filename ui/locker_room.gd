class_name LockerRoom
extends Control

















































const CAM_POS: Vector3 = Vector3(0.55, 1.52, 5.15)
const CAM_AIM: Vector3 = Vector3(0.05, 1.12, 0.5)
const CAM_FOV: float = 37.0


const ROOM_W: float = 11.4
const ROOM_D: float = 10.5











const ROOM_H: float = 3.15














const LOCKER_H: float = 2.05
const LOCKER_D: float = 0.52



const BAY_W: float = 1.4
const BAY_N: int = 7









const BENCH_X: float = -1.7
const BENCH_Z: float = 2.05
const BENCH_H: float = 0.46
const BENCH_W: float = 2.4
const BENCH_D: float = 0.42



const PLAYER_X: float = 0.34
const PLAYER_Z: float = 1.15
const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS_X: float = 65.0
const PLAYER_SINK: float = 0.02



const MATE_SCALE: float = 1.0



const MATE_DIM: float = 0.9


const JERSEY_H: float = 0.86
const JERSEY_X: float = -0.44
const JERSEY_Y: float = 1.22

const JERSEY_Z: float = 0.02


const PLATE_PX: int = 512
const PLATE_W: float = 1.34

const PLATE_ASPECT: float = 0.52
const PLATE_NUM_FONT: int = 104


const PLATE_NAME_FONT: int = 84
const PLATE_NAME_MIN: int = 40




const CREST_PX: int = 320



const CREST_W: float = 0.46
const CREST_Y: float = 0.86








const CASE_X: float = -0.4
const CASE_Z: float = 1.42
const CRUTCH_X: float = 0.62
const TROPHY_X: float = -0.46



const TROPHY_H: float = 0.4
const TROPHY_PX: int = 256




const RUG_CREST_W: float = 0.98
const RUG_CREST_X: float = 1.28
const RUG_CREST_Z: float = 0.95














const DIV_STYLE: Dictionary = {
	1: {
		"floor": Color("2a2018"), "floor_rough": 0.92,
		"wall": Color("23252b"), "ceiling": Color("15161a"),
		"body": Color("1b1c21"), "door": Color("4a3421"),
		"wood": 1.0, "metal": 0.0, "rough": 0.42,







		"accent": 0.85, "bench": Color("363b43"), "bench_metal": 0.25,
		"lights": 5, "energy": 3.4, "light": Color("ffe6bd"), "ambient": 0.82,



		"bay_light": true, "bay_light_energy": 1.5,
		"crest": true, "rug": true,



		"bay_shelf": true, "bay_bench": true, "jersey_every": 1,
		"plates_all": true, "kit_props": true,



		"lamp_w": 1.1, "board": true, "gear": 3,
		"door_light": 2.2,



		"h": 3.6,
	},
	2: {
		"floor": Color("232529"), "floor_rough": 0.75,
		"wall": Color("21232a"), "ceiling": Color("14151a"),
		"body": Color("1a1b20"), "door": Color("30343c"),
		"wood": 0.0, "metal": 0.35, "rough": 0.55,


		"accent": 0.45, "bench": Color("454a52"), "bench_metal": 0.55,
		"lights": 3, "energy": 2.6, "light": Color("f2f0ea"), "ambient": 1.1,
		"crest": true, "rug": false,



		"bay_shelf": true, "bay_bench": true, "jersey_every": 1,
		"plates_all": true, "kit_props": false,



		"lamp_w": 0.8, "board": true, "gear": 2,
		"door_light": 1.5,



		"h": 3.3,
		"wainscot": {"alto": 1.45, "col": Color("39424a"), "borde": Color("55606a")},
	},
	3: {
		"floor": Color("26262a"), "floor_rough": 0.95,





		"wall": Color("2b2b2c"), "ceiling": Color("2a2724"),
		"body": Color("1c1d1e"), "door": Color("41464a"),
		"wood": 0.0, "metal": 0.8, "rough": 0.68,


		"accent": 0.0, "bench": Color("4b4437"), "bench_metal": 0.0,
		"lights": 2, "energy": 2.2, "light": Color("ffd79a"), "ambient": 1.05,
		"crest": false, "rug": false,





		"bay_shelf": false, "bay_bench": false, "jersey_every": 2,
		"plates_all": true, "kit_props": false,



		"lamp_w": 0.3, "board": false, "gear": 1,




		"h": 3.0,
		"wainscot": {"alto": 1.18, "col": Color("4a3a28"), "borde": Color("6b543a")},
		"pipes": true, "bulb_cord": true, "crest_paint": true,
		"door_light": 0.9,




		"grime": true,
	},
}

var _vp: SubViewport
var _cam: Camera3D
var _style: Dictionary = {}



var _room_h: float = ROOM_H



var _accent: Color = Color("2a4bd7")


var _plate_font: int = PLATE_NAME_FONT
var _crest_tex: Texture2D = null



var _por_congelar: Array[Dictionary] = []

var _nat: bool = false


var _roster: Dictionary = {}
var _top_scorer_cache: String = ""



var _door_pivot: Node3D = null
var _door_light: OmniLight3D = null
var _door_energy: float = 0.0

var _flicker: OmniLight3D = null
var _flicker_base: float = 0.0
var _flicker_t: float = 0.0


var _mates_by_bay: Dictionary = {}



var _captain_name: String = ""
var _rival_name: String = ""


var _mate_spots: Array = []
var _extras: Array = []
var _resto: Array = []





signal locker_pressed













var host_viewport: SubViewport = null



var force_club: bool = false








var force_nation: bool = false












var show_captain: bool = true






var suelo_mojado: bool = false
const MOJADO_RUGOSO: float = 0.14
const MOJADO_OSCURO: float = 0.22








var celebrate_captain: bool = false










var celebrate: bool = false











var override_club: String = ""














var farewell: bool = false











var empty_mates: bool = false

















var ajena: bool = false











var empty_bay: int = -1
var empty_name: String = ""













var focus_name: String = ""












var absent_name: String = ""














var face_x: float = NAN









var face_z: float = NAN
var face_derecha: Vector3 = Vector3.ZERO








var me_bib: Color = Color.TRANSPARENT



var me: AnimatedSprite3D = null
var _me_cfg: Dictionary = {}






var hide_suitcase: bool = false






var _pecho: PechoRig = null


func _ready() -> void:
	_build_world()
	if host_viewport != null:
		return
	_make_touch_zones()



	resized.connect(_place_touch_zones)


func _build_world() -> void:




	GameState.ensure_kit_choice()



	_nat = _nat_week()









	var div_sala: int = GameState.div_of(override_club) \
			if not override_club.is_empty() else GameState.player_div()
	_style = DIV_STYLE[1] if _nat \
			else DIV_STYLE.get(clampi(div_sala, 1, 3), DIV_STYLE[2])
	_room_h = float(_style.get("h", ROOM_H))


	_accent = _room_accent()

	if host_viewport != null:



		_vp = host_viewport
		_make_env()
	else:
		var box: SubViewportContainer = SubViewportContainer.new()
		box.stretch = true
		box.set_anchors_preset(Control.PRESET_FULL_RECT)


		box.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(box)
		_vp = SubViewport.new()
		_vp.transparent_bg = false



		_vp.own_world_3d = true
		_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
		_vp.msaa_3d = Viewport.MSAA_DISABLED


		UiKit.aplica_escala_3d_sub(_vp, get_viewport())
		box.add_child(_vp)

		_make_env()
		_cam = Camera3D.new()
		_cam.fov = CAM_FOV
		_cam.current = true
		_vp.add_child(_cam)
		_cam.position = CAM_POS
		_cam.look_at(CAM_AIM, Vector3.UP)




	_pecho = PechoRig.new(_vp, _cam)

	_make_room()


	_assign_mates()


	_plate_font = _measure_plate_font()
	_make_lockers()
	_make_bench()
	_make_lights()
	_make_doorway()
	_make_identity()
	_make_wainscot()
	_make_pipes()
	_make_trim()
	_make_beams()
	_make_gear()
	_make_sala_tumbada()
	if bool(_style.get("crest", false)):
		_make_crest()
	if bool(_style.get("grime", false)):
		_make_grime()


	if not ajena:
		_make_state_props()
	if bool(_style.get("rug", false)):
		_make_floor_crest()


	if not ajena:
		_make_player()

	if host_viewport == null:
		_caras_de_racha()







const HUB_TRAINING = preload("res://ui/hub_training.gd")

func _caras_de_racha() -> void:
	var comp: String = String(GameState.current_fixture().get("comp", "league"))
	var racha: Array = GameState.form_of_any(GameState.player_team_id, comp) \
			if not GameState.player_team_id.is_empty() else []
	var animo: String = HUB_TRAINING.animo_de_racha(racha)
	var rng := RandomNumberGenerator.new()
	rng.randomize()
	for f in figuras():
		var cara: CaraViva = CaraViva.pon(f["spr"])
		if cara != null:
			cara.anima(Expresiones.de_bolsa(animo, rng))

















func match_width_fov(aspect: float) -> void:
	if _cam == null or aspect <= 0.0:
		return


	_cam.fov = UiKit.fov_para_caja(CAM_FOV, 1080.0 / CareerPage.SCENE_BAND, aspect)

	_coloca_zonas_mate()











var _aspecto_caja_diseno: float = 0.0


func encuadre_caja(aspecto_diseno: float) -> void:
	_aspecto_caja_diseno = aspecto_diseno
	if not resized.is_connected(_reencuadra_caja):
		resized.connect(_reencuadra_caja)
	_reencuadra_caja()





func _reencuadra_caja() -> void:
	if _fov_caja():
		_place_touch_zones()




func _fov_caja() -> bool:
	if _cam == null or _aspecto_caja_diseno <= 0.0 or not (size.x > 0.0 and size.y > 0.0):
		return false



	UiKit.encuadre_caja(_cam, CAM_FOV, _aspecto_caja_diseno, size.x / size.y, true)
	return true


func _make_env() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0b0b0d")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(_style.get("wall", Color("21232a")))













	env.ambient_light_energy = float(_style.get("ambient", 0.55))






	env.fog_enabled = true
	env.fog_light_color = Color("16181d")
	env.fog_density = 0.02
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	_vp.add_child(we)





func _slab(sz: Vector3, pos: Vector3, col: Color, rough: float,
		metal: float = 0.0) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rough
	mat.metallic = metal
	mi.material_override = mat
	mi.position = pos
	_vp.add_child(mi)
	return mi





func _make_room() -> void:
	var half_d: float = ROOM_D * 0.5



	var suelo: Color = Color(_style["floor"])
	var rugoso: float = float(_style["floor_rough"])
	if suelo_mojado:
		suelo = suelo.darkened(MOJADO_OSCURO)
		if _style != DIV_STYLE[1]:
			rugoso = minf(rugoso, MOJADO_RUGOSO)
	_slab(Vector3(ROOM_W, 0.1, ROOM_D + 2.5), Vector3(0, -0.05, half_d + 0.95),
		suelo, rugoso)
	_slab(Vector3(ROOM_W, 0.1, ROOM_D), Vector3(0, _room_h, half_d - 0.3),
		Color(_style["ceiling"]), 0.95)
	_slab(Vector3(ROOM_W, _room_h, 0.12), Vector3(0, _room_h * 0.5, -0.3),
		Color(_style["wall"]), 0.88)
	var side: Color = Color(_style["wall"]).darkened(0.15)



	_slab(Vector3(0.12, _room_h, ROOM_D),
		Vector3(ROOM_W * 0.5, _room_h * 0.5, half_d - 0.3), side, 0.9)
	var x_izq: float = - ROOM_W * 0.5

	_slab(Vector3(0.12, _room_h, DOOR_Z0 + 0.3),
		Vector3(x_izq, _room_h * 0.5,(DOOR_Z0 - 0.3) * 0.5), side, 0.9)




	var fondo: float = half_d - 0.3 + ROOM_D * 0.5
	for tramo in [[DOOR_Z1, DUCHA_Z0], [DUCHA_Z1, fondo]]:
		var largo: float = float(tramo[1]) - float(tramo[0])
		_slab(Vector3(0.12, _room_h, largo),
			Vector3(x_izq, _room_h * 0.5, float(tramo[0]) + largo * 0.5), side, 0.9)


	_slab(Vector3(0.12, _room_h - DOOR_H, DOOR_Z1 - DOOR_Z0),
		Vector3(x_izq,(_room_h + DOOR_H) * 0.5,(DOOR_Z0 + DOOR_Z1) * 0.5),
		side, 0.9)
	_slab(Vector3(0.12, _room_h - DUCHA_H, DUCHA_Z1 - DUCHA_Z0),
		Vector3(x_izq,(_room_h + DUCHA_H) * 0.5,(DUCHA_Z0 + DUCHA_Z1) * 0.5),
		side, 0.9)











	_slab(Vector3(ROOM_W + 0.12, _room_h, 0.12),
		Vector3(0.0, _room_h * 0.5, fondo + 0.06), side, 0.9)



	if bool(_style.get("rug", false)):










		var tejido: Color = Color(_style["floor"]).darkened(0.42) \
				.lerp(_accent.darkened(0.35), 0.45)
		_slab(Vector3(ROOM_W - 1.4, 0.02, 5.6), Vector3(0, 0.01, 2.55),
			tejido.darkened(MOJADO_OSCURO) if suelo_mojado else tejido, 0.95)


		for sgn in [-1.0, 1.0]:
			_slab(Vector3(ROOM_W - 1.4, 0.02, 0.08),
				Vector3(0, 0.015, 2.55 + sgn * 2.76),
				_accent.darkened(0.25), 0.9)








	var moqueta: bool = bool(_style.get("rug", false))
	var junta: Color = _accent.lightened(0.15) if moqueta \
			else Color(_style["floor"]).darkened(0.3)
	if moqueta:
		junta = junta.darkened(0.45)
	var jy: float = 0.03 if moqueta else 0.012
	for i in range(-2, 3):
		_slab(Vector3(0.05, 0.02, ROOM_D + 2.0),
			Vector3(float(i) * 1.9, jy, half_d + 0.7), junta, 0.98)
	for j in range(0, 5):
		_slab(Vector3(ROOM_W, 0.02, 0.05),
			Vector3(0.0, jy, -0.1 + float(j) * 1.9), junta, 0.98)





func _make_lockers() -> void:
	var mine: int = BAY_N / 2
	for i in BAY_N:


		_make_bay(float(i - mine) * BAY_W,(not ajena) and i == mine, i)






func _measure_plate_font() -> int:
	var probe: Label = CareerUi.plain(PLATE_NAME_FONT, CareerTheme.TEXT)
	add_child(probe)
	var f: Font = probe.get_theme_font("font")
	var avail: float = float(PLATE_PX) - 40.0
	var px: int = PLATE_NAME_FONT
	var mine: int = BAY_N / 2
	for i in BAY_N:
		var who: String = _surname(Career.player_name) if i == mine \
				else _surname(String(_mate(i).get("name", "")))
		var need: float = f.get_string_size(CareerUi.display_name(who),
			HORIZONTAL_ALIGNMENT_LEFT, -1.0, PLATE_NAME_FONT).x
		if need > avail:
			px = mini(px, int(float(PLATE_NAME_FONT) * avail / need))
	probe.queue_free()
	return maxi(px, PLATE_NAME_MIN)








func _make_bay(x: float, mine: bool, idx: int) -> void:
	var body: Color = Color(_style["body"])
	var door: Color = Color(_style["door"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])
	var accent_mix: float = float(_style["accent"])






	_slab(Vector3(BAY_W, LOCKER_H, 0.08), Vector3(x, LOCKER_H * 0.5, -0.2),
		body.lerp(_accent.darkened(0.65), maxf(accent_mix, 0.35)), 0.85)



	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.05, LOCKER_H, LOCKER_D),
			Vector3(x + sgn * BAY_W * 0.5, LOCKER_H * 0.5, LOCKER_D * 0.5 - 0.24),
			door, rough, metal)


	_slab(Vector3(BAY_W, 0.1, LOCKER_D),
		Vector3(x, LOCKER_H, LOCKER_D * 0.5 - 0.24), door, rough, metal)


	if bool(_style.get("bay_shelf", true)):
		_slab(Vector3(BAY_W - 0.06, 0.06, LOCKER_D),
			Vector3(x, 1.72, LOCKER_D * 0.5 - 0.24), door, rough, metal)




	if not (bool(_style.get("grime", false)) and idx == GRIME_NO_ROD and not mine):
		_slab(Vector3(BAY_W - 0.12, 0.03, 0.03), Vector3(x, 1.66, JERSEY_Z),
			door.lightened(0.25), 0.3, 0.7)

	if bool(_style.get("bay_bench", true)):
		_slab(Vector3(BAY_W - 0.04, 0.08, LOCKER_D - 0.06),
			Vector3(x, 0.44, LOCKER_D * 0.5 - 0.26), Color(_style["bench"]), 0.7)

	var num: int = _my_number()
	var surname: String = _surname(Career.player_name)
	var mate: Dictionary = {}
	if not mine:
		mate = _mate(idx)
		num = int(mate.get("number", idx + 2))
		surname = _surname(String(mate.get("name", "")))







		if not mate.is_empty() and not farewell \
				and (absent_name.is_empty() or String(mate.get("name", "")) != absent_name):
			_make_mate_player(x, mate)










	if (mine or idx % int(_style.get("jersey_every", 1)) == 0) \
			and not (mine and farewell) and idx != empty_bay:
		_make_jersey(x, num, surname, _my_kit() if mine else kit_de(mate))



	if idx == empty_bay:







		_slab(Vector3(PLATE_W, PLATE_W * PLATE_ASPECT, 0.015),
			Vector3(x, LOCKER_H + 0.22, LOCKER_D - 0.23),
			Color(_style["body"]).lightened(0.22), 0.95)
	elif mine or bool(_style.get("plates_all", false)):
		_make_plate(x, num, surname, mine,
			String(mate.get("name", "")) == _rival_name and not _rival_name.is_empty(),
			not mine and _es_socio(String(mate.get("name", ""))))


	if not mine and not mate.is_empty() and idx != empty_bay:
		_mate_props(x, String(mate.get("name", "")))


	if bool(_style.get("kit_props", false)):
		_slab(Vector3(0.3, 0.11, 0.2), Vector3(x - 0.3, 0.06, 0.1),
			Color("1b1b1e"), 0.6)
		_slab(Vector3(0.28, 0.09, 0.22), Vector3(x + 0.32, 0.53, 0.06),
			_accent.lightened(0.55), 0.95)








func _assign_mates() -> void:
	_mates_by_bay.clear()
	_mate_spots.clear()
	_resto.clear()



	var squad: Array = _nat_mates() if _nat \
			else Squad.of(_squad_club()).duplicate()
	if squad.is_empty():
		return






	if not ajena:
		var you: int = _my_number()
		squad = squad.filter(func(p: Dictionary) -> bool:
			return int(p.get("number", -1)) != you)



	if not _nat:
		squad.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return Squad.ovr(a) > Squad.ovr(b))



	if not focus_name.is_empty():
		for fi in squad.size():
			if String((squad[fi] as Dictionary).get("name", "")) != focus_name:
				continue
			var quien: Dictionary = squad[fi]
			squad.remove_at(fi)
			squad.push_front(quien)
			break
	var mine: int = BAY_N / 2


	var bays: Array = []
	for i in BAY_N:
		if ajena or i != mine:
			bays.append(i)
	bays.sort_custom(func(a: int, b: int) -> bool:
		var da: int = absi(a - mine)
		var db: int = absi(b - mine)
		return a < b if da == db else da < db)
	for r in bays.size():


		if bays[r] == empty_bay:
			continue
		if r < squad.size():
			_mates_by_bay[bays[r]] = squad[r]

	var en_fila: Dictionary = {}
	for b in _mates_by_bay:
		en_fila[String((_mates_by_bay[b] as Dictionary).get("name", ""))] = true
	for p in squad:
		var nombre: String = String((p as Dictionary).get("name", ""))
		if not nombre.is_empty() and not en_fila.has(nombre) and nombre != absent_name:
			_resto.append(p)














	if not squad.is_empty():
		if _captain_is_mine():
			_captain_name = ""
		else:
			_captain_name = Squad.captain_name(_squad_club()) if not _nat \
					else String(squad[0].get("name", ""))

















	if not _nat:
		var plantel: Array = Squad.of(_squad_club())
		var asiento: int = Squad.user_index(plantel)
		if asiento >= 0:
			_rival_name = String((plantel[asiento] as Dictionary).get("name", ""))
		return







	var rival_ovr: float = -1.0
	var hay_puesto: bool = false
	var mi_linea: String = Squad.line_of(Squad.USER_POS)
	for p in squad:
		var pos_p: String = String(p.get("pos", ""))
		if pos_p == Squad.USER_POS:
			if not hay_puesto or Squad.ovr(p) > rival_ovr:
				_rival_name = String(p.get("name", ""))
				rival_ovr = Squad.ovr(p)
			hay_puesto = true
			continue
		if not hay_puesto and Squad.line_of(pos_p) == mi_linea \
				and Squad.ovr(p) > rival_ovr:
			rival_ovr = Squad.ovr(p)
			_rival_name = String(p.get("name", ""))










func _nat_mates() -> Array:
	var out: Array = []
	for r in Career.nat_squad_list():
		var row: Dictionary = r
		if bool(row.get("is_you", false)):
			continue
		out.append({
			"name": String(row.get("name", "")),
			"number": int(row.get("number", row.get("rank", out.size() + 1))),
			"pos": String(row.get("pos", "MC")),
		})
	return out




func _mate(idx: int) -> Dictionary:
	return _mates_by_bay.get(idx, {})






func _surname(full: String) -> String:
	return CareerUi.surname(full)




func _make_bench() -> void:
	var col: Color = Color(_style["bench"])





	var met: float = float(_style.get("bench_metal", _style["metal"]))
	_slab(Vector3(BENCH_W, 0.09, BENCH_D), Vector3(BENCH_X, BENCH_H, BENCH_Z),
		col, 0.68, met * 0.4)
	for s in [-1.0, 1.0]:
		_slab(Vector3(0.1, BENCH_H, BENCH_D - 0.08),
			Vector3(BENCH_X + s * BENCH_W * 0.36, BENCH_H * 0.5, BENCH_Z),
			col.darkened(0.35), 0.8, met)











































const DOOR_Z0: float = 0.95
const DOOR_Z1: float = 2.15
const DOOR_H: float = 2.2



const DOOR_DEPTH: float = 1.6





const DOOR_OPEN_DEG: float = 98.0


const DOOR_SWING: float = 0.55


const DOOR_LIGHT_SHUT: float = 0.25

const DOOR_CREST_W: float = 0.52
const DOOR_CREST_Y: float = 1.42

























const ID_STRIPE_W: float = 0.22


const CREST_PAINT_W: float = 0.86
const CREST_PAINT_Y: float = 1.78
const CREST_PAINT_Z: float = 3.05

const ID_FLOOR_W: float = 2.1





const ID_FLOOR_POS: Vector2 = Vector2(-1.35, 3.7)









func _make_doorway() -> void:
	var x: float = - ROOM_W * 0.5
	var zc: float =(DOOR_Z0 + DOOR_Z1) * 0.5
	var w: float = DOOR_Z1 - DOOR_Z0




	var marco: Color = Color(_style["door"]).darkened(0.55)
	var acc: float = float(_style["accent"])
	if acc > 0.0:
		marco = marco.lerp(_accent.darkened(0.5), acc * 0.4)

	_slab(Vector3(DOOR_DEPTH, DOOR_H, w + 0.1),
		Vector3(x - DOOR_DEPTH * 0.5 - 0.06, DOOR_H * 0.5, zc),
		Color(_style["ceiling"]).lightened(0.03), 0.99)

	_slab(Vector3(0.1, DOOR_H, w + 0.1),
		Vector3(x - DOOR_DEPTH - 0.06, DOOR_H * 0.5, zc),
		Color(_style["wall"]).darkened(0.35), 0.95)


	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.16, DOOR_H, 0.1),
			Vector3(x + 0.02, DOOR_H * 0.5, zc + sgn *(w * 0.5 + 0.05)),
			marco, float(_style["rough"]), float(_style["metal"]))
	_slab(Vector3(0.16, 0.1, w + 0.2),
		Vector3(x + 0.02, DOOR_H + 0.05, zc),
		marco, float(_style["rough"]), float(_style["metal"]))







	_door_pivot = Node3D.new()
	_door_pivot.position = Vector3(x + 0.02, 0.0, DOOR_Z1)
	_vp.add_child(_door_pivot)
	var hoja: MeshInstance3D = MeshInstance3D.new()
	var hm: BoxMesh = BoxMesh.new()
	hm.size = Vector3(0.07, DOOR_H - 0.06, w - 0.04)
	hoja.mesh = hm
	var hmat: StandardMaterial3D = StandardMaterial3D.new()
	hmat.albedo_color = Color(_style["door"]).darkened(0.25) if acc <= 0.0 \
			else Color(_style["door"]).darkened(0.3).lerp(club_tint(0.15), acc)
	hmat.roughness = float(_style["rough"])
	hmat.metallic = float(_style["metal"])
	hoja.material_override = hmat

	hoja.position = Vector3(0.0,(DOOR_H - 0.06) * 0.5, -(w - 0.04) * 0.5)
	_door_pivot.add_child(hoja)




	if bool(_style.get("crest", false)):
		var esc: Sprite3D = Sprite3D.new()
		esc.texture = _crest_texture()
		esc.pixel_size = DOOR_CREST_W / float(CREST_PX)
		esc.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		esc.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		esc.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		esc.position = Vector3(0.05, DOOR_CREST_Y, -(w - 0.04) * 0.5)
		_door_pivot.add_child(esc)


	var l: OmniLight3D = OmniLight3D.new()
	l.light_color = Color(_style["light"])
	l.light_energy = float(_style.get("door_light", 1.5))



	l.omni_range = 5.0
	l.position = Vector3(x - 0.45, 2.05, zc)
	_vp.add_child(l)
	_door_light = l
	_door_energy = l.light_energy

	l.light_energy = _door_energy * DOOR_LIGHT_SHUT






func _make_identity() -> void:






	if bool(_style.get("crest_paint", false)):
		var pint: Sprite3D = Sprite3D.new()
		pint.texture = _crest_texture()
		pint.pixel_size = CREST_PAINT_W / float(CREST_PX)
		pint.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		pint.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		pint.modulate = Color(0.72, 0.66, 0.56, 0.62)
		pint.rotation_degrees = Vector3(0.0, 90.0, 0.0)
		pint.position = Vector3(- ROOM_W * 0.5 + 0.09, CREST_PAINT_Y, CREST_PAINT_Z)
		_vp.add_child(pint)
	var acc: float = float(_style["accent"])
	if acc <= 0.0:
		return
	var col: Color = club_tint(0.19)
	var x: float = - ROOM_W * 0.5 + 0.05

	for z in [DOOR_Z0 - 0.55, DOOR_Z1 + 0.55]:
		_slab(Vector3(0.03, _room_h - 0.5, ID_STRIPE_W),
			Vector3(x,(_room_h - 0.5) * 0.5, z), col, 0.85)


	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(ID_FLOOR_W, ID_FLOOR_W)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _crest_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.95
	mat.albedo_color = Color(1, 1, 1, 0.28)
	quad.material_override = mat
	quad.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	quad.position = Vector3(ID_FLOOR_POS.x, 0.035, ID_FLOOR_POS.y)
	_vp.add_child(quad)














func _make_wainscot() -> void:
	var cfg: Dictionary = _style.get("wainscot", {})
	if cfg.is_empty():
		return
	var alto: float = float(cfg["alto"])
	for t in _tramos_pared():
		var x: float = float(t["x"])
		var z0: float = float(t["z0"])
		var largo: float = float(t["z1"]) - z0
		_slab(Vector3(0.04, alto, largo), Vector3(x *(ROOM_W * 0.5 - 0.07),
			alto * 0.5, z0 + largo * 0.5), Color(cfg["col"]), 0.9)



		_slab(Vector3(0.05, 0.06, largo), Vector3(x *(ROOM_W * 0.5 - 0.07),
			alto + 0.03, z0 + largo * 0.5), Color(cfg["borde"]), 0.75)



	var zf: float = ROOM_D - 0.3 - 0.07
	_slab(Vector3(ROOM_W - 0.1, alto, 0.04), Vector3(0.0, alto * 0.5, zf),
		Color(cfg["col"]), 0.9)
	_slab(Vector3(ROOM_W - 0.1, 0.06, 0.05), Vector3(0.0, alto + 0.03, zf),
		Color(cfg["borde"]), 0.75)








func _tramos_pared() -> Array:
	var fondo: float = ROOM_D - 0.3
	return [{"x": -1.0, "z0": -0.3, "z1": DUCHA_Z0},
		{"x": -1.0, "z0": DUCHA_Z1, "z1": fondo},
		{"x": 1.0, "z0": -0.3, "z1": fondo}]








func _make_pipes() -> void:
	if not bool(_style.get("pipes", false)):
		return



	var col: Color = Color(_style["wall"]).lightened(0.42)
	for cfg in [{"z": 0.75, "r": 0.055}, {"z": 1.15, "r": 0.038},
			{"z": 2.35, "r": 0.045}]:
		var mi: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = float(cfg["r"])
		cm.bottom_radius = float(cfg["r"])
		cm.height = ROOM_W
		cm.radial_segments = 8
		mi.mesh = cm
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = col
		mat.roughness = 0.65
		mat.metallic = 0.2
		mi.material_override = mat

		mi.rotation_degrees = Vector3(0.0, 0.0, 90.0)
		mi.position = Vector3(0.0, _room_h - 0.16, float(cfg["z"]))
		_vp.add_child(mi)






func _make_trim() -> void:
	var zoc: Color = Color(_style["wall"]).darkened(0.45)
	for t in _tramos_pared():
		var z0: float = float(t["z0"])
		var largo: float = float(t["z1"]) - z0
		_slab(Vector3(0.04, 0.16, largo),
			Vector3(float(t["x"]) *(ROOM_W * 0.5 - 0.08), 0.08, z0 + largo * 0.5),
			zoc, 0.95)

	_slab(Vector3(ROOM_W - 0.12, 0.16, 0.04), Vector3(0.0, 0.08, ROOM_D - 0.3 - 0.08),
		zoc, 0.95)


















func _make_beams() -> void:


	if bool(_style.get("pipes", false)):
		return
	var col: Color = Color(_style["ceiling"]).lightened(0.07)




	for z in [0.5, 1.9]:
		_slab(Vector3(ROOM_W, 0.16, 0.24), Vector3(0.0, _room_h - 0.2, z), col,
			0.95, float(_style["metal"]) * 0.5)








func _lamp(x: float, z: float) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(float(_style.get("lamp_w", 0.8)), 0.06, 0.26)
	mi.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	var col: Color = Color(_style["light"])
	mat.albedo_color = col
	mat.emission_enabled = true
	mat.emission = col







	mat.emission_energy_multiplier = 0.45 if int(_style["lights"]) > 1 else 0.3
	mi.material_override = mat

	mi.position = Vector3(x, _room_h - 0.09, z)
	_vp.add_child(mi)



	if bool(_style.get("bulb_cord", false)):
		_slab(Vector3(0.012, 0.3, 0.012), Vector3(x, _room_h - 0.26, z),
			Color(_style["ceiling"]).lightened(0.2), 0.9)
		var bulbo: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.075
		sm.height = 0.15
		sm.radial_segments = 8
		sm.rings = 5
		bulbo.mesh = sm
		var bm2: StandardMaterial3D = StandardMaterial3D.new()
		bm2.albedo_color = col
		bm2.emission_enabled = true
		bm2.emission = col
		bm2.emission_energy_multiplier = 0.55
		bulbo.material_override = bm2
		bulbo.position = Vector3(x, _room_h - 0.45, z)
		_vp.add_child(bulbo)













func _make_gear() -> void:






	if farewell:
		return
	var nivel: int = int(_style.get("gear", 2))
	if nivel <= 0:
		return
	var lona: Color = _accent.darkened(0.62) if float(_style["accent"]) > 0.0 \
			else Color(_style["bench"]).darkened(0.35)



	_slab(Vector3(1.3, 0.34, 0.46), Vector3(-4.55, 0.17, 3.3), lona, 0.9)
	_slab(Vector3(1.16, 0.1, 0.4), Vector3(-4.55, 0.38, 3.3),
		lona.lightened(0.12), 0.88)

	for i in 3:
		var b: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.11
		sm.height = 0.22
		sm.radial_segments = 10
		sm.rings = 6
		b.mesh = sm
		var m: StandardMaterial3D = StandardMaterial3D.new()
		m.albedo_color = Color(0.86, 0.86, 0.84).darkened(0.06 * float(i))
		m.roughness = 0.75
		b.material_override = m
		b.position = Vector3(-5.05 + 0.26 * float(i), 0.11, 2.55 + 0.3 * float(i))
		_vp.add_child(b)
	if nivel >= 2:

		_slab(Vector3(0.54, 0.3, 0.38), Vector3(3.25, 0.15, 0.95),
			Color(_style["bench"]).darkened(0.2), 0.9)
		for i in 4:
			_slab(Vector3(0.09, 0.2, 0.09),
				Vector3(3.06 + 0.13 * float(i), 0.4, 0.95),
				Color(0.72, 0.76, 0.78), 0.35)
	if nivel >= 3:


		_slab(Vector3(0.62, 0.62, 0.58), Vector3(4.45, 0.31, 0.75),
			Color(_style["body"]).lightened(0.1), 0.94)
		_slab(Vector3(0.5, 0.16, 0.46), Vector3(4.45, 0.68, 0.75),
			Color(0.8, 0.8, 0.78), 0.95)





	if nivel >= 2:
		var pata: Color = Color(_style["door"]).darkened(0.25)
		for sgn in [-1.0, 1.0]:
			_slab(Vector3(0.07, 0.62, 0.07),
				Vector3(-3.75 + sgn * 0.8, 0.31, 5.95), pata, 0.6, 0.55)
		_slab(Vector3(1.95, 0.14, 0.66), Vector3(-3.75, 0.69, 5.95),
			Color(_style["bench"]).darkened(0.1), 0.85)

		_slab(Vector3(1.8, 0.03, 0.58), Vector3(-3.75, 0.78, 5.95),
			Color(0.82, 0.83, 0.81), 0.95)

		_slab(Vector3(0.34, 0.86, 0.34), Vector3(-5.05, 0.43, 5.1),
			Color(_style["body"]).lightened(0.16), 0.8)
		_slab(Vector3(0.3, 0.44, 0.3), Vector3(-5.05, 1.08, 5.1),
			Color(0.62, 0.74, 0.8), 0.25)
	if bool(_style.get("board", false)):
		_make_board()












const BOARD_X: float = -2.65
const BOARD_Z: float = 3.25


func _make_board() -> void:
	var pata: Color = Color(_style["door"]).darkened(0.2)
	for sgn in [-1.0, 1.0]:
		var l: MeshInstance3D = _slab(Vector3(0.05, 1.12, 0.05),
			Vector3(BOARD_X + sgn * 0.34, 0.56, BOARD_Z), pata, 0.6, 0.5)

		l.rotation_degrees = Vector3(0.0, 0.0, sgn * -6.0)
	_slab(Vector3(0.94, 0.66, 0.04), Vector3(BOARD_X, 1.44, BOARD_Z),
		Color(0.84, 0.85, 0.83), 0.88)


	var marco: Color = _accent.darkened(0.35) if float(_style["accent"]) > 0.0 \
			else pata
	for dy in [-0.35, 0.35]:
		_slab(Vector3(1.02, 0.05, 0.05), Vector3(BOARD_X, 1.44 + dy, BOARD_Z),
			marco, 0.7, 0.3)











	_slab(Vector3(0.62, 0.02, 0.01), Vector3(BOARD_X - 0.05, 1.5, BOARD_Z + 0.03),
		Color(0.3, 0.34, 0.42), 0.9)
	for i in 3:
		_slab(Vector3(0.07, 0.07, 0.01),
			Vector3(BOARD_X - 0.24 + 0.22 * float(i), 1.33, BOARD_Z + 0.03),
			CareerTheme.DANGER.darkened(0.25), 0.9)



















































const DUCHA_Z0: float = 6.55
const DUCHA_Z1: float = 7.85
const DUCHA_H: float = 2.2


const DUCHA_FONDO: float = 1.9
const DUCHA_ALA: float = 0.45



const DUCHA_AZULEJO: Dictionary = {1: Color("c3c8c5"), 2: Color("8c99a1"), 3: Color("7b8676")}



const L_Z0: float = 0.4
const L_N: int = 5
const L_W: float = 0.62
const L_D: float = 0.48

const COLG_Z0: float = 3.9
const COLG_Z1: float = 7.9


func _make_sala_tumbada() -> void:
	_make_duchas()
	_make_taquillas_l()
	_make_colgadores()
	_make_rincon_fondo()





func _azulejo(col: Color, brillo: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = 0.35
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = brillo
	return m



func _caja_mat(sz: Vector3, pos: Vector3, mat: Material) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = sz
	mi.mesh = bm
	mi.material_override = mat
	mi.position = pos
	_vp.add_child(mi)
	return mi






func _make_duchas() -> void:
	var div: int = 1 if _style == DIV_STYLE[1] else (2 if _style == DIV_STYLE[2] else 3)
	var teja: Color = Color(DUCHA_AZULEJO[div])
	var pared: StandardMaterial3D = _azulejo(teja, 0.16)
	var suelo: StandardMaterial3D = _azulejo(teja.darkened(0.35), 0.06)
	var x: float = - ROOM_W * 0.5
	var z0: float = DUCHA_Z0 - DUCHA_ALA
	var z1: float = DUCHA_Z1 + DUCHA_ALA
	var zc: float =(z0 + z1) * 0.5
	var ancho: float = z1 - z0
	var alto: float = DUCHA_H + 0.4
	var xf: float = x - 0.06 - DUCHA_FONDO
	_caja_mat(Vector3(DUCHA_FONDO, 0.1, ancho), Vector3(x - 0.06 - DUCHA_FONDO * 0.5,
		-0.05, zc), suelo)
	_caja_mat(Vector3(DUCHA_FONDO, 0.1, ancho), Vector3(x - 0.06 - DUCHA_FONDO * 0.5,
		alto, zc), _azulejo(teja.darkened(0.25), 0.08))
	_caja_mat(Vector3(0.1, alto, ancho), Vector3(xf, alto * 0.5, zc), pared)
	for z in [z0, z1]:
		_caja_mat(Vector3(DUCHA_FONDO, alto, 0.1),
			Vector3(x - 0.06 - DUCHA_FONDO * 0.5, alto * 0.5, z), pared)



	var junta: StandardMaterial3D = _azulejo(teja.darkened(0.3), 0.05)
	for k in 5:
		_caja_mat(Vector3(0.01, 0.02, ancho), Vector3(xf + 0.055, 0.42 * float(k + 1), zc),
			junta)
		_caja_mat(Vector3(0.01, alto, 0.02), Vector3(xf + 0.055, alto * 0.5,
			z0 + ancho * float(k + 1) / 6.0), junta)



	_caja_mat(Vector3(1.05, 1.95, 0.06), Vector3(xf + 0.58, 0.975, zc),
		_azulejo(teja.darkened(0.18), 0.1))



	var grifo: Color = Color(0.7, 0.72, 0.74) if div < 3 else Color(0.55, 0.45, 0.28)
	for zr in [zc - 0.55, zc + 0.55]:
		_slab(Vector3(0.04, 0.55, 0.04), Vector3(xf + 0.08, 2.05, zr), grifo, 0.3, 0.7)
		_slab(Vector3(0.24, 0.04, 0.04), Vector3(xf + 0.19, 1.8, zr), grifo, 0.3, 0.7)
		_slab(Vector3(0.18, 0.05, 0.22), Vector3(xf + 0.3, 1.77, zr), grifo, 0.3, 0.7)
		_slab(Vector3(0.05, 0.1, 0.1), Vector3(xf + 0.08, 1.1, zr), grifo, 0.3, 0.7)


	var marco: StandardMaterial3D = _azulejo(teja.darkened(0.45), 0.04)
	var w: float = DUCHA_Z1 - DUCHA_Z0
	for sgn in [-1.0, 1.0]:
		_caja_mat(Vector3(0.16, DUCHA_H, 0.08), Vector3(x + 0.02, DUCHA_H * 0.5,
			(DUCHA_Z0 + DUCHA_Z1) * 0.5 + sgn *(w * 0.5 + 0.04)), marco)
	_caja_mat(Vector3(0.16, 0.08, w + 0.16), Vector3(x + 0.02, DUCHA_H + 0.04,
		(DUCHA_Z0 + DUCHA_Z1) * 0.5), marco)


	var esfera: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.17
	cm.bottom_radius = 0.17
	cm.height = 0.04
	cm.radial_segments = 16
	esfera.mesh = cm
	var em: StandardMaterial3D = StandardMaterial3D.new()
	em.albedo_color = Color(0.86, 0.86, 0.83)
	em.roughness = 0.5
	esfera.material_override = em
	esfera.rotation_degrees = Vector3(0.0, 0.0, 90.0)
	var yr: float = minf(DUCHA_H + 0.42, _room_h - 0.36)
	esfera.position = Vector3(x + 0.08, yr,(DUCHA_Z0 + DUCHA_Z1) * 0.5)
	_vp.add_child(esfera)
	var aguja: Color = Color(0.1, 0.1, 0.11)
	var hora: MeshInstance3D = _slab(Vector3(0.01, 0.1, 0.025),
		Vector3(x + 0.105, yr + 0.04,(DUCHA_Z0 + DUCHA_Z1) * 0.5), aguja, 0.6)
	hora.rotation_degrees = Vector3(-35.0, 0.0, 0.0)
	_slab(Vector3(0.01, 0.025, 0.14), Vector3(x + 0.11, yr,
		(DUCHA_Z0 + DUCHA_Z1) * 0.5 + 0.06), aguja, 0.6)






func _make_taquillas_l() -> void:
	var body: Color = Color(_style["body"])
	var door: Color = Color(_style["door"])
	var rough: float = float(_style["rough"])
	var metal: float = float(_style["metal"])
	var acc: float = float(_style["accent"])
	var x: float = ROOM_W * 0.5 - L_D * 0.5
	var largo: float = L_W * float(L_N)
	_slab(Vector3(L_D, LOCKER_H, largo), Vector3(x, LOCKER_H * 0.5, L_Z0 + largo * 0.5),
		body, 0.85)

	_slab(Vector3(L_D + 0.02, 0.1, largo + 0.02), Vector3(x, LOCKER_H + 0.05,
		L_Z0 + largo * 0.5), door.darkened(0.2), rough, metal)



	_slab(Vector3(L_D, LOCKER_H, 0.03), Vector3(x, LOCKER_H * 0.5, L_Z0 + largo + 0.015),
		door.lightened(0.18), rough, metal)
	var tirador: Color = door.lightened(0.3) if acc <= 0.0 \
			else door.lightened(0.2).lerp(_accent, acc * 0.6)
	var cara: float = ROOM_W * 0.5 - L_D - 0.012
	for i in L_N:
		var zc: float = L_Z0 + L_W *(float(i) + 0.5)
		_slab(Vector3(0.025, LOCKER_H - 0.14, L_W - 0.05), Vector3(cara, LOCKER_H * 0.5,
			zc), door, rough, metal)
		_slab(Vector3(0.03, 0.16, 0.03), Vector3(cara - 0.02, 1.05, zc - L_W * 0.32),
			tirador, 0.35, 0.7)


		_slab(Vector3(0.01, 0.14, L_W - 0.22), Vector3(cara - 0.012, LOCKER_H - 0.3, zc),
			body.darkened(0.3), 0.9)







func _make_colgadores() -> void:
	var largo: float = COLG_Z1 - COLG_Z0
	var zc: float =(COLG_Z0 + COLG_Z1) * 0.5
	var xw: float = ROOM_W * 0.5
	var metal: float = float(_style["metal"])
	var barra: Color = Color(_style["door"]).lightened(0.25)
	_slab(Vector3(0.05, 0.05, largo), Vector3(xw - 0.13, 1.78, zc), barra, 0.3, 0.7)


	_slab(Vector3(0.03, 0.14, largo), Vector3(xw - 0.08, 1.8, zc),
		Color(_style["door"]).darkened(0.15), float(_style["rough"]), metal)
	var banca: Color = Color(_style["bench"])
	var bmet: float = float(_style.get("bench_metal", metal))
	_slab(Vector3(BENCH_D, 0.09, largo - 0.2), Vector3(xw - 0.06 - BENCH_D * 0.5,
		BENCH_H, zc), banca, 0.68, bmet * 0.4)
	for k in 3:
		_slab(Vector3(BENCH_D - 0.08, BENCH_H, 0.1), Vector3(xw - 0.06 - BENCH_D * 0.5,
			BENCH_H * 0.5, COLG_Z0 + 0.3 +(largo - 0.6) * float(k) * 0.5),
			banca.darkened(0.35), 0.8, bmet)
	if farewell:
		return
	var toalla: Color = Color(0.86, 0.86, 0.83) if _style != DIV_STYLE[3] \
			else Color(0.7, 0.67, 0.6)
	var prendas: Array = [
		{"z": COLG_Z0 + 0.55, "col": toalla, "alto": 0.62},




		{"z": COLG_Z0 + 1.45, "col": club_tint(0.28), "alto": 0.7},
		{"z": COLG_Z0 + 2.6, "col": club_tint(0.42), "alto": 0.5},
		{"z": COLG_Z0 + 3.4, "col": toalla.darkened(0.08), "alto": 0.56},
	]
	for p in prendas:
		var alto: float = float(p["alto"])
		_slab(Vector3(0.04, alto, 0.38), Vector3(xw - 0.17, 1.76 - alto * 0.5,
			float(p["z"])), Color(p["col"]), 0.95)






func _make_rincon_fondo() -> void:
	var x: float = - ROOM_W * 0.5
	var tercera: bool = _style == DIV_STYLE[3]

	if not tercera:
		_slab(Vector3(0.06, 0.56, 0.96), Vector3(x + 0.09, 1.98, 5.1),
			Color(0.06, 0.06, 0.07), 0.4, 0.3)
		var pantalla: StandardMaterial3D = _azulejo(Color(0.16, 0.22, 0.3), 0.55)
		_caja_mat(Vector3(0.01, 0.48, 0.88), Vector3(x + 0.125, 1.98, 5.1), pantalla)
	else:
		_slab(Vector3(0.04, 0.62, 0.92), Vector3(x + 0.08, 1.88, 5.1),
			Color("6e5236"), 0.95)


		for h in [[1.98, 4.88, 0.24], [1.8, 5.18, 0.2], [2.02, 5.36, 0.18], [1.74, 4.84, 0.16]]:
			_slab(Vector3(0.01, float(h[2]) * 1.3, float(h[2])), Vector3(x + 0.105,
				float(h[0]), float(h[1])), Color(0.82, 0.81, 0.76), 0.95)


	var zt: float = 8.62
	var mueble: Color = Color(_style["door"]).darkened(0.1)
	for dz in [-0.44, 0.44]:
		_slab(Vector3(0.4, 1.8, 0.04), Vector3(x + 0.26, 0.9, zt + dz), mueble,
			float(_style["rough"]), float(_style["metal"]))
	for y in [0.4, 0.95, 1.5]:
		_slab(Vector3(0.4, 0.04, 0.88), Vector3(x + 0.26, y, zt), mueble,
			float(_style["rough"]), float(_style["metal"]))
	var toalla: Color = Color(0.88, 0.88, 0.85) if not tercera else Color(0.7, 0.67, 0.6)
	if not farewell:
		for y in [0.42, 0.97, 1.52]:
			_slab(Vector3(0.34, 0.22, 0.78), Vector3(x + 0.26, y + 0.13, zt),
				toalla if y < 1.0 or tercera else toalla.lerp(_accent, 0.25), 0.95)



	var zf: float = ROOM_D - 0.3
	var nx: float = x + 0.42
	var nz: float = zf - 0.34
	var blanca: Color = Color(0.8, 0.81, 0.8) if not tercera else Color(0.7, 0.69, 0.64)
	var cuerpo: Color = Color(0.12, 0.12, 0.13) if _style == DIV_STYLE[1] else blanca
	_slab(Vector3(0.66, 1.86, 0.62), Vector3(nx, 0.93, nz), cuerpo, 0.45, 0.3)
	if _style == DIV_STYLE[1]:
		_caja_mat(Vector3(0.54, 1.5, 0.01), Vector3(nx, 1.02, nz - 0.316),
			_azulejo(Color(0.58, 0.7, 0.78), 0.45))
	else:
		_slab(Vector3(0.62, 0.012, 0.01), Vector3(nx, 1.3, nz - 0.316),
			cuerpo.darkened(0.3), 0.6)
	_slab(Vector3(0.03, 0.4, 0.03), Vector3(nx + 0.24, 1.1, nz - 0.33),
		Color(0.55, 0.56, 0.58), 0.3, 0.7)
	if farewell:
		return


	var pack: Color = Color(0.56, 0.68, 0.76)
	_slab(Vector3(0.42, 0.26, 0.3), Vector3(nx + 0.66, 0.13, zf - 0.22), pack, 0.3)
	_slab(Vector3(0.42, 0.26, 0.3), Vector3(nx + 0.7, 0.39, zf - 0.24),
		pack.darkened(0.08), 0.3)




	if int(_style.get("gear", 2)) < 2:
		return
	var mx: float = -2.85
	var mz: float = 8.55
	var pata: Color = Color(_style["door"]).darkened(0.25)
	_slab(Vector3(1.1, 0.05, 0.6), Vector3(mx, 0.78, mz), Color(_style["bench"]).lightened(0.08),
		0.7)
	for sgn in [-1.0, 1.0]:
		_slab(Vector3(0.05, 0.76, 0.5), Vector3(mx + sgn * 0.48, 0.38, mz), pata, 0.6, 0.5)
	for i in 4:
		_slab(Vector3(0.07, 0.2, 0.07), Vector3(mx - 0.38 + 0.12 * float(i), 0.905,
			mz - 0.1), Color(0.72, 0.8, 0.84), 0.3)
	_slab(Vector3(0.4, 0.03, 0.3), Vector3(mx + 0.25, 0.82, mz + 0.05),
		Color(0.8, 0.8, 0.78), 0.6)
	_slab(Vector3(0.32, 0.05, 0.22), Vector3(mx + 0.25, 0.855, mz + 0.05),
		Color(0.92, 0.55, 0.16), 0.8)










func _make_lights() -> void:
	var n: int = int(_style["lights"])
	var energy: float = float(_style["energy"])
	for i in n:
		var t: float = 0.5 if n == 1 else float(i) / float(n - 1)
		var x: float = lerpf(-3.4, 3.4, t)



		if bool(_style.get("bulb_cord", false)):
			x += 0.85
		var l: OmniLight3D = OmniLight3D.new()
		l.light_color = Color(_style["light"])
		l.light_energy = energy
		l.omni_range = 9.5








		var lz: float = 1.7 if bool(_style.get("bulb_cord", false)) else 0.95
		l.position = Vector3(x,
			_room_h -(0.45 if bool(_style.get("bulb_cord", false)) else 0.35), lz)
		_vp.add_child(l)

		_lamp(x, lz)



		if bool(_style.get("grime", false)):
			_flicker = l
			_flicker_base = energy





			_flicker_t = FLICK_LEN


	if bool(_style.get("bay_light", false)):
		var mine: int = BAY_N / 2
		for i in BAY_N:
			var b: OmniLight3D = OmniLight3D.new()
			b.light_color = Color(_style["light"])
			b.light_energy = float(_style.get("bay_light_energy", 1.4))
			b.omni_range = 1.5
			b.position = Vector3(float(i - mine) * BAY_W, 1.58, 0.0)
			_vp.add_child(b)







	var sala: OmniLight3D = OmniLight3D.new()
	sala.light_color = Color(_style["light"])
	sala.light_energy = energy * 0.45
	sala.omni_range = 12.0
	sala.position = Vector3(1.2, _room_h - 0.6, 4.4)
	_vp.add_child(sala)



	var fill: OmniLight3D = OmniLight3D.new()
	fill.light_color = Color(_style["light"])
	fill.light_energy = energy * 0.4
	fill.omni_range = 6.0
	fill.position = Vector3(0.6, 1.8, 3.1)
	_vp.add_child(fill)









func _make_jersey(x: float, number: int, surname: String = "",
		kit: Dictionary = {}) -> void:

	if kit.is_empty():
		kit = _my_kit()




	var con_lamina: bool = number > 0
	var tex: ImageTexture = JerseyArt.texture(kit,
		0 if con_lamina else number)
	if tex == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = JERSEY_H / float(tex.get_height())
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	spr.position = Vector3(x + JERSEY_X, JERSEY_Y, JERSEY_Z)
	_vp.add_child(spr)
	if not con_lamina:
		return



	var pecho: Rect2 = Rect2(JerseyArt.BODY_X0, JerseyArt.BODY_Y0 + 5,
		JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1, 9)
	var rec: Dictionary = Espalda.receta_para(kit, tex.get_image(), pecho)
	var lam: ImageTexture = Espalda.textura(surname, number, rec)
	if lam == null:
		return



	var nodo: Sprite3D = Espalda.nodo_prenda(lam, spr,
		float(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 - 1),
		float(JerseyArt.BODY_Y0 + JerseyArt.BODY_Y1 + 1) * 0.5, float(JerseyArt.SIZE))

















	nodo.position += Vector3(0.0, 0.0, 0.004)





























func _plate_edge(mine: bool, rival: bool, socio: bool) -> Color:
	if rival:
		return CareerTheme.DANGER
	if socio and not mine:
		return CareerTheme.MONEY
	return _accent if mine else _accent.darkened(0.45)






func _es_socio(nombre: String) -> bool:
	return not nombre.is_empty() and Career.socio_v(nombre) >= Career.SOCIO_UMBRAL









func _make_plate(x: float, number: int, surname: String, mine: bool,
		rival: bool = false, socio: bool = false) -> void:
	var px_h: int = int(round(float(PLATE_PX) * PLATE_ASPECT))
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(PLATE_PX, px_h)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var back: ColorRect = ColorRect.new()
	back.set_anchors_preset(Control.PRESET_FULL_RECT)



	back.color = _accent.darkened(0.55) if mine else Color(_style["door"]).darkened(0.3)
	back.color.a = 0.92
	vp.add_child(back)









	var edge: ColorRect = ColorRect.new()
	edge.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	edge.offset_top = -10
	edge.color = _plate_edge(mine, rival, socio)
	vp.add_child(edge)

	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", -6)
	vp.add_child(col)
	var fg: Color = CareerTheme.TEXT if mine else CareerTheme.TEXT_DIM

	var num: Label = CareerUi.plain(PLATE_NUM_FONT, fg)
	num.text = str(number)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(num)

	var name_l: Label = CareerUi.plain(_plate_font, fg)
	name_l.text = CareerUi.display_name(surname)
	name_l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(name_l)

	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(PLATE_W, PLATE_W * PLATE_ASPECT)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA



	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR_WITH_MIPMAPS



	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	quad.material_override = mat
	quad.position = Vector3(x, LOCKER_H + 0.22, LOCKER_D - 0.22)
	_vp.add_child(quad)
	_congela_con_mips(vp, func(t: Texture2D) -> void: mat.albedo_texture = t)




































func _congela_con_mips(vp: SubViewport, aplica: Callable) -> void:
	_por_congelar.append({"vp": vp, "aplica": aplica})
	if not RenderingServer.frame_post_draw.is_connected(_congelar_ahora):
		RenderingServer.frame_post_draw.connect(_congelar_ahora, CONNECT_ONE_SHOT)




func _congelar_ahora() -> void:
	for f in _por_congelar:





		var o: Variant = f["vp"]
		if not is_instance_valid(o):
			continue
		var vp: SubViewport = o as SubViewport
		var aplica: Callable = f["aplica"]
		if vp == null or vp.is_queued_for_deletion() or not aplica.is_valid():
			continue
		var tex: ViewportTexture = vp.get_texture()
		if tex == null:
			continue
		var img: Image = tex.get_image()
		if img == null:
			continue
		img.generate_mipmaps()
		aplica.call(ImageTexture.create_from_image(img))
		vp.queue_free()
	_por_congelar.clear()















func _make_crest() -> void:
	var tex: Texture2D = _crest_texture()
	var mine: int = BAY_N / 2
	for i in range(BAY_N):
		if i == mine or i % 2 == 1:
			continue
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = tex
		spr.pixel_size = CREST_W / float(CREST_PX)
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



		spr.position = Vector3(float(i - mine) * BAY_W, CREST_Y, -0.14)
		_vp.add_child(spr)





func _crest_texture() -> Texture2D:
	if _crest_tex != null:
		return _crest_tex
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(CREST_PX, CREST_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(CREST_PX, CREST_PX)
	crest.set_team(_room_team())
	vp.add_child(crest)
	_crest_tex = vp.get_texture()
	return _crest_tex



























func piso_tope() -> float:
	return 0.04 if bool(_style.get("rug", false)) else 0.022




func _make_floor_crest() -> void:
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(RUG_CREST_W, RUG_CREST_W)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _crest_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.95




	mat.albedo_color = Color(1, 1, 1, 0.55)
	quad.material_override = mat
	quad.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	quad.position = Vector3(RUG_CREST_X, 0.03, RUG_CREST_Z)
	_vp.add_child(quad)



























func _make_grime() -> void:
	var wall: Color = Color(_style["wall"])
	var mine: int = BAY_N / 2
	for i in BAY_N:
		var x: float = float(i - mine) * BAY_W
		var rng: RandomNumberGenerator = _grime_rng(i)



		for p in 2 +(i % 2):



			var w: float = rng.randf_range(0.22, 0.52)
			var h: float = rng.randf_range(0.07, 0.17)
			_slab(Vector3(w, h, 0.02),
				Vector3(x + rng.randf_range(-0.5, 0.5),
					rng.randf_range(0.35, 1.85), -0.15),
				wall.lightened(rng.randf_range(0.2, 0.34)), 0.98)


		if i % 3 == 0:
			_slab(Vector3(rng.randf_range(0.5, 0.9), 0.26, 0.02),
				Vector3(x + rng.randf_range(-0.3, 0.3), 0.16, -0.15),
				wall.darkened(0.55), 0.99)


	var loose: MeshInstance3D = _slab(Vector3(0.05, LOCKER_H * 0.92, LOCKER_D),
		Vector3(float(1 - mine) * BAY_W + BAY_W * 0.5, LOCKER_H * 0.46,
			LOCKER_D * 0.5 - 0.22),
		Color(_style["door"]).darkened(0.15), float(_style["rough"]),
		float(_style["metal"]))
	loose.rotation_degrees = Vector3(0.0, 0.0, GRIME_TILT)



	for i in [mine - 2, mine + 2]:
		_slab(Vector3(0.06, 0.44, LOCKER_D * 0.7),
			Vector3(float(i - mine) * BAY_W + BAY_W * 0.5, 0.3,
				LOCKER_D * 0.5 - 0.3), GRIME_RUST, 0.98, 0.15)


	for j in 3:
		var rng2: RandomNumberGenerator = _grime_rng(100 + j)
		_slab(Vector3(rng2.randf_range(0.5, 1.1), 0.01,
				rng2.randf_range(0.4, 0.8)),
			Vector3(rng2.randf_range(-2.4, 2.4), 0.015,
				rng2.randf_range(0.9, 2.4)),
			Color(_style["floor"]).darkened(rng2.randf_range(0.28, 0.46)), 0.99)



const GRIME_NO_ROD: int = 4



const GRIME_RUST: Color = Color("5a3320")



const GRIME_TILT: float = 4.5




func _grime_rng(seed_val: int) -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("grime_%d" % seed_val)
	return rng

























func _mate_props(x: float, person: String) -> void:
	if person.is_empty() or _nat:


		return
	var row: Dictionary = _roster_row(person)
	if row.is_empty():
		return


	if int(row.get("injury_weeks", 0)) > 0:
		_make_crutches(x)
	elif bool(row.get("se_va", false)):
		_make_suitcase(x)
	if person == _top_scorer():
		_make_trophy(x, "bota")





func _roster_row(person: String) -> Dictionary:
	if _roster.is_empty():
		for r in Career.squad_roster():
			var row: Dictionary = r
			if not bool(row.get("is_you", false)):
				_roster[String(row.get("name", ""))] = row
	return _roster.get(person, {})





func _top_scorer() -> String:
	if _top_scorer_cache != "":
		return _top_scorer_cache
	_roster_row("")
	var best: int = 0
	for person in _roster:
		var g: int = int((_roster[person] as Dictionary).get("goals", 0))
		if g > best:
			best = g
			_top_scorer_cache = String(person)
	return _top_scorer_cache


func _make_state_props() -> void:




	if farewell:
		return
	if Career.list_status() == Career.LIST_SALE and not hide_suitcase:
		_make_suitcase()
	if Career.injury_weeks > 0:
		_make_crutches()
	_make_trophy()








func _make_suitcase(x: float = 0.0) -> void:
	var col: Color = Color(_style["bench"]).darkened(0.25)
	_slab(Vector3(0.46, 0.32, 0.2), Vector3(x + CASE_X, 0.16, CASE_Z), col, 0.7)

	_slab(Vector3(0.16, 0.04, 0.04), Vector3(x + CASE_X, 0.35, CASE_Z),
		col.darkened(0.4), 0.5)


	_slab(Vector3(0.48, 0.06, 0.21), Vector3(x + CASE_X, 0.2, CASE_Z), _accent, 0.6)










func _make_crutches(at: float = CRUTCH_X) -> void:
	var col: Color = Color(_style["door"]).lightened(0.35)
	for i in 2:
		var x: float = at + float(i) * 0.11
		var palo: MeshInstance3D = _slab(Vector3(0.045, 1.32, 0.045),
			Vector3(x, 0.66, 0.3), col, 0.5, 0.3)
		palo.rotation_degrees = Vector3(0.0, 0.0, -9.0 - float(i) * 2.0)
		_slab(Vector3(0.2, 0.04, 0.04), Vector3(x - 0.1, 1.16, 0.3),
			col.darkened(0.2), 0.5, 0.3)























func _make_trophy(x: float = 0.0, tipo: String = "") -> void:
	if tipo.is_empty():
		var cab: Dictionary = Trophies.cabinet(Career.awards)
		var best: Array = cab.get("team", [])
		if best.is_empty():
			best = cab.get("individual", [])
		if best.is_empty():
			return
		tipo = String((best[0] as Dictionary).get("type", "cup"))
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(TROPHY_PX, TROPHY_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	add_child(vp)
	var icon: TrophyIcon = TrophyIcon.new()
	icon.set_anchors_preset(Control.PRESET_FULL_RECT)
	icon.custom_minimum_size = Vector2(TROPHY_PX, TROPHY_PX)
	icon.set_type(tipo)
	vp.add_child(icon)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = TROPHY_H / float(TROPHY_PX)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	var base_y: float = 0.48 if bool(_style.get("bay_bench", true)) else 0.02
	spr.position = Vector3(x + TROPHY_X, base_y + TROPHY_H * 0.5 - 0.06, 0.02)
	_vp.add_child(spr)
























const ZONE_PAD: float = 0.16

var _zone_jersey: Button
var _zone_locker: Button


func _make_touch_zones() -> void:



	_zone_locker = _make_zone(I18n.t("Tu casillero · abre la TIENDA"),
		func() -> void:
			UiAudio.click()
			locker_pressed.emit())
	_zone_jersey = _make_zone(I18n.t("Tu playera · cambia de uniforme"),
		_on_jersey_pressed)
	_place_touch_zones()


func _make_zone(hint: String, on_press: Callable) -> Button:
	var b: Button = Button.new()
	b.flat = true
	b.focus_mode = Control.FOCUS_NONE
	b.tooltip_text = hint


	for st in ["normal", "hover", "pressed", "focus", "disabled"]:
		b.add_theme_stylebox_override(st, StyleBoxEmpty.new())
	b.pressed.connect(on_press)
	add_child(b)
	return b







func _place_touch_zones() -> void:
	if _cam == null or _vp == null or _vp.size.x <= 0:
		return
	_fit_zone(_zone_jersey,
		Vector3(JERSEY_X, JERSEY_Y, JERSEY_Z), JERSEY_H * 0.5, JERSEY_H * 0.5)


	_fit_zone(_zone_locker,
		Vector3(0.0, LOCKER_H * 0.5, 0.0), BAY_W * 0.5, LOCKER_H * 0.5)
	_coloca_zonas_mate()















var _zonas_mate: Array[Control] = []


func _coloca_zonas_mate() -> void:
	if _cam == null:
		return
	var vivas: Array[Control] = []
	for z in _zonas_mate:
		if is_instance_valid(z) and not z.is_queued_for_deletion():
			vivas.append(z)
	_zonas_mate = vivas
	while _zonas_mate.size() < _mate_spots.size():
		var nueva: Control = Control.new()
		nueva.name = "ZonaCompanero"
		nueva.mouse_filter = Control.MOUSE_FILTER_IGNORE
		CareerUi.tocable_mando(nueva)
		add_child(nueva)
		_zonas_mate.append(nueva)
	var banda: Rect2 = Rect2(Vector2.ZERO, size)
	for i in _zonas_mate.size():
		var z: Control = _zonas_mate[i]
		if i >= _mate_spots.size():
			z.visible = false
			continue
		var wx: float = float(_mate_spots[i]["x"]) + PLAYER_X
		var head: Vector2 = _cam.unproject_position(Vector3(wx, PLAYER_HEIGHT_M, PLAYER_Z))
		var feet: Vector2 = _cam.unproject_position(Vector3(wx, 0.0, PLAYER_Z))
		var half_w: float = absf(feet.y - head.y) * 0.22
		var r: Rect2 = Rect2(feet.x - half_w, head.y - 8.0,
			half_w * 2.0, feet.y - head.y + 16.0).abs()
		z.position = r.position
		z.size = r.size
		z.visible = banda.has_point(r.get_center())





func _fit_zone(b: Button, center: Vector3, half_w: float, half_h: float) -> void:
	if b == null:
		return
	var k: Vector2 = size / Vector2(_vp.size)
	var a: Vector2 = _cam.unproject_position(center
		+ Vector3(- half_w - ZONE_PAD, half_h + ZONE_PAD, 0.0)) * k
	var c: Vector2 = _cam.unproject_position(center
		+ Vector3(half_w + ZONE_PAD, - half_h - ZONE_PAD, 0.0)) * k
	b.position = Vector2(minf(a.x, c.x), minf(a.y, c.y))
	b.size =(c - a).abs()














func _on_jersey_pressed() -> void:



	GameState.player_kit_slot =(GameState.player_kit_slot + 1) \
			%(KIT_SLOTS + 1 if GameState.retro_available() else KIT_SLOTS)


	GameState.mark_kit_choice()
	UiAudio.toggle(true)
	_rebuild_world()




func _rebuild_world() -> void:




	_por_congelar.clear()
	for child in get_children():
		if child == _zone_jersey or child == _zone_locker:
			continue
		remove_child(child)
		child.queue_free()
	_crest_tex = null
	_roster.clear()
	_top_scorer_cache = ""
	_build_world()
	_fov_caja()
	_place_touch_zones()



const KIT_SLOTS: int = 3





func _make_player() -> void:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS_X
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	var cfg: Dictionary = PechoRig.con_escudo(_mine_cfg(), _room_team())
	spr.sprite_frames = _frames_for(cfg)
	spr.position = Vector3(PLAYER_X, _feet(spr.pixel_size), PLAYER_Z)
	spr.play("idle")
	_vp.add_child(spr)
	_pecho.vestir(spr, cfg, _room_team())
	me = spr
	_me_cfg = cfg





	if celebrate_captain or (show_captain and _captain_is_mine()):
		_make_captain_badge(spr)






func room_kit() -> Dictionary:
	return _my_kit()






func room_height() -> float:
	return _room_h


func mates_by_bay() -> Dictionary:
	return _mates_by_bay









func figuras() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	if me != null and is_instance_valid(me):
		out.append({"spr": me, "cfg": _me_cfg, "dir": "south", "yo": true,
			"sentado": false})
	for spot in _mate_spots + _extras:
		var s: Variant = spot.get("spr")
		if s != null and is_instance_valid(s):
			out.append({"spr": s, "cfg": spot.get("cfg", {}),
				"dir": String(spot.get("dir", "south")), "yo": false,
				"sentado": bool(spot.get("sentado", false))})
	return out

























const FACE_MARGEN: float = 0.3

func vista_hacia(pie: Vector3) -> String:
	if is_nan(face_x):
		return "south"
	if face_derecha != Vector3.ZERO and not is_nan(face_z):
		var lado: float =(pie - Vector3(face_x, 0.0, face_z)).dot(face_derecha)
		if absf(lado) <= FACE_MARGEN:
			return "south"
		return "west" if lado > 0.0 else "east"
	var d: float = pie.x - face_x
	if absf(d) > BAY_W * 0.5:
		return "east" if d > 0.0 else "west"
	return "south"







func sin_hueco(n: int) -> Array:
	return _resto.slice(0, maxi(n, 0))








func planta_extra(mate: Dictionary, pie: Vector3, dir: String = "south",
		sentado: bool = false) -> AnimatedSprite3D:
	var person: String = String(mate.get("name", ""))
	if person.is_empty() or _vp == null:
		return null
	var cfg: Dictionary = _mate_cfg(mate)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size =(PLAYER_HEIGHT_M / PLAYER_METRICS_X) * MATE_SCALE
	spr.modulate = Color(MATE_DIM, MATE_DIM, MATE_DIM)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = _sentado_frames(cfg) if sentado else null
	if frames == null:
		sentado = false
		frames = _frames_for(cfg, dir)
		spr.pixel_size *= escala_de_vista(dir)
	spr.sprite_frames = frames



	var y: float = _feet(spr.pixel_size)
	if sentado:
		y = BENCH_H + 0.045 + float(SENTADO_TRASERO - 46) * spr.pixel_size
	spr.position = Vector3(pie.x, y, pie.z)
	spr.play("idle")
	spr.frame = absi(hash(person)) % maxi(frames.get_frame_count("idle"), 1)
	_vp.add_child(spr)
	_pecho.vestir(spr, cfg, _room_team())
	_extras.append({"spr": spr, "cfg": cfg, "dir": "south" if sentado else dir,
		"sentado": sentado})
	return spr




const SENTADO_TRASERO: int = 69

func _sentado_frames(cfg: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)

	frames.set_animation_speed("idle", 4.0)
	var bases: PackedStringArray = PackedStringArray()
	var fuentes: Array = []
	for i in range(1, 5):
		var path: String = "res://assets/sprites/anim/sentado_brazos_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())
			fuentes.append(path)
	if frames.get_frame_count("idle") == 0:
		return null
	_apunta_cara(frames, cfg, fuentes)
	PechoRig.apunta(frames, bases)
	return frames












func club_tint(lum: float) -> Color:
	var l: float = _accent.get_luminance()
	if l <= 0.02:

		return _accent.lightened(lum)
	var k: float = lum / l
	return Color(clampf(_accent.r * k, 0.0, 1.0), clampf(_accent.g * k, 0.0, 1.0),
		clampf(_accent.b * k, 0.0, 1.0), 1.0)





func door_open(abierta: bool, dur: float = DOOR_SWING) -> bool:
	if _door_pivot == null or not is_instance_valid(_door_pivot):
		return false
	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(_door_pivot, "rotation_degrees:y",
		DOOR_OPEN_DEG if abierta else 0.0, dur) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if _door_light != null and is_instance_valid(_door_light):
		tw.tween_property(_door_light, "light_energy",
			_door_energy if abierta else _door_energy * DOOR_LIGHT_SHUT, dur)
	return true






func door_rattle(deg: float) -> void:
	if _door_pivot == null or not is_instance_valid(_door_pivot) \
			or absf(_door_pivot.rotation_degrees.y) > 0.5:
		return
	var tw: Tween = create_tween()
	tw.tween_property(_door_pivot, "rotation_degrees:y", deg, 0.05)
	tw.tween_property(_door_pivot, "rotation_degrees:y", 0.0, 0.09) \
			.set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)




func alto_sala() -> float:
	return _room_h






func alto_suelo() -> float:
	return 0.04 if bool(_style.get("rug", false)) else 0.022


func hay_alfombra() -> bool:
	return bool(_style.get("rug", false))




func _celebrating() -> bool:
	return celebrate or celebrate_captain








func _make_mate_player(x: float, mate: Dictionary) -> void:




	if empty_mates:
		return
	var person: String = String(mate.get("name", ""))
	if person.is_empty():
		return
	var cfg: Dictionary = _mate_cfg(mate)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()


	spr.pixel_size =(PLAYER_HEIGHT_M / PLAYER_METRICS_X) * MATE_SCALE
	spr.modulate = Color(MATE_DIM, MATE_DIM, MATE_DIM)
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD





	var dir: String = "south"
	if not is_nan(face_x) and not _celebrating():
		dir = vista_hacia(Vector3(x + PLAYER_X, 0.0, PLAYER_Z))
	spr.sprite_frames = _clap_frames(cfg) if _celebrating() else _frames_for(cfg, dir)

	if not _celebrating():
		spr.pixel_size *= escala_de_vista(dir)
	spr.position = Vector3(x + PLAYER_X, _feet(spr.pixel_size), PLAYER_Z)
	spr.play("idle")
	spr.frame = absi(hash(person)) % 4
	_vp.add_child(spr)



	_pecho.vestir(spr, cfg, _room_team())



	_mate_spots.append({"x": x, "mate": mate, "spr": spr, "cfg": cfg, "dir": dir})

	if show_captain and person == _captain_name:
		_make_captain_badge(spr)


















func _mate_cfg(mate: Dictionary) -> Dictionary:
	var cfg: Dictionary = KitRecolor.appearance_for(String(mate.get("name", "")),
		kit_de(mate))
	if es_portero(mate):
		cfg = KitRecolor.keeper_field_cfg(cfg)
	cfg = PechoRig.con_escudo(cfg, _room_team())
	cfg["number"] = int(mate.get("number", 0))
	return cfg


func es_portero(mate: Dictionary) -> bool:
	return String(mate.get("pos", "")) == "POR"











func kit_de(mate: Dictionary) -> Dictionary:
	var kit: Dictionary = _my_kit()
	if not es_portero(mate):
		return kit
	var gk: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
		String(_room_team().get("id", "")), -1, String(kit.get("pattern", "solid"))), kit)
	for k in kit:
		if String(k).begins_with("num_"):
			gk[k] = kit[k]
	return gk
















func _make_captain_badge(who: AnimatedSprite3D) -> void:
	if who == null or not is_instance_valid(who):
		return
	who.add_child(ArmbandArt.make_sprite(_my_kit(), who.position.y, MATE_SCALE))








func _gui_input(event: InputEvent) -> void:
	var pressed: bool =(event is InputEventScreenTouch and event.pressed) \
			or (event is InputEventMouseButton and event.pressed
			and event.button_index == MOUSE_BUTTON_LEFT)
	if not pressed or _cam == null:
		return
	var p: Vector2 = event.position
	for spot in _mate_spots:
		var wx: float = float(spot["x"]) + PLAYER_X
		var head: Vector2 = _cam.unproject_position(Vector3(wx, PLAYER_HEIGHT_M, PLAYER_Z))
		var feet: Vector2 = _cam.unproject_position(Vector3(wx, 0.0, PLAYER_Z))
		var half_w: float = absf(feet.y - head.y) * 0.22
		if absf(p.x - feet.x) <= half_w and p.y >= head.y - 8.0 and p.y <= feet.y + 8.0:
			_show_mate_card(spot["mate"])
			accept_event()
			return








const MATE_STAT_ICON: Dictionary = {
	"pegada": ["potencia", Color("ff6a3d")], "punteria": ["precision", Color("39c0ff")],
	"rosca": ["efecto", Color("b57bff")], "cabeza": ["balon", Color("ffd23d")],
	"penal": ["balon_rol", Color("c0a0ff")], "parado": ["corner", Color("66c6d6")],
	"reflejos": ["vision", Color("ffd23d")], "velocidad": ["velocidad", Color("4dd0e1")],
	"entrada": ["fisico", Color("ff5d8f")], "aceleracion": ["aceleracion", Color("ffa726")],
}









func _show_mate_card(mate: Dictionary) -> void:
	var host: Node = self
	while host != null and not (host is CareerPage):
		host = host.get_parent()
	var box: VBoxContainer = CareerUi.modal(host if host != null else self)
	if box == null:
		return
	var person: String = String(mate.get("name", ""))
	var pos: String = String(mate.get("pos", ""))
	var media: int = SquadMeta.ovr_of(mate, pos)


	var head: HBoxContainer = HBoxContainer.new()
	head.add_theme_constant_override("separation", 18)
	head.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(head)
	var badge: OvrBadge = OvrBadge.new()
	badge.setup(media, 26)
	badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	head.add_child(badge)
	var id_col: VBoxContainer = VBoxContainer.new()
	id_col.add_theme_constant_override("separation", 2)
	id_col.alignment = BoxContainer.ALIGNMENT_CENTER
	head.add_child(id_col)
	var t: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t.text = CareerUi.display_name(_surname(person))
	id_col.add_child(t)
	var sub: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	sub.text = "%d · %s" % [int(mate.get("number", 0)), pos]
	id_col.add_child(sub)


	if person == _captain_name:
		_card_row(box, "capitan", CareerTheme.MONEY, I18n.t("CAPITÁN"), "",
			CareerTheme.MONEY)
	if person == _rival_name:
		_card_row(box, "equipo", CareerTheme.DANGER, I18n.t("TE PELEA EL PUESTO"), "",
			CareerTheme.DANGER)

















	var soc: int = Career.socio_v(person)
	if absi(soc) >= Career.SOCIO_UMBRAL:
		CareerUi.socio_row(box, I18n.t("SOCIEDAD"), soc, Career.SOCIO_MAX)




	var sem: Dictionary = Career.socio_semilla(person)


	if bool(sem.get("idolo", false)):
		_memoria_row(box, "leyendas", CareerTheme.accent_text(), I18n.t("ES TU ÍDOLO"))
	if not String(sem.get("ex", "")).is_empty():
		_memoria_row(box, "relaciones", CareerTheme.accent_text(),
			I18n.tf("YA JUGASTEIS JUNTOS EN {0}", [_club_de_memoria(String(sem["ex"]))]))
	elif not String(sem.get("club", "")).is_empty():
		_memoria_row(box, "relaciones", CareerTheme.TEXT_DIM,
			I18n.tf("TAMBIÉN PASÓ POR {0}", [_club_de_memoria(String(sem["club"]))]))
	if not String(sem.get("rival", "")).is_empty():


		_memoria_row(box, "equipo",
			CareerTheme.DANGER if Career.socio_v(person) < 0 else CareerTheme.TEXT_DIM,
			I18n.tf("VIENE DE {0}, TU RIVAL", [_club_de_memoria(String(sem["rival"]))]))


	const STAT_NAMES: Dictionary = {
		"pegada": "Pegada", "punteria": "Puntería", "rosca": "Rosca",
		"cabeza": "Cabeza", "penal": "Penales", "parado": "Balón parado",
		"reflejos": "Reflejos", "velocidad": "Velocidad", "entrada": "Entrada",
		"aceleracion": "Aceleración"}



	var visibles: Array = Squad.stat_keys_for(pos)
	var pairs: Array = []
	for k in STAT_NAMES:
		if mate.has(k) and visibles.has(String(k)):
			pairs.append([k, int(mate[k])])
	pairs.sort_custom(func(a: Array, b: Array) -> bool: return int(a[1]) > int(b[1]))
	for i in mini(3, pairs.size()):
		var key: String = String(pairs[i][0])
		var spec: Array = MATE_STAT_ICON.get(key, ["stats", CareerTheme.accent_text()])
		_card_row(box, String(spec[0]), Color(spec[1]),
			I18n.t(String(STAT_NAMES[key])), str(int(pairs[i][1])), CareerTheme.TEXT)



	var btns: HBoxContainer = HBoxContainer.new()
	btns.add_theme_constant_override("separation", 12)
	box.add_child(btns)


	var all_b: Button = CareerUi.accion("equipo", I18n.t("VER PLANTEL"), CareerTheme.NAV_GENTE)
	all_b.custom_minimum_size = Vector2(0, 84)
	all_b.pressed.connect(func() -> void:
		CareerUi.close_modal(all_b)
		_show_squad_list())
	btns.add_child(all_b)
	var close: Button = Button.new()
	close.text = I18n.t("ENTENDIDO")
	close.custom_minimum_size = Vector2(0, 84)
	close.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(close, CareerTheme.Kind.NEUTRAL, 24)
	close.pressed.connect(func() -> void: CareerUi.close_modal(close))
	btns.add_child(close)






func _show_squad_list() -> void:
	var host: Node = self
	while host != null and not (host is CareerPage):
		host = host.get_parent()
	var box: VBoxContainer = CareerUi.modal(host if host != null else self)
	if box == null:
		return
	var t: Label = CareerUi.plain(28, CareerTheme.TEXT)
	t.text = I18n.t("PLANTEL")
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)






	var scroll: ScrollContainer = DragScroll.new()
	scroll.custom_minimum_size = Vector2(0, 880)
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED


	scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_SHOW_NEVER
	box.add_child(scroll)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 6)
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(col)
	var squad: Array = Squad.of(GameState.player_team_id).duplicate()










	var yo: Dictionary = Squad.user_slot(GameState.player_team_id).duplicate()
	yo["name"] = Career.player_name
	yo["pos"] = Squad.USER_POS
	yo["number"] = GameState.player_number


	yo["media"] = int(round(Career.skills_avg()))
	yo["is_you"] = true
	squad.append(yo)
	squad.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return SquadMeta.ovr_pintado(a, String(a.get("pos", "")), bool(a.get("is_you", false))) \
				> SquadMeta.ovr_pintado(b, String(b.get("pos", "")), bool(b.get("is_you", false))))
	for p in squad:
		_squad_list_row(col, p, bool(p.get("is_you", false)))
	var close: Button = Button.new()
	close.text = I18n.t("ENTENDIDO")
	close.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button(close, CareerTheme.Kind.NEUTRAL, 26)
	close.pressed.connect(func() -> void: CareerUi.close_modal(close))
	box.add_child(close)





func _squad_list_row(col: VBoxContainer, p: Dictionary, mine: bool) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)


	row.mouse_filter = Control.MOUSE_FILTER_STOP
	col.add_child(row)
	var pos: String = String(p.get("pos", ""))
	var badge: OvrBadge = OvrBadge.new()

	badge.setup(SquadMeta.ovr_pintado(p, pos, mine), 18)
	badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	row.add_child(badge)
	var name_l: Label = CareerUi.plain(21,
		CareerTheme.accent_text() if mine else CareerTheme.TEXT)
	var surname: String = _surname(Career.player_name if mine
		else String(p.get("name", "")))
	name_l.text = CareerUi.display_name(surname)
	name_l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	name_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(name_l)






	if not mine:
		var soc: int = Career.socio_v(String(p.get("name", "")))
		if absi(soc) >= Career.SOCIO_UMBRAL:
			row.add_child(CareerUi.stat_chip("", soc, "", false, "relaciones"))
	var meta: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
	meta.text = "%d · %s" % [int(p.get("number", 0)), pos]
	meta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(meta)
	if mine:
		return


	CareerUi.tocable_mando(row)
	row.gui_input.connect(func(ev: InputEvent) -> void:
		var hit: bool =(ev is InputEventScreenTouch and ev.pressed) \
				or (ev is InputEventMouseButton and ev.pressed
				and ev.button_index == MOUSE_BUTTON_LEFT)
		if hit:
			CareerUi.close_modal(row)
			_show_mate_card(p))





func _card_row(box: VBoxContainer, icon_key: String, icon_col: Color,
		text: String, value: String, text_col: Color) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	box.add_child(row)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(34, 34)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(icon_key, icon_col)
	row.add_child(icon)
	var l: Label = CareerUi.plain(21, text_col)
	l.text = text
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(l)
	if not value.is_empty():
		var v: Label = CareerUi.plain(21, text_col)
		v.text = value
		v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		row.add_child(v)






func _memoria_row(box: VBoxContainer, icon_key: String, col: Color, texto: String) -> void:
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	box.add_child(row)
	var icon: MenuIcon = MenuIcon.new()
	icon.custom_minimum_size = Vector2(34, 34)
	icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	icon.setup(icon_key, col)
	row.add_child(icon)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, col)
	l.text = texto
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	row.add_child(l)





func _club_de_memoria(id: String) -> String:
	return TransferBook.nombre_de_etapa({"club": id})













func _nat_week() -> bool:


	if force_club or not override_club.is_empty():
		return false
	if force_nation:
		return not Career.nationality.is_empty()
	return String(GameState.current_fixture().get("comp", "")) == "nat" \
			and not Career.nationality.is_empty()
















var _my_num_cache: int = -1

func _my_number() -> int:
	if _my_num_cache >= 0:
		return _my_num_cache




	if not override_club.is_empty():
		_my_num_cache = maxi(Career.club_number(override_club), 0)
		return _my_num_cache
	_my_num_cache = GameState.player_number
	if _nat:
		var n: int = Career.nat_number()
		if n > 0:
			_my_num_cache = n
	return _my_num_cache









func _room_team() -> Dictionary:
	if not override_club.is_empty():
		return Teams.by_id(override_club)
	return Nations.as_team(Career.nationality) if _nat \
			else Teams.by_id(GameState.player_team_id)






func _squad_club() -> String:
	return override_club if not override_club.is_empty() \
			else GameState.player_team_id





func _captain_is_mine() -> bool:
	return override_club.is_empty() and Career.is_captain_in_match(_nat)





func _my_kit() -> Dictionary:


	return GameState.kit_variant(_room_team(), GameState.player_kit_slot)



















func _room_accent() -> Color:
	return Color(_room_team().get("kit", _accent))





func _mine_cfg() -> Dictionary:
	var cfg: Dictionary = GameState.team_custom.duplicate()
	if me_bib.a > 0.0:
		cfg["bib"] = me_bib



	cfg.merge(_my_kit(), true)



	if cfg.has("tattoo_style"):
		cfg["tattoo"] = cfg["tattoo_style"]
		if cfg.has("tattoo_pattern"):
			cfg["tattoo_pat"] = cfg["tattoo_pattern"]
		if cfg.has("tattoo_color"):
			cfg["tattoo_ink"] = cfg["tattoo_color"]

	cfg["number"] = _my_number()
	return cfg









static func _apunta_cara(frames: SpriteFrames, cfg: Dictionary, fuentes: Array) -> void:
	if fuentes.is_empty() or fuentes.size() != frames.get_frame_count("idle"):
		return
	frames.set_meta("look_cfg", cfg)
	frames.set_meta("cara_fuentes", {"idle": fuentes})







static func escala_de_vista(dir: String) -> float:
	if dir == "south":
		return 1.0
	var h_sur: int = _alto_pintado("res://assets/sprites/anim/idle_south_00.png")
	var h_dir: int = _alto_pintado("res://assets/sprites/anim/idle_%s_00.png" % dir)
	if h_sur <= 0 or h_dir <= 0:
		return 1.0
	return float(h_sur) / float(h_dir)


static func _alto_pintado(path: String) -> int:
	if not ResourceLoader.exists(path):
		return 0
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return 0
	if img.is_compressed():
		img.decompress()
	return img.get_used_rect().size.y


func _feet(pixel_size: float) -> float:
	var path: String = "res://assets/sprites/anim/idle_south_00.png"
	if not ResourceLoader.exists(path):
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS_X * pixel_size * 0.5 - PLAYER_SINK
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * pixel_size - PLAYER_SINK




func _frames_for(cfg: Dictionary, dir: String = "south") -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)




	var bases: PackedStringArray = PackedStringArray()
	var fuentes: Array = []
	for i in 4:
		var path: String = "res://assets/sprites/anim/idle_%s_%02d.png" % [dir, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())
			fuentes.append(path)
	_apunta_cara(frames, cfg, fuentes)
	if frames.get_frame_count("idle") == 0:
		var quieto: String = "res://assets/sprites/players/player_south.png"
		frames.add_frame("idle", KitRecolor.apply(load(quieto), cfg))
		bases.append(quieto.get_file().get_basename())
	PechoRig.apunta(frames, bases)
	return frames








func _clap_frames(cfg: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var bases: PackedStringArray = PackedStringArray()
	var fuentes: Array = []
	for i in 4:
		var path: String = "res://assets/sprites/anim/clap_player_south_%02d.png" % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
			bases.append(path.get_file().get_basename())
			fuentes.append(path)

	if frames.get_frame_count("idle") == 0:
		return _frames_for(cfg)
	_apunta_cara(frames, cfg, fuentes)
	PechoRig.apunta(frames, bases)
	return frames


















const FLICK_PERIOD: float = 6.5
const FLICK_LEN: float = 0.55
const FLICK_DIP: float = 0.45

func _process(delta: float) -> void:





	if _pecho != null:
		_pecho.seguir()
	if _flicker == null or not is_instance_valid(_flicker):
		if _pecho == null or _pecho.vacio():
			set_process(false)
		return
	_flicker_t = fmod(_flicker_t + delta, FLICK_PERIOD)
	if _flicker_t > FLICK_LEN:
		_flicker.light_energy = _flicker_base
		return
	var t: float = _flicker_t / FLICK_LEN

	_flicker.light_energy = _flicker_base * lerpf(FLICK_DIP, 1.0, ease(t, 2.4))
