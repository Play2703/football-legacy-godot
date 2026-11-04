class_name CoefUefa
extends RefCounted



























const VENTANA: int = 5


const SUELO_ASOC: float = 0.2


static func _mil(x: float) -> int:
	return int(round(x * 1000.0))





static func _asoc_mil(asoc: String, anio: int, extra: Dictionary) -> int:
	if anio <= CoefUefaDatos.ULTIMA:
		return _mil(float((CoefUefaDatos.ASOC.get(asoc, {}) as Dictionary).get(anio, 0.0)))
	var e: Dictionary =(extra.get("asoc", {}) as Dictionary).get(asoc, {})
	return _mil(float(e.get(anio, 0.0)))



static func _club_mil(id: String, anio: int, extra: Dictionary) -> int:
	if anio <= CoefUefaDatos.ULTIMA:
		return _mil(float((CoefUefaDatos.CLUB.get(id, {}) as Dictionary).get(anio, 0.0)))
	var e: Dictionary =(extra.get("club", {}) as Dictionary).get(id, {})
	return _mil(float(e.get(anio, 0.0)))



static func club_temporada(id: String, anio: int, extra: Dictionary = {}) -> float:
	return _club_mil(id, anio, extra) / 1000.0



static func asoc_temporada(asoc: String, anio: int, extra: Dictionary = {}) -> float:
	return _asoc_mil(asoc, anio, extra) / 1000.0




static func asociaciones() -> Array:
	return CoefUefaDatos.ASOC.keys()



static func coef_asoc(asoc: String, cierre: int, extra: Dictionary = {}) -> float:
	var t: int = 0
	for a in range(cierre - VENTANA, cierre):
		t += _asoc_mil(asoc, a, extra)
	return t / 1000.0







static func ranking(cierre: int, extra: Dictionary = {}) -> Array:
	var filas: Array = []
	for asoc in asociaciones():
		var temporadas: Array = []
		var t: int = 0
		for a in range(cierre - 1, cierre - 1 - VENTANA, -1):
			var m: int = _asoc_mil(asoc, a, extra)
			temporadas.append(m)
			t += m
		filas.append({"asoc": asoc, "mil": t, "temporadas": temporadas})
	filas.sort_custom(_va_antes)
	var out: Array = []
	for i in filas.size():
		out.append({"asoc": filas[i]["asoc"], "total": int(filas[i]["mil"]) / 1000.0, "pos": i + 1})
	return out


static func _va_antes(a: Dictionary, b: Dictionary) -> bool:
	if a["mil"] != b["mil"]:
		return a["mil"] > b["mil"]
	for i in (a["temporadas"] as Array).size():
		if a["temporadas"][i] != b["temporadas"][i]:
			return a["temporadas"][i] > b["temporadas"][i]
	return String(a["asoc"]) < String(b["asoc"])



static func ranking_para(anio: int, extra: Dictionary = {}) -> Array:
	return ranking(anio - 1, extra)



static func puesto(rk: Array, asoc: String) -> int:
	for f in rk:
		if f["asoc"] == asoc:
			return int(f["pos"])
	return 0





static func coef_club(id: String, asoc: String, cierre: int, extra: Dictionary = {}) -> float:
	var propio: int = 0
	for a in range(cierre - VENTANA, cierre):
		propio += _club_mil(id, a, extra)

	var suelo: int = int(floor(_mil(coef_asoc(asoc, cierre, extra)) * SUELO_ASOC + 0.0001))
	return maxi(propio, suelo) / 1000.0



static func coef_club_para(id: String, asoc: String, anio: int, extra: Dictionary = {}) -> float:
	return coef_club(id, asoc, anio, extra)




















const BONO_RONDA: Dictionary = {"ucl": 1500, "eul": 1000, "conf": 500}


const RONDAS_DE_CLUB: int = 4

const MINIMO_LIGA: Dictionary = {"eul": 3000, "conf": 2500}

const MINIMO_PREVIA_CONF: Dictionary = {"q1": 1000, "q2": 1500, "q3": 2000, "po": 2500}





static func bono_liga(comp: String, pos: int) -> int:
	match comp:
		"ucl":
			return maxi(12000 - 250 *(pos - 1), 6000)
		"eul":
			return maxi(6000 - 250 *(pos - 1), 0)
	if pos <= 9:
		return 4000 - 250 *(pos - 1)
	return maxi(2000 - 125 *(pos - 9), 0)















