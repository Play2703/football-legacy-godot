extends Node

const LifeLegacyManager = preload("res://autoload/life_legacy_manager.gd")
const LifeLegacyEffects = preload("res://features/life_legacy/life_legacy_effects.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _ready() -> void:
	print("--- TEST MARCO 2: INÍCIO ---")
	test_lexicographical_time_comparison()
	test_career_epoch_and_synchronous_barrier()
	
	# Prepara slot 0 limpo sincronizado em (1, 10)
	GameState.season_num = 1
	GameState.season_day = 10
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 10))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(0)
	
	test_ignore_non_advancing_career_updated()
	test_single_and_multi_week_advance()
	test_fast_forward_circuit_breaker()
	test_temporal_regression_protection()
	test_temporal_advance_io_failure_resilience()
	print("--- TEST MARCO 2: TODOS OS TESTES PASSARAM COM SUCESSO! ---")
	get_tree().quit(0)

func test_lexicographical_time_comparison() -> void:
	print("[TEST] 1. Comparação Lexicográfica Temporal...")
	var ll = LifeLegacy
	assert(ll != null, "LifeLegacy autoload deve existir")
	
	# EQUAL
	assert(ll.evaluate_time_relation(1, 5, 1, 5) == LifeLegacyManager.TimeRelation.EQUAL, "1,5 == 1,5 deve ser EQUAL")
	# FORWARD_TICK
	assert(ll.evaluate_time_relation(1, 6, 1, 5) == LifeLegacyManager.TimeRelation.FORWARD_TICK, "1,6 > 1,5 deve ser FORWARD_TICK")
	# SEASON_ROLLOVER
	assert(ll.evaluate_time_relation(2, 0, 1, 38) == LifeLegacyManager.TimeRelation.SEASON_ROLLOVER, "2,0 > 1,38 deve ser SEASON_ROLLOVER")
	# TEMPORAL_REGRESSION (mesma temporada, dia menor)
	assert(ll.evaluate_time_relation(1, 4, 1, 5) == LifeLegacyManager.TimeRelation.TEMPORAL_REGRESSION, "1,4 < 1,5 deve ser TEMPORAL_REGRESSION")
	# TEMPORAL_REGRESSION (temporada menor)
	assert(ll.evaluate_time_relation(1, 10, 2, 1) == LifeLegacyManager.TimeRelation.TEMPORAL_REGRESSION, "1,10 < 2,1 deve ser TEMPORAL_REGRESSION")
	print("  -> OK!")

func test_career_epoch_and_synchronous_barrier() -> void:
	print("[TEST] 2. Save Epoch e Barreira Síncrona do Career...")
	assert(Career != null, "Career autoload deve existir")
	
	var initial_epoch: int = Career.get("_save_epoch")
	assert(initial_epoch >= 0, "_save_epoch deve ser um inteiro não-negativo")
	
	# Simula agendamento deferred
	Career.set("_save_pending", true)
	var scheduled_epoch: int = initial_epoch
	
	# Executa barreira síncrona
	var ok: bool = Career._save_synchronous_barrier()
	assert(ok == true, "Barreira síncrona deve retornar true")
	
	var new_epoch: int = Career.get("_save_epoch")
	assert(new_epoch == initial_epoch + 1, "_save_epoch deve ser incrementado na barreira")
	
	# Tenta chamar _save_flush com o epoch antigo (deve ser ignorado sem erro)
	Career._save_flush(scheduled_epoch)
	assert(Career.get("_save_epoch") == new_epoch, "Epoch não deve mudar e flush obsoleto deve ser ignorado")
	print("  -> OK!")

func test_ignore_non_advancing_career_updated() -> void:
	print("[TEST] 3. Descarte de Emissões sem Avanço Temporal (set_customization)...")
	var ll = LifeLegacy
	
	var proc_before: Dictionary = ll.get_last_processed_time()
	var stats_before: Dictionary = ll.get_all_stats()
	
	# Dispara career_updated mantendo season_num e season_day idênticos
	GameState.career_updated.emit()
	
	var proc_after: Dictionary = ll.get_last_processed_time()
	var stats_after: Dictionary = ll.get_all_stats()
	
	assert(proc_before["season_num"] == proc_after["season_num"], "season_num não deve mudar")
	assert(proc_before["season_day"] == proc_after["season_day"], "season_day não deve mudar")
	assert(stats_before == stats_after, "Indicadores não devem sofrer drift sem avanço do calendário")
	print("  -> OK!")

