class_name LifeLegacySocial
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")

# =============================================================================
# 1. CONSTANTES E CONFIGURAÇÕES DE ESCÂNDALO E GESTÃO DE IMAGEM
# =============================================================================

const HEAT_MIN: float = 0.0
const HEAT_MAX: float = 100.0

# Faixas de Calor de Escândalos
const HEAT_TRANQUILO_MAX: float = 19.0
const HEAT_LEVE_MAX: float = 39.0
const HEAT_MODERADO_MAX: float = 59.0
const HEAT_CRISE_MAX: float = 79.0
const HEAT_GRAVE_MAX: float = 100.0

enum HeatBand {
	TRANQUILO = 0,
	LEVE = 1,
	MODERADO = 2,
	CRISE = 3,
	GRAVE = 4
}

const HEAT_BAND_INFO: Dictionary = {
	HeatBand.TRANQUILO: {
		"id": "TRANQUILO",
		"name": "Imagem Tranquila",
		"desc": "Sem polêmicas ativas. Relação pública estável.",
		"color": Color(0.2, 0.85, 0.4) # Verde
	},
	HeatBand.LEVE: {
		"id": "LEVE",
		"name": "Repercussão Negativa Leve",
		"desc": "Comentários extracampo pontuais. Atenção requerida.",
		"color": Color(0.85, 0.85, 0.2) # Amarelo-claro
	},
	HeatBand.MODERADO: {
		"id": "MODERADO",
		"name": "Polêmica Moderada",
		"desc": "Noticiário e redes sociais repercutem desvios de conduta.",
		"color": Color(0.95, 0.6, 0.15) # Laranja
	},
	HeatBand.CRISE: {
		"id": "CRISE",
		"name": "Crise de Imagem",
		"desc": "Pressão pública intensa. Marcas e imprensa questionam reputação.",
		"color": Color(0.95, 0.25, 0.2) # Vermelho
	},
	HeatBand.GRAVE: {
		"id": "GRAVE",
		"name": "Crise Grave de Reputação",
		"desc": "Repúdio generalizado extracampo. Risco comercial crítico.",
		"color": Color(0.75, 0.1, 0.1) # Carmesim
	}
}

# Taxa de Resfriamento Base Semanal
const BASE_HEAT_COOLING_RATE: float = 3.5

# =============================================================================
# 2. CONFIGURAÇÃO DA ASSESSORIA DE IMPRENSA
# =============================================================================

const PRESS_AGENT_CONFIG: Dictionary = {
	0: {
		"level": 0,
		"name": "Sem Assessoria",
		"cost": 0,
		"duration_ticks": 0,
		"cooling_bonus": 0.0,
		"containment_factor": 1.0 # 100% do impacto original
	},
	1: {
		"level": 1,
		"name": "Assessoria Regional",
		"cost": 2500,
		"duration_ticks": 12,
		"cooling_bonus": 2.5,
		"containment_factor": 0.85 # Reduz impacto em 15%
	},
	2: {
		"level": 2,
		"name": "Assessoria Nacional Especializada",
		"cost": 7500,
		"duration_ticks": 16,
		"cooling_bonus": 5.0,
		"containment_factor": 0.70 # Reduz impacto em 30%
	},
	3: {
		"level": 3,
		"name": "Gestão de Crise de Elite Internacional",
		"cost": 18000,
		"duration_ticks": 20,
		"cooling_bonus": 8.0,
		"containment_factor": 0.50 # Reduz impacto em 50%
	}
}

# =============================================================================
# 3. CONFIGURAÇÃO DAS AÇÕES DE RELAÇÕES PÚBLICAS
# =============================================================================

const ACTION_PRESS_AGENT: String = "assessoria"
const ACTION_RETRACTION: String = "retratacao"
const ACTION_CHARITY: String = "caridade"
const ACTION_TRAINING_POST: String = "post_treino"

