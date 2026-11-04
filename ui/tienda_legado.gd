extends Control
























































const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")


const RESPLANDOR = preload("res://ui/legado_resplandor.gd")


const FOTO_LADO: float = 92.0


const FOTO_HEROE: float = 512.0

const ESCENARIO_MIN: float = 560.0



const X2_ESCALA: float = 2.6
const X2_GIRO: float = -6.0


const X2_CUELGA: float = 0.7


const SELLO_GIRO: float = -12.0






const HEROES: Dictionary = {
	"doble_paga": {
		"baldosas": [["SUELDO", "contrato"], ["PRIMA", "gol"], ["PATROCINIO", "patrocinador"]],
		"cta": "COBRA ×2",
		"activa": "Activa: cobras el doble en cada partido y en cada cierre.",
	},
	"doble_xp": {
		"baldosas": [["PARTIDO", "partido"], ["SELECCIÓN", "seleccion"], ["HITOS", "laurel"]],
		"cta": "GANA XP ×2",
		"activa": "Activa: ganas el doble de XP en cada partido.",
	},
	"pack_leyenda": {
		"baldosas": [["PAGA", "moneda"], ["XP", "media"]],
		"cta": "LOS DOS ×2",
		"activa": "Activa: cobras el doble y ganas el doble de XP en cada partido.",
	},
	"cuarta_ranura": {
		"marca": "+1",
		"baldosas": [["RANURA", "otra", "+1"], ["A LA VEZ", "perfil", "4"]],
		"promesa": [],
		"cta": "ABRE LA CUARTA",
		"activa": "Activa: tu portada tiene cuatro ranuras.",
	},
}

const FOTO_PESTANA: float = 72.0
const PESTANA_H: float = 92.0

const CONFETI: int = 22

const FLOTA: float = 10.0
const FLOTA_S: float = 1.6




const ENTRA_T0: float = 0.1
const ENTRA_X2: float = 0.4
const ESTAMPA_S: float = 0.16
const ENTRA_CTA: float = ENTRA_X2 + ESTAMPA_S + 0.36

var _sel: String = ""
var _scroll: ScrollContainer = null
var _body: VBoxContainer = null
var _saldo_l: Label = null



var _saldo_val: int = -1
var _saldo_tw: Tween = null

var _pintada: bool = false


var _mias_antes: Array = []
var _recien: Array = []
var _origen_l: Label = null
var _dock: VBoxContainer = null

var _caja_esperando: String = ""
var _caja_timer: Timer = null




var _heroe: VBoxContainer = null
var _escenario: Control = null
var _resplandor: RESPLANDOR = null
var _producto: TextureRect = null

var _producto_base: Vector2 = Vector2.ZERO
var _flota: float = 0.0


var _x2_caja: Control = null
var _x2: Label = null
var _sello: PanelContainer = null
var _nombre: Label = null
var _baldosas: HBoxContainer = null

var _baldosas_x2: Array[Label] = []
var _promesas: HFlowContainer = null
var _unico: Control = null
var _estado: Label = null
var _confeti: Array[ColorRect] = []
var _heroe_tw: Tween = null
var _flota_tw: Tween = null

var _cta_entra: bool = false


var _ver: String = ""
var _heroe_id: String = ""


var _heroe_n: int = 0


var _acento: Color = Color.WHITE

var _marca: String = "×2"


func _ready() -> void:
	Telemetry.count("herencia_abierta")
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())
	Herencia.cambio.connect(_refresh)

	Store.intento_listo.connect(_on_intento)
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 12)
	CareerUi.apply_safe_area(root, get_viewport())
	add_child(root)


	var top: HBoxContainer = HBoxContainer.new()
	top.add_theme_constant_override("separation", 16)
	root.add_child(top)
	var title: Label = Label.new()
	CareerTheme.title(title, CareerTheme.T_TITLE)


	title.text = I18n.t("TIENDA")

	title.add_theme_color_override("font_color", CareerTheme.MONEY)
	title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	title.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	title.clip_text = true
	top.add_child(title)



	if Iap.LEGADO_VENDE_HERENCIA:
		var chip: PanelContainer = CareerUi.chip()
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		top.add_child(chip)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 8)
		chip.add_child(fila)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(28, 28)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup("vitrina", CareerTheme.MONEY)
		fila.add_child(ic)
		_saldo_l = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.MONEY)
		_saldo_l.clip_text = true


		_saldo_l.custom_minimum_size = Vector2(120, 0)
		fila.add_child(_saldo_l)


		_origen_l = CareerUi.dim(root, "")
		_origen_l.clip_text = true







	if Iap.LEGADO_VENDE_HERENCIA:
		_letrero(root)

	_scroll = DragScroll.new()
	_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(_scroll)
	_body = VBoxContainer.new()
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	_body.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_body.add_theme_constant_override("separation", 10)
	_scroll.add_child(_body)

	_dock = VBoxContainer.new()
	_dock.add_theme_constant_override("separation", 8)
	root.add_child(_dock)











	if Store.se_puede_restaurar():


		var rest: Button = CareerUi.accion("girar", I18n.t("RESTAURAR COMPRAS"),
			UiKit.BTN_BLUE["bg"] as Color)
		rest.custom_minimum_size = Vector2(0, 56)
		rest.pressed.connect(_restaurar_compras.bind(rest))
		root.add_child(rest)
	CareerUi.back_button(root, _go_back)
	_refresh()



func _letrero(root: VBoxContainer) -> void:
	var aviso: PanelContainer = CareerUi.plate()
	aviso.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.MONEY))
	root.add_child(aviso)




	var aviso_col: VBoxContainer = VBoxContainer.new()
	aviso_col.add_theme_constant_override("separation", 8)
	aviso.add_child(aviso_col)
	var aviso_fila: HBoxContainer = HBoxContainer.new()
	aviso_fila.add_theme_constant_override("separation", 14)
	aviso_col.add_child(aviso_fila)
	aviso_fila.add_child(CareerUi.tint_tag({"text": I18n.t("PARA SIEMPRE"),
		"fill": CareerTheme.MONEY, "ink": CareerTheme.on_color(CareerTheme.MONEY)}))
	var aviso_l: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	aviso_l.text = I18n.t("Vale en TODAS tus carreras, las de hoy y las que empieces.")
	aviso_l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	aviso_l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	aviso_fila.add_child(aviso_l)


	var aviso_d: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	aviso_d.text = I18n.t("Al empezar una carrera las eliges en el paso TUS VENTAJAS.")
	aviso_d.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	aviso_col.add_child(aviso_d)
	CareerTheme.rule(root)


