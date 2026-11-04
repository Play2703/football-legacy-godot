extends RefCounted




























const EV_GOL_RIVAL: String = "gol_rival"
const EV_GOL_EQUIPO: String = "gol_equipo"
const EV_ROJA_MIA: String = "roja_mia"
const EV_FINAL: String = "final"
const EV_TE_SACA: String = "te_saca"


const EV_FALLO: String = "fallo"
const EV_PALO: String = "palo"
const EV_PARADA: String = "parada"
const EV_OFFSIDE: String = "offside"





const EV_OFFSIDE_COMPA: String = "offside_compa"



const EV_PIQUE_CALMA: String = "pique_calma"
const EV_PIQUE_ENCARA: String = "pique_encara"




const EV_GOL_MIO_VS_EX: String = "gol_mio_vs_ex"








const ROTULO_EX_GOL_CULPA: String = "TU EX TÉCNICO NO CONTABA CONTIGO"
const ROTULO_EX_GOL_QUIERE: String = "TU EX TÉCNICO APLAUDE TU GOL"
const ROTULO_EX_GOL_NEUTRAL: String = "GOL A TU EX TÉCNICO"
const ROTULO_EX_FINAL_SE_VA: String = "TU EX TÉCNICO SE VA SIN MIRARTE"
const ROTULO_EX_FINAL_APLAUDE: String = "TU EX TÉCNICO TE APLAUDE"
const ROTULO_EX_FINAL_FESTEJA: String = "TU EX TÉCNICO FESTEJA"



const MIN_TARDIO: int = 75



const CORTES_MAX: int = 2


const CORTES_ANTES_TARDIO: int = 1



const SECS_CORTE: float = 2.2
const SECS_FINAL: float = 2.6


const SECS_CAMBIO: float = 4.8




const REL_TE_DEFIENDE: int = 60
const REL_TE_CULPA: int = 40


const CARACTER_TE_DEFIENDE: Array[String] = ["padrino", "continuista"]
const CARACTER_TE_CULPA: Array[String] = ["exigente", "descarte"]























static func elegir(ev: String, ctx: Dictionary) -> Dictionary:
	var minuto: int = int(ctx.get("minuto", 0))
	var nos: int = int(ctx.get("nos", 0))
	var ellos: int = int(ctx.get("ellos", 0))
	var ultimo: String = String(ctx.get("ultimo", ""))
	var queda_corte: bool = int(ctx.get("cortes", 0)) < CORTES_MAX
	match ev:
		EV_GOL_RIVAL:


			if minuto < MIN_TARDIO or not queda_corte:
				return {}
			if not (ellos == nos or ellos == nos + 1):
				return {}


			if ultimo == "enojo":
				return _r(false, "festeja", false, SECS_CORTE, true)
			return _r(true, "enojo", false, SECS_CORTE, true)
		EV_GOL_EQUIPO:



			if minuto < MIN_TARDIO or not queda_corte:
				return {}
			if not (nos == ellos or nos == ellos + 1):
				return {}
			if ultimo == "festeja":
				return _r(false, "enojo", false, SECS_CORTE, true)
			return _r(true, "festeja", false, SECS_CORTE, true)
		EV_ROJA_MIA:


			if not queda_corte:
				return {}
			if _te_defiende(ctx):
				return _r(true, "protesta", false, SECS_CORTE, true)


			if _te_culpa(ctx):
				return _r(true, "espaldas", true, SECS_CORTE, true)


			return _r(true, "brazos", false, SECS_CORTE, true)
		EV_FALLO, EV_PALO, EV_PARADA, EV_OFFSIDE, EV_OFFSIDE_COMPA, EV_PIQUE_CALMA, \
				EV_PIQUE_ENCARA:
			return _tu_jugada(ev, ctx)
		EV_GOL_MIO_VS_EX:
			return _gol_al_ex(ctx)
		EV_FINAL:





			var del_ex: Dictionary = _final_con_ex(ctx)
			if not del_ex.is_empty():
				return del_ex
			if nos > ellos:
				return _r(true, "festeja", false, SECS_FINAL, true)
			if nos < ellos:
				return _r(true, "se_va", true, SECS_FINAL, true)
			return {}
		EV_TE_SACA:



			if _te_culpa(ctx):
				return _r(true, "espaldas", true, SECS_CAMBIO, false)

			if _te_defiende(ctx):
				return _r(true, "aplaude", false, SECS_CAMBIO, false)
			return {}
	return {}















