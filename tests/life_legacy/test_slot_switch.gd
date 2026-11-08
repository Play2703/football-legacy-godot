extends Node

const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _ready() -> void:
	print("--- TEST: LifeLegacy Slot Switching & Signal Integration ---")
	
	var tree: SceneTree = get_tree()
	var root: Window = tree.root
	
	var ll = root.get_node_or_null("LifeLegacy")
	var ss = root.get_node_or_null("SaveSlots")
	
	assert(ll != null, "Autoload LifeLegacy não encontrado no SceneTree!")
	assert(ss != null, "Autoload SaveSlots não encontrado no SceneTree!")
	
	# Limpa slots de teste 0, 1 e 2
	_cleanup_slot(0)
	_cleanup_slot(1)
	_cleanup_slot(2)
	
	# Inicia no slot 1 (índice 0)
	print("Inicializando no slot 0...")
	ss.switch_to(0)
	assert(ll.get_current_slot() == 0, "LifeLegacy slot deve ser 0")
	
	var init_pop: float = ll.get_stat("popularity")
	assert(init_pop == 40.0, "Popularidade inicial deve ser 40.0")
	
	# Modifica indicador no slot 0
	print("Modificando indicador no slot 0...")
	var mod_ok: bool = ll.apply_stat_change("popularity", 25.0, "Entrevista de teste", "occ_test_01")
	assert(mod_ok == true, "apply_stat_change falhou")
	assert(ll.get_stat("popularity") == 65.0, "Popularidade deve ter mudado para 65.0")
	ll.save_current_slot()
	
	# Troca para slot 1 (índice 1)
	print("Trocando para slot 1...")
	ss.switch_to(1)
	assert(ll.get_current_slot() == 1, "LifeLegacy slot deve ser 1 após switch_to")
	# Slot 1 deve ter seu próprio perfil independente (40.0 inicial)
	assert(ll.get_stat("popularity") == 40.0, "Slot 1 deve ter perfil independente com 40.0")
	
	# Modifica slot 1 de forma diferente
	ll.apply_stat_change("popularity", -15.0, "Polêmica no slot 1", "occ_test_02")
	assert(ll.get_stat("popularity") == 25.0, "Slot 1 popularidade deve ser 25.0")
	ll.save_current_slot()
	
	# Retorna para slot 0
	print("Retornando para slot 0...")
	ss.switch_to(0)
	assert(ll.get_current_slot() == 0, "LifeLegacy slot deve ser 0 novamente")
	assert(ll.get_stat("popularity") == 65.0, "Slot 0 deve ter preservado popularidade 65.0")
	
	# Limpeza
	_cleanup_slot(0)
	_cleanup_slot(1)
	_cleanup_slot(2)
	
	print("[PASS] TESTE DE TROCA DE SLOTS E ISOLAMENTO APROVADO COM SUCESSO!")
	get_tree().quit(0)

func _cleanup_slot(slot_idx: int) -> void:
	var path: String = LifeLegacyPersistence.slot_file_path(slot_idx)
	for ext in ["", ".bak", ".tmp"]:
		var p: String = path + ext
		if FileAccess.file_exists(p):
			DirAccess.remove_absolute(p)
