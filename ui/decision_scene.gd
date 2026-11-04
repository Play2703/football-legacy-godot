extends Ceremony



































const SETS_FOCUS_PRENSA: Vector3 = Vector3(-25.0, 0.0, 34.0)
const MIC_Y: float = 0.92
const MIC_DZ: float = 0.42
const MIC_DX: float = -0.15
const PLAYER_DX: float = 0.2


const TV_SHOW: String = "EL LARGUERO"


const CROWD_KIT: Dictionary = {
	"kit": Color("3b414c"), "kit2": Color("6d7480"), "pattern": "solid",
}



const KEYS_PRENSA: Array = [
	{"t": 0.0, "dist": 6.4, "h": 1.9, "yaw": 180.0, "aim_y": 1.05, "fov": 34.0},
	{"t": 2.4, "dist": 5.2, "h": 1.8, "yaw": 176.0, "aim_y": 1.05, "fov": 31.0},
]




const KEYS_CAMPO: Array = [
	{"t": 0.0, "dist": 7.6, "h": 1.95, "yaw": 8.0, "aim_y": 1.0, "fov": 38.0},
	{"t": 3.0, "dist": 6.2, "h": 1.8, "yaw": 22.0, "aim_y": 1.0, "fov": 35.0},
]



const KEYS_BANQUILLO: Array = [
	{"t": 0.0, "dist": 8.6, "h": 2.3, "yaw": 42.0, "aim_y": 1.05, "fov": 38.0},
	{"t": 3.0, "dist": 6.8, "h": 2.05, "yaw": 52.0, "aim_y": 1.05, "fov": 36.0},
]


const KEYS_ENFERMERIA: Array = [
	{"t": 0.0, "dist": 6.0, "h": 2.1, "yaw": 128.0, "aim_y": 1.05, "fov": 38.0},
	{"t": 3.4, "dist": 5.4, "h": 1.95, "yaw": 122.0, "aim_y": 1.05, "fov": 38.0},
]


const KEYS_NOCHE: Array = [
	{"t": 0.0, "dist": 11.0, "h": 2.4, "yaw": 200.0, "aim_y": 1.0, "fov": 40.0},
	{"t": 3.6, "dist": 8.5, "h": 2.1, "yaw": 214.0, "aim_y": 1.0, "fov": 38.0},
]




const KEYS_CASA: Array = [
	{"t": 0.0, "dist": 5.6, "h": 1.95, "yaw": 128.0, "aim_y": 1.0, "fov": 42.0},
	{"t": 3.2, "dist": 5.0, "h": 1.85, "yaw": 134.0, "aim_y": 1.0, "fov": 40.0},
]
const KEYS_CALLE: Array = [
	{"t": 0.0, "dist": 7.6, "h": 2.15, "yaw": 180.0, "aim_y": 1.05, "fov": 42.0},
	{"t": 3.4, "dist": 6.6, "h": 1.95, "yaw": 172.0, "aim_y": 1.05, "fov": 40.0},
]
const KEYS_PLATO: Array = [
	{"t": 0.0, "dist": 6.2, "h": 2.05, "yaw": 180.0, "aim_y": 1.05, "fov": 40.0},
	{"t": 3.2, "dist": 5.6, "h": 1.95, "yaw": 186.0, "aim_y": 1.05, "fov": 38.0},
]





const KEYS_RESTAURANTE: Array = [
	{"t": 0.0, "dist": 5.8, "h": 2.05, "yaw": 132.0, "aim_y": 1.05, "fov": 42.0},
	{"t": 3.4, "dist": 6.2, "h": 2.1, "yaw": 138.0, "aim_y": 1.05, "fov": 44.0},
]
const KEYS_BAR: Array = [
	{"t": 0.0, "dist": 5.8, "h": 2.05, "yaw": 138.0, "aim_y": 1.05, "fov": 42.0},
	{"t": 3.4, "dist": 6.2, "h": 2.1, "yaw": 144.0, "aim_y": 1.05, "fov": 44.0},
]




const KEYS_GALERIA: Array = [
	{"t": 0.0, "dist": 6.0, "h": 2.05, "yaw": 150.0, "aim_y": 1.05, "fov": 42.0},
	{"t": 3.4, "dist": 6.4, "h": 2.1, "yaw": 156.0, "aim_y": 1.05, "fov": 44.0},
]




const KEYS_DESPACHO: Array = [
	{"t": 0.0, "dist": 6.2, "h": 2.05, "yaw": 174.0, "aim_y": 1.1, "fov": 42.0},
	{"t": 3.4, "dist": 5.8, "h": 1.98, "yaw": 179.0, "aim_y": 1.1, "fov": 40.0},
]


const DESPACHO_JEFE: Vector2 = Vector2(4.05, 0.45)
const DESPACHO_JEFE_ALTO: float = 1.78





const KEYS_ASAMBLEA: Array = [
	{"t": 0.0, "dist": 6.6, "h": 2.45, "yaw": 176.0, "aim_y": 1.85, "fov": 44.0},
	{"t": 3.4, "dist": 6.1, "h": 2.35, "yaw": 181.0, "aim_y": 1.85, "fov": 42.0},
]


const ASAM_FILAS: Array[float] = [1.7, 2.5, 3.3]
const ASAM_CARAS: int = 6


const ASAM_TARJETA_CADA: int = 2
const C_TARJETA: Color = Color("ece8de")






const KEYS_DORSAL: Array = [
	{"t": 0.0, "dist": 3.7, "h": 1.55, "yaw": 180.0, "aim_y": 1.24, "fov": 33.0},
	{"t": 3.2, "dist": 3.45, "h": 1.5, "yaw": 176.0, "aim_y": 1.22, "fov": 31.0},
]








































