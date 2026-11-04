extends Node



































signal modo_cambiado(modo: int)


signal mando_perdido



signal dispositivo_cambiado(dev: int)


signal botones_cambiados

enum Modo{TACTIL, RATON_TECLADO, MANDO}



const CAPA_GROUP: String = "fl_capa_foco"


const SIN_FOCO_GROUP: String = "fl_sin_foco"

const PRIMERO_META: String = "fl_foco_primero"



const PELIGRO_META: String = CareerTheme.PELIGRO_META


const AUTO_META: String = "fl_foco_auto"

const SIGUE_META: String = "fl_sigue_foco"




const SIN_FOCO_META: String = "fl_sin_foco_propio"

const PREVIO_META: String = "fl_foco_previo"


const DIBUJO_META: String = "fl_anillo_dibujado"


const HUNDIDO_META: String = "fl_hundido"


const PULSADO_S: float = 0.12
const UI_KIT_PATH: String = "res://ui/ui_kit.gd"


const UMBRAL_EJE: float = 0.5

const REINTENTO_S: float = 0.25




const TOQUE_DISPOSITIVO: int = 9090




const TOQUE_META: String = "fl_toque_foco"


const STICK_PROPIO_META: String = "fl_stick_propio"









const A_AVANZA_META: String = "fl_a_avanza"


const SCROLL_ZM: float = 0.3
const SCROLL_PX_S: float = 1400.0







const JUEGOS_CON_MANDO: Array[String] = ["arcade", "snake", "dardos", "pingpong",
	"simulador", "poker", "espejo_inteligente", "mesa_holografica",
	"canasta_basket", "basket", "billar",

	"piano",


	"pared_reflejos", "memorama",


	"chinchanpu", "botella", "dominadas", "himno", "trueno", "apreton"]




const VIBRA: Array = [[12, 0.2, 0.0], [39, 0.3, 0.2], [59, 0.4, 0.6], [1<<30, 0.5, 0.8]]


const VIBRA_MIN_S: float = 0.03
const VIBRA_MAX_S: float = 0.12





const BOTON_POS: Dictionary = {
	"fl_avanza": "abajo", "fl_atras": "derecha", "fl_toque": "izquierda", "fl_modo": "arriba",
	"fl_pausa": "start", "fl_camara": "r3", "fl_mantener": "lb", "fl_objetivo": "rb",
}






const BOTON_NOMBRE: Dictionary = {
	"xbox": {"abajo": "A", "derecha": "B", "izquierda": "X", "arriba": "Y", "lb": "LB",
		"rb": "RB", "lt": "LT", "rt": "RT", "start": "START", "back": "BACK", "r3": "R3",


		"ls": "LS", "rs": "RS"},
	"ps": {"lb": "L1", "rb": "R1", "lt": "L2", "rt": "R2", "start": "OPTIONS",
		"back": "SHARE", "r3": "R3"},
	"switch": {"abajo": "B", "derecha": "A", "izquierda": "Y", "arriba": "X", "lb": "L",
		"rb": "R", "lt": "ZL", "rt": "ZR", "start": "+", "back": "-", "r3": "R3"},




	"switch_ab": {"abajo": "A", "derecha": "B", "izquierda": "Y", "arriba": "X", "lb": "L",
		"rb": "R", "lt": "ZL", "rt": "ZR", "start": "+", "back": "-", "r3": "R3"},





	"teclado": {"derecha": "ESC", "izquierda": "F", "arriba": "TAB", "rb": "R",
		"start": "ESC", "r3": "C"},
}

const CAREER_UI_PATH: String = "res://ui/career_ui.gd"
const CAREER_THEME_PATH: String = "res://ui/career_theme.gd"


const TECLADO_PATH: String = "res://ui/teclado_mando.gd"



const TECLADO_SIN_MAYUS_META: String = "fl_teclado_sin_mayus"
const GLIFOS_PATH: String = "res://ui/glifos.gd"



const ACCIONES: Dictionary = {
	"fl_avanza": [JOY_BUTTON_A],
	"fl_atras": [JOY_BUTTON_B],
	"fl_modo": [JOY_BUTTON_Y],
	"fl_pausa": [JOY_BUTTON_START],
	"fl_camara": [JOY_BUTTON_BACK, JOY_BUTTON_RIGHT_STICK],
	"fl_mantener": [JOY_BUTTON_LEFT_SHOULDER],
	"fl_toque": [JOY_BUTTON_X],

	"fl_objetivo": [JOY_BUTTON_RIGHT_SHOULDER],
}
const NAV_ACCIONES: Array[StringName] = [&"ui_up", &"ui_down", &"ui_left", &"ui_right",
	&"ui_focus_next", &"ui_focus_prev"]


























const TECLAS: Dictionary = {
	"fl_avanza": [KEY_SPACE, KEY_ENTER, KEY_KP_ENTER],
	"fl_atras": [KEY_ESCAPE],
	"fl_modo": [KEY_TAB],
	"fl_camara": [KEY_C],
	"fl_mantener": [KEY_SHIFT],
	"fl_toque": [KEY_F],
	"fl_objetivo": [KEY_R],
}
const TECLA_SUFIJO: String = "_tecla"





const TEC_ARRANQUE: float = 0.3
const TEC_CARGA_S: float = 1.0




const TEC_GRACIA_MS: int = 90






const TECLA_CORRE: Key = KEY_E




const CORRE_ACCION: String = "fl_corre"



const REMAPEABLES: Array[String] = ["fl_avanza", "fl_modo", "fl_toque", "fl_objetivo",
	"fl_mantener", CORRE_ACCION, "fl_camara"]


const RESERVADAS: Array[int] = [KEY_W, KEY_A, KEY_S, KEY_D, KEY_UP, KEY_DOWN, KEY_LEFT,
	KEY_RIGHT, KEY_ESCAPE, KEY_ENTER, KEY_KP_ENTER, KEY_META]


const SITIO_TECLA: Dictionary = {"abajo": "fl_avanza", "derecha": "fl_atras",
	"izquierda": "fl_toque", "arriba": "fl_modo", "start": "fl_atras", "r3": "fl_camara",
	"lb": "fl_mantener", "rb": "fl_objetivo"}

const TECLA_CORTA: Dictionary = {KEY_BACKSPACE: "BKSP", KEY_CAPSLOCK: "CAPS",
	KEY_DELETE: "DEL", KEY_INSERT: "INS", KEY_PAGEUP: "PGUP", KEY_PAGEDOWN: "PGDN"}

var _acepta_extra: int = KEY_NONE


const RT_CORRE: Array[String] = [
	"Arrastra hacia atrás para correr · cruza al campo rival",
	"Arrastra hacia atrás para correr · lleva el balón a la zona roja",
]

var modo: int = Modo.TACTIL

var dispositivo: int = 0



var familia: String = "generico":
	set(v):
		familia = v
		if is_inside_tree():
			_mapa_ab()

var _ab_en_mapa: bool = false

var _capa: Node = null
var _capa_id: int = 0
var _reintento_s: float = 0.0
var _ultimo_foco: Dictionary = {}



var _nav_lado: int = -1
var _nav_fotograma: int = -10
var _anillados: Array[WeakRef] = []
var _anillo: StyleBoxFlat = null
var _cu: GDScript = null


var _toque_on: bool = false
var _toque_pos: Vector2 = Vector2.ZERO


var conectados_fingidos: Array[int] = []

var ultima_vibracion: Vector3 = Vector3.ZERO













const VIVO_GROUP: String = "fl_texto_vivo"


const HERMANOS_MAX: int = 256
var _hermanos: Dictionary = {}

var _ultimo: String = ""
var _ultimo_frame: int = -1