const RP_ACTIONS: Dictionary = {
	ACTION_PRESS_AGENT: {
		"id": ACTION_PRESS_AGENT,
		"name": "Contratar Assessoria de Imprensa",
		"requires_level_param": true
	},
	ACTION_RETRACTION: {
		"id": ACTION_RETRACTION,
		"name": "Publicar Retratação Oficial",
		"cost": 500,
		"cooldown_ticks": 4,
		"min_heat": 15.0,
		"heat_reduction_ratio": 0.25,
		"heat_reduction_flat": 10.0,
		"stat_deltas": {
			"reputation": 4.0,
			"popularity": -2.0,
			"discipline": 1.0
		},
		"muro_hecho": "comunicado_perdon",
		"post_author": "yo",
		"post_text": "Me equivoqué. Pido perdón al club, a la afición y a mis compañeros. Asumo la responsabilidad."
	},
	ACTION_CHARITY: {
		"id": ACTION_CHARITY,
		"name": "Campanha de Caridade",
		"cost": 6000,
		"cooldown_ticks": 8,
		"campaign_duration_ticks": 4,
		"heat_reduction_flat": 12.0,
		"stat_deltas": {
			"popularity": 8.0,
			"social_influence": 6.0,
			"reputation": 4.0
		},
		"muro_hecho": "comunicado_perdon",
		"post_author": "yo",
		"post_text": "Orgulho de lançar hoje a nossa campanha solidária de apoio à comunidade. Juntos somos mais fortes!"
	},
	ACTION_TRAINING_POST: {
		"id": ACTION_TRAINING_POST,
		"name": "Post Promocional de Treino",
		"cost": 0,
		"cooldown_ticks": 2,
		"stat_deltas": {
			"popularity": 3.0,
			"social_influence": 2.0,
			"discipline": 1.0
		},
		"heat_reduction_flat": 1.5,
		"muro_hecho": "post_pique",
		"post_author": "yo",
		"post_text": "Foco inegociável nos treinos diários. A dedicação em campo começa na preparação."
	}
}

# =============================================================================
# 4. MÉTODOS DE CONSULTA E ESTADO
# =============================================================================

static func get_social_state(profile: Dictionary) -> Dictionary:
	if not profile.has("social_reputation") or not (profile["social_reputation"] is Dictionary):
		profile["social_reputation"] = {
			"scandal_heat": 0.0,
			"press_agent_level": 0,
			"press_agent_ticks_remaining": 0,
			"active_campaigns": [],
			"cooldowns": {},
			"history": [],
			"last_processed_tick": int(profile.get("total_ticks_processed", 0))
		}
	return profile["social_reputation"]

static func get_heat(profile: Dictionary) -> float:
	var sr = get_social_state(profile)
	return clampf(float(sr.get("scandal_heat", 0.0)), HEAT_MIN, HEAT_MAX)

static func get_heat_band(heat: float) -> HeatBand:
	var h = clampf(heat, HEAT_MIN, HEAT_MAX)
	if h <= HEAT_TRANQUILO_MAX:
		return HeatBand.TRANQUILO
	elif h <= HEAT_LEVE_MAX:
		return HeatBand.LEVE
	elif h <= HEAT_MODERADO_MAX:
		return HeatBand.MODERADO
	elif h <= HEAT_CRISE_MAX:
		return HeatBand.CRISE
	else:
		return HeatBand.GRAVE

static func _normalize_action_id(action_id: String) -> String:
	match action_id:
		"hire_press_agent", "press_agent", "assessoria":
			return ACTION_PRESS_AGENT
		"public_retraction", "retraction", "retratacao":
			return ACTION_RETRACTION
		"charity_campaign", "charity", "caridade":
			return ACTION_CHARITY
		"training_promo_post", "training_post", "post_treino":
			return ACTION_TRAINING_POST
		_:
			return action_id

static func get_heat_band_info(heat: float) -> Dictionary:
	var band = get_heat_band(heat)
	var info = HEAT_BAND_INFO.get(band, HEAT_BAND_INFO[HeatBand.TRANQUILO]).duplicate()
	info["band"] = band
	info["description"] = info.get("desc", "")
	return info

static func get_press_agent_level(profile: Dictionary) -> int:
	var sr = get_social_state(profile)
	return int(sr.get("press_agent_level", 0))

