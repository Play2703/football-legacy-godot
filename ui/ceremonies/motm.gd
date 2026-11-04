extends Ceremony





























































const KEYS: Array = [
	{"t": 0.0, "dist": 16.0, "h": 2.1, "yaw": 118.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 3.4, "dist": 7.4, "h": 1.15, "yaw": 96.0, "aim_y": 1.45, "fov": 30.0},
]





const KEYS_SEASON: Array = [
	{"t": 0.0, "dist": 46.0, "h": 26.0, "yaw": 150.0, "aim_y": 3.0, "fov": 38.0},
	{"t": 3.0, "dist": 12.0, "h": 3.6, "yaw": 112.0, "aim_y": 1.6, "fov": 32.0},
	{"t": 6.4, "dist": 6.6, "h": 1.15, "yaw": 96.0, "aim_y": 1.45, "fov": 30.0},
	{"t": 9.0, "dist": 8.0, "h": 1.25, "yaw": 86.0, "aim_y": 1.5, "fov": 32.0},
]




















const KEYS_RECORD: Array = [
	{"t": 0.0, "dist": 30.0, "h": 0.9, "yaw": 150.0, "aim_y": 2.4, "fov": 16.0},
	{"t": 3.0, "dist": 18.0, "h": 1.1, "yaw": 122.0, "aim_y": 2.0, "fov": 24.0},
	{"t": 6.4, "dist": 10.5, "h": 1.3, "yaw": 99.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 9.0, "dist": 11.5, "h": 1.4, "yaw": 89.0, "aim_y": 1.72, "fov": 33.0},
]
const DRIFT: float = -0.8

const ATT: float = 0.0
const T_CARD: float = 2.6
const T_CARD_SEASON: float = 10.4


const T_HIT: float = 6.6







const PLAYER_DZ: float = 0.4


const PLAYER_DZ_RECORD: float = 0.75
const PLINTH_DZ: float = -0.85
const PLINTH_SIZE: Vector3 = Vector3(0.6, 0.88, 0.48)
const TROPHY_H: float = 0.5



const TROPHY_SINK: float = 0.1



const LOGO_H: float = 1.15
const LOGO_Y: float = 2.35




const FRAME_DZ: float = -0.35
const FRAME_SIZE: Vector3 = Vector3(0.1, 1.18, 0.96)





const STAND_SIZE: Vector3 = Vector3(0.3, 0.15, 1.06)
const FRAME_Y: float = STAND_SIZE.y + FRAME_SIZE.y * 0.5 - 0.02
const JERSEY_H: float = 0.86


const ELDER_DZ: float = -1.35




const RECORD_RETRO_DESDE: int = 1900

var _logo: Sprite3D
var _logo_y: float = 0.0
var _hit: bool = false




func season() -> bool:
	return String(data.get("mode", "")) in ["season", "record"]




const RECORD_UNIDAD: Dictionary = {
	"placa_partidos": "PARTIDOS", "placa_gol": "GOLES", "placa_asist": "ASISTENCIAS",
	"balon_oro": "PREMIOS AL MEJOR", "liga": "LIGAS",
}




func record() -> bool:
	return String(data.get("mode", "")) == "record"





func _accent_for() -> Color:


	if record():
		return CareerTheme.MONEY
	if not season():
		return super()
	var comp: String = String(data.get("comp", "liga"))
	if comp == "liga":
		return Teams.accent(Teams.country_of(club_del_acto()))
	return Competitions.COMP_ACCENT.get(comp, CareerTheme.MONEY)





func _act_team() -> Dictionary:
	var nat: String = String(data.get("nation", ""))
	if not nat.is_empty():
		var n: Dictionary = Nations.as_team(nat)
		if not n.is_empty():
			return n
	return team()


