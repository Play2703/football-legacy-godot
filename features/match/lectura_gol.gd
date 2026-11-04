extends RefCounted






































const PESO_TRAMITE: int = 0
const PESO_CUENTA: int = 1
const PESO_AGONICO: int = 2
const PESO_HISTORICO: int = 3



const MIN_TARDIO: int = 75



const MIN_DECIDE: int = 85


const GOLEADA: int = 3




const AL_SUELO: Array[int] = [0, 0, 3, -1]
const TODOS_MENOS: int = 2


const M_TRAMITE: String = "tramite"
const M_HONOR: String = "honor"
const M_DESCUENTO: String = "descuento"
const M_CUENTA: String = "cuenta"
const M_AGONICO: String = "agonico"
const M_REMONTADA: String = "remontada"
const M_FINAL: String = "final"
const M_PASE: String = "pase"
const M_TABLA: String = "tabla"




const DT_MARCA: Array[String] = ["", "", "festeja", "festeja"]
const DT_ENCAJA: Array[String] = ["", "", "enojo", "se_va"]


const GRADA_FIESTA: String = "fiesta"
const GRADA_SOSTENIDA: String = "sostenida"
const GRADA_HISTORICA: String = "historica"
const GRADA_EMPUJA: String = "empuja"
const GRADA_OLE: String = "ole"
const GRADA_LAMENTO: String = "lamento"
const GRADA_LAMENTO_LARGO: String = "largo"
const GRADA_SE_VACIA: String = "se_vacia"
















static func leer(ctx: Dictionary) -> Dictionary:
	var nuestro: bool = bool(ctx.get("nuestro", true))
	var minuto: int = int(ctx.get("minuto", 0))
	var prorroga: bool = bool(ctx.get("prorroga", false))
	var antes: int = int(ctx.get("antes", 0))
	var g0: int = int(ctx.get("global_antes", antes))
	var d1: int = antes + 1
	var g1: int = g0 + 1
	var tardio: bool = prorroga or minuto >= MIN_TARDIO
	var decide: bool = prorroga or minuto >= MIN_DECIDE


	var iguala: bool = g1 == 0
	var adelanta: bool = g1 == 1



	var sembrado: int = int(ctx.get("sembrado", 0))
	if sembrado != 0:
		iguala = false
		adelanta = _con_dueno(g1, sembrado) == 1
	var r: Dictionary = {
		"iguala": iguala,
		"adelanta": adelanta,
		"descuento": g1 == -1,
		"goleada": d1 >= GOLEADA,
		"tabla": _cambia_tabla(nuestro, antes, int(ctx.get("basta", 0))),
		"invade_dt": false,
	}
	var peso: int = PESO_TRAMITE
	var motivo: String = M_TRAMITE
	if iguala or adelanta:
		peso = PESO_CUENTA
		motivo = M_CUENTA
		if tardio:
			peso = PESO_AGONICO
			motivo = M_AGONICO
		elif adelanta and bool(ctx.get("estuvo_abajo", false)):
			peso = PESO_AGONICO
			motivo = M_REMONTADA
	elif g1 == -1:
		peso = PESO_CUENTA
		motivo = M_DESCUENTO
	elif g1 <= -2:
		motivo = M_HONOR

	if decide:
		if bool(ctx.get("final", false)) and (adelanta or (iguala and not prorroga)):


			peso = PESO_HISTORICO
			motivo = M_FINAL
			r["invade_dt"] = true
		elif bool(ctx.get("eliminatoria", false)) and adelanta:
			peso = PESO_HISTORICO
			motivo = M_PASE
		elif bool(r["tabla"]):
			peso = PESO_HISTORICO
			motivo = M_TABLA
	r["peso"] = peso
	r["motivo"] = motivo



	r["portero_cruza"] = nuestro and peso >= PESO_AGONICO
	r["banquillo"] = nuestro and peso >= PESO_HISTORICO
	r["al_suelo"] = AL_SUELO[peso]
	r["dt_marca"] = DT_MARCA[peso]
	r["dt_encaja"] = DT_ENCAJA[peso]
	r["grada_marca"] = _grada_marca(peso, motivo, bool(r["goleada"]))
	r["grada_encaja"] = GRADA_SE_VACIA if peso >= PESO_HISTORICO \
			else (GRADA_LAMENTO_LARGO if peso == PESO_AGONICO else GRADA_LAMENTO)
	return r




