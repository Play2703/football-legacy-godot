class_name PronosticoTele
extends Control
























const HUB: GDScript = preload("res://ui/career_hub.gd")
const RACHA: GDScript = preload("res://ui/hub_training.gd")



const ALTO_V: float = 352.0
const ALTO_H: float = 236.0


const ANCHO_V_MAX: float = 1032.0
const ANCHO_H_MAX: float = 1720.0

const ABAJO_H: float = 36.0
const AIRE: float = 22.0
const ESCUDO: float = 112.0
const COLUMNA: float = 18.0

const FILA: float = 40.0
const FILA_SEP: float = 6.0
const CUBO: float = 36.0
const CUBO_SEP: float = 7.0
const BLOQUE_ALTO: float = FILA * 3.0 + FILA_SEP * 2.0

const BLOQUE_H: float = 470.0
const GOLEADOR_MAX: float = 210.0
const PCT_ALTO: float = 80.0
const BARRA: float = 26.0
const BARRA_HUECO: float = 4.0

const TRAMO_MIN: float = 0.07
const TAB_ALTO: float = 58.0


const TOPE: float = TAB_ALTO * 0.5 + 12.0
const RAYA: float = 16.0
const RAYA_PERFIL: float = 6.0






const T_MITAD_LOCAL: Vector2 = Vector2(0.0, 0.48)
const T_MITAD_VISITA: Vector2 = Vector2(0.08, 0.56)
const T_RAYA: Vector2 = Vector2(0.4, 0.7)
const T_BANDA: Vector2 = Vector2(1.0, 1.32)
const T_TAB: Vector2 = Vector2(1.24, 1.5)
const T_LOCAL: Vector2 = Vector2(1.3, 1.7)
const T_VISITA: Vector2 = Vector2(1.4, 1.8)
const T_CUENTA: Vector2 = Vector2(1.4, 2.36)
const T_BARRA: Vector2 = Vector2(1.4, 2.28)
const T_EMPATE: Vector2 = Vector2(2.04, 2.36)
const T_FORMA: Vector2 = Vector2(1.7, 1.94)
const T_FORMA_PASO: float = 0.07
const T_FAV: Vector2 = Vector2(2.36, 2.68)
const T_BRILLO: Vector2 = Vector2(2.7, 3.2)

const SALIDA: float = 0.45

var acento: Color = CareerTheme.INK_LIGHT
var _horizontal: bool = false
var _k_raya: float = 0.0
var _banda: Control = null
var _banda_y: float = 0.0
var _tab: Control = null
var _tab_y: float = 0.0
var _bloques: Array[Control] = []
var _bloque_x: Array[float] = []
var _forma: Array[Control] = []
var _pcts: Array[Label] = []
var _pct: Array = [0, 0, 0]
var _segs: Array[ColorRect] = []
var _seg_w: Array[float] = []
var _seg_x0: float = 0.0
var _seg_x1: float = 0.0
var _fav: Control = null
var _brillo: TextureRect = null




static func pct(odds: Array) -> Array:
	if odds.size() != 3:
		return [0, 0, 0]
	return HUB._pct_100(odds)




static func favorito(p: Array) -> int:
	if p.size() != 3 or int(p[0]) == int(p[2]):
		return -1
	return 0 if int(p[0]) > int(p[2]) else 1









