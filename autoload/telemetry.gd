extends Node












































const SAVE_PATH: String = "user://telemetry.cfg"




var save_path: String = SAVE_PATH




const EVENTS: Dictionary = {







	"academia_ini": "Academias empezadas",







	"academia_d1": "· pasaron el 1 (MUEVETE)",
	"academia_d2": "· pasaron el 2 (PEGALE)",
	"academia_d3": "· pasaron el 3 (PASALA)",
	"academia_d4": "· pasaron el 4 (ENCARA)",
	"academia_d5": "· pasaron el 5 (SIRVE AL AREA)",
	"academia_d6": "· pasaron el 6 (BALON PARADO)",







	"academia_repaso_d1": "· repitieron el 1 (MUEVETE)",
	"academia_repaso_d2": "· repitieron el 2 (PEGALE)",
	"academia_repaso_d3": "· repitieron el 3 (PASALA)",
	"academia_repaso_d4": "· repitieron el 4 (ENCARA)",
	"academia_repaso_d5": "· repitieron el 5 (SIRVE AL AREA)",
	"academia_repaso_d6": "· repitieron el 6 (BALON PARADO)",
	"academia_fin": "Academias terminadas",






































	"apertura_vista": "Aperturas vistas",
	"apertura_saltada": "· la saltaron",








	"apertura_tope": "· el estadio tardó más de 3 s (el cine perdió hasta 1 s)",






	"apertura_nombre_pide": "· llegaron a la pregunta del nombre",
	"apertura_nombre": "· escribieron su nombre (es opcional)",
	"apertura_campo": "· salieron al campo",
	"alta_abierta": "Altas abiertas (NUEVA CARRERA)",
	"academia_jugada": "· entraron al campo",
	"academia_gol": "· marcaron su primer gol en la escuela",
	"nombre_puesto": "· escribieron un nombre (ya jugando)",
	"primer_gol": "· llegaron a marcar un gol",
	"carrera_nueva": "Carreras creadas",



	"jornada_jugada": "Jornadas jugadas",
	"jornada_simulada": "Jornadas simuladas o vistas",
	"temporada_fin": "Temporadas terminadas",
	"retiro": "Carreras llevadas hasta el retiro",



	"herencia_abierta": "Abrieron la tienda del LEGADO en el menú",
	"herencia_compra": "· compraron algo con estrellas",


	"alta_compra": "·· de ellas, en el alta (TUS VENTAJAS)",


	"rebirth_elegidos": "Ventajas elegidas al dar de alta (suma)",














	"vuelta_retiro": "· y volvieron del retiro (una vez por carrera)",


















	"pantalla_juego": "Aperturas de HABILIDAD",
	"pantalla_contrato": "Aperturas de CONTRATO",
	"pantalla_gente": "Aperturas de RELACIONES",
	"pantalla_aspecto": "Aperturas de ASPECTO",
	"pantalla_tienda": "Aperturas de TIENDA",
	"pantalla_casa": "Aperturas de CASA",
	"pantalla_torneos": "Aperturas de TORNEOS",
	"pantalla_calendario": "Aperturas de CALENDARIO",
	"pantalla_mercado": "Aperturas de MERCADO",
	"pantalla_plantilla": "Aperturas de PLANTILLA",





	"pantalla_gerencia": "Aperturas de GERENCIA",
	"pantalla_ranking": "Aperturas de RANKING",



	"pantalla_fichajes": "Aperturas de FICHAJES",
	"pantalla_noticias": "Aperturas de NOTICIAS",
	"pantalla_carrera": "Aperturas de CARRERA",
	"pantalla_mapa": "Aperturas de MAPA",
	"pantalla_trofeos": "Aperturas de TROFEOS",
	"pantalla_clubes": "Aperturas de CLUBES",
	"pantalla_leyendas": "Aperturas de LEYENDAS",
	"pantalla_balon": "Aperturas de BALON",

	"practica": "Sesiones de PRÁCTICA",


	"practica_minijuego": "· minijuegos abiertos desde PRÁCTICA",



	"partido_libre_ini": "· PARTIDOS LIBRES empezados (práctica)",
	"partido_libre_fin": "· PARTIDOS LIBRES terminados",
	"entreno_club": "Sesiones de ENTRENO en el club",
	"editor": "Aperturas del EDITOR de planteles",

	"decision_contestada": "Decisiones contestadas",



















	"caja_abierta": "Veces que se abrió LA CAJA",
	"caja_por_defecto": "· la TIENDA abrió sola ahí",
	"caja_elegida": "· tocaron la pestaña a propósito",
	"caja_tocada": "· tocaron un paquete",
	"caja_comprada": "· la compra se cobró",

















	"caja_cancelada": "· se cerró la hoja sin pagar",
	"caja_fallo": "· la tienda dio un error",
	"caja_pendiente": "· el pago quedó pendiente",
	"caja_sin_hoja": "· la hoja de pago no se abrió",
	"caja_sin_respuesta": "· sin respuesta en 30 s",



	"reinicio_tocado": "· mantuvieron REINICIAR de pago",
	"reinicio_comprado": "· el reinicio se cobró",
	"caja_via_tienda": "Entradas a LA CAJA desde una compra que no alcanzaba",
	"caja_via_perfil": "Entradas a LA CAJA desde los puntos de habilidad",
	"caja_via_plus": "Entradas a LA CAJA desde un + de habilidad sin puntos",
	"caja_via_hub": "Entradas a LA CAJA desde el hub",

	"alineaciones_via_hub": "Aperturas de ALINEACIONES desde el hub",


	"puente_casa": "Desde la TIENDA a la CASA (una inversión que pide un cuarto)",
	"puente_aspecto": "Desde la TIENDA a ASPECTO (el atuendo de un lujo)",
	"puente_marcas": "Desde la TIENDA a las marcas (la fama abrió una)",






	"mesa_confirma": "GERENCIA: mesas de fichajes confirmadas",
	"mesa_venta": "· compañeros vendidos en la mesa",
	"mesa_compra": "· jugadores fichados en la mesa",
	"mesa_clausula": "· de ellos, pagando su cláusula de rescisión",


	"mesa_regateo_si": "· regateos que acabaron en trato",
	"mesa_regateo_no": "· regateos en que el club se cansó y no vendió",
	"pide_dt": "GERENCIA: técnicos pedidos al club",
	"pide_dt_si": "GERENCIA: el club trajo al técnico pedido",
	"pide_dt_no": "GERENCIA: el club no trajo al técnico pedido (el tuyo se enteró)",
	"pide_dt_no_cae": "GERENCIA: el club cambió de técnico, pero no al pedido",
	"pide_dt_ya_no": "GERENCIA: el técnico pedido ya no estaba a tu alcance",
	"pide_cese": "GERENCIA: ceses de tu técnico pedidos al club",
	"pide_cese_si": "GERENCIA: el club echó a tu técnico porque lo pediste",
	"pide_cese_no": "GERENCIA: el club no echó a tu técnico (se enteró)",
	"pide_cese_cae": "GERENCIA: el club ya iba a echar al técnico cuyo cese pediste",
	"pide_cese_ya_no": "GERENCIA: el cese pedido ya no estaba a tu alcance",
	"intocable_pon": "GERENCIA: compañeros protegidos («no lo vendáis»)",
	"intocable_no": "GERENCIA: ventanas en que el club rechazó ofertas por tu protegido",
	"intocable_vendido": "GERENCIA: protegidos vendidos igual (pagaron el doble)",
	"renueva_pide": "GERENCIA: renovaciones pedidas al club",
	"renueva_si": "GERENCIA: renovaciones pedidas que salieron",
	"renueva_no": "GERENCIA: renovaciones pedidas que no salieron",


	"cobro_dt_capricho": "GERENCIA: pediste otro técnico con el tuyo cumpliendo",
	"cobro_intocable_suplente": "GERENCIA: protegiste a un suplente con el club en apuro",
	"cobro_renueva_veterano": "GERENCIA: pediste renovar a un veterano suplente",
	"cobro_caja_vacia": "GERENCIA: la mesa dejó la caja vacía",
	"cobro_no_renuevo": "GERENCIA: no renovaste yendo en racha",


	"dorsal_nivel_pide": "GERENCIA: dorsales pedidos sin renovar",
	"dorsal_nivel_si": "· te lo cedieron (o estaba libre)",
	"dorsal_nivel_no": "· el compañero no lo cedió",


	"peldano_sube": "GERENCIA: peldaños subidos en el club",
	"peldano_baja": "GERENCIA: peldaños perdidos en el club",
	"peldano_pediste": "GERENCIA: traspasos pedidos con nivel 3 o más",
	"leyenda_vuelve": "GERENCIA: vueltas de rival al club donde fuiste leyenda",







	"arranque": "Arranques del juego (en frío)",
	"cierre_raro": "· el anterior se cerró solo (crash o memoria)",
	"cierre_raro_partido": "· · y fue en pleno partido",







	"cierre_raro_inactiva": "· · con la app inactiva (¿cerrada desde el selector?)",
	"cierre_raro_aviso": "· · tras un aviso de memoria de iOS",





	"aviso_memoria": "Avisos de memoria de iOS",
	"aviso_memoria_partido": "· en pleno partido",



	"resumen_ligero": "Resúmenes del año reabiertos sin 3D (la app murió dentro)",
	"resumen_saltado": "· · y saltados (murió también sin 3D)",



	"resumen_3d": "Recintos 3D montados en el resumen del año",



	"mapas_altos": "Mapeos de memoria al 80 % del límite (Android)",



	"despedida_ligera": "Despedidas reabiertas sin 3D (la app murió dentro)",
	"despedida_saltada": "· · y saltadas al museo (murió también sin 3D)",
	"decision_atascada": "Decisiones que el hub dejó de abrir solo (2 aperturas sin resolver)",





	"portada_huerfana_powervr": "Portadas PowerVR en 2D (la app murió con el coliseo abierto)",
	"portada_2d_fija": "· · y fijas en 2D (dos muertes seguidas)",




	"partido_ganado": "Partidos jugados: ganados",
	"partido_empatado": "· empatados",
	"partido_perdido": "· perdidos",
	"partido_abandonado": "Partidos abandonados desde la pausa",



	"min_partido": "Minutos en el campo",
	"min_menu": "Minutos en menús",
























	"gol": "Goles marcados",
	"gol_seleccion": "· con la selección",
	"gol_penal": "· de penal",
	"gol_panenka": "· · a lo Panenka",
	"gol_falta": "· de tiro libre",
	"gol_falta_m20": "· · a menos de 20 m",
	"gol_falta_m25": "· · de 20 a 25 m",
	"gol_falta_m30": "· · de 25 a 30 m",
	"gol_falta_m30_mas": "· · a 30 m o más",
	"gol_corner": "· de córner",
	"gol_olimpico": "· · olímpicos",
	"gol_corner_cabeza": "· · rematados de cabeza",
	"gol_corner_volea": "· · rematados de volea",
	"gol_corner_chilena": "· · rematados de chilena",
	"gol_esc_solo": "· en mano a mano",
	"gol_esc_frontal": "· en disparo frontal",
	"gol_esc_lejano": "· desde lejos",
	"gol_esc_angulo": "· desde ángulo cerrado",
	"gol_esc_contra": "· al contraataque",
	"gol_esc_centro": "· en centro al área",
	"gol_esc_rebote": "· en rebote en el área",
	"gol_esc_volea": "· en la jugada de volea",
	"gol_esc_banda": "· en saque de banda largo",
	"gol_esc_indirecta": "· en falta indirecta en el área",
	"gol_esc_regate": "· tras regate libre",
	"gol_esc_salida": "· saliendo desde tu campo",
	"gol_esc_salida_meta": "· desde un saque de meta",
	"gol_esc_contragolpe": "· al contragolpe desde tu campo",
	"gol_esc_otro": "· en otras jugadas",
	"gol_cabeza": "· de cabeza",
	"gol_volea": "· de volea",
	"gol_chilena": "· de chilena",



	"gol_m6": "· a menos de 6 m del arco",
	"gol_m16": "· de 6 a 16 m",
	"gol_m25": "· de 16 a 25 m",
	"gol_m30": "· de 25 a 30 m",
	"gol_m30_mas": "· a 30 m o más",
	"hat_trick": "Hat-tricks (3 goles o más en un partido)",

	"poker": "Partidos de 4 goles o más",




	"autogol": "Autogoles",
	"penal_fallado": "Penales fallados en el partido",
	"tanda_penal_fallado": "Penales fallados en tandas",


	"desvio": "Tiros desviados por un defensa",
	"desvio_corner": "· que acabaron en córner",


	"desvio_og": "· que el defensa metió en su portería",
	"asistencia": "Asistencias dadas",


	"asist_esc_solo": "· en mano a mano",
	"asist_esc_frontal": "· en disparo frontal",
	"asist_esc_lejano": "· desde lejos",
	"asist_esc_angulo": "· desde ángulo cerrado",
	"asist_esc_contra": "· al contraataque",
	"asist_esc_centro": "· en centro al área",
	"asist_esc_banda": "· en saque de banda largo",
	"asist_esc_indirecta": "· en falta indirecta en el área",
	"asist_esc_regate": "· tras regate libre",
	"asist_esc_salida": "· saliendo desde tu campo",
	"asist_esc_salida_meta": "· desde un saque de meta",
	"asist_esc_contragolpe": "· al contragolpe desde tu campo",
	"asist_esc_corner": "· de córner",
	"asist_esc_libre": "· de tiro libre",
	"asist_esc_otro": "· en otras jugadas",




	"partido_club": "Partidos jugados con el club",
	"partido_seleccion": "Partidos jugados con la selección",
	"derbi_ganado": "Derbis ganados",
	"remontada": "Partidos ganados remontando",
	"titulo_equipo": "Títulos de equipo ganados",
	"titulo_liga": "· ligas",
	"titulo_copa": "· copas",
	"titulo_continental": "· continentales de clubes y Mundial de Clubes",
	"titulo_ascenso": "· ascensos",
	"titulo_mundial": "· Mundiales con la selección",
	"titulo_nat_cont": "· continentales con la selección",




	"premio_individual": "Premios individuales",
	"balon_oro": "· Balones de Oro",
	"jugador_partido": "Veces Jugador del Partido",
	"jugador_mes": "Veces Jugador del Mes",
	"traspaso": "Traspasos firmados",
	"traspaso_millones": "· millones pagados por ellos",







	"gol_antes": "Goles de club de antes (carreras guardadas)",
	"asistencia_antes": "Asistencias de club de antes",
	"partido_antes": "Partidos de club de antes",
	"titulo_antes": "Títulos de equipo de antes",
	"premio_antes": "Premios individuales de antes",





	"repe_compartir": "Repeticiones: toques en COMPARTIR",
	"repe_compartida": "· enviadas a otra app",





	"saneo_tecnicos": "Cargas con un técnico duplicado (se arregló solo)",
	"saneo_tecnicos_arreglos": "· arreglos del carrusel de técnicos en ellas",




	"anuncio_valla": "Anuncios: estadios con valla pagada",
	"anuncio_banner": "Anuncios: banner visto en el menú",
	"anuncio_banner_toque": "· toques que abrieron su enlace",
}



