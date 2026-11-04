class_name AccesoUefa
extends RefCounted







































const COMPS: Array = ["ucl", "uel", "uecl"]

const RONDAS: Array = ["LP", "PO", "Q3", "Q2", "Q1"]

const SUSPENDIDAS: Array = ["Rusia"]

const SIN_LIGA: Array = ["Liechtenstein"]






const LISTA: Dictionary = {
	"ucl": [
		["LP", "", "1", 1, 10], ["LP", "", "2", 1, 6], ["LP", "", "3", 1, 5], ["LP", "", "4", 1, 4],
		["PO", "campeones", "1", 11, 14],
		["Q3", "liga", "2", 7, 9], ["Q3", "liga", "3", 6, 6], ["Q3", "liga", "4", 5, 5],
		["Q2", "campeones", "1", 15, 22], ["Q2", "liga", "2", 10, 15],
		["Q1", "campeones", "1", 23, 55],
	],
	"uel": [
		["LP", "", "copa", 1, 7], ["LP", "", "5", 1, 5], ["PO", "", "copa", 8, 12],
		["Q3", "principal", "copa", 13, 15], ["Q2", "principal", "4", 6, 6], ["Q2", "principal", "3", 7, 12],
		["Q1", "principal", "copa", 16, 33],
	],
	"uecl": [
		["PO", "principal", "6", 1, 5], ["Q2", "principal", "copa", 34, 38], ["Q2", "principal", "2", 16, 33],
		["Q2", "principal", "3", 13, 29], ["Q2", "principal", "4", 7, 15], ["Q2", "principal", "5", 6, 6],
		["Q1", "principal", "copa", 39, 55], ["Q1", "principal", "2", 34, 55], ["Q1", "principal", "3", 30, 50],
	],
}



const UCL_LP_CAMPEONES: int = 10
const UCL_LP_LIGA: int = 15

const UCL_PO_CH_DIRECTOS: int = 4
const UCL_Q2_CH: int = 24

const UCL_Q3_LIGA: int = 8


const UEL_LP_DIRECTOS: int = 13
const UEL_PO_DIRECTOS: int = 5
const UEL_Q3_DIRECTOS: int = 3
const UEL_Q3_PRINCIPAL: int = 14

const UECL_PO_PRINCIPAL: int = 38
const UECL_Q3_CH: int = 8



const DESTINO: Dictionary = {
	"ucl Q1 campeones": ["uecl", "Q2", "campeones"],
	"ucl Q2 campeones": ["uel", "Q3", "campeones"],
	"ucl Q2 liga": ["uel", "Q3", "principal"],
	"ucl Q3 campeones": ["uel", "PO", ""],
	"ucl Q3 liga": ["uel", "LP", ""],
	"ucl PO campeones": ["uel", "LP", ""],
	"ucl PO liga": ["uel", "LP", ""],
	"uel Q1 principal": ["uecl", "Q2", "principal"],
	"uel Q2 principal": ["uecl", "Q3", "principal"],
	"uel Q3 campeones": ["uecl", "PO", "campeones"],
	"uel Q3 principal": ["uecl", "PO", "principal"],
	"uel PO ": ["uecl", "LP", ""],
}

const VIAS: Dictionary = {
	"ucl": {"Q1": ["campeones"], "Q2": ["campeones", "liga"], "Q3": ["campeones", "liga"], "PO": ["campeones", "liga"], "LP": [""]},
	"uel": {"Q1": ["principal"], "Q2": ["principal"], "Q3": ["campeones", "principal"], "PO": [""], "LP": [""]},
	"uecl": {"Q1": ["principal"], "Q2": ["campeones", "principal"], "Q3": ["campeones", "principal"], "PO": ["campeones", "principal"], "LP": [""]},
}



const VETOS_POLITICOS: Array = [
	["Armenia", "Azerbaiyán"], ["Gibraltar", "España"], ["Kosovo", "Bosnia y Herzegovina"],
	["Kosovo", "Serbia"], ["Kosovo", "Rusia"], ["Ucrania", "Rusia"], ["Ucrania", "Bielorrusia"],
]



