extends Node

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")
const LifeLegacyFamily = preload("res://features/life_legacy/life_legacy_family.gd")
const LifeLegacyEventModal = preload("res://features/life_legacy/ui/life_legacy_event_modal.gd")
const CelularScript = preload("res://ui/celular.gd")

func _ready() -> void:
	print("=================================================================")
	print("--- INICIANDO MARCO 6: HOMOLOGAÇÃO FINAL E TESTE DE ESTRESSE ---")
	print("=================================================================")
	
	test_system_isolation_and_setup()
	test_full_52_weeks_stress_simulation()
	test_annual_rollover_and_aging()
	test_non_regression_original_systems()
	await test_orphan_nodes_and_memory_leak()
	
	print("=================================================================")
	print("--- MARCO 6: TODOS OS TESTES FORAM CONCLUÍDOS COM 100% DE SUCESSO! ---")
	print("=================================================================")
	get_tree().quit(0)

func test_system_isolation_and_setup() -> void:
	print("[Teste 1] Configuração e Isolamento de Ambiente...")
	LifeLegacyCatalogoEventos.registrar_todos()
	
	# Inicializa slot 0 limpo na temporada 1, dia 0
	var default_data = LifeLegacyState.get_default_profile(1, 0)
	# Adiciona um cônjuge e um filho pequeno para acompanhar envelhecimento
	LifeLegacyFamily.marry({"name": "Camila Alencar"}, default_data["family"])
	LifeLegacyFamily.register_child("Lucas", "M", 1, 10, default_data["family"])
	
	LifeLegacyPersistence.save_slot_data(0, default_data)
	
	if SaveSlots != null:
		SaveSlots.active = 0
		
	if GameState != null:
		GameState.season_num = 1
		GameState.season_day = 0
		
	var ll_manager = get_node_or_null("/root/LifeLegacy")
	assert(ll_manager != null, "LifeLegacy autoload deve existir")
	ll_manager.reload_slot(0)
	ll_manager.set_safe_mode(false)
	
	if Career != null:
		Career.processed_career_tokens.clear()
		Career.processed_muro_tokens.clear()
		
	print("  -> Ambiente inicializado: Temporada 1, Dia 0, Cônjuge: Camila, Filho: Lucas.")

