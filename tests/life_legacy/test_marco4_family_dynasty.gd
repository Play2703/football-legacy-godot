extends Node

const LifeLegacyManager = preload("res://autoload/life_legacy_manager.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")
const LifeLegacyDynasty = preload("res://features/life_legacy/life_legacy_dynasty.gd")
const SalonFama = preload("res://features/career/salon_fama.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _ready() -> void:
	print("--- TEST MARCO 4: INÍCIO ---")
	
	# Prepara slot 0 limpo sincronizado em (1, 10)
	GameState.season_num = 1
	GameState.season_day = 10
	Career.processed_dynasty_txs = []
	Career.player_name = "Pai Teste"
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 10))
	LifeLegacy.set_safe_mode(false)
	LifeLegacy.reload_slot(0)
	
	test_canonical_age_and_phases()
	test_family_lifecycle()
	test_salon_fama_colgar_dinastia_idempotency()
	test_career_instantiate_dynasty_heir()
	test_full_dynasty_saga_and_crash_recovery()
	print("--- TEST MARCO 4: TODOS OS TESTES PASSARAM COM SUCESSO! ---")
	get_tree().quit(0)

func test_canonical_age_and_phases() -> void:
	print("[TEST] 1. Fórmula Canônica de Idade e Fases de Desenvolvimento...")
	
	# Caso A: Mesmo ano, dia anterior ao nascimento -> 0 anos
	assert(LifeLegacyFamily.compute_canonical_age(1, 15, 1, 10) == 0, "Idade deve ser 0")
	# Caso B: 1 ano depois, mas antes do aniversário no calendário -> 0 anos
	assert(LifeLegacyFamily.compute_canonical_age(1, 15, 2, 10) == 0, "Idade deve ser 0 antes do dia do aniversário")
	# Caso C: 1 ano depois, exatamente no dia do aniversário -> 1 ano
	assert(LifeLegacyFamily.compute_canonical_age(1, 15, 2, 15) == 1, "Idade deve ser 1 no dia do aniversário")
	# Caso D: 17 temporadas depois, dia 15 -> 16 anos completos
	assert(LifeLegacyFamily.compute_canonical_age(1, 15, 17, 15) == 16, "Idade deve ser 16")
	
	# Fases de Desenvolvimento
	assert(LifeLegacyFamily.get_development_phase(4) == LifeLegacyFamily.PHASE_INFANT, "4 anos deve ser infant")
	assert(LifeLegacyFamily.get_development_phase(8) == LifeLegacyFamily.PHASE_CHILD, "8 anos deve ser child")
	assert(LifeLegacyFamily.get_development_phase(14) == LifeLegacyFamily.PHASE_TEEN, "14 anos deve ser teen")
	assert(LifeLegacyFamily.get_development_phase(16) == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "16 anos deve ser eligible_heir")
	assert(LifeLegacyFamily.get_development_phase(19) == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "19 anos deve ser eligible_heir")
	
	print("  -> OK!")

func test_family_lifecycle() -> void:
	print("[TEST] 2. Ciclo de Vida Familiar (Casamento, Divórcio, Nascimento e Elegibilidade)...")
	var ll = LifeLegacy
	
	# Casamento
	var ok_m: bool = ll.marry({ "name": "Elena", "job": "Arquiteta", "affinity": 70.0 })
	assert(ok_m == true, "Casamento deve ser realizado")
	assert(ll.get_family()["spouse"]["name"] == "Elena", "Cônjuge deve ser Elena")
	
	# Não permite segundo casamento
	var ok_m2: bool = ll.marry({ "name": "Outra" })
	assert(ok_m2 == false, "Não deve permitir bígamos")
	
	# Registro de filhos
	GameState.season_num = 2
	GameState.season_day = 5
	var ch1: Dictionary = ll.register_child("Lucas", "M")
	assert(ch1["name"] == "Lucas", "Nome do filho deve ser Lucas")
	assert(ch1["birth_season_num"] == 2 and ch1["birth_season_day"] == 5, "Data de nascimento deve ser (2, 5)")
	
	# Lista elegíveis quando criança (ainda não elegível)
	GameState.season_num = 10
	GameState.season_day = 5
	var eligible_early: Array[Dictionary] = ll.get_eligible_heirs()
	assert(eligible_early.is_empty() == true, "Criança de 8 anos não pode ser herdeira")
	
	# Lista elegíveis aos 16 anos (Season 18, Day 5)
	GameState.season_num = 18
	GameState.season_day = 5
	var eligible_ready: Array[Dictionary] = ll.get_eligible_heirs()
	assert(eligible_ready.size() == 1, "Lucas deve estar elegível aos 16 anos")
	assert(eligible_ready[0]["canonical_age"] == 16, "Idade canônica deve ser 16")
	assert(eligible_ready[0]["phase"] == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "Fase deve ser eligible_heir")
	
	# Divórcio
	var ok_d: bool = ll.divorce()
	assert(ok_d == true, "Divórcio deve ser realizado")
	assert(ll.get_family()["spouse"].is_empty() == true, "Cônjuge deve estar vazio")
	
	print("  -> OK!")

