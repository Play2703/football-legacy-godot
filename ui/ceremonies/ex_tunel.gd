extends Ceremony


























const EX_X: float = -34.0
const EX_Z_OFF: float = 4.6
const ME_X: float = -33.8
const ME_Z_OFF: float = 6.0









const KEYS: Array = [
	{"t": 0.0, "dist": 5.2, "h": 1.55, "yaw": 106.0, "aim_y": 1.45, "fov": 40.0,
		"focus_x": EX_X, "focus_z": Stadium.HALF_LINE + EX_Z_OFF},
	{"t": 4.2, "dist": 9.5, "h": 1.5, "yaw": 97.0, "aim_y": 1.6, "fov": 32.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 5.3},
]

const DRIFT: float = -0.5

const ATT: float = 0.62
const T_CHYRON: float = 1.0

const T_CARD: float = 4.6



const KEEPER_H: float = 1.9


var ex_sprite: AnimatedSprite3D = null




func _accent_for() -> Color:
	return CareerTheme.accent_of(_rival())




func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rt if not rt.is_empty() else team()


func _temporadas() -> int:
	return maxi(int(data.get("temporadas", 0)), 0)




func _club_juntos() -> String:
	var id: String = String(data.get("club_juntos", ""))
	if id.is_empty():
		return "?"
	return TransferBook.nombre_de_etapa({"club": id})



func rotulo() -> String:
	return I18n.tf("{0} TEMPORADAS JUNTOS EN {1}",
		[str(_temporadas()), _club_juntos().to_upper()])


func _build() -> void:
	var rival: Dictionary = _rival()
	var casa: bool = bool(data.get("home", true))


	var dueno: Dictionary = team() if casa else rival
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(dueno.get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(dueno, 0),
	})
	focus = Vector3(ME_X, 0.0, Stadium.HALF_LINE + ME_Z_OFF)
	make_camera(KEYS, 36.0)
	orbit_speed = DRIFT


	if div() == 1:
		make_tunnel_mouth()


	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look, "south")
	player.position = Vector3(ME_X, player.position.y, Stadium.HALF_LINE + ME_Z_OFF)
	_build_ex(rival)
	make_audio(ATT, false)

	make_chyron(I18n.t("TE CONOCE DE ANTES"), String(rival.get("name", "?")).to_upper(),
		rival, T_CHYRON)
	make_card(T_CARD)
	card_title(String(data.get("apellido", data.get("nombre", "?"))).to_upper(), 40)
	card_club(rival)



	var sub: Label = card_sub(rotulo())
	sub.clip_text = true
	card_stats([
		{"v": str(_temporadas()), "k": I18n.t("temporadas")},
		{"v": str(maxi(int(data.get("n", 1)), 1)), "k": I18n.t("reencuentros")},
	])
	card_cta(I18n.t("SEGUIR"))








func _build_ex(rival: Dictionary) -> void:
	var rid: String = String(rival.get("id", ""))
	var portero: bool = String(data.get("pos", "")) == "POR"
	var persona: Dictionary = {"name": String(data.get("cara", "")),
		"number": int(data.get("number", 0))}
	ex_sprite = AnimatedSprite3D.new()
	if portero:


		var de_campo: Dictionary = GameState.kit_variant(rival, 0)
		var base: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(rid, -1,
			String(de_campo.get("pattern", "solid"))), de_campo)
		ex_sprite.pixel_size = KEEPER_H / PLAYER_METRICS.x
		ex_sprite.sprite_frames = keeper_idle_frames(person_look(persona, base), rid)
	else:
		var cfg: Dictionary = person_look(persona, GameState.kit_variant(rival, 0))
		cfg["club"] = rid
		ex_sprite.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
		ex_sprite.sprite_frames = player_frames(cfg, "south")
	ex_sprite.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	ex_sprite.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	ex_sprite.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	ex_sprite.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	ex_sprite.position = Vector3(EX_X,
		feet_offset(ex_sprite.pixel_size) - PLAYER_SINK,
		Stadium.HALF_LINE + EX_Z_OFF)
	viewport.add_child(ex_sprite)
	ex_sprite.play("idle")
	PlacaNombre.cuelga(ex_sprite, String(data.get("apellido", "")), true, true)
