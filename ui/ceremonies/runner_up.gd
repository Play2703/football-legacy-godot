extends Ceremony


















const KEYS: Array = [
	{"t": 0.0, "dist": 8.5, "h": 2.4, "yaw": 180.0, "aim_y": 1.3, "fov": 42.0},
	{"t": 3.6, "dist": 9.0, "h": 3.2, "yaw": 171.0, "aim_y": 1.7, "fov": 44.0},
	{"t": 7.4, "dist": 10.5, "h": 4.4, "yaw": 162.0, "aim_y": 2.1, "fov": 46.0},
]
const DRIFT: float = 0.0
const ATT: float = 1.0
const YOU_X: float = -1.0
const YOU_Z: float = 3.6
const WIN_X: float = 0.6
const WIN_Z: float = -2.6
const TROPHY_H: float = 1.15
const SPR_H: float = 1.74


const FACES: int = 6
const T_CARD: float = 5.6




func _accent_for() -> Color:
	return CareerTheme.DANGER




func _mine() -> Dictionary:
	var t: Dictionary = Teams.by_id(String(data.get("away_club", vivo_de("club", GameState.player_team_id))))
	return t if not t.is_empty() else GameState.you_team()


func _build() -> void:
	var host: Dictionary = team()
	var host_kit: Dictionary = GameState.kit_variant(host, 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": true,
		"home_club": String(host.get("id", "")),
		"home_only": true,
		"weather": "night",
		"kit": host_kit,


		"banner": I18n.t("FINAL"),
		"board": I18n.t("FINAL"),
	})

	focus = Vector3(0.0, 1.0, CENTER_Z +(YOU_Z + WIN_Z) * 0.5)
	make_camera(KEYS)
	orbit_speed = DRIFT
	_build_winners(host_kit)



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(_mine(), 1), true)




	look["number"] = dorsal_vivido()
	make_player(look)
	player.position = Vector3(YOU_X, player.position.y, CENTER_Z + YOU_Z)
	player.sprite_frames = player_frames(look, "north")






	espalda_registra(player, "idle", player_prefix("north"), 0)
	player.play("idle")
	make_audio(ATT, false)



	confetti_colors = [CareerTheme.accent_of(host),
		CareerTheme.accent_of(host).lightened(0.3), Color.WHITE]
	set_confetti(true)

	make_chyron(CareerTheme.caps(I18n.t("Subcampeón")),
		CareerTheme.caps(Career.player_name), _mine(), 1.6)
	make_card(T_CARD)
	card_title(CareerTheme.caps(I18n.t("Subcampeón")), 40)
	card_sub(CareerTheme.caps(I18n.tf("Campeón: {0}", [String(host.get("name", ""))])))
	card_note(I18n.t("Tan cerca. La medalla de plata es la que enseña lo que todavía falta."))
	card_cta(I18n.t("SEGUIR"))





func _build_winners(kit: Dictionary) -> void:
	var base: Vector3 = Vector3(WIN_X, 0.0, CENTER_Z + WIN_Z)
	var trophy: Sprite3D = make_trophy(_trophy_icon(),
		base + Vector3(0.0, TROPHY_H * 0.5 + 0.02, 0.0), TROPHY_H)
	trophy.modulate = Color.WHITE
	var lamp: OmniLight3D = OmniLight3D.new()
	lamp.light_color = Color(1.0, 0.95, 0.8)
	lamp.light_energy = 2.0
	lamp.omni_range = 6.0
	lamp.position = base + Vector3(0.0, TROPHY_H + 0.9, -0.4)
	viewport.add_child(lamp)



	var pool: Array[SpriteFrames] = squad_frames_pool(kit, FACES,
		String(team().get("id", "")))
	if pool[0].get_frame_count("idle") == 0:
		return
	var px: float = SPR_H / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK

	var spots: Array = [Vector2(-1.4, 0.4), Vector2(1.3, 0.2),
		Vector2(-0.6, -1.1), Vector2(1.7, -0.9)]
	for i in spots.size():
		var sp: Vector2 = spots[i]
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[i % pool.size()]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = base + Vector3(sp.x, y, sp.y)
		viewport.add_child(s)
		s.play("idle")
		s.speed_scale = rng.randf_range(0.8, 1.4)
		if s.sprite_frames.get_frame_count("idle") > 1:
			s.frame = rng.randi_range(0, s.sprite_frames.get_frame_count("idle") - 1)





func _trophy_icon() -> String:
	match String(data.get("comp", "copa")):
		"champions", "ucl": return "champions"
		"europa", "uel": return "europa"
		"conference", "conf": return "conference"
		"cwc", "clubes", "mundialito": return "clubes"

		"liguilla": return "liga"



		"lib", "libertadores": return "libertadores"
		"sud", "sudamericana": return "sudamericana"
		"cca", "concacaf": return "concacaf"
		"ace", "oriente": return "oriente"
		"ac2", "sol": return "sol"
		"caf", "atlas": return "atlas"
		"cf2", "baobab": return "baobab"

		"ofc", "coral": return "coral"
		"intercont", "intercontinental": return "clubes"
		_: return "copa"


func _tick(_delta: float) -> void:
	pass


func _skipped() -> void:
	pass
