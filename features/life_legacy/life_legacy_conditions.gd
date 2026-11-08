class_name LifeLegacyConditions
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")

# Avalia condições declarativas de ativação de eventos
static func evaluate(conditions: Dictionary, ctx: Dictionary) -> bool:
	if conditions.is_empty():
		return true

	# 1. Filtros de Idade
	if conditions.has("min_age") and int(ctx.get("age", 18)) < int(conditions["min_age"]):
		return false
	if conditions.has("max_age") and int(ctx.get("age", 18)) > int(conditions["max_age"]):
		return false

	# 2. Filtros de Calendário (season_day)
	if conditions.has("min_season_day") and int(ctx.get("season_day", 0)) < int(conditions["min_season_day"]):
		return false
	if conditions.has("max_season_day") and int(ctx.get("season_day", 0)) > int(conditions["max_season_day"]):
		return false

	# 3. Contexto Esportivo
	if conditions.has("is_derby") and bool(ctx.get("is_derby", false)) != bool(conditions["is_derby"]):
		return false
	if conditions.has("is_home") and bool(ctx.get("is_home", false)) != bool(conditions["is_home"]):
		return false

	# 4. Estado de Família / Relacionamento
	if conditions.has("has_spouse") and bool(ctx.get("has_spouse", false)) != bool(conditions["has_spouse"]):
		return false
	if conditions.has("has_children") and bool(ctx.get("has_children", false)) != bool(conditions["has_children"]):
		return false

	# 5. Indicadores Mínimos (stats)
	var stats: Dictionary = ctx.get("stats", {})
	if conditions.has("min_stat"):
		var req_min: Dictionary = conditions["min_stat"]
		for k in req_min:
			var cur_v: float = float(stats.get(k, LifeLegacyState.STAT_DEFAULTS.get(k, 50.0)))
			if cur_v < float(req_min[k]):
				return false

	# 6. Indicadores Máximos (stats)
	if conditions.has("max_stat"):
		var req_max: Dictionary = conditions["max_stat"]
		for k in req_max:
			var cur_v: float = float(stats.get(k, LifeLegacyState.STAT_DEFAULTS.get(k, 50.0)))
			if cur_v > float(req_max[k]):
				return false

	# 7. Restrições Financeiras e Físicas
	if conditions.has("min_money") and int(ctx.get("money", 0)) < int(conditions["min_money"]):
		return false
	if conditions.has("min_energy") and float(ctx.get("energy", 0.0)) < float(conditions["min_energy"]):
		return false

	return true
