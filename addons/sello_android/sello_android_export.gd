@tool
extends EditorExportPlugin




























const RUTA: String = "res://version_android.txt"


func _get_name() -> String:
	return "SelloAndroid"


func _supports_platform(platform: EditorExportPlatform) -> bool:
	return platform.get_os_name() == "Android"


func _export_begin(features: PackedStringArray, _is_debug: bool, _path: String,
		_flags: int) -> void:
	if not features.has("android"):
		return
	var code: String = code_del_preset(get_export_preset())


	if code == "":
		code = code_de_presets("res://export_presets.cfg")
	if code == "":
		push_error("SelloAndroid: no hay version/code en el preset; la telemetría de este"
			+ " .aab mandará el build de iOS (application/config/version)")
		return
	add_file(RUTA, sello(code), false)
	print("SelloAndroid: version/code %s estampado en %s" % [code, RUTA])



static func code_del_preset(preset: EditorExportPreset) -> String:
	if preset == null or not preset.has("version/code"):
		return ""
	return _valido(str(preset.get_or_env("version/code", "")))



static func code_de_presets(ruta: String) -> String:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(ruta) != OK:
		return ""
	for sec in cfg.get_sections():
		if sec.ends_with(".options") or str(cfg.get_value(sec, "platform", "")) != "Android":
			continue
		return _valido(str(cfg.get_value(sec + ".options", "version/code", "")))
	return ""



static func sello(code: String) -> PackedByteArray:
	return code.to_utf8_buffer()


static func _valido(s: String) -> String:
	s = s.strip_edges()
	return s if s.is_valid_int() and int(s) > 0 else ""
