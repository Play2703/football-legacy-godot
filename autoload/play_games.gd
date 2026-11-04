extends Node


































const SINGLETON: String = "GodotPlayGameServices"
const IDS := preload("res://autoload/pgs_ids.gd")




const INCREMENTALES: Array[String] = [
	"goleador_10", "goleador_50", "goleador_100", "goleador_250", "goleador_500",
	"veterano_100", "veterano_300",
]


var _puente: Object = null

var ids: Dictionary = IDS.LOGROS

var tableros: Dictionary = IDS.TABLEROS

var _sesion: bool = false

var _sembrado: bool = false


var _abrir_al_entrar: String = ""


var _puntuaciones_pendientes: bool = false


func _ready() -> void:
	if not Engine.has_singleton(SINGLETON):
		return
	monta(Engine.get_singleton(SINGLETON))
	_puente.call("initialize")
	_puente.call("isAuthenticated")




func monta(puente: Object) -> void:
	_puente = puente
	_puente.connect("userAuthenticated", _on_sesion)
	_puente.connect("achievementUnlocked", _on_unlock_respuesta)
	if not Achievements.unlocked.is_connected(_on_unlocked):
		Achievements.unlocked.connect(_on_unlocked)


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED and _puente != null and _sesion:
		_manda_pasos()



func google_id(id: String) -> String:
	return String(ids.get(id, ""))



func lista_completa() -> PackedStringArray:
	var out := PackedStringArray()
	for id in Achievements.unlocked_ids():

		if INCREMENTALES.has(String(id)):
			continue
		var g: String = google_id(String(id))
		if not g.is_empty() and not out.has(g):
			out.append(g)
	return out





func pasos() -> Dictionary:
	var out: Dictionary = {}
	for id in INCREMENTALES:
		var g: String = google_id(id)
		if g.is_empty():
			continue
		var p: Vector2i = Achievements.progreso(id)


		var n: int = p.y if Achievements.is_unlocked(id) else mini(p.x, p.y)
		if n > 0:
			out[g] = n
	return out




func logros_disponibles() -> bool:
	return _puente != null and not ids.is_empty()




func abrir_logros() -> bool:
	if not logros_disponibles():
		return false
	if _sesion:
		_puente.call("showAchievements")
	else:
		_abrir_al_entrar = "logros"
		_puente.call("signIn")
	return true



func tableros_disponibles() -> bool:
	return _puente != null and not tableros.is_empty()




func abrir_tableros(lb_id: String = "") -> bool:
	if not tableros_disponibles():
		return false
	if not lb_id.is_empty() and not tableros.has(lb_id):
		return false
	if _sesion:
		_muestra_tableros(lb_id)
	else:
		_abrir_al_entrar = "tableros:" + lb_id
		_puente.call("signIn")
	return true


func _muestra_tableros(lb_id: String) -> void:
	if lb_id.is_empty():
		_puente.call("showAllLeaderboards")
	else:
		_puente.call("showLeaderboard", String(tableros[lb_id]))




func reportar_puntuaciones() -> void:
	if _puente == null or tableros.is_empty():
		return
	if not _sesion:
		_puntuaciones_pendientes = true
		return
	_puntuaciones_pendientes = false
	var p: Dictionary = GameCenter.puntuaciones()
	for lb in p:
		var g: String = String(tableros.get(lb, ""))
		if not g.is_empty():
			_puente.call("submitScore", g, int(p[lb]))


func _on_sesion(activa: bool) -> void:
	_sesion = activa
	if not activa:
		_abrir_al_entrar = ""
		return
	if not _sembrado:
		_sembrado = true
		for g in lista_completa():
			_puente.call("unlockAchievement", g)
		_manda_pasos()
	if _puntuaciones_pendientes:
		reportar_puntuaciones()
	var pedido: String = _abrir_al_entrar
	_abrir_al_entrar = ""
	if pedido == "logros":
		_puente.call("showAchievements")
	elif pedido.begins_with("tableros:"):
		_muestra_tableros(pedido.trim_prefix("tableros:"))


func _manda_pasos() -> void:
	var p: Dictionary = pasos()
	for g in p:
		_puente.call("setAchievementSteps", String(g), int(p[g]))


func _on_unlocked(id: String) -> void:

	if _puente == null or not _sesion:
		return
	var g: String = google_id(id)
	if g.is_empty():
		return
	if INCREMENTALES.has(id):
		_manda_pasos()
	else:
		_puente.call("unlockAchievement", g)




func _on_unlock_respuesta(hecho: bool, google: String) -> void:
	if not hecho:
		print("PlayGames: no se desbloqueó ", google)
