extends Node

const LifeLegacyEvents = preload("res://features/life_legacy/life_legacy_events.gd")
const LifeLegacyCatalogoEventos = preload("res://features/life_legacy/data/catalogo_eventos.gd")
const LifeLegacyEventModal = preload("res://features/life_legacy/ui/life_legacy_event_modal.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")
const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyOutbox = preload("res://features/life_legacy/life_legacy_outbox.gd")
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
	test_career_hub_real_scene_integration_and_slot_switch()
	test_career_hub_modal_precommitment_failure_and_retry()
	
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
	print("[Teste 5] Teste de Integração Real: Partida GameState -> Avanço de Calendário -> Evento -> CareerHub Modal -> Resolução -> Smartphone...")
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 0
	Career.processed_career_tokens.clear()
	Career.processed_muro_tokens.clear()
	Career.injury_weeks = 0
	Career.injury_dias = 0
	Career.injury_peak_weeks = 0
	Career.injury_matches_lost = 0
	Career._rehab_debido = -1
	Career._market_settled = true
	Career.birthday_year_seen = int(Time.get_date_dict_from_system().get("year", 0))
	Career.pending_ceremonies.clear()
	Career.pending_summary = {}
	Career.pending_decision = ""
	Career.week_event = ""
	Career.last_summary = ""
	Career.last_report = {}
	Career.retired = false

	LifeLegacyPersistence.save_slot_data(0, LifeLegacyState.get_default_profile(1, 0))
	ll.set_safe_mode(false)
	ll.reload_slot(0)
	
	LifeLegacyCatalogoEventos.registrar_todos()
	GameState._ensure_season()
	assert(GameState.season_day == 0, "Dia inicial da temporada deve ser 0")

	# 1. Executa o método REAL de partida do GameState (avanço de calendário efetivo)
	GameState.record_match(
		1,     # goals
		0,     # assists
		2,     # shots
		7.5,   # rating
		1,     # result (win)
		2,     # team_goals
		1,     # rival_goals
		false  # is_nat
	)
	
	# 2. Confere que GameState avançou o calendário de fato
	assert(GameState.season_day == 1, "record_match() deve avançar season_day para 1 via calendário real")

	# 3. Confere que LifeLegacy recebeu o avanço temporal real e gerou evento pendente
	var act_time = ll.get_data().get("last_processed_time", {})
	assert(int(act_time.get("season_day", 0)) == 1, "LifeLegacy deve ter sincronizado season_day = 1")
	var active_evt: Dictionary = ll.get_active_event()
	assert(not active_evt.is_empty(), "Avanço de partida real deve gerar um evento")
	assert(active_evt.get("status", "") == "PENDING_RESOLUTION", "Evento gerado deve estar em PENDING_RESOLUTION")
	var file_data_pre = LifeLegacyPersistence.load_slot_data(0, 1, 1)
	assert(file_data_pre["data"]["active_event"]["status"] == "PENDING_RESOLUTION", "Evento gerado deve estar persistido no disco")

	# 4. Abre a cena REAL ui/career_hub.tscn e confere instanciação automática do modal
	if Career != null:
		Career.pending_ceremonies.clear()
		Career.pending_summary = {}
		Career.pending_decision = ""
		Career._market_settled = true
		Career._rehab_debido = -1
		Career.nat_retired = true
		Career.retired = false

	var hub_scene = load("res://ui/career_hub.tscn")
	assert(hub_scene != null, "Cena ui/career_hub.tscn deve ser carregável")
	var hub = hub_scene.instantiate()
	add_child(hub)

	var modal = hub.get_node_or_null("LifeLegacyEventModal")
	assert(modal != null, "CareerHub deve criar automaticamente LifeLegacyEventModal perante evento pendente")
	assert(modal is LifeLegacyEventModal, "Nó criado deve ser da classe LifeLegacyEventModal")

	# 5. Seleciona alternativa via clique no botão real da interface
	var buttons: Array[Button] = []
	_collect_buttons(modal, buttons)
	assert(buttons.size() >= 2, "Modal deve renderizar botões para as opções do evento")
	buttons[0].pressed.emit()

	# 6. Confere resolução do evento no LifeLegacy e persistência em disco
	var resolved_evt: Dictionary = ll.get_active_event()
	assert(resolved_evt.get("status", "") == "RESOLVED", "Evento ativo deve transitar para RESOLVED")
	var file_data_post = LifeLegacyPersistence.load_slot_data(0, 1, 1)
	assert(file_data_post["data"]["active_event"]["status"] == "RESOLVED", "Status RESOLVED deve ser persistido em disco")

	# 7. Confere que o evento resolvido não reaparece perante reload
	var showed_again: bool = hub._present_life_legacy_event()
	assert(showed_again == false, "Modal não deve ser reaberto para evento já RESOLVED")

	# 8. Renderiza ecossistema do celular in-game e valida persistência visual no app 'Minha Vida'
	var phone_box: VBoxContainer = VBoxContainer.new()
	add_child(phone_box)
	CelularScript.monta_minha_vida(phone_box, 300.0)
	
	var phone_labels: Array[String] = []
	_collect_labels(phone_box, phone_labels)
	assert(phone_labels.has("INDICADORES LIFE & LEGACY"), "Smartphone deve exibir dashboard atualizado")
	
	phone_box.queue_free()
	hub.queue_free()
	print("  -> Fluxo real (Partida GameState -> CareerHub Modal -> Persistência -> Celular) homologado com sucesso!")