const FECHAS_2026: Dictionary = {
	"ucl": {
		"Q1": {"sorteo": "06-16", "ida": ["07-07", "07-08"], "vuelta": ["07-14", "07-15"]},
		"Q2": {"sorteo": "06-17", "ida": ["07-21", "07-22"], "vuelta": ["07-28", "07-29"]},
		"Q3": {"sorteo": "07-20", "ida": ["08-04", "08-05"], "vuelta": ["08-11"]},
		"PO": {"sorteo": "08-03", "ida": ["08-18", "08-19"], "vuelta": ["08-25", "08-26"]},
		"LP": {"sorteo": "08-27"},
	},
	"uel": {
		"Q1": {"sorteo": "06-16", "ida": ["07-09"], "vuelta": ["07-16"]},
		"Q2": {"sorteo": "06-17", "ida": ["07-23"], "vuelta": ["07-30"]},
		"Q3": {"sorteo": "07-20", "ida": ["08-06"], "vuelta": ["08-13"]},
		"PO": {"sorteo": "08-03", "ida": ["08-20"], "vuelta": ["08-27"]},
		"LP": {"sorteo": "08-28"},
	},
	"uecl": {
		"Q1": {"sorteo": "06-16", "ida": ["07-09"], "vuelta": ["07-16"]},
		"Q2": {"sorteo": "06-17", "ida": ["07-23"], "vuelta": ["07-30"]},
		"Q3": {"sorteo": "07-20", "ida": ["08-06"], "vuelta": ["08-13"]},
		"PO": {"sorteo": "08-03", "ida": ["08-20"], "vuelta": ["08-27"]},
		"LP": {"sorteo": "08-28"},
	},
}

var _anio: int = 0
var _extra: Dictionary = {}
var _rk: Array = []
var _pos: Dictionary = {}
var _ligas: Dictionary = {}
var _copas: Dictionary = {}
var _copa_liga: Dictionary = {}
var _poseedores: Dictionary = {}
var _coef: Dictionary = {}

var _coef_fijo: bool = false
var _excl: Dictionary = {}
var _asoc_de: Dictionary = {}
var _plazas: Array = []
var _log: Array = []


var _sig: int = 0




















static func entradas(anio: int, cfg: Dictionary) -> Dictionary:
	var m: AccesoUefa = AccesoUefa.new()
	return m._corre(anio, cfg)




static func eps(anio: int, extra: Dictionary = {}) -> Array:
	var rk: Array = []
	for f in CoefUefa.ranking_para(anio, extra):
		if not SUSPENDIDAS.has(f["asoc"]):
			rk.append({"asoc": f["asoc"], "mil": CoefUefa._mil(CoefUefa.asoc_temporada(f["asoc"], anio - 1, extra)), "pos": f["pos"]})
	rk.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return a["mil"] > b["mil"] if a["mil"] != b["mil"] else a["pos"] < b["pos"])
	return [rk[0]["asoc"], rk[1]["asoc"]]





static func plazas_de_puesto(pos: int) -> Dictionary:
	var out: Dictionary = {}
	for comp in COMPS:
		var l: Array = []
		for r in LISTA[comp]:
			if pos >= int(r[3]) and pos <= int(r[4]):
				l.append([String(r[0]), String(r[2])])
		out[comp] = l
	return out



static func destino_perdedor(comp: String, ronda: String, via: String) -> Array:
	return DESTINO.get("%s %s %s" % [comp, ronda, _via_de(comp, ronda, via)], [])



static func choque_vetado(a: String, b: String) -> bool:
	for v in VETOS_POLITICOS:
		if (v[0] == a and v[1] == b) or (v[0] == b and v[1] == a):
			return true
	return false






