extends Ceremony



































const PASA: String = "pasa"
const FUERA: String = "fuera"






































const KEYS_PASA: Array = [
	{"t": 0.0, "dist": 3.3, "h": 1.45, "yaw": 182.0, "aim_y": 1.15, "fov": 36.0,
		"focus_x": 0.34, "focus_z": 1.15},
	{"t": 2.6, "dist": 4.8, "h": 1.55, "yaw": 176.0, "aim_y": 1.25, "fov": 46.0,
		"focus_x": 0.1, "focus_z": 0.85},
	{"t": 6.0, "dist": 7.0, "h": 1.55, "yaw": 166.0, "aim_y": 1.3, "fov": 62.0,
		"focus_x": -0.3, "focus_z": 1.5},
]










const KEYS_FUERA: Array = [
	{"t": 0.0, "dist": 2.9, "h": 0.95, "yaw": 184.0, "aim_y": 0.72, "fov": 38.0,
		"focus_x": 0.34, "focus_z": 1.15},
	{"t": 3.4, "dist": 7.2, "h": 1.35, "yaw": 178.0, "aim_y": 1.1, "fov": 56.0,
		"focus_x": -0.2, "focus_z": 1.2},
]




const DRIFT_PASA: float = 0.42
const DRIFT_FUERA: float = 0.2

const T_CHYRON: float = 1.2


const T_CLAP: float = 2.4
const T_CARD_PASA: float = 6.4


const T_CARD_FUERA: float = 5.0
































const COACH_H: float = 1.8



const COACH_Z: float = 3.3




const PASEO_X_CUP: Vector2 = Vector2(-1.15, -0.75)
const PASEO_MS_CUP: float = 0.3
const PASEO_PAUSA_CUP: Vector2 = Vector2(1.2, 2.4)




const PASEO_ESPERA_CUP: float = 1.6










const DIM_BRIGHT: float = 0.72
const DIM_SAT: float = 0.55

var room: LockerRoom
var _clapping: bool = false
var _mode: String = PASA





func _accent_for() -> Color:
	return CareerTheme.accent_of(team()) if _pasa() else CareerTheme.DANGER


func _pasa() -> bool:
	return _mode == PASA


func _build() -> void:
	_mode = FUERA if String(data.get("mode", PASA)) == FUERA else PASA


	focus = Vector3(0.34, 0.0, 1.15)
	room = LockerRoom.new()



	room.host_viewport = viewport




	room.force_club = not _is_nat()




	room.force_nation = _is_nat()



	room.show_captain = false


	room.celebrate = _pasa()


	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS_PASA if _pasa() else KEYS_FUERA, 32.0)
	orbit_speed = DRIFT_PASA if _pasa() else DRIFT_FUERA


	paseo_x = PASEO_X_CUP
	paseo_ms = PASEO_MS_CUP
	paseo_pausa = PASEO_PAUSA_CUP
	paseo_espera = PASEO_ESPERA_CUP
	coach_sprite(Vector3(PASEO_X_CUP.x, 0.0, COACH_Z), COACH_H, Career.coach_look(),
		Career.coach_name(), false, Career.coach_nivel())
	if _pasa():


		make_audio(0.25, false)
	else:


		_dim_room()
	_build_card()





func _is_nat() -> bool:
	return ["wc", "euro", "nat"].has(String(data.get("comp", "cup")))






func _dim_room() -> void:
	for n in viewport.get_children():
		if n is WorldEnvironment and n.environment != null:
			var env: Environment = n.environment
			env.adjustment_enabled = true
			env.adjustment_brightness = DIM_BRIGHT
			env.adjustment_saturation = DIM_SAT
			return









const COMP_KEY: Dictionary = {
	"cup": "copa", "ucl": "champions", "eul": "europa", "conf": "conference",
	"cwc": "mundialito", "wc": "mundial", "euro": "mundial",


	"lib": "libertadores", "sud": "sudamericana", "cca": "concacaf",
	"ace": "oriente", "ac2": "sol",
	"caf": "atlas", "cf2": "baobab",

	"ofc": "coral",
}


