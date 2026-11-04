extends Node






















const SINGLETON: String = "GameCenterBridge"

const PREFIJO: String = "fl."





























const EN_CONNECT: Array[String] = [
	"album_continente", "amo_de_europa", "ascenso", "asist_seleccion", "asist_x3",
	"balon_de_oro", "bota_champions", "bota_doble", "bota_mundial",
	"campeon_del_mundo", "campeon_primera", "cerebro_100", "champions",
	"circulo_completo", "clase_mundial", "coleccionista", "conference",
	"conquistador", "copa_continental", "copa_nacional", "corner_gol",
	"de_la_nada", "dinastia", "doblete", "doblete_liga", "el_diez",
	"europa_league", "gol_continental", "gol_mundial", "gol_seleccion",
	"goleador_10", "goleador_100", "goleador_250", "goleador_50", "goleador_500",
	"hasta_el_final", "inmortal", "jugador_mes", "jugador_partido", "leal_corazon",
	"leyenda", "leyenda_club", "manita", "max_asist_liga", "max_asist_ucl",
	"mejor_historia", "mi_unico_amor", "mundial_clubes", "oro_precoz",
	"nueve_de_grande", "ovr_diamante", "ovr_oro", "ovr_plata", "partido_perfecto",
	"penal_gol", "penal_maestro", "pichichi_2_paises", "pichichi_3_paises",
	"pichichi_liga", "pichichi_x3", "pichichi_x5", "poker", "presentacion_10k",
	"presentacion_65k", "presentacion_90k", "presentacion_llena",
	"presentacion_llena_x3", "presentado", "primer_gol", "primer_hat_trick",
	"primer_titulo_liga", "primera_asistencia", "salir_a_tiempo", "temporada_div1",
	"temporada_div2", "temporada_div3", "tiro_libre", "tiro_libre_10",
	"triple_balon_oro", "triplete", "trotamundos", "ultimo_baile", "un_lustro",
	"un_solo_amor", "una_decada", "veterano_100", "veterano_300",
	"vitrina_completa", "vuelta_al_mundo", "vuelve_donde_fue_feliz",
]


var _puente: Object = null

var _sesion: bool = false



var _sembrado: bool = false





var _rarezas: Dictionary = {}



var _rarezas_pedidas: bool = false




signal rarezas_listas


func _ready() -> void:
	if not Engine.has_singleton(SINGLETON):
		return
	_puente = Engine.get_singleton(SINGLETON)




	_puente.connect("sesion", _on_sesion)
	_puente.connect("reporte_falla", _on_reporte_falla)



	if _puente.has_signal("rarezas"):
		_puente.connect("rarezas", _on_rarezas)
	Achievements.unlocked.connect(_on_unlocked)
	_puente.call("arrancar")

















const LEADERBOARD_GOLES: String = "fl.lb.goles"
const LEADERBOARD_ASIST: String = "fl.lb.asistencias"




const LEADERBOARD_TROFEOS_IND: String = "fl.lb.trofeos_ind"
const LEADERBOARD_TROFEOS_EQUIPO: String = "fl.lb.trofeos_equipo"








const LEADERBOARD_CONTRIB: String = "fl.lb.contribuciones"
const LEADERBOARD_TROFEOS_TOTAL: String = "fl.lb.trofeos_total"


















const LEADERBOARD_LEGADO: String = "fl.lb.legado"






















const LEADERBOARD_FORTUNA: String = "fl.lb.fortuna"





func puntuaciones() -> Dictionary:
	var trofeos_ind: int = 0
	var trofeos_equipo: int = 0
	for a in Career.awards:
		var key: String = String(a)
		if not Trophies.CATALOG.has(key):
			continue
		if String(Trophies.CATALOG[key]["kind"]) == "team":
			trofeos_equipo += 1
		else:
			trofeos_ind += 1
	return {
		LEADERBOARD_GOLES: GameState.career_goals,
		LEADERBOARD_ASIST: GameState.career_assists,
		LEADERBOARD_TROFEOS_IND: trofeos_ind,
		LEADERBOARD_TROFEOS_EQUIPO: trofeos_equipo,


		LEADERBOARD_CONTRIB: GameState.career_goals + GameState.career_assists,
		LEADERBOARD_TROFEOS_TOTAL: trofeos_ind + trofeos_equipo,




		LEADERBOARD_LEGADO: Career.legacy_score(),



		LEADERBOARD_FORTUNA: maxi(0, Career.money + Career.patrimonio_total()),
	}









func reportar_produccion() -> void:
	PlayGames.reportar_puntuaciones()
	SteamPuente.reportar_puntuaciones()
	if _puente == null or not _sesion:
		return
	if not _puente.has_method("reportar_puntuacion"):


		return
	var p: Dictionary = puntuaciones()
	for lb in p:
		_puente.call("reportar_puntuacion", String(lb), int(p[lb]))










func tableros_disponibles() -> bool:
	return _tableros_apple() or PlayGames.tableros_disponibles()


func _tableros_apple() -> bool:
	return _puente != null and _sesion and _puente.has_method("abrir_tableros")



func rotulo_tableros() -> String:
	if _tableros_apple():
		return I18n.t("VER EN GAME CENTER")
	return I18n.t("VER EN GOOGLE PLAY")














func abrir_tableros(lb_id: String = "") -> bool:
	if _tableros_apple():
		return bool(_puente.call("abrir_tableros", lb_id))
	return PlayGames.abrir_tableros(lb_id)






func logros_disponibles() -> bool:
	return _puente != null and _sesion and _puente.has_method("abrir_logros")













func abrir_logros() -> bool:
	if not logros_disponibles():
		return false
	return bool(_puente.call("abrir_logros"))







func rarezas_disponibles() -> bool:
	return _puente != null and _sesion and _puente.has_method("pedir_rarezas")











func pedir_rarezas(forzar: bool = false) -> bool:
	if not rarezas_disponibles():
		return false
	if _rarezas_pedidas and not forzar:
		return false
	_rarezas_pedidas = true
	return bool(_puente.call("pedir_rarezas"))









func rareza_mundial(id: String) -> float:
	return float(_rarezas.get(id, -1.0))




func hay_rarezas() -> bool:
	return not _rarezas.is_empty()






func _on_rarezas(por_id: Dictionary) -> void:
	_rarezas.clear()
	for k in por_id:
		var id: String = String(k)
		if id.begins_with(PREFIJO):
			id = id.substr(PREFIJO.length())
		_rarezas[id] = float(por_id[k])
	rarezas_listas.emit()





func apple_id(id: String) -> String:
	if not EN_CONNECT.has(id):
		return ""
	return PREFIJO + id



func lista_completa() -> PackedStringArray:
	var ids: PackedStringArray = PackedStringArray()
	for id in Achievements.unlocked_ids():
		var a: String = apple_id(String(id))
		if not a.is_empty():
			ids.append(a)
	return ids


func _on_sesion(activa: bool) -> void:
	_sesion = activa
	if not activa or _sembrado:
		return
	_sembrado = true
	var ids: PackedStringArray = lista_completa()
	if not ids.is_empty():
		_puente.call("reportar", ids)



	pedir_rarezas()






















func _on_reporte_falla(motivo: String) -> void:
	print("GameCenter: reporte falló: ", motivo)


func _on_unlocked(id: String) -> void:


	if _puente == null or not _sesion:
		return
	var a: String = apple_id(id)
	if not a.is_empty():
		_puente.call("reportar", PackedStringArray([a]))