func _build() -> void:
	var big: bool = season()
	var kit: Dictionary = GameState.kit_variant(_act_team(), 0)
	make_stadium({
		"div": div(),
		"attendance": 1.0 if big else ATT,
		"party": big,

		"weather": _weather() if big else "day",
		"kit": kit,
		"banner": I18n.t("VAMOS"),





		"board":(I18n.t("RECORD") + " " + act_name()) if record() \
				else (Competitions.t_demarca(String(data.get("tag", ""))) if big else "MVP " + act_name()),
	})
	make_camera(KEYS_RECORD if record() else (KEYS_SEASON if big else KEYS))
	orbit_speed = DRIFT
	if record():



		_build_frame(kit)
		_build_elder()
	else:
		_build_plinth()
	var look: Dictionary = act_look(kit)







	make_player(look, "south", act_sheet(CLAP_SHEET if record() else ""))
	player.position.z = CENTER_Z +(PLAYER_DZ_RECORD if record() else PLAYER_DZ)
	if record():
		_build_record()
	elif big:
		_build_season()
	else:
		_build_month()




func _build_month() -> void:



	make_audio(0.0, false)



	make_chyron(I18n.t("JUGADOR DEL MES"), team_name("?").to_upper(),
		team(), 0.5)
	make_card(T_CARD)
	card_title(CareerTheme.caps(act_name()), 40)
	card_sub(I18n.t("MEJOR DEL MES EN TU LIGA") if mine() \
			else I18n.t("EL MEJOR DEL MES DE TU LIGA"))


	card_count(int(round(float(data.get("avg", 0.0)) * 10.0)),
		I18n.t("TU MEDIA DEL MES (×10)") if mine() else I18n.t("SU MEDIA DEL MES (×10)"))








	var anual: bool = bool(data.get("linea_anual", false))
	var filas: Array = []
	if mine():
		filas.append({"v": I18n.num(float(data.get("bar", 0.0)), 1), "k": I18n.t("el listón")})
	filas.append_array([
		{"v": str(int(data.get("goals", 0))),
			"k": I18n.t("goles año") if anual else I18n.t("goles")},
		{"v": str(int(data.get("assists", 0))),
			"k": I18n.t("asist. año") if anual else I18n.t("asist.")},
		{"v": str(int(data.get("matches", 3))), "k": I18n.t("partidos")},
	])
	card_stats(filas)




	_tu_media()
	card_reward(int(data.get("pts", 0)), int(data.get("pts_xp", 0)))
	card_note(I18n.tf("{0} partidos por encima de todos. El mes siguiente empieza de cero.",
		[maxi(int(data.get("matches", 3)), 1)]) if mine() \
				else I18n.t("Este mes fue suyo. El siguiente empieza de cero para los dos."))
	card_cta(I18n.t("SEGUIR"))




