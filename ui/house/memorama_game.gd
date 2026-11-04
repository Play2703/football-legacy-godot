extends "res://ui/house/minijuego_casa.gd"


























const Motor := preload("res://features/career/memorama_motor.gd")
const Cartas := preload("res://features/career/memorama_cartas.gd")
const Carta := preload("res://ui/house/memorama_carta.gd")




const CARTA_W: float = 200.0
const CARTA_H: float = 256.0


const AIRE_TABLERO: float = 36.0

const ESCALA_MUESTRA: float = 0.86

const MINI: Vector2 = Vector2(96, 120)

const RETARDO_FIN: float = 0.6

var _motor: Motor = null

var _piezas: Array = []
var _por_clave: Dictionary = {}

var _cartas: Array = []

var _piezas_vista: Array = []
var _cursor: int = 0

var _teclado: bool = false
var _seg_pintado: int = -1
var _previa_total: float = 0.0
var _previa_resta: float = 0.0


var _tablero_vista: Control
var _cartas_vista: Control
var _columna: VBoxContainer
var _franja: PanelContainer
var _franja_rotulo: Label
var _franja_relleno: ColorRect
var _franja_seg: Label
var _tablero: Control
var _cartas_juego: Control


var _leyendas: Array = []


func _init() -> void:
	juego_id = RecordsLib.MEMORAMA
	titulo = I18n.t("MEMORAMA")
	acento = CareerTheme.NAV_LEGADO
	trofeo_record = "gema"
	retardo_resultado = RETARDO_FIN





func _niveles_info() -> Array:
	var rotulos: Array[String] = [I18n.t("ENTRENO", "pingpong_matt"),
		I18n.t("DESAFIO", "pingpong_matt"), I18n.t("LEYENDA", "pingpong_matt")]
	var out: Array = []
	for i in RecordsLib.NIVELES:
		out.append({"rotulo": rotulos[i], "icono": "ficha", "color_icono": CareerTheme.NAV_LEGADO,
			"cifra": str(Motor.PAREJAS[i])})
	return out


func _subtitulo_entrada() -> String:
	return I18n.t("TU COLECCIÓN")



func _filas_records(mejor: Dictionary) -> Array:
	var mov: int = int(mejor.get("menos_movimientos", 0))
	var ms: int = int(mejor.get("mejor_tiempo_ms", 0))
	return [
		{"icono": "ficha", "color_icono": CareerTheme.NAV_LEGADO, "rotulo": I18n.t("MOVIMIENTOS"),
			"valor": str(mov) if mov > 0 else "-"},
		{"icono": "reloj", "color_icono": CareerTheme.TEXT_MID, "rotulo": I18n.t("TIEMPO"),
			"valor": mmss(ms) if ms > 0 else "-"},
	]




func _construir_vista_entrada(caja: Control) -> void:
	var t: Array = _hacer_tablero(caja)
	_tablero_vista = t[0]
	_cartas_vista = t[1]
	_tablero_vista.resized.connect(_colocar_vista)
	_rehacer_vista()


	_refresca_leyendas()


func _al_elegir_nivel(_n: int) -> void:
	_rehacer_vista()
	_refresca_leyendas()


func _refresca_leyendas() -> void:
	for f in _leyendas.duplicate():
		if is_instance_valid(f):
			_rellena_leyenda(f)
		else:
			_leyendas.erase(f)


func _rehacer_vista() -> void:
	var n: int = Motor.PAREJAS[nivel]

	_piezas_vista = Cartas.piezas(n, semilla if semilla != 0 else 7, Cartas.datos_carrera())
	for h in _cartas_vista.get_children():
		_cartas_vista.remove_child(h)
		h.queue_free()
	var total: int = n * 2

	var caras: Dictionary = {1: 0, total - 5: 1}
	for i in total:
		var c = Carta.new()
		if caras.has(i) and int(caras[i]) < _piezas_vista.size():
			var p: Dictionary = _piezas_vista[int(caras[i])]
			c.setup(p, Cartas.textura(p))
			c.pon_estado(Motor.Estado.VISTA, false)
		else:
			c.setup({}, null)
		_cartas_vista.add_child(c)
	_colocar_vista()


