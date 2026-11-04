extends Node
































const BUZON: String = "user://packs/entrantes"


const DESTINO: String = "user://packs"
const PREFIJO: String = "recibido_"
const REINTENTO: float = 0.5

const HUERFANO: int = 600



var buzon: String = BUZON
var destino: String = DESTINO



var _pendiente: bool = false
var _reintento: Timer


func _ready() -> void:

	process_mode = Node.PROCESS_MODE_ALWAYS
	_reintento = Timer.new()
	_reintento.wait_time = REINTENTO
	_reintento.timeout.connect(_intenta)
	add_child(_reintento)


	if Engine.has_singleton("PackFiles"):
		var nat: Object = Engine.get_singleton("PackFiles")
		if nat.has_signal("abierto"):
			nat.connect("abierto", reintenta)
	_pendiente = _escanea() != ""




func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_RESUMED or what == NOTIFICATION_APPLICATION_FOCUS_IN:
		reintenta()



func hay() -> bool:
	_pendiente = _escanea() != ""
	return _pendiente




func reintenta() -> void:
	if hay():
		if _reintento.is_inside_tree() and _reintento.is_stopped():
			_reintento.start()
		_intenta.call_deferred()







func toma() -> String:
	var nombre: String = _escanea()
	_pendiente = false
	if nombre.is_empty():
		return ""
	var final: String = PREFIJO + _con_extension(nombre)
	_barre_recibidos()
	var origen: String = ProjectSettings.globalize_path(buzon.path_join(nombre))
	var hacia: String = ProjectSettings.globalize_path(destino.path_join(final))
	if DirAccess.rename_absolute(origen, hacia) != OK:
		push_warning("[pack] no se pudo sacar %s del buzón" % nombre)
		DirAccess.remove_absolute(origen)
		return ""





	var ms: int = nombre.get_slice("_", 0).to_int()
	var ahora: int = int(Time.get_unix_time_from_system())
	for resto in DirAccess.get_files_at(buzon):
		var r: String = String(resto)
		var p: String = buzon.path_join(r)
		if r.begins_with("."):
			if ahora - int(FileAccess.get_modified_time(p)) > HUERFANO:
				DirAccess.remove_absolute(ProjectSettings.globalize_path(p))
		elif r.get_slice("_", 0).to_int() <= ms:
			DirAccess.remove_absolute(ProjectSettings.globalize_path(p))
	return destino.path_join(final)





func _escanea() -> String:
	if not DirAccess.dir_exists_absolute(buzon):
		return ""
	var mejor: String = ""
	var mejor_ms: int = -1
	for f in DirAccess.get_files_at(buzon):
		var nombre: String = String(f)
		if nombre.begins_with("."):
			continue
		var ms: int = nombre.get_slice("_", 0).to_int()
		if ms > mejor_ms:
			mejor_ms = ms
			mejor = nombre
	return mejor


func _intenta() -> void:
	if not _pendiente:
		_reintento.stop()
		return
	if SceneFade.en_fundido():
		return
	var escena: Node = get_tree().current_scene
	if escena == null or not escena.has_method("acepta_pack"):

		_reintento.stop()
		return


	escena.call("acepta_pack")





func _con_extension(nombre: String) -> String:
	var ext: String = nombre.get_extension().to_lower()
	if ext in ["flpack", "zip", "json"]:
		return nombre
	var f: FileAccess = FileAccess.open(buzon.path_join(nombre), FileAccess.READ)
	var cabecera: PackedByteArray = f.get_buffer(2) if f != null else PackedByteArray()
	var es_zip: bool = cabecera.size() == 2 and cabecera[0] == 80 and cabecera[1] == 75
	return nombre +(".zip" if es_zip else ".json")


func _barre_recibidos() -> void:
	for f in DirAccess.get_files_at(destino):
		if String(f).begins_with(PREFIJO):
			DirAccess.remove_absolute(ProjectSettings.globalize_path(destino.path_join(f)))
	for d in DirAccess.get_directories_at(destino):
		if String(d).begins_with(PREFIJO):
			_borra_carpeta(destino.path_join(d))



func _borra_carpeta(ruta: String) -> void:
	for d in DirAccess.get_directories_at(ruta):
		_borra_carpeta(ruta.path_join(d))
	for f in DirAccess.get_files_at(ruta):
		DirAccess.remove_absolute(ProjectSettings.globalize_path(ruta.path_join(f)))
	DirAccess.remove_absolute(ProjectSettings.globalize_path(ruta))
