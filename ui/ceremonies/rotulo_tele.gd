class_name RotuloTele
extends Control




























const ANCHO: float = 900.0
const TAB_ALTO: float = 58.0
const TAB_AIRE: float = 20.0
const PLATO_ALTO: float = 320.0
const ALTO: float = TAB_ALTO + TAB_AIRE + PLATO_ALTO

const FOTO: Vector2 = Vector2(216, 282)
const FOTO_MARCO: float = 6.0
const FOTO_X: float = 40.0
const FOTO_ABAJO: float = 20.0

const FOTO_SUBE: float = 340.0
const AIRE_DER: float = 30.0
const CHAPA: Vector2 = Vector2(104, 80)
const CORONA: float = 48.0


const T_TAB: Vector2 = Vector2(0.0, 0.32)
const T_CORTINA: Vector2 = Vector2(0.07, 0.25)
const T_CORTINA_SALE: Vector2 = Vector2(0.25, 0.46)
const T_FOTO: Vector2 = Vector2(0.35, 0.67)
const T_CUENTA: Vector2 = Vector2(0.49, 1.4)
const T_BARRA: Vector2 = Vector2(0.56, 1.47)
const T_CHAPA: Vector2 = Vector2(1.12, 1.4)
const T_MARCA: Vector2 = Vector2(1.26, 1.47)
const T_CUBO: Vector2 = Vector2(1.54, 1.75)
const T_CUBO_PASO: float = 0.12
const T_BRILLO: Vector2 = Vector2(1.89, 2.38)

const SALIDA: float = 0.45

const ENTERO: float = 2.4

var _todo: Control = null
var _tab: Control = null
var _plato: Control = null
var _foto: Control = null
var _foto_y: float = 0.0
var _cuenta: Label = null
var _cifra: float = 0.0
var _decimales: bool = false
var _barra: ColorRect = null
var _barra_frac: float = 0.0
var _barra_ancho: float = 0.0
var _marca: Array[Control] = []
var _marca_y: Array[float] = []
var _chapa: Control = null
var _cubos: Array[Control] = []
var _cubo_y: float = 0.0
var _cortina: ColorRect = null
var _brillo: TextureRect = null
var _x0: float = 0.0











func arma(cfg: Dictionary, inset_izq: float = 0.0, abajo: float = 0.0) -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	var acento: Color = cfg.get("acento", CareerTheme.INK_LIGHT)
	var tinta: Color = cfg.get("tinta", acento)
	var ancho: float = float(cfg.get("ancho", ANCHO))


	anchor_left = 0.0
	anchor_right = 0.0
	anchor_top = 1.0
	anchor_bottom = 1.0
	offset_left = 0.0
	offset_right = ancho + inset_izq
	offset_bottom = - abajo
	offset_top = - abajo - ALTO
	_x0 = inset_izq
	_todo = _caja(self, Vector2(_x0, 0.0), Vector2(ancho, ALTO))
	_arma_tab(cfg, acento)
	var py: float = TAB_ALTO + TAB_AIRE
	_plato = _caja(_todo, Vector2(0.0, py), Vector2(ancho, PLATO_ALTO))
	var fondo: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.bg_color.a = 0.92
	sb.border_color = acento
	var canto: int = int(cfg.get("canto", 12))
	sb.border_width_left = canto
	var r: int = int(cfg.get("radio", 0))
	sb.corner_radius_top_right = r
	sb.corner_radius_bottom_right = r
	fondo.add_theme_stylebox_override("panel", sb)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fondo.size = Vector2(ancho, PLATO_ALTO)
	_plato.add_child(fondo)


	var filo: ColorRect = ColorRect.new()
	filo.color = acento.darkened(0.4)
	filo.position = Vector2(float(canto), 0.0)
	filo.size = Vector2(ancho - float(canto) - float(r), 6.0)
	filo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(filo)
	_arma_foto(cfg, acento)
	_arma_datos(cfg, acento, tinta, ancho)

	var recorte: Control = _caja(_plato, Vector2.ZERO, Vector2(ancho, PLATO_ALTO))
	recorte.clip_contents = true
	_cortina = ColorRect.new()
	_cortina.color = acento
	_cortina.size = Vector2(ancho, PLATO_ALTO)
	_cortina.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(_cortina)
	_brillo = TextureRect.new()
	_brillo.texture = _brillo_tex()
	_brillo.stretch_mode = TextureRect.STRETCH_SCALE
	_brillo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_brillo.size = Vector2(170.0, PLATO_ALTO)
	_brillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(_brillo)
	anima(-1.0)