const KEYS_FICHAJE: Array = [
	{"t": 0.0, "dist": 7.4, "h": 1.68, "yaw": 180.0, "aim_y": 1.24, "fov": 39.0},
	{"t": 2.2, "dist": 6.2, "h": 1.63, "yaw": 180.0, "aim_y": 1.24, "fov": 35.0},
	{"t": 5.0, "dist": 5.7, "h": 1.58, "yaw": 179.0, "aim_y": 1.3, "fov": 33.0},
	{"t": 7.2, "dist": 5.6, "h": 1.56, "yaw": 178.0, "aim_y": 1.32, "fov": 32.0},
]





const FICH_ANDAR: float = 2.0






const FICH_SALUDO: float = FICH_ANDAR * FICH_ANDAR_CORTE








const FICH_CLAP_FIN: float = 4.0
const FICH_PANEL: float = 4.8









const FICH_PASO_X: float = 1.35

const FICH_ANDAR_CORTE: float = 0.9







const FICH_PLANTA: float = FICH_ANDAR * FICH_ANDAR_CORTE













const FICH_HUECO: float = 0.46














const FICH_PLAYERA_Y: float = 0.92






const FICH_ESPERA_DX: float = 0.1
const FICH_ESPERA_Y: float = 0.84






































const FICH_GALA_WALK: String = "res://assets/sprites/anim/gala_walk_east_"
const FICH_GALA_WALK_N: int = 6
const FICH_GALA_WALK_FPS: float = 8.0
const FICH_GALA_CLAP: String = "res://assets/sprites/anim/gala_clap_south_"


const FICH_GALA_CLAP_N: int = 4
const FICH_GALA_CLAP_FPS: float = 7.0



















const FICH_DT_OFRECE: String = "res://assets/sprites/anim/coach_sostiene_south_"
const FICH_DT_DESDE: int = 0
const FICH_DT_HASTA: int = 4
const FICH_DT_FPS: float = 5.0




const FICH_DT_TELA_DX: float = -0.03
const FICH_DT_TELA_Y: float = 0.8










const FICH_PLAYERA_H: float = 0.84


const FICH_DT_ALTO: float = 1.7














const FICH_PRENSA_DIV: Dictionary = {1: 26, 2: 12, 3: 0}
const FICH_FLASH_ENTRAS: Dictionary = {1: 14.0, 2: 6.5, 3: 0.0}
const FICH_FLASH_POSAS: Dictionary = {1: 26.0, 2: 11.0, 3: 0.0}














const ROOM_SPOT: Dictionary = {
	DecisionRoom.CASA: Vector2(0.0, 0.72),
	DecisionRoom.CALLE: Vector2(0.0, 0.0),
	DecisionRoom.PLATO: Vector2(0.2, -0.65),




	DecisionRoom.RESTAURANTE: Vector2(0.3, 1.05),
	DecisionRoom.BAR: Vector2(0.3, 1.05),
	DecisionRoom.GALERIA: Vector2(0.3, 1.05),


	DecisionRoom.DESPACHO: Vector2(0.5, -0.85),


	DecisionRoom.ASAMBLEA: Vector2(0.6, 0.75),
}













const PAREJA_SPOT: Dictionary = {
	DecisionRoom.RESTAURANTE: Vector2(1.0, -0.75),
	DecisionRoom.BAR: Vector2(1.0, -0.75),
	DecisionRoom.GALERIA: Vector2(1.0, -0.75),







	DecisionRoom.CASA: Vector2(0.3, -0.75),
}
















const SOCIO_SPOT: Dictionary = {
	DecisionRoom.RESTAURANTE: Vector2(1.0, -0.75),


	DecisionRoom.CASA: Vector2(0.3, -0.75),
}




const SOCIO_CASUAL: Array[String] = [DecisionRoom.CASA, DecisionRoom.RESTAURANTE]




const PAREJA_GALA: Array[String] = [DecisionRoom.GALERIA]




const PREMIO_KICKER: Dictionary = {
	"premio_titulo": "CAMPEÓN",
	"premio_ascenso": "ASCENSO",
	"premio_balon": "LA GALA",
	"premio_mvp": "LA GALA",
}






const PANEL_MAX: float = 0.5

var set_key: String = ""
var room: RehabRoom
var deco: DecisionRoom
var _locker: LockerRoom
var _panel: DecisionPanel
var _scroll: ScrollContainer
var plate_ref: PanelContainer


var _dorsal_jersey: Sprite3D
var _dorsal_kit: Dictionary = {}



var _dorsal_lam: Sprite3D




var _fich: bool = false
var _fich_dueno: AnimatedSprite3D
var _fich_look: Dictionary = {}
var _fich_x_jug: float = 0.0
var _fich_x_due: float = 0.0
var _fich_fase: int = 0
var _fich_saltar: Control





func _accent_for() -> Color:
	if String(data.get("set", "")) == DecisionSets.ENFERMERIA:
		return CareerTheme.DANGER
	return super()






func _consume() -> Dictionary:
	var ev: Dictionary = Career.current_decision()
	var src: String = "post"
	if ev.is_empty():



		ev = Career.week_event_scene()
		src = "week"
	if ev.is_empty():
		return {}
	var id: String = String(ev.get("id", Career.pending_decision))
	return {
		"kind": "decision", "src": src, "id": id, "ev": ev,
		"set": DecisionSets.set_of(id, ev),
	}




func _build_skip() -> void:
	pass





func _is_dorsal() -> bool:
	var id: String = String(data.get("id", Career.pending_decision))
	return id == Career.SHIRT_EVENT_ID or id == "dorsal"