func arma(cfg: Dictionary, canto: Dictionary = {}) -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	acento = cfg.get("acento", CareerTheme.INK_LIGHT)
	_horizontal = UiKit.es_horizontal()
	var lado: Vector2 = get_viewport_rect().size if size == Vector2.ZERO else size
	var al_lado: float = float(canto.get("lado", 0.0))
	var bw: float
	var bh: float = ALTO_H if _horizontal else ALTO_V
	if _horizontal:
		bw = minf(lado.x - al_lado * 2.0 - 80.0, ANCHO_H_MAX)
		_banda_y = lado.y - float(canto.get("abajo", 0.0)) - ABAJO_H - bh
	else:
		bw = minf(lado.x - al_lado * 2.0 - 48.0, ANCHO_V_MAX)
		_banda_y =(lado.y - bh) * 0.5
	_banda = RotuloTele._caja(self, Vector2((lado.x - bw) * 0.5, _banda_y), Vector2(bw, bh))
	_banda.clip_contents = true
	_banda.pivot_offset = Vector2(bw, bh) * 0.5
	var fondo: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.HUD_DEEP, 0.95)
	sb.border_color = acento
	sb.border_width_top = 6
	sb.border_width_bottom = 6
	fondo.add_theme_stylebox_override("panel", sb)
	fondo.size = Vector2(bw, bh)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_banda.add_child(fondo)
	var lados: Array = cfg.get("lados", [])
	_pct = cfg.get("pct", [0, 0, 0])
	for i in mini(lados.size(), 2):
		_arma_bloque(Dictionary(lados[i]), i == 1, bw)
	_arma_pcts(lados, bw)
	_arma_barra(lados, bw, bh)
	_brillo = TextureRect.new()
	_brillo.texture = RotuloTele._brillo_tex()
	_brillo.stretch_mode = TextureRect.STRETCH_SCALE
	_brillo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_brillo.size = Vector2(220.0, bh)
	_brillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_banda.add_child(_brillo)
	_arma_tab(cfg, lado.x)
	anima(-1.0)







func _arma_bloque(l: Dictionary, espejo: bool, bw: float) -> void:
	var ancho: float = minf(bw * 0.5 - AIRE - 12.0, BLOQUE_H)
	var x0: float = bw - AIRE - ancho if espejo else AIRE
	var b: Control = RotuloTele._caja(_banda, Vector2(x0, TOPE), Vector2(ancho, BLOQUE_ALTO))
	_bloques.append(b)
	_bloque_x.append(x0)
	var escudo: CrestView = CrestView.new()
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	escudo.custom_minimum_size = Vector2(ESCUDO, ESCUDO)
	escudo.size = Vector2(ESCUDO, ESCUDO)
	escudo.position = Vector2(ancho - ESCUDO if espejo else 0.0,
		(BLOQUE_ALTO - ESCUDO) * 0.5)
	b.add_child(escudo)
	escudo.set_team(Dictionary(l.get("team", {})))
	var col_w: float = ancho - ESCUDO - COLUMNA
	var color: Color = l.get("color", acento)

	var fila1: HBoxContainer = _fila(espejo)
	var sigla: Label = _texto(CareerTheme.caps(String(l.get("sigla", ""))),
		CareerTheme.T_HUD_ROTULO, CareerTheme.INK_LIGHT, col_w - 90.0)
	var puesto: int = int(l.get("puesto", 0))
	var chapa: Control = _chapa(I18n.ordinal(puesto)) if puesto > 0 else null


	var cuadro: ColorRect = ColorRect.new()
	cuadro.color = color
	cuadro.custom_minimum_size = Vector2(14.0, 30.0)
	cuadro.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cuadro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for c in ([chapa, sigla, cuadro] if espejo else [cuadro, sigla, chapa]):
		if c != null:
			fila1.add_child(c)

	var fila2: HBoxContainer = _fila(espejo)
	fila2.add_theme_constant_override("separation", int(CUBO_SEP))
	var forma: Array = l.get("forma", [])
	var celdas: Array = []
	for i in RACHA.FORM_SLOTS - mini(forma.size(), RACHA.FORM_SLOTS):
		celdas.append(RACHA.FORM_EMPTY)
	for r in forma.slice(maxi(forma.size() - RACHA.FORM_SLOTS, 0)):
		celdas.append(String(r))
	for r in celdas:
		var cubo: Control = _cubo_forma(String(r))
		fila2.add_child(cubo)
		_forma.append(cubo)

	var fila3: HBoxContainer = null
	var gol: String = String(l.get("goleador", ""))
	if not gol.is_empty():
		fila3 = _fila(espejo)
		fila3.add_child(_goleador(gol, int(l.get("goles", 0)), bool(l.get("tuyo", false)),
			Color(l.get("tinta", CareerTheme.INK_LIGHT))))
	var y: float = 0.0
	for f in [fila1, fila2, fila3]:
		if f != null:
			b.add_child(f)
			f.size = Vector2(col_w, FILA)
			f.position = Vector2(0.0 if espejo else ESCUDO + COLUMNA, y)
		y += FILA + FILA_SEP




