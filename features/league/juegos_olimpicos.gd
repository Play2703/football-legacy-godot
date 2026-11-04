class_name JuegosOlimpicos
extends RefCounted


const CUPO: Dictionary = {"UEFA": 4, "CONMEBOL": 3, "CONCACAF": 2, "CAF": 3, "AFC": 3, "OFC": 1}


const RONDA: String = "olimpicos"
const RONDA_CUARTOS: String = "olimpicos_cuartos"
const RONDA_SEMI: String = "olimpicos_semi"

const RONDA_MEDALLA: String = "olimpicos_medalla"
const RONDAS: Array[String] = [RONDA, RONDA_CUARTOS, RONDA_SEMI, RONDA_MEDALLA]




const TITULO: String = "Campeón Olímpico"




const NOMBRE: String = "JUEGOS OLÍMPICOS"








const NOMBRE_FICTICIO: String = "JUEGOS DE VERANO"
const TITULO_FICTICIO: String = "Campeón de Verano"
const ORO_FICTICIO: String = "Oro de Verano"





const _FICTICIO: Array = [
	["JUEGOS OLÍMPICOS", NOMBRE_FICTICIO], ["Juegos Olímpicos", "Juegos de Verano"],
	["CAMPEÓN OLÍMPICO", "CAMPEÓN DE VERANO"], ["Campeón Olímpico", TITULO_FICTICIO],
	["ORO OLÍMPICO", "ORO DE VERANO"], ["Oro Olímpico", ORO_FICTICIO],
	["Oro olímpico", ORO_FICTICIO],
]




static func con_pack() -> bool:
	return not CompEdits.comp(LOGO).is_empty()




static func nombre() -> String:
	return CompEdits.comp(LOGO).to_upper() if con_pack() else NOMBRE_FICTICIO





static func pinta(s: String) -> String:
	if con_pack():
		return s
	var r: String = s
	for par in _FICTICIO:
		r = r.replace(String(par[0]), String(par[1]))
	return r


const EDAD_MAX: int = 23
const MAYORES: int = 3


const POR_GRUPO: int = 4



const MIN_PLANTEL: int = 22



static func es_temporada(season: int) -> bool:
	return NatTeam.season_kind(season) == "cont"




const LOGO: String = "olimpicos"









const MARCA_SVG: String = "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M4.4 33.1 C13.9 36.2 18.8 43.1 15.3 46.1 C11.8 49.0 5.8 43.0 4.4 33.1 Z M15.9 21.8 C25.1 29.7 28.0 39.8 23.1 41.6 C18.2 43.3 13.9 33.7 15.9 21.8 Z M32.0 15.0 C38.7 27.5 37.8 40.0 32.0 40.0 C26.2 40.0 25.3 27.5 32.0 15.0 Z M48.1 21.8 C50.1 33.7 45.8 43.3 40.9 41.6 C36.0 39.8 38.9 29.7 48.1 21.8 Z M59.6 33.1 C58.2 43.0 52.2 49.0 48.7 46.1 C45.2 43.1 50.1 36.2 59.6 33.1 Z\"/><path fill=\"{C}\" d=\"M12 44 Q32 54 52 44 L50 51 Q32 60 14 51 Z\"/></svg>"
static var _marca_tex: Texture2D = null




static func marca() -> Texture2D:
	if _marca_tex == null:
		var img: Image = KitBrands._raster(MARCA_SVG, Color.WHITE)
		var limpia: Image = Pecho.logo_limpio(img) if img != null else null
		if limpia != null:
			_marca_tex = ImageTexture.create_from_image(limpia)
	return _marca_tex





static func es_fixture(f: Dictionary) -> bool:
	return String(f.get("comp", "")) == "nat" and RONDAS.has(String(f.get("round", "")))






static func en_juego() -> bool:
	return GameState.nat_match_active and es_fixture(GameState.current_fixture())



static func participantes() -> Array:
	var out: Array = []
	for confed in CUPO:
		var n: int = 0
		for d in Nations.of_confed(String(confed)):
			out.append(String((d as Dictionary)["id"]))
			n += 1
			if n >= int(CUPO[confed]):
				break
	out.sort_custom(func(a, b): return Nations.strength(String(a)) > Nations.strength(String(b)))
	return out



static func juega(pais: String) -> bool:
	var canon: String = Nations.canon_id(pais)
	return participantes().any(func(id): return Nations.canon_id(String(id)) == canon)



static func rng_de(season: int, sal: String = "") -> RandomNumberGenerator:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("olimpicos-%d-%s" % [season, sal])
	return rng




