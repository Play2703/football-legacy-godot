extends Control
























signal hecha(toma: Dictionary)

const SelfieCamara := preload("res://ui/ceremonies/selfie_camara.gd")



const VEL_STICK: float = 1.6
const MUERTA_STICK: float = 0.2


const AUTO_DISPARA: float = 1.5
const TOMA_AUTO: float = 1.2

const TOMA_SOLA: float = 6.0


const TUMBADO: Dictionary = {"movil": Vector2(520, 920), "radio": 44, "canto": 6,
	"visor": Rect2(12, 84, 484, 645), "reloj": 28, "tira": Vector2(28, 26), "barra": 400.0,
	"barra_h": 14.0, "estrella": 48, "estrellas_y": 764.0, "inicio": Rect2(194, 872, 120, 8),
	"boton": Vector2(380, 120), "iconos": 40}
const RETRATO: Dictionary = {"movil": Vector2(774, 1230), "radio": 60, "canto": 6,
	"visor": Rect2(18, 120, 726, 968), "reloj": 40, "tira": Vector2(40, 44), "barra": 600.0,
	"barra_h": 20.0, "estrella": 64, "estrellas_y": 1104.0, "inicio": Rect2(291, 1192, 180, 10),
	"boton": Vector2(560, 120), "iconos": 48}
const POLAROID: Vector2 = Vector2(476, 724)
const POLAROID_MARCO: float = 28.0
const POLAROID_FOTO: Vector2 = Vector2(420, 560)
const POLAROID_ESTRELLA: int = 56

const MARGEN: float = 40.0

var motor: SelfieMotor = null
var camara: SelfieCamara = null
var toma: Dictionary = {}
var cerrado: bool = false

var _m: Dictionary = TUMBADO
var _n: int = 0
var _auto: bool = false
var _auto_fallo: float = 0.0
var _t: float = 0.0
var _t_toma: float = -1.0

var _col: VBoxContainer = null
var _pista: PanelContainer = null
var _movil: Panel = null
var _visor: Control = null
var _img: TextureRect = null
var _aros: Control = null
var _tiempo: ColorRect = null
var _estrellas: Array[MenuIcon] = []
var _camaras: Array[MenuIcon] = []
var _foto: Button = null
var _polaroid: Panel = null
var _continuar: Button = null



func monta(cam: SelfieCamara, mot: SelfieMotor, n: int) -> void:
	camara = cam
	motor = mot
	_n = clampi(n, 0, SelfieMotor.N_SELFIES - 1)
	_m = TUMBADO if UiKit.es_horizontal() else RETRATO
	_arma()
	resized.connect(_coloca)
	_coloca()
	_pinta_visor()
	if Entrada.modo == Entrada.Modo.MANDO:
		_foto.grab_focus.call_deferred()




func sola(fallo: float = 0.0) -> void:
	_auto = true
	_auto_fallo = clampf(fallo, 0.0, 1.0)


func _arma() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	add_to_group(Entrada.CAPA_GROUP)
	gui_input.connect(_on_input)
	var velo: ColorRect = ColorRect.new()
	var c_velo: Color = CareerTheme.MODAL_SCRIM
	c_velo.a = 0.62
	velo.color = c_velo
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(velo)
	_arma_columna()
	_arma_movil()
	_foto = CareerUi.accion("camera", I18n.t("FOTO"), CareerTheme.NAV_GENTE, true)
	_foto.size_flags_horizontal = Control.SIZE_FILL
	_foto.set_meta(Entrada.PRIMERO_META, true)
	_foto.pressed.connect(_dispara)
	add_child(_foto)
	CareerUi.normalize_caps(self)



func _arma_columna() -> void:
	_col = VBoxContainer.new()
	_col.add_theme_constant_override("separation", 22)
	_col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_col)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 28)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_col.add_child(fila)
	var tit: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	tit.text = I18n.t("SELFIE")
	tit.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(tit)

	var iconos: HBoxContainer = HBoxContainer.new()
	iconos.add_theme_constant_override("separation", 14)
	iconos.alignment = BoxContainer.ALIGNMENT_CENTER
	iconos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(iconos)
	for k in SelfieMotor.N_SELFIES:
		var ic: MenuIcon = _icono("camera", float(_m["iconos"]))
		ic.color = CareerTheme.NAV_GENTE if k <= _n else _apagado()
		iconos.add_child(ic)
		_camaras.append(ic)
	var sub: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM)
	sub.text = I18n.t("ENCUADRA Y DISPARA")
	sub.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_col.add_child(sub)
	_pista = CareerUi.chip()
	_pista.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	_pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pista.add_child(h)
	var pad: bool = Entrada.pad_juega()
	h.add_child(_icono("stick" if pad else "mover", 34.0, CareerTheme.NAV_GENTE))
	var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	l.text = I18n.t("MUEVE" if pad else "ARRASTRA")
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	h.add_child(l)
	add_child(_pista)



