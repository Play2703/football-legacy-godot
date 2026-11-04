extends "res://ui/house/minijuego_casa.gd"
























const Motor := preload("res://features/career/reflejos_motor.gd")
const LuzLib := preload("res://ui/house/reflejos_luz.gd")



const DESTELLO: float = 0.35

const CURSOR_INICIAL: int = 5


var partida = null

var cursor: int = CURSOR_INICIAL

var _pared_juego: LuzLib.Pared
var _pared_vista: LuzLib.Pared

var _estado_luz: Array[int] = []
var _destello: Array[float] = []

var _teclado: bool = false

var _hud_puntos: int = 2147483647
var _hud_racha: int = -1
var _hud_segundos: int = -1


func _init() -> void:
	juego_id = RecordsLib.REFLEJOS
	titulo = I18n.t("PARED DE REFLEJOS")
	acento = CareerTheme.LUZ_REFLEJOS
	trofeo_record = "corona"

	retardo_resultado = 0.5
	for i in Motor.CASILLAS:
		_estado_luz.append(LuzLib.Estado.APAGADA)
		_destello.append(0.0)






func _niveles_info() -> Array:
	var info: Array = []
	var rotulos: Array[String] = [I18n.t("ENTRENO", "pingpong_matt"), I18n.t("DESAFIO", "pingpong_matt"),
		I18n.t("LEYENDA", "pingpong_matt")]
	for n in RecordsLib.NIVELES:
		var puntos: Array = []
		for i in Motor.a_la_vez_de(n):
			puntos.append(acento)
		if Motor.prob_senuelo_de(n) > 0.0:
			puntos.append(CareerTheme.DANGER)
		info.append({"rotulo": rotulos[n], "puntos": puntos})
	return info



func _filas_records(mejor: Dictionary) -> Array:
	var reflejo: int = int(mejor.get("mejor_reflejo_ms", 0))
	return [
		{"icono": "target", "color_icono": acento, "rotulo": I18n.t("PUNTOS"),
			"valor": _o_guion(int(mejor.get("mejor_puntos", 0)))},
		{"icono": "potencia", "color_icono": acento, "rotulo": I18n.t("RACHA", "reflejos"),
			"valor": _o_guion(int(mejor.get("mejor_racha", 0)))},
		{"icono": "reloj", "color_icono": CareerTheme.TEXT_MID, "rotulo": I18n.t("REFLEJO"),
			"valor": _o_guion(reflejo), "unidad": I18n.t("MS") if reflejo > 0 else ""},
	]


func _o_guion(n: int) -> String:
	return str(n) if n > 0 else "-"



func _construir_vista_entrada(caja: Control) -> void:
	_pared_vista = _nueva_pared(true)
	caja.add_child(_pared_vista)
	_ajusta_pared(_pared_vista, true)
	_pinta_muestra()






func _construir_leyenda(fila: HBoxContainer) -> void:
	if compacto and tumbado:
		return
	var lado: float = 20.0 if compacto else 32.0
	fila.add_child(chip_dato(LuzLib.Punto.new(acento, false, lado), I18n.t("TOCA")))
	fila.add_child(chip_dato(LuzLib.Punto.new(CareerTheme.DANGER, true, lado), I18n.t("NO TOQUES")))


func _al_elegir_nivel(_n: int) -> void:
	_pinta_muestra()




func _pinta_muestra() -> void:
	if not is_instance_valid(_pared_vista):
		return
	var estados: Array[int] = []
	for i in Motor.CASILLAS:
		estados.append(LuzLib.Estado.APAGADA)
	estados[1] = LuzLib.Estado.ENCENDIDA
	if Motor.a_la_vez_de(nivel) > 1:
		estados[8] = LuzLib.Estado.ENCENDIDA
	if Motor.prob_senuelo_de(nivel) > 0.0:
		estados[6] = LuzLib.Estado.SENUELO
	for i in _pared_vista.luces.size():
		(_pared_vista.luces[i] as Control).set("estado", estados[i])




func _construir_escena(caja: Control) -> void:
	_pared_juego = _nueva_pared(false)
	_pared_juego.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	caja.add_child(_pared_juego)
	_ajusta_pared(_pared_juego, false)


func _nueva_pared(es_vista: bool) -> LuzLib.Pared:
	var pared: LuzLib.Pared = LuzLib.Pared.new()
	pared.name = "ParedVista" if es_vista else "ParedJuego"
	pared.tornillos = es_vista
	if es_vista:
		pared.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		pared.size_flags_vertical = Control.SIZE_EXPAND_FILL
		pared.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for i in Motor.CASILLAS:
		var luz: LuzLib = LuzLib.new()
		luz.name = "Luz%d" % i
		luz.color_buena = acento
		pared.agrega(luz)
	return pared






