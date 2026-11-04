extends Control






















signal firmada(premio: bool)



signal negada



const RADIO_TINTA: float = 4.4
const RADIO_BORDE: float = 6.6
const PASO_TRAZO: float = 1.6


const TINTA_MIN: int = 160



const ESPERA_FIRMA: float = 45.0
const AUTO_DUR: float = 1.5
const TINTA_OSCURA: Color = Color("15171c")
const TINTA_CLARA: Color = Color("f2efe6")


const ROTU_VEL: float = 600.0

var img: Image = null
var tex: ImageTexture = null

var tinta: int = 0
var cerrado: bool = false

var _base: Image = null
var _mask: PackedByteArray = PackedByteArray()
var _recorte: Rect2i = Rect2i()
var _zona: Rect2i = Rect2i()
var _k: float = 1.0
var _tinta_col: Color = TINTA_OSCURA
var _borde_col: Color = TINTA_CLARA
var _sucio: bool = false
var _trazando: bool = false
var _ultimo: Vector2 = Vector2.ZERO
var _quieto: float = 0.0
var _reloj: float = 0.0
var _auto: bool = false
var _auto_s: float = 0.0
var _auto_fin: float = -1.0
var _auto_premio: bool = false


var _auto_abierta: bool = false
var _lienzo: TextureRect = null
var _continuar: Button = null
var _col: VBoxContainer = null
var _no: Button = null
var _rotu: AudioStreamPlayer = null
var _rotu_px: float = 0.0
var _rotu_vel: float = 0.0




var trazos: Array[PackedVector2Array] = []



var _auto_pts: PackedVector2Array = PackedVector2Array()
var _auto_salto: PackedByteArray = PackedByteArray()
var _auto_acum: PackedFloat32Array = PackedFloat32Array()



var trazos_auto: Array[PackedVector2Array] = []

var rotulo_borrar: String = "BORRAR FIRMA"















func monta(base: Image, recorte: Rect2i, zona: Rect2i, titulo: String, pista: String,
		progreso: String = "", lienzo_px: float = 896.0, alto_max: float = 1180.0) -> bool:
	if base == null or base.is_empty():
		push_warning("firma_lienzo: monta sin imagen base; el acto sigue sin firma")
		cerrado = true
		return false
	_base = base.duplicate()
	if _base.is_compressed():
		_base.decompress()
	_base.convert(Image.FORMAT_RGBA8)
	img = _base.duplicate()
	tex = ImageTexture.create_from_image(img)
	_mask.resize(img.get_width() * img.get_height())
	_mask.fill(0)
	_recorte = recorte.intersection(Rect2i(Vector2i.ZERO, img.get_size()))
	if not _recorte.has_area():
		_recorte = Rect2i(Vector2i.ZERO, img.get_size())
	_zona = zona.intersection(Rect2i(Vector2i.ZERO, img.get_size()))
	if not _zona.has_area():
		_zona = _recorte
	_k = float(img.get_width()) / 512.0
	_elige_tinta()
	_arma_ui(titulo, pista, progreso, lienzo_px, alto_max)
	_rotu = AudioStreamPlayer.new()
	_rotu.stream = AudioBank.stream("rotulador_loop")
	_rotu.volume_db = -60.0
	_rotu.bus = "SFX"
	add_child(_rotu)
	_rotu.play()
	return true




func firma_sola(premio: bool = false) -> void:
	if cerrado:
		return
	_auto = true
	_auto_s = 0.0
	_auto_fin = -1.0
	_auto_premio = premio
	_trazando = false
	if trazos_auto.is_empty():
		_prepara_auto(firma_guardada())
	else:
		_prepara_trazos(trazos_auto)




static func firma_guardada() -> Array:
	var ml: MainLoop = Engine.get_main_loop()
	if not ml is SceneTree:
		return []
	var c: Node =(ml as SceneTree).root.get_node_or_null("Career")
	if c == null:
		return []
	var v: Variant = c.get("firma_trazo")
	return v if v is Array else []







func trazos_guardables() -> Array:
	var caja: Rect2 = Rect2()
	var hay: bool = false
	for tr in trazos:
		for p in tr:
			if not hay:
				caja = Rect2(p, Vector2.ZERO)
				hay = true
			else:
				caja = caja.expand(p)
	if not hay or caja.size.x < 1.0:
		return []
	var out: Array = []
	for tr in trazos:
		var plano: Array = []
		for p in tr:
			var q: Vector2 =(p - caja.position) / caja.size.x
			plano.append(snappedf(q.x, 0.001))
			plano.append(snappedf(q.y, 0.001))
		out.append(plano)
	return out