func _colocar_vista() -> void:
	if is_instance_valid(_cartas_vista):



		if tumbado and not compacto:
			_colocar_rejilla(_cartas_vista, _cartas_vista.get_children(), Motor.COLUMNAS,
				ESCALA_MUESTRA, Vector2(24.0, 24.0) / ESCALA_MUESTRA)
		else:
			_colocar_rejilla(_cartas_vista, _cartas_vista.get_children(), Motor.COLUMNAS)




func _construir_leyenda(fila: HBoxContainer) -> void:
	_leyendas.append(fila)
	_rellena_leyenda(fila)


func _rellena_leyenda(fila: HBoxContainer) -> void:
	for h in fila.get_children():
		fila.remove_child(h)
		h.queue_free()
	var grupos: Array = [[], [], []]
	for p in _piezas_vista:
		var d: Dictionary = p
		var tipo: String = String(d.get("tipo", ""))
		if not bool(d.get("propia", false)):
			grupos[2].append(d)
		elif tipo == Cartas.PLAYERA or tipo == Cartas.PLAYERA_CAMBIO:
			grupos[0].append(d)
		else:
			grupos[1].append(d)
	if not compacto:
		var l: Label = _texto(I18n.t("EN JUEGO", "memorama"), _f_lee(), CareerTheme.TEXT_DIM)
		l.clip_text = false
		fila.add_child(l)
	var lado: float = 28.0 if compacto else 48.0
	for g in grupos:
		if (g as Array).is_empty():
			continue
		var p: Dictionary =(g as Array)[0]
		var dibujo := TextureRect.new()
		dibujo.texture = Cartas.textura(p)
		dibujo.custom_minimum_size = Vector2(lado, lado)
		dibujo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		dibujo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		dibujo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		dibujo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		if bool((p.get("ref", {}) as Dictionary).get("no_ganado", false)):
			dibujo.material = Carta._material_gris()
		var chip: PanelContainer = chip_dato(dibujo, str((g as Array).size()), _f_dato())
		if not tumbado:
			chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(chip)





func _construir_escena(caja: Control) -> void:
	_columna = _caja_v(24)
	_columna.name = "Columna"
	_columna.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	caja.add_child(_columna)
	_franja = PanelContainer.new()
	_franja.name = "Memoriza"
	_franja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.NAV_LEGADO, 0.12)
	sb.border_color = CareerTheme.NAV_LEGADO
	sb.set_border_width_all(3)
	sb.set_corner_radius_all(3)
	sb.content_margin_left = 28.0
	sb.content_margin_right = 28.0
	_franja.add_theme_stylebox_override("panel", sb)
	var fila := _caja_h(28)
	_franja.add_child(fila)
	_franja_rotulo = _texto(I18n.t("MEMORIZA"), _f_dato(), CareerTheme.NAV_LEGADO)
	_franja_rotulo.clip_text = false
	fila.add_child(_franja_rotulo)
	_franja_relleno = CareerUi.bar(fila, CareerTheme.NAV_LEGADO, 16.0)
	(_franja_relleno.get_parent() as Control).size_flags_vertical = Control.SIZE_SHRINK_CENTER


	_franja_seg = _texto("", _f_lee())
	_franja_seg.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	fila.add_child(_franja_seg)
	_franja.visible = false
	_columna.add_child(_franja)
	var t: Array = _hacer_tablero(_columna)
	_tablero = t[0]
	_cartas_juego = t[1]
	_tablero.resized.connect(_colocar_juego)
	_estilar_franja()




func _hacer_tablero(padre: Control) -> Array:
	var raiz := Control.new()
	raiz.name = "Tablero"
	raiz.mouse_filter = Control.MOUSE_FILTER_IGNORE
	raiz.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	raiz.size_flags_vertical = Control.SIZE_EXPAND_FILL
	raiz.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	var labio := Panel.new()
	labio.name = "Labio"
	labio.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sl := StyleBoxFlat.new()
	sl.bg_color = CareerTheme.SURFACE.darkened(0.5)
	sl.set_corner_radius_all(6)
	labio.add_theme_stylebox_override("panel", sl)
	labio.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	labio.offset_top = 12.0
	labio.offset_bottom = 0.0
	raiz.add_child(labio)
	var pano := Panel.new()
	pano.name = "Pano"
	pano.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sp := StyleBoxFlat.new()
	sp.bg_color = CareerTheme.SURFACE.darkened(0.15)
	sp.border_color = CareerTheme.SURFACE_LINE
	sp.set_border_width_all(3)
	sp.set_corner_radius_all(6)
	pano.add_theme_stylebox_override("panel", sp)
	pano.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	pano.offset_bottom = -12.0
	raiz.add_child(pano)
	var cartas := Control.new()
	cartas.name = "Cartas"
	cartas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cartas.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	cartas.offset_bottom = -12.0
	raiz.add_child(cartas)
	padre.add_child(raiz)
	return [raiz, cartas]






