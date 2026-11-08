class_name Celular
extends RefCounted






















const RADIO_T: int = 56
const RADIO_PANT_T: int = 30
const RADIO_V: int = 72
const RADIO_PANT_V: int = 52


const BISEL_IZQ_T: int = 36
const BISEL_DER_T: int = 24
const BISEL_V_T: int = 14
const BISEL: int = 22
const BARRA_H: float = 40.0
const RIEL_W: float = 136.0
const DOCK_H: float = 176.0



const APP_LADO: float = 88.0
const APP_RADIO: int = 24
const LABIO: float = 5.0
const ANILLO: int = 8





const APP_SEP: int = 16
const APP_ROT_SEP: int = 12
const MARCA_LADO: float = 34.0


const APP_LADO_T: float = 76.0
const APP_ROT_SEP_T: int = 8
const MARCA_LADO_T: float = 30.0





const PANT_ARRIBA: int = 16
const PANT_LADO: int = 28
const PANT_ABAJO_T: int = 20
const CAB_H: float = 64.0
const APP_AIRE_T: int = 16
const APP_AIRE_V: int = 22



const MARCO_W_T: float = 252.0
const MARCO_H_T: float = 184.0




const ALTO_MIN_V: float = 1000.0




const AVISO_W: float = 1000.0
const AVISO_AIRE: float = 16.0
const AVISO_RADIO: int = 16

const INICIO: Vector2 = Vector2(240.0, 6.0)
const INICIO_PIE: float = 7.0
const ISLA: Vector2 = Vector2(120.0, 30.0)


const RIEL_ARRIBA: int = 24
const RIEL_ABAJO: int = 20


const CAB_BALDOSA: float = 52.0
const CAB_LABIO: float = 4.0


const APP_ROTULO: Dictionary = {"club": "CLUB", "liga": "LIGA", "mundo": "MUNDO", "redes": "REDES",
	"mensajes": "MENSAJES", "vida": "VIDA"}


const APP_ICONO: Dictionary = {"liga": "torneos", "mundo": "mundo", "mensajes": "buzon"}









static func tumbado(padre: Container, ancho: float, apps: Array, activa: String, elige: Callable,
		marcas: Dictionary) -> VBoxContainer:
	var tel: PanelContainer = _aparato(false, activa)
	padre.add_child(tel)
	var pant: PanelContainer = tel.get_child(0)



	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 0)
	h.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.size_flags_vertical = Control.SIZE_EXPAND_FILL
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pant.add_child(h)
	h.add_child(_riel(apps, activa, elige, marcas))
	var v: VBoxContainer = _caja_v(0)
	h.add_child(v)
	v.add_child(_barra_estado(false, activa))
	var m: MarginContainer = _margen(PANT_LADO, PANT_LADO, PANT_ARRIBA, PANT_ABAJO_T)
	m.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	m.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.add_child(m)
	var app: VBoxContainer = _caja_v(APP_AIRE_T)
	m.add_child(app)
	_capa(pant, app, ancho - float(BISEL_IZQ_T + BISEL_DER_T), false, activa)
	return app






static func vertical(padre: Container, ancho: float, apps: Array, activa: String, elige: Callable,
		marcas: Dictionary) -> VBoxContainer:
	var tel: PanelContainer = _aparato(true, activa)
	tel.custom_minimum_size.y = ALTO_MIN_V
	tel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	padre.add_child(tel)
	var pant: PanelContainer = tel.get_child(0)
	var v: VBoxContainer = _caja_v(0)
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pant.add_child(v)
	v.add_child(_barra_estado(true, activa))
	var sc: ScrollContainer = DragScroll.new()
	sc.name = "Pantalla"
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.add_child(sc)
	var m: MarginContainer = _margen(PANT_LADO, PANT_LADO, PANT_ARRIBA, PANT_ARRIBA)
	m.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	sc.add_child(m)
	var app: VBoxContainer = _caja_v(APP_AIRE_V)
	m.add_child(app)
	v.add_child(_dock(apps, activa, elige, marcas))
	_capa(pant, app, ancho - 2.0 * float(BISEL), true, activa)
	return app



