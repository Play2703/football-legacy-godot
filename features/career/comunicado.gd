class_name Comunicado



























const ID: String = "comunicado"

const REEMBOLSO: float = 0.5
const TOPE: int = 6

const PRENSA_PERDON: int = 2

const EXTRA_TECNICO: int = -2


const ROJA: String = "roja"
const PRENSA: String = "prensa"
const FESTEJO: String = "festejo"
const MOTIVOS: Array[String] = [ROJA, PRENSA, FESTEJO]



const HECHO_PERDON: String = "comunicado_perdon"
const HECHO_SOSTIENE: String = "comunicado_sostiene"
const HECHO_SILENCIO: String = "comunicado_silencio"


const VIGILA_DOBLE: String = "doble"
const VIGILA_EXTRA: String = "extra"




static func dano(antes: Dictionary, despues: Dictionary, canales: Array) -> Dictionary:
	var out: Dictionary = {}
	for k in canales:
		var c: String = String(k)
		if c == "prensa" or not antes.has(c) or not despues.has(c):
			continue
		var d: int = int(antes[c]) - int(despues[c])
		if d > 0:
			out[c] = d
	return out





static func reembolso(d: Dictionary, previo: Dictionary, ahora: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for k in d:
		var c: String = String(k)
		if c == "prensa" or not previo.has(c) or not ahora.has(c):
			continue
		var m: int = mini(mini(roundi(float(d[k]) * REEMBOLSO), TOPE),
			maxi(0, int(previo[c]) - int(ahora[c])))
		if m > 0:
			out[c] = m
	return out







static func castigo(marca: Dictionary, tipo: String) -> Dictionary:
	var extra: bool = bool(marca.get("extra", false))
	var doble: bool = bool(marca.get("doble", false))
	if tipo != ROJA and doble:
		return {"tec": 0, "factor": Multas.factor_reincide(true)}
	return {"tec": EXTRA_TECNICO if extra else 0, "factor": 1.0}



static func cobra(c: Dictionary) -> bool:
	return int(c.get("tec", 0)) != 0 or float(c.get("factor", 1.0)) > 1.0






static func acumula(pend: Dictionary, motivo: String, d: Dictionary, previo: Dictionary) -> Dictionary:
	var out: Dictionary = pend.duplicate(true)
	var dd: Dictionary = Dictionary(out.get("dano", {}))
	var pp: Dictionary = Dictionary(out.get("previo", {}))
	for k in d:
		dd[k] = int(dd.get(k, 0)) + int(d[k])
		if not pp.has(k) and previo.has(k):
			pp[k] = int(previo[k])
	out["dano"] = dd
	out["previo"] = pp
	if String(out.get("motivo", "")) != ROJA:
		out["motivo"] = motivo
	return out





static func sanea_pend(v: Variant, canales: Array) -> Dictionary:
	if not (v is Dictionary):
		return {}
	var src: Dictionary = v
	var motivo: String = String(src.get("motivo", ""))
	if not MOTIVOS.has(motivo) or not (src.get("dano") is Dictionary) \
			or not (src.get("previo") is Dictionary):
		return {}
	var dd: Dictionary = {}
	var pp: Dictionary = {}
	var d_src: Dictionary = src["dano"]
	var p_src: Dictionary = src["previo"]
	for k in d_src:
		var c: String = String(k)
		var n: Variant = d_src[k]
		if c == "prensa" or not canales.has(c) or not (n is int or n is float) or int(n) <= 0:
			continue
		var p: Variant = p_src.get(c)
		if not (p is int or p is float):
			continue
		dd[c] = int(n)
		pp[c] = clampi(int(p), 0, 100)
	if dd.is_empty():
		return {}
	return {"temporada": int(src.get("temporada", 0)), "dia": int(src.get("dia", 0)),
		"motivo": motivo, "dano": dd, "previo": pp, "sembrado": bool(src.get("sembrado", false))}



static func sanea_marca(v: Variant) -> Dictionary:
	if not (v is Dictionary):
		return {}
	var src: Dictionary = v
	var t: Variant = src.get("temporada")
	if not (t is int or t is float):
		return {}
	return {"temporada": int(t), "perdon": bool(src.get("perdon", false)),
		"extra": bool(src.get("extra", false)), "doble": bool(src.get("doble", false))}
