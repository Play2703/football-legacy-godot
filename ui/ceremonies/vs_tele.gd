class_name VsTele
extends Control


























const ANCHO_V_MAX: float = 1032.0
const ANCHO_H_MAX: float = 1560.0
const TAB_ALTO: float = 58.0
const TAB_AIRE: float = 20.0
const AIRE: float = 28.0
const KICK_Y: float = 18.0
const KICK_ALTO: float = 34.0

const LADO_Y: float = 66.0
const FOTO: Vector2 = Vector2(132, 172)
const FOTO_MARCO: float = 6.0
const FOTO_HUECO: float = 18.0

const FOTO_SUBE: float = 200.0
const NOMBRE_ALTO: float = 46.0

const MEDALLA_NUM: int = 20
const MEDALLA_ALTO: float = 58.0

const VS_LADO: float = 112.0
const VS_CANTO: int = 6
const VS_HUECO: float = 18.0

const LADO_H: float = 380.0

const FILA: float = 62.0
const CIFRA_ANCHO: float = 190.0
const BARRA: float = 10.0
const BARRA_Y: float = 44.0
const BARRA_HUECO: float = 4.0
const ICONO: float = 28.0

const PIE: float = 16.0


const ABAJO_V: float = 110.0
const ABAJO_H: float = 40.0




const FOTO_H: Vector2 = Vector2(100, 130)
const LADO_Y_H: float = 24.0

const KICK_Y_H: float = 62.0
const FILAS_Y_H: float = 102.0
const FILA_H: float = 50.0
const BARRA_Y_H: float = 38.0
const CIFRA_ALTO_H: float = 36.0
const PIE_H: float = 10.0





const T_TAB: Vector2 = Vector2(0.0, 0.32)
const T_CORTINA: Vector2 = Vector2(0.07, 0.25)
const T_CORTINA_SALE: Vector2 = Vector2(0.25, 0.46)
const T_FOTO_TU: Vector2 = Vector2(0.35, 0.67)
const T_FOTO_EL: Vector2 = Vector2(0.45, 0.77)
const T_NOMBRES: Vector2 = Vector2(0.52, 0.82)
const T_VS: Vector2 = Vector2(0.66, 0.96)
const T_MEDALLAS: Vector2 = Vector2(0.84, 1.08)
const T_FILA: Vector2 = Vector2(1.0, 1.7)
const T_FILA_PASO: float = 0.16
const T_BRILLO: Vector2 = Vector2(2.2, 2.7)

const SALIDA: float = 0.45

const ENTERO: float = 2.7

var _horizontal: bool = false

var _foto: Vector2 = FOTO
var _lado_y: float = LADO_Y
var _fila: float = FILA
var _barra_y: float = BARRA_Y
var _cifra_alto: float = 40.0
var _todo: Control = null
var _todo_y: float = 0.0
var _tab: Control = null
var _plato: Control = null
var _cortina: ColorRect = null
var _brillo: TextureRect = null

var _fotos: Array[Control] = []
var _foto_y: float = 0.0

var _nombres: Array[Control] = []
var _nombre_x: Array[float] = []
var _medallas: Array[Control] = []
var _medalla_y: float = 0.0
var _vs: Control = null


var _filas: Array[Dictionary] = []





static func reparto(izq: float, der: float, menor_mejor: bool = false) -> float:
	var total: float = izq + der
	if total <= 0.0:
		return 0.5
	return (der if menor_mejor else izq) / total



static func manda(izq: float, der: float, menor_mejor: bool = false) -> int:
	if is_equal_approx(izq, der) or izq <= 0.0 and der <= 0.0:
		return 0
	var gana_izq: bool = izq < der if menor_mejor else izq > der
	return -1 if gana_izq else 1







