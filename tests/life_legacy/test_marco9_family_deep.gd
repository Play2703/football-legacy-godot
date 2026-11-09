extends Node

const LifeLegacyManager = preload("res://autoload/life_legacy_manager.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _ready() -> void:
	print("--- TEST MARCO 9 ETAPA 1: INÍCIO ---")
	
	test_migration_v4_to_v5()
	test_chained_migrations_v1_to_v5()
	test_child_id_generation_and_uniqueness()
	test_formation_path_validation_and_mutation()
	test_canonical_age_and_phase_boundaries()
	test_career_pareja_projection_and_single_source_of_truth()
	test_deep_copy_protection()
	test_child_affinity_clamping_and_persistence()
	test_backward_compatibility_lifecycle()
	
	print("--- TEST MARCO 9 ETAPA 1: TODOS OS TESTES PASSARAM COM SUCESSO! ---")
	get_tree().quit(0)

func test_migration_v4_to_v5() -> void:
	print("[TEST] 1. Migração V4 -> V5 (Atribuição de basic, afinidade e schema V5)...")
	
	var v4_data: Dictionary = {
		"schema_version": 4,
		"catalog_version": 2,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": {"season_num": 3, "season_day": 10},
		"total_ticks_processed": 100,
		"season_calendar_lengths": {"1": 38, "2": 38},
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"active_modifiers": [],
		"story_arcs": {"active_arcs": {}, "completed_arcs": []},
		"family": {
			"spouse": {"name": "Mariana", "affinity": 80.0},
			"children": [
				{
					"id": "child_antigo_1",
					"name": "Thiago",
					"gender": "M",
					"birth_season_num": 1,
					"birth_season_day": 5,
					"position": "MC",
					"affinity": 65.0,
					"potential": 80.0,
					"initial_ovr": 55
				},
				{
					# Sem ID nem formation_path prévios
					"name": "Sofia",
					"gender": "F",
					"birth_season_num": 2,
					"birth_season_day": 12,
					"position": "DC",
					"affinity": 120.0, # valor fora dos limites
					"potential": 70.0,
					"initial_ovr": 50
				}
			]
		},
		"dynasty": {
			"current_generation": 1,
			"ancestors": [],
			"heir_candidates": [],
			"next_dynasty_tx_seq": 1
		},
		"active_event": {},
		"outbox": {"pending_dispatches": []},
		"history": {"occurred_events": [], "event_cooldowns": {}},
		"social_reputation": {
			"scandal_heat": 15.0,
			"press_agent_level": 1,
			"press_agent_ticks_remaining": 10,
			"active_campaigns": [],
			"cooldowns": {},
			"history": [],
			"last_processed_tick": 100
		}
	}
	
	var migrated: Dictionary = LifeLegacyPersistence._migrate(v4_data, 4, 5)
	assert(migrated["schema_version"] == 5, "Schema deve ser promovido para 5")
	assert(LifeLegacyState.validate_schema(migrated) == true, "Schema V5 deve validar com sucesso")
	
	var children: Array = migrated["family"]["children"]
	assert(children.size() == 2, "Deve preservar 2 filhos")
	
	# Thiago: id preservado, formation_path basic atribuído
	var thiago: Dictionary = children[0]
	assert(thiago["id"] == "child_antigo_1", "ID de Thiago deve ser preservado")
	assert(thiago["formation_path"] == "basic", "Thiago deve receber formação basic")
	assert(thiago["affinity"] == 65.0, "Afinidade de Thiago deve ser mantida")
	
	# Sofia: id gerado deterministicamente, affinity clamped para 100.0, formation_path basic
	var sofia: Dictionary = children[1]
	assert(sofia["id"].begins_with("child_sofia_s2_d12"), "Sofia deve ter ID determinístico gerado")
	assert(sofia["formation_path"] == "basic", "Sofia deve receber formação basic")
	assert(sofia["affinity"] == 100.0, "Afinidade de Sofia deve sofrer clamp para 100.0")
	
	# Preservação de campos anteriores (Social, Stats, Arcs)
	assert(migrated["social_reputation"]["scandal_heat"] == 15.0, "Social Reputation deve ser preservada")
	assert(migrated["total_ticks_processed"] == 100, "total_ticks_processed deve ser preservado")
	
	print("  -> OK!")

func test_chained_migrations_v1_to_v5() -> void:
	print("[TEST] 2. Migração em Cadeia V1 -> V5 (Integridade completa de todos os marcos)...")
	
	var v1_data: Dictionary = {
		"schema_version": 1,
		"catalog_version": 1,
		"rng_version": 1,
		"save_revision": 1,
		"last_processed_time": {"season_num": 1, "season_day": 0},
		"stats": LifeLegacyState.STAT_DEFAULTS.duplicate(),
		"stats_history": [],
		"family": {
			"spouse": {},
			"children": []
		},
		"dynasty": {
			"current_generation": 1,
			"ancestors": [],
			"heir_candidates": [],
			"next_dynasty_tx_seq": 1
		},
		"active_event": {},
		"outbox": {"pending_dispatches": []},
		"history": {"occurred_events": [], "event_cooldowns": {}}
	}
	
	var migrated: Dictionary = LifeLegacyPersistence._migrate(v1_data, 1, 5)
	assert(migrated["schema_version"] == 5, "Versão migrada de V1 deve ser 5")
	assert(LifeLegacyState.validate_schema(migrated) == true, "V1 migrado para V5 deve ser válido")
	assert(migrated.has("active_modifiers"), "Deve ter active_modifiers (V2)")
	assert(migrated.has("total_ticks_processed"), "Deve ter total_ticks_processed (V3)")
	assert(migrated.has("season_calendar_lengths"), "Deve ter season_calendar_lengths (V3)")
	assert(migrated.has("social_reputation"), "Deve ter social_reputation (V4)")
	assert(migrated.has("family"), "Deve ter family (V5)")
	assert(migrated["family"]["children"].is_empty(), "Children deve ser lista vazia válida")
	
	print("  -> OK!")

func test_child_id_generation_and_uniqueness() -> void:
	print("[TEST] 3. Geração determinística e unicidade de ID de filhos...")
	
	var fam: Dictionary = {"children": []}
	var ch1: Dictionary = LifeLegacyFamily.register_child("Pedro", "M", 2, 10, fam)
	assert(ch1["id"] == "child_pedro_s2_d10", "Primeiro ID deve ser child_pedro_s2_d10")
	
	# Segundo filho com mesmo nome e mesma data -> colisão resolvida com sufixo numérico determinístico
	var ch2: Dictionary = LifeLegacyFamily.register_child("Pedro", "M", 2, 10, fam)
	assert(ch2["id"] == "child_pedro_s2_d10_2", "Segundo ID deve receber sufixo _2")
	
	var ch3: Dictionary = LifeLegacyFamily.register_child("Pedro", "M", 2, 10, fam)
	assert(ch3["id"] == "child_pedro_s2_d10_3", "Terceiro ID deve receber sufixo _3")
	
	# Filho com ID customizado especificado explicitamente
	var ch4: Dictionary = LifeLegacyFamily.register_child("Custom", "F", 3, 1, fam, "custom_child_id_xyz")
	assert(ch4["id"] == "custom_child_id_xyz", "ID customizado deve ser respeitado")
	
	print("  -> OK!")

func test_formation_path_validation_and_mutation() -> void:
	print("[TEST] 4. Validação de trilhas de formação (basic, elite, football)...")
	
	assert(LifeLegacyFamily.is_valid_formation(LifeLegacyFamily.FORMATION_BASIC) == true, "basic deve ser válido")
	assert(LifeLegacyFamily.is_valid_formation(LifeLegacyFamily.FORMATION_ELITE) == true, "elite deve ser válido")
	assert(LifeLegacyFamily.is_valid_formation(LifeLegacyFamily.FORMATION_FOOTBALL) == true, "football deve ser válido")
	assert(LifeLegacyFamily.is_valid_formation("invalid_track") == false, "invalid_track deve ser rejeitado")
	assert(LifeLegacyFamily.is_valid_formation("") == false, "string vazia deve ser rejeitada")
	
	var fam: Dictionary = {"children": []}
	var ch: Dictionary = LifeLegacyFamily.register_child("Arthur", "M", 1, 1, fam, "", LifeLegacyFamily.FORMATION_FOOTBALL)
	assert(ch["formation_path"] == LifeLegacyFamily.FORMATION_FOOTBALL, "Deve iniciar em football")
	
	# Alteração válida
	var ok_set: bool = LifeLegacyFamily.set_child_formation(ch["id"], LifeLegacyFamily.FORMATION_ELITE, fam)
	assert(ok_set == true, "Alteração para elite deve ser aceita")
	var retrieved: Dictionary = LifeLegacyFamily.get_child_by_id(ch["id"], fam)
	assert(retrieved["formation_path"] == LifeLegacyFamily.FORMATION_ELITE, "Trilha recuperada deve ser elite")
	
	# Alteração inválida rejeitada
	var bad_set: bool = LifeLegacyFamily.set_child_formation(ch["id"], "astronomy", fam)
	assert(bad_set == false, "Trilha inválida deve ser rejeitada")
	assert(LifeLegacyFamily.get_child_by_id(ch["id"], fam)["formation_path"] == LifeLegacyFamily.FORMATION_ELITE, "Trilha não deve mudar após tentativa inválida")
	
	print("  -> OK!")

func test_canonical_age_and_phase_boundaries() -> void:
	print("[TEST] 5. Idade canônica e transição exata de fases de desenvolvimento...")
	
	# Nascido na Season 2, Dia 20
	var b_s: int = 2
	var b_d: int = 20
	
	# 0 anos (infant)
	var age_0: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 2, 20)
	assert(age_0 == 0, "Idade no dia do nascimento deve ser 0")
	assert(LifeLegacyFamily.get_development_phase(age_0) == LifeLegacyFamily.PHASE_INFANT, "0 anos deve ser infant")
	
	# Limite de infant: 5 anos
	var age_5: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 7, 20)
	assert(age_5 == 5, "Idade deve ser 5")
	assert(LifeLegacyFamily.get_development_phase(age_5) == LifeLegacyFamily.PHASE_INFANT, "5 anos deve ser infant")
	
	# 5 anos e 364 dias (ainda infant antes do aniversário)
	var age_before_6: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 8, 19)
	assert(age_before_6 == 5, "Antes do aniversário na Season 8 deve ter 5 anos")
	assert(LifeLegacyFamily.get_development_phase(age_before_6) == LifeLegacyFamily.PHASE_INFANT, "Ainda infant aos 5")
	
	# Entrada em child: 6 anos
	var age_6: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 8, 20)
	assert(age_6 == 6, "No aniversário na Season 8 deve ter 6 anos")
	assert(LifeLegacyFamily.get_development_phase(age_6) == LifeLegacyFamily.PHASE_CHILD, "6 anos deve ser child")
	
	# Limite de child: 11 anos
	var age_11: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 13, 20)
	assert(age_11 == 11, "Idade deve ser 11")
	assert(LifeLegacyFamily.get_development_phase(age_11) == LifeLegacyFamily.PHASE_CHILD, "11 anos deve ser child")
	
	# Entrada em teen: 12 anos
	var age_12: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 14, 20)
	assert(age_12 == 12, "Idade deve ser 12")
	assert(LifeLegacyFamily.get_development_phase(age_12) == LifeLegacyFamily.PHASE_TEEN, "12 anos deve ser teen")
	
	# Limite de teen: 15 anos
	var age_15: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 17, 20)
	assert(age_15 == 15, "Idade deve ser 15")
	assert(LifeLegacyFamily.get_development_phase(age_15) == LifeLegacyFamily.PHASE_TEEN, "15 anos deve ser teen")
	
	# Entrada em eligible_heir: 16 anos
	var age_16: int = LifeLegacyFamily.compute_canonical_age(b_s, b_d, 18, 20)
	assert(age_16 == 16, "Idade deve ser 16")
	assert(LifeLegacyFamily.get_development_phase(age_16) == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "16 anos deve ser eligible_heir")
	
	print("  -> OK!")

