class_name Liguilla
extends RefCounted






















































const PAISES: Array[String] = ["México"]






const RONDAS: Array[String] = ["Play-in", "Play-in", "Cuartos", "Semifinal", "Final"]
const PLAYIN_A: int = 0
const PLAYIN_B: int = 1
const CUARTOS: int = 2
const SEMIS: int = 3
const FINAL: int = 4


const DOS_PIERNAS: Array[bool] = [false, false, true, true, true]





const REGLA: Array[String] = ["penales", "penales", "sembrado", "sembrado", "prorroga"]












const FECHAS: Array = [
	[2, 0, 1.3], [2, 1, 1.8],
	[3, 0, 2.3], [3, 1, 2.8],
	[4, 0, 3.3], [4, 1, 3.8],
]





const SEMANAS: float = 4.0



const CLUBES_MIN: int = 8

















const TORNEOS: Array[String] = ["Apertura", "Clausura"]
const APERTURA: int = 0
const CLAUSURA: int = 1










static func aplica(country: String, div: int) -> bool:
	return div >= 1 and PAISES.has(country)





static func torneo_de_jornada(round_idx: int, total: int) -> int:
	return APERTURA if round_idx < total / 2 else CLAUSURA



static func jornada_en_torneo(round_idx: int, total: int) -> int:
	return round_idx + 1 -(total / 2 if round_idx >= total / 2 else 0)






static func etiqueta_jornada(round_idx: int, total: int) -> String:
	return "%s · J%d/%d" % [TORNEOS[torneo_de_jornada(round_idx, total)].to_upper(),
		jornada_en_torneo(round_idx, total), total / 2]







static func mismo_torneo(a: Dictionary, b: Dictionary) -> bool:
	return int(a.get("torneo", CLAUSURA)) == int(b.get("torneo", CLAUSURA))





static func etiqueta(ko_idx: int, leg: int) -> String:
	var r: String = RONDAS[ko_idx].to_upper()
	if DOS_PIERNAS[ko_idx]:
		r += " (IDA)" if leg < 1 else " (VUELTA)"
	return "LIGUILLA · %s" % r




static func siembra(orden: Array) -> Dictionary:
	var out: Dictionary = {}
	for i in mini(orden.size(), CLUBES_MIN):
		out[String(orden[i])] = i + 1
	return out




static func mejor(a: String, b: String, seed_of: Dictionary) -> String:
	return a if int(seed_of.get(a, 99)) <= int(seed_of.get(b, 99)) else b


static func _cruce(a: String, b: String) -> Dictionary:
	return {"a": a, "b": b, "winner": "", "score": ""}



static func _cruce_ida_vuelta(x: String, y: String, seed_of: Dictionary) -> Dictionary:
	var bueno: String = mejor(x, y, seed_of)
	var malo: String = y if bueno == x else x
	return _cruce(malo, bueno)



static func perdedor(t: Dictionary) -> String:
	var w: String = String(t.get("winner", ""))
	if w.is_empty():
		return ""
	return String(t["b"]) if w == String(t["a"]) else String(t["a"])




static func cuartos(orden: Array) -> Array:
	if orden.size() < CLUBES_MIN:
		return []
	var seed_of: Dictionary = siembra(orden)
	var out: Array = []
	for i in 4:
		out.append(_cruce_ida_vuelta(String(orden[i]), String(orden[7 - i]), seed_of))
	return out






static func cuadro_nuevo(orden: Array) -> Array:
	var cu: Array = cuartos(orden)
	return [] if cu.is_empty() else [[], [], cu]






static func siguiente(bracket: Array, k: int, _orden: Array, seed_of: Dictionary) -> Array:
	if k < CUARTOS or k >= FINAL or k >= bracket.size():
		return []
	var ganadores: Array = []
	for t in bracket[k]:
		var w: String = String((t as Dictionary).get("winner", ""))
		if w.is_empty():
			return []
		ganadores.append(w)
	ganadores.sort_custom(func(x, y):
		return int(seed_of.get(x, 99)) < int(seed_of.get(y, 99)))
	var out: Array = []
	var n: int = ganadores.size()
	for i in int(n / 2.0):
		out.append(_cruce_ida_vuelta(String(ganadores[i]),
			String(ganadores[n - 1 - i]), seed_of))
	return out



static func goles(s: String) -> Array:
	var p: PackedStringArray = s.split("-")
	if p.size() != 2 or not p[0].is_valid_int() or not p[1].is_valid_int():
		return []
	return [int(p[0]), int(p[1])]





static func decide(k: int, a: String, b: String, ga: int, gb: int,
		seed_of: Dictionary, desempate: String) -> String:
	if ga != gb:
		return a if ga > gb else b
	if REGLA[k] == "sembrado":
		return mejor(a, b, seed_of)
	return desempate







static func p_desempate(k: int, p_cruce: float) -> float:
	var peso: float = 0.5 if REGLA[k] == "prorroga" else 0.25
	return 0.5 +(p_cruce - 0.5) * peso