func _refresh() -> void:
	if _body == null or not is_instance_valid(_body):
		return




	var primera: bool = not _pintada
	_pintada = true
	if _saldo_l != null:
		_anima_saldo(Herencia.disponibles())


	var mias: Array = []
	for p in Herencia.PACKS:
		if Herencia.tiene(String(p["id"])):
			mias.append(String(p["id"]))
	for d in [Iap.DERECHO_VENTAJAS] + Iap.DERECHOS_LEGADO:
		if Store.tiene_derecho(String(d["id"])):
			mias.append("caja:" + String(d["pid"]))
	_recien = []
	if not primera:
		for id in mias:
			if not _mias_antes.has(id):
				_recien.append(id)
	_mias_antes = mias


	if _origen_l != null:
		var de_retiros: int = Herencia.ganadas() - Herencia.ganadas_por_logros() - Herencia.compradas_estrellas()
		if Herencia.compradas_estrellas() > 0:
			_origen_l.text = I18n.tf("Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} compradas · {3} gastadas",
				[Herencia.ganadas_por_logros(), de_retiros, Herencia.compradas_estrellas(), Herencia.gastadas()])
		else:
			_origen_l.text = I18n.tf("Se ganan con cada logro y con cada retiro: {0} de logros · {1} de retiros · {2} gastadas",
				[Herencia.ganadas_por_logros(), de_retiros, Herencia.gastadas()])

	for old in _body.get_children():
		if old != _heroe:
			old.queue_free()
	var hay: bool = false
	if Iap.LEGADO_VENDE_HERENCIA:
		for d in a_la_vista():
			hay = _pinta_derecho(d) or hay
		_pinta_packs()
	else:
		hay = _pinta_heroe()
		_pinta_lo_de_antes()



		if not hay:
			var l: Label = CareerUi.dim(_body, Store.texto_no_responde())
			l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_pinta_dock()











func _pinta_derecho(d: Dictionary) -> bool:
	var id: String = String(d["id"])
	var pid: String = String(d["pid"])
	var tuya: bool = Store.tiene_derecho(id)
	if not tuya and not Store.derecho_disponible(d):
		return false
	var h: Dictionary = HEROES.get(id, {})
	var chips: Array = []
	for b in baldosas_de(d):
		chips.append(CareerUi.label_chip(I18n.t(String(b[0])), String(b[2]), acento_de(id)))
	var spec: Dictionary = {
		"icon_ctrl": ShopPhoto.rect(self, String(d["id"]), FOTO_LADO), "icon_lado": FOTO_LADO,
		"title": I18n.t(String(d["name"])),
		"line": I18n.t(String(d["desc"])),
		"chips": chips,
	}
	if tuya:
		spec["tag"] = {"text": I18n.t("TUYA"), "ink": CareerTheme.TEXT, "outline": true}
		spec["state"] = I18n.t(String(h.get("activa", "")))
	else:
		spec["price_ctrl"] = _boton_precio(Store.precio_de(pid), I18n.t("DINERO REAL"),
			CareerTheme.MONEY, "caja:" + pid)
	_body.add_child(_ficha(spec, "caja:" + pid, not tuya))
	return true










func _pinta_heroe() -> bool:
	var vista: Array = a_la_vista()
	if vista.is_empty():
		_quita_heroe()
		return false
	var d: Dictionary = {}
	for v in vista:
		if String(v["id"]) == _ver:
			d = v
	if d.is_empty():
		d = vista[0]
		for v in vista:
			if not Store.tiene_derecho(String(v["id"])):
				d = v
				break
		_ver = String(d["id"])
	if _heroe_id != _ver:
		_quita_heroe()
	if _heroe == null or not is_instance_valid(_heroe):
		_crea_heroe(d)
		_cta_entra = true
		if not Settings.reduce_motion:
			_heroe_entrada()
	_body.move_child(_heroe, 0)
	if vista.size() > 1:



		var tabs: VBoxContainer = VBoxContainer.new()
		tabs.add_theme_constant_override("separation", 14)
		var fila: HBoxContainer = null
		for v in vista:
			if fila == null or fila.get_child_count() == 2:
				fila = HBoxContainer.new()
				fila.add_theme_constant_override("separation", 14)
				tabs.add_child(fila)
			fila.add_child(_pestana(v))
		_body.add_child(tabs)
		_body.move_child(tabs, 0)
	_heroe_estado(Store.tiene_derecho(_ver))
	if _recien.has("caja:" + String(d["pid"])):
		_heroe_celebra()
	return true





func _quita_heroe() -> void:
	if _heroe != null and is_instance_valid(_heroe):
		_body.remove_child(_heroe)
		_heroe.queue_free()
	_heroe = null
	_heroe_id = ""
	_heroe_tw = null
	_flota_tw = null
	_flota = 0.0






func _pestana(d: Dictionary) -> PanelContainer:
	var id: String = String(d["id"])
	var elegida: bool = id == _ver
	var acento: Color = acento_de(id)
	var p: PanelContainer = PanelContainer.new()
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	p.custom_minimum_size = Vector2(0, PESTANA_H)
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = CareerTheme.SURFACE.lerp(acento, 0.16) if elegida else CareerTheme.SURFACE
	sb.border_color = acento if elegida else CareerTheme.SURFACE_LINE
	sb.set_border_width_all(3 if elegida else 1)
	sb.set_content_margin_all(10.0)
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_STOP
	p.gui_input.connect(_on_pestana_input.bind(id))



	CareerUi.tocable_mando(p, "pestana:" + id)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(fila)
	var foto: Control = ShopPhoto.rect(self, id, FOTO_PESTANA)
	foto.mouse_filter = Control.MOUSE_FILTER_IGNORE
	foto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(foto)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_theme_constant_override("separation", 6)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(col)
	var n: Label = CareerUi.plain(CareerTheme.T_HEAD, acento if elegida else CareerTheme.TEXT)
	n.text = I18n.t(String(d["name"]))
	n.clip_text = true
	col.add_child(n)
	var tuya: bool = Store.tiene_derecho(id)
	var sub: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT if tuya else CareerTheme.MONEY)
	sub.text = I18n.t("TUYA") if tuya else Store.precio_de(String(d["pid"]))
	sub.clip_text = true
	col.add_child(sub)
	return p