func arma(cfg: Dictionary, canto: Dictionary = {}) -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_horizontal = UiKit.es_horizontal()
	var lado: Vector2 = get_viewport_rect().size if size == Vector2.ZERO else size
	var al_lado: float = float(canto.get("lado", 0.0))
	var acento: Color = cfg.get("acento", CareerTheme.INK_LIGHT)
	var tinta: Color = cfg.get("tinta", acento)
	var filas: Array = cfg.get("filas", [])
	var lados: Array = cfg.get("lados", [])
	var bw: float
	if _horizontal:
		bw = minf(lado.x - al_lado * 2.0 - 80.0, ANCHO_H_MAX)
		_foto = FOTO_H
		_lado_y = LADO_Y_H
		_fila = FILA_H
		_barra_y = BARRA_Y_H
		_cifra_alto = CIFRA_ALTO_H
	else:
		bw = minf(lado.x - 48.0, ANCHO_V_MAX)
	var lado_alto: float = _foto.y + FOTO_MARCO * 2.0
	var filas_y: float = FILAS_Y_H if _horizontal else (LADO_Y + lado_alto + 22.0)
	var alto: float = maxf(filas_y + _fila * float(filas.size()), _lado_y + lado_alto) \
			+(PIE_H if _horizontal else PIE)
	var abajo: float =(ABAJO_H if _horizontal else ABAJO_V) + float(canto.get("abajo", 0.0))
	_todo_y = lado.y - abajo - TAB_ALTO - TAB_AIRE - alto
	_todo = RotuloTele._caja(self, Vector2((lado.x - bw) * 0.5, _todo_y),
		Vector2(bw, TAB_ALTO + TAB_AIRE + alto))
	_arma_tab(cfg, acento)
	_plato = RotuloTele._caja(_todo, Vector2(0.0, TAB_ALTO + TAB_AIRE), Vector2(bw, alto))
	var fondo: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_DEEP
	sb.bg_color.a = 0.92


	sb.border_color = acento
	sb.border_width_top = int(cfg.get("canto", 10))
	sb.set_corner_radius_all(int(cfg.get("radio", 0)))
	sb.corner_radius_top_left = 0
	fondo.add_theme_stylebox_override("panel", sb)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fondo.size = Vector2(bw, alto)
	_plato.add_child(fondo)


	var kx: float =(AIRE + LADO_H + AIRE) if _horizontal else AIRE
	var kick: Label = RotuloTele._rotulo(String(cfg.get("kicker", "")), CareerTheme.T_BODY,
		tinta, Vector2(kx, KICK_Y_H if _horizontal else KICK_Y),
		Vector2(bw - kx * 2.0, KICK_ALTO))
	kick.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_plato.add_child(kick)


	var nombre_w: float
	if _horizontal:
		nombre_w = LADO_H -(_foto.x + FOTO_MARCO * 2.0) - FOTO_HUECO
	else:
		nombre_w = bw * 0.5 - AIRE -(_foto.x + FOTO_MARCO * 2.0) - FOTO_HUECO \
				- VS_LADO * 0.5 - VS_HUECO
	for i in mini(lados.size(), 2):
		_arma_lado(lados[i] as Dictionary, i == 0, bw, nombre_w)
	if _horizontal:
		_arma_vs(acento, Vector2(bw * 0.5, 0.0), VS_LADO)
	else:
		_arma_vs(acento, Vector2(bw * 0.5, LADO_Y + lado_alto * 0.5), VS_LADO)

	var fx0: float = AIRE +(LADO_H + AIRE if _horizontal else 0.0)
	var fx1: float = bw - fx0
	for j in filas.size():
		_arma_fila(filas[j] as Dictionary, lados, fx0, fx1, filas_y + _fila * float(j))

	var recorte: Control = RotuloTele._caja(_plato, Vector2.ZERO, Vector2(bw, alto))
	recorte.clip_contents = true
	_cortina = ColorRect.new()
	_cortina.color = acento
	_cortina.size = Vector2(bw, alto)
	_cortina.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(_cortina)
	_brillo = TextureRect.new()
	_brillo.texture = RotuloTele._brillo_tex()
	_brillo.stretch_mode = TextureRect.STRETCH_SCALE
	_brillo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_brillo.size = Vector2(200.0, alto)
	_brillo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(_brillo)
	anima(-1.0)