func _build() -> void:



	set_key = String(data.get("set", DecisionSets.CAMPO))
	if _is_dorsal():



		if _es_presentacion():
			_build_fichaje()
			make_chyron(I18n.t(_kicker()),
				team_name("?").to_upper(), team(), 0.35)
			return
		_build_dorsal()
		make_chyron(I18n.t(_kicker()), team_name("?").to_upper(), team(), 0.35)
		_build_panel()
		return
	match set_key:
		DecisionSets.PRENSA:
			_build_prensa()
		DecisionSets.BANQUILLO:
			_build_banquillo()
		DecisionSets.ENFERMERIA:
			_build_enfermeria()
		DecisionSets.NOCHE:
			_build_noche()
		DecisionSets.VESTUARIO:
			_build_vestidor()
		DecisionSets.CASA:
			_build_room(DecisionRoom.CASA, KEYS_CASA)
		DecisionSets.CALLE:
			_build_room(DecisionRoom.CALLE, KEYS_CALLE, true)
		DecisionSets.PLATO:
			_build_room(DecisionRoom.PLATO, KEYS_PLATO)
		DecisionSets.RESTAURANTE:
			_build_room(DecisionRoom.RESTAURANTE, KEYS_RESTAURANTE)
		DecisionSets.BAR:
			_build_room(DecisionRoom.BAR, KEYS_BAR)
		DecisionSets.GALERIA:
			_build_room(DecisionRoom.GALERIA, KEYS_GALERIA)
		DecisionSets.DESPACHO:
			_build_room(DecisionRoom.DESPACHO, KEYS_DESPACHO)
			_stand_jefe_despacho()
		DecisionSets.ASAMBLEA:
			_build_room(DecisionRoom.ASAMBLEA, KEYS_ASAMBLEA)
			_stand_asamblea()
		_:
			_build_campo()
	make_chyron(I18n.t(_kicker()), team_name("?").to_upper(), team(), 0.35)
	_build_panel()





func _is_nat_scene() -> bool:
	return bool((data.get("ev", {}) as Dictionary).get("nat", false))








func team() -> Dictionary:
	if _is_nat_scene():
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	return super()




func _kicker() -> String:
	if String(data.get("src", "post")) == "week":
		return "ESTA SEMANA"


	if _is_nat_scene():
		return "FECHA DE SELECCIONES"
	if Career.pending_decision == Career.MARKET_EVENT_ID \
			or Career.pending_decision == Career.DUAL_MARKET_EVENT_ID:
		return "ANTES DEL MERCADO"




	if Career.pending_decision == Career.SHIRT_EVENT_ID:
		match Career._shirt_mode:
			Career.SHIRT_MODE_SIGN, Career.SHIRT_MODE_BOMB:
				return "TU FICHAJE"
			Career.SHIRT_MODE_RENEW:
				return "TU RENOVACIÓN"

			Career.SHIRT_MODE_NIVEL:
				return "TU PETICIÓN"
			_:
				return "PRETEMPORADA"



	if Career.pending_decision == "castigo_objetivo":
		return "FINAL DE TEMPORADA"



	if PREMIO_KICKER.has(Career.pending_decision):
		return String(PREMIO_KICKER[Career.pending_decision])


	if Career.pending_decision == Career.ASAMBLEA_EVENT_ID \
			or Career.pending_decision == Career.FIN_SOCIOS_EVENT_ID:
		return "ASAMBLEA DE SOCIOS"

	if DecisionSets.set_of(Career.pending_decision) == DecisionSets.DESPACHO:
		return "EN EL DESPACHO"
	return "DESPUÉS DEL PARTIDO"







func _build_prensa() -> void:
	make_stadium({"attendance": 0.3, "weather": "night",
		"kit": GameState.kit_variant(team(), 0)})
	focus = SETS_FOCUS_PRENSA
	make_camera(KEYS_PRENSA)
	orbit_speed = -0.25
	make_press_board(focus)
	_stand_player()
	player.position.x = focus.x + PLAYER_DX
	make_mic(Vector3(focus.x + PLAYER_DX + MIC_DX, MIC_Y, focus.z + MIC_DZ))
	make_audio(0.3, false)
	flash_pool = press_flash_pool(focus)
	flash_radius = 9.0
	flash_rate = 6.0




func _build_campo() -> void:
	make_stadium({"attendance": 0.72, "weather": "sunset",
		"kit": GameState.kit_variant(team(), 0)})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS_CAMPO)
	orbit_speed = -1.1
	_stand_player()
	make_audio(0.72, true)













func _build_banquillo() -> void:
	make_stadium({"attendance": 0.45, "weather": "day",
		"kit": GameState.kit_variant(team(), 0)})
	focus = stadium.dugout_focus(true)
	focus.y = 0.0
	make_camera(KEYS_BANQUILLO)
	orbit_speed = -0.6
	stadium.hold_coaches(600.0, true)
	make_audio(0.45, false)





func _build_enfermeria() -> void:
	focus = Vector3.ZERO
	room = RehabRoom.new()
	room.div = div()
	room.club_color = CareerTheme.accent_of(team())
	room.crest = crest_texture(team())
	viewport.add_child(room)
	make_camera(KEYS_ENFERMERIA)
	orbit_speed = 0.0
	_stand_player()





	_stand_socio_junto_a_ti(ENFERMERIA_SOCIO_DX)



















func _build_vestidor() -> void:
	_locker = LockerRoom.new()









	var names_v: Array =(data.get("ev", {}) as Dictionary).get("names", [])
	if names_v.has("socio") and not Career._socio_escena.is_empty():
		_locker.focus_name = Career._socio_escena
	_locker.set_anchors_preset(Control.PRESET_FULL_RECT)
	_locker.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_locker)



	_fit_locker(size.y *(1.0 - PANEL_MAX))

















func _fit_locker(free: float) -> void:
	if _locker == null:
		return
	_locker.offset_top = 0.0
	_locker.offset_bottom = -(size.y - free)
	_locker.match_width_fov(size.x / maxf(free, 1.0))