const MARKS: Dictionary = {
	"semana_max": "Semana más lejana alcanzada",
	"temporada_max": "Temporada más lejana alcanzada",
	"nivel_max": "Nivel más alto alcanzado",
	"peldano_max": "Peldaño más alto en un club (1-6)",




	"apertura_estadio_ds": "Apertura: décimas hasta ver el estadio (peor)",



	"goles_carrera_max": "Más goles de club en una carrera",
	"asistencias_carrera_max": "Más asistencias de club en una carrera",
	"goles_partido_max": "Más goles en un partido",
	"titulos_carrera_max": "Más títulos de equipo en una carrera",
	"balones_oro_max": "Más Balones de Oro en una carrera",
	"gol_distancia_max": "Gol más lejano (m)",
	"gol_falta_distancia_max": "Tiro libre más lejano metido (m)",
	"asistencia_distancia_max": "Pase de gol más largo (m)",
}

var _count: Dictionary = {}
var _mark: Dictionary = {}


const FLUSH_EVERY: int = 8
var _dirty: int = 0


func _ready() -> void:
	_load()
	siembra_historial()



	mide = OS.get_name() in APARATOS


	process_mode = Node.PROCESS_MODE_ALWAYS
	set_process(mide)
	if mide:
		arranca_sesion()



		get_tree().process_frame.connect(func() -> void:
			anota_arranque(Time.get_ticks_msec(), CacheGuard.vacio), CONNECT_ONE_SHOT)




	if OS.has_feature("banco"):
		load("res://banco/banco.gd").arranca(get_tree())









	_http = HTTPRequest.new()
	_http.timeout = SEND_TIMEOUT
	_http.request_completed.connect(_on_sent)
	add_child(_http)




	try_send(true)










