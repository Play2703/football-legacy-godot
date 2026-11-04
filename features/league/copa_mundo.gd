class_name CopaMundo
extends RefCounted




static func cuadro(pais: String) -> Dictionary:
	if pais.is_empty() or pais == Teams.country_of(GameState.player_team_id):
		return {}
	if int(GameState.copas_mundo_snap.get("season", -1)) != GameState.season_num:
		GameState.copas_mundo_snap = {"season": GameState.season_num}
	var snap: Dictionary = GameState.copas_mundo_snap



	var hecho: Variant = snap.get(pais)
	if hecho is Dictionary and ((hecho as Dictionary).has("rondas") or ((hecho as Dictionary).is_empty()
			and not FormatoCopa.tiene(pais, FormatoCopa.COPA))):
		return hecho
	var c: Dictionary = arma_real(pais, GameState.season_num, GameState.cup_sembrado(pais))
	snap[pais] = c
	return c









static func arma_real(pais: String, season: int, por_div: Array, tag: String = "copa",
		tipo: String = FormatoCopa.COPA) -> Dictionary:
	var st: Dictionary = FormatoCopa.nuevo(pais, tipo, por_div)
	if st.is_empty():
		return {}
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%s|%s|%d|%d" % [tag, pais, season, WorldAging.world_seed()])
	FormatoCopa.simula_hasta_el_final(st, rng,
		func(a: String, b: String, _ro: Dictionary) -> Dictionary:
			return {"winner": a if rng.randf() < GameState.tie_p(a, b) else b},
		func(a: String, b: String) -> Array:
			var p: float = GameState.tie_p(a, b)
			return [_poisson(2.6 * p, rng), _poisson(2.6 *(1.0 - p), rng)])
	var out: Dictionary = FormatoCopa.quien_juega(st)
	out["bracket"] = st["bracket"]
	return out



static func _poisson(media: float, rng: RandomNumberGenerator) -> int:
	var l: float = exp(- maxf(media, 0.05))
	var k: int = 0
	var p: float = rng.randf()
	while p > l and k < 9:
		k += 1
		p *= rng.randf()
	return k





static func campeon(pais: String) -> String:
	if pais == Teams.country_of(GameState.player_team_id):
		var st: Dictionary = GameState.cup_state
		if bool(st.get("champion", false)):
			return GameState.player_team_id
		return GameState._euro_sim_id(String(st.get("winner", "")))
	return String(cuadro(pais).get("winner", ""))




static func finalista(pais: String) -> String:
	if pais == Teams.country_of(GameState.player_team_id):
		var st: Dictionary = GameState.cup_state.get("fmt", {})
		return GameState._euro_sim_id(FormatoCopa.finalista(st)) if not st.is_empty() else ""
	return FormatoCopa.finalista(cuadro(pais))





static func campeones() -> Dictionary:
	var out: Dictionary = {}
	for cf in GameState.CWC_CONFEDS:
		for p in Continental.paises_de(String(cf)):
			var w: String = campeon(String(p))
			if not w.is_empty():
				out[String(p)] = w
	return out
