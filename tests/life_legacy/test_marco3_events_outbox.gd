extends Node

const LifeLegacyManager = preload("res://autoload/life_legacy_manager.gd")
const LifeLegacyConditions = preload("res://features/life_legacy/life_legacy_conditions.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyRNG = preload("res://features/life_legacy/life_legacy_rng.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _ready() -> void:
	print("--- TEST MARCO 3: INÍCIO ---")
	
	# Prepara slot 0 limpo sincronizado em (1, 10)
	GameState.season_num = 1
	GameState.season_day = 10
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 10))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(0)
	
	test_declarative_conditions()
	test_career_idempotent_effect_and_rollback()
	test_career_idempotent_social_post()
	test_outbox_and_intent_log()
	test_event_roll_and_resolution()
	print("--- TEST MARCO 3: TODOS OS TESTES PASSARAM COM SUCESSO! ---")
	get_tree().quit(0)

func test_declarative_conditions() -> void:
	print("[TEST] 1. Condições Declarativas...")
	var ctx: Dictionary = {
		"age": 22,
		"season_day": 15,
		"is_derby": true,
		"is_home": false,
		"has_spouse": true,
		"has_children": false,
		"money": 10000,
		"energy": 80.0,
		"stats": {
			"discipline": 75.0,
			"popularity": 60.0
		}
	}

	# Condição compatível
	var cond_ok: Dictionary = {
		"min_age": 20,
		"max_age": 25,
		"is_derby": true,
		"has_spouse": true,
		"min_stat": { "discipline": 70.0 }
	}
	assert(LifeLegacyConditions.evaluate(cond_ok, ctx) == true, "Condição compatível deve retornar true")

	# Falha por idade
	var cond_age_fail: Dictionary = { "min_age": 25 }
	assert(LifeLegacyConditions.evaluate(cond_age_fail, ctx) == false, "Idade abaixo do mínimo deve falhar")

	# Falha por derby
	var cond_derby_fail: Dictionary = { "is_derby": false }
	assert(LifeLegacyConditions.evaluate(cond_derby_fail, ctx) == false, "Derby falso deve falhar")

	# Falha por indicador
	var cond_stat_fail: Dictionary = { "min_stat": { "discipline": 80.0 } }
	assert(LifeLegacyConditions.evaluate(cond_stat_fail, ctx) == false, "Discipline abaixo deve falhar")

	print("  -> OK!")

func test_career_idempotent_effect_and_rollback() -> void:
	print("[TEST] 2. Career.apply_idempotent_effect com Deduplicação...")
	assert(Career != null, "Career autoload deve existir")
	Career.processed_career_tokens.clear()
	Career.energy = 100.0
	Career.money = 5000
	
	var initial_money: int = Career.money
	var initial_energy: float = Career.energy
	var token_1: String = "test_tok_effect_001"
	
	# Primeira aplicação
	var ok1: bool = Career.apply_idempotent_effect(token_1, 1500, -10.0)
	assert(ok1 == true, "Primeira aplicação deve ter sucesso")
	assert(Career.money == initial_money + 1500, "Dinheiro deve ser incrementado")
	assert(Career.energy == initial_energy - 10.0, "Energia deve ser decrementada")
	assert(Career.processed_career_tokens.has(token_1), "Token deve estar registrado")
	
	# Segunda aplicação com o MESMO token (idempotência estrita)
	var ok2: bool = Career.apply_idempotent_effect(token_1, 1500, -10.0)
	assert(ok2 == true, "Segunda aplicação deve retornar true por idempotência")
	assert(Career.money == initial_money + 1500, "Dinheiro NÃO deve ser somado novamente!")
	assert(Career.energy == initial_energy - 10.0, "Energia NÃO deve ser alterada novamente!")
	
	print("  -> OK!")

func test_career_idempotent_social_post() -> void:
	print("[TEST] 3. Career.apply_idempotent_social_post com Deduplicação...")
	Career.processed_muro_tokens.clear()
	var initial_posts_count: int = Career.muro_redes.size()
	var token_soc: String = "test_tok_social_001"
	var post_data: Dictionary = {
		"hecho": "festa_vip",
		"autor": "Jogador",
		"texto": "Noite inesquecível no camarote!"
	}
	
	# Primeira publicação
	var ok1: bool = Career.apply_idempotent_social_post(token_soc, post_data)
	assert(ok1 == true, "Primeira postagem deve retornar true")
	assert(Career.muro_redes.size() == initial_posts_count + 1, "Muro deve ter 1 novo post")
	assert(Career.processed_muro_tokens.has(token_soc), "Token social deve estar registrado")
	
	# Segunda publicação com o MESMO token (retransmissão)
	var ok2: bool = Career.apply_idempotent_social_post(token_soc, post_data)
	assert(ok2 == true, "Segunda postagem deve retornar true por idempotência")
	assert(Career.muro_redes.size() == initial_posts_count + 1, "Muro NÃO deve duplicar o post!")
	
	print("  -> OK!")

