class_name PartidoLibre
extends RefCounted

































static var activo: bool = false

static var abierto: bool = false

static var mio: String = ""
static var rival: String = ""
static var selecciones: bool = false

static var asiento: int = -1


const PANTALLA: String = "res://ui/partido_libre.tscn"






static func fixture() -> Dictionary:
	if selecciones:
		return {"comp": "nat", "round": "friendly", "opp": rival, "home": true, "dead": false}
	return {"comp": "league", "opp": rival, "home": true, "dead": false}








static func prepara(team_id: String, son_selecciones: bool) -> void:
	if not son_selecciones or team_id.is_empty() or Squad.is_registered(team_id):
		return
	var filas: Array = Career.nat_rival_squad(team_id)
	if filas.size() >= Squad.STARTING_XI:
		Squad.register(team_id, filas, NatTeam.formation_of(team_id))




static func jugadores_campo(team_id: String) -> Array:
	var out: Array = []
	var plantel: Array = Squad.of(team_id)
	for i in mini(plantel.size(), Squad.STARTING_XI):
		var f: Dictionary = plantel[i]
		var pos: String = String(f.get("pos", ""))
		if pos == "POR" or pos.is_empty():
			continue
		out.append({"i": i, "ficha": f, "pos": pos, "media": SquadMeta.media_of(f, pos)})
	return out




static func asiento_defecto(team_id: String) -> int:
	return Squad.user_index_en(Squad.of(team_id), "DC", false)



static func ficha_de(team_id: String, k: int) -> Dictionary:
	var plantel: Array = Squad.of(team_id)
	if k < 0:
		k = asiento_defecto(team_id)
	if k < 0 or k >= plantel.size():
		return {}
	return plantel[k]




static func abre() -> void:

	GameState.readonly_save = true
	GameState.practica_en_curso = true
	abierto = true



	Career._reset_state()
	GameState._reset_persisted_fields()
	Squad.USER_POS = "DC"
	Squad.marca_yo_hoy(null)
	Squad.invalidate()





static func arma(mi_equipo: String, su_equipo: String, son_selecciones: bool, k: int = -1) -> bool:
	if mi_equipo.is_empty() or su_equipo.is_empty() or mi_equipo == su_equipo:
		return false
	abre()
	mio = mi_equipo
	rival = su_equipo
	selecciones = son_selecciones
	activo = true
	GameState.practice_kind = ""
	GameState.next_chances = -1
	GameState.next_minutes = -1
	GameState.next_starter = true
	GameState.next_banca_condicional = {}
	if selecciones:



		Career.nationality = mio
		prepara(mio, true)
		prepara(rival, true)
		GameState.nat_match_active = true
	else:
		GameState.player_team_id = mio
		GameState.nat_match_active = false




	asiento = k if k >= 0 else asiento_defecto(mio)
	var yo: Dictionary = ficha_de(mio, asiento)
	if yo.is_empty():
		activo = false
		return false
	var pos: String = String(yo.get("pos", "DC"))
	Squad.USER_POS = pos
	Squad.marca_yo_hoy(yo)
	var nombre: String = String(yo.get("name", ""))
	Career.player_name = nombre
	Career.shirt_name = ""
	Career.skills = cualidades_de(yo, pos)
	var dorsal: int = int(yo.get("number", 0))
	if dorsal >= 1 and dorsal <= 99:
		GameState.player_number = dorsal


	var look: Dictionary = GameState.team_custom.duplicate(true)
	var cara: Dictionary = Amigos.look_seguro(KitRecolor.traits_for(nombre))
	for c in cara:
		look[c] = cara[c]
	GameState.team_custom = look
	return true






static func cualidades_de(ficha: Dictionary, pos: String) -> Dictionary:
	var media: int = SquadMeta.media_of(ficha, pos)
	var de_ficha: Dictionary = {"potencia": "pegada", "precision": "punteria",
		"efecto": "rosca", "regate": "regate", "fisico": "fisico", "velocidad": "velocidad",
		"aceleracion": "aceleracion", "penal": "penal", "parado": "parado"}
	var out: Dictionary = {}
	for k in Career.skills:
		var llave: String = String(de_ficha.get(k, ""))
		var v: int = int(ficha.get(llave, media)) if not llave.is_empty() else media
		out[k] = clampi(v, 1, 99)
	return out





static func devolver() -> void:
	if not abierto:
		return
	abierto = false
	activo = false
	mio = ""
	rival = ""
	selecciones = false
	asiento = -1
	GameState.readonly_save = true
	Squad.marca_yo_hoy(null)
	Squad.USER_POS = "DC"
	GameState.nat_match_active = false
	GameState.reload_active_slot()
	Career.reload_active_slot()


	Squad.invalidate()
	GameState.practice_kind = ""
	GameState.practica_en_curso = false
	GameState.readonly_save = false