const APARATOS: Array[String] = ["iOS", "Android"]


const ESCENA_PARTIDO: String = "res://features/match/match.tscn"




const TOPE_FOTOGRAMA: float = 1.0





var viva_path: String = "user://telemetry_viva.cfg"


var mide: bool = false
var _en_partido: bool = false
var _ultimo_tick: int = 0



var _seg: Dictionary = {"min_partido": 0.0, "min_menu": 0.0}













const LATIDO_CADA_S: float = 10.0



const CIERRES_MAX: int = 8





const CIERRE_LLAVES: Array[String] = ["n", "p", "mem", "vram", "av", "act", "s",
	"rss", "maps", "maps_kgsl", "maps_sec", "tex_n", "pant"]

const CENSO_LLAVES: Array[String] = ["rss", "maps", "maps_kgsl", "maps_sec", "tex_n"]
var _cierres: Array = []


var _viva: bool = false

var _activa: bool = true

var _avisos_mem: int = 0
var _latido_seg: float = 0.0

var _censo: Dictionary = {}


var _pantallas: Array = []




const MedidorFpsScript = preload("res://features/match/medidor_fps.gd")



const FPS_MAX: int = 8

const AVISO_CALIDAD_S: float = 5.0


var _fps: Array = []














const DETALLE_FPS: Array[String] = ["b", "t50", "t100", "ta", "dtx", "v1", "vn",
	"cs", "cr", "cg", "cf", "hf", "hz", "pc", "pca", "sw", "rs", "cortado",
	"memd", "vram", "gl", "gr"]





const ARRANQUES_MAX: int = 8
var _arranques: Array = []


































const FASES_ARRANQUE: Array[String] = ["e", "au", "es", "mm", "gi", "ri", "wr", "tp", "sx", "pf"]


var _fases: Dictionary = {}




var _arr_hoy: Dictionary = {}














const MENU_TOPE: int = 10000000
var _menu: Dictionary = {"m30": [0, 0, 0], "m60": [0, 0, 0], "hz": 0}



var _menu_escena: int = 0

var _menu_salta: bool = false






const REA_MAX: int = 8
var _rea: Array = []


var _pausado_us: int = -1



var _rea_pendiente: bool = false