const TEXTO_TECLADO: Dictionary = {
	"Toca para saltar": "Pulsa {0} para saltar",
	"Toca para continuar": "Pulsa {0} para continuar",
	"TOCA PARA EMPEZAR": "PULSA {0} PARA EMPEZAR",
	"TOCA PARA JUGAR": "PULSA {0} PARA JUGAR",
	"CENTRO · apunta y pulsa el botón": "CENTRO · apunta y pulsa {0}",
	"Apunta con el stick · pulsa el botón": "Apunta con WASD · pulsa {0}",
	"Arrastra para moverte · toca el balón y remata": "WASD para moverte · llega al balón y remata",
	"Arrastra para seguir": "Pulsa WASD o una flecha para seguir",
	"CABEZAZO · arrastra hacia atrás para apuntar": "CABEZAZO · mantén una flecha y suelta",
	"TOCA PARA CONTINUAR": "HAZ CLIC PARA CONTINUAR",
	"TOCA EN EL ARO": "HAZ CLIC EN EL ARO",
	"¡DESLIZA HACIA ÉL!": "¡ARRASTRA HACIA ÉL!",
	"Gira el campo con el dedo. Los esquemas son de consulta.":
		"Arrastra para girar el campo. Los esquemas son de consulta.",
	"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.":
		"El coche acelera solo. Gira con las flechas y frena con la de abajo.",
	"Desliza el balón hacia la canasta. Más rápido, más fuerte.":
		"Arrastra el balón hacia la canasta. Más rápido, más fuerte.",
	"DESLIZA HACIA LA CANASTA": "ARRASTRA HACIA LA CANASTA",
	"TOCA PARA OTRA": "HAZ CLIC PARA OTRA",
	"DESLIZA PARA GIRAR": "USA LAS FLECHAS PARA GIRAR",
	"Desliza hacia el aro y suelta.": "Arrastra hacia el aro y suelta.",


	"Mientras apuntas, toca a un compañero: cada toque cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.":
		"Mientras apuntas, {0} elige compañero y {1} cambia su orden. Celeste corre al arco, ámbar se queda, magenta se lleva a su marcador.",





	"Toca a tu jugador para empezar": "Pulsa WASD para empezar",
	"Arrastra hacia atrás para correr · cruza al campo rival": "Mantén {0} para correr · cruza al campo rival",
	"Arrastra hacia atrás para correr · lleva el balón a la zona roja":
		"Mantén {0} para correr · lleva el balón a la zona roja",
	"Toca en el blanco para barrerte": "Pulsa {0} en el blanco para barrerte",


	"TOCA LAS TECLAS": "PULSA LAS TECLAS O HAZ CLIC",
}



var _tec_rumbo: Vector2i = Vector2i.ZERO
var _tec_carga: float = 0.0
var _tec_falta_ms: int = -1


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


	if sin_dedo():
		modo = Modo.RATON_TECLADO
	_registra_acciones()
	Input.joy_connection_changed.connect(_on_joy_conexion)
	get_viewport().gui_focus_changed.connect(_on_foco)
	get_tree().node_added.connect(_on_nodo)
	add_child(load("res://ui/teclado_virtual.gd").new())


func _registra_acciones() -> void:
	for accion in ACCIONES:
		if not InputMap.has_action(accion):
			InputMap.add_action(accion, UMBRAL_EJE)
		for b in ACCIONES[accion]:
			_boton_a(accion, b)


	_boton_a("ui_accept", JOY_BUTTON_A)
	_boton_a("ui_cancel", JOY_BUTTON_B)
	_ab_en_mapa = false
	_mapa_ab()

	for accion in TECLAS:
		if accion in REMAPEABLES:
			continue
		var nombre: String = accion + TECLA_SUFIJO
		if not InputMap.has_action(nombre):
			InputMap.add_action(nombre)
		for k in TECLAS[accion]:
			var ev: InputEventKey = InputEventKey.new()
			ev.physical_keycode = k
			if not InputMap.action_has_event(nombre, ev):
				InputMap.action_add_event(nombre, ev)
	_vuelca_teclas()







func _vuelca_teclas() -> void:
	var mapa: Dictionary = mapa_teclas()
	for a in REMAPEABLES:
		var nombre: String = a + TECLA_SUFIJO
		if not InputMap.has_action(nombre):
			InputMap.add_action(nombre)
		InputMap.action_erase_events(nombre)
		var teclas: Array = [mapa[a]]
		if a == "fl_avanza":
			teclas.append_array([KEY_ENTER, KEY_KP_ENTER])
		for k in teclas:
			InputMap.action_add_event(nombre, _ev_tecla(k))
	if _acepta_extra != KEY_NONE:
		InputMap.action_erase_event("ui_accept", _ev_tecla(_acepta_extra))
		_acepta_extra = KEY_NONE

	if int(mapa["fl_avanza"]) != KEY_SPACE:
		_acepta_extra = int(mapa["fl_avanza"])
		InputMap.action_add_event("ui_accept", _ev_tecla(_acepta_extra))


static func _ev_tecla(k: int) -> InputEventKey:
	var ev: InputEventKey = InputEventKey.new()
	ev.physical_keycode = k as Key
	return ev










func aplica_teclas() -> void:
	var antes: Dictionary = {}
	for pos in SITIO_TECLA:
		antes[pos] = _nombre_en("teclado", pos)
	var corre_antes: String = tecla_corre()
	_vuelca_teclas()
	var cambio: Dictionary = {}
	for pos in antes:
		var n: String = _nombre_en("teclado", pos)
		if n != antes[pos]:
			cambio[antes[pos]] = n
	if tecla_corre() != corre_antes:
		cambio[corre_antes] = tecla_corre()
	if not cambio.is_empty():
		for t in _hermanos:
			var p: Array = _hermanos[t]
			if familia_tabla(p[4]) != "teclado":
				continue
			p[3] =(p[3] as Array).map(func(a): return cambio.get(a, a) if a is String else a)
	_repinta_vivos()
	botones_cambiados.emit()



func mapa_teclas() -> Dictionary:
	return teclas_saneadas(Settings.teclas)



static func tecla_def(accion: String) -> Key:
	if accion == CORRE_ACCION:
		return TECLA_CORRE
	var fijas: Array = TECLAS.get(accion, [])
	return fijas[0] if not fijas.is_empty() else KEY_NONE


static func es_reservada(k: int) -> bool:
	return k in RESERVADAS






static func teclas_saneadas(guardado: Dictionary) -> Dictionary:
	var mapa: Dictionary = {}
	for a in REMAPEABLES:
		mapa[a] = int(tecla_def(a))
		var v = guardado.get(a)
		if (v is int or v is float) and int(v) > 0 and not es_reservada(int(v)):
			mapa[a] = int(v)
	var vistas: Dictionary = {}
	for a in REMAPEABLES:
		if vistas.has(mapa[a]):
			return teclas_saneadas({})
		vistas[mapa[a]] = true
	return mapa




static func intercambia(mapa: Dictionary, accion: String, k: int) -> Dictionary:
	var out: Dictionary = mapa.duplicate()
	if es_reservada(k) or k == KEY_NONE or not out.has(accion):
		return out
	var vieja: int = int(out[accion])
	for a in out:
		if a != accion and int(out[a]) == k:
			out[a] = vieja
	out[accion] = k
	return out



static func solo_cambios(mapa: Dictionary) -> Dictionary:
	var out: Dictionary = {}
	for a in REMAPEABLES:
		if mapa.has(a) and int(mapa[a]) != int(tecla_def(a)):
			out[a] = int(mapa[a])
	return out


func _boton_a(accion: String, boton: JoyButton) -> void:
	var ev: InputEventJoypadButton = InputEventJoypadButton.new()
	ev.device = -1
	ev.button_index = boton
	if not InputMap.action_has_event(accion, ev):
		InputMap.action_add_event(accion, ev)





func aplica_ab() -> void:
	_mapa_ab()
	_repinta_vivos()
	botones_cambiados.emit()




func familia_ab(fam: String) -> String:
	return "switch_ab" if fam == "switch" and Settings.mando_ab_nintendo else fam










func _mapa_ab() -> void:
	var fam: String = familia if modo == Modo.MANDO else familia_conectada()
	var cruza: bool = familia_ab(fam) == "switch_ab"
	if cruza == _ab_en_mapa:
		return
	_ab_en_mapa = cruza
	var ok: JoyButton = JOY_BUTTON_B if cruza else JOY_BUTTON_A
	var no: JoyButton = JOY_BUTTON_A if cruza else JOY_BUTTON_B
	for accion in ["fl_avanza", "ui_accept"]:
		_solo_ab(accion, ok)
	for accion in ["fl_atras", "ui_cancel"]:
		_solo_ab(accion, no)



func _solo_ab(accion: String, boton: JoyButton) -> void:
	for b in [JOY_BUTTON_A, JOY_BUTTON_B]:
		var ev: InputEventJoypadButton = InputEventJoypadButton.new()
		ev.device = -1
		ev.button_index = b
		if b != boton and InputMap.action_has_event(accion, ev):
			InputMap.action_erase_event(accion, ev)
	_boton_a(accion, boton)



func hay_mando() -> bool:
	return modo == Modo.MANDO





func mando_nintendo() -> bool:
	return hay_mando() and familia == "switch"






func conectados() -> Array[int]:
	var hay: Array[int] = []
	for dev in Input.get_connected_joypads() + conectados_fingidos:
		if not hay.has(dev):
			hay.append(dev)
	return hay






