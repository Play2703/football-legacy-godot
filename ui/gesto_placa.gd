extends PanelContainer
















signal elegida(key: String)


signal despierta


const ANCHO_TUMBADO: float = 1180.0
const MARGEN_DE_PIE: float = 40.0


const FICHA_H: float = 120.0


const CASILLA_LADO: float = 64.0
const BARRA_H: float = 10.0

var _barra: ProgressBar = null
var _fichas: Array[Button] = []


var _tw: Tween = null

var _dormida: bool = true





func arma(fichas: Array[String], away: bool, reconcilia: bool, carga: String,
		club: Color) -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	name = "GestoPlaca"
	add_to_group(Entrada.CAPA_GROUP)






	set_meta(Entrada.A_AVANZA_META, true)


	add_to_group(CareerUi.ATRAS_CAPA_GROUP)
	var roce: bool = GestoElegido.con_roce(fichas)
	var tumbado: bool = UiKit.es_horizontal()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.REDES_BG
	sb.border_color = CareerTheme.REDES_LINE
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(30)
	sb.shadow_color = CareerTheme.REDES_SOMBRA
	sb.shadow_size = 0
	sb.shadow_offset = Vector2(0, 8)
	sb.content_margin_left = 26.0
	sb.content_margin_right = 26.0
	sb.content_margin_top = 22.0
	sb.content_margin_bottom = 20.0
	add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 16)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(col)
	col.add_child(_cabecera(carga, tumbado))
	var caja: BoxContainer = HBoxContainer.new() if tumbado else VBoxContainer.new()
	caja.name = "Fichas"
	caja.add_theme_constant_override("separation", 16)
	col.add_child(caja)
	var primero: bool = false
	for key in fichas:
		var b: Button = _ficha(key, away, reconcilia, roce, club, tumbado)
		caja.add_child(b)
		_fichas.append(b)



		if not primero and key == GestoElegido.TUYOS:
			b.set_meta(Entrada.PRIMERO_META, true)
			primero = true
	_barra = ProgressBar.new()
	_barra.name = "Cuenta"
	_barra.show_percentage = false
	_barra.min_value = 0.0
	_barra.max_value = 1.0
	_barra.value = 1.0
	_barra.custom_minimum_size = Vector2(0.0, BARRA_H)
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_barra.add_theme_stylebox_override("background", _caja(CareerTheme.REDES_LINE, 99))
	_barra.add_theme_stylebox_override("fill", _caja(CareerTheme.REDES_INK, 99))
	col.add_child(_barra)


	var vp: Viewport = get_viewport() if is_inside_tree() else null
	var inset: float = UiKit.bottom_safe_inset(vp) if vp != null else 0.0
	var lienzo: Vector2 = UiKit.lienzo()
	var ancho: float = ANCHO_TUMBADO if tumbado else lienzo.x - 2.0 * MARGEN_DE_PIE
	anchor_left = 0.5
	anchor_right = 0.5
	anchor_top = 1.0
	anchor_bottom = 1.0
	grow_horizontal = Control.GROW_DIRECTION_BOTH
	grow_vertical = Control.GROW_DIRECTION_BEGIN
	custom_minimum_size = Vector2(ancho, 0.0)
	offset_left = - ancho * 0.5
	offset_right = ancho * 0.5
	var abajo: float =(-28.0 if tumbado else -200.0) - inset
	offset_bottom = abajo
	offset_top = abajo





func cuenta(segundos: float) -> void:
	if _barra == null:
		return
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_barra.value = 1.0
	_tw = create_tween()
	_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(_barra, "value", 0.0, maxf(segundos, 0.05))





func _process(_delta: float) -> void:
	if _dormida and not bool(get_meta(Entrada.A_AVANZA_META, false)):
		_dormida = false
		despierta.emit()





func atras() -> bool:
	elegida.emit("")
	return true


func fichas() -> Array[Button]:
	return _fichas






func _cabecera(carga: String, tumbado: bool) -> BoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Cabecera"
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var px_cab: int = CareerTheme.T_CAP_TUMBADO if tumbado else CareerTheme.T_HEAD
	var px: int = CareerTheme.T_CAP_TUMBADO if tumbado else CareerTheme.T_DIM
	var t: Label = _rotulo(I18n.t("¿CÓMO LO CELEBRAS?"), px_cab, CareerTheme.REDES_INK)
	t.name = "Titulo"
	_mide(t, px_cab, 0.45 *(ANCHO_TUMBADO if tumbado else UiKit.lienzo().x))
	h.add_child(t)

	var ancho_util: float =(ANCHO_TUMBADO if tumbado else UiKit.lienzo().x
		- 2.0 * MARGEN_DE_PIE) - 52.0
	if not carga.is_empty():




		var p: PanelContainer = _pildora(I18n.t(carga), CareerTheme.REDES_FUEGO_BG,
			CareerTheme.REDES_FUEGO_INK, MuroIcon.nuevo(MuroRedes.FUEGO, float(px)), px,
			0.5 * ancho_util)
		p.name = "Carga"
		h.add_child(p)
	var d: Label = _rotulo(I18n.t("SI NO TOCAS, A TU MANERA"), px, CareerTheme.REDES_DIM)
	d.name = "Defecto"
	d.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	_mide(d, px, ancho_util)
	if tumbado:
		d.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		h.add_child(d)
		return h
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "CabeceraDePie"
	v.add_theme_constant_override("separation", 8)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(h)
	d.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
	v.add_child(d)
	return v