static func get_press_agent_info(profile: Dictionary) -> Dictionary:
	var sr = get_social_state(profile)
	var lvl = int(sr.get("press_agent_level", 0))
	var base_info = PRESS_AGENT_CONFIG.get(lvl, PRESS_AGENT_CONFIG[0]).duplicate()
	base_info["ticks_remaining"] = int(sr.get("press_agent_ticks_remaining", 0))
	base_info["remaining_ticks"] = int(sr.get("press_agent_ticks_remaining", 0))
	return base_info

static func is_action_available(profile: Dictionary, action_id: String, career_money: int, params: Dictionary = {}) -> Dictionary:
	action_id = _normalize_action_id(action_id)
	var sr = get_social_state(profile)
	var heat = get_heat(profile)

	# 1. Ação desconhecida
	if action_id == ACTION_PRESS_AGENT:
		var target_lvl = int(params.get("level", 1))
		if not PRESS_AGENT_CONFIG.has(target_lvl) or target_lvl <= 0:
			return { "available": false, "reason": "Nível de assessoria inválido", "cost": 0, "cooldown_remaining": 0 }
		var cur_lvl = int(sr.get("press_agent_level", 0))
		if cur_lvl == target_lvl and int(sr.get("press_agent_ticks_remaining", 0)) > 4:
			return { "available": false, "reason": "Assessoria deste nível já contratada e ativa", "cost": 0, "cooldown_remaining": 0 }
		var cost = int(PRESS_AGENT_CONFIG[target_lvl]["cost"])
		if career_money < cost:
			return { "available": false, "reason": "Saldo insuficiente (necessário $ %d, disponível $ %d)" % [cost, career_money], "cost": cost, "cooldown_remaining": 0 }
		return { "available": true, "reason": "", "cost": cost, "cooldown_remaining": 0 }

	if not RP_ACTIONS.has(action_id):
		return { "available": false, "reason": "Ação de RP não reconhecida", "cost": 0, "cooldown_remaining": 0 }

	var cfg = RP_ACTIONS[action_id]
	var cost = int(cfg.get("cost", 0))

	# 2. Saldo suficiente
	if career_money < cost:
		return { "available": false, "reason": "Saldo insuficiente (necessário $ %d, disponível $ %d)" % [cost, career_money], "cost": cost, "cooldown_remaining": 0 }

	# 3. Cooldown
	var cd_dict = sr.get("cooldowns", {})
	if cd_dict.has(action_id):
		var cd_rem = int(cd_dict[action_id])
		if cd_rem > 0:
			return { "available": false, "reason": "Ação em cooldown (%d semanas restantes)" % cd_rem, "cost": cost, "cooldown_remaining": cd_rem }

	# 4. Pré-requisito de calor para retratação
	if action_id == ACTION_RETRACTION:
		var min_h = float(cfg.get("min_heat", 15.0))
		if heat < min_h:
			return { "available": false, "reason": "Nenhum escândalo ativo requer retratação (calor < %.0f)" % min_h, "cost": cost, "cooldown_remaining": 0 }

	return { "available": true, "reason": "", "cost": cost, "cooldown_remaining": 0 }

# =============================================================================
# 5. MECÂNICA DE ESCÂNDALOS: APLICAÇÃO E RESFRIAMENTO
# =============================================================================

static func apply_scandal(profile: Dictionary, scandal_id: String, raw_heat: float, reason: String, season_num: int, season_day: int) -> Dictionary:
	var sr = get_social_state(profile)
	var old_heat = float(sr.get("scandal_heat", 0.0))
	var agent_lvl = int(sr.get("press_agent_level", 0))
	var containment = float(PRESS_AGENT_CONFIG.get(agent_lvl, PRESS_AGENT_CONFIG[0]).get("containment_factor", 1.0))

	var effective_delta = raw_heat * containment
	var new_heat = clampf(old_heat + effective_delta, HEAT_MIN, HEAT_MAX)
	sr["scandal_heat"] = new_heat

	var history_entry = {
		"type": "scandal",
		"scandal_id": scandal_id,
		"raw_heat": raw_heat,
		"effective_delta": effective_delta,
		"old_heat": old_heat,
		"new_heat": new_heat,
		"reason": reason,
		"press_agent_containment": containment,
		"season_num": season_num,
		"season_day": season_day,
		"timestamp": Time.get_datetime_string_from_system()
	}
	var hist: Array = sr.get("history", [])
	hist.append(history_entry)
	sr["history"] = hist

	return {
		"scandal_id": scandal_id,
		"raw_heat": raw_heat,
		"effective_delta": effective_delta,
		"new_heat": new_heat,
		"band": get_heat_band(new_heat)
	}