func familia_conectada() -> String:
	var hay: Array[int] = conectados()
	if hay.is_empty():
		return ""
	var dev: int = dispositivo if hay.has(dispositivo) else hay[0]
	var nombre: String = Input.get_joy_name(dev)
	return familia if nombre.is_empty() else familia_de(nombre)




func eje(izq: bool) -> Vector2:
	if izq:
		return Vector2(Input.get_joy_axis(dispositivo, JOY_AXIS_LEFT_X),
			Input.get_joy_axis(dispositivo, JOY_AXIS_LEFT_Y))
	return Vector2(Input.get_joy_axis(dispositivo, JOY_AXIS_RIGHT_X),
		Input.get_joy_axis(dispositivo, JOY_AXIS_RIGHT_Y))




func sin_dedo() -> bool:
	return SteamPuente.es_steam()




func teclado_juega() -> bool:
	return modo == Modo.RATON_TECLADO and sin_dedo()



func pad_juega() -> bool:
	return modo == Modo.MANDO or teclado_juega()








const RATON_MUEVE_PX: float = 3.0
var _raton_manda: bool = false


func raton_juega() -> bool:
	return modo == Modo.RATON_TECLADO and _raton_manda






func eje_pad(izq: bool) -> Vector2:
	if modo == Modo.MANDO:
		return eje(izq)
	if not teclado_juega():
		return Vector2.ZERO
	if izq:
		return Vector2(_tecla(KEY_D) - _tecla(KEY_A), _tecla(KEY_S) - _tecla(KEY_W)).normalized()
	return Vector2(_tec_rumbo).normalized() * _tec_carga


static func _tecla(k: Key) -> float:
	return 1.0 if Input.is_physical_key_pressed(k) else 0.0




func corre_tecla() -> bool:
	return teclado_juega() and Input.is_action_pressed(CORRE_ACCION + TECLA_SUFIJO)



static func tecla_corre() -> String:
	return nombre_frase(tecla_de(CORRE_ACCION))




static func tecla_sitio(pos: String) -> Key:
	return tecla_de(String(SITIO_TECLA[pos])) if SITIO_TECLA.has(pos) else KEY_NONE




static func nombre_frase(k: Key) -> String:
	if k == KEY_SPACE:
		return _tecla_nombre("abajo")
	if k == KEY_SHIFT:
		return _tecla_nombre("lb")
	return nombre_tecla(k)





func acepta(event: InputEvent) -> bool:
	if event is InputEventKey and teclado_juega():
		return event.is_action_pressed("fl_avanza" + TECLA_SUFIJO)
	return event.is_action_pressed("ui_accept")





func boton_corre() -> String:
	return tecla_corre() if teclado_juega() else boton("rt")



func pulsada(accion: String) -> bool:
	return Input.is_action_pressed(accion) \
			or (teclado_juega() and Input.is_action_pressed(accion + TECLA_SUFIJO))


func recien_pulsada(accion: String) -> bool:
	return Input.is_action_just_pressed(accion) \
			or (teclado_juega() and Input.is_action_just_pressed(accion + TECLA_SUFIJO))




func accion_tecla(k: InputEventKey) -> String:
	if not teclado_juega():
		return ""
	for accion in TECLAS:
		if k.is_action(accion + TECLA_SUFIJO):
			return accion
	return ""





static func wasd() -> String:

	if DisplayServer.get_name() == "headless":
		return "WASD"
	var out: String = ""
	for k in [KEY_W, KEY_A, KEY_S, KEY_D]:
		var l: Key = DisplayServer.keyboard_get_keycode_from_physical(k)
		var s: String = OS.get_keycode_string(l) if l != KEY_NONE else ""
		if s.length() != 1:
			return "WASD"
		out += s.to_upper()
	return out






static func tecla_de(accion: String) -> Key:
	var nombre: String = accion + TECLA_SUFIJO
	if InputMap.has_action(nombre):
		for ev in InputMap.action_get_events(nombre):
			var k: InputEventKey = ev as InputEventKey
			if k != null:
				return k.physical_keycode if k.physical_keycode != KEY_NONE else k.keycode
	var fijas: Array = TECLAS.get(accion, [])
	return fijas[0] if not fijas.is_empty() else KEY_NONE






static func nombre_tecla(k: Key) -> String:
	var l: Key = KEY_NONE




	if OS.has_feature("pc") and DisplayServer.get_name() != "headless":
		l = DisplayServer.keyboard_get_keycode_from_physical(k)
	return nombre_en(k, l)










static func nombre_en(k: Key, l: Key) -> String:
	if k == KEY_ESCAPE:
		return "ESC"
	if k == KEY_TAB:
		return "TAB"
	var q: Key = l if l != KEY_NONE else k
	if TECLA_CORTA.has(q):
		return String(TECLA_CORTA[q])
	var s: String = OS.get_keycode_string(q).to_upper()
	if s.length() != 1 and (q&KEY_SPECIAL) == 0 and q > KEY_SPACE:
		s = char(q).to_upper()
	s = s.replace(" ", "")
	return s if s.length() <= 5 else s.left(4)





func familia_ahora() -> String:
	return "teclado" if teclado_juega() else familia_ab(familia)





func _tec_tick(delta: float) -> void:
	var r: Vector2i = Vector2i(int(_tecla(KEY_RIGHT) - _tecla(KEY_LEFT)),
		int(_tecla(KEY_DOWN) - _tecla(KEY_UP)))
	if r == Vector2i.ZERO:
		_tec_rumbo = Vector2i.ZERO
		_tec_carga = 0.0
		_tec_falta_ms = -1
		return
	if _tec_carga <= 0.0:
		_tec_rumbo = r
		_tec_carga = TEC_ARRANQUE
		_tec_falta_ms = -1
		return
	_tec_carga = minf(1.0, _tec_carga + delta *(1.0 - TEC_ARRANQUE) / TEC_CARGA_S)
	if r == _tec_rumbo:
		_tec_falta_ms = -1
		return
	var ahora: int = Time.get_ticks_msec()
	if absi(r.x) + absi(r.y) >= absi(_tec_rumbo.x) + absi(_tec_rumbo.y):
		_tec_rumbo = r
		_tec_falta_ms = -1
	elif _tec_falta_ms < 0:
		_tec_falta_ms = ahora
	elif ahora - _tec_falta_ms > TEC_GRACIA_MS:
		_tec_rumbo = r
		_tec_falta_ms = -1








func texto(dedo: String, mando: String) -> String:
	var t: String
	if _habla_tecla(dedo):
		t = _tec_texto(dedo, [])
	else:
		t = I18n.t(mando if modo == Modo.MANDO else dedo)
	_apunta(t, dedo, mando, [], [], false)
	return t



func texto_f(dedo: String, mando: String, args_dedo: Array = [],
		args_mando: Array = []) -> String:
	var t: String
	if modo == Modo.MANDO:
		t = I18n.tf(mando, args_mando)
	elif _habla_tecla(dedo):
		t = _tec_texto(dedo, args_mando)
	else:
		t = I18n.tf(dedo, args_dedo) if not args_dedo.is_empty() else I18n.t(dedo)
	_apunta(t, dedo, mando, args_dedo, args_mando, true)
	return t







func _apunta(t: String, dedo: String, mando: String, ad: Array, am: Array, es_f: bool) -> void:
	_ultimo = t
	_ultimo_frame = Engine.get_process_frames()
	if t.is_empty():
		return
	var p = _hermanos.get(t)
	var fam: String = familia_ahora()
	if p != null and p[0] == dedo and p[1] == mando and p[4] == fam and p[2] == ad \
			and p[3] == am:
		return
	if _hermanos.size() >= HERMANOS_MAX:
		_hermanos.clear()
	_hermanos[t] = [dedo, mando, ad.duplicate(), am.duplicate(), fam, es_f]





func recien(t: String) -> bool:
	return t == _ultimo and Engine.get_process_frames() == _ultimo_frame






