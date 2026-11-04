class_name Juveniles
extends RefCounted
















const EDAD_MAX: int = 20


const EDAD_MAX_LARGA: int = 21


const EDAD_CONTRATO: int = 19




const EDAD_ACADEMIA: int = 30



const PROB_ACADEMIA: int = 18











const TEMPORADAS_CLUB: int = 2

const HUECO_PASOS: int = 5

const ULTIMAS_JORNADAS: int = 4


const PROB_ENTRENO: int = 30


const EDAD_NINO: int = 16



const PROB_CONTRATO: int = 50














static func nuevo_estado() -> Dictionary:
	return {
		"debut": [], "gol": [], "contrato": [], "rival": [],
		"academia": false, "promesa": {}, "cadena": {}, "ahijado": false,
		"foto": {"club": "", "nombres": {}},
		"idos": {},



		"nacidos": {},



		"marcaron": {},
		"memoria": {},
	}









const AHIJADO_LLEGA: int = 62
const AHIJADO_POT: int = 95


const PUESTOS_AHIJADO: Array = Squad.PUESTOS_CAMPO




static func sanea(raw: Variant) -> Dictionary:
	var out: Dictionary = nuevo_estado()
	if not (raw is Dictionary):
		return out
	for k in out:
		if (raw as Dictionary).has(k) and typeof((raw as Dictionary)[k]) == typeof(out[k]):
			out[k] =(raw as Dictionary)[k]
	return out


static func es_juvenil(row: Dictionary, edad_max: int = EDAD_MAX) -> bool:
	if bool(row.get("is_you", false)):
		return false
	return int(row.get("age", 99)) <= edad_max and not String(row.get("name", "")).is_empty()













static func debutante(rows: Array, en_once: Dictionary, vistos: Array,
		ahijados: Dictionary) -> Dictionary:
	var mejor: Dictionary = {}
	for r in rows:
		var row: Dictionary = r
		var nm: String = String(row.get("name", ""))
		if not ahijados.has(nm):
			continue
		if not es_juvenil(row) or not en_once.has(nm) or vistos.has(nm):
			continue
		if int(row.get("gp", 0)) > 0:
			continue
		if mejor.is_empty() or int(row.get("age", 99)) < int(mejor.get("age", 99)):
			mejor = row
	return mejor












static func goleador(rows: Array, scorers: Dictionary, vistos: Array,
		marcaron: Dictionary, observados: Dictionary) -> Dictionary:
	for r in rows:
		var row: Dictionary = r
		var nm: String = String(row.get("name", ""))
		if not es_juvenil(row) or vistos.has(nm) or int(scorers.get(nm, 0)) <= 0:
			continue
		if marcaron.has(nm) or not observados.has(nm):
			continue
		if int(row.get("goals", 0)) > 0:
			continue
		return row
	return {}




static func para_contrato(rows: Array, vistos: Array) -> Dictionary:
	var mejor: Dictionary = {}
	for r in rows:
		var row: Dictionary = r
		if not es_juvenil(row, EDAD_CONTRATO) or vistos.has(String(row.get("name", ""))):
			continue
		if mejor.is_empty() or int(row.get("media", 0)) > int(mejor.get("media", 0)):
			mejor = row
	return mejor



static func el_mas_joven(rows: Array) -> Dictionary:
	var mejor: Dictionary = {}
	for r in rows:
		var row: Dictionary = r
		if not es_juvenil(row, EDAD_MAX_LARGA):
			continue
		if mejor.is_empty() or int(row.get("age", 99)) < int(mejor.get("age", 99)):
			mejor = row
	return mejor



static func foto(rows: Array) -> Dictionary:
	var out: Dictionary = {}
	for r in rows:
		if es_juvenil(r as Dictionary, EDAD_MAX_LARGA):
			out[String((r as Dictionary).get("name", ""))] = true
	return out