static func advance_social_ticks(profile: Dictionary, ticks_to_advance: int) -> Dictionary:
	if ticks_to_advance <= 0:
		return { "decay_applied": 0.0, "expired_agents": [], "expired_campaigns": [] }

	var sr = get_social_state(profile)
	var old_heat = float(sr.get("scandal_heat", 0.0))
	var agent_lvl = int(sr.get("press_agent_level", 0))
	var bonus_cool = float(PRESS_AGENT_CONFIG.get(agent_lvl, PRESS_AGENT_CONFIG[0]).get("cooling_bonus", 0.0))
	var total_cool_rate = BASE_HEAT_COOLING_RATE + bonus_cool
	var total_decay = total_cool_rate * float(ticks_to_advance)

	var new_heat = maxf(HEAT_MIN, old_heat - total_decay)
	sr["scandal_heat"] = new_heat

	var expired_agents: Array = []
	var rem_agent = int(sr.get("press_agent_ticks_remaining", 0))
	if rem_agent > 0:
		rem_agent = maxi(0, rem_agent - ticks_to_advance)
		sr["press_agent_ticks_remaining"] = rem_agent
		if rem_agent == 0 and agent_lvl > 0:
			expired_agents.append(agent_lvl)
			sr["press_agent_level"] = 0
			var hist: Array = sr.get("history", [])
			hist.append({
				"type": "press_agent_expired",
				"previous_level": agent_lvl,
				"timestamp": Time.get_datetime_string_from_system()
			})
			sr["history"] = hist

	var expired_campaigns: Array = []
	var active_camps: Array = sr.get("active_campaigns", [])
	var remaining_camps: Array = []
	for camp in active_camps:
		if camp is Dictionary:
			var c_rem = int(camp.get("ticks_remaining", 1)) - ticks_to_advance
			if c_rem <= 0:
				expired_campaigns.append(camp.get("campaign_id", ""))
				var hist: Array = sr.get("history", [])
				hist.append({
					"type": "campaign_completed",
					"campaign_id": camp.get("campaign_id", ""),
					"timestamp": Time.get_datetime_string_from_system()
				})
				sr["history"] = hist
			else:
				var c_copy = camp.duplicate(true)
				c_copy["ticks_remaining"] = c_rem
				remaining_camps.append(c_copy)
	sr["active_campaigns"] = remaining_camps

	var cd_dict = sr.get("cooldowns", {}).duplicate()
	var keys_to_remove: Array = []
	for act_k in cd_dict:
		var rem_cd = int(cd_dict[act_k]) - ticks_to_advance
		if rem_cd <= 0:
			keys_to_remove.append(act_k)
		else:
			cd_dict[act_k] = rem_cd
	for rk in keys_to_remove:
		cd_dict.erase(rk)
	sr["cooldowns"] = cd_dict

	sr["last_processed_tick"] = int(profile.get("total_ticks_processed", 0))

	return {
		"old_heat": old_heat,
		"new_heat": new_heat,
		"decay_applied": old_heat - new_heat,
		"expired_agents": expired_agents,
		"expired_campaigns": expired_campaigns
	}

# =============================================================================
# 6. PROTOCOLO TRANSACIONAL DE EXECUÇÃO DE AÇÕES DE RP
# =============================================================================

