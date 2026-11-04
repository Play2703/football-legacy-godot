class_name PreviaUefa
extends RefCounted



























const RONDAS: Array = ["Q1", "Q2", "Q3", "PO"]


const COMPS: Array = ["ucl", "uel", "uecl"]

const COMP_JUEGO: Dictionary = {"ucl": "ucl", "uel": "eul", "uecl": "conf"}

const ESCALA: float = 10000.0

var _season: int = 0
var _coef: Dictionary = {}
var _fz: Dictionary = {}
var _casa: Dictionary = {}
var _forz: Array = []

var _origen: Dictionary = {}

var _quien: Dictionary = {}
var _coef_memo: Dictionary = {}


var _cabezas: Dictionary = {}
var _cabezas_ultimo: Array = []
var _asoc_memo: Dictionary = {}











static func calcula(snap: Dictionary, season: int, forzados: Array = []) -> Dictionary:
	var p: PreviaUefa = PreviaUefa.new()
	return p._corre(snap, season, forzados)


func _corre(snap: Dictionary, season: int, forzados: Array) -> Dictionary:
	_season = season
	_coef = _de_escala(snap.get("coef", {}))
	_fz = _de_escala(snap.get("fuerza", {}))
	_casa = _de_escala(snap.get("casa", {}))
	_forz = forzados
	var directos: Dictionary = {}
	for x in snap.get("clubes", []):
		var c: Dictionary = x
		var k: String = _clave(String(c["comp"]), String(c["ronda"]), String(c["via"]))
		(directos.get_or_add(k, []) as Array).append(String(c["id"]))
	var cuadro: Dictionary = _sortea(directos, int(snap.get("byes_uecl", 0)))
	return _juega(cuadro, directos)



static func a_escala(v: float) -> int:
	return roundi(v * ESCALA)