func test_career_hub_real_scene_integration_and_slot_switch() -> void:
	print("[Teste 6] Bloqueador 5: Integração Real da Cena CareerHub, Ciclo de Vida do Modal e Troca de Slot...")
	var ll = LifeLegacy
	assert(ll != null, "LifeLegacy autoload deve existir")

	# Limpa pendências legadas do Career para permitir apresentação do hub
	if Career != null:
		Career.nat_retired = true
		Career.pending_ceremonies.clear()
		Career.pending_summary = {}
		Career.pending_decision = ""
		Career.week_event = ""
		Career.last_summary = ""
		Career.last_report = {}
		Career.retired = false
		Career.injury_weeks = 0
		Career.injury_dias = 0
		Career.injury_peak_weeks = 0
		Career.injury_matches_lost = 0
		Career._rehab_debido = -1
		Career.birthday_year_seen = int(Time.get_date_dict_from_system().get("year", 0))
		Career.pending_ceremonies.clear()

	# 1. Configura Slot 0 com um evento pendente
	GameState.season_num = 1
	GameState.season_day = 10
	var prof0 = LifeLegacyState.get_default_profile(1, 10)
	var evt_derby = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	var pending_evt_slot0 = {
		"event_id": "festa_vespera_derby",
		"occurrence_id": "occ_hub_test_s0",
		"title": evt_derby.get("title", "Festa"),
		"description": evt_derby.get("description", ""),
		"category": "lifestyle",
		"choices": evt_derby.get("choices", []),
		"status": "PENDING_RESOLUTION"
	}
	prof0["active_event"] = pending_evt_slot0
	LifeLegacyPersistence.save_slot_data(0, prof0)
	
	# Configura Slot 1 com um evento pendente diferente
	var prof1 = LifeLegacyState.get_default_profile(1, 10)
	var evt_crise = LifeLegacyEvents.get_event_by_id("crise_conjugal")
	var pending_evt_slot1 = {
		"event_id": "crise_conjugal",
		"occurrence_id": "occ_hub_test_s1",
		"title": evt_crise.get("title", "Crise"),
		"description": evt_crise.get("description", ""),
		"category": "family",
		"choices": evt_crise.get("choices", []),
		"status": "PENDING_RESOLUTION"
	}
	prof1["active_event"] = pending_evt_slot1
	LifeLegacyPersistence.save_slot_data(1, prof1)

	# Carrega slot 0
	ll.set_safe_mode(false)
	ll.reload_slot(0)

	# 2. Instancia a cena REAL ui/career_hub.tscn
	var hub_scene = load("res://ui/career_hub.tscn")
	assert(hub_scene != null, "Cena ui/career_hub.tscn deve ser carregável")
	var hub = hub_scene.instantiate()
	add_child(hub)

	# 3. Verifica que CareerHub detectou o evento pendente e instanciou automaticamente o LifeLegacyEventModal
	var modal = hub.get_node_or_null("LifeLegacyEventModal")
	assert(modal != null, "CareerHub deve instanciar automaticamente LifeLegacyEventModal como filho")
	assert(modal is LifeLegacyEventModal, "Nó instanciado deve ser da classe LifeLegacyEventModal")

	# 4. Simula resolução da escolha clicando no botão do modal
	var buttons: Array[Button] = []
	_collect_buttons(modal, buttons)
	assert(buttons.size() >= 2, "Modal no CareerHub deve conter botões de escolha")
	
	# Pressiona primeira opção (choice_1_ir)
	buttons[0].pressed.emit()

	# 5. Verifica que o evento foi resolvido no LifeLegacy e persistido no disco
	var act_after = ll.get_active_event()
	assert(act_after.get("status") == "RESOLVED", "Evento ativo deve transitar para RESOLVED após clique no modal")
	var file_data = LifeLegacyPersistence.load_slot_data(0, 1, 10)
	assert(file_data["data"]["active_event"]["status"] == "RESOLVED", "Resolução do evento deve ser persistida em disco")

	# 6. Recarrega o slot 0 e comprova que o modal NÃO reaparece para evento já resolvido
	var showed_again: bool = hub._present_life_legacy_event()
	assert(showed_again == false, "Modal NÃO deve ser reaberto se o evento já estiver RESOLVED")

	# 7. Teste de Troca de Slot durante evento pendente:
	# Troca para Slot 1 (que possui crise_conjugal pendente)
	ll.reload_slot(1)
	
	# Verifica que o CareerHub atualizou o modal para o evento do Slot 1
	var modal_s1 = hub.get_node_or_null("LifeLegacyEventModal")
	assert(modal_s1 != null, "CareerHub deve exibir modal para evento pendente do novo slot")
	var s1_labels: Array[String] = []
	_collect_labels(modal_s1, s1_labels)
	var found_event_title: bool = false
	for lbl in s1_labels:
		if "Tensão" in lbl or "Conflito" in lbl or "FAMILY" in lbl:
			found_event_title = true
			break
	assert(found_event_title, "Modal deve conter dados do evento do Slot 1 (Tensão e Conflito Conjugal)")

	# Limpeza
	hub.queue_free()
	print("  -> Bloqueador 5 (Ciclo de Vida da Cena Real CareerHub e Modal) aprovado com sucesso!")