static func execute_rp_action(manager_ref: Object, action_id: String, params: Dictionary = {}) -> Dictionary:
	action_id = _normalize_action_id(action_id)
	if manager_ref == null or manager_ref.is_safe_mode():
		return { "ok": false, "success": false, "status": "SAFE_MODE_BLOCKED", "error": "Modo seguro ativado", "reason": "Modo seguro ativado" }

	var profile = manager_ref.get_data()
	var slot = manager_ref.get_current_slot()
	var time_info = manager_ref.get_last_observed_time()
	var s_num = int(time_info.get("season_num", 1))
	var s_day = int(time_info.get("season_day", 0))

	var career = LifeLegacyOutbox._get_career()
	var career_money = career.money if career != null else 0

	# 1. Validação prévia de disponibilidade
	var check = is_action_available(profile, action_id, career_money, params)
	if not check["available"]:
		var r_msg = check.get("reason", "Ação indisponível")
		return { "ok": false, "success": false, "status": "REJECTED", "error": r_msg, "reason": r_msg }

	var sr = get_social_state(profile)
	var tx_id = "rp_tx_s%d_d%d_%s_%d" % [s_num, s_day, action_id, Time.get_ticks_msec()]
	var token_cost = "rp_cost_%s_%s" % [action_id, tx_id]
	var token_post = "rp_post_%s_%s" % [action_id, tx_id]

	var cost = 0
	var stat_deltas = {}
	var heat_delta = 0.0
	var post_dict: Dictionary = {}

	if action_id == ACTION_PRESS_AGENT:
		var target_lvl = int(params.get("level", 1))
		var cfg = PRESS_AGENT_CONFIG[target_lvl]
		cost = int(cfg["cost"])
	else:
		var cfg = RP_ACTIONS[action_id]
		cost = int(cfg.get("cost", 0))
		stat_deltas = cfg.get("stat_deltas", {}).duplicate()

		if action_id == ACTION_RETRACTION:
			var cur_h = float(sr.get("scandal_heat", 0.0))
			var ratio = float(cfg.get("heat_reduction_ratio", 0.25))
			var flat = float(cfg.get("heat_reduction_flat", 10.0))
			heat_delta = - (cur_h * ratio + flat)

			post_dict = {
				"season": s_num,
				"day": s_day,
				"hecho": String(cfg.get("muro_hecho", "comunicado_perdon")),
				"autor": String(cfg.get("post_author", "yo")),
				"texto": String(cfg.get("post_text", "")),
				"tipo": "comunicado_perdon",
				"likes": 1200,
				"timestamp": Time.get_datetime_string_from_system()
			}
		elif action_id == ACTION_CHARITY:
			heat_delta = - float(cfg.get("heat_reduction_flat", 12.0))
			post_dict = {
				"season": s_num,
				"day": s_day,
				"hecho": String(cfg.get("muro_hecho", "comunicado_perdon")),
				"autor": String(cfg.get("post_author", "yo")),
				"texto": String(cfg.get("post_text", "")),
				"tipo": "solidario",
				"likes": 4500,
				"timestamp": Time.get_datetime_string_from_system()
			}
		elif action_id == ACTION_TRAINING_POST:
			heat_delta = - float(cfg.get("heat_reduction_flat", 1.5))
			post_dict = {
				"season": s_num,
				"day": s_day,
				"hecho": String(cfg.get("muro_hecho", "post_pique")),
				"autor": String(cfg.get("post_author", "yo")),
				"texto": String(cfg.get("post_text", "")),
				"tipo": "entrenamiento",
				"likes": 2800,
				"timestamp": Time.get_datetime_string_from_system()
			}

	# 2. Criação das intenções no Outbox
	var intents: Array = []
	if cost > 0:
		intents.append(LifeLegacyOutbox.create_intent("career_effects", token_cost, { "money": -cost, "energy": 0.0 }))
	if not post_dict.is_empty():
		intents.append(LifeLegacyOutbox.create_intent("career_social", token_post, { "post_data": post_dict }))

	# 3. Pré-compromisso: grava intenções e estado da transação no save antes de despachar
	var pending_dispatches: Array = profile.get("outbox", {}).get("pending_dispatches", [])
	for it in intents:
		pending_dispatches.append(it)
	if not profile.has("outbox"):
		profile["outbox"] = {}
	profile["outbox"]["pending_dispatches"] = pending_dispatches

	var pending_tx = {
		"tx_id": tx_id,
		"action_id": action_id,
		"params": params,
		"cost": cost,
		"stat_deltas": stat_deltas,
		"heat_delta": heat_delta,
		"token_cost": token_cost,
		"token_post": token_post,
		"status": "PRE_COMMITMENT",
		"season_num": s_num,
		"season_day": s_day
	}
	sr["pending_rp_transaction"] = pending_tx

	var save_ok = manager_ref.save_current_slot()
	if not save_ok:
		# Rollback local se não salvou o pré-compromisso
		sr.erase("pending_rp_transaction")
		for it in intents:
			pending_dispatches.erase(it)
		push_error("[LifeLegacySocial] Falha de I/O ao salvar pré-compromisso da ação %s. Abortando." % action_id)
		return { "ok": false, "success": false, "status": "IO_FAILURE", "error": "Falha ao gravar transação", "reason": "Falha ao gravar transação" }

	profile = manager_ref.get_data()
	sr = get_social_state(profile)

	# 4. Despacho ao Receptor (Career)
	var all_dispatched = true
	for it in intents:
		var disp_ok = LifeLegacyOutbox.dispatch_intent(it)
		if not disp_ok:
			all_dispatched = false

	if not all_dispatched:
		manager_ref.save_current_slot()
		push_warning("[LifeLegacySocial] Nem todas as intenções da ação %s foram confirmadas. Retenção em PRE_COMMITMENT para retry." % action_id)
		return { "ok": false, "success": false, "status": "PENDING_DISPATCH", "tx_id": tx_id, "error": "Despacho incompleto; retentativa necessária", "reason": "Despacho pendente de confirmação" }

	# 5. Confirmação e Efeitos no Perfil
	if action_id == ACTION_PRESS_AGENT:
		var target_lvl = int(params.get("level", 1))
		var cfg = PRESS_AGENT_CONFIG[target_lvl]
		sr["press_agent_level"] = target_lvl
		sr["press_agent_ticks_remaining"] = int(cfg["duration_ticks"])
	else:
		var cfg = RP_ACTIONS[action_id]
		var cd_ticks = int(cfg.get("cooldown_ticks", 0))
		if cd_ticks > 0:
			var cds = sr.get("cooldowns", {})
			cds[action_id] = cd_ticks
			sr["cooldowns"] = cds

		if action_id == ACTION_CHARITY:
			var active_camps: Array = sr.get("active_campaigns", [])
			active_camps.append({
				"campaign_id": "camp_%s" % tx_id,
				"name": "Campanha Solidária Comunitária",
				"ticks_remaining": int(cfg.get("campaign_duration_ticks", 4)),
				"season_num": s_num,
				"season_day": s_day
			})
			sr["active_campaigns"] = active_camps

	if absf(heat_delta) > 0.001:
		sr["scandal_heat"] = clampf(float(sr.get("scandal_heat", 0.0)) + heat_delta, HEAT_MIN, HEAT_MAX)

	for stat_k in stat_deltas:
		var d = float(stat_deltas[stat_k])
		manager_ref.apply_stat_change(stat_k, d, "rp_action_%s" % action_id, tx_id)

	var hist: Array = sr.get("history", [])
	hist.append({
		"type": "rp_action_completed",
		"action_id": action_id,
		"tx_id": tx_id,
		"cost": cost,
		"stat_deltas": stat_deltas,
		"heat_delta": heat_delta,
		"season_num": s_num,
		"season_day": s_day,
		"timestamp": Time.get_datetime_string_from_system()
	})
	sr["history"] = hist
	sr.erase("pending_rp_transaction")

	manager_ref.save_current_slot()
	return { "ok": true, "success": true, "status": "COMPLETED", "tx_id": tx_id }