static func _de_escala(d: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in d:
		out[k] = float(d[k]) / ESCALA
	return out


static func _clave(comp: String, ronda: String, via: String) -> String:
	return "%s %s %s" % [comp, ronda, AccesoUefa._via_de(comp, ronda, via)]





func _sortea(directos: Dictionary, byes: int) -> Dictionary:
	var cuadro: Dictionary = {}
	var a_q3: Array = []
	for ronda in RONDAS:
		for comp in COMPS:
			for via in AccesoUefa.VIAS[comp][ronda]:
				var k: String = _clave(comp, ronda, via)
				var bombo: Array =(directos.get(k, []) as Array).duplicate()
				bombo.append_array(_llegan(cuadro, comp, ronda, via))
				var rng: RandomNumberGenerator = EuroSim._rng("uefa|sorteo|" + k, _season)
				if k == "uecl Q2 campeones" and byes > 0:


					var de_ucl: Array = bombo.filter(func(s: String) -> bool:
						return s.begins_with("P|ucl Q1"))
					EuroSim._shuffle(de_ucl, rng)
					for s in de_ucl.slice(0, byes):
						bombo.erase(s)
						a_q3.append(s)
				elif k == "uecl Q3 campeones":
					bombo.append_array(a_q3)
				if bombo.is_empty():
					continue
				cuadro[k] = _empareja(bombo, rng)
				_cabezas[k] = _cabezas_ultimo
				for i in (cuadro[k] as Array).size():
					var par: Array = cuadro[k][i]
					_origen["G|%s|%d" % [k, i]] = par
					_origen["P|%s|%d" % [k, i]] = par
	cuadro["_byes"] = a_q3
	return cuadro





func _llegan(cuadro: Dictionary, comp: String, ronda: String, via: String) -> Array:
	var out: Array = []
	var i_r: int = AccesoUefa.RONDAS.find(ronda)
	if ronda != "Q1":
		var prev: String = AccesoUefa.RONDAS[i_r + 1]
		for pv in AccesoUefa.VIAS[comp][prev]:
			if AccesoUefa._via_de(comp, ronda, pv) != via:
				continue
			var kp: String = _clave(comp, prev, pv)
			for i in (cuadro.get(kp, []) as Array).size():
				out.append("G|%s|%d" % [kp, i])
	for kd in AccesoUefa.DESTINO:
		var d: Array = AccesoUefa.DESTINO[kd]
		if d[0] != comp or d[1] != ronda or d[2] != AccesoUefa._via_de(comp, ronda, via):
			continue
		for i in (cuadro.get(kd, []) as Array).size():
			out.append("P|%s|%d" % [kd, i])
	return out






func _empareja(bombo: Array, rng: RandomNumberGenerator) -> Array:
	var orden: Array = bombo.duplicate()
	orden.sort_custom(func(a: String, b: String) -> bool:
		var ca: float = _coef_de(a)
		var cb: float = _coef_de(b)
		if not is_equal_approx(ca, cb):
			return ca > cb
		return a < b)
	@warning_ignore("integer_division")
	var n: int = orden.size() / 2
	var cabezas: Array = orden.slice(0, n)
	_cabezas_ultimo = cabezas.duplicate()
	var resto: Array = orden.slice(n)
	EuroSim._shuffle(cabezas, rng)
	EuroSim._shuffle(resto, rng)
	var pares: Array = []
	for c in cabezas:
		var j: int = 0
		while j < resto.size() and _vetados(String(c), String(resto[j])):
			j += 1
		if j == resto.size():
			j = 0
		var r: String = String(resto[j])
		resto.remove_at(j)
		pares.append([c, r] if rng.randi_range(0, 1) == 0 else [r, c])
	if not resto.is_empty():
		pares.append([String(resto[0]), ""])
	return pares



func _coef_de(plaza: String) -> float:
	if _coef_memo.has(plaza):
		return _coef_memo[plaza]
	var v: float = 0.0
	if _origen.has(plaza):
		var par: Array = _origen[plaza]
		v = maxf(_coef_de(String(par[0])), _coef_de(String(par[1])) if String(par[1]) != "" else 0.0)
	else:
		v = float(_coef.get(plaza, 0.0))
	_coef_memo[plaza] = v
	return v



func _asocs_de(plaza: String) -> Array:
	if _asoc_memo.has(plaza):
		return _asoc_memo[plaza]
	var out: Array = []
	if _origen.has(plaza):
		for s in _origen[plaza]:
			if String(s) != "":
				for a in _asocs_de(String(s)):
					if not out.has(a):
						out.append(a)
	elif plaza != "":
		out.append(Teams.country_of(plaza))
	_asoc_memo[plaza] = out
	return out


func _vetados(a: String, b: String) -> bool:
	for x in _asocs_de(a):
		for y in _asocs_de(b):
			if AccesoUefa.choque_vetado(String(x), String(y)):
				return true
	return false




func _juega(cuadro: Dictionary, directos: Dictionary) -> Dictionary:
	var cruces: Dictionary = {}
	var caida: Dictionary = {}
	for ronda in RONDAS:
		for comp in COMPS:
			for via in AccesoUefa.VIAS[comp][ronda]:
				var k: String = _clave(comp, ronda, via)
				if not cuadro.has(k):
					continue
				var lista: Array = []
				for i in (cuadro[k] as Array).size():
					var par: Array = cuadro[k][i]
					var a: String = _resuelve(String(par[0]))
					var b: String = _resuelve(String(par[1]))
					var t: Dictionary = {"a": a, "b": b, "winner": "", "score": "",
						"comp": comp, "ronda": ronda.to_lower(), "via": AccesoUefa._via_de(comp, ronda, via)}
					var w: String = a
					var l: String = ""
					if not b.is_empty():
						var rng: RandomNumberGenerator = EuroSim._rng("uefa|%s|%d" % [k, i], _season)
						w = _forzado_o(a, b, EuroSim._tie_winner(a, b, rng, _fz))
						l = b if w == a else a
						EuroSim._pon_ida_vuelta(t, w,
							EuroSim._tie_score_ida_vuelta(a, b, w, rng, false, _fz, _casa))
					else:
						t["winner"] = w
					_quien["G|%s|%d" % [k, i]] = w
					_quien["P|%s|%d" % [k, i]] = l
					if not l.is_empty() and not AccesoUefa.DESTINO.has(k):
						caida[l] = k
					lista.append(t)
				cruces[k] = lista
	var lp: Dictionary = {}
	for comp in COMPS:
		var k: String = _clave(comp, "LP", "")
		var ids: Array =(directos.get(k, []) as Array).duplicate()
		for s in _llegan(cuadro, comp, "LP", ""):
			ids.append(_resuelve(String(s)))
		lp[comp] = ids
	var byes: Array = []
	for s in cuadro.get("_byes", []):
		byes.append(_resuelve(String(s)))
	var solo_cuadro: Dictionary = cuadro.duplicate()
	solo_cuadro.erase("_byes")
	return {"cuadro": solo_cuadro, "cruces": cruces, "lp": lp, "byes": byes, "caida": caida,
		"cabezas": _cabezas}


func _resuelve(plaza: String) -> String:
	if plaza.is_empty() or not _origen.has(plaza):
		return plaza
	return String(_quien.get(plaza, ""))


func _forzado_o(a: String, b: String, w: String) -> String:
	for f in _forz:
		var g: String = String((f as Dictionary).get("ganador", ""))
		var p: String = String((f as Dictionary).get("perdedor", ""))
		if (a == g and b == p) or (a == p and b == g):
			return g
	return w
