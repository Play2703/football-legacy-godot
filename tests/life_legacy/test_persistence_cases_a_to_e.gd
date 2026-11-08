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
	assert(res_a["data"]["schema_version"] == LifeLegacyPersistence.CURRENT_SUPPORTED_SCHEMA, "Caso A deve ter schema_version suportado")
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
	
	# B.1: Recuperação com sucesso de regravação
	var res_b: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_b["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Caso B falhou ao recuperar .bak")
	assert(res_b["is_safe_mode"] == false, "Caso B recuperado não deve estar em safe mode")
	assert(res_b["is_persisted"] == true, "Caso B recuperado deve ter is_persisted = true")
	assert(res_b["data"]["stats"]["discipline"] == 85.0, "Caso B deve conter os dados do backup íntegro (85.0)")
	print("  -> Caso B (sucesso de regravação) aprovado!")

	# B.2: Bloqueador 1 - Falha ao regravar principal a partir do backup .bak
	print("[Teste 3.2] Bloqueador 1: Falha na regravação do .bak -> WARN_RECOVERED_MEMORY_ONLY...")
	var f_bad_re: FileAccess = FileAccess.open(file_path, FileAccess.WRITE)
	f_bad_re.store_string("CORROMPIDO_NOVAMENTE {{{")
	f_bad_re.close()
	
	LifeLegacyPersistence.fault_inject_restore_backup_save = true
	var res_b_mem: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_b_mem["status"] == LifeLegacyPersistence.LoadStatus.WARN_RECOVERED_MEMORY_ONLY, "Deve retornar WARN_RECOVERED_MEMORY_ONLY")
	assert(res_b_mem["is_safe_mode"] == true, "Deve ativar is_safe_mode quando regravação falha")
	assert(res_b_mem["is_persisted"] == false, "Deve indicar is_persisted = false")
	assert(res_b_mem["data"]["stats"]["discipline"] == 85.0, "Dados em memória devem ser recuperados do .bak")
	assert(FileAccess.file_exists(bak_path), "O arquivo .bak deve permanecer intacto no disco")
	var f_check_bad: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	assert(f_check_bad.get_as_text().begins_with("CORROMPIDO_NOVAMENTE"), "Principal não deve ser destruído se regravação falhou")
	f_check_bad.close()
	LifeLegacyPersistence.reset_fault_injection()

	# Restauração limpa subsequente sem falha injetada
	var res_b_retry: Dictionary = LifeLegacyPersistence.load_slot_data(test_slot, 1, 0)
	assert(res_b_retry["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Retry deve ter sucesso")
	assert(res_b_retry["is_safe_mode"] == false, "Retry não deve estar em safe mode")
	assert(res_b_retry["is_persisted"] == true, "Retry deve ter is_persisted = true")
	print("  -> Bloqueador 1 (WARN_RECOVERED_MEMORY_ONLY) aprovado com sucesso!")
	
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

	# E.5: Bloqueador 4 - Injeção de Falha: Abertura para escrita
	print("[Teste 6.5] Injeção de falha ao abrir arquivo temporário para escrita...")
	LifeLegacyPersistence.fault_inject_open_write = true
	var fail_open = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(fail_open == false, "save_slot_data deve falhar se open_write falhar")
	assert(not FileAccess.file_exists(tmp_path), "Arquivo temporário não deve restar")
	LifeLegacyPersistence.reset_fault_injection()

	# E.6: Bloqueador 4 - Injeção de Falha: Truncamento no buffer temporário
	print("[Teste 6.6] Injeção de falha de truncamento de buffer temporário...")
	LifeLegacyPersistence.fault_inject_write_truncate = true
	var fail_trunc = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(fail_trunc == false, "save_slot_data deve falhar se buffer for truncado")
	assert(not FileAccess.file_exists(tmp_path), "Temporário truncado deve ser deletado")
	LifeLegacyPersistence.reset_fault_injection()

	# E.7: Bloqueador 4 - Injeção de Falha: Validação de leitura pós-escrita
	print("[Teste 6.7] Injeção de falha na validação de leitura do temporário...")
	LifeLegacyPersistence.fault_inject_read_validation = true
	var fail_val = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(fail_val == false, "save_slot_data deve falhar na validação de leitura")
	assert(not FileAccess.file_exists(tmp_path), "Temporário inválido deve ser deletado")
	LifeLegacyPersistence.reset_fault_injection()

	# E.8: Bloqueador 4 - Injeção de Falha: Rotação para staging de backup
	print("[Teste 6.8] Injeção de falha na rotação do principal para staging...")
	var pre_rot_data = LifeLegacyPersistence._read_and_parse_json(file_path)["data"]
	LifeLegacyPersistence.fault_inject_rotate_staging = true
	var fail_rot = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(fail_rot == false, "save_slot_data deve falhar se rotação de staging falhar")
	var post_rot_data = LifeLegacyPersistence._read_and_parse_json(file_path)["data"]
	assert(post_rot_data["save_revision"] == pre_rot_data["save_revision"], "Principal não deve ser alterado se rotação falhar")
	assert(not FileAccess.file_exists(bak_staging), "Staging não deve restar")
	assert(not FileAccess.file_exists(tmp_path), "Temporário não deve restar")
	LifeLegacyPersistence.reset_fault_injection()

	# E.9: Bloqueador 4 - Injeção de Falha: Promoção com Rollback Automático
	print("[Teste 6.9] Injeção de falha na promoção atômica com rollback automático...")
	var saved_data_rev = LifeLegacyPersistence._read_and_parse_json(file_path)["data"]
	var orig_rep: float = float(saved_data_rev["stats"]["reputation"])
	var candidate_data = saved_data_rev.duplicate(true)
	candidate_data["stats"]["reputation"] = 999.0
	candidate_data["save_revision"] = int(candidate_data.get("save_revision", 0)) + 1
	
	LifeLegacyPersistence.fault_inject_promote = true
	var fail_prom = LifeLegacyPersistence.save_slot_data(test_slot, candidate_data)
	assert(fail_prom == false, "save_slot_data deve retornar false se _promote falhar")
	
	# Verifica que o rollback restaurou o principal a partir do staging
	var rolled_back = LifeLegacyPersistence._read_and_parse_json(file_path)["data"]
	assert(rolled_back["stats"]["reputation"] == orig_rep, "Rollback deve restaurar o principal intacto!")
	assert(rolled_back["save_revision"] == saved_data_rev["save_revision"], "Revisão deve ser a original após rollback")
	assert(not FileAccess.file_exists(bak_staging), "Staging deve ser consumido pelo rollback")
	assert(not FileAccess.file_exists(tmp_path), "Temporário deve ser removido após falha de promoção")
	LifeLegacyPersistence.reset_fault_injection()
	print("  -> Rollback automático na falha de promoção comprovado com sucesso!")

	# E.10: Injeção de falha ao remover backup antigo
	print("[Teste 6.10] Injeção de falha ao remover backup antigo...")
	LifeLegacyPersistence.fault_inject_remove_old_bak = true
	var ok_save_old_bak = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(ok_save_old_bak == true, "Gravação principal deve suceder mesmo com falha no descarte do backup antigo")
	assert(LifeLegacyPersistence.last_save_status == LifeLegacyPersistence.SaveStatus.WARN_BACKUP_CONSOLIDATION_FAILED, "Status deve alertar sobre falha na consolidação do backup")
	assert(FileAccess.file_exists(bak_staging), "Staging deve ser preservado como backup alternativo")
	LifeLegacyPersistence.reset_fault_injection()
	print("  -> Preservação de staging na falha de descarte do backup antigo comprovada!")

	# E.11: Injeção de falha ao promover staging para backup definitivo
	print("[Teste 6.11] Injeção de falha ao promover staging para backup definitivo...")
	LifeLegacyPersistence.fault_inject_promote_staging_bak = true
	var ok_save_prom_bak = LifeLegacyPersistence.save_slot_data(test_slot, good_data)
	assert(ok_save_prom_bak == true, "Gravação principal sucede")
	assert(LifeLegacyPersistence.last_save_status == LifeLegacyPersistence.SaveStatus.WARN_BACKUP_CONSOLIDATION_FAILED, "Status deve ser WARN_BACKUP_CONSOLIDATION_FAILED")
	assert(FileAccess.file_exists(bak_staging), "Staging deve ser mantido no disco para recuperação")
	LifeLegacyPersistence.reset_fault_injection()
	print("  -> Preservação de staging na falha de promoção do backup comprovada!")

	# E.12: Prioridade de recuperação do .bak_staging sobre .bak mais antigo
	print("[Teste 6.12] Prioridade de recuperação do staging sobre .bak e fallback quando staging corrompido...")
	_cleanup([file_path, bak_path, tmp_path, bak_staging])

	var data_rev1 = LifeLegacyState.get_default_profile(1, 10)
	data_rev1["save_revision"] = 1
	var data_rev2 = LifeLegacyState.get_default_profile(1, 10)
	data_rev2["save_revision"] = 2

	# Grava .bak com revision 1 e .bak_staging com revision 2
	var f_bak = FileAccess.open(bak_path, FileAccess.WRITE)
	f_bak.store_string(JSON.stringify(data_rev1))
	f_bak.close()

	var f_stg = FileAccess.open(bak_staging, FileAccess.WRITE)
	f_stg.store_string(JSON.stringify(data_rev2))
	f_stg.close()

	# Garante que arquivo principal e .tmp estão ausentes
	assert(not FileAccess.file_exists(file_path), "Principal deve estar ausente")
	assert(not FileAccess.file_exists(tmp_path), "Tmp deve estar ausente")

	# Recuperação deve selecionar .bak_staging (revision 2) prioritariamente
	var rec_stg = LifeLegacyPersistence.load_slot_data(test_slot, 1, 10)
	assert(rec_stg["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação deve suceder via backup")
	assert(rec_stg["data"]["save_revision"] == 2, "load_slot_data deve priorizar staging com save_revision = 2")
	assert(FileAccess.file_exists(bak_path), ".bak da revisão 1 NÃO pode ter sido destruído")
	assert(FileAccess.file_exists(file_path), "Arquivo principal deve ter sido restaurado com a revisão 2")

	# Caso complementar: staging corrompido e .bak permanece válido -> fallback para .bak
	DirAccess.remove_absolute(file_path)
	var f_stg_bad = FileAccess.open(bak_staging, FileAccess.WRITE)
	f_stg_bad.store_string("{corrompido: true,")
	f_stg_bad.close()

	var rec_fallback = LifeLegacyPersistence.load_slot_data(test_slot, 1, 10)
	assert(rec_fallback["status"] == LifeLegacyPersistence.LoadStatus.OK_RECOVERED_BACKUP, "Recuperação deve suceder via fallback para .bak")
	assert(rec_fallback["data"]["save_revision"] == 1, "load_slot_data deve recuperar revisão 1 do .bak íntegro")
	assert(FileAccess.file_exists(file_path), "Arquivo principal restaurado com revisão 1")
	print("  -> Prioridade de staging e fallback para .bak comprovados com sucesso absoluto!")
	
	# Limpeza final
	_cleanup([file_path, bak_path, tmp_path, bak_staging])
	print("[PASS] TODOS OS TESTES DE PERSISTÊNCIA E RESILIÊNCIA A FALHAS FORAM APROVADOS!")
	quit(0)

func _cleanup(paths: Array[String]) -> void:
	for p in paths:
		if FileAccess.file_exists(p):
			DirAccess.remove_absolute(p)
