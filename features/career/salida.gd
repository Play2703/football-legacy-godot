class_name Salida
extends RefCounted






























const VIA_TRASPASO: String = "traspaso"
const VIA_CESION: String = "cesion"






const MINUTOS: String = "a"
const MEJOR: String = "b"
const PROYECTO: String = "c"
const MOTIVOS: Array[String] = [MINUTOS, MEJOR, PROYECTO]















const PACTO: String = "d"




const DECLARADO: String = "declarado"
const CUMPLIDO: String = "cumplido"
const NEUTRO: String = "neutro"
const CONTRADICHO: String = "contradicho"
const RETIRADO: String = "retirado"
const CADUCADO: String = "caducado"
const ANULADO: String = "anulado"




const ARCHIVO_MAX: int = 8



const REPITE_MULT: float = 1.5


const REINCIDE_MULT: float = 1.25
const REINCIDE_SEASONS: int = 2




const BASE_TRASPASO: Dictionary = {"tecnico": -5.0, "equipo": -3.5, "aficion": -4.5}




const CESION_FX: Dictionary = {
	"": {"tecnico": -1.75},
	MINUTOS: {"tecnico": -1.75},
	MEJOR: {"tecnico": -2.25},
	PROYECTO: {"tecnico": -3.5, "equipo": -1.0},
}



const RETRACT_BASE: Dictionary = {"aficion": -2.75}




const PACTO_FX: Dictionary = {"tecnico": -1.0}



const PACTO_CUMPLE: Dictionary = {"prensa": 2.0, "aficion": 3.0}
const PACTO_ROTO_MULT: float = 1.5



const PACTO_SUELO_FOTO: int = 55


const PACTO_SELL_ON: float = 0.15





static func pacto_cumplido(coh: Dictionary) -> bool:
	return String(coh.get("motivo", "")) == PACTO \
			and String(coh.get("estado", "")) == CUMPLIDO