func _build_room(room_kind: String, keys: Array, crowd: bool = false) -> void:
	focus = Vector3.ZERO
	deco = DecisionRoom.new()
	deco.kind = room_kind
	deco.div = div()
	deco.club_color = CareerTheme.accent_of(team())
	deco.crest = crest_texture(team())


	if room_kind == DecisionRoom.PLATO:
		deco.sign_text = TV_SHOW

	elif room_kind == DecisionRoom.ASAMBLEA:
		deco.sign_text = "%d%%" % _asamblea_pct()
	viewport.add_child(deco)
	make_camera(keys)
	orbit_speed = -0.35
	_stand_player()
	var spot: Vector2 = ROOM_SPOT.get(room_kind, Vector2.ZERO)
	if spot != Vector2.ZERO:
		var at: Vector3 = deco.cone(spot.x, spot.y)
		player.position.x = at.x
		player.position.z = at.z
	_stand_pareja(room_kind)
	_stand_socio(room_kind)
	if crowd:
		_build_crowd()

	if crowd:
		make_audio(0.25, false)









func _stand_jefe_despacho() -> void:
	var id: String = String(team().get("id", ""))
	var cara: Dictionary = Coach.look_de("administrador_%s" % id)
	if String(data.get("id", Career.pending_decision)) == Career.ACCIONES_EVENT_ID:
		var fila: Variant = Career.club_projects.get(id, null)
		var desde: int = int((fila as Array)[1]) if fila is Array else GameState.season_num
		cara = Coach.look_de("dueno_%s_%d" % [id, desde])
	var at: Vector3 = deco.cone(DESPACHO_JEFE.x, DESPACHO_JEFE.y)
	coach_sprite(Vector3(at.x, 0.0, at.z), DESPACHO_JEFE_ALTO, cara)
	paseo_ms = 0.0





func _asamblea_pct() -> int:
	if String(data.get("id", Career.pending_decision)) == Career.FIN_SOCIOS_EVENT_ID:
		return Career.fin_socios_sondeo()
	var id: String = str(Career.asamblea.get("club", String(team().get("id", ""))))
	var temporada: int = int(Career.asamblea.get("temporada", GameState.season_num))
	return Concurso.votos_a_favor(id, temporada, WorldAging.world_seed())













func _stand_asamblea() -> void:
	var id: String = String(team().get("id", ""))
	for i in DecisionRoom.ASAM_JUNTA_R.size():
		var at: Vector3 = deco.cone(DecisionRoom.ASAM_JUNTA_F, DecisionRoom.ASAM_JUNTA_R[i])
		var cara: Dictionary = Coach.look_de("asamblea_%s_%d" % [id, i])
		var spr: AnimatedSprite3D = coach_sprite(Vector3(at.x, 0.0, at.z), 1.76, cara)
		if spr != null:
			spr.position.y += DecisionRoom.ASAM_TARIMA_H
	paseo_ms = 0.0
	var pool: Array[SpriteFrames] = []
	for i in ASAM_CARAS:
		var cfg: Dictionary = {}
		var rasgos: Dictionary = KitRecolor.traits_for("socio_asamblea_%s_%d" % [id, i])
		for k in rasgos:
			if k != "boots":
				cfg[k] = rasgos[k]
		cfg["casual_shirt"] = KitRecolor.CASUAL_SHIRTS[(i * 2 + 1) % KitRecolor.CASUAL_SHIRTS.size()]
		cfg["casual_pants"] = KitRecolor.CASUAL_PANTS[i % KitRecolor.CASUAL_PANTS.size()]
		pool.append(player_frames(KitRecolor.casual_of(cfg), "north"))
	var tu: Vector2 = ROOM_SPOT[DecisionRoom.ASAMBLEA]
	var n: int = 0
	for fila in ASAM_FILAS.size():
		var f: float = ASAM_FILAS[fila]


		var r: float = -6.2 +(0.45 if fila % 2 == 1 else 0.0)
		while r < 6.2:
			var jr: float = r + rng.randf_range(-0.12, 0.12)
			r += 0.92
			if absf(jr - tu.y) < 0.7 and f < 2.6:
				continue
			var spr: AnimatedSprite3D = AnimatedSprite3D.new()
			spr.sprite_frames = pool[n % pool.size()]
			spr.pixel_size = rng.randf_range(1.62, 1.8) / PLAYER_METRICS.x
			spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			var p: Vector3 = deco.cone(f + rng.randf_range(-0.15, 0.15), jr)
			p.y = feet_offset(spr.pixel_size) - PLAYER_SINK
			spr.position = p
			spr.play("idle")

			spr.frame = n % maxi(spr.sprite_frames.get_frame_count("idle"), 1)
			viewport.add_child(spr)
			if n % ASAM_TARJETA_CADA == 0:
				_asam_tarjeta(p, n % 4 < 2)
			n += 1




func _asam_tarjeta(pie: Vector3, derecha: bool) -> void:
	var lado: Vector3 = deco.cone(0.0, 0.22 if derecha else -0.22)
	var base: Vector3 = Vector3(pie.x, 0.0, pie.z) + lado
	var palo: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.012
	cm.bottom_radius = 0.012
	cm.height = 0.42
	palo.mesh = cm
	var pm: StandardMaterial3D = StandardMaterial3D.new()
	pm.albedo_color = Color("6b5236")
	palo.material_override = pm
	palo.position = base + Vector3(0.0, 1.78, 0.0)
	viewport.add_child(palo)
	var carton: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(0.26, 0.18, 0.01)
	carton.mesh = bm
	var mm: StandardMaterial3D = StandardMaterial3D.new()
	mm.albedo_color = C_TARJETA
	carton.material_override = mm
	carton.position = base + Vector3(0.0, 2.06, 0.0)
	carton.rotation_degrees.y = deco.face()
	viewport.add_child(carton)






func _build_dorsal() -> void:
	focus = Vector3.ZERO
	var lroom: Node3D = Node3D.new()
	viewport.add_child(lroom)
	LockerDecor.build(lroom, div(), team(), CareerTheme.accent_of(team()), false)
	make_camera(KEYS_DORSAL)
	orbit_speed = -0.2
	_stand_player()
	_dorsal_kit = GameState.kit_variant(team(), 0)


	_dorsal_kit["apellido"] = Career.nombre_espalda()
	_dorsal_jersey = make_jersey(_dorsal_kit, GameState.player_number, 0.92, 0.7)


	for c in _dorsal_jersey.get_children():
		if c is Sprite3D:
			_dorsal_lam = c
			break




	_dorsal_jersey.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	if _dorsal_lam != null:
		_dorsal_lam.billboard = BaseMaterial3D.BILLBOARD_DISABLED