func _on_pestana_input(ev: InputEvent, id: String) -> void:
	if ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed:
			_down = ev.global_position
		elif _down.distance_to(ev.global_position) < 12.0 and id != _ver:
			UiAudio.click()
			_ver = id
			_refresh()
			CareerUi.reenfoca_mando(self, "pestana:" + id)







static func acento_de(id: String) -> Color:
	if id == String(Iap.DERECHO_DOBLE_PAGA["id"]):
		return CareerTheme.MONEY
	if id == String(Iap.DERECHO_PACK_LEYENDA["id"]):
		return CareerTheme.text_on_dark(CareerTheme.NAV_LEGADO)
	if id == String(Iap.DERECHO_CUARTA_RANURA["id"]):
		return CareerTheme.text_on_dark(CareerTheme.NAV_MUNDO)
	return CareerTheme.text_on_dark(ShopPhoto.GEMA)





static func baldosas_de(d: Dictionary) -> Array:
	var out: Array = []
	for b in HEROES.get(String(d["id"]), {}).get("baldosas", []):
		out.append([String(b[0]), String(b[1]), String(b[2]) if b.size() > 2 else "×2"])
	var ahorro: int = Iap.ahorro(d)
	if ahorro > 0:
		out.append(["AHORRO", "tarjeta_pago", "%d%%" % ahorro])
	return out






func _crea_heroe(d: Dictionary) -> void:
	var id: String = String(d["id"])
	var h: Dictionary = HEROES.get(id, {})
	_heroe_id = id
	_heroe_n += 1
	_acento = acento_de(id)
	_marca = String(h.get("marca", "×2"))
	_heroe = VBoxContainer.new()
	_heroe.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_heroe.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_heroe.add_theme_constant_override("separation", 18)
	_body.add_child(_heroe)

	_escenario = Control.new()
	_escenario.custom_minimum_size = Vector2(0, ESCENARIO_MIN)
	_escenario.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_escenario.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_heroe.add_child(_escenario)
	_resplandor = RESPLANDOR.new()
	_resplandor.tinte = _acento
	_escenario.add_child(_resplandor)
	_producto = ShopPhoto.rect(self, id, FOTO_HEROE)

	_producto.custom_minimum_size = Vector2.ZERO
	_escenario.add_child(_producto)
	_x2_caja = Control.new()
	_x2_caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_escenario.add_child(_x2_caja)
	_x2 = _letras_x2()
	_x2_caja.add_child(_x2)
	_sello = _crea_sello()
	_escenario.add_child(_sello)


	_confeti.clear()
	for k in CONFETI:
		var ch: ColorRect = ColorRect.new()
		ch.visible = false
		ch.z_index = 5
		ch.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_escenario.add_child(ch)
		_confeti.append(ch)
	_escenario.resized.connect(_coloca_escenario)


	_nombre = CareerUi.plain(CareerTheme.T_SCORE, _acento)
	_nombre.text = I18n.t(String(d["name"]))
	_nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_nombre.clip_text = true



	CareerUi.autoshrink(_nombre, 22)
	_nombre.add_theme_color_override("font_outline_color", _acento.darkened(0.62))
	_nombre.add_theme_constant_override("outline_size", 10)
	_nombre.resized.connect(_centra_pivote.bind(_nombre))
	_heroe.add_child(_nombre)


	_baldosas = HBoxContainer.new()
	_baldosas.add_theme_constant_override("separation", 14)
	_heroe.add_child(_baldosas)
	_baldosas_x2.clear()
	for b in baldosas_de(d):
		_baldosas.add_child(_baldosa_x2(I18n.t(String(b[0])), String(b[1]), String(b[2])))



	_promesas = HFlowContainer.new()
	_promesas.alignment = FlowContainer.ALIGNMENT_CENTER
	_promesas.add_theme_constant_override("h_separation", 12)
	_promesas.add_theme_constant_override("v_separation", 10)
	_heroe.add_child(_promesas)


	var primera: Array = h.get("promesa", ["perfil", "TODAS TUS CARRERAS"])
	if not primera.is_empty():
		_promesas.add_child(_promesa(String(primera[0]), I18n.t(String(primera[1]))))
	_unico = _promesa("check", I18n.t("PAGO ÚNICO"))
	_promesas.add_child(_unico)


	_estado = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	_estado.text = I18n.t(String(h.get("activa", "")))
	_estado.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_estado.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_heroe.add_child(_estado)
	if UiKit.es_horizontal():



		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 36)
		fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
		_heroe.add_child(fila)
		_heroe.move_child(fila, 0)
		_escenario.reparent(fila)
		_escenario.custom_minimum_size = Vector2(620.0, 440.0)
		_escenario.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var ficha: VBoxContainer = VBoxContainer.new()
		ficha.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		ficha.alignment = BoxContainer.ALIGNMENT_CENTER
		ficha.add_theme_constant_override("separation", 18)
		fila.add_child(ficha)
		for pieza in [_nombre, _baldosas, _promesas, _estado]:
			(pieza as Control).reparent(ficha)






func _letras_x2() -> Label:
	var hondo: Color = _acento.darkened(0.62)
	var cara: Label = _letra_x2(_acento.lightened(0.28), hondo)
	for d in [9.0, 6.0, 3.0]:
		var capa: Label = _letra_x2(hondo, hondo)
		capa.position = Vector2(d, d)
		capa.show_behind_parent = true
		cara.add_child(capa)
	return cara


func _letra_x2(tinta: Color, contorno: Color) -> Label:
	var l: Label = CareerUi.plain(CareerTheme.T_SCORE, tinta)
	l.text = _marca
	l.add_theme_color_override("font_outline_color", contorno)
	l.add_theme_constant_override("outline_size", 8)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l