static func proporcion(firma: Array) -> float:
	var alto: float = 0.0
	for tr in firma:
		var plano: Array = tr
		for i in range(1, plano.size(), 2):
			alto = maxf(alto, float(plano[i]))
	return alto




static func firma_en_caja(firma: Array, caja: Rect2) -> Array[PackedVector2Array]:
	var out: Array[PackedVector2Array] = []
	var alto: float = maxf(proporcion(firma), 0.01)
	var ancho: float = minf(caja.size.x, caja.size.y / alto)
	var org: Vector2 = caja.position +(caja.size - Vector2(ancho, ancho * alto)) * 0.5
	for tr in firma:
		var plano: Array = tr
		var pts: PackedVector2Array = PackedVector2Array()
		for i in range(0, plano.size() - 1, 2):
			pts.append(org + Vector2(float(plano[i]), float(plano[i + 1])) * ancho)
		if not pts.is_empty():
			out.append(pts)
	return out




func _prepara_auto(firma: Array) -> void:
	_auto_pts = PackedVector2Array()
	_auto_salto = PackedByteArray()
	_auto_acum = PackedFloat32Array()
	if firma.is_empty():
		return
	var z: Rect2 = Rect2(_zona)
	var caja: Rect2 = Rect2(z.position + z.size * Vector2(0.125, 0.36), z.size * Vector2(0.75, 0.3))
	_prepara_trazos(firma_en_caja(firma, caja))



func _prepara_trazos(lista: Array[PackedVector2Array]) -> void:
	_auto_pts = PackedVector2Array()
	_auto_salto = PackedByteArray()
	_auto_acum = PackedFloat32Array()
	var largo: float = 0.0
	for tr in lista:
		for k in tr.size():
			if not _auto_pts.is_empty() and k > 0:
				largo += _auto_pts[_auto_pts.size() - 1].distance_to(tr[k])
			_auto_pts.append(tr[k])
			_auto_salto.append(1 if k == 0 else 0)
			_auto_acum.append(largo)
	if largo <= 0.0:

		for p in _auto_pts:
			_sello(p)
		_auto_pts = PackedVector2Array()



func tick(delta: float) -> void:
	_reloj += delta
	if not cerrado:
		if _auto:
			if _auto_s < 1.0 and not _auto_pts.is_empty():
				var s1: float = minf(1.0, _auto_s + delta / AUTO_DUR)
				_traza_guardada(_auto_s, s1)
				_auto_s = s1
				if _auto_s >= 1.0:
					_auto_fin = _reloj
			elif _auto_s < 1.0:
				var s1: float = minf(1.0, _auto_s + delta / AUTO_DUR)
				var s: float = _auto_s
				while s < s1:
					var s_b: float = minf(s1, s + 0.004)

					if not (s < 0.8 and s_b > 0.8):
						_traza(_punto_auto(s), _punto_auto(s_b))
					s = s_b
				_auto_s = s1
				if _auto_s >= 1.0:
					_auto_fin = _reloj
			elif _auto_abierta:



				_auto = false
				_auto_abierta = false
				_quieto = 0.0
				if _continuar != null and tinta >= _tinta_min():
					_continuar.disabled = false
					if Entrada.modo == Entrada.Modo.MANDO:
						_continuar.grab_focus()
			elif _reloj >= _auto_fin + 0.5:
				_cierra(_auto_premio)
		else:
			_quieto += delta
			if _quieto >= ESPERA_FIRMA:
				if tinta >= _tinta_min():
					_cierra(true)
				else:
					firma_sola(false)
		if _continuar != null:
			_continuar.disabled = tinta < _tinta_min() or _auto
	_tick_rotulador(delta)
	if _sucio and tex != null:
		tex.update(img)
		_sucio = false






func _traza_guardada(s0: float, s1: float) -> void:
	var total: float = _auto_acum[_auto_acum.size() - 1]
	var a: float = s0 * total
	var b: float = s1 * total
	for i in _auto_pts.size():
		if _auto_salto[i] == 1:
			if (a < _auto_acum[i] or (i == 0 and s0 == 0.0)) and _auto_acum[i] <= b:
				_sello(_auto_pts[i])
			continue
		var l0: float = _auto_acum[i - 1]
		var l1: float = _auto_acum[i]
		if l1 < a or l0 > b or l1 <= l0:
			continue
		var p0: Vector2 = _auto_pts[i - 1].lerp(_auto_pts[i], clampf((a - l0) /(l1 - l0), 0.0, 1.0))
		var p1: Vector2 = _auto_pts[i - 1].lerp(_auto_pts[i], clampf((b - l0) /(l1 - l0), 0.0, 1.0))
		_traza(p0, p1)


