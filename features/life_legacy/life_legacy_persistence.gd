class_name LifeLegacyPersistence
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")

const CURRENT_SUPPORTED_SCHEMA: int = 2
const FILE_NAME: String = "life_legacy.json"
const TMP_SUFFIX: String = ".tmp"
const BAK_SUFFIX: String = ".bak"
const BAK_STAGING_SUFFIX: String = ".bak_staging"

enum LoadStatus {
	OK_SUCCESS,
	OK_NEW_PROFILE,
	OK_RECOVERED_BACKUP,
	WARN_RECOVERED_MEMORY_ONLY,
	ERR_SAFE_MODE_CORRUPT,
	ERR_FUTURE_SCHEMA_BLOCKED,
	ERR_MIGRATION_FAILED,
	ERR_FILE_NOT_FOUND,
	ERR_FILE_UNREADABLE,
	ERR_JSON_INVALID,
	ERR_SCHEMA_INCOMPATIBLE,
	ERR_IO_FAILURE
}

enum SaveStatus {
	OK,
	ERR_INVALID_SCHEMA,
	ERR_IO_WRITE,
	ERR_READ_VALIDATION,
	ERR_ROTATE_STAGING,
	ERR_PROMOTE_MAIN,
	WARN_BACKUP_CONSOLIDATION_FAILED
}

static var last_save_status: SaveStatus = SaveStatus.OK

# --- Hooks controláveis para injeção de falhas em testes de I/O ---
static var fault_inject_open_write: bool = false
static var fault_inject_write_truncate: bool = false
static var fault_inject_read_validation: bool = false
static var fault_inject_rotate_staging: bool = false
static var fault_inject_promote: bool = false
static var fault_inject_restore_backup_save: bool = false
static var fault_inject_remove_old_bak: bool = false
static var fault_inject_promote_staging_bak: bool = false
static var fault_inject_rollback_fail: bool = false

static func reset_fault_injection() -> void:
	fault_inject_open_write = false
	fault_inject_write_truncate = false
	fault_inject_read_validation = false
	fault_inject_rotate_staging = false
	fault_inject_promote = false
	fault_inject_restore_backup_save = false
	fault_inject_remove_old_bak = false
	fault_inject_promote_staging_bak = false
	fault_inject_rollback_fail = false
	last_save_status = SaveStatus.OK

static func slot_dir(slot: int) -> String:
	return "user://slot%d/" % [clampi(slot, 0, 2) + 1]

static func slot_file_path(slot: int) -> String:
	return slot_dir(slot) + FILE_NAME