func repintado(s: String) -> String:
	if s.is_empty() or _hermanos.is_empty():
		return s
	if _hermanos.has(s):
		return _re(_hermanos[s])
	var claves: Array = _hermanos.keys().filter(func(k: String) -> bool: return s.contains(k))
	if claves.is_empty():
		return s
	claves.sort_custom(func(a: String, b: String) -> bool: return a.length() > b.length())




	var tramos: Array = []
	for k in claves:
		var nuevo: String = ""
		var desde: int = 0
		while true:
			var i: int = s.find(k, desde)
			if i < 0:
				break
			var f: int = i + k.length()
			var pisa: bool = false
			for t in tramos:
				if i < t[1] and f > t[0]:
					pisa = true
					break
			if pisa:
				desde = i + 1
				continue
			if nuevo.is_empty():
				nuevo = _re(_hermanos[k])
			tramos.append([i, f, nuevo])
			desde = f
	tramos.sort_custom(func(a: Array, b: Array) -> bool: return a[0] < b[0])
	var out: String = ""
	var cursor: int = 0
	for t in tramos:
		out += s.substr(cursor, t[0] - cursor) + t[2]
		cursor = t[1]
	return out + s.substr(cursor)




func _re(p: Array) -> String:
	var n: String = _resuelve(p)
	if not n.is_empty():
		_hermanos[n] = [p[0], p[1], p[2], _reboton(p[3], p[4], p[0]), familia_ahora(), p[5]]
	return n


func _resuelve(p: Array) -> String:
	if modo == Modo.MANDO:
		return I18n.tf(p[1], _reboton(p[3], p[4], p[0])) if p[5] else I18n.t(p[1])
	if _habla_tecla(p[0]):
		return _tec_texto(p[0], _reboton(p[3], p[4], p[0]))
	return I18n.tf(p[0], p[2]) if not (p[2] as Array).is_empty() else I18n.t(p[0])












func _reboton(args: Array, fam: String, dedo: String = "") -> Array:
	var ahora: String = familia_ahora()
	if args.is_empty() or familia_tabla(fam) == familia_tabla(ahora):
		return args
	var corre: bool = dedo in RT_CORRE
	var a_tec: bool = familia_tabla(ahora) == "teclado"
	var out: Array = []
	for a in args:
		var n = a
		if a is String:
			if corre and familia_tabla(fam) == "teclado" and a == tecla_corre():
				n = _nombre_en(ahora, "rt")
			else:
				for pos in BOTON_NOMBRE["xbox"]:
					if _nombre_en(fam, pos) == a:
						if pos == "rt" and a_tec:
							n = tecla_corre() if corre else _nombre_en(ahora, "abajo")
						else:
							n = _nombre_en(ahora, pos)
						break
		out.append(n)
	return out






func _repinta_vivos() -> void:
	if _hermanos.is_empty() or not is_inside_tree():
		return
	for n in SceneFade.grupo(VIVO_GROUP):
		if not is_instance_valid(n) or n.is_queued_for_deletion() or not ("text" in n):
			continue
		var viejo: String = String(n.get("text"))
		var nuevo: String = repintado(viejo)
		if nuevo != viejo:
			n.set("text", nuevo)






func boton(accion: String) -> String:
	return _nombre_en(familia_ahora(), String(BOTON_POS.get(accion, accion)))




static func _nombre_en(fam: String, pos: String) -> String:
	var t: String = familia_tabla(fam)
	if t == "ps" and pos in ["abajo", "derecha", "izquierda", "arriba"]:
		return _cara_ps(pos)

	if t == "teclado" and SITIO_TECLA.has(pos):
		return nombre_frase(tecla_sitio(pos))
	return String(BOTON_NOMBRE[t].get(pos, BOTON_NOMBRE["xbox"].get(pos, "A")))



static func familia_tabla(fam: String) -> String:
	return fam if fam in ["ps", "switch", "switch_ab", "teclado"] else "xbox"




static func _tecla_nombre(pos: String) -> String:
	return I18n.t("ESPACIO", "tecla") if pos == "abajo" else I18n.t("MAYÚS", "tecla")



func _habla_tecla(dedo: String) -> bool:
	return teclado_juega() and TEXTO_TECLADO.has(dedo)






func _tec_texto(dedo: String, args: Array) -> String:
	var k: String = String(TEXTO_TECLADO[dedo])
	return tf_teclado(k, args if not args.is_empty() else [boton("fl_avanza")])





static func tf_teclado(k: String, args: Array = []) -> String:
	var t: String = I18n.t(k)
	for i in args.size():
		t = t.replace("{%d}" % i, str(args[i]))
	return t.replace("WASD", wasd())






static func _cara_ps(pos: String) -> String:
	match pos:
		"abajo":
			return I18n.t("CRUZ", "mando")
		"derecha":
			return I18n.t("CÍRCULO", "mando")
		"izquierda":
			return I18n.t("CUADRADO", "mando")
	return I18n.t("TRIÁNGULO", "mando")







func vibra(ms: int) -> bool:


	if modo != Modo.MANDO or ms <= 0:
		return false
	if not Input.get_connected_joypads().has(dispositivo) \
			and not conectados_fingidos.has(dispositivo):
		return false
	var fila: Array = VIBRA[VIBRA.size() - 1]
	for f in VIBRA:
		if ms <= int(f[0]):
			fila = f
			break
	var seg: float = clampf(float(ms) / 1000.0, VIBRA_MIN_S, VIBRA_MAX_S)
	ultima_vibracion = Vector3(float(fila[1]), float(fila[2]), seg)
	Input.start_joy_vibration(dispositivo, float(fila[1]), float(fila[2]), seg)
	return true








static func juego(n: Node, jugando: bool) -> void:
	if jugando:
		if n.is_in_group(CAPA_GROUP):
			n.remove_from_group(CAPA_GROUP)
		n.add_to_group(SIN_FOCO_GROUP)
	else:
		if n.is_in_group(SIN_FOCO_GROUP):
			n.remove_from_group(SIN_FOCO_GROUP)
		n.add_to_group(CAPA_GROUP)








func juego_jugable(id: String) -> bool:
	return modo != Modo.MANDO or JUEGOS_CON_MANDO.has(id)


func requiere_tactil(id: String) -> bool:
	return not juego_jugable(id)


func _input(event: InputEvent) -> void:
	if event.is_pressed() and _es_nav(event):
		_nav_lado = _lado_nav(event)
		_nav_fotograma = Engine.get_process_frames()
	if event is InputEventJoypadButton:
		if event.pressed:
			_toma_mando(event.device, true)
		_pulsado_si(event)
	elif event is InputEventJoypadMotion:
		if absf(event.axis_value) > UMBRAL_EJE:
			_toma_mando(event.device, false)
	elif event.device == InputEvent.DEVICE_ID_EMULATION or event.device == TOQUE_DISPOSITIVO:



		return
	elif event is InputEventScreenTouch:
		if event.pressed:
			_pon_modo(Modo.TACTIL)
		return
	elif event is InputEventMouseButton or event is InputEventKey:
		if event.pressed:
			_pon_modo(Modo.RATON_TECLADO)
			_raton_manda = event is InputEventMouseButton

			if event is InputEventKey:
				_tecla_navega(event as InputEventKey)
				_pulsado_si(event)
			else:
				_pon_teclado(false)

		if event is InputEventMouseButton:
			_clic_derecho(event as InputEventMouseButton)
		return
	elif event is InputEventMouseMotion:
		_raton_se_mueve(event as InputEventMouseMotion)
		return



	if modo == Modo.MANDO and capa() == null and _es_nav(event):
		get_viewport().set_input_as_handled()
		return
	if modo == Modo.MANDO and capa() != null and _es_nav(event) and event.is_pressed():
		_despierta_a_avanza(capa())







func _despierta_a_avanza(c: Node) -> void:
	if not _a_avanza(c):
		return
	c.set_meta(A_AVANZA_META, false)
	get_viewport().set_input_as_handled()
	var p: Control = primero(c)
	if p != null:
		p.grab_focus()



static func _a_avanza(c: Node) -> bool:
	return c != null and bool(c.get_meta(A_AVANZA_META, false))


func _es_nav(event: InputEvent) -> bool:
	for a in NAV_ACCIONES:
		if event.is_action(a):
			return true
	return false





func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey:
		_esc(event as InputEventKey)
		_enter_sobre_toque(event as InputEventKey)
		_tecla_toque(event as InputEventKey)
		return
	if not (event is InputEventJoypadButton):
		return
	if event.is_action("fl_avanza") or event.is_action("fl_toque"):
		if not event.pressed:
			if _toque_on:
				get_viewport().set_input_as_handled()
				_toque(false, _toque_pos)
			return
		if _toque_on:
			return
		var x: bool = event.is_action("fl_toque")
		if not x and _a_sobre_foco():
			get_viewport().set_input_as_handled()
			return
		if toque_cabe(x):
			get_viewport().set_input_as_handled()
			_toque(true, _centro_ventana())
		return
	if event.pressed and event.is_action_pressed("fl_atras"):
		get_viewport().set_input_as_handled()
		var fade: Node = get_node_or_null("/root/SceneFade")
		if fade != null:
			fade.atras(true)
		return
	if event.pressed and (event.is_action_pressed("fl_mantener") \
			or event.is_action_pressed("fl_objetivo")):
		if _vecina(-1 if event.is_action("fl_mantener") else 1):
			get_viewport().set_input_as_handled()