func _colocar_rejilla(caja: Control, cartas: Array, cols: int, tope: float = 1.0,
		hueco: Vector2 = Vector2(-1.0, -1.0)) -> void:
	var n: int = cartas.size()
	if n == 0 or caja.size.x <= 0.0 or caja.size.y <= 0.0:
		return
	var filas: int = ceili(n / float(cols))
	var hx: float = hueco.x if hueco.x >= 0.0 else 32.0
	var hy: float = hueco.y if hueco.y >= 0.0 else (24.0 if tumbado else 40.0)
	var ancho: float = cols * CARTA_W +(cols - 1) * hx + 2.0 * AIRE_TABLERO
	var alto: float = filas * CARTA_H +(filas - 1) * hy + 2.0 * AIRE_TABLERO
	var s: float = minf(tope, minf(caja.size.x / ancho, caja.size.y / alto))
	var carta := Vector2(CARTA_W, CARTA_H) * s
	var total := Vector2(cols * carta.x +(cols - 1) * hx * s, filas * carta.y +(filas - 1) * hy * s)
	var origen: Vector2 =((caja.size - total) * 0.5).floor()
	for i in n:
		var c: Control = cartas[i]
		c.size = carta.floor()
		c.position = origen + Vector2((i % cols) *(carta.x + hx * s),(i / cols) *(carta.y + hy * s)).floor()


func _colocar_juego() -> void:
	if is_instance_valid(_cartas_juego):
		_colocar_rejilla(_cartas_juego, _cartas, Motor.COLUMNAS)


func _estilar_franja() -> void:
	if not is_instance_valid(_franja):
		return
	_columna.add_theme_constant_override("separation", _hueco(24))
	_franja.custom_minimum_size.y = 40.0 if compacto else 72.0
	_franja_rotulo.add_theme_font_size_override("font_size", _f_dato())
	_franja_seg.add_theme_font_size_override("font_size", _f_lee())


	_franja_seg.custom_minimum_size.x = float(_f_lee()) * 5.0 + 4.0
	var sb: StyleBoxFlat = _franja.get_theme_stylebox("panel")
	sb.content_margin_left = 12.0 if compacto else 28.0
	sb.content_margin_right = 12.0 if compacto else 28.0


func _al_cambiar_forma() -> void:
	_estilar_franja()
	_colocar_vista()
	_colocar_juego()



func _placas_hud() -> Array:
	return [
		{"id": "mov", "icono": "ficha", "color_icono": CareerTheme.NAV_LEGADO,
			"rotulo": I18n.t("MOVIMIENTOS"), "flex": 1.4, "grande": true},
		{"id": "parejas", "icono": "check", "color_icono": CareerTheme.NAV_LEGADO,
			"rotulo": I18n.t("PAREJAS", "memorama"), "barra": true},
		{"id": "tiempo", "icono": "reloj", "color_icono": CareerTheme.TEXT_MID,
			"rotulo": I18n.t("TIEMPO")},
	]


func _usa_cuenta() -> bool:
	return false