func _arma_movil() -> void:
	_movil = Panel.new()
	_movil.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_movil.size = _m["movil"]
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.CELULAR_RIEL
	sb.border_color = CareerTheme.CELULAR_CANTO
	sb.set_border_width_all(int(_m["canto"]))
	sb.set_corner_radius_all(int(_m["radio"]))
	sb.shadow_color = CareerTheme.BG_DEEP
	sb.shadow_size = 0
	sb.shadow_offset = Vector2(0, 14)
	_movil.add_theme_stylebox_override("panel", sb)
	add_child(_movil)
	var tira: HBoxContainer = HBoxContainer.new()
	tira.position = _m["tira"]
	tira.add_theme_constant_override("separation", 12)
	tira.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_movil.add_child(tira)
	tira.add_child(_icono("reloj", float(_m["reloj"]), CareerTheme.TEXT))
	var carril: VBoxContainer = VBoxContainer.new()
	carril.custom_minimum_size = Vector2(float(_m["barra"]), float(_m["reloj"]))
	carril.alignment = BoxContainer.ALIGNMENT_CENTER
	carril.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tira.add_child(carril)
	_tiempo = CareerUi.bar(carril, CareerTheme.NAV_GENTE, float(_m["barra_h"]))
	_tiempo.anchor_right = 1.0


	var vr: Rect2 = _m["visor"]
	_visor = Control.new()
	_visor.position = vr.position
	_visor.size = vr.size
	_visor.clip_contents = true
	_visor.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_movil.add_child(_visor)
	var fondo: ColorRect = ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
	fondo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_visor.add_child(fondo)
	_img = TextureRect.new()
	_img.texture = camara.textura() if camara != null else null
	_img.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	_img.stretch_mode = TextureRect.STRETCH_SCALE
	_img.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_img.size = Vector2(SelfieCamara.RENDER) * _s_visor()
	_img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_visor.add_child(_img)
	_aros = Control.new()
	_aros.set_anchors_preset(Control.PRESET_FULL_RECT)
	_aros.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_aros.draw.connect(_pinta_aros)
	_visor.add_child(_aros)
	var est: HBoxContainer = HBoxContainer.new()
	est.add_theme_constant_override("separation", 18)
	est.alignment = BoxContainer.ALIGNMENT_CENTER
	est.position = Vector2(0.0, float(_m["estrellas_y"]))
	est.size = Vector2((_m["movil"] as Vector2).x, float(_m["estrella"]))
	est.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_movil.add_child(est)
	for k in 3:
		var ic: MenuIcon = _icono("media", float(_m["estrella"]))
		est.add_child(ic)
		_estrellas.append(ic)
	var ini: Rect2 = _m["inicio"]
	var barra: Panel = Panel.new()
	var sbi: StyleBoxFlat = StyleBoxFlat.new()
	sbi.bg_color = CareerTheme.CELULAR_CANTO
	sbi.set_corner_radius_all(int(ini.size.y * 0.5))
	barra.add_theme_stylebox_override("panel", sbi)
	barra.position = ini.position
	barra.size = ini.size
	barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_movil.add_child(barra)


func _icono(tipo: String, lado: float, col: Color = CareerTheme.TEXT) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(tipo, col)
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic



static func _apagado() -> Color:
	var c: Color = CareerTheme.TEXT
	c.a = 0.22
	return c




func _s_visor() -> float:
	return (_m["visor"] as Rect2).size.x / float(SelfieCamara.FOTO.size.x)