func _preview_dorsal(n: int) -> void:
	if _dorsal_jersey == null or not is_instance_valid(_dorsal_jersey):
		return
	var num: int = n if n > 0 else GameState.player_number





	if _dorsal_lam != null and is_instance_valid(_dorsal_lam):
		var limpia: ImageTexture = JerseyArt.texture(_dorsal_kit, 0)
		_dorsal_jersey.texture = limpia
		var pecho: Rect2 = Rect2(JerseyArt.BODY_X0, JerseyArt.BODY_Y0 + 5,
			JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1, 9)
		var rec: Dictionary = Espalda.receta_para(_dorsal_kit, SceneFade.imagen(limpia),
			pecho)
		var lam: ImageTexture = Espalda.textura(
			String(_dorsal_kit.get("apellido", "")), num, rec)
		if lam != null:
			_dorsal_lam.texture = lam
		return
	_dorsal_jersey.texture = JerseyArt.texture(_dorsal_kit, num)





















func _es_presentacion() -> bool:
	if String(data.get("id", Career.pending_decision)) != Career.SHIRT_EVENT_ID:
		return false
	return Career._shirt_mode == Career.SHIRT_MODE_SIGN


















func _build_fichaje() -> void:
	_fich = true
	focus = Vector3.ZERO



	deco = DecisionRoom.new()
	deco.kind = DecisionRoom.TROFEOS
	deco.div = div()
	deco.club_color = CareerTheme.accent_of(team())
	deco.crest = crest_texture(team())
	viewport.add_child(deco)
	make_camera(KEYS_FICHAJE)



	orbit_speed = -0.12
	_fich_llena_vitrinas()



	_fich_monta_jugador()
	var yo: Vector3 = _marca(- FICH_HUECO)
	player.position.x = yo.x - FICH_PASO_X
	player.position.z = yo.z







	var suyo: Vector3 = _marca(FICH_HUECO)




	var look_dueno: Dictionary = Coach.look_de(
		"directivo|" + String(team().get("id", "")))
	_fich_dueno = coach_sprite(suyo, FICH_DT_ALTO, look_dueno)
	_fich_dt_hojas(look_dueno)

	_fich_crea_playera()


	paseo_ms = 0.0



	if _fich_dueno.sprite_frames.has_animation("espera"):
		_fich_dueno.play("espera")


	flash_pool = _fich_flash_pool()
	flash_radius = 22.0
	flash_rate = float(FICH_FLASH_ENTRAS.get(_fich_div(), 14.0))


	if not _fich_hay_prensa():
		flash_burst_at = -1.0
	flash_burst_at = FICH_SALUDO
	flash_burst_dur = 1.6
	flash_burst_mult = 3.5
	_fich_monta_saltar()












func _fich_flash_pool() -> Array[Vector3]:
	var out: Array[Vector3] = []
	for i in int(FICH_PRENSA_DIV.get(_fich_div(), 26)):
		var lado: float = 1.0 if rng.randf() < 0.5 else -1.0
		out.append(Vector3(
			focus.x + lado * rng.randf_range(0.25, 1.1),
			rng.randf_range(1.0, 1.6),
			focus.z + rng.randf_range(1.3, 2.6)))
	return out





func _fich_div() -> int:





	var d: int = int(team().get("div", 0))
	return clampi(d if d > 0 else div(), 1, 3)



func _fich_hay_prensa() -> bool:
	return int(FICH_PRENSA_DIV.get(_fich_div(), 26)) > 0




func _fich_gala() -> bool:
	return _fich_div() <= 1





func _fich_monta_jugador() -> void:
	if _fich_gala():
		_fich_look = GameState.team_custom.duplicate()
		make_player(_fich_look, "south", SUIT_SHEET, true)
		player.position.y = feet_offset(player.pixel_size,
			SUIT_SHEET + "00.png") - PLAYER_SINK
		_fich_gala_hojas()
		return













	_fich_look = _casual_look()
	make_player(_fich_look)
	add_walk(player, _fich_look)






func _marca(r: float) -> Vector3:
	if deco == null or not is_instance_valid(deco):
		return Vector3(focus.x + r, 0.0, focus.z)
	return deco.cone(0.0, r)











func _fich_llena_vitrinas() -> void:
	if deco == null or deco.nichos.is_empty():
		return
	var pal: Dictionary = Palmares.of(String(team().get("id", "")))






	var copas: Array[String] = []
	for kind in ["champions", "libertadores", "concacaf", "clubes", "liga", "copa"]:
		for _i in int(pal.get(kind, 0)):
			if copas.size() >= deco.nichos.size():
				break
			copas.append(String(kind))
	if copas.is_empty():
		_fich_escudo_en_nicho()
		return


	var desde: int = int((deco.nichos.size() - copas.size()) / 2)
	for i in copas.size():


		make_trophy(copas[i], deco.nichos[desde + i], 0.6, 224, null, true)



