extends Ceremony

























const ROWS: int = 11
const ROW_GAP: float = 3.6
const ROW_STEP: float = 1.7
const ROW_H: float = 1.72









const MOUTH_DZ: float = 1.2

















const KEYS: Array = [
	{"t": 0.0, "dist": 15.0, "h": 2.05, "yaw": 2.0, "aim_y": 1.7, "fov": 42.0},
	{"t": 3.6, "dist": 7.0, "h": 1.42, "yaw": 10.0, "aim_y": 1.48, "fov": 34.0},
	{"t": 7.0, "dist": 11.0, "h": 2.5, "yaw": 74.0, "aim_y": 1.75, "fov": 34.0},





	{"t": 10.0, "dist": 14.0, "h": 3.4, "yaw": 128.0, "aim_y": 0.9, "fov": 42.0},
]
const DRIFT: float = -0.9

const ATT: float = 1.0
const T_OVATION: float = 2.2
const T_CARD: float = 8.0









const TROPHY_MAX: int = 12






const TROPHY_X: float = 3.0
const TROPHY_STEP: float = 1.75









const TROPHY_DZ: float = 4.0
const PLINTH_SIZE: Vector3 = Vector3(0.6, 0.62, 0.48)
const TROPHY_H: float = 0.86



const TROPHY_SINK: float = 0.1


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": true,
		"weather": String(data.get("weather", "sunset")),
		"kit": kit,
		"banner": I18n.t("GRACIAS"),
		"board": I18n.t("GRACIAS") + " " + Career.player_name,
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	_build_corridor(kit)
	_build_trophies()
	make_player(look)
	make_audio(ATT, true)
	stadium.crowd_excite(0.9)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)
	flash_rate = 22.0
	flash_burst_at = T_OVATION
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE, accent.lightened(0.3)]


	make_chyron(I18n.t("SE RETIRA"), team_name("?").to_upper(), team(), 1.2)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t(_sub_line()))
	card_count(int(data.get("seasons", 0)),
		I18n.t("TEMPORADAS EN EL OFICIO · CIFRAS EN PRIMERA"))





	var line: Dictionary = data.get("line", {})
	card_stats([
		{"v": "%.1f" % float(line.get("avg", 0.0)), "k": I18n.t("media")},
		{"v": str(int(line.get("matches", data.get("matches", 0)))), "k": I18n.t("partidos")},
		{"v": str(maxi(int(line.get("clubs", 1)), 1)), "k": I18n.t("clubes")},
		{"v": str(int(line.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(line.get("assists", 0))), "k": I18n.t("asist.")},
	])
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))





func _sub_line() -> String:
	var reason: String = String(data.get("reason", ""))
	if reason == "edad":
		return "SE ACABÓ EL TIEMPO"
	if reason == "lesion":
		return "EL CUERPO DIJO BASTA"
	return "LO DEJA CUANDO QUIERE"







func _note_line() -> String:
	if String(data.get("reason", "")) == "edad":
		return I18n.tf("{0} años. El cuerpo mandó y no hubo discusión.",
			[Career.RETIRE_AGE])
	return "Nadie te empujó a esto: te vas de pie, que es como se van los pocos."











const FACES: int = ROWS * 2


func _build_corridor(kit: Dictionary) -> void:









	var pool: Array[SpriteFrames] = squad_frames_pool(kit, FACES,
		club_del_acto(), "south", true, "", false, CLAP_SHEET)
	var frames: SpriteFrames = pool[0]
	if frames.get_frame_count("idle") == 0:
		return
	var px: float = ROW_H / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in ROWS:
		for side in [-1.0, 1.0]:
			var s: AnimatedSprite3D = AnimatedSprite3D.new()


			s.sprite_frames = pool[(i * 2 + int(side > 0.0)) % pool.size()]
			s.pixel_size = px
			s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			s.position = Vector3(side * ROW_GAP * 0.5, y,
				CENTER_Z + MOUTH_DZ + float(i) * ROW_STEP)
			viewport.add_child(s)
			s.play("idle")


			s.speed_scale = rng.randf_range(0.7, 1.45)
			if frames.get_frame_count("idle") > 1:
				s.frame = rng.randi_range(0, frames.get_frame_count("idle") - 1)









func _build_trophies() -> void:
	var cab: Dictionary = Trophies.cabinet(Career.awards)
	var pieces: Array[String] = []



	for group in [cab.get("team", []), cab.get("individual", [])]:
		for item in group:
			for _i in int((item as Dictionary).get("count", 1)):
				if pieces.size() >= TROPHY_MAX:
					break
				pieces.append(String((item as Dictionary).get("type", "liga")))
	for i in pieces.size():




		var side: float = 1.0 if i % 2 == 0 else -1.0
		var rank: int = i / 2
		_build_plinth(pieces[i], Vector3(side * TROPHY_X, 0.0,
			CENTER_Z + TROPHY_DZ + float(rank) * TROPHY_STEP))




func _build_plinth(icon_type: String, at: Vector3) -> void:
	var box: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = PLINTH_SIZE
	box.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.09, 0.1, 0.13)
	mat.roughness = 0.9
	box.material_override = mat
	box.position = at + Vector3(0.0, PLINTH_SIZE.y * 0.5, 0.0)
	viewport.add_child(box)
	var skirt: MeshInstance3D = MeshInstance3D.new()
	var sq: QuadMesh = QuadMesh.new()
	sq.size = Vector2(PLINTH_SIZE.x * 0.9, PLINTH_SIZE.y * 0.5)
	skirt.mesh = sq
	var smat: StandardMaterial3D = StandardMaterial3D.new()
	smat.albedo_color = accent
	smat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	skirt.material_override = smat


	skirt.position = at + Vector3(0.0, PLINTH_SIZE.y * 0.5,
		- PLINTH_SIZE.z * 0.5 - 0.01)
	viewport.add_child(skirt)
	make_trophy(icon_type, at + Vector3(0.0,
		PLINTH_SIZE.y + TROPHY_H * 0.5 - TROPHY_SINK, 0.0), TROPHY_H)


func _tick(_delta: float) -> void:
	if not _roared and t >= T_OVATION:
		_roar()


var _roared: bool = false


func _skipped() -> void:
	if not _roared:
		_roar()


func _roar() -> void:
	_roared = true
	set_confetti(true)
	stadium.crowd_react("home", "goal")
	stadium.pulse_ads(3.0)
	ovation(1.0)
	applause(true)
	sting("fanfare", -6.0)