func _crea_sello() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.tag(_acento)
	sb.border_color = _acento.darkened(0.62)
	sb.set_border_width_all(4)
	sb.content_margin_left = 22.0
	sb.content_margin_right = 22.0
	sb.content_margin_top = 10.0
	sb.content_margin_bottom = 10.0
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.rotation = deg_to_rad(SELLO_GIRO)
	p.add_child(CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.on_color(_acento)))
	return p





func _baldosa_x2(rotulo: String, icono: String, cifra: String = "×2") -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.bg_color = CareerTheme.SURFACE.lerp(_acento, 0.1)
	sb.border_color = Color(_acento, 0.75)
	sb.set_border_width_all(2)
	sb.set_content_margin_all(16.0)
	p.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.add_theme_constant_override("separation", 8)
	p.add_child(col)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(48, 48)
	ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	ic.setup(icono, _acento)
	col.add_child(ic)
	var x2: Label = CareerUi.plain(CareerTheme.T_TITLE, _acento)
	x2.text = cifra
	x2.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	x2.add_theme_color_override("font_outline_color", _acento.darkened(0.62))
	x2.add_theme_constant_override("outline_size", 6)
	x2.resized.connect(_centra_pivote.bind(x2))
	col.add_child(x2)
	_baldosas_x2.append(x2)
	var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
	l.text = rotulo
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.clip_text = true

	CareerUi.autoshrink(l)
	col.add_child(l)
	return p




func _promesa(icono: String, texto: String) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.tag(Color(_acento, 0.16))
	sb.border_color = Color(_acento, 0.6)
	sb.set_border_width_all(2)
	sb.content_margin_left = 18.0
	sb.content_margin_right = 18.0
	sb.content_margin_top = 10.0
	sb.content_margin_bottom = 10.0
	p.add_theme_stylebox_override("panel", sb)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	p.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(30, 30)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup(icono, _acento)
	fila.add_child(ic)
	var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(l)
	return p




func _heroe_estado(tuya: bool) -> void:
	var sl: Label = _sello.get_child(0) as Label
	sl.text = I18n.t("TUYA") if tuya else I18n.t("PARA SIEMPRE")
	sl.add_theme_font_size_override("font_size", CareerTheme.T_TITLE if tuya else CareerTheme.T_HEAD)
	_unico.visible = not tuya
	_estado.visible = tuya
	_coloca_escenario()








func _coloca_escenario() -> void:
	if _escenario == null or not is_instance_valid(_escenario):
		return
	var w: float = _escenario.size.x
	var h: float = _escenario.size.y
	if w < 2.0 or h < 2.0:
		return
	var lado: float = floorf(minf(FOTO_HEROE, minf(h * 0.66, w * 0.62)))
	var esc: float = X2_ESCALA * lado / FOTO_HEROE
	var t: Vector2 = _x2.get_combined_minimum_size()
	var cuelga: float = t.y * esc * X2_CUELGA
	_producto_base = Vector2(roundf((w - lado) * 0.5), roundf(maxf((h - lado - cuelga) * 0.5, 0.0)))
	_producto.size = Vector2(lado, lado)
	_producto.pivot_offset = _producto.size * 0.5
	_aplica_flota(_flota)


	var cf: Vector2 = _producto_base + _producto.size * 0.5
	_resplandor.position = Vector2.ZERO
	_resplandor.size = Vector2(w, h)
	_resplandor.centro = cf
	_resplandor.radio = minf(minf(cf.y, h - cf.y), w * 0.5) * 1.1
	_resplandor.queue_redraw()
	_x2.size = t
	_x2.pivot_offset = t * 0.5
	for capa in _x2.get_children():
		(capa as Control).size = t
	_x2_caja.size = t
	_x2_caja.pivot_offset = t * 0.5
	_x2_caja.scale = Vector2(esc, esc)
	_x2_caja.rotation = deg_to_rad(X2_GIRO)
	_x2_caja.position = Vector2(w * 0.5, _producto_base.y + lado + cuelga - t.y * esc * 0.5) - t * 0.5
	_sello.reset_size()
	_sello.pivot_offset = _sello.size * 0.5
	_sello.position = _producto_base + Vector2(lado * 0.12, lado * 0.1) - _sello.size * 0.5


func _aplica_flota(v: float) -> void:
	_flota = v
	if _producto != null and is_instance_valid(_producto):
		_producto.position = _producto_base + Vector2(0.0, roundf(v))


func _centra_pivote(c: Control) -> void:
	c.pivot_offset = c.size * 0.5




func _flota_arranca() -> void:
	if Settings.reduce_motion or _producto == null or not is_instance_valid(_producto):
		return
	if _flota_tw != null and _flota_tw.is_valid():
		return
	_flota_tw = _producto.create_tween().set_loops()
	_flota_tw.tween_method(_aplica_flota, 0.0, - FLOTA, FLOTA_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_flota_tw.tween_method(_aplica_flota, - FLOTA, 0.0, FLOTA_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)










func _heroe_entrada() -> void:
	for p in _piezas():
		p.modulate.a = 0.0
	var n: int = _heroe_n
	await get_tree().process_frame

	if n != _heroe_n or _escenario == null or not is_instance_valid(_escenario):
		return
	_coloca_escenario()
	var fx: Tween = _escenario.create_tween().set_parallel(true)
	_heroe_tw = fx

	fx.tween_property(_resplandor, "modulate:a", 1.0, 0.45).set_delay(ENTRA_T0)
	fx.tween_property(_producto, "modulate:a", 1.0, 0.12).set_delay(ENTRA_T0)
	fx.tween_property(_producto, "scale", Vector2.ONE, 0.4).from(Vector2(0.3, 0.3)) \
			.set_delay(ENTRA_T0).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	var golpe: float = _estampa(fx, _x2, ENTRA_X2, 3.2)
	_golpe(fx, golpe)
	fx.tween_property(_producto, "scale", Vector2.ONE, 0.25).from(Vector2(1.06, 1.06)) \
			.set_delay(golpe).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	_estampa(fx, _sello, golpe + 0.14, 2.4)

	fx.tween_property(_nombre, "modulate:a", 1.0, 0.2).set_delay(golpe + 0.06)
	fx.tween_property(_nombre, "scale", Vector2.ONE, 0.3).from(Vector2(0.7, 0.7)) \
			.set_delay(golpe + 0.06).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)

	var k: int = 0
	for b in _baldosas.get_children():
		var c: Control = b as Control
		var bt: float = golpe + 0.12 + 0.06 * float(k)
		c.pivot_offset = c.size * 0.5
		fx.tween_property(c, "modulate:a", 1.0, 0.18).set_delay(bt)
		fx.tween_property(c, "scale", Vector2.ONE, 0.3).from(Vector2(0.8, 0.8)) \
				.set_delay(bt).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		if k < _baldosas_x2.size():
			fx.tween_property(_baldosas_x2[k], "scale", Vector2.ONE, 0.22) \
					.from(Vector2(1.6, 1.6)).set_delay(bt) \
					.set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
		k += 1

	fx.tween_property(_promesas, "modulate:a", 1.0, 0.25).set_delay(golpe + 0.3)
	fx.tween_property(_estado, "modulate:a", 1.0, 0.25).set_delay(golpe + 0.3)

	fx.tween_callback(_flota_arranca).set_delay(golpe + 0.5)