func anima(s: float, queda: float = 99.0) -> void:
	if _todo == null:
		return
	visible = s >= 0.0 and queda > 0.0
	if not visible:
		return
	var ancho: float = _plato.size.x
	var tw: float = _tab.size.x
	_tab.position.x = lerpf(- tw * 1.15, 0.0, RotuloTele._sale(RotuloTele._tramo(s, T_TAB)))


	var dentro: bool = s >= T_CORTINA.y
	for c in _plato.get_children():
		if c != _cortina.get_parent():
			(c as CanvasItem).visible = dentro
	if s < T_CORTINA.y:
		_cortina.position.x = lerpf(- ancho * 1.01, 0.0,
			RotuloTele._suave(RotuloTele._tramo(s, T_CORTINA)))
	else:
		_cortina.position.x = lerpf(0.0, ancho * 1.01,
			RotuloTele._suave(RotuloTele._tramo(s, T_CORTINA_SALE)))

	for i in _fotos.size():
		var k: float = RotuloTele._rebote(RotuloTele._tramo(s, T_FOTO_TU if i == 0
			else T_FOTO_EL))
		_fotos[i].position.y = _foto_y + FOTO_SUBE *(1.0 - k)

	var kn: float = RotuloTele._sale(RotuloTele._tramo(s, T_NOMBRES))
	for i in _nombres.size():
		var desde: float = -40.0 if i == 0 else 40.0
		_nombres[i].position.x = _nombre_x[i] + desde *(1.0 - kn)
		_nombres[i].modulate.a = kn

	if _vs != null:
		var kv: float = RotuloTele._rebote(RotuloTele._tramo(s, T_VS), 2.4)
		_vs.scale = Vector2(kv, kv)
		_vs.rotation = deg_to_rad(-20.0) *(1.0 - clampf(kv, 0.0, 1.0))

	var km: float = RotuloTele._sale(RotuloTele._tramo(s, T_MEDALLAS))
	for m in _medallas:
		m.position.y = _medalla_y + 12.0 *(1.0 - km)
		m.modulate.a = km


	for j in _filas.size():
		var f: Dictionary = _filas[j]
		var a0: float = T_FILA.x + T_FILA_PASO * float(j)
		var tramo: Vector2 = Vector2(a0, a0 + T_FILA.y - T_FILA.x)
		var kf: float = RotuloTele._sale(RotuloTele._tramo(s, tramo))
		(f["rot"] as Control).modulate.a = kf
		for lado in ["izq", "der"]:
			var l: Label = f[lado]
			l.modulate.a = minf(kf * 3.0, 1.0)
			var v: float = float(f["vi" if lado == "izq" else "vd"])


			if bool(f["cuenta"]) and s < tramo.y:
				v *= kf
			l.text = _cifra(v, bool(f["dec"]), String(f["pre"]))
		var ra: ColorRect = f["a"]
		var rb: ColorRect = f["b"]
		ra.size.x = float(f["w_a"]) * kf
		rb.size.x = float(f["w_b"]) * kf
		rb.position.x = float(f["x1"]) - rb.size.x
	_brillo.position.x = lerpf(- _brillo.size.x - 20.0, ancho + 20.0,
		RotuloTele._suave(RotuloTele._tramo(s, T_BRILLO)))

	var ks: float = RotuloTele._entra(1.0 - clampf(queda / SALIDA, 0.0, 1.0))
	_todo.position.y = _todo_y + ks * 160.0
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




func _arma_lado(ld: Dictionary, izq: bool, bw: float, nombre_w: float) -> void:
	var color: Color = ld.get("color", CareerTheme.INK_LIGHT)
	var marco_l: Vector2 = _foto + Vector2.ONE * FOTO_MARCO * 2.0
	var fx: float = AIRE if izq else bw - AIRE - marco_l.x


	var recorte: Control = RotuloTele._caja(_plato, Vector2(fx, 0.0),
		Vector2(marco_l.x, _lado_y + marco_l.y))
	recorte.clip_contents = true
	var marco: PanelContainer = PanelContainer.new()
	var msb: StyleBoxFlat = StyleBoxFlat.new()
	msb.bg_color = color.darkened(0.58)
	msb.set_border_width_all(int(FOTO_MARCO))
	msb.border_color = color
	marco.add_theme_stylebox_override("panel", msb)
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	recorte.add_child(marco)
	var look: Dictionary = ld.get("look", {})
	if not look.is_empty():
		var av: PlayerAvatar = PlayerAvatar.new()
		av.chrome = false
		av.bust = PlayerAvatar.BUST_CLOSE
		av.custom_minimum_size = _foto
		av.mouse_filter = Control.MOUSE_FILTER_IGNORE
		av.club = ld.get("club", {})
		marco.add_child(av)
		av.set_look(look)
	marco.size = marco_l
	_foto_y = _lado_y
	marco.position = Vector2(0.0, _lado_y + FOTO_SUBE)
	_fotos.append(marco)

	var nx: float =(fx + marco_l.x + FOTO_HUECO) if izq else (fx - FOTO_HUECO - nombre_w)
	var nom: Label = RotuloTele._rotulo(String(ld.get("nombre", "")),
		CareerTheme.T_HUD_ROTULO, CareerTheme.INK_LIGHT, Vector2(nx, _lado_y + 14.0),
		Vector2(nombre_w, NOMBRE_ALTO))
	nom.horizontal_alignment = HORIZONTAL_ALIGNMENT_LEFT if izq \
			else HORIZONTAL_ALIGNMENT_RIGHT
	_plato.add_child(nom)
	_nombres.append(nom)
	_nombre_x.append(nx)

	var raya: ColorRect = ColorRect.new()
	raya.color = color
	raya.size = Vector2(56.0, 6.0)
	raya.position = Vector2(0.0 if izq else nombre_w - raya.size.x, NOMBRE_ALTO + 2.0)
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	nom.add_child(raya)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_BEGIN if izq else BoxContainer.ALIGNMENT_END
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if izq:
		_medalla_de(fila, int(ld.get("ovr", 0)))
		_chip_de(fila, String(ld.get("pos", "")))
	else:
		_chip_de(fila, String(ld.get("pos", "")))
		_medalla_de(fila, int(ld.get("ovr", 0)))
	_plato.add_child(fila)
	_medalla_y = _lado_y + 14.0 + NOMBRE_ALTO + 22.0
	fila.position = Vector2(nx, _medalla_y)
	fila.size = Vector2(nombre_w, MEDALLA_ALTO)
	_medallas.append(fila)


