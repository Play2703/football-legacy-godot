extends RefCounted





var raiz := "res://tools"
var tapa_sh := "res://tools/tapa_salidas.sh"


var proyecto := "res://"



var _sin_tapar: Dictionary = {}




var _exports: PackedStringArray = []
var _exports_leidos := false




func revisa() -> PackedStringArray:
	var nuevas := false
	for d in DirAccess.get_directories_at(raiz):
		if not _sin_tapar.has(d) and not _tapada(d):
			nuevas = true
			break
	for e in _carpetas_export():
		if not _sin_tapar.has(e) and _destapada(e):
			nuevas = true
	if not nuevas:
		return PackedStringArray()
	var salida: Array = []
	var rc := OS.execute(ProjectSettings.globalize_path(tapa_sh),
		[ProjectSettings.globalize_path(proyecto)], salida)
	for d in DirAccess.get_directories_at(raiz):
		if not _tapada(d):
			_sin_tapar[d] = true
	for e in _carpetas_export():
		if _destapada(e):
			_sin_tapar[e] = true
	var texto := "\n".join(salida).strip_edges()
	if rc != 0:
		push_warning("tapa_salidas.sh salió con %d: %s" % [rc, texto])
		return PackedStringArray()
	if texto.is_empty():
		return PackedStringArray()
	return texto.split("\n", false)


func _tapada(d: String) -> bool:
	return FileAccess.file_exists("%s/%s/.gdignore" % [raiz, d])



func _destapada(ruta: String) -> bool:
	return DirAccess.dir_exists_absolute(ruta) and not FileAccess.file_exists(ruta.path_join(".gdignore"))


func _carpetas_export() -> PackedStringArray:
	if _exports_leidos:
		return _exports
	_exports_leidos = true
	var cfg := ConfigFile.new()
	if cfg.load(proyecto.path_join("export_presets.cfg")) != OK:
		return _exports
	for s in cfg.get_sections():
		var p := str(cfg.get_value(s, "export_path", ""))
		if p.ends_with(".xcodeproj"):
			var rel := p.trim_prefix("./").get_basename()
			_exports.append(rel if rel.begins_with("/") else proyecto.path_join(rel))
	return _exports