func _piezas() -> Array[Control]:
	var out: Array[Control] = [_resplandor, _producto, _x2, _sello, _nombre, _promesas, _estado]
	for b in _baldosas.get_children():
		out.append(b as Control)
	return out




func _estampa(fx: Tween, n: Control, t: float, desde: float) -> float:
	fx.tween_property(n, "modulate:a", 1.0, 0.06).set_delay(t)
	fx.tween_property(n, "scale", Vector2.ONE, ESTAMPA_S).from(Vector2(desde, desde)) \
			.set_delay(t).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	return t + ESTAMPA_S




func _golpe(fx: Tween, golpe: float, fogonazo: float = 2.6, dura: float = 0.6) -> void:
	fx.tween_property(_x2, "position:y", 4.0, 0.04).set_delay(golpe)
	fx.tween_property(_x2, "position:y", -3.0, 0.05).set_delay(golpe + 0.04)
	fx.tween_property(_x2, "position:y", 2.0, 0.05).set_delay(golpe + 0.09)
	fx.tween_property(_x2, "position:y", 0.0, 0.05).set_delay(golpe + 0.14)
	fx.tween_property(_resplandor, "brillo", 1.0, dura).from(fogonazo).set_delay(golpe) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	for i in 2:
		var lt: float = golpe + 0.3 + 0.24 * float(i)
		fx.tween_property(_x2, "scale", Vector2(1.1, 1.1), 0.1).set_delay(lt) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		fx.tween_property(_x2, "scale", Vector2.ONE, 0.14).set_delay(lt + 0.1) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	_lanza_confeti(fx, golpe)






func _lanza_confeti(fx: Tween, golpe: float) -> void:
	var tam: Vector2 = _x2.size * _x2_caja.scale.x
	var centro: Vector2 = _x2_caja.position + _x2_caja.pivot_offset
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 20261002
	var paleta: Array[Color] = [_acento.lightened(0.4), _acento, _acento.darkened(0.45)]
	for k in _confeti.size():
		var ch: ColorRect = _confeti[k]
		var lado: float = 10.0 if k % 3 == 0 else 16.0
		ch.color = paleta[k % paleta.size()]
		ch.size = Vector2(lado, lado)
		ch.pivot_offset = ch.size * 0.5
		ch.position = centro - ch.size * 0.5
		ch.rotation = 0.0
		ch.modulate.a = 0.0
		ch.visible = true
		var ang: float = TAU * float(k) / float(_confeti.size()) + rng.randf_range(-0.2, 0.2)
		var dist: float = rng.randf_range(0.5, 0.85) * tam.x
		var dest: Vector2 = centro + Vector2(cos(ang) * dist, sin(ang) * dist * 0.6) - ch.size * 0.5
		var suelo: float = dest.y + rng.randf_range(60.0, 130.0)
		var sale: float = golpe + rng.randf_range(0.0, 0.05)
		fx.tween_property(ch, "modulate:a", 1.0, 0.03).set_delay(sale)
		fx.tween_property(ch, "position", dest, 0.32).set_delay(sale) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		fx.tween_property(ch, "position:y", suelo, 0.45).set_delay(sale + 0.32) \
				.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
		fx.tween_property(ch, "rotation", rng.randf_range(- PI, PI), 0.77).set_delay(sale)
		fx.tween_property(ch, "modulate:a", 0.0, 0.25).set_delay(sale + 0.52)





func _heroe_reposo() -> void:
	if _heroe_tw != null and _heroe_tw.is_valid():
		_heroe_tw.kill()
	_heroe_tw = null
	for p in _piezas():
		p.modulate.a = 1.0
		p.scale = Vector2.ONE
	for x2 in _baldosas_x2:
		x2.scale = Vector2.ONE
	_x2.position = Vector2.ZERO
	_resplandor.brillo = 1.0
	for ch in _confeti:
		ch.visible = false
	_flota_arranca()





func _heroe_celebra() -> void:
	if Settings.reduce_motion or _escenario == null or not is_instance_valid(_escenario):
		return
	_heroe_reposo()
	_coloca_escenario()
	_x2.modulate.a = 0.0
	_sello.modulate.a = 0.0
	var fx: Tween = _escenario.create_tween().set_parallel(true)
	_heroe_tw = fx
	CareerUi.coin_burst(_escenario, _producto_base + _producto.size * 0.5, _acento, 48)
	var golpe: float = _estampa(fx, _x2, 0.0, 3.2)
	_golpe(fx, golpe, 3.0, 1.0)
	_estampa(fx, _sello, golpe + 0.14, 2.4)






func _pinta_lo_de_antes() -> void:
	var ids: Dictionary = {}
	for p in Herencia.PACKS:
		if Herencia.tiene(String(p["id"])):
			for raw in p["ids"]:
				ids[String(raw)] = true
	for id in sueltas_tuyas():
		ids[String(id)] = true
	if Store.tiene_derecho(String(Iap.DERECHO_VENTAJAS["id"])):
		for m in Rebirth.all():
			ids[String(m["id"])] = true
	if ids.is_empty():
		return
	var l: Label = CareerUi.dim(_body, I18n.tf(
		"Tus {0} ventajas siguen entrando en cada carrera nueva.", [ids.size()]))
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART











