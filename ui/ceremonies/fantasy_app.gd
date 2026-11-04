extends Control




















const PX: Vector2i = Vector2i(450, 975)

const RADIO: int = 54
const ALTO_ESTADO: float = 50.0
const ALTO_APP: float = 58.0
const ALTO_JORNADA: float = 168.0
const ALTO_BANCA: float = 120.0
const ALTO_PESTANAS: float = 80.0

const HORA: String = "23:47"

var _marca: Color = CareerTheme.HISTORIA_D
var _brillo: Color = CareerTheme.HISTORIA
var _fondo: Color = CareerTheme.HISTORIA_D.darkened(0.82)

var _filas: Array[Control] = []
var _banca: Control = null
var _tuya: Control = null
var _brazalete: Control = null
var _total_l: Label = null
var _total: int = 0
var _aviso: Control = null
var _texturas: Dictionary = {}



func montar(d: Dictionary) -> void:
	size = Vector2(PX)
	_total = int(d.get("total", 0))
	var cristal: ColorRect = ColorRect.new()
	cristal.color = CareerTheme.BG_DEEP
	cristal.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(cristal)
	var app: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = _fondo
	sb.set_corner_radius_all(RADIO)
	sb.corner_detail = 12
	app.add_theme_stylebox_override("panel", sb)
	app.set_anchors_preset(Control.PRESET_FULL_RECT)

	app.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	add_child(app)
	var v: VBoxContainer = VBoxContainer.new()
	v.set_anchors_preset(Control.PRESET_FULL_RECT)
	v.add_theme_constant_override("separation", 0)
	app.add_child(v)
	v.add_child(_cabecera(int(d.get("jornada", 0))))
	v.add_child(_campo(d.get("xi", [])))
	v.add_child(_banquillo(d.get("bench", [])))
	v.add_child(_pestanas())


	var isla: Panel = Panel.new()
	isla.add_theme_stylebox_override("panel", _caja_color(CareerTheme.BG_DEEP, 19))
	isla.position = Vector2((PX.x - 126) * 0.5, 12.0)
	isla.size = Vector2(126, 38)
	add_child(isla)
	_aviso = _notificacion(int(_mis_pts(d.get("xi", []))))
	add_child(_aviso)


func _mis_pts(xi: Array) -> int:
	for e in xi:
		if bool((e as Dictionary).get("you", false)):
			return int(e.get("pts", 0))
	return 0


func _caja_color(col: Color, radio: int) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = col
	sb.set_corner_radius_all(radio)
	return sb


func _etiqueta(texto: String, tam: int, col: Color,
		alin: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER) -> Label:
	var l: Label = CareerUi.plain(tam, col)
	l.text = texto
	l.horizontal_alignment = alin
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	return l




func _dato(texto: String, tam: int, col: Color, ancho: float) -> Label:
	var l: Label = _etiqueta(texto, tam, col)
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.custom_minimum_size.x = ancho
	return l




