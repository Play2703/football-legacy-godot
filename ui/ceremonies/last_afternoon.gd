extends Ceremony



















const FACING: String = "north"

const KEYS: Array = [
	{"t": 0.0, "dist": 34.0, "h": 15.0, "yaw": 168.0, "aim_y": 7.0, "fov": 40.0},
	{"t": 3.6, "dist": 13.0, "h": 4.2, "yaw": 150.0, "aim_y": 2.2, "fov": 34.0},
	{"t": 7.5, "dist": 6.2, "h": 2.1, "yaw": 140.0, "aim_y": 1.15, "fov": 32.0},
]

const DRIFT: float = -0.5

const APPLAUSE_MIN: float = 0.28


func _build() -> void:
	var att: float = Ceremonies.farewell_attendance(
		float(data.get("avg", 6.0)), int(data.get("goals", 0)),
		int(data.get("pos", 0)), int(data.get("teams", 0)))
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": att,
		"party": false,


		"weather": "sunset",
		"kit": kit,
		"banner": I18n.t("HASTA EL AÑO QUE VIENE"),
		"board": I18n.t("GRACIAS"),
	})
	make_camera(KEYS)
	orbit_speed = DRIFT
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)






	look["number"] = shirt()
	make_player(look, FACING)


	make_audio(att, att >= APPLAUSE_MIN)

	stadium.crowd_excite(0.1)

	make_chyron(I18n.t("FIN DE TEMPORADA"), String(team().get("name", "?")).to_upper(), team())
	make_card(7.0)
	card_title(I18n.tf("TEMPORADA {0}", [temporada_del_acto()]), 40)
	card_sub(_position_line())
	card_count(int(data.get("goals", 0)), I18n.tf("GOLES EN {0} PARTIDOS · {1} ASISTENCIAS",
		[int(data.get("matches", 0)), int(data.get("assists", 0))]))
	card_note(I18n.t(_closing_line(att)))
	card_cta(I18n.t("PASAR PÁGINA"))




func _position_line() -> String:
	var pos: int = int(data.get("pos", 0))
	var teams: int = int(data.get("teams", 0))
	if pos <= 0 or teams <= 0:
		return I18n.t("SIN TÍTULOS")
	return I18n.tf("{0} DE {1} · SIN TÍTULOS", [I18n.ordinal(pos), teams])




func _closing_line(att: float) -> String:
	if att >= 0.34:
		return "Se quedaron a aplaudir igual. Eso también se gana."
	if att >= 0.18:
		return "Media grada de vuelta a casa. El año que viene se empieza de cero."
	return "Las gradas se vaciaron antes del pitido. Hay años así."