static func _tu_jugada(ev: String, ctx: Dictionary) -> Dictionary:
	var cortes: int = int(ctx.get("cortes", 0))
	var tope: int = CORTES_MAX if int(ctx.get("minuto", 0)) >= MIN_TARDIO \
			else CORTES_ANTES_TARDIO
	if cortes >= tope:
		return {}
	var gesto: String = ""
	match ev:
		EV_FALLO:
			if int(ctx.get("racha", 0)) < 2:
				return {}
			gesto = "aplaude" if _te_defiende(ctx) \
					else ("senala" if _te_culpa(ctx) else "lamento")
		EV_PALO:
			gesto = "lamento"
		EV_PARADA:
			if _te_defiende(ctx):
				gesto = "aplaude"
			elif _te_culpa(ctx):
				gesto = "brazos"
			else:
				return {}
		EV_OFFSIDE:
			gesto = "senala" if _te_culpa(ctx) else "protesta"
		EV_OFFSIDE_COMPA:
			gesto = "protesta"
		EV_PIQUE_CALMA:
			if _te_culpa(ctx):
				return {}
			gesto = "aplaude"
		EV_PIQUE_ENCARA:
			gesto = "protesta" if _te_defiende(ctx) \
					else ("senala" if _te_culpa(ctx) else "brazos")

	if gesto == String(ctx.get("ultimo", "")):
		return {}
	return _r(true, gesto, false, SECS_CORTE, true)












static func _gol_al_ex(ctx: Dictionary) -> Dictionary:
	var ex: Dictionary = ctx.get("ex", {})
	if ex.is_empty():
		return {}
	var ch: String = String(ex.get("char", "neutral"))
	if ch in CARACTER_TE_CULPA:
		return _r_ex("brazos", true, SECS_CORTE, ROTULO_EX_GOL_CULPA)
	if ch in CARACTER_TE_DEFIENDE:
		return _r_ex("aplaude", false, SECS_CORTE, ROTULO_EX_GOL_QUIERE)
	return _r_ex("lamento", false, SECS_CORTE, ROTULO_EX_GOL_NEUTRAL)








static func _final_con_ex(ctx: Dictionary) -> Dictionary:
	var ex: Dictionary = ctx.get("ex", {})
	if ex.is_empty():
		return {}
	var nos: int = int(ctx.get("nos", 0))
	var ellos: int = int(ctx.get("ellos", 0))
	var ch: String = String(ex.get("char", "neutral"))
	if nos > ellos:
		if ch in CARACTER_TE_DEFIENDE:
			return _r_ex("aplaude", false, SECS_FINAL, ROTULO_EX_FINAL_APLAUDE)
		return _r_ex("se_va", true, SECS_FINAL, ROTULO_EX_FINAL_SE_VA)
	if nos < ellos and ch in CARACTER_TE_CULPA:
		return _r_ex("festeja", false, SECS_FINAL, ROTULO_EX_FINAL_FESTEJA)
	return {}



static func _r_ex(gesto: String, espaldas: bool, secs: float, rotulo: String) -> Dictionary:
	var r: Dictionary = _r(false, gesto, espaldas, secs, true)
	r["rotulo"] = rotulo
	return r



static func _te_defiende(ctx: Dictionary) -> bool:
	var rel: int = int(ctx.get("rel", 50))
	if rel >= REL_TE_DEFIENDE:
		return true
	if rel < REL_TE_CULPA:
		return false
	return String(ctx.get("caracter", "neutral")) in CARACTER_TE_DEFIENDE




static func _te_culpa(ctx: Dictionary) -> bool:
	var rel: int = int(ctx.get("rel", 50))
	if rel < REL_TE_CULPA:
		return true
	if rel >= REL_TE_DEFIENDE:
		return false
	return String(ctx.get("caracter", "neutral")) in CARACTER_TE_CULPA


static func _r(mio: bool, gesto: String, espaldas: bool, secs: float,
		corte: bool) -> Dictionary:
	return {"mio": mio, "gesto": gesto, "espaldas": espaldas, "secs": secs,
		"corte": corte}