func _arma_pcts(lados: Array, bw: float) -> void:
	var y: float
	var x0: float
	var x1: float
	if _horizontal:

		var bloque: float = minf(bw * 0.5 - AIRE - 12.0, BLOQUE_H)
		x0 = AIRE + bloque + 30.0
		x1 = bw - AIRE - bloque - 30.0
		y = TOPE
	else:
		x0 = AIRE
		x1 = bw - AIRE
		y = TOPE + BLOQUE_ALTO + 6.0
	var w: float = x1 - x0
	for i in 3:
		var grande: bool = i != 1
		var col: Color = CareerTheme.INK_LIGHT
		if grande and i / 2 < lados.size():
			col = Color(Dictionary(lados[i / 2]).get("tinta", CareerTheme.INK_LIGHT))
		var l: Label = RotuloTele._rotulo("0%", CareerTheme.T_SCORE if grande
			else CareerTheme.T_HUD_SCORE, col, Vector2(x0, y),
			Vector2(w, PCT_ALTO if grande else 60.0))
		l.horizontal_alignment = [HORIZONTAL_ALIGNMENT_LEFT, HORIZONTAL_ALIGNMENT_CENTER,
			HORIZONTAL_ALIGNMENT_RIGHT][i]
		_banda.add_child(l)
		_pcts.append(l)

	var e: Label = RotuloTele._rotulo(I18n.t("EMPATE"), CareerTheme.T_CAPTION,
		CareerTheme.MUTED, Vector2(x0 + w * 0.5 - 100.0, y + 58.0), Vector2(200.0, 22.0))
	e.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_banda.add_child(e)
	_pcts[1].set_meta("caption", e)


	var fav: int = favorito(_pct)
	if fav < 0:
		return
	var chip: Control = _chapa(I18n.t("FAVORITO"), true)
	_banda.add_child(chip)
	chip.size = chip.get_combined_minimum_size()
	chip.position = Vector2(x0 if fav == 0 else x1 - chip.size.x, y + PCT_ALTO + 2.0)
	chip.pivot_offset = chip.size * 0.5
	_fav = chip






func _arma_barra(lados: Array, bw: float, bh: float) -> void:
	_seg_x0 = AIRE
	_seg_x1 = bw - AIRE
	var y: float = bh - AIRE - BARRA
	var util: float = _seg_x1 - _seg_x0 - BARRA_HUECO * 2.0
	var total: float = 0.0
	for p in _pct:
		total += maxf(float(p) / 100.0, TRAMO_MIN)
	for i in 3:
		var r: ColorRect = ColorRect.new()
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		r.color = CareerTheme.STAT_AVG
		if i != 1 and i / 2 < lados.size():
			r.color = Dictionary(lados[i / 2]).get("color", acento)
		r.position = Vector2(_seg_x0, y)
		r.size = Vector2(0.0, BARRA)
		_banda.add_child(r)
		_segs.append(r)
		_seg_w.append(util * maxf(float(_pct[i]) / 100.0, TRAMO_MIN) / maxf(total, 0.0001))




func _arma_tab(cfg: Dictionary, ancho: float) -> void:
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
	add_child(tab)
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
	fila.add_child(_texto(String(cfg.get("pestana", "")), CareerTheme.T_BODY, tinta,
		ancho - 200.0))
	tab.size = tab.get_combined_minimum_size()
	_tab_y = _banda_y - TAB_ALTO * 0.5
	tab.position = Vector2((ancho - tab.size.x) * 0.5, _tab_y)
	tab.pivot_offset = tab.size * 0.5
	_tab = tab


func _fila(espejo: bool) -> HBoxContainer:
	var f: HBoxContainer = HBoxContainer.new()
	f.add_theme_constant_override("separation", 12)
	f.alignment = BoxContainer.ALIGNMENT_END if espejo else BoxContainer.ALIGNMENT_BEGIN
	f.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return f




