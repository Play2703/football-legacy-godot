extends Node




































const CACHES: PackedStringArray = ["shader_cache", "vulkan"]



const SELLO: String = "user://cache_build.cfg"









const SELLO_ANDROID: String = "res://version_android.txt"





static var vacio: bool = false















static var t_init: int = -1
static var t_autoloads: int = -1













const ARRANQUE_OK: String = "user://arranque_ok"
const SEGUNDOS_OK: float = 5.0

func _init() -> void:

	t_init = Time.get_ticks_msec()
	var sello_txt: String = ""
	if OS.has_feature("android") and FileAccess.file_exists(SELLO_ANDROID):
		sello_txt = FileAccess.get_file_as_string(SELLO_ANDROID)
	var build: String = sello_de(OS.has_feature("android"), sello_txt,
		str(ProjectSettings.get_setting("application/config/version", "")))
	if build.is_empty():
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.load(SELLO)
	var previo: String = str(cfg.get_value("cache", "build", ""))
	if previo == build:
		return




	var tirar: PackedStringArray = caches_a_tirar(OS.has_feature("android"), _metodo_render())
	vacio = tirar.has("shader_cache")
	for nombre in tirar:
		_tirar(nombre)
	cfg.set_value("cache", "build", build)
	cfg.save(SELLO)


func _ready() -> void:
	_bootstrap_pack_v50()
	_marca_arranque_ok()


func _bootstrap_pack_v50() -> void:
	const PACK_RES: String = "res://assets/packs/pack_mundo_completo-v50.zip"
	if FileAccess.file_exists("user://team_edits.json") or not FileAccess.file_exists(PACK_RES):
		return
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path("user://packs"))
	var dst_zip: String = "user://packs/pack_mundo_completo-v50.zip"
	if PackImport.copiar_a(PACK_RES, dst_zip):
		var json_p: String = PackImport.unzip(dst_zip)
		if not json_p.is_empty():
			PackImport.import_file(json_p)


func _marca_arranque_ok() -> void:


	await (Engine.get_main_loop() as SceneTree).create_timer(SEGUNDOS_OK).timeout
	await get_tree().process_frame
	var f: FileAccess = FileAccess.open(ARRANQUE_OK, FileAccess.WRITE)
	if f != null:
		f.store_line("gd")






static func sello_de(es_android: bool, sello: String, config: String) -> String:
	var s: String = sello.strip_edges()
	if es_android and s.is_valid_int() and int(s) > 0:
		return config + "/a" + s
	return config

















static func caches_a_tirar(es_android: bool, metodo: String) -> PackedStringArray:
	if es_android and metodo == "gl_compatibility":
		var sin_gl: PackedStringArray = CACHES.duplicate()
		sin_gl.remove_at(sin_gl.find("shader_cache"))
		return sin_gl
	return CACHES






static func _metodo_render() -> String:
	var m: String = RenderingServer.get_current_rendering_method()
	if m.is_empty() and OS.has_feature("android"):
		m = str(ProjectSettings.get_setting("rendering/renderer/rendering_method.android", ""))
	return m










func _tirar(nombre: String) -> bool:
	if not CACHES.has(nombre):
		return false
	var ruta: String = "user://" + nombre
	if not DirAccess.dir_exists_absolute(ruta):
		return false
	_borra_rec(ruta)
	return true

















func _borra_rec(ruta: String) -> void:
	var d: DirAccess = DirAccess.open(ruta)
	if d == null:
		return
	d.list_dir_begin()
	var n: String = d.get_next()
	while not n.is_empty():
		var hijo: String = ruta.path_join(n)
		if d.current_is_dir():
			_borra_rec(hijo)
		else:
			DirAccess.remove_absolute(hijo)
		n = d.get_next()
	d.list_dir_end()