func test_salon_fama_colgar_dinastia_idempotency() -> void:
	print("[TEST] 3. SalonFama.colgar_dinastia e Idempotência por tx_id...")
	var slot: int = 0
	var tx_id: String = "tx_test_dynasty_plaque_999"
	
	# Primeira gravação
	var plaque_id_1: String = SalonFama.colgar_dinastia(slot, tx_id)
	assert(plaque_id_1.is_empty() == false, "Deve criar placa no SalonFama")
	
	# Segunda chamada com o MESMO tx_id
	var plaque_id_2: String = SalonFama.colgar_dinastia(slot, tx_id)
	assert(plaque_id_2 == plaque_id_1, "Chamada repetida com o mesmo tx_id deve retornar o mesmo plaque_id sem duplicar!")
	
	# Valida conteúdo da placa
	var placa_data: Dictionary = SaveSlots.read_json_dict(SalonFama.carpeta_de(plaque_id_1) + SalonFama.PLACA)
	assert(placa_data.get("dynasty_tx_id", "") == tx_id, "Placa deve conter o dynasty_tx_id")
	
	print("  -> OK!")

func test_career_instantiate_dynasty_heir() -> void:
	print("[TEST] 4. Career.instantiate_dynasty_heir com Idempotência por tx_id...")
	var heir_data: Dictionary = {
		"name": "Lucas Silva",
		"surname": "Silva",
		"nationality": "BRA",
		"canonical_age": 16,
		"position": "MC",
		"initial_ovr": 62,
		"initial_agent_level": 1
	}
	var test_tx_id: String = "dyn_tx_heir_test_001"
	
	var ok: bool = Career.instantiate_dynasty_heir(heir_data, 15000, "rma", test_tx_id)
	assert(ok == true, "instantiate_dynasty_heir deve retornar true")
	assert(Career.processed_dynasty_txs.has(test_tx_id), "tx_id deve ser registrado em processed_dynasty_txs")
	
	# Validações dos campos do herdeiro
	assert(Career.player_name == "Lucas Silva", "Nome deve ser Lucas Silva")
	assert(Career.shirt_name == "Silva", "Camisa deve ser Silva")
	assert(Career.nationality == "BRA", "Nacionalidade deve ser BRA")
	assert(Career.age == 16, "Idade deve ser 16")
	assert(Career.start_club == "rma", "Clube de início deve ser rma")
	assert(Career.poss == ["MC"], "Posição deve ser MC")
	assert(Career.money == 15000, "Dinheiro herdado deve ser 15000")
	assert(Career.level == 1 and Career.xp == 0, "Level deve ser 1 e xp 0")
	assert(Career.energy == 100.0, "Energia deve ser 100")
	assert(Career.season_goals == 0, "Gols devem ser zerados")
	assert(Career.pareja.is_empty() == true, "Vida amorosa do pai não deve ser herdada")
	assert(Career.processed_career_tokens.is_empty() == true, "Tokens de carreira anteriores devem ser limpos")
	
	# Teste de idempotência com o mesmo tx_id: altera dinheiro manualmente para verificar que não reinicializa
	Career.money = 99999
	var ok_repeat: bool = Career.instantiate_dynasty_heir(heir_data, 15000, "rma", test_tx_id)
	assert(ok_repeat == true, "Chamada repetida com mesmo tx_id deve retornar true")
	assert(Career.money == 99999, "Estado do jogador não deve ser sobrescrito em chamada idempotente repetida")
	
	print("  -> OK!")