static func a_la_vista() -> Array:
	var out: Array = []
	for d in Iap.DERECHOS_LEGADO:
		var id: String = String(d["id"])
		var incluye: Array = d.get("incluye", [])
		if not incluye.is_empty():
			var alguna: bool = false
			for parte in incluye:
				alguna = alguna or Store.tiene_derecho(String(parte))
			if Store.tiene_derecho(id) or (Store.derecho_disponible(d) and not alguna):
				out.append(d)
			continue
		if _en_pack_tuyo(id):
			continue
		if Store.tiene_derecho(id) or Store.derecho_disponible(d):
			out.append(d)
	return out



static func _en_pack_tuyo(id: String) -> bool:
	for p in Iap.DERECHOS_LEGADO:
		if (p.get("incluye", []) as Array).has(id) and Store.tiene_derecho(String(p["id"])):
			return true
	return false










static func tiene_algo() -> bool:
	if SteamPuente.es_steam():
		return false
	if Iap.LEGADO_VENDE_HERENCIA:
		return true
	return not a_la_vista().is_empty()




static func queda_algo() -> bool:
	for d in a_la_vista():
		if Store.derecho_disponible(d) and not Store.tiene_derecho(String(d["id"])):
			return true
	return false




func _pinta_packs() -> void:
	var intro: Label = CareerUi.dim(_body, I18n.t(
		"Cinco packs de tres ventajas. Cada una entra sola en toda carrera nueva, hoy y siempre."))
	intro.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	for p in Herencia.PACKS:
		_body.add_child(_ficha_pack(p))
	_pinta_todas()



	var sueltas: int = sueltas_tuyas().size()
	if sueltas > 0:
		var l: Label = CareerUi.dim(_body, I18n.tf(
			"Y {0} ventajas sueltas de antes, tuyas: entran igual en cada carrera.", [sueltas]))
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




static func sueltas_tuyas() -> Array:
	var out: Array = []
	for k in Herencia.KITS:
		var kid: String = String(k["id"])
		if Herencia.pack_de(kid).is_empty() and Herencia.tiene(kid):
			out.append(kid)
	for m in Rebirth.all():
		var mid: String = String(m["id"])
		if Herencia.pack_de(mid).is_empty() and Rebirth.is_unlocked(mid):
			out.append(mid)
	return out




func _ficha_pack(p: Dictionary) -> PanelContainer:
	var id: String = String(p["id"])
	var t: int = int(p.get("tier", 1))
	var col: Color = Rebirth.tier_color(t)
	var mio: bool = Herencia.tiene(id)
	var spec: Dictionary = {
		"icon_ctrl": _foto(id), "icon_lado": FOTO_LADO,
		"title": I18n.t(String(p["name"])),
		"line": I18n.t(String(p["desc"])),
		"chips": chips_pack(p),
	}
	if mio:
		spec["tag"] = {"text": I18n.t("TUYO"), "ink": CareerTheme.TEXT, "outline": true}
		spec["state"] = I18n.t("En tu herencia: sus tres ventajas entran en toda carrera nueva.")
	else:
		spec["tag"] = {"text": I18n.t(Rebirth.tier_name(t)), "fill": col, "ink": CareerTheme.on_color(col)}
		_precio_doble(spec, id)
		var ya: int = Herencia.del_pack_ya_tienes(id)
		if ya > 0:
			spec["state"] = I18n.tf("YA TIENES {0} DE 3: con estrellas pagas sólo lo que te falta.", [ya])
	return _ficha(spec, id, not mio)





static func chips_pack(p: Dictionary) -> Array:
	var out: Array = []
	for raw in p["ids"]:
		var fid: String = String(raw)
		var f: Dictionary = Herencia.kit_by_id(fid)
		if f.is_empty():
			f = Rebirth.by_id(fid)
		var nombre: String = I18n.t(String(f.get("name", fid)))
		if Herencia.tiene(fid) or Rebirth.is_unlocked(fid):
			nombre += " · " + I18n.t("TUYA")
		out.append(CareerUi.label_chip("", nombre, CareerTheme.TEXT, String(f.get("icon", ""))))
	return out



static func _chips_kit(k: Dictionary) -> Array:
	var out: Array = []


	if k.has("skill_bonus"):
		var primero: int = int(k["skill_bonus"].values()[0])
		out.append(CareerUi.label_chip(I18n.t("HABILIDADES"), "+%d" % primero, CareerTheme.TEXT))
	if k.has("money_bonus"):
		out.append(CareerUi.label_chip(I18n.t("DE SALIDA"), CareerUi.money(int(k["money_bonus"])),
			CareerTheme.MONEY))
	if k.has("boots"):
		var b: Dictionary = Shop.boots_by_id(String(k["boots"]))
		out.append(CareerUi.label_chip(I18n.t("BOTAS"), I18n.t(String(b.get("name", ""))),
			CareerTheme.TEXT))
	for key in k.get("rel_floor", {}):
		out.append(CareerUi.label_chip(I18n.t(String(key).to_upper()),
			"≥ %d" % int(k["rel_floor"][key]), CareerTheme.TEXT))
	if k.has("land_tier"):
		var lado: int = int(House.lado_of(int(k["land_tier"])))
		out.append(CareerUi.label_chip(I18n.t("SOLAR"), "%d x %d" % [lado, lado],
			CareerTheme.TEXT))
	return out





func _pinta_todas() -> void:
	if not Store.caja_disponible() or not Store.derecho_ventajas_disponible():
		return
	var d: Dictionary = Iap.DERECHO_VENTAJAS
	var pid: String = String(d["pid"])
	var tuyo: bool = Store.tiene_derecho(String(d["id"]))
	var spec: Dictionary = {
		"icon_ctrl": ShopPhoto.rect(self, String(d["id"]), FOTO_LADO), "icon_lado": FOTO_LADO,
		"title": I18n.t(String(d["name"])),
		"line": I18n.t(String(d["desc"])),
		"chips": [CareerUi.label_chip(I18n.t("PACKS"), "%d / %d"
			% [Herencia.PACKS.size(), Herencia.PACKS.size()], CareerTheme.MONEY)],
	}
	if tuyo:
		spec["tag"] = {"text": I18n.t("TUYA"), "ink": CareerTheme.TEXT, "outline": true}
		spec["state"] = I18n.t("La vitrina entera, en tu herencia: todas en toda carrera nueva.")
	else:
		spec["price_ctrl"] = _boton_precio(Store.precio_de(pid), I18n.t("DINERO REAL"),
			CareerTheme.MONEY, "caja:" + pid)
		spec["state"] = I18n.t("No marca ningún logro: LOGROS y Game Center siguen contando sólo lo jugado.")
	_body.add_child(_ficha(spec, "caja:" + pid, not tuyo))