static func ancho_app(ancho: float) -> float:
	return ancho - MARCO_W_T



static func ancho_app_vertical(ancho: float) -> float:
	return ancho - 2.0 * float(BISEL + PANT_LADO)




static func _aparato(de_pie: bool, activa: String) -> PanelContainer:
	var tel: PanelContainer = PanelContainer.new()
	tel.name = "Celular"
	tel.set_meta("fl_celular", "vertical" if de_pie else "tumbado")
	tel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tel.size_flags_vertical = Control.SIZE_EXPAND_FILL
	tel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.CELULAR_BISEL
	sb.border_color = CareerTheme.CELULAR_CANTO
	sb.set_border_width_all(3)
	sb.set_corner_radius_all(RADIO_V if de_pie else RADIO_T)
	sb.content_margin_left = BISEL if de_pie else BISEL_IZQ_T
	sb.content_margin_right = BISEL if de_pie else BISEL_DER_T
	sb.content_margin_top = BISEL if de_pie else BISEL_V_T
	sb.content_margin_bottom = BISEL if de_pie else BISEL_V_T
	tel.add_theme_stylebox_override("panel", sb)
	if not de_pie:

		tel.draw.connect(func() -> void:
			var c: Vector2 = Vector2(float(BISEL_IZQ_T) * 0.5, tel.size.y * 0.5)
			tel.draw_circle(c, 8.0, CareerTheme.CELULAR_CANTO)
			tel.draw_circle(c, 6.0, CareerTheme.CELULAR_RIEL))
	var pant: PanelContainer = PanelContainer.new()
	pant.name = "Pantalla"
	pant.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var ps: StyleBoxFlat = StyleBoxFlat.new()
	ps.bg_color = CareerTheme.REDES_BG if piel_redes(activa) else CareerTheme.BG_DEEP
	ps.set_corner_radius_all(RADIO_PANT_V if de_pie else RADIO_PANT_T)
	pant.add_theme_stylebox_override("panel", ps)
	tel.add_child(pant)
	return tel






static func piel_redes(activa: String) -> bool:
	return activa == "redes" or activa == "mensajes"





static func _capa(pant: PanelContainer, app: VBoxContainer, pant_w: float, de_pie: bool,
		activa: String) -> void:
	var capa: Control = Control.new()
	capa.name = "Capa"
	capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var raya: Color = Color(CareerTheme.CELULAR_TINTA, 0.6) if de_pie \
			else (Color(CareerTheme.REDES_DIM, 0.5) if piel_redes(activa) else CareerTheme.TEXT_DIM)
	capa.draw.connect(func() -> void:
		var r: Rect2 = Rect2(Vector2((capa.size.x - INICIO.x) * 0.5,
			capa.size.y - INICIO_PIE - INICIO.y), INICIO)
		capa.draw_rect(r, raya))
	capa.resized.connect(capa.queue_redraw)
	pant.add_child(capa)
	app.name = "App"
	app.set_meta("celular_capa", capa)
	app.set_meta("celular_pant_w", pant_w)
	app.set_meta("celular_de_pie", de_pie)








static func _barra_estado(de_pie: bool, activa: String) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "BarraEstado"
	pc.custom_minimum_size.y = BARRA_H
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxEmpty = StyleBoxEmpty.new()
	sb.content_margin_left = 28 if not de_pie else 44
	sb.content_margin_right = 28 if not de_pie else 44
	pc.add_theme_stylebox_override("panel", sb)
	var redes: bool = piel_redes(activa)
	var tinta: Color = CareerTheme.REDES_INK if redes else CareerTheme.TEXT
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	if de_pie:
		_hoy(h, tinta, CareerTheme.REDES_DIM if redes else CareerTheme.TEXT_DIM)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	h.add_child(_cobertura(tinta))
	h.add_child(_bateria(tinta))
	if de_pie:
		var centro: CenterContainer = CenterContainer.new()
		centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pc.add_child(centro)
		var isla: PanelContainer = PanelContainer.new()
		isla.name = "Isla"
		isla.custom_minimum_size = ISLA
		isla.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var si: StyleBoxFlat = StyleBoxFlat.new()
		si.bg_color = CareerTheme.CELULAR_BISEL
		si.set_corner_radius_all(int(ISLA.y * 0.5))
		isla.add_theme_stylebox_override("panel", si)
		centro.add_child(isla)
	return pc



