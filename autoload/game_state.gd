extends Node


signal career_updated



signal season_advanced(result: Dictionary)




const LookMigracion = preload("res://features/match/look_migracion.gd")
const SAVE_FILE: String = "career.json"



var readonly_save: bool = false



var load_failed: bool = false




func active_save_path() -> String:
	return SaveSlots.slot_path(SAVE_FILE)

var matches_played: int = 0
var wins: int = 0
var draws: int = 0
var losses: int = 0
var career_goals: int = 0
var career_assists: int = 0
var career_shots: int = 0





var legend_goals: int = 0
var legend_assists: int = 0



var club_matches: Dictionary = {}












var vs_clubs: Dictionary = {}
var vs_nations: Dictionary = {}
var rating_total: float = 0.0
var best_rating: float = 0.0




var team_custom: Dictionary = {}

var wardrobe_outfits: Array = []
var rival_custom: Dictionary = {}



var player_team_id: String = ""











var next_weather: String = ""








var next_wind_seed: int = 0











var next_rain: int = -1




var career_page: String = ""



var hub_jugar: bool = false



var hub_encargo: bool = false









var next_chances: int = -1






var next_base_chances: int = -1









var next_chem_rel: int = -1




var next_fan_rel: int = -1




var next_minutes: int = -1






var next_starter: bool = true







var next_banca_condicional: Dictionary = {}






var next_play_style: int = MatchPlan.Style.BALANCEADO







var practice_kind: String = ""





var practica_en_curso: bool = false




















var servicio_var: String = ""





var servicio_zona: String = ""
















const VENUE_ROOF: String = "roof"
const VENUE_STADIUM: String = "stadium"
var practice_venue: String = VENUE_ROOF










var training_active: bool = false





var training_home: bool = false












var encargo: Dictionary = {}
var encargo_result: Dictionary = {}







var tutorial_active: bool = false
var tutorial_result: Dictionary = {}







var career_draft: Dictionary = {}





var nat_match_active: bool = false




var player_kit_slot: int = 0
var rival_kit_slot: int = 0






var player_number: int = 0


var kit_choice_ready: bool = false
















var kit_choice_day: Vector2i = Vector2i(-1, -1)







const BALL_STYLES: Array[String] = ["classic", "red", "blue", "gold"]
var ball_style: String = "classic"



func pick_ball_style() -> String:
	if ball_style != "" and BALL_STYLES.has(ball_style):
		return ball_style
	return BALL_STYLES[randi() % BALL_STYLES.size()]







const BALL_DIV_TINT: Dictionary = {
	1: Color(1.0, 1.0, 1.0),
	2: Color(0.9, 0.87, 0.8),
	3: Color(0.74, 0.7, 0.6),
}


func ball_tint_for_div(div: int) -> Color:
	return BALL_DIV_TINT.get(clampi(div, 1, 3), Color.WHITE)



















const YOU_KEY: String = "TÚ"


const LEAGUE_SIZE: int = 18

const CUP_FIELD: int = 16









const UCL_FIELD: int = 36









const UCL_MAX_PER_COUNTRY: int = 6




const COEFF_CHAMPIONS_W: float = 8.0
const COEFF_LEAGUE_W: float = 1.0









const COEFF_LEAGUE_CAP: int = 8













const COEFF_STRENGTH_W: float = 8.0
const COEFF_STRENGTH_BASE: float = 80.0
const COEFF_STRENGTH_TOP: int = 4











const UCL_ACCESS: Array = [[5, 4], [6, 3], [8, 2]]
const UCL_ACCESS_TAIL: int = 1
const EUL_ACCESS: Array = [[17, 2]]
const EUL_ACCESS_TAIL: int = 1








const UCL_EXTRA_CHAMPION: int = 1




const EUL_FIELD: int = 36





const CONF_FIELD: int = 36







const EURO_SIM: GDScript = preload("res://features/league/euro_sim.gd")

const EURO_COMPS: Array[String] = ["ucl", "eul", "conf"]




















const EURO_FIELD: int = 36



const EURO_MATCHDAYS: Dictionary = {"ucl": 8, "eul": 8, "conf": 6}
const EURO_MATCHDAYS_DEFAULT: int = 8


const TOPE_RIVALES_PAIS: int = 2






const EURO_POTS: Dictionary = {"ucl": 4, "eul": 4, "conf": 6}
const EURO_POTS_DEFAULT: int = 4


const EURO_DIRECT: int = 8
const EURO_PLAYOFF: int = 24



const EURO_KO_PLAYOFF: int = 0

var season_num: int = 1
var season_day: int = 0














var season_close_pending: bool = false













var season_wait_close: bool = false
var calendar: Array = []
var league_table: Dictionary = {}
var league_schedule: Array = []














var last_table_pull: Dictionary = {}
var cup_state: Dictionary = {}
var ucl_state: Dictionary = {}
var qualified_ucl: bool = false





var eul_state: Dictionary = {}
var qualified_eul: bool = false


var conf_state: Dictionary = {}
var qualified_conf: bool = false
var cwc_state: Dictionary = {}




















var liguilla_state: Dictionary = {}







var apertura_tabla: Dictionary = {}
var liguilla_apertura: Dictionary = {}











var apertura_mundo: Dictionary = {}





var campeones_state: Dictionary = {}






var recopa_state: Dictionary = {}
var intercont_state: Dictionary = {}
var supereuropa_state: Dictionary = {}
var superafrica_state: Dictionary = {}



var supercopa_state: Dictionary = {}




var copaliga_state: Dictionary = {}





var ligas_state: Dictionary = {}




var finalissima_state: Dictionary = {}





var naciones_state: Dictionary = {}






var olimpicos_state: Dictionary = {}
var club_wc_qualified: bool = false
















var lib_state: Dictionary = {}
var sud_state: Dictionary = {}
var cca_state: Dictionary = {}


var ace_state: Dictionary = {}
var ac2_state: Dictionary = {}
var caf_state: Dictionary = {}
var cf2_state: Dictionary = {}


var ofc_state: Dictionary = {}





var nat_state: Dictionary = {}













var nat_coef: Dictionary = {}










var campeon_mundial: String = ""





var nat_qual_grupo: Dictionary = {}



var nat_qual_grupo_cont: Dictionary = {}




const NAT_COEF_WC: float = 3.0
const NAT_COEF_CONT: float = 1.5




const NAT_COEF_DECAY: float = 0.12



const NAT_COEF_CAP: float = 8.0




var last_match: Dictionary = {}







var last_round_results: Array = []






var last_match_delta: Dictionary = {}





var _delta_noted: bool = false




var club_div: Dictionary = {}





var last_div_moves: Dictionary = {}





















var last_season_snap: Dictionary = {}












var last_orden_1a: Dictionary = {}






var stadium_div: Dictionary = {}


var last_league_champion: String = ""




var last_ucl_winner: String = ""
var last_eul_winner: String = ""


var last_conf_winner: String = ""




var last_lib_winner: String = ""
var last_sud_winner: String = ""
var last_cca_winner: String = ""


var last_ace_winner: String = ""
var last_ac2_winner: String = ""
var last_caf_winner: String = ""
var last_cf2_winner: String = ""


var last_ofc_winner: String = ""







var continental_winners: Dictionary = {}








var amer_cupos_snap: Dictionary = {}







var europa_cupos_snap: Dictionary = {}

var _europa_previa_cache: Dictionary = {}







static var previas_uefa_encendidas: bool = true



var previas_desde: int = 0







var verano_convocado: Dictionary = {}

var _jugando_sin_ti: bool = false


var _avisos_previa_mudos: bool = false






var copas_mundo_snap: Dictionary = {}







var coef_asoc_hist: Dictionary = {}
var coef_club_hist: Dictionary = {}






var last_league_order: Array = []
























var _closing_season: bool = false


func _ensure_season() -> void:
	if _closing_season:
		return
	if not calendar.is_empty() and not league_table.is_empty():
		return


	_temporada_fantasma = not Career.has_save() \
			and (Teams.by_id(player_team_id).is_empty() or player_team_id == _club_sorteado)
	_ensure_player_team()
	_build_calendar()
	_temporada_fantasma = false

	_juega_previas_sin_ti()















var _temporada_fantasma: bool = false






var _club_sorteado: String = ""


func _blank_row() -> Dictionary:
	return {"pj": 0, "w": 0, "d": 0, "l": 0, "gf": 0, "gc": 0, "pts": 0}



func div_of(team_id: String) -> int:
	return int(club_div.get(team_id, Teams.base_div(team_id)))





func stadium_built_div(team_id: String) -> int:
	var base: int = Teams.base_div(team_id)
	return mini(base, int(stadium_div.get(team_id, base)))









func _consolida_estadios(pdiv: int) -> void:
	var jugada: Dictionary = club_div.duplicate()
	if not player_team_id.is_empty() and pdiv > 0:
		jugada[player_team_id] = pdiv
	for id in jugada:
		var cid: String = String(id)
		var d: int = int(jugada[id])
		if d > 0 and d < stadium_built_div(cid):
			stadium_div[cid] = d



func player_div() -> int:
	return div_of(player_team_id)















func teams_in_div_jugada(country: String, div: int) -> Array:
	if int(last_season_snap.get("season", -1)) != season_num - 1:
		return teams_in_div(country, div)
	var por_pais: Dictionary = last_season_snap.get("divs", {})
	var del_pais: Dictionary = por_pais.get(country, {})
	var out: Array = del_pais.get(div, [])
	return out if not out.is_empty() else teams_in_div(country, div)

















func _censo_jugado(country: String, div: int) -> Array:
	if int(last_season_snap.get("season", -1)) == season_num:
		var por_pais: Dictionary = last_season_snap.get("divs", {})
		var del_pais: Dictionary = por_pais.get(country, {})
		var out: Array = del_pais.get(div, [])
		if not out.is_empty():
			return out
	return teams_in_div(country, div)














func league_rounds_yours() -> int:
	var n: int = 0
	for jornada in league_schedule:
		for pair in (jornada as Array):
			if str(pair[0]) == YOU_KEY or str(pair[1]) == YOU_KEY:
				n += 1
				break
	return n
















func _amer_pin_copa() -> Dictionary:
	return CopaMundo.campeones()





func _uefa_pin_copa() -> Dictionary:
	var out: Dictionary = {}
	for p in Teams.euro_countries():
		if not FormatoCopa.tiene(String(p), FormatoCopa.COPA):
			continue
		var w: String = CopaMundo.campeon(String(p))
		if not w.is_empty():
			out[String(p)] = w
	return out












func _copas_del_cierre() -> Dictionary:
	var out: Dictionary = {}
	for c in Nations.PLAYABLE:
		var pais: String = String(c)
		if not FormatoCopa.tiene(pais, FormatoCopa.COPA):
			continue
		var w: String = CopaMundo.campeon(pais)
		if not w.is_empty():
			out[pais] = {"w": w, "s": CopaMundo.finalista(pais)}
	return out






func _amer_pin_liguilla(divs: Dictionary) -> Dictionary:
	if not Liguilla.aplica("México", 1):
		return {}
	var mex: Dictionary = {}
	var tuya: bool = Teams.country_of(player_team_id) == "México" and player_div() == 1
	for t in [Liguilla.APERTURA, Liguilla.CLAUSURA]:
		var lg: Dictionary = liguilla_de(t) if tuya else SimLeague.liguilla("México", 1,
			season_num,((divs.get("México", {}) as Dictionary).get(1, [])) as Array, t)
		var w: String = _euro_sim_id(String(lg.get("winner", "")))
		var ru: String = _euro_sim_id(String(lg.get("runner_up", "")))
		mex["apertura" if t == Liguilla.APERTURA else "clausura"] = {} if w.is_empty() \
				else {"winner": w, "runner_up": ru}
	return {"México": mex}


func _foto_temporada() -> void:
	var divs: Dictionary = {}
	for t in Teams.all():
		var ficha: Dictionary = t
		var pais: String = String(ficha.get("country", ""))
		if pais.is_empty():
			continue
		var d: int = div_of(String(ficha.get("id", "")))
		if not divs.has(pais):
			divs[pais] = {}
		var del_pais: Dictionary = divs[pais]
		if not del_pais.has(d):
			del_pais[d] = []
		(del_pais[d] as Array).append(ficha)



	for pais in divs:
		for d in (divs[pais] as Dictionary):
			((divs[pais] as Dictionary)[d] as Array).sort_custom(
				func(a, b): return int(a["rating"]) > int(b["rating"]))














	var orden_1a: Dictionary = {}
	var mio: String = Teams.country_of(player_team_id)
	for pais in divs:
		var p: String = String(pais)


		if not (Teams.is_european(p) or Continental.tiene_copas(p)) \
				or (p == mio and not last_league_order.is_empty()):
			continue
		var orden: Array = []
		for row in SimLeague.table(p, 1, season_num, 1.0,
				(divs[pais] as Dictionary).get(1, [])):
			orden.append(String((row as Dictionary).get("id", "")))
		if not orden.is_empty():
			orden_1a[p] = orden










	last_orden_1a = {"season": season_num, "orden": orden_1a, "amer": 4, "uefa": 1,
		"copa": _amer_pin_copa(), "liguilla": _amer_pin_liguilla(divs),
		"copa_uefa": _uefa_pin_copa()}





	var recorridos: Dictionary = {}
	for comp in ["ucl", "eul", "conf", "cwc"] + Continental.AMER_COMPS:
		recorridos[comp] = Race.torneo_clubes(String(comp), season_num, player_team_id, 1.0)
	last_season_snap = {
		"season": season_num,
		"divs": divs,
		"orden_1a": orden_1a,



		"ucl": ucl_field(16),
		"eul": eul_field(16),
		"conf": conf_field(16),



		"cup":(cup_state.get("field0", cup_state.get("field", [])) as Array).duplicate(),


		"cup_bracket":(cup_state.get("bracket", []) as Array).duplicate(true),
		"cwc":(cwc_state.get("groups", []) as Array).duplicate(true),
		"recorridos": recorridos,


		"copas": _copas_del_cierre(),
	}


























func teams_in_div(country: String, div: int) -> Array:
	var out: Array = Teams.all_of_country(country).filter(func(t: Dictionary) -> bool:
		return div_of(String(t.get("id", ""))) == div)
	out.sort_custom(func(a, b): return int(a["rating"]) > int(b["rating"]))
	return out





func pyramid_version() -> int:
	return club_div.hash()








func home_div() -> int:
	var f: Dictionary = current_fixture()





	if String(f.get("comp", "")) == "nat":
		return 1
	var opp: String = String(f.get("opp", ""))
	var home: bool = bool(f.get("home", true))
	var club: String = player_team_id if home or opp.is_empty() else opp
	if club.is_empty():
		return 1
	return clampi(div_of(club), 1, 3)






func home_country() -> String:



	var host: Dictionary = host_team()
	return String(host.get("country", ""))





func home_comp() -> String:
	return String(current_fixture().get("comp", "league"))






func league_position() -> int:
	return _league_position()










func season_progress() -> float:
	if calendar.size() <= 0:
		return -1.0




	return clampf((float(season_day) + 0.5) / float(calendar.size()), 0.0, 1.0)








func cwc_spots() -> Array[float]:
	var out: Array[float] = []
	if calendar.is_empty():
		return out



	var first: int = -1
	for i in calendar.size():
		if String(calendar[i].get("comp", "")) == "cwc":
			first = i
			break
	if first < 0:


		for k in CWC_DATES:
			out.append(clampf(0.9 + 0.01 * float(k), 0.0, 1.0))
		return out
	for k in CWC_DATES:
		out.append(clampf((float(first + k) + 0.5) / float(calendar.size()), 0.0, 1.0))
	return out






func home_club_id() -> String:
	var f: Dictionary = current_fixture()







	if String(f.get("comp", "")) == "nat":
		return ""
	var opp: String = String(f.get("opp", ""))
	var home: bool = bool(f.get("home", true))
	var local: String = player_team_id if home or opp.is_empty() else opp





	var casero: String = "" if Competitions.is_neutral(f) else Career.prestado_de(local)
	return local if casero.is_empty() else casero







func prestado_hoy() -> String:
	var f: Dictionary = current_fixture()
	if f.is_empty() or String(f.get("comp", "")) == "nat" or Competitions.is_neutral(f):
		return ""
	var opp: String = String(f.get("opp", ""))
	var local: String = player_team_id if bool(f.get("home", true)) or opp.is_empty() else opp
	return local if not Career.prestado_de(local).is_empty() else ""






func host_id() -> String:
	var f: Dictionary = current_fixture()
	if String(f.get("comp", "")) == "nat":
		var opp: String = String(f.get("opp", ""))
		var home: bool = bool(f.get("home", true))
		var nid: String = Career.nationality if home or opp.is_empty() else opp




		return Nations.canon_id(nid) if not nid.is_empty() else ""
	return home_club_id()





func host_team() -> Dictionary:
	var id: String = host_id()
	if id.is_empty():
		return {}
	if String(current_fixture().get("comp", "")) == "nat":
		return Nations.as_team(id)
	return Teams.by_id(id)




func winter_day() -> int:
	_ensure_season()





	if torneos_activos():
		var half: int = league_schedule.size() / 2
		for i in calendar.size():
			var e: Dictionary = calendar[i]
			if String(e.get("comp", "")) == "league" and int(e.get("round_idx", -1)) == half:
				return i + 1
	return int(calendar.size() / 2)




func _league_rivals() -> Array:
	var country: String = Teams.country_of(player_team_id)
	var out: Array = []
	for t in Teams.teams_of_country(country):
		if String(t["id"]) != player_team_id and div_of(String(t["id"])) == player_div():
			out.append(t)
	out.sort_custom(func(a, b): return int(a["rating"]) > int(b["rating"]))
	return out





static func rival_of(f: Dictionary) -> Dictionary:
	var opp: String = String(f.get("opp", ""))
	if opp.is_empty():
		return {}


	if String(f.get("comp", "")) == "nat":
		return Nations.as_team(opp)
	return Teams.by_id(opp)



func current_rival() -> Dictionary:
	return rival_of(current_fixture())




func next_fixture() -> Dictionary:
	var i: int = next_fixture_index()
	return calendar[i] if i >= 0 else {}





func next_fixture_index() -> int:
	_ensure_season()
	_skip_dead()
	var i: int = season_day + 1
	while i < calendar.size():
		if not bool(calendar[i].get("dead", false)):
			return i
		i += 1
	return -1







static func fixture_week(f: Dictionary) -> float:
	return float(f.get("week", CalendarioMundo.SIN_SEMANA))












func dias_fixtures() -> Array:
	var out: Array = []
	out.resize(calendar.size())
	out.fill(CalendarioMundo.SIN_DIA)
	var semanas: Array = []
	var fijas: Array = []
	var vivos: Array = []
	for i in calendar.size():
		var f: Dictionary = calendar[i]
		if bool(f.get("dead", false)):
			continue
		var w: float = fixture_week(f)
		if not CalendarioMundo.semana_conocida(w):
			return out
		semanas.append(w)


		fijas.append(String(f.get("round", "")) == "previa" and EURO_COMPS.has(String(f.get("comp", ""))))
		vivos.append(i)
	var dias: Array = CalendarioMundo.dias_de(semanas, fijas)
	for k in vivos.size():
		out[int(vivos[k])] = int(dias[k])
	return out







func dias_descanso(solo_club: bool = false) -> float:
	_ensure_season()
	_skip_dead()
	if season_day >= calendar.size():
		return -1.0
	var dias: Array = dias_fixtures()
	var hoy: int = int(dias[season_day])
	if not CalendarioMundo.dia_conocido(hoy):
		return -1.0
	for i in range(season_day + 1, calendar.size()):
		var f: Dictionary = calendar[i]
		if bool(f.get("dead", false)):
			continue
		if solo_club and String(f.get("comp", "")) == "nat":
			continue
		return float(int(dias[i]) - hoy)
	return -1.0









func dias_entre_jornadas(r: int) -> float:
	_ensure_season()
	var dias: Array = dias_fixtures()
	var hoy: int = CalendarioMundo.SIN_DIA
	var sig: int = CalendarioMundo.SIN_DIA
	for i in calendar.size():
		var f: Dictionary = calendar[i]
		if bool(f.get("dead", false)) or String(f.get("comp", "")) != "league":
			continue
		var ri: int = int(f.get("round_idx", -1))
		if ri == r:
			hoy = int(dias[i])
		elif ri == r + 1:
			sig = int(dias[i])
	if not CalendarioMundo.dia_conocido(hoy) or not CalendarioMundo.dia_conocido(sig):
		return -1.0
	return float(sig - hoy)




func current_fixture() -> Dictionary:


	if PartidoLibre.activo:
		return PartidoLibre.fixture()
	_ensure_season()
	_skip_dead()
	if season_day < calendar.size():
		return calendar[season_day]
	return {}





static func fixture_is_knockout(f: Dictionary) -> bool:
	match String(f.get("comp", "")):
		"cwc", "campeones", "intercont", "supereuropa", "superafrica", "ligas":
			return true
		"supercopa":

			return int(f.get("leg", 1)) >= 1
		"cup", "copaliga":



			return int(f.get("jor", -1)) < 0 and int(f.get("leg", 1)) >= 1
		"recopa":

			return int(f.get("leg", 1)) >= 1
		"ucl", "eul", "conf":






			return String(f.get("round", "")) != "grupo" and int(f.get("leg", 1)) >= 1
		"liguilla":




			return int(f.get("leg", 1)) >= 1
		"lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc":




			return String(f.get("round", "")) != "grupo" and int(f.get("leg", 1)) >= 1
		"nat":


			if String(f.get("round", "")) == Finalissima.RONDA:
				return true

			if String(f.get("round", "")) in [LigaNaciones.RONDA_SEMI, LigaNaciones.RONDA_FINAL]:
				return true

			if String(f.get("round", "")) in JuegosOlimpicos.RONDAS \
					and String(f.get("round", "")) != JuegosOlimpicos.RONDA:
				return true




			return int(f.get("nat_ko", -1)) >= 0 \
					and not (String(f.get("round", "")) in ["grupo", "qual", "friendly"])
	return false



















func knockout_level(f: Dictionary, tg: int, rg: int) -> bool:
	if not fixture_is_knockout(f):
		return false



	if tie_rule(f) == "sembrado":
		return false
	var prev: Array = your_first_leg(f)
	if prev.is_empty():
		return tg == rg
	if tg + int(prev[0]) != rg + int(prev[1]):
		return false


	return _visitante_decide(f, tg, rg) == 0













static func tie_rule(f: Dictionary) -> String:
	if not fixture_is_knockout(f):
		return ""
	if String(f.get("comp", "")) == "liguilla":
		var k: int = int(f.get("ko_idx", -1))
		if k >= 0 and k < Liguilla.REGLA.size():
			return Liguilla.REGLA[k]



	if String(f.get("comp", "")) in ["cup", CopaLiga.COMP] and f.has("des"):
		return String(f["des"])


	if String(f.get("comp", "")) == SupercopaNacional.COMP:
		return String(f.get("des", "penales"))

	if String(f.get("comp", "")) == "campeones":
		return "penales"


	if String(f.get("comp", "")) == CopaLigas.COMP:
		return "penales"


	if String(f.get("comp", "")) == CopaLiga.COMP and String(f.get("round", "")) != "Final":
		return "penales"


	if Supercopas.es_supercopa(String(f.get("comp", ""))):
		return Supercopas.tie_rule(String(f.get("comp", "")), String(f.get("round", "")))



	var comp: String = String(f.get("comp", ""))
	if Continental.es_americana(comp):
		return Continental.tie_rule(comp, String(f.get("round", "")),
			int(f.get("ko_idx", -1)), int(f.get("leg", 1)))
	return "prorroga"









func your_first_leg(f: Dictionary) -> Array:
	var comp: String = String(f.get("comp", ""))
	if int(f.get("leg", 1)) < 1:
		return []




	if comp == "recopa":
		if int(recopa_state.get("season", -1)) != season_num:
			return []
		return _split_tie_goals(String(recopa_state.get("leg1", "")))

	if comp == SupercopaNacional.COMP:
		if int(supercopa_state.get("season", -1)) != season_num:
			return []
		return _split_tie_goals(String(supercopa_state.get("leg1", "")))



	if comp == "cup" or comp == CopaLiga.COMP:
		var st: Dictionary = _copa_st(comp).get("fmt", {})
		if st.is_empty():
			return []
		var tc: Dictionary = _copa_tu_cruce(st, int(st.get("r", 0)))
		var gc: Array = _split_tie_goals(String(tc.get("leg1", "")))
		if gc.size() != 2:
			return []
		return [int(gc[0]), int(gc[1])] if String(tc["a"]) == player_team_id \
				else [int(gc[1]), int(gc[0])]
	var bracket: Array = []
	if comp == "liguilla":
		bracket = liguilla_state.get("bracket", [])
	elif Continental.es_americana(comp) or EURO_COMPS.has(comp):




		if String(f.get("round", "")) == "previa":
			var pv: Dictionary = euro_state(comp).get("previa", {})
			var g0: Array = _split_tie_goals(String(pv.get("leg1", "")))
			if g0.is_empty():
				return []
			return [int(g0[0]), int(g0[1])] if String(pv.get("a", "")) == YOU_KEY \
					else [int(g0[1]), int(g0[0])]
		bracket = euro_state(comp).get("bracket", [])
	else:
		return []
	var ko: int = int(f.get("ko_idx", -1))
	if ko < 0 or ko >= bracket.size():
		return []
	for t in bracket[ko]:
		var a: String = String(t.get("a", ""))
		var b: String = String(t.get("b", ""))
		if a != YOU_KEY and b != YOU_KEY:
			continue
		var g: Array = _split_tie_goals(String(t.get("leg1", "")))
		if g.is_empty():
			return []
		return [int(g[0]), int(g[1])] if a == YOU_KEY else [int(g[1]), int(g[0])]
	return []













func knockout_lost(f: Dictionary, tg: int, rg: int) -> bool:
	if not fixture_is_knockout(f) or liguilla_sin_eliminacion(f):
		return false
	var prev: Array = your_first_leg(f)
	var mine: int = tg +(int(prev[0]) if not prev.is_empty() else 0)
	var his: int = rg +(int(prev[1]) if not prev.is_empty() else 0)
	if mine != his:
		return mine < his

	var vis: int = _visitante_decide(f, tg, rg)
	if vis != 0:
		return vis < 0


	if tie_rule(f) == "sembrado":
		return not liguilla_you_better(String(f.get("opp", "")))
	return next_shootout_winner < 0








func _visitante_decide(f: Dictionary, tg: int, rg: int) -> int:
	var comp: String = String(f.get("comp", ""))
	if not Continental.goles_visitante(comp) or int(f.get("leg", 1)) < 1:
		return 0
	var prev: Array = your_first_leg(f)
	if prev.is_empty():
		return 0
	var home: bool = bool(f.get("home", true))
	var mis_fuera: int = int(prev[0]) if home else tg
	var sus_fuera: int = rg if home else int(prev[1])
	return Continental.decide_visitante(mis_fuera, sus_fuera)



func _skip_dead() -> void:
	while season_day < calendar.size() and bool(calendar[season_day].get("dead", false)):
		season_day += 1




func _build_calendar() -> void:
	season_day = 0



	season_close_pending = false
	calendar = []
	league_table = {}








	Career.bajas_liga_nueva()

	last_table_pull = {}
	league_form = {}
	comp_form = {}
	league_schedule = []
	cup_state = {}
	ucl_state = {}
	eul_state = {}
	conf_state = {}
	cwc_state = {}
	liguilla_state = {}
	apertura_tabla = {}
	liguilla_apertura = {}
	lib_state = {}
	sud_state = {}
	cca_state = {}
	ace_state = {}
	ac2_state = {}
	caf_state = {}
	cf2_state = {}
	ofc_state = {}



	var entries: Array = []
	var league_len: int = _build_league(entries)
	_build_cup(entries, league_len)

	var mundo: bool = not _temporada_fantasma






	if not _euro_eligible() or not mundo:
		qualified_ucl = false
		qualified_eul = false
		qualified_conf = false




	if _previas_tocan():
		europa_cupos()
		europa_cupos_snap["vivas"] = true
		_avisos_de_verano()
	if previas_vivas():
		_build_euro_uefa(entries, league_len)


	elif qualified_ucl:
		_build_euro("ucl", ucl_field(UCL_FIELD), entries, league_len)
	elif qualified_eul:
		_build_euro("eul", eul_field(EUL_FIELD), entries, league_len)
	elif qualified_conf:
		_build_euro("conf", conf_field(CONF_FIELD), entries, league_len)




	if mundo:
		_build_amer(entries, league_len)



	_build_liguilla(entries, league_len)





	if mundo:
		_build_intercont(entries, league_len, true)


	if mundo:
		_build_cwc(entries, _last_week(entries) + 1.0)





	if mundo:
		_build_nat(entries, league_len, _last_week(entries) + 1.0)


	if mundo:
		_build_finalissima(entries, league_len)

	if mundo:
		_build_naciones(entries, league_len)


	if mundo:
		_build_olimpicos(entries)

	_parte_en_torneos(entries)



	_build_campeones(entries)


	if mundo:
		_build_recopa(entries)
		_build_supereuropa(entries)
		_build_superafrica(entries)


	_build_supercopa(entries, league_len)
	if mundo:
		_build_intercont(entries, league_len)


	_build_copaliga(entries, league_len)


	if mundo:
		_build_ligas(entries, league_len)

	_despeja_ventanas(entries)


	entries.sort_custom(func(a, b): return float(a["week"]) < float(b["week"]))












	calendar = entries




	for cc in Continental.CUADRO_COMPS:
		var cst: Dictionary = euro_state(cc)
		if bool(cst.get("playing", false)) and int(cst.get("ko_idx", 0)) == 0:
			_euro_set_you_opp(cc, cst, 0)















const ADELANTO_VENTANA: float = 0.2


func _despeja_ventanas(entries: Array) -> void:
	var primera: Dictionary = {}
	for e in entries:
		if String((e as Dictionary).get("comp", "")) != "nat":
			continue
		var w: float = float(e.get("week", 0.0))
		var k: int = int(floor(w))
		primera[k] = minf(float(primera.get(k, w)), w)
	var n: int = 0
	for e in entries:
		var comp: String = String((e as Dictionary).get("comp", ""))
		if comp == "nat" or comp == "league":
			continue
		var w2: float = float(e.get("week", 0.0))
		var k2: int = int(floor(w2))
		if primera.has(k2) and w2 > float(primera[k2]):

			e["week"] = float(k2) + ADELANTO_VENTANA + 0.001 * float(n)
			n += 1











func relocate_midseason(rounds_played: int, club_que_dejas: String = "") -> void:

	_avisos_previa_mudos = rounds_played > 0
	_relocate_midseason(rounds_played, club_que_dejas)
	_avisos_previa_mudos = false

	_juega_previas_sin_ti()






const MISMA_NOCHE: float = 0.1








func relocate_en_verano(semana: float) -> void:
	_build_calendar()
	var resume_idx: int = 0
	for i in calendar.size():
		if float(calendar[i].get("week", 0.0)) > semana + MISMA_NOCHE:
			resume_idx = i
			break
	if resume_idx > 0:

		_avisos_previa_mudos = true
		_relocate_catch_up_cup(resume_idx)
		_relocate_catch_up_copaliga(resume_idx)
		_relocate_catch_up_euro(resume_idx)
		_relocate_catch_up_amer(resume_idx)
		_avisos_previa_mudos = false
		for i in resume_idx:
			calendar[i]["dead"] = true
		season_day = resume_idx
		last_round_results = []
	_juega_previas_sin_ti()
	_save()




func semana_jugada() -> float:
	var w: float = - INF
	for f in calendar:
		if bool(f.get("played", false)):
			w = maxf(w, float(f.get("week", - INF)))
	return w


func _relocate_midseason(rounds_played: int, club_que_dejas: String) -> void:


	_guarda_apertura_jugado(club_que_dejas)
	_build_calendar()
	var total: int = league_schedule.size()



	var k: int = clampi(rounds_played, 0, maxi(total - 1, 0))
	if k <= 0:
		return
	for r in k:
		for pair in league_schedule[r]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])


			var home_id: String = player_team_id if a == YOU_KEY else a
			var away_id: String = player_team_id if b == YOU_KEY else b
			var s: Array = _sim_score(home_id, away_id)
			_apply_result(a, b, s[0], s[1])
		_kill_league_round(r)


		if r == total / 2 - 1 and torneos_activos():
			apertura_tabla = league_table.duplicate(true)
















	if torneos_activos() and k >= total / 2:
		var jugado: Dictionary = apertura_mundo_de(Teams.country_of(player_team_id), 1,
			season_num)
		if jugado.is_empty():
			_liguilla_seed()
			liguilla_state["alive"] = false
			_liguilla_tras_ronda()
			_liguilla_relevo()
		else:
			liguilla_apertura = jugado.duplicate(true)
			liguilla_state = _liguilla_estado_nuevo(Liguilla.CLAUSURA)
		liguilla_apertura["champion"] = false
		liguilla_apertura["sin_ti"] = true





	var resume_idx: int = _league_round_cal_idx(k)
	if resume_idx < 0:
		_save()
		return




	_relocate_catch_up_cup(resume_idx)



	_relocate_catch_up_copaliga(resume_idx)





	_relocate_catch_up_euro(resume_idx)

	_relocate_catch_up_amer(resume_idx)



	for i in resume_idx:
		calendar[i]["dead"] = true

	season_day = resume_idx



	last_round_results = []
	_save()





func _kill_league_round(r: int) -> void:
	for f in calendar:
		if String(f.get("comp", "")) == "league" and int(f.get("round_idx", -1)) == r:
			f["dead"] = true





func _league_round_cal_idx(r: int) -> int:
	for i in calendar.size():
		var f: Dictionary = calendar[i]
		if String(f.get("comp", "")) == "league" and int(f.get("round_idx", -1)) == r:
			return i
	return -1



func _cup_round_cal_idx(i: int) -> int:
	for j in calendar.size():
		var f: Dictionary = calendar[j]
		if String(f.get("comp", "")) == "cup" and int(f.get("cup_idx", -1)) == i:
			return j
	return -1










func _relocate_catch_up_cup(resume_idx: int) -> void:
	if not bool(cup_state.get("alive", false)):
		return

	if cup_state.has("fmt"):
		_relocate_catch_up_copa_real("cup", resume_idx)
		return
	var n: int = int(cup_state.get("names", []).size())
	for i in n:


		if not bool(cup_state.get("alive", false)):
			break
		var ci: int = _cup_round_cal_idx(i)


		if ci < 0 or ci >= resume_idx:
			break


		if i >= int(cup_state.get("opps", []).size()):
			break
		var opp: String = String(cup_state["opps"][i])
		var home: bool = bool(cup_state["homes"][i])
		var home_id: String = player_team_id if home else opp
		var away_id: String = opp if home else player_team_id
		var s: Array = _sim_score(home_id, away_id)
		var tg: int = int(s[0]) if home else int(s[1])
		var rg: int = int(s[1]) if home else int(s[0])
		_resolve_cup(opp, tg, rg)


		calendar[ci]["dead"] = true
		calendar[ci]["played"] = true
		calendar[ci]["gf"] = tg
		calendar[ci]["gc"] = rg





func _relocate_catch_up_copa_real(comp: String, resume_idx: int) -> void:
	var cs: Dictionary = _copa_st(comp)
	for ci in mini(resume_idx, calendar.size()):
		var e: Dictionary = calendar[ci]
		if String(e.get("comp", "")) != comp or bool(e.get("dead", false)) \
				or bool(e.get("played", false)) or String(e.get("opp", "")).is_empty():
			continue
		if not bool(cs.get("alive", false)):
			break
		var eo: String = String(e["opp"])
		var eh: bool = bool(e.get("home", true))
		var es: Array = _sim_score(player_team_id if eh else eo, eo if eh else player_team_id)
		var etg: int = int(es[0]) if eh else int(es[1])
		var erg: int = int(es[1]) if eh else int(es[0])
		e["played"] = true
		e["gf"] = etg
		e["gc"] = erg
		_resolve_copa_real(eo, etg, erg, e, comp)
		e["dead"] = true





func _relocate_catch_up_copaliga(resume_idx: int) -> void:
	if copaliga_state.has("fmt"):
		_relocate_catch_up_copa_real(CopaLiga.COMP, resume_idx)
		return
	var n: int =(copaliga_state.get("names", []) as Array).size()
	for _r in n:
		if not bool(copaliga_state.get("alive", false)):
			break
		var i: int = int(copaliga_state.get("idx", 0))
		if i >= n or i >=(copaliga_state.get("opps", []) as Array).size():
			break
		var ci: int = -1
		for k in calendar.size():
			if String(calendar[k].get("comp", "")) == CopaLiga.COMP \
					and int(calendar[k].get("cup_idx", -1)) == i:
				ci = k
				break
		if ci < 0 or ci >= resume_idx:
			break
		var opp: String = String(copaliga_state["opps"][i])
		var home: bool = bool(copaliga_state["homes"][i])
		var s: Array = _sim_score(player_team_id if home else opp, opp if home else player_team_id)
		var tg: int = int(s[0]) if home else int(s[1])
		var rg: int = int(s[1]) if home else int(s[0])
		_resolve_copaliga(opp, tg, rg)
		calendar[ci]["dead"] = true
		calendar[ci]["played"] = true
		calendar[ci]["gf"] = tg
		calendar[ci]["gc"] = rg













func _relocate_catch_up_euro(resume_idx: int) -> void:




	for i in mini(resume_idx, calendar.size()):
		var fp: Dictionary = calendar[i]
		var cp: String = String(fp.get("comp", ""))
		if String(fp.get("round", "")) != "previa" or not EURO_COMPS.has(cp) \
				or bool(fp.get("dead", false)) or String(fp.get("opp", "")).is_empty():
			continue
		var pv: Dictionary = euro_state(cp).get("previa", {})
		if pv.is_empty():
			continue


		pv["antes_de_llegar"] = true
		var t: Dictionary =(europa_previa()["cruces"].get(String(pv["k"]), []) as Array)[int(pv["i"])]
		var pasa: bool = String(t.get("winner", "")) == player_team_id
		_resolve_euro_previa(cp, int(fp.get("leg", 1)), 1 if pasa else 0, 0 if pasa else 1)
		fp["dead"] = true
		fp["played"] = true
		fp["gf"] = 1 if pasa else 0
		fp["gc"] = 0 if pasa else 1
	for comp in EURO_COMPS:
		var state: Dictionary = euro_state(comp)
		if not bool(state.get("playing", false)):
			continue
		for i in resume_idx:
			var f: Dictionary = calendar[i]
			if String(f.get("comp", "")) != String(comp):
				continue


			if String(f.get("round", "")) != "grupo":
				continue
			var r: int = int(f.get("euro_round", -1))
			var opp: String = String(f.get("opp", ""))
			if r < 0 or opp.is_empty():
				continue
			var home: bool = bool(f.get("home", false))
			var s: Array = _sim_score(player_team_id if home else opp,
				opp if home else player_team_id)
			var tg: int = int(s[0]) if home else int(s[1])
			var rg: int = int(s[1]) if home else int(s[0])
			_resolve_euro_group(String(comp), r, tg, rg)
			f["dead"] = true
			f["played"] = true
			f["gf"] = tg
			f["gc"] = rg





func _build_league(entries: Array) -> int:
	var rivals: Array = _league_rivals()
	var keys: Array = [YOU_KEY]
	for t in rivals:
		keys.append(String(t["id"]))
	league_table = {}
	league_form = {}
	comp_form = {}
	for k in keys:
		league_table[k] = _blank_row()




		league_table[k]["pts"] = - Career.sancion_pts(String(k))

	league_schedule = Schedule.league(keys)
	var total: int = league_schedule.size()
	var torneos: bool = _liga_en_torneos(keys.size())
	for r in total:
		for pair in league_schedule[r]:
			if String(pair[0]) != YOU_KEY and String(pair[1]) != YOU_KEY:
				continue
			var home: bool = String(pair[0]) == YOU_KEY
			var opp: String = String(pair[1]) if home else String(pair[0])
			var e: Dictionary = {"comp": "league", "opp": opp, "home": home,
				"round_idx": r, "round": "liga", "dead": false,
				"label": "LIGA · J%d/%d" % [r + 1, total],
				"week": CalendarioMundo.semana_liga(r)}





			if torneos:
				e["label"] = Liguilla.etiqueta_jornada(r, total)
				e["torneo"] = Liguilla.torneo_de_jornada(r, total)
			entries.append(e)
			break
	return total


const CUP_NAMES: Array[String] = ["Octavos", "Cuartos", "Semifinal", "Final"]










func cup_pool(country: String, excluir: String) -> Dictionary:
	var pool: Array = []
	for t in Teams.teams_of_country(country):
		if String(t["id"]) != excluir:
			pool.append(String(t["id"]))
	if pool.is_empty():
		return {"size": 0, "pool": []}


	var size: int = 2
	while size * 2 <= mini(pool.size() + 1, 16):
		size *= 2







	pool.sort_custom(func(a, b):
		var da: int = div_of(String(a))
		var db: int = div_of(String(b))
		if da != db:
			return da < db
		return Teams.rating(String(a)) > Teams.rating(String(b)))
	return {"size": size, "pool": pool.slice(0, maxi(size - 1, int(float(size) * 1.5)))}








func cup_sembrado(country: String) -> Array:
	var out: Array = []
	for d in range(1, Teams.max_div(country) + 1):
		var ids: Array = []
		for t in teams_in_div(country, d):
			ids.append(String(t["id"]))
		if d == 1:
			var jugado: Array = []
			for id in _orden_1a_jugado(country):
				if ids.has(String(id)):
					jugado.append(String(id))
			for id in ids:
				if not jugado.has(id):
					jugado.append(id)
			ids = jugado
		out.append(ids)
	return out



















func _build_cup(entries: Array, league_len: int) -> void:
	cup_state = {}
	if not FormatoCopa.tiene(Teams.country_of(player_team_id), FormatoCopa.COPA):
		return
	_copa_real_arma("cup", entries, league_len)





func _copa_st(comp: String) -> Dictionary:
	return copaliga_state if comp == CopaLiga.COMP else cup_state








func _copa_real_arma(comp: String, entries: Array, league_len: int) -> void:
	var liga: bool = comp == CopaLiga.COMP
	var pais: String = Teams.country_of(player_team_id)
	var st: Dictionary = FormatoCopa.nuevo(pais, FormatoCopa.LIGA if liga else FormatoCopa.COPA,
		cup_sembrado(pais), "" if liga else player_team_id)
	if st.is_empty():
		return



	st["tuyo"] = player_team_id


	var field0: Array = []
	for ro in st["rondas"]:
		for id in (ro as Dictionary).get("nuevos", []):
			field0.append(String(id))
	if not field0.has(player_team_id):
		return
	var cs: Dictionary = {"fmt": st, "alive": true, "champion": false, "winner": "",
		"field0": field0, "field": [], "names": [], "idx": 0, "entra": 0,
		"opps": [], "homes": [], "bracket": []}
	if liga:

		cs["season"] = season_num
		copaliga_state = cs
	else:
		cup_state = cs
	_copa_hasta_tu_ronda(comp)
	var rondas: Array = st["rondas"]
	var entra: int = int(st["r"])
	cs["entra"] = entra
	var names: Array = []
	for r in range(entra, rondas.size()):
		names.append(String(rondas[r]["n"]))
	cs["names"] = names
	if names.is_empty():

		cs.clear()
		return
	var rotulo: String = CopaLiga.NOMBRE if liga else "COPA"
	var ocupadas: Array = _semanas_ocupadas(entries) if liga else []
	var fifa: Array = _semanas_fifa(entries) if liga else []
	var previa: float = - INF
	for s in FormatoCopa.agenda(pais, rondas, league_len):
		var r: int = int(s["r"])
		if r < entra:
			continue
		var ro: Dictionary = rondas[r]
		var doble: bool = int(ro.get("p", 1)) == 2 and not ro.has("g")
		var w: float = float(s["week"])
		if liga:
			var w_ag: float = w
			var desde: float = maxf(w_ag, previa + Supercopas.SEP_PROPIA)
			w = float(Supercopas.hueco(ocupadas, fifa, desde, 1, Supercopas.SEP_PROPIA)[0])







			if w > desde + 1.0:
				var cerca: float = _copaliga_cerca(entries, fifa, w_ag, previa, league_len, pais)
				if cerca >= 0.0:
					w = cerca
			ocupadas.append(w)
			previa = w




		var tramo: String = String(ro["n"]).to_upper()
		if ro.has("g"):
			tramo = "GRUPO J%d/%d" % [int(s["jor"]) + 1, int(ro.get("jornadas", 1))]
		elif doble:
			tramo += " (IDA)" if int(s["leg"]) == 0 else " (VUELTA)"
		var e: Dictionary = {"comp": comp, "cup_idx": r - entra,

			"leg": int(s["leg"]) if doble else 1,
			"round": String(ro["n"]), "dead": false, "opp": "", "home": true,
			"label": "%s · %s" % [rotulo, tramo], "week": w,


			"des": FormatoCopa.desempate(ro),
			"neutral": FormatoCopa.es_neutral(ro, r == rondas.size() - 1)}
		if ro.has("g"):
			e["jor"] = int(s["jor"])
		entries.append(e)
	_copa_sync(comp)
	_copa_pinta(entries, comp)




















const COPALIGA_VENTANA: float = 1.5
const COPALIGA_SEP_MUERTA: float = 0.2

func _copaliga_cerca(entries: Array, fifa: Array, w_ag: float, previa: float,
		league_len: int = 0, pais: String = "") -> float:
	var minimo: float = previa + Supercopas.SEP_PROPIA
	var meta: int = CalendarioMundo.tramo_de(w_ag, league_len, pais) if league_len > 0 else -1
	var ultima: float = - INF
	for e in entries:
		if String((e as Dictionary).get("comp", "")) == "league":
			ultima = maxf(ultima, float((e as Dictionary).get("week", 0.0)))
	for pasada in 6:
		var en_mes: bool = pasada == 2 or pasada == 3
		if en_mes and meta < 0:
			continue
		var ventana: float = COPALIGA_VENTANA if pasada < 2 else 1000.0
		var con_muertas: bool = pasada % 2 == 1
		var mejor: float = -1.0



		var desde: float = minimo if en_mes else maxf(w_ag - COPALIGA_VENTANA, minimo)
		var k0: int = maxi(floori(desde), 0)
		var k1: int = floori(minf(w_ag + ventana, ultima))
		for k in range(k0, k1 + 1):

			for paso in 9:
				var c: float = snappedf(float(k) + 0.3 + 0.05 * float(paso), 0.01)
				if c < desde - 0.001 or c >= ultima or absf(c - w_ag) > ventana:
					continue
				if en_mes and CalendarioMundo.tramo_de(c, league_len, pais) != meta:
					continue
				if mejor >= 0.0 and absf(c - w_ag) >= absf(mejor - w_ag) - 0.001:
					continue
				if _copaliga_libre(entries, fifa, c, con_muertas):
					mejor = c
		if mejor >= 0.0:
			return mejor
	return -1.0


func _copaliga_libre(entries: Array, fifa: Array, c: float, con_muertas: bool) -> bool:
	for o in fifa:
		if absf(float(o) - c) < Supercopas.SEP_FIFA or floori(float(o)) == floori(c):
			return false
	for e in entries:
		var d: float = absf(float((e as Dictionary).get("week", 0.0)) - c)
		var sep: float = Supercopas.SEP_AJENA
		if con_muertas and bool((e as Dictionary).get("dead", false)):
			sep = COPALIGA_SEP_MUERTA
		if d < sep - 0.001:
			return false
	return true





func _copa_hasta_tu_ronda(comp: String = "cup") -> void:
	var st: Dictionary = _copa_st(comp)["fmt"]


	if not st.has("tuyo"):
		st["tuyo"] = player_team_id
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	var tope: int = 64
	while not FormatoCopa.terminado(st) and tope > 0:
		tope -= 1
		FormatoCopa.sortea(st, rng)
		if FormatoCopa.participantes(st, int(st["r"])).has(player_team_id):
			return
		if FormatoCopa.es_grupo(st):
			for k in (FormatoCopa.grupos_de(st).get("jornadas", []) as Array).size():
				FormatoCopa.juega_jornada(st, k, _copa_partido)
			FormatoCopa.cierra_grupos(st)
		else:
			FormatoCopa.cierra(st, _copa_decide)





func _copa_decide(a: String, b: String, ro: Dictionary) -> Dictionary:
	var w: String = _cup_tie_winner(a, b)
	if int(ro.get("p", 1)) == 2:
		var s: Array = _euro_two_leg_scores(a, b, w, "cup")
		return {"winner": w, "leg1": String(s[0]), "leg2": String(s[1]), "score": String(s[2])}
	var neutral: bool = FormatoCopa.es_neutral(ro, String(ro.get("n", "")) == "Final")
	return {"winner": w, "score": _euro_tie_score(a, b, w, neutral, "cup")}



func _copa_partido(a: String, b: String) -> Array:
	return _sim_score(a, b, false, "cup")



func _copa_tu_cruce(st: Dictionary, r: int) -> Dictionary:
	var br: Array = st.get("bracket", [])
	if r < 0 or r >= br.size():
		return {}
	for t in br[r]:
		if String(t.get("a", "")) == player_team_id or String(t.get("b", "")) == player_team_id:
			return t
	return {}





func _copa_sync(comp: String = "cup") -> void:
	var cs: Dictionary = _copa_st(comp)
	var st: Dictionary = cs.get("fmt", {})
	if st.is_empty():
		return
	var entra: int = int(cs.get("entra", 0))
	cs["bracket"] =(st["bracket"] as Array).slice(entra)
	cs["field"] =(st["vivos"] as Array).duplicate()
	if bool(cs.get("alive", false)):
		cs["idx"] = clampi(int(st["r"]) - entra, 0,(cs.get("names", []) as Array).size())
	if FormatoCopa.terminado(st):
		cs["winner"] = String(st.get("winner", ""))





func _copa_pinta(cal: Array, comp: String = "cup") -> void:
	var cs: Dictionary = _copa_st(comp)
	var st: Dictionary = cs.get("fmt", {})
	if st.is_empty() or not bool(cs.get("alive", false)):
		return
	var entra: int = int(cs.get("entra", 0))
	var r: int = int(st["r"])
	var sorteada: bool =(st["bracket"] as Array).size() > r
	var ro: Dictionary = FormatoCopa.ronda(st, r)
	var t: Dictionary = _copa_tu_cruce(st, r)
	for e in cal:
		if String(e.get("comp", "")) != comp or bool(e.get("played", false)):
			continue
		var er: int = entra + int(e.get("cup_idx", 0))
		if er < r:
			e["dead"] = true
			continue
		if er > r or not sorteada:
			continue
		if ro.has("g"):
			var p: Dictionary = FormatoCopa.partido_de(st, player_team_id, int(e.get("jor", 0)))
			if p.is_empty():
				e["dead"] = true
			else:
				e["opp"] = String(p["opp"])
				e["home"] = bool(p["home"])
			continue
		if t.is_empty():
			e["dead"] = true
			continue
		var local: bool = String(t["a"]) == player_team_id
		e["opp"] = String(t["b"]) if local else String(t["a"])
		e["home"] = local if int(ro.get("p", 1)) != 2 or int(e.get("leg", 1)) < 1 else not local





func _resolve_copa_real(opp: String, tg: int, rg: int, f: Dictionary,
		comp: String = "cup") -> void:
	var st: Dictionary = _copa_st(comp)["fmt"]
	var r: int = int(st["r"])
	var ro: Dictionary = FormatoCopa.ronda(st, r)
	var yo: String = player_team_id
	if ro.has("g"):
		var k: int = int(f.get("jor", 0))
		var jornadas: Array = FormatoCopa.grupos_de(st).get("jornadas", [])

		for j in mini(k, jornadas.size()):
			FormatoCopa.juega_jornada(st, j, _copa_partido)
		if bool(f.get("home", true)):
			FormatoCopa.pon_resultado(st, k, yo, opp, tg, rg)
		else:
			FormatoCopa.pon_resultado(st, k, opp, yo, rg, tg)
		FormatoCopa.juega_jornada(st, k, _copa_partido)
		_copa_log_jornada(st, k)
		for j in range(k + 1, jornadas.size()):
			if not FormatoCopa.partido_de(st, yo, j).is_empty():
				_copa_sync(comp)
				return
		for j in jornadas.size():
			FormatoCopa.juega_jornada(st, j, _copa_partido)
		FormatoCopa.cierra_grupos(st)
		_copa_tras_ronda((st["vivos"] as Array).has(yo), opp, tg, rg, comp)
		return
	var t: Dictionary = _copa_tu_cruce(st, r)
	if t.is_empty():
		return
	var soy_a: bool = String(t["a"]) == yo
	var doble: bool = int(ro.get("p", 1)) == 2
	if doble and int(f.get("leg", 1)) < 1:
		t["leg1"] = "%d-%d" %([tg, rg] if soy_a else [rg, tg])




		_log_comp_form(comp, yo, "G" if tg > rg else ("P" if tg < rg else "E"))
		_log_comp_form(comp, opp, "G" if rg > tg else ("P" if rg < tg else "E"))
		_copa_sync(comp)
		return
	var prev: Array = your_first_leg(f) if doble else []
	var mios: int = tg +(int(prev[0]) if prev.size() == 2 else 0)
	var suyos: int = rg +(int(prev[1]) if prev.size() == 2 else 0)
	var won: bool = _knockout_won(opp, mios, suyos)
	t["winner"] = yo if won else opp
	if doble:
		t["leg2"] = "%d-%d" %([tg, rg] if soy_a else [rg, tg])
	t["score"] = "%d-%d" %([mios, suyos] if soy_a else [suyos, mios])
	FormatoCopa.cierra(st, _copa_decide)

	for x in (st["bracket"] as Array)[r]:
		var sc: PackedStringArray = String(x.get("leg2" if doble else "score", "")).split("-")
		if sc.size() == 2:
			_log_round_result(String(x["a"]), String(x["b"]), int(sc[0]), int(sc[1]), x == t)
	_copa_tras_ronda(won, opp, tg, rg, comp)



func _copa_log_jornada(st: Dictionary, k: int) -> void:
	var gr: Dictionary = FormatoCopa.grupos_de(st)
	var js: Array = gr.get("jornadas", [])
	if k < 0 or k >= js.size():
		return
	for j in (js[k] as Array).size():
		var p: Array = js[k][j]
		var s: Array = gr["res"][k][j]
		if s.size() == 2:
			_log_round_result(String(p[0]), String(p[1]), int(s[0]), int(s[1]),
				String(p[0]) == player_team_id or String(p[1]) == player_team_id,
				FormatoCopa.grupo_de(st, String(p[0])))




func _copa_tras_ronda(won: bool, opp: String, tg: int, rg: int, comp: String = "cup") -> void:
	var cs: Dictionary = _copa_st(comp)
	var liga: bool = comp == CopaLiga.COMP
	var st: Dictionary = cs["fmt"]
	var names: Array = cs.get("names", [])
	var idx: int = int(cs.get("idx", 0))


	_queue_cup_room("cup", names, idx, won, opp, tg, rg, idx +(1 if won else 0), "",
		I18n.t(CopaLiga.NOMBRE) if liga else "")
	if not won:
		cs["alive"] = false
		var rng: RandomNumberGenerator = RandomNumberGenerator.new()
		rng.randomize()
		FormatoCopa.simula_hasta_el_final(st, rng, _copa_decide, _copa_partido)
		_copa_sync(comp)
		_kill_future(comp)
		return
	_copa_hasta_tu_ronda(comp)
	_copa_sync(comp)
	if FormatoCopa.terminado(st) and String(st.get("winner", "")) == player_team_id:
		cs["champion"] = true
		_crown(CopaLiga.TITULO if liga else "Campeón de Copa")
		return
	_copa_pinta(calendar, comp)





func _cup_draw() -> void:
	var field: Array = cup_state.get("field", [])
	if field.size() < 2:
		return
	var bag: Array = field.duplicate()
	bag.shuffle()
	var ties: Array = []
	for i in range(0, bag.size() - 1, 2):
		ties.append([String(bag[i]), String(bag[i + 1])])
	cup_state["ties"] = ties



	var drawn: Array = []
	for tie in ties:
		drawn.append({"a": String(tie[0]), "b": String(tie[1]),
			"winner": "", "score": ""})
	cup_state.get("bracket", []).append(drawn)
	for tie in ties:
		if String(tie[0]) == player_team_id or String(tie[1]) == player_team_id:
			var you_first: bool = String(tie[0]) == player_team_id
			cup_state["opps"].append(String(tie[1]) if you_first else String(tie[0]))

			cup_state["homes"].append(you_first)
			break



















func _cup_tie_winner(a: String, b: String) -> String:
	return a if randf() < tie_p(a, b) else b

















static func tie_p(a: String, b: String, fz: Dictionary = {}) -> float:
	var ra: float = pow(maxf(fuerza_o(a, fz) - 45.0, 1.0), 2.0)
	var rb: float = pow(maxf(fuerza_o(b, fz) - 45.0, 1.0), 2.0)
	return ra /(ra + rb)





static func fuerza_o(id: String, fz: Dictionary) -> float:
	return float(fz[id]) if fz.has(id) else Squad.fuerza_sim(id)




func _cup_advance_field(you_won: bool, tg: int = -1, rg: int = -1) -> void:
	var survivors: Array = []
	var bracket: Array = cup_state.get("bracket", [])


	var slot: Array = bracket[bracket.size() - 1] if not bracket.is_empty() else []
	var ties: Array = cup_state.get("ties", [])
	for i in ties.size():
		var a: String = String(ties[i][0])
		var b: String = String(ties[i][1])
		var w: String
		var score: String = ""
		if a == player_team_id or b == player_team_id:
			var opp: String = b if a == player_team_id else a
			w = player_team_id if you_won else opp
			if tg >= 0:
				score = "%d-%d" %([tg, rg] if a == player_team_id else [rg, tg])
		else:
			w = _cup_tie_winner(a, b)







			score = _euro_tie_score(a, b, w, ties.size() <= 1, "cup")
		survivors.append(w)
		if i < slot.size():
			slot[i]["winner"] = w
			slot[i]["score"] = score



		var sc: PackedStringArray = score.split("-")
		if sc.size() == 2:
			_log_round_result(a, b, int(sc[0]), int(sc[1]),
				a == player_team_id or b == player_team_id)
	cup_state["field"] = survivors





func _cup_sim_to_end() -> void:
	while int(cup_state.get("field", []).size()) > 1:
		var alive: Array = cup_state["field"]
		var next: Array = []
		var drawn: Array = []


		var es_final: bool = alive.size() <= 2
		for i in range(0, alive.size() - 1, 2):
			var a: String = String(alive[i])
			var b: String = String(alive[i + 1])
			var w: String = _cup_tie_winner(a, b)
			next.append(w)
			drawn.append({"a": a, "b": b, "winner": w,
				"score": _euro_tie_score(a, b, w, es_final, "cup")})
		cup_state["field"] = next
		cup_state.get("bracket", []).append(drawn)
	var f: Array = cup_state.get("field", [])
	cup_state["winner"] = String(f[0]) if not f.is_empty() else ""



func _cup_apply_draw(idx: int) -> void:
	if idx >= int(cup_state["opps"].size()):
		return
	for e in calendar:
		if String(e.get("comp", "")) == "cup" and int(e.get("cup_idx", -1)) == idx:
			e["opp"] = String(cup_state["opps"][idx])
			e["home"] = bool(cup_state["homes"][idx])
			break












const CWC_GROUPS: int = 8
const CWC_GROUP_SIZE: int = 4




const CWC_QUALIFY: int = 2
const CWC_KO_NAMES: Array[String] = ["Octavos", "Cuartos", "Semifinal", "Final"]

const CWC_DATES: int = 7





const CWC_EVERY: int = 4
const CWC_FIELD: int = 32


const CWC_CONFED_SLOTS: Dictionary = {
	"UEFA": 12, "CONMEBOL": 6, "CONCACAF": 4, "AFC": 4, "CAF": 4, "OFC": 1,
}






























const CWC_HOST_COUNTRIES: Array[String] = [
	"Arabia Saudí", "Brasil", "Marruecos", "Japón", "México", "Estados Unidos",
]



const CWC_MAX_POR_PAIS: int = 2



















const CWC_CAMPEONES_TEMPORADA_0: Dictionary = {
	"UEFA": "pari", "CONMEBOL": "fla", "CONCACAF": "caz", "AFC": "ala",
	"CAF": "egy_pyr", "OFC": "nzl_akc",
}




func is_cwc_season(season: int) -> bool:
	return season > 0 and season % CWC_EVERY == 0




func cwc_spot_after_close(had_spot: bool, closed_season: int, won_continental: bool) -> bool:
	return (had_spot and not is_cwc_season(closed_season)) or won_continental


















const CWC_ELITE_RATING: int = 95


















func _build_cwc(entries: Array, tail: float) -> void:
	if not is_cwc_season(season_num):
		cwc_state = {}
		return
	var elite: bool = Teams.rating(player_team_id) >= CWC_ELITE_RATING
	if not (club_wc_qualified or elite) or player_div() != 1:
		cwc_state = {}
		return




	var pool: Array = []
	for id in cwc_field(season_num - 1, "", player_team_id):
		pool.append(String(id))
	if pool.size() < CWC_GROUPS * CWC_GROUP_SIZE - 1:
		cwc_state = {}
		return
	pool.shuffle()

	var all_keys: Array = [YOU_KEY]
	for id2 in pool:
		all_keys.append(String(id2))
	all_keys.resize(mini(all_keys.size(), CWC_GROUPS * CWC_GROUP_SIZE))
	var groups: Array = []
	for gi in range(0, all_keys.size(), CWC_GROUP_SIZE):
		var keys: Array = all_keys.slice(gi, gi + CWC_GROUP_SIZE)
		if keys.size() < 2:
			break
		var table: Dictionary = {}
		for k in keys:
			table[String(k)] = _blank_row()



		groups.append({"keys": keys, "table": table,
			"schedule": Schedule.single_round_robin(keys)})
	var sched: Array = groups[0]["schedule"]





	cwc_state = {"playing": true, "comp": "cwc", "groups": groups,
		"league_phase": false, "seeds": [],
		"advanced": false, "alive": true, "champion": false,
		"ko_names": CWC_KO_NAMES.duplicate(), "ko_opps": [], "ko_idx": 0,
		"bracket": [], "winner": ""}



	for r in sched.size():
		for pair in sched[r]:
			if String(pair[0]) != YOU_KEY and String(pair[1]) != YOU_KEY:
				continue
			var home: bool = String(pair[0]) == YOU_KEY
			var opp: String = String(pair[1]) if home else String(pair[0])
			entries.append({"comp": "cwc", "opp": opp, "home": home,
				"round": "grupo", "euro_round": r, "dead": false,
				"label": "MUNDIAL DE CLUBES · GRUPO J%d/%d" % [r + 1, sched.size()],
				"week": tail + float(r)})
			break


	for i in CWC_KO_NAMES.size():
		entries.append({"comp": "cwc", "opp": "", "home": i % 2 == 1,
			"round": CWC_KO_NAMES[i], "ko_idx": i, "dead": true,
			"label": "MUNDIAL DE CLUBES · %s" % CWC_KO_NAMES[i].to_upper(),
			"week": tail + float(sched.size() + i)})










const UCL_KO_NAMES: Array[String] = ["Playoff", "Octavos", "Cuartos", "Semifinal", "Final"]













func ucl_field(count: int) -> Array:

	if previas_vivas():
		return _campo_uefa("ucl", count)





	var field: Array = _euro_field(0, count)
	_force_euro_berth(field, last_ucl_winner)
	_force_euro_berth(field, last_eul_winner)
	_force_euro_berth(field, last_league_champion)
	return field





func eul_field(count: int) -> Array:


	if previas_vivas():
		return _campo_uefa("uel", count)
	return _euro_field(1, count)




func conf_field(count: int) -> Array:
	if previas_vivas():
		return _campo_uefa("uecl", count)
	return _euro_field(2, count)





func _campo_uefa(comp: String, count: int) -> Array:
	var out: Array = []
	for id in campos_uefa().get(comp, []):
		var t: Dictionary = Teams.by_id(String(id))
		if not t.is_empty():
			out.append(t)
	return out.slice(0, count)





























func euro_qualification(pdiv: int, pos: int, country: String,
		won_ucl: bool, won_eul: bool, won_cup: bool,
		won_conf: bool = false, next_div: int = -1) -> Dictionary:
	var euros: Array = _euro_ranked()
	var ucl_cut: int = int(_tier_slots(euros, 0).get(country, 0))




	if ucl_cut > 0 and (Teams.country_of(last_ucl_winner) == country
			or Teams.country_of(last_eul_winner) == country):
		var picks0: Array = _tramos_de_pais(country, [_tier_slots(euros, 0)],
			_title_promoted(), 0)[0]
		var orden: Array = _country_order(country).filter(func(id):
			return not Career.vetado_europa(String(id), season_num))
		var prefijo: int = 0
		while prefijo < orden.size() and picks0.has(String(orden[prefijo])):
			prefijo += 1
		ucl_cut = mini(ucl_cut, prefijo)
	var eul_cut: int = int(_tier_slots(euros, 1).get(country, 0))
	var conf_cut: int = int(_tier_slots(euros, 2).get(country, 0))
	var ucl: bool = false
	var eul: bool = false
	var conf: bool = false
	if pdiv == 1:
		ucl = pos <= ucl_cut
		eul = pos > ucl_cut and pos <= ucl_cut + eul_cut
		conf = pos > ucl_cut + eul_cut and pos <= ucl_cut + eul_cut + conf_cut
	if won_ucl or won_eul:
		ucl = true
	if won_conf or won_cup:
		eul = true


	var div_next: int = next_div if next_div > 0 else pdiv
	if not Teams.is_european(country) or div_next != 1:
		ucl = false
		eul = false
		conf = false

	if ucl:
		eul = false
		conf = false
	elif eul:
		conf = false
	return {"ucl": ucl, "eul": eul, "conf": conf,
		"ucl_cut": ucl_cut, "eul_cut": eul_cut, "conf_cut": conf_cut}



































func _tier_slots(euros: Array, tier: int) -> Dictionary:
	var counts: Array[int] = [UCL_FIELD, EUL_FIELD, CONF_FIELD]
	if tier == 0:
		return _ucl_access_slots(euros)
	if tier == 1:
		return _access_slots(euros, EUL_FIELD, EUL_ACCESS, EUL_ACCESS_TAIL)
	var ucl: Dictionary = _ucl_access_slots(euros)
	var eul: Dictionary = _access_slots(euros, EUL_FIELD, EUL_ACCESS, EUL_ACCESS_TAIL)
	var slots: Dictionary = {}
	for c in euros:
		slots[String(c)] = 0
	var left: int = counts[2]


	for i in range(euros.size() - 1, -1, -1):
		if left <= 0:
			break
		var c1: String = String(euros[i])
		if int(ucl.get(c1, 0)) + int(eul.get(c1, 0)) > 0:
			continue
		slots[c1] = 1
		left -= 1

	for i in euros.size():
		if left <= 0:
			break
		var c2: String = String(euros[i])
		if int(slots[c2]) > 0:
			continue
		slots[c2] = 1
		left -= 1

	for i in range(euros.size() - 1, -1, -1):
		if left <= 0:
			break
		var c3: String = String(euros[i])
		if int(slots[c3]) != 1:
			continue
		slots[c3] = 2
		left -= 1
	return slots







func _euro_eligible() -> bool:
	return Teams.is_european(Teams.country_of(player_team_id)) and player_div() == 1


















func adopt_club_euro_berth() -> void:
	qualified_ucl = false
	qualified_eul = false
	qualified_conf = false
	if not _euro_eligible():
		return
	if _in_euro_field(ucl_field(UCL_FIELD)):
		qualified_ucl = true
	elif _in_euro_field(eul_field(EUL_FIELD)):
		qualified_eul = true
	elif _in_euro_field(conf_field(CONF_FIELD)):
		qualified_conf = true




func _in_euro_field(field: Array) -> bool:
	return field.any(func(t): return String(t.get("id", "")) == player_team_id)










func _euro_field(tier: int, count: int) -> Array:
	var euros: Array = _euro_ranked()

	var slots: Array[Dictionary] = []
	for t in range(tier + 1):
		slots.append(_tier_slots(euros, t))








	var subidos: Dictionary = _title_promoted()
	var field: Array = []
	for c in euros:
		var picks: Array = _tramos_de_pais(String(c), slots, subidos, tier)[tier]
		for id in picks:
			var club: Dictionary = Teams.by_id(String(id))
			if not club.is_empty():
				field.append(club)



	var i: int = field.size() - 1
	while field.size() > count and i >= 0:
		var id_i: String = String(field[i].get("id", ""))
		if id_i != player_team_id and int(subidos.get(id_i, -1)) != tier:
			field.remove_at(i)
		i -= 1
	return field

















func _tramos_de_pais(c: String, slots: Array, subidos: Dictionary, hasta: int) -> Array:



	var order: Array = _country_order(c).filter(func(id):
		return not Career.vetado_europa(String(id), season_num))
	var usados: Dictionary = {}
	var out: Array = []
	for t in range(hasta + 1):
		var picks: Array = []
		for id in subidos:
			if int(subidos[id]) == t and not usados.has(id) and Teams.country_of(String(id)) == c:
				picks.append(String(id))
				usados[id] = true
		var take: int = int((slots[t] as Dictionary).get(c, 0))
		for id in order:
			if picks.size() >= take:
				break
			var sid: String = String(id)
			if usados.has(sid) or int(subidos.get(sid, 99)) < t:
				continue

			picks.append(sid)
			usados[sid] = true
		out.append(picks)
	return out







func _title_promoted() -> Dictionary:
	var out: Dictionary = {}
	for id in [last_ucl_winner, last_eul_winner, last_league_champion]:
		if _berth_eligible(String(id)):
			out[String(id)] = 0
	if _berth_eligible(last_conf_winner) and not out.has(last_conf_winner):
		out[last_conf_winner] = 1
	return out






func _berth_eligible(club_id: String) -> bool:
	if club_id.is_empty():
		return false
	var club: Dictionary = Teams.by_id(club_id)

	return not club.is_empty() \
			and Teams.is_european(String(club.get("country", ""))) \
			and div_of(club_id) == 1 \
			and not Career.vetado_europa(club_id, season_num)




func _vetados_encima(standings: Array, pos: int, season: int) -> int:
	var n: int = 0
	for i in mini(pos - 1, standings.size()):
		var key: String = String((standings[i] as Dictionary).get("key", ""))
		if key != YOU_KEY and Career.vetado_europa(key, season):
			n += 1
	return n




func _force_euro_berth(field: Array, club_id: String) -> void:
	if club_id.is_empty():
		return
	if field.any(func(t): return String(t["id"]) == club_id):
		return
	if not _berth_eligible(club_id):
		return





	for i in range(field.size() - 1, -1, -1):
		if String(field[i]["id"]) != player_team_id:
			field.remove_at(i)
			break
	field.append(Teams.by_id(club_id))














func tick_nat_coef(winner: String, kind: String) -> void:

	for k in nat_coef.keys():
		var v: float = float(nat_coef[k]) *(1.0 - NAT_COEF_DECAY)
		if absf(v) < 0.05:
			nat_coef.erase(k)
		else:
			nat_coef[k] = v

	var pts: float = NAT_COEF_WC if kind == "wc" else NAT_COEF_CONT
	if not winner.is_empty():
		_add_nat_coef(winner, pts)


	if kind == "wc" and not winner.is_empty() \
			and not Nations.by_id(winner).is_empty():
		campeon_mundial = Nations.canon_id(winner)
	_save()


func _add_nat_coef(id: String, pts: float) -> void:
	var key: String = Nations.id_for_country(id)
	if Nations.by_id(key).is_empty():
		return
	nat_coef[key] = clampf(float(nat_coef.get(key, 0.0)) + pts,
		- NAT_COEF_CAP, NAT_COEF_CAP)




func _euro_ranked() -> Array:
	var euros: Array = Teams.euro_countries()


	if previas_vivas():
		var orden: Array = []
		for a in europa_cupos().get("ranking", []):
			if euros.has(a):
				orden.append(a)
		for c in euros:
			if not orden.has(c):
				orden.append(c)
		return orden
	var coeff: Dictionary = {}
	for c in euros:
		coeff[c] = _country_coeff(String(c))
	euros.sort_custom(func(a, b):
		if not is_equal_approx(float(coeff[a]), float(coeff[b])):
			return float(coeff[a]) > float(coeff[b])
		return String(a) < String(b))
	return euros







func _country_coeff(country: String) -> float:
	var sum: float = _country_strength(country) * COEFF_STRENGTH_W
	for t in Teams.teams_of_country(country):
		var p: Dictionary = Palmares.of(String(t["id"]))




		sum += float(p.get("champions", 0)) * COEFF_CHAMPIONS_W \
				+ float(mini(int(p.get("liga", 0)), COEFF_LEAGUE_CAP)) * COEFF_LEAGUE_W
	return sum







func _country_strength(country: String) -> float:


	var clubs: Array = teams_in_div(country, 1)
	if clubs.is_empty():
		return 0.0
	var n: int = mini(COEFF_STRENGTH_TOP, clubs.size())
	var sum: float = 0.0
	for i in n:
		sum += float(clubs[i].get("rating", 0))
	return maxf(sum / float(n) - COEFF_STRENGTH_BASE, 0.0)














func _last_order_country() -> String:
	for id in last_league_order:
		var c: String = Teams.country_of(String(id))
		if not c.is_empty():
			return c
	return ""



func _euro_first_clubs(country: String) -> Array:


	return teams_in_div(country, 1)









func _country_order(country: String) -> Array:
	var clubs: Array = _euro_first_clubs(country)
	var ids: Array = []
	for t in clubs:
		ids.append(String(t["id"]))
	if country == _last_order_country() and not last_league_order.is_empty():


		var rank: Dictionary = {}
		for i in last_league_order.size():
			rank[String(last_league_order[i])] = i
		ids.sort_custom(func(a, b):
			var ra: int = int(rank.get(a, 999))
			var rb: int = int(rank.get(b, 999))
			if ra != rb:
				return ra < rb
			return Teams.rating(String(a)) > Teams.rating(String(b)))
		return ids
	return _sim_country_order(country, ids)






























var _euro_order_cache: Dictionary = {}
var _euro_order_season: int = -1


func _sim_country_order(country: String, ids: Array) -> Array:
	if _euro_order_season != season_num:
		_euro_order_cache.clear()
		_euro_order_season = season_num
	var cached: Variant = _euro_order_cache.get(country)
	if cached != null:



		return _order_by(ids, cached)








	var order: Array = _orden_1a_jugado(country)
	if order.is_empty():






		var table: Array = SimLeague.table(country, 1, maxi(season_num - 1, 0), 1.0,
			teams_in_div_jugada(country, 1))
		for row in table:
			order.append(String(row.get("id", "")))
	_euro_order_cache[country] = order
	return _order_by(ids, order)









func _orden_1a_jugado(country: String) -> Array:
	if int(last_orden_1a.get("season", -1)) == season_num - 1:
		var orden: Array =(last_orden_1a.get("orden", {}) as Dictionary).get(country, [])
		if not orden.is_empty():
			return orden
	if int(last_season_snap.get("season", -1)) != season_num - 1:
		return []
	return (last_season_snap.get("orden_1a", {}) as Dictionary).get(country, [])







func _parse_orden_1a(raw: Variant) -> Dictionary:
	if not (raw is Dictionary) or not (raw as Dictionary).has("orden"):
		return {}
	var orden_raw: Variant =(raw as Dictionary).get("orden", {})
	if not (orden_raw is Dictionary):
		return {}
	var orden: Dictionary = {}
	for pais in orden_raw:
		var ids: Array = []
		var lista: Variant = orden_raw[pais]
		if lista is Array:
			for id in lista:
				ids.append(str(id))
		if not ids.is_empty():
			orden[str(pais)] = ids
	var out: Dictionary = {"season": int((raw as Dictionary).get("season", -1)),
		"orden": orden}



	var d: Dictionary = raw
	if d.has("amer"):
		out["amer"] = int(d.get("amer", 0))


	if d.has("uefa"):
		out["uefa"] = int(d.get("uefa", 0))
	for k in ["copa", "liguilla", "copa_uefa"]:
		if d.get(k) is Dictionary:
			out[k] =(d[k] as Dictionary).duplicate(true)
	return out





func _order_by(ids: Array, order: Array) -> Array:
	var rank: Dictionary = {}
	for i in order.size():
		rank[String(order[i])] = i
	var out: Array = ids.duplicate()
	out.sort_custom(func(a, b):
		var ra: int = int(rank.get(String(a), 999))
		var rb: int = int(rank.get(String(b), 999))
		if ra != rb:
			return ra < rb
		return Teams.rating(String(a)) > Teams.rating(String(b)))
	return out
















func _access_slots(euros_sorted: Array, count: int, table: Array,
		tail: int) -> Dictionary:
	var n: int = euros_sorted.size()
	var slots: Dictionary = {}
	if n == 0:
		return slots
	var used: int = 0
	for i in n:
		var give: int = tail
		for tramo in table:
			if i + 1 <= int(tramo[0]):
				give = int(tramo[1])
				break
		slots[String(euros_sorted[i])] = give
		used += give

	while used > count:
		var quitado: bool = false
		for i in range(n - 1, -1, -1):
			if used <= count:
				break
			var c: String = String(euros_sorted[i])
			if int(slots[c]) <= 0:
				continue
			slots[c] -= 1
			used -= 1
			quitado = true
		if not quitado:
			break

	while used < count:
		var dado: bool = false
		for i in n:
			if used >= count:
				break
			var c2: String = String(euros_sorted[i])
			if int(slots[c2]) >= UCL_MAX_PER_COUNTRY:
				continue
			slots[c2] += 1
			used += 1
			dado = true
		if not dado:
			break
	return slots


















func _ucl_access_slots(euros_sorted: Array) -> Dictionary:
	var slots: Dictionary = _access_slots(euros_sorted, UCL_FIELD,
		UCL_ACCESS, UCL_ACCESS_TAIL)
	var base: Dictionary = slots.duplicate()
	var vistos: Dictionary = {}
	for winner in [last_ucl_winner, last_eul_winner]:
		var wid: String = String(winner)
		if wid.is_empty() or vistos.has(wid) or not _berth_eligible(wid):
			continue
		vistos[wid] = true
		var country: String = Teams.country_of(wid)
		if country.is_empty() or not slots.has(country):
			continue
		if int(slots[country]) >= UCL_MAX_PER_COUNTRY:
			continue
		var orden: Array = _country_order(country).filter(func(id):
			return not Career.vetado_europa(String(id), season_num))
		var puesto: int = orden.find(wid)
		if puesto >= 0 and puesto < int(base[country]):
			continue

		var donor: int = -1
		for i in range(euros_sorted.size() - 1, -1, -1):
			if String(euros_sorted[i]) == country:
				continue
			if int(slots[String(euros_sorted[i])]) >= 2:
				donor = i
				break
		if donor < 0:
			continue
		slots[String(euros_sorted[donor])] -= 1
		slots[country] = int(slots[country]) + 1
	return slots


const EURO_LABEL: Dictionary = {
	"ucl": "CHAMPIONS", "eul": "EUROPA LEAGUE", "conf": "CONFERENCE",
}



const EURO_GROUP_LETTERS: Array[String] = ["A", "B", "C", "D", "E", "F", "G", "H"]












const EURO_LEAGUE_SPOTS: Array[float] = [0.15, 0.1967, 0.2645, 0.31, 0.38, 0.4258, 0.5613, 0.5871]




const EURO_LEAGUE_SPOTS_POR_COMP: Dictionary = {
	"eul": [0.1767, 0.2032, 0.271, 0.3167, 0.3867, 0.4323, 0.5677, 0.5903],
	"conf": [0.2032, 0.271, 0.3167, 0.3867, 0.4323, 0.4548],
}











const EURO_KO_SPOTS: Array[float] = [0.6821, 0.7516, 0.8433, 0.9129, 1.0]






const EURO_KO_FINAL_POR_COMP: Dictionary = {"eul": 0.9613}









const EURO_KO_LEG1_SPOTS: Array[float] = [0.6571, 0.729, 0.82, 0.89, 0.0]



const EURO_KO_TWO_LEGS: Array[bool] = [true, true, true, true, false]




static func euro_league_spots(comp: String) -> Array[float]:
	var out: Array[float] = []
	out.assign(EURO_LEAGUE_SPOTS_POR_COMP.get(comp, EURO_LEAGUE_SPOTS))
	return out





static func euro_ko_spots(comp: String) -> Array[float]:
	var out: Array[float] = []
	out.assign(EURO_KO_SPOTS)
	if EURO_KO_FINAL_POR_COMP.has(comp):
		out[out.size() - 1] = float(EURO_KO_FINAL_POR_COMP[comp])
	return out






















func _build_euro(comp: String, field: Array, entries: Array, league_len: int,
		rellena: Array = []) -> void:
	var matchdays: int = int(EURO_MATCHDAYS.get(comp, EURO_MATCHDAYS_DEFAULT))








	var seed: Dictionary = _euro_seed_pots(comp, field, matchdays)
	if seed.is_empty():


		_build_euro_flat(comp, field, entries, league_len, matchdays, rellena)
		return
	var all_keys: Array = seed["keys"]
	var pots: Array = seed["pots"]
	var pots_count: int = pots.size()
	@warning_ignore("integer_division")
	var per_pot: int = matchdays / pots_count





	var my_country: String = Teams.country_of(player_team_id)
	var you_home: Array = []
	var you_away: Array = []


	var por_pais: Dictionary = {}
	var tope: int = TOPE_RIVALES_PAIS if previas_vivas() else 0
	for p in pots_count:
		var bag: Array = []
		for k in pots[p]:
			if String(k) != YOU_KEY:
				bag.append(String(k))
		_baraja_euro(bag, "%s|%d" % [comp, p])
		var picked: Array = _pick_avoiding_country(bag, per_pot, my_country, por_pais, tope)
		for j in picked.size():
			var as_home: bool =(j % 2 == 0) if per_pot >= 2 else (p % 2 == 0)
			var slot: Dictionary = {"key": String(picked[j]), "pot": p}
			if as_home:
				you_home.append(slot)
			else:
				you_away.append(slot)




	var made: Dictionary = _euro_league_schedule(all_keys, matchdays, you_home, you_away)
	var sched: Array = made["schedule"]
	var you_fixtures: Array = made["you_fixtures"]

	var table: Dictionary = {}
	for k in all_keys:
		table[String(k)] = _blank_row()
	var groups: Array = [{"keys": all_keys, "table": table,
		"league_phase": true, "schedule": sched}]
	var state: Dictionary = {"playing": true, "comp": comp, "groups": groups,
		"league_phase": true,
		"advanced": false, "alive": true, "champion": false,
		"ko_names": UCL_KO_NAMES.duplicate(), "ko_opps": [], "ko_idx": 0,
		"bracket": [], "winner": "", "seeds": []}
	_set_euro_state(comp, state)
	_emit_euro_fixtures(comp, entries, league_len, sched.size(), you_fixtures, rellena)







func _baraja_euro(bag: Array, sal: String) -> void:
	if previas_vivas():
		EuroSim._shuffle(bag, EuroSim._rng("uefa|lp|" + sal, season_num))
	else:
		bag.shuffle()





func _build_euro_flat(comp: String, field: Array, entries: Array,
		league_len: int, matchdays: int, rellena: Array = []) -> void:
	var pool: Array = []
	for t in field:
		if String(t["id"]) != player_team_id:
			pool.append(String(t["id"]))
	if pool.size() < matchdays + 1:
		_set_euro_state(comp, {})
		return
	_baraja_euro(pool, comp + "|plano")
	var all_keys: Array = [YOU_KEY]
	for id in pool:
		all_keys.append(id)
	all_keys.resize(mini(all_keys.size(), EURO_FIELD))
	var table: Dictionary = {}
	for k in all_keys:
		table[String(k)] = _blank_row()
	var sched: Array = Schedule.league_phase(all_keys, matchdays)
	var groups: Array = [{"keys": all_keys, "table": table,
		"league_phase": true, "schedule": sched}]
	var state: Dictionary = {"playing": true, "comp": comp, "groups": groups,
		"league_phase": true,
		"advanced": false, "alive": true, "champion": false,
		"ko_names": UCL_KO_NAMES.duplicate(), "ko_opps": [], "ko_idx": 0,
		"bracket": [], "winner": "", "seeds": []}
	_set_euro_state(comp, state)
	var you_fixtures: Array = []
	for r in sched.size():
		for pair in sched[r]:
			if String(pair[0]) != YOU_KEY and String(pair[1]) != YOU_KEY:
				continue
			var home: bool = String(pair[0]) == YOU_KEY
			you_fixtures.append({"opp": String(pair[1]) if home else String(pair[0]),
				"home": home, "round": r, "pot": -1})
			break
	_emit_euro_fixtures(comp, entries, league_len, sched.size(), you_fixtures, rellena)





func _emit_euro_fixtures(comp: String, entries: Array, league_len: int,
		sched_size: int, you_fixtures: Array, rellena: Array = []) -> void:




	if not rellena.is_empty():
		for fx in you_fixtures:
			for e in rellena:
				if String(e.get("comp", "")) == comp and String(e.get("round", "")) == "grupo" \
						and int(e.get("euro_round", -1)) == int(fx["round"]):
					e["opp"] = String(fx["opp"])
					e["home"] = bool(fx["home"])
					e["pot"] = int(fx["pot"])
					e["dead"] = false
		return

	var pais: String = Teams.country_of(player_team_id)
	for fx in you_fixtures:
		var r: int = int(fx["round"])





		entries.append({"comp": comp, "opp": String(fx["opp"]), "home": bool(fx["home"]),
			"round": "grupo", "euro_round": r, "dead": false, "pot": int(fx["pot"]),
			"label": "%s · LIGA J%d/%d" % [EURO_LABEL[comp], r + 1, sched_size],
			"week": CalendarioMundo.semana_euro_liga(r, league_len, comp, pais)})




















	for i in UCL_KO_NAMES.size():
		var two: bool = CalendarioMundo.euro_ko_dos_partidos(i)
		var name_i: String = UCL_KO_NAMES[i].to_upper()





		if two:
			entries.append({"comp": comp, "opp": "",
				"home": false, "round": UCL_KO_NAMES[i], "ko_idx": i, "leg": 0,
				"dead": true,
				"label": "%s · %s (IDA)" % [EURO_LABEL[comp], name_i],
				"week": CalendarioMundo.semana_euro_ko(i, 0, league_len, comp, pais)})
		entries.append({"comp": comp, "opp": "",
			"home": true if two else i % 2 == 1,
			"round": UCL_KO_NAMES[i], "ko_idx": i, "leg": 1,
			"dead": true,
			"label": "%s · %s%s" % [EURO_LABEL[comp], name_i,
				" (VUELTA)" if two else ""],
			"week": CalendarioMundo.semana_euro_ko(i, 1, league_len, comp, pais)})










func _euro_seed_pots(comp: String, field: Array, matchdays: int) -> Dictionary:
	var pots_count: int = int(EURO_POTS.get(comp, EURO_POTS_DEFAULT))
	if pots_count <= 0 or EURO_FIELD % pots_count != 0 or matchdays % pots_count != 0:
		return {}


	var seen: Dictionary = {}
	var clubs: Array = []
	for t in field:
		var id: String = String((t as Dictionary).get("id", ""))
		if id.is_empty() or seen.has(id):
			continue
		seen[id] = true
		clubs.append(t)
	if not seen.has(player_team_id):
		var me: Dictionary = Teams.by_id(player_team_id)
		if not me.is_empty():
			clubs.append(me)
	if clubs.size() < EURO_FIELD:
		return {}


	if previas_vivas():
		_ordena_por_coef_club(clubs, comp)
	else:
		_ordena_por_liga(clubs)


	var seeded: Array = clubs.slice(0, EURO_FIELD)
	if not seeded.any(func(t): return String(t["id"]) == player_team_id):
		var me2: Dictionary = Teams.by_id(player_team_id)
		if not me2.is_empty():
			seeded[EURO_FIELD - 1] = me2
	@warning_ignore("integer_division")
	var pot_size: int = EURO_FIELD / pots_count
	var all_keys: Array = []
	var pots: Array = []
	var pot_of: Dictionary = {}
	for p in pots_count:
		pots.append([])
	var my_pot: int = 0
	for i in seeded.size():
		var id: String = String(seeded[i]["id"])
		var key: String = YOU_KEY if id == player_team_id else id
		@warning_ignore("integer_division")
		var p: int = mini(i / pot_size, pots_count - 1)
		all_keys.append(key)
		(pots[p] as Array).append(key)
		pot_of[key] = p
		if key == YOU_KEY:
			my_pot = p
	return {"keys": all_keys, "pots": pots, "pot_of": pot_of, "my_pot": my_pot}



func _ordena_por_liga(clubs: Array) -> void:



	var coeff: Dictionary = {}
	var pos: Dictionary = {}
	var order: Dictionary = {}
	for t in clubs:
		var cid: String = String(t["id"])
		var c: String = Teams.country_of(cid)
		if not coeff.has(c):
			coeff[c] = _country_coeff(c)
		if not order.has(c):
			order[c] = _country_order(c)
		var i: int =(order[c] as Array).find(cid)
		pos[cid] = i if i >= 0 else 999
	clubs.sort_custom(func(a, b):
		var ka: float = float(coeff[Teams.country_of(String(a["id"]))])
		var kb: float = float(coeff[Teams.country_of(String(b["id"]))])
		if not is_equal_approx(ka, kb):
			return ka > kb
		var pa: int = int(pos[String(a["id"])])
		var pb: int = int(pos[String(b["id"])])
		if pa != pb:
			return pa < pb
		if int(a["rating"]) != int(b["rating"]):
			return int(a["rating"]) > int(b["rating"])
		return String(a["id"]) < String(b["id"]))






func _ordena_por_coef_club(clubs: Array, comp: String) -> void:
	var coef: Dictionary = europa_cupos().get("coef", {})
	var vigente: Dictionary = {"ucl": last_ucl_winner, "eul": last_eul_winner, "conf": last_conf_winner}
	var poseedor: String = _euro_sim_id(String(vigente.get(comp, "")))
	clubs.sort_custom(func(a, b):
		var ia: String = String(a["id"])
		var ib: String = String(b["id"])
		if (ia == poseedor) !=(ib == poseedor):
			return ia == poseedor
		var ca: int = int(coef.get(ia, 0))
		var cb: int = int(coef.get(ib, 0))
		if ca != cb:
			return ca > cb
		return ia < ib)








func _pick_avoiding_country(bag: Array, n: int, avoid: String, por_pais: Dictionary = {},
		tope: int = 0) -> Array:
	var out: Array = []
	for k in bag:
		if out.size() >= n:
			break
		var pais: String = Teams.country_of(String(k))
		if pais != avoid and (tope <= 0 or int(por_pais.get(pais, 0)) < tope):
			out.append(String(k))
			if tope > 0:
				por_pais[pais] = int(por_pais.get(pais, 0)) + 1
	if out.size() < n:
		for k in bag:
			if out.size() >= n:
				break
			if not out.has(String(k)):
				out.append(String(k))
				if tope > 0:
					var pais2: String = Teams.country_of(String(k))
					por_pais[pais2] = int(por_pais.get(pais2, 0)) + 1
	return out










func _euro_league_schedule(all_keys: Array, matchdays: int,
		you_home: Array, you_away: Array) -> Dictionary:
	var n: int = all_keys.size()
	var slots: Array = []
	for i in n:
		slots.append("_S%d" % i)
	var sched_p: Array = Schedule.league_phase(slots, matchdays)

	var home_slots: Array = []
	var away_slots: Array = []
	for r in sched_p.size():
		for pair in sched_p[r]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])
			if a != "_S0" and b != "_S0":
				continue
			var home: bool = a == "_S0"
			var slot: String = b if home else a
			if home:
				home_slots.append({"slot": slot, "round": r})
			else:
				away_slots.append({"slot": slot, "round": r})
			break



	var map: Dictionary = {"_S0": YOU_KEY}
	var used: Dictionary = {YOU_KEY: true}
	var you_fixtures: Array = []
	var m: int = mini(home_slots.size(), you_home.size())
	for i in m:
		var s: Dictionary = home_slots[i]
		var pick: Dictionary = you_home[i]
		map[String(s["slot"])] = String(pick["key"])
		used[String(pick["key"])] = true
		you_fixtures.append({"opp": String(pick["key"]), "home": true,
			"round": int(s["round"]), "pot": int(pick["pot"])})
	var w: int = mini(away_slots.size(), you_away.size())
	for i in w:
		var s2: Dictionary = away_slots[i]
		var pick2: Dictionary = you_away[i]
		map[String(s2["slot"])] = String(pick2["key"])
		used[String(pick2["key"])] = true
		you_fixtures.append({"opp": String(pick2["key"]), "home": false,
			"round": int(s2["round"]), "pot": int(pick2["pot"])})


	var rest: Array = []
	for k in all_keys:
		if not used.has(String(k)):
			rest.append(String(k))
	var ri: int = 0
	for i in n:
		var slot_id: String = "_S%d" % i
		if map.has(slot_id):
			continue
		map[slot_id] = String(rest[ri]) if ri < rest.size() else slot_id
		ri += 1

	var schedule: Array = []
	for r in sched_p.size():
		var round_pairs: Array = []
		for pair in sched_p[r]:
			round_pairs.append([String(map.get(String(pair[0]), String(pair[0]))),
				String(map.get(String(pair[1]), String(pair[1])))])
		schedule.append(round_pairs)
	you_fixtures.sort_custom(func(a, b): return int(a["round"]) < int(b["round"]))
	return {"schedule": schedule, "you_fixtures": you_fixtures}





func euro_state(comp: String) -> Dictionary:
	match comp:
		"ucl": return ucl_state
		"eul": return eul_state
		"conf": return conf_state





		"cwc": return cwc_state



		"lib": return lib_state
		"sud": return sud_state
		"cca": return cca_state
		"ace": return ace_state
		"ac2": return ac2_state
		"caf": return caf_state
		"cf2": return cf2_state
		"ofc": return ofc_state
	return {}










func euro_apps_played(comp: String) -> int:
	var st: Dictionary = euro_state(comp)
	if st.is_empty() or not bool(st.get("playing", false)):
		return 0
	var groups: Array = st.get("groups", [])
	if groups.is_empty():
		return 0
	var table: Dictionary = Dictionary(groups[0]).get("table", {})
	return int(Dictionary(table.get(YOU_KEY, {})).get("pj", 0))














func nat_apps_played(kind: String) -> int:
	if not bool(nat_state.get("playing", false)):
		return 0
	if int(nat_state.get("season", -1)) != season_num:
		return 0
	if String(nat_state.get("comp", "")) != kind:
		return 0
	if bool(nat_state.get("watch", false)):
		return 0
	var groups: Array = nat_state.get("groups", [])
	if groups.is_empty():
		return 0
	var table: Dictionary = Dictionary(groups[0]).get("table", {})
	return int(Dictionary(table.get(YOU_KEY, {})).get("pj", 0))


func _set_euro_state(comp: String, value: Dictionary) -> void:
	match comp:
		"cwc": cwc_state = value
		"ucl": ucl_state = value
		"eul": eul_state = value
		"conf": conf_state = value
		"lib": lib_state = value
		"sud": sud_state = value
		"cca": cca_state = value
		"ace": ace_state = value
		"ac2": ac2_state = value
		"caf": caf_state = value
		"cf2": cf2_state = value
		"ofc": ofc_state = value



func euro_you_group(state: Dictionary) -> Dictionary:
	var groups: Array = state.get("groups", [])
	return groups[0] if not groups.is_empty() else {}











const NAT_QUAL_NAMES: Array[String] = ["J1", "J2", "J3", "J4", "J5"]



const NAT_FIFA_WINDOWS: Array[float] = [0.1, 0.22, 0.34, 0.72, 0.94]

const NAT_GROUP_LETTERS: Array[String] = ["A", "B", "C", "D", "E", "F", "G", "H"]






func _last_week(entries: Array) -> float:
	var last: float = 0.0
	for e in entries:
		last = maxf(last, float(e.get("week", 0.0)))
	return last


func _build_nat(entries: Array, league_len: int, tail: float = 0.0) -> void:
	var country: String = Career.nationality
	if country == "" or Nations.by_id(country).is_empty():
		return




	var live: bool = bool(nat_state.get("playing", false)) \
			and int(nat_state.get("season", -1)) == season_num
	if live and String(nat_state.get("comp", "")) == "qual" \
			and not bool(nat_state.get("done", false)):
		_build_nat_qual(entries, league_len, country)
		return
	if live and String(nat_state.get("comp", "")) in ["wc", "cont"] \
			and bool(nat_state.get("alive", false)):
		_build_nat_bracket(entries, tail, country, String(nat_state["comp"]))
		return









	var comp_vivo: String = String(nat_state.get("comp", ""))
	if live and (bool(nat_state.get("done", false)) \
			or (comp_vivo in ["wc", "cont"] and not bool(nat_state.get("alive", false)))):
		return
	var cu: Dictionary = Career.nat_callup()






	var watch: bool = cu.is_empty() or String(cu.get("status", "fuera")) == "fuera"

	match NatTeam.season_kind(season_num):
		"wc":




			if NatTeam.wc_entry(country, season_num, Career.nat_qualified):
				_build_nat_bracket(entries, tail, country, "wc", watch)
			else:



				nat_state = {"playing": false}
		"cont":



			if NatTeam.cont_entry(country, Career.cont_qualified):
				_build_nat_bracket(entries, tail, country, "cont", watch)
			else:


				nat_state = {"playing": false}
		_:
			_build_nat_qual(entries, league_len, country, watch)





func nat_is_watch() -> bool:
	return bool(nat_state.get("playing", false)) and bool(nat_state.get("watch", false)) \
			and int(nat_state.get("season", -1)) == season_num











func nat_torneo_empezado() -> bool:
	if not (String(nat_state.get("comp", "")) in ["wc", "cont"]):
		return false
	if int(nat_state.get("season", -1)) != season_num:
		return false
	var groups: Array = nat_state.get("groups", [])
	if not groups.is_empty():
		var tabla: Dictionary =(groups[0] as Dictionary).get("table", {})
		if int((tabla.get(YOU_KEY, {}) as Dictionary).get("pj", 0)) > 0:
			return true
	if int(nat_state.get("ko_idx", 0)) > 0:
		return true
	for ronda in nat_state.get("bracket", []):
		for cruce in ronda:
			if not String((cruce as Dictionary).get("winner", "")).is_empty():
				return true
	return false




func _build_nat_qual(entries: Array, league_len: int, country: String,
		watch: bool = false) -> void:




	var prev: Dictionary = nat_state
	var resume: bool = bool(prev.get("playing", false)) \
			and String(prev.get("comp", "")) == "qual" \
			and not bool(prev.get("done", false)) \
			and int(prev.get("season", -1)) == season_num
	var played: int = 0
	var keys: Array
	var sched: Array
	if resume:
		keys = prev["group"]
		sched = prev["schedule"]
		played = int((prev["table"] as Dictionary)[YOU_KEY]["pj"])
	else:
		var group_ids: Array = NatTeam.qualifying_group(country, season_num)

		keys = [YOU_KEY]
		for id in group_ids:
			if String(id) != country:
				keys.append(String(id))
		var table: Dictionary = {}
		for k in keys:
			table[k] = _blank_row()
		sched = Schedule.single_round_robin(keys)
		nat_state = {"playing": true, "comp": "qual", "group": keys, "table": table,
			"schedule": sched, "qualified": false, "done": false,
			"target": NatTeam.qual_target(season_num, country),
			"season": season_num, "watch": watch}

























	var rounds: int = sched.size()








	var win_weeks: Array = _fifa_weeks(entries, league_len)
	for r in rounds:
		if r < played:
			continue
		for pair in sched[r]:
			if String(pair[0]) != YOU_KEY and String(pair[1]) != YOU_KEY:
				continue
			var home: bool = String(pair[0]) == YOU_KEY
			var opp: String = String(pair[1]) if home else String(pair[0])
			var win: int = _qual_window(r, rounds)

			var w: float = CalendarioMundo.semana_nat(int(win_weeks[win]),
				r - _qual_window_first(win, rounds))
			entries.append({"comp": "nat", "opp": opp, "home": home,
				"round": "qual", "nat_round": r, "dead": false,
				"label": "SELECCIÓN · CLASIF J%d" %(r + 1),
				"week": w})
			break






func _qual_window(r: int, rounds: int) -> int:
	if rounds <= 0:
		return 0
	var n: int = NAT_FIFA_WINDOWS.size()
	return clampi(int(floor(float(r) * float(n) / float(rounds))), 0, n - 1)





func _qual_window_first(win: int, rounds: int) -> int:
	for r in rounds:
		if _qual_window(r, rounds) == win:
			return r
	return 0














func _build_nat_friendly(entries: Array, league_len: int, country: String) -> void:
	var opps: Array = NatTeam.friendly_opponents(country, season_num)
	if opps.is_empty():
		nat_state = {"playing": false}
		return










	var prev: Dictionary = nat_state
	var resume: bool = bool(prev.get("playing", false)) \
			and String(prev.get("comp", "")) == "friendly" \
			and not bool(prev.get("done", false)) \
			and int(prev.get("season", -1)) == season_num
	var played: int = int(prev.get("played", 0)) if resume else 0



	var watch: bool = bool(prev.get("watch", false))
	if not resume:
		var cu: Dictionary = Career.nat_callup()
		watch = cu.is_empty() or String(cu.get("status", "fuera")) == "fuera"
	var win_weeks: Array = _fifa_weeks(entries, league_len)
	for i in opps.size():
		if i >= win_weeks.size():
			break


		if i < played:
			continue
		entries.append({"comp": "nat", "opp": String(opps[i]),

			"home": i % 2 == 0,
			"round": "friendly", "nat_round": i, "dead": false,
			"label": "SELECCIÓN · AMISTOSO",
			"week": CalendarioMundo.semana_nat(int(win_weeks[i]))})




	if resume:
		return
	nat_state = {"playing": true, "comp": "friendly", "season": season_num,
		"watch": watch, "done": false, "played": 0, "won": 0}












func _fifa_weeks(entries: Array, league_len: int) -> Array:
	var busy: Dictionary = {}
	for e in entries:
		if String(e.get("comp", "")) != "league":
			var k: int = int(floor(float(e.get("week", 0.0))))
			busy[k] = float(busy.get(k, 0.0)) \
					+ CalendarioMundo.peso_ocupa(String(e.get("comp", "")))



	return CalendarioMundo.semanas_fifa(league_len, busy, Teams.country_of(player_team_id))
















func _build_nat_bracket(entries: Array, tail: float, country: String, comp: String,
		watch: bool = false) -> void:




	var prev: Dictionary = nat_state
	var resume: bool = bool(prev.get("playing", false)) \
			and String(prev.get("comp", "")) == comp \
			and int(prev.get("season", -1)) == season_num
	if resume and not bool(prev.get("alive", false)):
		return
	if not resume:
		var tour_name: String = NatTeam.tournament_name(season_num, country)
		nat_state = {"playing": true, "comp": comp, "groups": [],
			"bracket": [], "ko_names": [], "ko_opps": [], "ko_idx": 0,
			"advanced": false, "alive": true, "champion": false, "winner": "",
			"season": season_num, "name": tour_name, "watch": watch}




		var fmt: Dictionary = NatTeam.tournament_format(comp, country)
		var field: Array = NatTeam.world_cup_field(country, true, season_num) if comp == "wc" \
				else NatTeam.continental_field(country, true, season_num)
		nat_state["ko_names"] = NatTeam.bracket_round_names(
			int(fmt.get("bracket", field.size())))
		if int(fmt.get("groups", 0)) > 0:


			var seeded: Array = NatTeam.seed_groups(field, int(fmt["groups"]))
			for gi in seeded.size():
				if (seeded[gi] as Array).has(country) and gi != 0:
					var tmp: Array = seeded[0]
					seeded[0] = seeded[gi]
					seeded[gi] = tmp
					break
			var groups: Array = []
			for ids in seeded:
				var keys: Array = []
				for id in ids:
					keys.append(YOU_KEY if String(id) == country else String(id))
				var table: Dictionary = {}
				for k in keys:
					table[String(k)] = _blank_row()
				groups.append({"keys": keys, "table": table,
					"schedule": Schedule.single_round_robin(keys)})
			nat_state["groups"] = groups
		else:

			var by_strength: Array = field.duplicate()
			by_strength.sort_custom(func(a, b):
				return Nations.strength(String(a)) > Nations.strength(String(b)))
			var ties: Array = []
			var n: int = by_strength.size()
			for i in n / 2:
				var a: String = String(by_strength[i])
				var b: String = String(by_strength[n - 1 - i])
				ties.append({"a": YOU_KEY if a == country else a,
					"b": YOU_KEY if b == country else b, "winner": "", "score": ""})
			nat_state["bracket"] = [ties]
			nat_state["advanced"] = true
			_nat_set_you_opp(0)



	var st: Dictionary = nat_state
	var tour: String = String(st.get("name", "SELECCIÓN"))

	var ko_base: float = tail
	if not (st["groups"] as Array).is_empty() and (st["bracket"] as Array).is_empty():
		var g0: Dictionary =(st["groups"] as Array)[0]
		var g_sched: Array = g0["schedule"]
		var g_played: int = int(((g0["table"] as Dictionary)[YOU_KEY] as Dictionary)["pj"])



		for r in g_sched.size():
			if r < g_played:
				continue
			for pair in g_sched[r]:
				if String(pair[0]) != YOU_KEY and String(pair[1]) != YOU_KEY:
					continue
				var home: bool = String(pair[0]) == YOU_KEY
				var opp: String = String(pair[1]) if home else String(pair[0])
				entries.append({"comp": "nat", "opp": opp, "home": home,
					"round": "grupo", "nat_g_round": r, "dead": false,
					"label": "%s · GRUPO J%d/%d" % [tour, r + 1, g_sched.size()],
					"week": tail + float(r)})
				break
		ko_base = tail + float(g_sched.size())




	var ko_names: Array = st["ko_names"]
	var ko_opps: Array = st["ko_opps"]
	var first: int = int(st.get("ko_idx", 0))
	var advanced: bool = bool(st.get("advanced", false))




	for i in range(first, ko_names.size()):
		entries.append({"comp": "nat",
			"opp": String(ko_opps[i]) if i < ko_opps.size() else "",
			"home": i % 2 == 0, "round": String(ko_names[i]), "nat_ko": i,
			"dead":(not advanced) or i > first,
			"label": "%s · %s" % [tour, String(ko_names[i]).to_upper()],
			"week": ko_base + float(i)})




func _resolve_nat_qual(round_idx: int, opp: String, tg: int, rg: int) -> void:
	if not bool(nat_state.get("playing", false)) or String(nat_state.get("comp", "")) != "qual":
		return
	var table: Dictionary = nat_state["table"]
	for pair in nat_state["schedule"][round_idx]:
		var a: String = String(pair[0])
		var b: String = String(pair[1])
		if a == YOU_KEY:
			_apply_row(table, YOU_KEY, b, tg, rg)
			_log_round_result(Career.nationality, b, tg, rg, true)
		elif b == YOU_KEY:
			_apply_row(table, a, YOU_KEY, rg, tg)
			_log_round_result(a, Career.nationality, rg, tg, true)
		else:
			var s: Array = _sim_score_nat(a, b)
			_apply_row(table, a, b, s[0], s[1])
			_log_round_result(a, b, s[0], s[1], false)
	if round_idx == int(nat_state["schedule"].size()) - 1:
		nat_state["done"] = true



		nat_state["qualified"] = _nat_qual_position() \
				<= NatTeam.qual_spots(Career.nationality,
				nat_qual_target())





		var filas: Array = []
		var tabla: Dictionary = nat_state["table"]
		for k in tabla:
			filas.append({"key": String(k), "id": _nat_sim_id(String(k)),
				"pts": int(tabla[k]["pts"]), "pj": int(tabla[k]["pj"]),
				"dif": int(tabla[k]["gf"]) - int(tabla[k]["gc"]),
				"gd": int(tabla[k]["gf"]) - int(tabla[k]["gc"]),
				"gf": int(tabla[k]["gf"])})
		filas.sort_custom(table_before)
		var temporada_qual: int = int(nat_state.get("season", season_num))
		if nat_qual_target() == "cont":
			Career.cont_qualified = bool(nat_state["qualified"])
			nat_qual_grupo_cont = NatTeam.sella_grupo(Career.nationality, temporada_qual,
				filas, "cont")
		else:
			Career.nat_qualified = bool(nat_state["qualified"])
			nat_qual_grupo = NatTeam.sella_grupo(Career.nationality, temporada_qual, filas)





		var objetivo: String = nat_qual_target()
		Career.queue_ceremony(
			Ceremonies.NAT_QUAL_OK if bool(nat_state["qualified"]) else Ceremonies.NAT_QUAL_KO, {
				"nation": Career.nationality,
				"rival": opp,
				"team_goals": tg,
				"rival_goals": rg,
				"pos": _nat_qual_position(),
				"target": objetivo,
				"torneo": "MUNDIAL" if objetivo == "wc"
					else Nations.continental_name_of(Career.nationality),
			})










func nat_qual_target() -> String:
	var t: String = String(nat_state.get("target", ""))
	if t == "wc" or t == "cont":
		return t
	return NatTeam.qual_target(int(nat_state.get("season", season_num)), Career.nationality)







func nat_fecha_decidida(f: Dictionary) -> bool:
	match String(f.get("round", "")):
		"friendly":
			return true
		"qual":
			if String(nat_state.get("comp", "")) != "qual" or not nat_state.has("table"):
				return false
			var quedan: int = int(nat_state["schedule"].size()) - int(f.get("nat_round", 0))
			var rows: Array = []
			var table: Dictionary = nat_state["table"]
			for k in table:
				rows.append({"key": String(k), "pts": int(table[k]["pts"])})
			rows.sort_custom(func(a, b): return int(a["pts"]) > int(b["pts"]))
			var plazas: int = NatTeam.qual_spots(Career.nationality,
				nat_qual_target())
			if plazas >= rows.size():
				return true
			var tuyos: int = int(Dictionary(table.get(YOU_KEY, {})).get("pts", 0))

			var otros: Array = []
			for r in rows:
				if String(r["key"]) != YOU_KEY:
					otros.append(int(r["pts"]))

			var te_alcanzan: int = 0
			for p in otros:
				if int(p) + 3 * quedan >= tuyos:
					te_alcanzan += 1
			if te_alcanzan < plazas:
				return true

			var techo: int = tuyos + 3 * quedan
			var por_encima: int = 0
			for p in otros:
				if int(p) > techo:
					por_encima += 1
			return por_encima >= plazas
	return false


func _nat_qual_position() -> int:
	var table: Dictionary = nat_state["table"]
	var rows: Array = []
	for k in table:
		rows.append({"key": String(k), "pts": int(table[k]["pts"]),
			"dif": int(table[k]["gf"]) - int(table[k]["gc"]),
			"gf": int(table[k]["gf"])})
	rows.sort_custom(table_before)
	for i in rows.size():
		if String(rows[i]["key"]) == YOU_KEY:
			return i + 1
	return rows.size()



func _nat_sim_id(key: String) -> String:
	return Career.nationality if key == YOU_KEY else key




func _resolve_nat_group(round_idx: int, tg: int, rg: int) -> void:
	if not bool(nat_state.get("playing", false)) \
			or not (String(nat_state.get("comp", "")) in ["wc", "cont"]):
		return
	var groups: Array = nat_state.get("groups", [])
	if groups.is_empty():
		return
	for gi in groups.size():
		var g: Dictionary = groups[gi]
		var sched: Array = g["schedule"]
		if round_idx >= sched.size():
			continue
		var table: Dictionary = g["table"]
		for pair in sched[round_idx]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])
			if a == YOU_KEY:
				_apply_row(table, YOU_KEY, b, tg, rg)
				_log_round_result(Career.nationality, b, tg, rg, true, gi)
			elif b == YOU_KEY:
				_apply_row(table, a, YOU_KEY, rg, tg)
				_log_round_result(a, Career.nationality, rg, tg, true, gi)
			else:
				var s: Array = _sim_score_nat(_nat_sim_id(a), _nat_sim_id(b), _nat_peso())
				_apply_row(table, a, b, s[0], s[1])
				_log_round_result(_nat_sim_id(a), _nat_sim_id(b),
					s[0], s[1], false, gi)
	if round_idx == int((groups[0] as Dictionary)["schedule"].size()) - 1:
		_nat_seed_bracket()









func _nat_seed_bracket() -> void:
	var groups: Array = nat_state.get("groups", [])
	var fmt: Dictionary = NatTeam.tournament_format(
		String(nat_state.get("comp", "wc")), Career.nationality)
	var advance: int = int(fmt.get("advance", NatTeam.WC_ADVANCE))
	var tops: Array = []
	for g in groups:
		tops.append(euro_group_order(g).slice(0, advance))
	var ties: Array = []
	var direct: int = groups.size() * advance
	if int(fmt.get("bracket", direct)) == direct:
		for pair in NatTeam.ko_pairings(groups.size()):
			if int(pair[0]) >= tops.size() or int(pair[1]) >= tops.size():
				continue
			var a: Array = tops[pair[0]]
			var b: Array = tops[pair[1]]
			if a.is_empty() or b.size() < advance:
				continue
			ties.append({"a": String(a[0]), "b": String(b[advance - 1]),
				"winner": "", "score": ""})
	else:
		var ranked: Array = []
		for k in advance:
			for gi in tops.size():
				var top_g: Array = tops[gi]
				if k < top_g.size():
					ranked.append(String(top_g[k]))
		ranked.append_array(NatTeam.best_thirds(groups.size(), advance,
			int(fmt["bracket"]) - direct, _nat_group_rows))
		var ordered: Array = NatTeam.seed_by_merit(ranked)
		for i in range(0, ordered.size() - 1, 2):
			ties.append({"a": String(ordered[i]), "b": String(ordered[i + 1]),
				"winner": "", "score": ""})
	nat_state["bracket"] = [ties] if not ties.is_empty() else []
	var you_in: bool = ties.any(func(t): return String(t["a"]) == YOU_KEY \
			or String(t["b"]) == YOU_KEY)
	nat_state["advanced"] = you_in
	if you_in:
		_nat_set_you_opp(0)
		_revive_nat_ko()
		_ensure_nat_ko_fixtures()
	else:
		nat_state["alive"] = false
		_kill_future("nat")
		_nat_sim_to_end()














func _ensure_nat_ko_fixtures() -> void:
	var ko_names: Array = nat_state.get("ko_names", [])
	var first: int = int(nat_state.get("ko_idx", 0))
	if ko_names.is_empty() or first >= ko_names.size():
		return
	var have: Dictionary = {}
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]



		if String(e.get("comp", "")) == "nat" and e.has("nat_ko") \
				and String(e.get("round", "")) != "grupo":
			have[int(e["nat_ko"])] = true
	var tour: String = String(nat_state.get("name", "SELECCIÓN"))
	var ko_opps: Array = nat_state.get("ko_opps", [])




	var at: int = calendar.size()
	for i in range(calendar.size() - 1, -1, -1):

		if String(calendar[i].get("comp", "")) == "nat" \
				and not _nat_ronda_aparte(String(calendar[i].get("round", ""))):
			at = i + 1
			break
	for i in range(first, ko_names.size()):
		if have.has(i):
			continue
		calendar.insert(at, {"comp": "nat",
			"opp": String(ko_opps[i]) if i < ko_opps.size() else "",
			"home": i % 2 == 0, "round": String(ko_names[i]), "nat_ko": i,

			"dead": i > first,
			"label": "%s · %s" % [tour, String(ko_names[i]).to_upper()]})
		at += 1
		print("[nat] repuesta la fecha de %s (%s)" % [String(ko_names[i]), tour])






func _nat_group_rows(gi: int) -> Array:
	var groups: Array = nat_state.get("groups", [])
	if gi >= groups.size():
		return []
	var g: Dictionary = groups[gi]
	var table: Dictionary = g.get("table", {})
	var out: Array = []
	for key in euro_group_order(g):
		var r: Dictionary = table.get(String(key), {})
		out.append({"id": String(key), "pts": int(r.get("pts", 0)),
			"gd": int(r.get("gf", 0)) - int(r.get("gc", 0))})
	return out




func _nat_set_you_opp(ko_idx: int) -> void:
	var bracket: Array = nat_state.get("bracket", [])
	if ko_idx >= bracket.size():
		return
	var opp: String = ""
	for t in bracket[ko_idx]:
		if String(t["a"]) == YOU_KEY:
			opp = String(t["b"])
		elif String(t["b"]) == YOU_KEY:
			opp = String(t["a"])
	if opp.is_empty():
		return
	var ko_opps: Array = nat_state.get("ko_opps", [])
	while ko_opps.size() <= ko_idx:
		ko_opps.append("")
	ko_opps[ko_idx] = opp
	nat_state["ko_opps"] = ko_opps
	for e in calendar:
		if String(e.get("comp", "")) == "nat" and int(e.get("nat_ko", -1)) == ko_idx:
			e["opp"] = opp
			break





func _nat_peso() -> String:
	match String(nat_state.get("comp", "")):
		"wc":
			return "wc"
		"cont":
			return Nations.confed_of(Career.nationality)
	return ""




func _nat_tie_score(a: String, b: String, winner: String) -> String:
	for _i in 12:
		var s: Array = _sim_score_nat(_nat_sim_id(a), _nat_sim_id(b), _nat_peso())
		if int(s[0]) == int(s[1]):
			continue
		var won_a: bool = int(s[0]) > int(s[1])
		if won_a ==(winner == a):
			return "%d-%d" % [int(s[0]), int(s[1])]
	return "1-0" if winner == a else "0-1"




func _nat_knockout_won(opp: String, tg: int, rg: int) -> bool:
	if tg != rg:
		return tg > rg
	if next_shootout_winner != 0:
		var won: bool = next_shootout_winner > 0
		next_shootout_winner = 0
		return won
	return Nations.strength(Career.nationality) >= Nations.strength(_nat_sim_id(opp))





func _nat_resolve_round(ties: Array, tg: int, rg: int, you: Dictionary) -> void:
	for t in ties:
		if not String(t["winner"]).is_empty():
			continue
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		if a == YOU_KEY or b == YOU_KEY:
			var opp: String = b if a == YOU_KEY else a
			var won: bool = _nat_knockout_won(opp, tg, rg)
			t["winner"] = YOU_KEY if won else opp
			t["score"] = "%d-%d" %([tg, rg] if a == YOU_KEY else [rg, tg])
			you["played"] = true
			you["won"] = won
		else:



			var sa: float = float(Nations.strength(_nat_sim_id(a))) \
					+ NatTeam.peso_historico(_nat_sim_id(a), _nat_peso())
			var sb: float = float(Nations.strength(_nat_sim_id(b))) \
					+ NatTeam.peso_historico(_nat_sim_id(b), _nat_peso())
			var pa: float = NatTeam._win_prob_torneo(sa, sb)
			var w: String = a if randf() < pa else b
			t["winner"] = w
			t["score"] = _nat_tie_score(a, b, w)





func _resolve_nat_wc(ko_idx: int, tg: int, rg: int) -> void:
	if not bool(nat_state.get("alive", false)) \
			or not (String(nat_state.get("comp", "")) in ["wc", "cont"]):
		return
	var bracket: Array = nat_state.get("bracket", [])
	if ko_idx >= bracket.size():
		return
	var ties: Array = bracket[ko_idx]
	var you: Dictionary = {"played": false, "won": false}
	_nat_resolve_round(ties, tg, rg, you)
	_log_round_ties(ties, _nat_sim_id)
	var final_round: bool = ties.size() <= 1
	if not final_round:
		bracket.append(_euro_next_round(ties))
	if not bool(you["played"]):
		return










	_queue_cup_room("wc" if String(nat_state.get("comp", "")) == "wc" else "euro",
		nat_state.get("ko_names", []), ko_idx, bool(you["won"]),
		String((nat_state.get("ko_opps", []) as Array)[ko_idx]) \
				if ko_idx <(nat_state.get("ko_opps", []) as Array).size() else "",
		tg, rg,
		ko_idx +(1 if bool(you["won"]) else 0),
		Career.nationality, String(nat_state.get("name", "")))
	if bool(you["won"]):
		nat_state["ko_idx"] = ko_idx + 1
		if final_round:
			nat_state["champion"] = true
			nat_state["winner"] = YOU_KEY












			var nat_comp: String = String(nat_state.get("comp", ""))
			if Career.nat_played_tournament(nat_comp):
				_crown("Campeón del Mundo" if nat_comp == "wc"
					else "Campeón continental")
		else:
			_nat_set_you_opp(ko_idx + 1)


			_ensure_nat_ko_fixtures()
	else:
		nat_state["alive"] = false
		_kill_future("nat")
		_nat_sim_to_end()




func _nat_sim_to_end() -> void:
	var bracket: Array = nat_state.get("bracket", [])
	if bracket.is_empty():
		return
	var guard: int = 0
	while guard < 8:
		guard += 1
		var ties: Array = bracket[bracket.size() - 1]
		_nat_resolve_round(ties, 0, 0, {"played": false, "won": false})
		if ties.size() <= 1:
			nat_state["winner"] = String((ties[0] as Dictionary)["winner"]) \
					if not ties.is_empty() else ""
			return
		bracket.append(_euro_next_round(ties))







func _revive_nat_ko() -> void:
	for i in range(season_day, calendar.size()):


		if String(calendar[i].get("comp", "")) == "nat" \
				and String(calendar[i].get("round", "")) != "grupo" \
				and not _nat_ronda_aparte(String(calendar[i].get("round", ""))):
			calendar[i]["dead"] = false







func _sim_score_nat(id_a: String, id_b: String, peso: String = "") -> Array:










	var l: PackedFloat64Array = sim_lambdas(
		float(Nations.strength(id_a)) + NatTeam.peso_historico(id_a, peso),
		float(Nations.strength(id_b)) + NatTeam.peso_historico(id_b, peso), true,
		false, 0.0, Tactics.apertura(id_a, id_b))
	return [_poisson(l[0]), _poisson(l[1])]






























const SIM_TANH_CAP: float = 1.45



const SIM_TANH_DIV: float = 14.0










const SIM_LAMBDA_FLOOR: float = 0.45
















const SIM_EDGE_W_FAVORITO: float = 0.9
const SIM_EDGE_W_DEBIL: float = 0.65






const SIM_BASE_GOLES: float = 1.3











const HOME_EDGE: float = 0.18

















const HOME_EDGE_RANGO: float = 0.06

























const FORM_EDGE: float = 0.22
























static func home_edges_for(ids: Array) -> Dictionary:
	var out: Dictionary = {}
	var filas: Array = []
	for x in ids:
		var id: String = str(x.get("id", "")) if x is Dictionary else str(x)
		if id.is_empty():
			continue
		var r: int = Teams.rating(id)
		filas.append([Presentation.capacity(r, Teams.base_div(id), id), r, id])
	var n: int = filas.size()
	if n < 2:
		for f in filas:
			out[f[2]] = HOME_EDGE
		return out
	filas.sort_custom(func(a, b) -> bool:
		return int(a[0]) < int(b[0]) or (int(a[0]) == int(b[0]) and int(a[1]) < int(b[1])))

	var i: int = 0
	while i < n:
		var j: int = i
		while j + 1 < n and int(filas[j + 1][0]) == int(filas[i][0]) \
				and int(filas[j + 1][1]) == int(filas[i][1]):
			j += 1
		var p: float =(float(i) + float(j - i) * 0.5) / float(n - 1)
		for k in range(i, j + 1):
			out[filas[k][2]] = HOME_EDGE + HOME_EDGE_RANGO *(2.0 * p - 1.0)
		i = j + 1
	return out






var _he_mapa: Dictionary = {}
var _he_grupos: Dictionary = {}
var _he_pv: int = 0
var _he_lista: bool = false

















func home_edge_of(team_id: String) -> float:



	if not Career.prestado_de(team_id).is_empty():
		return 0.0
	var pv: int = pyramid_version()
	if not _he_lista or pv != _he_pv:
		_he_mapa.clear()
		_he_grupos.clear()
		_he_pv = pv
		_he_lista = true
		for t in Teams.all():
			var tid: String = str(t.get("id", ""))
			var pais: String = str(t.get("country", ""))
			if tid.is_empty() or pais.is_empty():
				continue
			var d: int = div_of(tid)
			if not _he_grupos.has(pais):
				_he_grupos[pais] = {}
			var por_div: Dictionary = _he_grupos[pais]
			if not por_div.has(d):
				por_div[d] = []
			(por_div[d] as Array).append(tid)
	if _he_mapa.has(team_id):
		return float(_he_mapa[team_id])
	var grupo: Array =(_he_grupos.get(Teams.country_of(team_id), {}) as Dictionary) \
			.get(div_of(team_id), [])
	if grupo.has(team_id):
		_he_mapa.merge(home_edges_for(grupo), true)


	if not _he_mapa.has(team_id):
		_he_mapa[team_id] = HOME_EDGE
	return float(_he_mapa[team_id])





























static func sim_lambdas(ra: float, rb: float, neutral: bool = false,
		derby: bool = false, form_delta: float = 0.0,
		apertura: float = 1.0, home_edge: float = -1.0) -> PackedFloat64Array:



	var edge: float = SIM_TANH_CAP * tanh(float(ra - rb) / SIM_TANH_DIV
		+ form_delta * FORM_EDGE)
	if derby:
		edge *= SimLeague.DERBY_EDGE
	var base: float = SIM_BASE_GOLES * apertura








	var w_a: float = SIM_EDGE_W_FAVORITO if edge >= 0.0 else SIM_EDGE_W_DEBIL
	var w_b: float = SIM_EDGE_W_DEBIL if edge >= 0.0 else SIM_EDGE_W_FAVORITO




	var casa: float = 0.0 if neutral else (HOME_EDGE if home_edge < 0.0 else home_edge)
	return PackedFloat64Array([
		maxf(SIM_LAMBDA_FLOOR, base + w_a * edge + casa),
		maxf(SIM_LAMBDA_FLOOR, base - w_b * edge)])















func _sim_score(id_a: String, id_b: String, neutral: bool = false,
		comp: String = "league", con_bajas: bool = false, dia: Dictionary = {}) -> Array:


















	var ra: float = _fuerza_sim_de(id_a, con_bajas, float(dia.get(id_a, 0.0)))
	var rb: float = _fuerza_sim_de(id_b, con_bajas, float(dia.get(id_b, 0.0)))



	var fd: float = form_edge(form_key_of(id_a), comp) - form_edge(form_key_of(id_b), comp)







	var he: float = -1.0 if neutral else home_edge_of(id_a)
	var l: PackedFloat64Array = sim_lambdas(ra, rb, neutral,
		Rivalries.are_rivals(id_a, id_b), fd, Tactics.apertura(id_a, id_b), he)
	return [_poisson(l[0]), _poisson(l[1])]




func _fuerza_sim_de(id: String, con_bajas: bool, d: float) -> float:
	if con_bajas:
		return Career.fuerza_liga(id, -1.0, d)
	return Squad.fuerza_sim(id) if d == 0.0 else Squad.fuerza_con_delta(id, d)







func es_fixture_de_hoy(f: Dictionary) -> bool:
	if f.is_empty():
		return false
	var hoy: Dictionary = current_fixture()
	if hoy.is_empty():
		return false
	return String(hoy.get("opp", "")) == String(f.get("opp", "")) \
			and String(hoy.get("comp", "")) == String(f.get("comp", "")) \
			and bool(hoy.get("home", true)) == bool(f.get("home", true))






const SIM_GOAL_CAP: int = 6


func _poisson(lambda: float) -> int:
	var l: float = exp(- lambda)
	var k: int = 0
	var p: float = 1.0
	while true:
		k += 1
		p *= randf()
		if p <= l:
			break
	return clampi(k - 1, 0, SIM_GOAL_CAP)















































func odds_fixture(f: Dictionary, con_once_de_hoy: bool = true) -> Dictionary:
	var opp: String = String(f.get("opp", ""))
	if opp.is_empty():
		return {}
	var nat: bool = String(f.get("comp", "")) == "nat"
	var mine: String = Career.nationality if nat else player_team_id
	if mine.is_empty():
		return {}












	var ra: float = float(Nations.strength(mine)) if nat \
			else Career.fuerza_de_hoy(mine, f, con_once_de_hoy)
	var rb: float = float(Nations.strength(opp)) if nat \
			else Career.fuerza_de_hoy(opp, f, false)
	var home: bool = bool(f.get("home", true))
	var neutral: bool = nat or Competitions.is_neutral(f)
	var derby: bool = not nat and Rivalries.are_rivals(mine, opp)
	var comp: String = String(f.get("comp", "league"))
	var fa: float = form_edge(form_key_of(mine), comp)
	var fb: float = form_edge(form_key_of(opp), comp)



	var he: float = -1.0 if neutral else home_edge_of(mine if home else opp)
	var o: Dictionary = score_odds(
		ra if home else rb, rb if home else ra, neutral, derby,
		(fa - fb) if home else (fb - fa), Tactics.apertura(mine, opp), he)


	return {
		"win": float(o["win"] if home else o["loss"]),
		"draw": float(o["draw"]),
		"loss": float(o["loss"] if home else o["win"]),
		"home": home, "neutral": neutral,
	}







static func score_odds(ra: float, rb: float, neutral: bool = false,
		derby: bool = false, form_delta: float = 0.0,
		apertura: float = 1.0, home_edge: float = -1.0) -> Dictionary:



	var l: PackedFloat64Array = sim_lambdas(ra, rb, neutral, derby, form_delta,
		apertura, home_edge)
	var pa: PackedFloat64Array = _poisson_pmf(l[0])
	var pb: PackedFloat64Array = _poisson_pmf(l[1])
	var win: float = 0.0
	var draw: float = 0.0
	var loss: float = 0.0
	for ga in pa.size():
		for gb in pb.size():
			var p: float = pa[ga] * pb[gb]
			if ga > gb:
				win += p
			elif ga == gb:
				draw += p
			else:
				loss += p
	return {"win": win, "draw": draw, "loss": loss}








static func _poisson_pmf(lambda: float) -> PackedFloat64Array:
	var out: PackedFloat64Array = PackedFloat64Array()
	var term: float = exp(- lambda)
	var acc: float = 0.0
	for k in SIM_GOAL_CAP:
		out.append(term)
		acc += term
		term *= lambda / float(k + 1)
	out.append(maxf(0.0, 1.0 - acc))
	return out












func you_of(f: Dictionary) -> Dictionary:
	if String(f.get("comp", "")) == "nat" and Career.nationality != "":
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	_ensure_player_team()
	return Teams.by_id(player_team_id)



func you_team() -> Dictionary:


	if nat_match_active and Career.nationality != "":
		var nat: Dictionary = Nations.as_team(Career.nationality)
		if not nat.is_empty():
			return nat
	_ensure_player_team()
	return Teams.by_id(player_team_id)








const FALLBACK_KIT: Color = Color("1d74d0")
const FALLBACK_KIT2: Color = Color("f3f1f4")













func kit_variant(team: Dictionary, slot: int, temporada: int = -1) -> Dictionary:
	if team.is_empty():
		return {"kit": FALLBACK_KIT, "kit2": FALLBACK_KIT2}







	var t_kit: int = Teams.drift_season(team,
		season_num if temporada < 0 else temporada)
	var out: Dictionary




	match slot:
		1:
			out = Teams.away_kit(team, t_kit)
		2:
			out = Teams.third_kit(team, t_kit)
		3:


			out = Teams.retro_kit(team)
		_:








			var l_kit: Color = Teams.local_shade(team, t_kit, team["kit"])
			var l_kit2: Color = Teams.local_shade(team, t_kit, team["kit2"])
			out = {"kit": l_kit, "kit2": l_kit2}

			var l_pat: String = Teams.local_pattern(team, t_kit)
			if l_pat != "solid":
				out["pattern"] = l_pat



				out["kit_b"] = Teams.local_accent(team, t_kit,
					team.get("kit_b", team["kit2"]))
				out["pat_w"] = Teams.local_pat_w(team)





			var trim: String = Teams.local_trim(team, t_kit)
			if trim != "none":
				out["local_trim"] = trim



				var acc: Color = team.get("kit_b", team["kit2"])
				if Teams.kits_clash(acc, l_kit):
					acc = Color("f2f2f4") if l_kit.get_luminance() < 0.5 \
							else Color("14141a")
				out["trim_col"] = acc


	Teams.kit_detalles(team, t_kit, slot, out)



	Teams.detalles_editados(team, slot, out, t_kit)



	out.merge(CrestView.patch_for(team))





	out.merge(Teams.dorsal_of(team))







	var dueno: String = String(team.get("id", ""))
	if not dueno.is_empty():
		out["club"] = dueno










	if slot >= 0 and slot <= 2:
		var pre_ink: String = "" if slot == 0 else ("away_" if slot == 1 else "third_")
		for pieza in ["pat", "fab"]:
			var ink: Variant = team.get(pre_ink + pieza + "_ink")
			if ink is Color:
				out[pieza + "_ink"] = ink





	if slot == 1 or slot == 2:
		out["kit_slot"] = slot









	var pm: String = parche_comp()
	if not pm.is_empty():
		out["comp_parche"] = pm







		var cid: String = String(team.get("id", ""))
		if not cid.is_empty():
			var kind: String = parche_kind(pm)








			var vig: Array = Career.last_titles_of(cid, 8) \
					if Career != null and Career.has_method("last_titles_of") else []
			if vig.has(pm) or (not kind.is_empty() and vig.has(kind)):
				out["parche_vigente"] = true
	return out







func parche_kind(tipo: String) -> String:
	if tipo.begins_with("liga"):
		return "liga"
	if tipo.begins_with("copa"):
		return "copa"
	return tipo if tipo in ["champions", "clubes"] else ""










var parche_manga_on: bool = true


func parche_comp() -> String:
	if not parche_manga_on:
		return ""
	var f: Dictionary = current_fixture()
	if f.is_empty():
		return ""
	return Competitions.logo_type_of(f)





func kit_of(team: Dictionary, away: bool) -> Dictionary:
	return kit_variant(team, 1 if away else 0)















func kit_canonical(team: Dictionary, slot: int = 0) -> Dictionary:
	var keep: int = season_num





	season_num = maxi(int(team.get(TeamEdits.SEASON_KEY, 0)), 1)
	var out: Dictionary = kit_variant(team, slot)
	season_num = keep
	return out



func player_kit() -> Dictionary:
	return kit_variant(you_team(), player_kit_slot)












func rival_kit() -> Dictionary:
	var suyo: Dictionary = kit_variant(current_rival(), rival_kit_slot)
	if rival_kit_slot == 3:
		return suyo
	var otro: Dictionary = kit_variant(current_rival(), 1 if rival_kit_slot == 0 else 0)
	return Teams.mezcla_choque(suyo, player_kit(), otro)






func kit_slot_lejano(rival: Dictionary, mio: Color) -> int:
	var mejor: int = 0
	var mejor_d: float = -1.0
	for slot in 3:
		var c: Color = kit_variant(rival, slot).get("kit", mio)
		var d: float = absf(mio.r - c.r) + absf(mio.g - c.g) + absf(mio.b - c.b)
		if d > mejor_d:
			mejor_d = d
			mejor = slot
	return mejor




func player_look() -> Dictionary:
	var out: Dictionary = team_custom.duplicate()
	out.merge(player_kit(), true)



	out["number"] = shirt_number_now()
	return out





















var _nat_shirt: int = 0
var _nat_shirt_ready: bool = false



func shirt_number_now() -> int:
	if nat_match_active and Career.nationality != "":
		if not _nat_shirt_ready:
			_nat_shirt = Career.nat_number()
			_nat_shirt_ready = true
		if _nat_shirt > 0:
			return _nat_shirt
	elif _nat_shirt_ready:


		_nat_shirt_ready = false
		_nat_shirt = 0
	return player_number





func set_player_number(n: int) -> void:
	player_number = maxi(n, 0)
	Squad.set_user_shirt(player_team_id, player_number)












func retro_available() -> bool:
	return RetroKits.toca(player_team_id, current_fixture(), league_schedule.size())






func rival_retro_available() -> bool:
	return RetroKits.toca(String(current_rival().get("id", "")),
		current_fixture(), league_schedule.size())







func retro_kit_on() -> bool:
	return RetroKits.la_llevas(retro_available(), player_kit_slot,
		not kit_choice_stale())







func reset_kit_choice() -> void:
	player_kit_slot = 0 if bool(current_fixture().get("home", true)) else 1




	if retro_available():
		player_kit_slot = 3
	rival_kit_slot = 1 if Teams.kits_clash(
		kit_variant(current_rival(), 0)["kit"], player_kit()["kit"]) else 0





	if rival_retro_available() and not Teams.kits_clash(
			Teams.retro_kit(current_rival())["kit"], player_kit()["kit"]):
		rival_kit_slot = 3
	mark_kit_choice()





func mark_kit_choice() -> void:
	kit_choice_ready = true
	kit_choice_day = Vector2i(season_num, season_day)




func kit_choice_stale() -> bool:
	return not kit_choice_ready or kit_choice_day != Vector2i(season_num, season_day)






func ensure_kit_choice() -> void:
	if kit_choice_stale():
		reset_kit_choice()








func _ensure_player_team() -> void:
	if not Teams.by_id(player_team_id).is_empty():
		return
	var pool: Array = Teams.starter_pool()
	if pool.is_empty():
		pool = Teams.all()
	player_team_id = String(pool[randi() % pool.size()]["id"])
	_club_sorteado = player_team_id








func reset_career(club_id: String) -> void:
	load_failed = false
	_reset_persisted_fields()
	player_team_id = club_id
	_club_sorteado = ""








	last_orden_1a = {"season": season_num - 1, "orden": {}, "amer": 4, "uefa": 1}
	previas_desde = 0
	verano_convocado = {}
	_congela_piramide()
	if not readonly_save:
		DirAccess.remove_absolute(active_save_path())
		DirAccess.remove_absolute(SaveSlots.slot_path("career_meta.cfg"))







func _reset_persisted_fields() -> void:
	SimLeague.fuerza_cero_carga({})
	matches_played = 0
	wins = 0
	draws = 0
	losses = 0
	career_goals = 0
	career_assists = 0
	career_shots = 0
	legend_goals = 0
	legend_assists = 0
	club_matches = {}
	vs_clubs = {}
	vs_nations = {}
	rating_total = 0.0
	best_rating = 0.0
	team_custom = {}
	wardrobe_outfits = []
	rival_custom = {}
	player_team_id = ""
	set_player_number(0)
	season_num = 1
	season_day = 0
	calendar = []
	league_schedule = []
	league_table = {}
	league_form = {}
	comp_form = {}
	cup_state = {}
	ucl_state = {}
	eul_state = {}
	conf_state = {}
	cwc_state = {}
	liguilla_state = {}
	apertura_tabla = {}
	liguilla_apertura = {}
	apertura_mundo = {}
	campeones_state = {}
	recopa_state = {}
	intercont_state = {}
	supereuropa_state = {}
	superafrica_state = {}
	supercopa_state = {}
	copaliga_state = {}
	ligas_state = {}
	finalissima_state = {}
	naciones_state = {}
	olimpicos_state = {}
	lib_state = {}
	sud_state = {}
	cca_state = {}
	ace_state = {}
	ac2_state = {}
	caf_state = {}
	cf2_state = {}
	ofc_state = {}
	amer_cupos_snap = {}
	europa_cupos_snap = {}
	_europa_previa_cache = {}
	copas_mundo_snap = {}
	coef_asoc_hist = {}
	coef_club_hist = {}
	qualified_ucl = false
	qualified_eul = false
	qualified_conf = false
	club_wc_qualified = false





	_euro_order_cache = {}
	_euro_order_season = -1
	nat_state = {}


	nat_coef = {}
	campeon_mundial = ""
	nat_qual_grupo = {}
	nat_qual_grupo_cont = {}
	last_match = {}
	nat_match_active = false
	club_div = {}
	last_div_moves = {}
	stadium_div = {}
	last_league_champion = ""
	last_ucl_winner = ""
	last_eul_winner = ""
	last_conf_winner = ""
	last_lib_winner = ""
	last_sud_winner = ""
	last_cca_winner = ""
	last_ace_winner = ""
	last_ac2_winner = ""
	last_caf_winner = ""
	last_cf2_winner = ""
	last_ofc_winner = ""
	continental_winners = {}
	last_league_order = []
	last_orden_1a = {}
	next_weather = ""
	next_rain = -1
	next_wind_seed = 0
	next_chances = -1
	next_base_chances = -1
	next_minutes = -1
	next_shootout_winner = 0
	next_shootout_hero = {}
	next_play_style = MatchPlan.Style.BALANCEADO
	kit_choice_ready = false
	kit_choice_day = Vector2i(-1, -1)





func reload_active_slot() -> void:
	_reset_persisted_fields()
	_load()







func league_standings() -> Array:
	_ensure_season()
	return _standings_of(league_table)






func _standings_of(table: Dictionary) -> Array:
	var rows: Array = []
	for key in table:
		var r: Dictionary = table[key]









		var display: String = String(
			Teams.by_id(player_team_id).get("name", "Tu club")) \
					if key == YOU_KEY else _team_name(String(key))
		rows.append({"key": key, "name": display, "pj": r["pj"],
			"w": int(r.get("w", 0)), "d": int(r.get("d", 0)), "l": int(r.get("l", 0)),
			"gf": int(r.get("gf", 0)), "gc": int(r.get("gc", 0)),
			"pts": r["pts"], "dif": r["gf"] - r["gc"]})
	rows.sort_custom(table_before)
	return rows















static func table_before(a: Dictionary, b: Dictionary) -> bool:
	if int(a["pts"]) != int(b["pts"]):
		return int(a["pts"]) > int(b["pts"])
	if int(a["dif"]) != int(b["dif"]):
		return int(a["dif"]) > int(b["dif"])
	if int(a.get("gf", 0)) != int(b.get("gf", 0)):
		return int(a.get("gf", 0)) > int(b.get("gf", 0))
	return _clave_desempate(String(a.get("key", ""))) < _clave_desempate(String(b.get("key", "")))






















static func _clave_desempate(k: String) -> String:
	var club: String = k
	if k == YOU_KEY:
		club = String(GameState.player_team_id)
		if club.is_empty():
			return k.to_lower()
	var team: Dictionary = Teams.by_id(club)
	if team.is_empty():
		return club
	return _nombre_de_orden(String(team.get("name", club))) + "" + club





const SUFIJOS_CLUB: Array[String] = ["FC", "CF", "AFC", "SC", "CD", "UD", "SD", "AC",
	"SSC", "AS", "RC", "RCD", "CA", "FK", "SK", "IF", "BK", "SV", "VFB", "VFL", "TSG", "CP",
	"SAD", "CFC", "KV", "KRC", "OGC", "OSC", "F.C.", "C.F."]




static func nombre_corto_club(nombre: String) -> String:
	var quedan: PackedStringArray = []
	for parte in nombre.strip_edges().split(" ", false):
		if not SUFIJOS_CLUB.has(String(parte).to_upper()):
			quedan.append(parte)
	var corto: String = " ".join(quedan)
	return corto if corto.length() > 3 else nombre




const _PLIEGA_DE: String = "àáâãäåçèéêëìíîïñòóôõöùúûüýÿāăąćĉċčďēĕėęěĝğġģĥĩīĭįĵķĺļľŀńņňōŏőŕŗřśŝşšţťũūŭůűųŵŷźżžſøđðıłħŧ"
const _PLIEGA_A: String = "aaaaaaceeeeiiiinooooouuuuyyaaaccccdeeeeegggghiiiijkllllnnnooorrrssssttuuuuuuwyzzzsoddilht"
const _PLIEGA_DOBLE: Dictionary = {"ß": "ss", "æ": "ae", "œ": "oe", "þ": "th"}


static var _orden_cache: Dictionary = {}




static func _nombre_de_orden(nombre: String) -> String:
	if not _orden_cache.has(nombre):
		_orden_cache[nombre] = pliega(nombre_corto_club(Competitions.demarca(nombre)))
	return String(_orden_cache[nombre])




static func pliega(texto: String) -> String:
	var out: String = ""
	for ch in texto.to_lower():
		var c: int = ch.unicode_at(0)
		if c >= 768 and c <= 879:
			continue
		if c < 128:
			out += ch
			continue
		var i: int = _PLIEGA_DE.find(ch)
		out += _PLIEGA_A[i] if i >= 0 else String(_PLIEGA_DOBLE.get(ch, ch))
	return out



func _team_name(key: String) -> String:
	var t: Dictionary = Teams.by_id(key)
	return String(t["name"]) if not t.is_empty() else key












const FORM_N: int = 5
var league_form: Dictionary = {}



















var comp_form: Dictionary = {}




func form_of(key: String) -> Array:
	return (league_form.get(key, []) as Array).duplicate()









func form_of_comp(key: String, comp: String) -> Array:
	if comp.is_empty() or comp == "league":
		return form_of(key)
	var t: Dictionary = comp_form.get(comp, {})
	return (t.get(key, []) as Array).duplicate()






































func form_of_any(team_id: String, comp: String = "") -> Array:
	var key: String = form_key_of(team_id)
	if not comp.is_empty() and comp != "league":
		var l: Array = form_of_comp(key, comp)
		if not l.is_empty():
			return l
		if comp == "nat":
			return []
	if key == YOU_KEY or league_table.has(key):
		return form_of(key)


	var total: int = league_rounds_yours()
	var played: int = int(Dictionary(league_table.get(YOU_KEY, {})).get("pj", 0))
	if total <= 0 or played <= 0:
		return []
	return SimLeague.form_of(team_id, season_num, float(played) / float(total))






















func form_edge(key: String, comp: String = "") -> float:
	var c: String = comp if not comp.is_empty() else home_comp()
	var l: Array = []
	if c != "league":
		l =(comp_form.get(c, {}) as Dictionary).get(key, [])







		if l.is_empty() and c == "nat":
			return 0.0
	if l.is_empty():
		l = league_form.get(key, [])
	if l.is_empty():
		return 0.0
	var num: float = 0.0
	var den: float = 0.0
	for i in l.size():

		var w: float = 1.0 + float(i) / float(maxi(l.size() - 1, 1))
		den += w
		match String(l[i]):
			"G":
				num += w
			"P":
				num -= w
	return num / den if den > 0.0 else 0.0





func form_key_of(team_id: String) -> String:
	return YOU_KEY if team_id == player_team_id else team_id




func _log_form(key: String, res: String) -> void:
	var l: Array = league_form.get(key, [])
	l.append(res)
	while l.size() > FORM_N:
		l.pop_front()
	league_form[key] = l







func _log_comp_form(comp: String, team_id: String, res: String) -> void:
	if team_id.is_empty():
		return
	var t: Dictionary = comp_form.get(comp, {})
	var key: String = form_key_of(team_id)




	if comp == "nat" and not Career.nationality.is_empty() \
			and team_id == Career.nationality:
		key = YOU_KEY
	var l: Array = t.get(key, [])
	l.append(res)
	while l.size() > FORM_N:
		l.pop_front()
	t[key] = l
	comp_form[comp] = t


func _apply_result(key_a: String, key_b: String, ga: int, gb: int) -> void:
	var a: Dictionary = league_table[key_a]
	var b: Dictionary = league_table[key_b]
	_log_form(key_a, "G" if ga > gb else ("P" if ga < gb else "E"))
	_log_form(key_b, "G" if gb > ga else ("P" if gb < ga else "E"))
	a["pj"] += 1
	b["pj"] += 1
	a["gf"] += ga
	a["gc"] += gb
	b["gf"] += gb
	b["gc"] += ga
	if ga > gb:
		a["w"] += 1
		a["pts"] += 3
		b["l"] += 1
	elif ga < gb:
		b["w"] += 1
		b["pts"] += 3
		a["l"] += 1
	else:
		a["d"] += 1
		b["d"] += 1
		a["pts"] += 1
		b["pts"] += 1




func _advance_calendar(team_goals: int, rival_goals: int) -> void:
	_ensure_season()
	_skip_dead()
	if season_day >= calendar.size():
		return
	var f: Dictionary = calendar[season_day]



	last_round_results = []



	if not _delta_noted:
		last_match_delta = {}
	_delta_noted = false


	last_match = {
		"comp": String(f.get("comp", "")),
		"opp": String(f.get("opp", "")),
		"home": bool(f.get("home", true)),
		"round": String(f.get("round", "")),
		"label": String(f.get("label", "")),



		"ko_idx": int(f.get("ko_idx", -1)), "leg": int(f.get("leg", 1)),
		"gf": team_goals, "gc": rival_goals,
	}



	if f.has("torneo"):
		last_match["torneo"] = int(f["torneo"])






	f["played"] = true
	f["gf"] = team_goals
	f["gc"] = rival_goals
	match String(f.get("comp", "")):
		"league":
			_resolve_league(int(f["round_idx"]), team_goals, rival_goals)
		"cup":
			_resolve_cup(String(f["opp"]), team_goals, rival_goals, f)



		"ucl", "eul", "conf", "cwc":
			var ecomp: String = String(f.get("comp", ""))
			if String(f.get("round", "")) == "grupo":
				_resolve_euro_group(ecomp, int(f.get("euro_round", 0)),
					team_goals, rival_goals)

			elif String(f.get("round", "")) == "previa":
				_resolve_euro_previa(ecomp, int(f.get("leg", 1)), team_goals, rival_goals)
			else:




				_resolve_euro_ko(ecomp, int(f["ko_idx"]), int(f.get("leg", 1)),
					team_goals, rival_goals)



		"lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc":
			var acomp: String = String(f.get("comp", ""))
			var around: String = String(f.get("round", ""))
			if around == "grupo":
				_resolve_euro_group(acomp, int(f.get("euro_round", 0)),
					team_goals, rival_goals)
			elif around == "previa":
				_resolve_lib_previa(int(f.get("leg", 1)), team_goals, rival_goals)
			elif around == "preliminar":
				_resolve_sud_preliminar(team_goals, rival_goals)
			else:
				var vis: int = _visitante_decide(f, team_goals, rival_goals)
				_resolve_euro_ko(acomp, int(f.get("ko_idx", 0)), int(f.get("leg", 1)),
					team_goals, rival_goals, vis)
		"liguilla":
			_resolve_liguilla(int(f.get("ko_idx", -1)), int(f.get("leg", 1)),
				team_goals, rival_goals)
		"campeones":
			_resolve_campeones(String(f.get("opp", "")), team_goals, rival_goals)
		"recopa":
			_resolve_recopa(String(f.get("opp", "")), int(f.get("leg", 1)),
				team_goals, rival_goals)
		"intercont":
			_resolve_intercont(String(f.get("round", "")), String(f.get("opp", "")),
				team_goals, rival_goals)
		"supereuropa":
			_resolve_supereuropa(String(f.get("opp", "")), team_goals, rival_goals)
		"superafrica":
			_resolve_superafrica(String(f.get("opp", "")), team_goals, rival_goals)
		"supercopa":
			_resolve_supercopa(String(f.get("opp", "")), String(f.get("round", "")),
				int(f.get("leg", 1)), team_goals, rival_goals)
		"copaliga":
			_resolve_copaliga(String(f.get("opp", "")), team_goals, rival_goals, f)
		"ligas":
			_resolve_ligas(String(f.get("round", "")), String(f.get("cruce", "")),
				String(f.get("opp", "")), team_goals, rival_goals)
		"nat":
			if String(f.get("round", "")) == "friendly":




				nat_state["played"] = int(nat_state.get("played", 0)) + 1
				if team_goals > rival_goals:
					nat_state["won"] = int(nat_state.get("won", 0)) + 1
				_save()
			elif String(f.get("round", "")) == Finalissima.RONDA:
				_resolve_finalissima(String(f.get("opp", "")), team_goals, rival_goals)
			elif String(f.get("round", "")) in LigaNaciones.RONDAS:
				_resolve_naciones(f, team_goals, rival_goals)
			elif String(f.get("round", "")) in JuegosOlimpicos.RONDAS:
				_resolve_olimpicos(f, team_goals, rival_goals)
			elif String(f.get("round", "")) == "qual":
				_resolve_nat_qual(int(f["nat_round"]), String(f["opp"]),
					team_goals, rival_goals)
			elif String(f.get("round", "")) == "grupo":




				var g_round: int = int(f.get("nat_g_round", -1))
				if g_round < 0:
					push_error("[nat] fixture de grupo sin nat_g_round: %s" % str(f))
				else:
					_resolve_nat_group(g_round, team_goals, rival_goals)
			else:
				_resolve_nat_wc(int(f["nat_ko"]), team_goals, rival_goals)
	season_day += 1



	next_weather = ""
	next_rain = -1
	next_wind_seed = 0


	_olimpicos_choque()
	_skip_dead()

	_juega_previas_sin_ti()



	if season_day >= calendar.size():
		season_close_pending = true



		if readonly_save and not season_wait_close:
			season_close_pending = false
			_end_season()
			return
		_save()















func note_match_delta(goals: int, assists: int, mates_g: Dictionary = {},
		mates_a: Dictionary = {}, rating: float = 0.0) -> void:
	last_match_delta = {
		"goals": goals, "assists": assists, "rating": maxf(rating, 0.0),
		"mates_goals": mates_g.duplicate(),
		"mates_assists": mates_a.duplicate(),
	}
	_delta_noted = true





func _log_round_result(a: String, b: String, ga: int, gb: int, you: bool,
		group: int = -1) -> void:
	last_round_results.append({"a": a, "b": b, "ga": ga, "gb": gb,
		"you": you, "group": group})






	var comp: String = String(current_fixture().get("comp", ""))
	if comp.is_empty() or comp == "league":
		return
	_log_comp_form(comp, a, "G" if ga > gb else ("P" if ga < gb else "E"))
	_log_comp_form(comp, b, "G" if gb > ga else ("P" if gb < ga else "E"))



func _resolve_league(round_idx: int, tg: int, rg: int) -> void:


	var half: int = league_schedule.size() / 2
	if round_idx == half and torneos_activos():
		_liguilla_relevo()
	for pair in league_schedule[round_idx]:
		var a: String = String(pair[0])
		var b: String = String(pair[1])
		if a == YOU_KEY:
			_apply_result(YOU_KEY, b, tg, rg)
			_log_round_result(player_team_id, b, tg, rg, true)
		elif b == YOU_KEY:
			_apply_result(a, YOU_KEY, rg, tg)
			_log_round_result(a, player_team_id, rg, tg, true)
		else:

			var s: Array = _sim_score(a, b, false, "league", true)
			_apply_result(a, b, s[0], s[1])
			_log_round_result(a, b, s[0], s[1], false)







	Career.tick_bajas_liga(round_idx)





















	if round_idx == half - 1 and torneos_activos():
		_cierra_apertura()
	if round_idx >= league_schedule.size() - 1:


		_aviva_supercopa_misma()
		if liguilla_activa():
			_liguilla_seed()
		if not liguilla_activa() and _league_position() == 1:
			_crown("Campeón de Liga")






var next_shootout_winner: int = 0













var next_shootout_hero: Dictionary = {}









func _knockout_won(opp: String, tg: int, rg: int, visitante: int = 0) -> bool:
	if tg != rg:
		return tg > rg
	if visitante != 0:
		return visitante > 0
	if next_shootout_winner != 0:
		var won: bool = next_shootout_winner > 0
		next_shootout_winner = 0
		return won
	return Squad.strength(player_team_id) >= Squad.strength(opp)





const EURO_TITLE: Dictionary = {
	"ucl": "Campeón de Champions",
	"eul": "Campeón de Europa League",
	"conf": "Campeón de Conference",


	"lib": "Campeón de Libertadores",
	"sud": "Campeón de Sudamericana",
	"cca": "Campeón de Concacaf",
	"ace": "Campeón de Copa de Oriente",
	"ac2": "Campeón de Copa del Sol",
	"caf": "Campeón de Copa del Atlas",
	"cf2": "Campeón de Copa del Baobab",
	"ofc": "Campeón de Copa del Coral",
}














func _crown(award: String, torneo: int = -1) -> void:
	if readonly_save or award.is_empty():
		return
	Career.grant_title_now(award, torneo)






























func _queue_cup_room(comp: String, names: Array, idx: int, won: bool,
		opp: String, tg: int, rg: int, won_rounds: int,
		nation: String = "", tour: String = "") -> void:
	if readonly_save or names.is_empty() or idx < 0 or idx >= names.size():
		return
	var is_final: bool = idx >= names.size() - 1
	if is_final:
		return
	Career.queue_ceremony(Ceremonies.CUP_ROOM, {
		"mode": "pasa" if won else "fuera",
		"comp": comp,
		"nation": nation,
		"tour": tour,
		"round": String(names[idx]),


		"next_round": String(names[idx + 1]) if won else "",
		"rival": opp,
		"tg": tg, "rg": rg,



		"won_rounds": maxi(won_rounds, 0),
		"div": player_div(),
	})





func _resolve_cup(opp: String, tg: int, rg: int, f: Dictionary = {}) -> void:
	if not bool(cup_state.get("alive", false)):
		return

	if cup_state.has("fmt"):
		_resolve_copa_real(opp, tg, rg, f)
		return
	var won: bool = _knockout_won(opp, tg, rg)
	_cup_advance_field(won, tg, rg)



	var names: Array = cup_state.get("names", [])
	var idx: int = int(cup_state.get("idx", 0))


	_queue_cup_room("cup", names, idx, won, opp, tg, rg, idx +(1 if won else 0))
	if won:
		cup_state["idx"] = idx + 1
		if int(cup_state["idx"]) >= int(names.size()):
			cup_state["champion"] = true
			cup_state["winner"] = player_team_id
			_crown("Campeón de Copa")
		else:
			_cup_draw()
			_cup_apply_draw(int(cup_state["idx"]))
	else:
		cup_state["alive"] = false
		_cup_sim_to_end()
		_kill_future("cup")













func _build_campeones(entries: Array) -> void:
	var pais: String = Teams.country_of(player_team_id)


	if player_div() != 1 or not Liguilla.aplica(pais, 1):
		return
	if int(campeones_state.get("season", -1)) == season_num:
		return
	var cruce: Array = Career.campeones_de(pais, season_num - 1)
	if cruce.size() < 2 or not cruce.has(player_team_id):
		return
	var de_ap: bool = String(cruce[0]) == player_team_id
	entries.append({"comp": "campeones", "opp": String(cruce[1] if de_ap else cruce[0]),
		"home": de_ap, "round": "Final", "dead": false,
		"label": Competitions.CAMPEONES_NAME, "week": Liguilla.CAMPEONES_SEMANA})





func _resolve_campeones(opp: String, tg: int, rg: int) -> void:
	var won: bool = _knockout_won(opp, tg, rg)
	campeones_state = {"season": season_num, "a": player_team_id, "b": opp,
		"winner": player_team_id if won else opp, "champion": won, "gf": tg, "gc": rg}
	_log_round_result(player_team_id, opp, tg, rg, true)
	if won:
		_crown(Liguilla.CAMPEONES)
	_save()




func _semanas_ocupadas(entries: Array) -> Array:
	var out: Array = []
	for e in entries:
		out.append(float((e as Dictionary).get("week", 0.0)))
	return out


func _semanas_fifa(entries: Array) -> Array:
	var out: Array = []
	for e in entries:
		if String((e as Dictionary).get("comp", "")) == "nat" \
				and String((e as Dictionary).get("round", "")) in ["qual", "friendly",
					Finalissima.RONDA] + LigaNaciones.RONDAS:
			out.append(float((e as Dictionary).get("week", 0.0)))
	return out








func _build_recopa(entries: Array) -> void:
	var cruce: Array = Supercopas.recopa_cruce(last_lib_winner, last_sud_winner)
	if cruce.size() < 2 or not cruce.has(player_team_id):
		return
	var st: Dictionary = recopa_state if int(recopa_state.get("season", -1)) == season_num else {}
	if st.has("winner"):
		return
	var soy_lib: bool = String(cruce[0]) == player_team_id
	var rival: String = String(cruce[1] if soy_lib else cruce[0])





	var ocupadas: Array = _semanas_ocupadas(entries)
	var fifa: Array = _semanas_fifa(entries)
	var pais: String = Teams.country_of(player_team_id)
	var n_liga: int = CalendarioMundo.league_len_de(pais, player_div())
	var semanas: Array = []
	if n_liga > 0:
		for sep_fifa in [Supercopas.SEP_FIFA, Supercopas.INTERCONT_SEP_FIFA]:
			semanas = Supercopas.par_en_mes(ocupadas, fifa, Supercopas.RECOPA_MES,
				Supercopas.RECOPA_DENTRO, n_liga, pais, Supercopas.RECOPA_SEP_MAX, sep_fifa)
			if not semanas.is_empty():
				break
	if semanas.is_empty():
		semanas = Supercopas.hueco(ocupadas, fifa, Supercopas.RECOPA_DESDE, 2,
			Supercopas.SEP_PROPIA)
	for leg in [0, 1]:
		if leg == 0 and st.has("leg1"):
			continue


		entries.append({"comp": "recopa", "opp": rival, "home": soy_lib ==(leg == 1),
			"round": "Final", "leg": leg, "dead": false, "week": float(semanas[leg]),
			"label": "%s · FINAL (%s)" % [Supercopas.RECOPA_ETIQUETA,
				"IDA" if leg == 0 else "VUELTA"]})





func _resolve_recopa(opp: String, leg: int, tg: int, rg: int) -> void:
	if int(recopa_state.get("season", -1)) != season_num:
		recopa_state = {"season": season_num, "a": player_team_id, "b": opp}
	_log_round_result(player_team_id, opp, tg, rg, true)
	if leg < 1:
		recopa_state["leg1"] = "%d-%d" % [tg, rg]
		_save()
		return
	var ida: Array = _split_tie_goals(String(recopa_state.get("leg1", "")))
	var gt: int = tg +(int(ida[0]) if not ida.is_empty() else 0)
	var gr: int = rg +(int(ida[1]) if not ida.is_empty() else 0)
	var won: bool = _knockout_won(opp, gt, gr)
	recopa_state["winner"] = player_team_id if won else opp
	recopa_state["champion"] = won
	if won:
		_crown(Supercopas.RECOPA)
	_save()











func _build_supereuropa(entries: Array) -> void:
	var cruce: Array = Supercopas.supereuropa_cruce(last_ucl_winner, last_eul_winner)
	if cruce.size() < 2 or not cruce.has(player_team_id):
		return
	if int(supereuropa_state.get("season", -1)) == season_num:
		return
	var soy_ucl: bool = String(cruce[0]) == player_team_id
	var semanas: Array = Supercopas.hueco(_semanas_ocupadas(entries), _semanas_fifa(entries),
		Supercopas.SUPEREUROPA_DESDE, 1, Supercopas.SEP_PROPIA)
	entries.append({"comp": "supereuropa", "opp": String(cruce[1] if soy_ucl else cruce[0]),
		"home": soy_ucl, "round": "Final", "dead": false, "week": float(semanas[0]),
		"label": "%s · FINAL" % Supercopas.SUPEREUROPA_ETIQUETA})





func _resolve_supereuropa(opp: String, tg: int, rg: int) -> void:
	var won: bool = _knockout_won(opp, tg, rg)
	supereuropa_state = {"season": season_num, "a": player_team_id, "b": opp,
		"winner": player_team_id if won else opp, "champion": won, "gf": tg, "gc": rg}
	_log_round_result(player_team_id, opp, tg, rg, true)
	if won:
		_crown(Supercopas.SUPEREUROPA)
	_save()








func _build_superafrica(entries: Array) -> void:
	var cruce: Array = Supercopas.superafrica_cruce(last_caf_winner, last_cf2_winner)
	if cruce.size() < 2 or not cruce.has(player_team_id):
		return
	if int(superafrica_state.get("season", -1)) == season_num:
		return
	var soy_caf: bool = String(cruce[0]) == player_team_id

	var pais: String = Teams.country_of(player_team_id)
	var desde: float = Supercopas.semana_del_mes(Supercopas.SUPERAFRICA_MES,
		Supercopas.SUPERAFRICA_DENTRO, CalendarioMundo.league_len_de(pais, player_div()), pais)
	if desde < 0.0:
		desde = 7.0
	var semanas: Array = Supercopas.hueco(_semanas_ocupadas(entries), _semanas_fifa(entries),
		desde, 1, Supercopas.SEP_PROPIA)
	entries.append({"comp": "superafrica", "opp": String(cruce[1] if soy_caf else cruce[0]),
		"home": soy_caf, "round": "Final", "dead": false, "week": float(semanas[0]),
		"label": "%s · FINAL" % Supercopas.SUPERAFRICA_ETIQUETA})



func _resolve_superafrica(opp: String, tg: int, rg: int) -> void:
	var won: bool = _knockout_won(opp, tg, rg)
	superafrica_state = {"season": season_num, "a": player_team_id, "b": opp,
		"winner": player_team_id if won else opp, "champion": won, "gf": tg, "gc": rg}
	_log_round_result(player_team_id, opp, tg, rg, true)
	if won:
		_crown(Supercopas.SUPERAFRICA)
	_save()












func _build_supercopa(entries: Array, league_len: int) -> void:
	var pais: String = Teams.country_of(player_team_id)
	if player_div() != 1 or not SupercopaNacional.aplica(pais):
		return
	var st: Dictionary = supercopa_state if int(supercopa_state.get("season", -1)) == season_num \
			else {}
	if st.has("winner"):
		return









	if SupercopaNacional.misma(pais) and not bool(st.get("misma", false)):
		if not st.is_empty():
			supercopa_state = {}
		_fecha_supercopa_misma(entries, league_len)
		return
	var entran: Array = st.get("entran", []) if not st.is_empty() \
			else Career.supercopa_de(pais, season_num - 1)
	if entran.size() < 2 or not entran.has(player_team_id):
		return
	supercopa_state = st if not st.is_empty() \
			else {"season": season_num, "pais": pais, "entran": entran}
	var f: Dictionary = SupercopaNacional.formato(pais)
	var t: String = SupercopaNacional.tipo(pais)
	var base: Dictionary = {"comp": SupercopaNacional.COMP, "dead": false,
		"neutral": SupercopaNacional.es_neutral(pais), "des": String(f.get("des", "penales"))}
	if not SupercopaNacional.pais_sede(pais).is_empty():
		base["sede"] = SupercopaNacional.pais_sede(pais)
	var ocupadas: Array = _semanas_ocupadas(entries)
	var fifa: Array = _semanas_fifa(entries)
	var desde: float = SupercopaNacional.desde(pais, league_len)
	if t == "f4":
		var mia: Array = SupercopaNacional.semi_de(entran, player_team_id)
		if mia.is_empty():
			return
		var semanas: Array = Supercopas.hueco(ocupadas, fifa, desde, 2, Supercopas.SEP_PROPIA)
		if not supercopa_state.has("semi"):
			var rival: String = String(mia[0][1] if String(mia[0][0]) == player_team_id \
					else mia[0][0])
			var e: Dictionary = base.duplicate()
			e.merge({"opp": rival, "round": SupercopaNacional.SEMI, "week": float(semanas[0]),
				"home": SupercopaNacional.es_local(pais, entran, player_team_id, rival),
				"label": "%s · SEMIFINAL" % SupercopaNacional.NOMBRE})
			entries.append(e)

		var b: String = String(supercopa_state.get("b", "")) if supercopa_state.has("semi") else ""
		var fin: Dictionary = base.duplicate()
		fin.merge({"opp": b, "round": SupercopaNacional.FINAL, "week": float(semanas[1]),
			"home": b.is_empty() or SupercopaNacional.es_local(pais, entran, player_team_id, b),
			"label": "%s · FINAL" % SupercopaNacional.NOMBRE})
		entries.append(fin)
		return
	var rival2: String = String(entran[1] if String(entran[0]) == player_team_id else entran[0])
	if t == "doble":
		var w0: float = _hueco_supercopa(ocupadas, fifa, desde)
		var w1: float = float(Supercopas.hueco(ocupadas + [w0], fifa,
			maxf(SupercopaNacional.desde(pais, league_len, true), w0 + Supercopas.SEP_PROPIA), 1,
			Supercopas.SEP_PROPIA)[0])
		for leg in [0, 1]:
			if leg == 0 and supercopa_state.has("leg1"):
				continue
			var e2: Dictionary = base.duplicate()
			e2.merge({"opp": rival2, "round": SupercopaNacional.FINAL, "leg": leg,
				"week": w0 if leg == 0 else w1,
				"home": SupercopaNacional.es_local(pais, entran, player_team_id, rival2, leg == 1),
				"label": "%s · FINAL (%s)" % [SupercopaNacional.NOMBRE,
					"IDA" if leg == 0 else "VUELTA"]})
			entries.append(e2)
		return
	var e3: Dictionary = base.duplicate()
	e3.merge({"opp": rival2, "round": SupercopaNacional.FINAL,
		"week": _hueco_supercopa(ocupadas, fifa, desde),
		"home": SupercopaNacional.es_local(pais, entran, player_team_id, rival2),
		"label": "%s · FINAL" % SupercopaNacional.NOMBRE})
	entries.append(e3)











func _hueco_supercopa(ocupadas: Array, fifa: Array, desde: float) -> float:
	var w: float = float(Supercopas.hueco(ocupadas, fifa, desde, 1, Supercopas.SEP_PROPIA)[0])
	if desde < 1.0 and w >= 1.0:
		var antes: float = float(Supercopas.hueco(ocupadas, fifa, 0.05, 1,
			Supercopas.SEP_PROPIA)[0])
		if antes < 1.0:
			return antes
	return w







func _fecha_supercopa_misma(entries: Array, league_len: int) -> void:
	var pais: String = Teams.country_of(player_team_id)
	var f: Dictionary = SupercopaNacional.formato(pais)
	var w: float = float(Supercopas.hueco(_semanas_ocupadas(entries), _semanas_fifa(entries),
		SupercopaNacional.desde(pais, league_len), 1, Supercopas.SEP_PROPIA)[0])
	var e: Dictionary = {"comp": SupercopaNacional.COMP, "dead": true, "opp": "", "home": true,
		"neutral": SupercopaNacional.es_neutral(pais), "des": String(f.get("des", "penales")),
		"round": SupercopaNacional.FINAL, "week": w,
		"label": "%s · FINAL" % SupercopaNacional.NOMBRE}
	if not SupercopaNacional.pais_sede(pais).is_empty():
		e["sede"] = SupercopaNacional.pais_sede(pais)
	entries.append(e)












func _aviva_supercopa_misma(desde: int = -1) -> void:
	var pais: String = Teams.country_of(player_team_id)
	if player_div() != 1 or not SupercopaNacional.aplica(pais) \
			or not SupercopaNacional.misma(pais) \
			or int(supercopa_state.get("season", -1)) == season_num:
		return
	var top: Array = []
	for row in league_standings().slice(0, 2):
		var k: String = String((row as Dictionary).get("key", ""))
		top.append(player_team_id if k == YOU_KEY else k)
	var entran: Array = SupercopaNacional.entrantes(pais, top, CopaMundo.campeon(pais))
	if entran.size() < 2 or not entran.has(player_team_id):
		return


	supercopa_state = {"season": season_num, "pais": pais, "entran": entran, "misma": true}
	var rival: String = String(entran[1] if String(entran[0]) == player_team_id else entran[0])
	for i in range(season_day + 1 if desde < 0 else desde, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == SupercopaNacional.COMP:
			e["opp"] = rival
			e["home"] = SupercopaNacional.es_local(pais, entran, player_team_id, rival)
			e["dead"] = false
			return








func _resolve_supercopa(opp: String, ronda: String, leg: int, tg: int, rg: int) -> void:
	var pais: String = Teams.country_of(player_team_id)
	if int(supercopa_state.get("season", -1)) != season_num:
		supercopa_state = {"season": season_num, "pais": pais,
			"entran": [player_team_id, opp]}
	supercopa_state["a"] = player_team_id
	_log_round_result(player_team_id, opp, tg, rg, true)
	if leg < 1:
		supercopa_state["b"] = opp
		supercopa_state["leg1"] = "%d-%d" % [tg, rg]
		_save()
		return
	var ida: Array = _split_tie_goals(String(supercopa_state.get("leg1", "")))
	var gt: int = tg +(int(ida[0]) if not ida.is_empty() else 0)
	var gr: int = rg +(int(ida[1]) if not ida.is_empty() else 0)
	var won: bool = _knockout_won(opp, gt, gr)
	if ronda == SupercopaNacional.SEMI:
		var entran: Array = supercopa_state.get("entran", [])
		var mia: Array = SupercopaNacional.semi_de(entran, player_team_id)
		var otro: String = SupercopaNacional.semi_sim(pais, mia[1], season_num) \
				if mia.size() == 2 else ""
		supercopa_state["semi"] = {"b": opp, "winner": player_team_id if won else opp,
			"gf": tg, "gc": rg, "otra": otro}
		if won:
			supercopa_state["b"] = otro
			for e in calendar:
				if String(e.get("comp", "")) == SupercopaNacional.COMP \
						and String(e.get("round", "")) == SupercopaNacional.FINAL:
					e["opp"] = otro
					e["home"] = SupercopaNacional.es_local(pais, entran, player_team_id, otro)
		else:
			supercopa_state["b"] = opp
			supercopa_state["winner"] = SimLeague.partido_unico(opp, otro, season_num,
				"supercopa|" + pais) if not otro.is_empty() else opp
			supercopa_state["champion"] = false
			_kill_future(SupercopaNacional.COMP)
		_save()
		return
	supercopa_state["b"] = opp
	supercopa_state["winner"] = player_team_id if won else opp
	supercopa_state["champion"] = won
	supercopa_state["gf"] = tg
	supercopa_state["gc"] = rg
	if won:
		_crown(SupercopaNacional.TITULO)
	_save()








func _build_copaliga(entries: Array, league_len: int) -> void:
	copaliga_state = {}
	if not CopaLiga.aplica(Teams.country_of(player_team_id), player_div()):
		return
	_copa_real_arma(CopaLiga.COMP, entries, league_len)




func _copaliga_apply_draw(idx: int) -> void:
	if idx >=(copaliga_state.get("opps", []) as Array).size():
		return
	for e in calendar:
		if String(e.get("comp", "")) == CopaLiga.COMP and int(e.get("cup_idx", -1)) == idx:
			e["opp"] = String(copaliga_state["opps"][idx])
			e["home"] = bool(copaliga_state["homes"][idx])
			break





func _resolve_copaliga(opp: String, tg: int, rg: int, f: Dictionary = {}) -> void:
	if not bool(copaliga_state.get("alive", false)):
		return


	if copaliga_state.has("fmt"):
		_resolve_copa_real(opp, tg, rg, f, CopaLiga.COMP)
		return
	var won: bool = _knockout_won(opp, tg, rg)
	CopaLiga.avanza(copaliga_state, player_team_id, won, tg, rg)
	_log_round_result(player_team_id, opp, tg, rg, true)
	var names: Array = copaliga_state.get("names", [])
	var idx: int = int(copaliga_state.get("idx", 0))

	_queue_cup_room("cup", names, idx, won, opp, tg, rg, idx +(1 if won else 0), "",
		I18n.t(CopaLiga.NOMBRE))
	if won:
		copaliga_state["idx"] = idx + 1
		if int(copaliga_state["idx"]) >= names.size():
			copaliga_state["champion"] = true
			copaliga_state["winner"] = player_team_id
			_crown(CopaLiga.TITULO)
		else:
			CopaLiga.sortea(copaliga_state, player_team_id)
			_copaliga_apply_draw(int(copaliga_state["idx"]))
	else:
		copaliga_state["alive"] = false
		CopaLiga.al_final(copaliga_state)
		_kill_future(CopaLiga.COMP)





func finalissima_arma(season: int, pais: String, campeon: String) -> void:
	var pareja: Array = Finalissima.cruce(pais, campeon, season)
	finalissima_state = {} if pareja.is_empty() \
			else {"season": season + 1, "pareja": pareja}







func _build_finalissima(entries: Array, league_len: int) -> void:
	if int(finalissima_state.get("season", -1)) != season_num \
			or finalissima_state.has("winner"):
		return
	var pareja: Array = finalissima_state.get("pareja", [])
	var rival: String = Finalissima.rival_de(pareja, Career.nationality)
	if rival.is_empty():
		return
	var cu: Dictionary = Career.nat_callup()
	if cu.is_empty() or String(cu.get("status", "fuera")) == "fuera":
		return
	var sin_nat: Array = entries.filter(func(e: Dictionary) -> bool:
		return String(e.get("comp", "")) != "nat")
	var win_weeks: Array = _fifa_weeks(sin_nat, league_len)
	if win_weeks.size() <= Finalissima.VENTANA:
		return
	entries.append({"comp": "nat", "opp": rival,
		"home": Nations.canon_id(String(pareja[0])) == Nations.canon_id(Career.nationality),
		"round": Finalissima.RONDA, "dead": false,
		"label": "SELECCIÓN · %s" % Finalissima.NOMBRE,
		"week": CalendarioMundo.semana_nat(int(win_weeks[Finalissima.VENTANA]),
			Finalissima.PASO)})




func _resolve_finalissima(opp: String, tg: int, rg: int) -> void:
	var won: bool = _nat_knockout_won(opp, tg, rg)
	finalissima_state["winner"] = Career.nationality if won else opp
	finalissima_state["champion"] = won
	finalissima_state["jugada"] = true
	finalissima_state["gf"] = tg
	finalissima_state["gc"] = rg


	if won and Career.nat_played_tournament("finalissima"):
		_crown(Finalissima.TITULO)
	_save()









func _build_naciones(entries: Array, league_len: int) -> void:
	if not LigaNaciones.es_temporada(season_num):
		return
	var confed: String = LigaNaciones.confed_de(Career.nationality)
	if confed.is_empty():
		return
	var cu: Dictionary = Career.nat_callup()
	if cu.is_empty() or String(cu.get("status", "fuera")) == "fuera":
		return
	if int(naciones_state.get("season", -1)) != season_num:
		var gs: Array = LigaNaciones.grupos(confed)
		var g: int = LigaNaciones.grupo_de(gs, Career.nationality)
		if g < 0:
			return
		var mio: String = ""
		for id in gs[g]:
			if Nations.canon_id(String(id)) == Nations.canon_id(Career.nationality):
				mio = String(id)
		naciones_state = {"season": season_num, "confed": confed, "grupos": gs, "g": g,
			"yo": mio, "sched": Schedule.double_round_robin(gs[g]),
			"table": LigaNaciones.tabla_vacia(gs[g]), "played": 0, "fase": "grupo",
			"alive": true, "ff": [], "semis": [], "rival_ff": "", "winner": ""}
	var sin_nat: Array = entries.filter(func(e: Dictionary) -> bool:
		return String(e.get("comp", "")) != "nat")
	var win_weeks: Array = _fifa_weeks(sin_nat, league_len)
	if win_weeks.size() <= LigaNaciones.VENTANA_FF:
		return
	var yo: String = String(naciones_state["yo"])
	var sched: Array = naciones_state["sched"]
	for r in sched.size():
		if r < int(naciones_state.get("played", 0)):
			continue
		for par in sched[r]:
			if String(par[0]) != yo and String(par[1]) != yo:
				continue
			var local: bool = String(par[0]) == yo
			entries.append({"comp": "nat", "round": LigaNaciones.RONDA, "nat_n_round": r,
				"opp": String(par[1] if local else par[0]), "home": local, "dead": false,
				"label": "SELECCIÓN · %s" % LigaNaciones.NOMBRE,
				"week": CalendarioMundo.semana_nat(int(win_weeks[r / 2]), r % 2)})

	var fase: String = String(naciones_state.get("fase", "grupo"))
	var alive: bool = bool(naciones_state.get("alive", false))
	var rival: String = String(naciones_state.get("rival_ff", ""))
	for paso in 2:
		var ronda: String = LigaNaciones.RONDA_SEMI if paso == 0 else LigaNaciones.RONDA_FINAL
		var viva: bool = alive and fase == ronda and not rival.is_empty()
		entries.append({"comp": "nat", "round": ronda, "opp": rival if viva else "",
			"home": true, "dead": not viva,
			"label": "SELECCIÓN · %s" % LigaNaciones.NOMBRE,
			"week": CalendarioMundo.semana_nat(int(win_weeks[LigaNaciones.VENTANA_FF]), paso)})







func _resolve_naciones(f: Dictionary, tg: int, rg: int) -> void:
	if naciones_state.is_empty() or not bool(naciones_state.get("alive", false)):
		return
	var yo: String = String(naciones_state["yo"])
	var opp: String = String(f.get("opp", ""))
	var ronda: String = String(f.get("round", ""))
	var confed: String = String(naciones_state["confed"])
	if ronda == LigaNaciones.RONDA:
		var r: int = int(f.get("nat_n_round", -1))
		if r < int(naciones_state.get("played", 0)):
			return
		var table: Dictionary = naciones_state["table"]
		var home: bool = bool(f.get("home", true))
		LigaNaciones.apunta(table, yo if home else opp, opp if home else yo,
			tg if home else rg, rg if home else tg)
		for par in (naciones_state["sched"] as Array)[r]:
			if String(par[0]) == yo or String(par[1]) == yo:
				continue
			var s: Array = _sim_score_nat(String(par[0]), String(par[1]))
			LigaNaciones.apunta(table, String(par[0]), String(par[1]), int(s[0]), int(s[1]))
		naciones_state["played"] = r + 1
		if r + 1 >=(naciones_state["sched"] as Array).size():
			_naciones_cierra_grupos()
	elif ronda == LigaNaciones.RONDA_SEMI or ronda == LigaNaciones.RONDA_FINAL:
		var won: bool = _nat_knockout_won(opp, tg, rg)
		var rng: RandomNumberGenerator = LigaNaciones.rng_de(confed, season_num, "ff")
		if ronda == LigaNaciones.RONDA_SEMI:
			var ff: Array = naciones_state["ff"]
			var donde: Array = LigaNaciones.rival_en_ff(ff, yo)
			var otra: int = 1 - int(donde[1])
			var s2: Dictionary = LigaNaciones.llave(String(ff[otra * 2]),
				String(ff[otra * 2 + 1]), rng)
			naciones_state["semis"] = [{"a": yo, "b": opp, "winner": yo if won else opp,
				"score": "%d-%d" % [tg, rg]}, s2]
			if won:
				naciones_state["fase"] = LigaNaciones.RONDA_FINAL
				naciones_state["rival_ff"] = String(s2["winner"])
				_naciones_revive(LigaNaciones.RONDA_FINAL, String(s2["winner"]))
			else:
				naciones_state["alive"] = false
				naciones_state["winner"] = String(LigaNaciones.llave(opp,
					String(s2["winner"]), rng)["winner"])
		else:
			naciones_state["alive"] = false
			naciones_state["winner"] = yo if won else opp
			naciones_state["final"] = {"a": yo, "b": opp, "winner": yo if won else opp,
				"score": "%d-%d" % [tg, rg]}
			if won:
				naciones_state["champion"] = true
				if Career.nat_played_tournament("naciones"):
					_crown(LigaNaciones.TITULO)
	_save()





func _naciones_cierra_grupos() -> void:
	var confed: String = String(naciones_state["confed"])
	var yo: String = String(naciones_state["yo"])
	var g: int = int(naciones_state["g"])
	var rng: RandomNumberGenerator = LigaNaciones.rng_de(confed, season_num, "grupos")
	var tablas: Array = []
	var gs: Array = naciones_state["grupos"]
	for i in gs.size():
		if i == g:
			tablas.append(NatTeam._sorted_rows(naciones_state["table"], yo))
		else:
			tablas.append(LigaNaciones.sim_grupo(gs[i], rng))
	naciones_state["tablas"] = tablas
	var ff: Array = LigaNaciones.final_four(tablas)
	naciones_state["ff"] = ff
	var donde: Array = LigaNaciones.rival_en_ff(ff, yo)
	if not String(donde[0]).is_empty():
		naciones_state["fase"] = LigaNaciones.RONDA_SEMI
		naciones_state["rival_ff"] = String(donde[0])
		_naciones_revive(LigaNaciones.RONDA_SEMI, String(donde[0]))
		return
	naciones_state["alive"] = false
	naciones_state["fase"] = "fuera"
	if ff.size() >= 4:
		var s1: Dictionary = LigaNaciones.llave(String(ff[0]), String(ff[1]), rng)
		var s2: Dictionary = LigaNaciones.llave(String(ff[2]), String(ff[3]), rng)
		naciones_state["semis"] = [s1, s2]
		naciones_state["winner"] = String(LigaNaciones.llave(String(s1["winner"]),
			String(s2["winner"]), rng)["winner"])



func _naciones_revive(ronda: String, rival: String) -> void:
	_nat_revive(ronda, rival)



func _nat_revive(ronda: String, rival: String, label: String = "") -> void:
	for i in range(season_day + 1, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == "nat" and String(e.get("round", "")) == ronda:
			e["opp"] = rival
			e["dead"] = false
			if not label.is_empty():
				e["label"] = label
			break









func _build_olimpicos(entries: Array) -> void:
	if not JuegosOlimpicos.es_temporada(season_num) or not JuegosOlimpicos.juega(Career.nationality):
		return
	if not Career.olimpicos_convocado():
		return
	if int(olimpicos_state.get("season", -1)) != season_num:
		var gs: Array = JuegosOlimpicos.grupos(season_num)
		var g: int = JuegosOlimpicos.grupo_de(gs, Career.nationality)
		if g < 0:
			return
		var mio: String = ""
		for id in gs[g]:
			if Nations.canon_id(String(id)) == Nations.canon_id(Career.nationality):
				mio = String(id)
		olimpicos_state = {"season": season_num, "grupos": gs, "g": g, "yo": mio,
			"sched": Schedule.single_round_robin(gs[g]),
			"table": LigaNaciones.tabla_vacia(gs[g]), "played": 0, "fase": "grupo",
			"alive": true, "decidido": false, "rival": "", "medalla_tipo": ""}
	if not bool(olimpicos_state.get("alive", false)):
		return
	var inicio: float = 0.0
	for e in entries:
		inicio = maxf(inicio, floor(float((e as Dictionary).get("week", 0.0))))
	inicio += 1.0
	var yo: String = String(olimpicos_state["yo"])
	var sched: Array = olimpicos_state["sched"]
	var rotulo: String = "SELECCIÓN · %s" % JuegosOlimpicos.NOMBRE
	for r in sched.size():
		if r < int(olimpicos_state.get("played", 0)):
			continue
		for par in sched[r]:
			if String(par[0]) != yo and String(par[1]) != yo:
				continue
			entries.append({"comp": "nat", "round": JuegosOlimpicos.RONDA, "nat_o_round": r,
				"opp": String(par[1] if String(par[0]) == yo else par[0]),
				"home": String(par[0]) == yo, "dead": false, "label": rotulo,
				"week": inicio + float(r)})
	var fase: String = String(olimpicos_state.get("fase", "grupo"))
	var rival: String = String(olimpicos_state.get("rival", ""))
	var kos: Array = [JuegosOlimpicos.RONDA_CUARTOS, JuegosOlimpicos.RONDA_SEMI,
		JuegosOlimpicos.RONDA_MEDALLA]
	for i in kos.size():
		var viva: bool = fase == String(kos[i]) and not rival.is_empty()
		entries.append({"comp": "nat", "round": String(kos[i]), "opp": rival if viva else "",
			"home": true, "dead": not viva, "label": rotulo,
			"week": inicio + float(sched.size() + i)})





func _olimpicos_choque() -> void:
	if int(olimpicos_state.get("season", -1)) != season_num \
			or bool(olimpicos_state.get("decidido", true)):
		return
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]
		if bool(e.get("dead", false)):
			continue
		if String(e.get("comp", "")) != "nat" \
				or not (String(e.get("round", "")) in JuegosOlimpicos.RONDAS):
			return
		olimpicos_state["decidido"] = true
		if JuegosOlimpicos.choca_continental(nat_state):
			olimpicos_state["alive"] = false
			olimpicos_state["fase"] = "choque"
			_kill_olimpicos()
		return


func _kill_olimpicos() -> void:
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == "nat" \
				and String(e.get("round", "")) in JuegosOlimpicos.RONDAS:
			e["dead"] = true






func _resolve_olimpicos(f: Dictionary, tg: int, rg: int) -> void:
	if olimpicos_state.is_empty() or not bool(olimpicos_state.get("alive", false)):
		return
	var yo: String = String(olimpicos_state["yo"])
	var opp: String = String(f.get("opp", ""))
	var ronda: String = String(f.get("round", ""))
	var rng: RandomNumberGenerator = JuegosOlimpicos.rng_de(season_num, ronda)
	var rotulo: String = "SELECCIÓN · %s" % JuegosOlimpicos.NOMBRE
	if ronda == JuegosOlimpicos.RONDA:
		var r: int = int(f.get("nat_o_round", -1))
		if r < int(olimpicos_state.get("played", 0)):
			return
		var table: Dictionary = olimpicos_state["table"]
		var home: bool = bool(f.get("home", true))
		LigaNaciones.apunta(table, yo if home else opp, opp if home else yo,
			tg if home else rg, rg if home else tg)
		for par in (olimpicos_state["sched"] as Array)[r]:
			if String(par[0]) == yo or String(par[1]) == yo:
				continue
			var s: Array = _sim_score_nat(String(par[0]), String(par[1]))
			LigaNaciones.apunta(table, String(par[0]), String(par[1]), int(s[0]), int(s[1]))
		olimpicos_state["played"] = r + 1
		if r + 1 >=(olimpicos_state["sched"] as Array).size():
			var tablas: Array = []
			var gs: Array = olimpicos_state["grupos"]
			var rg_g: RandomNumberGenerator = JuegosOlimpicos.rng_de(season_num, "grupos")
			for i in gs.size():
				tablas.append(NatTeam._sorted_rows(table, yo) if i == int(olimpicos_state["g"])
					else JuegosOlimpicos.sim_grupo(gs[i], rg_g))
			olimpicos_state["tablas"] = tablas
			var qf: Array = JuegosOlimpicos.cuartos(tablas)
			olimpicos_state["cuartos"] = qf
			var rival: String = JuegosOlimpicos.rival_en(qf, yo)
			if rival.is_empty():
				_olimpicos_fuera_desde(qf, rng)
			else:
				_olimpicos_pasa(JuegosOlimpicos.RONDA_CUARTOS, rival, rotulo)
	elif ronda == JuegosOlimpicos.RONDA_CUARTOS:
		var won: bool = _nat_knockout_won(opp, tg, rg)
		var qf: Array = olimpicos_state["cuartos"]
		var sf: Array = JuegosOlimpicos.ronda_de_fondo(qf, rng)
		var k: int = qf.find(yo) / 2
		sf[k] = yo if won else opp
		olimpicos_state["semis"] = sf
		if won:
			_olimpicos_pasa(JuegosOlimpicos.RONDA_SEMI, JuegosOlimpicos.rival_en(sf, yo), rotulo)
		else:
			_olimpicos_fuera_desde(sf, rng)
	elif ronda == JuegosOlimpicos.RONDA_SEMI:
		var won: bool = _nat_knockout_won(opp, tg, rg)
		var sf: Array = olimpicos_state["semis"]
		var fin: Array = JuegosOlimpicos.ronda_de_fondo(sf, rng)
		fin[sf.find(yo) / 2] = yo if won else opp
		olimpicos_state["final"] = fin
		var otro: String = String(fin[1]) if String(fin[0]) ==(yo if won else opp) \
				else String(fin[0])
		if won:
			olimpicos_state["medalla_tipo"] = "final"
			_olimpicos_pasa(JuegosOlimpicos.RONDA_MEDALLA, otro,
				"%s · FINAL" % rotulo)
		else:
			var caidos: Array = JuegosOlimpicos.perdedores(sf, fin)
			olimpicos_state["medalla_tipo"] = "bronce"
			_olimpicos_pasa(JuegosOlimpicos.RONDA_MEDALLA,
				String(caidos[1]) if String(caidos[0]) == yo else String(caidos[0]),
				"%s · BRONCE" % rotulo)
	elif ronda == JuegosOlimpicos.RONDA_MEDALLA:
		var won: bool = _nat_knockout_won(opp, tg, rg)
		var sf: Array = olimpicos_state["semis"]
		var fin: Array = olimpicos_state["final"]
		var de_fondo: Dictionary = JuegosOlimpicos.medallas_de_fondo(sf, fin, rng)
		olimpicos_state["alive"] = false
		olimpicos_state["fase"] = "hecho"
		if String(olimpicos_state.get("medalla_tipo", "")) == "final":
			olimpicos_state["oro"] = yo if won else opp
			olimpicos_state["plata"] = opp if won else yo
			olimpicos_state["bronce"] = String(de_fondo["bronce"])
			if won:
				olimpicos_state["champion"] = true
				if Career.nat_played_tournament("olimpicos"):
					_crown(JuegosOlimpicos.TITULO)
		else:
			olimpicos_state["oro"] = String(de_fondo["oro"])
			olimpicos_state["plata"] = String(de_fondo["plata"])
			olimpicos_state["bronce"] = yo if won else opp
	_save()



func _olimpicos_pasa(ronda: String, rival: String, label: String) -> void:
	olimpicos_state["fase"] = ronda
	olimpicos_state["rival"] = rival
	_nat_revive(ronda, rival, label)




func _olimpicos_fuera_desde(cruces: Array, rng: RandomNumberGenerator) -> void:
	olimpicos_state["alive"] = false
	olimpicos_state["fase"] = "fuera"
	var ronda: Array = cruces
	while ronda.size() > 4:
		ronda = JuegosOlimpicos.ronda_de_fondo(ronda, rng)
	if ronda.size() == 4:
		var med: Dictionary = JuegosOlimpicos.medallas_de_fondo(ronda,
			JuegosOlimpicos.ronda_de_fondo(ronda, rng), rng)
		for k in med:
			olimpicos_state[k] = med[k]















func intercont_campeones(season: int) -> Dictionary:
	var out: Dictionary = {}
	for confed in ["UEFA", "CONMEBOL", "CONCACAF", "AFC", "CAF", "OFC"]:
		var id: String = cwc_confed_champion(confed, season)






		var real0: bool = season == 0 \
				and String(CWC_CAMPEONES_TEMPORADA_0.get(confed, "")) == id
		if confed in ["AFC", "CAF", "OFC"] and id == player_team_id and not real0 \
				and id != last_ace_winner and id != last_caf_winner \
				and id != last_ofc_winner:
			id = ""
		out[confed] = id
	if int(intercont_state.get("season", -1)) == season_num \
			and int(intercont_state.get("idx", 0)) > 0 \
			and int(intercont_state.get("v", 0)) < 2:
		out["OFC"] = ""




	if int(intercont_state.get("season", -1)) == season_num \
			and int(intercont_state.get("idx", 0)) > 0 \
			and int(intercont_state.get("v", 0)) < 3:
		out["abre"] = "AFC"
	return out





func intercont_tu_camino(season: int) -> Array:
	if player_team_id.is_empty() or not (player_team_id in
			[last_ucl_winner, last_lib_winner, last_cca_winner, last_ace_winner,
			last_caf_winner, last_ofc_winner]):
		return []
	var cuadro: Dictionary = Supercopas.intercont_cuadro_de(intercont_campeones(season),
		season, player_team_id)
	return Supercopas.intercont_camino(cuadro, player_team_id)











func _build_intercont(entries: Array, league_len: int, temprano: bool = false) -> void:
	var camino: Array = intercont_tu_camino(season_num - 1)
	if camino.is_empty():
		return
	var st: Dictionary = intercont_state if int(intercont_state.get("season", -1)) == season_num else {}
	if not st.is_empty() and not bool(st.get("alive", true)):
		return
	var hechas: int = int(st.get("idx", 0))









	var pais: String = Teams.country_of(player_team_id)
	var n_liga: int = CalendarioMundo.league_len_de(pais, player_div())
	if n_liga < 1:
		n_liga = league_len
	var sin_mes: float = float(league_len) * Supercopas.INTERCONT_DESDE_SIN_MES
	var desde_dic: float = Supercopas.semana_del_mes(Supercopas.INTERCONT_MES_DIC,
		Supercopas.INTERCONT_DENTRO_DIC, n_liga, pais)


	var tras_liga: bool = desde_dic > float(n_liga)











	var dic_cierra: bool = CalendarioMundo.mes_de(float(n_liga), n_liga, pais) \
			== Supercopas.INTERCONT_MES_DIC
	if dic_cierra and not tras_liga:
		desde_dic = maxf(desde_dic, float(n_liga) + 1.0)
		tras_liga = true
	var dic_temprano: bool = tras_liga
	if temprano and not dic_temprano:
		return
	if desde_dic < 0.0:
		desde_dic = sin_mes
	var ocupadas: Array = _semanas_ocupadas(entries)
	var fifa: Array = _semanas_fifa(entries)
	var n_sept: int = 0
	for paso in camino:
		if Supercopas.INTERCONT_SEPTIEMBRE.has(String((paso as Dictionary)["round"])):
			n_sept += 1



	var semanas: Array = []
	if not temprano:
		var desde_sept: float = Supercopas.semana_del_mes(Supercopas.INTERCONT_MES_SEPT,
			Supercopas.INTERCONT_DENTRO_SEPT, n_liga, pais)
		semanas = Supercopas.hueco(ocupadas, fifa, desde_sept if desde_sept >= 0.0 else sin_mes,
			n_sept, Supercopas.SEP_PROPIA, Supercopas.INTERCONT_SEP_FIFA)
		if n_sept > 0 and desde_sept >= 0.0 and CalendarioMundo.mes_de(float(semanas[0]), n_liga,
				pais) != Supercopas.INTERCONT_MES_SEPT:
			var otra: Array = Supercopas.hueco(ocupadas, fifa,
				Supercopas.semana_del_mes(Supercopas.INTERCONT_MES_SEPT, 0.0, n_liga, pais),
				n_sept, Supercopas.SEP_PROPIA, Supercopas.INTERCONT_SEP_FIFA)
			if CalendarioMundo.mes_de(float(otra[0]), n_liga, pais) == Supercopas.INTERCONT_MES_SEPT:
				semanas = otra
		if not semanas.is_empty():
			desde_dic = maxf(desde_dic, float(semanas[semanas.size() - 1]) + Supercopas.SEP_PROPIA)
	else:
		for _i in n_sept:
			semanas.append(-1.0)





	var sede: Array = Supercopas.INTERCONT_SEDE_TRAS_LIGA if tras_liga \
			else Supercopas.INTERCONT_SEDE_EN_LIGA
	var w: float = floorf(desde_dic) + float(sede[0])
	if w < desde_dic - 0.001:
		w += 1.0
	var ya: Array = ocupadas + semanas
	for k in camino.size() - n_sept:
		if k > 0:
			w = float(semanas[semanas.size() - 1]) + float(sede[mini(k, sede.size() - 1)])
		var dia: float = float(Supercopas.hueco(ya, fifa, w, 1, 0.0)[0])
		semanas.append(dia)
		ya.append(dia)

	var abre: String = "AFC"
	if n_sept > 0:
		abre = Supercopas.intercont_abre(intercont_campeones(season_num - 1), season_num - 1)
	for i in range(hechas, camino.size()):

		var es_dic: bool = i >= n_sept
		if (temprano and not es_dic) or (not temprano and es_dic and dic_temprano):
			continue
		var paso: Dictionary = camino[i]
		var rid: String = String(paso["round"])
		entries.append({"comp": "intercont", "opp": String(paso["opp"]), "home": true,
			"round": rid, "dead": false, "week": float(semanas[i]),
			"label": "%s · %s" % [Supercopas.INTERCONT_ETIQUETA,
				Supercopas.ronda_nombre(rid, abre)]})




func _resolve_intercont(round_id: String, opp: String, tg: int, rg: int) -> void:
	if int(intercont_state.get("season", -1)) != season_num:



		intercont_state = {"season": season_num, "idx": 0, "alive": true,
			"champion": false, "results": [], "v": 3}
	var won: bool = _knockout_won(opp, tg, rg)
	_log_round_result(player_team_id, opp, tg, rg, true)
	(intercont_state["results"] as Array).append({"round": round_id, "opp": opp,
		"gf": tg, "gc": rg, "won": won})
	intercont_state["idx"] = int(intercont_state.get("idx", 0)) + 1
	if not won:
		intercont_state["alive"] = false
		_kill_future("intercont")
	elif round_id == "Final":
		intercont_state["champion"] = true
		_crown(Supercopas.INTERCONT)
	_save()









func _build_ligas(entries: Array, league_len: int) -> void:
	if int(ligas_state.get("season", -1)) != season_num:
		ligas_state = {"season": season_num,
			"mls": _country_order(CopaLigas.PAIS_MLS).slice(0, CopaLigas.PLAZAS),
			"mx": _country_order(CopaLigas.PAIS_MX).slice(0, CopaLigas.PLAZAS),
			"club": "", "idx": 0, "alive": true, "champion": false, "results": [],
			"ganadores": {}}
	var mls: Array = ligas_state.get("mls", [])
	var mx: Array = ligas_state.get("mx", [])
	if CopaLigas.llaves(mls, mx).is_empty() or not bool(ligas_state.get("alive", true)):
		return
	var hechas: int = int(ligas_state.get("idx", 0))
	if hechas > 0 and String(ligas_state.get("club", "")) != player_team_id:
		return
	var esta: bool = CopaLigas.siembra(player_team_id, mls, mx) > 0
	if hechas == 0:
		ligas_state["club"] = player_team_id if esta else ""
	if not esta:
		return
	var camino: Array = CopaLigas.camino(CopaLigas.cuadro_de(mls, mx, season_num,
		player_team_id, ligas_state.get("ganadores", {})), player_team_id, mls, mx)
	if hechas >= camino.size():
		return


	var pais: String = Teams.country_of(player_team_id)
	var n_liga: int = CalendarioMundo.league_len_de(pais, player_div())
	if n_liga < 1:
		n_liga = league_len
	var desde: float = Supercopas.semana_del_mes(CopaLigas.MES, CopaLigas.DENTRO, n_liga, pais)
	if desde < 0.0:
		desde = 7.0
	var semanas: Array = Supercopas.hueco(_semanas_ocupadas(entries), _semanas_fifa(entries),
		desde, camino.size(), Supercopas.SEP_PROPIA)
	for i in range(hechas, camino.size()):
		var paso: Dictionary = camino[i]
		entries.append({"comp": CopaLigas.COMP, "opp": String(paso["opp"]),
			"home": bool(paso["home"]), "round": String(paso["round"]),
			"cruce": String(paso["cruce"]), "dead": false, "week": float(semanas[i]),
			"label": CopaLigas.etiqueta(String(paso["round"]))})





func _resolve_ligas(round_id: String, cruce: String, opp: String, tg: int, rg: int) -> void:
	if int(ligas_state.get("season", -1)) != season_num:
		ligas_state = {"season": season_num, "mls": [], "mx": [], "club": player_team_id,
			"idx": 0, "alive": true, "champion": false, "results": [], "ganadores": {}}
	var won: bool = _knockout_won(opp, tg, rg)
	_log_round_result(player_team_id, opp, tg, rg, true)
	(ligas_state["results"] as Array).append({"round": round_id, "opp": opp,
		"gf": tg, "gc": rg, "won": won})
	if not cruce.is_empty():
		(ligas_state["ganadores"] as Dictionary)[cruce] = player_team_id if won else opp
	ligas_state["idx"] = int(ligas_state.get("idx", 0)) + 1
	if not won:
		ligas_state["alive"] = false
		_kill_future(CopaLigas.COMP)
	elif round_id == "Final":
		ligas_state["champion"] = true
		_crown(CopaLigas.TITULO)
	_save()










func _reached_final(state: Dictionary) -> bool:





	if state.has("ko_names"):
		var kn: int = int((state.get("ko_names", []) as Array).size())
		return kn > 0 and int(state.get("ko_idx", 0)) >= kn - 1
	var n: int = int(state.get("names", []).size())
	if n <= 0:
		return false
	return int(state.get("idx", 0)) >= n - 1







func _euro_sim_id(key: String) -> String:
	return player_team_id if key == YOU_KEY else key





func _resolve_euro_group(comp: String, round_idx: int, tg: int, rg: int) -> void:
	var state: Dictionary = euro_state(comp)
	var groups: Array = state.get("groups", [])
	if groups.is_empty():
		return



	var liga: bool = bool(state.get("league_phase", false))
	for gi in groups.size():
		var g: Dictionary = groups[gi]
		var sched: Array = g["schedule"]
		if round_idx >= sched.size():
			continue
		var gkey: int = -1 if liga else gi
		var table: Dictionary = g["table"]
		for pair in sched[round_idx]:
			var a: String = String(pair[0])
			var b: String = String(pair[1])
			if a == YOU_KEY:
				_apply_row(table, YOU_KEY, b, tg, rg)
				_log_round_result(player_team_id, b, tg, rg, true, gkey)
			elif b == YOU_KEY:
				_apply_row(table, a, YOU_KEY, rg, tg)
				_log_round_result(a, player_team_id, rg, tg, true, gkey)
			else:





				var s: Array = _sim_score(_euro_sim_id(a), _euro_sim_id(b),
					comp == "cwc" or comp == "ofc", comp)
				_apply_row(table, a, b, s[0], s[1])
				_log_round_result(_euro_sim_id(a), _euro_sim_id(b),
					s[0], s[1], false, gkey)
	var ultima: int = int(groups[0]["schedule"].size()) - 1
	if comp == "ofc":






		for g in groups:
			ultima = maxi(ultima,((g as Dictionary)["schedule"] as Array).size() - 1)
		if round_idx < ultima and not _amer_juegas_jornada(groups[0], round_idx + 1):
			_resolve_euro_group(comp, round_idx + 1, 0, 0)
			return
	if round_idx == ultima:
		_euro_seed_bracket(comp, state)



func _amer_juegas_jornada(g: Dictionary, r: int) -> bool:
	var sched: Array = g.get("schedule", [])
	if r < 0 or r >= sched.size():
		return false
	for pair in (sched[r] as Array):
		if String(pair[0]) == YOU_KEY or String(pair[1]) == YOU_KEY:
			return true
	return false




func euro_group_order(g: Dictionary) -> Array:
	var table: Dictionary = g.get("table", {})
	var rows: Array = []
	for k in table:
		rows.append({"key": String(k), "pts": int(table[k]["pts"]),
			"dif": int(table[k]["gf"]) - int(table[k]["gc"]),
			"gf": int(table[k]["gf"])})
	rows.sort_custom(table_before)
	var out: Array = []
	for r in rows:
		out.append(String(r["key"]))
	return out



func euro_group_position(state: Dictionary) -> int:
	var order: Array = euro_group_order(euro_you_group(state))
	var i: int = order.find(YOU_KEY)
	return i + 1 if i >= 0 else order.size()







func _euro_seed_bracket(comp: String, state: Dictionary) -> void:


	if Continental.es_americana(comp):
		_amer_seed_tras_grupos(comp, state)
		return
	if bool(state.get("league_phase", false)):
		_euro_seed_from_league(comp, state)
	else:
		_euro_seed_from_groups(comp, state)


















func _euro_seed_from_league(comp: String, state: Dictionary) -> void:
	var groups: Array = state.get("groups", [])
	if groups.is_empty():
		return
	var order: Array = euro_group_order(groups[0])
	var direct: Array = order.slice(0, mini(EURO_DIRECT, order.size()))
	var po: Array = order.slice(mini(EURO_DIRECT, order.size()),
		mini(EURO_PLAYOFF, order.size()))
	@warning_ignore("integer_division")
	var cruces: int = po.size() / 2

	var pairs: Array = []
	for i in cruces:
		pairs.append({"a": String(po[i]), "b": String(po[po.size() - 1 - i]),
			"winner": "", "score": ""})









	var slots: Array[int] = []
	if direct.size() == cruces:
		slots = Schedule.bracket_slots(direct.size())
	var seeds: Array = direct
	var ties: Array = pairs
	if not slots.is_empty():
		seeds = []
		ties = []
		for k in cruces:
			seeds.append(direct[slots[cruces - 1 - k]])
			ties.append(pairs[cruces - 1 - slots[k]])
	state["seeds"] = seeds
	state["bracket"] = [ties] if not ties.is_empty() else []
	state["ko_names"] = UCL_KO_NAMES.duplicate()

	var pos: int = order.find(YOU_KEY) + 1


	if pos <= 0 or pos > EURO_PLAYOFF:
		state["advanced"] = false
		state["alive"] = false
		_kill_future(comp)
		_euro_sim_to_end(state)
		return
	state["advanced"] = true
	_revive_euro_ko(comp)
	if pos <= EURO_DIRECT:







		state["ko_idx"] = EURO_KO_PLAYOFF + 1
		_kill_euro_round(comp, EURO_KO_PLAYOFF)
		_euro_play_round_without_you(state, EURO_KO_PLAYOFF)
		_euro_set_you_opp(comp, state, EURO_KO_PLAYOFF + 1)
	else:
		state["ko_idx"] = EURO_KO_PLAYOFF
		_euro_set_you_opp(comp, state, EURO_KO_PLAYOFF)





func _euro_play_round_without_you(state: Dictionary, ko_idx: int, comp: String = "") -> void:
	var bracket: Array = state.get("bracket", [])
	if ko_idx >= bracket.size():
		return
	var ties: Array = bracket[ko_idx]
	_euro_resolve_round(ties, 0, 0, {"played": false, "won": false}, _ronda_dos(comp, ties),
		comp)
	if ties.size() > 1:
		bracket.append(_euro_bracket_next(state, ties))



func _kill_euro_round(comp: String, ko_idx: int) -> void:




	for e in calendar:
		if String(e.get("comp", "")) == comp and String(e.get("round", "")) != "grupo" \
				and int(e.get("ko_idx", -1)) == ko_idx:
			e["dead"] = true





func _euro_seed_from_groups(comp: String, state: Dictionary) -> void:
	var groups: Array = state.get("groups", [])
	var tops: Array = []
	for g in groups:
		tops.append(euro_group_order(g).slice(0, CWC_QUALIFY))
	var n: int = tops.size()
	var ties: Array = []
	for i in n:
		var a: Array = tops[i]
		var b: Array = tops[(i + 1) % n]
		if a.is_empty() or b.size() < CWC_QUALIFY:
			continue
		ties.append({"a": String(a[0]), "b": String(b[CWC_QUALIFY - 1]),
			"winner": "", "score": ""})
	state["bracket"] = [ties] if not ties.is_empty() else []



	var rounds: int = maxi(int(round(log(maxf(float(ties.size()), 1.0)) / log(2.0))) + 1, 1)
	state["ko_names"] = CWC_KO_NAMES.slice(maxi(CWC_KO_NAMES.size() - rounds, 0))
	var you_in: bool = ties.any(func(t): return String(t["a"]) == YOU_KEY \
			or String(t["b"]) == YOU_KEY)
	state["advanced"] = you_in
	if you_in:
		_euro_set_you_opp(comp, state, 0)
		_revive_euro_ko(comp)
	else:
		state["alive"] = false
		_kill_future(comp)
		_euro_sim_to_end(state)




func _euro_set_you_opp(comp: String, state: Dictionary, ko_idx: int) -> void:
	var bracket: Array = state.get("bracket", [])
	if ko_idx >= bracket.size():
		return
	var opp: String = ""
	for t in bracket[ko_idx]:
		if String(t["a"]) == YOU_KEY:
			opp = String(t["b"])
		elif String(t["b"]) == YOU_KEY:
			opp = String(t["a"])
	if opp.is_empty():
		return
	var ko_opps: Array = state.get("ko_opps", [])
	while ko_opps.size() <= ko_idx:
		ko_opps.append("")
	ko_opps[ko_idx] = opp
	state["ko_opps"] = ko_opps








	var amer: bool = Continental.es_americana(comp)
	var second_home: bool = _amer_you_second_home(comp, state, opp, ko_idx) if amer \
			else _euro_you_second_home(state, opp)
	var dos: bool = Continental.ko_dos_partidos(comp, ko_idx) if amer \
			else (ko_idx < EURO_KO_TWO_LEGS.size() and EURO_KO_TWO_LEGS[ko_idx])
	var final_en_casa: bool = amer and Continental.es_final(comp, ko_idx) \
			and not Continental.final_neutral(comp)
	for e in calendar:
		if String(e.get("comp", "")) == comp and String(e.get("round", "")) != "grupo" \
				and int(e.get("ko_idx", -1)) == ko_idx:
			e["opp"] = opp
			var leg: int = int(e.get("leg", 1))
			if dos:
				e["home"] = second_home if leg == 1 else not second_home
			elif final_en_casa:
				e["home"] = second_home










func _euro_you_second_home(state: Dictionary, opp_key: String) -> bool:
	var groups: Array = state.get("groups", [])
	if groups.is_empty():
		return true
	var order: Array = euro_group_order(groups[0])
	var mine: int = order.find(YOU_KEY)
	var his: int = order.find(opp_key)
	if mine < 0 or his < 0:
		return true
	return mine < his









func _euro_tie_score(a: String, b: String, winner: String,
		neutral: bool = false, comp: String = "league") -> String:
	for _i in 12:
		var s: Array = _sim_score(_euro_sim_id(a), _euro_sim_id(b), neutral, comp)
		if int(s[0]) == int(s[1]):
			continue
		var won_a: bool = int(s[0]) > int(s[1])
		if won_a ==(winner == a):
			return "%d-%d" % [int(s[0]), int(s[1])]
	return "1-0" if winner == a else "0-1"





















func _euro_two_leg_scores(a: String, b: String, winner: String,
		comp: String = "league", visitante: bool = false) -> Array:
	var ida: String = ""
	var vuelta: String = ""
	for _i in 12:
		var l1: Array = _sim_score(_euro_sim_id(a), _euro_sim_id(b), false, comp)
		var l2: Array = _sim_score(_euro_sim_id(b), _euro_sim_id(a), false, comp)
		var ga: int = int(l1[0]) + int(l2[1])
		var gb: int = int(l1[1]) + int(l2[0])
		ida = "%d-%d" % [int(l1[0]), int(l1[1])]





		vuelta = "%d-%d" % [int(l2[1]), int(l2[0])]
		if ga == gb:
			if not visitante:
				continue

			var v: int = Continental.decide_visitante(int(l2[1]), int(l1[1]))
			if v == 0 or (v > 0) !=(winner == a):
				continue
			return [ida, vuelta, "%d-%d" % [ga, gb]]
		if (ga > gb) ==(winner == a):
			return [ida, vuelta, "%d-%d" % [ga, gb]]


	if winner == a:
		return ["1-0", "0-0", "1-0"]
	return ["0-1", "0-0", "0-1"]



















func _euro_resolve_round(ties: Array, tg: int, rg: int, you: Dictionary,
		two_legs: bool = false, comp: String = "") -> void:
	var amer: bool = Continental.es_americana(comp)
	for t in ties:
		if not String(t["winner"]).is_empty():
			continue
		if amer:
			_amer_local_de_final(comp, t, ties.size() <= 1)
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		if a == YOU_KEY or b == YOU_KEY:
			var opp: String = b if a == YOU_KEY else a
			var won: bool = _knockout_won(opp, tg, rg)
			t["winner"] = YOU_KEY if won else opp
			t["score"] = "%d-%d" %([tg, rg] if a == YOU_KEY else [rg, tg])
			you["played"] = true
			you["won"] = won
		else:
			var w: String = _cup_tie_winner(_euro_sim_id(a), _euro_sim_id(b))
			var key: String = a if w == _euro_sim_id(a) else b
			t["winner"] = key
			if two_legs:
				var legs: Array = _euro_two_leg_scores(a, b, key, comp, \
						Continental.goles_visitante(comp)) if amer \
						else _euro_two_leg_scores(a, b, key)
				t["leg1"] = String(legs[0])
				t["leg2"] = String(legs[1])
				t["score"] = String(legs[2])
			elif amer:



				t["score"] = _euro_tie_score(a, b, key,
					Continental.cruce_neutral(comp, ties.size()), comp)
			else:

				t["score"] = _euro_tie_score(a, b, key, ties.size() <= 1)


















func _euro_resolve_leg(ties: Array, leg: int, tg: int, rg: int,
		you: Dictionary, comp: String = "", visitante: int = 0) -> void:
	var two_legs: bool = _ronda_dos(comp, ties)
	if not two_legs or leg >= 1:
		_euro_resolve_leg2(ties, tg, rg, you, two_legs, visitante, comp)
		return
	var amer: bool = Continental.es_americana(comp)
	for t in ties:
		if not String(t["winner"]).is_empty():
			continue
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		if a == YOU_KEY or b == YOU_KEY:
			t["leg1"] = "%d-%d" %([tg, rg] if a == YOU_KEY else [rg, tg])
			you["played"] = true


		else:
			var w: String = _cup_tie_winner(_euro_sim_id(a), _euro_sim_id(b))
			var key: String = a if w == _euro_sim_id(a) else b
			var legs: Array = _euro_two_leg_scores(a, b, key, comp, \
					Continental.goles_visitante(comp)) if amer \
					else _euro_two_leg_scores(a, b, key)



			t["pend"] = key
			t["leg1"] = String(legs[0])
			t["leg2"] = String(legs[1])
			t["agg"] = String(legs[2])







func _euro_resolve_leg2(ties: Array, tg: int, rg: int, you: Dictionary,
		two_legs: bool, visitante: int = 0, comp: String = "") -> void:
	var amer: bool = Continental.es_americana(comp)
	for t in ties:
		if not String(t["winner"]).is_empty():
			continue
		if amer:
			_amer_local_de_final(comp, t, ties.size() <= 1)
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		if a == YOU_KEY or b == YOU_KEY:
			var opp: String = b if a == YOU_KEY else a


			var prev: Array = _split_tie_goals(String(t.get("leg1", "")))
			var mine: int = tg
			var his: int = rg
			if not prev.is_empty():
				var p_mine: int = int(prev[0]) if a == YOU_KEY else int(prev[1])
				var p_his: int = int(prev[1]) if a == YOU_KEY else int(prev[0])
				mine += p_mine
				his += p_his
				t["leg2"] = "%d-%d" %([tg, rg] if a == YOU_KEY else [rg, tg])
			var won: bool = _knockout_won(opp, mine, his, visitante)
			t["winner"] = YOU_KEY if won else opp
			t["score"] = "%d-%d" %([mine, his] if a == YOU_KEY else [his, mine])
			you["played"] = true
			you["won"] = won
		elif not String(t.get("pend", "")).is_empty():

			t["winner"] = String(t["pend"])
			t["score"] = String(t.get("agg", ""))
			t.erase("pend")
		else:
			var w: String = _cup_tie_winner(_euro_sim_id(a), _euro_sim_id(b))
			var key: String = a if w == _euro_sim_id(a) else b
			t["winner"] = key
			if two_legs:
				var legs: Array = _euro_two_leg_scores(a, b, key, comp, \
						Continental.goles_visitante(comp)) if amer \
						else _euro_two_leg_scores(a, b, key)
				t["leg1"] = String(legs[0])
				t["leg2"] = String(legs[1])
				t["score"] = String(legs[2])
			elif amer:
				t["score"] = _euro_tie_score(a, b, key,
					Continental.cruce_neutral(comp, ties.size()), comp)
			else:
				t["score"] = _euro_tie_score(a, b, key, ties.size() <= 1)





func _split_tie_goals(s: String) -> Array:
	var p: PackedStringArray = s.split("-")
	if p.size() != 2 or not p[0].is_valid_int() or not p[1].is_valid_int():
		return []
	return [int(p[0]), int(p[1])]

















func _euro_bracket_next(state: Dictionary, ties: Array) -> Array:
	var seeds: Array = state.get("seeds", [])
	if seeds.is_empty():
		return _euro_next_round(ties)
	state["seeds"] = []
	var next: Array = []
	for i in mini(seeds.size(), ties.size()):
		next.append({"a": String(seeds[i]),
			"b": String(ties[ties.size() - 1 - i]["winner"]),
			"winner": "", "score": ""})
	return next



func _euro_next_round(ties: Array) -> Array:
	var next: Array = []
	for i in range(0, ties.size() - 1, 2):
		next.append({"a": String(ties[i]["winner"]), "b": String(ties[i + 1]["winner"]),
			"winner": "", "score": ""})
	return next












func _log_round_ties(ties: Array, sim_id: Callable, key: String = "score",
		agg: bool = false) -> void:
	for t in ties:
		var sc: PackedStringArray = String(t.get(key, "")).split("-")
		if sc.size() != 2:
			continue
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		_log_round_result(sim_id.call(a), sim_id.call(b),
			int(sc[0]), int(sc[1]), a == YOU_KEY or b == YOU_KEY)





		if not agg:
			continue
		var total: Array = _split_tie_goals(String(t.get("score", "")))
		if total.is_empty():
			continue
		var row: Dictionary = last_round_results[last_round_results.size() - 1]
		row["agg"] = "%d-%d" % [int(total[0]), int(total[1])]
		row["adv"] = sim_id.call(String(t.get("winner", "")))





func euro_rounds_won(comp: String) -> int:
	return _euro_ko_won(euro_state(comp))









func _euro_ko_won(state: Dictionary) -> int:
	var bracket: Array = state.get("bracket", [])
	var names: Array = state.get("ko_names", [])
	var desde: int = 1 if not names.is_empty() and String(names[0]) == UCL_KO_NAMES[0] else 0
	return _euro_rounds_won(bracket.slice(desde))







func _euro_rounds_won(bracket: Array) -> int:
	var n: int = 0
	for round_ties in bracket:
		for t in round_ties:
			if String(t.get("winner", "")) == YOU_KEY:
				n += 1
	return n






func _your_tie_opp(ties: Array) -> String:
	for t in ties:
		var a: String = String(t.get("a", ""))
		var b: String = String(t.get("b", ""))
		if a == YOU_KEY or b == YOU_KEY:
			return _euro_sim_id(b if a == YOU_KEY else a)
	return ""



















func _resolve_euro_ko(comp: String, ko_idx: int, leg: int, tg: int, rg: int,
		visitante: int = 0, sin_ti: bool = false) -> void:
	var state: Dictionary = euro_state(comp)
	if not bool(state.get("alive", false)):
		return
	var bracket: Array = state.get("bracket", [])
	if ko_idx >= bracket.size():
		return
	var ties: Array = bracket[ko_idx]
	var you: Dictionary = {"played": false, "won": false}
	var amer_comp: String = comp if Continental.es_americana(comp) else ""
	_euro_resolve_leg(ties, leg, tg, rg, you, amer_comp, visitante)
	var two_legs: bool = _ronda_dos(amer_comp, ties)
	if two_legs and leg < 1:
		_log_round_ties(ties, _euro_sim_id, "leg1")
		return
	_log_round_ties(ties, _euro_sim_id, "leg2" if two_legs else "score", two_legs)
	var final_round: bool = ties.size() <= 1
	if not final_round:
		bracket.append(_euro_bracket_next(state, ties))
	if not bool(you["played"]):
		return







	if not final_round and not sin_ti:
		_queue_cup_room(comp, state.get("ko_names", []), ko_idx, bool(you["won"]),
			_your_tie_opp(ties), tg, rg, _euro_rounds_won(bracket))
	if bool(you["won"]):
		state["ko_idx"] = ko_idx + 1
		if final_round and sin_ti:
			state["winner"] = player_team_id
		elif final_round:
			state["champion"] = true
			state["winner"] = player_team_id
			_crown(EURO_TITLE.get(comp, ""))
		else:
			_euro_set_you_opp(comp, state, ko_idx + 1)
	else:
		state["alive"] = false
		_kill_future(comp)
		_euro_sim_to_end(state, amer_comp)










func _ronda_dos(comp: String, ties: Array) -> bool:
	if ties.size() > 1:
		return true
	if not Continental.es_americana(comp) or not Continental.final_ida_vuelta(comp):
		return false
	return (euro_state(comp).get("ko_names", []) as Array).size() \
			<= Continental.ko_names(comp).size()







func _euro_sim_to_end(state: Dictionary, comp: String = "") -> void:
	var bracket: Array = state.get("bracket", [])
	if bracket.is_empty():
		return
	var guard: int = 0
	while guard < 8:
		guard += 1
		var ties: Array = bracket[bracket.size() - 1]
		_euro_resolve_round(ties, 0, 0, {"played": false, "won": false},
			_ronda_dos(comp, ties), comp)
		if ties.size() <= 1:
			state["winner"] = _euro_sim_id(String(ties[0]["winner"])) \
					if not ties.is_empty() else ""
			return




		bracket.append(_euro_bracket_next(state, ties))












var _amer_proy_cache: Dictionary = {}














func _amer_tu_cupo() -> Dictionary:
	if player_team_id.is_empty() or player_div() != 1:
		return {}
	var pais: String = Teams.country_of(player_team_id)
	if not Continental.tiene_copas(pais):
		return {}
	if int(last_orden_1a.get("amer", 0)) < 1 \
			or int(last_orden_1a.get("season", -1)) > season_num - 1:
		return {}
	var yo: String = player_team_id
	if Continental.PAISES_CONCACAF.has(pais):
		var cca: Dictionary = amer_cupos("CONCACAF").get("cca", {})
		if (cca.get("cuadro", []) as Array).has(yo):
			return {"comp": "cca", "entrada": "cuadro"}
		return {}
	if Continental.PAISES_AFC.has(pais):




		if int(last_orden_1a.get("amer", 0)) < 2:
			return {}
		var afc: Dictionary = amer_cupos("AFC")
		for c in ["ace", "ac2"]:
			if ((afc.get(c, {}) as Dictionary).get("cuadro", []) as Array).has(yo):
				return {"comp": c, "entrada": "cuadro"}
		return {}
	if Continental.PAISES_CAF.has(pais):


		if int(last_orden_1a.get("amer", 0)) < 3:
			return {}
		var caf: Dictionary = amer_cupos("CAF")
		for c in ["caf", "cf2"]:
			if ((caf.get(c, {}) as Dictionary).get("cuadro", []) as Array).has(yo):
				return {"comp": c, "entrada": "cuadro"}
		return {}
	if Continental.PAISES_OFC.has(pais):




		if int(last_orden_1a.get("amer", 0)) < 4:
			return {}

		var ofc: Dictionary = amer_cupos("OFC").get("ofc", {})
		if (ofc.get("cuadro", []) as Array).has(yo) \
				and not (ofc.get("grupos", []) as Array).is_empty():
			return {"comp": "ofc", "entrada": "grupos"}
		return {}
	var cupos: Dictionary = amer_cupos("CONMEBOL")
	var lib: Dictionary = cupos.get("lib", {})
	if (lib.get("grupos", []) as Array).has(yo):
		return {"comp": "lib", "entrada": "grupos"}
	if (lib.get("previa", []) as Array).has(yo):
		return {"comp": "lib", "entrada": "previa"}
	var sud: Dictionary = cupos.get("sud", {})
	if (sud.get("grupos", []) as Array).has(yo):
		return {"comp": "sud", "entrada": "grupos"}
	if ((sud.get("preliminar", {}) as Dictionary).get(pais, []) as Array).has(yo):
		return {"comp": "sud", "entrada": "preliminar"}
	return {}













func amer_cupos(confed: String) -> Dictionary:
	if int(amer_cupos_snap.get("season", -1)) == season_num \
			and amer_cupos_snap.get(confed) is Dictionary:
		return amer_cupos_snap[confed]
	var paises: Array = Continental.paises_de(confed)
	var orden: Dictionary = {}
	for p in paises:
		orden[String(p)] = _country_order(String(p))
	var pin_ok: bool = int(last_orden_1a.get("season", -1)) == season_num - 1
	var copa: Dictionary = {}
	if pin_ok and last_orden_1a.get("copa") is Dictionary:
		copa = last_orden_1a["copa"]
	var res: Dictionary = {}
	if confed == "AFC":
		res = Continental.clasificar_afc(orden)
	elif confed == "CAF":

		res = Continental.clasificar_caf(orden, {"copa": copa})
	elif confed == "OFC":


		res = Continental.clasificar_ofc(orden)
	elif confed == "CONCACAF":
		var lig: Dictionary = {}
		if pin_ok and last_orden_1a.get("liguilla") is Dictionary:
			lig = last_orden_1a["liguilla"]
		res = Continental.clasificar_concacaf(orden, {"liguilla": lig, "copa": copa})
	else:
		res = Continental.clasificar_conmebol(orden, {
			"lib_campeon": {"id": last_lib_winner, "pais": _amer_pais_de(last_lib_winner)},
			"sud_campeon": {"id": last_sud_winner, "pais": _amer_pais_de(last_sud_winner)},
			"copa": copa})
	if int(amer_cupos_snap.get("season", -1)) != season_num:
		amer_cupos_snap = {"season": season_num}
	amer_cupos_snap[confed] = res
	return res


func _amer_pais_de(id: String) -> String:
	return "" if id.is_empty() else Teams.country_of(id)





func _amer_congela_cupos() -> void:
	amer_cupos("CONMEBOL")
	amer_cupos("CONCACAF")
	amer_cupos("AFC")
	amer_cupos("CAF")
	amer_cupos("OFC")

















func europa_cupos() -> Dictionary:
	if int(europa_cupos_snap.get("season", -1)) == season_num and europa_cupos_snap.has("clubes"):
		return europa_cupos_snap
	var anio: int = TransferBook.anio_real(season_num)
	var extra: Dictionary = coef_uefa_extra()
	var copa_pin: Dictionary = {}
	if int(last_orden_1a.get("season", -1)) == season_num - 1 \
			and last_orden_1a.get("copa_uefa") is Dictionary:
		copa_pin = last_orden_1a["copa_uefa"]
	var ligas: Dictionary = {}
	var copas: Dictionary = {}
	var excluidos: Array = []
	for p in Teams.euro_countries():
		var orden: Array = _country_order(String(p))
		ligas[p] = orden
		for id in orden:
			if Career.vetado_europa(String(id), season_num):
				excluidos.append(String(id))
		if copa_pin.has(p):
			copas[p] = _euro_sim_id(String(copa_pin[p]))
	for a in UefaSombra.asociaciones():
		ligas[a] = UefaSombra.tabla(String(a), season_num - 1)
		copas[a] = UefaSombra.copa(String(a), season_num - 1)
	var poseedores: Dictionary = {}
	for par in [["ucl", last_ucl_winner], ["uel", last_eul_winner], ["uecl", last_conf_winner]]:
		var h: String = _euro_sim_id(String(par[1]))
		if not h.is_empty():
			poseedores[par[0]] = h
	var ranking: Array = []
	for f in CoefUefa.ranking_para(anio, extra):
		ranking.append(String(f["asoc"]))
	var e: Dictionary = AccesoUefa.entradas(anio, {"ligas": ligas, "copas": copas,
		"poseedores": poseedores, "excluidos": excluidos, "ranking": ranking, "extra": extra})
	var coef: Dictionary = {}
	var fuerza: Dictionary = {}
	var casa: Dictionary = {}
	for x in e["clubes"]:
		var id: String = String(x["id"])
		coef[id] = PreviaUefa.a_escala(CoefUefa.coef_club_para(id, String(x["asoc"]), anio, extra))
		var sombra: bool = UefaSombra.es_sombra(id)
		fuerza[id] = PreviaUefa.a_escala(UefaSombra.fuerza(id) if sombra else Squad.fuerza_sim(id))
		casa[id] = PreviaUefa.a_escala(HOME_EDGE if sombra else home_edge_of(id))
	europa_cupos_snap = {"season": season_num, "anio": anio, "clubes": e["clubes"],
		"cuentas": e["cuentas"], "byes_uecl": int(e["byes_uecl"]), "ranking": ranking,
		"log": e["log"], "errores": e["errores"], "coef": coef, "fuerza": fuerza, "casa": casa}
	_europa_previa_cache = {}
	return europa_cupos_snap










var _plazas_liga_cache: Dictionary = {}


func plazas_uefa_liga(pais: String) -> Dictionary:
	if int(_plazas_liga_cache.get("season", -1)) != season_num:
		var anio: int = TransferBook.anio_real(season_num) + 1
		var extra: Dictionary = coef_uefa_extra()
		var ranking: Array = []
		var ligas: Dictionary = {}
		var copas: Dictionary = {}
		for f in CoefUefa.ranking_para(anio, extra):
			var a: String = String(f["asoc"])
			ranking.append(a)
			var l: Array = []
			for i in 12:
				l.append("%s|%d" % [a, i + 1])
			ligas[a] = l
			if AccesoUefa.SIN_LIGA.has(a):
				ligas[a] = []
				copas[a] = "%s|copa" % a
		var e: Dictionary = AccesoUefa.entradas(anio, {"ligas": ligas, "copas": copas,
			"ranking": ranking, "extra": extra, "coef": {}})
		var por_pais: Dictionary = {}
		for x in e["clubes"]:
			var partes: PackedStringArray = String(x["id"]).split("|")
			if partes.size() == 2 and partes[1].is_valid_int():
				(por_pais.get_or_add(partes[0], {}) as Dictionary)[int(partes[1])] = {
					"comp": String(x["comp"]), "ronda": String(x["ronda"]), "via": String(x["via"])}
		_plazas_liga_cache = {"season": season_num, "paises": por_pais}
	return (_plazas_liga_cache["paises"] as Dictionary).get(pais, {})




func _parse_europa_snap(raw: Variant) -> Dictionary:
	if not (raw is Dictionary):
		return {}
	var snap: Dictionary =(raw as Dictionary).duplicate(true)
	for k in ["season", "anio", "byes_uecl"]:
		if snap.has(k):
			snap[k] = int(snap[k])
	for k in ["coef", "fuerza", "casa"]:
		var m: Dictionary = snap.get(k, {})
		for id in m:
			m[id] = int(m[id])
	var cuentas: Dictionary = snap.get("cuentas", {})
	for comp in cuentas:
		for ronda in cuentas[comp]:
			for via in cuentas[comp][ronda]:
				cuentas[comp][ronda][via] = int(cuentas[comp][ronda][via])
	return snap





func europa_previa() -> Dictionary:
	var snap: Dictionary = europa_cupos()
	if not is_same(_europa_previa_cache.get("snap"), snap):


		_europa_previa_cache = {"snap": snap, "res": PreviaUefa.calcula(snap, season_num,
			snap.get("forzados", []))}
	return _europa_previa_cache["res"]




func campos_uefa() -> Dictionary:
	return europa_previa().get("lp", {})






func previas_vivas() -> bool:
	return previas_uefa_encendidas and int(europa_cupos_snap.get("season", -1)) == season_num \
			and bool(europa_cupos_snap.get("vivas", false))





func _previas_tocan() -> bool:
	return previas_uefa_encendidas and int(last_orden_1a.get("uefa", 0)) >= 1 \
			and int(last_orden_1a.get("season", -1)) == season_num - 1





func _europa_tu_entrada() -> Dictionary:
	if not _euro_eligible():
		return {}
	for x in europa_cupos().get("clubes", []):
		if String(x["id"]) == player_team_id:
			return {"comp": String(x["comp"]), "ronda": String(x["ronda"]), "via": String(x["via"])}
	return {}




func _europa_indice(cuadro: Dictionary) -> Dictionary:
	var idx: Dictionary = {}
	for k in cuadro:
		var lista: Array = cuadro[k]
		for i in lista.size():
			for j in 2:
				var plaza: String = String(lista[i][j])
				if not plaza.is_empty():
					idx[plaza] = [String(k), i, j]
	return idx





func _europa_destino(plaza: String, idx: Dictionary) -> Dictionary:
	if idx.has(plaza):
		var x: Array = idx[plaza]
		return {"k": String(x[0]), "i": int(x[1]), "lado": int(x[2])}
	var partes: PackedStringArray = plaza.split("|")
	if partes.size() < 3:
		return {}
	var k: String = partes[1]
	if partes[0] == "G":
		return {"lp": k.split(" ")[0]}
	var d: Array = AccesoUefa.DESTINO.get(k, [])
	if d.size() >= 2 and String(d[1]) == "LP":
		return {"lp": String(d[0])}
	return {}












func europa_camino(gc: String) -> Dictionary:
	if not EURO_COMPS.has(gc):
		return {}
	var st: Dictionary = euro_state(gc)
	var pv: Dictionary = st.get("previa", {})
	if not previas_vivas() or not bool(st.get("playing", false)) or pv.is_empty() \
			or not String(pv.get("winner", "")).is_empty():
		return {}
	var r: Dictionary = europa_previa()
	var idx: Dictionary = _europa_indice(r["cuadro"])
	var k: String = String(pv["k"])
	var i: int = int(pv["i"])
	var lado: int = 0
	var pasos: Array = []
	for _n in 8:
		var partes: PackedStringArray = k.split(" ")
		var comp_u: String = partes[0]
		var ronda: String = partes[1]
		var via: String = partes[2] if partes.size() > 2 else ""
		var gc_k: String = PreviaUefa.COMP_JUEGO[comp_u]
		var paso: Dictionary = {"k": k, "i": i, "ronda": ronda, "via": via, "actual": pasos.is_empty(),
			"rival": "", "ganador_de": [], "perdedor_de": [], "cae": {}}
		if pasos.is_empty():
			paso["rival"] = String(pv["b"])
		else:
			var otro: String = String((r["cuadro"][k] as Array)[i][1 - lado])
			var op: PackedStringArray = otro.split("|")
			if op.size() == 3 and (op[0] == "G" or op[0] == "P"):
				var t: Dictionary =(r["cruces"].get(op[1], []) as Array)[int(op[2])]
				paso["ganador_de" if op[0] == "G" else "perdedor_de"] = [String(t["a"]), String(t["b"])]
			else:
				paso["rival"] = otro
		var fechas: Array = VeranoUefa.FECHAS.get(gc_k, {}).get(ronda, [])
		if fechas.size() == 2:
			paso["ida"] = fechas[0]
			paso["vuelta"] = fechas[1]
		var d_p: Array = AccesoUefa.destino_perdedor(comp_u, ronda, via)
		if not d_p.is_empty():
			paso["cae"] = {"comp": PreviaUefa.COMP_JUEGO[String(d_p[0])], "ronda": String(d_p[1])}
		pasos.append(paso)
		var d: Dictionary = _europa_destino("G|%s|%d" % [k, i], idx)
		if d.has("k"):
			k = String(d["k"])
			i = int(d["i"])
			lado = int(d["lado"])
		else:
			if d.has("lp"):
				var md: PackedStringArray = String(AccesoUefa.FECHAS_2026.get(String(d["lp"]), {}) \
						.get("LP", {}).get("sorteo", "08-27")).split("-")
				pasos.append({"ronda": "LP", "comp": PreviaUefa.COMP_JUEGO[String(d["lp"])],
					"sorteo": [int(md[0]), int(md[1])]})
			break
	return {"comp": gc, "ida": String(pv.get("leg1", "")), "pasos": pasos}






func _europa_arbol(k0: String, i0: int, idx: Dictionary) -> Dictionary:
	var nodos: Array = []
	var vistos: Dictionary = {}
	var lps: Array = []
	var cola: Array = [{"k": k0, "i": i0}]
	while not cola.is_empty():
		var n: Dictionary = cola.pop_front()
		var id: String = "%s|%d" % [n["k"], int(n["i"])]
		if vistos.has(id):
			continue
		vistos[id] = true
		nodos.append(n)
		for pre in ["G", "P"]:
			var d: Dictionary = _europa_destino("%s|%s" % [pre, id], idx)
			if d.has("k"):
				cola.append(d)
			elif d.has("lp") and not lps.has(d["lp"]):
				lps.append(d["lp"])
	return {"nodos": nodos, "lp": lps}







func _build_euro_uefa(entries: Array, league_len: int) -> void:
	var e: Dictionary = _europa_tu_entrada()
	_banderas_en("" if e.is_empty() else String(PreviaUefa.COMP_JUEGO[String(e["comp"])]))
	if e.is_empty():
		return
	if String(e["ronda"]) == "LP":
		var gc0: String = PreviaUefa.COMP_JUEGO[String(e["comp"])]
		_build_euro(gc0, _campo_euro(gc0), entries, league_len)
		return
	var idx: Dictionary = _europa_indice(europa_previa()["cuadro"])
	if not idx.has(player_team_id):
		return
	var ini: Array = idx[player_team_id]
	var arbol: Dictionary = _europa_arbol(String(ini[0]), int(ini[1]), idx)
	var pais: String = Teams.country_of(player_team_id)
	var n: int = 0
	for nodo in arbol["nodos"]:
		var k: String = String(nodo["k"])
		var partes: PackedStringArray = k.split(" ")
		var gc: String = PreviaUefa.COMP_JUEGO[partes[0]]
		var ri: int = VeranoUefa.RONDAS.find(partes[1])
		var ws: Array = CalendarioMundo.semanas_euro_con_previa(gc, league_len, pais)["previa"]
		for leg in 2:


			entries.append({"comp": gc, "opp": "", "home": leg == 0, "round": "previa",
				"ko_idx": -1, "leg": leg, "pv": "%s|%d" % [k, int(nodo["i"])], "dead": true,
				"label": "%s · PREVIA (%s)" % [EURO_LABEL[gc], "IDA" if leg == 0 else "VUELTA"],
				"week": float(ws[ri * 2 + leg]) + 0.001 * float(n)})
		n += 1
	for c in arbol["lp"]:
		_euro_fechas_muertas(PreviaUefa.COMP_JUEGO[String(c)], entries, league_len)
	_europa_entra({"k": String(ini[0]), "i": int(ini[1]), "lado": int(ini[2])}, "", entries, 0, idx)





func _euro_fechas_muertas(gc: String, entries: Array, league_len: int) -> void:
	var desde: int = entries.size()
	var jornadas: int = int(EURO_MATCHDAYS.get(gc, EURO_MATCHDAYS_DEFAULT))
	var fx: Array = []
	for r in jornadas:
		fx.append({"opp": "", "home": r % 2 == 0, "round": r, "pot": -1})
	_emit_euro_fixtures(gc, entries, league_len, jornadas, fx)
	for j in range(desde, entries.size()):
		entries[j]["dead"] = true
		entries[j]["week"] = float(entries[j]["week"]) + 0.0001 * float(EURO_COMPS.find(gc))




func _euro_lp_llega(gc: String, lista: Array) -> void:
	_build_euro(gc, _campo_euro(gc), [], 0, lista)








func _banderas_en(gc: String) -> void:
	qualified_ucl = gc == "ucl"
	qualified_eul = gc == "eul"
	qualified_conf = gc == "conf"










func _europa_entra(dest: Dictionary, gc_de: String, lista: Array, desde: int, idx: Dictionary) -> void:
	for j in range(desde, lista.size()):
		if String(lista[j].get("round", "")) == "previa" \
				and EURO_COMPS.has(String(lista[j].get("comp", ""))):
			lista[j]["dead"] = true
	var gc: String = ""
	if dest.has("k"):
		gc = PreviaUefa.COMP_JUEGO[String(dest["k"]).split(" ")[0]]
	elif dest.has("lp"):
		gc = PreviaUefa.COMP_JUEGO[String(dest["lp"])]
	var viejo: Dictionary = euro_state(gc_de) if not gc_de.is_empty() else {}
	var camino: Array =(viejo.get("camino", []) as Array).duplicate()
	if viejo.has("previa"):
		camino.append(viejo["previa"])
	if not gc_de.is_empty() and gc != gc_de:
		viejo["playing"] = false
		viejo["alive"] = false
		viejo["fuera"] = "previa"
		for j in range(desde, lista.size()):
			if String(lista[j].get("comp", "")) == gc_de:
				lista[j]["dead"] = true
	if gc.is_empty():
		for j in range(desde, lista.size()):
			if EURO_COMPS.has(String(lista[j].get("comp", ""))):
				lista[j]["dead"] = true
		return
	_banderas_en(gc)
	if dest.has("lp"):
		_euro_lp_llega(gc, lista)
		var st_lp: Dictionary = euro_state(gc)
		st_lp["entrada"] = "previa"
		st_lp["fuera"] = ""
		st_lp["camino"] = camino
		return
	var k: String = String(dest["k"])
	var i: int = int(dest["i"])
	var lado: int = int(dest.get("lado", 0))
	var t: Dictionary =(europa_previa()["cruces"].get(k, []) as Array)[i]
	var rival: String = String(t["b"] if lado == 0 else t["a"])
	var st: Dictionary = {"playing": true, "comp": gc, "groups": [], "league_phase": true,
		"advanced": false, "alive": true, "champion": false,
		"ko_names": UCL_KO_NAMES.duplicate(), "ko_opps": [], "ko_idx": 0, "bracket": [],
		"winner": "", "seeds": [], "entrada": "previa", "fuera": "", "camino": camino}
	st["previa"] = {"k": k, "i": i, "ronda": k.split(" ")[1], "a": YOU_KEY, "b": rival,
		"leg1": "", "leg2": "", "winner": ""}
	_set_euro_state(gc, st)
	if rival.is_empty():

		st["previa"]["winner"] = YOU_KEY
		_europa_entra(_europa_destino("G|%s|%d" % [k, i], idx), gc, lista, desde, idx)
		return
	var pv_id: String = "%s|%d" % [k, i]
	for j in range(desde, lista.size()):
		var f: Dictionary = lista[j]
		if String(f.get("round", "")) == "previa" and String(f.get("pv", "")) == pv_id:
			f["dead"] = false
			f["opp"] = rival
			f["home"] =(int(f.get("leg", 0)) == 0) ==(lado == 0)
	_aviso_previa(WorldNews.PREVIA_RIVAL, rival, gc, String(st["previa"]["ronda"]))







func europa_resumen_previas() -> Dictionary:
	var out: Dictionary = {"euro_entrada": ""}
	var vistos: Dictionary = {}
	var largo: int = 0
	for gc in EURO_COMPS:
		var st: Dictionary = euro_state(gc)
		out[gc + "_lp"] = bool(st.get("playing", false)) and not st.has("previa")
		out[gc + "_previa"] = false
		out[gc + "_previa_won"] = 0
	for gc in EURO_COMPS:
		var st: Dictionary = euro_state(gc)
		var cruces: Array =(st.get("camino", []) as Array).duplicate()
		if st.has("previa"):
			cruces.append(st["previa"])


		cruces = cruces.filter(func(pv: Dictionary) -> bool:
			return not bool(pv.get("antes_de_llegar", false)))

		if cruces.size() > largo:
			largo = cruces.size()
			out["euro_entrada"] = String((cruces[0] as Dictionary).get("ronda", ""))
		for pv in cruces:
			var clave: String = "%s|%d" % [String(pv.get("k", "")), int(pv.get("i", 0))]
			var c: String = String(PreviaUefa.COMP_JUEGO.get(clave.split(" ")[0], ""))
			if vistos.has(clave) or c.is_empty():
				continue
			vistos[clave] = true
			out[c + "_previa"] = true
			if String(pv.get("winner", "")) == YOU_KEY:
				out[c + "_previa_won"] = int(out[c + "_previa_won"]) + 1
	return out







func _resolve_euro_previa(gc: String, leg: int, tg: int, rg: int) -> void:
	var st: Dictionary = euro_state(gc)
	if not bool(st.get("playing", false)) or String(st.get("entrada", "")) != "previa":
		return
	var pv: Dictionary = st.get("previa", {})
	if pv.is_empty() or not String(pv.get("winner", "")).is_empty():
		return
	if leg < 1:
		pv["leg1"] = "%d-%d" % [tg, rg]
		return
	var prev: Array = _split_tie_goals(String(pv.get("leg1", "")))
	var mine: int = tg +(int(prev[0]) if not prev.is_empty() else 0)
	var his: int = rg +(int(prev[1]) if not prev.is_empty() else 0)
	pv["leg2"] = "%d-%d" % [tg, rg]
	var rival: String = String(pv.get("b", ""))
	var won: bool = _knockout_won(rival, mine, his)
	pv["winner"] = YOU_KEY if won else rival
	var yo: String = player_team_id
	(europa_cupos_snap.get_or_add("forzados", []) as Array).append(
		{"ganador": yo if won else rival, "perdedor": rival if won else yo})
	_europa_previa_cache = {}
	var idx: Dictionary = _europa_indice(europa_previa()["cuadro"])
	var plaza: String = "%s|%s|%d" % ["G" if won else "P", String(pv["k"]), int(pv["i"])]
	var dest: Dictionary = _europa_destino(plaza, idx)


	var a_comp: String = ""
	var a_ronda: String = ""
	if dest.has("lp"):
		a_comp = PreviaUefa.COMP_JUEGO[String(dest["lp"])]
		a_ronda = "LP"
	elif dest.has("k"):
		var dk: PackedStringArray = String(dest["k"]).split(" ")
		a_comp = PreviaUefa.COMP_JUEGO[dk[0]]
		a_ronda = dk[1]
	_aviso_previa(WorldNews.PREVIA_PASA if won else WorldNews.PREVIA_CAE, rival, a_comp, a_ronda)
	_europa_entra(dest, gc, calendar, season_day + 1, idx)









func previa_sin_ti(f: Dictionary) -> bool:
	if String(f.get("round", "")) != "previa" or not EURO_COMPS.has(String(f.get("comp", ""))) \
			or int(verano_convocado.get("season", -1)) != season_num:
		return false

	var par: Array = [String(f.get("pv", "")).get_slice("|", 0).get_slice(" ", 1), int(f.get("leg", 0))]
	var torneos: Dictionary = verano_convocado.get("torneos", {})
	for kind in torneos:
		if VeranoUefa.rondas_sin_jugador(String(f["comp"]), String(kind), String(torneos[kind])).has(par):
			return true
	return false








func _juega_previas_sin_ti() -> void:
	if _jugando_sin_ti or verano_convocado.is_empty():
		return
	_jugando_sin_ti = true
	for _n in 8:
		_skip_dead()
		if season_day >= calendar.size() or not previa_sin_ti(calendar[season_day]):
			break
		var f: Dictionary = calendar[season_day]
		var s: Array = _marcador_sin_ti(f)
		f["sin_ti"] = true
		_advance_calendar(int(s[0]), int(s[1]))
	_jugando_sin_ti = false





func _marcador_sin_ti(f: Dictionary) -> Array:
	var rival: String = String(f.get("opp", ""))
	var squad: Array = Squad.plantel_sin_once(player_team_id)
	var yo_i: int = Squad.user_index(squad)
	var d: float = 0.0 if yo_i < 0 \
			else Squad.delta_bajas(player_team_id, {Squad.home_seat(squad, yo_i): true})
	var yo: float = Squad.fuerza_con_delta(player_team_id, d)
	var el: float = UefaSombra.fuerza(rival) if UefaSombra.es_sombra(rival) else Squad.fuerza_sim(rival)
	var casa: bool = bool(f.get("home", true))
	var local: String = player_team_id if casa else rival
	var he: float = -1.0 if UefaSombra.es_sombra(local) else home_edge_of(local)
	var l: PackedFloat64Array = sim_lambdas(yo if casa else el, el if casa else yo, false, false,
		0.0, 1.0, he)
	var a: int = _poisson(l[0])
	var b: int = _poisson(l[1])
	return [a, b] if casa else [b, a]







func _sella_verano_convocado() -> void:
	var torneos: Dictionary = {}
	var comp: String = String(nat_state.get("comp", ""))
	if comp in ["wc", "cont"] and bool(nat_state.get("playing", false)) \
			and not bool(nat_state.get("watch", false)) and int(nat_state.get("season", -1)) == season_num:
		var fase: String = _fase_nat_verano()
		if not fase.is_empty():
			torneos["mundial" if comp == "wc" else "continental"] = fase
	if int(olimpicos_state.get("season", -1)) == season_num \
			and String(olimpicos_state.get("fase", "")) != "choque":
		var yo: String = String(olimpicos_state.get("yo", ""))
		if not String(olimpicos_state.get("medalla_tipo", "")).is_empty():
			torneos["olimpicos"] = "final"
		elif (olimpicos_state.get("semis", []) as Array).has(yo):
			torneos["olimpicos"] = "sf"
		elif (olimpicos_state.get("cuartos", []) as Array).has(yo):
			torneos["olimpicos"] = "qf"
		else:
			torneos["olimpicos"] = "grupos"
	verano_convocado = {} if torneos.is_empty() else {"season": season_num + 1, "torneos": torneos}




const _FASE_DESDE_LA_FINAL: Array = ["final", "sf", "qf", "r16", "r32"]
func _fase_nat_verano() -> String:
	if not bool(nat_state.get("advanced", false)):
		return "grupos"
	var n: int =(nat_state.get("ko_names", []) as Array).size()
	if n == 0:
		return ""
	var quedan: int = n - 1 - mini(int(nat_state.get("ko_idx", 0)), n - 1)
	return String(_FASE_DESDE_LA_FINAL[quedan]) if quedan < _FASE_DESDE_LA_FINAL.size() else "grupos"





func euro_cabeza_de_serie() -> Dictionary:
	if not previas_vivas():
		return {}
	for gc in EURO_COMPS:
		var st: Dictionary = euro_state(gc)
		var pv: Dictionary = st.get("previa", {})
		if not bool(st.get("playing", false)) or String(st.get("entrada", "")) != "previa" \
				or pv.is_empty() or not String(pv.get("winner", "")).is_empty():
			continue
		var r: Dictionary = europa_previa()
		var k: String = String(pv["k"])
		var i: int = int(pv["i"])
		var pares: Array = r["cuadro"].get(k, [])
		var cruces: Array = r["cruces"].get(k, [])
		if i >= pares.size() or i >= cruces.size():
			return {}

		var lado: int = 1 if String(cruces[i]["a"]) == String(pv.get("b", "")) else 0
		if (r.get("cabezas", {}).get(k, []) as Array).has(String(pares[i][lado])):
			return {"comp": gc, "ronda": String(pv["ronda"])}
		return {}
	return {}




func _avisos_de_verano() -> void:
	if previas_desde == 0:
		previas_desde = season_num
		if season_num > 1:
			_aviso_previa(WorldNews.PREVIA_ESTRENO)
	var pais: String = Teams.country_of(player_team_id)
	for x in europa_cupos_snap.get("clubes", []):
		if String(x.get("tipo", "")) == "eps" and String(x.get("asoc", "")) == pais:
			_aviso_previa(WorldNews.PREVIA_EPS, "", PreviaUefa.COMP_JUEGO[String(x["comp"])],
				String(x.get("ronda", "")), pais)
			break




func _aviso_previa(que: int, rival: String = "", comp: String = "", ronda: String = "",
		pais: String = "") -> void:
	if _temporada_fantasma or _avisos_previa_mudos or player_team_id.is_empty():
		return
	Career.aviso_previa(WorldNews.fila_previa(season_num, season_day, player_team_id, que, rival,
		comp, ronda, pais))











func amer_proyectado(comp: String, season: int, upto: float = -1.0) -> Dictionary:
	if not Continental.es_americana(comp) or season != season_num:
		return {}
	if upto < 0.0:
		var sp: float = season_progress()
		upto = 1.0 if sp < 0.0 else sp
	var cupos: Dictionary = amer_cupos(Continental.confed_de(comp))
	var ext: Dictionary = _amer_ext(comp, cupos)
	var key: String = "%s|%d|%d|%d|%.4f|%d|%d" % [comp, season, WorldAging.world_seed(),
		Squad.cache_version(), upto, hash(ext), hash(cupos)]
	if _amer_proy_cache.has(key):
		return _amer_proy_cache[key]
	if _amer_proy_cache.size() > 24:
		_amer_proy_cache.clear()
	var st: Dictionary = EuroSim.simulate_amer(comp, cupos, season, upto, ext)
	_amer_proy_cache[key] = st
	return st



func _amer_ext(comp: String, cupos: Dictionary) -> Dictionary:
	var ext: Dictionary = {}
	var lib_previa: bool = String(lib_state.get("entrada", "")) == "previa"
	match comp:
		"lib":
			if lib_previa:
				ext["jugador"] = player_team_id
			if lib_state.get("forzado") is Dictionary:
				ext["forzado"] = lib_state["forzado"]
			ext["previa_fija"] = _amer_previa_tuya()
		"sud":
			if sud_state.get("forzado") is Dictionary:
				ext["forzado"] = sud_state["forzado"]




			var pv: Dictionary = _amer_previa_tuya()
			ext["previa_fija"] = pv
			ext["previa_perdedores"] = pv.get("perdedores", [])
			ext["preliminar_fija"] = amer_preliminar(sud_state.get("forzado", {}) \
					if String(sud_state.get("entrada", "")) == "preliminar" else {})
			var t3: Array = _amer_terceros_reales()
			if not t3.is_empty():
				ext["terceros"] = t3
	return ext


















func amer_previa(forzado: Dictionary = {}, jugador: String = "") -> Dictionary:
	var lib: Dictionary = amer_cupos("CONMEBOL").get("lib", {})
	var clave: String = "previa|%s|%s|%s" % [jugador, String(forzado.get("ganador", "")),
		String(forzado.get("perdedor", ""))]
	return _amer_fijo(clave, func() -> Dictionary:
		return EuroSim.previa_lib(lib.get("previa", []), season_num, forzado, jugador))



func amer_preliminar(forzado: Dictionary = {}) -> Dictionary:
	var sud: Dictionary = amer_cupos("CONMEBOL").get("sud", {})
	var clave: String = "prelim|%s|%s" % [String(forzado.get("ganador", "")),
		String(forzado.get("perdedor", ""))]
	return _amer_fijo(clave, func() -> Dictionary:
		var pre: Variant = sud.get("preliminar", {})
		return EuroSim.preliminar_sud(pre if pre is Dictionary else {}, season_num, forzado))





func _amer_fijo(clave: String, calc: Callable) -> Dictionary:
	amer_cupos("CONMEBOL")
	if not (amer_cupos_snap.get("fijo") is Dictionary):
		amer_cupos_snap["fijo"] = {}
	var fijo: Dictionary = amer_cupos_snap["fijo"]
	if not (fijo.get(clave) is Dictionary):
		fijo[clave] = calc.call()
	return (fijo[clave] as Dictionary).duplicate(true)




func _amer_previa_tuya() -> Dictionary:
	if String(lib_state.get("entrada", "")) == "previa":
		return amer_previa(lib_state.get("forzado", {}), player_team_id)
	return amer_previa()





func _amer_congela_previas(cupo: Dictionary) -> void:
	amer_previa()
	amer_preliminar()
	var yo: String = player_team_id
	match String(cupo.get("entrada", "")):
		"previa":
			var rival: String = String(amer_previa({}, yo).get("rival", ""))
			if not rival.is_empty():
				amer_previa({"ganador": yo, "perdedor": rival}, yo)
				amer_previa({"ganador": rival, "perdedor": yo}, yo)
		"preliminar":
			var lista: Array =((amer_cupos("CONMEBOL").get("sud", {}) as Dictionary).get(
				"preliminar", {}) as Dictionary).get(Teams.country_of(yo), [])
			var i: int = lista.find(yo)
			var j: int = lista.size() - 1 - i
			if i >= 0 and j != i and j >= 0:
				var b: String = String(lista[j])
				amer_preliminar({"ganador": yo, "perdedor": b})
				amer_preliminar({"ganador": b, "perdedor": yo})




func _amer_terceros_reales() -> Array:
	var groups: Array = lib_state.get("groups", [])
	if groups.is_empty():
		return []
	var g0: Dictionary = groups[0]
	var played: int = int((g0.get("table", {}) as Dictionary).get(YOU_KEY, {}).get("pj", 0))
	if played <(g0.get("schedule", []) as Array).size():
		return []
	var out: Array = []
	for g in groups:
		var o: Array = euro_group_order(g)
		out.append(_euro_sim_id(String(o[2])) if o.size() > 2 else "")
	return out




func amer_field(comp: String) -> Array:



	if comp == "ofc":
		var oc: Dictionary = amer_cupos("OFC").get("ofc", {})
		var campo: Array = []
		for g in (oc.get("grupos", []) as Array):
			for id in (g as Array):
				if not String(id).is_empty():
					campo.append(String(id))
		return campo
	var st: Dictionary = euro_state(comp)
	if st.is_empty() or (not bool(st.get("playing", false)) \
			and (st.get("groups", []) as Array).is_empty()):
		st = amer_proyectado(comp, season_num, 1.0)
	var out: Array = []
	var groups: Array = st.get("groups", [])
	if not groups.is_empty():
		for g in groups:
			for k in (g as Dictionary).get("keys", []):
				out.append(_euro_sim_id(String(k)))
		return out
	var bracket: Array = st.get("bracket", [])
	if not bracket.is_empty():
		for t in bracket[0]:
			for k in [String(t.get("a", "")), String(t.get("b", ""))]:
				if not k.is_empty():
					out.append(_euro_sim_id(k))
	return out



func _amer_state_base(comp: String, entrada: String) -> Dictionary:
	var names: Array = []
	names.assign(Continental.ko_names(comp))
	return {"playing": true, "comp": comp, "league_phase": false, "groups": [],
		"seeds": [], "bracket": [], "advanced": false, "alive": true, "champion": false,
		"winner": "", "ko_opps": [], "ko_names": names, "ko_idx": 0,
		"entrada": entrada, "fuera": "", "campana": {}}











func _build_amer(entries: Array, league_len: int) -> void:
	_amer_congela_cupos()

	europa_cupos()
	var cupo: Dictionary = _amer_tu_cupo()
	if cupo.is_empty():
		return
	if Continental.confed_de(String(cupo["comp"])) == "CONMEBOL":
		_amer_congela_previas(cupo)
	var comp: String = String(cupo["comp"])
	var entrada: String = String(cupo["entrada"])
	var cupos: Dictionary = amer_cupos(Continental.confed_de(comp))
	var lib: Dictionary = cupos.get("lib", {})
	var sud: Dictionary = cupos.get("sud", {})
	var yo: String = player_team_id
	match comp:
		"cca", "ace", "ac2", "caf", "cf2":







			var cuadro: Array = []
			for id in (cupos.get(comp, {}) as Dictionary).get("cuadro", []):
				cuadro.append(YOU_KEY if String(id) == yo else String(id))
			var st: Dictionary = _amer_state_base(comp, "cuadro")
			st["advanced"] = true
			st["bracket"] = [EuroSim._cca_cuadro(cuadro)]
			_set_euro_state(comp, st)
			_emit_amer_fixtures(comp, entries, league_len,
				{"ko": Continental.ko_names(comp).size()})
		"ofc":





			var fijos: Array =(cupos.get("ofc", {}) as Dictionary).get("grupos", [])
			if fijos.is_empty():
				return
			ofc_state = _amer_state_base("ofc", "grupos")
			_amer_arma_grupos("ofc", [], fijos)

			_emit_amer_fixtures("ofc", entries, league_len, {"grupo": true, "ko": 0})
		"lib":
			if entrada == "grupos":
				lib_state = _amer_state_base("lib", "grupos")
				_amer_arma_grupos("lib",(lib.get("grupos", []) as Array) \
						+(amer_previa()["ganadores"] as Array))
				_emit_amer_fixtures("lib", entries, league_len, {"grupo": true, "ko": 0})

				_emit_amer_fixtures("sud", entries, league_len, {"ko": 0})
			else:



				var pv: Dictionary = amer_previa({}, yo)
				var rival: String = String(pv.get("rival", ""))
				if rival.is_empty():
					return
				var st2: Dictionary = _amer_state_base("lib", "previa")
				st2["previa"] = {"a": YOU_KEY, "b": rival, "leg1": "", "leg2": "", "winner": ""}
				lib_state = st2
				_emit_amer_fixtures("lib", entries, league_len,
					{"previa": true, "grupo": false, "ko": 0})

				_emit_amer_fixtures("sud", entries, league_len, {"grupo": false, "ko": 0})
		"sud":
			if entrada == "grupos":
				sud_state = _amer_state_base("sud", "grupos")
				_amer_arma_grupos("sud",(sud.get("grupos", []) as Array) \
						+(amer_preliminar()["ganadores"] as Array) \
						+(amer_previa()["perdedores"] as Array))
				_emit_amer_fixtures("sud", entries, league_len, {"grupo": true, "ko": 0})
			else:


				var lista: Array =(sud.get("preliminar", {}) as Dictionary).get(
					Teams.country_of(yo), [])
				var i: int = lista.find(yo)
				var j: int = lista.size() - 1 - i
				if i < 0 or j == i or j < 0:
					return
				var st3: Dictionary = _amer_state_base("sud", "preliminar")
				st3["preliminar"] = {"a": YOU_KEY, "b": String(lista[j]), "leg1": "",
					"leg2": "", "winner": ""}
				sud_state = st3
				_emit_amer_fixtures("sud", entries, league_len,
					{"preliminar": true, "home": i < j, "grupo": false, "ko": 0})















func _emit_amer_fixtures(comp: String, entries: Array, league_len: int,
		vivo: Dictionary) -> void:
	var pais: String = Teams.country_of(player_team_id)
	var et: String = Continental.etiqueta(comp)
	var st: Dictionary = euro_state(comp)
	if vivo.has("previa"):
		var rival: String = String((st.get("previa", {}) as Dictionary).get("b", ""))
		for leg in 2:

			entries.append({"comp": comp, "opp": rival, "home": leg == 0,
				"round": "previa", "ko_idx": -1, "leg": leg,
				"dead": not bool(vivo["previa"]),
				"label": "%s · PREVIA (%s)" % [et, "IDA" if leg == 0 else "VUELTA"],
				"week": Continental.semana_previa(leg, league_len, pais)})
	if vivo.has("preliminar"):
		entries.append({"comp": comp,
			"opp": String((st.get("preliminar", {}) as Dictionary).get("b", "")),
			"home": bool(vivo.get("home", true)), "round": "preliminar", "ko_idx": -1,
			"leg": 1, "dead": not bool(vivo["preliminar"]),
			"label": "%s · PRELIMINAR" % et,
			"week": Continental.semana_preliminar(league_len, pais)})
	if vivo.has("grupo"):
		var groups: Array = st.get("groups", [])
		var sched: Array =(groups[0] as Dictionary).get("schedule", []) \
				if not groups.is_empty() else []



		var gf: Dictionary = Continental.grupos_de(comp)
		var n: int = Continental.GRUPO_SPOT_IDX.size() if gf.is_empty() \
				else (int(gf.get("tam", EuroSim.GROUP_SIZE)) - 1) * int(gf.get("vueltas", 2))
		for r in n:
			var opp: String = ""
			var home: bool = true
			if r < sched.size():
				for pair in sched[r]:
					if String(pair[0]) == YOU_KEY or String(pair[1]) == YOU_KEY:
						home = String(pair[0]) == YOU_KEY
						opp = String(pair[1]) if home else String(pair[0])
						break
			entries.append({"comp": comp, "opp": opp, "home": home,
				"round": "grupo", "euro_round": r,
				"dead": not bool(vivo["grupo"]) or opp.is_empty(), "pot": -1,
				"label": "%s · GRUPO J%d/%d" % [et, r + 1, n],
				"week": Continental.semana_grupo(comp, r, league_len, pais)})
	if vivo.has("ko"):
		var vivas: int = int(vivo["ko"])
		var names: Array[String] = Continental.ko_names(comp)
		for i in names.size():
			var two: bool = Continental.ko_dos_partidos(comp, i)
			var name_i: String = names[i].to_upper()
			if two:
				entries.append({"comp": comp, "opp": "", "home": false,
					"round": names[i], "ko_idx": i, "leg": 0, "dead": i >= vivas,
					"label": "%s · %s (IDA)" % [et, name_i],
					"week": Continental.semana_ko(comp, i, 0, league_len, pais)})
			entries.append({"comp": comp, "opp": "", "home": true,
				"round": names[i], "ko_idx": i, "leg": 1, "dead": i >= vivas,
				"label": "%s · %s%s" % [et, name_i, " (VUELTA)" if two else ""],
				"week": Continental.semana_ko(comp, i, 1, league_len, pais)})
















func _amer_arma_grupos(comp: String, pool: Array, fijos: Array = []) -> void:
	var st: Dictionary = euro_state(comp)
	var gf: Dictionary = Continental.grupos_de(comp)
	var vueltas: int = int(gf.get("vueltas", 2))
	if not fijos.is_empty():
		var hechos: Array = []
		for fg in fijos:
			var keys: Array = []
			for id in (fg as Array):
				var s0: String = String(id)
				if not s0.is_empty():
					keys.append(YOU_KEY if s0 == player_team_id else s0)
			if keys.size() < 2:
				continue
			var t0: Dictionary = {}
			for k in keys:
				t0[String(k)] = _blank_row()
			var sch: Array = Schedule.single_round_robin(keys) if vueltas == 1 \
					else Schedule.double_round_robin(keys)
			var g0: Dictionary = {"keys": keys, "table": t0,
				"schedule": _amer_descansos_al_final(sch)}
			if keys.has(YOU_KEY):
				hechos.push_front(g0)
			else:
				hechos.append(g0)
		if hechos.is_empty() or not ((hechos[0] as Dictionary)["keys"] as Array).has(YOU_KEY):
			push_error("[amer] los grupos fijos de %s no te traen dentro" % comp)
		st["groups"] = hechos
		st["playing"] = true
		st["alive"] = true
		_amer_revive(comp, "grupo")
		return
	var n_grupos: int = int(gf.get("n", EuroSim.GROUPS))
	var tam: int = int(gf.get("tam", EuroSim.GROUP_SIZE))
	var otros: Array = []
	var seen: Dictionary = {}
	for id in pool:
		var s: String = String(id)
		if s.is_empty() or s == YOU_KEY or s == player_team_id or seen.has(s):
			continue
		seen[s] = true
		otros.append(s)
	if otros.size() + 1 != n_grupos * tam:
		push_error("[amer] el bombo de %s trae %d clubes, no %d" % [comp,
			otros.size() + 1, n_grupos * tam])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("amer|grupos|%s|%d|%s" % [comp, season_num, player_team_id])
	for i in range(otros.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Variant = otros[i]
		otros[i] = otros[j]
		otros[j] = tmp
	var all_keys: Array = [YOU_KEY] + otros
	all_keys.resize(mini(all_keys.size(), n_grupos * tam))
	var groups: Array = []
	for gi in range(0, all_keys.size(), tam):
		var keys: Array = all_keys.slice(gi, gi + tam)
		if keys.size() < 2:
			break
		var table: Dictionary = {}
		for k in keys:
			table[String(k)] = _blank_row()
		groups.append({"keys": keys, "table": table,
			"schedule": Schedule.single_round_robin(keys) if vueltas == 1
				else Schedule.double_round_robin(keys)})
	st["groups"] = groups
	st["playing"] = true
	st["alive"] = true
	_amer_revive(comp, "grupo")







func _amer_descansos_al_final(sched: Array) -> Array:
	var juegas: Array = []
	var descansas: Array = []
	for rnd in sched:
		var tuya: bool = false
		for pair in (rnd as Array):
			if String(pair[0]) == YOU_KEY or String(pair[1]) == YOU_KEY:
				tuya = true
				break
		if tuya:
			juegas.append(rnd)
		else:
			descansas.append(rnd)
	return juegas + descansas




func _amer_revive(comp: String, fase: String) -> void:
	var groups: Array = euro_state(comp).get("groups", [])
	if fase != "grupo" or groups.is_empty():
		return
	var sched: Array =(groups[0] as Dictionary).get("schedule", [])
	for i in range(season_day + 1, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) != comp or String(e.get("round", "")) != "grupo":
			continue
		var r: int = int(e.get("euro_round", -1))
		if r < 0 or r >= sched.size():
			continue
		for pair in sched[r]:
			if String(pair[0]) == YOU_KEY or String(pair[1]) == YOU_KEY:
				e["home"] = String(pair[0]) == YOU_KEY
				e["opp"] = String(pair[1]) if bool(e["home"]) else String(pair[0])
				e["dead"] = false
				break











func _resolve_lib_previa(leg: int, tg: int, rg: int) -> void:
	var st: Dictionary = lib_state
	if not bool(st.get("playing", false)) or String(st.get("entrada", "")) != "previa":
		return
	var pv: Dictionary = st.get("previa", {})
	if pv.is_empty() or not String(pv.get("winner", "")).is_empty():
		return
	if leg < 1:
		pv["leg1"] = "%d-%d" % [tg, rg]
		return
	var prev: Array = _split_tie_goals(String(pv.get("leg1", "")))
	var mine: int = tg +(int(prev[0]) if not prev.is_empty() else 0)
	var his: int = rg +(int(prev[1]) if not prev.is_empty() else 0)
	pv["leg2"] = "%d-%d" % [tg, rg]
	var rival: String = String(pv.get("b", ""))
	var won: bool = _knockout_won(rival, mine, his)
	pv["winner"] = YOU_KEY if won else rival
	var yo: String = player_team_id
	var forz: Dictionary = {"ganador": yo if won else rival, "perdedor": rival if won else yo}
	st["forzado"] = forz
	var cupos: Dictionary = amer_cupos("CONMEBOL")
	var lib: Dictionary = cupos.get("lib", {})
	var res: Dictionary = amer_previa(forz, yo)
	if won:
		_amer_arma_grupos("lib",(lib.get("grupos", []) as Array) +(res["ganadores"] as Array))
		return
	st["playing"] = false
	st["alive"] = false
	st["fuera"] = "previa"
	_kill_future("lib", true)
	var sud: Dictionary = cupos.get("sud", {})
	sud_state = _amer_state_base("sud", "previa")
	_amer_arma_grupos("sud",(sud.get("grupos", []) as Array) \
			+(amer_preliminar()["ganadores"] as Array) \
			+(res["perdedores"] as Array))






func _resolve_sud_preliminar(tg: int, rg: int) -> void:
	var st: Dictionary = sud_state
	if not bool(st.get("playing", false)) or String(st.get("entrada", "")) != "preliminar":
		return
	var pv: Dictionary = st.get("preliminar", {})
	if pv.is_empty() or not String(pv.get("winner", "")).is_empty():
		return
	var rival: String = String(pv.get("b", ""))
	var won: bool = _knockout_won(rival, tg, rg)
	pv["leg1"] = "%d-%d" % [tg, rg]
	pv["winner"] = YOU_KEY if won else rival
	var yo: String = player_team_id
	var forz: Dictionary = {"ganador": yo if won else rival, "perdedor": rival if won else yo}
	st["forzado"] = forz
	if not won:
		st["playing"] = false
		st["alive"] = false
		st["fuera"] = "preliminar"
		_kill_future("sud", true)
		return
	var cupos: Dictionary = amer_cupos("CONMEBOL")
	var sud: Dictionary = cupos.get("sud", {})
	_amer_arma_grupos("sud",(sud.get("grupos", []) as Array) \
			+(amer_preliminar(forz)["ganadores"] as Array) \
			+(amer_previa()["perdedores"] as Array))












func _amer_seed_tras_grupos(comp: String, state: Dictionary) -> void:
	var groups: Array = state.get("groups", [])
	if groups.is_empty():
		return
	var orders: Array = []
	for g in groups:
		orders.append(euro_group_order(g))
	var n: int = orders.size()
	var names: Array = []
	names.assign(Continental.ko_names(comp))
	state["ko_names"] = names
	var pos: int =(orders[0] as Array).find(YOU_KEY) + 1



	if comp == "lib" or comp == "ofc":
		var ties: Array = []
		for i in n:
			var a: Array = orders[i]
			var b: Array = orders[(i + 1) % n]
			if a.is_empty() or b.size() < 2:
				continue
			ties.append({"a": String(a[0]), "b": String(b[1]), "winner": "", "score": ""})
		state["seeds"] = []
		state["bracket"] = [ties] if not ties.is_empty() else []
		var terceros: Array = []
		for o in orders:
			terceros.append(String((o as Array)[2]) if (o as Array).size() > 2 else "")
		if (pos == 1 or pos == 2) and not ties.is_empty():
			state["advanced"] = true
			_revive_euro_ko(comp)
			state["ko_idx"] = 0
			_euro_set_you_opp(comp, state, 0)
		else:
			state["advanced"] = false
			state["alive"] = false
			_kill_future(comp)
			_euro_sim_to_end(state, comp)
		if comp == "lib":
			_sud_desde_terceros(terceros)
		return

	var t3: Array = _amer_terceros_reales()
	if t3.is_empty():
		t3 = amer_proyectado("lib", season_num, 1.0).get("terceros", [])
	var seeds: Array = []
	var ties2: Array = []
	for i in n:
		var o: Array = orders[i]
		if o.size() < 2:
			continue
		seeds.append(String(o[0]))
		ties2.append({"a": String(o[1]), "b": String(t3[i]) if i < t3.size() else "",
			"winner": "", "score": ""})
	state["seeds"] = seeds
	state["bracket"] = [ties2] if not ties2.is_empty() else []
	if pos == 1:
		state["advanced"] = true
		_revive_euro_ko("sud")
		state["ko_idx"] = 1
		_kill_euro_round("sud", 0)
		_euro_play_round_without_you(state, 0, "sud")
		_euro_set_you_opp("sud", state, 1)
	elif pos == 2:
		state["advanced"] = true
		_revive_euro_ko("sud")
		state["ko_idx"] = 0
		_euro_set_you_opp("sud", state, 0)
	else:
		state["advanced"] = false
		state["alive"] = false
		_kill_future("sud")
		_euro_sim_to_end(state, "sud")








func _sud_desde_terceros(terceros: Array) -> void:
	if terceros.is_empty() or String(terceros[0]) != YOU_KEY:
		return
	var proj: Dictionary = amer_proyectado("sud", season_num, 1.0)
	var pgroups: Array = proj.get("groups", [])
	if pgroups.is_empty():
		return
	var groups: Array = []
	var ties: Array = []
	for i in pgroups.size():
		var pg: Dictionary = pgroups[i]
		groups.append({"keys":(pg.get("keys", []) as Array).duplicate(),
			"table":(pg.get("table", {}) as Dictionary).duplicate(true),
			"schedule":(pg.get("schedule", []) as Array).duplicate(true)})
		var o: Array = pg.get("orden_final", euro_group_order(pg))
		if o.size() < 2:
			continue
		var t3: String = String(terceros[i]) if i < terceros.size() else ""
		if t3 != YOU_KEY:
			t3 = _euro_sim_id(t3)
		ties.append({"a": String(o[1]), "b": t3, "winner": "", "score": ""})
	var st: Dictionary = _amer_state_base("sud", "playoff")
	st["groups"] = groups
	st["seeds"] =(proj.get("seeds", []) as Array).duplicate()
	st["bracket"] = [ties]
	st["advanced"] = true
	sud_state = st
	_revive_euro_ko("sud")
	_euro_set_you_opp("sud", st, 0)







func _amer_you_second_home(comp: String, state: Dictionary, opp: String,
		ko_idx: int = -1) -> bool:
	if ko_idx < 0:
		ko_idx = int(state.get("ko_idx", 0))
	if comp == "sud" and ko_idx == 0:
		return String(state.get("entrada", "")) != "playoff"
	return not _amer_mejor(comp, state, opp, YOU_KEY)




func _amer_mejor(comp: String, state: Dictionary, x: String, y: String) -> bool:
	var cx: Array = _amer_campana(state, x)
	var cy: Array = _amer_campana(state, y)
	for i in 3:
		if int(cx[i]) != int(cy[i]):
			return int(cx[i]) > int(cy[i])
	var sx: int = _amer_siembra(comp, state, x)
	var sy: int = _amer_siembra(comp, state, y)
	if sx != sy:
		return sx < sy
	return false





func _amer_siembra(comp: String, state: Dictionary, key: String) -> int:
	var seeds: Array = state.get("seeds", [])
	var si: int = seeds.find(key)
	if si >= 0:
		return si
	var id: String = _euro_sim_id(key)
	var cupos: Dictionary = amer_cupos(Continental.confed_de(comp))
	var lista: Array = []
	match comp:
		"lib":
			var lib: Dictionary = cupos.get("lib", {})
			lista =(lib.get("grupos", []) as Array) +(lib.get("previa", []) as Array)
		"sud":
			var sud: Dictionary = cupos.get("sud", {})
			lista =(sud.get("grupos", []) as Array).duplicate()
			var pre: Dictionary = sud.get("preliminar", {})
			for p in Continental.PAISES_CONMEBOL:
				lista.append_array(pre.get(p, []))
		"cca":



			lista =(cupos.get("cca", {}) as Dictionary).get("cuadro", [])
			var ci: int = lista.find(id)
			return 100 +(ci % 8) if ci >= 0 else 999
		"ace", "ac2", "caf", "cf2", "ofc":



			lista =(cupos.get(comp, {}) as Dictionary).get("cuadro", [])
	var i: int = lista.find(id)
	return 100 + i if i >= 0 else 999









func _amer_campana(state: Dictionary, key: String) -> Array:
	var out: Array = [0, 0, 0]
	for g in state.get("groups", []):
		var row: Variant =((g as Dictionary).get("table", {}) as Dictionary).get(key)
		if row is Dictionary:
			out[0] = int(out[0]) + int((row as Dictionary).get("pts", 0))
			out[1] = int(out[1]) + int((row as Dictionary).get("gf", 0)) \
					- int((row as Dictionary).get("gc", 0))
			out[2] = int(out[2]) + int((row as Dictionary).get("gf", 0))
	for ties in state.get("bracket", []):
		for t in ties:
			if String(t.get("winner", "")).is_empty():
				continue
			var a: String = String(t.get("a", ""))
			var b: String = String(t.get("b", ""))
			if key != a and key != b:
				continue
			var tot: Array = _split_tie_goals(String(t.get("score", "")))
			if tot.is_empty():
				continue
			var partidos: Array = []
			var ida: Array = _split_tie_goals(String(t.get("leg1", "")))
			if ida.is_empty():
				partidos.append(tot)
			else:
				partidos.append(ida)
				partidos.append([int(tot[0]) - int(ida[0]), int(tot[1]) - int(ida[1])])
			for m in partidos:
				var mine: int = int(m[0]) if key == a else int(m[1])
				var his: int = int(m[1]) if key == a else int(m[0])
				out[0] = int(out[0]) +(3 if mine > his else (1 if mine == his else 0))
				out[1] = int(out[1]) + mine - his
				out[2] = int(out[2]) + mine
	return out









func _amer_local_de_final(comp: String, t: Dictionary, es_final: bool) -> void:
	if not es_final or Continental.final_neutral(comp) or Continental.final_ida_vuelta(comp):
		return
	var a: String = String(t.get("a", ""))
	var b: String = String(t.get("b", ""))
	if a == YOU_KEY or b == YOU_KEY or a.is_empty() or b.is_empty():
		return
	if _amer_mejor(comp, euro_state(comp), b, a):
		t["a"] = b
		t["b"] = a



func _amer_en_ronda(state: Dictionary, ko_idx: int) -> bool:
	var bracket: Array = state.get("bracket", [])
	if ko_idx < 0 or ko_idx >= bracket.size():
		return false
	for t in bracket[ko_idx]:
		if String(t.get("a", "")) == YOU_KEY or String(t.get("b", "")) == YOU_KEY:
			return true
	return false





func _amer_advanced(comp: String, state: Dictionary) -> bool:
	if state.is_empty():
		return false
	var names: Array = Continental.ko_names(comp)
	match comp:
		"lib":
			return _amer_en_ronda(state, 0)
		"sud":
			return _amer_en_ronda(state, names.find("Octavos"))
		"cca", "ace", "ac2", "caf", "cf2":
			return _amer_en_ronda(state, 1)
		"ofc":


			return _amer_en_ronda(state, 0)
	return false






func _amer_champion_id(comp: String, you_won: bool) -> String:
	if you_won:
		return player_team_id
	var w: String = String(euro_state(comp).get("winner", ""))
	if not w.is_empty():
		return _euro_sim_id(w)
	return _euro_sim_id(String(amer_proyectado(comp, season_num, 1.0).get("winner", "")))



















func _relocate_catch_up_amer(resume_idx: int) -> void:
	for i in mini(resume_idx, calendar.size()):
		var f: Dictionary = calendar[i]
		var comp: String = String(f.get("comp", ""))
		if not Continental.es_americana(comp) or bool(f.get("dead", false)):
			continue
		var rnd: String = String(f.get("round", ""))
		var opp: String = String(f.get("opp", ""))
		var ko_idx: int = int(f.get("ko_idx", -1))
		var es_ko: bool = ko_idx >= 0 and not (rnd in ["grupo", "previa", "preliminar"])
		if opp.is_empty() or (not es_ko and not (rnd in ["grupo", "previa", "preliminar"])):
			continue
		var home: bool = bool(f.get("home", false))


		var neutral: bool = comp == "ofc" or (es_ko and Continental.ko_neutral(comp, ko_idx,
			Continental.es_final(comp, ko_idx)))
		var s: Array = _sim_score(player_team_id if home else opp,
			opp if home else player_team_id, neutral, comp)
		var tg: int = int(s[0]) if home else int(s[1])
		var rg: int = int(s[1]) if home else int(s[0])
		if es_ko:

			_resolve_euro_ko(comp, ko_idx, int(f.get("leg", 1)), tg, rg, 0, true)
			f["dead"] = true
			f["played"] = true
			f["gf"] = tg
			f["gc"] = rg
			continue
		match rnd:
			"grupo":
				_resolve_euro_group(comp, int(f.get("euro_round", 0)), tg, rg)
			"previa":
				_resolve_lib_previa(int(f.get("leg", 1)), tg, rg)
			"preliminar":
				_resolve_sud_preliminar(tg, rg)
		f["dead"] = true
		f["played"] = true
		f["gf"] = tg
		f["gc"] = rg











func liguilla_activa() -> bool:
	return bool(liguilla_state.get("playing", false))





func liguilla_you_better(opp: String) -> bool:
	return Liguilla.mejor(YOU_KEY, opp,
		liguilla_state.get("seed_of", {})) == YOU_KEY





func liguilla_your_round() -> int:
	return _liguilla_ronda_de(liguilla_state)









func liguilla_del_ano() -> Dictionary:
	var out: Dictionary = {"sembrada": false, "ronda": -1, "champion": false}
	for t in [Liguilla.APERTURA, Liguilla.CLAUSURA]:
		var lg: Dictionary = liguilla_de(t)


		if lg.is_empty() or not bool(lg.get("seeded", false)) \
				or bool(lg.get("sin_ti", false)):
			continue
		out["sembrada"] = true
		out["ronda"] = maxi(int(out["ronda"]), _liguilla_ronda_de(lg))
		if bool(lg.get("champion", false)):
			out["champion"] = true
	out["viva"] = not bool(liguilla_state.get("seeded", false)) \
			or bool(liguilla_state.get("alive", false)) \
			or (torneos_activos() and _liguilla_torneo() == Liguilla.APERTURA)
	return out





func torneo_position() -> int:
	if not torneos_activos():
		return league_position()
	var rows: Array = torneo_standings(torneo_actual())
	for i in rows.size():
		if String(rows[i]["key"]) == YOU_KEY:
			return i + 1
	return rows.size()






func _liguilla_ronda_de(lg: Dictionary) -> int:
	if bool(lg.get("sin_ti", false)):
		return -1
	var bracket: Array = lg.get("bracket", [])
	for k in range(bracket.size() - 1, -1, -1):
		for t in bracket[k]:
			if String(t.get("a", "")) == YOU_KEY or String(t.get("b", "")) == YOU_KEY:
				return k
	return -1


func _liguilla_estado_nuevo(torneo: int = Liguilla.CLAUSURA) -> Dictionary:
	return {"playing": true, "seeded": false, "orden": [], "seed_of": {},
		"bracket": [], "ko_idx": -1, "alive": false, "champion": false, "pos": 0,
		"winner": "", "runner_up": "", "superlider": "",
		"ko_names": Array(Liguilla.RONDAS), "torneo": torneo}
















func _build_liguilla(entries: Array, league_len: int) -> void:
	liguilla_state = {}


	if not _liga_en_torneos(league_table.size()):
		return
	liguilla_state = _liguilla_estado_nuevo(Liguilla.CLAUSURA)
	var del_club: Array = []
	for e in entries:
		if not Continental.es_americana(String((e as Dictionary).get("comp", ""))):
			del_club.append(e)
	_fechas_liguilla(entries, maxf(float(league_len), _last_week(del_club)),
		Liguilla.CLAUSURA)




func _fechas_liguilla(entries: Array, base: float, torneo: int) -> void:
	for fe in Liguilla.FECHAS:
		var k: int = int(fe[0])
		var leg: int = int(fe[1])
		entries.append({"comp": "liguilla", "opp": "", "home": true,
			"round": Liguilla.RONDAS[k], "ko_idx": k, "leg": leg, "dead": true,
			"label": Liguilla.etiqueta(k, leg), "week": CalendarioMundo.semana_liguilla(base, fe),
			"torneo": torneo})





func _liga_en_torneos(clubes: int) -> bool:
	return Liguilla.aplica(Teams.country_of(player_team_id), player_div()) \
			and clubes >= Liguilla.CLUBES_MIN













func _parte_en_torneos(entries: Array) -> void:
	if liguilla_state.is_empty():
		return
	var en_torneos: bool = false
	for e in entries:
		if String(e.get("comp", "")) == "league" and e.has("torneo"):
			en_torneos = true
			break
	if not en_torneos:
		return
	var total: int = league_schedule.size()
	for e in entries:
		if e.has("week"):
			e["week"] = CalendarioMundo.en_torneos(float(e["week"]), total, true)
	_fechas_liguilla(entries, CalendarioMundo.mitad(total), Liguilla.APERTURA)
	liguilla_state["torneo"] = Liguilla.APERTURA





func torneos_activos() -> bool:
	for e in calendar:
		if String(e.get("comp", "")) == "league":
			return e.has("torneo")
	return false






func torneo_actual() -> int:
	if not torneos_activos():
		return -1
	if _liguilla_torneo() == Liguilla.CLAUSURA:
		return Liguilla.CLAUSURA
	if apertura_tabla.is_empty() or String(liguilla_state.get("winner", "")).is_empty():
		return Liguilla.APERTURA
	return Liguilla.CLAUSURA






func torneo_standings(t: int) -> Array:
	_ensure_season()
	if apertura_tabla.is_empty():
		return league_standings()
	if t == Liguilla.APERTURA:
		return _standings_of(apertura_tabla)
	var resta: Dictionary = {}
	for key in league_table:
		var r: Dictionary =(league_table[key] as Dictionary).duplicate()
		var a: Dictionary = apertura_tabla.get(key, {})
		for c in ["pj", "w", "d", "l", "gf", "gc", "pts"]:
			r[c] = int(r.get(c, 0)) - int(a.get(c, 0))
		resta[key] = r
	return _standings_of(resta)




func liguilla_de(t: int) -> Dictionary:
	if t == Liguilla.APERTURA and not liguilla_apertura.is_empty():
		return liguilla_apertura
	if not liguilla_state.is_empty() and _liguilla_torneo() == t:
		return liguilla_state
	return {}



func apertura_mundo_de(country: String, div: int, season: int) -> Dictionary:
	return apertura_mundo.get("%s|%d|%d" % [country, div, season], {})





func congela_apertura_mundo(country: String, div: int, season: int,
		lg: Dictionary) -> void:
	if String(lg.get("winner", "")).is_empty():
		return
	for k in apertura_mundo.keys():
		if int(String(k).get_slice("|", 2)) < season_num - 1:
			apertura_mundo.erase(k)
	apertura_mundo["%s|%d|%d" % [country, div, season]] = lg





func apertura_mundo_cerrado(season: int) -> bool:
	if season != season_num:
		return season < season_num
	var total: int = league_rounds_yours()
	var pj: int = int(Dictionary(league_table.get(YOU_KEY, {})).get("pj", 0))
	return total > 0 and pj * 2 >= total







func _guarda_apertura_jugado(club: String) -> void:
	var lg: Dictionary = liguilla_de(Liguilla.APERTURA)
	var w: String = String(lg.get("winner", ""))



	var div_w: int = div_of(w) if not w.is_empty() else 0
	if w.is_empty() or not Liguilla.aplica(Teams.country_of(w), div_w):
		return
	var out: Dictionary = lg.duplicate(true)
	if not club.is_empty():
		var orden: Array = []
		for x in out.get("orden", []):
			orden.append(club if String(x) == YOU_KEY else x)
		out["orden"] = orden
		var seeds: Dictionary = {}
		var so: Dictionary = out.get("seed_of", {})
		for x in so:
			seeds[club if String(x) == YOU_KEY else x] = so[x]
		out["seed_of"] = seeds
		for ronda in out.get("bracket", []):
			for t in ronda:
				for c in (t as Dictionary).keys():
					if t[c] is String and String(t[c]) == YOU_KEY:
						t[c] = club
	out["champion"] = false
	out["sin_ti"] = true
	congela_apertura_mundo(Teams.country_of(w), div_w, season_num, out)



func _liguilla_torneo() -> int:
	return int(liguilla_state.get("torneo", Liguilla.CLAUSURA))





func _cierra_apertura() -> void:
	if _liguilla_torneo() != Liguilla.APERTURA or not apertura_tabla.is_empty():
		return
	apertura_tabla = league_table.duplicate(true)
	_liguilla_seed()








func _liguilla_relevo() -> void:
	if not torneos_activos() or _liguilla_torneo() != Liguilla.APERTURA:
		return
	if apertura_tabla.is_empty():
		_cierra_apertura()
	_liguilla_cierra()
	liguilla_apertura = liguilla_state
	liguilla_state = _liguilla_estado_nuevo(Liguilla.CLAUSURA)





func _kill_future_liguilla() -> void:
	var t: int = _liguilla_torneo()
	for i in range(season_day + 1, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == "liguilla" \
				and int(e.get("torneo", Liguilla.CLAUSURA)) == t:
			e["dead"] = true






func _liguilla_seed() -> void:
	if not liguilla_activa() or bool(liguilla_state.get("seeded", false)):
		return
	liguilla_state["seeded"] = true


	var orden: Array = []
	for r in torneo_standings(_liguilla_torneo()):
		orden.append(String(r["key"]))
	if orden.size() < Liguilla.CLUBES_MIN:
		liguilla_state["playing"] = false
		return
	var ocho: Array = orden.slice(0, Liguilla.CLUBES_MIN)
	var pos: int = orden.find(YOU_KEY) + 1
	liguilla_state["orden"] = ocho
	liguilla_state["seed_of"] = Liguilla.siembra(ocho)
	liguilla_state["superlider"] = _euro_sim_id(String(orden[0]))
	liguilla_state["pos"] = pos
	liguilla_state["bracket"] = Liguilla.cuadro_nuevo(ocho)
	liguilla_state["alive"] = pos >= 1 and pos <= Liguilla.CLUBES_MIN
	_liguilla_tras_ronda()





func _liguilla_tras_ronda() -> void:
	var bracket: Array = liguilla_state.get("bracket", [])
	var alive: bool = bool(liguilla_state.get("alive", false))
	Liguilla.avanza(bracket, liguilla_state.get("orden", []),
		liguilla_state.get("seed_of", {}), _liguilla_ctx(), YOU_KEY if alive else "")
	var k: int = Liguilla.ronda_abierta_de(bracket, YOU_KEY) if alive else -1
	if k >= 0:
		_liguilla_set_you_opp(k)
	else:


		liguilla_state["alive"] = alive \
				and Liguilla.campeon(bracket) == YOU_KEY
		_kill_future_liguilla()
	liguilla_state["ko_idx"] = liguilla_your_round()
	var w: String = Liguilla.campeon(bracket)
	liguilla_state["winner"] = _euro_sim_id(w) if not w.is_empty() else ""
	var ru: String = Liguilla.subcampeon(bracket)
	liguilla_state["runner_up"] = _euro_sim_id(ru) if not ru.is_empty() else ""






func _liguilla_set_you_opp(k: int) -> void:
	var bracket: Array = liguilla_state.get("bracket", [])
	if k < 0 or k >= bracket.size():
		return
	var opp: String = ""
	var soy_a: bool = false
	for t in bracket[k]:
		if not String(t.get("winner", "")).is_empty():
			continue
		if String(t["a"]) == YOU_KEY:
			opp = String(t["b"])
			soy_a = true
		elif String(t["b"]) == YOU_KEY:
			opp = String(t["a"])
	if opp.is_empty():
		return
	var dos: bool = Liguilla.DOS_PIERNAS[k]


	var t: int = _liguilla_torneo()
	for i in range(season_day + 1, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) != "liguilla" or int(e.get("ko_idx", -1)) != k \
				or bool(e.get("played", false)) \
				or int(e.get("torneo", Liguilla.CLAUSURA)) != t:
			continue
		var leg: int = int(e.get("leg", 1))
		e["opp"] = _euro_sim_id(opp)
		e["dead"] = false
		e["home"] = soy_a if (not dos or leg == 0) else not soy_a





func _liguilla_ctx() -> Dictionary:
	return {
		"marcador": func(a: String, b: String) -> Array:
			return _sim_score(_euro_sim_id(a), _euro_sim_id(b), false, "league"),
		"p": func(a: String, b: String) -> float:
			return tie_p(_euro_sim_id(a), _euro_sim_id(b)),
		"azar": func() -> float:
			return randf(),
	}





func _resolve_liguilla(k: int, leg: int, tg: int, rg: int) -> void:
	if not bool(liguilla_state.get("alive", false)):
		return
	var bracket: Array = liguilla_state.get("bracket", [])
	if k < 0 or k >= bracket.size():
		return
	var ties: Array = bracket[k]
	var mio: Dictionary = {}
	for t in ties:
		if String(t.get("winner", "")).is_empty() \
				and (String(t["a"]) == YOU_KEY or String(t["b"]) == YOU_KEY):
			mio = t
			break
	if mio.is_empty():
		return
	var soy_a: bool = String(mio["a"]) == YOU_KEY
	var opp: String = String(mio["b"]) if soy_a else String(mio["a"])
	var ctx: Dictionary = _liguilla_ctx()
	var dos: bool = Liguilla.DOS_PIERNAS[k]

	var hoy: Array = [tg, rg] if soy_a else [rg, tg]
	if dos and leg < 1:
		mio["leg1"] = "%d-%d" % hoy
		Liguilla.juega_idas(bracket, k, ctx, YOU_KEY)
		_liguilla_log(ties, "leg1")
		return
	var mine: int = tg
	var his: int = rg
	if dos:
		var ida: Array = Liguilla.goles(String(mio.get("leg1", "")))
		if not ida.is_empty():
			mine += int(ida[0]) if soy_a else int(ida[1])
			his += int(ida[1]) if soy_a else int(ida[0])
		mio["leg2"] = "%d-%d" % hoy
	var won: bool = _liguilla_you_won(k, opp, mine, his)
	mio["score"] = "%d-%d" %([mine, his] if soy_a else [his, mine])
	if mine == his and Liguilla.REGLA[k] != "sembrado":
		mio["pens"] = YOU_KEY if won else opp
	mio["winner"] = YOU_KEY if won else opp
	Liguilla.juega_ronda(bracket, k, liguilla_state.get("seed_of", {}), ctx)
	_liguilla_log(ties, "leg2" if dos else "score", dos)
	var won_rounds: int = 0
	for rt in bracket:
		for t in rt:
			if String(t.get("winner", "")) == YOU_KEY:
				won_rounds += 1
	_liguilla_tras_ronda()
	if k >= Liguilla.FINAL:
		if won:
			liguilla_state["champion"] = true


			_crown("Campeón de Liga", _liguilla_torneo() if torneos_activos() else -1)
		return



	if _liguilla_hay_vestuario(won):
		_queue_cup_room("liguilla", LIGUILLA_ROOM_ROUNDS, maxi(k - 1, 0), won,
			_euro_sim_id(opp), tg, rg, won_rounds)









func liguilla_sin_eliminacion(_f: Dictionary) -> bool:
	return false






func _liguilla_hay_vestuario(won: bool) -> bool:
	return (won and liguilla_your_round() >= Liguilla.CUARTOS) \
			or not bool(liguilla_state.get("alive", false))



const LIGUILLA_ROOM_ROUNDS: Array = ["Play-in", "Cuartos", "Semifinal", "Final"]





func _liguilla_you_won(k: int, opp: String, mine: int, his: int) -> bool:
	if mine != his:
		return mine > his
	if Liguilla.REGLA[k] == "sembrado":
		next_shootout_winner = 0
		return liguilla_you_better(opp)
	return _knockout_won(_euro_sim_id(opp), mine, his)






func _liguilla_log(ties: Array, key: String, agg: bool = false) -> void:
	for t in ties:
		var g: Array = Liguilla.goles(String(t.get(key, "")))
		if g.is_empty():
			continue
		var a: String = String(t["a"])
		var b: String = String(t["b"])
		var you: bool = a == YOU_KEY or b == YOU_KEY
		var vuelta: bool = key == "leg2"
		if vuelta:
			_log_round_result(_euro_sim_id(b), _euro_sim_id(a), int(g[1]), int(g[0]), you)
		else:
			_log_round_result(_euro_sim_id(a), _euro_sim_id(b), int(g[0]), int(g[1]), you)
		var w: String = String(t.get("winner", ""))
		if w.is_empty():
			continue
		var row: Dictionary = last_round_results[last_round_results.size() - 1]
		if agg:
			var tot: Array = Liguilla.goles(String(t.get("score", "")))
			if not tot.is_empty():
				row["agg"] = "%d-%d" %([int(tot[1]), int(tot[0])] if vuelta \
						else [int(tot[0]), int(tot[1])])
				row["adv"] = _euro_sim_id(w)
		elif key == "score" and int(g[0]) == int(g[1]):
			row["adv"] = _euro_sim_id(w)






func _liguilla_cierra() -> void:
	if not liguilla_activa():
		return
	if not bool(liguilla_state.get("seeded", false)):
		_liguilla_seed()
	if not liguilla_activa():
		return
	if String(liguilla_state.get("winner", "")).is_empty():
		liguilla_state["alive"] = false
		_liguilla_tras_ronda()
	liguilla_state["champion"] = String(liguilla_state.get("winner", "")) == player_team_id



func _kill_future(comp: String, include_groups: bool = false) -> void:
	for i in range(season_day + 1, calendar.size()):
		if String(calendar[i].get("comp", "")) != comp:
			continue
		if not include_groups and String(calendar[i].get("round", "")) == "grupo":
			continue






		if comp == "nat" and not include_groups \
				and _nat_ronda_aparte(String(calendar[i].get("round", ""))):
			continue
		calendar[i]["dead"] = true




func _nat_ronda_aparte(ronda: String) -> bool:
	return ronda == Finalissima.RONDA or ronda in LigaNaciones.RONDAS \
			or ronda in JuegosOlimpicos.RONDAS











func drop_pending_nat() -> void:






	_kill_future("nat", true)
	nat_state = {}
	_save()



func _revive_euro_ko(comp: String) -> void:
	for i in range(season_day + 1, calendar.size()):
		if String(calendar[i].get("comp", "")) == comp \
				and String(calendar[i].get("round", "")) != "grupo":
			calendar[i]["dead"] = false



func _apply_row(table: Dictionary, key_a: String, key_b: String, ga: int, gb: int) -> void:
	var a: Dictionary = table[key_a]
	var b: Dictionary = table[key_b]
	a["pj"] += 1
	b["pj"] += 1
	a["gf"] += ga
	a["gc"] += gb
	b["gf"] += gb
	b["gc"] += ga
	if ga > gb:
		a["w"] += 1
		a["pts"] += 3
		b["l"] += 1
	elif ga < gb:
		b["w"] += 1
		b["pts"] += 3
		a["l"] += 1
	else:
		a["d"] += 1
		b["d"] += 1
		a["pts"] += 1
		b["pts"] += 1















func _promoted_at(pdiv: int, pos: int, teams_count: int) -> bool:
	return pdiv > 1 and pos >= 1 and pos <= mini(DIV_EXCHANGE, maxi(teams_count - 1, 1))








func in_promotion_zone() -> bool:
	var rows: Array = league_standings()
	if rows.is_empty():
		return false
	return _promoted_at(player_div(), _league_position(), rows.size())























const STAKE_JORNADAS: int = 5
const STAKE_PTS: int = 3








func league_stake() -> Dictionary:
	var rows: Array = league_standings()
	var n: int = rows.size()
	if n < 2 * DIV_EXCHANGE + 1 or calendar.is_empty():
		return {}
	var t: int = torneo_actual()
	var resto: Vector2i = _liga_restante(t)
	var quedan: int = resto.x
	var quedan_t: int = resto.y
	if quedan_t >= STAKE_JORNADAS:
		return {}
	var yo: int = _league_position() - 1
	var mis_pts: int = int(rows[yo]["pts"])
	var pdiv: int = player_div()
	var floor_div: int = Teams.max_div(Teams.country_of(player_team_id))

	if pdiv < floor_div and quedan < STAKE_JORNADAS:
		var r0: int = n - DIV_EXCHANGE
		if yo >= r0:
			var a_salvarse: int = int(rows[r0 - 1]["pts"]) - mis_pts
			if a_salvarse <= STAKE_PTS:
				return {"tipo": "descenso", "dentro": true, "pts": a_salvarse,
					"quedan": quedan}
		else:
			var sobre: int = mis_pts - int(rows[r0]["pts"])
			if sobre <= STAKE_PTS:
				return {"tipo": "descenso", "dentro": false, "pts": sobre,
					"quedan": quedan}
	if liguilla_activa():
		return _stake_liguilla(t, quedan_t)
	var peleas: Array = ["titulo"] if pdiv <= 1 else ["ascenso", "titulo"]
	for tipo in peleas:

		var z: int = 1 if tipo == "titulo" else mini(DIV_EXCHANGE, n - 1)
		if yo < z:
			var colchon: int = mis_pts - int(rows[z]["pts"])
			if colchon <= STAKE_PTS:
				return {"tipo": tipo, "dentro": true, "pts": colchon, "quedan": quedan}
		else:
			var falta: int = int(rows[z - 1]["pts"]) - mis_pts
			if falta <= STAKE_PTS:
				return {"tipo": tipo, "dentro": false, "pts": falta, "quedan": quedan}
	return {}






func _liga_restante(t: int) -> Vector2i:
	var quedan: int = 0
	var quedan_t: int = 0
	for i in range(season_day + 1, calendar.size()):
		var f: Dictionary = calendar[i]
		if String(f.get("comp", "")) == "league" and not bool(f.get("dead", false)):
			quedan += 1
			if t < 0 or int(f.get("torneo", -1)) == t:
				quedan_t += 1
	return Vector2i(quedan, quedan_t)






func liga_tramo_final() -> bool:
	if calendar.is_empty():
		return false
	return _liga_restante(torneo_actual()).y < STAKE_JORNADAS


















func liga_decidida() -> bool:
	if calendar.is_empty() or torneo_actual() >= 0:
		return false
	var rows: Array = league_standings()
	var n: int = rows.size()
	var total: int = league_rounds_yours()
	if n < 2 or total <= 0:
		return false
	var yo: int = _league_position() - 1
	var mis: int = int(rows[yo]["pts"])
	var mi_resto: int = maxi(0, total - int(rows[yo]["pj"]))
	var cortes: Array = [1]
	var pdiv: int = player_div()
	var pais: String = Teams.country_of(player_team_id)
	if pdiv > 1:
		cortes.append(DIV_EXCHANGE)
	if pdiv < Teams.max_div(pais):
		cortes.append(n - DIV_EXCHANGE)
	if liguilla_activa():
		cortes.append(Liguilla.CLUBES_MIN)
	if pdiv == 1 and Teams.is_european(pais):
		var q: Dictionary = euro_qualification(1, 1, pais, false, false, false)
		var c: int = 0
		for k in ["ucl_cut", "eul_cut", "conf_cut"]:
			if int(q[k]) > 0:
				c += int(q[k])
				cortes.append(c)
	for c in cortes:
		if int(c) <= 0 or int(c) >= n:
			continue
		var alcanzan: int = 0
		var fuera_de_alcance: int = 0
		for i in n:
			if i == yo:
				continue
			var pts: int = int(rows[i]["pts"])
			var resto: int = maxi(0, total - int(rows[i]["pj"]))
			if pts + 3 * resto >= mis:
				alcanzan += 1
			if pts > mis + 3 * mi_resto:
				fuera_de_alcance += 1
		if not (alcanzan < int(c) or fuera_de_alcance >= int(c)):
			return false
	return true


















func euro_fase_decidida(comp: String) -> bool:
	var st: Dictionary = euro_state(comp)
	var g: Dictionary = euro_you_group(st)
	var table: Dictionary = g.get("table", {})
	if not table.has(YOU_KEY):
		return false

	var quedan: int = 0
	for i in range(season_day, calendar.size()):
		var f: Dictionary = calendar[i]
		if String(f.get("comp", "")) == comp and String(f.get("round", "")) == "grupo" \
				and not bool(f.get("dead", false)):
			quedan += 1
	if quedan <= 0:
		return true
	var yo: Dictionary = table[YOU_KEY]
	var mis: int = int(yo.get("pts", 0))
	var total: int = int(yo.get("pj", 0)) + quedan
	var cortes: Array = [CWC_QUALIFY]
	if Continental.es_americana(comp):
		cortes = [1, 2, 3]
	elif bool(st.get("league_phase", false)):
		cortes = [EURO_DIRECT, EURO_PLAYOFF]
	for c in cortes:
		if int(c) >= table.size():
			continue
		var alcanzan: int = 0
		var fuera_de_alcance: int = 0
		for k in table:
			if String(k) == YOU_KEY:
				continue
			var fila: Dictionary = table[k]
			var pts: int = int(fila.get("pts", 0))
			var resto: int = maxi(0, total - int(fila.get("pj", 0)))
			if pts + 3 * resto >= mis:
				alcanzan += 1
			if pts > mis + 3 * quedan:
				fuera_de_alcance += 1
		var seguro: bool = alcanzan < int(c)
		var imposible: bool = fuera_de_alcance >= int(c)
		if not (seguro or imposible):
			return false
	return true




func _stake_liguilla(t: int, quedan: int) -> Dictionary:
	var rows: Array = torneo_standings(t) if t >= 0 else league_standings()
	var z: int = mini(Liguilla.CLUBES_MIN, rows.size() - 1)
	var yo: int = -1
	for i in rows.size():
		if String(rows[i]["key"]) == YOU_KEY:
			yo = i
			break
	if yo < 0 or z <= 0:
		return {}
	var mis_pts: int = int(rows[yo]["pts"])
	if yo < z:
		var colchon: int = mis_pts - int(rows[z]["pts"])
		if colchon <= STAKE_PTS:
			return {"tipo": "liguilla", "dentro": true, "pts": colchon, "quedan": quedan}
	else:
		var falta: int = int(rows[z - 1]["pts"]) - mis_pts
		if falta <= STAKE_PTS:
			return {"tipo": "liguilla", "dentro": false, "pts": falta, "quedan": quedan}
	return {}




func _relegated_at(pdiv: int, pos: int, teams_count: int, floor_div: int) -> bool:
	return pdiv < floor_div and pos > teams_count - DIV_EXCHANGE













func close_season() -> bool:
	if not season_close_pending:
		return false
	season_close_pending = false
	_end_season()
	return true


func _end_season() -> void:



	if not calendar.is_empty() and int(europa_cupos_snap.get("season", -1)) != season_num:
		europa_cupos()










	var estados_euro: Dictionary = _estados_euro_cierre()
	var campeones_euro: Dictionary = _campeones_euro_proyectados(estados_euro)
	_cierra_coef_uefa(estados_euro)
	var standings: Array = league_standings()
	var pos: int = _league_position()
	var teams_count: int = standings.size()
	var won_league: bool = pos == 1
	var pdiv: int = player_div()
	var floor_div: int = Teams.max_div(Teams.country_of(player_team_id))
	var promoted: bool = _promoted_at(pdiv, pos, teams_count)
	var relegated: bool = _relegated_at(pdiv, pos, teams_count, floor_div)



	var won_ucl: bool = bool(ucl_state.get("champion", false))
	var won_eul: bool = bool(eul_state.get("champion", false))
	var won_conf: bool = bool(conf_state.get("champion", false))
	var won_cup: bool = bool(cup_state.get("champion", false))


	var won_lib: bool = bool(lib_state.get("champion", false))
	var won_sud: bool = bool(sud_state.get("champion", false))
	var won_cca: bool = bool(cca_state.get("champion", false))
	var won_ace: bool = bool(ace_state.get("champion", false))
	var won_ac2: bool = bool(ac2_state.get("champion", false))
	var won_caf: bool = bool(caf_state.get("champion", false))
	var won_cf2: bool = bool(cf2_state.get("champion", false))
	var won_ofc: bool = bool(ofc_state.get("champion", false))



	var next_div: int = pdiv - 1 if promoted else (pdiv + 1 if relegated else pdiv)





	var pos_eu: int = pos - _vetados_encima(standings, pos, season_num + 1)
	var q: Dictionary = euro_qualification(pdiv, pos_eu,
		Teams.country_of(player_team_id), won_ucl, won_eul, won_cup, won_conf, next_div)
	var euro_vetada: String = ""
	if Career.vetado_europa(player_team_id, season_num + 1):
		if bool(q["ucl"]):
			euro_vetada = "champions"
		elif bool(q["eul"]):
			euro_vetada = "europa"
		elif bool(q["conf"]):
			euro_vetada = "conference"
		q["ucl"] = false
		q["eul"] = false
		q["conf"] = false
	var next_qualified: bool = bool(q["ucl"])
	var next_qualified_eul: bool = bool(q["eul"])
	var next_qualified_conf: bool = bool(q["conf"])


	var champ_key: String = String(standings[0].get("key", "")) if not standings.is_empty() else ""
	var league_champion: String = player_team_id if champ_key == YOU_KEY else champ_key



	var runner_up: String = ""






	var champions: Array = []
	var ganadas: Array = []
	var liguillas: Array = []
	if liguilla_activa():
		_liguilla_cierra()
		var torneos: bool = torneos_activos()
		won_league = false
		for t in ([Liguilla.APERTURA, Liguilla.CLAUSURA] if torneos else [Liguilla.CLAUSURA]):
			var lg: Dictionary = liguilla_de(t)
			if lg.is_empty():
				continue
			var lw: String = String(lg.get("winner", ""))
			if bool(lg.get("champion", false)):
				won_league = true
				ganadas.append(t)
			if not lw.is_empty():
				league_champion = lw
			runner_up = String(lg.get("runner_up", ""))
			if torneos:
				champions.append(lw)
			liguillas.append({"torneo": t, "winner": lw, "runner_up": runner_up,
				"superlider": String(lg.get("superlider", "")),
				"pos": int(lg.get("pos", 0)), "ronda": _liguilla_ronda_de(lg),
				"champion": bool(lg.get("champion", false)),
				"sin_ti": bool(lg.get("sin_ti", false))})
	var mejor_ronda: int = -1
	for lg in liguillas:
		mejor_ronda = maxi(mejor_ronda, int(lg["ronda"]))
	var result: Dictionary = {
		"won_league": won_league, "league_pos": pos, "teams": teams_count,


		"euro_vetada": euro_vetada,
		"league_champion": league_champion,
		"league_champions": champions,
		"ligas_ganadas": ganadas,





		"liguilla": not liguillas.is_empty(),
		"liguillas": liguillas,
		"superlider": String(liguilla_state.get("superlider", "")),
		"league_runner_up": runner_up,
		"liguilla_pos": int(liguilla_state.get("pos", 0)),
		"liguilla_ronda": mejor_ronda,
		"promoted": promoted, "relegated": relegated,
		"qualified_ucl": next_qualified,
		"qualified_eul": next_qualified_eul,
		"played_ucl": bool(ucl_state.get("playing", false)),
		"ucl_advanced": bool(ucl_state.get("advanced", false)),
		"ucl_champion": won_ucl,
		"played_eul": bool(eul_state.get("playing", false)),
		"eul_advanced": bool(eul_state.get("advanced", false)),
		"eul_champion": won_eul,
		"qualified_conf": next_qualified_conf,
		"played_conf": bool(conf_state.get("playing", false)),
		"conf_advanced": bool(conf_state.get("advanced", false)),
		"conf_champion": won_conf,
		"cup_champion": won_cup,
		"cwc_champion": bool(cwc_state.get("champion", false)),





		"played_cup": not cup_state.is_empty(),
		"cup_final": _reached_final(cup_state),
		"cup_rounds": int(cup_state.get("names", []).size()),








		"cup_won_rounds": int(cup_state.get("idx", 0)),
		"ucl_won_rounds": _euro_ko_won(ucl_state),
		"eul_won_rounds": _euro_ko_won(eul_state),
		"conf_won_rounds": _euro_ko_won(conf_state),
		"played_cwc": not cwc_state.is_empty(),
		"cwc_final": _reached_final(cwc_state),






		"played_lib": not lib_state.is_empty(),
		"played_sud": not sud_state.is_empty(),
		"played_cca": not cca_state.is_empty(),
		"played_ace": not ace_state.is_empty(),
		"played_ac2": not ac2_state.is_empty(),
		"played_caf": not caf_state.is_empty(),
		"played_cf2": not cf2_state.is_empty(),
		"played_ofc": not ofc_state.is_empty(),
		"lib_advanced": _amer_advanced("lib", lib_state),
		"sud_advanced": _amer_advanced("sud", sud_state),
		"cca_advanced": _amer_advanced("cca", cca_state),
		"ace_advanced": _amer_advanced("ace", ace_state),
		"ac2_advanced": _amer_advanced("ac2", ac2_state),
		"caf_advanced": _amer_advanced("caf", caf_state),
		"cf2_advanced": _amer_advanced("cf2", cf2_state),
		"ofc_advanced": _amer_advanced("ofc", ofc_state),
		"won_lib": won_lib,
		"won_sud": won_sud,
		"won_cca": won_cca,
		"won_ace": won_ace,
		"won_ac2": won_ac2,
		"won_caf": won_caf,
		"won_cf2": won_cf2,
		"won_ofc": won_ofc,
		"lib_entrada": String(lib_state.get("entrada", "")),
		"sud_entrada": String(sud_state.get("entrada", "")),
		"cca_entrada": String(cca_state.get("entrada", "")),
		"ace_entrada": String(ace_state.get("entrada", "")),
		"ac2_entrada": String(ac2_state.get("entrada", "")),
		"caf_entrada": String(caf_state.get("entrada", "")),
		"cf2_entrada": String(cf2_state.get("entrada", "")),
		"ofc_entrada": String(ofc_state.get("entrada", "")),
		"lib_won_rounds": _euro_ko_won(lib_state),
		"sud_won_rounds": _euro_ko_won(sud_state),
		"cca_won_rounds": _euro_ko_won(cca_state),
		"ace_won_rounds": _euro_ko_won(ace_state),
		"ac2_won_rounds": _euro_ko_won(ac2_state),
		"caf_won_rounds": _euro_ko_won(caf_state),
		"cf2_won_rounds": _euro_ko_won(cf2_state),
		"ofc_won_rounds": _euro_ko_won(ofc_state),
		"lib_winner_id": _amer_champion_id("lib", won_lib),
		"sud_winner_id": _amer_champion_id("sud", won_sud),
		"cca_winner_id": _amer_champion_id("cca", won_cca),
		"ace_winner_id": _amer_champion_id("ace", won_ace),
		"ac2_winner_id": _amer_champion_id("ac2", won_ac2),
		"caf_winner_id": _amer_champion_id("caf", won_caf),
		"cf2_winner_id": _amer_champion_id("cf2", won_cf2),
		"ofc_winner_id": _amer_champion_id("ofc", won_ofc),



		"standings": standings.duplicate(true),
	}



	result.merge(europa_resumen_previas())


	last_league_champion = league_champion




	if pdiv == 1:
		var order: Array = []
		for row in standings:
			var k: String = String(row.get("key", ""))
			order.append(player_team_id if k == YOU_KEY else k)
		last_league_order = order
	else:
		last_league_order = []




	_foto_temporada()




	_consolida_estadios(pdiv)




	last_div_moves = {}


	if promoted:
		club_div[player_team_id] = pdiv - 1
		last_div_moves[player_team_id] = -1
	elif relegated:
		club_div[player_team_id] = pdiv + 1
		last_div_moves[player_team_id] = 1




	_apply_pyramid(standings, pdiv, promoted, relegated, result)



	_repara_piramide()
	_sim_world_champions(result, campeones_euro)
	qualified_ucl = next_qualified
	qualified_eul = next_qualified_eul
	qualified_conf = next_qualified_conf



	last_ucl_winner = String(result.get("ucl_winner_id", ""))
	last_eul_winner = String(result.get("eul_winner_id", ""))
	last_conf_winner = String(result.get("conf_winner_id", ""))



	last_lib_winner = String(result.get("lib_winner_id", ""))
	last_sud_winner = String(result.get("sud_winner_id", ""))
	last_cca_winner = String(result.get("cca_winner_id", ""))
	last_ace_winner = String(result.get("ace_winner_id", ""))
	last_ac2_winner = String(result.get("ac2_winner_id", ""))
	last_caf_winner = String(result.get("caf_winner_id", ""))
	last_cf2_winner = String(result.get("cf2_winner_id", ""))
	last_ofc_winner = String(result.get("ofc_winner_id", ""))


	_sella_campeones_continentales(season_num)










	club_wc_qualified = cwc_spot_after_close(club_wc_qualified, season_num,
			won_ucl or won_lib or won_cca or won_ace or won_caf or won_ofc)




	Telemetry.count("temporada_fin")


















	var pull_rows: Array = []
	var pull_gf: Dictionary = {}
	for r in standings:
		var pk: String = String(r.get("key", ""))
		var rid: String = player_team_id if pk == YOU_KEY else pk
		pull_rows.append({"id": rid, "gf": int(r.get("gf", 0))})
		pull_gf[rid] = int(r.get("gf", 0))
	last_table_pull = {
		"country": Teams.country_of(player_team_id), "div": pdiv,
		"season": season_num, "map": Race.pull_map(pull_rows), "gf": pull_gf}

	_sella_verano_convocado()
	_closing_season = true
	season_num += 1
	calendar = []
	league_schedule = []
	league_table = {}
	league_form = {}
	comp_form = {}
	cup_state = {}
	ucl_state = {}
	eul_state = {}
	conf_state = {}
	cwc_state = {}
	liguilla_state = {}
	apertura_tabla = {}
	liguilla_apertura = {}
	lib_state = {}
	sud_state = {}
	cca_state = {}
	ace_state = {}
	ac2_state = {}
	caf_state = {}
	cf2_state = {}
	ofc_state = {}

	season_advanced.emit(result)



	_closing_season = false
	_ensure_season()
















func rearma_temporada_sin_ti() -> void:
	calendar = []
	league_schedule = []
	league_table = {}
	league_form = {}
	comp_form = {}
	cup_state = {}
	ucl_state = {}
	eul_state = {}
	conf_state = {}
	cwc_state = {}
	liguilla_state = {}
	apertura_tabla = {}
	liguilla_apertura = {}
	lib_state = {}
	sud_state = {}
	cca_state = {}
	ace_state = {}
	ac2_state = {}
	caf_state = {}
	cf2_state = {}
	ofc_state = {}
	amer_cupos_snap = {}
	europa_cupos_snap = {}
	_europa_previa_cache = {}
	copas_mundo_snap = {}
	_ensure_season()



const DIV_EXCHANGE: int = 3





















func _apply_pyramid(standings: Array, played_div: int, my_promoted: bool,
		my_relegated: bool, result: Dictionary) -> void:
	var mio: String = Teams.country_of(player_team_id)



	var por_pais: Dictionary = {}
	for t in Teams.all():
		var c: String = String((t as Dictionary).get("country", ""))
		if c.is_empty():
			continue
		if not por_pais.has(c):
			por_pais[c] = []
		(por_pais[c] as Array).append(t)
	var into_first: Array = []
	var out_of_first: Array = []
	for country in por_pais:
		var es_mio: bool = String(country) == mio


		var r: Dictionary = _pyramid_country(String(country), por_pais[country],
			standings if es_mio else [], played_div if es_mio else 0,
			my_promoted and es_mio, my_relegated and es_mio)
		if es_mio:
			into_first = r["up1"]
			out_of_first = r["down1"]


	result["ai_promoted"] = into_first
	result["ai_relegated"] = out_of_first















func _pyramid_country(country: String, teams: Array, standings: Array,
		played_div: int, my_promoted: bool, my_relegated: bool) -> Dictionary:
	var floor_div: int = Teams.max_div(country)

	var ranked: Dictionary = {}
	for d in range(1, floor_div + 1):
		ranked[d] = _orden_de_division(country, teams, d,
			standings if d == played_div else [], d == played_div)
	var up1: Array = []
	var down1: Array = []
	for d in range(1, floor_div):
		var down_n: int = DIV_EXCHANGE -(1 if my_relegated and d == played_div else 0)
		var up_n: int = DIV_EXCHANGE -(1 if my_promoted and d == played_div - 1 else 0)
		var upper: Array = ranked[d]
		var lower: Array = ranked[d + 1]
		var down_ids: Array = upper.slice(maxi(0, upper.size() - down_n))
		var up_ids: Array = lower.slice(0, up_n)
		for id in down_ids:
			club_div[String(id)] = d + 1
			last_div_moves[String(id)] = 1
		for id in up_ids:
			club_div[String(id)] = d
			last_div_moves[String(id)] = -1
		if d == 1:
			up1 = up_ids.duplicate()
			down1 = down_ids.duplicate()
	return {"up1": up1, "down1": down1}
























func _congela_piramide() -> void:
	club_div = {}
	for t in Teams.all():
		var id: String = String((t as Dictionary).get("id", ""))
		if not id.is_empty():
			club_div[id] = int((t as Dictionary).get("div", 2))

















func _suma_clubes_nuevos() -> void:
	if club_div.size() * 2 <= Teams.all().size():
		return
	var conocidos: Dictionary = {}
	for id in club_div:
		conocidos[Teams.country_of(String(id))] = true
	for t in Teams.all():
		var id: String = String((t as Dictionary).get("id", ""))
		var country: String = String((t as Dictionary).get("country", ""))
		if id.is_empty() or club_div.has(id) or not conocidos.has(country):
			continue
		club_div[id] = Teams.max_div(country)































func _repara_piramide() -> void:
	var por_pais: Dictionary = {}
	for t in Teams.all():
		var c: String = String((t as Dictionary).get("country", ""))
		if c.is_empty():
			continue
		if not por_pais.has(c):
			por_pais[c] = []
		(por_pais[c] as Array).append(t)
	for country in por_pais:
		var teams: Array = por_pais[country]
		var floor_div: int = Teams.max_div(String(country))

		var cupo: Dictionary = {}
		for t in teams:
			var bd: int = int((t as Dictionary).get("div", 2))
			cupo[bd] = int(cupo.get(bd, 0)) + 1
		for d in range(1, floor_div):
			var arriba: Array = _ranked_in(teams, d)
			var vivos: int = arriba.size() +(1 if div_of(player_team_id) == d
				and Teams.country_of(player_team_id) == String(country) else 0)
			var sobran: int = vivos - int(cupo.get(d, 0))
			if sobran == 0:
				continue
			if sobran > 0:

				var bajan: Array = arriba.slice(maxi(0, arriba.size() - sobran))
				for id in bajan:
					club_div[String(id)] = d + 1
				_avisa_reparacion(String(country), d, vivos, int(cupo.get(d, 0)), bajan)
			else:

				var suben: Array = _ranked_in(teams, d + 1).slice(0, - sobran)
				for id in suben:
					club_div[String(id)] = d
				_avisa_reparacion(String(country), d, vivos, int(cupo.get(d, 0)), suben)




func _avisa_reparacion(country: String, div: int, vivos: int, cupo: int,
		movidos: Array) -> void:
	push_warning("[piramide] %s %dª tenía %d clubes y su cupo es %d: se recolocan %d (%s)"
		% [country, div, vivos, cupo, movidos.size(), ", ".join(movidos)])

















































func _orden_de_division(country: String, teams: Array, div: int, standings: Array,
		jugada: bool) -> Array:
	var por_rating: Array = _ranked_in(teams, div)
	if not standings.is_empty():
		var real: Array = []
		for k in _ranked_from_standings(standings):
			if div_of(String(k)) == div:
				real.append(k)
		if real.size() == por_rating.size():
			return real




		push_warning("[piramide] la tabla no es de la %dª (%d de %d clubes): se reparte por rating"
			% [div, real.size(), por_rating.size()])
		return por_rating
	if jugada:
		return por_rating

	var tabla: Array = SimLeague.table(country, div, season_num, 1.0,
		_censo_jugado(country, div))
	if tabla.is_empty():
		return por_rating
	var simulada: Array = []
	for row in tabla:
		var id: String = str((row as Dictionary).get("id", ""))

		if id != player_team_id and div_of(id) == div:
			simulada.append(id)
	if simulada.size() == por_rating.size():
		return simulada
	push_warning("[piramide] la tabla simulada de %s %dª no cubre la división (%d de %d): se reparte por rating"
		% [country, div, simulada.size(), por_rating.size()])
	return por_rating




func _ranked_from_standings(standings: Array) -> Array:
	var out: Array = []
	for row in standings:
		var k: String = String(row.get("key", ""))
		if k != YOU_KEY:
			out.append(k)
	return out









func _ranked_in(teams: Array, div: int) -> Array:
	var pool: Array = []
	for t in teams:
		var id: String = String((t as Dictionary)["id"])
		if id != player_team_id and div_of(id) == div:







			var forma: float = float(ClubForm.rating_delta(id)
				+ WorldAging.title_bonus(id, 26))
			pool.append({"id": id,
				"s": float((t as Dictionary)["rating"]) + forma
					+ randf_range(-6.0, 6.0)})
	pool.sort_custom(func(a, b): return float(a["s"]) > float(b["s"]))
	var out: Array = []
	for e in pool:
		out.append(String(e["id"]))
	return out




func _ranked_by_rating(country: String, div: int) -> Array:
	return _ranked_in(Teams.teams_of_country(country), div)








func _sim_world_champions(result: Dictionary, campeones_euro: Dictionary = {}) -> void:
	var country: String = Teams.country_of(player_team_id)
	if bool(result.get("cup_champion", false)):
		result["cup_winner_id"] = player_team_id
	else:


		var cw: String = String(cup_state.get("winner", ""))
		result["cup_winner_id"] = cw if not cw.is_empty() else _weighted_champion(
			Teams.teams_of_country(country), player_team_id)


		if not FormatoCopa.tiene(country, FormatoCopa.COPA):
			result["cup_winner_id"] = ""



	for comp in ["ucl", "eul", "conf"]:
		var tuyo: bool = bool(result.get("%s_champion" % comp, false))
		if not tuyo and not String(campeones_euro.get(comp, "")).is_empty():
			result["%s_winner_id" % comp] = String(campeones_euro[comp])
			continue
		result["%s_winner_id" % comp] = _euro_champion_id(String(comp), tuyo,
			_campo_euro(String(comp)))


	for comp in Continental.AMER_COMPS:
		var k: String = "%s_winner_id" % comp
		if not result.has(k):
			result[k] = _amer_champion_id(String(comp), bool(result.get("won_%s" % comp, false)))










	result["cwc_winner_id"] = _cwc_champion_id(
		bool(result.get("cwc_champion", false)))



func _campo_euro(comp: String) -> Array:
	match comp:
		"ucl":
			return ucl_field(UCL_FIELD)
		"eul":
			return eul_field(EUL_FIELD)
	return conf_field(CONF_FIELD)







func _campeones_euro_proyectados(estados: Dictionary = {}) -> Dictionary:
	var out: Dictionary = {}
	for comp in ["ucl", "eul", "conf"]:
		var st: Dictionary = euro_state(String(comp))
		if bool(st.get("champion", false)) or not String(st.get("winner", "")).is_empty():
			continue
		if not estados.has(comp):
			out[comp] = _euro_champion_id(String(comp), false, _campo_euro(String(comp)))
			continue
		var pw: String = String((estados[comp] as Dictionary).get("winner", ""))
		out[comp] = pw if not pw.is_empty() \
				else _weighted_champion(_campo_euro(String(comp)), player_team_id)
	return out






func _estados_euro_cierre() -> Dictionary:
	var out: Dictionary = {}
	for comp in ["ucl", "eul", "conf"]:
		var st: Dictionary = euro_state(String(comp))
		if bool(st.get("champion", false)) or not String(st.get("winner", "")).is_empty():
			out[comp] = st
		else:
			out[comp] = EURO_SIM.simulate(String(comp), _campo_euro(String(comp)), season_num)
	return out



func coef_uefa_extra() -> Dictionary:
	return {"asoc": coef_asoc_hist, "club": coef_club_hist}












func _cierra_coef_uefa(estados: Dictionary) -> void:
	var anio: int = TransferBook.anio_real(season_num)
	var comps: Dictionary = {}
	var pais_de: Dictionary = {}
	for comp in estados:
		var r: Dictionary = _coef_resumen(estados[comp])
		comps[comp] = r
		var ids: Array =(r["orden"] as Array).duplicate()
		for ronda in r["cuadro"]:
			for c in ronda:
				ids.append(String(c["a"]))
				ids.append(String(c["b"]))
		for id in ids:
			if not String(id).is_empty() and not pais_de.has(id):
				pais_de[id] = Teams.country_of(String(id))



	if int(europa_cupos_snap.get("season", -1)) == season_num and europa_cupos_snap.has("clubes"):
		var cruces: Dictionary = europa_previa().get("cruces", {})
		for k in cruces:
			for x in cruces[k]:
				var comp: String = PreviaUefa.COMP_JUEGO[String(x["comp"])]
				var c: Dictionary = comps.get_or_add(comp, {})
				(c.get_or_add("previa", []) as Array).append(x)
				for lado in ["a", "b"]:
					var id: String = String(x[lado])
					if not id.is_empty() and not pais_de.has(id):
						pais_de[id] = Teams.country_of(id)
	var t: Dictionary = CoefUefa.temporada(comps, pais_de, anio, coef_uefa_extra())
	for id in t["club"]:
		if not coef_club_hist.has(id):
			coef_club_hist[id] = {}
		coef_club_hist[id][anio] = float(t["club"][id])
	for asoc in t["asoc"]:
		if not coef_asoc_hist.has(asoc):
			coef_asoc_hist[asoc] = {}
		coef_asoc_hist[asoc][anio] = float(t["asoc"][asoc])







func _coef_resumen(st: Dictionary) -> Dictionary:
	var orden: Array = []
	var tabla: Dictionary = {}
	var groups: Array = st.get("groups", [])
	if bool(st.get("league_phase", false)) and groups.size() == 1:
		var g: Dictionary = groups[0]
		var keys: Array = EURO_SIM.group_order(g) if bool(st.get("projected", false)) \
				else euro_group_order(g)
		var filas: Dictionary = g.get("table", {})
		for k in keys:
			var id: String = _euro_sim_id(String(k))
			orden.append(id)
			tabla[id] = filas.get(k, {})
	var cuadro: Array = []
	for ronda in st.get("bracket", []):
		var cruces: Array = []
		for c in ronda:
			var t: Dictionary =(c as Dictionary).duplicate()
			for k in ["a", "b", "winner"]:
				var v: String = String(t.get(k, ""))
				t[k] = "" if v.is_empty() else _euro_sim_id(v)
			cruces.append(t)
		cuadro.append(cruces)
	return {"orden": orden, "tabla": tabla, "cuadro": cuadro}




static func _parse_coef_hist(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not raw is Dictionary:
		return out
	for k in raw:
		var por_anio: Variant = raw[k]
		if not por_anio is Dictionary:
			continue
		var d: Dictionary = {}
		for a in por_anio:
			var v: Variant = por_anio[a]
			if str(a).is_valid_int() and typeof(v) in [TYPE_FLOAT, TYPE_INT]:
				d[int(str(a))] = float(v)
		if not d.is_empty():
			out[String(k)] = d
	return out







func _cwc_champion_id(you_won: bool) -> String:
	if you_won:
		return player_team_id
	var w: String = String(cwc_state.get("winner", ""))
	if not w.is_empty():
		return w


	var field: Array = cwc_field_sin_ti(season_num - 1)
	if field.size() < CWC_GROUP_SIZE:
		return ""



	var proj: Dictionary = EURO_SIM.simulate("cwc", field, season_num)
	return String(proj.get("winner", ""))










func _euro_champion_id(comp: String, you_won: bool, field: Array) -> String:
	if you_won:
		return player_team_id
	var w: String = String(euro_state(comp).get("winner", ""))
	if not w.is_empty():
		return w
	var proj: Dictionary = EURO_SIM.simulate(comp, field, season_num)
	var pw: String = String(proj.get("winner", ""))


	return pw if not pw.is_empty() else _weighted_champion(field, player_team_id)






func _weighted_champion(pool: Array, exclude_id: String,
		rng: RandomNumberGenerator = null) -> String:
	var total: float = 0.0
	var weights: Array = []
	for t in pool:
		var id: String = String(t["id"])
		if id == exclude_id:
			continue
		var w: float = pow(maxf(float(t["rating"]) - 55.0, 1.0), 3.0)
		weights.append({"id": id, "w": w})
		total += w
	if weights.is_empty():
		return ""
	var roll: float =(rng.randf() if rng != null else randf()) * total
	for e in weights:
		roll -= float(e["w"])
		if roll <= 0.0:
			return String(e["id"])
	return String(weights[weights.size() - 1]["id"])




const CWC_CONFEDS: Array[String] = ["UEFA", "CONMEBOL", "CONCACAF", "AFC", "CAF", "OFC"]


















func cwc_confed_champion(confed: String, season: int) -> String:
	if confed == "UEFA" and not last_ucl_winner.is_empty():
		return last_ucl_winner


	if confed == "CONMEBOL" and not last_lib_winner.is_empty():
		return last_lib_winner
	if confed == "CONCACAF" and not last_cca_winner.is_empty():
		return last_cca_winner

	if confed == "AFC" and not last_ace_winner.is_empty():
		return last_ace_winner

	if confed == "CAF" and not last_caf_winner.is_empty():
		return last_caf_winner



	if confed == "OFC" and not last_ofc_winner.is_empty():
		return last_ofc_winner
	return _cwc_sorteo_campeon(confed, season)







func _cwc_sorteo_campeon(confed: String, season: int) -> String:



	if season == 0:
		var real: String = String(CWC_CAMPEONES_TEMPORADA_0.get(confed, ""))
		if not real.is_empty() and not Teams.by_id(real).is_empty() and div_of(real) == 1:
			return real
	var pool: Array = []
	for t in Teams.all():
		var country: String = String((t as Dictionary).get("country", ""))
		if Teams.confed_of_country(country) != confed:
			continue


		if div_of(String((t as Dictionary).get("id", ""))) != 1:
			continue
		pool.append(t)
	if pool.is_empty():
		return ""
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("cwc|%s|%d" % [confed, season])
	return _weighted_champion(pool, "", rng)








func cwc_field(season: int, exclude_confed: String = "",
		exclude_id: String = "", reserva_tu_plaza: bool = true) -> Array:




	var tu_plaza: int = 1 if not exclude_id.is_empty() and reserva_tu_plaza else 0
	var out: Array = []
	var vistos: Dictionary = {}

	var por_pais: Dictionary = {}



	var tu_confed: String = ""
	if not exclude_id.is_empty():
		vistos[exclude_id] = true
		if tu_plaza == 1:
			tu_confed = Teams.confed_of_country(Teams.country_of(exclude_id))
			_cwc_cuenta_pais(por_pais, exclude_id)
	for cf in CWC_CONFEDS:
		var c: String = String(cf)
		if c == exclude_confed:
			continue
		var cupo: int = int(CWC_CONFED_SLOTS.get(c, 1))
		if c == tu_confed:
			cupo -= 1





		for k in CWC_EVERY:
			if cupo <= 0:
				break
			var champ: String = cwc_campeon_de_temporada(c, season - k) if k > 0 \
					else cwc_campeon_de_temporada(c, season, true)
			if champ.is_empty() or vistos.has(champ):
				continue
			vistos[champ] = true
			out.append(champ)
			_cwc_cuenta_pais(por_pais, champ)
			cupo -= 1
		if cupo <= 0:
			continue





		var pool: Array = _cwc_candidatos(vistos, c, "", exclude_confed)
		cupo = _cwc_mete(pool, cupo, out, vistos, por_pais, true)









	var faltan: int = CWC_FIELD - out.size() - tu_plaza
	var sede: String = cwc_pais_sede(season)
	var sede_confed: String = Teams.confed_of_country(sede) if not sede.is_empty() else ""
	if not exclude_confed.is_empty() and sede_confed == exclude_confed:
		sede = ""
		sede_confed = ""
	if faltan > 0 and not sede.is_empty():
		_cwc_mete(_cwc_candidatos(vistos, "", sede, exclude_confed), 1, out, vistos,
			por_pais, false)
		faltan = CWC_FIELD - out.size() - tu_plaza
	if faltan > 0 and not sede_confed.is_empty():
		_cwc_mete(_cwc_candidatos(vistos, sede_confed, "", exclude_confed), faltan, out,
			vistos, por_pais, true)
		faltan = CWC_FIELD - out.size() - tu_plaza
	for con_tope in [true, false]:
		if faltan <= 0:
			break
		_cwc_mete(_cwc_candidatos(vistos, "", "", exclude_confed), faltan, out, vistos,
			por_pais, con_tope)
		faltan = CWC_FIELD - out.size() - tu_plaza
	out.sort_custom(func(a, b): return Teams.rating(String(a)) > Teams.rating(String(b)))
	return out






func cwc_pais_sede(season: int) -> String:
	if CWC_HOST_COUNTRIES.is_empty():
		return ""
	var edicion: int = floori(float(season) / float(CWC_EVERY))
	return CWC_HOST_COUNTRIES[posmod(edicion, CWC_HOST_COUNTRIES.size())]








func cwc_campeon_de_temporada(confed: String, season: int, vigente: bool = false) -> String:
	var fila: Variant = continental_winners.get(str(season), {})
	if fila is Dictionary and not String((fila as Dictionary).get(confed, "")).is_empty():
		return String((fila as Dictionary)[confed])
	if vigente:
		return cwc_confed_champion(confed, season)
	if season < 1:
		return _cwc_sorteo_campeon(confed, season)
	return ""




func _cwc_candidatos(vistos: Dictionary, confed: String, pais: String,
		exclude_confed: String) -> Array:
	var pool: Array = []
	for t in Teams.all():
		var id: String = String((t as Dictionary)["id"])
		if vistos.has(id) or div_of(id) != 1:
			continue
		var country: String = String((t as Dictionary).get("country", ""))
		if not pais.is_empty() and country != pais:
			continue
		var c: String = Teams.confed_of_country(country)
		if not exclude_confed.is_empty() and c == exclude_confed:
			continue
		if not confed.is_empty() and c != confed:
			continue
		pool.append(id)
	pool.sort_custom(func(a, b): return Teams.rating(String(a)) > Teams.rating(String(b)))
	return pool




func _cwc_mete(pool: Array, cuantos: int, out: Array, vistos: Dictionary,
		por_pais: Dictionary, con_tope: bool) -> int:
	for id in pool:
		if cuantos <= 0:
			break
		var pais: String = Teams.country_of(String(id))
		if con_tope and int(por_pais.get(pais, 0)) >= CWC_MAX_POR_PAIS:
			continue
		vistos[String(id)] = true
		out.append(String(id))
		_cwc_cuenta_pais(por_pais, String(id))
		cuantos -= 1
	return cuantos


func _cwc_cuenta_pais(por_pais: Dictionary, id: String) -> void:
	var pais: String = Teams.country_of(id)
	por_pais[pais] = int(por_pais.get(pais, 0)) + 1





func _sella_campeones_continentales(season: int) -> void:
	var fila: Dictionary = {}
	for par in [["UEFA", last_ucl_winner], ["CONMEBOL", last_lib_winner],
			["CONCACAF", last_cca_winner], ["AFC", last_ace_winner],
			["CAF", last_caf_winner], ["OFC", last_ofc_winner]]:
		if not String(par[1]).is_empty():
			fila[String(par[0])] = String(par[1])
	if not fila.is_empty():
		continental_winners[str(season)] = fila
	for k in continental_winners.keys():
		if str(k).to_int() <= season - CWC_EVERY:
			continental_winners.erase(k)




static func _norm_campeones_continentales(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	for k in (raw as Dictionary):
		var v: Variant =(raw as Dictionary)[k]
		if not (v is Dictionary):
			continue
		var fila: Dictionary = {}
		for cf in (v as Dictionary):
			fila[String(cf)] = String((v as Dictionary)[cf])
		out[str(str(k).to_int())] = fila
	return out











func cwc_field_sin_ti(season: int) -> Array:
	return cwc_field(season, "", player_team_id, false)



func _league_position() -> int:
	var rows: Array = league_standings()
	for i in rows.size():
		if String(rows[i]["key"]) == YOU_KEY:
			return i + 1
	return rows.size()



static func _strip_kit(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = cfg.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		out.erase(k)
	return out


func set_customization(team: Dictionary, rival: Dictionary) -> void:
	team_custom = _strip_kit(team)
	rival_custom = _strip_kit(rival)
	_save()
	career_updated.emit()


func _cfg_to_html(cfg: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in cfg:


		var v: Variant = cfg[k]
		if v is String or v is bool:
			out[k] = v
		else:
			out[k] =(v as Color).to_html(false)
	return out













static func _cfg_from_html(data: Variant) -> Dictionary:
	var out: Dictionary = {}
	if data is Dictionary:
		for k in data:
			if String(k) in KitRecolor.STYLE_KEYS:
				var name: String = String(data[k])
				if not _looks_like_html_color(name):
					out[k] = name
			elif data[k] is bool:
				out[k] = data[k]
			else:
				out[k] = Color(String(data[k]))
	return out






static func _looks_like_html_color(v: String) -> bool:
	return (v.length() == 6 or v.length() == 8) and v.is_valid_hex_number(false)









static func look_de(raw: Variant) -> Dictionary:
	return _strip_kit(_cfg_from_html(raw))


func _ready() -> void:


















	for arg in OS.get_cmdline_args():
		if arg.ends_with(".tscn") and arg.contains("tools/"):
			readonly_save = true
			break
	Engine.max_fps = 60















	if OS.get_name() == "Android":










		if DisplayServer.screen_get_size().x < 1000:
			var fuente := load("res://assets/fonts/PressStart2P-Regular.ttf") as FontFile
			if fuente != null:
				fuente.antialiasing = TextServer.FONT_ANTIALIASING_GRAY







	SquadEdits.warm()
	_load()


func average_rating() -> float:
	if matches_played == 0:
		return 0.0
	return rating_total / float(matches_played)




func average_rating_text() -> String:
	return "—" if matches_played == 0 else "%.1f" % average_rating()



func best_rating_text() -> String:
	return "—" if matches_played == 0 else "%.1f" % best_rating





func league_started() -> bool:
	_ensure_season()
	for key in league_table:
		if int(league_table[key].get("pj", 0)) > 0:
			return true
	return false














func _tally_rival(opp_id: String, goals: int, assists: int, played: bool,
		is_nat: bool) -> void:
	if opp_id.is_empty():
		return



	if goals == 0 and assists == 0 and not played:
		return

	var book: Dictionary = vs_nations if is_nat else vs_clubs
	var row: Dictionary = book.get(opp_id, {"g": 0, "a": 0, "pj": 0})
	row["g"] = int(row.get("g", 0)) + goals
	row["a"] = int(row.get("a", 0)) + assists
	if played:
		row["pj"] = int(row.get("pj", 0)) + 1
	book[opp_id] = row





func _load_rival_book(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	for k in (raw as Dictionary):
		var row: Variant =(raw as Dictionary)[k]
		if not (row is Dictionary):
			continue
		out[String(k)] = {
			"g": int((row as Dictionary).get("g", 0)),
			"a": int((row as Dictionary).get("a", 0)),
			"pj": int((row as Dictionary).get("pj", 0)),
		}
	return out


func record_match(goals: int, assists: int, shots: int, rating: float, result: int,
		team_goals: int = -1, rival_goals: int = -1, is_nat: bool = false,
		detail: Dictionary = {}) -> void:







	var beaten_id: String = ""
	if not is_nat and result > 0:
		var vf: Dictionary = current_fixture()
		if String(vf.get("comp", "")) != "nat":
			beaten_id = String(vf.get("opp", ""))




	_tally_rival(String(current_fixture().get("opp", "")), goals, assists,
		rating >= 0.0, is_nat)




	var rasgos_hoy: Array[String] = Career.rasgos_en_juego(is_nat)



	var fx_hoy: Dictionary = current_fixture()
	var final_hoy: bool = rating >= 0.0 and fixture_is_knockout(fx_hoy) \
			and Competitions.stage_of(fx_hoy) == "FINAL"
	_telemetria_partido(goals, assists, rating, is_nat, detail)



	Career.anota_goles_bellos(detail.get("goal_shots", []), current_fixture())
	if not is_nat:





		if career_goals == 0 and goals > 0:
			Telemetry.count("primer_gol")
		career_goals += goals
		career_assists += assists
		career_shots += shots

		Telemetry.mark("goles_carrera_max", career_goals)
		Telemetry.mark("asistencias_carrera_max", career_assists)



		if player_div() == 1:
			legend_goals += goals
			legend_assists += assists




		if rating >= 0.0:
			matches_played += 1
			rating_total += rating
			best_rating = maxf(best_rating, rating)

			club_matches[player_team_id] = int(club_matches.get(player_team_id, 0)) + 1
		if result > 0:
			wins += 1
		elif result == 0:
			draws += 1
		else:
			losses += 1

	if team_goals >= 0 and rival_goals >= 0:
		_advance_calendar(team_goals, rival_goals)
	_save()
	career_updated.emit()


	Achievements.ingest_match(goals, final_hoy)
	Achievements.ingest_match_detail(detail)





	if rating >= 0.0:
		Achievements.ingest_rasgos(rasgos_hoy)


	Achievements.ingest_beaten(beaten_id)
	Achievements.check()




const GOL_ESCENARIO: Dictionary = {
	"solo": "gol_esc_solo", "frontal": "gol_esc_frontal", "lejano": "gol_esc_lejano",
	"angulo": "gol_esc_angulo", "contra": "gol_esc_contra", "centro": "gol_esc_centro",
	"rebote": "gol_esc_rebote", "volea": "gol_esc_volea", "banda": "gol_esc_banda",
	"indirecta": "gol_esc_indirecta", "regate": "gol_esc_regate",
	"salida": "gol_esc_salida", "salida_meta": "gol_esc_salida_meta",
	"contragolpe": "gol_esc_contragolpe",
}



const GOL_NO_ESCENARIO: Array[String] = ["penal", "libre", "corner", "olimpico",
	"panenka", "gesto_cabeza", "gesto_volea", "gesto_chilena"]








const ASIST_ESCENARIO: Dictionary = {
	"solo": "asist_esc_solo", "frontal": "asist_esc_frontal", "lejano": "asist_esc_lejano",
	"angulo": "asist_esc_angulo", "contra": "asist_esc_contra", "centro": "asist_esc_centro",
	"banda": "asist_esc_banda", "indirecta": "asist_esc_indirecta",
	"regate": "asist_esc_regate", "salida": "asist_esc_salida",
	"salida_meta": "asist_esc_salida_meta", "corner": "asist_esc_corner",
	"libre": "asist_esc_libre", "contragolpe": "asist_esc_contragolpe",
}




func _gol_tramo(d: float) -> String:
	if d < 6.0:
		return "gol_m6"
	if d < 16.0:
		return "gol_m16"
	if d < 25.0:
		return "gol_m25"
	if d < 30.0:
		return "gol_m30"
	return "gol_m30_mas"




func _falta_tramo(d: float) -> String:
	if d < 20.0:
		return "gol_falta_m20"
	if d < 25.0:
		return "gol_falta_m25"
	if d < 30.0:
		return "gol_falta_m30"
	return "gol_falta_m30_mas"








func _telemetria_partido(goals: int, assists: int, rating: float, is_nat: bool,
		detail: Dictionary) -> void:
	if goals > 0:
		Telemetry.count("gol", goals)
		if is_nat:
			Telemetry.count("gol_seleccion", goals)
		if goals >= 3:
			Telemetry.count("hat_trick")
		if goals >= 4:
			Telemetry.count("poker")
		Telemetry.mark("goles_partido_max", goals)
	Telemetry.count("asistencia", assists)
	if rating >= 0.0:
		if is_nat:
			Telemetry.count("partido_seleccion")
		else:
			Telemetry.count("partido_club")


	Telemetry.count("gol_penal", int(detail.get("penal_goals", 0)))
	Telemetry.count("gol_panenka", int(detail.get("panenka_goals", 0)))
	Telemetry.count("gol_falta", int(detail.get("freekick_goals", 0)))
	Telemetry.count("gol_corner", int(detail.get("corner_goals", 0)))
	Telemetry.count("gol_olimpico", int(detail.get("olympic_goals", 0)))
	Telemetry.count("gol_cabeza", int(detail.get("header_goals", 0)))
	Telemetry.count("gol_volea", int(detail.get("volley_goals", 0)))
	Telemetry.count("gol_chilena", int(detail.get("bicycle_goals", 0)))





	var por_esc: Dictionary = detail.get("goals_by_kind", {})
	for kind in por_esc:
		var n: int = int(por_esc[kind])
		if kind in GOL_NO_ESCENARIO:
			continue
		Telemetry.count(String(GOL_ESCENARIO.get(kind, "gol_esc_otro")), n)



	for tiro in detail.get("goal_shots", []):
		var d: float = float(tiro.get("dist_m", 0.0))
		var gesto: String = String(tiro.get("gesto", ""))
		Telemetry.count(_gol_tramo(d))
		Telemetry.mark("gol_distancia_max", roundi(d))
		match String(tiro.get("kind", "")):
			"libre":
				Telemetry.count(_falta_tramo(d))
				Telemetry.mark("gol_falta_distancia_max", roundi(d))
			"corner":
				if gesto == "cabeza":
					Telemetry.count("gol_corner_cabeza")
				elif gesto == "volea":
					Telemetry.count("gol_corner_volea")
				elif gesto == "chilena":
					Telemetry.count("gol_corner_chilena")


	for fila in detail.get("assist_rows", []):
		Telemetry.count(String(ASIST_ESCENARIO.get(String(fila.get("kind", "")),
			"asist_esc_otro")))
		var pase_m: float = float(fila.get("pase_m", -1.0))
		if pase_m >= 0.0:
			Telemetry.mark("asistencia_distancia_max", roundi(pase_m))

	Telemetry.count("autogol", int(detail.get("own_goals", 0)))
	Telemetry.count("penal_fallado", int(detail.get("penal_misses", 0)))
	Telemetry.count("tanda_penal_fallado", int(detail.get("shootout_misses", 0)))


	Telemetry.count("desvio", int(detail.get("desvios", 0)))
	Telemetry.count("desvio_corner", int(detail.get("desvio_corners", 0)))
	Telemetry.count("desvio_og", int(detail.get("desvio_ogs", 0)))
	if bool(detail.get("derby_win", false)):
		Telemetry.count("derbi_ganado")
	if bool(detail.get("comeback_win", false)):
		Telemetry.count("remontada")









func save_now() -> void:
	_save()


func _save() -> void:



	if readonly_save or load_failed:
		return
	var data: Dictionary = {
		"matches_played": matches_played,
		"wins": wins,
		"draws": draws,
		"losses": losses,
		"career_goals": career_goals,
		"career_assists": career_assists,
		"legend_goals": legend_goals,
		"legend_assists": legend_assists,
		"career_shots": career_shots,
		"club_matches": club_matches,
		"vs_clubs": vs_clubs,
		"vs_nations": vs_nations,
		"rating_total": rating_total,
		"best_rating": best_rating,
		"team_custom": _cfg_to_html(team_custom),
		"wardrobe_outfits": wardrobe_outfits,
		"rival_custom": _cfg_to_html(rival_custom),
		"player_team_id": player_team_id,
		"player_number": player_number,
		"ball_style": ball_style,
		"season_num": season_num,
		"season_day": season_day,
		"season_close_pending": season_close_pending,


		"next_weather": next_weather,
		"next_rain": next_rain,
		"next_wind_seed": next_wind_seed,
		"cal_schema": 2,
		"calendar": calendar,
		"league_schedule": league_schedule,
		"league_table": league_table,
		"league_form": league_form,
		"comp_form": comp_form,
		"cup_state": cup_state,
		"ucl_state": ucl_state,
		"eul_state": eul_state,
		"conf_state": conf_state,
		"cwc_state": cwc_state,
		"lib_state": lib_state,
		"sud_state": sud_state,
		"cca_state": cca_state,
		"ace_state": ace_state,
		"ac2_state": ac2_state,
		"caf_state": caf_state,
		"cf2_state": cf2_state,
		"ofc_state": ofc_state,
		"liguilla_state": liguilla_state,
		"apertura_tabla": apertura_tabla,
		"liguilla_apertura": liguilla_apertura,
		"apertura_mundo": apertura_mundo,
		"campeones_state": campeones_state,
		"recopa_state": recopa_state,
		"intercont_state": intercont_state,
		"supereuropa_state": supereuropa_state,
		"superafrica_state": superafrica_state,
		"supercopa_state": supercopa_state,
		"copaliga_state": copaliga_state,
		"ligas_state": ligas_state,
		"finalissima_state": finalissima_state,
		"naciones_state": naciones_state,
		"olimpicos_state": olimpicos_state,
		"nat_state": nat_state,

		"nat_coef": nat_coef,
		"campeon_mundial": campeon_mundial,
		"nat_qual_grupo": nat_qual_grupo,
		"nat_qual_grupo_cont": nat_qual_grupo_cont,
		"last_match": last_match,
		"qualified_ucl": qualified_ucl,
		"qualified_eul": qualified_eul,
		"qualified_conf": qualified_conf,
		"club_wc_qualified": club_wc_qualified,
		"club_div": club_div,
		"last_div_moves": last_div_moves,
		"stadium_div": stadium_div,
		"last_league_champion": last_league_champion,
		"last_ucl_winner": last_ucl_winner,
		"last_eul_winner": last_eul_winner,
		"last_conf_winner": last_conf_winner,
		"last_lib_winner": last_lib_winner,
		"last_sud_winner": last_sud_winner,
		"last_cca_winner": last_cca_winner,
		"last_ace_winner": last_ace_winner,
		"last_ac2_winner": last_ac2_winner,
		"last_caf_winner": last_caf_winner,
		"last_cf2_winner": last_cf2_winner,
		"last_ofc_winner": last_ofc_winner,
		"continental_winners": continental_winners,
		"amer_cupos_snap": amer_cupos_snap,
		"europa_cupos_snap": europa_cupos_snap,
		"copas_mundo_snap": copas_mundo_snap,
		"coef_asoc_hist": coef_asoc_hist,
		"coef_club_hist": coef_club_hist,
		"last_league_order": last_league_order,

		"last_orden_1a": last_orden_1a,

		"previas_desde": previas_desde,

		"verano_convocado": verano_convocado,

		"fuerza_cero": SimLeague.fuerza_cero_guarda(),
	}


	if SaveSlots.write_text_atomic(active_save_path(), JSON.stringify(data)):

		SaveSlots.summary_dirty()


func _load() -> void:
	var path: String = active_save_path()

	var data: Dictionary = SaveSlots.read_json_dict(path)
	if data.is_empty():



		if FileAccess.file_exists(SaveSlots.slot_path("career_meta.cfg")):
			push_error("save: career.json ilegible con career_meta.cfg presente — guardado bloqueado")
			load_failed = true
		return
	matches_played = int(data.get("matches_played", 0))
	wins = int(data.get("wins", 0))
	draws = int(data.get("draws", 0))
	losses = int(data.get("losses", 0))
	career_goals = int(data.get("career_goals", 0))
	career_assists = int(data.get("career_assists", 0))


	legend_goals = int(data.get("legend_goals", 0))
	legend_assists = int(data.get("legend_assists", 0))
	career_shots = int(data.get("career_shots", 0))

	club_matches = {}
	var raw_cm: Variant = data.get("club_matches", {})
	if raw_cm is Dictionary:
		for k in raw_cm:
			club_matches[String(k)] = int(raw_cm[k])




	vs_clubs = _load_rival_book(data.get("vs_clubs", {}))
	vs_nations = _load_rival_book(data.get("vs_nations", {}))
	rating_total = float(data.get("rating_total", 0.0))
	best_rating = float(data.get("best_rating", 0.0))


	team_custom = _strip_kit(_cfg_from_html(data.get("team_custom", {})))

	if team_custom.has("modular_hair"):
		team_custom["modular_hair"] = LookMigracion.pelo(str(team_custom["modular_hair"]))
	if team_custom.has("modular_beard"):
		team_custom["modular_beard"] = LookMigracion.barba(str(team_custom["modular_beard"]))
	wardrobe_outfits = KitRecolor.WARDROBE.sanitize(data.get("wardrobe_outfits", []))
	rival_custom = _strip_kit(_cfg_from_html(data.get("rival_custom", {})))
	player_team_id = String(data.get("player_team_id", ""))
	_club_sorteado = ""
	_ensure_player_team()




	set_player_number(int(data.get("player_number", 0)))
	ball_style = String(data.get("ball_style", "classic"))
	season_num = int(data.get("season_num", 1))
	season_day = int(data.get("season_day", 0))
	season_close_pending = bool(data.get("season_close_pending", false))




	next_weather = String(data.get("next_weather", ""))
	next_rain = int(data.get("next_rain", -1))
	next_wind_seed = int(data.get("next_wind_seed", 0))

	last_league_champion = String(data.get("last_league_champion", ""))
	last_ucl_winner = String(data.get("last_ucl_winner", ""))
	last_eul_winner = String(data.get("last_eul_winner", ""))
	last_conf_winner = String(data.get("last_conf_winner", ""))



	last_lib_winner = String(data.get("last_lib_winner", ""))
	last_sud_winner = String(data.get("last_sud_winner", ""))
	last_cca_winner = String(data.get("last_cca_winner", ""))
	last_ace_winner = String(data.get("last_ace_winner", ""))
	last_ac2_winner = String(data.get("last_ac2_winner", ""))
	last_caf_winner = String(data.get("last_caf_winner", ""))
	last_cf2_winner = String(data.get("last_cf2_winner", ""))
	last_ofc_winner = String(data.get("last_ofc_winner", ""))
	continental_winners = _norm_campeones_continentales(data.get("continental_winners", {}))



	if continental_winners.is_empty() and season_num > 1:
		_sella_campeones_continentales(season_num - 1)
	var raw_snap: Variant = data.get("amer_cupos_snap", {})
	amer_cupos_snap =(raw_snap as Dictionary).duplicate(true) if raw_snap is Dictionary else {}



	if amer_cupos_snap.has("season"):
		amer_cupos_snap["season"] = int(amer_cupos_snap["season"])



	if amer_cupos_snap.get("CAF") is Dictionary:
		for cc in ["caf", "cf2"]:
			var rama: Variant =(amer_cupos_snap["CAF"] as Dictionary).get(cc, {})
			if rama is Dictionary and ((rama as Dictionary).get("cuadro", []) as Array).size() > 8:
				amer_cupos_snap.erase("CAF")
				break
	europa_cupos_snap = _parse_europa_snap(data.get("europa_cupos_snap", {}))
	_europa_previa_cache = {}
	SimLeague.fuerza_cero_carga(data.get("fuerza_cero", {}))
	var raw_copas: Variant = data.get("copas_mundo_snap", {})
	copas_mundo_snap =(raw_copas as Dictionary).duplicate(true) if raw_copas is Dictionary else {}
	if copas_mundo_snap.has("season"):
		copas_mundo_snap["season"] = int(copas_mundo_snap["season"])
	coef_asoc_hist = _parse_coef_hist(data.get("coef_asoc_hist", {}))
	coef_club_hist = _parse_coef_hist(data.get("coef_club_hist", {}))
	last_league_order = []
	var raw_order: Variant = data.get("last_league_order", [])
	if raw_order is Array:
		for id in raw_order:
			last_league_order.append(String(id))



	last_orden_1a = _parse_orden_1a(data.get("last_orden_1a", {}))

	previas_desde = int(data.get("previas_desde", 0))

	var vc: Variant = data.get("verano_convocado", {})
	verano_convocado = vc if vc is Dictionary else {}
	club_div = {}
	var raw_div: Variant = data.get("club_div", {})
	if raw_div is Dictionary:
		for k in raw_div:
			club_div[String(k)] = int(raw_div[k])
	_suma_clubes_nuevos()


	last_div_moves = {}
	var raw_moves: Variant = data.get("last_div_moves", {})
	if raw_moves is Dictionary:
		for k in raw_moves:
			last_div_moves[String(k)] = int(raw_moves[k])



	stadium_div = {}
	var raw_st: Variant = data.get("stadium_div", {})
	if raw_st is Dictionary:
		for k in raw_st:
			stadium_div[String(k)] = int(raw_st[k])
	qualified_ucl = bool(data.get("qualified_ucl", false))
	qualified_eul = bool(data.get("qualified_eul", false))
	qualified_conf = bool(data.get("qualified_conf", false))
	club_wc_qualified = bool(data.get("club_wc_qualified", false))



	calendar = []
	league_schedule = []
	league_table = {}

	last_table_pull = {}
	league_form = {}
	comp_form = {}
	cup_state = {}
	ucl_state = {}
	eul_state = {}
	conf_state = {}
	cwc_state = {}
	liguilla_state = {}
	apertura_tabla = {}
	liguilla_apertura = {}


	apertura_mundo = {}
	var am: Dictionary = data.get("apertura_mundo", {}) if data.get("apertura_mundo", {}) is Dictionary else {}
	for k in am:
		var ap: Dictionary = _norm_apertura_congelado(am[k])
		if not ap.is_empty():
			apertura_mundo[String(k)] = ap

	campeones_state = data.get("campeones_state", {}) \
			if data.get("campeones_state", {}) is Dictionary else {}

	recopa_state = data.get("recopa_state", {}) \
			if data.get("recopa_state", {}) is Dictionary else {}
	intercont_state = data.get("intercont_state", {}) \
			if data.get("intercont_state", {}) is Dictionary else {}
	supereuropa_state = data.get("supereuropa_state", {}) \
			if data.get("supereuropa_state", {}) is Dictionary else {}
	superafrica_state = data.get("superafrica_state", {}) \
			if data.get("superafrica_state", {}) is Dictionary else {}
	supercopa_state = data.get("supercopa_state", {}) \
			if data.get("supercopa_state", {}) is Dictionary else {}
	copaliga_state = data.get("copaliga_state", {}) \
			if data.get("copaliga_state", {}) is Dictionary else {}
	ligas_state = data.get("ligas_state", {}) \
			if data.get("ligas_state", {}) is Dictionary else {}
	finalissima_state = data.get("finalissima_state", {}) \
			if data.get("finalissima_state", {}) is Dictionary else {}
	naciones_state = data.get("naciones_state", {}) \
			if data.get("naciones_state", {}) is Dictionary else {}
	olimpicos_state = data.get("olimpicos_state", {}) \
			if data.get("olimpicos_state", {}) is Dictionary else {}
	lib_state = {}
	sud_state = {}
	cca_state = {}
	ace_state = {}
	ac2_state = {}
	caf_state = {}
	cf2_state = {}
	ofc_state = {}
	nat_state = {}


	last_match = _norm_last_match(data.get("last_match", {}))
	if int(data.get("cal_schema", 0)) >= 2:
		calendar = _norm_calendar(data.get("calendar", []))
		league_schedule = _norm_schedule(data.get("league_schedule", []))
		league_table = _norm_table(data.get("league_table", {}))




		league_form = _norm_form(data.get("league_form", {}))
		comp_form = _norm_comp_form(data.get("comp_form", {}))
		cup_state = _norm_cup(data.get("cup_state", {}))
		ucl_state = _norm_euro(data.get("ucl_state", {}))
		eul_state = _norm_euro(data.get("eul_state", {}))
		conf_state = _norm_euro(data.get("conf_state", {}))



		cwc_state = _norm_euro(data.get("cwc_state", {}))


		lib_state = _norm_euro(data.get("lib_state", {}))
		sud_state = _norm_euro(data.get("sud_state", {}))
		cca_state = _norm_euro(data.get("cca_state", {}))
		ace_state = _norm_euro(data.get("ace_state", {}))
		ac2_state = _norm_euro(data.get("ac2_state", {}))
		caf_state = _norm_euro(data.get("caf_state", {}))
		cf2_state = _norm_euro(data.get("cf2_state", {}))
		ofc_state = _norm_euro(data.get("ofc_state", {}))
		liguilla_state = _norm_liguilla(data.get("liguilla_state", {}))


		apertura_tabla = _norm_table(data.get("apertura_tabla", {}))
		liguilla_apertura = _norm_liguilla(data.get("liguilla_apertura", {}))
		nat_state = _norm_nat(data.get("nat_state", {}))


		var raw_coef: Variant = data.get("nat_coef", {})
		nat_coef = {}
		if raw_coef is Dictionary:
			for k in raw_coef:
				nat_coef[String(k)] = float(raw_coef[k])


		campeon_mundial = String(data.get("campeon_mundial", ""))

		var raw_grupo: Variant = data.get("nat_qual_grupo", {})
		nat_qual_grupo = raw_grupo if raw_grupo is Dictionary else {}
		var raw_grupo_cont: Variant = data.get("nat_qual_grupo_cont", {})
		nat_qual_grupo_cont = raw_grupo_cont if raw_grupo_cont is Dictionary else {}











	var euro_viejo: bool = false
	for st in [ucl_state, eul_state, conf_state]:
		if not (st as Dictionary).is_empty() \
				and not bool((st as Dictionary).get("league_phase", false)):
			euro_viejo = true
	var euro_orphan: bool = calendar.any(func(e):
		return EURO_COMPS.has(String(e.get("comp", "")))) \
				and (euro_viejo or (ucl_state.is_empty() and eul_state.is_empty()
			and conf_state.is_empty()))


	var nat_orphan: bool = calendar.any(func(e):
		return String(e.get("comp", "")) == "nat" and e.has("nat_ko")) \
				and nat_state.is_empty()












	var cwc_orphan: bool = calendar.any(func(e):
		return String(e.get("comp", "")) == "cwc") \
				and (cwc_state.is_empty() or (cwc_state.get("groups", []) as Array).is_empty())









	var amer_orphan: bool = _amer_orphan()


	if euro_orphan or nat_orphan or cwc_orphan or amer_orphan or calendar.is_empty() \
			or league_table.is_empty() \
			or season_day > calendar.size() or league_schedule.is_empty():
		calendar = []
		league_schedule = []
		league_table = {}
		league_form = {}
		comp_form = {}
		cup_state = {}
		ucl_state = {}
		eul_state = {}
		conf_state = {}


		cwc_state = {}
		liguilla_state = {}
		apertura_tabla = {}
		liguilla_apertura = {}
		lib_state = {}
		sud_state = {}
		cca_state = {}
		ace_state = {}
		ac2_state = {}
		caf_state = {}
		cf2_state = {}
		ofc_state = {}
		nat_state = {}
	_migrate_nat_tail()
	_migrate_euro_legs()
	_sanea_liguilla()
	_migra_sin_playin()
	_migrate_liguilla()
	_migra_supercopa_misma()



	if not calendar.is_empty() and int(amer_cupos_snap.get("season", -1)) != season_num:
		_amer_congela_cupos()

















func _migra_supercopa_misma() -> void:
	var pais: String = Teams.country_of(player_team_id)
	if calendar.is_empty() or player_div() != 1 or not SupercopaNacional.aplica(pais) \
			or not SupercopaNacional.misma(pais) \
			or int(supercopa_state.get("season", -1)) != season_num \
			or supercopa_state.has("winner") or bool(supercopa_state.get("misma", false)):
		return
	supercopa_state = {}


	var kept: Array = []
	var queda_liga: bool = false
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == SupercopaNacional.COMP:
			continue
		queda_liga = queda_liga or String(e.get("comp", "")) == "league"
		kept.append(e)
	var todo: Array = calendar.slice(0, season_day) + kept
	_fecha_supercopa_misma(todo, league_schedule.size())
	var nueva: Dictionary = todo.back()
	var at: int = kept.size()
	for j in kept.size():
		if float((kept[j] as Dictionary).get("week", 0.0)) > float(nueva["week"]):
			at = j
			break
	kept.insert(at, nueva)
	calendar.resize(season_day)
	calendar.append_array(kept)
	if not queda_liga:
		_aviva_supercopa_misma(season_day)




func _amer_orphan() -> bool:
	var estados: Dictionary = {"lib": lib_state, "sud": sud_state, "cca": cca_state,
		"ace": ace_state, "ac2": ac2_state, "caf": caf_state, "cf2": cf2_state, "ofc": ofc_state}
	for c in estados:
		var st: Dictionary = estados[c]
		if not st.is_empty() and String(st.get("comp", "")) != String(c):
			return true








	var hay: bool = false
	for e in calendar:
		var c2: String = String((e as Dictionary).get("comp", ""))
		if not Continental.es_americana(c2):
			continue
		hay = true
		if not bool((e as Dictionary).get("dead", false)) \
				and (estados[c2] as Dictionary).is_empty():
			return true
	return hay and lib_state.is_empty() and sud_state.is_empty() and cca_state.is_empty() \
			and ace_state.is_empty() and ac2_state.is_empty() \
			and caf_state.is_empty() and cf2_state.is_empty() and ofc_state.is_empty()




func _norm_liguilla(raw: Variant) -> Dictionary:
	if raw is not Dictionary or not bool(raw.get("playing", false)):
		return {}
	var out: Dictionary = _liguilla_estado_nuevo()
	out["seeded"] = bool(raw.get("seeded", false))
	var orden: Array = []
	for k in raw.get("orden", []):
		orden.append(String(k))
	out["orden"] = orden
	var seed_of: Dictionary = {}
	var rs: Variant = raw.get("seed_of", {})
	if rs is Dictionary:
		for k in rs:
			seed_of[String(k)] = int(rs[k])
	out["seed_of"] = seed_of
	out["bracket"] = _norm_bracket(raw.get("bracket", []))
	out["ko_idx"] = int(raw.get("ko_idx", -1))
	out["alive"] = bool(raw.get("alive", false))
	out["champion"] = bool(raw.get("champion", false))
	out["pos"] = int(raw.get("pos", 0))
	for k in ["winner", "runner_up", "superlider"]:
		out[k] = String(raw.get(k, ""))


	out["torneo"] = clampi(int(raw.get("torneo", Liguilla.CLAUSURA)),
		Liguilla.APERTURA, Liguilla.CLAUSURA)


	if bool(raw.get("sin_ti", false)):
		out["sin_ti"] = true


	if bool(out["seeded"]) and (out["bracket"] as Array).is_empty():
		out["seeded"] = false
	return out













func _norm_apertura_congelado(raw: Variant) -> Dictionary:
	if raw is not Dictionary or String((raw as Dictionary).get("winner", "")).is_empty():
		return {}
	var base: Dictionary =(raw as Dictionary).duplicate()
	base["playing"] = true
	var out: Dictionary = _norm_liguilla(base)
	for k in out.keys():
		if not (raw as Dictionary).has(k):
			out.erase(k)
	return out






func _sanea_liguilla() -> void:
	if not liguilla_state.is_empty():
		return
	for e in calendar:
		if String(e.get("comp", "")) == "liguilla" and not bool(e.get("played", false)):
			e["dead"] = true
















func _migra_sin_playin() -> void:
	if liguilla_state.is_empty():
		return
	for e in calendar:
		if String(e.get("comp", "")) == "liguilla" \
				and int(e.get("ko_idx", -1)) < Liguilla.CUARTOS \
				and not bool(e.get("played", false)):
			e["dead"] = true
	if not bool(liguilla_state.get("seeded", false)) \
			or (liguilla_state.get("bracket", []) as Array).size() > Liguilla.CUARTOS:
		return
	var ocho: Array =(liguilla_state.get("orden", []) as Array).slice(0, Liguilla.CLUBES_MIN)
	if ocho.size() < Liguilla.CLUBES_MIN:
		return
	var pos: int = int(liguilla_state.get("pos", 0))
	liguilla_state["orden"] = ocho
	liguilla_state["seed_of"] = Liguilla.siembra(ocho)
	liguilla_state["bracket"] = Liguilla.cuadro_nuevo(ocho)
	liguilla_state["alive"] = pos >= 1 and pos <= Liguilla.CLUBES_MIN
	liguilla_state["champion"] = false
	_liguilla_tras_ronda()














func _migrate_liguilla() -> void:
	if calendar.is_empty() or season_day >= calendar.size():
		return
	if not _liga_en_torneos(league_table.size()) or torneos_activos():
		return
	for e in calendar:
		if not e.has("week"):
			return
	if liguilla_state.is_empty():
		_migra_liguilla_unica()
	if not liguilla_state.is_empty():
		_migra_a_torneos()








func _migra_liguilla_unica() -> void:
	var base: float = float(league_schedule.size())
	var queda_liga: bool = false
	for i in calendar.size():
		var e: Dictionary = calendar[i]
		var comp: String = String(e.get("comp", ""))
		if comp == "liguilla":
			return
		if comp == "league" or comp == "cup" or EURO_COMPS.has(comp) \
				or Continental.es_americana(comp):
			base = maxf(base, float(e["week"]))
		if comp == "league" and i >= season_day and not bool(e.get("played", false)):
			queda_liga = true
	if not queda_liga or float(calendar[season_day]["week"]) > base:
		return
	var at: int = calendar.size()
	for i in calendar.size():
		if float(calendar[i]["week"]) > base:
			at = mini(at, i)
			calendar[i]["week"] = float(calendar[i]["week"]) + Liguilla.SEMANAS
	var nuevas: Array = []
	_fechas_liguilla(nuevas, base, Liguilla.CLAUSURA)
	for j in nuevas.size():
		calendar.insert(at + j, nuevas[j])
	liguilla_state = _liguilla_estado_nuevo(Liguilla.CLAUSURA)








func _migra_a_torneos() -> void:
	if bool(liguilla_state.get("seeded", false)):
		return
	var total: int = league_schedule.size()
	var half: int = total / 2
	var idx: int = _league_round_cal_idx(half - 1)
	if idx < season_day or idx < 0:
		return
	var cierre: Dictionary = calendar[idx]
	if bool(cierre.get("played", false)) or bool(cierre.get("dead", false)):
		return
	for e in calendar:
		var comp: String = String(e.get("comp", ""))
		if comp == "league" and int(e.get("round_idx", -1)) >= 0:
			var r: int = int(e["round_idx"])
			e["label"] = Liguilla.etiqueta_jornada(r, total)
			e["torneo"] = Liguilla.torneo_de_jornada(r, total)
		elif comp == "liguilla":
			e["torneo"] = Liguilla.CLAUSURA
		if float(e["week"]) > float(half):
			e["week"] = float(e["week"]) + Liguilla.SEMANAS
	var nuevas: Array = []
	_fechas_liguilla(nuevas, float(half), Liguilla.APERTURA)
	for j in nuevas.size():
		calendar.insert(idx + 1 + j, nuevas[j])
	liguilla_state["torneo"] = Liguilla.APERTURA



























func _migrate_euro_legs() -> void:
	for comp in EURO_COMPS:

		var por_ronda: Dictionary = {}
		for i in calendar.size():
			var e: Dictionary = calendar[i]
			if String(e.get("comp", "")) != String(comp):
				continue

			if String(e.get("round", "")) == "grupo":
				continue
			var k: int = int(e.get("ko_idx", -1))
			if k < 0:
				continue
			var lst: Array = por_ronda.get(k, [])
			lst.append(i)
			por_ronda[k] = lst


		var rondas: Array = por_ronda.keys()
		rondas.sort()
		rondas.reverse()
		for k in rondas:
			var ki: int = int(k)
			if ki >= EURO_KO_TWO_LEGS.size() or not EURO_KO_TWO_LEGS[ki]:
				continue
			var idxs: Array = por_ronda[k]
			if idxs.size() != 1:
				continue
			var vi: int = int(idxs[0])
			if vi <= season_day:
				continue
			var vuelta: Dictionary = calendar[vi]
			if bool(vuelta.get("played", false)):
				continue
			var name_i: String = String(vuelta.get("round", "")).to_upper()
			var etiqueta: String = String(EURO_LABEL.get(comp, ""))



			vuelta["leg"] = 1
			vuelta["label"] = "%s · %s (VUELTA)" % [etiqueta, name_i]
			calendar.insert(vi, {
				"comp": String(comp), "opp": String(vuelta.get("opp", "")),



				"home": not bool(vuelta.get("home", true)),
				"round": String(vuelta.get("round", "")),
				"ko_idx": ki, "leg": 0,
				"dead": bool(vuelta.get("dead", true)),
				"label": "%s · %s (IDA)" % [etiqueta, name_i],
			})












func _migrate_nat_tail() -> void:
	if season_day >= calendar.size():
		return
	var last_club: int = -1
	for i in calendar.size():
		if String((calendar[i] as Dictionary).get("comp", "")) != "nat":
			last_club = i
	var bad: bool = false
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]
		if i < last_club and String(e.get("comp", "")) == "nat" \
				and String(e.get("round", "")) != "qual":
			bad = true
			break
	if not bad:
		return




	var moved: Array = []
	var kept: Array = []
	for i in range(season_day, calendar.size()):
		var e: Dictionary = calendar[i]
		if String(e.get("comp", "")) == "nat" and String(e.get("round", "")) != "qual":
			moved.append(e)
		else:
			kept.append(e)
	calendar.resize(season_day)
	calendar.append_array(kept)
	calendar.append_array(moved)





func _norm_form(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	for k in (raw as Dictionary):
		var src: Variant =(raw as Dictionary)[k]
		if not (src is Array):
			continue
		var l: Array = []
		for v in (src as Array):




			var r: String = str(v)
			if r == "G" or r == "E" or r == "P":
				l.append(r)
		while l.size() > FORM_N:
			l.pop_front()
		if not l.is_empty():
			out[String(k)] = l
	return out






func _norm_comp_form(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if not (raw is Dictionary):
		return out
	for k in (raw as Dictionary):
		var t: Dictionary = _norm_form((raw as Dictionary)[k])
		if not t.is_empty():
			out[String(k)] = t
	return out


func _norm_table(raw: Variant) -> Dictionary:
	var out: Dictionary = {}
	if raw is Dictionary:
		for key in raw:
			var row: Dictionary = _blank_row()
			for stat in row:
				row[stat] = int(raw[key].get(stat, 0))
			out[String(key)] = row
	return out


func _norm_schedule(raw: Variant) -> Array:
	var out: Array = []
	if raw is Array:
		for round in raw:
			var pairs: Array = []
			for pair in round:
				pairs.append([String(pair[0]), String(pair[1])])
			out.append(pairs)
	return out





func _norm_last_match(raw: Variant) -> Dictionary:
	if raw is not Dictionary or not raw.has("opp"):
		return {}
	var out: Dictionary = {
		"comp": String(raw.get("comp", "")),
		"opp": String(raw.get("opp", "")),
		"home": bool(raw.get("home", true)),
		"round": String(raw.get("round", "")),
		"label": String(raw.get("label", "")),
		"gf": int(raw.get("gf", 0)), "gc": int(raw.get("gc", 0)),
	}

	if raw.has("torneo"):
		out["torneo"] = int(raw["torneo"])





	for k in ["ko_idx", "leg"]:
		if raw.has(k):
			out[k] = int(raw[k])
	return out









































const CAL_INDEX_KEYS: Array[String] = ["round_idx", "cup_idx", "ko_idx",
	"euro_round", "nat_round", "nat_g_round", "nat_ko", "leg", "torneo",
	"nat_n_round", "nat_o_round", "jor", "pot"]


func _norm_calendar(raw: Variant) -> Array:
	var out: Array = []
	if raw is Array:
		for e in raw:
			if e is not Dictionary:
				continue
			var entry: Dictionary = {
				"comp": String(e.get("comp", "league")),
				"opp": String(e.get("opp", "")),
				"home": bool(e.get("home", true)),
				"round": String(e.get("round", "liga")),
				"label": String(e.get("label", "")),
				"dead": bool(e.get("dead", false)),
			}




			if bool(e.get("played", false)):
				entry["played"] = true
				entry["gf"] = int(e.get("gf", 0))
				entry["gc"] = int(e.get("gc", 0))










			if e.has("week"):
				var w: float = float(e["week"])
				entry["week"] = CalendarioMundo.SIN_SEMANA if w == -1.0 else w
			for k in CAL_INDEX_KEYS:
				if e.has(k):
					entry[k] = int(e[k])


			if e.has("des"):
				entry["des"] = String(e["des"])


			if e.has("pv"):
				entry["pv"] = String(e["pv"])
			if e.has("neutral"):
				entry["neutral"] = bool(e["neutral"])
			out.append(entry)
	return out


func _norm_cup(raw: Variant) -> Dictionary:
	if raw is not Dictionary or not raw.has("opps"):
		return {}
	var opps: Array = []
	for o in raw.get("opps", []):
		opps.append(String(o))
	var names: Array = []
	for n in raw.get("names", []):
		names.append(String(n))
	var out: Dictionary = {"alive": bool(raw.get("alive", true)),
		"champion": bool(raw.get("champion", false)),
		"opps": opps, "names": names, "idx": int(raw.get("idx", 0))}



	if raw.has("field"):
		var field: Array = []
		for f in raw.get("field", []):
			field.append(String(f))
		out["field"] = field






		if raw.has("ties"):
			var ties: Array = []
			for t in raw.get("ties", []):
				if t is Array and t.size() == 2:
					ties.append([String(t[0]), String(t[1])])
			out["ties"] = ties
		var homes: Array = []
		for h in raw.get("homes", []):
			homes.append(bool(h))
		out["homes"] = homes
	out["winner"] = String(raw.get("winner", ""))



	if raw.get("fmt") is Dictionary:
		out["fmt"] =(raw["fmt"] as Dictionary).duplicate(true)
		out["entra"] = int(raw.get("entra", 0))
	if raw.has("field0"):
		var f0: Array = []
		for id in raw.get("field0", []):
			f0.append(String(id))
		out["field0"] = f0


	out["bracket"] = _norm_bracket(raw.get("bracket", []))
	return out


func _norm_bracket(raw: Variant) -> Array:
	var bracket: Array = []
	if raw is not Array:
		return bracket
	for round_ties in raw:
		if round_ties is not Array:
			continue
		var ties: Array = []
		for t in round_ties:
			if t is Dictionary:
				var tie: Dictionary = {
					"a": String(t.get("a", "")), "b": String(t.get("b", "")),
					"winner": String(t.get("winner", "")),
					"score": String(t.get("score", ""))}












				for k in ["leg1", "leg2", "agg", "pend", "pens"]:
					if t.has(k) and not String(t[k]).is_empty():
						tie[k] = String(t[k])
				ties.append(tie)
		bracket.append(ties)
	return bracket






func _norm_nat(raw: Variant) -> Dictionary:
	if raw is not Dictionary or not bool(raw.get("playing", false)):
		return {}
	var comp: String = String(raw.get("comp", "qual"))
	var season: int = int(raw.get("season", -1))




	if comp == "friendly":
		return {"playing": true, "comp": "friendly", "season": season,
			"watch": bool(raw.get("watch", false)),
			"done": bool(raw.get("done", false)),
			"played": int(raw.get("played", 0)), "won": int(raw.get("won", 0))}
	if comp == "wc" or comp == "cont":




		if not raw.has("bracket"):
			return {}
		var groups: Array = []
		for g in raw.get("groups", []):
			if g is not Dictionary:
				continue
			var keys: Array = []
			for k in g.get("keys", []):
				keys.append(String(k))
			groups.append({"keys": keys, "table": _norm_table(g.get("table", {})),
				"schedule": _norm_schedule(g.get("schedule", []))})
		var ko_opps: Array = []
		for k in raw.get("ko_opps", []):
			ko_opps.append(String(k))
		var ko_names: Array = []
		for n in raw.get("ko_names", []):
			ko_names.append(String(n))
		return {"playing": true, "comp": comp, "groups": groups,
			"bracket": _norm_bracket(raw.get("bracket", [])),
			"ko_opps": ko_opps, "ko_names": ko_names,
			"ko_idx": int(raw.get("ko_idx", 0)),
			"advanced": bool(raw.get("advanced", false)),
			"alive": bool(raw.get("alive", true)),
			"champion": bool(raw.get("champion", false)),
			"winner": String(raw.get("winner", "")),
			"season": season, "name": String(raw.get("name", "SELECCIÓN")),


			"watch": bool(raw.get("watch", false))}
	var group: Array = []
	for g in raw.get("group", []):
		group.append(String(g))
	var out: Dictionary = {"playing": true, "comp": "qual", "group": group,
		"table": _norm_table(raw.get("table", {})),
		"schedule": _norm_schedule(raw.get("schedule", [])),
		"qualified": bool(raw.get("qualified", false)),
		"done": bool(raw.get("done", false)), "season": season,
		"watch": bool(raw.get("watch", false))}





	var target: String = String(raw.get("target", ""))
	if target == "wc" or target == "cont":
		out["target"] = target
	return out






func _norm_previa_eu(raw: Dictionary) -> Dictionary:
	var d: Dictionary = {"i": int(raw.get("i", 0))}
	for kk in ["k", "ronda", "a", "b", "leg1", "leg2", "winner"]:
		d[kk] = String(raw.get(kk, ""))
	if bool(raw.get("antes_de_llegar", false)):
		d["antes_de_llegar"] = true
	return d


func _norm_euro(raw: Variant) -> Dictionary:
	if raw is not Dictionary:
		return {}




	var amer: bool = Continental.es_americana(String(raw.get("comp", "")))


	var previa_eu: bool = not amer and String(raw.get("entrada", "")) == "previa"
	if not raw.has("groups") and not amer and not previa_eu:
		return {}
	var groups: Array = []
	for g in raw.get("groups", []):
		if g is not Dictionary:
			continue
		var keys: Array = []
		for k in g.get("keys", []):
			keys.append(String(k))
		var grupo: Dictionary = {"keys": keys, "table": _norm_table(g.get("table", {})),
			"schedule": _norm_schedule(g.get("schedule", []))}




		if g.has("league_phase"):
			grupo["league_phase"] = bool(g["league_phase"])
		groups.append(grupo)
	if groups.is_empty() and not amer and not previa_eu:
		return {}
	var bracket: Array = _norm_bracket(raw.get("bracket", []))
	var ko_opps: Array = []
	for k in raw.get("ko_opps", []):
		ko_opps.append(String(k))
	var ko_names: Array = []
	for n in raw.get("ko_names", []):
		ko_names.append(String(n))









	var seeds: Array = []
	for sd in raw.get("seeds", []):
		seeds.append(String(sd))
	var out: Dictionary = {"playing": bool(raw.get("playing", false)),
		"comp": String(raw.get("comp", "")),
		"league_phase": bool(raw.get("league_phase", false)),
		"seeds": seeds,
		"groups": groups, "bracket": bracket,
		"advanced": bool(raw.get("advanced", false)),
		"alive": bool(raw.get("alive", false)),
		"champion": bool(raw.get("champion", false)),
		"winner": String(raw.get("winner", "")),
		"ko_opps": ko_opps, "ko_names": ko_names,
		"ko_idx": int(raw.get("ko_idx", 0))}
	if previa_eu:


		out["entrada"] = "previa"
		out["fuera"] = String(raw.get("fuera", ""))
		var pv_eu: Variant = raw.get("previa", {})
		if pv_eu is Dictionary and not (pv_eu as Dictionary).is_empty():
			out["previa"] = _norm_previa_eu(pv_eu)
		var camino: Array = []
		for c in raw.get("camino", []):
			if c is Dictionary:
				camino.append(_norm_previa_eu(c))
		out["camino"] = camino
		return out
	if not amer:
		return out




	out["entrada"] = String(raw.get("entrada", ""))
	out["fuera"] = String(raw.get("fuera", ""))
	for k in ["previa", "preliminar"]:
		var pv: Variant = raw.get(k, {})
		if pv is Dictionary and not (pv as Dictionary).is_empty():
			var d: Dictionary = {}
			for kk in ["a", "b", "leg1", "leg2", "winner"]:
				d[kk] = String((pv as Dictionary).get(kk, ""))
			out[k] = d
	var fz: Variant = raw.get("forzado", {})
	if fz is Dictionary and not (fz as Dictionary).is_empty():
		out["forzado"] = {"ganador": String((fz as Dictionary).get("ganador", "")),
			"perdedor": String((fz as Dictionary).get("perdedor", ""))}
	var cp: Dictionary = {}
	var raw_cp: Variant = raw.get("campana", {})
	if raw_cp is Dictionary:
		for key in raw_cp:
			var v: Variant =(raw_cp as Dictionary)[key]
			if v is Array and (v as Array).size() == 3:
				cp[String(key)] = [int(v[0]), int(v[1]), int(v[2])]
	out["campana"] = cp
	return out
