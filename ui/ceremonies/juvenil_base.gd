extends Ceremony









const PS_ADULTO: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
const KID_H: float = 1.32




func chaval_cfg(club_id: String) -> Dictionary:
	var club: Dictionary = Teams.by_id(club_id)
	if club.is_empty():
		club = team()
	var cfg: Dictionary = person_look({"name": String(data.get("name", "")),
		"number": int(data.get("number", 0))}, GameState.kit_variant(club, 0))
	cfg["club"] = String(club.get("id", club_id))
	return cfg




func persona(frames: SpriteFrames, at: Vector3, px: float = PS_ADULTO) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = px
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(at.x, feet_offset(px) - PLAYER_SINK, at.z)
	viewport.add_child(spr)
	if frames != null and frames.has_animation("idle"):
		spr.play("idle")
	return spr






func yo_en(at: Vector3, sheet: String = "") -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)




	look["number"] = GameState.shirt_number_now()
	if sheet.is_empty():
		make_player(look, "south")
	else:
		make_player(look, "south", sheet)
	player.position = Vector3(at.x, player.position.y, at.z)



func estadio_de(dueno: Dictionary, att: float, fiesta: bool = false) -> void:
	make_stadium({
		"div": div(),
		"attendance": att,
		"party": fiesta,
		"home_club": String(dueno.get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(dueno, 0),
		"banner": "VAMOS",
		"board": "",
	})



func nombre_chaval() -> String:
	return String(data.get("nombre", data.get("name", "?"))).to_upper()


func apellido_chaval() -> String:
	var a: String = String(data.get("apellido", ""))
	return a if not a.is_empty() else nombre_chaval()







func chaval_de_tu_pais() -> void:
	var nm: String = String(data.get("name", ""))
	var nat: String = String(data.get("pais", ""))
	if nm.is_empty() or nat.is_empty():
		return
	PlayerNations.register(nm, Nations.canon_id(nat))



	PlayerLooks.apunta_regen(nm, GameState.season_num
		- int(data.get("age", Juveniles.EDAD_NINO)))