func test_full_dynasty_saga_and_crash_recovery() -> void:
	print("[TEST] 5. Saga Transacional Dinástica Completa e Crash Recovery em Todas as Etapas...")
	var ll = LifeLegacy
	
	# Prepara estado com filho elegível aos 16 anos
	GameState.season_num = 18
	GameState.season_day = 10
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(18, 10))
	ll.set_safe_mode(false)
	ll.reload_slot(0)
	
	var ch: Dictionary = {
		"id": "child_gabriel",
		"name": "Gabriel Legado",
		"surname": "Legado",
		"nationality": "ESP",
		"canonical_age": 16,
		"position": "EI",
		"initial_ovr": 64
	}
	
	Career.money = 50000
	Career.player_name = "Pai Lendário"
	
	# 5.1 Execução completa padrão
	var ok_succ: bool = ll.start_succession(ch, 40.0, "bar")
	assert(ok_succ == true, "Sucessão dinástica deve ser concluída com sucesso")
	
	# Verifica novo estado do atleta
	assert(Career.player_name == "Gabriel Legado", "Novo jogador deve ser Gabriel Legado")
	assert(Career.money == 20000, "Herança de 40% de 50.000 deve ser 20.000")
	assert(Career.start_club == "bar", "Clube de início deve ser bar")
	
	# Verifica árvore genealógica
	var dyn: Dictionary = ll.get_dynasty()
	assert(dyn["current_generation"] == 2, "Geração atual deve ser 2")
	var ancestors: Array = dyn.get("ancestors", [])
	assert(ancestors.size() == 1, "Deve haver 1 ancestral")
	assert(ancestors[0]["name"] == "Pai Lendário", "Nome do ancestral deve ser Pai Lendário")
	var initial_plaque: String = ancestors[0]["plaque_id"]
	assert(initial_plaque.is_empty() == false, "Placa no museu deve estar vinculada")
	
	# Verifica que diário terminou em COMPLETED
	var journal: Dictionary = dyn.get("transition_journal", {})
	assert(journal.get("stage", "") == LifeLegacyDynasty.STAGE_COMPLETED, "Diário deve estar em STAGE_COMPLETED")
	assert(journal.get("completed", false) == true, "Flag completed deve ser true")
	
	# 5.2 Simulação de Crash após STAGE_FATHER_ARCHIVED (pai arquivado, herdeiro pendente)
	var crash_tx: String = "dyn_tx_crash_sim_archived"
	var simulated_journal: Dictionary = {
		"tx_id": crash_tx,
		"stage": LifeLegacyDynasty.STAGE_FATHER_ARCHIVED,
		"father_archived": true,
		"plaque_id": initial_plaque,
		"heir_child": ch,
		"inheritance_percent": 50.0,
		"start_club": "rma",
		"father_name": "Pai Lendário",
		"heir_instantiated": false,
		"patrimony_transferred": false,
		"dynasty_updated": false,
		"completed": false
	}
	ll.get_data()["dynasty"]["transition_journal"] = simulated_journal
	ll.save_current_slot()
	
	# Retoma sucessão interrompida
	Career.money = 100000
	var ok_rec1: bool = LifeLegacyDynasty.recover_or_resume_succession(ll)
	assert(ok_rec1 == true, "Recuperação a partir de FATHER_ARCHIVED deve ter sucesso")
	assert(Career.money == 50000, "Herança de 50% de 100.000 deve transferir 50.000")
	assert(ll.get_dynasty()["transition_journal"]["stage"] == LifeLegacyDynasty.STAGE_COMPLETED, "Diário deve finalizar em COMPLETED")
	assert(ll.get_dynasty()["transition_journal"]["completed"] == true, "Flag completed deve ser true")
	
	# 5.3 Simulação de Crash após STAGE_HEIR_PROFILE_READY (herdeiro já instanciado, dinastia não atualizada)
	var crash_tx2: String = "dyn_tx_crash_sim_heir_ready"
	var simulated_journal2: Dictionary = {
		"tx_id": crash_tx2,
		"stage": LifeLegacyDynasty.STAGE_HEIR_PROFILE_READY,
		"father_archived": true,
		"plaque_id": initial_plaque,
		"heir_child": ch,
		"inheritance_percent": 50.0,
		"start_club": "rma",
		"father_name": "Pai Lendário",
		"heir_instantiated": true,
		"patrimony_transferred": true,
		"dynasty_updated": false,
		"completed": false
	}
	ll.get_data()["dynasty"]["transition_journal"] = simulated_journal2
	ll.save_current_slot()
	
	Career.money = 77777 # Se repetisse transferência, mudaria esse valor
	var ok_rec2: bool = LifeLegacyDynasty.recover_or_resume_succession(ll)
	assert(ok_rec2 == true, "Recuperação a partir de HEIR_PROFILE_READY deve ter sucesso")
	assert(Career.money == 77777, "Dinheiro não deve ser recalculado se patrimony_transferred for true")
	assert(ll.get_dynasty()["transition_journal"]["completed"] == true, "Flag completed deve ser true")
	
	# 5.4 Chamada idempotente adicional quando já completado
	var ok_rec3: bool = LifeLegacyDynasty.recover_or_resume_succession(ll)
	assert(ok_rec3 == true, "Recuperação quando já concluído deve ser no-op e retornar true")
	
	print("  -> OK!")