func _esc(k: InputEventKey) -> void:
	if not k.pressed or k.echo or k.keycode != KEY_ESCAPE or not OS.has_feature("pc"):
		return
	if _esc_es_de_un_juego():
		return
	get_viewport().set_input_as_handled()
	var fade: Node = get_node_or_null("/root/SceneFade")
	if fade != null:
		fade.atras(true)







func _esc_es_de_un_juego() -> bool:
	var escena: Node = get_tree().current_scene
	for grupo in [SIN_FOCO_GROUP, CAPA_GROUP, "ahorro_hold"]:
		for n in SceneFade.grupo(grupo):
			if n != escena and n.is_inside_tree() and n.is_processing_unhandled_key_input():
				return true
	return false

























const CLIC_DERECHO_ATRAS: bool = true

var _derecho_comido: bool = false



func _clic_derecho(mb: InputEventMouseButton) -> bool:
	if mb.button_index != MOUSE_BUTTON_RIGHT:
		return false
	if not mb.pressed:
		if _derecho_comido:
			_derecho_comido = false
			get_viewport().set_input_as_handled()
			return true
		return false
	if not clic_derecho_vuelve():
		return false
	_derecho_comido = true
	get_viewport().set_input_as_handled()
	var fade: Node = get_node_or_null("/root/SceneFade")
	if fade != null:
		fade.atras(true)
	return true




func clic_derecho_vuelve() -> bool:
	if not CLIC_DERECHO_ATRAS or not OS.has_feature("pc") or modo != Modo.RATON_TECLADO:
		return false
	if SceneFade.cuenta_grupo(SIN_FOCO_GROUP) > 0 \
			or SceneFade.cuenta_grupo("ahorro_hold") > 0 \
			or es_acto(get_tree().current_scene):
		return false
	if capa_activa() == null or _esc_es_de_un_juego():
		return false
	var bajo: Control = get_viewport().gui_get_hovered_control()
	return not (bajo is LineEdit or bajo is TextEdit)





















const GATILLO_ON: float = 0.5
const GATILLO_OFF: float = 0.3

var _gatillos_armados: Array[bool] = [true, true]




func _vecina(dir: int) -> bool:
	if modo != Modo.MANDO:
		return false
	var capa: Node = capa_activa()
	if capa == null:
		return false
	for n in _clientes(capa, "fl_vecina", "fl_vecina"):
		if bool(n.call("fl_vecina", dir)):
			return true
	for n in _clientes(capa, "fl_pestanas", "pestana_vecina"):
		if bool(n.call("pestana_vecina", dir)):
			return true
	return false






func _gatillos_menu(capa: Node) -> void:
	var dir: int = gatillo_flanco(_gatillos_armados)
	if dir == 0 or capa == null:
		return
	for n in _clientes(capa, "fl_familias", "familia_vecina"):
		if bool(n.call("familia_vecina", dir)):
			return





func gatillo_flanco(armados: Array[bool]) -> int:
	var dir: int = 0
	for i in 2:
		var v: float = Input.get_joy_axis(dispositivo,
			JOY_AXIS_TRIGGER_LEFT if i == 0 else JOY_AXIS_TRIGGER_RIGHT)
		if armados[i] and v > GATILLO_ON:
			armados[i] = false
			dir += -1 if i == 0 else 1
		elif not armados[i] and v < GATILLO_OFF:
			armados[i] = true
	return dir




func _clientes(capa: Node, grupo: String, metodo: String) -> Array[Node]:
	var out: Array[Node] = []
	for n in SceneFade.grupo(grupo):
		if (n == capa or capa.is_ancestor_of(n)) and _se_ve(n) and n.has_method(metodo):
			out.append(n)
	return out






func toque_cabe(x: bool) -> bool:
	var c: Node = capa_activa()
	if c == null:
		return false
	return x or primero(c) == null











func _a_sobre_foco() -> bool:
	var f: Control = get_viewport().gui_get_focus_owner()
	var c: Node = capa_activa()
	if f == null or c == null or not c.is_ancestor_of(f) or not f.is_visible_in_tree():
		return false
	if f.has_meta(TOQUE_META):
		_toque(true, centro_en_ventana(f))
		return true
	if (f is LineEdit and (f as LineEdit).editable) or (f is TextEdit and (f as TextEdit).editable):
		return load(TECLADO_PATH).abre(f) != null
	return false















func _pulsado_si(event: InputEvent) -> void:
	if not event.is_pressed() or event.is_echo() or not event.is_action("ui_accept") \
			or not foco_vivo():
		return
	_pulsado_visual()


func _pulsado_visual() -> void:
	var f: Control = get_viewport().gui_get_focus_owner()
	var c: Node = capa_activa()
	if f == null or c == null or not c.is_ancestor_of(f) or not f.is_visible_in_tree():
		return
	if f is BaseButton and (f as BaseButton).disabled:
		return
	if not (f is BaseButton or f.has_meta(TOQUE_META)):
		return
	_destella()
	if f is Button:
		_hunde(f as Button)
	if not Settings.reduce_motion:
		load(UI_KIT_PATH).punch(f)






func _destella() -> void:
	if _anillo == null:
		_anillo = load(CAREER_THEME_PATH).focus_ring()
	_anillo.bg_color = CareerTheme.FOCO_DESTELLO
	SceneFade.timer(PULSADO_S, true, false, true).timeout.connect(_destello_fin)


func _destello_fin() -> void:
	if _anillo != null:
		_anillo.bg_color = CareerTheme.FOCO_RELLENO






func _hunde(b: Button) -> void:
	if b.has_meta(HUNDIDO_META):
		return
	var hundido: StyleBox = b.get_theme_stylebox("pressed")
	if hundido == null or hundido == b.get_theme_stylebox("normal"):
		return
	b.set_meta(HUNDIDO_META, [
		b.get_theme_stylebox("normal") if b.has_theme_stylebox_override("normal") else false,
		b.get_theme_stylebox("hover") if b.has_theme_stylebox_override("hover") else false,
		hundido])
	b.add_theme_stylebox_override("normal", hundido)
	b.add_theme_stylebox_override("hover", hundido)
	SceneFade.timer(PULSADO_S, true, false, true).timeout.connect(_levanta.bind(weakref(b)))


func _levanta(w: WeakRef) -> void:
	var b: Button = w.get_ref() as Button
	if b == null or not b.has_meta(HUNDIDO_META):
		return
	var m: Array = b.get_meta(HUNDIDO_META)
	b.remove_meta(HUNDIDO_META)
	if b.get_theme_stylebox("normal") != m[2]:
		return
	for i in 2:
		var slot: String = ["normal", "hover"][i]
		if m[i] is StyleBox:
			b.add_theme_stylebox_override(slot, m[i])
		else:
			b.remove_theme_stylebox_override(slot)


func _centro_ventana() -> Vector2:
	return Vector2(get_window().size) * 0.5









func centro_en_ventana(c: Control) -> Vector2:
	if c == null or not is_instance_valid(c) or not c.is_inside_tree():
		return _centro_ventana()
	var p: Vector2 = c.get_global_transform_with_canvas() *(c.size * 0.5)
	return c.get_viewport().get_final_transform() * p







func _toque(on: bool, pos: Vector2) -> void:
	_toque_on = on
	_toque_pos = pos
	var ev: InputEventScreenTouch = InputEventScreenTouch.new()
	ev.device = TOQUE_DISPOSITIVO
	ev.index = 0
	ev.pressed = on
	ev.position = pos
	Input.parse_input_event(ev)





func _toma_mando(dev: int, por_boton: bool) -> void:
	if modo == Modo.MANDO and dev != dispositivo:
		if not por_boton:
			return
		_cambia_dispositivo(dev)
	elif dev != dispositivo or modo != Modo.MANDO:
		dispositivo = dev
		familia = familia_de(Input.get_joy_name(dev))
	_pon_modo(Modo.MANDO)


func _cambia_dispositivo(dev: int) -> void:
	dispositivo = dev
	familia = familia_de(Input.get_joy_name(dev))

	_repinta_vivos()
	dispositivo_cambiado.emit(dev)