func _tinta_min() -> int:
	return int(float(TINTA_MIN) * _k * _k)





func _elige_tinta() -> void:
	var suma: float = 0.0
	var n: int = 0
	var paso: int = maxi(1, int(8.0 * _k))
	for y in range(_zona.position.y, _zona.end.y, paso):
		for x in range(_zona.position.x, _zona.end.x, paso):
			var c: Color = _base.get_pixel(x, y)
			if c.a > 0.5:
				suma += c.get_luminance()
				n += 1
	var clara: bool = n > 0 and suma / float(n) > 0.55
	_tinta_col = TINTA_OSCURA if clara else TINTA_CLARA
	_borde_col = TINTA_CLARA if clara else TINTA_OSCURA




const COL_MARGEN_X: float = 34.0
const COL_MARGEN_Y: float = 40.0
const COL_SEP: int = 18




static func medida_lienzo(recorte: Vector2, lienzo_px: float, alto_max: float) -> Vector2:
	var alto: float = lienzo_px * recorte.y / maxf(recorte.x, 1.0)
	var ancho: float = lienzo_px
	if alto > alto_max:
		ancho = lienzo_px * alto_max / alto
		alto = alto_max
	return Vector2(ancho, alto)











static func cajas_cabecera(pantalla: Rect2, arriba: float, abajo: float, lienzo: Vector2,
		titulo: String, pista: String, progreso: String = "") -> Array[Rect2]:
	var renglones: Array[Vector2] = []
	if not progreso.is_empty():
		renglones.append(_mide_rotulo(CareerTheme.T_BODY, progreso))
	renglones.append(_mide_rotulo(CareerTheme.T_TITLE, titulo))
	renglones.append(_mide_rotulo(CareerTheme.T_BODY, pista))
	var alto: float = lienzo.y + float(maxi(CareerTheme.BTN_CTA_H, CareerTheme.BTN_SECONDARY_H))
	for r in renglones:
		alto += r.y
	alto += float(COL_SEP) * float(renglones.size() + 1)
	var col_x: float = pantalla.position.x + COL_MARGEN_X
	var col_w: float = pantalla.size.x - 2.0 * COL_MARGEN_X
	var col_h: float = pantalla.size.y - arriba - abajo - 2.0 * COL_MARGEN_Y

	var y: float = pantalla.position.y + arriba + COL_MARGEN_Y + maxf(0.0, floor((col_h - alto) * 0.5))
	var out: Array[Rect2] = []
	for r in renglones:
		var w: float = minf(r.x, col_w)
		out.append(Rect2(col_x +(col_w - w) * 0.5, y, w, r.y))
		y += r.y + float(COL_SEP)
	return out







static func _mide_rotulo(px: int, texto: String) -> Vector2:
	var l: Label = CareerUi.plain(px)
	l.text = texto
	CareerUi.normalize_caps(l)
	texto = l.text
	l.free()
	var tema: Theme = ThemeDB.get_project_theme()
	var fuente: Font = tema.get_font("font", "Label") if tema != null else ThemeDB.fallback_font
	return Vector2(fuente.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x,
		fuente.get_height(px))