static func cascada(clubes: Array) -> Dictionary:
	var n: Dictionary = {}
	for x in clubes:
		var k: String = "%s %s %s" % [x["comp"], x["ronda"], _via_de(x["comp"], x["ronda"], x["via"])]
		n[k] = int(n.get(k, 0)) + 1
	var total: Dictionary = {}
	var cuentas: Dictionary = {}
	var byes: int = 0
	var errores: Array = []
	for comp in COMPS:
		cuentas[comp] = {}
		for ronda in ["Q1", "Q2", "Q3", "PO", "LP"]:
			for via in VIAS[comp][ronda]:
				var k: String = "%s %s %s" % [comp, ronda, via]
				var t: int = int(n.get(k, 0))
				if ronda != "Q1":
					var prev: String = RONDAS[RONDAS.find(ronda) + 1]
					for pv in VIAS[comp][prev]:
						if _via_de(comp, ronda, pv) == via:
							t += int(total.get("%s %s %s" % [comp, prev, pv], 0)) / 2
				for kp in DESTINO:
					var d: Array = DESTINO[kp]
					if d[0] == comp and d[1] == ronda and d[2] == via:
						t += int(total.get(kp, 0)) / 2
				if k == "uecl Q2 campeones":
					byes = maxi(0, UECL_Q3_CH * 2 - t)
					t -= byes
				elif k == "uecl Q3 campeones":
					t += byes
				total[k] = t
				if t > 0:
					var por_ronda: Dictionary =(cuentas[comp] as Dictionary).get_or_add(ronda, {})
					por_ronda[via] = t
				if t % 2 == 1 and ronda != "LP":
					errores.append("%s impar (%d)" % [k, t])
		if int(total.get("%s LP " % comp, 0)) != 36:
			errores.append("%s: la fase de liga sale con %d" % [comp, int(total.get("%s LP " % comp, 0))])
	return {"cuentas": cuentas, "byes_uecl": byes, "errores": errores}




func _corre(anio: int, cfg: Dictionary) -> Dictionary:
	_anio = anio
	_extra = cfg.get("extra", {})
	_rk =(cfg.get("ranking", []) as Array).duplicate()
	if _rk.is_empty():
		for f in CoefUefa.ranking_para(anio, _extra):
			_rk.append(f["asoc"])
	for i in _rk.size():
		_pos[_rk[i]] = i + 1
	_ligas = cfg.get("ligas", {})
	_copas = cfg.get("copas", {})
	_copa_liga = cfg.get("copa_liga", {})
	_poseedores = cfg.get("poseedores", {})
	_coef_fijo = cfg.has("coef")
	_coef =(cfg.get("coef", {}) as Dictionary).duplicate()
	for id in cfg.get("excluidos", []):
		_excl[id] = true
	for a in _ligas:
		for c in _ligas[a]:
			_asoc_de[c] = a
	for fuente in [_copas, _copa_liga]:
		for a in fuente:
			if not _asoc_de.has(fuente[a]):
				_asoc_de[fuente[a]] = a
	var eps_l: Array = cfg["eps"] if cfg.has("eps") else eps(anio, _extra)

	_construye(cfg.get("plazas_perdidas", []))
	_cuadra_ucl("rango")
	_poseedor_ucl_uel("ucl")
	_poseedor_ucl_uel("uel")
	_eps(eps_l)
	_poseedor_uecl()
	_cuadra_uel()
	_cuadra_uecl()
	_rellena()

	var clubes: Array = []
	var errores: Array = []
	var orden: Array = _plazas.duplicate()
	orden.sort_custom(_por_fuerza_y_rango)
	for p in orden:
		if p["club"] == "":
			errores.append("%s no tiene club para su plaza de %s %s" % [p["asoc"], p["comp"], p["ronda"]])
			continue
		clubes.append({"id": p["club"], "asoc": p["asoc"], "comp": p["comp"], "ronda": p["ronda"],
			"via": _via_de(p["comp"], p["ronda"], p["via"]), "tipo": p["tipo"]})
	var c: Dictionary = cascada(clubes)
	errores.append_array(c["errores"])
	return {"clubes": clubes, "cuentas": c["cuentas"], "byes_uecl": c["byes_uecl"], "log": _log, "errores": errores}