static func fx(via: String, motivo: String, ctx: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	if via == VIA_CESION:
		out =(CESION_FX.get(motivo, CESION_FX[""]) as Dictionary).duplicate()
	elif motivo == PACTO:
		out = PACTO_FX.duplicate()
	else:
		out = _fx_traspaso(motivo, ctx)
	var m: float = mult(ctx)
	for k in out.keys():
		out[k] = minf(float(out[k]), 0.0) * m
	return out



static func _fx_traspaso(motivo: String, ctx: Dictionary) -> Dictionary:
	var out: Dictionary = BASE_TRASPASO.duplicate()
	var rol: int = int(ctx.get("rol", Standing.ContractRole.ROTACION))
	var hundido: bool = bool(ctx.get("hundido", false))
	var arriba: bool = bool(ctx.get("arriba", false)) and not hundido
	match motivo:
		MINUTOS:
			if rol >= Standing.ContractRole.TITULAR:


				_suma(out, "tecnico", -1.5)
			else:

				_suma(out, "tecnico", 2.5)
				_suma(out, "equipo", 1.5)
				_suma(out, "aficion", 1.0)
			if bool(ctx.get("lesionado", false)):
				_suma(out, "tecnico", -1.0)
			if bool(ctx.get("veterano", false)):
				_suma(out, "aficion", 1.0)
		MEJOR:

			_suma(out, "tecnico", 1.0)
			_suma(out, "aficion", -2.0)
			if hundido:
				_suma(out, "equipo", 1.5)
				_suma(out, "aficion", 3.0)
			elif arriba:
				_suma(out, "equipo", -2.0)
			if bool(ctx.get("idolo", false)):
				_suma(out, "aficion", -1.5)
		PROYECTO:


			_suma(out, "tecnico", -3.0)
			_suma(out, "equipo", -0.5)
			if hundido:
				_suma(out, "equipo", 2.5)
				_suma(out, "aficion", 2.5)
			elif arriba:
				_suma(out, "equipo", -2.0)
				_suma(out, "aficion", -2.0)

	if bool(ctx.get("capitan", false)):
		_suma(out, "equipo", -1.5)
	if bool(ctx.get("nuevo", false)):
		_suma(out, "tecnico", -1.5)
		_suma(out, "equipo", -1.0)
	if bool(ctx.get("ultimo_ano", false)):
		_suma(out, "tecnico", 1.0)




	if bool(ctx.get("campeon", false)):
		_suma(out, "aficion", -2.0)
		_suma(out, "equipo", -1.0)
	return out


static func _suma(d: Dictionary, k: String, v: float) -> void:
	d[k] = float(d.get(k, 0.0)) + v




static func mult(ctx: Dictionary) -> float:
	if bool(ctx.get("repite", false)):
		return REPITE_MULT
	if bool(ctx.get("reincide", false)):
		return REINCIDE_MULT
	return 1.0









static func motivo_valido(via: String, motivo: String, ctx: Dictionary) -> bool:
	if via != VIA_TRASPASO and via != VIA_CESION:
		return false
	if motivo.is_empty():
		return true
	if motivo == PACTO:
		return via == VIA_TRASPASO and bool(ctx.get("pacto_ok", false))
	if not MOTIVOS.has(motivo):
		return false
	if via == VIA_TRASPASO and motivo == MINUTOS \
			and int(ctx.get("rol", 0)) >= Standing.ContractRole.INDISCUTIBLE:
		return false
	return true






static func retract_fx(motivo: String) -> Dictionary:
	if motivo == PACTO:
		return PACTO_FX.duplicate()
	var out: Dictionary = RETRACT_BASE.duplicate()
	match motivo:
		MEJOR:
			out["prensa"] = -1.5
		PROYECTO:
			out["aficion"] = float(out["aficion"]) * 1.5
			out["tecnico"] = -2.0
	return out



static func retract_thaw_extra(motivo: String) -> int:
	return 1 if motivo == PROYECTO else 0











static func veredicto(rec: Dictionary, dest_rol: int, dest_rating: int,
		rompe: bool = false) -> String:
	match String(rec.get("motivo", "")):
		PACTO:
			return CONTRADICHO if rompe else CUMPLIDO
		MINUTOS:
			var mi_rol: int = int(rec.get("rol", Standing.ContractRole.ROTACION))
			if dest_rol > mi_rol:
				return CUMPLIDO
			return NEUTRO if dest_rol == mi_rol else CONTRADICHO
		MEJOR:
			var mi_rating: int = int(rec.get("rating", 0))
			if dest_rating > mi_rating:
				return CUMPLIDO
			return NEUTRO if dest_rating >= mi_rating - 2 else CONTRADICHO
		PROYECTO:
			return CUMPLIDO
	return NEUTRO





















const ASK_POR_MOTIVO: Dictionary = {MEJOR: 0.85, PROYECTO: 0.62, PACTO: 1.0}


static func ask_mult(motivo: String) -> float:
	return float(ASK_POR_MOTIVO.get(motivo, Market.ASK_LISTED))




static func slots_extra(motivo: String) -> int:
	return 1 if motivo == PROYECTO else 0










static func pasa_filtro(sal: Dictionary, dest_role_key: String, dest_rating: int) -> bool:
	match String(sal.get("motivo", "")):
		MINUTOS:
			return Standing.contract_role_from_key(dest_role_key) \
					>= int(sal.get("rol", Standing.ContractRole.ROTACION))
		MEJOR:
			return dest_rating > int(sal.get("rating", 0))
	return true






const RANK_CUMPLE: float = 1.0


static func rank_bonus(sal: Dictionary, dest_role_key: String) -> float:
	if String(sal.get("motivo", "")) == MINUTOS and Standing.contract_role_from_key(
			dest_role_key) > int(sal.get("rol", Standing.ContractRole.ROTACION)):
		return RANK_CUMPLE
	return 0.0





static func baja_division(motivo: String) -> int:
	return 1 if motivo == MINUTOS else 0







static func rescata(motivo: String) -> bool:
	return motivo != MEJOR and motivo != PACTO










const CESION_VITRINA_EDGE: float = 1.5



const CESION_VITRINA_EU: float = 3.0





const VISTA_MIN_INTEREST: float = 0.05


static func cesion_edge(motivo: String) -> float:
	return Market.LOAN_FIT_EDGE -(CESION_VITRINA_EDGE if motivo == MEJOR else 0.0)







const UTIL_CUMPLE: float = 5.0
const UTIL_PRIMA: float = 50.0


static func utilidad(puntos_rel: int, motivo: String, cumplen: int) -> float:
	var prima: float =(ask_mult(motivo) / Market.ASK_LISTED - 1.0) * UTIL_PRIMA
	return float(puntos_rel) + prima + UTIL_CUMPLE * float(cumplen)















const COHERENCIA_CUMPLE: Dictionary = {"prensa": 2.0, "aficion": 2.0}

const COHERENCIA_CUMPLE_MEJOR_PRENSA: float = 3.0
const COHERENCIA_CONTRADICE: Dictionary = {"prensa": -4.0, "aficion": -4.0}





const TOPE_AFICION_PRE: int = 20




const VUELTA_FRIA_FX: Dictionary = {"tecnico": -3.5}



static func coherencia_fx(motivo: String, estado: String) -> Dictionary:
	if motivo.is_empty():
		return {}
	if motivo == PACTO:
		if estado == CUMPLIDO:
			return PACTO_CUMPLE.duplicate()
		if estado == CONTRADICHO:
			var roto: Dictionary = {}
			for k in COHERENCIA_CONTRADICE:
				roto[k] = float(COHERENCIA_CONTRADICE[k]) * PACTO_ROTO_MULT
			return roto
		return {}
	if estado == CUMPLIDO:
		var out: Dictionary = COHERENCIA_CUMPLE.duplicate()
		if motivo == MEJOR:
			out["prensa"] = COHERENCIA_CUMPLE_MEJOR_PRENSA
		return out
	if estado == CONTRADICHO:
		return COHERENCIA_CONTRADICE.duplicate()
	return {}






const ROTULOS: Dictionary = {
	VIA_TRASPASO: {
		MINUTOS: "BUSCO MÁS MINUTOS",
		MEJOR: "QUIERO UN CLUB MEJOR",
		PROYECTO: "NO CREO EN EL PROYECTO",
	},
	VIA_CESION: {
		MINUTOS: "QUIERO JUGAR",
		MEJOR: "QUIERO QUE ME VEAN",
		PROYECTO: "AQUÍ NO TENGO FUTURO",
	},
}


static func rotulo(via: String, motivo: String) -> String:
	return String((ROTULOS.get(via, {}) as Dictionary).get(motivo, ""))





const PROMESAS: Dictionary = {
	MINUTOS: "IR DONDE JUEGUES MÁS",
	MEJOR: "IR A UN CLUB MAYOR",
	PROYECTO: "IRTE DE ESTE CLUB",
}


static func promesa(via: String, motivo: String) -> String:
	if via != VIA_TRASPASO:
		return ""
	return String(PROMESAS.get(motivo, ""))



static func archiva(archivo: Array, rec: Dictionary, estado: String,
		extra: Dictionary = {}) -> Array:
	var fila: Dictionary = rec.duplicate()
	fila["estado"] = estado
	fila.merge(extra, true)
	var out: Array = archivo.duplicate()
	out.append(fila)
	while out.size() > ARCHIVO_MAX:
		out.pop_front()
	return out




static func repite(archivo: Array, via: String, club: String, season: int) -> Dictionary:
	for i in range(archivo.size() - 1, -1, -1):
		var f: Dictionary = archivo[i]
		if String(f.get("via", "")) == via and String(f.get("club", "")) == club \
				and int(f.get("season", -1)) == season \
				and String(f.get("estado", "")) == RETIRADO:
			return f
	return {}








static func reincide(archivo: Array, club: String, season: int) -> bool:
	for f in archivo:
		var d: Dictionary = f
		if String(d.get("club", "")) != club or not bool(d.get("ventana", false)):
			continue
		if int(d.get("season", -99)) < season - REINCIDE_SEASONS:
			continue
		var e: String = String(d.get("estado", ""))
		if e == CADUCADO and String(d.get("motivo", "")) == PACTO:
			continue
		if e == RETIRADO or e == CADUCADO:
			return true
	return false