func _arma_ui(titulo: String, pista: String, progreso: String, lienzo_px: float,
		alto_max: float) -> void:




	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP


	add_to_group(Entrada.CAPA_GROUP)
	var velo: ColorRect = ColorRect.new()
	velo.color = CareerTheme.MODAL_SCRIM
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(velo)
	var col: VBoxContainer = VBoxContainer.new()
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = COL_MARGEN_X
	col.offset_right = - COL_MARGEN_X
	col.offset_top = UiKit.top_safe_inset(get_viewport()) + COL_MARGEN_Y
	col.offset_bottom = -(UiKit.bottom_safe_inset(get_viewport()) + COL_MARGEN_Y)


	col.offset_left += UiKit.side_safe_inset(get_viewport())
	col.offset_right -= UiKit.side_safe_inset(get_viewport())
	CareerUi.columna_centrada(col, get_viewport())
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", COL_SEP)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)
	_col = col
	if not progreso.is_empty():
		var cuenta: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.accent_text())
		cuenta.text = progreso
		cuenta.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		cuenta.clip_text = true
		col.add_child(cuenta)
	var tit: Label = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.TEXT)
	tit.text = titulo
	tit.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	tit.clip_text = true
	col.add_child(tit)
	var pis: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)



	if Entrada.modo == Entrada.Modo.MANDO and pista == I18n.t("Firma con el dedo"):
		pista = I18n.tf("Pulsa {0} para firmar", [Entrada.boton("fl_avanza")])
	pis.text = pista
	pis.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	pis.clip_text = true
	col.add_child(pis)


	var vista: AtlasTexture = AtlasTexture.new()
	vista.atlas = tex
	vista.region = Rect2(_recorte)
	_lienzo = TextureRect.new()
	_lienzo.texture = vista
	_lienzo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_lienzo.stretch_mode = TextureRect.STRETCH_SCALE
	_lienzo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_lienzo.custom_minimum_size = medida_lienzo(Vector2(_recorte.size), lienzo_px, alto_max)
	_lienzo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_lienzo.mouse_filter = Control.MOUSE_FILTER_STOP





	CareerUi.tocable_mando(_lienzo)
	_lienzo.set_meta(Entrada.PRIMERO_META, true)
	_lienzo.gui_input.connect(_on_lienzo)
	col.add_child(_lienzo)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	col.add_child(fila)


	var borrar: Button = CareerUi.accion("escoba", I18n.t(rotulo_borrar), CareerTheme.DANGER)
	borrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	borrar.pressed.connect(_borra)
	fila.add_child(borrar)
	_continuar = CareerUi.primary_cta(I18n.t("CONTINUAR"), _on_continuar)
	_continuar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_continuar.disabled = true
	fila.add_child(_continuar)
	_encaja()
	CareerUi.normalize_caps(self)








func _encaja() -> void:
	if _col == null or _lienzo == null:
		return
	var alto_col: float = SceneFade.rect_visible(self).size.y \
			+ _col.offset_bottom - _col.offset_top
	var sobra: float = _col.get_combined_minimum_size().y - alto_col
	if sobra > 0.0:
		var m: Vector2 = _lienzo.custom_minimum_size
		var alto: float = maxf(m.y - sobra, 240.0)
		_lienzo.custom_minimum_size = Vector2(m.x * alto / maxf(m.y, 1.0), alto)






