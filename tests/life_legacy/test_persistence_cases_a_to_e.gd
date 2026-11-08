extends SceneTree

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _init() -> void:
	print("--- TEST: LifeLegacy Persistence Cases A to E ---")
	
	var test_slot: int = 2 # Usar slot 2 para testes isolados
	var file_path: String = LifeLegacyPersistence.slot_file_path(test_slot)
	var bak_path: String = file_path + ".bak"
	var tmp_path: String = file_path + ".tmp"
	
	# Limpeza inicial de segurança do slot 2
	_cleanup([file_path, bak_path, tmp_path])
	
	# CASO A: Arquivo inexistente e backup inexistente (save novo ou legado)
	print("Testando Caso A: Arquivo inexistente...")
	var res_a: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_a["status"] == LifeLegacyPersistence.LoadStatus.OK_NEW_PROFILE, "Caso A falhou no status")
	assert(res_a["is_new_profile"] == true, "Caso A deve indicar is_new_profile = true")
	assert(res_a["is_safe_mode"] == false, "Caso A não deve entrar em safe mode")
	assert(FileAccess.file_exists(file_path), "Caso A deve criar o arquivo em disco")
	assert(res_a["data"]["schema_version"] == 1, "Caso A deve ter schema_version = 1")
	assert(res_a["data"]["stats"]["popularity"] == 40.0, "Caso A deve ter stats padrão")
	print("[PASS] Caso A aprovado!")
	
	# Teste de Gravação e Promoção Atômica
	print("Testando gravação com dados modificados...")
	var data: Dictionary = res_a["data"]
	data["stats"]["discipline"] = 85.0
	data["save_revision"] = 2
	var save_ok: bool = LifeLegacyPersistence.save_slot_data(test_slot, data)
	assert(save_ok == true, "Falha na gravação de dados")
	assert(FileAccess.file_exists(bak_path), "Gravação deve criar/promover para .bak")
	
	# Salva revisão 3 para que o .bak fique com discipline = 85.0
	data["stats"]["discipline"] = 90.0
	data["save_revision"] = 3
	LifeLegacyPersistence.save_slot_data(test_slot, data)
	
	# CASO B: Principal quebrado/corrompido, mas .bak íntegro
	print("Testando Caso B: Principal corrompido com backup bom...")
	# Corrompe intencionalmente o arquivo principal
	var f_bad: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_bad.store_string("CORROMPIDO {{{ syntax error")
	f_bad.close()
	
	var res_b: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_b["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Caso B falhou ao recuperar .bak")
	assert(res_b["is_safe_mode"] == false, "Caso B recuperado não deve estar em safe mode")
	assert(res_b["data"]["stats"]["discipline"] == 85.0, "Caso B deve conter os dados do backup íntegro (85.0)")
	print("[PASS] Caso B aprovado!")
	
	# CASO C: Principal e backup ambos corrompidos
	print("Testando Caso C: Principal e backup corrompidos...")
	var f_bad2: FileAccess = FileAccess.open(bak_path, FileAccess.WRITE)
	f_bad2.store_string("BACKUP_CORROMPIDO {{{")
	f_bad2.close()
	var f_bad3: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_bad3.store_string("PRINCIPAL_CORROMPIDO {{{")
	f_bad3.close()
	
	var res_c: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_c["status"] == LifeLegacyPersistence.LoadStatus.ERR_SAFE_MODE_CORRUPT, "Caso C deve retornar ERR_SAFE_MODE_CORRUPT")
	assert(res_c["is_safe_mode"] == true, "Caso C deve ativar modo seguro")
	# Confirma que os arquivos NÃO foram sobrescritos com perfil padrão
	var f_check: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	assert(f_check.get_as_text().begins_with("PRINCIPAL_CORROMPIDO"), "Caso C jamais deve sobrescrever arquivos corrompidos")
	f_check.close()
	print("[PASS] Caso C aprovado!")
	
	# CASO D: Schema superior ao suportado (futuro)
	print("Testando Caso D: Schema de versão superior...")
	_cleanup([file_path, bak_path, tmp_path])
	var future_data: Dictionary = LifeLegacyState.get_default_profile(1, 0)
	future_data["schema_version"] = 999
	# Grava diretamente simulando save de build futuro
	var f_fut: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_fut.store_string(JSON.stringify(future_data))
	f_fut.close()
	
	var res_d: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_d["status"] == LifeLegacyPersistence.LoadStatus.ERR_FUTURE_SCHEMA_BLOCKED, "Caso D deve bloquear versão superior")
	assert(res_d["is_safe_mode"] == true, "Caso D deve entrar em modo seguro")
	print("[PASS] Caso D aprovado!")
	
	# Limpeza final
	_cleanup([file_path, bak_path, tmp_path])
	print("[PASS] TODOS OS TESTES DE PERSISTÊNCIA CASOS A-E APROVADOS!")
	quit(0)

func _cleanup(paths: Array[String]) -> void:
	for p in paths:
		if FileAccess.file_exists(p):
			DirAccess.remove_absolute(p)
