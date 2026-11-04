class_name Continental
extends RefCounted










const AMER_COMPS: Array[String] = ["lib", "sud", "cca", "ace", "ac2", "caf", "cf2", "ofc"]



const CUADRO_COMPS: Array[String] = ["cca", "ace", "ac2", "caf", "cf2"]




















const COPAS: Dictionary = {
	"lib": {"confed": "CONMEBOL", "tier": 0, "marca": "libertadores",
		"etiqueta": "LIBERTADORES",
		"titulo": "Campeón de Libertadores", "bota": "Bota de la Libertadores",
		"asistente": "Máximo Asistente de la Libertadores", "mejor": "Mejor de la Libertadores",
		"ko_names": ["Octavos", "Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true, false],
		"delta": 0.0,
		"visitante": false, "final": "neutral", "cae_a": "sud",
		"umbral": {"g": 12, "a": 8, "avg": 7.8}, "puntos": 6},
	"sud": {"confed": "CONMEBOL", "tier": 1, "marca": "sudamericana",
		"etiqueta": "SUDAMERICANA",
		"titulo": "Campeón de Sudamericana", "bota": "Bota de la Sudamericana",
		"asistente": "Máximo Asistente de la Sudamericana", "mejor": "Mejor de la Sudamericana",
		"ko_names": ["Playoff", "Octavos", "Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true, true, false],
		"delta": 0.05,
		"visitante": false, "final": "neutral", "cae_a": "",
		"umbral": {"g": 10, "a": 7, "avg": 7.7}, "puntos": 4},
	"cca": {"confed": "CONCACAF", "tier": 0, "marca": "concacaf",
		"etiqueta": "CONCACAF CHAMPIONS CUP",
		"titulo": "Campeón de Concacaf", "bota": "Bota de la Concacaf",
		"asistente": "Máximo Asistente de la Concacaf", "mejor": "Mejor de la Concacaf",
		"ko_names": ["Octavos", "Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true, false],
		"delta": 0.0,
		"visitante": true, "final": "mejor", "cae_a": "",
		"umbral": {"g": 8, "a": 5, "avg": 7.8}, "puntos": 6},











	"ace": {"confed": "AFC", "tier": 0, "marca": "oriente",
		"etiqueta": "COPA DE ORIENTE",
		"titulo": "Campeón de Copa de Oriente", "bota": "Bota de la Copa de Oriente",
		"asistente": "Máximo Asistente de la Copa de Oriente",
		"mejor": "Mejor de la Copa de Oriente",
		"ko_names": ["Octavos", "Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, false, false, false], "centralizada_desde": 1,
		"delta": 0.0,
		"visitante": false, "final": "neutral", "cae_a": "",
		"umbral": {"g": 7, "a": 5, "avg": 7.8}, "puntos": 5},
	"ac2": {"confed": "AFC", "tier": 1, "marca": "sol",
		"etiqueta": "COPA DEL SOL",
		"titulo": "Campeón de Copa del Sol", "bota": "Bota de la Copa del Sol",
		"asistente": "Máximo Asistente de la Copa del Sol",
		"mejor": "Mejor de la Copa del Sol",
		"ko_names": ["Octavos", "Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true, false],
		"delta": 0.05,
		"visitante": false, "final": "mejor", "cae_a": "",
		"umbral": {"g": 6, "a": 4, "avg": 7.7}, "puntos": 3},











	"caf": {"confed": "CAF", "tier": 0, "marca": "atlas",
		"etiqueta": "COPA DEL ATLAS",
		"titulo": "Campeón de Copa del Atlas", "bota": "Bota de la Copa del Atlas",
		"asistente": "Máximo Asistente de la Copa del Atlas",
		"mejor": "Mejor de la Copa del Atlas",
		"ko_names": ["Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true],
		"delta": 0.0,
		"visitante": false, "final": "mejor", "cae_a": "",
		"umbral": {"g": 5, "a": 3, "avg": 7.8}, "puntos": 4},
	"cf2": {"confed": "CAF", "tier": 1, "marca": "baobab",
		"etiqueta": "COPA DEL BAOBAB",
		"titulo": "Campeón de Copa del Baobab", "bota": "Bota de la Copa del Baobab",
		"asistente": "Máximo Asistente de la Copa del Baobab",
		"mejor": "Mejor de la Copa del Baobab",
		"ko_names": ["Cuartos", "Semifinal", "Final"],
		"ko_dos": [true, true, true],
		"delta": 0.05,
		"visitante": false, "final": "mejor", "cae_a": "",
		"umbral": {"g": 4, "a": 3, "avg": 7.7}, "puntos": 2},











	"ofc": {"confed": "OFC", "tier": 0, "marca": "coral",
		"etiqueta": "COPA DEL CORAL",
		"titulo": "Campeón de Copa del Coral", "bota": "Bota de la Copa del Coral",
		"asistente": "Máximo Asistente de la Copa del Coral",
		"mejor": "Mejor de la Copa del Coral",
		"ko_names": ["Semifinal", "Final"],
		"ko_dos": [false, false],
		"delta": 0.0,
		"visitante": false, "final": "neutral", "cae_a": "",
		"umbral": {"g": 5, "a": 3, "avg": 7.7}, "puntos": 2,
		"grupos": {"n": 2, "tam": 4, "vueltas": 1, "sede_unica": true}},
}



const EUROPEAS: Dictionary = {
	"ucl": {"marca": "champions", "titulo": "Campeón de Champions", "puntos": 6},
	"eul": {"marca": "europa", "titulo": "Campeón de Europa League", "puntos": 4},
	"conf": {"marca": "conference", "titulo": "Campeón de Conference", "puntos": 3},
}

const PAISES_CONMEBOL: Array[String] = ["Argentina", "Brasil", "Uruguay", "Colombia",
	"Chile", "Paraguay", "Ecuador", "Perú", "Bolivia", "Venezuela"]
const PAISES_CONCACAF: Array[String] = ["México", "Estados Unidos"]



const PAISES_AFC: Array[String] = ["Arabia Saudí", "Japón", "Corea del Sur", "Catar",
	"Irán", "Uzbekistán", "Jordania"]



const PAISES_CAF: Array[String] = ["Egipto", "Marruecos", "Sudáfrica", "Túnez"]





const PAISES_OFC: Array[String] = ["Nueva Zelanda", "Fiyi", "Tahití", "Nueva Caledonia"]






































const FECHAS: Dictionary = {
	"lib": {"previa": [3.129, 3.355],
		"grupos": [4.033, 4.267, 4.733, 5.194, 5.419, 5.871],
		"ko": [[8.387, 8.613], [9.533, 9.767], [10.677, 10.903], [11.933]]},
	"sud": {"prelim": [3.129],
		"grupos": [4.033, 4.267, 4.733, 5.194, 5.419, 5.871],
		"ko": [[7.484, 7.71], [8.387, 8.613], [9.533, 9.767], [10.677, 10.903], [11.7]]},
	"cca": {"ko": [[3.323, 3.548], [4.233, 4.467], [4.933, 5.161], [5.935]]},
	"ace": {"ko": [[3.065, 3.29], [4.533], [4.633], [4.8]], "comparte": [2]},
	"ac2": {"ko": [[2.357, 2.607], [3.097, 3.323], [4.2, 4.433], [5.484]]},
	"caf": {"ko": [[3.419, 3.645], [4.333, 4.567], [5.516, 5.742]]},
	"cf2": {"ko": [[3.452, 3.677], [4.367, 4.6], [5.258, 5.484]]},
	"ofc": {"grupos": [8.274, 8.371, 8.468], "ko": [[8.581], [8.677]], "por_semana": 2,
		"sede": true},
}


const PAIS_REF: Dictionary = {"CONMEBOL": "Brasil", "CONCACAF": "México", "AFC": "Arabia Saudí",
	"CAF": "Egipto", "OFC": "Nueva Zelanda"}








const GRUPO_OFF: float = 0.25
const KO_OFF: float = 0.5
const PRIMERA_DOBLE: float = 0.3
const SEGUNDA_OFF: float = 0.65





const LEJOS_MIN: float = 0.3
const LEJOS_MAX: float = 0.7


const GRUPO_SPOT_IDX: Array[int] = [1, 2, 3, 4, 5, 6]
















const CUPOS: Dictionary = {
	"Argentina": {"lib": 5, "previa": 1, "sud": 6, "prelim": 0, "copa_en_lib": true},
	"Brasil": {"lib": 5, "previa": 2, "sud": 6, "prelim": 0, "copa_en_lib": true},
	"Uruguay": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Colombia": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Chile": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Paraguay": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Ecuador": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Perú": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Bolivia": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"Venezuela": {"lib": 2, "previa": 2, "sud": 0, "prelim": 4, "copa_en_lib": false},
	"México": {"cca": 8, "liguilla": true},
	"Estados Unidos": {"cca": 8, "copa": true},


	"Arabia Saudí": {"ace": 3, "ac2": 3},
	"Japón": {"ace": 3, "ac2": 3},
	"Corea del Sur": {"ace": 3, "ac2": 3},
	"Catar": {"ace": 2, "ac2": 2},
	"Irán": {"ace": 2, "ac2": 2},
	"Uzbekistán": {"ace": 2, "ac2": 2},
	"Jordania": {"ace": 1, "ac2": 1},




	"Egipto": {"caf": 2, "cf2": 2},
	"Marruecos": {"caf": 2, "cf2": 2},
	"Sudáfrica": {"caf": 2, "cf2": 2},
	"Túnez": {"caf": 2, "cf2": 2},


	"Nueva Zelanda": {"ofc": 2},
	"Fiyi": {"ofc": 2},
	"Tahití": {"ofc": 2},
	"Nueva Caledonia": {"ofc": 2},
}


const RELLENO: Array[String] = ["Brasil", "Argentina"]








const LIGUILLA_TORNEOS: Array[String] = ["apertura", "clausura"]



const LIGUILLA_PLAZAS: Array = [["apertura", "winner"], ["clausura", "winner"],
	["apertura", "runner_up"], ["clausura", "runner_up"]]




static func es_americana(comp: String) -> bool:
	return AMER_COMPS.has(comp)





static func es_continental(comp: String) -> bool:
	return GameState.EURO_COMPS.has(comp) or es_americana(comp)


static func info(comp: String) -> Dictionary:
	return COPAS.get(comp, {})





static func copas_de_pais(country: String) -> Array[String]:
	var out: Array[String] = []
	if PAISES_CONMEBOL.has(country):
		out.assign(["lib", "sud"])
	elif PAISES_CONCACAF.has(country):
		out.assign(["cca"])
	elif PAISES_AFC.has(country):
		out.assign(["ace", "ac2"])
	elif PAISES_CAF.has(country):
		out.assign(["caf", "cf2"])
	elif PAISES_OFC.has(country):
		out.assign(["ofc"])
	return out



static func paises_de(confed: String) -> Array[String]:
	match confed:
		"CONMEBOL": return PAISES_CONMEBOL
		"CONCACAF": return PAISES_CONCACAF
		"AFC": return PAISES_AFC
		"CAF": return PAISES_CAF
		"OFC": return PAISES_OFC
	return []


static func es_de_cuadro(comp: String) -> bool:
	return CUADRO_COMPS.has(comp)







static func grupos_de(comp: String) -> Dictionary:
	return (info(comp).get("grupos", {}) as Dictionary).duplicate(true)


static func tiene_copas(country: String) -> bool:
	return not copas_de_pais(country).is_empty()


static func confed_de(comp: String) -> String:
	if EUROPEAS.has(comp):
		return "UEFA"
	return String(info(comp).get("confed", ""))




static func marca(comp: String) -> String:
	if COPAS.has(comp):
		return String(COPAS[comp]["marca"])
	if EUROPEAS.has(comp):
		return String(EUROPEAS[comp]["marca"])
	return ""



static func comp_de_marca(marca_id: String) -> String:
	for c in COPAS:
		if String(COPAS[c]["marca"]) == marca_id:
			return String(c)
	for c in EUROPEAS:
		if String(EUROPEAS[c]["marca"]) == marca_id:
			return String(c)
	return ""


static func etiqueta(comp: String) -> String:
	return String(info(comp).get("etiqueta", ""))



static func titulo(comp: String) -> String:
	if EUROPEAS.has(comp):
		return String(EUROPEAS[comp]["titulo"])
	return String(info(comp).get("titulo", ""))


static func bota(comp: String) -> String:
	return String(info(comp).get("bota", ""))


static func asistente(comp: String) -> String:
	return String(info(comp).get("asistente", ""))


static func mejor(comp: String) -> String:
	return String(info(comp).get("mejor", ""))




static func comp_de_premio(award: String) -> String:
	if award.is_empty():
		return ""
	for c in COPAS:
		var row: Dictionary = COPAS[c]
		for k in ["titulo", "bota", "asistente", "mejor"]:
			if String(row[k]) == award:
				return String(c)
	return ""





static func titulos_top() -> Array[String]:
	var out: Array[String] = [String(EUROPEAS["ucl"]["titulo"])]
	for c in AMER_COMPS:
		if int(COPAS[c]["tier"]) == 0:
			out.append(String(COPAS[c]["titulo"]))
	return out


static func ko_names(comp: String) -> Array[String]:
	var out: Array[String] = []
	out.assign(info(comp).get("ko_names", []))
	return out


static func ko_dos_partidos(comp: String, ko_idx: int) -> bool:
	var dos: Array = info(comp).get("ko_dos", [])
	if ko_idx < 0 or ko_idx >= dos.size():
		return false
	return bool(dos[ko_idx])


static func es_final(comp: String, ko_idx: int) -> bool:
	var n: int = ko_names(comp).size()
	return n > 0 and ko_idx == n - 1



static func piernas(comp: String) -> Array:
	var out: Array = []
	for d in info(comp).get("ko_dos", []):
		out.append(2 if bool(d) else 1)
	return out


static func goles_visitante(comp: String) -> bool:
	return bool(info(comp).get("visitante", false))


static func final_neutral(comp: String) -> bool:
	return String(info(comp).get("final", "")) == "neutral"





static func final_ida_vuelta(comp: String) -> bool:
	var n: int = ko_names(comp).size()
	return n > 0 and ko_dos_partidos(comp, n - 1)






static func ko_neutral(comp: String, ko_idx: int, es_final_: bool) -> bool:
	if bool(grupos_de(comp).get("sede_unica", false)):
		return true
	var desde: int = int(info(comp).get("centralizada_desde", -1))
	if desde >= 0 and ko_idx >= desde:
		return true
	return es_final_ and final_neutral(comp)





static func cruce_neutral(comp: String, n_cruces: int) -> bool:
	var desde_final: int = int(round(log(float(maxi(n_cruces, 1))) / log(2.0)))
	return ko_neutral(comp, ko_names(comp).size() - 1 - desde_final, n_cruces <= 1)




static func ronda_centralizada(comp: String, round_name: String) -> bool:
	var desde: int = int(info(comp).get("centralizada_desde", -1))
	if desde < 0:
		return false
	var idx: int = ko_names(comp).find(round_name)
	return idx >= desde









static func tie_rule(comp: String, round_name: String, ko_idx: int, leg: int) -> String:
	if not es_americana(comp) or leg < 1 or round_name == "grupo":
		return ""
	if round_name == "previa" or round_name == "preliminar":
		return "penales"
	var idx: int = ko_idx
	var names: Array[String] = ko_names(comp)



	if not names.is_empty() and idx >= names.size() and round_name == names[names.size() - 1]:
		return "prorroga"
	if idx < 0 or idx >= names.size():
		idx = names.find(round_name)
	if idx < 0:
		return ""
	return "penales" if ko_dos_partidos(comp, idx) else "prorroga"



static func decide_visitante(mis_fuera: int, sus_fuera: int) -> int:
	if mis_fuera > sus_fuera:
		return 1
	if mis_fuera < sus_fuera:
		return -1
	return 0






static func semana_grupo(comp: String, r: int, league_len: int, pais: String = "") -> float:
	var g: Array = _semanas(comp, league_len, pais).get("grupos", [])
	if g.is_empty():
		return CalendarioMundo.SIN_SEMANA
	return float(g[clampi(r, 0, g.size() - 1)])




static func semana_ko(comp: String, ko_idx: int, leg: int, league_len: int,
		pais: String = "") -> float:
	var ko: Array = _semanas(comp, league_len, pais).get("ko", [])
	if ko_idx < 0 or ko_idx >= ko.size():
		return CalendarioMundo.SIN_SEMANA
	var r: Array = ko[ko_idx]
	if leg == 0 and r.size() > 1:
		return float(r[0])
	return float(r[r.size() - 1])



static func semana_previa(leg: int, league_len: int, pais: String = "") -> float:
	var pv: Array = _semanas("lib", league_len, pais).get("previa", [])
	return float(pv[clampi(leg, 0, pv.size() - 1)]) if not pv.is_empty() \
			else CalendarioMundo.SIN_SEMANA



static func semana_preliminar(league_len: int, pais: String = "") -> float:
	var pr: Array = _semanas("sud", league_len, pais).get("prelim", [])
	return float(pr[0]) if not pr.is_empty() else CalendarioMundo.SIN_SEMANA




static func pais_de_calendario(comp: String, pais: String) -> String:
	var confed: String = confed_de(comp)
	if not pais.is_empty() and Teams.confed_of_country(pais) == confed:
		return pais
	return String(PAIS_REF.get(confed, pais))

















static func fraccion(pais: String, mes: float, league_len: int) -> float:
	var dur: float = float(FormatoCopa.temporada(pais)[1])
	var f: float = clampf(FormatoCopa._off(pais, mes) / dur, 0.0, 1.0)
	if league_len < 1 or not _en_torneos(pais, league_len):
		return f
	var largo: float = float(league_len) + 2.0 * Liguilla.SEMANAS
	var mitad: float = float(league_len / 2)
	var wc: float = f * largo
	var wf: float = wc
	if wc > mitad + Liguilla.SEMANAS:
		wf = wc - Liguilla.SEMANAS
	elif wc > mitad:
		wf = mitad
	return clampf(wf / float(league_len), 0.0,
		(float(league_len) + Liguilla.SEMANAS) / float(league_len))




static func _en_torneos(pais: String, league_len: int) -> bool:
	return Liguilla.aplica(pais, 1) and league_len >=(Liguilla.CLUBES_MIN - 1) * 2





static func fracciones(comp: String, pais: String = "") -> Dictionary:
	var p: String = pais_de_calendario(comp, pais)
	var fe: Dictionary = FECHAS.get(comp, {})
	var out: Dictionary = {"grupos": [], "ko": []}
	var pv: Array = fe.get("previa", [])
	if not pv.is_empty():
		out["previa"] = fraccion(p, float(pv[pv.size() - 1]), 0)
	var pr: Array = fe.get("prelim", [])
	if not pr.is_empty():
		out["prelim"] = fraccion(p, float(pr[0]), 0)
	for m in fe.get("grupos", []):
		(out["grupos"] as Array).append(fraccion(p, float(m), 0))
	for r in fe.get("ko", []):
		(out["ko"] as Array).append(fraccion(p, float((r as Array)[(r as Array).size() - 1]), 0))
	return out



static var _memo_semanas: Dictionary = {}

























static func _semanas(comp: String, league_len: int, pais: String) -> Dictionary:
	var p: String = pais_de_calendario(comp, pais)
	var clave: String = "%s|%d|%s" % [comp, league_len, p]
	if _memo_semanas.has(clave):
		return _memo_semanas[clave]
	var dp: bool = CONFEDS_DP.has(confed_de(comp))
	var torneos: bool = _en_torneos(p, league_len)
	var fe: Dictionary = FECHAS.get(comp, {})
	var fracs: Array = []
	var metas: Array = []
	var offs: Array = []
	var meses: Array = []
	var pares: Array = []
	var dobla: Array = []


	var pegable: Array = []
	var forma: Array = []
	var pv: Array = fe.get("previa", [])
	for k in pv.size():
		fracs.append(fraccion(p, float(pv[k]), league_len))
		metas.append(tramo_real(p, float(pv[k]), league_len))
		offs.append(KO_OFF)
		meses.append(float(pv[k]))
		pares.append(k == 0 and pv.size() == 2)
		dobla.append(false)
		pegable.append(false)
		forma.append(["previa", 0])
	for m in fe.get("prelim", []):
		fracs.append(fraccion(p, float(m), league_len))
		metas.append(tramo_real(p, float(m), league_len))
		offs.append(KO_OFF)
		meses.append(float(m))
		pares.append(false)
		dobla.append(false)
		pegable.append(fracs.size() > 1)
		forma.append(["prelim", 0])
	var gr: Array = fe.get("grupos", [])
	for j in gr.size():
		fracs.append(fraccion(p, float(gr[j]), league_len))
		metas.append(tramo_real(p, float(gr[j]), league_len))
		offs.append(GRUPO_OFF)
		meses.append(float(gr[j]))
		pares.append(false)
		dobla.append(j > 0)
		pegable.append(j == 0)
		forma.append(["grupos", 0])
	var ko: Array = fe.get("ko", [])
	var juntas: Array = []
	juntas.resize(fracs.size())
	juntas.fill(false)
	var comparte: Array = fe.get("comparte", [])
	for i in ko.size():
		var ronda: Array = ko[i]
		for j in ronda.size():
			fracs.append(fraccion(p, float(ronda[j]), league_len))
			metas.append(tramo_real(p, float(ronda[j]), league_len))
			offs.append(KO_OFF)
			meses.append(float(ronda[j]))
			pares.append(j == 0 and ronda.size() == 2)
			dobla.append(false)
			pegable.append(j == 0 and i < ko.size() - 1)
			forma.append(["ko", i])
			juntas.append(j == 0 and comparte.has(i))
	var d: float = _delta(comp)
	var ws: Array = []
	if bool(fe.get("sede", false)):
		ws = _semanas_sede(fracs, offs, league_len, semanas_copa(p, league_len), p)
	elif dp:
		var ocupadas: Dictionary = semanas_copa(p, league_len, true)
		if torneos:
			for fl in Liguilla.FECHAS:
				ocupadas[floori(float(league_len) + float((fl as Array)[2]))] = true
		var ventanas: Array = []
		for i in fracs.size():
			ventanas.append(_ventana_mes(p, league_len, torneos, int(floor(float(meses[i]))),
				float(offs[i]), d))
		ws = _semanas_dp(fracs, offs, league_len, int(fe.get("por_semana", 1)), juntas,
			ocupadas, pares, ventanas, dobla)





	if ws.is_empty():
		ws = semanas_reales(fracs, offs, league_len, int(fe.get("por_semana", 1)),
			juntas, semanas_copa(p, league_len), metas, p, d, {}, dobla, pegable)
	var out: Dictionary = {"previa": [], "prelim": [], "grupos": [], "ko": []}
	for i in ko.size():
		(out["ko"] as Array).append([])
	for k in ws.size():
		var w: float = lejos_de_liga(float(ws[k])) + d
		if String(forma[k][0]) == "ko":
			((out["ko"] as Array)[int(forma[k][1])] as Array).append(w)
		else:
			(out[String(forma[k][0])] as Array).append(w)
	_memo_semanas[clave] = out
	return out



const CONFEDS_DP: Array[String] = ["CONMEBOL", "CONCACAF"]













const DP_TRAS_LIGA: int = 5000
const DP_VUELTA_LEJOS: int = 300
const DP_FUERA_DE_MES: int = 100
const DP_FUERA_POR_SEMANA: int = 25
const DP_DOBLE: int = 30
const _DP_INF: int = 1<<40






static func _ventana_mes(pais: String, league_len: int, torneos: bool, mes: int, off: float,
		delta: float) -> Vector2i:
	var mes_n: int = posmod(mes - 1, 12) + 1
	var lo: int = -1
	var hi: int = -1
	for k in league_len + 9:
		var w: float = semana_en_calendario(lejos_de_liga(float(k) + off) + delta, league_len,
			torneos)
		if CalendarioMundo.mes_de(w, league_len, pais) == mes_n:
			if lo < 0:
				lo = k
			hi = k
		elif lo >= 0:
			break
	return Vector2i(lo, hi)












static func _semanas_dp(fracs: Array, offs: Array, league_len: int, por_semana: int,
		juntas: Array, ocupadas: Dictionary, pares: Array, ventanas: Array,
		dobla: Array) -> Array:
	var n: int = fracs.size()
	if n == 0 or league_len < 1:
		return []
	var kmax: int = league_len + 8
	var ancho: int =(kmax + 1) * 2
	var costes: Array = []
	var padres: Array = []
	for i in n:
		var f: float = float(fracs[i])
		var v: Vector2i = ventanas[i]
		var k0: int = maxi(floori(f * float(league_len)), 0)
		if v.x >= 0:
			k0 = clampi(k0, v.x, v.y)
		var ida: bool = bool(pares[i])
		var vuelta: bool = i > 0 and bool(pares[i - 1])
		var tras_vuelta: bool = i > 1 and bool(pares[i - 2])
		var junta: bool = i < juntas.size() and bool(juntas[i])
		var tope: int = clampi(maxi(por_semana, 2 if junta else 1), 1, 2)
		var c_i: PackedInt64Array = PackedInt64Array()
		c_i.resize(ancho)
		c_i.fill(_DP_INF)
		var p_i: PackedInt32Array = PackedInt32Array()
		p_i.resize(ancho)
		p_i.fill(-1)
		var prev: PackedInt64Array = costes[i - 1] if i > 0 else PackedInt64Array()








		var mejor_k: int = _DP_INF
		var mejor_s: int = -1
		for c in kmax + 1:
			if i > 0 and c > 0:
				for cnt in 2:
					var pc: int = prev[(c - 1) * 2 + cnt]
					if pc >= _DP_INF:
						continue
					var clave_k: int = pc -(DP_VUELTA_LEJOS *(c - 1) if vuelta else 0)
					if clave_k < mejor_k:
						mejor_k = clave_k
						mejor_s =(c - 1) * 2 + cnt
			if ocupadas.has(c):
				continue
			var base: int = absi(c - k0)
			if v.x >= 0 and (c < v.x or c > v.y):
				base += DP_FUERA_DE_MES + DP_FUERA_POR_SEMANA *((v.x - c if c < v.x else c - v.y) - 1)
			if f < 1.0 and c > league_len - 1:
				base += DP_TRAS_LIGA
			if i == 0:
				c_i[c * 2] = base
				continue

			if mejor_s >= 0:
				c_i[c * 2] = mejor_k + base +(DP_VUELTA_LEJOS *(c - 1) if vuelta else 0)
				p_i[c * 2] = mejor_s

			if ida or vuelta or (tras_vuelta and not junta) or prev[c * 2] >= _DP_INF:
				continue
			var pen: int = 0 if tope >= 2 else (DP_DOBLE if i < dobla.size() and bool(dobla[i]) \
					else _DP_INF)
			if pen >= _DP_INF:
				continue
			var t2: int = prev[c * 2] + base + pen
			if t2 < c_i[c * 2 + 1]:
				c_i[c * 2 + 1] = t2
				p_i[c * 2 + 1] = c * 2
		costes.append(c_i)
		padres.append(p_i)
	var ultimo: PackedInt64Array = costes[n - 1]
	var mejor: int = -1
	for s in ancho:
		if ultimo[s] < _DP_INF and (mejor < 0 or ultimo[s] < ultimo[mejor]):
			mejor = s
	if mejor < 0:
		return []
	var estados: Array = []
	estados.resize(n)
	var s_i: int = mejor
	for i in range(n - 1, -1, -1):
		estados[i] = s_i
		s_i =(padres[i] as PackedInt32Array)[s_i]
	var out: Array = []
	for i in n:
		var k: int = int(estados[i]) / 2
		var doble_con_siguiente: bool = i + 1 < n and int(estados[i + 1]) % 2 == 1
		if int(estados[i]) % 2 == 1:
			out.append(float(k) + SEGUNDA_OFF)
		elif doble_con_siguiente:
			out.append(float(k) + PRIMERA_DOBLE)
		else:
			out.append(float(k) + float(offs[i]))
	return out








































































const PENA_MES: float = 100.0
const PENA_TRAS_LIGA: float = 60.0
const PENA_DOBLE: float = 6.0


const PENA_FIFA: float = 50.0

const PENA_PEGADA: float = 250.0
const PENA_FUERA_TEMPORADA: float = 150.0

const PENA_DECIMAL: float = 0.05
const _SIN: float = 1e+18


static func semanas_reales(fracs: Array, offs: Array, league_len: int,
		por_semana: int = 1, juntas: Array = [], ocupadas: Dictionary = {},
		metas: Array = [], pais_mes: String = "", lejos_delta: float = -1.0,
		evitar: Dictionary = {}, dobla: Array = [], pegable: Array = []) -> Array:
	var n: int = fracs.size()
	if n == 0:
		return []
	var L: int = maxi(league_len, 1)
	var ancho: int = L + 9 + n
	var dur: int = int(FormatoCopa.temporada(pais_mes)[1])



	var tramos: Dictionary = {}
	var decs: Array = offs.duplicate()
	decs.append_array([PRIMERA_DOBLE, SEGUNDA_OFF])
	for dec in decs:
		if tramos.has(dec):
			continue
		var t: PackedInt32Array = PackedInt32Array()
		t.resize(ancho)
		for k in ancho:
			var w: float = float(k) + float(dec)
			if lejos_delta >= 0.0:
				w = lejos_de_liga(w) + lejos_delta
			t[k] = CalendarioMundo.tramo_de(w, L, pais_mes)
		tramos[dec] = t
	var t_1a: PackedInt32Array = tramos[PRIMERA_DOBLE]
	var t_2a: PackedInt32Array = tramos[SEGUNDA_OFF]
	var c_sola: PackedFloat64Array = PackedFloat64Array()
	var d_sola: PackedFloat64Array = PackedFloat64Array()
	var c_1a: PackedFloat64Array = PackedFloat64Array()
	var c_2a: PackedFloat64Array = PackedFloat64Array()
	c_sola.resize(n * ancho)
	d_sola.resize(n * ancho)
	c_1a.resize(n * ancho)
	c_2a.resize(n * ancho)
	for i in n:
		var f: float = float(fracs[i])
		var meta: int = int(metas[i]) if i < metas.size() else -1
		var t_i: PackedInt32Array = tramos[offs[i]]
		for k in ancho:
			var x: int = i * ancho + k
			var fijo: float = _coste_semana(f, k, L, ocupadas)
			if evitar.has(k):
				fijo += PENA_FIFA
			var cs: float = fijo + _coste_mes(t_i[k], meta, dur)
			var c1: float = fijo + _coste_mes(t_1a[k], meta, dur)
			var c2: float = fijo + _coste_mes(t_2a[k], meta, dur)
			d_sola[x] = float(offs[i])
			if c1 + PENA_DECIMAL < cs:
				cs = c1 + PENA_DECIMAL
				d_sola[x] = PRIMERA_DOBLE
			if c2 + PENA_DECIMAL < cs:
				cs = c2 + PENA_DECIMAL
				d_sola[x] = SEGUNDA_OFF
			c_sola[x] = cs
			c_1a[x] = c1
			c_2a[x] = c2



	var sola: PackedFloat64Array = PackedFloat64Array()
	var doble: PackedFloat64Array = PackedFloat64Array()
	var antes: PackedFloat64Array = PackedFloat64Array()
	var de: PackedInt32Array = PackedInt32Array()
	sola.resize(n * ancho)
	doble.resize(n * ancho)
	antes.resize(n * ancho)
	de.resize(n * ancho)
	for i in n:


		var junta: bool = i < juntas.size() and bool(juntas[i])
		var pena_doble: float = _SIN
		if por_semana >= 2 or junta:
			pena_doble = 0.0
		elif i < dobla.size() and bool(dobla[i]):
			pena_doble = PENA_DOBLE
		elif i < pegable.size() and bool(pegable[i]):
			pena_doble = PENA_PEGADA
		for k in ancho:
			var x: int = i * ancho + k
			var a1: float = 0.0 if i == 0 else antes[x - ancho]
			sola[x] = _SIN if (a1 >= _SIN or c_sola[x] >= _SIN) else a1 + c_sola[x]
			doble[x] = _SIN
			if i >= 1 and pena_doble < _SIN:
				var a2: float = 0.0 if i == 1 else antes[x - 2 * ancho]
				var c: float = c_1a[x - ancho] + c_2a[x]
				if a2 < _SIN and c < _SIN:
					doble[x] = a2 + c + pena_doble
		var mejor: float = _SIN
		var arg: int = -1
		for k in ancho:
			var x: int = i * ancho + k
			antes[x] = mejor
			de[x] = arg
			if sola[x] < mejor:
				mejor = sola[x]
				arg = k * 2
			if doble[x] < mejor:
				mejor = doble[x]
				arg = k * 2 + 1
	var fin: float = _SIN
	var desde: int = -1
	for k in ancho:
		var x: int =(n - 1) * ancho + k
		if sola[x] < fin:
			fin = sola[x]
			desde = k * 2
		if doble[x] < fin:
			fin = doble[x]
			desde = k * 2 + 1
	if desde < 0:


		var out_p: Array = []
		var prev: float = - INF
		for i in n:
			var w: float = maxf(float(L) * float(fracs[i]) + float(offs[i]), prev + 0.06)
			out_p.append(w)
			prev = w
		return out_p
	var out: Array = []
	out.resize(n)
	var i_: int = n - 1
	var cod: int = desde
	while i_ >= 0:
		var k: int = cod / 2
		var sig: int
		if cod % 2 == 0:
			out[i_] = float(k) + d_sola[i_ * ancho + k]
			sig = i_ - 1
		else:
			out[i_] = float(k) + SEGUNDA_OFF
			out[i_ - 1] = float(k) + PRIMERA_DOBLE
			sig = i_ - 2
		if sig < 0:
			break
		cod = de[sig * ancho + k]
		i_ = sig
	return out





static func _coste_semana(f: float, k: int, L: int, ocupadas: Dictionary) -> float:
	if ocupadas.has(k):
		return _SIN
	var nat: int = maxi(floori(f * float(L)), 0)
	var c: float = absf(float(k - nat)) +(0.01 if k < nat else 0.0)
	if (f < 1.0 and k >= L) or (f >= 1.0 and k < L):
		c += PENA_TRAS_LIGA
	return c




static func _coste_mes(tramo: int, meta: int, dur: int) -> float:
	if meta < 0:
		return 0.0
	var c: float = PENA_MES * absf(float(tramo - meta))
	if tramo >= dur and meta < dur:
		c += PENA_FUERA_TEMPORADA
	return c







static func tramo_real(pais: String, mes: float, league_len: int) -> int:
	if Liguilla.aplica(pais, 1) and league_len >=(Liguilla.CLUBES_MIN - 1) * 2:
		return -1
	var dur: int = int(FormatoCopa.temporada(pais)[1])
	var off: float = FormatoCopa._off(pais, mes)
	if off < 0.0 or off >= float(dur):
		return -1
	return floori(off)

















const SEDE_CON_COPA: float = LEJOS_MIN

static func _semanas_sede(fracs: Array, offs: Array, league_len: int, ocupadas: Dictionary,
		pais: String) -> Array:
	var n: int = fracs.size()
	if n == 0:
		return []
	var semanas: int =(n + 1) / 2
	var k0: int = clampi(floori(float(fracs[0]) * float(league_len)), 0,
		maxi(league_len - semanas, 0))
	var base: Array = []
	for i in n:
		var k: int = k0 + i / 2
		if i % 2 == 0 and i == n - 1:
			base.append(float(k) + float(offs[i]))
		else:
			base.append(float(k) +(PRIMERA_DOBLE if i % 2 == 0 else SEGUNDA_OFF))
	if ocupadas.is_empty():
		return base
	for d in [0, -1, 1]:
		var vale: bool = true
		for w in base:
			var c: float = float(w) + float(d)
			if c < 0.0 or ocupadas.has(floori(c)) or CalendarioMundo.mes_de(c, league_len, pais) \
					!= CalendarioMundo.mes_de(float(w), league_len, pais):
				vale = false
				break
		if vale:
			return base.map(func(w: float) -> float: return w + float(d))









	var out: Array = []
	var k: int = k0
	var en_k: int = 0
	for i in n:
		var cabe: int = 1 if ocupadas.has(k) else 2
		if en_k >= cabe:
			k += 1
			en_k = 0
			cabe = 1 if ocupadas.has(k) else 2
		if cabe == 1:
			out.append(float(k) + SEDE_CON_COPA)
		elif en_k == 0 and i == n - 1:
			out.append(float(k) + float(offs[i]))
		else:
			out.append(float(k) +(PRIMERA_DOBLE if en_k == 0 else SEGUNDA_OFF))
		en_k += 1
	var mes0: int = CalendarioMundo.mes_de(float(base[0]), league_len, pais)
	var en_mes: Callable = func(ws: Array) -> int:
		return ws.filter(func(w: float) -> bool:
			return CalendarioMundo.mes_de(w, league_len, pais) == mes0).size()
	return out if int(en_mes.call(out)) >= int(en_mes.call(base)) else base
















static func semanas_copa(pais: String, league_len: int, desde_entrada: bool = false) -> Dictionary:
	var out: Dictionary = {}
	if pais.is_empty() or league_len < 1:
		return out
	var desde: int = _ronda_de_entrada(pais) if desde_entrada else -1
	var rondas: Array = CalendarioMundo.rondas_copa(pais) if desde > 0 else []
	for s in CalendarioMundo.agenda_copa(pais, league_len):
		var r: int = int((s as Dictionary)["r"])
		if desde > 0 and r < rondas.size() \
				and int((rondas[r] as Dictionary).get("i", desde)) < desde:
			continue
		out[floori(float((s as Dictionary)["week"]))] = true
	return out




static func _ronda_de_entrada(pais: String) -> int:
	var crudas: Array = FormatoCopa.rondas_reales(pais, FormatoCopa.COPA)
	for i in crudas.size():
		for spec in (crudas[i] as Dictionary).get("e", []):
			if int(spec[0]) == 1 and (spec.size() < 2 or int(spec[1]) <= 1):
				return i
	return 0









static func lejos_de_liga(w: float) -> float:
	var base: float = floorf(w)
	return base + clampf(w - base, LEJOS_MIN, LEJOS_MAX)












static func semana_en_calendario(w: float, league_len: int, torneos: bool) -> float:
	if torneos and w > float(league_len / 2):
		return w + Liguilla.SEMANAS
	return w


static func _delta(comp: String) -> float:
	return float(info(comp).get("delta", 0.0))

























static func clasificar_conmebol(orden: Dictionary, extra: Dictionary) -> Dictionary:
	var tomado: Dictionary = {}
	var lib_grupos: Array[String] = []
	var lib_previa: Array[String] = []
	var sud_grupos: Array[String] = []
	var preliminar: Dictionary = {}
	var copa: Dictionary = extra.get("copa", {}) if extra.get("copa", {}) is Dictionary else {}

	for pais in PAISES_CONMEBOL:
		var tabla: Array = _tabla(orden, pais)
		var cupo: Dictionary = CUPOS[pais]
		var n: int = int(cupo["lib"])
		var campeon_copa: String = String(copa.get(pais, "")) if bool(cupo["copa_en_lib"]) else ""
		if not campeon_copa.is_empty() and tabla.find(campeon_copa) >= n:
			_toma_siguientes(tabla, n - 1, tomado, lib_grupos)
			_toma(campeon_copa, tomado, lib_grupos)
		else:
			_toma_siguientes(tabla, n, tomado, lib_grupos)

	for clave in ["lib_campeon", "sud_campeon"]:
		var c: Dictionary = extra.get(clave, {}) if extra.get(clave, {}) is Dictionary else {}
		var id: String = String(c.get("id", ""))
		var pais: String = String(c.get("pais", ""))
		var tabla: Array = _tabla(orden, pais) if CUPOS.has(pais) and PAISES_CONMEBOL.has(pais) else []
		if not id.is_empty() and not tabla.is_empty():
			if tabla.has(id) and not tomado.has(id):
				_toma(id, tomado, lib_grupos)
				continue

			if _toma_siguientes(tabla, 1, tomado, lib_grupos) == 1:
				continue

		for p in RELLENO:
			if _toma_siguientes(_tabla(orden, p), 1, tomado, lib_grupos) == 1:
				break

	for pais in PAISES_CONMEBOL:
		_toma_siguientes(_tabla(orden, pais), int(CUPOS[pais]["previa"]), tomado, lib_previa)

	for pais in PAISES_CONMEBOL:
		_toma_siguientes(_tabla(orden, pais), int(CUPOS[pais]["sud"]), tomado, sud_grupos)

	for pais in PAISES_CONMEBOL:
		var k: int = int(CUPOS[pais]["prelim"])
		if k <= 0:
			continue
		var pre: Array[String] = []
		_toma_siguientes(_tabla(orden, pais), k, tomado, pre)
		preliminar[pais] = pre
	return {"lib": {"grupos": lib_grupos, "previa": lib_previa},
		"sud": {"grupos": sud_grupos, "preliminar": preliminar}}




















static func clasificar_concacaf(orden: Dictionary, extra: Dictionary) -> Dictionary:
	var tomado: Dictionary = {}
	var mex: Array[String] = []
	var usa: Array[String] = []
	var tabla_mex: Array = _tabla(orden, "México")
	var lig_all: Dictionary = extra.get("liguilla", {}) if extra.get("liguilla", {}) is Dictionary else {}
	var lig: Dictionary = lig_all.get("México", {}) if lig_all.get("México", {}) is Dictionary else {}
	if lig.has("winner") or lig.has("runner_up"):
		lig = {"clausura": lig}
	for plaza in LIGUILLA_PLAZAS:
		var torneo: Variant = lig.get(String(plaza[0]), {})
		if not (torneo is Dictionary):
			continue
		var id: String = String((torneo as Dictionary).get(String(plaza[1]), ""))
		if not id.is_empty() and tabla_mex.has(id):
			_toma(id, tomado, mex)
	_toma_siguientes(tabla_mex, int(CUPOS["México"]["cca"]) - mex.size(), tomado, mex)
	var tabla_usa: Array = _tabla(orden, "Estados Unidos")
	var copa: Dictionary = extra.get("copa", {}) if extra.get("copa", {}) is Dictionary else {}
	_toma_siguientes(tabla_usa, 1, tomado, usa)
	var campeon_copa: String = String(copa.get("Estados Unidos", ""))
	if not campeon_copa.is_empty() and tabla_usa.has(campeon_copa):
		_toma(campeon_copa, tomado, usa)
	_toma_siguientes(tabla_usa, int(CUPOS["Estados Unidos"]["cca"]) - usa.size(), tomado, usa)
	var cuadro: Array[String] = []
	cuadro.append_array(mex)
	cuadro.append_array(usa)
	return {"cca": {"cuadro": cuadro}}



static func _tabla(orden: Dictionary, pais: String) -> Array:
	var t: Variant = orden.get(pais, [])
	return t if t is Array else []



static func _toma(id: String, tomado: Dictionary, dst: Array) -> bool:
	if id.is_empty() or tomado.has(id):
		return false
	tomado[id] = true
	dst.append(id)
	return true




static func _toma_siguientes(tabla: Array, n: int, tomado: Dictionary, dst: Array) -> int:
	var hechos: int = 0
	for e in tabla:
		if hechos >= n:
			break
		if _toma(String(e), tomado, dst):
			hechos += 1
	return hechos












static func clasificar_afc(orden: Dictionary) -> Dictionary:
	return _clasificar_por_puesto(orden, PAISES_AFC, ["ace", "ac2"])







static func clasificar_caf(orden: Dictionary, extra: Dictionary = {}) -> Dictionary:
	var copa: Dictionary = extra.get("copa", {}) if extra.get("copa", {}) is Dictionary else {}
	return _clasificar_por_puesto(orden, PAISES_CAF, ["caf", "cf2"], true, {"cf2": copa})













static func clasificar_ofc(orden: Dictionary) -> Dictionary:
	var res: Dictionary = _clasificar_por_puesto(orden, PAISES_OFC, ["ofc"], false)
	var cuadro: Array[String] = []
	cuadro.assign((res["ofc"] as Dictionary)["cuadro"])
	res["ofc"] = {"cuadro": cuadro, "grupos": _sorteo_ofc(orden, cuadro)}
	return res
















static func _sorteo_ofc(orden: Dictionary, cuadro: Array[String]) -> Array:
	if cuadro.size() < 4:
		return []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(",".join(PackedStringArray(cuadro)))


	var camp: Dictionary = {}
	var sub: Dictionary = {}
	for p in PAISES_OFC:
		var dentro: Array = []
		for id in _tabla(orden, p):
			if cuadro.has(String(id)):
				dentro.append(String(id))
		camp[p] = String(dentro[0]) if dentro.size() > 0 else ""
		sub[p] = String(dentro[1]) if dentro.size() > 1 else ""


	var p4: Array = PAISES_OFC.duplicate()
	for i in range(p4.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var t: Variant = p4[i]
		p4[i] = p4[j]
		p4[j] = t
	var a: Array[String] = [String(camp[p4[0]]), String(camp[p4[1]]),
		String(sub[p4[2]]), String(sub[p4[3]])]
	var b: Array[String] = [String(camp[p4[2]]), String(camp[p4[3]]),
		String(sub[p4[0]]), String(sub[p4[1]])]
	if not a.has("") and not b.has(""):
		return [a, b]






	var plano: Array = [a[0], a[1], b[0], b[1], a[2], a[3], b[2], b[3]]
	var pais_de: Dictionary = {}
	for p in PAISES_OFC:
		for id in [camp[p], sub[p]]:
			if not String(id).is_empty():
				pais_de[String(id)] = p
	var gA: Array = a.filter(func(s: String) -> bool: return not s.is_empty())
	var gB: Array = b.filter(func(s: String) -> bool: return not s.is_empty())
	while absi(gA.size() - gB.size()) >= 2:
		var largo: Array = gA if gA.size() > gB.size() else gB
		var corto: Array = gB if gA.size() > gB.size() else gA
		var paises_corto: Array = corto.map(func(s: String) -> String: return String(pais_de.get(s, "")))
		var mover: String = ""
		for k in range(plano.size() - 1, -1, -1):
			var id: String = String(plano[k])
			if largo.has(id) and not paises_corto.has(String(pais_de.get(id, ""))):
				mover = id
				break
		if mover.is_empty():
			break
		largo.erase(mover)
		corto.append(mover)
	var out: Array = []
	for g in [gA, gB]:

		var en_orden: Array[String] = []
		for id in plano:
			if (g as Array).has(String(id)) and not String(id).is_empty():
				en_orden.append(String(id))
		out.append(en_orden)
	return out






static func _clasificar_por_puesto(orden: Dictionary, paises: Array[String],
		comps: Array, vecinos: bool = true, primero: Dictionary = {}) -> Dictionary:
	var tomado: Dictionary = {}
	var res: Dictionary = {}
	for comp in comps:
		var por_pais: Dictionary = {}
		var tope: int = 0
		for p in paises:
			var lista: Array = []
			var fijo: String = String((primero.get(comp, {}) as Dictionary).get(p, ""))
			if not fijo.is_empty() and _tabla(orden, p).has(fijo):
				_toma(fijo, tomado, lista)
			_toma_siguientes(_tabla(orden, p), int(CUPOS[p][comp]) - lista.size(), tomado, lista)
			por_pais[p] = lista
			tope = maxi(tope, lista.size())
		var cuadro: Array[String] = []
		var pais_de: Dictionary = {}
		for r in tope:
			for p in paises:
				var lista: Array = por_pais[p]
				if r < lista.size():
					cuadro.append(String(lista[r]))
					pais_de[String(lista[r])] = p
		res[comp] = {"cuadro": _sin_vecinos(cuadro, pais_de) if vecinos else cuadro}
	return res






static func _sin_vecinos(cuadro: Array[String], pais_de: Dictionary) -> Array[String]:
	var n: int = cuadro.size()
	if n < 4 or n % 2 != 0:
		return cuadro
	@warning_ignore("integer_division")
	var half: int = n / 2
	var abajo: Array = []
	for i in half:
		abajo.append(cuadro[n - 1 - i])
	var rivales: Array = []
	for i in half:
		var cabeza_pais: String = String(pais_de.get(cuadro[i], ""))
		var k: int = 0
		while k < abajo.size() and String(pais_de.get(abajo[k], "")) == cabeza_pais:
			k += 1
		if k >= abajo.size():
			k = 0
		rivales.append(abajo[k])
		abajo.remove_at(k)
	var out: Array[String] = []
	for i in half:
		out.append(cuadro[i])
	for i in half:
		out.append(String(rivales[half - 1 - i]))
	return out
















static func franjas(country: String, vista: String = "auto") -> Array:
	if PAISES_CONMEBOL.has(country):
		var c: Dictionary = CUPOS[country]
		var out: Array = [[int(c["lib"]), "lib"], [int(c["previa"]), "previa"]]
		var sud: int = int(c["sud"]) + int(c["prelim"])
		if sud > 0:
			out.append([sud, "sud"])
		return out
	if country == "Estados Unidos":
		return [[int(CUPOS[country]["cca"]) - 1, "cca"]]
	if country == "México" and vista == "anual":
		return [[int(CUPOS[country]["cca"]) - LIGUILLA_PLAZAS.size(), "cca"]]
	if PAISES_AFC.has(country):
		return [[int(CUPOS[country]["ace"]), "ace"], [int(CUPOS[country]["ac2"]), "ac2"]]
	if PAISES_CAF.has(country):


		return [[int(CUPOS[country]["caf"]), "caf"], [int(CUPOS[country]["cf2"]) - 1, "cf2"]]
	if PAISES_OFC.has(country):

		return [[int(CUPOS[country]["ofc"]), "ofc"]]
	return []


static func umbral(comp: String) -> Dictionary:
	return (info(comp).get("umbral", {}) as Dictionary).duplicate()




static func trofeo_puntos(award: String) -> int:
	for c in COPAS:
		if String(COPAS[c]["titulo"]) == award:
			return int(COPAS[c]["puntos"])
	for c in EUROPEAS:
		if String(EUROPEAS[c]["titulo"]) == award:
			return int(EUROPEAS[c]["puntos"])
	return 0