static func _hoy(caja: Container, tinta: Color, tenue: Color) -> void:
	var j: String = jornada_hoy()
	if not j.is_empty():
		var lj: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, tinta)
		lj.name = "Jornada"
		lj.text = j
		lj.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		lj.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		lj.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(lj)
	var d: String = dia_hoy()
	if not d.is_empty():
		var ld: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, tenue)
		ld.name = "Dia"
		ld.text = d
		ld.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		ld.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		ld.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(ld)




static func jornada_hoy() -> String:
	if GameState.season_day >= GameState.calendar.size():
		return ""
	var slot: Dictionary = GameState.calendar[GameState.season_day]
	if String(slot.get("comp", "")) == "league" and slot.has("round_idx") \
			and Competitions.torneo_key(slot).is_empty():
		return I18n.tf("J{0}", [int(slot["round_idx"]) + 1])
	return ""




static func dia_hoy() -> String:
	return dia_de(GameState.season_day)






static func dia_de(p: int) -> String:
	var dias: Array = GameState.dias_fixtures()
	if p < 0 or p >= dias.size() or not CalendarioMundo.dia_conocido(int(dias[p])):
		return ""

	return CareerTheme.caps(I18n.t(CalendarioMundo.DIAS_SEMANA[posmod(int(dias[p]), 7)], "dia"))



static func _cobertura(tinta: Color) -> Control:
	var c: Control = Control.new()
	c.name = "Cobertura"
	c.custom_minimum_size = Vector2(22.0, 16.0)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.draw.connect(func() -> void:
		for i in 4:
			var alto: float = 4.0 * float(i + 1)
			c.draw_rect(Rect2(float(i) * 6.0, 16.0 - alto, 4.0, alto), tinta))
	return c



static func _bateria(tinta: Color) -> Control:
	var c: Control = Control.new()
	c.name = "Bateria"
	c.custom_minimum_size = Vector2(34.0, 16.0)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.draw.connect(func() -> void:
		c.draw_rect(Rect2(1.0, 1.0, 29.0, 14.0), tinta, false, 2.0)
		c.draw_rect(Rect2(31.0, 5.0, 3.0, 6.0), tinta)
		c.draw_rect(Rect2(4.0, 4.0, 23.0 * 0.7, 8.0), tinta))
	return c








static func _riel(apps: Array, activa: String, elige: Callable, marcas: Dictionary) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Riel"
	pc.custom_minimum_size.x = RIEL_W
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.CELULAR_RIEL
	sb.corner_radius_top_left = RADIO_PANT_T
	sb.corner_radius_bottom_left = RADIO_PANT_T
	sb.content_margin_top = RIEL_ARRIBA
	sb.content_margin_bottom = RIEL_ABAJO
	pc.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = _caja_v(0)
	pc.add_child(col)
	var cabeza: VBoxContainer = _caja_v(6)
	cabeza.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	col.add_child(cabeza)
	_hoy(cabeza, CareerTheme.CELULAR_TINTA, CareerTheme.CELULAR_ROTULO)
	var v: VBoxContainer = _caja_v(APP_SEP)
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_child(v)
	for sc in apps:
		v.add_child(_app(String(sc), String(sc) == activa, elige, marcas.has(sc), false,
			_cifra(marcas, String(sc))))
	var g: Glifos = Glifos.chip("fl_modo", "", 48.0)
	g.name = "GlifoRiel"
	g.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	CareerUi.solo_con_mando(g, true)
	v.add_child(g)
	return pc




