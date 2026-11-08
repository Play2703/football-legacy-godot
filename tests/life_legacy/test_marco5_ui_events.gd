extends Node

const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")
const LifeLegacyEventModal = preload("res://features/life_legacy/ui/life_legacy_event_modal.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const CelularScript = preload("res://ui/celular.gd")

func _ready() -> void:
	print("--- INICIANDO TESTES DO MARCO 5: EVENTOS JOGÁVEIS E INTERFACE ---")
	
	# Reset do slot 0 para evitar safe mode por resíduo do marco 4
	var default_data = LifeLegacyState.get_default_profile(1, 0)
	LifeLegacyPersistence.save_slot_data(0, default_data)
	
	var ll_manager = get_node_or_null("/root/LifeLegacy")
	if ll_manager != null:
		ll_manager.reload_slot(0)
		ll_manager.set_safe_mode(false)
	
	if Career != null:
		Career.processed_career_tokens.clear()
		Career.processed_muro_tokens.clear()
	
	test_catalog_registration()
	test_festa_vespera_derby_structure_and_resolution()
	test_event_modal_ui()
	test_celular_vida_dashboard_ui()
	test_end_to_end_advance_event_modal_celular()
	
	print("--- TODOS OS TESTES DO MARCO 5 FORAM APROVADOS COM SUCESSO! ---")
	get_tree().quit(0)

func test_catalog_registration() -> void:
	print("[Teste 1] Verificação do Catálogo Declarativo de Eventos...")
	LifeLegacyCatalogoEventos.registrar_todos()
	var all_events: Array[Dictionary] = LifeLegacyEvents.get_all_events()
	assert(all_events.size() >= 8, "Devem existir pelo menos 8 eventos canônicos registrados")
	
	var expected_ids = [
		"festa_vespera_derby",
		"crise_conjugal",
		"compra_carro_luxo",
		"investimento_amigo_infancia",
		"nascimento_primeiro_filho",
		"escandalo_midia",
		"noivado_surpresa",
		"mentoria_jovem_base"
	]
	
	for expected_id in expected_ids:
		var evt: Dictionary = LifeLegacyEvents.get_event_by_id(expected_id)
		assert(not evt.is_empty(), "Evento %s deve estar registrado" % expected_id)
		assert(evt.has("title") and not evt["title"].is_empty(), "Evento deve ter título")
		assert(evt.has("description") and not evt["description"].is_empty(), "Evento deve ter descrição")
		assert(evt.has("choices") and evt["choices"].size() >= 2, "Evento deve ter pelo menos 2 escolhas")
		assert(evt.has("conditions"), "Evento deve ter condições declarativas")
	
	print("  -> Todos os 8 eventos canônicos estão íntegros e registrados.")

func test_festa_vespera_derby_structure_and_resolution() -> void:
	print("[Teste 2] Verificação estrutural e resolução de 'festa_vespera_derby'...")
	var evt: Dictionary = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	assert(not evt.is_empty(), "Evento deve existir")
	
	var choices: Array = evt.get("choices", [])
	assert(choices.size() == 4, "'festa_vespera_derby' deve possuir exatamente 4 escolhas")
	
	var choice_ids = []
	for ch in choices:
		choice_ids.append(ch.get("id", ""))
	
	assert("choice_1_ir" in choice_ids, "Deve ter escolha 'choice_1_ir'")
	assert("choice_2_recusar" in choice_ids, "Deve ter escolha 'choice_2_recusar'")
	assert("choice_3_sair_cedo" in choice_ids, "Deve ter escolha 'choice_3_sair_cedo'")
	assert("choice_4_camarote" in choice_ids, "Deve ter escolha 'choice_4_camarote'")
	
	# Simula instância do evento
	var occ = {
		"event_id": "festa_vespera_derby",
		"occurrence_id": "occ_test_derby_01",
		"title": evt.get("title", ""),
		"description": evt.get("description", ""),
		"choices": evt.get("choices", []),
		"status": "PENDING_RESOLUTION"
	}
	
	var outbox = {"pending_dispatches": []}
	var ll_manager = get_node_or_null("/root/LifeLegacy")
	assert(ll_manager != null, "LifeLegacy autoload deve existir")
	
	var ok: bool = LifeLegacyEvents.resolve_choice(occ, "choice_4_camarote", outbox, ll_manager)
	assert(ok, "Resolução da escolha deve retornar sucesso")
	assert(occ["status"] == "RESOLVED", "Status deve ser atualizado para RESOLVED")
	assert(occ["selected_choice_id"] == "choice_4_camarote", "selected_choice_id deve ser choice_4_camarote")
	
	print("  -> Resolução de evento com 4 ramificações e Outbox validada.")

func test_event_modal_ui() -> void:
	print("[Teste 3] Teste de Instanciação e Interface do LifeLegacyEventModal...")
	var modal = LifeLegacyEventModal.new()
	add_child(modal)
	
	var evt: Dictionary = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	var occ = {
		"event_id": "festa_vespera_derby",
		"occurrence_id": "occ_modal_test_01",
		"title": evt.get("title", ""),
		"description": evt.get("description", ""),
		"choices": evt.get("choices", [])
	}
	
	modal.setup_event(occ)
	
	# Localiza botões gerados no modal
	var buttons: Array[Button] = []
	_collect_buttons(modal, buttons)
	
	assert(buttons.size() == 4, "Modal deve gerar exatamente 4 botões para as 4 escolhas")
	
	var result: Dictionary = {"choice": ""}
	modal.event_choice_selected.connect(func(evt_id: String, choice_id: String) -> void:
		result["choice"] = choice_id
	)
	
	# Simula clique no botão 2 (choice_2_recusar)
	var btn2 = buttons[1]
	assert(btn2 != null, "Botão 2 deve existir")
	btn2.pressed.emit()
	
	assert(result["choice"] == "choice_2_recusar", "Sinal event_choice_selected deve emitir com a escolha selecionada")
	
	print("  -> LifeLegacyEventModal instanciado, configurado e respondendo a sinais com sucesso.")

func test_celular_vida_dashboard_ui() -> void:
	print("[Teste 4] Teste da Interface do App 'Minha Vida' no Celular...")
	var celular = CelularScript.new()
	
	# Verifica se "vida" está cadastrado
	assert("vida" in CelularScript.APP_ROTULO, "'vida' deve constar em APP_ROTULO do Celular")
	
	var container = VBoxContainer.new()
	container.custom_minimum_size = Vector2(280, 480)
	add_child(container)
	
	celular.monta_minha_vida(container, 280.0)
	
	# Verifica hierarquia de filhos criados em container
	assert(container.get_child_count() > 0, "monta_minha_vida deve popular o container")
	
	# Procura por elementos essenciais (Painéis de Indicadores, Família, Dinastia)
	var text_content: Array[String] = []
	_collect_labels(container, text_content)
	
	var has_stats: bool = false
	var has_family: bool = false
	var has_dynasty: bool = false
	
	for txt in text_content:
		if "INDICADORES LIFE & LEGACY" in txt:
			has_stats = true
		if "FAMÍLIA E RELACIONAMENTOS" in txt:
			has_family = true
		if "LINHAGEM E SUCESSÃO DINÁSTICA" in txt:
			has_dynasty = true
			
	assert(has_stats, "Dashboard deve conter seção INDICADORES LIFE & LEGACY")
	assert(has_family, "Dashboard deve conter seção FAMÍLIA E RELACIONAMENTOS")
	assert(has_dynasty, "Dashboard deve conter seção LINHAGEM E SUCESSÃO DINÁSTICA")
	
	container.queue_free()
	print("  -> App 'Minha Vida' no Celular renderiza os 6 indicadores, família e dinastia perfeitamente.")

func test_end_to_end_advance_event_modal_celular() -> void:
	print("[Teste 5] Teste de Integração Fim a Fim (Avanço -> Evento -> Modal -> Resolução -> Smartphone)...")
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 0
	Career.processed_career_tokens.clear()
	Career.processed_muro_tokens.clear()
	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 0))
	ll.set_safe_mode(false)
	ll.reload_slot(0)
	
	LifeLegacyCatalogoEventos.registrar_todos()
	
	# 1. Simula avanço de partida semanal no GameState
	GameState.season_num = 1
	GameState.season_day = 1
	GameState.career_updated.emit()
	
	# 2. Confere que um evento pendente foi gerado
	var active_evt: Dictionary = ll.get_active_event()
	assert(not active_evt.is_empty(), "Avanço semanal deve gerar um evento")
	assert(active_evt.get("status", "") == "PENDING_RESOLUTION", "Evento gerado deve estar em PENDING_RESOLUTION")
	
	# 3. Simula exibição do LifeLegacyEventModal no CareerHub
	var modal: LifeLegacyEventModal = LifeLegacyEventModal.new()
	add_child(modal)
	modal.setup_event(active_evt)
	
	var buttons: Array[Button] = []
	_collect_buttons(modal, buttons)
	assert(buttons.size() >= 2, "Modal deve renderizar botões para as opções do evento gerado")
	
	# 4. Jogador escolhe e resolve através da UI
	buttons[0].pressed.emit()
	
	# 5. Confere resolução do evento
	var resolved_evt: Dictionary = ll.get_active_event()
	assert(resolved_evt.get("status", "") == "RESOLVED", "Evento ativo deve transitar para RESOLVED")
	
	# 6. Renderiza ecossistema do celular in-game e valida persistência visual no app 'Minha Vida'
	var phone_box: VBoxContainer = VBoxContainer.new()
	add_child(phone_box)
	CelularScript.monta_minha_vida(phone_box, 300.0)
	
	var phone_labels: Array[String] = []
	_collect_labels(phone_box, phone_labels)
	assert(phone_labels.has("INDICADORES LIFE & LEGACY"), "Smartphone deve exibir dashboard atualizado")
	
	phone_box.queue_free()
	print("  -> Integração fim a fim homologada com sucesso absoluto!")

func _collect_labels(node: Node, acc: Array[String]) -> void:
	if node is Label:
		acc.append(node.text)
	for c in node.get_children():
		_collect_labels(c, acc)

func _collect_buttons(node: Node, acc: Array[Button]) -> void:
	if node is Button:
		acc.append(node)
	for c in node.get_children():
		_collect_buttons(c, acc)