func anima(s: float, queda: float = 99.0) -> void:
	if _todo == null:
		return
	visible = s >= 0.0
	if not visible:
		return
	var ancho: float = _plato.size.x

	var tw: float = _tab.size.x
	_tab.position.x = lerpf(- tw * 1.15 - _x0, 0.0, _sale(_tramo(s, T_TAB)))


	var dentro: bool = s >= T_CORTINA.y
	for c in _plato.get_children():
		if c != _cortina.get_parent():
			(c as CanvasItem).visible = dentro
	if s < T_CORTINA.y:
		_cortina.position.x = lerpf(- ancho * 1.01, 0.0, _suave(_tramo(s, T_CORTINA)))
	else:
		_cortina.position.x = lerpf(0.0, ancho * 1.01, _suave(_tramo(s, T_CORTINA_SALE)))

	if _foto != null:
		_foto.position.y = _foto_y + FOTO_SUBE *(1.0 - _rebote(_tramo(s, T_FOTO)))

	if _cuenta != null:
		var v: float = _cifra * _sale(_tramo(s, T_CUENTA))
		_cuenta.text = _num(v, _decimales) if s < T_CUENTA.y else _num(_cifra, _decimales)

	if _barra != null:
		_barra.size.x = _barra_ancho * _barra_frac * _sale(_tramo(s, T_BARRA))

	if _chapa != null:
		var k: float = _rebote(_tramo(s, T_CHAPA), 2.6)
		_chapa.scale = Vector2(k, k)
		_chapa.rotation = deg_to_rad(-8.0) *(1.0 - clampf(k, 0.0, 1.0))

	var km: float = _sale(_tramo(s, T_MARCA))
	for i in _marca.size():
		_marca[i].modulate.a = km
		_marca[i].position.y = _marca_y[i] - 10.0 *(1.0 - km)

	for i in _cubos.size():
		var a: float = T_CUBO.x + T_CUBO_PASO * float(i)
		var kc: float = _sale(_tramo(s, Vector2(a, a + T_CUBO.y - T_CUBO.x)))
		_cubos[i].modulate.a = kc
		_cubos[i].position.y = _cubo_y + 16.0 *(1.0 - kc)

	_brillo.position.x = lerpf(- _brillo.size.x - 20.0, ancho + 20.0,
		_suave(_tramo(s, T_BRILLO)))

	var ks: float = _entra(1.0 - clampf(queda / SALIDA, 0.0, 1.0))
	_todo.position.x = _x0 - ks *(ancho + _x0) * 1.05
	_todo.modulate.a = 1.0 - ks




func _arma_tab(cfg: Dictionary, acento: Color) -> void:
	var tab: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = acento
	sb.content_margin_left = 24.0
	sb.content_margin_right = 26.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	tab.add_theme_stylebox_override("panel", sb)
	tab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tab.custom_minimum_size = Vector2(0.0, TAB_ALTO)
	_todo.add_child(tab)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tab.add_child(fila)
	var tinta: Color = CareerTheme.on_color(acento)
	var tipo: String = String(cfg.get("logo", ""))
	if not tipo.is_empty():
		var logo: CompLogo = CompLogo.new()
		logo.custom_minimum_size = Vector2(42, 42)
		logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		logo.set_type(tipo)
		logo.color = tinta
		fila.add_child(logo)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, tinta)
	l.text = String(cfg.get("pestana", ""))
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(l)


	tab.size = tab.get_combined_minimum_size()
	_tab = tab