func _cabecera(jornada: int) -> Control:
	var caja: Control = Control.new()
	caja.custom_minimum_size.y = ALTO_ESTADO + ALTO_APP + ALTO_JORNADA
	var grad: Gradient = Gradient.new()
	grad.set_color(0, _marca)
	grad.set_color(1, _marca.darkened(0.55))
	var gt: GradientTexture2D = GradientTexture2D.new()
	gt.gradient = grad
	gt.fill_from = Vector2(0.0, 0.0)
	gt.fill_to = Vector2(0.35, 1.0)
	gt.width = 64
	gt.height = 64
	var fondo: TextureRect = TextureRect.new()
	fondo.texture = gt
	fondo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	fondo.stretch_mode = TextureRect.STRETCH_SCALE
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.add_child(fondo)

	var hora: Label = _etiqueta(HORA, 16, CareerTheme.TEXT, HORIZONTAL_ALIGNMENT_LEFT)
	hora.position = Vector2(40, 20)
	hora.size = Vector2(110, 22)
	caja.add_child(hora)
	var iconos: Estado = Estado.new()
	iconos.position = Vector2(PX.x - 128, 20)
	iconos.size = Vector2(92, 22)
	caja.add_child(iconos)

	var barra: HBoxContainer = HBoxContainer.new()
	barra.position = Vector2(24, ALTO_ESTADO + 6)
	barra.size = Vector2(PX.x - 48, ALTO_APP - 12)
	barra.add_theme_constant_override("separation", 12)
	caja.add_child(barra)
	barra.add_child(_logo(40))
	var nombre: Label = _etiqueta(CareerTheme.caps(I18n.t("FANTASY")), 24, CareerTheme.TEXT,
		HORIZONTAL_ALIGNMENT_LEFT)
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nombre.clip_text = true
	barra.add_child(nombre)
	var perfil: Panel = Panel.new()
	perfil.add_theme_stylebox_override("panel", _caja_color(Color(1, 1, 1, 0.14), 20))
	perfil.custom_minimum_size = Vector2(40, 40)
	perfil.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var yo: MenuIcon = MenuIcon.new()
	yo.setup("perfil", CareerTheme.TEXT)
	yo.custom_minimum_size = Vector2(40, 40)
	yo.size = Vector2(40, 40)
	perfil.add_child(yo)
	barra.add_child(perfil)

	var j: VBoxContainer = VBoxContainer.new()
	j.position = Vector2(20, ALTO_ESTADO + ALTO_APP + 4)
	j.size = Vector2(PX.x - 40, ALTO_JORNADA - 12)
	j.add_theme_constant_override("separation", 6)
	caja.add_child(j)
	var equipo: Label = _dato(CareerTheme.caps(I18n.t("LOS DEL SOFÁ")), 20, CareerTheme.TEXT,
		PX.x - 40)
	j.add_child(equipo)
	if jornada > 0:
		var chip: CenterContainer = CenterContainer.new()
		var pc: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = _caja_color(Color(0, 0, 0, 0.28), 12)
		sb.content_margin_left = 14.0
		sb.content_margin_right = 14.0
		sb.content_margin_top = 4.0
		sb.content_margin_bottom = 4.0
		pc.add_theme_stylebox_override("panel", sb)
		pc.add_child(_etiqueta(CareerTheme.caps(I18n.t("JORNADA {0}").format(
			[I18n.num(jornada)])), 12, CareerTheme.TEXT_MID))
		chip.add_child(pc)
		j.add_child(chip)
	var cifras: HBoxContainer = HBoxContainer.new()
	cifras.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cifras.add_theme_constant_override("separation", 0)
	j.add_child(cifras)
	var media: int = _media(jornada)
	cifras.add_child(_cifra_lado(I18n.t("MEDIA"), I18n.num(media), CareerTheme.TEXT))
	var centro: VBoxContainer = VBoxContainer.new()
	centro.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	centro.alignment = BoxContainer.ALIGNMENT_CENTER
	centro.add_theme_constant_override("separation", 4)
	cifras.add_child(centro)
	_total_l = _etiqueta(I18n.num(0), 56, CareerTheme.TEXT)
	centro.add_child(_total_l)
	centro.add_child(_etiqueta(CareerTheme.caps(I18n.t("PUNTOS")), 12, CareerTheme.TEXT_MID))
	cifras.add_child(_cifra_lado(I18n.t("MÁXIMO"), I18n.num(_total), _brillo.lightened(0.35)))
	return caja




func _media(jornada: int) -> int:
	return 41 + absi(("media|%d" % jornada).hash()) % 17


func _cifra_lado(rotulo: String, valor: String, col: Color) -> Control:
	var v: VBoxContainer = VBoxContainer.new()
	v.custom_minimum_size.x = 112
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 6)
	v.add_child(_dato(valor, 24, col, 112))
	v.add_child(_dato(CareerTheme.caps(rotulo), 12, CareerTheme.TEXT_DIM, 112))
	return v