static func recover_pending_rp_transaction(manager_ref: Object) -> bool:
	if manager_ref == null:
		return false
	var profile = manager_ref.get_data()
	var sr = get_social_state(profile)
	if not sr.has("pending_rp_transaction"):
		return false

	var pending_tx: Dictionary = sr["pending_rp_transaction"]
	var tx_id = pending_tx.get("tx_id", "")
	var action_id = pending_tx.get("action_id", "")
	var params = pending_tx.get("params", {})
	var cost = int(pending_tx.get("cost", 0))
	var stat_deltas = pending_tx.get("stat_deltas", {})
	var heat_delta = float(pending_tx.get("heat_delta", 0.0))
	var s_num = int(pending_tx.get("season_num", 1))
	var s_day = int(pending_tx.get("season_day", 0))

	var outbox_list: Array = profile.get("outbox", {}).get("pending_dispatches", [])
	var all_dispatched = true
	for it in outbox_list:
		if it is Dictionary and String(it.get("token", "")).contains(tx_id):
			var disp_ok = LifeLegacyOutbox.dispatch_intent(it)
			if not disp_ok:
				all_dispatched = false

	if not all_dispatched:
		return false

	# Aplica os efeitos conclusivos da transação recuperada
	if action_id == ACTION_PRESS_AGENT:
		var target_lvl = int(params.get("level", 1))
		var cfg = PRESS_AGENT_CONFIG[target_lvl]
		sr["press_agent_level"] = target_lvl
		sr["press_agent_ticks_remaining"] = int(cfg["duration_ticks"])
	else:
		var cfg = RP_ACTIONS[action_id]
		var cd_ticks = int(cfg.get("cooldown_ticks", 0))
		if cd_ticks > 0:
			var cds = sr.get("cooldowns", {})
			cds[action_id] = cd_ticks
			sr["cooldowns"] = cds

		if action_id == ACTION_CHARITY:
			var active_camps: Array = sr.get("active_campaigns", [])
			active_camps.append({
				"campaign_id": "camp_%s" % tx_id,
				"name": "Campanha Solidária Comunitária",
				"ticks_remaining": int(cfg.get("campaign_duration_ticks", 4)),
				"season_num": s_num,
				"season_day": s_day
			})
			sr["active_campaigns"] = active_camps

	if absf(heat_delta) > 0.001:
		sr["scandal_heat"] = clampf(float(sr.get("scandal_heat", 0.0)) + heat_delta, HEAT_MIN, HEAT_MAX)

	for stat_k in stat_deltas:
		var d = float(stat_deltas[stat_k])
		manager_ref.apply_stat_change(stat_k, d, "rp_recovery_%s" % action_id, tx_id)

	var hist: Array = sr.get("history", [])
	hist.append({
		"type": "rp_action_recovered",
		"action_id": action_id,
		"tx_id": tx_id,
		"cost": cost,
		"season_num": s_num,
		"season_day": s_day,
		"timestamp": Time.get_datetime_string_from_system()
	})
	sr["history"] = hist
	sr.erase("pending_rp_transaction")

	manager_ref.save_current_slot()
	return true