func test_career_pareja_projection_and_single_source_of_truth() -> void:
	print("[TEST] 6. Projeção de Career.pareja e fonte única de verdade...")
	
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 1
	ll.set_safe_mode(false)
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 1))
	ll.reload_slot(0)
	
	# Cenário A: Sem parceira no Career
	Career.pareja = {}
	Career.rel["pareja"] = 0
	var fam_empty = ll.get_family()
	assert(fam_empty["spouse"].is_empty(), "Sem parceira no Career e no slot, spouse deve ser vazio")
	
	# Cenário B: Parceira ativa no Career
	Career.pareja = {
		"id": "novia_laura",
		"nombre": "Laura Rodriguez",
		"estado": "pareja",
		"desde": 1
	}
	Career.rel["pareja"] = 82
	
	var fam_proj = ll.get_family()
	assert(fam_proj["spouse"].is_empty() == false, "Spouse deve refletir parceira projetada do Career")
	assert(fam_proj["spouse"]["name"] == "Laura Rodriguez", "Nome deve ser projetado de Career.pareja")
	assert(fam_proj["spouse"]["id"] == "novia_laura", "ID deve ser projetado de Career.pareja")
	assert(fam_proj["spouse"]["state"] == "pareja", "Estado deve ser projetado de Career.pareja")
	assert(fam_proj["spouse"]["affinity"] == 82.0, "Afinidade deve ser projetada de Career.rel['pareja']")
	assert(fam_proj["spouse"]["married"] == false, "Não casado pois estado é 'pareja'")
	assert(fam_proj["spouse"]["source"] == "career_projection", "Identificação de projeção do Career")
	
	# Tentativa de segundo casamento via LifeLegacy deve falhar (anti-bigamia)
	var ok_bigamy = ll.marry({"name": "Outra Mulher", "affinity": 90.0})
	assert(ok_bigamy == false, "Não deve permitir casamento no LifeLegacy se o Career já tem parceira ativa")
	
	# Atualiza Career para casada
	Career.pareja["estado"] = "casado"
	Career.rel["pareja"] = 95
	var fam_casada = ll.get_family()
	assert(fam_casada["spouse"]["married"] == true, "Spouse deve projetar married=true quando estado='casado'")
	assert(fam_casada["spouse"]["affinity"] == 95.0, "Afinidade projetada deve ser 95.0")
	
	# Divórcio via LifeLegacy deve sincronizar com Career
	var ok_div = ll.divorce()
	assert(ok_div == true, "Divórcio deve ser bem sucedido")
	assert(Career.pareja_activa() == false, "Career não deve ter mais parceira ativa após divórcio")
	assert(ll.get_family()["spouse"].is_empty() == true, "Spouse no get_family() deve estar vazio após divórcio")
	
	print("  -> OK!")