var _fps_pendiente: Dictionary = {}
var _medidor: RefCounted = null





var _medida_readonly: bool = false
var _medida_cb: bool = false
var _medida_mb: bool = false


var _aviso_calidad: bool = false




const AVISO_QUIETO_S: float = 1.0
var _aviso_quieto: float = 0.0



var _medida_escena: int = 0













func arranca_sesion() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(viva_path) == OK and bool(cfg.get_value("sesion", "viva", false)):
		count("cierre_raro")
		var en_partido: bool = str(cfg.get_value("sesion", "en", "")) == "partido"
		if en_partido:
			count("cierre_raro_partido")



		var act: int = int(cfg.get_value("sesion", "act", -1))
		var av: int = int(cfg.get_value("sesion", "av", -1))
		if act == 0:
			count("cierre_raro_inactiva")
		if av > 0:
			count("cierre_raro_aviso")


		anota_cierre({"n": int(_count.get("arranque", 0)) + 1, "p": 1 if en_partido else 0,
			"mem": cfg.get_value("sesion", "mem", -1), "vram": cfg.get_value("sesion", "vram", -1),
			"av": av, "act": act, "s": cfg.get_value("sesion", "s", -1),
			"rss": cfg.get_value("sesion", "rss", -1), "maps": cfg.get_value("sesion", "maps", -1),
			"maps_kgsl": cfg.get_value("sesion", "maps_kgsl", -1),
			"maps_sec": cfg.get_value("sesion", "maps_sec", -1),
			"tex_n": cfg.get_value("sesion", "tex_n", -1), "pant": cfg.get_value("sesion", "pant", -1)})
	count("arranque")
	_ultimo_tick = Time.get_ticks_msec()
	_en_partido = false

	_activa = true
	_avisos_mem = 0
	_escribe_viva(true)

























func _escribe_viva(viva: bool) -> void:
	_viva = viva
	_latido_seg = 0.0
	if not mide:
		return
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("sesion", "viva", viva)
	cfg.set_value("sesion", "en", "partido" if _en_partido else "menu")


	if viva:


		var libre: int = int(OS.get_memory_info().get("available", -1))
		cfg.set_value("sesion", "mem", libre / 1048576 if libre >= 0 else -1)
		cfg.set_value("sesion", "vram", int(RenderingServer.get_rendering_info(
			RenderingServer.RENDERING_INFO_VIDEO_MEM_USED) / 1048576))
		cfg.set_value("sesion", "av", _avisos_mem)
		cfg.set_value("sesion", "act", 1 if _activa else 0)
		cfg.set_value("sesion", "s", int(Time.get_ticks_msec() / 1000))
		for k in CENSO_LLAVES:
			var v: Variant = _censo.get(k, -1)
			cfg.set_value("sesion", k, int(v) if (v is int or v is float) else -1)
		cfg.set_value("sesion", "pant", pantalla_actual())






	var tmp: String = viva_path + ".tmp"
	if cfg.save(tmp) != OK or DirAccess.rename_absolute(tmp, viva_path) != OK:
		cfg.save(viva_path)






func latido(seg: float) -> bool:
	if not _viva:
		return false
	_latido_seg += maxf(seg, 0.0)
	if _latido_seg < LATIDO_CADA_S:
		return false
	_escribe_viva(true)
	return true





func anota_censo(c: Dictionary) -> void:
	_censo = c.duplicate()









func marca_pantalla(n: int, quien: Node = null) -> void:
	_pantallas = _pantallas.filter(func(p: Array) -> bool: return _pantalla_viva(p))
	_pantallas.append([n, weakref(quien) if quien != null else null])
	while _pantallas.size() > 8:
		_pantallas.pop_front()



func pantalla_actual() -> int:
	for i in range(_pantallas.size() - 1, -1, -1):
		if _pantalla_viva(_pantallas[i]):
			return int(_pantallas[i][0])
	return 0


static func _pantalla_viva(p: Array) -> bool:
	if p[1] == null:
		return true
	var nodo: Node =(p[1] as WeakRef).get_ref() as Node
	return nodo != null and nodo.is_inside_tree()






func aviso_memoria() -> void:
	_avisos_mem += 1
	count("aviso_memoria")
	if _en_partido:
		count("aviso_memoria_partido")
	if _viva:
		_escribe_viva(true)





func anota_cierre(c: Dictionary) -> void:
	_cierres.append(_cierre_entero(c))
	while _cierres.size() > CIERRES_MAX:
		_cierres.pop_front()
	_touch()




static func _cierre_entero(c: Dictionary) -> Dictionary:
	var e: Dictionary = {}
	for k in CIERRE_LLAVES:
		var v: Variant = c.get(k, -1)
		e[k] = int(v) if (v is int or v is float or v is bool) else -1
	return e


func _process(_delta: float) -> void:



	var ahora: int = Time.get_ticks_msec()
	var seg: float = minf((ahora - _ultimo_tick) / 1000.0, TOPE_FOTOGRAMA)
	_ultimo_tick = ahora
	var escena: Node = get_tree().current_scene
	var partido: bool = escena != null and escena.scene_file_path == ESCENA_PARTIDO
	if partido != _en_partido:


		_en_partido = partido
		_escribe_viva(true)

		if partido:
			_abre_medida(escena)
		else:
			_cierra_medida()
	elif partido and escena.get_instance_id() != _medida_escena:

		_cierra_medida()
		_abre_medida(escena)
	latido(seg)
	anota_tiempo(seg, partido)

	if _hito_pendiente:
		_manda_hito()


	var ahora_us: int = Time.get_ticks_usec()
	if partido and _medidor != null:
		_medidor.muestra(float(ahora_us - _prev_tick_fps_us) / 1000000.0, get_tree().paused,
			_coste_cs_ms, _coste_render_cpu(), _coste_gpu(), _ticks_fis,
			Performance.get_monitor(Performance.TIME_PHYSICS_PROCESS) * 1000.0, _coste_cft_ms)
		_medidor.nota_pipelines(pipelines_compiladas())
		_hz_seg += seg
		if _hz_seg >= MedidorFpsScript.VENTANA_S:
			_hz_seg = 0.0
			_medidor.nota_hz(DisplayServer.screen_get_refresh_rate())
		_mem_seg += seg
		if _mem_seg >= MEM_CADA_S:
			_mem_seg = 0.0
			_muestra_memoria(escena)
		_medida_readonly = _medida_readonly or GameState.readonly_save
	elif not partido and _medidor == null:

		_mide_menu(escena, float(ahora_us - _prev_tick_fps_us) / 1000.0)
	_prev_tick_fps_us = ahora_us
	if aviso_calidad_toca(seg, partido):
		_aviso_calidad = false




		var atras: GDScript = load("res://ui/atras_android.gd") as GDScript
		if atras != null:
			atras.call("aviso", SceneFade, I18n.t(
				"Tu teléfono iba lento: activamos CALIDAD BAJA. Puedes quitarla en AJUSTES."),
				AVISO_CALIDAD_S)