func _logo(lado: int) -> Control:
	var p: Panel = Panel.new()
	var sb: StyleBoxFlat = _caja_color(_brillo, int(lado * 0.26))
	sb.border_color = CareerTheme.TEXT
	sb.set_border_width_all(2)
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size = Vector2(lado, lado)
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var bola: MenuIcon = MenuIcon.new()
	bola.setup("balon_rol", CareerTheme.TEXT)
	bola.custom_minimum_size = Vector2(lado, lado)
	bola.size = Vector2(lado, lado)
	p.add_child(bola)
	return p




func _campo(xi: Array) -> Control:
	var caja: Control = Control.new()
	caja.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var cesped: Campito = Campito.new()
	cesped.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.add_child(cesped)
	var filas: VBoxContainer = VBoxContainer.new()
	filas.set_anchors_preset(Control.PRESET_FULL_RECT)
	filas.offset_left = 6.0
	filas.offset_right = -6.0
	filas.offset_top = 14.0
	filas.offset_bottom = -14.0
	filas.alignment = BoxContainer.ALIGNMENT_CENTER
	filas.add_theme_constant_override("separation", 10)
	caja.add_child(filas)
	var por_linea: Dictionary = {}
	for x in xi:
		var e: Dictionary = x
		var ln: String = String(e.get("line", Squad.line_of(String(e.get("pos", "")))))
		if not por_linea.has(ln):
			por_linea[ln] = []
		(por_linea[ln] as Array).append(e)
	for ln: String in ["DEL", "MED", "DEF", "POR"]:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.alignment = BoxContainer.ALIGNMENT_CENTER
		fila.add_theme_constant_override("separation", 6)
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
		filas.add_child(fila)
		for e in por_linea.get(ln, []):
			fila.add_child(_jugador(e, 64, 106))
		_filas.push_front(fila)
	return caja





func _jugador(e: Dictionary, camiseta: int, ancho: float) -> Control:
	var tu: bool = bool(e.get("you", false))
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 0)
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var arriba: Control = Control.new()
	arriba.custom_minimum_size = Vector2(ancho, camiseta)
	v.add_child(arriba)
	var tr: TextureRect = TextureRect.new()
	tr.texture = _camiseta(String(e.get("team", "")))
	tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.position = Vector2((ancho - camiseta) * 0.5, 0.0)
	tr.size = Vector2(camiseta, camiseta)
	arriba.add_child(tr)
	var medalla: OvrBadge = OvrBadge.new()
	medalla.setup(int(e.get("ovr", 0)), 8 if camiseta >= 64 else 6)
	medalla.position = Vector2((ancho - camiseta) * 0.5 - 8.0, -2.0)
	arriba.add_child(medalla)
	if tu:
		var b: Brazalete = Brazalete.new()
		b.size = Vector2(28, 28)
		b.position = Vector2((ancho + camiseta) * 0.5 - 18.0, -4.0)
		b.pivot_offset = b.size * 0.5
		b.color = _brillo
		arriba.add_child(b)
		_brazalete = b
	var nombre: String = CareerUi.surname(Career.player_name if tu
		else String(e.get("name", "")))
	var placa: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.BG_DEEP.lightened(0.06)
	sb.corner_radius_top_left = 4
	sb.corner_radius_top_right = 4
	sb.content_margin_top = 3.0
	sb.content_margin_bottom = 3.0
	placa.add_theme_stylebox_override("panel", sb)
	placa.add_child(_dato(CareerTheme.caps(nombre), 12, CareerTheme.TEXT, ancho - 8.0))
	v.add_child(placa)
	var puntos: PanelContainer = PanelContainer.new()
	var sp: StyleBoxFlat = StyleBoxFlat.new()
	sp.bg_color = _brillo if tu else CareerTheme.TEXT
	sp.corner_radius_bottom_left = 4
	sp.corner_radius_bottom_right = 4
	sp.content_margin_top = 3.0
	sp.content_margin_bottom = 3.0
	puntos.add_theme_stylebox_override("panel", sp)
	puntos.add_child(_dato(I18n.num(int(e.get("pts", 0))), 16,
		CareerTheme.TEXT if tu else CareerTheme.BG_DEEP, ancho - 8.0))
	v.add_child(puntos)
	if tu:
		_tuya = v
	return v