func test_outbox_and_intent_log() -> void:
	print("[TEST] 4. Fila Outbox e Intent-Log Pre-commitment...")
	Career.processed_career_tokens.clear()
	var outbox_data: Dictionary = {
		"pending_dispatches": []
	}
	var token_outbox: String = "test_tok_outbox_999"
	var intent: Dictionary = LifeLegacyOutbox.create_intent("career_effects", token_outbox, { "money": 300, "energy": 5.0 })
	
	assert(intent["status"] == LifeLegacyOutbox.STATUS_PENDING, "Status inicial deve ser PENDING")
	outbox_data["pending_dispatches"].append(intent)
	
	var initial_money: int = Career.money
	var count: int = LifeLegacyOutbox.reconcile_outbox(outbox_data)
	assert(count == 1, "Deve conciliar 1 despacho")
	assert(intent["status"] == LifeLegacyOutbox.STATUS_COMMITTED, "Status deve mudar para COMMITTED")
	assert(Career.money == initial_money + 300, "Efeito financeiro deve ter sido aplicado")
	
	# Reconciliar novamente não deve alterar nada
	var count2: int = LifeLegacyOutbox.reconcile_outbox(outbox_data)
	assert(count2 == 0, "Nenhum novo despacho pendente")
	print("  -> OK!")

func test_event_roll_and_resolution() -> void:
	print("[TEST] 5. Sorteio de Evento e Resolução com Intent-Log Completo...")
	LifeLegacyEvents.clear_registry()
	
	# Registra um evento de teste
	LifeLegacyEvents.register_event({
		"id": "evt_teste_camarote",
		"title": "Convite para Camarote VIP",
		"description": "Você foi convidado para um evento social na véspera da rodada.",
		"category": "lifestyle",
		"conditions": { "min_age": 18 },
		"weight": 100,
		"choices": [
			{
				"id": "ch_aceitar",
				"text": "Aceitar e curtir",
				"internal_effects": { "popularity": 10.0, "discipline": -5.0 },
				"career_effects": { "money": -500, "energy": -15.0 },
				"social_post": { "hecho": "vip_party", "autor": "Imprensa" }
			},
			{
				"id": "ch_recusar",
				"text": "Recusar e descansar",
				"internal_effects": { "discipline": 5.0 }
			}
		]
	})
	
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 20
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 20))
	ll.set_safe_mode(false)
	ll.reload_slot(0)
	
	var rng = LifeLegacyRNG.new(42)
	var ctx: Dictionary = {
		"season_num": 1,
		"season_day": 20,
		"age": 20,
		"stats": ll.get_all_stats()
	}
	
	var rolled: Dictionary = LifeLegacyEvents.roll_event(ctx, rng)
	assert(rolled.is_empty() == false, "Evento deve ser sorteado")
	assert(rolled["event_id"] == "evt_teste_camarote", "ID do evento deve corresponder")
	assert(rolled["status"] == "PENDING_RESOLUTION", "Status inicial deve ser PENDING_RESOLUTION")
	
	var pop_before: float = ll.get_stat("popularity")
	var disc_before: float = ll.get_stat("discipline")
	var money_before: int = Career.money
	
	# Resolve a escolha
	var ok: bool = LifeLegacyEvents.resolve_choice(rolled, "ch_aceitar", ll.get_data().get("outbox", {}), ll)
	assert(ok == true, "Resolução da escolha deve retornar true")
	assert(rolled["status"] == "RESOLVED", "Status do evento deve ser RESOLVED")
	
	# Valida efeitos internos
	assert(ll.get_stat("popularity") == pop_before + 10.0, "Popularidade deve ter somado 10")
	assert(ll.get_stat("discipline") == disc_before - 5.0, "Disciplina deve ter reduzido 5")
	
	# Valida despacho ao Career
	assert(Career.money == money_before - 500, "Dinheiro deve ter reduzido 500")
	
	# Valida auditoria no histórico
	var hist: Array = ll.get_data().get("stats_history", [])
	assert(hist.size() >= 2, "Histórico deve registrar mudanças de indicadores")
	
	print("  -> OK!")