func test_full_52_weeks_stress_simulation() -> void:
	print("[Teste 2] Simulação Longitudinal de 52 Semanas Consecutivas...")
	var ll_manager = get_node_or_null("/root/LifeLegacy")
	
	var total_events_triggered: int = 0
	var total_events_resolved: int = 0
	
	# Conecta para contar eventos
	var on_event_ready = func(evt_data: Dictionary) -> void:
		total_events_triggered += 1
	ll_manager.life_event_ready.connect(on_event_ready)
	
	for week in range(1, 53):
		GameState.season_num = 1
		GameState.season_day = week
		GameState.career_updated.emit()
		
		# Verifica alinhamento temporal imediato
		var last_time = ll_manager.get_last_processed_time()
		assert(last_time["season_num"] == 1 and last_time["season_day"] == week,
			"Semana %d: Divergência temporal observada (%d, %d)" % [week, last_time["season_num"], last_time["season_day"]])
		
		# Verifica limites de todos os 6 indicadores
		var stats: Dictionary = ll_manager.get_all_stats()
		for stat_k in stats:
			var val: float = float(stats[stat_k])
			assert(val >= 0.0 and val <= 100.0,
				"Semana %d: Indicador %s fora do domínio: %.2f" % [week, stat_k, val])
		
		# Se gerou evento, resolve imediatamente uma escolha válida
		var act_evt = ll_manager.get_active_event()
		if not act_evt.is_empty() and act_evt.get("status", "") == "PENDING_RESOLUTION":
			var choices: Array = act_evt.get("choices", [])
			if not choices.is_empty():
				var first_ch_id: String = String(choices[0].get("id", ""))
				var resolved: bool = ll_manager.resolve_active_event(first_ch_id)
				assert(resolved, "Semana %d: Resolução do evento deve ter sucesso" % week)
				total_events_resolved += 1
		
		# Verifica se a fila de Outbox não está acumulando pendências órfãs
		# No outbox todas as mensagens devem ser processadas (reconciliadas)
		var slot_data = LifeLegacyPersistence.load_slot_data(0, 1, week)
		assert(slot_data["status"] == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Arquivo deve ser legível")
		var outbox = slot_data["data"].get("outbox", {})
		var pending = outbox.get("pending_dispatches", [])
		for intent in pending:
			assert(intent.get("status", "") == "COMMITTED",
				"Semana %d: Intenção Outbox presa em estado não-COMMITTED" % week)
				
	ll_manager.life_event_ready.disconnect(on_event_ready)
	print("  -> 52 semanas executadas. Eventos acionados: %d, Eventos resolvidos: %d. Integridade dos indicadores 100%%." % [total_events_triggered, total_events_resolved])

func test_annual_rollover_and_aging() -> void:
	print("[Teste 3] Teste de Virada Anual (Temporada 2, Dia 1) e Envelhecimento...")
	var ll_manager = get_node_or_null("/root/LifeLegacy")
	
	var rollover = {"received": false}
	var on_rollover = func(s_num: int) -> void:
		rollover["received"] = true
	ll_manager.annual_rollover_completed.connect(on_rollover)
	
	# Avança para Temporada 2, Dia 1
	GameState.season_num = 2
	GameState.season_day = 1
	GameState.career_updated.emit()
	
	assert(rollover["received"], "Sinal annual_rollover_completed deve ser emitido na virada de temporada")
	
	# Verifica persistência após rollover
	var slot_data = LifeLegacyPersistence.load_slot_data(0, 2, 1)
	assert(slot_data["status"] == LifeLegacyPersistence.LoadStatus.OK_SUCCESS, "Arquivo deve carregar com sucesso após rollover")
	
	var p_time = slot_data["data"].get("last_processed_time", {})
	assert(p_time["season_num"] == 2 and p_time["season_day"] == 1, "last_processed_time deve estar alinhado em (2, 1)")
	
	# Testa idade do filho na temporada 2
	var fam = slot_data["data"].get("family", {})
	var children = fam.get("children", [])
	assert(children.size() == 1, "Deve ter 1 filho cadastrado")
	
	# Lucas nasceu na T1 D10. Na T2 D1 ele tem 0 anos (ainda não fez aniversário de dia 10).
	var age_d1 = LifeLegacyFamily.compute_canonical_age(children[0]["birth_season_num"], children[0]["birth_season_day"], 2, 1)
	assert(age_d1 == 0, "No dia 1 da T2, criança nascida no dia 10 ainda tem 0 anos")
	
	# No dia 10 da T2, ele completa 1 ano exatamente
	var age_d10 = LifeLegacyFamily.compute_canonical_age(children[0]["birth_season_num"], children[0]["birth_season_day"], 2, 10)
	assert(age_d10 == 1, "No dia 10 da T2, criança completa 1 ano com precisão canônica")
	
	ll_manager.annual_rollover_completed.disconnect(on_rollover)
	print("  -> Virada anual e envelhecimento canônico validados com sucesso.")

func test_non_regression_original_systems() -> void:
	print("[Teste 4] Verificação de Não-Regressão dos Sistemas Originais...")
	
	# 1. SaveSlots
	assert(SaveSlots != null, "SaveSlots autoload deve existir")
	var s_dir = SaveSlots.slot_dir(0)
	assert(not s_dir.is_empty(), "SaveSlots.slot_dir deve retornar caminho válido")
	
	# 2. Career
	assert(Career != null, "Career autoload deve existir")
	assert(typeof(Career.money) == TYPE_INT, "Career.money deve ser um inteiro válido")
	assert(typeof(Career.energy) == TYPE_FLOAT, "Career.energy deve ser float válido")
	
	# 3. GameState
	assert(GameState != null, "GameState autoload deve existir")
	assert(GameState.season_num == 2, "GameState.season_num íntegro")
	
	print("  -> Sistemas originais (SaveSlots, Career, GameState) preservados sem regressão.")

func test_orphan_nodes_and_memory_leak() -> void:
	print("[Teste 5] Auditoria de Performance e Nós Órfãos na Interface...")
	
	var initial_orphans: int = Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT)
	
	# Instancia e destrói 10 vezes a UI do Celular e do Modal
	for i in range(10):
		# Modal
		var modal = LifeLegacyEventModal.new()
		add_child(modal)
		var dummy_evt = {
			"event_id": "test_leak",
			"title": "Teste",
			"description": "Desc",
			"choices": [{"id": "c1", "text": "Opção"}]
		}
		modal.setup_event(dummy_evt)
		modal.queue_free()
		
		# Celular
		var celular = CelularScript.new()
		var container = VBoxContainer.new()
		add_child(container)
		celular.monta_minha_vida(container, 280.0)
		container.queue_free()
	
	# Força processamento de frames para limpar a fila do queue_free
	await get_tree().process_frame
	await get_tree().process_frame
	
	var final_orphans: int = Performance.get_monitor(Performance.OBJECT_ORPHAN_NODE_COUNT)
	# A diferença deve ser mínima ou nula
	var delta: int = final_orphans - initial_orphans
	print("  -> Nós órfãos antes: %d | Nós órfãos depois: %d | Delta: %d" % [initial_orphans, final_orphans, delta])
	assert(delta <= 5, "Nenhum nó órfão significativo deve restar após destruição da UI")
	print("  -> Auditoria de memória concluída com êxito.")