func test_deep_copy_protection() -> void:
	print("[TEST] 7. Proteção de cópia profunda contra mutação externa...")
	
	var ll = LifeLegacy
	Career.pareja = {}
	Career.rel["pareja"] = 0
	
	# Registra um filho
	var ch = ll.register_child("Felipe", "M", LifeLegacyFamily.FORMATION_BASIC)
	var ch_id: String = ch["id"]
	
	# Pega família e tenta alterar a lista de filhos diretamente
	var fam1 = ll.get_family()
	fam1["children"].clear()
	fam1["spouse"] = {"hacked": true}
	
	# Segunda consulta deve manter os dados intactos
	var fam2 = ll.get_family()
	assert(fam2["children"].size() == 1, "Mutação externa não deve afetar _data['family']['children']")
	assert(fam2["spouse"].has("hacked") == false, "Mutação externa não deve afetar _data['family']['spouse']")
	
	# Consulta por get_child_by_id e tentativa de mutação
	var ch_copy = ll.get_child_by_id(ch_id)
	ch_copy["formation_path"] = "hacked_path"
	ch_copy["affinity"] = 999.0
	
	var ch_real = ll.get_child_by_id(ch_id)
	assert(ch_real["formation_path"] == LifeLegacyFamily.FORMATION_BASIC, "Mutação externa no filho não deve persistir")
	assert(ch_real["affinity"] == 50.0, "Afinidade original deve permanecer intacta")
	
	print("  -> OK!")