static func _nivel_cb(calidad_baja: bool, muy_baja: bool) -> int:
	if muy_baja:
		return 2
	return 1 if calidad_baja else 0





func _mide_menu(escena: Node, dt_ms: float) -> void:
	var id: int = escena.get_instance_id() if escena != null else 0
	if id != _menu_escena:
		_menu_escena = id
		_menu_salta = false
		_menu["hz"] = _hz_menu(DisplayServer.screen_get_refresh_rate())
		return
	if _menu_salta:
		_menu_salta = false
		return
	_cuenta_menu(dt_ms, Engine.max_fps)





func _cuenta_menu(dt_ms: float, tope: int) -> void:
	var col: Array = _menu["m30" if tope == Settings.AHORRO_FPS_QUIETO else "m60"]
	col[0] = mini(int(col[0]) + 1, MENU_TOPE)
	if dt_ms > 34.0:
		col[1] = mini(int(col[1]) + 1, MENU_TOPE)
	if dt_ms > 50.0:
		col[2] = mini(int(col[2]) + 1, MENU_TOPE)



static func _hz_menu(hz: float) -> int:
	return clampi(roundi(hz), 0, 240) if hz > 0.0 else 0





static func _menu_entero(v: Variant) -> Dictionary:
	var d: Dictionary = v if v is Dictionary else {}
	var out: Dictionary = {}
	for col in ["m30", "m60"]:
		var src: Variant = d.get(col, [])
		var l: Array = []
		for i in 3:
			var x: Variant =(src as Array)[i] if (src is Array and i <(src as Array).size()) else 0
			l.append(clampi(int(x), 0, MENU_TOPE) if (x is int or x is float) else 0)
		out[col] = l
	var hz: Variant = d.get("hz", 0)
	out["hz"] = clampi(int(hz), 0, 240) if (hz is int or hz is float) else 0
	return out





func _rea_primer_cuadro(t0_us: int, fondo_s: float) -> void:
	_rea_pendiente = false
	var en_juego: bool = _medidor != null or Settings.juego_en_vivo()
	_rea_apunta(int((Time.get_ticks_usec() - t0_us) / 1000), int(fondo_s), 1 if en_juego else 0)





func _rea_apunta(ms: int, f: int, e: int) -> void:
	_rea.append(_rea_entera({"ms": ms, "f": f, "e": e}))
	while _rea.size() > REA_MAX:
		_rea.pop_front()
	_touch()




static func _rea_entera(a: Variant) -> Dictionary:
	if not (a is Dictionary) or not (a as Dictionary).has("ms"):
		return {}
	var d: Dictionary = a
	var ms: Variant = d["ms"]
	if not (ms is int or ms is float):
		return {}
	var f: Variant = d.get("f", 0)
	var e: Variant = d.get("e", 0)
	return {"ms": clampi(int(ms), 0, 60000),
		"f": clampi(int(f), 0, 86400) if (f is int or f is float) else 0,
		"e": 1 if ((e is int or e is float or e is bool) and int(e) != 0) else 0}






func aviso_calidad_toca(seg: float, partido: bool) -> bool:
	if not _aviso_calidad:
		_aviso_quieto = 0.0
		return false
	if partido or Settings.juego_en_vivo() or SceneFade._busy:
		_aviso_quieto = 0.0
		return false
	_aviso_quieto += seg
	return _aviso_quieto >= AVISO_QUIETO_S







func _muestra_memoria(escena: Node) -> void:
	if _medidor == null:
		return
	var mem: Dictionary = OS.get_memory_info()
	_medidor.nota_memoria(int(mem.get("available", 0)),
		int(RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_VIDEO_MEM_USED)))
	var st: Variant = escena.get("_stadium") if escena != null else null
	if st is Node:
		var env: Variant =(st as Node).get("_env")
		if env is Environment:
			_medida_gl = maxi(_medida_gl, 1 if (env as Environment).glow_enabled else 0)


func _abre_medida(escena: Node) -> void:
	_medidor = MedidorFpsScript.new()
	_medida_escena = escena.get_instance_id()
	_medida_readonly = false


	_reanudado = false
	_medida_cb = Settings.calidad_baja
	_medida_mb = Settings.calidad_muy_baja
	_medida_sw = swappy_modo()
	_hz_seg = 0.0
	_medidor.nota_hz(DisplayServer.screen_get_refresh_rate())
	_mem_seg = MEM_CADA_S
	_medida_gl = -1
	_engancha_coste(true)




var _prev_tick_fps_us: int = 0

var _hz_seg: float = 0.0

var _medida_sw: int = -1


const MEM_CADA_S: float = 1.0
var _mem_seg: float = 0.0
var _medida_gl: int = -1








var _reanudado: bool = false
var _pausado_fondo: bool = false















var _t_fis_us: int = 0
var _t_proc_us: int = 0
var _coste_cs_ms: float = -1.0






var _coste_cft_ms: float = -1.0


var _ticks_fis_cur: int = 0
var _ticks_fis: int = -1


func _engancha_coste(on: bool) -> void:
	var arbol: SceneTree = get_tree()
	var pares: Array = [[arbol.physics_frame, _coste_fisica],
		[arbol.process_frame, _coste_proceso], [RenderingServer.frame_pre_draw, _coste_dibujo]]
	for par in pares:
		var senal: Signal = par[0]
		if on and not senal.is_connected(par[1]):
			senal.connect(par[1])
		elif not on and senal.is_connected(par[1]):
			senal.disconnect(par[1])
	RenderingServer.viewport_set_measure_render_time(arbol.root.get_viewport_rid(), on)
	_t_fis_us = 0
	_t_proc_us = 0
	_coste_cs_ms = -1.0
	_coste_cft_ms = -1.0
	_ticks_fis_cur = 0
	_ticks_fis = 0 if on else -1


func _coste_fisica() -> void:
	_ticks_fis_cur += 1
	if _t_fis_us == 0:
		_t_fis_us = Time.get_ticks_usec()