func _ficha(key: String, away: bool, reconcilia: bool, roce: bool, club: Color,
		tumbado: bool) -> Button:
	var color: Color = _color_de(key, club)
	var b: Button = Button.new()
	b.name = "Ficha_" + key
	b.custom_minimum_size = Vector2(0.0, FICHA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button_accent(b, color)




	CareerTheme.marca_peligro(b, key == GestoElegido.PROVOCAR)
	UiKit.set_cue(b, "ui_confirm")
	b.pressed.connect(_on_ficha.bind(key))
	var tinta: Color = CareerTheme.on_color(color)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_theme_constant_override("separation", 16)
	fila.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	fila.offset_left = 18.0
	fila.offset_right = -14.0
	fila.offset_bottom = -6.0
	b.add_child(fila)
	fila.add_child(_casilla(key, away, tinta))
	var txt: VBoxContainer = VBoxContainer.new()
	txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	txt.alignment = BoxContainer.ALIGNMENT_CENTER
	txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	txt.add_theme_constant_override("separation", 8)
	fila.add_child(txt)
	var n: Label = _rotulo(I18n.t(GestoElegido.nombre(key, roce)),
		CareerTheme.T_LEE_TUMBADO if tumbado else CareerTheme.T_CARD, tinta)
	n.name = "Nombre"
	txt.add_child(n)
	var deltas: HBoxContainer = HBoxContainer.new()
	deltas.name = "Deltas"
	deltas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	deltas.add_theme_constant_override("separation", 8)
	txt.add_child(deltas)
	var fx: Dictionary = GestoElegido.fx(key, reconcilia)
	var px: int = CareerTheme.T_CAP_TUMBADO if tumbado else CareerTheme.T_DIM
	for rel in fx:
		var v: int = int(fx[rel])
		var bueno: bool = v > 0




		var sombra: Color = CareerTheme.INK_DARK
		sombra.a = 0.75
		deltas.add_child(_pildora(I18n.num_signo(v), sombra,
			CareerTheme._THEME_DARK["REDES_GOOD_INK" if bueno else "REDES_BAD_INK"],
			String(RedesTira.ICONO_REL.get(String(rel), String(rel))), px))
	if GestoElegido.multa(key, away):
		deltas.add_child(_pildora(I18n.t("MULTA"), CareerTheme.MONEY,
			CareerTheme.on_color(CareerTheme.MONEY), "moneda", px))
	return b





func _casilla(key: String, away: bool, tinta: Color) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Casilla"
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.custom_minimum_size = Vector2(CASILLA_LADO, CASILLA_LADO)
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var fondo: Color = tinta
	fondo.a = 0.16
	var sb: StyleBoxFlat = _caja(fondo, 16)
	sb.set_content_margin_all(4.0)
	pc.add_theme_stylebox_override("panel", sb)
	var ruta: String = Celebs.thumb_path(GestoElegido.casilla(key, away))
	if ResourceLoader.exists(ruta):
		var tr: TextureRect = TextureRect.new()
		tr.texture = load(ruta) as Texture2D
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pc.add_child(tr)
	else:
		var fx: Dictionary = GestoElegido.FX.get(key, {})
		var rel: String = String(fx.keys()[0]) if not fx.is_empty() else "equipo"
		var ic: MenuIcon = MenuIcon.new()
		ic.setup(String(RedesTira.ICONO_REL.get(rel, rel)), tinta)
		pc.add_child(ic)
	return pc





static func _color_de(key: String, club: Color) -> Color:
	match key:
		GestoElegido.PROVOCAR:
			return UiKit.BTN_RED["bg"]
		GestoElegido.PERDON, GestoElegido.TECNICO:
			return UiKit.BTN_BLUE["bg"]
		GestoElegido.CORRO:
			return CareerTheme.APP_MUNDO
	return club


func _on_ficha(key: String) -> void:
	elegida.emit(key)


static func _rotulo(texto: String, px: int, tinta: Color) -> Label:
	var l: Label = Label.new()
	l.text = CareerTheme.caps(texto)
	l.add_theme_font_size_override("font_size", px)
	l.add_theme_color_override("font_color", tinta)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER


	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	return l




static func _pildora(texto: String, fondo: Color, tinta: Color, icono: Variant,
		px: int, tope: float = 320.0) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var sb: StyleBoxFlat = _caja(fondo, 99)
	sb.content_margin_left = 12.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	pc.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_theme_constant_override("separation", 6)
	pc.add_child(h)
	var ic: Control = null
	if icono is Control:
		ic = icono as Control
	else:
		var mi: MenuIcon = MenuIcon.new()
		mi.setup(String(icono), tinta)
		ic = mi
	ic.name = "Icono"
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.custom_minimum_size = Vector2(px + 4, px + 4)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(ic)
	var l: Label = _rotulo(texto, px, tinta)
	_mide(l, px, tope)
	h.add_child(l)
	return pc




static func _mide(l: Label, px: int, tope: float) -> void:
	var w: float = float(l.text.length() * px)
	var fuente: Font = l.get_theme_font("font")
	if fuente != null:
		w = ceilf(fuente.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x)
	l.custom_minimum_size.x = minf(w, tope)


static func _caja(fondo: Color, radio: int) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.set_corner_radius_all(radio)
	return sb
