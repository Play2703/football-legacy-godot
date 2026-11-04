class_name ToolStash
extends RefCounted












































const RAIZ: String = "user://_tool_stash"





static var _desvios: Dictionary = {}







static func activa(base: String) -> String:
	return String(_desvios.get(base, base))



static func apartada(base: String) -> bool:
	return _desvios.has(base)




static func desvia(base: String) -> void:
	if _desvios.has(base):
		return
	var destino: String = "%s/%d/%s" % [RAIZ, OS.get_process_id(), base.get_file()]



	_borra(destino)
	DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(destino.get_base_dir()))
	_desvios[base] = destino





static func devuelve(base: String) -> void:
	if not _desvios.has(base):
		return
	_borra(String(_desvios[base]))
	_desvios.erase(base)
	if _desvios.is_empty():



		DirAccess.remove_absolute(ProjectSettings.globalize_path(
			"%s/%d" % [RAIZ, OS.get_process_id()]))
		DirAccess.remove_absolute(ProjectSettings.globalize_path(RAIZ))





static func _borra(ruta: String) -> void:
	var abs: String = ProjectSettings.globalize_path(ruta)
	if FileAccess.file_exists(ruta):
		DirAccess.remove_absolute(abs)
		return
	var d: DirAccess = DirAccess.open(abs)
	if d == null:
		return
	for sub in d.get_directories():
		_borra("%s/%s" % [ruta, sub])
	for name in d.get_files():
		DirAccess.remove_absolute("%s/%s" % [abs, name])
	DirAccess.remove_absolute(abs)
