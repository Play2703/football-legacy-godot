class_name Supercopas
extends RefCounted



const COMPS: Array[String] = ["recopa", "intercont", "supereuropa", "superafrica"]



const RECOPA: String = "Campeón de la Recopa"
const INTERCONT: String = "Campeón Intercontinental"
const SUPEREUROPA: String = "Campeón de la Supercopa de Europa"
const SUPERAFRICA: String = "Campeón de la Supercopa de África"



const RECOPA_ETIQUETA: String = "RECOPA DEL SUR"
const INTERCONT_ETIQUETA: String = "COPA INTERCONTINENTAL"


const SUPEREUROPA_ETIQUETA: String = "SUPERCOPA DE EUROPA"

const SUPERAFRICA_ETIQUETA: String = "SUPERCOPA DE ÁFRICA"







const RONDAS: Array = [
	["derbi", "DERBI DE LAS AMÉRICAS"],
	["playoff", "PLAY-OFF ASIA-PACÍFICO"],
	["afroasia", "COPA AFROASIÁTICA"],
	["challenger", "COPA CHALLENGER"],
	["Final", "FINAL"],
]




const RECOPA_DESDE: float = 1.3







const RECOPA_MES: int = 2
const RECOPA_DENTRO: float = 0.64
const RECOPA_SEP_MAX: float = 1.3












const INTERCONT_SEP_FIFA: float = 0.0
const INTERCONT_SEPTIEMBRE: Array = ["playoff", "afroasia"]
const INTERCONT_MES_SEPT: int = 9
const INTERCONT_DENTRO_SEPT: float = 0.4
const INTERCONT_MES_DIC: int = 12
const INTERCONT_DENTRO_DIC: float = 0.25











const INTERCONT_SEDE_TRAS_LIGA: Array = [0.2, 0.45, 0.6]
const INTERCONT_SEDE_EN_LIGA: Array = [0.3, 0.35, 0.6]


const INTERCONT_DESDE_SIN_MES: float = 0.3






const SUPEREUROPA_DESDE: float = 0.5





const SUPERAFRICA_MES: int = 9
const SUPERAFRICA_DENTRO: float = 0.75



const SEP_PROPIA: float = 1.0



const SEP_AJENA: float = 0.3
const SEP_FIFA: float = 1.0


static func es_supercopa(comp: String) -> bool:
	return COMPS.has(comp)



static func marca(comp: String) -> String:
	match comp:
		"recopa": return "recopa"
		"intercont": return "intercontinental"
		"supereuropa": return "supereuropa"
		"superafrica": return "superafrica"
	return ""


static func titulo(comp: String) -> String:
	match comp:
		"recopa", "recopa_sud": return RECOPA
		"intercont", "intercontinental": return INTERCONT
		"supereuropa": return SUPEREUROPA
		"superafrica": return SUPERAFRICA
	return ""






static func ronda_nombre(round_id: String, abre: String = "AFC") -> String:
	if round_id == "playoff" and abre == "CAF":
		return "PLAYOFF"
	for r in RONDAS:
		if String(r[0]) == round_id:
			return String(r[1])
	return ""









static func tie_rule(comp: String, _round_id: String) -> String:
	match comp:
		"supereuropa", "superafrica":
			return "penales"
		"recopa", "intercont":
			return "prorroga"
	return ""




static func recopa_cruce(lib: String, sud: String) -> Array:
	if lib.is_empty() or sud.is_empty() or lib == sud:
		return []
	return [lib, sud]





static func supereuropa_cruce(ucl: String, eul: String) -> Array:
	if ucl.is_empty() or eul.is_empty() or ucl == eul:
		return []
	return [ucl, eul]




static func superafrica_cruce(caf: String, cf2: String) -> Array:
	return supereuropa_cruce(caf, cf2)











static func intercont_cuadro(c: Dictionary, season: int, ganadores: Dictionary = {}) -> Dictionary:
	var out: Dictionary = {}
	out["derbi"] = _cruce(String(c.get("CONMEBOL", "")), String(c.get("CONCACAF", "")),
		season, "derbi", ganadores)




	var abre: String = intercont_abre(c, season)
	var espera: String = "CAF" if abre == "AFC" else "AFC"
	out["playoff"] = _cruce(String(c.get(abre, "")), String(c.get("OFC", "")),
		season, "playoff", ganadores)
	out["afroasia"] = _cruce(String(out["playoff"]["winner"]), String(c.get(espera, "")),
		season, "afroasia", ganadores)
	out["challenger"] = _cruce(String(out["derbi"]["winner"]),
		String(out["afroasia"]["winner"]), season, "challenger", ganadores)
	out["Final"] = _cruce(String(c.get("UEFA", "")), String(out["challenger"]["winner"]),
		season, "Final", ganadores)
	return out













const INTERCONT_EDICION_T0: int = 2025


