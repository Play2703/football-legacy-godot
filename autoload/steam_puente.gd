extends Node




























const SINGLETON: String = "Steam"



const APP_ID: int = 0

const INIT_OK: int = 0
const TECLADO_PATH: String = "res://ui/teclado_mando.gd"
const LOGROS_PATH: String = "res://features/steam/steam_logros.gd"
const TABLAS_PATH: String = "res://features/steam/steam_tablas.gd"




static var finge_steam: bool = false


var activo: bool = false


var motivo: String = "sin_tag"
var _steam: Object = null


var logros: Node = null

var tablas: Node = null



static func es_steam() -> bool:
	return finge_steam or OS.has_feature("steam")


func _ready() -> void:
	if not OS.has_feature("steam"):
		return
	arranca(true, Engine.get_singleton(SINGLETON) if Engine.has_singleton(SINGLETON) else null)





func arranca(con_tag: bool, steam: Object) -> bool:


	if _steam != null:
		var teclado: Variant = load(TECLADO_PATH)
		if teclado.proveedor == _steam:
			teclado.proveedor = null
		if _steam.has_signal("overlay_toggled") and _steam.is_connected("overlay_toggled", _on_overlay):
			_steam.disconnect("overlay_toggled", _on_overlay)
	if logros != null:
		remove_child(logros)
		logros.free()
		logros = null
	if tablas != null:
		remove_child(tablas)
		tablas.free()
		tablas = null
	activo = false
	_steam = null
	if not con_tag:
		motivo = "sin_tag"
		return false
	if steam == null or not steam.has_method("steamInitEx"):
		motivo = "sin_extension"
		push_warning("SteamPuente: build de Steam sin GodotSteam; el juego sigue sin Steam")
		return false


	var r: Variant = steam.call("steamInitEx", APP_ID, true)
	var estado: int = int((r as Dictionary).get("status", -1)) if r is Dictionary else -1
	if estado != INIT_OK:
		motivo = String((r as Dictionary).get("verbal", "init")) if r is Dictionary else "init"
		push_warning("SteamPuente: Steam no arrancó (%d, %s); el juego sigue sin Steam" % [estado, motivo])
		return false
	_steam = steam
	activo = true
	motivo = ""



	var teclado: Variant = load(TECLADO_PATH)
	teclado.proveedor = steam


	if steam.has_signal("overlay_toggled"):
		steam.connect("overlay_toggled", _on_overlay)
	if steam.has_method("setAchievement"):
		logros = load(LOGROS_PATH).new()
		logros.name = "SteamLogros"
		logros.steam = steam
		add_child(logros)
	if steam.has_method("findOrCreateLeaderboard") and steam.has_method("uploadLeaderboardScore"):
		tablas = load(TABLAS_PATH).new()
		tablas.name = "SteamTablas"
		tablas.steam = steam
		add_child(tablas)
	return true





func reportar_puntuaciones() -> void:
	if tablas != null:
		tablas.reporta(GameCenter.puntuaciones())










func _on_overlay(abierto: bool, _del_jugador: bool = false, _app_id: int = 0) -> void:
	if not is_inside_tree():
		return
	get_tree().root.propagate_notification(
		NOTIFICATION_APPLICATION_FOCUS_OUT if abierto else NOTIFICATION_APPLICATION_FOCUS_IN)




func steam() -> Object:
	return _steam if activo else null
