extends SceneTree

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")
const LifeLegacyPersistence = preload("res://features/life_legacy/life_legacy_persistence.gd")

func _init() -> void:
	print("--- TEST: LifeLegacy Persistence Robustness & Failure Cases ---")
	
	var test_slot: int = 2 # Usar slot 2 para testes isolados
	var file_path: String = LifeLegacyPersistence.slot_file_path(test_slot)
	var bak_path: String = file_path + ".bak"
	var tmp_path: String = file_path + ".tmp"
	var bak_staging: String = file_path + ".bak_staging"
	
	# Limpeza inicial de segurança do slot 2
	_cleanup([file_path, bak_path, tmp_path, bak_staging])
	
	# CASO A: Arquivo inexistente e backup inexistente (save novo ou legado)
	print("[Teste 1] Caso A: Arquivo inexistente e criação de perfil novo...")
	var res_a: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_a["status"] == LifeLegacyPersistence.LoadStatus.OK_NEW_PROFILE, "Caso A falhou no status")
	assert(res_a["is_new_profile"] == true, "Caso A deve indicar is_new_profile = true")
	assert(res_a["is_safe_mode"] == false, "Caso A não deve entrar em safe mode")
	assert(FileAccess.file_exists(file_path), "Caso A deve criar o arquivo em disco")
	assert(res_a["data"]["schema_version"] == 1, "Caso A deve ter schema_version = 1")
	assert(res_a["data"]["stats"]["popularity"] == 40.0, "Caso A deve ter stats padrão")
	print("  -> Caso A aprovado!")
	
	# Teste de Gravação e Promoção Atômica
	print("[Teste 2] Gravação atômica e rotação de backup...")
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
	print("  -> Gravação e rotação de backup aprovadas!")
	
	# CASO B: Principal quebrado/corrompido, mas .bak íntegro
	print("[Teste 3] Caso B: Principal corrompido com backup íntegro...")
	var f_bad: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_bad.store_string("CORROMPIDO {{{ syntax error")
	f_bad.close()
	
	var res_b: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_b["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Caso B falhou ao recuperar .bak")
	assert(res_b["is_safe_mode"] == false, "Caso B recuperado não deve estar em safe mode")
	assert(res_b["data"]["stats"]["discipline"] == 85.0, "Caso B deve conter os dados do backup íntegro (85.0)")
	print("  -> Caso B aprovado!")
	
	# CASO C: Principal e backup ambos corrompidos
	print("[Teste 4] Caso C: Principal e backup corrompidos (Modo Seguro sem destruição)...")
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
	print("  -> Caso C aprovado!")
	
	# CASO D: Schema superior ao suportado (futuro)
	print("[Teste 5] Caso D: Schema de versão superior bloqueado...")
	_cleanup([file_path, bak_path, tmp_path])
	var future_data: Dictionary = LifeLegacyState.get_default_profile(1, 0)
	future_data["schema_version"] = 999
	var f_fut: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_fut.store_string(JSON.stringify(future_data))
	f_fut.close()
	
	var res_d: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_d["status"] == LifeLegacyPersistence.LoadStatus.ERR_FUTURE_SCHEMA_BLOCKED, "Caso D deve bloquear versão superior")
	assert(res_d["is_safe_mode"] == true, "Caso D deve entrar em modo seguro")
	print("  -> Caso D aprovado!")
	
	# CASO E: Falhas de I/O e Integridade em Etapas de Gravação
	print("[Teste 6] Testes de Falhas em Cada Etapa de Gravação...")
	
	# E.1: Validação de Schema inválido antes da escrita
	var invalid_schema_data = {"schema_version": 1, "incompleto": true}
	var save_fail_schema: bool = LifeLegacyPersistence.save_slot_data(test_slot, invalid_schema_data)
	assert(save_fail_schema == false, "save_slot_data deve falhar imediatamente se schema for inválido")
	
	# E.2: _promote_tmp com arquivo temporário inexistente
	var fail_promote: bool = LifeLegacyPersistence._promote_tmp(tmp_path + "_inexistente", file_path)
	assert(fail_promote == false, "_promote_tmp deve retornar false se arquivo temporário não existir")
	
	# E.3: Promoção atômica com arquivo principal existente e integridade do backup
	_cleanup([file_path, bak_path, tmp_path, bak_staging])
	var good_data = LifeLegacyState.get_default_profile(1, 0)
	good_data["stats"]["reputation"] = 77.0
	assert(LifeLegacyPersistence.save_slot_data(test_slot, good_data) == true, "Gravação 1 deve suceder")
	
	# Atualiza reputação para 88.0
	good_data["stats"]["reputation"] = 88.0
	assert(LifeLegacyPersistence.save_slot_data(test_slot, good_data) == true, "Gravação 2 deve suceder")
	
	# Verifica que principal tem 88.0 e backup tem 77.0
	var check_main = LifeLegacyPersistence._read_and_parse_json(file_path)
	var check_bak = LifeLegacyPersistence._read_and_parse_json(bak_path)
	assert(check_main["ok"] and check_main["data"]["stats"]["reputation"] == 88.0, "Principal deve ter 88.0")
	assert(check_bak["ok"] and check_bak["data"]["stats"]["reputation"] == 77.0, "Backup deve preservar 77.0")
	
	# E.4: Diferenciação de tipos de erro em _read_and_parse_json
	var err_missing = LifeLegacyPersistence._read_and_parse_json("user://slot3/inexistente.json")
	assert(err_missing["ok"] == false and err_missing["error_type"] == "file_not_found", "Deve reportar file_not_found")
	
	var err_corrupt_path = "user://slot3/corrupt_syntax.json"
	var f_corr = FileAccess.open(err_corrupt_path, FileAccess.WRITE)
	if f_corr != null:
		f_corr.store_string("{ nao eh json valido ...")
		f_corr.close()
		var err_json = LifeLegacyPersistence._read_and_parse_json(err_corrupt_path)
		assert(err_json["ok"] == false and err_json["error_type"] == "json_invalid", "Deve reportar json_invalid")
		DirAccess.remove_absolute(err_corrupt_path)
	
	# Limpeza final
	_cleanup([file_path, bak_path, tmp_path, bak_staging])
	print("[PASS] TODOS OS TESTES DE PERSISTÊNCIA E RESILIÊNCIA A FALHAS FORAM APROVADOS!")
	quit(0)

func _cleanup(paths: Array[String]) -> void:
	for p in paths:
		if FileAccess.file_exists(p):
			DirAccess.remove_absolute(p)