static func _dock(apps: Array, activa: String, elige: Callable, marcas: Dictionary) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Dock"
	pc.custom_minimum_size.y = DOCK_H
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.CELULAR_RIEL
	sb.corner_radius_bottom_left = RADIO_PANT_V
	sb.corner_radius_bottom_right = RADIO_PANT_V
	sb.content_margin_left = 40
	sb.content_margin_right = 40
	sb.content_margin_top = 18
	pc.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 0)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	for i in apps.size():
		if i > 0:
			var hueco: Control = Control.new()
			hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
			h.add_child(hueco)
		var sc: String = String(apps[i])
		var a: Control = _app(sc, sc == activa, elige, marcas.has(sc), true, _cifra(marcas, sc))
		a.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		h.add_child(a)
	return pc












static func _app(sc: String, activa: bool, elige: Callable, marca: bool,
		enfocable: bool, cifra: int = 0) -> PanelContainer:

	var de_pie: bool = enfocable
	var lado: float = APP_LADO if de_pie else APP_LADO_T
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "App_%s" % sc
	pc.set_meta("celular_app", sc)
	pc.set_meta("celular_activa", activa)
	pc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	pc.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var v: VBoxContainer = _caja_v(APP_ROT_SEP if de_pie else APP_ROT_SEP_T)
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pc.add_child(v)
	var anillo: PanelContainer = PanelContainer.new()
	anillo.name = "Anillo"
	anillo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	anillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sa: StyleBoxFlat = StyleBoxFlat.new()
	sa.bg_color = UiKit.CLEAR
	sa.border_color = CareerTheme.CELULAR_TINTA if activa else UiKit.CLEAR
	sa.set_border_width_all(ANILLO / 2)
	if de_pie:
		sa.set_corner_radius_all(APP_RADIO + ANILLO)
		sa.set_content_margin_all(ANILLO)
	else:
		sa.set_corner_radius_all(roundi(lado * float(APP_RADIO) / APP_LADO) + ANILLO)
		sa.set_content_margin_all(0.0)
		sa.set_expand_margin_all(float(ANILLO))
	anillo.add_theme_stylebox_override("panel", sa)
	v.add_child(anillo)
	var b: Control = baldosa(sc, lado, 0.0 if activa else LABIO)
	anillo.add_child(b)
	if marca:
		var ml: float = MARCA_LADO if de_pie else MARCA_LADO_T
		var chapa: PanelContainer = _chapa(ml, str(cifra) if cifra > 0 else "!")
		chapa.position = Vector2(lado - ml + 10.0, -10.0)
		b.add_child(chapa)
	var rot: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO,
		CareerTheme.CELULAR_TINTA if activa else CareerTheme.CELULAR_ROTULO)
	rot.name = "Rotulo"
	rot.text = CareerTheme.caps(I18n.t(String(APP_ROTULO.get(sc, "MUNDO"))))
	rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	rot.clip_text = true
	rot.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS


	rot.custom_minimum_size.x = APP_LADO + 40.0 if de_pie else RIEL_W - 4.0
	rot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(rot)
	var toque: Button = CareerUi.hit_overlay(APP_LADO, func() -> void: elige.call(sc))
	toque.name = "Toque"
	if enfocable:
		toque.focus_mode = Control.FOCUS_ALL
	else:
		toque.set_meta(Entrada.SIN_FOCO_META, true)
	toque.set_meta("celular_toque", sc)
	pc.add_child(toque)
	return pc




static func _cifra(marcas: Dictionary, sc: String) -> int:
	var m: Variant = marcas.get(sc, 0)
	return int(m) if m is int else 0





static func _chapa(ml: float = MARCA_LADO, texto: String = "!") -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Chapa"
	pc.size = Vector2(ml, ml)
	pc.custom_minimum_size = Vector2(ml, ml)
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.DANGER
	sb.border_color = CareerTheme.CELULAR_RIEL
	sb.set_border_width_all(3)
	sb.set_corner_radius_all(int(ml * 0.5))
	pc.add_theme_stylebox_override("panel", sb)
	var l: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.CELULAR_TINTA)
	l.name = "Cifra"
	l.text = texto
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(l)
	return pc