func _camiseta(club: String) -> Texture2D:
	if not _texturas.has(club):
		var t: Dictionary = Teams.by_id(club)
		_texturas[club] = JerseyArt.texture(GameState.kit_variant(t, 0), 0) \
				if not t.is_empty() else null
	return _texturas[club]




func _banquillo(bench: Array) -> Control:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 6.0
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size.y = ALTO_BANCA
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 4)
	p.add_child(v)
	var rotulo: Label = _etiqueta(CareerTheme.caps(I18n.t("BANQUILLO")), 12,
		CareerTheme.TEXT_DIM, HORIZONTAL_ALIGNMENT_LEFT)
	rotulo.custom_minimum_size.x = PX.x - 48
	var m: MarginContainer = MarginContainer.new()
	m.add_theme_constant_override("margin_left", 24)
	m.add_child(rotulo)
	v.add_child(m)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 6)
	v.add_child(fila)
	for e in bench:
		fila.add_child(_jugador(e, 48, 104))
	_banca = p
	return p


func _pestanas() -> Control:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = _fondo.darkened(0.3)
	sb.border_color = Color(1, 1, 1, 0.08)
	sb.border_width_top = 2
	sb.content_margin_top = 8.0
	sb.content_margin_bottom = 22.0
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size.y = ALTO_PESTANAS
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 0)
	p.add_child(h)

	for par: Array in [["stats", "PUNTOS", true], ["once", "EQUIPO", false],
			["mercado", "FICHAJES", false], ["torneos", "LIGAS", false]]:
		var col: Color = _brillo.lightened(0.3) if bool(par[2]) else CareerTheme.TEXT_DIM
		var v: VBoxContainer = VBoxContainer.new()
		v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		v.add_theme_constant_override("separation", 2)
		h.add_child(v)
		var c: CenterContainer = CenterContainer.new()
		var ic: MenuIcon = MenuIcon.new()
		ic.setup(String(par[0]), col)
		ic.custom_minimum_size = Vector2(32, 32)
		c.add_child(ic)
		v.add_child(c)
		v.add_child(_dato(CareerTheme.caps(I18n.t(String(par[1]))), 12, col, 104))

	var raya: Panel = Panel.new()
	raya.add_theme_stylebox_override("panel", _caja_color(CareerTheme.TEXT, 3))
	raya.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	raya.size = Vector2(140, 6)
	raya.position = Vector2((PX.x - 140) * 0.5, ALTO_PESTANAS - 12.0)
	p.add_child(raya)
	return p




func _notificacion(pts: int) -> Control:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = _caja_color(CareerTheme.SURFACE_HI.lightened(0.08), 26)
	sb.content_margin_left = 16.0
	sb.content_margin_right = 16.0
	sb.content_margin_top = 14.0
	sb.content_margin_bottom = 14.0
	sb.shadow_color = Color(0, 0, 0, 0.45)
	sb.shadow_size = 10
	p.add_theme_stylebox_override("panel", sb)
	p.position = Vector2(14.0, -160.0)
	p.size = Vector2(PX.x - 28, 0)
	p.custom_minimum_size.x = PX.x - 28
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 14)
	p.add_child(h)
	h.add_child(_logo(44))
	var v: VBoxContainer = VBoxContainer.new()
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.add_theme_constant_override("separation", 6)
	h.add_child(v)
	var arriba: HBoxContainer = HBoxContainer.new()
	v.add_child(arriba)
	var app: Label = _etiqueta(CareerTheme.caps(I18n.t("FANTASY")), 12, CareerTheme.TEXT_MID,
		HORIZONTAL_ALIGNMENT_LEFT)
	app.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	arriba.add_child(app)
	arriba.add_child(_etiqueta(CareerTheme.caps(I18n.t("AHORA")), 12, CareerTheme.TEXT_DIM))
	var cuerpo: Label = _etiqueta(CareerTheme.caps(I18n.t("TU CAPITÁN SUMA {0} PTS").format(
		[I18n.num(pts)])), 16, CareerTheme.TEXT, HORIZONTAL_ALIGNMENT_LEFT)
	cuerpo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	cuerpo.custom_minimum_size.x = PX.x - 28 - 32 - 44 - 14
	v.add_child(cuerpo)
	return p