static func _via_de(comp: String, ronda: String, via: String) -> String:
	if ronda == "LP" or (comp == "uel" and ronda == "PO"):
		return ""
	return via


func _nueva(asoc: String, comp: String, ronda: String, via: String, plaza: String) -> Dictionary:
	var tipo: String = "liga"
	var n: int = 0
	if plaza == "copa" or plaza in ["eps", "poseedor_ucl", "poseedor_uel", "poseedor_uecl"]:
		tipo = plaza
	else:
		n = int(plaza)
		if comp == "ucl" and n == 1:
			tipo = "campeon"
		elif comp == "uecl" and asoc == "Inglaterra" and n == 6:
			tipo = "copa_liga"
	_sig += 1
	var p: Dictionary = {"asoc": asoc, "comp": comp, "ronda": ronda, "via": via, "tipo": tipo, "n": n,
		"club": "", "fijo": "", "k": _sig}
	_plazas.append(p)
	return p


func _construye(perdidas: Array) -> void:
	for comp in COMPS:
		for f in LISTA[comp]:
			for r in range(int(f[3]), int(f[4]) + 1):
				if r > _rk.size():
					continue
				var asoc: String = _rk[r - 1]
				if SIN_LIGA.has(asoc) and f[2] != "copa":
					continue
				_nueva(asoc, comp, f[0], f[1], f[2])
	for asoc in SUSPENDIDAS:
		var fuera: Array = _de("", "", "", asoc)
		if not fuera.is_empty():
			_log.append("%s suspendida: %d plazas vacías" % [asoc, fuera.size()])
		for p in fuera:
			_plazas.erase(p)
	for d in perdidas:
		_pierde(String(d["asoc"]), String(d["comp"]), "plaza perdida (%s)" % d.get("motivo", ""))



func _de(comp: String, ronda: String = "", via: String = "", asoc: String = "") -> Array:
	return _plazas.filter(func(p: Dictionary) -> bool:
		return (comp == "" or p["comp"] == comp) and (ronda == "" or p["ronda"] == ronda) \
				and (via == "" or p["via"] == via) and (asoc == "" or p["asoc"] == asoc))



func _pierde(asoc: String, comp: String, motivo: String) -> void:
	var peor: Dictionary = {}
	for p in _de(comp, "", "", asoc):
		if String(p["tipo"]).begins_with("poseedor"):
			continue
		if peor.is_empty() or _fuerza(p) > _fuerza(peor):
			peor = p
	if peor.is_empty():
		return
	_plazas.erase(peor)
	_log.append("%s pierde su %s %s %s: %s" % [asoc, comp, peor["ronda"], peor["tipo"], motivo])


func _fuerza(p: Dictionary) -> int:
	return COMPS.find(p["comp"]) * 100 + RONDAS.find(p["ronda"]) * 10 + int(p["n"])


func _por_fuerza(a: Dictionary, b: Dictionary) -> bool:
	return _fuerza(a) < _fuerza(b) if _fuerza(a) != _fuerza(b) else a["k"] < b["k"]


func _por_rango(a: Dictionary, b: Dictionary) -> bool:
	if _pos[a["asoc"]] != _pos[b["asoc"]]:
		return _pos[a["asoc"]] < _pos[b["asoc"]]
	return _por_fuerza(a, b)



func _por_coef(a: Dictionary, b: Dictionary) -> bool:
	var ca: int = CoefUefa._mil(_c(a))
	var cb: int = CoefUefa._mil(_c(b))
	if ca != cb:
		return ca > cb
	if _pos[a["asoc"]] != _pos[b["asoc"]]:
		return _pos[a["asoc"]] < _pos[b["asoc"]]
	return a["k"] < b["k"]