func _medalla_de(fila: HBoxContainer, ovr: int) -> void:

	if ovr <= 0:
		return
	var b: OvrBadge = OvrBadge.new()
	b.setup(ovr, MEDALLA_NUM)
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(b)


func _chip_de(fila: HBoxContainer, pos: String) -> void:
	if pos.is_empty():
		return
	var c: PanelContainer = CareerUi.pos_chip(pos)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(c)



func _arma_vs(acento: Color, centro: Vector2, lado: float) -> void:
	var vs: Panel = Panel.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.HUD_SURFACE
	sb.border_color = acento
	sb.set_border_width_all(VS_CANTO)
	sb.set_corner_radius_all(int(lado * 0.5))
	vs.add_theme_stylebox_override("panel", sb)
	vs.size = Vector2(lado, lado)
	vs.pivot_offset = vs.size * 0.5
	vs.position = centro - vs.size * 0.5
	vs.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(vs)
	var l: Label = CareerUi.plain(CareerTheme.T_HUD_VS, CareerTheme.INK_LIGHT)
	l.text = I18n.t("VS")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size = vs.size
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	vs.add_child(l)
	_vs = vs





func _arma_fila(f: Dictionary, lados: Array, x0: float, x1: float, y: float) -> void:
	var vi: float = float(f.get("izq", 0.0))
	var vd: float = float(f.get("der", 0.0))
	var menor: bool = bool(f.get("menor_mejor", false))
	var gana: int = manda(vi, vd, menor)
	var w: float = x1 - x0
	var izq: Label = RotuloTele._rotulo("", CareerTheme.T_HUD_ROTULO,
		CareerTheme.MUTED if gana == 1 else CareerTheme.INK_LIGHT, Vector2(x0, y),
		Vector2(CIFRA_ANCHO, _cifra_alto))
	_plato.add_child(izq)
	var der: Label = RotuloTele._rotulo("", CareerTheme.T_HUD_ROTULO,
		CareerTheme.MUTED if gana == -1 else CareerTheme.INK_LIGHT,
		Vector2(x1 - CIFRA_ANCHO, y), Vector2(CIFRA_ANCHO, _cifra_alto))
	der.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	_plato.add_child(der)

	var rot: HBoxContainer = HBoxContainer.new()
	rot.alignment = BoxContainer.ALIGNMENT_CENTER
	rot.add_theme_constant_override("separation", 8)
	rot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(String(f.get("icono", "stats")), CareerTheme.MUTED)
	ic.custom_minimum_size = Vector2(ICONO, ICONO)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rot.add_child(ic)
	var rl: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.MUTED)
	rl.text = String(f.get("rotulo", ""))
	rl.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	rl.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rot.add_child(rl)
	_plato.add_child(rot)
	rot.position = Vector2(x0 + CIFRA_ANCHO, y)
	rot.size = Vector2(w - CIFRA_ANCHO * 2.0, _cifra_alto)


	var carril: ColorRect = ColorRect.new()
	carril.color = CareerUi.TRACK_BG
	carril.position = Vector2(x0, y + _barra_y)
	carril.size = Vector2(w, BARRA)
	carril.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(carril)
	var parte: float = reparto(vi, vd, menor)
	var ci: Color =(lados[0] as Dictionary).get("color", CareerTheme.NAV_YO) \
			if lados.size() > 0 else CareerTheme.NAV_YO
	var cd: Color =(lados[1] as Dictionary).get("color", CareerTheme.INK_LIGHT) \
			if lados.size() > 1 else CareerTheme.INK_LIGHT
	var a: ColorRect = ColorRect.new()
	a.color = ci
	a.position = Vector2(x0, y + _barra_y)
	a.size = Vector2(0.0, BARRA)
	a.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(a)
	var b: ColorRect = ColorRect.new()
	b.color = cd
	b.position = Vector2(x1, y + _barra_y)
	b.size = Vector2(0.0, BARRA)
	b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_plato.add_child(b)
	_filas.append({"izq": izq, "der": der, "rot": rot, "a": a, "b": b,
		"w_a": maxf(w * parte - BARRA_HUECO * 0.5, 0.0),
		"w_b": maxf(w *(1.0 - parte) - BARRA_HUECO * 0.5, 0.0), "x1": x1,
		"vi": vi, "vd": vd, "dec": bool(f.get("decimales", false)),
		"cuenta": bool(f.get("cuenta", true)), "pre": String(f.get("prefijo", ""))})




static func _cifra(v: float, decimales: bool, prefijo: String) -> String:
	if not prefijo.is_empty() and v <= 0.0:
		return "–"
	return prefijo + RotuloTele._num(v, decimales)
