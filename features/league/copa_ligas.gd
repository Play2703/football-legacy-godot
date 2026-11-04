class_name CopaLigas
extends RefCounted


const COMP: String = "ligas"

const TITULO: String = "Campeón de la Copa de las Ligas"

const NOMBRE: String = "COPA DE LAS LIGAS"


const FINAL_NOMBRE: String = "DUELO DE CAMPEONES"


const PAIS_MLS: String = "Estados Unidos"
const PAIS_MX: String = "México"

const PLAZAS: int = 8




const RONDAS: Array = [
	["Octavos", "OCTAVOS"], ["Cuartos", "CUARTOS"], ["Semifinal", "SEMIFINAL"], ["Final", "FINAL"],
]


const MES: int = 8
const DENTRO: float = 0.0






const LLAVES: Array = [
	["mls", 0], ["mx", 7], ["mx", 3], ["mls", 4], ["mls", 2], ["mx", 5], ["mx", 1], ["mls", 6],
	["mls", 1], ["mx", 6], ["mx", 2], ["mls", 5], ["mls", 3], ["mx", 4], ["mx", 0], ["mls", 7],
]




static func llaves(mls: Array, mx: Array) -> Array:
	if mls.size() < PLAZAS or mx.size() < PLAZAS:
		return []
	var out: Array = []
	for l in LLAVES:
		var liga: Array = mls if String(l[0]) == "mls" else mx
		out.append(String(liga[int(l[1])]))
	return out




static func cruce_id(ronda: String, n: int) -> String:
	return ronda if ronda == "Final" else "%s%d" % [ronda, n]





static func cuadro(mls: Array, mx: Array, season: int, ganadores: Dictionary = {}) -> Dictionary:
	var out: Dictionary = {}
	var vivos: Array = llaves(mls, mx)
	for r in RONDAS:
		if vivos.size() < 2:
			break
		var ronda: String = String(r[0])
		var siguen: Array = []
		for i in range(0, vivos.size() - 1, 2):
			var id: String = cruce_id(ronda, siguen.size())
			var a: String = String(vivos[i])
			var b: String = String(vivos[i + 1])


			var w: String = String(ganadores.get(id, ""))
			if w != a and w != b:
				w = SimLeague.partido_unico(a, b, season, "ligas|" + id)
			out[id] = {"round": ronda, "a": a, "b": b, "winner": w}
			siguen.append(w)
		vivos = siguen
	return out






static func cuadro_de(mls: Array, mx: Array, season: int, club: String,
		ganadores: Dictionary = {}) -> Dictionary:
	var g: Dictionary = ganadores.duplicate()
	var c: Dictionary = cuadro(mls, mx, season, g)
	if club.is_empty():
		return c
	for r in RONDAS:
		for id in c.keys():
			var t: Dictionary = c[id]
			if String(t["round"]) != String(r[0]) or g.has(id):
				continue
			if String(t["a"]) == club or String(t["b"]) == club:
				g[id] = club
				c = cuadro(mls, mx, season, g)
	return c




static func camino(c: Dictionary, club: String, mls: Array, mx: Array) -> Array:
	var out: Array = []
	if club.is_empty():
		return out
	for r in RONDAS:
		for id in c.keys():
			var t: Dictionary = c[id]
			if String(t["round"]) != String(r[0]):
				continue
			var a: String = String(t["a"])
			var b: String = String(t["b"])
			if a != club and b != club:
				continue
			var opp: String = b if a == club else a
			out.append({"round": String(r[0]), "cruce": String(id), "opp": opp,
				"home": local(club, opp, mls, mx) == club})
	return out




static func campeon(mls: Array, mx: Array, season: int, ganadores: Dictionary = {}) -> String:
	var f: Dictionary = cuadro(mls, mx, season, ganadores).get("Final", {})
	return String(f.get("winner", ""))




static func local(a: String, b: String, mls: Array, mx: Array) -> String:
	var a_mls: bool = mls.has(a)
	if a_mls != mls.has(b):
		return a if a_mls else b
	return a if siembra(a, mls, mx) <= siembra(b, mls, mx) else b




static func siembra(club: String, mls: Array, mx: Array) -> int:
	var i: int = mls.find(club)
	if i >= 0 and i < PLAZAS:
		return 2 * i + 1
	i = mx.find(club)
	if i >= 0 and i < PLAZAS:
		return 2 * i + 2
	return 0





static func etiqueta(ronda: String) -> String:
	var nombre: String = FINAL_NOMBRE if ronda == "Final" else NOMBRE
	for r in RONDAS:
		if String(r[0]) == ronda:
			return "%s · %s" % [nombre, String(r[1])]
	return NOMBRE
