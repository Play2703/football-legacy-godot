class_name Clausulas
extends RefCounted








































const PUESTOS_MAX: int = 3












const TITULOS: Array[String] = ["liga", "copa", "champions", "europa", "conference",
	"clubes"]


const TITULO_GEMELO: Dictionary = {
	"libertadores": "champions", "concacaf": "champions", "sudamericana": "europa",
	"oriente": "champions", "sol": "europa",
	"atlas": "champions", "baobab": "europa",


	"coral": "europa",
}





static func titulo_pactado(kind: String) -> String:
	return String(TITULO_GEMELO.get(kind, kind))



const TITULO_MULT: Array[float] = [1.0, 1.5, 2.0, 3.0]




const GOL_PASO: float = 0.1
const GOL_MAX: float = 0.6
const ASIST_PASO: float = 0.05
const ASIST_MAX: float = 0.3




const VETO_GAP: int = 6








const T_PUESTO_BASE: float = 1.5
const T_PUESTO_UNICO: float = 1.0
const T_PUESTO_TRES: float = -0.5
const T_PUESTO_FUERA: float = 1.5
const T_PUESTO_POR_PUNTO: float = 0.25


const T_ANO: float = 1.0
const T_ANO_CONTRA: float = 1.8
const T_ANO_FAVOR: float = 0.3



const T_TITULO_ESPERADO: float = 0.45
const T_TITULO_NIVEL: float = 0.15



const T_GOL_PASO: float = 0.35
const T_ASIST_PASO: float = 0.3
const PESO_GOL: Dictionary = {
	"DC": 1.3, "EI": 1.1, "ED": 1.1, "CAM": 1.0, "MI": 0.9, "MD": 0.9, "MC": 0.75,
	"MCD": 0.55,
}
const PESO_ASIST: Dictionary = {
	"CAM": 1.3, "EI": 1.2, "ED": 1.2, "MI": 1.1, "MD": 1.1, "MC": 1.0, "DC": 0.85,
	"MCD": 0.7,
}




const M_BASE: float = 2.0
const M_INTERES: float = 4.0
const M_AGENTE: float = 2.0
const M_ESTATURA: float = 3.0








const ACEPTA_A: float = 1.2
const ACEPTA_B: float = 0.8
const ACEPTA_MIN: float = 0.05
const ACEPTA_MAX: float = 0.95
const PORTAZO_DESDE: float = 0.7
const PORTAZO_PENDIENTE: float = 0.5
const PORTAZO_MAX: float = 0.6
const PROPIO_PORTAZO: float = 0.5
const CONTRA_SHARE: float = 0.6






static func base(anos: int, gol: float, asist: float, titulos: Dictionary = {},
		puestos: Array = []) -> Dictionary:
	var t: Dictionary = {}
	for k in TITULOS:
		t[k] = clampi(int(titulos.get(k, 0)), 0, TITULO_MULT.size() - 1)
	return {
		"puestos": puestos.duplicate(),
		"anos": anos,
		"titulos": t,
		"gol": snappedf(gol, 0.01),
		"asist": snappedf(asist, 0.01),
	}






static func sanea(p: Dictionary, b: Dictionary, ctx: Dictionary) -> Dictionary:
	var out: Dictionary = base(int(b["anos"]), float(b["gol"]), float(b["asist"]),
		b["titulos"] as Dictionary, b["puestos"] as Array)
	out["anos"] = clampi(int(p.get("anos", b["anos"])), int(ctx.get("anos_min", 1)),
		maxi(int(ctx.get("anos_max", b["anos"])), int(ctx.get("anos_min", 1))))
	var pt: Dictionary = p.get("titulos", {}) as Dictionary
	for k in TITULOS:
		out["titulos"][k] = clampi(int(pt.get(k, 0)), int(b["titulos"][k]),
			TITULO_MULT.size() - 1)
	out["gol"] = _peldano(float(p.get("gol", b["gol"])), float(b["gol"]), GOL_PASO,
		GOL_MAX)
	out["asist"] = _peldano(float(p.get("asist", b["asist"])), float(b["asist"]),
		ASIST_PASO, ASIST_MAX)
	var ok: Array = pactables(ctx, b)
	var ps: Array = []
	for pos in p.get("puestos", []) as Array:
		var s: String = String(pos)
		if ok.has(s) and not ps.has(s) and ps.size() < PUESTOS_MAX:
			ps.append(s)
	out["puestos"] = ps
	return out