func _ajusta_pared(pared: LuzLib.Pared, es_vista: bool) -> void:
	if not is_instance_valid(pared):
		return
	pared.traspuesta = not tumbado
	if tumbado:
		pared.relleno = 56.0 if es_vista else 64.0
		pared.hueco_x = 40.0
		pared.hueco_y = 32.0 if es_vista else 40.0
	else:
		pared.relleno = 40.0 if es_vista else 56.0
		pared.hueco_x = 40.0 if es_vista else 48.0
		pared.hueco_y = 32.0 if es_vista else 56.0




	var llenado: float
	if tumbado:
		llenado = 0.9 if es_vista else 0.82
	else:
		llenado = 0.96 if es_vista else 1.0
	for luz: Control in pared.luces:
		luz.set("llenado", llenado)
	pared.coloca()


func _placas_hud() -> Array:
	return [
		{"id": "puntos", "icono": "target", "color_icono": acento, "rotulo": I18n.t("PUNTOS"), "grande": true},
		{"id": "racha", "icono": "potencia", "color_icono": acento, "rotulo": I18n.t("RACHA", "reflejos"),
			"tam": CareerTheme.T_TITULO_TUMBADO},
		{"id": "tiempo", "icono": "reloj", "color_icono": CareerTheme.TEXT_MID, "rotulo": I18n.t("TIEMPO"),
			"barra": true, "tam": CareerTheme.T_DATO_TUMBADO},
	]


func _empezar_partida() -> void:
	partida = Motor.new(nivel, semilla_partida())
	cursor = CURSOR_INICIAL
	_teclado = false
	for i in Motor.CASILLAS:
		_estado_luz[i] = LuzLib.Estado.APAGADA
		_destello[i] = 0.0
	_hud_puntos = 2147483647
	_hud_racha = -1
	_hud_segundos = -1
	_pinta_luces()
	_pinta_hud()


func _avanzar(dt: float) -> void:
	if partida == null or partida.terminado():
		return
	for ev: Dictionary in partida.tick(dt):
		var c: int = int(ev["casilla"])
		match int(ev["evento"]):
			Motor.Evento.ENCENDIDA:
				_pon_luz(c, LuzLib.Estado.SENUELO if int(ev["tipo"]) == Motor.Tipo.SENUELO else LuzLib.Estado.ENCENDIDA)
			Motor.Evento.APAGADA:

				_pon_luz(c, LuzLib.Estado.FALLADA, DESTELLO)
			Motor.Evento.SENUELO_APAGADO:
				_pon_luz(c, LuzLib.Estado.APAGADA)
			Motor.Evento.FIN:

				for i in Motor.CASILLAS:
					if _destello[i] <= 0.0:
						_estado_luz[i] = LuzLib.Estado.APAGADA
	for i in Motor.CASILLAS:
		if _destello[i] > 0.0:
			_destello[i] -= dt
			if _destello[i] <= 0.0:
				_destello[i] = 0.0
				_estado_luz[i] = LuzLib.Estado.APAGADA
	_pinta_luces()
	_pinta_hud()
	if partida.terminado():
		terminar()


func _pon_luz(c: int, e: int, destello: float = 0.0) -> void:
	if c < 0 or c >= Motor.CASILLAS:
		return
	_estado_luz[c] = e
	_destello[c] = destello


func _pinta_luces() -> void:
	if not is_instance_valid(_pared_juego):
		return
	var con_anillo: bool = _cursor_visible()
	for i in _pared_juego.luces.size():
		var luz: Control = _pared_juego.luces[i]
		luz.set("estado", _estado_luz[i])
		luz.set("enfocada", con_anillo and i == cursor)


func _cursor_visible() -> bool:
	return estado == "jugando" and (Entrada.hay_mando() or _teclado)


func _pinta_hud() -> void:
	if partida == null:
		return
	if partida.puntos != _hud_puntos:
		_hud_puntos = partida.puntos
		pon_placa("puntos", str(partida.puntos), CareerTheme.DANGER if partida.puntos < 0 else CareerTheme.TEXT)
	if partida.racha != _hud_racha:
		_hud_racha = partida.racha
		pon_placa("racha", str(partida.racha), acento if partida.racha > 0 else CareerTheme.TEXT_DIM)

	var seg: int = ceili(partida.tiempo_restante() - 0.0001)
	if seg != _hud_segundos:
		_hud_segundos = seg
		pon_placa("tiempo", mmss(seg * 1000))
	pon_barra(partida.tiempo_restante() / Motor.DURACION)



func _toque_jugando(pos: Vector2) -> bool:
	if not is_instance_valid(_pared_juego):
		return false
	var c: int = _pared_juego.casilla_en(pos)
	if c < 0:
		return false
	if _teclado:
		_teclado = false
	toca(c)
	return true