static func color_app(sc: String) -> Color:
	match sc:
		"liga":
			return CareerTheme.APP_LIGA
		"mundo":
			return CareerTheme.APP_MUNDO
		"redes":
			return CareerTheme.REDES_MARCA
		"mensajes":
			return CareerTheme.APP_MENSAJES
		"vida":
			return Color(0.18, 0.72, 0.45)
	return CareerTheme.accent()



static func sombra_app(sc: String) -> Color:
	match sc:
		"liga":
			return CareerTheme.APP_LIGA_SOMBRA
		"mundo":
			return CareerTheme.APP_MUNDO_SOMBRA
		"redes":
			return CareerTheme.REDES_MARCA_SOMBRA
		"mensajes":
			return CareerTheme.APP_MENSAJES_SOMBRA
		"vida":
			return Color(0.10, 0.45, 0.28)
	return CareerTheme.accent().darkened(0.45)






static func baldosa(sc: String, lado: float, labio: float) -> Control:
	var b: Control = Control.new()
	b.name = "Baldosa"
	b.custom_minimum_size = Vector2(lado, lado)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fondo: PanelContainer = PanelContainer.new()
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sf: StyleBoxFlat = StyleBoxFlat.new()
	sf.bg_color = color_app(sc)
	sf.set_corner_radius_all(roundi(lado * float(APP_RADIO) / APP_LADO))

	sf.set_content_margin_all(0.0)
	if labio > 0.0:
		sf.border_color = sombra_app(sc)
		sf.border_width_bottom = roundi(labio)
		sf.expand_margin_bottom = labio
	fondo.add_theme_stylebox_override("panel", sf)
	b.add_child(fondo)
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fondo.add_child(centro)
	centro.add_child(_dibujo(sc, lado))
	return b




static func _dibujo(sc: String, lado: float) -> Control:
	if sc == "club":
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(lado, lado) * 0.68
		esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		esc.set_team(GameState.you_team())
		return esc
	if sc == "redes":
		return _burbuja(lado * 0.6)
	if sc == "vida":
		var ic_v: MenuIcon = MenuIcon.new()
		ic_v.setup("estrella", CareerTheme.CELULAR_TINTA)
		ic_v.custom_minimum_size = Vector2(lado, lado) * 0.55
		ic_v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return ic_v
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(String(APP_ICONO.get(sc, "mundo")), CareerTheme.CELULAR_TINTA)
	ic.custom_minimum_size = Vector2(lado, lado) * 0.55
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic






static func _burbuja(lado: float) -> Control:
	var c: Control = Control.new()
	c.name = "Burbuja"
	c.custom_minimum_size = Vector2(lado, lado)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.draw.connect(func() -> void:
		var k: float = minf(c.size.x, c.size.y) / 24.0
		var o: Vector2 =(c.size - Vector2(24.0, 24.0) * k) * 0.5
		var globo: PackedVector2Array = PackedVector2Array()
		for q in [Vector2(3.5, 4.5), Vector2(20.5, 4.5), Vector2(20.5, 16.5), Vector2(9.5, 16.5),
				Vector2(3.5, 21.0)]:
			globo.append(o +(q as Vector2) * k)
		c.draw_colored_polygon(globo, CareerTheme.CELULAR_TINTA)
		c.draw_circle(o + Vector2(10.3, 9.75) * k, 2.05 * k, CareerTheme.REDES_MARCA)
		c.draw_circle(o + Vector2(13.7, 9.75) * k, 2.05 * k, CareerTheme.REDES_MARCA)
		var punta: PackedVector2Array = PackedVector2Array()
		for q in [Vector2(8.3, 10.3), Vector2(15.7, 10.3), Vector2(12.0, 14.2)]:
			punta.append(o +(q as Vector2) * k)
		c.draw_colored_polygon(punta, CareerTheme.REDES_MARCA))
	return c