func _ficha(spec: Dictionary, id: String, elegible: bool) -> PanelContainer:
	if id == _sel:
		spec["border"] = CareerTheme.TEXT
		spec["border_w"] = 3
		spec["bg"] = CareerTheme.SURFACE_HI
	var card: PanelContainer = CareerUi.item_card(spec)
	if elegible:
		card.gui_input.connect(_on_ficha_input.bind(id))



		CareerUi.tocable_mando(card, "ficha:" + id)
	if _recien.has(id):
		_celebra(card)
	return card







func _celebra(card: Control) -> void:
	if Settings.reduce_motion:
		return
	await get_tree().process_frame
	if not is_instance_valid(card):
		return
	card.pivot_offset = card.size * 0.5
	var tw: Tween = card.create_tween().set_parallel(true)
	tw.tween_property(card, "scale", Vector2.ONE, 0.35).from(Vector2(1.06, 1.06)) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(card, "modulate", Color.WHITE, 0.55) \
			.from(CareerTheme.MONEY.lerp(Color.WHITE, 0.45)) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)







func _anima_saldo(nuevo: int) -> void:
	var viejo: int = _saldo_val
	_saldo_val = nuevo
	if viejo < 0 or viejo == nuevo or Settings.reduce_motion:
		_saldo_l.text = "%d ★" % nuevo
		return
	if _saldo_tw != null and _saldo_tw.is_valid():
		_saldo_tw.kill()
	var chip: Control = _saldo_l.get_parent().get_parent() as Control
	chip.pivot_offset = chip.size * 0.5
	_saldo_tw = create_tween().set_parallel(true)
	_saldo_tw.tween_method(func(v: float) -> void:
		_saldo_l.text = "%d ★" % roundi(v), float(viejo), float(nuevo), 0.5) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	var golpe: Vector2 = Vector2(1.15, 1.15) if nuevo > viejo else Vector2(0.92, 0.92)
	_saldo_tw.tween_property(chip, "scale", Vector2.ONE, 0.35).from(golpe) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)


var _down: Vector2 = Vector2.ZERO

func _on_ficha_input(ev: InputEvent, id: String) -> void:
	if ev is InputEventMouseButton and ev.button_index == MOUSE_BUTTON_LEFT:
		if ev.pressed:
			_down = ev.global_position
		elif _down.distance_to(ev.global_position) < 12.0:
			UiAudio.click()
			_sel = "" if _sel == id else id
			_refresh()
			CareerUi.reenfoca_mando(self, "ficha:" + id)


func _pinta_dock() -> void:
	for old in _dock.get_children():
		old.queue_free()
	if _sel.is_empty():



		if not Iap.LEGADO_VENDE_HERENCIA:
			for d in Iap.DERECHOS_LEGADO:
				if String(d["id"]) == _ver and Store.derecho_disponible(d) \
						and not Store.tiene_derecho(_ver):
					var b: Button = _boton_caja(String(d["pid"]),
						I18n.t(String(HEROES.get(_ver, {}).get("cta", "DINERO REAL"))))
					_dock.add_child(b)
					_cta_anima(b)
			_cta_entra = false
			return
		var l: Label = CareerUi.dim(_dock, I18n.t(
			"Elige un pack. Lo que compres aquí te acompaña en cada carrera, la de hoy"
			+ " y las que vengan."))
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		return
	if _sel.begins_with("caja:"):
		_dock.add_child(_boton_caja(_sel.trim_prefix("caja:")))
		return
	var precio: int = Herencia.precio_de(_sel)
	var puede: bool = Herencia.se_puede_comprar(_sel)
	var b: Button = CareerUi.primary_cta("%s · %d ★" % [I18n.t("COMPRAR"), precio],
		_confirmar_compra.bind(_sel))


	CareerTheme.apply_button_accent(b, CareerTheme.MONEY, CareerTheme.BTN_CTA_FONT)
	if not puede:
		b.disabled = true


		var apagado: Color = CareerTheme.MONEY.darkened(0.55)
		b.add_theme_stylebox_override("disabled",
			CareerTheme._button_sb(apagado, apagado.darkened(0.45), CareerTheme.SINK))
		b.add_theme_color_override("font_disabled_color", CareerTheme.MONEY.lerp(Color.WHITE, 0.35))
		CareerUi.dim(_dock, _falta_texto(precio))
	_dock.add_child(b)



	var derecho: Dictionary = Iap.derecho_herencia(_sel)
	if not derecho.is_empty() and not _precio_real(_sel).is_empty():
		_dock.add_child(_boton_caja(String(derecho["pid"])))




func _foto(id: String) -> Control:
	return ShopPhoto.rect(self, ShopPhoto.foto_herencia(id), FOTO_LADO)





func _precio_doble(spec: Dictionary, id: String) -> void:
	var precio: int = Herencia.precio_de(id)
	var real: String = _precio_real(id)
	if real.is_empty():
		spec["price_ctrl"] = _boton_precio("%d ★" % precio, _falta_texto(precio),
			CareerTheme.TEXT_DIM, id)
	else:
		spec["price_ctrl"] = _boton_precio("%d ★" % precio, real, CareerTheme.MONEY, id)








func _boton_precio(txt: String, sub: String, sub_col: Color, id: String) -> VBoxContainer:
	var box: VBoxContainer = VBoxContainer.new()
	box.custom_minimum_size = Vector2(230, 0)
	box.add_theme_constant_override("separation", 4)
	box.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	var b: Button = Button.new()

	b.custom_minimum_size = Vector2(230, 64)
	CareerTheme.apply_button(b, CareerTheme.Kind.REAL, 26)
	b.text = txt
	b.clip_text = true
	b.pressed.connect(func() -> void:
		UiAudio.click()
		_sel = "" if _sel == id else id
		_refresh())
	box.add_child(b)
	var s: Label = CareerUi.plain(CareerTheme.T_CAPTION, sub_col)
	s.text = sub
	s.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	s.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	s.custom_minimum_size = Vector2(0, 20)
	box.add_child(s)
	return box



