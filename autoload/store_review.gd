extends Node




































const SINGLETON: String = "StoreReviewBridge"





const SAVE_PATH: String = "user://review.cfg"










var save_path: String = SAVE_PATH





const MAX_VECES: int = 3









const DIAS_ENTRE: int = 122
const SEGUNDOS_DIA: int = 86400











const _ACH: GDScript = preload("res://autoload/achievements.gd")
const RAREZA_MINIMA: int = _ACH.RARE_EPIC






const MOMENTOS_EXTRA: Array[String] = ["primer_titulo_liga", "primer_hat_trick"]


var _puente: Object = null




var _armada: bool = false

var _veces: int = 0

var _ultima: int = 0



var _pulso_boton: bool = false





var ultimo_motivo: String = ""


func _ready() -> void:
	_cargar()



	Achievements.unlocked.connect(_al_desbloquear)
	if not Engine.has_singleton(SINGLETON):
		return
	_puente = Engine.get_singleton(SINGLETON)




func disponible() -> bool:
	return _puente != null





func _al_desbloquear(id: String) -> void:



	if _armada or not _es_momento(id):
		return
	_armada = true
	_guardar()





func _es_momento(id: String) -> bool:
	if MOMENTOS_EXTRA.has(id):
		return true
	var ficha: Dictionary = Achievements.by_id(id)
	if ficha.is_empty():
		return false
	return int(ficha.get("rare", 0)) >= RAREZA_MINIMA











func toca() -> bool:
	if GameState.readonly_save:



		ultimo_motivo = "readonly_save (captura o test)"
		return false
	if _pulso_boton:
		ultimo_motivo = "el jugador ya pulsó VALORAR EL JUEGO"
		return false
	if not _armada:
		ultimo_motivo = "no hay momento grande sin cobrar"
		return false
	if _veces >= MAX_VECES:
		ultimo_motivo = "gastadas las %d peticiones" % MAX_VECES
		return false
	var ahora: int = int(Time.get_unix_time_from_system())
	if _ultima > 0 and ahora - _ultima < DIAS_ENTRE * SEGUNDOS_DIA:

		ultimo_motivo = "faltan días para la siguiente (%d de %d)" % [
			(ahora - _ultima) / SEGUNDOS_DIA, DIAS_ENTRE]
		return false
	ultimo_motivo = "toca"
	return true









func pedir_si_toca() -> bool:
	if not toca():
		return false
	if _puente == null:


		ultimo_motivo = "toca, pero no hay módulo nativo"
		return false
	if not _puente.call("pedir"):


		ultimo_motivo = "el sistema no tenía escena activa"
		return false
	_armada = false
	_veces += 1
	_ultima = int(Time.get_unix_time_from_system())
	_guardar()
	ultimo_motivo = "pedida (%d de %d)" % [_veces, MAX_VECES]
	return true







func ya_valoro() -> void:
	if _pulso_boton:
		return
	_pulso_boton = true
	_armada = false
	_guardar()




func _guardar() -> void:



	if GameState.readonly_save and save_path == SAVE_PATH:
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("review", "armada", _armada)
	cfg.set_value("review", "veces", _veces)
	cfg.set_value("review", "ultima", _ultima)
	cfg.set_value("review", "pulso_boton", _pulso_boton)
	cfg.save(save_path)


func _cargar() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path) != OK:
		return
	_armada = bool(cfg.get_value("review", "armada", false))
	_veces = int(cfg.get_value("review", "veces", 0))
	_ultima = int(cfg.get_value("review", "ultima", 0))
	_pulso_boton = bool(cfg.get_value("review", "pulso_boton", false))
