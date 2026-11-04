extends Ceremony
















































const LEGEND_PASS: GDScript = preload("res://features/career/legend_pass.gd")






















const KEYS: Array = [
	{"t": 0.0, "dist": 26.0, "h": 1.3, "yaw": 138.0, "aim_y": 2.3, "fov": 18.0},
	{"t": 2.8, "dist": 16.0, "h": 1.35, "yaw": 116.0, "aim_y": 2.0, "fov": 24.0},
	{"t": 6.0, "dist": 9.5, "h": 1.42, "yaw": 99.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 8.8, "dist": 10.5, "h": 1.45, "yaw": 89.0, "aim_y": 1.72, "fov": 33.0},
]
const DRIFT: float = -0.8

const ATT: float = 0.88
const T_CHYRON: float = 3.0
const T_CARD: float = 6.4


const T_FLASH: float = 6.2




const PLAYER_DZ: float = 0.72
const LEGEND_DZ: float = -0.73





const SUIT_SHEET: String = "res://assets/sprites/anim/gala_south_"




func _accent_for() -> Color:
	return CareerTheme.MONEY


func kind_of() -> String:
	return String(data.get("kind_of", LEGEND_PASS.TROPHIES))


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"weather": "sunset",
		"kit": kit,
		"banner": I18n.t("VAMOS"),


		"board": String(data.get("legend", "")).to_upper(),
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	make_audio(ATT, false)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 10.0
	flash_burst_at = T_FLASH
	flash_burst_dur = 1.8
	flash_burst_mult = 6.0

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look, "south", CLAP_SHEET)
	player.position.z = CENTER_Z + PLAYER_DZ
	_build_legend()
	_build_chyron_card()







func _build_legend() -> void:
	var who: AnimatedSprite3D = AnimatedSprite3D.new()
	who.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	who.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	who.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	who.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	who.sprite_frames = _legend_frames()
	who.position = Vector3(0.0, feet_offset(who.pixel_size) - PLAYER_SINK,
		CENTER_Z + LEGEND_DZ)
	who.play("idle")
	viewport.add_child(who)




func _cara() -> String:
	var cara: String = String(data.get("cara", ""))
	return cara if not cara.is_empty() else String(data.get("legend", ""))







func _legend_frames() -> SpriteFrames:
	var club: String = String(data.get("club_leyenda", ""))
	if club.is_empty() or Teams.by_id(club).is_empty():


		return player_frames(KitRecolor.traits_for(_cara()), "south", SUIT_SHEET, true)
	var cfg: Dictionary = person_look(
		{"name": _cara(), "number": int(data.get("dorsal_leyenda", 0))},
		GameState.kit_variant(Teams.by_id(club), 0))
	cfg["club"] = club
	return player_frames(cfg, "south")


func _build_chyron_card() -> void:
	var goals: bool = kind_of() == LEGEND_PASS.GOALS
	var legend: String = String(data.get("legend", ""))
	var mine: int = int(data.get("mine", 0))
	var theirs: int = int(data.get("theirs", 0))
	var left: int = int(data.get("left", 0))

	make_chyron(I18n.t("SUPERAS A UNA LEYENDA"), legend.to_upper(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(legend.to_upper(), 40)
	card_sub(I18n.t("SUPERADO EN GOLES + ASISTENCIAS") if goals
		else I18n.t("SUPERADO EN TÍTULOS"))




	card_count(mine, I18n.t("TUS GOLES + ASISTENCIAS DE ÉLITE") if goals
		else I18n.t("TUS TÍTULOS (1ª Y SELECCIÓN)"))


	card_stats([
		{"v": str(theirs), "k": I18n.t("su marca")},
		{"v": str(mine), "k": I18n.t("la tuya")},
		{"v": str(left), "k": I18n.t("por delante")},
	])

	card_note(I18n.t(String(data.get("line", ""))))
	card_cta(I18n.t("SEGUIR"))