func _coste_proceso() -> void:
	_t_proc_us = Time.get_ticks_usec()


func _coste_dibujo() -> void:
	var desde: int = _t_fis_us if _t_fis_us > 0 else _t_proc_us
	if desde > 0:
		_coste_cs_ms = float(Time.get_ticks_usec() - desde) / 1000.0



	_coste_cft_ms = float(_t_proc_us - _t_fis_us) / 1000.0 \
			if (_t_fis_us > 0 and _t_proc_us >= _t_fis_us) else 0.0
	_t_fis_us = 0
	_t_proc_us = 0
	_ticks_fis = _ticks_fis_cur
	_ticks_fis_cur = 0


func _coste_render_cpu() -> float:
	var rid: RID = get_tree().root.get_viewport_rid()
	return RenderingServer.viewport_get_measured_render_time_cpu(rid) \
			+ RenderingServer.get_frame_setup_time_cpu()


func _coste_gpu() -> float:
	return RenderingServer.viewport_get_measured_render_time_gpu(get_tree().root.get_viewport_rid())





static func pipelines_compiladas() -> int:
	return RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_PIPELINE_COMPILATIONS_CANVAS) \
			+ RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_PIPELINE_COMPILATIONS_MESH) \
			+ RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_PIPELINE_COMPILATIONS_SURFACE) \
			+ RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_PIPELINE_COMPILATIONS_DRAW) \
			+ RenderingServer.get_rendering_info(RenderingServer.RENDERING_INFO_PIPELINE_COMPILATIONS_SPECIALIZATION)


func _cierra_medida() -> void:
	if _medidor == null:
		return
	_engancha_coste(false)
	var r: Dictionary = _medidor.resultado()
	r["sw"] = _medida_sw
	r["rs"] = 1 if _reanudado else 0
	r["gl"] = _medida_gl
	r["gr"] = _renderizador_gl()
	r["cortado"] = 0
	_medidor = null
	_medida_escena = 0
	_fps_pendiente = {}
	anota_partido_fps(r, _medida_readonly, _medida_cb, _medida_mb)





func _renderizador_gl() -> int:
	return 1 if RenderingServer.get_current_rendering_method() == "gl_compatibility" else 0





func _apunta_pendiente() -> void:
	if _medidor == null or (_medidor.ventanas as PackedFloat32Array).size() < MedidorFpsScript.MIN_VENTANAS:
		return
	var r: Dictionary = _medidor.resultado()
	r["sw"] = _medida_sw
	r["rs"] = 1 if _reanudado else 0
	r["gl"] = _medida_gl
	r["gr"] = _renderizador_gl()
	r["cortado"] = 1
	r["cb"] = _nivel_cb(_medida_cb, _medida_mb)
	_fps_pendiente = r



func _adopta_pendiente(r: Variant) -> bool:
	if not (r is Dictionary) or not r.has("med") or not r.has("p10"):
		return false
	var d: Dictionary = r
	d["cortado"] = 1
	var nivel: int = int(d.get("cb", 0))
	return anota_partido_fps(d, true, nivel >= 1, nivel == 2) or _fps.size() > 0










func anota_partido_fps(r: Dictionary, readonly: bool, calidad_baja: bool, muy_baja: bool = false) -> bool:
	if int(r.get("ventanas", 0)) < MedidorFpsScript.MIN_VENTANAS:
		return false
	var p: Dictionary = {"med": int(r["med"]), "p10": int(r["p10"]), "cb": _nivel_cb(calidad_baja, muy_baja)}
	for k in DETALLE_FPS:
		if r.has(k):
			p[k] = _entero_fps(r[k])
	_fps.append(p)
	while _fps.size() > FPS_MAX:
		_fps.pop_front()
	_touch()
	if readonly:
		return false
	if Settings.decide_calidad_auto(bool(r.get("lento", false))):
		_aviso_calidad = true
		return true
	return false






func anota_arranque(ms: int, cache_vacia: bool) -> void:
	if ms < 0:
		return
	var entrada: Dictionary = {"ms": ms, "cg": 1 if cache_vacia else 0}
	if CacheGuard.t_init >= 0:
		entrada["e"] = CacheGuard.t_init
	if CacheGuard.t_autoloads >= 0:
		entrada["au"] = CacheGuard.t_autoloads
	for k in _fases:
		entrada[k] = _fases[k]
	_arranques.append(entrada)
	while _arranques.size() > ARRANQUES_MAX:
		_arranques.pop_front()
	_arr_hoy = entrada
	_touch()







func fase_arranque(clave: String, ms: int = -1) -> void:
	if not clave in FASES_ARRANQUE or _fases.has(clave):
		return
	if ms < 0:
		ms = Time.get_ticks_msec()
	_fases[clave] = ms
	if not _arr_hoy.is_empty():
		_arr_hoy[clave] = ms
		_touch()




func tiene_fase(clave: String) -> bool:
	return _fases.has(clave)







static func lee_arranques(cfg: ConfigFile) -> Array:
	var out: Array = []
	var arranques: Variant = cfg.get_value("arr", "lista", [])
	if arranques is Array:
		for a in arranques:
			var limpia: Dictionary = limpia_arranque(a)
			if not limpia.is_empty():
				out.append(limpia)
	while out.size() > ARRANQUES_MAX:
		out.pop_front()
	return out




static func limpia_arranque(a: Variant) -> Dictionary:
	if not (a is Dictionary) or not a.has("ms"):
		return {}
	var ms: int = _entero_o_menos(a["ms"])
	if ms < 0:
		return {}
	var out: Dictionary = {"ms": ms, "cg": 1 if _entero_o_menos(a.get("cg", 0)) > 0 else 0}
	for k in FASES_ARRANQUE:
		var v: int = _entero_o_menos(a.get(k, -1))
		if v >= 0:
			out[k] = v
	return out




static func _entero_o_menos(v: Variant) -> int:
	if typeof(v) in [TYPE_INT, TYPE_FLOAT, TYPE_STRING, TYPE_BOOL]:
		return int(v)
	return -1














func ram_mb() -> int:
	var fisica: int = 0 if not meminfo_fingido.is_empty() \
			else int(OS.get_memory_info().get("physical", 0))
	if fisica > 0:
		return int(fisica / 1048576)
	if meminfo_fingido.is_empty() and not OS.has_feature("android"):
		return fisica
	return memtotal_mb(meminfo_fingido if not meminfo_fingido.is_empty() else _lee_meminfo())