func toca(c: int) -> Dictionary:
	if estado != "jugando" or partida == null or partida.terminado():
		return {}
	var r: Dictionary = partida.toca(c)
	var luz: LuzLib = _pared_juego.luces[c] if is_instance_valid(_pared_juego) else null
	match int(r["resultado"]):
		Motor.Resultado.ACIERTO:
			_pon_luz(c, LuzLib.Estado.ACERTADA, DESTELLO)
			if luz != null:
				luz.flota("+%d" % int(r["delta"]), acento)
			UiAudio.click()
		Motor.Resultado.SENUELO:
			_pon_luz(c, LuzLib.Estado.SENUELO_TOCADO, DESTELLO)
			if luz != null:
				luz.flota("-1", CareerTheme.DANGER)
	_pinta_luces()
	_pinta_hud()
	return r




func _mando_jugando() -> void:
	if Input.is_action_just_pressed("ui_left"):
		mueve_cursor(-1, 0)
	elif Input.is_action_just_pressed("ui_right"):
		mueve_cursor(1, 0)
	if Input.is_action_just_pressed("ui_up"):
		mueve_cursor(0, -1)
	elif Input.is_action_just_pressed("ui_down"):
		mueve_cursor(0, 1)

	if mando_listo() and Input.is_action_just_pressed("fl_avanza"):
		toca_cursor()




func mueve_cursor(dx: int, dy: int) -> int:
	if not is_instance_valid(_pared_juego):
		return cursor
	var v: Vector2i = _pared_juego.celda_de(cursor)
	v.x = clampi(v.x + dx, 0, _pared_juego.columnas_vistas() - 1)
	v.y = clampi(v.y + dy, 0, _pared_juego.filas_vistas() - 1)
	cursor = _pared_juego.casilla_de(v)
	_pinta_luces()
	return cursor


func toca_cursor() -> Dictionary:
	return toca(cursor)



func _tecla(ev: InputEventKey) -> bool:
	var d := Vector2i.ZERO
	match ev.keycode:
		KEY_LEFT:
			d = Vector2i(-1, 0)
		KEY_RIGHT:
			d = Vector2i(1, 0)
		KEY_UP:
			d = Vector2i(0, -1)
		KEY_DOWN:
			d = Vector2i(0, 1)
		KEY_ENTER, KEY_KP_ENTER, KEY_SPACE:
			_teclado = true
			toca_cursor()
			return true
		_:
			return false
	_teclado = true
	mueve_cursor(d.x, d.y)
	return true







func _datos_record() -> Dictionary:
	if partida == null:
		return {}
	var d: Dictionary = {"puntos": maxi(int(partida.puntos), 0), "racha": int(partida.mejor_racha)}
	var reflejo: int = int(partida.reflejo_medio_ms())
	if reflejo > 0:
		d["reflejo_ms"] = reflejo
	return d


func _placas_resultado(antes: Dictionary, mejoras: Array[String]) -> Array:
	if partida == null:
		return []
	var reflejo: int = int(partida.reflejo_medio_ms())
	return [
		{"icono": "target", "color_icono": acento, "rotulo": I18n.t("PUNTOS"),
			"valor": str(partida.puntos), "color_valor": CareerTheme.DANGER if partida.puntos < 0 else CareerTheme.TEXT,
			"record": mejoras.has("mejor_puntos"), "previo": _previo(antes, "mejor_puntos")},
		{"icono": "potencia", "color_icono": acento, "rotulo": I18n.t("RACHA", "reflejos"),
			"valor": str(partida.mejor_racha), "color_valor": acento if partida.mejor_racha > 0 else CareerTheme.TEXT_DIM,
			"record": mejoras.has("mejor_racha"), "previo": _previo(antes, "mejor_racha")},
		{"icono": "reloj", "color_icono": CareerTheme.TEXT_MID, "rotulo": I18n.t("REFLEJO"),
			"valor": _o_guion(reflejo), "unidad": I18n.t("MS") if reflejo > 0 else "",
			"record": mejoras.has("mejor_reflejo_ms"), "previo": _previo(antes, "mejor_reflejo_ms")},
	]





func _placa_resultado(d: Dictionary, cuantas: int) -> PanelContainer:
	var p: PanelContainer = super(d, cuantas)
	if compacto and bool(d.get("record", false)):
		for chip in p.find_children("*", "PanelContainer", true, false):
			(chip as Control).visible = false
	return p



func _previo(antes: Dictionary, campo: String) -> String:
	var n: int = int(antes.get(campo, 0))
	return str(n) if n > 0 else ""




func _al_cambiar_forma() -> void:
	_ajusta_pared(_pared_vista, true)
	_ajusta_pared(_pared_juego, false)


func _al_cambiar_estado(_antes: String, ahora: String) -> void:
	if ahora == "entrada":
		_pinta_muestra()
	_pinta_luces()


func _al_cambiar_aparato() -> void:
	_pinta_luces()