func test_child_affinity_clamping_and_persistence() -> void:
	print("[TEST] 8. Atualização de afinidade individual filial e clamp [0.0, 100.0]...")
	
	var ll = LifeLegacy
	var fam = ll.get_family()
	var ch_id: String = fam["children"][0]["id"]
	
	# Incremento normal
	var ok_up = ll.update_child_affinity(ch_id, 25.0)
	assert(ok_up == true, "Update de afinidade deve ser bem sucedido")
	assert(ll.get_child_by_id(ch_id)["affinity"] == 75.0, "50 + 25 deve ser 75.0")
	
	# Clamp superior em 100.0
	var ok_up2 = ll.update_child_affinity(ch_id, 50.0)
	assert(ok_up2 == true, "Update além do topo deve suceder com clamp")
	assert(ll.get_child_by_id(ch_id)["affinity"] == 100.0, "Afinidade não deve ultrapassar 100.0")
	
	# Clamp inferior em 0.0
	var ok_down = ll.update_child_affinity(ch_id, -150.0)
	assert(ok_down == true, "Update negativo deve suceder com clamp")
	assert(ll.get_child_by_id(ch_id)["affinity"] == 0.0, "Afinidade não deve descer abaixo de 0.0")
	
	# Filho inexistente
	var bad_up = ll.update_child_affinity("child_fantasma_invalido", 10.0)
	assert(bad_up == false, "Atualização de filho inexistente deve retornar false")
	
	print("  -> OK!")