static func _peldano(v: float, b: float, paso: float, tope: float) -> float:
	var techo: float = maxf(tope, b)
	var k: int = maxi(0, int(round((v - b) / paso)))
	return snappedf(minf(b + float(k) * paso, techo), 0.01)





static func es_base(p: Dictionary, b: Dictionary) -> bool:
	return unidades(p, b, {}).is_empty() \
			and mismo_pacto(p["puestos"] as Array, b["puestos"] as Array)



static func mismo_pacto(a: Array, b: Array) -> bool:
	var x: Array = a.duplicate()
	var y: Array = b.duplicate()
	x.sort()
	y.sort()
	return x == y








static func seleccionables(ctx: Dictionary) -> Array:
	var out: Array = []
	var vetos_d: Dictionary = vetos(ctx)
	for pos in ctx.get("candidatos", []) as Array:
		if not vetos_d.has(String(pos)) and not out.has(String(pos)):
			out.append(String(pos))
	return out





static func pactables(ctx: Dictionary, b: Dictionary) -> Array:
	var out: Array = seleccionables(ctx)
	for pos in b.get("puestos", []) as Array:
		if not out.has(String(pos)):
			out.append(String(pos))
	return out




static func vetos(ctx: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	var muros: Dictionary = ctx.get("muros", {}) as Dictionary
	var ovr: int = int(ctx.get("ovr", 0))
	var pos_club: String = String(ctx.get("pos_club", ""))
	for pos in ctx.get("candidatos", []) as Array:
		var s: String = String(pos)
		if s == pos_club:
			continue
		if not muros.has(s):
			out[s] = "NO JUEGAN CON ESE PUESTO"
		elif int(muros[s]) - ovr > VETO_GAP:
			out[s] = "SU TITULAR ES MUCHO MEJOR"
	return out








static func unidades(p: Dictionary, b: Dictionary, ctx: Dictionary) -> Dictionary:
	var out: Dictionary = {}

	var d: int = int(p["anos"]) - int(b["anos"])
	if d != 0:
		var c: float = _coste_ano(d > 0, ctx)
		var anos_u: Array = []
		for i in range(absi(d)):
			anos_u.append(c)
		out["anos"] = anos_u


	var ps: Array = p["puestos"] as Array
	if not ps.is_empty() and not mismo_pacto(ps, b["puestos"] as Array):
		out["puestos"] = [_coste_puestos(ps, ctx)]

	var prob: Dictionary = ctx.get("prob", {}) as Dictionary
	for k in TITULOS:
		var n0: int = int((b["titulos"] as Dictionary).get(k, 0))
		var n1: int = int((p["titulos"] as Dictionary).get(k, 0))
		if n1 <= n0:
			continue
		var tu: Array = []
		for n in range(n0 + 1, n1 + 1):
			var subida: float = TITULO_MULT[n] - TITULO_MULT[n - 1]
			tu.append(subida * float(ContractTerms.TITLE_BONUS_WAGES.get(k, 0.0))
				* float(prob.get(k, 0.0)) * T_TITULO_ESPERADO + T_TITULO_NIVEL)
		out["t_" + k] = tu

	var pos: String = String(ctx.get("pos", "DC"))
	var grant: Dictionary = ctx.get("grant", {}) as Dictionary
	var gu: Array = _peldanos(float(b["gol"]), float(p["gol"]), GOL_PASO,
		float(grant.get("goal", 0.0)), T_GOL_PASO * float(PESO_GOL.get(pos, 1.0)))
	if not gu.is_empty():
		out["gol"] = gu
	var au: Array = _peldanos(float(b["asist"]), float(p["asist"]), ASIST_PASO,
		float(grant.get("assist", 0.0)), T_ASIST_PASO * float(PESO_ASIST.get(pos, 1.0)))
	if not au.is_empty():
		out["asist"] = au
	return out




static func _peldanos(b: float, v: float, paso: float, libre: float, coste: float) -> Array:
	var out: Array = []
	var k: int = int(round((v - b) / paso))
	for i in range(1, k + 1):
		var val: float = b + float(i) * paso
		out.append(0.0 if val <= libre + 0.001 else coste)
	return out






static func _coste_ano(mas: bool, ctx: Dictionary) -> float:
	var edad: int = int(ctx.get("edad", 25))
	var pref: int = 0
	if edad >= 30:
		pref = -1
	elif edad <= 25 and float(ctx.get("stature", 0.0)) >= ContractTerms.WAGE_PIVOT:
		pref = 1
	if pref == 0:
		return T_ANO
	var a_favor: bool =(mas and pref > 0) or (not mas and pref < 0)
	return T_ANO_FAVOR if a_favor else T_ANO_CONTRA


static func _coste_puestos(ps: Array, ctx: Dictionary) -> float:
	var t: float = T_PUESTO_BASE
	if ps.size() == 1:
		t += T_PUESTO_UNICO
	elif ps.size() >= 3:
		t += T_PUESTO_TRES
	var pos_club: String = String(ctx.get("pos_club", ""))
	if not pos_club.is_empty() and not ps.has(pos_club):
		t += T_PUESTO_FUERA
	var muros: Dictionary = ctx.get("muros", {}) as Dictionary
	var ovr: int = int(ctx.get("ovr", 0))
	for pos in ps:
		t += float(maxi(0, int(muros.get(String(pos), 0)) - ovr)) * T_PUESTO_POR_PUNTO
	return t



static func tension(p: Dictionary, b: Dictionary, ctx: Dictionary) -> float:
	var t: float = 0.0
	var u: Dictionary = unidades(p, b, ctx)
	for k in u:
		for c in u[k] as Array:
			t += float(c)
	return t



static func margen(ctx: Dictionary) -> float:
	var m: float = M_BASE + M_INTERES * clampf(float(ctx.get("interest", 0.5)), 0.0, 1.0) \
			+ M_AGENTE * clampf(float(ctx.get("agente", 50.0)) / 100.0, 0.0, 1.0) \
			+ M_ESTATURA * clampf(float(ctx.get("stature", 0.0)), 0.0, 1.0)


	if bool(ctx.get("casa", false)):
		m *= 1.0 + Gerencia.CONTRATO_CASA
	return m




static func probabilidades(p: Dictionary, b: Dictionary, ctx: Dictionary) -> Dictionary:
	var t: float = tension(p, b, ctx)
	if t <= 0.0001:
		return {"acepta": 1.0, "portazo": 0.0, "contra": 0.0, "r": 0.0}
	var r: float = t / maxf(margen(ctx), 0.1)
	var acepta: float = clampf(ACEPTA_A - ACEPTA_B * r, ACEPTA_MIN, ACEPTA_MAX)
	var portazo: float = clampf(PORTAZO_PENDIENTE *(r - PORTAZO_DESDE), 0.0, PORTAZO_MAX)
	if bool(ctx.get("propio", false)):
		portazo *= PROPIO_PORTAZO
	portazo = minf(portazo, 1.0 - acepta)
	return {"acepta": acepta, "portazo": portazo,
		"contra": maxf(0.0, 1.0 - acepta - portazo), "r": r}






static func contraoferta(p: Dictionary, b: Dictionary, ctx: Dictionary) -> Dictionary:
	var u: Dictionary = unidades(p, b, ctx)
	var tope: float = CONTRA_SHARE * margen(ctx)
	var tomadas: Dictionary = {}
	for k in u:
		tomadas[k] = 0
	var gasto: float = 0.0
	while true:
		var mejor: String = ""
		var mejor_c: float = INF
		for k in u:
			var lista: Array = u[k] as Array
			var i: int = int(tomadas[k])
			if i < lista.size() and float(lista[i]) < mejor_c:
				mejor_c = float(lista[i])
				mejor = String(k)
		if mejor.is_empty() or gasto + mejor_c > tope + 0.0001:
			break
		gasto += mejor_c
		tomadas[mejor] = int(tomadas[mejor]) + 1

	var c: Dictionary = base(int(b["anos"]), float(b["gol"]), float(b["asist"]),
		b["titulos"] as Dictionary, b["puestos"] as Array)
	var sgn: int = signi(int(p["anos"]) - int(b["anos"]))
	c["anos"] = int(b["anos"]) + sgn * int(tomadas.get("anos", 0))

	if int(tomadas.get("puestos", 0)) > 0 or (p["puestos"] as Array).is_empty():
		c["puestos"] =(p["puestos"] as Array).duplicate()
	for k in TITULOS:
		c["titulos"][k] = int(b["titulos"][k]) + int(tomadas.get("t_" + k, 0))


	c["gol"] = snappedf(minf(float(b["gol"]) + GOL_PASO * float(tomadas.get("gol", 0)),
		maxf(float(p["gol"]), float(b["gol"]))), 0.01)
	c["asist"] = snappedf(minf(float(b["asist"])
		+ ASIST_PASO * float(tomadas.get("asist", 0)),
		maxf(float(p["asist"]), float(b["asist"]))), 0.01)
	return c






static func resolve(p: Dictionary, b: Dictionary, ctx: Dictionary, roll: float) -> Dictionary:
	var pr: Dictionary = probabilidades(p, b, ctx)
	if roll < float(pr["acepta"]):
		return {"resultado": "acepta", "concedido": p.duplicate(true)}
	if roll < float(pr["acepta"]) + float(pr["portazo"]):
		return {"resultado": "portazo", "concedido": b.duplicate(true)}
	var c: Dictionary = contraoferta(p, b, ctx)
	return {"resultado": "acepta" if _igual(c, p) else "contra", "concedido": c}


static func _igual(a: Dictionary, b: Dictionary) -> bool:
	return int(a["anos"]) == int(b["anos"]) \
			and mismo_pacto(a["puestos"] as Array, b["puestos"] as Array) \
			and (a["titulos"] as Dictionary) ==(b["titulos"] as Dictionary) \
			and is_equal_approx(float(a["gol"]), float(b["gol"])) \
			and is_equal_approx(float(a["asist"]), float(b["asist"]))






static func primas_de(c: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in TITULOS:
		var n: int = int((c.get("titulos", {}) as Dictionary).get(k, 0))
		if n > 0:
			out[k] = TITULO_MULT[clampi(n, 0, TITULO_MULT.size() - 1)]
	return out




static func niveles_de(primas: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in TITULOS:
		var m: float = float(primas.get(k, 1.0))
		var n: int = 0
		for i in range(TITULO_MULT.size()):
			if m >= TITULO_MULT[i] - 0.001:
				n = i
		out[k] = n
	return out









static func prob_titulos(rating: int, rank: int, div: int) -> Dictionary:
	var liga_p: Array = [0.45, 0.22, 0.12, 0.07, 0.04]
	var liga: float = float(liga_p[rank - 1]) if rank >= 1 and rank <= liga_p.size() \
			else 0.015
	var copa: float = 0.5 * liga + 0.04
	if div > 1:
		copa *= 0.3
		return {"liga": liga, "copa": copa, "champions": 0.0, "europa": 0.0,
			"conference": 0.0, "clubes": 0.0}
	var r: float = float(rating)
	var ucl: float = 0.25 * clampf((r - 84.0) / 15.0, 0.0, 1.0)
	return {
		"liga": liga, "copa": copa, "champions": ucl,
		"europa": 0.1 * clampf(1.0 - absf(r - 84.0) / 8.0, 0.0, 1.0),
		"conference": 0.1 * clampf(1.0 - absf(r - 77.0) / 7.0, 0.0, 1.0),
		"clubes": 0.5 * ucl,
	}