func _build_season() -> void:


	make_audio(1.0, false)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 12.0
	flash_burst_at = T_HIT
	flash_burst_dur = 2.0
	flash_burst_mult = 7.0
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE]


	make_chyron(Competitions.t_demarca(String(data.get("tag", "MEJOR DEL AÑO"))),
		CareerTheme.caps(act_name()), {}, T_HIT, String(data.get("logo", "liga_es")))
	make_card(T_CARD_SEASON)
	card_title(CareerTheme.caps(act_name()), 42)
	card_sub(Competitions.t_demarca(String(data.get("tag", "MEJOR DEL AÑO"))))
	card_count(int(round(float(data.get("avg", 0.0)) * 10.0)),
		I18n.t("TU MEDIA DE LA TEMPORADA (×10)") if mine() \
				else I18n.t("SU MEDIA DE LA TEMPORADA (×10)"))



	var filas: Array = [
		{"v": str(int(data.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(data.get("assists", 0))), "k": I18n.t("asist.")},
		{"v": str(int(data.get("matches", 0))), "k": I18n.t("partidos")},
	]
	card_stats(filas)



	_tu_media()
	card_reward(int(data.get("pts", 0)), int(data.get("pts_xp", 0)))



	card_note(I18n.t(String(data.get("line", "El mejor del año en tu competición."))) if mine() \
			else I18n.t("El mejor del año de tu competición, y este año no fue para ti."))
	card_cta(I18n.t("SEGUIR"))






func _tu_media() -> void:
	var tuya: float = float(data.get("bar", 0.0))
	if mine() or tuya <= 0.0:
		return
	var l: Label = card_sub(I18n.tf("TÚ: {0} DE MEDIA", [I18n.num(tuya, 1)]), CareerTheme.TEXT, 24)
	l.clip_text = true







func _build_frame(kit: Dictionary) -> void:



	var stand: MeshInstance3D = MeshInstance3D.new()
	var smesh: BoxMesh = BoxMesh.new()
	smesh.size = STAND_SIZE
	stand.mesh = smesh
	var stmat: StandardMaterial3D = StandardMaterial3D.new()
	stmat.albedo_color = Color(0.1, 0.11, 0.14)
	stmat.roughness = 0.9
	stand.material_override = stmat
	stand.position = Vector3(0.0, STAND_SIZE.y * 0.5, CENTER_Z + FRAME_DZ)
	viewport.add_child(stand)
	var board: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = FRAME_SIZE
	board.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.17, 0.13, 0.1)
	mat.roughness = 0.95
	board.material_override = mat
	board.position = Vector3(0.0, FRAME_Y, CENTER_Z + FRAME_DZ)
	viewport.add_child(board)


	var rim: MeshInstance3D = MeshInstance3D.new()
	var rq: QuadMesh = QuadMesh.new()
	rq.size = Vector2(FRAME_SIZE.z * 0.94, FRAME_SIZE.y * 0.94)
	rim.mesh = rq
	var rmat: StandardMaterial3D = StandardMaterial3D.new()
	rmat.albedo_color = CareerTheme.MONEY
	rmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rim.material_override = rmat
	rim.rotation_degrees.y = 90.0
	rim.position = Vector3(FRAME_SIZE.x * 0.5 + 0.01, FRAME_Y, CENTER_Z + FRAME_DZ)
	viewport.add_child(rim)

	var mount: MeshInstance3D = MeshInstance3D.new()
	var mq: QuadMesh = QuadMesh.new()
	mq.size = Vector2(FRAME_SIZE.z * 0.8, FRAME_SIZE.y * 0.82)
	mount.mesh = mq
	var mmat: StandardMaterial3D = StandardMaterial3D.new()
	mmat.albedo_color = Color(0.93, 0.91, 0.86)
	mmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mount.material_override = mmat
	mount.rotation_degrees.y = 90.0
	mount.position = Vector3(FRAME_SIZE.x * 0.5 + 0.02, FRAME_Y, CENTER_Z + FRAME_DZ)
	viewport.add_child(mount)





	var kit_r: Dictionary = kit.duplicate()
	kit_r["apellido"] = I18n.t(RECORD_UNIDAD.get(String(data.get("icon", "")),
		"PARTIDOS"))
	var shirt: Sprite3D = make_jersey(kit_r, int(data.get("mark", 0)), JERSEY_H,
		FRAME_Y)
	shirt.position = Vector3(FRAME_SIZE.x * 0.5 + 0.04, FRAME_Y,
		CENTER_Z + FRAME_DZ)

	shirt.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	shirt.rotation_degrees.y = 90.0






	make_trophy(String(data.get("icon", "placa_partidos")),
		Vector3(STAND_SIZE.x * 0.5 + 0.03, STAND_SIZE.y * 0.5,
			CENTER_Z + FRAME_DZ + 0.34), 0.3)





func _build_elder() -> void:



	var look: Dictionary = {
		"hair": Color(0.88, 0.88, 0.9),
		"hair_style": "entradas",
		"facial_hair": "full",
	}
	var elder: AnimatedSprite3D = AnimatedSprite3D.new()
	elder.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	elder.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	elder.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	elder.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD





	var cara: String = Legends.cara_de_real(String(data.get("persona", "")))
	if not cara.is_empty():
		look = KitRecolor.traits_for(cara)
	elder.sprite_frames = player_frames(look, "south", ELDER_SHEET, true)
	elder.position = Vector3(0.0, feet_offset(elder.pixel_size) - PLAYER_SINK,
		CENTER_Z + ELDER_DZ)
	elder.play("idle")
	viewport.add_child(elder)









	var holder: String = String(data.get("holder", "")).strip_edges()
	var retro: bool = int(data.get("year", 0)) >= RECORD_RETRO_DESDE
	if retro and holder != "" and holder != "?" and holder != Career.player_name:
		PlacaNombre.cuelga(elder, Competitions.demarca(holder), true)










const ELDER_SHEET: String = "res://assets/sprites/anim/gala_south_"