func _por_fuerza_y_rango(a: Dictionary, b: Dictionary) -> bool:
	var fa: int = COMPS.find(a["comp"]) * 10 + RONDAS.find(a["ronda"])
	var fb: int = COMPS.find(b["comp"]) * 10 + RONDAS.find(b["ronda"])
	if fa != fb:
		return fa < fb
	if a["via"] != b["via"]:
		return String(a["via"]) < String(b["via"])
	return _por_rango(a, b)



func _mejor_por_coef(cands: Array) -> Dictionary:
	var mejor: Dictionary = {}
	for p in cands:
		if mejor.is_empty() or _por_coef(p, mejor):
			mejor = p
	return mejor


func _c(p: Dictionary) -> float:
	var id: String = p["club"]
	if _coef_fijo:
		return float(_coef.get(id, 0.0))
	if not _coef.has(id):
		_coef[id] = CoefUefa.coef_club_para(id, _asoc_de.get(id, p["asoc"]), _anio, _extra)
	return _coef[id]


func _plaza_de(club: String) -> Dictionary:
	for p in _plazas:
		if p["club"] == club:
			return p
	return {}







func _rellena() -> void:
	for p in _plazas:
		p["club"] = ""
	var por_asoc: Dictionary = {}
	for p in _plazas:
		(por_asoc.get_or_add(p["asoc"], []) as Array).append(p)
	for asoc in por_asoc:
		var ps: Array = por_asoc[asoc]
		var libres: Array =(_ligas.get(asoc, []) as Array).filter(func(c: String) -> bool: return not _excl.has(c))
		var usados: Dictionary = {}
		for p in ps:
			if p["fijo"] != "":
				p["club"] = p["fijo"]
				usados[p["fijo"]] = true
		var bombo: Array = libres.filter(func(c: String) -> bool: return not usados.has(c))
		for p in ps:
			if p["tipo"] == "campeon" and p["club"] == "" and not bombo.is_empty():
				p["club"] = bombo.pop_front()
				usados[p["club"]] = true
		for comp in COMPS:
			var mias: Array = ps.filter(func(p: Dictionary) -> bool: return p["comp"] == comp and p["club"] == "")
			mias.sort_custom(_por_fuerza)
			for p in mias:
				if p["tipo"] == "copa" or p["tipo"] == "copa_liga":
					var c: String =(_copas if p["tipo"] == "copa" else _copa_liga).get(asoc, "")
					if c != "" and not usados.has(c) and not _excl.has(c):
						p["club"] = c
						usados[c] = true
			bombo = libres.filter(func(c: String) -> bool: return not usados.has(c))
			for p in mias:
				if p["club"] == "" and not bombo.is_empty():
					p["club"] = bombo.pop_front()
					usados[p["club"]] = true



func _sube(cands: Array, a_ronda: String, a_via: String, n: int, criterio: String) -> void:
	var orden: Array = cands.duplicate()
	orden.sort_custom(_por_rango if criterio == "rango" else _por_coef)
	for i in mini(n, orden.size()):
		var p: Dictionary = orden[i]
		_log.append("sube %s %s de %s a %s (%s)" % [p["asoc"], p["comp"], p["ronda"], a_ronda, criterio])
		p["ronda"] = a_ronda
		p["via"] = a_via
	if n > orden.size():
		_log.append("sin regla: faltan %d para %s %s" % [n - orden.size(), a_ronda, a_via])






