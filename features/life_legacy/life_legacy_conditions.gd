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

	# 8. Modificadores Ativos
	var active_mods: Array = ctx.get("active_modifiers", [])
	if conditions.has("has_active_modifier"):
		var target_mod: String = String(conditions["has_active_modifier"])
		var found_mod: bool = false
		for m in active_mods:
			if m is Dictionary and (m.get("id", "") == target_mod or m.get("source_event_id", "") == target_mod):
				found_mod = true
				break
		if not found_mod:
			return false

	if conditions.has("not_has_active_modifier"):
		var forbidden_mod: String = String(conditions["not_has_active_modifier"])
		for m in active_mods:
			if m is Dictionary and (m.get("id", "") == forbidden_mod or m.get("source_event_id", "") == forbidden_mod):
				return false

	# 9. Arcos Narrativos e Estágios
	var story_arcs: Dictionary = ctx.get("story_arcs", {})
	var active_arcs: Dictionary = story_arcs.get("active_arcs", {})
	var completed_arcs: Array = story_arcs.get("completed_arcs", [])

	if conditions.has("not_started_arc"):
		var req_not_started: String = String(conditions["not_started_arc"])
		if active_arcs.has(req_not_started) or completed_arcs.has(req_not_started):
			return false

	if conditions.has("not_completed_arc"):
		var req_not_comp: String = String(conditions["not_completed_arc"])
		if completed_arcs.has(req_not_comp):
			return false

	if conditions.has("has_completed_arc"):
		var req_comp: String = String(conditions["has_completed_arc"])
		if not completed_arcs.has(req_comp):
			return false

	if conditions.has("required_arc_stage"):
		var arc_req: Dictionary = conditions["required_arc_stage"]
		var arc_id: String = String(arc_req.get("arc_id", ""))
		var req_stage: int = int(arc_req.get("stage", 1))
		if req_stage == 1:
			# Estágio 1: pode iniciar se o arco não estiver ativo nem concluído
			if active_arcs.has(arc_id) or completed_arcs.has(arc_id):
				return false
		else:
			# Estágios posteriores: arco deve estar ativo e no estágio exato
			if not active_arcs.has(arc_id):
				return false
			if int(active_arcs[arc_id].get("current_stage", 1)) != req_stage:
				return false

	# 10. Tempo Mínimo Decorrido desde o Ato Anterior do Arco (Ticks Monotônicos)
	if conditions.has("min_ticks_since_prior_act"):
		var min_ticks: int = int(conditions["min_ticks_since_prior_act"])
		var check_arc_id: String = ""
		if conditions.has("required_arc_stage"):
			check_arc_id = String(conditions["required_arc_stage"].get("arc_id", ""))
		elif conditions.has("arc_id"):
			check_arc_id = String(conditions["arc_id"])

		if not check_arc_id.is_empty() and active_arcs.has(check_arc_id):
			var arc_info: Dictionary = active_arcs[check_arc_id]
			if not arc_info.has("last_act_resolved_ticks") or not ctx.has("total_ticks_processed"):
				# Falta de informação histórica confiável: impede elegibilidade prematura
				return false
			var cur_ticks: int = int(ctx.get("total_ticks_processed", 0))
			var last_ticks: int = int(arc_info.get("last_act_resolved_ticks", 0))
			var elapsed: int = cur_ticks - last_ticks
			if elapsed < min_ticks:
				return false

	# 11. Escolhas Anteriores Obrigatórias (required_prior_choices)
	if conditions.has("required_prior_choices"):
		var req_choices: Dictionary = conditions["required_prior_choices"]
		var resolved_map: Dictionary = _extract_resolved_choices_map(ctx)
		for ev_id in req_choices:
			if not resolved_map.has(ev_id) or resolved_map[ev_id] != req_choices[ev_id]:
				return false

	# 12. Escolhas Anteriores Proibidas (forbidden_prior_choices)
	if conditions.has("forbidden_prior_choices"):
		var forb_choices: Dictionary = conditions["forbidden_prior_choices"]
		var resolved_map_forb: Dictionary = _extract_resolved_choices_map(ctx)
		for ev_id in forb_choices:
			if resolved_map_forb.has(ev_id) and resolved_map_forb[ev_id] == forb_choices[ev_id]:
				return false

	return true

static func _extract_resolved_choices_map(ctx: Dictionary) -> Dictionary:
	var res: Dictionary = {}
	# 1. De resolved_choices explícito se fornecido
	if ctx.has("resolved_choices") and ctx["resolved_choices"] is Dictionary:
		for k in ctx["resolved_choices"]:
			res[k] = ctx["resolved_choices"][k]

	# 2. De history.resolved_events
	var hist: Dictionary = ctx.get("history", {})
	var resolved_evs: Array = hist.get("resolved_events", [])
	for rev in resolved_evs:
		if rev is Dictionary and rev.has("event_id") and rev.has("choice_id"):
			res[String(rev["event_id"])] = String(rev["choice_id"])

	# 3. De story_arcs.active_arcs escolhas
	var story_arcs: Dictionary = ctx.get("story_arcs", {})
	var active_arcs: Dictionary = story_arcs.get("active_arcs", {})
	for arc_k in active_arcs:
		var arc_dict: Dictionary = active_arcs[arc_k]
		if arc_dict is Dictionary and arc_dict.has("choices") and arc_dict["choices"] is Dictionary:
			for ev_id in arc_dict["choices"]:
				res[ev_id] = arc_dict["choices"][ev_id]

	return res