static func familia_de(nombre: String) -> String:
	var n: String = nombre.to_lower()
	if n.contains("xbox") or n.contains("xinput"):
		return "xbox"
	for k in ["playstation", "dualsense", "dualshock", "ps3", "ps4", "ps5", "sony"]:
		if n.contains(k):
			return "ps"
	for k in ["nintendo", "switch", "joy-con", "joycon"]:
		if n.contains(k):
			return "switch"
	if n.contains("steam deck") or n.contains("deck"):
		return "deck"
	return "generico"


func _pon_modo(m: int) -> void:



	if m == Modo.TACTIL and sin_dedo():
		m = Modo.RATON_TECLADO
	if m == modo:
		return
	var era: int = modo

	_tec_rumbo = Vector2i.ZERO
	_tec_carga = 0.0
	_tec_falta_ms = -1
	var era_vivo: bool = foco_vivo()
	modo = m

	_mapa_ab()


	_teclado = false
	if m != Modo.RATON_TECLADO:
		_quita_realce()
	if era_vivo or m == Modo.MANDO:
		_aplica_foco(m == Modo.MANDO)
	if era == Modo.MANDO or m == Modo.MANDO:



		_repinta_vivos()
	modo_cambiado.emit(m)




func _aplica_foco(on: bool) -> void:
	_capa = null
	_capa_id = 0
	_reintento_s = 0.0
	for c in get_tree().root.find_children("*", "Control", true, false):
		if c is ScrollContainer:
			_sigue_foco(c, on)
		if on:
			_auto_foco(c)
		elif c.has_meta(AUTO_META):
			c.remove_meta(AUTO_META)
			c.focus_mode = Control.FOCUS_NONE
	if on:
		return
	var foco: Control = get_viewport().gui_get_focus_owner()
	if foco != null and _es_de_menu(foco):
		foco.release_focus()
	_quita_anillos()


func _es_de_menu(c: Node) -> bool:
	return c is BaseButton or c is Slider or (c is Control and c.has_meta(TOQUE_META))


func _auto_foco(c: Node) -> void:
	if not is_instance_valid(c) or not _es_de_menu(c) or c.has_meta(SIN_FOCO_META):
		return
	var ctl: Control = c
	if ctl.focus_mode == Control.FOCUS_NONE:
		ctl.focus_mode = Control.FOCUS_ALL
		ctl.set_meta(AUTO_META, true)






func foco_para(c: Control) -> void:
	if c.has_meta(SIN_FOCO_META):
		return
	if foco_vivo():
		c.focus_mode = Control.FOCUS_ALL
		c.set_meta(AUTO_META, true)
		return
	c.focus_mode = Control.FOCUS_NONE
	if c.has_meta(AUTO_META):
		c.remove_meta(AUTO_META)




func _on_nodo(n: Node) -> void:
	if not foco_vivo():
		return
	if _es_de_menu(n):
		_auto_foco.call_deferred(n)
	elif n is ScrollContainer:
		_sigue_foco.call_deferred(n, true)








func _sigue_foco(s: Node, on: bool) -> void:
	if not is_instance_valid(s) or not (s is ScrollContainer):
		return



	if s.has_method("trae_a_vista") and modo == Modo.MANDO:
		return
	var sc: ScrollContainer = s
	if on:
		if not sc.follow_focus:
			sc.follow_focus = true
			sc.set_meta(SIGUE_META, true)
	elif sc.has_meta(SIGUE_META):
		sc.remove_meta(SIGUE_META)
		sc.follow_focus = false






func _on_joy_conexion(dev: int, conectado: bool) -> void:

	_mapa_ab()
	if modo != Modo.MANDO or dev != dispositivo:
		return
	if conectado:
		var fam_vieja: String = familia
		familia = familia_de(Input.get_joy_name(dev))
		_repinta_vivos()





		if familia != fam_vieja:
			dispositivo_cambiado.emit(dev)
		return




	if _toque_on:
		_toque(false, _toque_pos)
	mando_perdido.emit()



	load(GLIFOS_PATH).aviso_sin_mando(self)
	conectados_fingidos.erase(dev)

	for otro in Input.get_connected_joypads() + conectados_fingidos:
		if otro != dev:
			_cambia_dispositivo(otro)
			return
	_pon_modo(Modo.TACTIL if DisplayServer.is_touchscreen_available()
		else Modo.RATON_TECLADO)






func capa() -> Node:
	return _capa if is_instance_valid(_capa) else null


func _career_ui() -> GDScript:
	if _cu == null:
		_cu = load(CAREER_UI_PATH)
	return _cu




func capa_activa() -> Node:
	var cu: GDScript = _career_ui()
	var mejor: Node = null
	for g in [cu.MODAL_GROUP, cu.ATRAS_CAPA_GROUP, CAPA_GROUP]:
		for n in SceneFade.grupo(g):
			if _se_ve(n) and (mejor == null or _encima(n, mejor)):
				mejor = n
	if mejor != null:
		return mejor
	if not SceneFade.grupo(SIN_FOCO_GROUP).is_empty():
		return null
	return get_tree().current_scene


static func _se_ve(n: Node) -> bool:
	if n is CanvasItem:
		return (n as CanvasItem).is_visible_in_tree()
	if n is CanvasLayer:
		return (n as CanvasLayer).visible
	return n.is_inside_tree()




static func _encima(a: Node, b: Node) -> bool:
	var la: int = _capa_lienzo(a)
	var lb: int = _capa_lienzo(b)
	if la != lb:
		return la > lb
	return a.is_greater_than(b)


static func _capa_lienzo(n: Node) -> int:
	var p: Node = n
	while p != null:
		if p is CanvasLayer:
			return (p as CanvasLayer).layer
		p = p.get_parent()
	return 0


func _process(delta: float) -> void:
	if modo == Modo.RATON_TECLADO:
		if sin_dedo():
			_tec_tick(delta)




			var f: Control = get_viewport().gui_get_focus_owner()
			if f != null and _es_de_menu(f) and capa_activa() == null:
				f.release_focus()

		_realce_raton()
		if _teclado:
			_foco_teclado(delta)
		return
	if modo != Modo.MANDO:
		return
	var capa: Node = capa_activa()
	var id: int = capa.get_instance_id() if capa != null else 0
	if id != _capa_id:
		_reintento_s = 0.0
	_capa = capa
	_capa_id = id
	_gatillos_menu(capa)
	var foco: Control = get_viewport().gui_get_focus_owner()
	if capa == null:
		if foco != null and _es_de_menu(foco):
			foco.release_focus()
		return
	_scroll_stick(capa, foco, delta)


	_sostiene_foco(capa, foco, delta)







func _scroll_stick(capa: Node, foco: Control, delta: float) -> void:
	if capa.has_meta(STICK_PROPIO_META):
		return
	var e: Vector2 = eje(false)
	if e.length() <= SCROLL_ZM:
		return
	var sc: ScrollContainer = _scroll_de(foco, capa) if foco != null else null
	if sc == null:
		for n in capa.find_children("*", "ScrollContainer", true, false):
			var s: ScrollContainer = n
			if s.is_visible_in_tree() and _le_sobra(s):
				sc = s
				break
	if sc == null:
		return
	var d: Vector2 = e * SCROLL_PX_S * delta
	if sc.has_method("desplaza"):
		sc.call("desplaza", d)
		return
	sc.scroll_vertical += int(d.y)
	sc.scroll_horizontal += int(d.x)


func _scroll_de(c: Control, capa: Node) -> ScrollContainer:
	var p: Node = c.get_parent()
	while p != null:
		if p is ScrollContainer and _le_sobra(p):
			return p
		if p == capa:
			break
		p = p.get_parent()
	return null


static func _le_sobra(s: ScrollContainer) -> bool:
	var v: ScrollBar = s.get_v_scroll_bar()
	var h: ScrollBar = s.get_h_scroll_bar()
	return (v != null and v.max_value - v.page > 1.0) or (h != null and h.max_value - h.page > 1.0)


func _recordado(capa: Node) -> Control:
	var w: WeakRef = _ultimo_foco.get(capa.get_instance_id())
	if w == null:
		return null
	var c: Control = w.get_ref() as Control
	if c == null or not capa.is_ancestor_of(c) or not enfocable(c):
		return null
	return c















func primero(capa: Node) -> Control:
	if _a_avanza(capa):
		return null
	var todos: Array[Node] = capa.find_children("*", "Control", true, false)
	for n in todos:
		if n.has_meta(PRIMERO_META) and enfocable(n):
			return n
	var campo: Control = null
	var rojo: Control = null
	for n in todos:
		if enfocable(n):
			if es_peligro(n):
				if rojo == null:
					rojo = n
				continue
			if n is LineEdit or n is TextEdit:
				if campo == null:
					campo = n
				continue
			return n
	return campo if campo != null else rojo