func _coloca() -> void:
	var vp: Viewport = get_viewport()
	if vp == null:
		return
	var r: Rect2 = SceneFade.rect_visible(self)
	var arriba: float = UiKit.top_safe_inset(vp)
	var abajo: float = UiKit.bottom_safe_inset(vp)
	var lado: float = UiKit.side_safe_inset(vp)
	var movil: Vector2 = _m["movil"]
	var boton: Vector2 = _m["boton"]
	var izq: float = r.position.x + lado + MARGEN
	var der: float = r.end.x - lado - MARGEN
	if _m == TUMBADO:
		var alto: float = r.size.y - arriba - abajo - MARGEN
		var k: float = minf(1.0, alto / movil.y)
		_movil.scale = Vector2(k, k)
		_movil.position = Vector2(r.position.x +(r.size.x - movil.x * k) * 0.5,
			r.position.y + arriba +(alto + MARGEN - movil.y * k) * 0.5)
		_col.position = Vector2(izq, r.position.y + arriba + 52.0)
		_col.size = Vector2(maxf(_movil.position.x - izq - MARGEN, 200.0), 0.0)
		_pista.position = Vector2(izq, r.position.y + r.size.y * 0.55)
		_foto.custom_minimum_size = boton
		_foto.size = boton
		_foto.position = Vector2(der - boton.x, r.end.y - abajo - 18.0 - boton.y)
	else:
		_col.position = Vector2(izq, r.position.y + arriba + 18.0)
		_col.size = Vector2(der - izq, 0.0)
		_foto.custom_minimum_size = Vector2(minf(boton.x, der - izq), boton.y)
		_foto.size = _foto.custom_minimum_size
		_foto.position = Vector2(r.position.x +(r.size.x - _foto.size.x) * 0.5,
			r.end.y - abajo - 18.0 - boton.y)
		var pista_y: float = _foto.position.y - 36.0 - 64.0
		_pista.position = Vector2(r.position.x +(r.size.x - _pista.get_combined_minimum_size().x) * 0.5,
			pista_y)
		var techo: float = r.position.y + arriba + 150.0
		var hueco: float = pista_y - 30.0 - techo
		var k2: float = minf(1.0, minf(hueco / movil.y,(der - izq) / movil.x))
		_movil.scale = Vector2(k2, k2)
		_movil.position = Vector2(r.position.x +(r.size.x - movil.x * k2) * 0.5,
			techo +(hueco - movil.y * k2) * 0.5)
	if _polaroid != null:
		_coloca_polaroid()
	if _continuar != null:



		var w: float = minf(maxf(_foto.size.x, _ancho_rotulo(_continuar)), der - izq)
		_continuar.custom_minimum_size = Vector2(w, _foto.size.y)
		_continuar.size = _continuar.custom_minimum_size
		_continuar.position = Vector2(_foto.position.x +(_foto.size.x - w) *(1.0 if _m == TUMBADO else 0.5),
			_foto.position.y)




static func _ancho_rotulo(b: Button) -> float:
	var fuente: Font = b.get_theme_font("font")
	var sb: StyleBox = b.get_theme_stylebox("normal")
	var texto: float = fuente.get_string_size(b.text, HORIZONTAL_ALIGNMENT_LEFT, -1.0,
		b.get_theme_font_size("font_size")).x if fuente != null else 0.0
	return texto +(sb.get_minimum_size().x if sb != null else 0.0) + 24.0





func tick(delta: float) -> void:
	if cerrado or motor == null:
		return
	_t += delta
	if not motor.disparada:
		if _auto:


			motor.correccion = - motor.deriva(motor.reloj + delta) *(1.0 - _auto_fallo)
		elif Entrada.modo != Entrada.Modo.TACTIL:
			var st: Vector2 = Entrada.eje_pad(true)
			if st.length() > MUERTA_STICK:
				motor.corrige(- st * VEL_STICK * delta)
		if motor.tick(delta):
			_revela()
		elif _auto and _t >= AUTO_DISPARA:
			_dispara()
		_pinta_visor()
	elif _t_toma >= 0.0 and _t - _t_toma >=(TOMA_AUTO if _auto else TOMA_SOLA):
		_cierra()


func _on_input(ev: InputEvent) -> void:
	if cerrado or _auto or motor == null or motor.disparada:
		return


	if Entrada.modo == Entrada.Modo.MANDO:
		return
	if ev is InputEventMouseMotion:
		var mm: InputEventMouseMotion = ev
		if (mm.button_mask&MOUSE_BUTTON_MASK_LEFT) == 0:
			return


		var s: float = SelfieCamara.GUIA_TEX * _s_visor() * _movil.scale.x
		motor.corrige(- mm.relative / maxf(s, 0.01))
		accept_event()


func _dispara() -> void:
	if cerrado or motor == null or motor.disparada:
		return
	motor.dispara()
	_revela()




func _revela() -> void:
	var enc: Vector2 = motor.encuadre()
	toma = motor.toma.duplicate()
	toma["img"] = camara.foto(enc, bool(toma.get("movida", false))) if camara != null \
			else null
	toma["cara"] = camara.cara_en_foto(enc) if camara != null else Vector2(0.3, 0.35)
	_t_toma = _t
	_movil.visible = false
	_pista.visible = false
	_foto.visible = false
	_arma_polaroid()
	_continuar = CareerUi.primary_cta(I18n.t("CONTINUAR"), _cierra)
	_continuar.size_flags_horizontal = Control.SIZE_FILL
	_continuar.set_meta(Entrada.PRIMERO_META, true)
	add_child(_continuar)
	CareerUi.normalize_caps(_continuar)
	_coloca()
	if Entrada.modo == Entrada.Modo.MANDO:
		_continuar.grab_focus.call_deferred()


