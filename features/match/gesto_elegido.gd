class_name GestoElegido
extends RefCounted
















const PROVOCAR: String = "provocar"
const PERDON: String = "perdon"
const TUYOS: String = "tuyos"
const TECNICO: String = "tecnico"
const CORRO: String = "corro"



const ESPERA_S: float = 1.2
const MAX_FICHAS: int = 3

const MIN_FICHAS: int = 2


const CORRO_MIN: int = 4




const FX: Dictionary = {
	TECNICO: {"tecnico": 4},
	CORRO: {"equipo": 3},
	TUYOS: {"aficion": 2},
	PERDON: {"aficion": 1},
	PROVOCAR: {"tecnico": -2},
}



const FX_TECNICO_RECONCILIA: int = 2



const HECHO: Dictionary = {
	TECNICO: "festejo_tecnico",
	CORRO: "festejo_corro",
	TUYOS: "festejo_grada",
	PERDON: "festejo_perdon",
}




static func sitio(key: String, away: bool) -> String:
	match key:
		PROVOCAR:
			return "grada"
		PERDON:
			return "corner"
		TUYOS:
			return "visitante" if away else "grada"
		TECNICO:
			return "tecnico"
		CORRO:
			return "corro"
	return ""



static func gesto(key: String) -> String:
	match key:
		PROVOCAR:
			return "callar"
		PERDON:
			return "perdon"
	return ""




static func casilla(key: String, away: bool) -> String:
	var g: String = gesto(key)
	if not g.is_empty():
		return Celebs.id_for(Celebs.GESTO, g)
	return Celebs.id_for(Celebs.SITIO, sitio(key, away))

















static func fichas(ctx: Dictionary, vistas: PackedStringArray, n_mates: int,
		coach_done: bool) -> Array[String]:
	var away: bool = bool(ctx.get("away", false))
	var coach_rift: bool = bool(ctx.get("coach_rift", false))
	var team_rift: bool = bool(ctx.get("team_rift", false))


	var tuyos_ok: bool = not away or bool(ctx.get("hay_rincon", true))
	var cand: Array[String] = []
	if coach_rift or team_rift:
		if not coach_done:
			cand.append(TECNICO)
		if not team_rift and n_mates >= CORRO_MIN:
			cand.append(CORRO)
		if tuyos_ok:
			cand.append(TUYOS)
	else:
		if away:
			cand.append(PROVOCAR)
		if bool(ctx.get("ex_club", false)):
			cand.append(PERDON)
		if tuyos_ok:
			cand.append(TUYOS)
	var r: Array[String] = []
	for k in cand:
		if vistas.has(casilla(k, away)) and r.size() < MAX_FICHAS:
			r.append(k)
	if r.size() < MIN_FICHAS:
		r.clear()
	return r





static func cargado(ctx: Dictionary, sitio_defecto: String) -> bool:
	for k in ["ex_club", "derby", "just_subbed", "coach_rift", "team_rift"]:
		if bool(ctx.get(k, false)):
			return true
	return bool(ctx.get("away", false)) \
			and sitio_defecto in ["grada", "provocacion", "area"]






static func carga(ctx: Dictionary) -> String:
	if bool(ctx.get("coach_rift", false)):
		return "ROCE CON EL TÉCNICO"
	if bool(ctx.get("team_rift", false)):
		return "ROCE CON EL VESTUARIO"
	if bool(ctx.get("ex_club", false)):
		return "CONTRA TU EX"
	if bool(ctx.get("derby", false)):
		return "DERBI"
	if bool(ctx.get("just_subbed", false)):
		return "RECIÉN SALIDO"
	return "DE VISITA"



static func fx(key: String, reconcilia: bool) -> Dictionary:
	if key == TECNICO and reconcilia:
		return {"tecnico": FX_TECNICO_RECONCILIA}
	return (FX.get(key, {}) as Dictionary).duplicate()



static func multa(key: String, away: bool) -> bool:
	return Multas.provoca(sitio(key, away), gesto(key))







static func nombre(key: String, roce: bool) -> String:
	match key:
		PROVOCAR:
			return "PROVOCAR"
		PERDON:
			return "PERDÓN"
		TUYOS:
			return "A LA GRADA" if roce else "A LOS TUYOS"
		TECNICO:
			return "AL TÉCNICO"
		CORRO:
			return "EL CORRO"
	return ""





static func con_roce(lista: Array[String]) -> bool:
	return lista.has(TECNICO) or lista.has(CORRO)