static var meminfo_fingido: String = ""











static func _lee_meminfo() -> String:
	var mg: GDScript = load("res://autoload/memoria_guard.gd") as GDScript
	var ruta: String = str(mg.call("por_user", "/proc/meminfo")) if mg != null else "/proc/meminfo"
	var f: FileAccess = FileAccess.open(ruta, FileAccess.READ)
	if f == null:
		return ""
	var datos: PackedByteArray = PackedByteArray()
	while not f.eof_reached() and datos.size() < 4096:
		var trozo: PackedByteArray = f.get_buffer(4096)
		if trozo.is_empty():
			break
		datos.append_array(trozo)
	return datos.get_string_from_ascii()




static func memtotal_mb(texto: String) -> int:
	for linea in texto.split("\n", false):
		if not linea.begins_with("MemTotal:"):
			continue
		var cifra: String = linea.substr(9).strip_edges().get_slice(" ", 0)
		return int(cifra) / 1024 if cifra.is_valid_int() and int(cifra) > 0 else -1
	return -1




func anota_tiempo(segundos: float, partido: bool) -> void:
	var clave: String = "min_partido" if partido else "min_menu"
	_seg[clave] = float(_seg[clave]) + maxf(segundos, 0.0)
	if float(_seg[clave]) < 60.0:
		return
	var minutos: int = int(float(_seg[clave]) / 60.0)
	_seg[clave] = float(_seg[clave]) - minutos * 60.0
	count(clave, minutos)



func count(id: String, n: int = 1) -> void:
	if not EVENTS.has(id):
		push_warning("Telemetry: evento fuera del catálogo: %s" % id)
		return



	if n == 0:
		return
	_count[id] = int(_count.get(id, 0)) + n
	_touch()
	if mide and HITOS_ENVIO.has(id):
		_hito_pendiente = true
		_manda_hito()



func mark(id: String, value: int) -> void:
	if not MARKS.has(id):
		push_warning("Telemetry: marca fuera del catálogo: %s" % id)
		return
	if value <= int(_mark.get(id, 0)):
		return
	_mark[id] = value
	_touch()


func _touch() -> void:
	_dirty += 1
	if _dirty >= FLUSH_EVERY:
		flush()





var _sembrado: bool = false















func siembra_historial() -> void:
	if _sembrado:
		return
	_sembrado = true
	for slot in SaveSlots.MAX:
		var s: Dictionary = SaveSlots.summary(slot)
		if not bool(s.get("exists", false)):
			continue
		count("gol_antes", int(s.get("goals", 0)))
		count("asistencia_antes", int(s.get("assists", 0)))
		count("partido_antes", int(s.get("matches", 0)))
		count("titulo_antes", int(s.get("cups_team", 0)))
		count("premio_antes", int(s.get("cups_solo", 0)))
		mark("goles_carrera_max", int(s.get("goals", 0)))
		mark("asistencias_carrera_max", int(s.get("assists", 0)))
		mark("titulos_carrera_max", int(s.get("cups_team", 0)))
	flush()






func report() -> String:
	var out: PackedStringArray = PackedStringArray()
	for id in EVENTS:
		out.append("%-34s %d" % [I18n.t(String(EVENTS[id])), int(_count.get(id, 0))])
	out.append("")
	for id in MARKS:
		out.append("%-34s %d" % [I18n.t(String(MARKS[id])), int(_mark.get(id, 0))])
	return "\n".join(out)




func reset() -> void:
	_count.clear()
	_mark.clear()
	_fps.clear()
	_arranques.clear()
	_cierres.clear()
	_menu = _menu_entero({})
	_rea.clear()
	flush()


func flush() -> void:























	if GameState.readonly_save and not mide:
		return
	_dirty = 0
	var cfg: ConfigFile = ConfigFile.new()
	for id in _count:
		cfg.set_value("count", String(id), int(_count[id]))
	for id in _mark:
		cfg.set_value("mark", String(id), int(_mark[id]))
	if _install_id != "":
		cfg.set_value("meta", "install_id", _install_id)
	if _sembrado:
		cfg.set_value("meta", "sembrado", true)
	if not _fps.is_empty():
		cfg.set_value("fps", "partidos", _fps)
	if not _fps_pendiente.is_empty():
		cfg.set_value("fps", "pendiente", _fps_pendiente)
	if not _arranques.is_empty():
		cfg.set_value("arr", "lista", _arranques)
	if not _cierres.is_empty():
		cfg.set_value("cierre", "lista", _cierres)

	cfg.set_value("menu", "contadores", _menu)
	if not _rea.is_empty():
		cfg.set_value("rea", "lista", _rea)
	cfg.save(save_path)


func _load() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path) != OK:
		return


	for id in EVENTS:
		if cfg.has_section_key("count", id):
			_count[id] = int(cfg.get_value("count", id, 0))
	for id in MARKS:
		if cfg.has_section_key("mark", id):
			_mark[id] = int(cfg.get_value("mark", id, 0))



	_install_id = str(cfg.get_value("meta", "install_id", ""))
	_sembrado = bool(cfg.get_value("meta", "sembrado", false))


	var guardados: Variant = cfg.get_value("fps", "partidos", [])
	if guardados is Array:
		for p in guardados:
			if p is Dictionary and p.has("med") and p.has("p10"):
				var q: Dictionary = {"med": int(p["med"]), "p10": int(p["p10"]),
					"cb": int(p.get("cb", 0))}
				for k in DETALLE_FPS:
					if p.has(k):
						q[k] = _entero_fps(p[k])
				_fps.append(q)
		while _fps.size() > FPS_MAX:
			_fps.pop_front()



	_adopta_pendiente(cfg.get_value("fps", "pendiente", {}))
	_fps_pendiente = {}

	_arranques.append_array(lee_arranques(cfg))
	while _arranques.size() > ARRANQUES_MAX:
		_arranques.pop_front()

	var cierres: Variant = cfg.get_value("cierre", "lista", [])
	if cierres is Array:
		for c in cierres:
			if c is Dictionary:
				_cierres.append(_cierre_entero(c))
		while _cierres.size() > CIERRES_MAX:
			_cierres.pop_front()


	_menu = _menu_entero(cfg.get_value("menu", "contadores", {}))
	_rea.clear()
	var reas: Variant = cfg.get_value("rea", "lista", [])
	if reas is Array:
		for a in reas:
			var e: Dictionary = _rea_entera(a)
			if not e.is_empty():
				_rea.append(e)
		while _rea.size() > REA_MAX:
			_rea.pop_front()