static func es_peligro(n: Node) -> bool:
	return n != null and bool(n.get_meta(PELIGRO_META, false))





func enfocable(n: Node) -> bool:
	if not (n is Control):
		return false
	var c: Control = n
	if not c.is_visible_in_tree() or c.focus_mode != Control.FOCUS_ALL:
		return false
	if c is BaseButton and (c as BaseButton).disabled:
		return false
	return not es_telon(c)


static func es_telon(c: Control) -> bool:
	if not (c is Button) or not (c as Button).text.strip_edges().is_empty() \
			or (c as Button).icon != null:
		return false
	var vp: Vector2 = c.get_viewport_rect().size
	var r: Vector2 = c.get_global_rect().size
	return r.x * r.y > vp.x * vp.y * 0.6


func _on_foco(c: Control) -> void:
	if not foco_vivo() or c == null:
		return


	if es_telon(c):
		if c is BaseButton and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):



			var b: BaseButton = c
			if not b.button_up.is_connected(b.release_focus):
				b.button_up.connect(b.release_focus, CONNECT_ONE_SHOT|CONNECT_DEFERRED)
			return
		c.release_focus.call_deferred()
		return



	var lado_nav: int = _nav_lado if Engine.get_process_frames() - _nav_fotograma <= 1 else -1
	_nav_fotograma = -10
	var capa: Node = _capa if _capa != null else capa_activa()
	if capa != null and not capa.is_ancestor_of(c):





		var vuelta: Control = _recordado(capa)
		if vuelta != null and vuelta != c:



			_vuelve_a_capa.call_deferred(capa, vuelta, lado_nav)
			return
	if capa != null and capa.is_ancestor_of(c) and (lado_nav == SIDE_TOP or lado_nav == SIDE_BOTTOM):
		var antes: Control = _recordado(capa)
		var lista: ScrollContainer = _lista_de(antes, capa)
		if lista == null or lista.is_ancestor_of(c):
			lista = _lista_saltada(capa, antes, c, lado_nav)
		if lista != null and antes != c and not lista.is_ancestor_of(c):
			_sigue_en_lista.call_deferred(lista, antes, c, lado_nav)
	_pon_anillo(c)
	if capa != null and capa.is_ancestor_of(c):
		_ultimo_foco[capa.get_instance_id()] = weakref(c)





	var p: Node = c.get_parent()
	while p != null:
		if p is ScrollContainer:
			if p.has_method("trae_a_vista"):
				p.call_deferred("trae_a_vista", c)
			else:
				(p as ScrollContainer).ensure_control_visible.call_deferred(c)
		if p == capa:
			break
		p = p.get_parent()








func _vuelve_a_capa(capa: Node, vuelta: Control, lado: int) -> void:
	if not is_instance_valid(vuelta) or not vuelta.is_inside_tree():
		return
	vuelta.grab_focus()
	if lado < 0 or not is_instance_valid(capa) or not capa.is_inside_tree():
		return
	var sig: Control = _vecino_dentro(capa, vuelta, lado)
	if sig != null:
		sig.grab_focus()





func _vecino_dentro(dentro: Node, desde: Control, lado: int) -> Control:
	var apagados: Array = []
	var n: Node = dentro
	while n != null and n != get_tree().root:
		var padre: Node = n.get_parent()
		if padre == null:
			break
		for hermano in padre.get_children():
			if hermano != n and hermano != self:
				_apaga_foco(hermano, apagados)
		n = padre
	var sig: Control = desde.find_valid_focus_neighbor(lado)
	for par in apagados:
		if is_instance_valid(par[0]):
			(par[0] as Control).focus_behavior_recursive = par[1]
	if sig != null and sig != desde and dentro.is_ancestor_of(sig):
		return sig
	return null









func _sigue_en_lista(lista: ScrollContainer, antes: Control, c: Control, lado: int) -> void:
	if not is_instance_valid(lista) or not is_instance_valid(antes) or not is_instance_valid(c):
		return
	if get_viewport().gui_get_focus_owner() != c or not antes.is_inside_tree():
		return
	var sig: Control = _mas_cerca_dentro(lista, antes, lado)
	if sig != null:
		sig.grab_focus()






func _mas_cerca_dentro(lista: Node, antes: Control, lado: int) -> Control:
	var ra: Rect2 = antes.get_global_rect()
	var mejor: Control = null
	var mejor_hueco: float = INF
	var mejor_dx: float = INF
	for n in lista.find_children("*", "Control", true, false):
		if not _es_de_menu(n) or not enfocable(n):
			continue
		var r: Rect2 =(n as Control).get_global_rect()
		var hueco: float = r.position.y - ra.end.y if lado == SIDE_BOTTOM else ra.position.y - r.end.y
		if hueco < -1.0:
			continue
		var dx: float = absf(r.get_center().x - ra.get_center().x)
		if hueco < mejor_hueco - 1.0 or (absf(hueco - mejor_hueco) <= 1.0 and dx < mejor_dx):
			mejor = n
			mejor_hueco = hueco
			mejor_dx = dx
	return mejor






func _lista_saltada(capa: Node, antes: Control, c: Control, lado: int) -> ScrollContainer:
	if antes == null or antes == c:
		return null
	var ra: Rect2 = antes.get_global_rect()
	var rc: Rect2 = c.get_global_rect()
	for n in capa.find_children("*", "ScrollContainer", true, false):
		var sc: ScrollContainer = n
		if sc.vertical_scroll_mode == ScrollContainer.SCROLL_MODE_DISABLED or not sc.is_visible_in_tree():
			continue
		if sc.is_ancestor_of(antes) or sc.is_ancestor_of(c):
			continue
		var r: Rect2 = sc.get_global_rect()
		var entre: bool =(r.position.y >= ra.end.y - 1.0 and r.position.y < rc.position.y) \
				if lado == SIDE_BOTTOM else (r.end.y <= ra.position.y + 1.0 and r.end.y > rc.end.y)
		if entre and r.size.y > 0.0:
			return sc
	return null



static func _lista_de(c: Control, capa: Node) -> ScrollContainer:
	var p: Node = c.get_parent() if c != null else null
	while p != null and p != capa:
		if p is ScrollContainer and (p as ScrollContainer).vertical_scroll_mode != ScrollContainer.SCROLL_MODE_DISABLED:
			return p
		p = p.get_parent()
	return null





func _apaga_foco(n: Node, apagados: Array) -> void:
	if n is Control:
		var ctl: Control = n
		apagados.append([ctl, ctl.focus_behavior_recursive])
		ctl.focus_behavior_recursive = Control.FOCUS_BEHAVIOR_DISABLED
		return
	if n is Node3D:
		return
	for h in n.get_children():
		_apaga_foco(h, apagados)





func _lado_nav(event: InputEvent) -> int:
	if event.is_action_pressed("ui_up", true):
		return SIDE_TOP
	if event.is_action_pressed("ui_down", true):
		return SIDE_BOTTOM
	if event.is_action_pressed("ui_left", true):
		return SIDE_LEFT
	if event.is_action_pressed("ui_right", true):
		return SIDE_RIGHT
	return -1











func _pon_anillo(c: Control) -> void:
	if not (c is Button):
		if not c.has_meta(TOQUE_META):
			_anillo_dibujado(c)
		return
	if _anillo == null:
		_anillo = load(CAREER_THEME_PATH).focus_ring()
	if c.get_theme_stylebox("focus") == _anillo:
		return
	if not c.has_meta(PREVIO_META):



		c.set_meta(PREVIO_META, c.get_theme_stylebox("focus")
			if c.has_theme_stylebox_override("focus") else false)
		_anillados.append(weakref(c))
	c.add_theme_stylebox_override("focus", _anillo)




func _quita_anillos() -> void:
	for w in _anillados:
		var c: Control = w.get_ref() as Control
		if c != null and c.has_meta(DIBUJO_META):
			_quita_dibujado(c)
			continue
		if c == null or not c.has_meta(PREVIO_META):
			continue
		var previo = c.get_meta(PREVIO_META)
		c.remove_meta(PREVIO_META)
		if previo is StyleBox:
			c.add_theme_stylebox_override("focus", previo)
		else:
			c.remove_theme_stylebox_override("focus")
	_anillados.clear()