func _empezar_partida() -> void:
	var sem: int = semilla_partida()
	var n: int = Motor.PAREJAS[nivel]
	_piezas = Cartas.piezas(n, sem, Cartas.datos_carrera())
	_por_clave.clear()
	var claves: Array = []
	for p in _piezas:
		_por_clave[String(p["clave"])] = p
		claves.append(String(p["clave"]))
	_motor = Motor.new(nivel, claves, sem)
	for c in _cartas:
		if is_instance_valid(c):
			c.queue_free()
	_cartas.clear()
	var texturas: Dictionary = {}
	for i in _motor.n_cartas():
		var clave: String = String(_motor.carta(i)["clave"])
		var p: Dictionary = _por_clave.get(clave, {})
		if not texturas.has(clave):
			texturas[clave] = Cartas.textura(p)
		var c = Carta.new()
		c.name = "Carta%d" % i
		c.setup(p, texturas[clave])
		_cartas_juego.add_child(c)
		_cartas.append(c)
	_cursor = 0
	_seg_pintado = -1
	_previa_total = Motor.VISTA_PREVIA[nivel]
	_previa_resta = _previa_total
	_sincroniza(false)
	_pinta_hud()
	_colocar_juego()
	_pinta_cursor()




func _avanzar(dt: float) -> void:
	if _motor == null:
		return
	if _motor.en_vista_previa():
		_previa_resta = maxf(0.0, _previa_resta - dt)
	_motor.tick(dt)
	_sincroniza(true)
	_pinta_hud()
	if _motor.terminado():
		terminar()


func _toque_jugando(pos: Vector2) -> bool:
	if _motor == null:
		return false
	_teclado = false
	var local: Vector2 = _cartas_juego.get_global_transform().affine_inverse() * pos
	for i in _cartas.size():
		var c: Control = _cartas[i]
		if Rect2(c.position, c.size).has_point(local):
			voltear(i)
			return true


	if _motor.en_vista_previa():
		voltear(0)
		return true
	return false



func voltear(i: int) -> int:
	if _motor == null or estado != "jugando":
		return Motor.Resultado.IGNORADO
	var en_previa: bool = _motor.en_vista_previa()
	var r: int = _motor.voltea(i)
	if en_previa:
		_previa_resta = 0.0
	match r:
		Motor.Resultado.PRIMERA:
			UiAudio.click()
		Motor.Resultado.PAREJA:
			UiAudio.pop()
		Motor.Resultado.FALLO:
			UiAudio.deny()
	_sincroniza(true)
	_pinta_hud()
	if _motor.terminado():
		terminar()
	return r


func _sincroniza(animar: bool) -> void:
	if _motor == null:
		return
	for i in _cartas.size():
		var e: int = int(_motor.carta(i).get("estado", Motor.Estado.OCULTA))
		_cartas[i].pon_estado(e, animar)
	var previa: bool = _motor.en_vista_previa() and estado in ["jugando", "pausa"]
	if is_instance_valid(_franja) and _franja.visible != previa:
		_franja.visible = previa
		_pinta_franja()


func _pinta_hud() -> void:
	pon_placa("mov", str(_motor.movimientos))
	pon_placa("parejas", "%d/%d" % [_motor.parejas_hechas, _motor.n_parejas()])
	pon_barra(_motor.parejas_hechas / float(maxi(1, _motor.n_parejas())), CareerTheme.NAV_LEGADO)
	var seg: int = int(_motor.tiempo)
	if seg != _seg_pintado:
		_seg_pintado = seg
		pon_placa("tiempo", mmss(int(_motor.tiempo * 1000.0)))
	_pinta_franja()


func _pinta_franja() -> void:
	if is_instance_valid(_franja) and _franja.visible:
		_franja_relleno.anchor_right = _previa_resta / maxf(0.01, _previa_total)
		_franja_seg.text = I18n.tf("{0} S", [I18n.num(_previa_resta, 1)])



func _mando_jugando() -> void:
	var antes: int = _cursor
	if Input.is_action_just_pressed("ui_left"):
		_mueve_cursor(-1, 0)
	elif Input.is_action_just_pressed("ui_right"):
		_mueve_cursor(1, 0)
	elif Input.is_action_just_pressed("ui_up"):
		_mueve_cursor(0, -1)
	elif Input.is_action_just_pressed("ui_down"):
		_mueve_cursor(0, 1)
	if antes != _cursor:
		UiAudio.click(1.2)

	if mando_listo() and Input.is_action_just_pressed("fl_avanza"):
		voltear(_cursor)


