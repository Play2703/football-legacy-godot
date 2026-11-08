class_name LifeLegacyPersistence
extends RefCounted

const LifeLegacyState = preload("res://features/life_legacy/life_legacy_state.gd")

const CURRENT_SUPPORTED_SCHEMA: int = 1
const FILE_NAME: String = "life_legacy.json"
const TMP_SUFFIX: String = ".tmp"
const BAK_SUFFIX: String = ".bak"

enum LoadStatus {
	OK_SUCCESS,
	OK_NEW_PROFILE,
	OK_RECOVERED_BACKUP,
	ERR_SAFE_MODE_CORRUPT,
	ERR_FUTURE_SCHEMA_BLOCKED,
	ERR_MIGRATION_FAILED
}

static func slot_dir(slot: int) -> String:
	return "user://slot%d/" % [clampi(slot, 0, 2) + 1]

static func slot_file_path(slot: int) -> String:
	return slot_dir(slot) + FILE_NAME

static func load_slot_data(slot: int, cur_season: int = 1, cur_day: int = 0) -> Dictionary:
	var path: String = slot_file_path(slot)
	var bak_path: String = path + BAK_SUFFIX
	var tmp_path: String = path + TMP_SUFFIX

	var main_exists: bool = FileAccess.file_exists(path)
	var bak_exists: bool = FileAccess.file_exists(bak_path)
	var tmp_exists: bool = FileAccess.file_exists(tmp_path)

	# CASO A: Arquivo principal inexistente e backup inexistente (save novo ou legado sem LifeLegacy)
	if not main_exists and not bak_exists:
		if tmp_exists:
			var parsed_tmp = _read_and_parse_json(tmp_path)
			if parsed_tmp is Dictionary and LifeLegacyState.validate_schema(parsed_tmp):
				_promote_tmp(tmp_path, path)
				return {
					"status": LoadStatus.OK_SUCCESS,
					"data": parsed_tmp,
					"is_safe_mode": false,
					"is_new_profile": false
				}
			else:
				DirAccess.remove_absolute(tmp_path)

		var new_data: Dictionary = LifeLegacyState.get_default_profile(cur_season, cur_day)
		save_slot_data(slot, new_data)
		return {
			"status": LoadStatus.OK_NEW_PROFILE,
			"data": new_data,
			"is_safe_mode": false,
			"is_new_profile": true
		}

	# Tentativa de carregar arquivo principal
	if main_exists:
		var parsed_main = _read_and_parse_json(path)
		if parsed_main is Dictionary:
			var schema_v: int = int(parsed_main.get("schema_version", 0))
			if schema_v == CURRENT_SUPPORTED_SCHEMA:
				if LifeLegacyState.validate_schema(parsed_main):
					return {
						"status": LoadStatus.OK_SUCCESS,
						"data": parsed_main,
						"is_safe_mode": false,
						"is_new_profile": false
					}
			elif schema_v > CURRENT_SUPPORTED_SCHEMA:
				push_error("[LifeLegacyPersistence] Schema superior (%d > %d). Bloqueando gravação (Modo Seguro)." % [schema_v, CURRENT_SUPPORTED_SCHEMA])
				return {
					"status": LoadStatus.ERR_FUTURE_SCHEMA_BLOCKED,
					"data": parsed_main,
					"is_safe_mode": true,
					"is_new_profile": false
				}
			elif schema_v < CURRENT_SUPPORTED_SCHEMA:
				var migrated: Dictionary = _migrate(parsed_main, schema_v, CURRENT_SUPPORTED_SCHEMA)
				if not migrated.is_empty() and LifeLegacyState.validate_schema(migrated):
					save_slot_data(slot, migrated)
					return {
						"status": LoadStatus.OK_SUCCESS,
						"data": migrated,
						"is_safe_mode": false,
						"is_new_profile": false
					}
				else:
					return {
						"status": LoadStatus.ERR_MIGRATION_FAILED,
						"data": parsed_main,
						"is_safe_mode": true,
						"is_new_profile": false
					}

	# CASO B: Principal quebrado ou inexistente, mas .bak existe e é válido
	if bak_exists:
		var parsed_bak = _read_and_parse_json(bak_path)
		if parsed_bak is Dictionary and LifeLegacyState.validate_schema(parsed_bak):
			push_warning("[LifeLegacyPersistence] Arquivo principal ilegível em slot %d. Recuperado com sucesso via backup .bak." % slot)
			save_slot_data(slot, parsed_bak)
			return {
				"status": LoadStatus.OK_RECOVERED_BACKUP,
				"data": parsed_bak,
				"is_safe_mode": false,
				"is_new_profile": false
			}

	# CASO C: Principal e backup quebrados/ilegíveis
	push_error("[LifeLegacyPersistence] Falha crítica de leitura no slot %d: principal e backup corrompidos. Ativando Modo Seguro sem sobrescrever." % slot)
	return {
		"status": LoadStatus.ERR_SAFE_MODE_CORRUPT,
		"data": {},
		"is_safe_mode": true,
		"is_new_profile": false
	}

static func save_slot_data(slot: int, data: Dictionary) -> bool:
	if not LifeLegacyState.validate_schema(data):
		push_error("[LifeLegacyPersistence] Validação de schema falhou antes da gravação. Abortando.")
		return false

	var path: String = slot_file_path(slot)
	var tmp_path: String = path + TMP_SUFFIX
	var bak_path: String = path + BAK_SUFFIX

	var dir: String = slot_dir(slot)
	if not DirAccess.dir_exists_absolute(dir):
		DirAccess.make_dir_recursive_absolute(dir)

	var text: String = JSON.stringify(data, "\t")
	var bytes: PackedByteArray = text.to_utf8_buffer()
	if bytes.is_empty():
		return false

	# 1. Escreve no temporário
	var f: FileAccess = FileAccess.open(tmp_path, FileAccess.WRITE)
	if f == null:
		push_error("[LifeLegacyPersistence] Não foi possível abrir %s para escrita." % tmp_path)
		return false
	f.store_buffer(bytes)
	f.close()

	# 2. Valida tamanho do temporário
	var r: FileAccess = FileAccess.open(tmp_path, FileAccess.READ)
	if r == null:
		DirAccess.remove_absolute(tmp_path)
		return false
	var read_len: int = r.get_length()
	r.close()
	if read_len != bytes.size():
		push_error("[LifeLegacyPersistence] Tamanho divergente no temporário (%d != %d). Abortando." % [read_len, bytes.size()])
		DirAccess.remove_absolute(tmp_path)
		return false

	# 3. Promove para backup se arquivo principal existir
	if FileAccess.file_exists(path):
		DirAccess.rename_absolute(path, bak_path)

	# 4. Promove temporário para principal
	var ok: bool = (DirAccess.rename_absolute(tmp_path, path) == OK)
	if not ok:
		push_error("[LifeLegacyPersistence] Falha ao promover %s para %s." % [tmp_path, path])
		return false

	return true

static func _promote_tmp(tmp: String, target: String) -> bool:
	return DirAccess.rename_absolute(tmp, target) == OK

static func _read_and_parse_json(file_path: String) -> Variant:
	if not FileAccess.file_exists(file_path):
		return null
	var f: FileAccess = FileAccess.open(file_path, FileAccess.READ)
	if f == null:
		return null
	var text: String = f.get_as_text()
	f.close()
	return JSON.parse_string(text)

static func _migrate(data: Dictionary, _from_v: int, to_v: int) -> Dictionary:
	var d: Dictionary = data.duplicate(true)
	d["schema_version"] = to_v
	return d