func _cuadra_ucl(criterio: String) -> void:
	_rellena()
	if criterio == "rango":
		var lp: Array = _de("ucl", "LP")
		for v in [["campeon", UCL_LP_CAMPEONES, "PO", "campeones"], ["liga", UCL_LP_LIGA, "Q3", "liga"]]:
			var hay: int = lp.filter(func(p: Dictionary) -> bool: return (p["tipo"] == "campeon") ==(v[0] == "campeon")).size()
			if hay < v[1]:
				_sube(_de("ucl", v[2], v[3]), "LP", "", v[1] - hay, "rango")
	var po: Array = _de("ucl", "PO", "campeones")
	if po.size() < UCL_PO_CH_DIRECTOS:
		_sube(_de("ucl", "Q2", "campeones"), "PO", "campeones", UCL_PO_CH_DIRECTOS - po.size(), criterio)
	var k: int = 2 *(UCL_Q2_CH - _de("ucl", "Q2", "campeones").size()) - _de("ucl", "Q1", "campeones").size()
	if k > 0:
		_sube(_de("ucl", "Q1", "campeones"), "Q2", "campeones", k, criterio)
	elif k < 0:
		_log.append("sin regla: sobran %d en la Q2 de campeones de la UCL" % - k)
	var x: int = 2 *(UCL_Q3_LIGA - _de("ucl", "Q3", "liga").size()) - _de("ucl", "Q2", "liga").size()
	if x > 0:
		_sube(_de("ucl", "Q2", "liga"), "Q3", "liga", x, criterio)
	elif x < 0:
		_log.append("sin regla: sobran %d en la Q3 de liga de la UCL" % - x)





func _poseedor(clave: String) -> String:
	var h: String = _poseedores.get(clave, "")
	if h == "":
		return ""
	var asoc: String = _asoc_de.get(h, "")
	if not _pos.has(asoc) or SUSPENDIDAS.has(asoc) or _excl.has(h):
		_log.append("el poseedor %s (%s) no puede jugar: su plaza queda libre" % [clave.to_upper(), h])
		return ""
	return h












func _poseedor_ucl_uel(clave: String) -> void:
	var h: String = _poseedor(clave)
	_rellena()
	var p: Dictionary = _plaza_de(h) if h != "" else {}
	if h == "" or (not p.is_empty() and p["comp"] == "ucl" and p["ronda"] == "LP"):
		if clave == "ucl":
			var mejor: Dictionary = _mejor_por_coef(_de("ucl", "", "campeones"))
			if mejor.is_empty():
				_log.append("sin regla: nadie en la vía de campeones para la plaza del poseedor UCL")
				return
			_log.append("3.04a plaza de poseedor UCL libre: sube %s (%s)" % [mejor["asoc"], mejor["ronda"]])
			mejor["ronda"] = "LP"
			mejor["via"] = ""
		else:
			var cands: Array = _plazas.filter(func(q: Dictionary) -> bool: return q["comp"] == "ucl" and q["via"] in ["campeones", "liga"])
			cands.sort_custom(_por_coef)
			for q in cands:
				var mejor_n: int = 99
				for r in _de("ucl", "", "", q["asoc"]):
					if r["ronda"] != "LP" and int(r["n"]) > 0:
						mejor_n = mini(mejor_n, int(r["n"]))
				if mejor_n == int(q["n"]):
					_log.append("3.04b plaza de poseedor UEL libre: sube %s (%s %s)" % [q["asoc"], q["ronda"], q["via"]])
					q["ronda"] = "LP"
					q["via"] = ""
					break
		_cuadra_ucl("coef")
		return
	var nueva: Dictionary = _nueva(_asoc_de[h], "ucl", "LP", "", "poseedor_" + clave)
	nueva["fijo"] = h
	if not p.is_empty() and p["comp"] == "ucl":
		_plazas.erase(p)
		_log.append("3.05 poseedor %s en previa de la UCL: deja %s %s" % [clave.to_upper(), p["ronda"], p["via"]])
		_cuadra_ucl("coef")
	elif not p.is_empty():
		_plazas.erase(p)
		_log.append("%s deja vacía su plaza de %s %s: su poseedor %s sube a la UCL" % [p["asoc"], p["comp"], p["ronda"], clave.to_upper()])
	_rellena()