func _tecla(ev: InputEventKey) -> bool:
	match ev.keycode:
		KEY_LEFT:
			_mueve_cursor(-1, 0)
		KEY_RIGHT:
			_mueve_cursor(1, 0)
		KEY_UP:
			_mueve_cursor(0, -1)
		KEY_DOWN:
			_mueve_cursor(0, 1)
		KEY_ENTER, KEY_KP_ENTER, KEY_SPACE:
			voltear(_cursor)
		_:
			return false
	if not Entrada.hay_mando():
		_teclado = true
	_pinta_cursor()
	return true




func _mueve_cursor(dx: int, dy: int) -> void:
	if _cartas.is_empty():
		return
	var cols: int = Motor.COLUMNAS
	var x: int = clampi(_cursor % cols + dx, 0, cols - 1)
	var y: int = clampi(_cursor / cols + dy, 0,(_cartas.size() - 1) / cols)
	_cursor = mini(y * cols + x, _cartas.size() - 1)
	_pinta_cursor()


func _pinta_cursor() -> void:
	var ver: bool = estado == "jugando" and (Entrada.hay_mando() or _teclado)
	for i in _cartas.size():
		_cartas[i].enfocada = ver and i == _cursor


func _al_cambiar_estado(_antes: String, _ahora: String) -> void:
	_pinta_cursor()
	_sincroniza(false)


func _al_cambiar_aparato() -> void:
	if Entrada.hay_mando():
		_teclado = false
	_pinta_cursor()




func _datos_record() -> Dictionary:
	if _motor == null or not _motor.terminado():
		return {}
	return {"movimientos": _motor.movimientos, "tiempo_ms": int(_motor.tiempo * 1000.0)}


func _titulo_resultado() -> String:
	return I18n.t("COMPLETADO")


func _placas_resultado(antes: Dictionary, mejoras: Array[String]) -> Array:
	var prev_mov: int = int(antes.get("menos_movimientos", 0))
	var prev_ms: int = int(antes.get("mejor_tiempo_ms", 0))
	return [
		{"icono": "ficha", "color_icono": CareerTheme.NAV_LEGADO, "rotulo": I18n.t("MOVIMIENTOS"),
			"valor": str(_motor.movimientos), "record": mejoras.has("menos_movimientos"),
			"previo": str(prev_mov) if prev_mov > 0 else ""},
		{"icono": "reloj", "color_icono": CareerTheme.TEXT_MID, "rotulo": I18n.t("TIEMPO"),
			"valor": mmss(int(_motor.tiempo * 1000.0)), "record": mejoras.has("mejor_tiempo_ms"),
			"previo": mmss(prev_ms) if prev_ms > 0 else ""},
	]




func _extra_resultado(caja: VBoxContainer) -> void:
	if _piezas.is_empty():
		return



	var en_fila: bool = compacto and tumbado
	var rotulo: Label = _texto(I18n.t("TU COLECCIÓN"), _f_lee(), CareerTheme.TEXT_DIM)
	var mini: Vector2 = MINI
	if compacto:
		mini = MINI *(0.3 if tumbado else 0.5)



	var por_fila: int = _piezas.size() if tumbado else 4
	var rejilla := _caja_v(_hueco(24))
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if en_fila:
		var fila := _caja_h(_hueco(16))
		rotulo.clip_text = false
		fila.add_child(rotulo)
		fila.add_child(rejilla)
		caja.add_child(fila)
	else:
		caja.add_child(rotulo)
		caja.add_child(rejilla)


	var total: int = ceili(_piezas.size() / float(por_fila)) * por_fila
	var linea: HBoxContainer = null
	for i in total:
		if i % por_fila == 0:
			linea = _caja_h(0)
			rejilla.add_child(linea)
		else:
			var aire := Control.new()
			aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
			aire.custom_minimum_size.x = float(_hueco(8))
			aire.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			linea.add_child(aire)
		if i >= _piezas.size():
			var vacio := Control.new()
			vacio.mouse_filter = Control.MOUSE_FILTER_IGNORE
			vacio.custom_minimum_size = mini
			linea.add_child(vacio)
			continue
		var p: Dictionary = _piezas[i]
		var c = Carta.new()
		c.setup(p, Cartas.textura(p), true)
		c.custom_minimum_size = mini
		c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		linea.add_child(c)


func _al_cerrar() -> void:
	Cartas.soltar()