static func cabecera(app: VBoxContainer, sc: String, titulo: String) -> HBoxContainer:
	if sc == "redes":
		return RedesTira.cabecera(app, bool(app.get_meta("celular_de_pie", false)))

	if sc == "mensajes":
		return MensajesTira.cabecera(app, bool(app.get_meta("celular_de_pie", false)))
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "CabeceraApp"
	h.custom_minimum_size.y = CAB_H
	h.add_theme_constant_override("separation", 18)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	app.add_child(h)
	h.add_child(baldosa(sc, CAB_BALDOSA, CAB_LABIO))
	var l: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	l.name = "TituloApp"


	l.text = CareerTheme.caps(titulo)
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(l)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	return h





static func zasca_pendiente() -> bool:
	return not RedesTira.critica_viva().is_empty()



static func aviso_zasca() -> String:
	return I18n.tf("te ha mencionado · nota {0}", [I18n.num(Career.zasca_nota, 1)])






static func mencion_pendiente() -> bool:
	return not RedesTira.mencion_viva().is_empty()



static func pique_pendiente() -> bool:
	return String(RedesTira.mencion_viva().get("hecho", "")) == "pique"




static func aviso_pique() -> String:
	return I18n.tf("{0} te ha etiquetado", [RedesTira.nombre_pique(RedesTira.mencion_viva())])




static func encuesta_pendiente() -> bool:
	return not RedesTira.encuesta_viva().is_empty()




static func redes_pendiente() -> bool:
	return mencion_pendiente() or encuesta_pendiente()



static func aviso_encuesta() -> String:
	var gana: String = String(Celebs.by_id(String(Career.encuesta_pena.get("ganadora", ""))
		).get("name", ""))
	return I18n.tf("encuesta del mes · gana {0}", [I18n.t(gana)])





static func aviso_quien() -> String:
	if not mencion_pendiente() and encuesta_pendiente():
		return I18n.t(String(RedesTira.NOMBRE_VOZ[MuroRedes.HINCHA]))
	return I18n.t("RIVAL") if pique_pendiente() else I18n.t("PRENSA")


static func aviso_texto() -> String:
	if not mencion_pendiente() and encuesta_pendiente():
		return aviso_encuesta()
	return aviso_pique() if pique_pendiente() else aviso_zasca()




static func aviso_tinta() -> Color:
	if not mencion_pendiente() and encuesta_pendiente():
		return CareerTheme.REDES_MARCA
	return CareerTheme.DANGER







static func aviso(app: VBoxContainer, quien: String, texto: String, al_tocar: Callable) -> PanelContainer:
	var capa: Control = app.get_meta("celular_capa") as Control
	var de_pie: bool = bool(app.get_meta("celular_de_pie", false))
	var pant_w: float = float(app.get_meta("celular_pant_w", AVISO_W))
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Aviso"
	pc.set_meta("celular_aviso", true)
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tinta: Color = aviso_tinta()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI
	sb.border_color = tinta
	sb.border_width_left = 8
	sb.set_corner_radius_all(AVISO_RADIO)
	sb.shadow_color = CareerTheme.SHADOW
	sb.shadow_size = 1
	sb.shadow_offset = Vector2(0.0, 8.0)
	sb.content_margin_left = 8 + 22
	sb.content_margin_right = 22
	pc.add_theme_stylebox_override("panel", sb)
	var alto: float = CareerTheme.TOQUE_TUMBADO
	var w: float = pant_w - 2.0 * float(PANT_LADO) if de_pie else minf(AVISO_W, pant_w * 0.5)
	pc.anchor_left = 1.0
	pc.anchor_right = 1.0
	pc.offset_right = - float(PANT_LADO)
	pc.offset_left = - float(PANT_LADO) - w
	var arriba: float = _aviso_arriba(de_pie, alto)
	pc.offset_top = arriba
	pc.offset_bottom = arriba + alto
	pc.custom_minimum_size = Vector2(w, alto)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 18)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	var ic: MenuIcon = MenuIcon.new()
	ic.setup("smartphone", tinta)
	ic.custom_minimum_size = Vector2(32.0, 32.0)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(ic)
	var lq: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT)
	lq.text = CareerTheme.caps(quien)
	lq.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lq.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(lq)



	if pique_pendiente():
		var med: Control = RedesTira.medalla_pique(RedesTira.mencion_viva(), de_pie)
		if med != null:
			h.add_child(med)
	var lt: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID)
	lt.name = "AvisoTexto"
	lt.text = texto
	lt.clip_text = true
	lt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	lt.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lt.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(lt)
	var la: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM)
	la.text = CareerTheme.caps(I18n.t("AHORA"))
	la.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	la.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(la)
	var toque: Button = CareerUi.hit_overlay(alto, al_tocar)
	toque.name = "Toque"
	if de_pie:
		toque.focus_mode = Control.FOCUS_ALL
	else:
		toque.set_meta(Entrada.SIN_FOCO_META, true)
	pc.add_child(toque)
	capa.add_child(pc)
	return pc




