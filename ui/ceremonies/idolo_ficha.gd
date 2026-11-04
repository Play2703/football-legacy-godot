extends Ceremony


























const KEYS: Array = [

	{"t": 0.0, "dist": 6.4, "h": 1.84, "yaw": 180.0, "aim_y": 1.26, "fov": 52.0,
		"focus_x": -0.55, "focus_z": 1.15},
	{"t": 1.8, "dist": 6.4, "h": 1.84, "yaw": 180.0, "aim_y": 1.26, "fov": 52.0,
		"focus_x": -0.55, "focus_z": 1.15},

	{"t": 3.6, "dist": 6.4, "h": 1.84, "yaw": 180.0, "aim_y": 1.26, "fov": 52.0,
		"focus_x": 2.05, "focus_z": 1.15},

	{"t": 5.4, "dist": 3.7, "h": 1.72, "yaw": 182.0, "aim_y": 1.28, "fov": 40.0,
		"focus_x": MATE_X + 0.22, "focus_z": 0.8},
	{"t": 6.8, "dist": 3.7, "h": 1.72, "yaw": 182.0, "aim_y": 1.28, "fov": 40.0,
		"focus_x": MATE_X + 0.22, "focus_z": 0.8},

	{"t": 8.2, "dist": 4.6, "h": 1.82, "yaw": 181.0, "aim_y": 1.32, "fov": 47.0,
		"focus_x": -0.53, "focus_z": 0.95},
]



const DRIFT: float = 0.36
const T_CHYRON: float = 0.8


const T_APLAUSO: float = 1.2

const T_CARD: float = 8.6



const MATE_BAY: int = 2
const MATE_X: float = -1.4





const CLAP_VISTA: String = "south"

var room: LockerRoom
var _aplausos: Array[AnimatedSprite3D] = []
var _aplaudiendo: bool = false



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:

	focus = Vector3(-0.3, 0.0, 0.2)
	assert (is_equal_approx(MATE_X,
		float(MATE_BAY - LockerRoom.BAY_N / 2) * LockerRoom.BAY_W),
		"MATE_X ya no cae en el hueco MATE_BAY del vestidor")
	room = LockerRoom.new()
	room.host_viewport = viewport


	room.force_club = true
	var club: String = club_del_acto()
	if not club.is_empty() and club != GameState.player_team_id:
		room.override_club = club


	room.focus_name = _cara()
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 46.0)
	orbit_speed = DRIFT
	make_locker_audio(true, -30.0)
	make_audio(0.0, false)
	_prepara_aplauso()
	_rotulos()



func _cara() -> String:
	return String(data.get("cara", ""))


func _anios() -> int:
	return maxi(int(data.get("anios", 0)), 1)




func frase() -> String:
	return I18n.t(String(IdoloEscenas.FICHA_FRASES.get(String(data.get("rama", "")),
		IdoloEscenas.FICHA_FRASES["el"])))



func _llegas_tu() -> bool:
	return String(data.get("rama", "")) == "tu"


func _rotulos() -> void:
	var t_club: Dictionary = team()
	var nombre: String = CareerTheme.caps(String(data.get("nombre", "?")))
	make_chyron(I18n.t("FICHA CONTIGO"), nombre, t_club, T_CHYRON)
	make_card(T_CARD)


	card_title(nombre, 40)
	var sub: Label = card_sub(I18n.t("JUGARÁS CON ÉL"), CareerTheme.MONEY)
	sub.clip_text = true


	var pos: String = String(data.get("pos", "MC"))
	if int(data.get("ovr", 0)) > 0:
		card_box.add_child(CareerUi.ovr_poss_row({"name": _cara(), "pos": pos, "poss": [pos]},
			int(data["ovr"]), 26))
	var stats: Array = [{"v": str(_anios()), "k": I18n.t("años después")}]
	if int(data.get("number", 0)) > 0:
		stats.append({"v": str(int(data["number"])), "k": I18n.t("su dorsal")})
	card_stats(stats)
	card_note(I18n.tf("Hace {0} años dijiste su nombre delante de todos.", [str(_anios())])
		if _anios() > 1 else I18n.t("Hace un año dijiste su nombre delante de todos."))
	card_note(frase())
	card_cta(I18n.t("SEGUIR"))







func _prepara_aplauso() -> void:
	for f: Dictionary in room.figuras():
		var spr: AnimatedSprite3D = f.get("spr") as AnimatedSprite3D
		if spr == null or bool(f.get("sentado", false)):
			continue

		var yo: bool = bool(f.get("yo", false))
		if yo and _llegas_tu():
			continue
		if not yo and _es_el(spr):
			continue
		if not add_gesto(spr, "clap", 4, 9.0, f.get("cfg", {})):
			continue
		if _gesto_arma(spr, "clap", CLAP_VISTA):
			_aplausos.append(spr)



func _rompe_aplauso() -> void:
	_aplaudiendo = true
	applause(true)
	var k: float = escala_aplauso()
	var pie_r: float = _pie(REPOSO_ARTE)
	var pie_a: float = _pie(CLAP_ARTE)
	for i in _aplausos.size():
		var spr: AnimatedSprite3D = _aplausos[i]

		var ps0: float = spr.pixel_size
		spr.pixel_size = ps0 * k
		spr.position.y += pie_a * spr.pixel_size - pie_r * ps0
		_palmas(spr)
		spr.frame = i % 3










const REPOSO_ARTE: String = "res://assets/sprites/anim/idle_south_00.png"
const CLAP_ARTE: String = "res://assets/sprites/anim/clap_player_south_01.png"


static func escala_aplauso() -> float:
	var r: Rect2i = _pintado(REPOSO_ARTE)
	var a: Rect2i = _pintado(CLAP_ARTE)
	if r.size.y <= 0 or a.size.y <= 0:
		return 1.0
	return float(r.size.y) / float(a.size.y)



static func _pintado(path: String) -> Rect2i:
	if not ResourceLoader.exists(path):
		return Rect2i()
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return Rect2i()
	if img.is_compressed():
		img.decompress()
	return img.get_used_rect()




static func _pie(path: String) -> float:
	var r: Rect2i = _pintado(path)
	if r.size.y <= 0:
		return 0.0
	return 92.0 * 0.5 - float(92 - r.end.y)




func _es_el(spr: AnimatedSprite3D) -> bool:
	if _llegas_tu():
		return false
	return absf(spr.position.x -(MATE_X + LockerRoom.PLAYER_X)) < LockerRoom.BAY_W * 0.5






func _palmas(spr: AnimatedSprite3D) -> void:
	var anim: String = "clap_" + CLAP_VISTA
	if not spr.sprite_frames.has_animation(anim):
		return
	spr.play(anim)
	if spr.sprite_frames.has_meta("pecho_bases_%s" % anim):
		return
	var bases: PackedStringArray = PackedStringArray()
	for i in range(1, spr.sprite_frames.get_frame_count(anim) + 1):
		bases.append("clap_player_%s_%02d" % [CLAP_VISTA, i])
	PechoRig.apunta(spr.sprite_frames, bases, anim)


func _tick(_delta: float) -> void:
	if not _aplaudiendo and t >= T_APLAUSO:
		_rompe_aplauso()
	if _aplaudiendo:
		for spr in _aplausos:
			if is_instance_valid(spr) and not spr.is_playing():
				_palmas(spr)
	if orbit_speed != 0.0 and t >= T_CARD:
		orbit_speed = 0.0



func aplauden() -> Array[AnimatedSprite3D]:
	return _aplausos