static func load_slot_data(slot: int, cur_season: int = 1, cur_day: int = 0) -> Dictionary:
	var path: String = slot_file_path(slot)
	var bak_path: String = path + BAK_SUFFIX
	var tmp_path: String = path + TMP_SUFFIX
	var bak_staging: String = path + BAK_STAGING_SUFFIX

	var main_exists: bool = FileAccess.file_exists(path)
	var bak_exists: bool = FileAccess.file_exists(bak_path)
	var tmp_exists: bool = FileAccess.file_exists(tmp_path)
	var staging_exists: bool = FileAccess.file_exists(bak_staging)

	# CASO A: Arquivo principal inexistente, backup inexistente e staging inexistente (save novo ou legado)
	if not main_exists and not bak_exists and not staging_exists:
		if tmp_exists:
			var res_tmp = _read_and_parse_json(tmp_path)
			if res_tmp.get("ok", false) and res_tmp.get("data") is Dictionary and LifeLegacyState.validate_schema(res_tmp["data"]):
				var tmp_data: Dictionary = res_tmp["data"]
				var tmp_schema: int = int(tmp_data.get("schema_version", 0))
				if tmp_schema < CURRENT_SUPPORTED_SCHEMA:
					tmp_data = _migrate(tmp_data, tmp_schema, CURRENT_SUPPORTED_SCHEMA)
				var p_ok: bool = _promote_tmp(tmp_path, path)
				if p_ok:
					var mig_persisted: bool = true
					if tmp_schema < CURRENT_SUPPORTED_SCHEMA:
						mig_persisted = save_slot_data(slot, tmp_data)
					return {
						"status": LoadStatus.OK_SUCCESS if mig_persisted else LoadStatus.ERR_IO_FAILURE,
						"error_type": "" if mig_persisted else "io_failure",
						"data": tmp_data,
						"is_safe_mode": not mig_persisted,
						"is_persisted": mig_persisted,
						"is_new_profile": false
					}
				else:
					push_error("[LifeLegacyPersistence] Falha ao promover .tmp órfão válido. Bloqueando gravação (Modo Seguro).")
					return {
						"status": LoadStatus.ERR_IO_FAILURE,
						"error_type": "io_failure",
						"data": tmp_data,
						"is_safe_mode": true,
						"is_persisted": false,
						"is_new_profile": false
					}
			else:
				DirAccess.remove_absolute(tmp_path)

		var new_data: Dictionary = LifeLegacyState.get_default_profile(cur_season, cur_day)
		var save_ok: bool = save_slot_data(slot, new_data)
		if not save_ok:
			push_error("[LifeLegacyPersistence] Falha ao persistir perfil inicial no slot %d. Ativando Modo Seguro." % slot)
			return {
				"status": LoadStatus.ERR_SAFE_MODE_CORRUPT,
				"error_type": "io_failure",
				"data": {},
				"is_safe_mode": true,
				"is_persisted": false,
				"is_new_profile": true
			}
		return {
			"status": LoadStatus.OK_NEW_PROFILE,
			"error_type": "",
			"data": new_data,
			"is_safe_mode": false,
			"is_persisted": true,
			"is_new_profile": true
		}

	# Tentativa de carregar arquivo principal
	if main_exists:
		var res_main = _read_and_parse_json(path)
		if res_main.get("ok", false) and res_main.get("data") is Dictionary:
			var parsed_main: Dictionary = res_main["data"]
			var schema_v: int = int(parsed_main.get("schema_version", 0))
			if schema_v == CURRENT_SUPPORTED_SCHEMA:
				if LifeLegacyState.validate_schema(parsed_main):
					return {
						"status": LoadStatus.OK_SUCCESS,
						"error_type": "",
						"data": parsed_main,
						"is_safe_mode": false,
						"is_persisted": true,
						"is_new_profile": false
					}
				else:
					push_error("[LifeLegacyPersistence] Schema inválido no arquivo principal do slot %d." % slot)
			elif schema_v > CURRENT_SUPPORTED_SCHEMA:
				push_error("[LifeLegacyPersistence] Schema superior (%d > %d). Bloqueando gravação (Modo Seguro)." % [schema_v, CURRENT_SUPPORTED_SCHEMA])
				return {
					"status": LoadStatus.ERR_FUTURE_SCHEMA_BLOCKED,
					"error_type": "future_schema",
					"data": parsed_main,
					"is_safe_mode": true,
					"is_persisted": false,
					"is_new_profile": false
				}
			elif schema_v < CURRENT_SUPPORTED_SCHEMA:
				var migrated: Dictionary = _migrate(parsed_main, schema_v, CURRENT_SUPPORTED_SCHEMA)
				if not migrated.is_empty() and LifeLegacyState.validate_schema(migrated):
					var mig_saved: bool = save_slot_data(slot, migrated)
					return {
						"status": LoadStatus.OK_SUCCESS if mig_saved else LoadStatus.ERR_IO_FAILURE,
						"error_type": "" if mig_saved else "io_failure",
						"data": migrated,
						"is_safe_mode": not mig_saved,
						"is_persisted": mig_saved,
						"is_new_profile": false
					}
				else:
					return {
						"status": LoadStatus.ERR_MIGRATION_FAILED,
						"error_type": "migration_failed",
						"data": parsed_main,
						"is_safe_mode": true,
						"is_persisted": false,
						"is_new_profile": false
					}

	# CASO B: Principal quebrado ou inexistente, mas .bak_staging ou .bak existe e é válido
	# Prioridade rigorosa para .bak_staging (versão mais recente em caso de falha de promoção/rollback)
	var bak_to_use: String = ""
	var bak_source: String = ""
	if FileAccess.file_exists(bak_staging):
		var res_staging = _read_and_parse_json(bak_staging)
		if res_staging.get("ok", false) and res_staging.get("data") is Dictionary and LifeLegacyState.validate_schema(res_staging["data"]):
			bak_to_use = bak_staging
			bak_source = "staging .bak_staging"

	if bak_to_use.is_empty() and bak_exists:
		var res_bak = _read_and_parse_json(bak_path)
		if res_bak.get("ok", false) and res_bak.get("data") is Dictionary and LifeLegacyState.validate_schema(res_bak["data"]):
			bak_to_use = bak_path
			bak_source = "backup .bak"

	if not bak_to_use.is_empty():
		var res_rec = _read_and_parse_json(bak_to_use)
		push_warning("[LifeLegacyPersistence] Arquivo principal ilegível em slot %d. Recuperando via %s..." % [slot, bak_source])
		var rec_data: Dictionary = res_rec["data"]
		var rec_schema: int = int(rec_data.get("schema_version", 0))
		if rec_schema < CURRENT_SUPPORTED_SCHEMA:
			rec_data = _migrate(rec_data, rec_schema, CURRENT_SUPPORTED_SCHEMA)
		var restore_ok: bool = false
		if not fault_inject_restore_backup_save:
			# Regrava principal a partir do backup preservando o arquivo original de recuperação
			restore_ok = save_slot_data(slot, rec_data, false)
		if restore_ok:
			return {
				"status": LoadStatus.OK_RECOVERED_BACKUP,
				"error_type": "",
				"data": rec_data,
				"is_safe_mode": false,
				"is_persisted": true,
				"is_new_profile": false
			}
		else:
			push_error("[LifeLegacyPersistence] Falha ao regravar principal a partir de %s. Retornando dados em memória sob Modo Seguro." % bak_source)
			return {
				"status": LoadStatus.WARN_RECOVERED_MEMORY_ONLY,
				"error_type": "restore_write_failed",
				"data": rec_data,
				"is_safe_mode": true,
				"is_persisted": false,
				"is_new_profile": false
			}

	# CASO C: Principal e backups quebrados/ilegíveis
	push_error("[LifeLegacyPersistence] Falha crítica de leitura no slot %d: principal e backup corrompidos. Ativando Modo Seguro sem sobrescrever." % slot)
	return {
		"status": LoadStatus.ERR_SAFE_MODE_CORRUPT,
		"error_type": "corrupt_files",
		"data": {},
		"is_safe_mode": true,
		"is_persisted": false,
		"is_new_profile": false
	}