func _texto(texto: String, tam: int, color: Color, tope: float) -> Label:
	var l: Label = CareerUi.plain(tam, color)
	l.text = texto
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	l.custom_minimum_size.x = minf(_ancho_de(texto, tam) + 2.0, maxf(tope, 40.0))
	return l


func _ancho_de(texto: String, tam: int) -> float:
	var f: Font = CareerUi.plain(tam, CareerTheme.INK_LIGHT).get_theme_font("font")
	if f == null:
		f = ThemeDB.fallback_font
	return f.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, tam).x



func _chapa(texto: String, ancha: bool = false) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = acento
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 16.0 if ancha else 10.0
	sb.content_margin_right = 16.0 if ancha else 10.0
	sb.content_margin_top = 2.0
	sb.content_margin_bottom = 2.0
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.add_child(_texto(texto, CareerTheme.T_HEAD if not ancha else CareerTheme.T_BODY,
		CareerTheme.on_color(acento), 260.0))
	return p




func _cubo_forma(r: String) -> Control:
	var col: Color = RACHA.FORM_COLORS.get(r, RACHA.FORM_EMPTY_COLOR)
	var box: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_SURFACE
	sb.border_color = col
	sb.set_border_width_all(3)
	sb.set_corner_radius_all(5)
	box.add_theme_stylebox_override("panel", sb)
	box.custom_minimum_size = Vector2(CUBO, CUBO)
	box.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	box.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.pivot_offset = Vector2(CUBO, CUBO) * 0.5
	var lb: Label = CareerUi.plain(CareerTheme.T_BODY, col)
	lb.text = r if r == RACHA.FORM_EMPTY else CareerTheme.caps(I18n.t(r))
	lb.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	lb.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	lb.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(lb)
	return box




func _goleador(nombre: String, goles: int, tuyo: bool, tinta: Color) -> PanelContainer:
	var cubo: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_SURFACE
	sb.content_margin_left = 12.0
	sb.content_margin_right = 14.0
	sb.content_margin_top = 4.0
	sb.content_margin_bottom = 4.0
	cubo.add_theme_stylebox_override("panel", sb)
	cubo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cubo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cubo.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.setup("balon", CareerTheme.INK_LIGHT)
	ic.custom_minimum_size = Vector2(28, 28)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(ic)
	fila.add_child(_texto(CareerTheme.caps(nombre), CareerTheme.T_BODY,
		tinta if tuyo else CareerTheme.INK_LIGHT, GOLEADOR_MAX))
	fila.add_child(_texto(str(goles), CareerTheme.T_HEAD, CareerTheme.INK_LIGHT, 80.0))
	return cubo