func _arma_foto(cfg: Dictionary, acento: Color) -> void:
	var look: Dictionary = cfg.get("look", {})
	if look.is_empty():
		return
	var marco_l: Vector2 = FOTO + Vector2.ONE * FOTO_MARCO * 2.0
	var arriba: float = 60.0
	var recorte: Control = _caja(_plato, Vector2(FOTO_X, - arriba),
		Vector2(marco_l.x, PLATO_ALTO + arriba))
	recorte.clip_contents = true
	var color: Color = cfg.get("foto_color", acento)
	var marco: PanelContainer = PanelContainer.new()
	var msb: StyleBoxFlat = StyleBoxFlat.new()
	msb.bg_color = color.darkened(0.58)
	msb.set_border_width_all(int(FOTO_MARCO))
	msb.border_color = color
	marco.add_theme_stylebox_override("panel", msb)
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(marco)
	var av: PlayerAvatar = PlayerAvatar.new()
	av.chrome = false
	av.bust = PlayerAvatar.BUST_CLOSE
	av.custom_minimum_size = FOTO
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE
	av.club = cfg.get("club", {})
	marco.add_child(av)
	av.set_look(look)
	marco.size = marco_l
	_foto_y = PLATO_ALTO + arriba - FOTO_ABAJO - marco_l.y
	marco.position = Vector2(0.0, _foto_y + FOTO_SUBE)
	_foto = marco


func _arma_datos(cfg: Dictionary, acento: Color, tinta: Color, ancho: float) -> void:
	var x: float = FOTO_X + FOTO.x + FOTO_MARCO * 2.0 + 34.0
	if Dictionary(cfg.get("look", {})).is_empty():
		x = 40.0
	var w: float = ancho - x - AIRE_DER
	var puesto: int = int(cfg.get("puesto", 0))
	var corona: bool = bool(cfg.get("corona", false)) and puesto > 0

	var kick: Label = _rotulo(String(cfg.get("kicker", "")), CareerTheme.T_BODY, tinta,
		Vector2(x, 24.0), Vector2(w, 30.0))
	_plato.add_child(kick)

	var nx: float = x
	var mc: Color = cfg.get("marca_club", Color(0, 0, 0, 0))
	if mc.a > 0.0:
		var cuadro: ColorRect = ColorRect.new()
		cuadro.color = mc
		cuadro.position = Vector2(x, 66.0)
		cuadro.size = Vector2(24.0, 24.0)
		cuadro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_plato.add_child(cuadro)
		nx += 38.0

	var nw: float = x + w - nx -(CHAPA.x + 12.0 if corona else 0.0)
	_plato.add_child(_rotulo(String(cfg.get("nombre", "")), CareerTheme.T_HUD_ROTULO,
		CareerTheme.INK_LIGHT, Vector2(nx, 56.0), Vector2(nw, 46.0)))

	var fy: float = 110.0
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(String(cfg.get("icono", "gol")), CareerTheme.INK_LIGHT)
	ic.position = Vector2(x, fy + 14.0)
	ic.size = Vector2(52.0, 52.0)
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(ic)
	_cifra = float(cfg.get("cifra", 0.0))
	_decimales = bool(cfg.get("decimales", false))
	_cuenta = _rotulo("0", CareerTheme.T_HUD_SCORE, CareerTheme.INK_LIGHT,
		Vector2(x + 66.0, fy), Vector2(124.0, CHAPA.y))
	_plato.add_child(_cuenta)
	var ux: float = x + 66.0 + 124.0 + 8.0
	var uw: float = x + w - ux -(CHAPA.x + 14.0 if puesto > 0 else 0.0)
	_plato.add_child(_rotulo(String(cfg.get("unidad", "")), CareerTheme.T_DIM,
		CareerTheme.MUTED, Vector2(ux, fy), Vector2(uw, CHAPA.y)))
	if puesto > 0:
		_arma_chapa(Vector2(x + w - CHAPA.x, fy), acento, puesto, corona)

	var by: float = 204.0
	var pista: ColorRect = ColorRect.new()
	pista.color = Color(CareerTheme.INK_LIGHT, 0.1)
	pista.position = Vector2(x, by)
	pista.size = Vector2(w, 12.0)
	pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(pista)
	_barra = ColorRect.new()
	_barra.color = cfg.get("barra_color", acento)
	_barra.position = Vector2(x, by)
	_barra.size = Vector2(0.0, 12.0)
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(_barra)
	_barra_ancho = w
	_barra_frac = clampf(float(cfg.get("barra", 0.0)), 0.0, 1.0)
	var marca: float = float(cfg.get("marca", -1.0))
	if marca >= 0.0:
		var mcol: Color = cfg.get("marca_color", CareerTheme.MUTED)
		var mx: float = x + w * clampf(marca, 0.0, 1.0)
		var raya: ColorRect = ColorRect.new()
		raya.color = mcol
		raya.position = Vector2(mx - 2.0, by - 6.0)
		raya.size = Vector2(4.0, 24.0)
		raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_plato.add_child(raya)


		var lw: float = 200.0
		var lx: float = clampf(mx - lw * 0.5, x, x + w - lw)
		var ml: Label = _rotulo(String(cfg.get("marca_texto", "")), CareerTheme.T_CAPTION,
			mcol, Vector2(lx, by + 18.0), Vector2(lw, 22.0))
		ml.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		if mx - lw * 0.5 < x:
			ml.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT
		elif mx + lw * 0.5 > x + w:
			ml.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		_plato.add_child(ml)
		_marca = [raya, ml]
		_marca_y = [raya.position.y, ml.position.y]

	_cubo_y = 252.0
	var cx: float = x
	for par in cfg.get("cubos", []):
		var cubo: PanelContainer = _cubo(String(par[0]), String(par[1]))
		cubo.position = Vector2(cx, _cubo_y)
		_plato.add_child(cubo)
		cubo.size = cubo.get_combined_minimum_size()
		cx += cubo.size.x + 14.0
		_cubos.append(cubo)


