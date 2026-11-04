extends Ceremony






























const KEEPER_H: float = 1.9











const KEEPER_X: float = -34.0
const KEEPER_Z_OFF: float = 3.0
const ME_X: float = -33.8
const ME_Z_OFF: float = 4.4











const KEYS: Array = [
	{"t": 0.0, "dist": 8.6, "h": 1.55, "yaw": 84.0, "aim_y": 1.15, "fov": 52.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 3.7},
	{"t": 3.8, "dist": 4.9, "h": 1.62, "yaw": 74.0, "aim_y": 1.4, "fov": 42.0,
		"focus_x": KEEPER_X, "focus_z": Stadium.HALF_LINE + KEEPER_Z_OFF},
]

const DRIFT: float = -0.5



const ATT: float = 0.62
const T_CHYRON: float = 1.2
const T_CARD: float = 6.0




const RATIO_ALTO: float = 1.0

var _keeper: AnimatedSprite3D = null




func _accent_for() -> Color:
	return CareerTheme.accent_of(_rival())




func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rt if not rt.is_empty() else team()


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,
	})
	focus = Vector3(ME_X, 0.0, Stadium.HALF_LINE + ME_Z_OFF)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT




	if div() == 1:
		make_tunnel_mouth()




	make_player()
	player.position = Vector3(ME_X, player.position.y,
		Stadium.HALF_LINE + ME_Z_OFF)
	_build_keeper()

	make_audio(ATT, false)

	make_chyron(I18n.t("EL PORTERO DE ENFRENTE"),
		String(_rival().get("name", "?")).to_upper(), _rival(), T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("YA TE CONOCE"), 40)
	card_club(_rival())
	card_sub(I18n.tf("LE HAS METIDO {0}", [str(_goles())]))
	card_stats(_stats())
	card_note(_note_line())
	card_cta(I18n.t("SEGUIR"))


func _goles() -> int:
	return maxi(int(data.get("g", 0)), 0)


func _pj() -> int:
	return maxi(int(data.get("pj", 0)), 0)





func _stats() -> Array:
	var a: int = maxi(int(data.get("a", 0)), 0)
	return [
		{"v": str(_goles()), "k": I18n.t("goles")},
		{"v": str(a) if a > 0 else "—", "k": I18n.t("asist.")},
		{"v": str(_pj()) if _pj() > 0 else "—", "k": I18n.t("partidos")},
	]


func _note_line() -> String:
	var pj: int = maxi(_pj(), 1)
	if float(_goles()) / float(pj) >= RATIO_ALTO:
		return I18n.t("Todavía no sabe por dónde le vas a entrar.")
	return I18n.t("Nadie le ha hecho más daño que tú.")












func _build_keeper() -> void:
	var rid: String = String(_rival().get("id", ""))


	var de_campo: Dictionary = GameState.kit_variant(_rival(), 0)
	var base: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(rid, -1,
		String(de_campo.get("pattern", "solid"))), de_campo)
	var look: Dictionary = person_look(_keeper_person(rid), base)
	_keeper = AnimatedSprite3D.new()
	_keeper.pixel_size = KEEPER_H / PLAYER_METRICS.x
	_keeper.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	_keeper.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_keeper.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_keeper.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_keeper.sprite_frames = keeper_idle_frames(look, rid)
	_keeper.position = Vector3(KEEPER_X,
		feet_offset(_keeper.pixel_size) - PLAYER_SINK,
		Stadium.HALF_LINE + KEEPER_Z_OFF)
	viewport.add_child(_keeper)
	_keeper.play("idle")





func _keeper_person(team_id: String) -> Dictionary:
	for row in Squad.of(team_id):
		var r: Dictionary = row
		if String(r.get("pos", "")) == "POR" and not String(r.get("name", "")).is_empty():
			return {"name": String(r["name"]), "number": int(r.get("number", 1))}
	return {"name": "", "number": 1, "idx": 0}