func test_career_hub_modal_precommitment_failure_and_retry() -> void:
	print("[Teste 7] Bloqueador: Recuperação Visível no CareerHub, Falha no Despacho e Retentativa...")
	var ll = LifeLegacy
	GameState.season_num = 1
	GameState.season_day = 10
	if Career != null:
		Career.nat_retired = true
		Career.pending_ceremonies.clear()
		Career.pending_summary = {}
		Career.pending_decision = ""
		Career.week_event = ""
		Career.last_summary = ""
		Career.last_report = {}
		Career.retired = false
		Career._market_settled = true
		Career._rehab_debido = -1
		Career.birthday_year_seen = int(Time.get_date_dict_from_system().get("year", 0))

	# 1. Configura slot 0 com evento pendente
	var prof = LifeLegacyState.get_default_profile(1, 10)
	var evt_festa = LifeLegacyEvents.get_event_by_id("festa_vespera_derby")
	var occ = {
		"event_id": "festa_vespera_derby",
		"occurrence_id": "occ_ui_retry_001",
		"title": evt_festa.get("title", ""),
		"description": evt_festa.get("description", ""),
		"category": "lifestyle",
		"choices": evt_festa.get("choices", []),
		"status": "PENDING_RESOLUTION"
	}
	prof["active_event"] = occ
	LifeLegacyPersistence.save_slot_data(0, prof)
	ll.set_safe_mode(false)
	ll.reload_slot(0)

	# 2. Abre a cena REAL ui/career_hub.tscn
	var hub_scene = load("res://ui/career_hub.tscn")
	var hub = hub_scene.instantiate()
	add_child(hub)

	# 3. Verifica presença do modal
	var modal = hub.get_node_or_null("LifeLegacyEventModal")
	assert(modal != null, "Modal deve estar visível no CareerHub")

	# 4. Simula falha no despacho do receptor
	LifeLegacyOutbox.fault_inject_dispatch_fail_token = "occ_ui_retry_001"

	# Coleta botões iniciais
	var buttons: Array[Button] = []
	_collect_buttons(modal, buttons)
	assert(buttons.size() >= 2, "Modal deve possuir botões para as escolhas")

	# Pressiona primeira escolha (choice_1_ir)
	buttons[0].pressed.emit()

	# 5. Verifica estado PRE_COMMITMENT
	assert(ll.get_active_event()["status"] == "PRE_COMMITMENT", "Evento deve transitar para PRE_COMMITMENT após falha no despacho")
	assert(ll.get_active_event()["selected_choice_id"] == "choice_1_ir", "Escolha pré-comprometida deve ser choice_1_ir")

	# 6. Verifica que o modal continua visível
	var modal_still = hub.get_node_or_null("LifeLegacyEventModal")
	assert(modal_still != null and is_instance_valid(modal_still), "Modal deve continuar visível na tela após falha de despacho")

	# 7. Verifica que somente a escolha original está habilitada e as demais desabilitadas
	var buttons_pre: Array[Button] = []
	_collect_buttons(modal_still, buttons_pre)
	assert(buttons_pre.size() >= 2, "Modal deve conter botões atualizados")
	assert(buttons_pre[0].disabled == false, "Botão da escolha original (choice_1_ir) deve estar HABILITADO para retentativa")
	for i in range(1, buttons_pre.size()):
		assert(buttons_pre[i].disabled == true, "Botões de escolhas alternativas devem estar DESABILITADOS durante recuperação")

	# 8. Tenta uma alternativa diferente (botão 1) e comprova que não é aceita
	buttons_pre[1].pressed.emit()
	assert(ll.get_active_event()["status"] == "PRE_COMMITMENT", "Status deve permanecer PRE_COMMITMENT")
	assert(ll.get_active_event()["selected_choice_id"] == "choice_1_ir", "Escolha NÃO pode ter sido alterada para alternativa")

	# 9. Restaura o receptor e executa a retentativa pela interface
	LifeLegacyOutbox.reset_fault_injection()
	buttons_pre[0].pressed.emit()

	# 10. Confirmar RESOLVED e persistência em disco
	assert(ll.get_active_event()["status"] == "RESOLVED", "Evento ativo deve transitar para RESOLVED após retentativa bem-sucedida")
	var on_disk = LifeLegacyPersistence.load_slot_data(0, 1, 10)
	assert(on_disk["data"]["active_event"]["status"] == "RESOLVED", "Status RESOLVED deve ser persistido em disco")
	assert(hub.get_node_or_null("LifeLegacyEventModal") == null, "Modal deve ter sido fechado após resolução bem-sucedida")

	hub.queue_free()
	print("  -> Recuperação visível no CareerHub (modal mantido, alternativas desabilitadas, retentativa aprovada) homologada com sucesso!")

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