static func _aviso_arriba(de_pie: bool, alto: float) -> float:
	var app_y: float = BARRA_H + float(PANT_ARRIBA) + CAB_H + float(APP_AIRE_V if de_pie else APP_AIRE_T)
	return app_y - AVISO_AIRE - alto




static func _caja_v(sep: int) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", sep)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return v


static func _margen(izq: int, der: int, arriba: int, abajo: int) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_theme_constant_override("margin_left", izq)
	m.add_theme_constant_override("margin_right", der)
	m.add_theme_constant_override("margin_top", arriba)
	m.add_theme_constant_override("margin_bottom", abajo)
	return m


static func monta_minha_vida(padre: Container, ancho: float) -> Control:
	var scroll: ScrollContainer = ScrollContainer.new()
	scroll.custom_minimum_size = Vector2(ancho, 450.0)
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL

	var box: VBoxContainer = VBoxContainer.new()
	box.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	box.add_theme_constant_override("separation", 16)
	scroll.add_child(box)

	# 1. Painel de Indicadores de Estilo de Vida
	var pnl_stats: PanelContainer = PanelContainer.new()
	var sf_stats: StyleBoxFlat = StyleBoxFlat.new()
	sf_stats.bg_color = Color(0.12, 0.14, 0.18, 0.95)
	sf_stats.set_corner_radius_all(12)
	sf_stats.set_content_margin_all(14.0)
	pnl_stats.add_theme_stylebox_override("panel", sf_stats)
	box.add_child(pnl_stats)

	var vb_stats: VBoxContainer = VBoxContainer.new()
	vb_stats.add_theme_constant_override("separation", 10)
	pnl_stats.add_child(vb_stats)

	var tit_stats: Label = Label.new()
	tit_stats.text = "INDICADORES LIFE & LEGACY"
	tit_stats.modulate = Color(0.95, 0.8, 0.3)
	vb_stats.add_child(tit_stats)

	var stat_names: Dictionary = {
		"popularity": "Popularidade",
		"reputation": "Reputação",
		"discipline": "Disciplina",
		"emotional_stability": "Estabilidade Emocional",
		"personal_relationships": "Relações Pessoais",
		"social_influence": "Influência Social"
	}

	for k in stat_names:
		var hb: HBoxContainer = HBoxContainer.new()
		var lbl: Label = Label.new()
		lbl.text = stat_names[k]
		lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		hb.add_child(lbl)

		var cur_val: float = LifeLegacy.get_stat(k) if LifeLegacy != null else 50.0
		var val_lbl: Label = Label.new()
		val_lbl.text = "%.1f" % cur_val
		val_lbl.custom_minimum_size = Vector2(45.0, 0.0)
		hb.add_child(val_lbl)

		var bar: ProgressBar = ProgressBar.new()
		bar.min_value = 0.0
		bar.max_value = 100.0
		bar.value = cur_val
		bar.custom_minimum_size = Vector2(100.0, 16.0)
		bar.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		hb.add_child(bar)

		vb_stats.add_child(hb)

	# 2. Painel Familiar
	var pnl_fam: PanelContainer = PanelContainer.new()
	var sf_fam: StyleBoxFlat = StyleBoxFlat.new()
	sf_fam.bg_color = Color(0.12, 0.14, 0.18, 0.95)
	sf_fam.set_corner_radius_all(12)
	sf_fam.set_content_margin_all(14.0)
	pnl_fam.add_theme_stylebox_override("panel", sf_fam)
	box.add_child(pnl_fam)

	var vb_fam: VBoxContainer = VBoxContainer.new()
	vb_fam.add_theme_constant_override("separation", 8)
	pnl_fam.add_child(vb_fam)

	var tit_fam: Label = Label.new()
	tit_fam.text = "FAMÍLIA E RELACIONAMENTOS"
	tit_fam.modulate = Color(0.4, 0.85, 0.95)
	vb_fam.add_child(tit_fam)

	var fam_data: Dictionary = LifeLegacy.get_family() if LifeLegacy != null else {}
	var spouse: Dictionary = fam_data.get("spouse", {})
	var spouse_lbl: Label = Label.new()
	spouse_lbl.text = "Cônjuge: %s" % (spouse.get("name", "Solteiro") if not spouse.is_empty() else "Solteiro")
	vb_fam.add_child(spouse_lbl)

	var children: Array = fam_data.get("children", [])
	var ch_lbl: Label = Label.new()
	ch_lbl.text = "Filhos (%d):" % children.size()
	vb_fam.add_child(ch_lbl)

	for ch in children:
		var c_name: String = String(ch.get("name", "Filho"))
		var c_gender: String = String(ch.get("gender", "M"))
		var b_s: int = int(ch.get("birth_season_num", 1))
		var b_d: int = int(ch.get("birth_season_day", 0))
		var cur_s: int = GameState.season_num if GameState != null else 1
		var cur_d: int = GameState.season_day if GameState != null else 0
		var c_age: int = cur_s - b_s - (1 if cur_d < b_d else 0)
		var c_box: HBoxContainer = HBoxContainer.new()
		var c_desc: Label = Label.new()
		c_desc.text = "  · %s (%s, %d anos - %s)" % [c_name, c_gender, maxi(0, c_age), "Base/Elegível" if c_age >= 16 else "Em Formação"]
		c_box.add_child(c_desc)
		vb_fam.add_child(c_box)

	# 3. Painel Dinástico
	var pnl_dyn: PanelContainer = PanelContainer.new()
	var sf_dyn: StyleBoxFlat = StyleBoxFlat.new()
	sf_dyn.bg_color = Color(0.12, 0.14, 0.18, 0.95)
	sf_dyn.set_corner_radius_all(12)
	sf_dyn.set_content_margin_all(14.0)
	pnl_dyn.add_theme_stylebox_override("panel", sf_dyn)
	box.add_child(pnl_dyn)

	var vb_dyn: VBoxContainer = VBoxContainer.new()
	vb_dyn.add_theme_constant_override("separation", 8)
	pnl_dyn.add_child(vb_dyn)

	var tit_dyn: Label = Label.new()
	tit_dyn.text = "LINHAGEM E SUCESSÃO DINÁSTICA"
	tit_dyn.modulate = Color(0.6, 0.95, 0.5)
	vb_dyn.add_child(tit_dyn)

	var dyn_data: Dictionary = LifeLegacy.get_dynasty() if LifeLegacy != null else {}
	var gen_lbl: Label = Label.new()
	gen_lbl.text = "Geração Ativa: %d" % int(dyn_data.get("current_generation", 1))
	vb_dyn.add_child(gen_lbl)

	var ancestors: Array = dyn_data.get("ancestors", [])
	if ancestors.is_empty():
		var anc_empty: Label = Label.new()
		anc_empty.text = "Primeira geração da família. Construa seu legado!"
		anc_empty.modulate = Color(0.7, 0.7, 0.7)
		vb_dyn.add_child(anc_empty)
	else:
		for anc in ancestors:
			var anc_lbl: Label = Label.new()
			anc_lbl.text = "  · %s (Aposentado na T%d - Museu: %s)" % [anc.get("name", ""), int(anc.get("retired_season", 1)), anc.get("plaque_id", "")]
			vb_dyn.add_child(anc_lbl)

	padre.add_child(scroll)
	return scroll