static func save_slot_data(slot: int, data: Dictionary, rotate_backup: bool = true) -> bool:
	if not LifeLegacyState.validate_schema(data):
		last_save_status = SaveStatus.ERR_INVALID_SCHEMA
		push_error("[LifeLegacyPersistence] Validação de schema falhou antes da gravação. Abortando.")
		return false

	var path: String = slot_file_path(slot)
	var tmp_path: String = path + TMP_SUFFIX
	var bak_path: String = path + BAK_SUFFIX
	var bak_staging: String = path + BAK_STAGING_SUFFIX

	var dir: String = slot_dir(slot)
	if not DirAccess.dir_exists_absolute(dir):
		var mkdir_err: Error = DirAccess.make_dir_recursive_absolute(dir)
		if mkdir_err != OK:
			last_save_status = SaveStatus.ERR_IO_WRITE
			push_error("[LifeLegacyPersistence] Falha ao criar diretório %s (código %d)." % [dir, mkdir_err])
			return false

	var text: String = JSON.stringify(data, "\t")
	var bytes: PackedByteArray = text.to_utf8_buffer()
	if bytes.is_empty():
		last_save_status = SaveStatus.ERR_IO_WRITE
		push_error("[LifeLegacyPersistence] Buffer de gravação vazio.")
		return false

	# 1. Escreve no temporário
	if fault_inject_open_write:
		last_save_status = SaveStatus.ERR_IO_WRITE
		push_error("[LifeLegacyPersistence] [FaultInjection] Falha simulada ao abrir %s para escrita." % tmp_path)
		return false

	var f: FileAccess = FileAccess.open(tmp_path, FileAccess.WRITE)
	if f == null:
		last_save_status = SaveStatus.ERR_IO_WRITE
		var open_err: Error = FileAccess.get_open_error()
		push_error("[LifeLegacyPersistence] Não foi possível abrir %s para escrita (código %d)." % [tmp_path, open_err])
		return false
	if fault_inject_write_truncate:
		f.store_buffer(bytes.slice(0, maxi(1, bytes.size() / 2)))
	else:
		f.store_buffer(bytes)
	f.close()

	# 2. Valida tamanho do temporário
	var r: FileAccess = FileAccess.open(tmp_path, FileAccess.READ)
	if r == null:
		last_save_status = SaveStatus.ERR_READ_VALIDATION
		DirAccess.remove_absolute(tmp_path)
		return false
	var read_len: int = r.get_length()
	r.close()
	if fault_inject_read_validation or read_len != bytes.size():
		last_save_status = SaveStatus.ERR_READ_VALIDATION
		push_error("[LifeLegacyPersistence] Tamanho divergente no temporário (%d != %d) ou falha induzida de validação. Abortando." % [read_len, bytes.size()])
		DirAccess.remove_absolute(tmp_path)
		return false

	# 3. Rotação do principal existente para staging de backup
	var main_had_file: bool = FileAccess.file_exists(path) and rotate_backup
	if main_had_file:
		if FileAccess.file_exists(bak_staging):
			DirAccess.remove_absolute(bak_staging)
		var r_err: Error = OK
		if fault_inject_rotate_staging:
			r_err = FAILED
		else:
			r_err = DirAccess.rename_absolute(path, bak_staging)
		if r_err != OK:
			last_save_status = SaveStatus.ERR_ROTATE_STAGING
			push_error("[LifeLegacyPersistence] Falha ao rotacionar principal para staging (%d). Abortando sem tocar no backup existente." % r_err)
			DirAccess.remove_absolute(tmp_path)
			return false

	# 4. Promove temporário para principal
	var p_ok: bool = false
	if not fault_inject_promote:
		p_ok = _promote_tmp(tmp_path, path)
	if not p_ok:
		last_save_status = SaveStatus.ERR_PROMOTE_MAIN
		push_error("[LifeLegacyPersistence] Falha ao promover %s para %s." % [tmp_path, path])
		# Rollback: se moveu o principal para staging, restaura de volta preservando o único arquivo válido
		if main_had_file and FileAccess.file_exists(bak_staging):
			var roll_err: Error = OK
			if fault_inject_rollback_fail:
				roll_err = FAILED
			else:
				roll_err = DirAccess.rename_absolute(bak_staging, path)
			if roll_err != OK:
				push_error("[LifeLegacyPersistence] Falha crítica de rollback de staging para principal (%d). Staging preservado para recuperação." % roll_err)
		if FileAccess.file_exists(tmp_path):
			DirAccess.remove_absolute(tmp_path)
		return false

	# 5. Promoção bem-sucedida! Finaliza backup definitivo se havia staging
	if main_had_file and FileAccess.file_exists(bak_staging):
		var remove_bak_ok: bool = true
		if FileAccess.file_exists(bak_path):
			var rem_err: Error = FAILED if fault_inject_remove_old_bak else DirAccess.remove_absolute(bak_path)
			if rem_err != OK:
				remove_bak_ok = false
				push_warning("[LifeLegacyPersistence] Falha ao remover backup anterior %s (%d). Preservando staging no disco." % [bak_path, rem_err])
		
		var b_err: Error = OK
		if remove_bak_ok:
			if fault_inject_promote_staging_bak:
				b_err = FAILED
			else:
				b_err = DirAccess.rename_absolute(bak_staging, bak_path)
		else:
			b_err = FAILED

		if b_err != OK:
			last_save_status = SaveStatus.WARN_BACKUP_CONSOLIDATION_FAILED
			push_warning("[LifeLegacyPersistence] Falha na consolidação completa do backup (%d). Arquivo principal gravado com sucesso, staging preservado para recuperação." % b_err)
			return true

	last_save_status = SaveStatus.OK
	return true