func _fich_escudo_en_nicho() -> void:
	var tex: Texture2D = crest_texture(team())
	if tex == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = 0.6 / float(maxi(tex.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	var sitio: Vector3 = deco.nichos[int(deco.nichos.size() / 2)]


	spr.position = Vector3(sitio.x, sitio.y + 0.34, sitio.z)
	viewport.add_child(spr)





func _tick(_delta: float) -> void:
	if not _fich:
		return
	_fich_anda()
	_fich_golpes()








func _fich_anda() -> void:
	if not is_instance_valid(player):
		return
	var k: float = clampf(t / FICH_ANDAR, 0.0, 1.0)
	var s: float = smoothstep(0.0, 1.0, k)
	player.position.x = _marca(- FICH_HUECO).x - FICH_PASO_X *(1.0 - s)





	if k >= FICH_ANDAR_CORTE:
		return



	var anda: String = "walk" if player.sprite_frames.has_animation("walk") \
			else "walk_east"
	if player.animation != anda and player.sprite_frames.has_animation(anda):
		player.play(anda)





func _fich_golpes() -> void:
	if _fich_fase < 1 and t >= FICH_PLANTA:
		_fich_fase = 1
		_fich_planta()
	if _fich_fase < 2 and t >= FICH_CLAP_FIN:
		_fich_fase = 2
		_fich_para_de_aplaudir()
	if _fich_fase < 3 and t >= FICH_PANEL:
		_fich_fase = 3
		_fich_abre_panel()









func _fich_planta() -> void:
	if not is_instance_valid(player):
		return

	var aplaude: bool = player.sprite_frames.has_animation("clap")
	player.play("clap" if aplaude else "idle")
	if aplaude and _fich_hay_prensa():
		applause(true)


	if _fich_hay_prensa():
		screen_flash(0.09)



	flash_rate = float(FICH_FLASH_POSAS.get(_fich_div(), 26.0))




func _fich_para_de_aplaudir() -> void:
	if is_instance_valid(player):
		player.play("idle")
	applause(false)





























func _fich_crea_playera() -> void:
	_dorsal_kit = GameState.kit_variant(team(), 0)
	_dorsal_kit["apellido"] = Career.nombre_espalda()
	_dorsal_jersey = make_jersey(_dorsal_kit, GameState.player_number,
		FICH_PLAYERA_H, FICH_DT_TELA_Y)


	for c in _dorsal_jersey.get_children():
		if c is Sprite3D:
			_dorsal_lam = c
			break




	_dorsal_jersey.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	if _dorsal_lam != null:
		_dorsal_lam.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	_fich_playera()






func _fich_playera() -> void:
	if _dorsal_jersey == null or not is_instance_valid(_dorsal_jersey):
		return
	var tela: Vector3 = _marca(FICH_HUECO + FICH_DT_TELA_DX)
	_dorsal_jersey.position = Vector3(tela.x, FICH_DT_TELA_Y, tela.z)




func _fich_abre_panel() -> void:
	if _fich_saltar != null and is_instance_valid(_fich_saltar):
		_fich_saltar.queue_free()
		_fich_saltar = null
	flash_rate = float(FICH_FLASH_POSAS.get(_fich_div(), 26.0))
	if _fich_hay_prensa():
		flash_burst_at = t
		flash_burst_dur = 2.2
		flash_burst_mult = 2.6
		screen_flash(0.09)
	_build_panel()




















func _fich_dt_hojas(look: Dictionary = {}) -> void:
	if not is_instance_valid(_fich_dueno) or _fich_dueno.sprite_frames == null:
		return
	var frames: SpriteFrames = _fich_dueno.sprite_frames
	var texs: Array[Texture2D] = []
	for i in range(FICH_DT_DESDE, FICH_DT_HASTA):
		var path: String = "%s%02d.png" % [FICH_DT_OFRECE, i]
		if ResourceLoader.exists(path):
			texs.append(KitRecolor.apply(load(path), look))
	if texs.is_empty():
		return



	frames.add_animation("espera")
	frames.set_animation_loop("espera", false)
	frames.add_frame("espera", texs[texs.size() - 1])
	frames.add_animation("ofrece")
	frames.set_animation_loop("ofrece", false)
	frames.set_animation_speed("ofrece", FICH_DT_FPS)
	for tex in texs:
		frames.add_frame("ofrece", tex)














func _fich_gala_hojas() -> void:
	if not is_instance_valid(player) or player.sprite_frames == null:
		return
	var cfg: Dictionary = player_cfg(_fich_look, true).duplicate()
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	var frames: SpriteFrames = player.sprite_frames
	_fich_hoja_gala(frames, cfg, "walk", FICH_GALA_WALK, 0,
		FICH_GALA_WALK_N, FICH_GALA_WALK_FPS)


	_fich_hoja_gala(frames, cfg, "clap", FICH_GALA_CLAP, 1,
		FICH_GALA_CLAP_N, FICH_GALA_CLAP_FPS, true)





func _fich_hoja_gala(frames: SpriteFrames, cfg: Dictionary, anim: String,
		hoja: String, desde: int, hasta: int, fps: float,
		clavar: bool = false, bucle: bool = true) -> void:
	if frames.has_animation(anim):
		return
	frames.add_animation(anim)
	frames.set_animation_loop(anim, bucle)
	frames.set_animation_speed(anim, fps)
	var suelo: int = _fich_fila_pies(frames.get_frame_texture("idle", 0))
	for i in range(desde, hasta):
		var path: String = "%s%02d.png" % [hoja, i]
		if not ResourceLoader.exists(path):
			continue
		var tex: Texture2D = KitRecolor.apply(load(path), cfg)
		if clavar:
			tex = _fich_al_suelo(tex, suelo)
		frames.add_frame(anim, tex)
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)














func _fich_al_suelo(tex: Texture2D, suelo: int) -> Texture2D:
	if tex == null or suelo < 0:
		return tex
	var img: Image = SceneFade.imagen(tex)
	if img == null:
		return tex
	var fila: int = _fich_fila_pies(tex)
	var dy: int = suelo - fila
	if fila < 0 or dy == 0:
		return tex
	var out: Image = Image.create(img.get_width(), img.get_height(), false,
		img.get_format())
	out.fill(Color.TRANSPARENT)
	var alto: int = img.get_height() - absi(dy)
	if alto <= 0:
		return tex
	out.blit_rect(img, Rect2i(0, maxi(- dy, 0), img.get_width(), alto),
		Vector2i(0, maxi(dy, 0)))
	return ImageTexture.create_from_image(out)



func _fich_fila_pies(tex: Texture2D) -> int:
	var img: Image = SceneFade.imagen(tex)
	if img == null:
		return -1
	for y in range(img.get_height() - 1, -1, -1):
		for x in img.get_width():
			if img.get_pixel(x, y).a > 0.03:
				return y
	return -1












func _fich_monta_saltar() -> void:
	_fich_saltar = Control.new()
	_fich_saltar.set_anchors_preset(Control.PRESET_FULL_RECT)
	_fich_saltar.mouse_filter = Control.MOUSE_FILTER_STOP
	_fich_saltar.gui_input.connect(_fich_toque)
	add_child(_fich_saltar)





func _fich_toque(ev: InputEvent) -> void:
	var toque: bool = ev is InputEventScreenTouch and (ev as InputEventScreenTouch).pressed
	var clic: bool = ev is InputEventMouseButton and (ev as InputEventMouseButton).pressed
	if toque or clic:
		_fich_al_final()







func _unhandled_input(event: InputEvent) -> void:
	if not (event is InputEventJoypadButton) or not event.pressed:
		return
	if _fich_saltar == null or not is_instance_valid(_fich_saltar):
		return
	if event.is_action("fl_avanza") or event.is_action("fl_toque"):
		get_viewport().set_input_as_handled()
		_fich_al_final()


func _fich_al_final() -> void:
	if _fich_fase >= 4:
		return
	t = FICH_PANEL
	_fich_anda()
	_fich_golpes()





func _fich_resuelve(n: int) -> String:
	var out: String = String(Career.resolve_shirt_choice(n))
	_preview_dorsal(n)
	if not _fich_hay_prensa():
		return out
	flash_burst_at = t
	flash_burst_dur = 2.6
	flash_burst_mult = 9.0
	screen_flash(0.13)
	shake(0.015, 0.25)
	return out






func _build_crowd() -> void:
	var pool: Array = extras_frames_pool(CROWD_KIT, 6, "calle")
	for i in pool.size():
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.sprite_frames = pool[i]
		spr.pixel_size = 1.72 / PLAYER_METRICS.x
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var r: float = -3.2 + float(i) * 1.28 + rng.randf_range(-0.2, 0.2)
		var p: Vector3 = deco.cone(3.3 + rng.randf_range(-0.3, 0.4), r)
		p.y = feet_offset(spr.pixel_size) - PLAYER_SINK
		spr.position = p
		spr.play("idle")
		viewport.add_child(spr)






func _build_noche() -> void:
	make_stadium({"attendance": 0.0, "weather": "night",
		"kit": GameState.kit_variant(team(), 0)})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS_NOCHE)
	orbit_speed = -1.6
	_stand_player()

	make_audio(0.05, false)