static func _grada_marca(peso: int, motivo: String, goleada: bool) -> String:
	if peso >= PESO_HISTORICO:
		return GRADA_HISTORICA
	if peso == PESO_AGONICO:
		return GRADA_SOSTENIDA
	if motivo == M_DESCUENTO:
		return GRADA_EMPUJA
	if goleada:
		return GRADA_OLE
	return GRADA_FIESTA







static func _cambia_tabla(nuestro: bool, antes: int, basta: int) -> bool:
	if basta <= 0:
		return false
	var yo_antes: int = antes if nuestro else - antes
	var yo_despues: int = yo_antes +(1 if nuestro else -1)
	return _cierra(yo_antes, basta) != _cierra(yo_despues, basta)


static func _cierra(dif: int, basta: int) -> bool:
	return dif > 0 if basta >= 3 else dif >= 0



static func cuantos_al_suelo(lectura: Dictionary, n: int) -> int:
	var k: int = int(lectura.get("al_suelo", 0))
	if k < 0:
		return maxi(n - TODOS_MENOS, 0)
	return mini(k, n)


























const TRAMO_DESDE: int = 80
const TRAMO_DESDE_PRORROGA: int = 110
const TRAMO_DURA: float = 10.0
const TRAMO_HORA: String = "hora"
const TRAMO_EMPUJA: String = "empuja"






static func tramo(ctx: Dictionary) -> Dictionary:
	var r: Dictionary = {"tuya": "", "rival": "", "avance": 0.0}
	var elim: bool = bool(ctx.get("eliminatoria", false))
	var basta: int = int(ctx.get("basta", 0))
	if not elim and basta <= 0:
		return r
	var desde: int = TRAMO_DESDE_PRORROGA if bool(ctx.get("prorroga", false)) else TRAMO_DESDE
	var minuto: int = int(ctx.get("minuto", 0))
	if minuto < desde:
		return r
	r["avance"] = clampf(float(minuto - desde) / TRAMO_DURA, 0.0, 1.0)
	var dif: int = int(ctx.get("dif", 0))
	if elim:
		var g: int = dif + int(ctx.get("carry", 0))


		var sem: int = int(ctx.get("sembrado", 0))
		if sem != 0:
			g = _con_dueno(g, sem)
		r["tuya"] = _a_un_gol(g)
		r["rival"] = _a_un_gol(- g)
		return r
	if _cierra(dif, basta) and not _cierra(dif - 1, basta):
		r["tuya"] = TRAMO_HORA
	elif not _cierra(dif, basta) and _cierra(dif + 1, basta):
		r["tuya"] = TRAMO_EMPUJA
	r["rival"] = _a_un_gol(- dif)
	return r









static func _con_dueno(g: int, sembrado: int) -> int:
	return 2 * g + sembrado


static func _a_un_gol(g: int) -> String:
	if g == 1:
		return TRAMO_HORA
	if g == -1:
		return TRAMO_EMPUJA
	return ""





















const PITIDO_FINAL: String = "final"
const PITIDO_TITULO: String = "titulo"
const PITIDO_ASCENSO: String = "ascenso"
const PITIDO_SALVACION: String = "salvacion"
const PITIDO_DESCENSO: String = "descenso"






static func pitido(ctx: Dictionary) -> Dictionary:
	if bool(ctx.get("tanda", false)):
		return {}
	var dif: int = int(ctx.get("dif", 0))
	if bool(ctx.get("final", false)):
		var g: int = signi(dif + int(ctx.get("carry", 0)))
		if g == 0:
			return {}
		return {"motivo": PITIDO_FINAL, "festeja": g}
	var basta: int = int(ctx.get("basta", 0))
	if basta > 0 and _cierra(dif, basta):
		var tipo: String = String(ctx.get("tipo", PITIDO_TITULO))
		if not tipo in [PITIDO_TITULO, PITIDO_ASCENSO, PITIDO_SALVACION]:
			tipo = PITIDO_TITULO
		return {"motivo": tipo, "festeja": 1}
	var condena: int = int(ctx.get("condena", -1))
	if condena >= 0 and _puntos(dif) <= condena:
		return {"motivo": PITIDO_DESCENSO, "festeja": 0}
	return {}


static func _puntos(dif: int) -> int:
	return 3 if dif > 0 else (1 if dif == 0 else 0)








static func grada_del_pitido(r: Dictionary, dif: int, carry: int) -> int:
	match String(r.get("motivo", "")):
		PITIDO_FINAL:
			return int(r.get("festeja", 0)) * maxi(absi(dif + carry), 1)
		PITIDO_TITULO, PITIDO_ASCENSO, PITIDO_SALVACION:
			return maxi(dif, 1)
	return dif