func _build_card() -> void:
	var comp_id: String = String(data.get("comp", "cup"))




	var comp: String = String(data.get("tour", ""))




	if comp.is_empty() and _es_liguilla():
		comp = I18n.t("LIGUILLA")
	if comp.is_empty():
		comp = Competitions.comp_name(String(COMP_KEY.get(comp_id, comp_id)))
	var rival: Dictionary = _rival()
	make_chyron(I18n.t("PASAS DE RONDA") if _pasa() else I18n.t("ELIMINADO"),
		comp.to_upper(), team(), T_CHYRON)
	make_card(T_CARD_PASA if _pasa() else T_CARD_FUERA)



	card_title(I18n.t(_round_label(_next_round() if _pasa() else _round())), 40)
	card_sub(comp.to_upper())
	card_stats(_stats())
	var note: Dictionary = _note_line(rival)
	card_note(I18n.tf(String(note["key"]), note.get("args", [])))
	card_cta(I18n.t("SEGUIR"))


func _round() -> String:
	return String(data.get("round", ""))


func _next_round() -> String:
	return String(data.get("next_round", ""))







const ROUND_LABEL: Dictionary = {
	"Playoff": "PLAYOFF",



	"Play-in": "PLAY-IN",





	"previa": "PREVIA", "Previa": "PREVIA",
	"preliminar": "PRELIMINAR", "Preliminar": "PRELIMINAR",
	"Octavos": "OCTAVOS DE FINAL",
	"Cuartos": "CUARTOS DE FINAL",
	"Semifinal": "SEMIFINAL",
	"Final": "LA FINAL",
}


func _round_label(r: String) -> String:
	return String(ROUND_LABEL.get(r, r.to_upper()))




func _rival() -> Dictionary:
	var id: String = String(data.get("rival", ""))



	if _is_nat():
		var n: Dictionary = Nations.as_team(id)
		if not n.is_empty():
			return n
	var t: Dictionary = Teams.by_id(id)
	return t if not t.is_empty() else GameState.current_rival()









func _stats() -> Array:
	var tg: int = int(data.get("tg", -1))
	var rg: int = int(data.get("rg", -1))
	var won: int = int(data.get("won_rounds", 0))





	var glob: Array = _liguilla_global()
	if not glob.is_empty():
		return [
			{"v": I18n.tf("GLOBAL {0}-{1}", [int(glob[0]), int(glob[1])]),
				"k": I18n.t("el cruce")},
			{"v": str(won), "k": I18n.t("rondas ganadas")},
			_dorsal_chip(),
		]
	return [
		{"v": "%d-%d" % [tg, rg] if tg >= 0 and rg >= 0 else "—",
			"k": I18n.t("el cruce")},
		{"v": str(won), "k": I18n.t("rondas ganadas")},










		_dorsal_chip(),
	]




func _es_liguilla() -> bool:
	return String(data.get("comp", "")) == "liguilla"











func _liguilla_global() -> Array:
	if not _es_liguilla():
		return []
	var agg_v: Variant = data.get("agg", [])
	if agg_v is Array and (agg_v as Array).size() == 2:
		return [int(agg_v[0]), int(agg_v[1])]
	var cruce: Dictionary = _liguilla_cruce()
	if cruce.is_empty():
		return []
	var g: Array = Liguilla.goles(String(cruce.get("score", "")))
	if g.size() != 2:
		return []
	var soy_a: bool = String(cruce.get("a", "")) == GameState.YOU_KEY
	return [int(g[0]), int(g[1])] if soy_a else [int(g[1]), int(g[0])]





func _liguilla_cruce() -> Dictionary:
	var k: int = int({"Cuartos": Liguilla.CUARTOS, "Semifinal": Liguilla.SEMIS}
		.get(_round(), -1))
	var bracket: Array = GameState.liguilla_state.get("bracket", []) as Array
	if k < 0 or k >= bracket.size():
		return {}
	var tg: int = int(data.get("tg", -1))
	var rg: int = int(data.get("rg", -1))
	for t in bracket[k]:
		var cruce: Dictionary = t
		var soy_a: bool = String(cruce.get("a", "")) == GameState.YOU_KEY
		if not soy_a and String(cruce.get("b", "")) != GameState.YOU_KEY:
			continue
		var rival: String = String(cruce.get("b", "")) if soy_a else String(cruce.get("a", ""))

		var vuelta: String = "%d-%d" %([tg, rg] if soy_a else [rg, tg])
		if rival != String(data.get("rival", "")) \
				or String(cruce.get("leg2", "")) != vuelta \
				or String(cruce.get("winner", "")).is_empty():
			return {}
		return cruce
	return {}