const SUIT_SHEET: String = "res://assets/sprites/anim/gala_south_"














func _stand_player() -> void:
	match DecisionSets.wear_of(data.get("ev", {}), set_key):
		DecisionSets.WEAR_SUIT:
			make_player(GameState.team_custom.duplicate(), "south", SUIT_SHEET, true)




			player.position.y = feet_offset(player.pixel_size,
				SUIT_SHEET + "00.png") - PLAYER_SINK
		DecisionSets.WEAR_CASUAL:
			make_player(_casual_look())
		_:
			var look: Dictionary = GameState.team_custom.duplicate()
			for k in KitRecolor.TEAM_KEYS:
				look.erase(k)
			look.merge(GameState.kit_variant(team(), 0), true)
			make_player(look)




























func _de_gala(room_kind: String) -> bool:
	if PAREJA_GALA.has(room_kind):
		return true
	return bool((data.get("ev", {}) as Dictionary).get("gala", false))








const ENFERMERIA_SOCIO_DX: float = 1.0





func _stand_socio_junto_a_ti(dx: float) -> void:
	var names: Array =(data.get("ev", {}) as Dictionary).get("names", [])
	if not names.has("socio"):
		return
	var person: String = Career._socio_escena
	if person.is_empty() or player == null:
		return
	var cfg: Dictionary = _kit_look().duplicate()
	var rasgos: Dictionary = KitRecolor.traits_for(person)
	for k in rasgos:
		cfg[k] = rasgos[k]
	var el: AnimatedSprite3D = AnimatedSprite3D.new()
	el.pixel_size = player.pixel_size
	el.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	el.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	el.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	el.sprite_frames = player_frames(cfg, "south")






	var derecha: Vector3 = Vector3.RIGHT
	if cam != null:
		derecha = cam.global_transform.basis.x
		derecha.y = 0.0
		derecha = derecha.normalized() if derecha.length() > 0.01 else Vector3.RIGHT
	el.position = player.position + derecha * dx
	el.play("idle")
	viewport.add_child(el)
















func _stand_socio(room_kind: String) -> void:
	var spot: Vector2 = SOCIO_SPOT.get(room_kind, Vector2.ZERO)
	if spot == Vector2.ZERO:
		return
	var names: Array =(data.get("ev", {}) as Dictionary).get("names", [])
	if not names.has("socio"):
		return
	var person: String = Career._socio_escena
	if person.is_empty():
		return








	var cfg: Dictionary =(KitRecolor.casual_of(GameState.team_custom) \
			if SOCIO_CASUAL.has(room_kind) else _kit_look()).duplicate()
	var rasgos: Dictionary = KitRecolor.traits_for(person)
	for k in rasgos:




		if k == "boots" and SOCIO_CASUAL.has(room_kind):
			continue
		cfg[k] = rasgos[k]
	var el: AnimatedSprite3D = AnimatedSprite3D.new()
	el.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	el.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	el.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	el.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	el.sprite_frames = player_frames(cfg, "south")
	var at: Vector3 = deco.cone(spot.x, spot.y)
	el.position = Vector3(at.x, feet_offset(el.pixel_size) - PLAYER_SINK, at.z)
	el.play("idle")
	viewport.add_child(el)




func _kit_look() -> Dictionary:
	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(GameState.kit_variant(team(), 0), true)
	return look