func _arma_chapa(at: Vector2, acento: Color, puesto: int, corona: bool) -> void:
	var chapa: Control = _caja(_plato, at, CHAPA)
	chapa.pivot_offset = CHAPA * 0.5
	var fondo: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = acento
	sb.set_corner_radius_all(8)
	fondo.add_theme_stylebox_override("panel", sb)
	fondo.size = CHAPA
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chapa.add_child(fondo)
	var tinta: Color = CareerTheme.on_color(acento)
	var num: Label = _rotulo(I18n.ordinal(puesto), CareerTheme.T_HUD_DORSAL, tinta,
		Vector2.ZERO, CHAPA)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	chapa.add_child(num)
	if corona:
		var co: MenuIcon = MenuIcon.new()
		co.setup("corona", CareerTheme.INK_LIGHT)
		co.position = Vector2((CHAPA.x - CORONA) * 0.5, - CORONA + 10.0)
		co.size = Vector2(CORONA, CORONA)
		co.mouse_filter = Control.MOUSE_FILTER_IGNORE
		chapa.add_child(co)
	_chapa = chapa


func _cubo(icono: String, texto: String) -> PanelContainer:
	var cubo: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_SURFACE
	sb.content_margin_left = 12.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	cubo.add_theme_stylebox_override("panel", sb)
	cubo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cubo.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(icono, CareerTheme.INK_LIGHT)
	ic.custom_minimum_size = Vector2(28, 28)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(ic)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.INK_LIGHT)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(l)
	return cubo






static func _rotulo(texto: String, tam: int, color: Color, at: Vector2,
		lado: Vector2) -> Label:
	var l: Label = CareerUi.plain(tam, color)
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.position = at
	l.size = lado
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


static func _caja(padre: Control, at: Vector2, lado: Vector2) -> Control:
	var c: Control = Control.new()
	c.position = at
	c.size = lado
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	padre.add_child(c)
	return c



static func _brillo_tex() -> GradientTexture2D:
	var g: Gradient = Gradient.new()
	g.set_color(0, Color(1, 1, 1, 0))
	g.set_color(1, Color(1, 1, 1, 0))
	g.add_point(0.5, Color(1, 1, 1, 0.16))
	var tex: GradientTexture2D = GradientTexture2D.new()
	tex.gradient = g
	tex.width = 64
	tex.height = 4
	tex.fill_from = Vector2(0.0, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	return tex


static func _num(v: float, decimales: bool) -> String:
	return I18n.num(v, 1 if decimales else 0)



static func _tramo(s: float, r: Vector2) -> float:
	return clampf((s - r.x) / maxf(r.y - r.x, 0.0001), 0.0, 1.0)




static func _sale(k: float) -> float:
	return 1.0 - pow(1.0 - k, 3.0)


static func _suave(k: float) -> float:
	return k * k *(3.0 - 2.0 * k)


static func _entra(k: float) -> float:
	return k * k * k


static func _rebote(k: float, fuerza: float = 1.70158) -> float:
	if k <= 0.0:
		return 0.0
	if k >= 1.0:
		return 1.0
	var c: float = fuerza + 1.0
	return 1.0 + c * pow(k - 1.0, 3.0) + fuerza * pow(k - 1.0, 2.0)