static func temporada(comps: Dictionary, pais_de: Dictionary, anio: int,
		extra: Dictionary = {}) -> Dictionary:
	var club: Dictionary = {}
	var aporta: Dictionary = {}
	var minimo: Dictionary = {}
	for comp in comps:
		var c: Dictionary = comps[comp]
		var bono: int = int(BONO_RONDA.get(comp, 0))
		var orden: Array = c.get("orden", [])
		var tabla: Dictionary = c.get("tabla", {})
		for i in orden.size():
			var id: String = String(orden[i])
			var fila: Dictionary = tabla.get(id, {})
			var p: int = 2000 * int(fila.get("w", 0)) + 1000 * int(fila.get("d", 0)) \
					+ bono_liga(String(comp), i + 1)
			_suma(club, id, p)
			_suma(aporta, id, p)
			if MINIMO_LIGA.has(comp):
				minimo[id] = maxi(int(minimo.get(id, 0)), int(MINIMO_LIGA[comp]))
		var cuadro: Array = c.get("cuadro", [])
		for r in cuadro.size():
			var desde_final: int = cuadro.size() - 1 - r
			for t in cuadro[r]:
				var a: String = String((t as Dictionary).get("a", ""))
				var b: String = String((t as Dictionary).get("b", ""))
				if a.is_empty() or b.is_empty():
					continue

				var pts: Array = _puntos_cruce(t, desde_final > 0, 2000)
				var de_club: bool = desde_final < RONDAS_DE_CLUB
				_suma(aporta, a, int(pts[0]) +(bono if de_club else 0))
				_suma(aporta, b, int(pts[1]) +(bono if de_club else 0))

				_suma(club, a, int(pts[0]) + bono if de_club else 0)
				_suma(club, b, int(pts[1]) + bono if de_club else 0)
		for t in c.get("previa", []):
			var a: String = String((t as Dictionary).get("a", ""))
			var b: String = String((t as Dictionary).get("b", ""))
			if a.is_empty() or b.is_empty():
				continue
			var pts: Array = _puntos_cruce(t, true, 1000)
			_suma(aporta, a, int(pts[0]))
			_suma(aporta, b, int(pts[1]))
			_suma(club, a, 0)
			_suma(club, b, 0)
			var ronda: String = String((t as Dictionary).get("ronda", ""))
			var w: String = String((t as Dictionary).get("winner", ""))
			if comp == "conf" and MINIMO_PREVIA_CONF.has(ronda) and (w == a or w == b):
				var cae: String = b if w == a else a
				minimo[cae] = maxi(int(minimo.get(cae, 0)), int(MINIMO_PREVIA_CONF[ronda]))
	var out_club: Dictionary = {}
	var total: Dictionary = {}
	var inscritos: Dictionary = {}
	for id in club:
		out_club[id] = maxi(int(club[id]), int(minimo.get(id, 0))) / 1000.0
		var asoc: String = String(pais_de.get(id, ""))
		if asoc.is_empty():
			continue
		total[asoc] = int(total.get(asoc, 0)) + int(aporta.get(id, 0))
		inscritos[asoc] = int(inscritos.get(asoc, 0)) + 1
	var out_asoc: Dictionary = {}
	for asoc in total:
		@warning_ignore("integer_division")
		out_asoc[asoc] =(int(total[asoc]) / int(inscritos[asoc])) / 1000.0
	for asoc in AccesoUefa.SUSPENDIDAS:
		if CoefUefaDatos.ASOC.has(asoc):
			out_asoc[asoc] = _asoc_mil(String(asoc), anio - 1, extra) / 1000.0
	return {"club": out_club, "asoc": out_asoc}


static func _suma(d: Dictionary, id: String, mil: int) -> void:
	d[id] = int(d.get(id, 0)) + mil







static func _puntos_cruce(t: Dictionary, dos: bool, victoria: int) -> Array:
	var partidos: Array = []
	if t.has("leg1") and t.has("leg2"):
		partidos = [_goles(String(t["leg1"])), _goles(String(t["leg2"]))]
	else:
		var g: Array = _goles(String(t.get("score", "")))
		if g.is_empty():
			return [0, 0]
		if dos:
			@warning_ignore("integer_division")
			partidos = [[g[0] - g[0] / 2, g[1] / 2], [g[0] / 2, g[1] - g[1] / 2]]
		else:
			partidos = [g]
	var pa: int = 0
	var pb: int = 0
	for m in partidos:
		if (m as Array).is_empty():
			continue
		if m[0] > m[1]:
			pa += victoria
		elif m[0] < m[1]:
			pb += victoria
		else:
			@warning_ignore("integer_division")
			pa += victoria / 2
			@warning_ignore("integer_division")
			pb += victoria / 2
	return [pa, pb]



static func _goles(s: String) -> Array:
	var p: PackedStringArray = s.strip_edges().split(" ")[0].split("-")
	if p.size() != 2 or not p[0].is_valid_int() or not p[1].is_valid_int():
		return []
	return [int(p[0]), int(p[1])]