func tick(tt: float) -> void:
	for i in _filas.size():
		var k: float = clampf((tt - 0.3 - i * 0.2) / 0.22, 0.0, 1.0)
		_filas[i].modulate.a = k
	if _banca != null:
		_banca.modulate.a = clampf((tt - 0.25) / 0.25, 0.0, 1.0)
	if _tuya != null:
		var k: float = clampf((tt - 1.15) / 0.45, 0.0, 1.0)
		_tuya.pivot_offset = _tuya.size * 0.5
		_tuya.scale = Vector2.ONE *(1.0 + 0.14 * sin(k * PI))
	if _brazalete != null:
		var kb: float = clampf((tt - 1.3) / 0.35, 0.0, 1.0)
		_brazalete.scale = Vector2.ONE *(1.0 + 0.5 * sin(kb * PI))
	if _total_l != null:
		var c: float = clampf((tt - 1.3) / 1.4, 0.0, 1.0)
		_total_l.text = I18n.num(int(round(float(_total) *(1.0 - pow(1.0 - c, 3.0)))))
	if _aviso != null:
		var baja: float = clampf((tt - 2.1) / 0.3, 0.0, 1.0)
		var sube: float = clampf((tt - 3.6) / 0.3, 0.0, 1.0)
		var k: float = 1.0 - pow(1.0 - baja, 3.0) - sube * sube
		_aviso.position.y = lerpf(- _aviso.size.y - 30.0, 14.0, clampf(k, 0.0, 1.0))



class Estado extends Control:
	func _draw() -> void:
		var tinta: Color = CareerTheme.TEXT
		for i in 4:
			var h: float = 6.0 + i * 4.0
			draw_rect(Rect2(i * 7.0, 18.0 - h, 5.0, h), tinta)
		var b: Rect2 = Rect2(40.0, 2.0, 38.0, 16.0)
		draw_rect(b, tinta, false, 2.0)
		draw_rect(Rect2(b.position + Vector2(3, 3), Vector2((b.size.x - 6.0) * 0.8,
			b.size.y - 6.0)), tinta)
		draw_rect(Rect2(b.end.x + 1.0, 7.0, 3.0, 6.0), tinta)



class Brazalete extends Control:
	var color: Color = CareerTheme.HISTORIA

	func _draw() -> void:
		var c: Vector2 = size * 0.5
		var r: float = minf(size.x, size.y) * 0.5
		draw_circle(c, r, CareerTheme.TEXT)
		draw_circle(c, r - 3.0, color)
		draw_arc(c, r * 0.48, 0.3 * PI, 1.7 * PI, 24, CareerTheme.TEXT, r * 0.3)




class Campito extends Control:
	func _draw() -> void:
		var franjas: int = 9
		var alto: float = size.y / float(franjas)
		for i in franjas:
			draw_rect(Rect2(0.0, i * alto, size.x, alto + 1.0),
				CareerTheme.PITCH_GRASS_A if i % 2 == 0 else CareerTheme.PITCH_GRASS_B.darkened(0.08))
		var cal: Color = Color(CareerTheme.PITCH_CHALK, 0.5)
		var m: float = 16.0
		var campo: Rect2 = Rect2(m, -4.0, size.x - m * 2.0, size.y - m + 4.0)
		draw_rect(campo, cal, false, 3.0)

		draw_line(Vector2(m, 30.0), Vector2(size.x - m, 30.0), cal, 3.0)
		draw_arc(Vector2(size.x * 0.5, 30.0), 64.0, 0.0, PI, 32, cal, 3.0)

		var fondo: float = campo.end.y
		var area: Rect2 = Rect2(size.x * 0.2, fondo - 112.0, size.x * 0.6, 112.0)
		draw_rect(area, cal, false, 3.0)
		draw_rect(Rect2(size.x * 0.36, fondo - 42.0, size.x * 0.28, 42.0), cal, false, 3.0)
		draw_arc(Vector2(size.x * 0.5, area.position.y), 46.0, PI, TAU, 24, cal, 3.0)