func _fuera_por_puesto() -> bool:
	if _pasa() or not _es_liguilla():
		return false
	if data.has("por_puesto"):
		return bool(data.get("por_puesto", false))
	var g: Array = _liguilla_global()
	return g.size() == 2 and int(g[0]) == int(g[1])





func _dorsal_chip() -> Dictionary:
	if _is_nat():
		var n: int = Career.nat_number()
		if n <= 0:
			return {"v": I18n.t("FUERA DE LA CONVOCATORIA"), "k": I18n.t("tu dorsal")}
		return {"v": "#%d" % n, "k": I18n.t("tu dorsal")}
	return {"v": "#%d" % maxi(Career.club_number(String(
		club_del_acto())), 1),
		"k": I18n.t("tu dorsal")}







func _note_line(rival: Dictionary) -> Dictionary:


	var name_r: String = Nations.team_label(rival).to_upper()



	if _es_liguilla():
		return _note_liguilla(name_r)
	if _pasa():
		match _next_round():
			"Final":
				return {"key": "Una noche más y hay copa. En esta sala ya no habla nadie de suerte.",
					"args": []}
			"Semifinal":
				return {"key": "Semifinales. Quedan dos partidos para levantarla.", "args": []}
		return {"key": "{0} fuera. El cuadro sigue abierto y vosotros dentro.",
			"args": [name_r]}
	var won: int = int(data.get("won_rounds", 0))
	if won <= 0:
		return {"key": "Fuera a la primera. El vestuario se vacía sin que nadie diga nada.",
			"args": []}
	if _round() == "Semifinal":
		return {"key": "A un partido de la final. Esta sala va a tardar en olvidarlo.",
			"args": []}





	if _is_nat():
		return {"key": "{0} os deja fuera. El siguiente es dentro de cuatro años.",
			"args": [name_r]}
	return {"key": "{0} os deja fuera. Se acabó la copa y quedan cuarenta domingos.",
		"args": [name_r]}





func _note_liguilla(name_r: String) -> Dictionary:
	if _pasa():
		match _next_round():
			"Final":
				return {"key": "Dos partidos y la liga es vuestra. En esta sala ya no habla nadie de suerte.",
					"args": []}
			"Semifinal":
				return {"key": "Semifinales. Dos cruces más y la liga es vuestra.", "args": []}
		return {"key": "{0} fuera. El cuadro sigue abierto y vosotros dentro.",
			"args": [name_r]}
	if _fuera_por_puesto():
		return {"key": "Global igualado y pasa el mejor de la tabla: {0}. No hizo falta ni la tanda.",
			"args": [name_r]}
	if int(data.get("won_rounds", 0)) <= 0:
		return {"key": "Fuera a la primera. El vestuario se vacía sin que nadie diga nada.",
			"args": []}

	if _round() == "Semifinal":
		return {"key": "A un cruce de la final. Esta sala va a tardar en olvidarlo.",
			"args": []}

	if GameState.torneos_activos() and int(GameState.liguilla_state.get("torneo",
			Liguilla.CLAUSURA)) == Liguilla.APERTURA:
		return {"key": "{0} os deja fuera. Se acabó el Apertura; queda el Clausura.",
			"args": [name_r]}
	return {"key": "{0} os deja fuera. Se acabó la liguilla y con ella el año.",
		"args": [name_r]}


func _tick(delta: float) -> void:
	tick_paseo(delta)
	if _pasa() and not _clapping and t >= T_CLAP:
		_clap()


func _skipped() -> void:
	if _pasa() and not _clapping:
		_clap()


func _clap() -> void:
	_clapping = true
	applause(true)