func _eps(asocs: Array) -> void:
	for asoc in asocs:
		if SUSPENDIDAS.has(asoc) or not _pos.has(asoc):
			continue
		_nueva(asoc, "ucl", "LP", "", "eps")
		_log.append("EPS: plaza extra de LP para %s" % asoc)
	_rellena()






func _sube_uel_coef(ronda: String) -> void:
	if ronda == "Q1":
		var copas: Array = _plazas.filter(func(p: Dictionary) -> bool: return p["comp"] == "uecl" and p["tipo"] == "copa")
		if copas.is_empty():
			return
		copas.sort_custom(_por_rango)
		var p: Dictionary = copas[0]
		_log.append("3.09 la Q1 de la UEL se completa con la copa de %s (venía de la UECL %s)" % [p["asoc"], p["ronda"]])
		p["comp"] = "uel"
		p["ronda"] = "Q1"
		p["via"] = "principal"
		return
	if ronda == "Q2" or ronda == "LP":
		return
	var prev: String = RONDAS[RONDAS.find(ronda) + 1]
	var cands: Array = _de("uel", prev).filter(func(p: Dictionary) -> bool: return p["via"] in ["principal", ""])
	var copas: Array = cands.filter(func(p: Dictionary) -> bool: return p["tipo"] == "copa")
	var mejor: Dictionary = _mejor_por_coef(copas if not copas.is_empty() else cands)
	if mejor.is_empty():
		return
	_log.append("3.09 hueco en la UEL %s: sube %s desde %s" % [ronda, mejor["asoc"], prev])
	mejor["ronda"] = ronda
	mejor["via"] = "" if ronda == "PO" else "principal"
	_sube_uel_coef(prev)









func _poseedor_uecl() -> void:
	var h: String = _poseedor("uecl")
	_rellena()
	var p: Dictionary = _plaza_de(h) if h != "" else {}
	var vacante: bool = h == ""
	if not p.is_empty() and p["comp"] == "ucl":
		_log.append("3.13 poseedor UECL en la UCL: su plaza de LP de la UEL queda libre")
		vacante = true
	elif not p.is_empty() and p["comp"] == "uel" and p["ronda"] == "LP":
		_log.append("3.09 poseedor UECL ya en la LP de la UEL por su liga o copa")
		vacante = true
	if vacante:
		var cands: Array = []
		for q in _plazas:
			if q["comp"] != "uel" or q["ronda"] == "LP":
				continue
			if q["tipo"] == "copa":
				cands.append(q)
				continue
			var es_mejor: bool = true
			for r in _de("uel", "", "", q["asoc"]):
				if r["ronda"] != "LP" and r["tipo"] != "copa" and _fuerza(r) < _fuerza(q):
					es_mejor = false
			if es_mejor:
				cands.append(q)
		var mejor: Dictionary = _mejor_por_coef(cands)
		if mejor.is_empty():
			_log.append("sin regla: nadie en las previas de la UEL para la plaza del poseedor UECL")
			return
		var de: String = mejor["ronda"]
		_log.append("3.09 sube a la LP de la UEL %s desde %s (coef %.3f)" % [mejor["asoc"], de, _c(mejor)])
		mejor["ronda"] = "LP"
		mejor["via"] = ""
		_sube_uel_coef(de)
		_rellena()
		return
	var nueva: Dictionary = _nueva(_asoc_de[h], "uel", "LP", "", "poseedor_uecl")
	nueva["fijo"] = h
	if not p.is_empty() and p["comp"] == "uel":
		_plazas.erase(p)
		_log.append("3.10 poseedor UECL en previa de la UEL: deja %s" % p["ronda"])
		_sube_uel_coef(p["ronda"])
	elif not p.is_empty():
		_plazas.erase(p)
		_log.append("%s deja vacía su plaza de %s %s: su poseedor UECL sube a la UEL" % [p["asoc"], p["comp"], p["ronda"]])
	_rellena()