func ofrece_no(fx_si: Dictionary, fx_no: Dictionary) -> void:
	if _col == null or _no != null:
		return
	if not fx_si.is_empty():
		var si_fila: HBoxContainer = HBoxContainer.new()
		si_fila.alignment = BoxContainer.ALIGNMENT_END
		si_fila.add_theme_constant_override("separation", 18)
		si_fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_col.add_child(si_fila)
		DecisionUi._rel_chips_into(si_fila, fx_si)
	_no = Button.new()
	_no.text = I18n.t("NO FIRMAR")
	_no.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	_no.clip_text = true
	CareerTheme.apply_button(_no, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	_no.pressed.connect(_on_no)
	_col.add_child(_no)
	if not fx_no.is_empty():
		var no_fila: HBoxContainer = HBoxContainer.new()
		no_fila.alignment = BoxContainer.ALIGNMENT_CENTER
		no_fila.add_theme_constant_override("separation", 18)
		no_fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_col.add_child(no_fila)
		DecisionUi._rel_chips_into(no_fila, fx_no)
	_encaja()
	CareerUi.normalize_caps(self)


func _on_no() -> void:
	if cerrado or _auto:
		return
	cerrado = true
	if _rotu != null:
		_rotu.stop()
	negada.emit()




func _on_lienzo(ev: InputEvent) -> void:



	if ev is InputEventJoypadButton:
		if ev.is_action("fl_avanza") or ev.is_action("ui_accept"):
			if _lienzo != null:
				_lienzo.accept_event()
			if ev.is_pressed():
				_firma_mando()
		return
	if cerrado or _auto or _lienzo == null:
		return




	if Entrada.modo == Entrada.Modo.MANDO:
		return
	var pos: Vector2 = Vector2.ZERO
	var baja: bool = false
	var sube: bool = false
	var arrastra: bool = false
	if ev is InputEventScreenTouch:
		var st: InputEventScreenTouch = ev
		if st.index != 0:
			return
		pos = st.position
		baja = st.pressed
		sube = not st.pressed
	elif ev is InputEventScreenDrag:
		var sd: InputEventScreenDrag = ev
		if sd.index != 0:
			return
		pos = sd.position
		arrastra = true
	elif ev is InputEventMouseButton:
		var mb: InputEventMouseButton = ev
		if mb.button_index != MOUSE_BUTTON_LEFT:
			return
		pos = mb.position
		baja = mb.pressed
		sube = not mb.pressed
	elif ev is InputEventMouseMotion:
		var mm: InputEventMouseMotion = ev
		if (mm.button_mask&MOUSE_BUTTON_MASK_LEFT) == 0:
			return
		pos = mm.position
		arrastra = true
	else:
		return
	_quieto = 0.0
	var tx: Vector2 = Vector2(_recorte.position) + pos / _lienzo.size * Vector2(_recorte.size)
	if baja:
		_trazando = true
		_ultimo = tx
		_sello(tx)
		trazos.append(PackedVector2Array([tx]))
	elif arrastra and _trazando:
		_traza(_ultimo, tx)
		_ultimo = tx
		if not trazos.is_empty():
			trazos[trazos.size() - 1].append(tx)
	elif sube:
		_trazando = false
	_lienzo.accept_event()


func _traza(a: Vector2, b: Vector2) -> void:
	_rotu_px += a.distance_to(b) / _k
	var n: int = maxi(1, int(ceil(a.distance_to(b) /(PASO_TRAZO * _k))))
	for i in range(1, n + 1):
		_sello(a.lerp(b, float(i) / float(n)))




func _sello(c: Vector2) -> void:
	var rt: float = RADIO_TINTA * _k
	var rb: float = RADIO_BORDE * _k
	var r2: float = rt * rt
	var b2: float = rb * rb
	var w: int = img.get_width()
	var h: int = img.get_height()
	var y0: int = maxi(0, int(floor(c.y - rb)))
	var y1: int = mini(h - 1, int(ceil(c.y + rb)))
	var x0: int = maxi(0, int(floor(c.x - rb)))
	var x1: int = mini(w - 1, int(ceil(c.x + rb)))
	for y in range(y0, y1 + 1):
		for x in range(x0, x1 + 1):
			var d2: float = Vector2(float(x) + 0.5, float(y) + 0.5).distance_squared_to(c)
			if d2 > b2 or _base.get_pixel(x, y).a < 0.5:
				continue
			var i: int = y * w + x
			if d2 <= r2:
				if _mask[i] != 2:
					_mask[i] = 2
					tinta += 1
					img.set_pixel(x, y, _tinta_col)
					_sucio = true
			elif _mask[i] == 0:
				_mask[i] = 1
				img.set_pixel(x, y, _borde_col)
				_sucio = true


func _borra() -> void:
	if cerrado or _auto or _base == null:
		return
	img.copy_from(_base)
	_mask.fill(0)
	tinta = 0
	trazos.clear()
	_trazando = false
	_sucio = true
	_quieto = 0.0






func _firma_mando() -> void:
	if cerrado or _auto or _base == null:
		return
	_borra()
	firma_sola(true)
	_auto_abierta = true


func _on_continuar() -> void:
	if tinta < _tinta_min() or _auto:
		return
	_cierra(true)







func _punto_auto(s: float) -> Vector2:
	return punto_garabato(Rect2(_zona), s)




static func punto_garabato(zona: Rect2, s: float) -> Vector2:
	var uv: Vector2
	if s <= 0.8:
		var u: float = s / 0.8
		uv = Vector2(0.125 + 0.75 * u, 0.475 + 0.075 * sin(2.2 * TAU * u)
			+ 0.04375 * sin(5.3 * TAU * u + 1.0) - 0.0625 * u)
	else:
		uv = Vector2(5.0 / 28.0, 0.625).lerp(Vector2(0.875, 0.5875),(s - 0.8) / 0.2)
	return zona.position + uv * zona.size




func _tick_rotulador(delta: float) -> void:
	if _rotu == null:
		return
	var vel: float = _rotu_px / maxf(delta, 0.001)
	_rotu_px = 0.0
	_rotu_vel = lerpf(_rotu_vel, vel, 1.0 - exp(- delta * 20.0))
	var k: float = clampf(_rotu_vel / ROTU_VEL, 0.0, 1.0)
	_rotu.volume_db = -60.0 if k < 0.03 or cerrado else lerpf(-30.0, -12.0, sqrt(k))
	_rotu.pitch_scale = lerpf(0.85, 1.18, k)


func _cierra(premio: bool) -> void:
	if cerrado:
		return
	cerrado = true
	if _sucio and tex != null:
		tex.update(img)
		_sucio = false
	if _rotu != null:
		_rotu.stop()
	firmada.emit(premio)
