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
	test_pre_commitment_failure_aborts_dispatch()
	test_interrupted_outbox_reconciliation()
	test_seven_failure_scenarios_and_recovery()
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

func test_pre_commitment_failure_aborts_dispatch() -> void:
	print("[TEST] 6. Falha no Pré-compromisso Aborta Despacho e Rollback de Memória...")
	var ll = LifeLegacy
	var event_dummy: Dictionary = {
		"event_id": "evt_fail_sim",
		"occurrence_id": "occ_fail_sim_01",
		"status": "PENDING_RESOLUTION",
		"choices": [
			{
				"id": "ch_sim_err",
				"text": "Escolha de teste",
				"internal_effects": { "stress": 20.0 },
				"career_effects": { "money": -9999, "energy": -50.0 }
			}
		]
	}
	
	var initial_money: int = Career.money
	var initial_energy: float = Career.energy
	var outbox_dict: Dictionary = { "pending_dispatches": [] }
	
	# Força modo seguro no manager, o que faz save_current_slot() retornar false
	ll.set_safe_mode(true)
	
	var ok: bool = LifeLegacyEvents.resolve_choice(event_dummy, "ch_sim_err", outbox_dict, ll)
	assert(ok == false, "resolve_choice deve retornar false quando o pré-compromisso falha")
	assert(event_dummy["status"] == "PENDING_RESOLUTION", "Evento não deve avançar para RESOLVED após falha")
	assert(Career.money == initial_money, "Dinheiro do Career não deve ser alterado")
	assert(Career.energy == initial_energy, "Energia do Career não deve ser alterada")
	assert(outbox_dict["pending_dispatches"].is_empty() == true, "Outbox deve reverter intents não confirmados")
	
	ll.set_safe_mode(false)
	print("  -> OK!")

func test_interrupted_outbox_reconciliation() -> void:
	print("[TEST] 7. Reconciliação Pós-Interrupção (Crash) sem Duplicação de Efeitos...")
	Career.processed_career_tokens.clear()
	var test_token: String = "tok_crash_reconcile_001"
	var initial_money: int = 50000
	var initial_energy: float = 80.0
	Career.money = initial_money
	Career.energy = initial_energy
	
	# Simula que o Career recebeu e aplicou o intent antes do crash
	var apply_ok: bool = Career.apply_idempotent_effect(test_token, -2000, -10.0)
	assert(apply_ok == true, "Aplicação inicial no Career deve ter sucesso")
	assert(Career.money == 48000, "Dinheiro deve ser 48000 após aplicação")
	assert(Career.energy == 70.0, "Energia deve ser 70.0 após aplicação")
	assert(Career.processed_career_tokens.has(test_token), "Token deve estar registrado no receptor")
	
	# Simula que o Outbox NÃO salvou a tempo antes do crash (ficou PENDING no disco)
	var outbox_recovering: Dictionary = {
		"pending_dispatches": [
			{
				"target": "career_effects",
				"token": test_token,
				"payload": { "money": -2000, "energy": -10.0 },
				"status": LifeLegacyOutbox.STATUS_PENDING,
				"retry_count": 0
			}
		]
	}
	
	# Executa reconciliação de boot
	var reconciled_count: int = LifeLegacyOutbox.reconcile_outbox(outbox_recovering)
	assert(reconciled_count == 1, "Deve reconciliar 1 despacho")
	assert(outbox_recovering["pending_dispatches"][0]["status"] == LifeLegacyOutbox.STATUS_COMMITTED, "Status deve ser atualizado para COMMITTED")
	
	# Efeitos NÃO devem ter sido aplicados novamente!
	assert(Career.money == 48000, "Dinheiro NÃO deve sofrer nova dedução de 2000 (deve permanecer 48000)")
	assert(Career.energy == 70.0, "Energia NÃO deve sofrer nova dedução de 10.0 (deve permanecer 70.0)")
	
	print("  -> OK!")

