extends Node

const LifeLegacyManager = preload("res://autoload/life_legacy_manager.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

var test_slot: int = 0
var base_dir: String = LifeLegacyPersistence.slot_dir(test_slot).trim_suffix("/")

func _ready() -> void:
	print("--- TEST MARCO 9 ETAPA 1 CORREÇÕES: INÍCIO ---")
	
	test_strict_schema_v5_validation()
	test_child_id_uniqueness_and_rejection()
	test_individual_migrations_v1_to_v5()
	test_persistence_recovery_sources()
	test_durability_and_transactional_rollback()
	test_single_source_of_truth_and_pareja_projection()
	test_canonical_age_and_phase_boundaries()
	test_deep_copy_protection()
	test_career_official_relationship_flow_integration()
	
	print("--- TEST MARCO 9 ETAPA 1 CORREÇÕES: TODOS OS TESTES PASSARAM COM SUCESSO! ---")
	get_tree().quit(0)

func _cleanup_test_dir() -> void:
	var dir = DirAccess.open(base_dir)
	if dir != null:
		var files = dir.get_files()
		for f in files:
			dir.remove(f)

# =============================================================================
# 1. VALIDAÇÃO ESTREITA DO SCHEMA V5
# =============================================================================
func test_strict_schema_v5_validation() -> void:
	print("[TEST] 1. Validação estrita do Schema V5 (id não vazio e único, afinidade [0, 100] obrigatória, trilha)...")
	
	var base_profile = LifeLegacyState.get_default_profile(1, 0)
	assert(LifeLegacyState.validate_schema(base_profile) == true, "Perfil base V5 deve ser válido")
	
	# Caso A: Filho válido
	var ch_valid: Dictionary = {
		"id": "child_arthur_1",
		"name": "Arthur",
		"gender": "M",
		"birth_season_num": 1,
		"birth_season_day": 0,
		"formation_path": "basic",
		"affinity": 50.0
	}
	base_profile["family"]["children"] = [ch_valid]
	assert(LifeLegacyState.validate_schema(base_profile) == true, "Perfil com filho válido deve passar")
	
	# Caso B: ID ausente ou vazio
	var ch_no_id = ch_valid.duplicate()
	ch_no_id["id"] = ""
	base_profile["family"]["children"] = [ch_no_id]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Filho com ID vazio deve falhar na validação")
	
	# Caso C: IDs duplicados na mesma lista de filhos
	var ch_dup1 = ch_valid.duplicate()
	var ch_dup2 = ch_valid.duplicate()
	ch_dup2["name"] = "Outro Filho"
	base_profile["family"]["children"] = [ch_dup1, ch_dup2]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Lista com IDs duplicados deve falhar na validação")
	
	# Caso D: Nome ausente ou vazio
	var ch_no_name = ch_valid.duplicate()
	ch_no_name["name"] = "  "
	base_profile["family"]["children"] = [ch_no_name]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Filho com nome vazio deve falhar na validação")
	
	# Caso E: Trilha de formação inválida
	var ch_bad_path = ch_valid.duplicate()
	ch_bad_path["formation_path"] = "astronaut"
	base_profile["family"]["children"] = [ch_bad_path]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Trilha de formação inválida deve falhar")
	
	# Caso F: Afinidade ausente
	var ch_no_aff = ch_valid.duplicate()
	ch_no_aff.erase("affinity")
	base_profile["family"]["children"] = [ch_no_aff]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Afinidade ausente deve falhar na validação")
	
	# Caso G: Afinidade fora do intervalo [0, 100]
	var ch_aff_high = ch_valid.duplicate()
	ch_aff_high["affinity"] = 100.1
	base_profile["family"]["children"] = [ch_aff_high]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Afinidade > 100 deve falhar na validação")
	
	var ch_aff_low = ch_valid.duplicate()
	ch_aff_low["affinity"] = -0.5
	base_profile["family"]["children"] = [ch_aff_low]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Afinidade < 0 deve falhar na validação")
	
	# Caso H: Afinidade não numérica
	var ch_aff_str = ch_valid.duplicate()
	ch_aff_str["affinity"] = "alta"
	base_profile["family"]["children"] = [ch_aff_str]
	assert(LifeLegacyState.validate_schema(base_profile) == false, "Afinidade string deve falhar na validação")
	
	print("  -> OK!")

# =============================================================================
# 2. UNICIDADE DE IDENTIFICADORES E REJEIÇÃO DE CUSTOM_ID DUPLICADO
# =============================================================================
func test_child_id_uniqueness_and_rejection() -> void:
	print("[TEST] 2. Unicidade de identificadores (rejeição de custom_id duplicado e desambiguação legada)...")
	
	var fam: Dictionary = {"children": []}
	
	# 1. Registro com custom_id válido
	var ch1 = LifeLegacyFamily.register_child("Lucas", "M", 1, 5, fam, "id_custom_lucas")
	assert(ch1.is_empty() == false, "Primeiro registro deve ter sucesso")
	assert(ch1["id"] == "id_custom_lucas", "ID deve ser exatamente id_custom_lucas")
	assert(fam["children"].size() == 1, "Deve conter 1 filho")
	
	# 2. Tentativa de registrar outro filho com o MESMO custom_id -> DEVE SER REJEITADA
	var ch_dup = LifeLegacyFamily.register_child("Outro", "M", 1, 5, fam, "id_custom_lucas")
	assert(ch_dup.is_empty() == true, "Registro com custom_id duplicado deve retornar dicionário vazio")
	assert(fam["children"].size() == 1, "Lista de filhos não deve ser alterada após tentativa duplicada")
	
	# 3. Geração determinística quando custom_id é vazio
	var ch2 = LifeLegacyFamily.register_child("Lucas", "M", 1, 5, fam, "")
	assert(ch2["id"] == "child_lucas_s1_d5", "ID determinístico deve ser gerado")
	
	# 4. Colisão de ID determinístico com mesmo nome e data
	var ch3 = LifeLegacyFamily.register_child("Lucas", "M", 1, 5, fam, "")
	assert(ch3["id"] == "child_lucas_s1_d5_2", "Colisão determinística deve receber sufixo _2")
	
	# 5. Normalização de dados legados com colisão de IDs
	var raw_legacy_children: Array = [
		{"id": "same_id", "name": "Filho A", "birth_season_num": 1, "birth_season_day": 0},
		{"id": "same_id", "name": "Filho B", "birth_season_num": 1, "birth_season_day": 0}
	]
	var norm_children: Array = []
	for raw_ch in raw_legacy_children:
		norm_children.append(LifeLegacyFamily.normalize_child(raw_ch, norm_children))
		
	assert(norm_children[0]["id"] == "same_id", "Primeiro filho legado preserva seu ID")
	assert(norm_children[1]["id"] == "same_id_2", "Segundo filho com ID duplicado recebe sufixo desambiguado _2")
	assert(norm_children[0]["id"] != norm_children[1]["id"], "Ambos os IDs normalizados devem ser estritamente distintos")
	
	print("  -> OK!")

# =============================================================================
# 3. MIGRAÇÕES INDIVIDUAIS V1 -> V5, V2 -> V5, V3 -> V5, V4 -> V5
# =============================================================================
func test_individual_migrations_v1_to_v5() -> void:
	print("[TEST] 3. Migrações individuais detalhadas (V1->V5, V2->V5, V3->V5, V4->V5)...")
	
	# 3.1 V1 -> V5
	var v1_data: Dictionary = {
		"schema_version": 1,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": {"season_num": 1, "season_day": 0},
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [{"stat_id": "discipline", "delta": 5.0}],
		"family": {"spouse": {}, "children": []},
		"dynasty": {"current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1},
		"active_event": {},
		"outbox": {"pending_dispatches": []},
		"history": {"occurred_events": ["ev_init"], "event_cooldowns": {}}
	}
	var mig_v1 = LifeLegacyPersistence._migrate(v1_data, 1, 5)
	assert(mig_v1["schema_version"] == 5, "V1 migrado deve ter schema 5")
	assert(LifeLegacyState.validate_schema(mig_v1) == true, "V1 migrado deve ser válido")
	assert(mig_v1["stats_history"].size() == 1, "stats_history deve ser preservado")
	assert(mig_v1["history"]["occurred_events"].has("ev_init"), "Histórico V1 deve ser preservado")
	assert(mig_v1.has("social_reputation"), "V1 deve receber social_reputation")
	assert(mig_v1.has("active_modifiers"), "V1 deve receber active_modifiers")
	
	# 3.2 V2 -> V5
	var v2_data: Dictionary = v1_data.duplicate(true)
	v2_data["schema_version"] = 2
	v2_data["active_modifiers"] = [
		{"id": "mod_treino", "name": "Treino", "duration_ticks_remaining": 4, "applied_ticks": 1, "stat_drift": {}}
	]
	v2_data["story_arcs"] = {"active_arcs": {}, "completed_arcs": []}
	var mig_v2 = LifeLegacyPersistence._migrate(v2_data, 2, 5)
	assert(mig_v2["schema_version"] == 5, "V2 migrado deve ter schema 5")
	assert(LifeLegacyState.validate_schema(mig_v2) == true, "V2 migrado deve ser válido")
	assert(mig_v2["active_modifiers"].size() == 1, "Modificador V2 deve ser preservado")
	assert(mig_v2["active_modifiers"][0]["id"] == "mod_treino", "ID do modificador V2 deve ser mod_treino")
	
	# 3.3 V3 -> V5
	var v3_data: Dictionary = v2_data.duplicate(true)
	v3_data["schema_version"] = 3
	v3_data["total_ticks_processed"] = 42
	v3_data["season_calendar_lengths"] = {"1": 38, "2": 38}
	v3_data["story_arcs"]["active_arcs"]["arc_1"] = {"stage": 2, "last_act_resolved_ticks": 10}
	var mig_v3 = LifeLegacyPersistence._migrate(v3_data, 3, 5)
	assert(mig_v3["schema_version"] == 5, "V3 migrado deve ter schema 5")
	assert(LifeLegacyState.validate_schema(mig_v3) == true, "V3 migrado deve ser válido")
	assert(mig_v3["total_ticks_processed"] == 42, "total_ticks_processed V3 deve ser preservado")
	assert(mig_v3["season_calendar_lengths"]["1"] == 38, "season_calendar_lengths V3 deve ser preservado")
	assert(mig_v3["story_arcs"]["active_arcs"]["arc_1"]["stage"] == 2, "Arco ativo V3 deve ser preservado")
	
	# 3.4 V4 -> V5
	var v4_data: Dictionary = v3_data.duplicate(true)
	v4_data["schema_version"] = 4
	v4_data["social_reputation"] = {
		"scandal_heat": 35.0,
		"press_agent_level": 2,
		"press_agent_ticks_remaining": 6,
		"active_campaigns": [{"id": "camp_1", "ticks_remaining": 2}],
		"cooldowns": {"public_retraction": 3},
		"history": [{"type": "action_retraction"}],
		"last_processed_tick": 42
	}
	v4_data["family"]["children"] = [
		{"name": "Guilherme", "gender": "M", "birth_season_num": 2, "birth_season_day": 10}
	]
	var mig_v4 = LifeLegacyPersistence._migrate(v4_data, 4, 5)
	assert(mig_v4["schema_version"] == 5, "V4 migrado deve ter schema 5")
	assert(LifeLegacyState.validate_schema(mig_v4) == true, "V4 migrado deve ser válido")
	assert(mig_v4["social_reputation"]["scandal_heat"] == 35.0, "Calor social V4 deve ser preservado")
	assert(mig_v4["social_reputation"]["press_agent_level"] == 2, "Nível de assessoria V4 deve ser preservado")
	var gui = mig_v4["family"]["children"][0]
	assert(gui["name"] == "Guilherme", "Nome do filho deve ser preservado")
	assert(gui["formation_path"] == "basic", "Filho V4 sem trilha deve receber basic")
	assert(gui["affinity"] == 50.0, "Filho V4 sem afinidade deve receber 50.0")
	assert(gui["id"].begins_with("child_guilherme_s2_d10"), "Filho V4 sem ID deve receber ID determinístico")
	
	print("  -> OK!")

# =============================================================================
# 4. ORIGENS DE RECUPERAÇÃO DE PERSISTÊNCIA (.main, .tmp, .bak.staging, .bak)
# =============================================================================
func test_persistence_recovery_sources() -> void:
	print("[TEST] 4. Origens de recuperação de persistência (arquivo principal, .tmp, .bak.staging, .bak)...")
	
	var main_path = LifeLegacyPersistence.slot_file_path(test_slot)
	var tmp_path = main_path + LifeLegacyPersistence.TMP_SUFFIX
	var bak_staging_path = main_path + LifeLegacyPersistence.BAK_STAGING_SUFFIX
	var bak_path = main_path + LifeLegacyPersistence.BAK_SUFFIX
	
	var sample_v4_data = {
		"schema_version": 4,
		"catalog_version": 2,
		"rng_version": 1,
		"save_revision": 10,
		"last_processed_time": {"season_num": 1, "season_day": 0},
		"total_ticks_processed": 50,
		"season_calendar_lengths": {},
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"active_modifiers": [],
		"story_arcs": {"active_arcs": {}, "completed_arcs": []},
		"family": {"spouse": {}, "children": [{"name": "Filho Recuperado", "gender": "M", "birth_season_num": 1, "birth_season_day": 0}]},
		"dynasty": {"current_generation": 1, "ancestors": [], "heir_candidates": [], "next_dynasty_tx_seq": 1},
		"active_event": {},
		"outbox": {"pending_dispatches": []},
		"history": {"occurred_events": [], "event_cooldowns": {}},
		"social_reputation": {"scandal_heat": 10.0, "press_agent_level": 0, "press_agent_ticks_remaining": 0, "active_campaigns": [], "cooldowns": {}, "history": [], "last_processed_tick": 50}
	}
	
	# Origem 1: Arquivo principal íntegro (v4 -> v5)
	_cleanup_test_dir()
	DirAccess.make_dir_recursive_absolute(base_dir)
	var f1 = FileAccess.open(main_path, FileAccess.WRITE)
	f1.store_string(JSON.stringify(sample_v4_data, "\t"))
	f1.close()
	var res1 = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res1["status"] == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load do arquivo principal deve suceder")
	assert(res1["data"]["schema_version"] == 5, "Arquivo principal V4 deve migrar para V5")
	assert(res1["data"]["family"]["children"][0]["formation_path"] == "basic", "Filho recuperado deve ter formação basic")
	
	# Origem 2: Arquivo principal ausente/corrompido, recuperação via .tmp
	_cleanup_test_dir()
	var f2 = FileAccess.open(tmp_path, FileAccess.WRITE)
	f2.store_string(JSON.stringify(sample_v4_data, "\t"))
	f2.close()
	var res2 = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res2["status"] == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Load via .tmp deve suceder")
	assert(res2["data"]["schema_version"] == 5, ".tmp V4 deve migrar para V5")
	assert(FileAccess.file_exists(main_path), "Arquivo principal deve ser restaurado a partir do .tmp")
	
	# Origem 3: Arquivo principal e .tmp corrompidos, recuperação via .bak.staging
	_cleanup_test_dir()
	var f_bad = FileAccess.open(main_path, FileAccess.WRITE)
	f_bad.store_string("{corrompido: json incompleto...")
	f_bad.close()
	var f3 = FileAccess.open(bak_staging_path, FileAccess.WRITE)
	f3.store_string(JSON.stringify(sample_v4_data, "\t"))
	f3.close()
	var res3 = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res3["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Load via .bak.staging deve recuperar com OK_RECOVERED_BACKUP")
	assert(res3["is_safe_mode"] == false and res3["is_persisted"] == true, "Recuperação via staging deve ser segura e persistida")
	assert(res3["data"]["schema_version"] == 5, ".bak.staging V4 deve migrar para V5")
	
	# Origem 4: Arquivo principal e staging quebrados, recuperação via .bak definitivo
	_cleanup_test_dir()
	var f_bad2 = FileAccess.open(main_path, FileAccess.WRITE)
	f_bad2.store_string("lixo")
	f_bad2.close()
	var f4 = FileAccess.open(bak_path, FileAccess.WRITE)
	f4.store_string(JSON.stringify(sample_v4_data, "\t"))
	f4.close()
	var res4 = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res4["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Load via .bak definitivo deve recuperar com OK_RECOVERED_BACKUP")
	assert(res4["is_safe_mode"] == false and res4["is_persisted"] == true, "Recuperação via .bak definitivo deve ser segura e persistida")
	assert(res4["data"]["schema_version"] == 5, ".bak V4 deve migrar para V5")
	
	print("  -> OK!")

# =============================================================================
# 5. DURABILIDADE E BARREIRA TRANSACIONAL (ROLLBACK EM FALHA DE GRAVAÇÃO)
# =============================================================================
func test_durability_and_transactional_rollback() -> void:
	print("[TEST] 5. Durabilidade real (gravação, reload e verificação) e barreira transacional de rollback...")
	
	_cleanup_test_dir()
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 0
	ll.set_safe_mode(false)
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	ll.reload_slot(test_slot)
	
	# 1. Registrar filho
	var ch = ll.register_child("Mateo", "M", LifeLegacyFamily.FORMATION_BASIC)
	assert(ch.is_empty() == false, "Registro de Mateo deve ser bem-sucedido")
	var ch_id: String = ch["id"]
	
	# 2. Recarregar slot e confirmar todos os campos
	ll.reload_slot(test_slot)
	var loaded_ch = ll.get_child_by_id(ch_id)
	assert(loaded_ch.is_empty() == false, "Mateo deve existir após reload")
	assert(loaded_ch["name"] == "Mateo", "Nome deve persistir Mateo")
	assert(loaded_ch["formation_path"] == "basic", "Formação deve persistir basic")
	assert(loaded_ch["affinity"] == 50.0, "Afinidade deve persistir 50.0")
	
	# 3. Alterar formação para elite e persistir/recarregar
	var ok_elite = ll.set_child_formation(ch_id, LifeLegacyFamily.FORMATION_ELITE)
	assert(ok_elite == true, "Alteração para elite deve ter sucesso")
	ll.reload_slot(test_slot)
	assert(ll.get_child_by_id(ch_id)["formation_path"] == LifeLegacyFamily.FORMATION_ELITE, "Formação após reload deve ser elite")
	
	# 4. Alterar afinidade (+30.0) e persistir/recarregar
	var ok_aff = ll.update_child_affinity(ch_id, 30.0)
	assert(ok_aff == true, "Ajuste de afinidade deve ter sucesso")
	ll.reload_slot(test_slot)
	assert(ll.get_child_by_id(ch_id)["affinity"] == 80.0, "Afinidade após reload deve ser 80.0")
	
	# 5. BARREIRA TRANSACIONAL: Simular falha de gravação e verificar ausência de estado parcialmente aplicado
	LifeLegacyPersistence.fault_inject_open_write = true
	
	# Tentativa A: alterar formação sob falha de disco
	var fail_path = ll.set_child_formation(ch_id, LifeLegacyFamily.FORMATION_FOOTBALL)
	assert(fail_path == false, "set_child_formation deve falhar quando gravação em disco falhar")
	# Estado em memória NÃO pode ter divergido para football: deve continuar elite!
	assert(ll.get_child_by_id(ch_id)["formation_path"] == LifeLegacyFamily.FORMATION_ELITE, "Em memória deve permanecer elite após rollback!")
	
	# Tentativa B: alterar afinidade sob falha de disco
	var fail_aff = ll.update_child_affinity(ch_id, 15.0)
	assert(fail_aff == false, "update_child_affinity deve falhar quando gravação em disco falhar")
	assert(ll.get_child_by_id(ch_id)["affinity"] == 80.0, "Em memória deve permanecer 80.0 após rollback!")
	
	# Tentativa C: registrar novo filho sob falha de disco
	var fail_child = ll.register_child("Rejeitado", "M")
	assert(fail_child.is_empty() == true, "register_child deve falhar quando gravação em disco falhar")
	assert(ll.get_family()["children"].size() == 1, "Não deve adicionar filho em memória sob falha de persistência")
	
	# Limpar injeção de falha
	LifeLegacyPersistence.fault_inject_open_write = false
	
	# Recarregar do disco para comprovar integridade idêntica entre memória e disco
	ll.reload_slot(test_slot)
	assert(ll.get_child_by_id(ch_id)["formation_path"] == LifeLegacyFamily.FORMATION_ELITE, "Disco mantém elite")
	assert(ll.get_child_by_id(ch_id)["affinity"] == 80.0, "Disco mantém 80.0")
	assert(ll.get_family()["children"].size() == 1, "Disco mantém apenas 1 filho")
	
	print("  -> OK!")

# =============================================================================
# 6. TESTES DA FONTE ÚNICA DE VERDADE E PROJEÇÃO DA PARCEIRA
# =============================================================================
func test_single_source_of_truth_and_pareja_projection() -> void:
	print("[TEST] 6. Fonte única de verdade da parceira e todos os cenários de projeção/encerramento...")
	
	_cleanup_test_dir()
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 0
	ll.set_safe_mode(false)
	
	# Cenário A: Career sem parceira e family.spouse legado preenchido no save -> PROJEÇÃO DEVE SER spouse = {}
	var legacy_profile = LifeLegacyState.get_default_profile(1, 0)
	legacy_profile["family"]["spouse"] = {"name": "Esposa Legada Antiga", "affinity": 99.0}
	LifeLegacyPersistence.save_slot_data(test_slot, legacy_profile)
	ll.reload_slot(test_slot)
	
	Career.pareja = {}
	Career.rel["pareja"] = 0
	assert(Career.pareja_activa() == false, "Career deve estar sem parceira")
	
	var fam_a = ll.get_family()
	assert(fam_a["spouse"].is_empty() == true, "Cenário A: Career sem parceira deve projetar spouse = {}, ignorando dados legados do save")
	
	# Cenário B: Career com parceira ativa em estado 'pareja'
	Career.pareja = {
		"id": "novia_beatriz",
		"nombre": "Beatriz Mendes",
		"estado": "pareja",
		"desde": 1
	}
	Career.rel["pareja"] = 85
	assert(Career.pareja_activa() == true, "Career deve estar com parceira ativa")
	
	var fam_b = ll.get_family()
	assert(fam_b["spouse"].is_empty() == false, "Cenário B: Deve projetar parceira ativa")
	assert(fam_b["spouse"]["name"] == "Beatriz Mendes", "Nome deve ser Beatriz Mendes")
	assert(fam_b["spouse"]["state"] == "pareja", "Estado deve ser pareja")
	assert(fam_b["spouse"]["married"] == false, "married deve ser false quando estado='pareja'")
	assert(fam_b["spouse"]["affinity"] == 85.0, "Afinidade deve ser 85.0")
	
	# Cenário C: Career em estado casado
	Career.pareja["estado"] = "casado"
	var fam_c = ll.get_family()
	assert(fam_c["spouse"]["married"] == true, "Cenário C: married deve ser true quando estado='casado'")
	
	# Cenário D: Tentativa de criar registro local concorrente quando Career tem parceira ativa -> DEVE SER REJEITADA
	var ok_concurrent = ll.marry({"name": "Amante Concorrente", "affinity": 70.0})
	assert(ok_concurrent == false, "Cenário D: Não deve permitir casamento/registro concorrente quando Career tem parceira ativa")
	assert(ll.get_family()["spouse"]["name"] == "Beatriz Mendes", "Parceira original deve ser preservada")
	
	# Cenário E: Encerramento do relacionamento diretamente pelo Career (romper_relacion)
	Career.romper_relacion()
	assert(Career.pareja_activa() == false, "Career não deve mais ter parceira ativa após romper_relacion()")
	var fam_e = ll.get_family()
	assert(fam_e["spouse"].is_empty() == true, "Cenário E: Após término no Career, LifeLegacy deve projetar spouse = {}")
	
	# Cenário F: Re-casamento via API do LifeLegacy (sincroniza com Career) e divórcio via LifeLegacy.divorce()
	var ok_m = ll.marry({"name": "Juliana Lima", "affinity": 90.0})
	assert(ok_m == true, "Casamento quando solteiro deve ter sucesso")
	assert(Career.pareja_activa() == true, "Career deve refletir parceira sincronizada")
	assert(ll.get_family()["spouse"]["name"] == "Juliana Lima", "Nome projetado deve ser Juliana Lima")
	
	var ok_div = ll.divorce()
	assert(ok_div == true, "Divórcio via LifeLegacy deve ter sucesso")
	assert(Career.pareja_activa() == false, "Career não deve ter parceira após divórcio")
	assert(ll.get_family()["spouse"].is_empty() == true, "LifeLegacy spouse deve estar vazio após divórcio")
	
	# Cenário G: Consulta posterior ao encerramento sem ressurgimento
	ll.reload_slot(test_slot)
	var fam_g = ll.get_family()
	assert(fam_g["spouse"].is_empty() == true, "Cenário G: Consulta posterior após reload nunca deve ressurgir relacionamento")
	
	print("  -> OK!")

# =============================================================================
# 7. IDADE CANÔNICA E TRANSIÇÃO EXATA DE FASES
# =============================================================================
func test_canonical_age_and_phase_boundaries() -> void:
	print("[TEST] 7. Idade canônica e limites exatos de fases de desenvolvimento...")
	
	# (cur_s - birth_s) - (1 se cur_d < birth_d senão 0)
	assert(LifeLegacyFamily.compute_canonical_age(1, 10, 1, 9) == 0, "Antes do nascimento deve ser 0")
	assert(LifeLegacyFamily.compute_canonical_age(1, 10, 1, 10) == 0, "No dia do nascimento é 0")
	assert(LifeLegacyFamily.compute_canonical_age(1, 10, 2, 9) == 0, "1 temporada depois antes do dia é 0")
	assert(LifeLegacyFamily.compute_canonical_age(1, 10, 2, 10) == 1, "1 temporada depois no dia é 1")
	assert(LifeLegacyFamily.compute_canonical_age(1, 10, 17, 10) == 16, "16 anos completos no dia")
	
	assert(LifeLegacyFamily.get_development_phase(0) == LifeLegacyFamily.PHASE_INFANT, "0 anos é infant")
	assert(LifeLegacyFamily.get_development_phase(5) == LifeLegacyFamily.PHASE_INFANT, "5 anos é infant")
	assert(LifeLegacyFamily.get_development_phase(6) == LifeLegacyFamily.PHASE_CHILD, "6 anos é child")
	assert(LifeLegacyFamily.get_development_phase(11) == LifeLegacyFamily.PHASE_CHILD, "11 anos é child")
	assert(LifeLegacyFamily.get_development_phase(12) == LifeLegacyFamily.PHASE_TEEN, "12 anos é teen")
	assert(LifeLegacyFamily.get_development_phase(15) == LifeLegacyFamily.PHASE_TEEN, "15 anos é teen")
	assert(LifeLegacyFamily.get_development_phase(16) == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "16 anos é eligible_heir")
	
	print("  -> OK!")

# =============================================================================
# 8. PROTEÇÃO DE CÓPIA PROFUNDA (DEEP COPY)
# =============================================================================
func test_deep_copy_protection() -> void:
	print("[TEST] 8. Proteção de cópia profunda contra mutação externa...")
	
	var ll = LifeLegacy
	_cleanup_test_dir()
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	ll.reload_slot(test_slot)
	
	var ch = ll.register_child("Vinicius", "M", LifeLegacyFamily.FORMATION_BASIC)
	var ch_id = ch["id"]
	
	# Mutação externa no retorno de get_family()
	var fam = ll.get_family()
	fam["children"].clear()
	fam["spouse"] = {"corrupt": true}
	
	var fam_check = ll.get_family()
	assert(fam_check["children"].size() == 1, "Mutação externa não deve alterar lista de filhos")
	assert(fam_check["spouse"].has("corrupt") == false, "Mutação externa não deve alterar cônjuge")
	
	# Mutação externa no retorno de get_child_by_id()
	var child_copy = ll.get_child_by_id(ch_id)
	child_copy["formation_path"] = "hacked"
	child_copy["affinity"] = -999.0
	
	var child_check = ll.get_child_by_id(ch_id)
	assert(child_check["formation_path"] == "basic", "Trilha original mantida")
	assert(child_check["affinity"] == 50.0, "Afinidade original mantida")
	
	print("  -> OK!")

# =============================================================================
# 9. INTEGRAÇÃO DEFINITIVA COM O FLUXO OFICIAL DO CAREER (11 CENÁRIOS)
# =============================================================================
func test_career_official_relationship_flow_integration() -> void:
	print("[TEST] 9. Integração Definitiva com o Fluxo Oficial de Relacionamentos do Career (11 cenários)...")
	var ll = LifeLegacy
	_cleanup_test_dir()
	LifeLegacyPersistence.save_slot_data(test_slot, LifeLegacyState.get_default_profile(1, 0))
	ll.set_safe_mode(false)
	ll.reload_slot(test_slot)
	
	# Cenário 1: Casamento via fluxo oficial de Career (iniciando do zero quando solteiro)
	print("  -> Cenário 1: Casamento via fluxo oficial de Career...")
	Career.pareja = {}
	Career.rel["pareja"] = 0
	Career.money = 150000
	Career.contract = {"wage": 10000}
	var ok_m1 = ll.marry({"candidate_id": "casera", "name": "Valentina"})
	assert(ok_m1 == true, "Casamento com candidate_id válido deve ter sucesso")
	assert(Career.pareja_activa() == true, "Career deve ter parceira ativa")
	assert(Career.pareja_casada() == true, "Career deve estar no estado casado")
	assert(Career.pareja.get("estado", "") == "casado", "Estado deve ser casado")
	assert(Career.pareja.get("id", "") == "casera", "ID da candidata deve ser casera")
	assert(Career.pareja_boda_season == GameState.season_num, "Temporada de casamento deve ser registrada")
	var fam1 = ll.get_family()
	assert(fam1["spouse"]["married"] == true, "LifeLegacy deve projetar cônjuge casado")
	assert(fam1["spouse"]["source"] == "career_projection", "Origem deve ser career_projection")
	assert(fam1["spouse"]["id"] == "casera", "ID projetado deve ser casera")
	
	# Limpa para próximo teste
	Career.romper_relacion()
	Career.pareja = {}
	ll.reload_slot(test_slot)
	
	# Cenário 2: Conversão de relacionamento não casado em casamento sem criar parceira duplicada
	print("  -> Cenário 2: Conversão de relacionamento não casado sem duplicidade...")
	Career.money = 200000
	var ok_s2 = Career.empezar_relacion("companera")
	assert(ok_s2 == true, "Início de namoro no Career deve suceder")
	var ok_form = Career.formalizar_relacion()
	assert(ok_form == true, "Formalização no Career deve suceder")
	assert(Career.pareja.get("estado", "") == "pareja", "Estado antes de casar deve ser pareja")
	assert(Career.pareja.get("id", "") == "companera", "ID deve ser companera")
	
	var ok_m2 = ll.marry({})
	assert(ok_m2 == true, "Conversão em casamento deve ter sucesso")
	assert(Career.pareja.get("id", "") == "companera", "ID deve permanecer companera sem substituição ou duplicação")
	assert(Career.pareja_casada() == true, "Estado no Career deve ter progredido para casado")
	assert(Career.pareja_historial().size() == 0, "Historial de términos não deve ter sido incrementado")
	
	# Limpa
	Career.romper_relacion()
	Career.pareja = {}
	ll.reload_slot(test_slot)
	
	# Cenário 3: Preservação dos custos oficiais de casamento (boda_coste deduzido de Career.money)
	print("  -> Cenário 3: Preservação dos custos oficiais de casamento...")
	Career.money = 300000
	Career.empezar_relacion("casera")
	Career.formalizar_relacion()
	Career.comprometerse()
	var expected_cost: int = Career.boda_coste()
	assert(expected_cost >= 40000, "Custo oficial mínimo deve ser >= 40.000")
	var money_before_m3: int = Career.money
	var ok_m3 = ll.marry({})
	assert(ok_m3 == true, "Casamento deve ter sucesso")
	assert(Career.money == money_before_m3 - expected_cost, "Career.money deve ser debitado exatamente pelo custo oficial")
	
	# Limpa
	Career.romper_relacion()
	Career.pareja = {}
	ll.reload_slot(test_slot)
	
	# Cenário 4: Preservação de pacto antenupcial (prenup) e titularidade
	print("  -> Cenário 4: Preservação de pacto antenupcial e titularidade...")
	Career.money = 250000
	var ok_m4 = ll.marry({"candidate_id": "cazafortunas", "prenup": true, "titular": "madre"})
	assert(ok_m4 == true, "Casamento com prenup deve ter sucesso")
	assert(Career.pareja_prenup == true, "pareja_prenup no Career deve ser true")
	assert(Career.pareja.get("titular", "") == "madre", "Titularidade mãe deve ser preservada")
	
	# Limpa
	Career.romper_relacion()
	Career.pareja = {}
	ll.reload_slot(test_slot)
	
	# Cenário 5: Encerramento de relacionamento não casado sem partilha de divórcio
	print("  -> Cenário 5: Encerramento de namoro sem partilha de divórcio...")
	Career.money = 120000
	Career.empezar_relacion("fiestera")
	Career.formalizar_relacion()
	assert(Career.pareja_casada() == false, "Não deve estar casado")
	var money_before_s5: int = Career.money
	var ok_d5 = ll.divorce()
	assert(ok_d5 == true, "Encerramento de relacionamento não casado via divorce() deve ter sucesso")
	assert(Career.pareja_activa() == false, "Career não deve mais ter parceira ativa")
	assert(Career.money == money_before_s5, "Dinheiro não deve ser deduzido em separação de não casados")
	assert(ll.get_family()["spouse"].is_empty() == true, "LifeLegacy spouse deve ser vazio")
	
	# Cenário 6 & 7: Divórcio de casamento com partilha patrimonial correta e verificação de saldo
	print("  -> Cenários 6 & 7: Divórcio de casamento com partilha patrimonial e verificação de saldo...")
	Career.money = 100000
	Career.empezar_relacion("casera")
	Career.formalizar_relacion()
	Career.comprometerse()
	Career.casarse(false)
	Career.money = 100000 # Fixa saldo pré-divórcio conhecido
	var cuenta_div: Dictionary = Career.divorcio_cuenta()
	var expected_div_total: int = int(cuenta_div["total"])
	assert(expected_div_total > 0, "Partilha deve calcular valor > 0")
	var money_before_div: int = Career.money
	
	var ok_d6 = ll.divorce()
	assert(ok_d6 == true, "Divórcio oficial deve ter sucesso")
	assert(Career.pareja_activa() == false, "Career parceira não deve mais estar ativa")
	assert(Career.money == money_before_div - expected_div_total, "Career.money deve ser debitado exatamente pelo total da partilha")
	assert(ll.get_family()["spouse"].is_empty() == true, "Projeção de cônjuge no LifeLegacy deve estar vazia")
	
	# Cenário 8: Falha de persistência sem divergência entre Career e Life & Legacy
	print("  -> Cenário 8: Falha de persistência e rollback transacional sem divergência...")
	Career.money = 200000
	Career.empezar_relacion("casera")
	Career.formalizar_relacion()
	Career.comprometerse()
	var pre_m_pareja = Career.pareja.duplicate(true)
	var pre_m_money = Career.money
	var pre_m_rel = Career.rel["pareja"]
	var pre_fam = ll.get_family()
	
	LifeLegacyPersistence.fault_inject_open_write = true
	var ok_fail_m = ll.marry({})
	LifeLegacyPersistence.fault_inject_open_write = false
	
	assert(ok_fail_m == false, "marry() deve retornar false sob falha de gravação")
	assert(Career.pareja.get("estado", "") == pre_m_pareja.get("estado", ""), "Career.pareja deve sofrer rollback")
	assert(Career.money == pre_m_money, "Career.money deve sofrer rollback idêntico")
	assert(Career.rel["pareja"] == pre_m_rel, "Career.rel deve sofrer rollback idêntico")
	assert(ll.get_family()["spouse"]["state"] == pre_fam["spouse"]["state"], "LifeLegacy family deve sofrer rollback")
	
	# Cenário 9: Projeção íntegra após recarga de save de casamento oficial
	print("  -> Cenário 9: Projeção íntegra após reload de casamento oficial...")
	var ok_m9 = ll.marry({})
	assert(ok_m9 == true, "Casamento oficial deve ter sucesso")
	assert(Career.pareja_casada() == true, "Career casado")
	ll.reload_slot(test_slot)
	var fam9 = ll.get_family()
	assert(fam9["spouse"]["married"] == true, "Após reload do save, projeção mantém married = true")
	assert(fam9["spouse"]["source"] == "career_projection", "Após reload, mantém source = career_projection")
	
	# Cenário 10: Projeção vazia após recarga de save de divórcio oficial
	print("  -> Cenário 10: Projeção vazia após reload de divórcio oficial...")
	var ok_d10 = ll.divorce()
	assert(ok_d10 == true, "Divórcio deve ter sucesso")
	assert(Career.pareja_activa() == false, "Career inativo")
	ll.reload_slot(test_slot)
	var fam10 = ll.get_family()
	assert(fam10["spouse"].is_empty() == true, "Após reload do save após divórcio, spouse deve ser estritamente vazio")
	
	# Cenário 11: Ausência de ressurgimento de cônjuge legado após divórcio
	print("  -> Cenário 11: Ausência de ressurgimento de cônjuge legado após divórcio...")
	# Simula injeção de cônjuge legado em dados brutos do save (como se fosse save V4)
	var corrupt_legacy = LifeLegacyState.get_default_profile(1, 0)
	corrupt_legacy["family"]["spouse"] = {"name": "Esposa Fantasma", "affinity": 100.0}
	LifeLegacyPersistence.save_slot_data(test_slot, corrupt_legacy)
	
	# Garante que Career continua divorciado / sem parceira
	assert(Career.pareja_activa() == false, "Career está sem parceira ativa")
	ll.reload_slot(test_slot)
	var fam11 = ll.get_family()
	assert(fam11["spouse"].is_empty() == true, "Esposa fantasma legada NUNCA deve ressurgir quando Career não tem parceira ativa")
	
	print("  -> OK!")