func _anillo_dibujado(c: Control) -> void:
	var cb: Callable = _dibuja_anillo.bind(c)
	if c.draw.is_connected(cb):
		return
	var rp: Callable = _repinta.bind(c)
	c.draw.connect(cb)
	c.focus_entered.connect(rp)
	c.focus_exited.connect(rp)
	c.set_meta(DIBUJO_META, true)
	_anillados.append(weakref(c))
	c.queue_redraw()


func _repinta(c: Control) -> void:
	if is_instance_valid(c):
		c.queue_redraw()


func _dibuja_anillo(c: Control) -> void:
	if not c.has_focus() or not foco_vivo():
		return
	if _anillo == null:
		_anillo = load(CAREER_THEME_PATH).focus_ring()


	c.draw_style_box(_anillo, Rect2(Vector2.ZERO, c.size))


func _quita_dibujado(c: Control) -> void:
	var cb: Callable = _dibuja_anillo.bind(c)
	if c.draw.is_connected(cb):
		c.draw.disconnect(cb)
	var rp: Callable = _repinta.bind(c)
	if c.focus_entered.is_connected(rp):
		c.focus_entered.disconnect(rp)
	if c.focus_exited.is_connected(rp):
		c.focus_exited.disconnect(rp)
	c.remove_meta(DIBUJO_META)
	c.queue_redraw()








func lleva_anillo(c: Control) -> bool:
	if c == null or not foco_vivo() or not c.has_focus():
		return false
	if c is Button:
		return _anillo != null and c.get_theme_stylebox("focus") == _anillo
	if c.has_meta(TOQUE_META):
		return c.focus_entered.is_connected(c.queue_redraw)
	return c.has_meta(DIBUJO_META) and c.draw.is_connected(_dibuja_anillo.bind(c))









































const MANO_META: String = "fl_mano_previa"

var _teclado: bool = false


var _realzado: WeakRef = null
var _bajo_id: int = 0




func foco_vivo() -> bool:
	return modo == Modo.MANDO or (modo == Modo.RATON_TECLADO and _teclado)



func teclado_navega() -> bool:
	return modo == Modo.RATON_TECLADO and _teclado



func realzado() -> Button:
	return _realzado.get_ref() as Button if _realzado != null else null




func _teclado_cabe(c: Node) -> bool:
	if c == null:
		return false
	var escena: Node = get_tree().current_scene
	return not (c == escena and (es_acto(escena) \
			or SceneFade.cuenta_grupo("ahorro_hold") > 0))





const CEREMONY_GD: String = "res://ui/ceremony.gd"







static func es_acto(n: Node) -> bool:
	return n != null and guion_de_acto(n.get_script() as Script)




static func guion_de_acto(s: Script) -> bool:
	while s != null:
		if s.resource_path == CEREMONY_GD:
			return true
		s = s.get_base_script()
	return false




func _pon_teclado(on: bool) -> void:
	if on == _teclado or (on and modo != Modo.RATON_TECLADO):
		return
	_teclado = on
	if on:
		_quita_realce()
	_aplica_foco(on)






func _tecla_navega(k: InputEventKey) -> void:
	if _es_nav(k):
		_enciende_teclado()




func _enciende_teclado() -> void:
	var c: Node = capa_activa()
	if not _teclado_cabe(c):
		return
	var bajo: Button = realzado()
	_pon_teclado(true)


	if _a_avanza(c):
		c.set_meta(A_AVANZA_META, false)
	var foco: Control = get_viewport().gui_get_focus_owner()
	if foco != null and foco.is_visible_in_tree() and c.is_ancestor_of(foco):
		_pon_anillo(foco)
		return



	var p: Control = bajo if bajo != null and c.is_ancestor_of(bajo) and enfocable(bajo) \
			and not es_peligro(bajo) else _recordado(c)
	if p == null:
		p = primero(c)
	if p == null:
		return
	get_viewport().set_input_as_handled()
	p.grab_focus()





func _enter_sobre_toque(k: InputEventKey) -> void:
	if not teclado_navega() or k.echo or not k.is_action("ui_accept"):
		return
	if not k.pressed:
		if _toque_on:
			get_viewport().set_input_as_handled()
			_toque(false, _toque_pos)
		return
	if _toque_on:
		return
	var f: Control = get_viewport().gui_get_focus_owner()
	var c: Node = capa_activa()
	if f == null or c == null or not c.is_ancestor_of(f) or not f.is_visible_in_tree() \
			or not f.has_meta(TOQUE_META):
		return
	get_viewport().set_input_as_handled()
	_toque(true, centro_en_ventana(f))









func _tecla_toque(k: InputEventKey) -> void:
	if k.echo or get_viewport().is_input_handled():
		return
	var a: String = accion_tecla(k)
	if a != "fl_avanza" and a != "fl_toque":
		return
	if not k.pressed:
		if _toque_on:
			get_viewport().set_input_as_handled()
			_toque(false, _toque_pos)
		return
	if _toque_on or _esc_es_de_un_juego():
		return
	var x: bool = a == "fl_toque"
	if toque_cabe(x):
		get_viewport().set_input_as_handled()
		_toque(true, _centro_ventana())
	elif not x and not teclado_navega():
		_enciende_teclado()




func _raton_se_mueve(m: InputEventMouseMotion) -> void:
	if m.relative.length() > RATON_MUEVE_PX:
		_raton_manda = true
	if modo == Modo.RATON_TECLADO and _teclado and m.relative.length_squared() > 0.0:
		_pon_teclado(false)





func _foco_teclado(delta: float) -> void:
	var capa: Node = capa_activa()
	var id: int = capa.get_instance_id() if capa != null else 0
	if id != _capa_id:
		_reintento_s = 0.0
	_capa = capa
	_capa_id = id
	if not _teclado_cabe(capa):
		_pon_teclado(false)
		return
	_sostiene_foco(capa, get_viewport().gui_get_focus_owner(), delta)





func _sostiene_foco(capa: Node, foco: Control, delta: float) -> void:


	if _a_avanza(capa):
		if foco != null:
			foco.release_focus()
		return
	if foco != null and foco.is_visible_in_tree() and capa.is_ancestor_of(foco):
		_pon_anillo(foco)
		return


	if foco != null:
		foco.release_focus()
	_reintento_s -= delta
	if _reintento_s > 0.0:
		return
	var c: Control = _recordado(capa)
	if c == null:
		c = primero(capa)
	if c == null:
		_reintento_s = REINTENTO_S
		return
	c.grab_focus()





func _boton_bajo_raton() -> Button:
	var n: Node = get_viewport().gui_get_hovered_control()
	var pasos: int = 0
	while n != null and not (n is BaseButton) and pasos < 6:
		if not (n is Control):
			return null
		n = n.get_parent()
		pasos += 1
	return n as Button




func _realzable(b: Button) -> bool:
	if b == null or b.disabled or not b.is_visible_in_tree() or es_telon(b):
		return false
	var c: Node = capa_activa()
	return c != null and (c == b or c.is_ancestor_of(b))




static func _hover_mudo(b: Button) -> bool:
	return b.get_theme_stylebox("hover") == b.get_theme_stylebox("normal")




func _realce_raton() -> void:
	var b: Button = _boton_bajo_raton() if not _teclado else null
	var id: int = b.get_instance_id() if b != null else 0
	if id == _bajo_id:
		var ya: Button = realzado()
		if ya != null and (ya.disabled or not ya.is_visible_in_tree()):
			_quita_realce()
			_bajo_id = id
		return
	_quita_realce()
	_bajo_id = id
	if _realzable(b):
		_pon_realce(b)


func _pon_realce(b: Button) -> void:
	_realzado = weakref(b)
	if b.mouse_default_cursor_shape == Control.CURSOR_ARROW:
		b.set_meta(MANO_META, true)
		b.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND

		DisplayServer.cursor_set_shape(DisplayServer.CURSOR_POINTING_HAND)
	if _hover_mudo(b):
		var cb: Callable = _dibuja_realce.bind(b)
		if not b.draw.is_connected(cb):
			b.draw.connect(cb)
		b.queue_redraw()




func _dibuja_realce(b: Button) -> void:
	if _anillo == null:
		_anillo = load(CAREER_THEME_PATH).focus_ring()
	b.draw_style_box(_anillo, Rect2(Vector2.ZERO, b.size))


func _quita_realce() -> void:
	var b: Button = realzado()
	_realzado = null
	_bajo_id = 0
	if b == null:
		return
	var cb: Callable = _dibuja_realce.bind(b)
	if b.draw.is_connected(cb):
		b.draw.disconnect(cb)
		b.queue_redraw()
	if b.has_meta(MANO_META):
		b.remove_meta(MANO_META)
		b.mouse_default_cursor_shape = Control.CURSOR_ARROW