func _precio_real(id: String) -> String:
	if not Store.caja_disponible():
		return ""
	var d: Dictionary = Iap.derecho_herencia(id)
	if d.is_empty():
		return ""
	return Store.precio_de(String(d["pid"]))








func _restaurar_compras(b: Button) -> void:
	if b.disabled:
		return
	if not Store.restaurar_compras():
		_aviso_texto(I18n.t("RESTAURAR COMPRAS"), Store.texto_no_responde())
		return
	b.disabled = true
	CareerUi.pinta_accion(b, "girar", I18n.t("RESTAURANDO"), UiKit.BTN_BLUE["bg"] as Color)
	Store.restauracion_lista.connect(_on_restaurado.bind(b), CONNECT_ONE_SHOT)


func _on_restaurado(tenia: bool, b: Button) -> void:
	if is_instance_valid(b):
		b.disabled = false
		CareerUi.pinta_accion(b, "girar", I18n.t("RESTAURAR COMPRAS"),
			UiKit.BTN_BLUE["bg"] as Color)
	if tenia:
		UiAudio.coin()
	_refresh()
	_aviso_texto(I18n.t("RESTAURAR COMPRAS"), Store.texto_restaurado(tenia))


func _aviso_texto(titulo: String, cuerpo: String) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var t: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	t.text = titulo
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(t)
	var body: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	body.text = cuerpo
	body.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(body)
	var ok: Button = CareerUi.menu_row(I18n.t("CERRAR"), "")
	ok.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(ok)
	CareerUi.normalize_caps(box)



func _falta_texto(precio: int) -> String:
	var falta: int = precio - Herencia.disponibles()
	return I18n.tf("TE FALTAN {0} ★", [falta]) if falta > 0 else I18n.t("TE ALCANZA")


func _confirmar_compra(id: String) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = I18n.t("PARA SIEMPRE")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	box.add_child(titulo)
	var precio: int = Herencia.precio_de(id)
	CareerUi.line(box, I18n.tf("Pagas {0} ★ · te quedan {1} ★",
		[precio, Herencia.disponibles() - precio]))
	CareerUi.dim(box, I18n.t("Desde hoy va contigo en cada carrera, las de ahora y las que vengan. No se devuelve."))



	var si: Button = CareerUi.primary_cta(I18n.t("COMPRAR"), Callable())
	CareerTheme.apply_button_accent(si, CareerTheme.MONEY, CareerTheme.BTN_CTA_FONT)
	si.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		if Herencia.comprar(id):
			Telemetry.count("herencia_compra")
			UiAudio.coin()
			_sel = ""
			_refresh()
		else:
			UiKit.deny_tap(si))
	box.add_child(si)
	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.pressed.connect(CareerUi.close_modal.bind(box))
	box.add_child(no)







func _boton_caja(pid: String, rotulo: String = "") -> Button:
	var en_vuelo: bool = not _caja_esperando.is_empty()
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.disabled = en_vuelo or not Store.se_puede_pagar()
	CareerTheme.apply_button(b, CareerTheme.Kind.REAL,
		0 if rotulo.is_empty() else CareerTheme.BTN_CTA_FONT)
	var que: String = I18n.t("DINERO REAL") if rotulo.is_empty() else rotulo
	b.text = I18n.t("ABRIENDO") if en_vuelo else "%s · %s" % [que, Store.precio_de(pid)]
	b.clip_text = true
	if not b.disabled:
		b.pressed.connect(_caja_buy.bind(pid))
	return b






func _cta_anima(b: Button) -> void:
	if Settings.reduce_motion:
		return
	var vivo: bool = not b.disabled
	if vivo:
		CareerUi.destello(b, 2.4, ENTRA_CTA + 0.4 if _cta_entra else 0.0)
	if not _cta_entra:
		if vivo:
			CareerUi.pulse_scale(b, 1.03)
		return
	b.modulate.a = 0.0
	var tw: Tween = b.create_tween().set_parallel(true)
	tw.tween_property(b, "modulate:a", 1.0, 0.18).set_delay(ENTRA_CTA)
	tw.tween_method(_cta_escala.bind(b), 0.85, 1.0, 0.3).set_delay(ENTRA_CTA) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	if vivo:
		tw.chain().tween_callback(_cta_late.bind(b))




func _cta_escala(v: float, b: Button) -> void:
	b.pivot_offset = b.size * 0.5
	b.scale = Vector2(v, v)


func _cta_late(b: Button) -> void:
	CareerUi.pulse_scale(b, 1.03)


func _caja_buy(pid: String) -> void:
	if not _caja_esperando.is_empty():
		return
	Telemetry.count("caja_tocada")
	_caja_esperando = pid
	if not Store.comprar_pack(pid):
		Telemetry.count("caja_sin_hoja")
		_caja_esperando = ""
		return
	_caja_reloj(true)
	_refresh()


func _caja_reloj(on: bool) -> void:
	if _caja_timer == null or not is_instance_valid(_caja_timer):
		_caja_timer = Timer.new()
		_caja_timer.one_shot = true
		_caja_timer.wait_time = 30.0
		_caja_timer.timeout.connect(_caja_sin_respuesta)
		add_child(_caja_timer)
	if on:
		_caja_timer.start()
	else:
		_caja_timer.stop()





func _caja_suelta() -> void:
	_caja_esperando = ""
	_refresh()



func _caja_sin_respuesta() -> void:
	if not _caja_esperando.is_empty():
		Telemetry.count("caja_sin_respuesta")
	_caja_suelta()


func _on_intento(ok: bool, motivo: String) -> void:
	_caja_reloj(false)
	if ok:
		UiAudio.coin()




	if not _caja_esperando.is_empty():
		Telemetry.count("caja_comprada" if ok else Store.evento_sin_cobro(motivo))
	_caja_suelta()


func _go_back() -> void:
	SceneFade.to_scene("res://ui/main_menu.tscn")







func atras() -> bool:
	if CareerUi.close_top_modal(self):
		return true
	_go_back()
	return true
