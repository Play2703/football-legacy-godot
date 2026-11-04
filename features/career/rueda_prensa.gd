class_name RuedaPrensa
extends RefCounted


















const CRECIDO: String = "crecido"





const ZASCA: String = "zasca"


const ZASCA_NOTA: float = 5.5


const ZASCA_ALTA: float = 7.0
const ZASCA_BAJA: float = 6.0



const ZASCA_ESCALON: int = 2




const MVP_HAT: String = "hat"
const MVP_FINAL: String = "final"
const MVP_TEXTOS: Dictionary = {
	MVP_HAT: {"title": "TRES GOLES Y EL MICRO",
		"desc": "Hat-trick y el balón bajo el brazo. La cadena te para con él todavía en la mano y quiere oírtelo decir en directo."},
	MVP_FINAL: {"title": "EL GOL DEL FINAL",
		"desc": "Tu gol en el último suspiro decidió el partido. La cadena te para con el estadio aún temblando y quiere la frase de la noche."},
}











static func socio_del_micro(te_asisten: Dictionary, top: Array) -> String:
	var mejor: String = ""
	var n_mejor: int = 0
	for nm in te_asisten:
		var n: int = int(te_asisten[nm])
		if n > n_mejor and not String(nm).is_empty():
			mejor = String(nm)
			n_mejor = n
	if not mejor.is_empty():
		return mejor
	for fila in top:
		if fila is Dictionary and int((fila as Dictionary).get("v", 0)) > 0:
			return String((fila as Dictionary).get("name", ""))
	return ""







static func gol_final(marcas: Array, gf: int, ga: int) -> bool:
	return gf > ga and marcas.has(ga + 1)




static func mvp_variante(goals: int, es_gol_final: bool) -> String:
	if goals >= 3:
		return MVP_HAT
	if es_gol_final:
		return MVP_FINAL
	return ""









static func micro_mvp(data: Dictionary, ev: Dictionary, pintado: String) -> Dictionary:
	var patch: Dictionary = {}
	var v: String = mvp_variante(int(data.get("goals", 0)), bool(data.get("gol_final", false)))
	if MVP_TEXTOS.has(v):
		patch["title"] = I18n.t(String(MVP_TEXTOS[v]["title"]))
		patch["desc"] = I18n.t(String(MVP_TEXTOS[v]["desc"]))
	var socio: String = String(data.get("socio", ""))
	if not socio.is_empty() and ev.has("a_socio"):
		var a: Dictionary =(ev["a_socio"] as Dictionary).duplicate(true)
		a["label"] = I18n.tf(String(a["label"]), [pintado])
		patch["a"] = a
	else:
		socio = ""
	return {"patch": patch, "socio": socio}







static func sale_penal(fallados: int, minutes: int, titular: bool, nat: bool,
		roja: bool, hay_decision: bool, mvp: bool) -> bool:
	return fallados > 0 and minutes > 0 and titular and not nat \
			and not roja and not hay_decision and not mvp






static func sale_zasca(minutes: int, rating: float, result: int, escalon: int, nat: bool,
		penal: bool, mvp: bool, hay_decision: bool) -> bool:
	return minutes > 0 and rating < ZASCA_NOTA and result >= 0 \
			and escalon >= ZASCA_ESCALON and not nat and not penal and not mvp \
			and not hay_decision







const P_PIQUE: float = 1.0




const PIQUE_ESCALON: int = 1












static func sale_pique(nat: bool, comp_prox: String, opp: String, derbi: bool,
		final_pend: bool, es_final: bool, ya_bravata: bool, ya_esta_temporada: bool,
		penal: bool, zasca: bool, mvp: bool, decision: bool, micro_prensa: bool,
		dado: float, escalon: int) -> bool:
	if nat or comp_prox == "nat" or opp.is_empty():
		return false
	if escalon < PIQUE_ESCALON:
		return false
	if not derbi and not final_pend:
		return false
	if es_final or ya_bravata or ya_esta_temporada:
		return false
	if penal or zasca or mvp or decision or micro_prensa:
		return false
	return dado < P_PIQUE





static func zasca_cobro(nota: float, minutos: int) -> Dictionary:
	if minutos <= 0:
		return {}
	if nota >= ZASCA_ALTA:
		return {"prensa": 6.0, "aficion": 3.0}
	if nota < ZASCA_BAJA:
		return {"prensa": -6.0, "tecnico": -3.0}
	return {}











const AMB_FINAL_GANADA: String = "final_ganada"
const AMB_FINAL_PERDIDA: String = "final_perdida"
const AMB_DERBI: String = "derbi"





static func ambiente(es_final: bool, ganada: bool, perdida: bool, derbi: bool,
		result: int, nat: bool) -> String:
	if nat:
		return ""
	if es_final and ganada:
		return AMB_FINAL_GANADA
	if es_final and perdida:
		return AMB_FINAL_PERDIDA
	if derbi and result > 0:
		return AMB_DERBI
	return ""










static func viste_tela(cfg: Dictionary, tela: Dictionary, mio: bool,
		clave: String = "") -> Dictionary:
	if tela.is_empty():
		return cfg
	var out: Dictionary = cfg.duplicate()
	var dia: Variant = tela.get("dia", {})
	if dia is Dictionary:
		out.merge(dia, true)
	var compas: Variant = tela.get("compas", {})
	var suya: Variant = tela.get("yo", {}) if mio \
			else (compas.get(clave, {}) if compas is Dictionary else {})
	if suya is Dictionary:
		out.merge(suya, true)
	for k in ["barro", "pasto", "barro_sem"]:
		if out.has(k):
			out[k] = int(out[k])
	if (int(out.get("barro", 0)) > 0 or int(out.get("pasto", 0)) > 0) \
			and not out.has("barro_sem"):
		out["barro_sem"] = posmod(hash(clave), KitRecolor.BARRO_PLAYERA.size())
	return out