func _arma_polaroid() -> void:
	_polaroid = Panel.new()
	_polaroid.size = POLAROID
	_polaroid.pivot_offset = POLAROID * 0.5
	_polaroid.rotation_degrees = -2.0
	_polaroid.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.TEXT
	sb.set_corner_radius_all(4)
	sb.shadow_color = CareerTheme.BG_DEEP
	sb.shadow_offset = Vector2(0, 14)
	sb.shadow_size = 1
	_polaroid.add_theme_stylebox_override("panel", sb)
	add_child(_polaroid)
	var foto: TextureRect = TextureRect.new()
	var img: Image = toma.get("img") as Image
	if img != null and not img.is_empty():
		foto.texture = ImageTexture.create_from_image(img)
	foto.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	foto.stretch_mode = TextureRect.STRETCH_SCALE
	foto.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	foto.position = Vector2(POLAROID_MARCO, POLAROID_MARCO)
	foto.size = POLAROID_FOTO
	foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_polaroid.add_child(foto)
	var est: HBoxContainer = HBoxContainer.new()
	est.add_theme_constant_override("separation", 20)
	est.alignment = BoxContainer.ALIGNMENT_CENTER
	est.position = Vector2(0.0, POLAROID_MARCO + POLAROID_FOTO.y + 34.0)
	est.size = Vector2(POLAROID.x, float(POLAROID_ESTRELLA))
	est.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_polaroid.add_child(est)
	var n: int = int(toma.get("estrellas", 1))
	for k in 3:
		est.add_child(_icono("media", float(POLAROID_ESTRELLA),
			CareerTheme.NAV_GENTE if k < n else _apagado_marfil()))

	if bool(toma.get("movida", false)):
		var sello: PanelContainer = PanelContainer.new()
		var sbs: StyleBoxFlat = StyleBoxFlat.new()
		sbs.bg_color = CareerTheme.TEXT
		sbs.border_color = CareerTheme.DANGER
		sbs.set_border_width_all(4)
		sbs.set_corner_radius_all(3)
		sbs.content_margin_left = 18.0
		sbs.content_margin_right = 18.0
		sbs.content_margin_top = 10.0
		sbs.content_margin_bottom = 10.0
		sello.add_theme_stylebox_override("panel", sbs)
		sello.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.DANGER)
		l.text = I18n.t("MOVIDA")
		sello.add_child(l)
		sello.position = Vector2(POLAROID.x * 0.5, 30.0)
		sello.rotation_degrees = 10.0
		_polaroid.add_child(sello)
		CareerUi.normalize_caps(sello)



static func _apagado_marfil() -> Color:
	var c: Color = CareerTheme.BG_DEEP
	c.a = 0.18
	return c



func _coloca_polaroid() -> void:
	var movil: Vector2 =(_m["movil"] as Vector2) * _movil.scale.x
	var k: float = minf(movil.y * 0.84 / POLAROID.y, 1.5)
	_polaroid.scale = Vector2(k, k)
	_polaroid.position = _movil.position +(movil - POLAROID) * 0.5


func _cierra() -> void:
	if cerrado:
		return
	cerrado = true
	hecha.emit(toma)




func _pinta_visor() -> void:
	if motor == null or _img == null:
		return
	var enc: Vector2 = motor.encuadre()
	var s: float = _s_visor()
	var o: Vector2 = camara.origen(enc) if camara != null else Vector2(SelfieCamara.FOTO.position)
	_img.position = - o * s
	_img.pivot_offset =(o + Vector2(SelfieCamara.FOTO.size) * 0.5) * s
	_img.rotation_degrees = SelfieCamara.giro(enc)
	_tiempo.anchor_right = motor.tiempo_restante() / SelfieMotor.TIEMPO
	var n: int = motor.estrellas_ahora()
	for k in _estrellas.size():
		_estrellas[k].color = CareerTheme.NAV_GENTE if k < n else _apagado()
	_aros.queue_redraw()




func _pinta_aros() -> void:
	if camara == null or motor == null:
		return
	var s: float = _s_visor()
	var r: float = SelfieMotor.BUENA * SelfieCamara.GUIA_TEX * s
	var dentro: bool = motor.encuadre().length() <= SelfieMotor.BUENA
	var tinta: Color = CareerTheme.TEXT
	tinta.a = 0.8
	for cara in camara.caras:
		var c: Vector2 =(cara - Vector2(SelfieCamara.FOTO.position)) * s
		if dentro:
			_aros.draw_arc(c, r, 0.0, TAU, 64, CareerTheme.NAV_GENTE, 4.0 * s / 1.6, true)
		else:
			var trozos: int = 16
			for j in trozos:
				var a0: float = TAU * float(j) / float(trozos)
				_aros.draw_arc(c, r, a0, a0 + TAU / float(trozos) * 0.55, 8, tinta,
					3.0 * s / 1.6, true)
