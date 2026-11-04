class_name Trivia
extends RefCounted






























const TRIVIA_P: float = 0.3



const DISTRACTOR_VECINOS: int = 6


const DISTRACTORES: int = 2

const LETRAS: Array[String] = ["a", "b", "c"]







static func cabe(d: Dictionary, momento: String) -> bool:
	return not bool(d.get("nat", false)) and not bool(d.get("extra", false)) \
			and momento.is_empty()









static func candidatos(team_id: String, season: int) -> Array:
	var out: Array = []
	if team_id.is_empty():
		return out
	var squad: Array = Squad.of(team_id)
	var tuyo: int = Squad.user_index(squad) if team_id == GameState.player_team_id else -1
	for i in squad.size():
		if i == tuyo:
			continue
		var ficha: Dictionary = squad[i]
		if String(ficha.get("name", "")) == Career.player_name:
			continue
		var seat: int = Squad.home_seat(squad, i)
		var tf: Dictionary = TransferBook.trayectoria_ficha(team_id, seat,
			String(ficha.get("pos", "MC")), season)
		if bool(tf.get("heredero", false)):
			continue
		var etapas: Array = tf.get("etapas", [])
		if etapas.is_empty():
			continue
		var llegada: Dictionary = TransferBook.llegada_de(etapas, team_id)
		var de: String = String(llegada.get("club", ""))
		if de.is_empty() or Teams.by_id(de).is_empty():
			continue
		out.append({"ficha": ficha, "team_id": team_id, "etapas": etapas,
			"llegada": llegada})
	return out








static func distractores(correcto: String, team_id: String, excluir: Array,
		rng: RandomNumberGenerator) -> Array:
	var ref: int = Teams.rating(correcto)
	var vistos: Array = []
	var pool: Array = []
	for pais in [Teams.country_of(correcto), Teams.country_of(team_id)]:
		if pool.size() >= DISTRACTORES or String(pais).is_empty():
			continue
		for t in Teams.teams_of_country(String(pais)):
			var id: String = String((t as Dictionary).get("id", ""))
			if id.is_empty() or id == correcto or excluir.has(id) or vistos.has(id):
				continue
			vistos.append(id)
			pool.append({"id": id, "d": absi(int((t as Dictionary).get("rating", 62)) - ref)})
	if pool.size() < DISTRACTORES:
		return []
	pool.sort_custom(func(x: Dictionary, y: Dictionary) -> bool:
		if int(x["d"]) != int(y["d"]):
			return int(x["d"]) < int(y["d"])
		return String(x["id"]) < String(y["id"]))
	var vecinos: Array = []
	for k in mini(DISTRACTOR_VECINOS, pool.size()):
		vecinos.append(String((pool[k] as Dictionary)["id"]))
	var out: Array = []
	for _n in DISTRACTORES:
		var j: int = rng.randi_range(0, vecinos.size() - 1)
		out.append(vecinos[j])
		vecinos.remove_at(j)
	return out




static func sale(rng: RandomNumberGenerator) -> bool:
	return rng.randf() < TRIVIA_P








static func armar(club: String, rival: String, season: int, semilla: int) -> Dictionary:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	if not sale(rng):
		return {}
	var pool: Array = candidatos(club, season)
	if rival != club:
		pool.append_array(candidatos(rival, season))
	return pregunta(pool, club, rival, rng)




static func pregunta(pool: Array, club: String, rival: String,
		rng: RandomNumberGenerator) -> Dictionary:
	if pool.is_empty():
		return {}
	var c: Dictionary = pool[rng.randi_range(0, pool.size() - 1)]
	var etapas: Array = c["etapas"]
	var buena: String = String((c["llegada"] as Dictionary).get("club", ""))
	var excluir: Array = [club, rival]
	excluir.append_array(TransferBook.clubes_de(etapas))
	var falsos: Array = distractores(buena, String(c["team_id"]), excluir, rng)
	if falsos.size() < DISTRACTORES:
		return {}
	var opciones: Array = [buena]
	opciones.append_array(falsos)


	for i in range(opciones.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: Variant = opciones[i]
		opciones[i] = opciones[j]
		opciones[j] = tmp
	var ficha: Dictionary = c["ficha"]
	return {"name": Competitions.demarca(String(ficha.get("name", ""))), "ficha": ficha,
		"team_id": String(c["team_id"]), "respuesta": buena, "opciones": opciones,
		"correcta": LETRAS[opciones.find(buena)]}