func _cuadra_uel() -> void:
	for v in [["LP", UEL_LP_DIRECTOS, "PO"], ["PO", UEL_PO_DIRECTOS, "Q3"], ["Q3", UEL_Q3_DIRECTOS, "Q2"]]:
		var hay: int = _de("uel", v[0]).size()
		if hay < v[1]:
			var cands: Array = _de("uel", v[2])
			cands.sort_custom(_por_rango)
			for i in mini(v[1] - hay, cands.size()):
				var p: Dictionary = cands[i]
				_log.append("3.11 hueco en la UEL %s: sube %s desde %s" % [v[0], p["asoc"], v[2]])
				p["ronda"] = v[0]
				p["via"] = "" if v[0] in ["LP", "PO"] else "principal"
		elif hay > v[1]:
			_log.append("sin regla: %d directos en la UEL %s, sobran" % [hay, v[0]])
	var perd_ucl: int = _de("ucl", "Q2", "liga").size() / 2
	var w2: int = UEL_Q3_PRINCIPAL - _de("uel", "Q3").size() - perd_ucl
	var q2: Array = _de("uel", "Q2")
	var q1: Array = _de("uel", "Q1")
	var k: int = 4 * w2 - 2 * q2.size() - q1.size()
	_log.append("UEL: hacen falta %d ganadores de Q2 (caen %d de la UCL): suben %d de Q1 a Q2" % [w2, perd_ucl, k])
	if k > 0:
		q1.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			if _pos[a["asoc"]] != _pos[b["asoc"]]:
				return _pos[a["asoc"]] < _pos[b["asoc"]]
			if (a["tipo"] == "copa") !=(b["tipo"] == "copa"):
				return a["tipo"] == "copa"
			return a["k"] < b["k"])
		for i in mini(k, q1.size()):
			q1[i]["ronda"] = "Q2"
	elif k < 0:

		q2.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return _pos[a["asoc"]] > _pos[b["asoc"]] if _pos[a["asoc"]] != _pos[b["asoc"]] else a["k"] < b["k"])
		_log.append("sin regla: bajan %d de la Q2 a la Q1 de la UEL" % - k)
		for i in mini(- k, q2.size()):
			q2[i]["ronda"] = "Q1"







func _cuadra_uecl() -> void:
	var uel_q1: int = _de("uel", "Q1").size()
	var uel_q2: int = _de("uel", "Q2").size()
	var l1: int = uel_q1 / 2
	var l2: int =(uel_q2 + uel_q1 / 2) / 2
	var l3: int =(_de("uel", "Q3").size() + l2 + _de("ucl", "Q2", "liga").size() / 2) / 2
	var t3: int = 2 *(UECL_PO_PRINCIPAL - _de("uecl", "PO").size() - l3)
	var q2: Array = _de("uecl", "Q2")
	var q1: Array = _de("uecl", "Q1")
	var d2: int = 2 *(2 *(t3 - l2)) -(q2.size() + q1.size()) - 2 * l1
	var sube: int = d2 - q2.size()
	_log.append("UECL: caen %d/%d/%d de Q1/Q2/Q3 de la UEL; la Q2 necesita %d directos: suben %d de Q1" % [l1, l2, l3, d2, sube])
	if sube > 0:
		q1.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			if (a["tipo"] == "copa") !=(b["tipo"] == "copa"):
				return a["tipo"] == "copa"
			if _pos[a["asoc"]] != _pos[b["asoc"]]:
				return _pos[a["asoc"]] < _pos[b["asoc"]]
			return a["k"] < b["k"])
		for i in mini(sube, q1.size()):
			q1[i]["ronda"] = "Q2"
	elif sube < 0:

		q2.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			return _pos[a["asoc"]] > _pos[b["asoc"]] if _pos[a["asoc"]] != _pos[b["asoc"]] else a["k"] < b["k"])
		_log.append("sin regla: bajan %d de la Q2 a la Q1 de la UECL" % - sube)
		for i in mini(- sube, q2.size()):
			q2[i]["ronda"] = "Q1"