func test_single_and_multi_week_advance() -> void:
	print("[TEST] 4. Avanço Semanal e Multi-Semanal...")
	var ll = LifeLegacy
	
	# Teste 4.1: Avanço de 1 semana (10 -> 11)
	GameState.season_day = 11
	GameState.career_updated.emit()
	
	var proc: Dictionary = ll.get_last_processed_time()
	assert(proc["season_day"] == 11, "last_processed_time deve ser 11 após avanço de 1 semana")
	
	# Teste 4.2: Avanço de multi-semana (11 -> 14)
	GameState.season_day = 14
	GameState.career_updated.emit()
	
	proc = ll.get_last_processed_time()
	assert(proc["season_day"] == 14, "last_processed_time deve ser 14 após avanço multi-semanal")
	print("  -> OK!")

func test_fast_forward_circuit_breaker() -> void:
	print("[TEST] 5. Circuit Breaker para Lacunas > 2 Temporadas...")
	var ll = LifeLegacy
	
	# Salto de mais de 2 temporadas a partir de (1, 14) para (4, 2)
	GameState.season_num = 4
	GameState.season_day = 2
	GameState.career_updated.emit()
	
	var proc: Dictionary = ll.get_last_processed_time()
	assert(proc["season_num"] == 4 and proc["season_day"] == 2, "last_processed_time deve alinhar em (4, 2)")
	
	var data: Dictionary = ll.get_data()
	var gap_log: Array = data.get("recovery_gap_log", [])
	assert(gap_log.size() > 0, "recovery_gap_log deve registrar a ativação do circuit breaker")
	assert(gap_log[-1]["gap_type"] == "FAST_FORWARD_CIRCUIT_BREAKER", "Tipo do log deve ser FAST_FORWARD_CIRCUIT_BREAKER")
	print("  -> OK!")

func test_temporal_regression_protection() -> void:
	print("[TEST] 6. Proteção contra Regressão Temporal (Backup/Incompatibilidade)...")
	var ll = LifeLegacy
	# Estado atual em (4, 2)
	assert(ll.is_safe_mode() == false, "Modo seguro não deve estar ativo antes do teste")
	
	# Tenta forçar GameState anterior (1, 1)
	GameState.season_num = 1
	GameState.season_day = 1
	GameState.career_updated.emit()
	
	assert(ll.is_safe_mode() == true, "Modo seguro DEVE ser ativado em retrocesso temporal!")
	# Restaura modo seguro para próximos passos
	ll.set_safe_mode(false)
	print("  -> OK!")

func test_temporal_advance_io_failure_resilience() -> void:
	print("[TEST] 7. Resiliência a Falha de I/O no Avanço Temporal (Transacional)...")
	var ll = LifeLegacy
	
	# Prepara estado limpo sincronizado em (1, 10)
	GameState.season_num = 1
	GameState.season_day = 10
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 10))
	ll.set_safe_mode(false)
	ll.reload_slot(0)
	
	var initial_time = ll.get_last_processed_time()
	assert(initial_time["season_num"] == 1 and initial_time["season_day"] == 10, "Base em (1, 10)")
	
	# Testa _commit_temporal_candidate com candidato que falha validação de schema (simulando falha de I/O)
	var corrupt_candidate = {"invalid_schema": true}
	var commit_res = ll._commit_temporal_candidate(corrupt_candidate, 1, 11, [], {}, [])
	assert(commit_res == false, "Commit deve falhar se gravação retornar false")
	
	# Verifica que o marcador temporal em memória NÃO avançou
	var time_after_fail = ll.get_last_processed_time()
	assert(time_after_fail["season_num"] == 1 and time_after_fail["season_day"] == 10,
		"last_processed_time deve permanecer em (1, 10) após falha de I/O")
	
	# Agora executa avanço legítimo que persiste com sucesso
	GameState.season_day = 11
	GameState.career_updated.emit()
	var time_after_ok = ll.get_last_processed_time()
	assert(time_after_ok["season_day"] == 11, "Avanço legítimo deve persistir e atualizar memória para (1, 11)")
	print("  -> OK!")