static func juega_ronda(bracket: Array, k: int, seed_of: Dictionary, ctx: Dictionary,
		salvo: String = "") -> void:
	if k < 0 or k >= bracket.size():
		return
	var marcador: Callable = ctx["marcador"]
	for t in bracket[k]:
		var tie: Dictionary = t
		if not String(tie.get("winner", "")).is_empty():
			continue
		var a: String = String(tie["a"])
		var b: String = String(tie["b"])
		if not salvo.is_empty() and (a == salvo or b == salvo):
			continue
		var ga: int = 0
		var gb: int = 0
		if DOS_PIERNAS[k]:
			var ida: Array = goles(String(tie.get("leg1", "")))
			if ida.is_empty():
				var s1: Array = marcador.call(a, b)
				ida = [int(s1[0]), int(s1[1])]
				tie["leg1"] = "%d-%d" % ida
			var s2: Array = marcador.call(b, a)
			tie["leg2"] = "%d-%d" % [int(s2[1]), int(s2[0])]
			ga = int(ida[0]) + int(s2[1])
			gb = int(ida[1]) + int(s2[0])
		else:
			var s: Array = marcador.call(a, b)
			ga = int(s[0])
			gb = int(s[1])
		var tanda: String = ""
		if ga == gb and REGLA[k] != "sembrado":
			var p: float = p_desempate(k, float((ctx["p"] as Callable).call(a, b)))
			tanda = a if float((ctx["azar"] as Callable).call()) < p else b
			tie["pens"] = tanda
		tie["winner"] = decide(k, a, b, ga, gb, seed_of, tanda)
		tie["score"] = "%d-%d" % [ga, gb]





static func juega_idas(bracket: Array, k: int, ctx: Dictionary, salvo: String = "") -> void:
	if k < 0 or k >= bracket.size() or not DOS_PIERNAS[k]:
		return
	var marcador: Callable = ctx["marcador"]
	for t in bracket[k]:
		var tie: Dictionary = t
		if not String(tie.get("winner", "")).is_empty() \
				or not String(tie.get("leg1", "")).is_empty():
			continue
		var a: String = String(tie["a"])
		var b: String = String(tie["b"])
		if not salvo.is_empty() and (a == salvo or b == salvo):
			continue
		var s1: Array = marcador.call(a, b)
		tie["leg1"] = "%d-%d" % [int(s1[0]), int(s1[1])]



static func ronda_abierta_de(bracket: Array, key: String) -> int:
	for k in bracket.size():
		for t in bracket[k]:
			var tie: Dictionary = t
			if String(tie.get("winner", "")).is_empty() \
					and (String(tie["a"]) == key or String(tie["b"]) == key):
				return k
	return -1







static func avanza(bracket: Array, orden: Array, seed_of: Dictionary, ctx: Dictionary,
		espera: String = "") -> void:
	var guarda: int = 0
	while guarda < 12 and not bracket.is_empty():
		guarda += 1
		var k: int = bracket.size() - 1
		var abierta: bool = false
		for t in bracket[k]:
			if String((t as Dictionary).get("winner", "")).is_empty():
				abierta = true
				break
		if abierta:
			if not espera.is_empty() and ronda_abierta_de(bracket, espera) >= 0:
				return
			juega_ronda(bracket, k, seed_of, ctx)
			continue
		if k >= FINAL:
			return
		var sig: Array = siguiente(bracket, k, orden, seed_of)
		if sig.is_empty():
			return
		bracket.append(sig)















const CAMPEONES: String = "Campeón de Campeones"
const CAMPEONES_SEMANA: float = 2.45








static func campeones_cruce(ap: String, cl: String, anual: Array) -> Array:
	if ap.is_empty() or cl.is_empty():
		return []
	if ap != cl:
		return [ap, cl]
	for id in anual:
		if not String(id).is_empty() and String(id) != ap:
			return [ap, String(id)]
	return []



static func campeon(bracket: Array) -> String:
	if bracket.size() <= FINAL or (bracket[FINAL] as Array).is_empty():
		return ""
	return String((bracket[FINAL][0] as Dictionary).get("winner", ""))


static func subcampeon(bracket: Array) -> String:
	if bracket.size() <= FINAL or (bracket[FINAL] as Array).is_empty():
		return ""
	return perdedor(bracket[FINAL][0])





static func simula(orden: Array, ctx: Dictionary) -> Dictionary:
	if orden.size() < CLUBES_MIN:
		return {}
	var ocho: Array = orden.slice(0, CLUBES_MIN)
	var seed_of: Dictionary = siembra(ocho)
	var bracket: Array = cuadro_nuevo(ocho)
	avanza(bracket, ocho, seed_of, ctx)
	return {"orden": ocho, "seed_of": seed_of, "bracket": bracket,
		"winner": campeon(bracket), "runner_up": subcampeon(bracket),
		"superlider": String(orden[0])}