func _build_record() -> void:
	make_audio(1.0, false)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 12.0
	flash_burst_at = T_HIT
	flash_burst_dur = 2.0
	flash_burst_mult = 7.0
	confetti_colors = [CareerTheme.MONEY, Color.WHITE, accent]


	make_chyron(I18n.t("RÉCORD"), CareerTheme.caps(Career.player_name), _act_team(), T_HIT)
	make_card(T_CARD_SEASON)
	card_title(CareerTheme.caps(Career.player_name), 42)
	card_sub(Competitions.t_demarca(String(data.get("label", "RÉCORD"))).to_upper())
	card_count(int(data.get("mark", 0)), I18n.t(String(data.get("scope", ""))).to_upper())


	card_stats([
		{"v": String(data.get("holder", "?")), "k": I18n.t("lo tenía")},
		{"v": str(int(data.get("prev", 0))), "k": I18n.t("su marca")},
		{"v": str(int(data.get("year", 0))), "k": I18n.t("desde")},
	])
	card_note(I18n.t("Tu nombre entra en los libros. Ese registro ya es tuyo."))
	card_cta(I18n.t("SEGUIR"))





func _plinth_icon() -> String:
	if record():
		return String(data.get("icon", "partido"))
	return "mvp" if season() else "mes"




func _weather() -> String:
	return "sunset" if String(data.get("comp", "liga")) == "liga" else "night"







func _build_plinth() -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = PLINTH_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.1, 0.11, 0.14)
	mat.roughness = 0.9
	box.material_override = mat
	box.position = Vector3(0.0, PLINTH_SIZE.y * 0.5, CENTER_Z + PLINTH_DZ)
	viewport.add_child(box)


	var skirt: MeshInstance3D = MeshInstance3D.new()
	var sq: QuadMesh = QuadMesh.new()

	sq.size = Vector2(PLINTH_SIZE.z * 0.9, PLINTH_SIZE.y * 0.55)
	skirt.mesh = sq
	var smat: StandardMaterial3D = StandardMaterial3D.new()
	smat.albedo_color = accent
	smat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	skirt.material_override = smat


	skirt.rotation_degrees.y = 90.0
	skirt.position = Vector3(PLINTH_SIZE.x * 0.5 + 0.01, PLINTH_SIZE.y * 0.55,
		CENTER_Z + PLINTH_DZ)
	viewport.add_child(skirt)
	make_trophy(_plinth_icon(),
		Vector3(0.0, PLINTH_SIZE.y + TROPHY_H * 0.5 - TROPHY_SINK,
			CENTER_Z + PLINTH_DZ), TROPHY_H)



	if not season() or record():
		return



	make_comp_logo(String(data.get("logo", "liga_es")),
		CareerTheme.on_accent(),
		Vector3(PLINTH_SIZE.x * 0.5 + 0.03, PLINTH_SIZE.y * 0.55,
			CENTER_Z + PLINTH_DZ), PLINTH_SIZE.y * 0.42)


	_logo = make_comp_logo(String(data.get("logo", "liga_es")), text_accent(),
		Vector3(0.0, LOGO_Y, CENTER_Z + PLINTH_DZ), LOGO_H)
	_logo_y = LOGO_Y
	_logo.modulate = Color(1, 1, 1, 0.0)




func _tick(_delta: float) -> void:
	if not season():
		return
	if not _hit and t >= T_HIT:
		_strike()
	if _logo != null:
		_logo.position.y = _logo_y + sin(t * 0.9) * 0.05


func _skipped() -> void:
	if season() and not _hit:
		_strike()





func _strike() -> void:
	_hit = true
	set_confetti(true)
	sting("fanfare", -3.0)
	ovation(0.0)
	applause(true)
	screen_flash(0.18)
	shake(0.09, 0.34)
	punch_fov(3.0, 0.32)
	if _logo == null:
		return


	var tw: Tween = create_tween()
	tw.set_parallel(true)
	tw.tween_property(_logo, "modulate", Color.WHITE, 0.1)
	tw.tween_property(_logo, "scale", Vector3.ONE * 1.18, 0.1) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var back: Tween = create_tween()
	back.tween_interval(0.12)
	back.tween_property(_logo, "scale", Vector3.ONE, 0.3) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