# =============================================================================
# 7. INTEGRAÇÃO EXTRACAMPO COM PATROCÍNIOS E MERCADO
# =============================================================================

static func calculate_sponsorship_impact(heat: float) -> Dictionary:
	var h = clampf(heat, HEAT_MIN, HEAT_MAX)
	var band = get_heat_band(h)

	var impact = {
		"active": h >= 20.0,
		"heat": h,
		"band": band,
		"band_name": get_heat_band_info(h)["name"],
		"reputation_penalty": 0,
		"offer_value_multiplier": 1.0,
		"top_tier_blocked": false,
		"reason": ""
	}

	if h >= 80.0: # GRAVE
		impact["reputation_penalty"] = 35
		impact["offer_value_multiplier"] = 0.50
		impact["top_tier_blocked"] = true
		impact["reason"] = "Crise grave de reputação extracampo: marcas globais de elite suspendem negociações."
	elif h >= 60.0: # CRISE
		impact["reputation_penalty"] = 20
		impact["offer_value_multiplier"] = 0.70
		impact["top_tier_blocked"] = true
		impact["reason"] = "Crise de imagem ativa: marcas exigem maiores garantias e reduzem valor das ofertas em 30%."
	elif h >= 40.0: # MODERADO
		impact["reputation_penalty"] = 10
		impact["offer_value_multiplier"] = 0.85
		impact["top_tier_blocked"] = false
		impact["reason"] = "Polêmica moderada: marcas cautelosas aplicam deságio de 15% nas propostas."
	elif h >= 20.0: # LEVE
		impact["reputation_penalty"] = 5
		impact["offer_value_multiplier"] = 0.95
		impact["top_tier_blocked"] = false
		impact["reason"] = "Repercussão leve: impacto marginal no valor comercial."
	else:
		impact["reputation_penalty"] = 0
		impact["offer_value_multiplier"] = 1.0
		impact["top_tier_blocked"] = false
		impact["reason"] = "Imagem comercial tranquila e valorizada."

	return impact