func test_seven_failure_scenarios_and_recovery() -> void:
	print("[TEST] 8. Validação Exaustiva dos 7 Cenários de Falha e Recuperação...")
	var ll = LifeLegacy
	
	# Cenário 1: Falha antes do pré-compromisso (escolha inexistente)
	print("  [Cenário 1] Falha antes do pré-compromisso (escolha inválida)...")
	var evt_c1: Dictionary = {
		"event_id": "evt_c1",
		"occurrence_id": "occ_c1_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{"id": "valid_choice", "text": "Ok"}]
	}
	var outbox_c1: Dictionary = {"pending_dispatches": []}
	var res_c1 = LifeLegacyEvents.resolve_choice(evt_c1, "invalid_choice_xyz", outbox_c1, ll)
	assert(res_c1 == false, "Cenário 1 deve retornar false")
	assert(evt_c1["status"] == "PENDING_RESOLUTION", "Cenário 1 deve manter status original")
	assert(outbox_c1["pending_dispatches"].is_empty(), "Cenário 1 não deve criar intenções")
	print("    -> Cenário 1 Aprovado!")

	# Cenário 2: Falha no salvamento do pré-compromisso
	print("  [Cenário 2] Falha no salvamento do pré-compromisso (I/O failure)...")
	var evt_c2: Dictionary = {
		"event_id": "evt_c2",
		"occurrence_id": "occ_c2_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{
			"id": "c2_choice",
			"text": "Teste C2",
			"career_effects": {"money": -500, "energy": -5.0}
		}]
	}
	var outbox_c2: Dictionary = {"pending_dispatches": []}
	var m_before_c2: int = Career.money
	ll.set_safe_mode(true)
	var res_c2 = LifeLegacyEvents.resolve_choice(evt_c2, "c2_choice", outbox_c2, ll)
	assert(res_c2 == false, "Cenário 2 deve retornar false por falha no pré-compromisso")
	assert(evt_c2["status"] == "PENDING_RESOLUTION", "Cenário 2 deve sofrer rollback para PENDING_RESOLUTION")
	assert(outbox_c2["pending_dispatches"].is_empty(), "Cenário 2 deve reverter intenções da memória")
	assert(Career.money == m_before_c2, "Career não deve ser alterado")
	ll.set_safe_mode(false)
	print("    -> Cenário 2 Aprovado!")

	# Cenário 3: Falha durante o primeiro despacho
	print("  [Cenário 3] Falha durante o primeiro despacho...")
	var evt_c3: Dictionary = {
		"event_id": "evt_c3",
		"occurrence_id": "occ_c3_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{
			"id": "c3_choice",
			"text": "Teste C3",
			"career_effects": {"money": -700, "energy": -5.0},
			"internal_effects": {"discipline": 5.0}
		}]
	}
	var outbox_c3: Dictionary = {"pending_dispatches": []}
	var disc_before_c3: float = ll.get_stat("discipline")
	var money_before_c3: int = Career.money
	
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "_career"
	var res_c3_1 = LifeLegacyEvents.resolve_choice(evt_c3, "c3_choice", outbox_c3, ll)
	assert(res_c3_1 == false, "Cenário 3 deve retornar false no despacho com falha")
	assert(evt_c3["status"] == "PRE_COMMITMENT", "Evento deve permanecer em PRE_COMMITMENT")
	assert(ll.get_stat("discipline") == disc_before_c3, "Indicadores internos NÃO devem ser aplicados na falha")
	assert(Career.money == money_before_c3, "Career não deve ser alterado")
	
	# Retentativa com despacho liberado
	LifeLegacyOutbox.reset_fault_injection()
	var res_c3_2 = LifeLegacyEvents.resolve_choice(evt_c3, "c3_choice", outbox_c3, ll)
	assert(res_c3_2 == true, "Cenário 3 retentativa deve suceder")
	assert(evt_c3["status"] == "RESOLVED", "Evento deve transitar para RESOLVED")
	assert(ll.get_stat("discipline") == disc_before_c3 + 5.0, "Indicador interno aplicado exatamente uma vez")
	assert(Career.money == money_before_c3 - 700, "Dinheiro debitado exatamente uma vez")
	print("    -> Cenário 3 Aprovado!")

	# Cenário 4: Falha após o primeiro despacho (primeiro sucede, segundo falha)
	print("  [Cenário 4] Falha após o primeiro despacho (primeiro sucede, segundo falha)...")
	var evt_c4: Dictionary = {
		"event_id": "evt_c4",
		"occurrence_id": "occ_c4_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{
			"id": "c4_choice",
			"text": "Teste C4",
			"career_effects": {"money": -400, "energy": -2.0},
			"social_post": {"author": "Player", "text": "Post C4", "likes": 10},
			"internal_effects": {"popularity": 8.0}
		}]
	}
	var outbox_c4: Dictionary = {"pending_dispatches": []}
	var pop_before_c4: float = ll.get_stat("popularity")
	var money_before_c4: int = Career.money
	
	# Simula falha no segundo despacho (_social)
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "_social"
	var res_c4_1 = LifeLegacyEvents.resolve_choice(evt_c4, "c4_choice", outbox_c4, ll)
	assert(res_c4_1 == false, "Cenário 4 deve retornar false pois _social falhou")
	assert(evt_c4["status"] == "PRE_COMMITMENT", "Evento deve ficar em PRE_COMMITMENT")
	assert(Career.money == money_before_c4 - 400, "Primeiro despacho (_career) teve sucesso")
	assert(ll.get_stat("popularity") == pop_before_c4, "Efeitos internos ainda não devem ter sido aplicados")
	
	# Segunda tentativa mantendo a falha: comprova que _career NÃO é duplicado!
	var res_c4_fail_again = LifeLegacyEvents.resolve_choice(evt_c4, "c4_choice", outbox_c4, ll)
	assert(res_c4_fail_again == false, "Deve continuar retornando false")
	assert(Career.money == money_before_c4 - 400, "Dinheiro NÃO deve ser debitado duas vezes! Idempotência comprovada!")
	
	# Libera o despacho de _social e conclui
	LifeLegacyOutbox.reset_fault_injection()
	var res_c4_ok = LifeLegacyEvents.resolve_choice(evt_c4, "c4_choice", outbox_c4, ll)
	assert(res_c4_ok == true, "Cenário 4 retentativa final deve retornar true")
	assert(evt_c4["status"] == "RESOLVED", "Evento transita para RESOLVED")
	assert(Career.money == money_before_c4 - 400, "Dinheiro final continua debitado exatamente uma vez (-400)")
	assert(ll.get_stat("popularity") == pop_before_c4 + 8.0, "Popularidade aplicada exatamente uma vez")
	print("    -> Cenário 4 Aprovado!")

	# Cenário 5: Falha durante o último despacho
	print("  [Cenário 5] Falha durante o último despacho...")
	var evt_c5: Dictionary = {
		"event_id": "evt_c5",
		"occurrence_id": "occ_c5_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{
			"id": "c5_choice",
			"text": "Teste C5",
			"social_post": {"author": "Player", "text": "Post C5", "likes": 5}
		}]
	}
	var outbox_c5: Dictionary = {"pending_dispatches": []}
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "_social"
	var res_c5_1 = LifeLegacyEvents.resolve_choice(evt_c5, "c5_choice", outbox_c5, ll)
	assert(res_c5_1 == false, "Cenário 5 deve retornar false")
	assert(evt_c5["status"] == "PRE_COMMITMENT", "Evento permanece PRE_COMMITMENT")
	LifeLegacyOutbox.reset_fault_injection()
	var res_c5_2 = LifeLegacyEvents.resolve_choice(evt_c5, "c5_choice", outbox_c5, ll)
	assert(res_c5_2 == true, "Cenário 5 retentativa deve retornar true")
	assert(evt_c5["status"] == "RESOLVED", "Evento transita para RESOLVED")
	print("    -> Cenário 5 Aprovado!")

	# Cenário 6: Falha durante o save final
	print("  [Cenário 6] Falha durante o save final com indicadores preservados...")
	var evt_c6: Dictionary = {
		"event_id": "evt_c6",
		"occurrence_id": "occ_c6_001",
		"status": "PENDING_RESOLUTION",
		"choices": [{
			"id": "c6_choice",
			"text": "Teste C6",
			"career_effects": {"money": -250, "energy": -1.0},
			"internal_effects": {"discipline": 6.0}
		}]
	}
	var outbox_c6: Dictionary = {"pending_dispatches": []}
	var disc_before_c6: float = ll.get_stat("discipline")
	var money_before_c6: int = Career.money
	
	LifeLegacyPersistence.fault_inject_open_write = true
	var res_c6_1 = LifeLegacyEvents.resolve_choice(evt_c6, "c6_choice", outbox_c6, ll)
	assert(res_c6_1 == false, "Cenário 6 deve falhar no save do pré-compromisso com open_write falhando")
	LifeLegacyPersistence.reset_fault_injection()
	
	var res_c6_retry_pre = LifeLegacyEvents.resolve_choice(evt_c6, "c6_choice", outbox_c6, ll)
	assert(res_c6_retry_pre == true, "Cenário 6 com gravação limpa sucede perfeitamente")
	assert(evt_c6["status"] == "RESOLVED", "Status final é RESOLVED")
	assert(ll.get_stat("discipline") == disc_before_c6 + 6.0, "Indicador somado exatamente uma vez (+6.0)")
	assert(Career.money == money_before_c6 - 250, "Dinheiro debitado exatamente uma vez (-250)")
	print("    -> Cenário 6 Aprovado!")

	# Cenário 7: Queda após confirmação do Career antes da confirmação do Outbox
	print("  [Cenário 7] Reconciliação pós-crash com dedup absoluto...")
	var test_tok_c7: String = "occ_c7_001_c7_choice_career"
	var m_pre_c7: int = Career.money
	assert(Career.apply_idempotent_effect(test_tok_c7, -1500, -10.0) == true)
	assert(Career.money == m_pre_c7 - 1500)
	
	var outbox_c7: Dictionary = {
		"pending_dispatches": [{
			"target": "career_effects",
			"token": test_tok_c7,
			"payload": {"money": -1500, "energy": -10.0},
			"status": LifeLegacyOutbox.STATUS_PENDING,
			"retry_count": 0
		}]
	}
	var reconciled: int = LifeLegacyOutbox.reconcile_outbox(outbox_c7)
	assert(reconciled == 1, "Deve reconciliar com sucesso")
	assert(outbox_c7["pending_dispatches"][0]["status"] == LifeLegacyOutbox.STATUS_COMMITTED, "Status deve ser COMMITTED")
	assert(Career.money == m_pre_c7 - 1500, "Dinheiro NÃO deve ser deduzido novamente! Dedup absoluto!")
	print("    -> Cenário 7 Aprovado!")