static func intercont_abre_playoff(season: int) -> String:
	return "AFC" if (INTERCONT_EDICION_T0 + season) % 2 == 0 else "CAF"





static func intercont_abre(c: Dictionary, season: int) -> String:
	var abre: String = String(c.get("abre", ""))
	return abre if abre in ["AFC", "CAF"] else intercont_abre_playoff(season)











static func semana_del_mes(mes: int, dentro: float, league_len: int, pais: String) -> float:
	var n: int = maxi(league_len, 1)
	var ini: float = -1.0
	var fin: float = -1.0
	var w: float = 0.05
	var tope: float = float(n) * 2.0 + 20.0
	while w <= tope:
		if CalendarioMundo.mes_de(w, n, pais) == mes:
			if ini < 0.0:
				ini = w
			fin = w
		elif ini >= 0.0:
			break
		w += 0.05
	if ini < 0.0:
		return -1.0
	var largo: float = minf(fin + 0.05 - ini, float(n) / 8.0 + 0.5)
	return ini + clampf(dentro, 0.0, 0.95) * largo






static func par_en_mes(ocupadas: Array, fifa: Array, mes: int, dentro: float, league_len: int,
		pais: String, sep_max: float, sep_fifa: float = SEP_FIFA) -> Array:
	var ini: float = semana_del_mes(mes, 0.0, league_len, pais)
	if ini < 0.0:
		return []
	var meta: float = semana_del_mes(mes, dentro, league_len, pais)
	var mejor: Array = []
	var w: float = ini
	var tope: float = ini + float(maxi(league_len, 1)) / 8.0 + 1.5
	while w <= tope:
		var par: Array = hueco(ocupadas, fifa, w, 2, SEP_PROPIA, sep_fifa)
		var a: float = float(par[0])
		var b: float = float(par[1])
		if CalendarioMundo.mes_de(a, league_len, pais) == mes \
				and CalendarioMundo.mes_de(b, league_len, pais) == mes \
				and b - a <= sep_max + 0.001 \
				and (mejor.is_empty() or absf(a - meta) < absf(float(mejor[0]) - meta)):
			mejor = [a, b]
		w = maxf(w + 0.05, a + 0.05) if a > w else w + 0.05
	return mejor


static func _cruce(a: String, b: String, season: int, ronda: String,
		ganadores: Dictionary) -> Dictionary:
	var w: String = ""
	if ganadores.has(ronda):
		w = String(ganadores[ronda])
	elif a.is_empty() or b.is_empty():
		w = b if a.is_empty() else a
	else:
		w = SimLeague.partido_unico(a, b, season, "intercont|" + ronda)
	return {"a": a, "b": b, "winner": w}






static func intercont_cuadro_de(c: Dictionary, season: int, club: String) -> Dictionary:
	var g: Dictionary = {}
	var cuadro: Dictionary = intercont_cuadro(c, season, g)
	for r in RONDAS:
		var id: String = String(r[0])
		var t: Dictionary = cuadro[id]
		if not club.is_empty() and (String(t["a"]) == club or String(t["b"]) == club):
			g[id] = club
			cuadro = intercont_cuadro(c, season, g)
	return cuadro






static func intercont_camino(cuadro: Dictionary, club: String) -> Array:
	var out: Array = []
	if club.is_empty():
		return out
	for r in RONDAS:
		var id: String = String(r[0])
		var t: Dictionary = cuadro.get(id, {})
		var a: String = String(t.get("a", ""))
		var b: String = String(t.get("b", ""))
		if a != club and b != club:
			continue
		var opp: String = b if a == club else a
		if not opp.is_empty():
			out.append({"round": id, "opp": opp})
	return out












static func hueco(ocupadas: Array, fifa: Array, desde: float, n: int, sep: float,
		sep_fifa: float = SEP_FIFA) -> Array:
	var out: Array = []
	var tope: float = desde
	for w0 in ocupadas:
		tope = maxf(tope, float(w0))
	var w: float = desde
	while out.size() < n and w <= tope + 0.5:
		var libre: bool = absf(w - roundf(w)) > 0.01
		if libre and not out.is_empty() and w - float(out[out.size() - 1]) < sep:
			libre = false
		if libre:
			for o in ocupadas:
				if absf(float(o) - w) < SEP_AJENA:
					libre = false
					break
		if libre:
			for o in fifa:
				if absf(float(o) - w) < sep_fifa or floori(float(o)) == floori(w):
					libre = false
					break
		if libre:
			out.append(snappedf(w, 0.01))
		w += 0.05


	var cola: float = tope + 0.5
	if not out.is_empty():
		cola = maxf(cola, float(out[out.size() - 1]) + sep)
	if absf(cola - roundf(cola)) <= 0.01:
		cola += 0.5
	while out.size() < n:
		out.append(cola)
		cola += maxf(sep, 1.0)
	return out