func test_backward_compatibility_lifecycle() -> void:
	print("[TEST] 9. Retrocompatibilidade: assinatura de 2 parâmetros e elegibilidade aos 16 anos...")
	
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 10
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 10))
	ll.reload_slot(0)
	Career.pareja = {}
	
	# Chamada legado com apenas 2 parâmetros (name, gender)
	var legacy_child = ll.register_child("Camila", "F")
	assert(legacy_child["name"] == "Camila", "Nome deve ser Camila")
	assert(legacy_child["gender"] == "F", "Gênero deve ser F")
	assert(legacy_child["formation_path"] == LifeLegacyFamily.FORMATION_BASIC, "Padrão deve ser basic")
	assert(legacy_child["affinity"] == 50.0, "Afinidade padrão deve ser 50.0")
	
	# Idade de 15 anos -> Não elegível
	GameState.season_num = 16
	GameState.season_day = 9
	assert(ll.get_eligible_heirs().is_empty() == true, "15 anos não deve ser elegível para herdeiro")
	
	# Idade de 16 anos -> Elegível
	GameState.season_num = 17
	GameState.season_day = 10
	var heirs = ll.get_eligible_heirs()
	assert(heirs.size() == 1, "Aos 16 anos completos Camila deve estar elegível")
	assert(heirs[0]["canonical_age"] == 16, "Idade canônica deve ser 16")
	assert(heirs[0]["phase"] == LifeLegacyFamily.PHASE_ELIGIBLE_HEIR, "Fase deve ser eligible_heir")
	
	print("  -> OK!")