static func grupos(season: int) -> Array:
	var ids: Array = participantes()
	var n: int = ids.size() / POR_GRUPO
	var out: Array = []
	for _g in n:
		out.append([])
	var rng: RandomNumberGenerator = rng_de(season, "sorteo")
	for b in POR_GRUPO:
		var bombo: Array = ids.slice(b * n,(b + 1) * n)
		for i in range(bombo.size() - 1, 0, -1):
			var j: int = rng.randi_range(0, i)
			var t: Variant = bombo[i]
			bombo[i] = bombo[j]
			bombo[j] = t
		for g in n:
			(out[g] as Array).append(String(bombo[g]))
	return out



static func grupo_de(gs: Array, pais: String) -> int:
	var canon: String = Nations.canon_id(pais)
	for i in gs.size():
		for id in gs[i]:
			if Nations.canon_id(String(id)) == canon:
				return i
	return -1



static func sim_grupo(ids: Array, rng: RandomNumberGenerator) -> Array:
	return NatTeam._sorted_rows(NatTeam._round_robin(ids, "", 0.0, rng, false), "")




static func cuartos(tablas: Array) -> Array:
	if tablas.size() < 4:
		return []
	for t in tablas:
		if (t as Array).size() < 2:
			return []
	var p: Callable = func(g: int, pos: int) -> String: return String(tablas[g][pos]["id"])
	return [p.call(0, 0), p.call(1, 1), p.call(2, 0), p.call(3, 1),
		p.call(1, 0), p.call(0, 1), p.call(3, 0), p.call(2, 1)]



static func llave(a: String, b: String, rng: RandomNumberGenerator) -> Dictionary:
	return NatTeam._play_tie(a, b, "", 0.0, rng)



static func rival_en(cruces: Array, pais: String) -> String:
	var canon: String = Nations.canon_id(pais)
	for i in cruces.size():
		if Nations.canon_id(String(cruces[i])) == canon:
			return String(cruces[i^1])
	return ""



static func ronda_de_fondo(cruces: Array, rng: RandomNumberGenerator) -> Array:
	var out: Array = []
	for i in range(0, cruces.size() - 1, 2):
		out.append(String(llave(String(cruces[i]), String(cruces[i + 1]), rng)["winner"]))
	return out



static func perdedores(cruces: Array, ganadores: Array) -> Array:
	var out: Array = []
	for i in range(0, cruces.size() - 1, 2):
		out.append(String(cruces[i + 1]) if ganadores.has(String(cruces[i])) else String(cruces[i]))
	return out




static func medallas_de_fondo(semis: Array, ganadores: Array, rng: RandomNumberGenerator) -> Dictionary:
	var fin: Dictionary = llave(String(ganadores[0]), String(ganadores[1]), rng)
	var caidos: Array = perdedores(semis, ganadores)
	var br: Dictionary = llave(String(caidos[0]), String(caidos[1]), rng)
	var oro: String = String(fin["winner"])
	return {"oro": oro, "plata": String(fin["b"]) if oro == String(fin["a"]) else String(fin["a"]),
		"bronce": String(br["winner"])}



static func sim_entera(season: int) -> Dictionary:
	var rng: RandomNumberGenerator = rng_de(season)
	var tablas: Array = []
	for g in grupos(season):
		tablas.append(sim_grupo(g, rng))
	var qf: Array = cuartos(tablas)
	if qf.size() < 8:
		return {}
	var sf: Array = ronda_de_fondo(qf, rng)
	var fin: Array = ronda_de_fondo(sf, rng)
	var out: Dictionary = medallas_de_fondo(sf, fin, rng)
	out["tablas"] = tablas
	out["cuartos"] = qf
	out["semis"] = sf
	return out





static func choca_continental(nat_state: Dictionary) -> bool:
	if String(nat_state.get("comp", "")) != "cont" or not bool(nat_state.get("playing", false)) \
			or bool(nat_state.get("watch", false)):
		return false
	var names: Array = nat_state.get("ko_names", [])
	return not names.is_empty() and int(nat_state.get("ko_idx", 0)) >= names.size() - 1







static func convocables(pool: Array, edad: Callable, mayores_cupo: int = MAYORES) -> Dictionary:
	var jovenes: Dictionary = {}
	var mayores: Array = []
	for c in pool:
		var nombre: String = String((c as Dictionary).get("name", ""))
		var anios: int = int(edad.call(nombre, String((c as Dictionary).get("club_id", ""))))
		if anios > 0 and anios <= EDAD_MAX:
			jovenes[nombre.to_upper()] = true
		else:
			mayores.append(c)
	mayores.sort_custom(func(a, b): return float(a.get("score", 0.0)) > float(b.get("score", 0.0)))
	var i: int = 0
	while i < mayores.size() and (i < mayores_cupo or jovenes.size() < MIN_PLANTEL):
		jovenes[String((mayores[i] as Dictionary).get("name", "")).to_upper()] = true
		i += 1
	return jovenes