static func _promote_tmp(tmp: String, target: String) -> bool:
	if not FileAccess.file_exists(tmp):
		push_error("[LifeLegacyPersistence] _promote_tmp: arquivo temporário %s não existe." % tmp)
		return false
	if FileAccess.file_exists(target):
		DirAccess.remove_absolute(target)
	var err: Error = DirAccess.rename_absolute(tmp, target)
	if err != OK:
		push_error("[LifeLegacyPersistence] _promote_tmp: rename_absolute falhou (%s -> %s) com erro %d." % [tmp, target, err])
		return false
	return true

static func _read_and_parse_json(file_path: String) -> Dictionary:
	if not FileAccess.file_exists(file_path):
		return {"ok": false, "error_type": "file_not_found", "data": null}
	var f: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	if f == null:
		var open_err: Error = FileAccess.get_open_error()
		push_error("[LifeLegacyPersistence] Falha ao abrir %s para leitura (código %d)." % [file_path, open_err])
		return {"ok": false, "error_type": "unreadable", "data": null, "code": open_err}
	var text: String = f.get_as_text()
	f.close()
	var parsed: Variant = JSON.parse_string(text)
	if parsed == null and text.strip_edges() != "null":
		return {"ok": false, "error_type": "json_invalid", "data": null}
	if not (parsed is Dictionary):
		return {"ok": false, "error_type": "json_invalid", "data": null}
	return {"ok": true, "error_type": "", "data": parsed}

static func _migrate(data: Dictionary, from_v: int, to_v: int) -> Dictionary:
	var d: Dictionary = data.duplicate(true)
	if from_v < 2 and to_v >= 2:
		if not d.has("active_modifiers") or not (d["active_modifiers"] is Array):
			d["active_modifiers"] = []
		if not d.has("story_arcs") or not (d["story_arcs"] is Dictionary):
			d["story_arcs"] = {
				"active_arcs": {},
				"completed_arcs": []
			}
		else:
			if not d["story_arcs"].has("active_arcs") or not (d["story_arcs"]["active_arcs"] is Dictionary):
				d["story_arcs"]["active_arcs"] = {}
			if not d["story_arcs"].has("completed_arcs") or not (d["story_arcs"]["completed_arcs"] is Array):
				d["story_arcs"]["completed_arcs"] = []
		if not d.has("total_ticks_processed"):
			d["total_ticks_processed"] = 0
	d["schema_version"] = to_v
	return d