func _stand_pareja(room_kind: String) -> void:
	var spot: Vector2 = PAREJA_SPOT.get(room_kind, Vector2.ZERO)
	if spot == Vector2.ZERO:
		return






	var names: Array =(data.get("ev", {}) as Dictionary).get("names", [])
	if not (names.has("pareja") or names.has("candidata")):
		return


	var ficha: Dictionary = Career.pareja_ficha() if Career.pareja_activa() \
			else Career.pareja_candidata_ficha()
	if ficha.is_empty():
		return
	var hoja: String = Pareja.ANIM_DIR \
			+ Pareja.hoja_de(ficha, _de_gala(room_kind)) + "south_"
	var ella: AnimatedSprite3D = AnimatedSprite3D.new()
	ella.pixel_size = PAREJA_PIXEL
	ella.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ella.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ella.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



	ella.sprite_frames = player_frames(
		Pareja.retrato_cfg(ficha), "south", hoja, true)
	var at: Vector3 = deco.cone(spot.x, spot.y)




	ella.position = Vector3(at.x,
		feet_offset(ella.pixel_size, hoja + "00.png") - PLAYER_SINK, at.z)
	ella.play("idle")
	viewport.add_child(ella)












func _casual_look() -> Dictionary:
	return KitRecolor.casual_of(GameState.team_custom)













func _build_panel() -> void:
	var plate: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate_tinted(accent)
	sb.bg_color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
		CareerTheme.BG_DEEP.b, 0.97)
	plate.add_theme_stylebox_override("panel", sb)
	plate.anchor_left = 0.0
	plate.anchor_right = 1.0
	plate.anchor_top = 1.0
	plate.anchor_bottom = 1.0
	plate.grow_horizontal = Control.GROW_DIRECTION_BOTH
	plate.grow_vertical = Control.GROW_DIRECTION_BEGIN
	add_child(plate)
	var margin: MarginContainer = MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 26)
	margin.add_theme_constant_override("margin_right", 26)
	margin.add_theme_constant_override("margin_top", 18)
	margin.add_theme_constant_override("margin_bottom", 18)
	CareerUi.apply_safe_area(margin, get_viewport())
	plate_ref = plate
	if UiKit.es_horizontal():
		_panel_horizontal(plate)
	plate.add_child(margin)
	_scroll = DragScroll.new()
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	if UiKit.es_horizontal():
		_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL


		_scroll.plegable = false
	margin.add_child(_scroll)
	_panel = DecisionPanel.new()
	_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	_panel.show_title = false


	if _is_dorsal():


		_panel.show_rels = false


		_panel.number_resolver = _fich_resuelve if _fich \
				else Career.resolve_shirt_choice
		_panel.number_focused.connect(_preview_dorsal)




	if String(data.get("src", "post")) == "week":
		_panel.postpone_label = "LO PIENSO"
		_panel.postponed.connect(_pospone)
	_panel.finished.connect(_leave)
	_scroll.add_child(_panel)
	_panel.setup(data["ev"], _resolve_choice, _blocked_reason())




	_panel.minimum_size_changed.connect(_fit_panel)
	_fit_panel()







	ficha_puesta = true




func _fit_panel() -> void:
	if _scroll == null or not is_instance_valid(_panel):
		return
	if UiKit.es_horizontal():

		return
	await get_tree().process_frame
	if _scroll == null or not is_instance_valid(_panel):
		return
	var want: float = _panel.get_combined_minimum_size().y
	_scroll.custom_minimum_size.y = minf(want, size.y * PANEL_MAX)



	await get_tree().process_frame
	if viewport_box == null or not is_instance_valid(plate_ref):
		return
	viewport_box.anchor_bottom = 1.0
	viewport_box.offset_bottom = - plate_ref.size.y


	_fit_locker(size.y - plate_ref.size.y)





func _panel_horizontal(plate: PanelContainer) -> void:
	var vp: Viewport = get_viewport()
	var lado: float = UiKit.side_safe_inset(vp)
	var ancho: float = clampf(size.x * DECISION_COLUMNA_K,
		DECISION_COLUMNA_MIN, DECISION_COLUMNA_MAX)
	if String(data.get("id", "")) == Career.SHIRT_EVENT_ID:
		ancho = clampf(size.x * 0.5, 1040.0, 1160.0)
	plate.anchor_left = 1.0
	plate.anchor_right = 1.0
	plate.anchor_top = 0.0
	plate.anchor_bottom = 1.0
	plate.offset_right = -(lado + 24.0)
	plate.offset_left = plate.offset_right - ancho
	plate.offset_top = 24.0 + UiKit.top_safe_inset(vp)
	plate.offset_bottom = -(24.0 + UiKit.bottom_safe_inset(vp))

	_columna_cede = - plate.offset_left
	_foto_ajusta_ancho()






	var corre: float = plate.offset_left - 24.0
	if viewport_box != null:
		viewport_box.anchor_bottom = 1.0
		viewport_box.offset_bottom = 0.0
		viewport_box.offset_right = 0.0
		viewport_box.offset_left = corre
	if _locker != null:
		_locker.offset_top = 0.0
		_locker.offset_bottom = 0.0
		_locker.offset_right = 0.0
		_locker.offset_left = corre


		_locker.match_width_fov(maxf(1.0, size.x + corre) / maxf(size.y, 1.0))



func _pospone() -> void:
	Career.pospone_week_event()
	_leave()



func _resolve_choice(key: String) -> String:
	if String(data.get("src", "post")) == "week":

		return Career.resolve_week_event(key == "a")
	return Career.resolve_decision(key)





func _blocked_reason() -> Callable:
	if String(data.get("src", "post")) != "week":
		return Callable()
	return func(key: String) -> String:
		if key != "a" or Career.can_accept_event():
			return ""


		if Career.week_event == Career.COMUNICADO_ID:
			return "NADA QUE ARREGLAR"
		var fx: Dictionary =(data["ev"]["a"] as Dictionary)["fx"]
		if bool(fx.get("action", false)) and not Career.has_action():
			return "SIN TIEMPO ESTA SEMANA"
		return "NO TE ALCANZA"