static func _entero_fps(v: Variant) -> Variant:
	if v is Array or v is PackedInt32Array:
		var out: Array = []
		for x in Array(v).slice(0, 5):
			out.append(int(x) if (x is int or x is float) else -1)
		return out
	if v is int or v is float or v is bool:
		return int(v)
	return -1


















const ENDPOINT: String = "https://www.footballlegacy.org/api/t.php"


const SEND_TIMEOUT: float = 8.0

var _install_id: String = ""


var _http: HTTPRequest = null

var _en_vuelo: bool = false





var _ultimo_envio: float = -1.0
const ENVIO_CADA: float = 300.0













const HITOS_ENVIO: Array[String] = ["academia_fin", "carrera_nueva", "primer_gol"]

var _hito_pendiente: bool = false




var endpoint_test: String = ""




func endpoint() -> String:
	return endpoint_test if endpoint_test != "" else ENDPOINT










func install_id() -> String:
	if _install_id != "":
		return _install_id
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.randomize()
	var hex: PackedStringArray = PackedStringArray()
	for i in 8:
		hex.append("%08x" % rng.randi())
	_install_id = "".join(hex).substr(0, 32)
	_touch()
	return _install_id




func payload() -> Dictionary:
	var counts: Dictionary = {}
	for id in EVENTS:
		counts[id] = int(_count.get(id, 0))
	var marks: Dictionary = {}
	for id in MARKS:
		marks[id] = int(_mark.get(id, 0))
	return {
		"id": install_id(),
		"version": version(),
		"locale": Settings.locale,
		"plataforma": OS.get_name(),




		"modelo": OS.get_model_name(),
		"so": OS.get_version(),
		"cuando": Time.get_datetime_string_from_system(true),
		"count": counts,
		"mark": marks,





		"gpu": RenderingServer.get_video_adapter_name(),





		"driver": RenderingServer.get_current_rendering_driver_name(),
		"render": RenderingServer.get_current_rendering_method(),

		"calidad_baja": Settings.nivel_calidad(),
		"fps": _fps.duplicate(true),
		"swappy": swappy_modo(),




		"ram": ram_mb(),
		"arr": _arranques.duplicate(true),





		"resc": rescate_arranque(),





		"cierres": _cierres.duplicate(true),





		"menu": _menu.duplicate(true),
		"rea": _rea.duplicate(true),
	}






const SELLO_ANDROID: String = "res://version_android.txt"








func version() -> String:
	var android: bool = OS.has_feature("android")
	var sello: String = ""
	if android and FileAccess.file_exists(SELLO_ANDROID):
		sello = FileAccess.get_file_as_string(SELLO_ANDROID)
	return version_de(android, sello,
		str(ProjectSettings.get_setting("application/config/version", "")))






static func version_de(es_android: bool, sello: String, config: String) -> String:
	var s: String = sello.strip_edges()
	if es_android and s.is_valid_int() and int(s) > 0:
		return s
	return config











static func rescate_arranque(ruta: String = "user://arranque_modo.txt") -> Dictionary:
	if not FileAccess.file_exists(ruta):
		return {}
	var out: Dictionary = {}
	for linea in FileAccess.get_file_as_string(ruta).split("\n"):
		var kv: PackedStringArray = linea.strip_edges().split("=")
		if kv.size() == 2 and kv[1].is_valid_int():
			out[kv[0]] = int(kv[1])
	return out


func swappy_modo() -> int:
	if not OS.has_feature("android"):
		return -1
	if not bool(ProjectSettings.get_setting(
			"display/window/frame_pacing/android/enable_frame_pacing", true)):
		return -1
	return int(ProjectSettings.get_setting("display/window/frame_pacing/android/swappy_mode", -1))






func puede_enviar() -> bool:
	return (endpoint() != "" and Settings.telemetria_envio and not GameState.readonly_save
		and not OS.has_feature("banco"))











func try_send(forzar: bool = false) -> bool:
	if not puede_enviar():
		return false
	if _http == null or _en_vuelo:
		return false

	var ahora: float = Time.get_ticks_msec() / 1000.0
	if not forzar and _ultimo_envio >= 0.0 and ahora - _ultimo_envio < ENVIO_CADA:
		return false
	_ultimo_envio = ahora
	var err: int = _http.request(endpoint(), ["Content-Type: application/json"],
		HTTPClient.METHOD_POST, JSON.stringify(payload()))






	_en_vuelo = err == OK or err == ERR_CANT_CONNECT
	return err == OK





func _manda_hito() -> void:
	if not puede_enviar() or try_send():
		_hito_pendiente = false


func _on_sent(_result: int, _code: int, _headers: PackedStringArray, _body: PackedByteArray) -> void:



	_en_vuelo = false





func _limpia_http() -> void:
	if _http != null:
		_http.cancel_request()
	_en_vuelo = false





























func _notification(what: int) -> void:



	if what == NOTIFICATION_APPLICATION_PAUSED:
		_pausado_fondo = true
		_pausado_us = Time.get_ticks_usec()



		fase_arranque("pf")
		_apunta_pendiente()
	elif what == NOTIFICATION_APPLICATION_RESUMED:
		_prev_tick_fps_us = Time.get_ticks_usec()
		if _pausado_fondo and _medidor != null:
			_reanudado = true
		_pausado_fondo = false

		_menu_salta = true


		if _pausado_us >= 0:
			var t0: int = Time.get_ticks_usec()
			var fondo_s: float = float(t0 - _pausado_us) / 1000000.0
			_pausado_us = -1
			if not _rea_pendiente:
				_rea_pendiente = true
				RenderingServer.frame_post_draw.connect(
					_rea_primer_cuadro.bind(t0, fondo_s), CONNECT_ONE_SHOT)
	if what == NOTIFICATION_APPLICATION_PAUSED \
			or what == NOTIFICATION_WM_CLOSE_REQUEST \
			or what == NOTIFICATION_PREDELETE:
		flush()


		_escribe_viva(false)
	elif what == NOTIFICATION_APPLICATION_RESUMED and mide:



		_ultimo_tick = Time.get_ticks_msec()
		_escribe_viva(true)










	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_FOCUS_IN:
		_activa = what == NOTIFICATION_APPLICATION_FOCUS_IN
		if not _activa:
			fase_arranque("pf")
		if _viva:
			_escribe_viva(true)



	if what == NOTIFICATION_APPLICATION_PAUSED:
		try_send()