func anima(t: float, queda: float = 99.0) -> void:
	visible = t >= 0.0 and _banda != null
	if not visible:
		return
	_k_raya = RotuloTele._suave(RotuloTele._tramo(t, T_RAYA))
	var bw: float = _banda.size.x

	var kb: float = RotuloTele._sale(RotuloTele._tramo(t, T_BANDA))
	_banda.visible = kb > 0.0
	_banda.scale = Vector2(1.0, kb)

	var kt: float = RotuloTele._rebote(RotuloTele._tramo(t, T_TAB), 1.4)
	_tab.visible = t >= T_TAB.x
	_tab.position.y = _tab_y - 40.0 *(1.0 - kt)
	_tab.modulate.a = clampf(kt, 0.0, 1.0)

	for i in _bloques.size():
		var r: Vector2 = T_LOCAL if i == 0 else T_VISITA
		var k: float = RotuloTele._sale(RotuloTele._tramo(t, r))
		var fuera: float = bw * 0.55 *(1.0 - k)
		_bloques[i].position.x = _bloque_x[i] +(- fuera if i == 0 else fuera)
		_bloques[i].modulate.a = k

	var por_lado: int = RACHA.FORM_SLOTS
	for i in _forma.size():
		var a: float = T_FORMA.x + T_FORMA_PASO * float(i % por_lado) \
				+(T_VISITA.x - T_LOCAL.x) * float(i / por_lado)
		var kc: float = RotuloTele._rebote(RotuloTele._tramo(t,
			Vector2(a, a + T_FORMA.y - T_FORMA.x)), 2.2)
		_forma[i].scale = Vector2(kc, kc)

	var kn: float = RotuloTele._sale(RotuloTele._tramo(t, T_CUENTA))
	var ke: float = RotuloTele._sale(RotuloTele._tramo(t, T_EMPATE))
	for i in _pcts.size():
		var v: int = int(round(float(_pct[i]) * kn)) if t < T_CUENTA.y else int(_pct[i])
		_pcts[i].text = "%d%%" % v
		_pcts[i].modulate.a = ke if i == 1 else clampf(kn * 3.0, 0.0, 1.0)
		if _pcts[i].has_meta("caption"):
			(_pcts[i].get_meta("caption") as Label).modulate.a = ke

	var kbar: float = RotuloTele._sale(RotuloTele._tramo(t, T_BARRA))
	if _segs.size() == 3:
		_segs[0].position.x = _seg_x0
		_segs[0].size.x = _seg_w[0] * kbar
		_segs[2].size.x = _seg_w[2] * kbar
		_segs[2].position.x = _seg_x1 - _segs[2].size.x
		_segs[1].position.x = _seg_x0 + _seg_w[0] + BARRA_HUECO
		_segs[1].size.x = _seg_w[1]
		_segs[1].modulate.a = ke

	if _fav != null:
		var kf: float = RotuloTele._rebote(RotuloTele._tramo(t, T_FAV), 2.6)
		_fav.scale = Vector2(kf, kf)
		_fav.rotation = deg_to_rad(-8.0) *(1.0 - clampf(kf, 0.0, 1.0))

	_brillo.position.x = lerpf(- _brillo.size.x - 20.0, bw + 20.0,
		RotuloTele._suave(RotuloTele._tramo(t, T_BRILLO)))

	var ks: float = RotuloTele._entra(1.0 - clampf(queda / SALIDA, 0.0, 1.0))
	if ks > 0.0:
		_banda.scale = Vector2(1.0, kb *(1.0 - ks))
		_tab.modulate.a = 1.0 - ks
		_tab.position.y = _tab_y - 40.0 * ks
	queue_redraw()


func _draw() -> void:
	if _k_raya <= 0.0:
		return




	var lado: Vector2 = size
	var hueco: Rect2 = Rect2()
	if _banda.visible and _banda.scale.y > 0.01:
		var alto: float = _banda.size.y * _banda.scale.y
		hueco = Rect2(_banda.position + Vector2(0.0,(_banda.size.y - alto) * 0.5),
			Vector2(_banda.size.x, alto))
	for capa in [[RAYA * 0.5 + RAYA_PERFIL, CareerTheme.HUD_DEEP], [RAYA * 0.5, acento]]:
		var medio: float = float(capa[0])
		var col: Color = capa[1]
		if _horizontal:
			var y0: float = lado.y * 0.5 *(1.0 - _k_raya)
			_tramo_raya(Rect2(lado.x * 0.5 - medio, y0, medio * 2.0, lado.y * _k_raya),
				hueco, col)
		else:
			var x0: float = lado.x * 0.5 *(1.0 - _k_raya)
			_tramo_raya(Rect2(x0, lado.y * 0.5 - medio, lado.x * _k_raya, medio * 2.0),
				hueco, col)



func _tramo_raya(r: Rect2, hueco: Rect2, col: Color) -> void:
	if not r.intersects(hueco):
		draw_rect(r, col)
		return
	if _horizontal:
		draw_rect(Rect2(r.position, Vector2(r.size.x, maxf(hueco.position.y
			- r.position.y, 0.0))), col)
		var y1: float = hueco.end.y
		draw_rect(Rect2(r.position.x, y1, r.size.x, maxf(r.end.y - y1, 0.0)), col)
	else:
		draw_rect(Rect2(r.position, Vector2(maxf(hueco.position.x - r.position.x, 0.0),
			r.size.y)), col)
		var x1: float = hueco.end.x
		draw_rect(Rect2(x1, r.position.y, maxf(r.end.x - x1, 0.0), r.size.y), col)