static func se_fueron(foto_vieja: Dictionary, rows: Array) -> Array:
	var hoy: Dictionary = {}
	for r in rows:
		hoy[String((r as Dictionary).get("name", ""))] = true
	var out: Array = []
	for nm in foto_vieja:
		if not hoy.has(String(nm)):
			out.append(String(nm))
	return out







static func toca_academia(edad: int, ahijado: bool, cadena_season: int, season: int,
		jornada: int, ronda: int, rondas: int, temporadas_club: int) -> bool:
	if ahijado or edad < EDAD_ACADEMIA or cadena_season == season:
		return false
	if temporadas_club < TEMPORADAS_CLUB or rondas <= 0 or ronda * 3 >= rondas:
		return false
	return _dado("juv_academia|%d|%d" % [season, jornada]) < PROB_ACADEMIA





static func paso_que_toca(cadena: Dictionary, season: int, club: String, jugados: int,
		ronda: int, rondas: int) -> int:
	if not cadena_viva(cadena, season, club) or rondas <= 0:
		return 0
	var paso: int = int(cadena.get("paso", 0))
	if jugados - int(cadena.get("mp", 0)) < HUECO_PASOS:
		return 0
	var zona_padrino: bool = ronda >= rondas - ULTIMAS_JORNADAS
	if paso == 1:
		if zona_padrino:
			return 2
		return 2 if _dado("juv_entreno|%d|%d" % [season, jugados]) < PROB_ENTRENO else 0
	if paso == 2 and zona_padrino:
		return 3
	return 0



static func cadena_viva(cadena: Dictionary, season: int, club: String) -> bool:
	return not cadena.is_empty() and int(cadena.get("season", -1)) == season \
			and String(cadena.get("club", "")) == club and int(cadena.get("paso", 0)) > 0





static func temporadas_en(club: String, start_club: String, transfers: Array,
		season: int) -> int:
	var desde: int = -1
	for t in transfers:
		var tr: Dictionary = t
		if bool(tr.get("loan", false)):
			continue
		if String(tr.get("id", "")) == club:
			desde = int(tr.get("season", season))
		else:
			desde = -1
	if desde < 0:
		if start_club != club:
			return 0
		for t in transfers:
			if not bool((t as Dictionary).get("loan", false)):
				return 0
		desde = 1
	return season - desde + 1








static func nueva_memoria(season: int, temporadas: int) -> Dictionary:
	return {"desde": season, "llegada": temporadas <= 1}





static func observado(memoria: Dictionary, signed: int) -> bool:
	if memoria.is_empty():
		return false
	return bool(memoria.get("llegada", false)) or signed >= int(memoria.get("desde", 0))


static func toca_contrato(season: int) -> bool:
	return _dado("juv_contrato|%d" % season) < PROB_CONTRATO






static func _dado(semilla: String) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(semilla)
	return rng.randi_range(0, 99)



static func pintado(nombre: String) -> String:
	return Competitions.demarca(nombre)


static func apellido(nombre: String) -> String:
	return Espalda.apellido_de(pintado(nombre))

















static func ahijado_de(estado: Dictionary) -> String:
	if not bool(estado.get("ahijado", false)):
		return ""
	var nacidos: Dictionary = estado.get("nacidos", {})
	var firmados: Array = estado.get("contrato", [])


	for i in range(firmados.size() - 1, -1, -1):
		var nm: String = String(firmados[i])
		if nacidos.has(nm):
			return nm
	return ""










static func ahijado_en(estado: Dictionary, planteles: Dictionary) -> Dictionary:
	var nm: String = ahijado_de(estado)
	if nm.is_empty():
		return {}
	for club in planteles:
		for r in planteles[club]:
			var row: Dictionary = r as Dictionary
			if String(row.get("name", "")) != nm:
				continue
			return {"name": nm, "apellido": apellido(nm),
				"number": int(row.get("number", 0)), "pos": String(row.get("pos", "")),
				"club": String(club)}
	return {}
