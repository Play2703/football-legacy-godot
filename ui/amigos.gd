class_name AmigosPantalla
extends Control


















const MENU_BG: PackedScene = preload("res://ui/menu_background.tscn")
const MAIN_MENU: GDScript = preload("res://ui/main_menu.gd")
const MAIN_SCENE: String = "res://ui/main_menu.tscn"

const HUB_TRAINING = preload("res://ui/hub_training.gd")

const CHIP_ICO: float = 38.0




const TIRA_COLUMNAS: int = 4

const RAYA_DUENO: float = 6.0


const AMIGOS_CARA_W_TUMBADA: float = 420.0



static var pestana: int = 0
static var categoria: int = 0

static var mundo: bool = false

static var en_ligas: bool = false
static var liga_vista: String = ""





static var filtro_nat: String = ""
static var filtro_liga: String = ""



static var filtro_club: String = ""


const FILTRO_SUGERIDAS: int = 6

const PESTANA_RETOS: int = 1
const PESTANA_TABLA: int = 2





static var abrir: Dictionary = {}




var _pedidos: Dictionary = {}

var _body: VBoxContainer
var _tabs: HBoxContainer
var _scroll: ScrollContainer



var _cromos_pendientes: Array = []
var _cromos_en_cola: bool = false

var _denuncia_url: String = ""


var _root: VBoxContainer


func _ready() -> void:

	Amigos.devolver()
	add_child(MENU_BG.instantiate())
	add_child(CareerTheme.scrim())

	var res: Dictionary = GameState.encargo_result
	var de_reto: bool = res.has("reto")
	var pedido: Dictionary = abrir
	abrir = {}
	if de_reto:
		pestana = PESTANA_RETOS
		GameState.encargo_result = {}
		Achievements.ingest_reto_jugado(int(res.get("logrado", 0)), int(res.get("tries", 0)))
	elif not pedido.is_empty():

		pestana = 0
	_build_ui()


	Nube.cambio.connect(_repinta)
	Nube.premio.connect(_premio)



	if _falta_permiso():
		_pide_permiso()
	else:
		Nube.refresca()
	if de_reto:
		_resultado_reto(res)
	elif not pedido.is_empty():
		_abre_pedido(pedido)





func _abre_pedido(pedido: Dictionary) -> void:
	var uid: String = String(pedido.get("uid", ""))
	var a: Dictionary = Amigos.por_uid(uid) if uid != "" else {}
	if a.is_empty():
		return
	var cid: String = String(pedido.get("cid", ""))
	if bool(pedido.get("reto", false)):
		_abrir_retar(a, cid)
	else:
		_abrir_tarjeta(a, cid)


func _repinta(forzar: bool = false) -> void:

	if not is_inside_tree() or (not forzar and CareerUi.modal_open(self)):
		return
	remove_child(_root)
	_root.queue_free()
	_build_ui()


func _build_ui() -> void:
	var root: VBoxContainer = VBoxContainer.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.offset_left = 34.0
	root.offset_right = -34.0
	root.offset_top = 40.0
	root.offset_bottom = -34.0
	root.add_theme_constant_override("separation", 14)
	CareerUi.apply_safe_area(root, get_viewport())
	CareerUi.columna_centrada(root, get_viewport())
	add_child(root)
	_root = root

	var title: Label = Label.new()
	CareerTheme.title(title, CareerTheme.T_TITLE)
	title.text = I18n.t("AMIGOS")
	root.add_child(title)
	CareerTheme.rule(root)

	_build_codigo(root)
	if Nube.sin_red:
		var franja: Label = CareerUi.dim(root, I18n.t("Sin conexión: lo último guardado"))
		franja.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	elif Amigos.demo():
		var franja: Label = CareerUi.dim(root, I18n.t("Vista previa: amigos de ejemplo"))
		franja.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	var tocan: int = Amigos.te_tocan()
	var retos: String = I18n.t("RETOS") +(" %d" % tocan if tocan > 0 else "")


	var ancho: float = SceneFade.rect_visible(self).size.x + root.offset_right - root.offset_left
	_tabs = CareerUi.segmented([I18n.t("AMIGOS"), retos, I18n.t("TABLA"),
		I18n.t("NOVEDADES")], pestana, _elige_pestana, 0.0, ancho)
	root.add_child(_tabs)

	var scroll: ScrollContainer = DragScroll.new()
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	root.add_child(scroll)
	_body = VBoxContainer.new()
	_body.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_theme_constant_override("separation", 14)
	scroll.add_child(_body)
	_scroll = scroll
	scroll.get_v_scroll_bar().value_changed.connect(func(_v: float) -> void: _pide_cromos())

	var atras: Button = CareerUi.back_button(root, func() -> void: SceneFade.to_scene(MAIN_SCENE))



	var calle: Button = CareerUi.accion("local", I18n.t("TU CALLE"), CareerTheme.NAV_CASA)
	calle.size_flags_horizontal = Control.SIZE_SHRINK_END
	calle.custom_minimum_size.x = 340
	calle.pressed.connect(func() -> void: SceneFade.to_scene("res://ui/house/calle.tscn"))
	atras.get_parent().add_child(calle)



	_fill()
	CareerUi.normalize_caps(root)





const APODO_W_TUMBADO: float = 360.0




func _build_codigo(root: Container) -> void:
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_GENTE))
	root.add_child(panel)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	panel.add_child(row)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_child(col)
	var r: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	r.text = I18n.t("TU CÓDIGO")
	col.add_child(r)
	var c: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_GENTE)


	c.text = "------" if _falta_permiso() else Amigos.mi_codigo()
	c.name = "MiCodigo"
	col.add_child(c)



	var apodo: Button = Button.new()
	apodo.name = "MiApodo"
	apodo.text = Apodo.texto(Nube.apodo) if Nube.apodo != "" else I18n.t("ESCRIBE TU NOMBRE")
	apodo.clip_text = true
	apodo.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	apodo.custom_minimum_size = Vector2(0, 56)
	CareerTheme.apply_button_tinted(apodo, CareerTheme.NAV_GENTE, CareerTheme.T_CAPTION, 0.4)
	apodo.pressed.connect(_abrir_apodo)








	if UiKit.es_horizontal():
		apodo.custom_minimum_size.x = APODO_W_TUMBADO
		row.add_child(apodo)
	else:
		col.add_child(apodo)

	_dato(col, I18n.tf("+{0} ★ por amigo que juegue 10 partidos", [Nube.ESTRELLAS_AHIJADO]),
		CareerTheme.T_CAPTION, CareerTheme.MONEY)

	_placa_padrino(col)

	var invitar: Button = Button.new()
	invitar.text = I18n.t("INVITAR")
	invitar.custom_minimum_size = Vector2(0, 84)
	CareerTheme.apply_button_tinted(invitar, CareerTheme.NAV_GENTE, CareerTheme.T_BODY, 0.4)
	invitar.pressed.connect(_invitar)
	row.add_child(invitar)
	var agregar: Button = Button.new()
	agregar.text = "+"
	agregar.custom_minimum_size = Vector2(84, 84)
	CareerTheme.apply_button(agregar, CareerTheme.Kind.PRIMARY, CareerTheme.T_TITLE_MODAL)
	agregar.pressed.connect(_abrir_agregar)
	row.add_child(agregar)





func _placa_padrino(parent: Container) -> void:
	var cumplidos: int = int(Nube.padrinazgo.get("cumplidos", 0))
	var nivel: int = Amigos.nivel_padrino(cumplidos)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "PlacaPadrino"
	fila.add_theme_constant_override("separation", 4)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(fila)
	var rarezas: Array[int] = [Achievements.RARE_RARE, Achievements.RARE_RARE,
		Achievements.RARE_EPIC, Achievements.RARE_LEGEND]
	for i in Amigos.NIVELES_PADRINO.size():
		var tinte: Color = Achievements.rarity_color(rarezas[i]) if i < nivel \
				else Color(CareerTheme.TEXT_DIM, 0.35)
		var ic: Control = _icono("corona", tinte)
		ic.custom_minimum_size = Vector2(36, 36)
		fila.add_child(ic)
	var meta: int = Amigos.NIVELES_PADRINO[mini(nivel, Amigos.NIVELES_PADRINO.size() - 1)]
	var rotulo: String = I18n.t("PADRINO")
	_dato(fila, "%s %d/%d" % [rotulo, cumplidos, meta] if nivel < Amigos.NIVELES_PADRINO.size() \
			else "%s %d" % [rotulo, cumplidos], CareerTheme.T_CAPTION, CareerTheme.NAV_GENTE) \
			.size_flags_horizontal = Control.SIZE_EXPAND_FILL




func _abrir_agregar() -> void:
	if _pide_si_falta(_abrir_agregar):
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("AGREGAR AMIGO"), null, "", CareerTheme.NAV_GENTE)
	var edit: LineEdit = CareerUi.campo("", 6, "ABC234")

	edit.set_meta(Entrada.TECLADO_SIN_MAYUS_META, true)
	box.add_child(edit)
	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var ok: Button = Button.new()
	ok.text = I18n.t("AGREGAR")
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(ok, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	box.add_child(ok)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	ok.pressed.connect(func() -> void:
		if edit.text.strip_edges().length() != 6:
			aviso.text = I18n.t("CÓDIGO NO ENCONTRADO")
			return
		ok.disabled = true
		aviso.text = ""
		var err: String = await Nube.agregar(edit.text)
		if not is_instance_valid(box):
			return
		ok.disabled = false
		if err != "":
			aviso.text = I18n.t(err)
			return
		CareerUi.close_modal(box)
		SalonFamaPantalla.aviso(self, I18n.t("Amigo agregado."))
		_repinta(true))
	CareerUi.normalize_caps(box)








func _abrir_apodo() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("TU NOMBRE"), null, "", CareerTheme.NAV_GENTE)
	var vista: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_GENTE)
	vista.name = "VistaApodo"
	vista.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	vista.clip_text = true
	vista.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	box.add_child(vista)

	var edit: LineEdit = CareerUi.campo(Apodo.texto(Nube.apodo), Apodo.LARGO_MAX,
		I18n.t("ESCRIBE TU NOMBRE"))
	edit.name = "CampoApodo"
	box.add_child(edit)
	var aviso: Label = CareerUi.dim(box, "")
	aviso.name = "AvisoApodo"
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var ok: Button = Button.new()
	ok.name = "GuardaApodo"
	ok.text = I18n.t("GUARDAR")
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(ok, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	box.add_child(ok)
	var regla: Label = CareerUi.dim(box, I18n.t("Lo ven todos. Un nombre ofensivo se puede denunciar."))
	regla.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	regla.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var pinta: Callable = func(t: String) -> void:
		var vacio: bool = Apodo.compacta(t) == ""
		var err: String = "" if vacio else Apodo.error(t)
		vista.text = "#" + Amigos.mi_codigo() if vacio else \
				(CareerTheme.caps(Apodo.compacta(t)) if err == "" else vista.text)
		aviso.text = I18n.t(err) if err != "" else ""
		ok.disabled = err != ""
	edit.text_changed.connect(pinta)
	pinta.call(edit.text)
	ok.pressed.connect(func() -> void:
		Nube.pon_apodo(edit.text)
		CareerUi.close_modal(box)
		_repinta(true))
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)

	if Nube.acepto:
		box.add_child(_boton_borrar_cuenta())
	CareerUi.normalize_caps(box)








func _pide_permiso(sigue: Callable = Callable()) -> void:
	pide_permiso(self, sigue)




static func pide_permiso(host: Node, sigue: Callable = Callable()) -> void:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return
	box.name = "PermisoAmigos"
	CareerUi.head(box, I18n.t("AMIGOS"), null, "", CareerTheme.NAV_GENTE)
	var que: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	que.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	que.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	que.text = I18n.t("AMIGOS crea un perfil anónimo y sube tu carrera y tu apodo para rankings y retos.")
	box.add_child(que)





	var regla: Label = CareerUi.dim(box, I18n.t("Al aceptar, aceptas estas normas: tolerancia cero con el contenido ofensivo y con los usuarios abusivos. Lo denunciado se oculta y la cuenta se expulsa."))
	regla.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	regla.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var no: Button = CareerUi.menu_row(I18n.t("AHORA NO"), "")
	no.name = "PermisoNo"
	no.set_meta("atras", true)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)
	var si: Button = CareerUi.accion("check", I18n.t("ACEPTAR"), CareerTheme.NAV_GENTE, true)
	si.name = "PermisoSi"
	si.set_meta(Entrada.PRIMERO_META, true)
	si.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		Nube.acepta()
		Nube.refresca()


		if sigue.is_valid():
			sigue.call())
	box.add_child(si)
	CareerUi.normalize_caps(box)









func _pide_si_falta(sigue: Callable) -> bool:
	if not _falta_permiso():
		return false
	_pide_permiso(sigue)
	return true




func _falta_permiso() -> bool:
	return Nube.falta_permiso()





func _boton_borrar_cuenta() -> Button:
	var b: Button = CareerUi.accion("cerrar", I18n.t("BORRAR MI CUENTA"), CareerTheme.DANGER)
	b.name = "BorrarCuenta"
	b.pressed.connect(func() -> void:


		CareerUi.close_modal(b)
		_confirma_borrar_cuenta())
	return b






func _confirma_borrar_cuenta() -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	box.name = "ConfirmaBorrarCuenta"
	CareerUi.head(box, I18n.t("¿BORRAR TU CUENTA?"), null, "", CareerTheme.DANGER)
	var nota: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.text = I18n.t("Se borran del servidor tu perfil, amigos, retos, ligas, ranking y casa. Tu carrera en este dispositivo no se toca.")
	box.add_child(nota)
	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.set_meta("atras", true)
	no.set_meta(Entrada.PRIMERO_META, true)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)
	var si: Button = CareerUi.accion("cerrar", I18n.t("BORRAR"), CareerTheme.DANGER, true)
	si.name = "BorrarCuentaSi"
	si.pressed.connect(func() -> void:
		si.disabled = true
		CareerUi.close_modal(box)
		var ok: bool = await _borrar_cuenta()
		if not is_inside_tree():
			return
		_repinta(true)
		SalonFamaPantalla.aviso(self, I18n.t("Cuenta borrada.") if ok
			else I18n.t("No se pudo borrar. Revisa tu conexión e inténtalo luego.")))
	box.add_child(si)
	CareerUi.normalize_caps(box)



func _borrar_cuenta() -> bool:
	return await Nube.borrar_cuenta()












func _abrir_desconocido(apodo: String, code: String) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var oculto: bool = Nube.ocultos.has(code)
	CareerUi.head(box, Apodo.o_codigo("" if oculto else apodo, code), null, "",
		CareerTheme.NAV_GENTE)
	if not oculto:
		var c: Label = CareerUi.dim(box, "#" + code)
		c.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var ocultar: Button = Button.new()
	ocultar.name = "OcultaApodo"
	ocultar.text = I18n.t("MOSTRAR SU NOMBRE") if oculto else I18n.t("OCULTAR SU NOMBRE")
	ocultar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(ocultar, CareerTheme.Kind.NEUTRAL, CareerTheme.T_HEAD)
	ocultar.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		Nube.oculta(code, not oculto))
	box.add_child(ocultar)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)


	var bloquear: Button = Button.new()
	bloquear.name = "BloqueaApodo"
	bloquear.text = I18n.t("BLOQUEAR")
	bloquear.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	bloquear.clip_text = true
	CareerTheme.apply_button_tinted(bloquear, CareerTheme.DANGER, CareerTheme.T_HEAD, 0.4)
	bloquear.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_bloquear_codigo(code))
	var denuncia: Button = Button.new()
	denuncia.name = "DenunciaApodo"
	denuncia.text = I18n.t("DENUNCIAR")
	denuncia.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	denuncia.clip_text = true
	CareerTheme.apply_button(denuncia, CareerTheme.Kind.WARN, CareerTheme.T_HEAD)
	denuncia.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_bloquear_codigo(code)
		_denuncia(apodo, code))
	for b in [bloquear, denuncia]:
		(b as Button).size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(b)
	box.add_child(fila)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)




func _bloquear_codigo(code: String) -> void:
	Nube.bloquea_codigo(code)




func _denuncia(apodo: String, code: String) -> void:
	Nube.oculta(code)
	var asunto: String = "%s: %s" % [ProjectSettings.get_setting("application/config/name"),
		I18n.t("DENUNCIAR")]
	var cuerpo: String = "#%s · %s" % [code, apodo]
	_denuncia_url = "mailto:%s?subject=%s&body=%s" % [MAIN_MENU.CONTACTO_MAIL,
		asunto.uri_encode(), cuerpo.uri_encode()]

	if GameState.readonly_save or OS.shell_open(_denuncia_url) != OK:
		DisplayServer.clipboard_set("#" + code)
		SalonFamaPantalla.aviso(self, I18n.t("COPIADO · PÉGALO DONDE QUIERAS") + "\n" \
				+ MAIN_MENU.CONTACTO_MAIL)



func _apodo_visible(apodo: Variant, code: String) -> String:
	return "" if Nube.ocultos.has(code) else Apodo.limpia(apodo)





func _toque_desconocido(placa: Control, apodo: Variant, code: String) -> void:
	var limpio: String = Apodo.limpia(apodo)
	if limpio == "" or code == "":
		return
	placa.mouse_filter = Control.MOUSE_FILTER_PASS
	CareerUi.tocable_mando(placa)
	placa.gui_input.connect(func(ev: InputEvent) -> void:
		if not (ev is InputEventMouseButton) \
				or (ev as InputEventMouseButton).button_index != MOUSE_BUTTON_LEFT:
			return
		var mb: InputEventMouseButton = ev as InputEventMouseButton
		if mb.pressed:
			placa.set_meta("down", mb.global_position)
		elif placa.has_meta("down"):
			var d: float =(mb.global_position -(placa.get_meta("down") as Vector2)).length()
			placa.remove_meta("down")
			if d < 24.0:
				_abrir_desconocido(limpio, code))




func _invitar() -> void:


	if _pide_si_falta(_invitar):
		return
	copia_invitacion(self)




static func invita(host: Node) -> void:
	if Nube.falta_permiso():
		pide_permiso(host, func() -> void: copia_invitacion(host))
		return
	copia_invitacion(host)


static func copia_invitacion(host: Node) -> void:
	var code: String = Amigos.mi_codigo()
	DisplayServer.clipboard_set(I18n.tf("Juega Football Legacy conmigo: {0} · código {1}",
		[MAIN_MENU.SHARE_URL + "?amigo=" + code, code]))
	SalonFamaPantalla.aviso(host, I18n.t("Invitación copiada."))


func _premio(estrellas: int, _ahijados: int, _bienvenida: bool) -> void:
	SalonFamaPantalla.aviso(self, I18n.tf("+{0} ★ por invitar amigos", [estrellas]))


func _elige_pestana(i: int) -> void:
	pestana = i
	CareerUi.mark_segmented(_tabs, i)
	_fill()


func _fill() -> void:
	for c in _body.get_children():
		_body.remove_child(c)
		c.queue_free()
	match pestana:
		0: _fill_amigos()
		PESTANA_RETOS: _fill_retos()
		PESTANA_TABLA: _fill_clasificacion()
		_: _fill_feed()
	CareerUi.normalize_caps(_body)










const CROMOS_COLUMNAS: int = 2


const CROMO_MARGEN: float = 12.0
const CROMOS_SEP: float = 14.0












func _columnas_cromos(n: int) -> int:
	if not UiKit.es_horizontal() or _root == null:
		return CROMOS_COLUMNAS
	var ancho: float = SceneFade.rect_visible(self).size.x + _root.offset_right - _root.offset_left
	var celda: float = PlayerCard.MIN_W + CROMO_MARGEN * 2.0
	var caben: int = maxi(1, floori((ancho + CROMOS_SEP) /(celda + CROMOS_SEP)))
	return maxi(CROMOS_COLUMNAS, mini(caben, n))















func _fill_amigos() -> void:
	var lista: Array[Dictionary] = Amigos.lista()
	var rejilla: GridContainer = GridContainer.new()
	rejilla.name = "RejillaAmigos"
	rejilla.columns = _columnas_cromos(lista.size())
	rejilla.add_theme_constant_override("h_separation", int(CROMOS_SEP))
	rejilla.add_theme_constant_override("v_separation", int(CROMOS_SEP))
	rejilla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_body.add_child(rejilla)
	var celdas: Array[Control] = []
	var esperan: Dictionary = _te_esperan()
	var tumbado: bool = UiKit.es_horizontal() and _root != null
	var orden: Array[Dictionary] = lista
	if tumbado:
		orden = []
		for a in lista:
			if esperan.has(String(a.get("code", ""))):
				orden.append(a)
		for a in lista:
			if not esperan.has(String(a.get("code", ""))):
				orden.append(a)
	for a in orden:
		celdas.append(_cromo_amigo(rejilla, a, esperan.has(String(a.get("code", "")))))
	if tumbado and not celdas.is_empty():
		var alto: float = 0.0
		for c in celdas:
			alto = maxf(alto, c.get_combined_minimum_size().y)
		var filas: int = maxi(1, floori((_alto_hueco() + CROMOS_SEP) /(alto + CROMOS_SEP)))
		var sitio: int = rejilla.columns * filas
		if celdas.size() > sitio:
			var vista: int = maxi(1, sitio - 1)
			for k in range(vista, celdas.size()):
				rejilla.remove_child(celdas[k])
				celdas[k].queue_free()
			celdas.resize(vista)
			var mas: Button = _baldosa_mas(rejilla, lista.size() - vista, CareerTheme.NAV_GENTE,
				Vector2(0.0, alto), _todos_amigos.bind(orden, esperan))
			mas.name = "MasAmigos"

			mas.set_meta("guarda", lista.size() - vista)
			mas.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			celdas.append(mas)
	_cascada(celdas)




func _te_esperan() -> Dictionary:
	var esperan: Dictionary = {}
	for r in Amigos.retos():
		var code: String = String((r.get("amigo", {}) as Dictionary).get("code", ""))
		if String(r.estado) == Amigos.TE_TOCA and code != "":
			esperan[code] = true
	return esperan







func _alto_hueco() -> float:
	var scroll: Control = _body.get_parent() as Control
	var alto: float = SceneFade.rect_visible(self).size.y + _root.offset_bottom - _root.offset_top
	var vistas: int = 0
	for c in _root.get_children():
		if c is Control and (c as Control).visible and not (c as Control).top_level:
			vistas += 1
			if c != scroll:
				alto -=(c as Control).get_combined_minimum_size().y
	return alto - float(_root.get_theme_constant("separation")) * float(maxi(0, vistas - 1))



















func _todos_amigos(lista: Array[Dictionary], esperan: Dictionary, guard: bool = true) -> void:
	var box: VBoxContainer = CareerUi.modal(self, guard)
	if box == null:
		return
	CareerUi.head(box, I18n.t("AMIGOS"), null, str(lista.size()), CareerTheme.NAV_GENTE)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.name = "TodosAmigos"
	rejilla.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", 12)
	box.add_child(rejilla)
	var cerrar: Button = Button.new()
	cerrar.name = "CerrarTodos"
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)

	var alto: float = 0.0
	var n: int = lista.size()
	var cabe: Vector2i = Vector2i(n, TIRA_COLUMNAS)
	var vista: int = n
	for k in n:
		if k >= vista:
			break
		var a: Dictionary = lista[k]
		var te_espera: bool = esperan.has(String(a.get("code", "")))
		var cromo: PlayerCard = _celda_cromo(rejilla, a,
			CareerTheme.MONEY if te_espera else CareerTheme.NAV_GENTE)
		cromo.set_tap(func() -> void:
			_cierra_todos()
			_abrir_tarjeta(a))
		cromo.get_parent().set_meta("code", String(a.get("code", "")))
		if k == 0:
			alto =(cromo.get_parent() as Control).get_combined_minimum_size().y
			cabe = _cabe_en_todos(box, rejilla, alto)
			if UiKit.es_horizontal() and n > cabe.x * cabe.y:
				vista = maxi(1, cabe.x * cabe.y - 1)
	if vista < n:
		var mas: Button = _baldosa_mas(rejilla, n - vista, CareerTheme.NAV_GENTE,
			Vector2(PlayerCard.MIN_W, alto), _todos_amigos.bind(lista.slice(vista), esperan, false))
		mas.name = "MasTodos"
		mas.set_meta("guarda", n - vista)
		rejilla.columns = cabe.y
	elif UiKit.es_horizontal():
		rejilla.columns = clampi(ceili(float(n) / float(cabe.x)), 1, cabe.y)
	else:
		rejilla.columns = clampi(n, 1, TIRA_COLUMNAS)
	CareerUi.normalize_caps(box)




func _cierra_todos() -> void:
	for m in SceneFade.grupo(CareerUi.MODAL_GROUP):
		if is_ancestor_of(m):
			CareerUi.close_modal(m)





func _cabe_en_todos(box: VBoxContainer, rejilla: GridContainer, alto: float) -> Vector2i:
	var vp: Viewport = get_viewport()
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var placa: Vector2 = CareerTheme.plate().get_minimum_size()
	var tope_h: float = tam.y - UiKit.top_safe_inset(vp) - UiKit.bottom_safe_inset(vp) \
			- 2.0 * CareerUi.MODAL_MARGEN_V - placa.y
	var tope_w: float = tam.x - 2.0 * UiKit.side_safe_inset(vp) - 2.0 * CareerUi.MODAL_MARGEN_V \
			- placa.x
	var sep: float = float(box.get_theme_constant("separation"))
	var resto: float = 0.0
	for c in box.get_children():
		if c != rejilla and c is Control:
			resto +=(c as Control).get_combined_minimum_size().y + sep
	var vs: float = float(rejilla.get_theme_constant("v_separation"))
	var hs: float = float(rejilla.get_theme_constant("h_separation"))
	var filas: int = maxi(1, floori((tope_h - resto + vs) /(alto + vs)))
	var cols: int = maxi(1, floori((tope_w + hs) /(PlayerCard.MIN_W + hs)))
	return Vector2i(filas, cols)


func _cromo_amigo(parent: Container, a: Dictionary, te_espera: bool) -> Control:
	var marco: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat =(CareerTheme.chip() as StyleBoxFlat).duplicate() as StyleBoxFlat
	sb.border_color = CareerTheme.MONEY if te_espera else CareerTheme.NAV_GENTE.darkened(0.35)
	sb.set_border_width_all(4 if te_espera else 2)
	sb.set_corner_radius_all(18)
	sb.set_content_margin_all(CROMO_MARGEN)
	marco.add_theme_stylebox_override("panel", sb)
	marco.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	marco.set_meta("code", String(a.get("code", "")))
	parent.add_child(marco)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(col)
	var cromo: PlayerCard = PlayerCard.build_archivado(a, Teams.by_id(String(a.get("team_id", ""))),
		String(a.get("nat", "")), a.get("look", {}) as Dictionary)
	cromo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	cromo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cromo)
	var club: Label = _dato(col, CareerTheme.caps(_club(a)), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	club.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var pie: HBoxContainer = HBoxContainer.new()
	pie.alignment = BoxContainer.ALIGNMENT_CENTER
	pie.add_theme_constant_override("separation", 8)
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(pie)
	if te_espera:
		pie.add_child(CareerUi.tint_tag({"text": I18n.t("TE TOCA"), "ink": CareerTheme.MONEY}))
	else:
		_pastilla(pie, a)
	var n_carreras: int = Amigos.carreras_de(a).size()
	if n_carreras > 1:
		pie.add_child(CareerUi.tint_tag({"text": "+%d" %(n_carreras - 1),
			"ink": CareerTheme.NAV_GENTE, "outline": true}))


	var cifras: HBoxContainer = HBoxContainer.new()
	cifras.add_theme_constant_override("separation", 4)
	cifras.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cifras)
	var datos: Array = [["gol", int(a.get("goals", 0)), CareerTheme.STAT_GOAL],
		["asist", int(a.get("assists", 0)), CareerTheme.STAT_ASSIST],
		["trofeo:liga", Amigos.valor(a, "cups"), CareerTheme.NAV_LEGADO]]
	if int(a.get("ligas", 0)) > 0:
		datos.append(["corona", int(a.ligas), CareerTheme.MONEY])
	for d in datos:
		var celda: VBoxContainer = VBoxContainer.new()
		celda.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		celda.add_theme_constant_override("separation", 2)
		celda.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cifras.add_child(celda)
		var ic: Control = _icono(String(d[0]), d[2])
		ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		celda.add_child(ic)
		var v: Label = _dato(celda, str(d[1]), CareerTheme.T_BODY, d[2])
		v.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	marco.add_child(CareerUi.hit_overlay(56.0, _abrir_tarjeta.bind(a)))
	return marco




func _cascada(celdas: Array[Control]) -> void:
	for c in celdas:
		c.modulate.a = 0.0
	await get_tree().process_frame
	for k in celdas.size():
		var c: Control = celdas[k]
		if not is_instance_valid(c):
			continue
		var y: float = c.position.y
		c.position.y = y + 40.0
		var tw: Tween = c.create_tween().set_parallel(true)
		tw.tween_property(c, "modulate:a", 1.0, 0.25).set_delay(0.07 * k)
		tw.tween_property(c, "position:y", y, 0.32).set_delay(0.07 * k) \
				.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)



func _tinta(alfa: float) -> Color:
	return Color(CareerTheme.INK_LIGHT.r, CareerTheme.INK_LIGHT.g, CareerTheme.INK_LIGHT.b, alfa)


func _club(p: Dictionary) -> String:
	var t: Dictionary = Teams.by_id(String(p.get("team_id", "")))
	return Competitions.demarca(String(t.get("name", "")))


func _chips(parent: Container, p: Dictionary) -> void:


	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(fila)
	_chip(fila, "gol", str(int(p.get("goals", 0))), CareerTheme.STAT_GOAL)
	_chip(fila, "asist", str(int(p.get("assists", 0))), CareerTheme.STAT_ASSIST)
	_chip(fila, "trofeo:liga", str(Amigos.valor(p, "cups")), CareerTheme.NAV_LEGADO)
	_chip(fila, "vitrina", str(int(p.get("legacy", 0))), CareerTheme.NAV_LEGADO)

	if int(p.get("ligas", 0)) > 0:
		_chip(fila, "corona", str(int(p.ligas)), CareerTheme.MONEY)









func _abrir_tarjeta(a: Dictionary, cid: String = "") -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var tu: Dictionary = Amigos.yo()
	var sel: Dictionary = {"suya": cid if cid != "" else String(a.get("cid", "")),
		"mia": String(tu.get("cid", ""))}
	var cont: VBoxContainer = VBoxContainer.new()
	cont.add_theme_constant_override("separation", 14)
	box.add_child(cont)
	_pinta_tarjeta(cont, a, tu, sel)

	if not UiKit.es_horizontal():
		_botones_tarjeta(box, a, sel)
	CareerUi.normalize_caps(box)







func _botones_tarjeta(parent: Container, a: Dictionary, sel: Dictionary) -> void:
	var retar: Button = Button.new()
	retar.text = I18n.t("RETAR")
	retar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(retar, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	retar.pressed.connect(func() -> void:
		CareerUi.close_modal(retar)
		_abrir_retar(a, String(sel.suya), String(sel.mia)))




	if String(a.get("uid", "")) == "":
		parent.add_child(retar)
	else:
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 12)
		retar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(retar)
		var casa: Button = Button.new()
		casa.name = "VerCasa"
		casa.text = I18n.t("VER CASA")
		casa.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		casa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		casa.clip_text = true
		retar.clip_text = true
		CareerTheme.apply_button_tinted(casa, CareerTheme.NAV_CASA, CareerTheme.T_HEAD, 0.4)
		casa.pressed.connect(func() -> void:
			CareerUi.close_modal(casa)
			_ver_casa(a, String(sel.suya)))
		fila.add_child(casa)
		parent.add_child(fila)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(cerrar))
	if String(a.get("uid", "")) == "":
		parent.add_child(cerrar)
		return





	var fila_pie: HBoxContainer = HBoxContainer.new()
	fila_pie.add_theme_constant_override("separation", 12)
	var quitar: Button = Button.new()
	quitar.name = "QuitarAmigo"
	quitar.text = I18n.t("QUITAR AMIGO")
	quitar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	quitar.clip_text = true
	CareerTheme.apply_button_tinted(quitar, CareerTheme.DANGER, CareerTheme.T_BODY, 0.4)
	quitar.pressed.connect(func() -> void:
		CareerUi.close_modal(quitar)
		_confirma_amigo(a, false))
	var denuncia: Button = Button.new()
	denuncia.name = "DenunciaAmigo"
	denuncia.text = I18n.t("DENUNCIAR")
	denuncia.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	denuncia.clip_text = true
	CareerTheme.apply_button(denuncia, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
	denuncia.pressed.connect(func() -> void:
		CareerUi.close_modal(denuncia)
		_confirma_amigo(a, true))
	cerrar.clip_text = true
	for b in [quitar, denuncia, cerrar]:
		(b as Button).size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila_pie.add_child(b)
	parent.add_child(fila_pie)







func _confirma_amigo(a: Dictionary, denunciar: bool) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	box.name = "ConfirmaAmigo"
	var otro: String = String(a.get("uid", ""))
	var code: String = String(a.get("code", ""))
	CareerUi.head(box, I18n.t("¿DENUNCIAR?") if denunciar else I18n.t("¿QUITAR AMIGO?"), null, "",
		CareerTheme.DANGER)
	if code != "":
		_cifra(box, "#" + code, CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_GENTE) \
				.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var nota: Label = CareerUi.dim(box, I18n.t("Deja de ser tu amigo y se oculta su nombre.")
		if denunciar else I18n.t("Deja de ser tu amigo."))
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	if denunciar:


		var bloq: Label = CareerUi.dim(box, I18n.t("Queda bloqueado: no vuelve a aparecer en AMIGOS."))
		bloq.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		bloq.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.set_meta("atras", true)
	no.set_meta(Entrada.PRIMERO_META, true)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)
	var si: Button = CareerUi.accion("cerrar", I18n.t("DENUNCIAR") if denunciar
		else I18n.t("QUITAR AMIGO"), CareerTheme.DANGER, true)
	si.name = "ConfirmaAmigoSi"
	si.pressed.connect(func() -> void:
		si.disabled = true
		CareerUi.close_modal(box)
		if denunciar:






			_bloquear(otro, code)
			_denuncia(String(a.get("name", "")), code)
			_repinta()
			return
		var ok: bool = await _quitar_amigo(otro)
		if not is_inside_tree():
			return
		if not ok and not CareerUi.modal_open(self):
			SalonFamaPantalla.aviso(self, I18n.t("SIN CONEXIÓN"))
		_repinta())
	box.add_child(si)
	CareerUi.normalize_caps(box)



func _quitar_amigo(otro: String) -> bool:
	return await Nube.quitar_amigo(otro)




func _bloquear(otro: String, code: String) -> void:
	Nube.bloquea(otro, code)





func _ver_casa(a: Dictionary, cid: String) -> void:
	if not cid.begins_with("r"):
		SalonFamaPantalla.aviso(self, I18n.t("AÚN NO HAY CASA"))
		return
	var r: Dictionary = await Nube.casa_de(String(a.get("uid", "")), cid)
	if not is_inside_tree():
		return
	if r.has("error"):
		SalonFamaPantalla.aviso(self, I18n.t(String(r["error"])))
		return
	var c: Dictionary = Amigos.carrera(a, cid)
	CasaFoto.pendiente = {"foto": r["casa"],
		"nombre": String(c.get("name", a.get("name", ""))), "nat": String(c.get("nat", ""))}
	SceneFade.to_scene("res://ui/house/visita.tscn")




func _pinta_tarjeta(cont: VBoxContainer, a: Dictionary, tu: Dictionary, sel: Dictionary) -> void:
	for n in cont.get_children():
		cont.remove_child(n)
		n.queue_free()
	var c: Dictionary = Amigos.carrera(a, String(sel.suya))
	sel.suya = String(c.get("cid", ""))
	var m: Dictionary = {} if tu.is_empty() else Amigos.carrera(tu, String(sel.mia))
	sel.mia = String(m.get("cid", ""))
	var suyas: Array = Amigos.carreras_de(a)
	var tiras: bool = suyas.size() > 1 or (not tu.is_empty() and Amigos.carreras_de(tu).size() > 1)







	var col_duelo: VBoxContainer = cont
	var col_tiras: VBoxContainer = cont
	var col_cara: VBoxContainer = cont
	if UiKit.es_horizontal():
		var cols: HBoxContainer = HBoxContainer.new()
		cols.add_theme_constant_override("separation", 28)
		cols.alignment = BoxContainer.ALIGNMENT_CENTER
		cont.add_child(cols)
		col_duelo = VBoxContainer.new()
		col_duelo.add_theme_constant_override("separation", 14)
		cols.add_child(col_duelo)
		col_tiras = col_duelo
		if tiras:
			col_tiras = VBoxContainer.new()
			col_tiras.add_theme_constant_override("separation", 14)
			cols.add_child(col_tiras)
		col_cara = VBoxContainer.new()
		col_cara.add_theme_constant_override("separation", 14)

		col_cara.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col_cara.custom_minimum_size.x = AMIGOS_CARA_W_TUMBADA
		cols.add_child(col_cara)


	var duelo: HBoxContainer = HBoxContainer.new()
	duelo.alignment = BoxContainer.ALIGNMENT_CENTER
	duelo.add_theme_constant_override("separation", 18)
	col_duelo.add_child(duelo)
	_celda_cromo(duelo, c, CareerTheme.NAV_GENTE)
	if not m.is_empty():
		var vs: Label = _cifra(duelo, I18n.t("VS"), CareerTheme.T_HEAD, CareerTheme.TEXT)
		vs.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		_celda_cromo(duelo, m, CareerTheme.NAV_YO)
	var quien: Label = _dato(col_duelo, "%s · #%s" % [CareerTheme.caps(_club(c)), String(a.get("code", ""))],
		CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	quien.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER


	if suyas.size() > 1:
		CareerUi.head(col_tiras, I18n.tf("{0} CARRERAS", [suyas.size()]), null, "", CareerTheme.NAV_GENTE)
		_tira_carreras(col_tiras, suyas, String(sel.suya), CareerTheme.NAV_GENTE, func(k: String) -> void:
			sel.suya = k
			_pinta_tarjeta(cont, a, tu, sel))
	if not tu.is_empty() and Amigos.carreras_de(tu).size() > 1:
		CareerUi.head(col_tiras, I18n.t("TU JUGADOR"), null, "", CareerTheme.NAV_YO)
		_tira_carreras(col_tiras, Amigos.carreras_de(tu), String(sel.mia), CareerTheme.NAV_YO,
			func(k: String) -> void:
				sel.mia = k
				_pinta_tarjeta(cont, a, tu, sel))

	CareerUi.head(col_cara, I18n.t("CARA A CARA"), null, "", CareerTheme.NAV_GENTE)
	if m.is_empty():
		CareerUi.dim(col_cara, I18n.t("Empieza una carrera para compararte."))
	else:
		for cat in Amigos.CATEGORIAS:


			if String(cat[0]) != "ga":
				_fila_cara(col_cara, cat, c, m)
	if col_cara != cont:
		_botones_tarjeta(col_cara, a, sel)
	CareerUi.normalize_caps(cont)


func _fila_cara(parent: Container, cat: Array, a: Dictionary, tu: Dictionary) -> void:
	var va: int = Amigos.valor(a, String(cat[0]))
	var vt: int = Amigos.valor(tu, String(cat[0]))
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	parent.add_child(fila)
	var izq: Label = _cifra(fila, str(va), CareerTheme.T_BODY, CareerTheme.NAV_GENTE)
	izq.custom_minimum_size = Vector2(80, 0)
	izq.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	var mid: VBoxContainer = VBoxContainer.new()
	mid.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	mid.add_theme_constant_override("separation", 4)
	fila.add_child(mid)
	var rot: HBoxContainer = HBoxContainer.new()
	rot.alignment = BoxContainer.ALIGNMENT_CENTER
	rot.add_theme_constant_override("separation", 6)
	mid.add_child(rot)
	rot.add_child(_icono(String(cat[2]), CareerTheme.TEXT_DIM))
	_cifra(rot, I18n.t(String(cat[1])), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	var total: float = float(va + vt)
	var reparto: float = 0.5 if total <= 0.0 else float(va) / total
	CareerUi.barra_repartida(mid, reparto, CareerTheme.NAV_GENTE, CareerTheme.NAV_YO)
	var der: Label = _cifra(fila, str(vt), CareerTheme.T_BODY, CareerTheme.NAV_YO)
	der.custom_minimum_size = Vector2(80, 0)




func _fill_clasificacion() -> void:




	var donde: HBoxContainer = CareerUi.segmented([I18n.t("AMIGOS"), I18n.t("MUNDO"),
		I18n.t("LIGAS")], 2 if en_ligas else (1 if mundo else 0), func(i: int) -> void:
			mundo = i == 1
			en_ligas = i == 2
			_fill())
	_body.add_child(donde)
	var rotulos: Array = []
	for cat in Amigos.CATEGORIAS:
		rotulos.append(I18n.t(String(cat[1])))
	CareerUi.tab_chips(_body, rotulos, categoria, func(i: int) -> void:
		categoria = i
		_fill(), CareerTheme.NAV_GENTE)
	var cat: Array = Amigos.CATEGORIAS[categoria]
	if en_ligas:
		_fill_ligas(cat)
		return
	if mundo:
		_fill_mundo(cat)
		return
	for p in Amigos.clasificacion(String(cat[0])):
		var puesto: int = int(p.pos)
		var es_yo: bool = bool(p.get("yo", false))
		var tinte: Color = CareerTheme.NAV_YO if es_yo else CareerTheme.NAV_GENTE


		var team: Dictionary = Teams.by_id(String(p.get("team_id", "")))
		var panel: PanelContainer = PanelContainer.new()
		var sb: StyleBox = KitPattern.stylebox(team, int(p.get("season", 1)))
		panel.add_theme_stylebox_override("panel", sb)
		_body.add_child(panel)
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 14)
		row.mouse_filter = Control.MOUSE_FILTER_IGNORE
		panel.add_child(row)


		if es_yo:
			var barra: ColorRect = ColorRect.new()
			barra.color = CareerTheme.NAV_YO
			barra.custom_minimum_size = Vector2(8, 0)
			barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
			row.add_child(barra)
		var n: Label = _cifra(row, "%d." % puesto, CareerTheme.T_CARD,
			CareerTheme.NAV_LEGADO if puesto == 1 else _tinta(0.72))
		n.custom_minimum_size = Vector2(56, 0)
		n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(col)
		var nombre: String = I18n.t("TÚ") if es_yo else CareerTheme.caps(String(p.name))




		_nombre_fila(col, nombre, tinte if es_yo else CareerTheme.INK_LIGHT, p,
			not UiKit.es_horizontal())


		var dueno: String = String(p.get("dueno", ""))
		var otra: bool = not es_yo and dueno != "" and dueno != String(p.name)
		_dato(col, CareerTheme.caps(dueno if otra else _club(p)), CareerTheme.T_CAPTION,
			CareerTheme.NAV_GENTE if otra else _tinta(0.58))
		var crest: CrestView = CrestView.new()
		crest.custom_minimum_size = Vector2(48, 48)
		crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
		crest.set_team(team)
		row.add_child(crest)
		var cifra: HBoxContainer = HBoxContainer.new()
		cifra.add_theme_constant_override("separation", 8)
		cifra.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(cifra)
		cifra.add_child(_icono(String(cat[2]), CareerTheme.INK_LIGHT))
		var v: Label = _cifra(cifra, str(Amigos.valor(p, String(cat[0]))), CareerTheme.T_MONEY,
			CareerTheme.INK_LIGHT)
		v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		if not es_yo:
			panel.add_child(CareerUi.hit_overlay(56.0,
				_abrir_tarjeta.bind(p, String(p.get("cid", "")))))




func _fill_feed() -> void:
	var entradas: Array[Dictionary] = Amigos.feed()
	if entradas.is_empty():
		_vacio(I18n.t("Aún no hay novedades de tus amigos."))
	for e in entradas:
		var a: Dictionary = Amigos.por_codigo(String(e.code))
		if a.is_empty():
			continue
		var panel: PanelContainer = PanelContainer.new()
		panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_GENTE))
		_body.add_child(panel)
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 16)
		row.mouse_filter = Control.MOUSE_FILTER_IGNORE
		panel.add_child(row)
		var ic: Control = _icono(String(e.icono), CareerTheme.NAV_GENTE)
		ic.custom_minimum_size = Vector2(48, 48)
		row.add_child(ic)
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(col)

		var quien: String = String(e.get("nombre", ""))
		var args: Array = [CareerTheme.caps(quien if quien != "" else String(a.name))]
		for x in (e.args as Array):

			if x is String and not Teams.by_id(String(x)).is_empty():
				args.append(Competitions.demarca(String(Teams.by_id(String(x)).get("name", ""))))
			else:
				args.append(x)
		var l: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		l.text = I18n.tf(String(e.plantilla), args)
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(l)
		var dias: int = int(e.dias)
		_dato(col, I18n.t("HOY") if dias == 0 else I18n.tf("HACE {0} D", [dias]),
			CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		panel.add_child(CareerUi.hit_overlay(56.0, _abrir_tarjeta.bind(a)))







func _fill_retos() -> void:


	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	_body.add_child(fila)
	for d in [["RETAR A UN AMIGO", "perfil", _abrir_retar.bind({})],
			["EN GRUPO", "relaciones", _abrir_retar_grupo]]:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button_tinted(b, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
		b.pressed.connect(d[2])
		fila.add_child(b)
		var dentro: HBoxContainer = HBoxContainer.new()
		dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
		dentro.alignment = BoxContainer.ALIGNMENT_CENTER
		dentro.add_theme_constant_override("separation", 10)
		dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(dentro)
		dentro.add_child(_icono(String(d[1]), CareerTheme.TEXT))
		_cifra(dentro, I18n.t(String(d[0])), CareerTheme.T_HEAD, CareerTheme.TEXT) \
				.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var lista: Array[Dictionary] = Amigos.retos()
	if lista.is_empty():
		_vacio(I18n.t("Reta a un amigo: mismas jugadas para los dos, gana quien marque más."))
	for r in lista:
		if bool(r.get("grupo", false)):
			_tarjeta_reto_grupo(r)
		else:
			_tarjeta_reto(r)


func _tarjeta_reto(r: Dictionary) -> void:
	var estado: String = String(r.estado)
	var tinte: Color = _color_estado(estado)
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(tinte))
	_body.add_child(panel)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(col)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(row)
	var ic: Control = _icono(Amigos.icono_reto(String(r.tipo)), CareerTheme.NAV_GENTE)
	ic.custom_minimum_size = Vector2(64, 64)
	row.add_child(ic)
	var who: VBoxContainer = VBoxContainer.new()
	who.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	who.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(who)
	var amigo: Dictionary = r.get("amigo", {})
	_dato(who, CareerTheme.caps(String(amigo.get("name", "?"))), CareerTheme.T_HEAD,
		CareerTheme.TEXT)
	_dato(who, I18n.tf("{0} · {1} JUGADAS", [I18n.t(Practice.label_of(String(r.tipo))),
		int(r.jugadas)]), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)

	var marcas: HBoxContainer = HBoxContainer.new()
	marcas.add_theme_constant_override("separation", 8)
	marcas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(marcas)
	_cifra(marcas, "–" if int(r.mia) < 0 else str(int(r.mia)), CareerTheme.T_MONEY,
		CareerTheme.NAV_YO).vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_cifra(marcas, ":", CareerTheme.T_HEAD, CareerTheme.TEXT_DIM).vertical_alignment = \
			VERTICAL_ALIGNMENT_CENTER
	_cifra(marcas, "–" if int(r.suya) < 0 else str(int(r.suya)), CareerTheme.T_MONEY,
		CareerTheme.NAV_GENTE).vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	var con: Dictionary = r.get("con", {})
	var contra: Dictionary = r.get("contra", {})
	if not con.is_empty() or not contra.is_empty():
		var vs: HBoxContainer = HBoxContainer.new()
		vs.alignment = BoxContainer.ALIGNMENT_CENTER
		vs.add_theme_constant_override("separation", 24)
		vs.mouse_filter = Control.MOUSE_FILTER_IGNORE
		col.add_child(vs)
		_lado(vs, con, CareerTheme.NAV_YO)
		_cifra(vs, I18n.t("VS"), CareerTheme.T_HEAD, CareerTheme.TEXT_DIM) \
				.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		_lado(vs, contra, CareerTheme.NAV_GENTE)

	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 12)
	col.add_child(pie)
	var est: Label = _dato(pie, I18n.t(estado), CareerTheme.T_BODY, tinte)
	est.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	est.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var quedan: String = _quedan(int(r.get("vence", 0)))
	if quedan != "" and estado in [Amigos.TE_TOCA, Amigos.ESPERANDO]:
		_cifra(pie, quedan, CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM).vertical_alignment = \
				VERTICAL_ALIGNMENT_CENTER
	if estado == Amigos.TE_TOCA:
		var jugar: Button = Button.new()
		jugar.text = I18n.t("JUGAR")
		jugar.custom_minimum_size = Vector2(220, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(jugar, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
		jugar.pressed.connect(_jugar_reto.bind(r))
		pie.add_child(jugar)







func _tarjeta_reto_grupo(r: Dictionary) -> void:
	var estado: String = String(r.estado)
	var tinte: Color = _color_estado(estado)
	var puesto: Array = r.get("puesto", [0, 0])
	var miembros: Array = r.get("miembros", [])
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(tinte))
	_body.add_child(panel)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(col)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 16)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(row)
	var ic: Control = _icono(Amigos.icono_reto(String(r.tipo)), CareerTheme.NAV_GENTE)
	ic.custom_minimum_size = Vector2(64, 64)
	row.add_child(ic)
	var who: VBoxContainer = VBoxContainer.new()
	who.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	who.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(who)
	_dato(who, I18n.t("RETO EN GRUPO"), CareerTheme.T_HEAD, CareerTheme.TEXT)
	_dato(who, I18n.tf("{0} · {1} JUGADAS", [I18n.t(Practice.label_of(String(r.tipo))),
		int(r.jugadas)]), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)

	var gente: HBoxContainer = HBoxContainer.new()
	gente.add_theme_constant_override("separation", 6)
	gente.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(gente)
	gente.add_child(_icono("relaciones", CareerTheme.NAV_GENTE))
	_cifra(gente, "%d/%d" % [int(puesto[1]), miembros.size()], CareerTheme.T_HEAD,
		CareerTheme.TEXT).vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	var marca: Label = _cifra(row, "–" if int(r.mia) < 0 else str(int(r.mia)), CareerTheme.T_MONEY,
		CareerTheme.NAV_YO)
	marca.custom_minimum_size.x = 48
	marca.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	marca.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var pos: int = int(puesto[0])
	if pos > 0:
		_cifra(row, "%d." % pos, CareerTheme.T_MONEY,
			CareerTheme.NAV_LEGADO if pos == 1 else CareerTheme.TEXT_DIM) \
					.vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 12)
	col.add_child(pie)
	var texto: String = I18n.tf("PUESTO {0} DE {1}", [pos, int(puesto[1])]) \
			if estado == Amigos.PUESTO else I18n.t(estado)
	var est: Label = _dato(pie, texto, CareerTheme.T_BODY, tinte)
	est.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	est.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var quedan: String = _quedan(int(r.get("vence", 0)))
	if quedan != "" and estado in [Amigos.TE_TOCA, Amigos.ESPERANDO]:
		_cifra(pie, quedan, CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM).vertical_alignment = \
				VERTICAL_ALIGNMENT_CENTER
	var tabla: Button = Button.new()
	tabla.text = I18n.t("TABLA")
	tabla.custom_minimum_size = Vector2(170, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(tabla, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	tabla.pressed.connect(_tabla_grupo.bind(r))
	pie.add_child(tabla)
	if estado == Amigos.TE_TOCA:
		var jugar: Button = Button.new()
		jugar.text = I18n.t("JUGAR")
		jugar.custom_minimum_size = Vector2(220, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(jugar, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
		jugar.pressed.connect(_jugar_reto.bind(r))
		pie.add_child(jugar)





const FILA_GRUPO: float = 60.0
const FILA_GRUPO_SEP: float = 8.0









func _tabla_grupo(r: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("RETO EN GRUPO"), _icono(Amigos.icono_reto(String(r.tipo)),
		CareerTheme.NAV_GENTE), I18n.tf("{0} · {1} JUGADAS", [I18n.t(Practice.label_of(String(r.tipo))),
		int(r.jugadas)]), CareerTheme.NAV_GENTE)
	var filas: Array[Dictionary] = Amigos.tabla_grupo(r)
	var alto: float = SceneFade.rect_visible(self).size.y
	var caben: int = maxi(6, int((alto - 440.0) /(FILA_GRUPO + FILA_GRUPO_SEP)))
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = clampi(ceili(filas.size() / float(caben)), 1, 4)









	if UiKit.es_horizontal():
		rejilla.columns = clampi(ceili(filas.size() / 6.0), 1, 5)
	rejilla.add_theme_constant_override("h_separation", 16)
	rejilla.add_theme_constant_override("v_separation", int(FILA_GRUPO_SEP))
	box.add_child(rejilla)

	var por_col: int = ceili(filas.size() / float(rejilla.columns))
	for k in por_col * rejilla.columns:
		var i: int =(k % rejilla.columns) * por_col + k / rejilla.columns
		if i < filas.size():
			_fila_grupo(rejilla, filas[i])
		else:
			var hueco: Control = Control.new()
			hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			rejilla.add_child(hueco)
	var mio: Dictionary = Amigos.yo_en_grupo(r, Nube.uid)
	if not bool(mio.get("terminado", false)) and int(r.get("vence", 0)) > int(Time.get_unix_time_from_system()):
		var nota: Label = CareerUi.dim(box, I18n.t("Las marcas de los demás se ven al terminar la tuya."))
		nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var hueco_pie: Control = Control.new()
	hueco_pie.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(hueco_pie)
	var pie: HBoxContainer = HBoxContainer.new()
	pie.add_theme_constant_override("separation", 12)
	box.add_child(pie)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	cerrar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	pie.add_child(cerrar)
	if String(r.get("estado", "")) == Amigos.TE_TOCA:
		var jugar: Button = Button.new()
		jugar.text = I18n.t("JUGAR")
		jugar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		jugar.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(jugar, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
		jugar.pressed.connect(func() -> void:
			CareerUi.close_modal(box)
			_jugar_reto(r))
		pie.add_child(jugar)
	CareerUi.normalize_caps(box)


func _fila_grupo(parent: Container, f: Dictionary) -> void:
	var es_yo: bool = String(f.get("uid", "")) == Nube.uid
	var nombre: String = String(f.get("name", ""))
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", CareerTheme.plate_edged(
		CareerTheme.NAV_YO if es_yo else CareerTheme.TEXT_DIM))
	panel.custom_minimum_size.y = FILA_GRUPO
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(panel)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(row)
	var pos: int = int(f.get("pos", 0))
	var n: Label = _cifra(row, "%d." % pos if pos > 0 else "", CareerTheme.T_CARD,
		CareerTheme.NAV_LEGADO if pos == 1 else CareerTheme.TEXT_DIM)
	n.custom_minimum_size.x = 52
	n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var nat: String = String((f.get("carrera", {}) as Dictionary).get("nat", ""))
	if Flags.has(nat):
		var flag: TextureRect = Flags.make_rect(nat, 26.0)
		flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		flag.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(flag)



	var club: Dictionary = Teams.by_id(String((f.get("carrera", {}) as Dictionary).get("team_id", "")))
	if not club.is_empty():
		var escudo: CrestView = CrestView.new()
		escudo.custom_minimum_size = Vector2(36, 36)
		escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		escudo.set_team(club)
		row.add_child(escudo)
	var su_apodo: Variant =(f.get("carrera", {}) as Dictionary).get("apodo", "")
	var quien: String = I18n.t("TÚ") if es_yo else (CareerTheme.caps(nombre) if nombre != "" \
			else Apodo.o_codigo(_apodo_visible(su_apodo, String(f.get("code", ""))),
			String(f.get("code", ""))))
	if not es_yo and nombre == "":
		_toque_desconocido(panel, su_apodo, String(f.get("code", "")))
	var tinte: Color = CareerTheme.NAV_YO if es_yo else \
			(CareerTheme.NAV_GENTE if nombre != "" else CareerTheme.TEXT)
	var l: Label = _dato(row, quien, CareerTheme.T_BODY, tinte)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var jugo: bool = bool(f.get("empezado", false))
	var marca: int = int(f.get("marca", -1))
	var m: Label = _cifra(row, "–" if not jugo else ("?" if marca < 0 else str(marca)),
		CareerTheme.T_MONEY, CareerTheme.TEXT if jugo and marca >= 0 else CareerTheme.TEXT_DIM)
	m.custom_minimum_size.x = 44
	m.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	m.vertical_alignment = VERTICAL_ALIGNMENT_CENTER




func _color_estado(estado: String) -> Color:
	match estado:
		Amigos.TE_TOCA:
			return CareerTheme.NAV_GENTE
		Amigos.GANASTE:
			return CareerTheme.NAV_LEGADO
		Amigos.PERDISTE:
			return CareerTheme.DANGER
	return CareerTheme.TEXT_DIM



func _quedan(vence: int) -> String:
	var s: int = vence - int(Time.get_unix_time_from_system())
	if s <= 0:
		return ""
	if s < 48 * 3600:
		return I18n.tf("QUEDAN {0} H", [maxi(1, s / 3600)])
	return I18n.tf("QUEDAN {0} D", [s / 86400])






func _abrir_retar(amigo: Dictionary, suya: String = "", mia: String = "") -> void:
	if Amigos.demo():
		SalonFamaPantalla.aviso(self, I18n.t("Agrega un amigo para retarlo."))
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var tu: Dictionary = Amigos.yo()
	var sel: Dictionary = {"amigo": amigo, "tipo": 0, "jugadas": 1, "suya": suya,
		"mia": mia if mia != "" else String(tu.get("cid", ""))}
	CareerUi.head(box, I18n.t("RETAR"), null, "", CareerTheme.NAV_GENTE)
	var jugadores: VBoxContainer = VBoxContainer.new()
	jugadores.add_theme_constant_override("separation", 10)
	if amigo.is_empty():
		var nombres: Array = []
		for a in Nube.amigos:
			nombres.append(CareerTheme.caps(String(a.name)))
		sel.amigo = Nube.amigos[0]
		CareerUi.tab_chips(box, nombres, 0, func(i: int) -> void:
			sel.amigo = Nube.amigos[i]
			sel.suya = ""
			_pinta_jugadores(jugadores, sel, tu), CareerTheme.NAV_GENTE)
	else:
		_dato(box, CareerTheme.caps(String(amigo.name)), CareerTheme.T_CARD, CareerTheme.NAV_GENTE)
	box.add_child(jugadores)
	_pinta_jugadores(jugadores, sel, tu)

	_elige_ejercicio(box, sel)

	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var ok: Button = Button.new()
	ok.text = I18n.t("RETAR")
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(ok, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	box.add_child(ok)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	ok.pressed.connect(func() -> void:
		ok.disabled = true
		aviso.text = ""
		var err: String = await Nube.retar(String((sel.amigo as Dictionary).get("uid", "")),
			String(Amigos.TIPOS_RETO[int(sel.tipo)][0]), Amigos.JUGADAS[int(sel.jugadas)],
			String(sel.mia), "")
		if not is_instance_valid(box):
			return
		ok.disabled = false
		if err != "":
			aviso.text = I18n.t(err)
			return
		CareerUi.close_modal(box)
		SalonFamaPantalla.aviso(self, I18n.t("Reto enviado."))
		pestana = PESTANA_RETOS
		_repinta(true))
	CareerUi.normalize_caps(box)








func _abrir_retar_grupo() -> void:
	if Amigos.demo() or Nube.amigos.size() < Nube.GRUPO_MIN:
		SalonFamaPantalla.aviso(self, I18n.t("Agrega al menos dos amigos para un reto en grupo."))
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var tu: Dictionary = Amigos.yo()
	var uids: Array = []
	for a in Nube.amigos.slice(0, Nube.GRUPO_MAX):
		uids.append(String(a.get("uid", "")))
	var sel: Dictionary = {"amigo": {}, "suya": "", "uids": uids, "tipo": 0, "jugadas": 1,
		"mia": String(tu.get("cid", ""))}
	CareerUi.head(box, I18n.t("RETO EN GRUPO"), null, "", CareerTheme.NAV_GENTE)
	var gente: Button = Button.new()
	gente.custom_minimum_size = Vector2(0, 96)
	box.add_child(gente)
	var dentro: HBoxContainer = HBoxContainer.new()
	dentro.set_anchors_preset(Control.PRESET_FULL_RECT)
	dentro.alignment = BoxContainer.ALIGNMENT_CENTER
	dentro.add_theme_constant_override("separation", 14)
	dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	gente.add_child(dentro)
	var ic: Control = _icono("relaciones", CareerTheme.TEXT)
	ic.custom_minimum_size = Vector2(56, 56)
	dentro.add_child(ic)
	_cifra(dentro, I18n.t("JUGADORES"), CareerTheme.T_HEAD, CareerTheme.TEXT) \
			.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var cuenta: Label = _cifra(dentro, "", CareerTheme.T_MONEY, CareerTheme.TEXT)
	cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var pinta_gente: Callable = func() -> void:
		cuenta.text = "%d/%d" % [(sel.uids as Array).size(), Nube.GRUPO_MAX]
		if (sel.uids as Array).size() >= Nube.GRUPO_MIN:
			CareerTheme.apply_button_tinted(gente, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
		else:
			CareerTheme.apply_button(gente, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	pinta_gente.call()
	gente.pressed.connect(func() -> void: _elige_grupo(sel, pinta_gente))
	var jugadores: VBoxContainer = VBoxContainer.new()
	jugadores.add_theme_constant_override("separation", 10)
	box.add_child(jugadores)
	_pinta_jugadores(jugadores, sel, tu)
	_elige_ejercicio(box, sel)

	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var ok: Button = Button.new()
	ok.text = I18n.t("RETAR")
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(ok, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	box.add_child(ok)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	ok.pressed.connect(func() -> void:
		ok.disabled = true
		aviso.text = ""
		var err: String = await Nube.retar_grupo(sel.uids, String(Amigos.TIPOS_RETO[int(sel.tipo)][0]),
			Amigos.JUGADAS[int(sel.jugadas)], String(sel.mia))
		if not is_instance_valid(box):
			return
		ok.disabled = false
		if err != "":
			aviso.text = I18n.t(err)
			return
		CareerUi.close_modal(box)
		SalonFamaPantalla.aviso(self, I18n.t("Reto enviado."))
		pestana = PESTANA_RETOS
		_repinta(true))
	CareerUi.normalize_caps(box)




const CHIP_GRUPO: float = 64.0
const CHIP_GRUPO_SEP: float = 10.0








func _elige_grupo(sel: Dictionary, al_cerrar: Callable) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self, false)
	if box == null:
		return
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var cols: int = clampi(int((tam.x - 60.0) / 320.0), 2, 6)
	var filas: int = maxi(4, int((tam.y - 520.0) /(CHIP_GRUPO + CHIP_GRUPO_SEP)))
	var por_pagina: int = cols * filas
	var amigos: Array = Nube.amigos
	var estado: Dictionary = {"pagina": 0}
	CareerUi.head(box, I18n.t("JUGADORES"), _icono("relaciones", CareerTheme.NAV_GENTE), "",
		CareerTheme.NAV_GENTE)
	var arriba: HBoxContainer = HBoxContainer.new()
	arriba.add_theme_constant_override("separation", 12)
	box.add_child(arriba)
	var cuenta: Label = _cifra(arriba, "", CareerTheme.T_MONEY, CareerTheme.TEXT)
	cuenta.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cuenta.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = cols
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", int(CHIP_GRUPO_SEP))


	estado["pinta"] = func() -> void:
		var n: int =(sel.uids as Array).size()
		cuenta.text = "%d/%d" % [n, Nube.GRUPO_MAX]
		cuenta.add_theme_color_override("font_color",
			CareerTheme.DANGER if n < Nube.GRUPO_MIN else CareerTheme.TEXT)
		for h in rejilla.get_children():
			rejilla.remove_child(h)
			h.queue_free()
		var desde: int = int(estado.pagina) * por_pagina
		for a in amigos.slice(desde, desde + por_pagina):
			var uid: String = String((a as Dictionary).get("uid", ""))
			var b: Button = Button.new()
			b.text = CareerTheme.caps(String((a as Dictionary).get("name", "?")))
			b.clip_text = true
			b.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
			b.custom_minimum_size = Vector2(0, CHIP_GRUPO)
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			if (sel.uids as Array).has(uid):
				CareerTheme.apply_button_tinted(b, CareerTheme.NAV_GENTE, CareerTheme.T_BODY, 0.4)
			else:
				CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
			b.pressed.connect(func() -> void:
				var u: Array = sel.uids
				if u.has(uid):
					u.erase(uid)
				elif u.size() < Nube.GRUPO_MAX:
					u.append(uid)
				else:
					cuenta.add_theme_color_override("font_color", CareerTheme.DANGER)
					return
				(estado.pinta as Callable).call())
			rejilla.add_child(b)
	for d in [["TODOS", true], ["NINGUNO", false]]:
		var b: Button = Button.new()
		b.text = I18n.t(String(d[0]))
		b.custom_minimum_size = Vector2(200, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(b, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
		var todos: bool = bool(d[1])
		b.pressed.connect(func() -> void:
			var u: Array = sel.uids
			u.clear()
			if todos:
				for a in amigos.slice(0, Nube.GRUPO_MAX):
					u.append(String((a as Dictionary).get("uid", "")))
			(estado.pinta as Callable).call())
		arriba.add_child(b)
	var paginas: int = ceili(amigos.size() / float(por_pagina))
	if paginas > 1:
		var nums: Array = []
		for k in paginas:
			nums.append(str(k + 1))
		box.add_child(CareerUi.segmented(nums, 0, func(k: int) -> void:
			estado.pagina = k
			(estado.pinta as Callable).call()))
	box.add_child(rejilla)
	(estado.pinta as Callable).call()
	var hueco: Control = Control.new()
	hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(hueco)
	var listo: Button = Button.new()
	listo.text = I18n.t("ACEPTAR")
	listo.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(listo, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
	listo.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		al_cerrar.call())
	box.add_child(listo)
	CareerUi.normalize_caps(box)





func _elige_ejercicio(box: VBoxContainer, sel: Dictionary) -> void:
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = 3
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", 10)
	box.add_child(rejilla)
	var baldosas: Array[Button] = []
	for i in Amigos.TIPOS_RETO.size():
		var t: Array = Amigos.TIPOS_RETO[i]
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 150)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		rejilla.add_child(b)
		var v: VBoxContainer = VBoxContainer.new()
		v.set_anchors_preset(Control.PRESET_FULL_RECT)
		v.alignment = BoxContainer.ALIGNMENT_CENTER
		v.mouse_filter = Control.MOUSE_FILTER_IGNORE
		b.add_child(v)
		var ic: Control = _icono(String(t[1]), CareerTheme.TEXT)
		ic.custom_minimum_size = Vector2(56, 56)
		ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		v.add_child(ic)
		var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
		l.text = I18n.t(Practice.label_of(String(t[0])))
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(l)
		baldosas.append(b)
		b.pressed.connect(func() -> void:
			sel.tipo = i
			_marca_baldosas(baldosas, i))
	_marca_baldosas(baldosas, 0)


	_dato(box, I18n.t("JUGADAS"), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	var n: Array = []
	for j in Amigos.JUGADAS:
		n.append(str(j))
	box.add_child(CareerUi.segmented(n, 1, func(i: int) -> void: sel.jugadas = i))





func _pinta_jugadores(cont: VBoxContainer, sel: Dictionary, tu: Dictionary) -> void:
	for n in cont.get_children():
		cont.remove_child(n)
		n.queue_free()



	var mias: Array = Amigos.carreras_de(tu)
	if not mias.is_empty():
		sel.mia = String(Amigos.carrera(tu, String(sel.mia)).get("cid", ""))
		_dato(cont, I18n.t("TU JUGADOR"), CareerTheme.T_CAPTION, CareerTheme.NAV_YO)
		_tira_carreras(cont, mias, String(sel.mia), CareerTheme.NAV_YO, func(k: String) -> void:
			sel.mia = k
			_pinta_jugadores(cont, sel, tu))

	if sel.has("kit"):
		var club: Dictionary = Amigos.club_de(Amigos.carrera(tu, String(sel.mia)) \
				if not mias.is_empty() else {})




		var rival: Dictionary = GameState.current_rival()
		var suyos: Array[Button] = []
		var reparte: Callable = func() -> void:
			if rival.is_empty() or bool(sel.get("rival_tocado", false)):
				return
			sel.kit_rival = GameState.kit_slot_lejano(rival,
				GameState.kit_variant(club, int(sel.kit)).get("kit", Color.WHITE))
			_marca_uniformes(suyos, int(sel.kit_rival))
		reparte.call()
		_fila_uniformes(cont, sel, "kit", club, I18n.t("UNIFORME"), CareerTheme.NAV_YO, reparte)
		if not rival.is_empty():
			suyos.assign(_fila_uniformes(cont, sel, "kit_rival", rival, I18n.t("RIVAL"),
				CareerTheme.TEXT_DIM, func() -> void: sel.rival_tocado = true))
	CareerUi.normalize_caps(cont)









func _fila_uniformes(cont: VBoxContainer, sel: Dictionary, clave: String, club: Dictionary,
		titulo: String, tinte: Color, al_elegir: Callable) -> Array[Button]:
	_dato(cont, titulo, CareerTheme.T_CAPTION, tinte)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "Uniformes" if clave == "kit" else "UniformesRival"
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 12)
	cont.add_child(fila)
	var botones: Array[Button] = []
	for i in Amigos.KIT_SLOTS:
		var b: Button = Button.new()
		b.custom_minimum_size = HUB_TRAINING.KIT_BTN
		b.icon = JerseyArt.texture_dressed(GameState.kit_variant(club, i), club)
		b.expand_icon = false
		b.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		b.tooltip_text = I18n.t(HUB_TRAINING.KIT_NAMES[i])
		fila.add_child(b)
		botones.append(b)
		b.pressed.connect(func() -> void:
			sel[clave] = i
			UiAudio.toggle(true)
			_marca_uniformes(botones, i)
			al_elegir.call())
	_marca_uniformes(botones, int(sel[clave]))
	return botones


func _marca_uniformes(botones: Array[Button], elegido: int) -> void:
	for j in botones.size():
		JerseyArt.boton_look(botones[j], j == elegido)


func _marca_baldosas(baldosas: Array[Button], activa: int) -> void:
	for i in baldosas.size():
		if i == activa:
			CareerTheme.apply_button_tinted(baldosas[i], CareerTheme.NAV_GENTE, CareerTheme.T_CAPTION, 0.4)
		else:
			CareerTheme.apply_button(baldosas[i], CareerTheme.Kind.GHOST, CareerTheme.T_CAPTION)






func _jugar_reto(r: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("RETO"), null, "", CareerTheme.NAV_GENTE)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 16)
	box.add_child(fila)
	var ic: Control = _icono(Amigos.icono_reto(String(r.tipo)), CareerTheme.NAV_GENTE)
	ic.custom_minimum_size = Vector2(72, 72)
	fila.add_child(ic)
	var col: VBoxContainer = VBoxContainer.new()
	fila.add_child(col)


	_cifra(col, I18n.t(Practice.label_of(String(r.tipo))), CareerTheme.T_CARD, CareerTheme.TEXT)
	_cifra(col, I18n.tf("{0} JUGADAS", [int(r.jugadas)]), CareerTheme.T_HEAD, CareerTheme.NAV_GENTE)




	var con: Dictionary = r.get("con", {})
	var grupo: bool = bool(r.get("grupo", false))
	var sel: Dictionary = {"amigo": {}, "suya": "", "mia": "", "kit": 0, "kit_rival": -1}
	var tu: Dictionary = Amigos.yo()
	var guardada: String = String((Amigos.yo_en_grupo(r, Nube.uid).get("carrera", {}) \
			as Dictionary).get("cid", "")) if grupo else String(con.get("cid", ""))
	sel.mia = guardada if guardada != "" else String(tu.get("cid", ""))
	var jugadores: VBoxContainer = VBoxContainer.new()
	jugadores.add_theme_constant_override("separation", 10)
	box.add_child(jugadores)
	_pinta_jugadores(jugadores, sel, tu)
	var nota: Label = CareerUi.dim(box, I18n.t("Sólo vale el primer intento. Si sales, cuenta lo que lleves."))
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var jugar: Button = Button.new()
	jugar.text = I18n.t("JUGAR")
	jugar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(jugar, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
	box.add_child(jugar)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	jugar.pressed.connect(func() -> void:
		jugar.disabled = true
		aviso.text = ""
		var d: Dictionary = await Nube.empezar_reto(String(r.id), String(sel.mia), grupo)
		if not is_instance_valid(box):
			return
		if d.has("error"):
			jugar.disabled = false
			aviso.text = I18n.t(String(d.error))
			return


		var juega: Dictionary = Amigos.carrera(Amigos.yo(), String(sel.mia))
		if juega.is_empty():
			juega = con
		lanzar_reto(String(r.id), String(d.get("tipo", r.tipo)), int(d.get("jugadas", r.jugadas)),
			int(d.get("semilla", 0)), juega, int(sel.kit), int(sel.kit_rival)))
	CareerUi.normalize_caps(box)








static func lanzar_reto(id: String, tipo: String, jugadas: int, semilla: int,
		con: Dictionary = {}, kit: int = -1, kit_rival: int = -1) -> void:
	GameState.encargo = {"kind": tipo, "tries": jugadas, "need": jugadas,
		"modo": Encargo.MODO_TIRO, "reto": id, "semilla": semilla,
		"cualidades": Amigos.cualidades_de(con)}
	if kit_rival >= 0 and kit_rival < Amigos.KIT_SLOTS:
		GameState.encargo["kit_rival"] = kit_rival
	GameState.encargo_result = {}
	GameState.practice_kind = tipo
	GameState.practice_venue = GameState.VENUE_STADIUM
	GameState.next_weather = "day"
	GameState.next_rain = -1
	GameState.training_active = false
	GameState.training_home = false
	GameState.readonly_save = true
	GameState.nat_match_active = false
	Amigos.prestar(con, kit, kit_rival)
	SceneFade.to_scene("res://features/match/match.tscn")



func _resultado_reto(res: Dictionary) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("RETO"), null, "", CareerTheme.NAV_GENTE)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 14)
	box.add_child(fila)
	var ic: Control = _icono("gol", CareerTheme.STAT_GOAL)
	ic.custom_minimum_size = Vector2(72, 72)
	fila.add_child(ic)
	_cifra(fila, "%d / %d" % [int(res.get("logrado", 0)), int(res.get("tries", 0))],
		CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_YO).vertical_alignment = VERTICAL_ALIGNMENT_CENTER

	var de_grupo: bool = Nube.retos_grupo.any(func(g: Dictionary) -> bool:
		return String(g.id) == String(res.get("reto", "")))
	var nota: Label = CareerUi.dim(box, I18n.t("Marca guardada. El resultado sale cuando jueguen todos.") \
			if de_grupo else I18n.t("Marca guardada. El resultado sale cuando juegue tu amigo."))
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	nota.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void:
		CareerUi.close_modal(box)
		_repinta(true))
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)








func _fill_mundo(cat: Array) -> void:
	var cat_id: String = String(cat[0])
	var clave: String = Nube.clave_ranking(cat_id, filtro_nat, filtro_liga, filtro_club)
	_filtros_mundo(cat_id)
	if not _pedidos.has(clave):
		_pedidos[clave] = true
		_pide_ranking(cat_id, filtro_nat, filtro_liga, filtro_club)
	var filas: Array = Nube.rankings.get(clave, [])
	if filas.is_empty():



		if Nube.rankings.has(clave):
			_vacio(I18n.t("SIN RESULTADOS"))
		elif Nube.sin_red or not Nube.activa() or not bool(_pedidos.get(clave, true)):
			_vacio(I18n.t("SIN CONEXIÓN"))
		else:
			_vacio(I18n.t("Cargando…"))
	var anterior: int = 0
	for p in filas:
		if int(p.pos) > anterior + 1 and anterior > 0:
			_dato(_body, "···", CareerTheme.T_HEAD, CareerTheme.TEXT_DIM) \
					.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		anterior = int(p.pos)
		_fila_mundo(p, cat)
	var salir: Button = Button.new()
	salir.text = I18n.t("SALIR DEL RANKING") if Nube.en_ranking else I18n.t("ENTRAR EN EL RANKING")
	salir.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(salir, CareerTheme.Kind.GHOST, CareerTheme.T_BODY)
	salir.pressed.connect(func() -> void:


		if _pide_si_falta(_fill):
			return
		salir.disabled = true
		if not await Nube.pon_en_ranking(not Nube.en_ranking):
			SalonFamaPantalla.aviso(self, I18n.t("SIN CONEXIÓN"))
		_pedidos.clear()
		if is_inside_tree():
			_fill())
	if not Nube.acepto:
		_body.add_child(salir)
		return


	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	salir.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	salir.clip_text = true
	fila.add_child(salir)
	fila.add_child(_boton_borrar_cuenta())
	_body.add_child(fila)







func _fill_ligas(cat: Array) -> void:
	var lista: Array[Dictionary] = Nube.ligas
	if lista.is_empty():
		_vacio(I18n.t("Crea una liga y pasa su código: 28 días, gana quien más sume."))
	else:
		if not lista.any(func(l: Dictionary) -> bool: return String(l.id) == liga_vista):
			liga_vista = String(lista[0].id)
		if lista.size() > 1:
			var codigos: Array = []
			var sel: int = 0
			for i in lista.size():
				codigos.append(String(lista[i].codigo))
				if String(lista[i].id) == liga_vista:
					sel = i
			CareerUi.tab_chips(_body, codigos, sel, func(i: int) -> void:
				liga_vista = String(lista[i].id)
				_fill(), CareerTheme.NAV_GENTE)
		var liga: Dictionary = lista.filter(func(l: Dictionary) -> bool:
			return String(l.id) == liga_vista)[0]
		_cabecera_liga(liga)
		var clave: String = "liga:" + liga_vista
		if not _pedidos.has(clave):
			_pedidos[clave] = true
			_pide_liga(liga_vista)
		var filas: Array = Nube.tablas_liga.get(liga_vista, [])
		if filas.is_empty():
			_vacio(I18n.t("SIN CONEXIÓN") if Nube.sin_red or not Nube.activa() \
					or not bool(_pedidos.get(clave, true)) else I18n.t("Cargando…"))
		var tabla: Array[Dictionary] = Amigos.tabla_liga(filas, String(cat[0]))
		if tabla.any(func(f: Dictionary) -> bool:
				return bool(f.get("yo", false)) and bool(f.get("espera", false))):
			_vacio(I18n.t("Empieza una carrera nueva para contar en esta liga."))


		var mov: Array[Dictionary] = []
		if Nube.liga_antes.has(liga_vista) and Amigos.dias_liga(int(liga.termina)) > 0:
			mov = Amigos.movimiento_liga(Nube.liga_antes[liga_vista].get("filas", []), filas)
		if not mov.is_empty():
			var tira: HFlowContainer = HFlowContainer.new()
			tira.add_theme_constant_override("h_separation", 14)
			_body.add_child(tira)
			for m in mov.slice(0, 4):

				var quien: String = CareerTheme.caps(String(m.name)) if String(m.name) != "" \
						else Apodo.o_codigo(_apodo_visible(m.get("apodo", ""), String(m.code)), String(m.code))
				_chip(tira, "gol", "%s +%d" % [quien, int(m.ga)],
					CareerTheme.NAV_YO if bool(m.yo) else CareerTheme.STAT_GOAL)
		for p in tabla:
			_fila_mundo(p, cat)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	_body.add_child(fila)
	var crear: Button = Button.new()
	crear.text = I18n.t("CREAR LIGA")
	crear.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	crear.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	crear.clip_text = true
	CareerTheme.apply_button(crear, CareerTheme.Kind.PRIMARY, CareerTheme.T_BODY)
	crear.pressed.connect(_abrir_crear)
	fila.add_child(crear)
	var unir: Button = Button.new()
	unir.text = I18n.t("UNIRSE")
	unir.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	unir.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	unir.clip_text = true
	CareerTheme.apply_button_tinted(unir, CareerTheme.NAV_GENTE, CareerTheme.T_BODY, 0.4)
	unir.pressed.connect(_abrir_unirse)
	fila.add_child(unir)





func _cabecera_liga(liga: Dictionary) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	_body.add_child(fila)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(col)
	_cifra(col, String(liga.codigo), CareerTheme.T_HEAD, CareerTheme.NAV_GENTE)
	var dias: int = Amigos.dias_liga(int(liga.termina))
	var linea: HBoxContainer = HBoxContainer.new()
	linea.add_theme_constant_override("separation", 14)
	col.add_child(linea)
	_chip(linea, "jornada", I18n.tf("{0} D", [dias]) if dias > 0 else I18n.t("TERMINADA"),
		CareerTheme.TEXT if dias > 0 else CareerTheme.NAV_LEGADO)
	_chip(linea, "relaciones", "%d/20" % int(liga.miembros), CareerTheme.NAV_GENTE)
	if bool(liga.get("cero", false)):
		_dato(col, I18n.t("DESDE CERO"), CareerTheme.T_CAPTION, CareerTheme.NAV_GENTE)

	if dias <= 0:
		var final: Array[Dictionary] = Amigos.tabla_liga(Nube.tablas_liga.get(String(liga.id), []), "ga")
		_podio_liga(final.filter(func(f: Dictionary) -> bool: return not bool(f.get("espera", false))))

	if dias <= 0 and bool(liga.get("creador", false)):
		var otra: Button = Button.new()
		otra.text = I18n.t("OTRA TEMPORADA")
		otra.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		otra.clip_text = true
		CareerTheme.apply_button(otra, CareerTheme.Kind.PRIMARY, CareerTheme.T_BODY)
		otra.pressed.connect(func() -> void:
			otra.disabled = true
			var err: String = await Nube.renovar_liga(String(liga.id))
			if not is_inside_tree():
				return
			if err != "":
				SalonFamaPantalla.aviso(self, I18n.t(err))
			else:
				liga_vista = String(Nube.ligas[0].id) if not Nube.ligas.is_empty() else ""
			_fill())
		_body.add_child(otra)
	var invitar: Button = Button.new()
	invitar.text = I18n.t("INVITAR")
	invitar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(invitar, CareerTheme.NAV_GENTE, CareerTheme.T_BODY, 0.4)
	invitar.pressed.connect(func() -> void:
		DisplayServer.clipboard_set(I18n.tf("Únete a mi liga de Football Legacy: código {0}",
			[String(liga.codigo)]))
		SalonFamaPantalla.aviso(self, I18n.t("Invitación copiada.")))
	fila.add_child(invitar)
	var salir: Button = Button.new()


	salir.text = I18n.t("SALIR", "liga")
	salir.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(salir, CareerTheme.Kind.WARN, CareerTheme.T_BODY)




	salir.pressed.connect(_confirma_salir_liga.bind(liga, salir))
	fila.add_child(salir)

















func _confirma_salir_liga(liga: Dictionary, boton: Button) -> void:
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	var id: String = String(liga.id)
	CareerUi.head(box, I18n.t("¿SALIR DE LA LIGA?"), null, "", CareerTheme.NAV_GENTE)
	_cifra(box, String(liga.codigo), CareerTheme.T_TITLE_MODAL, CareerTheme.NAV_GENTE) \
			.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var mia: Array = Amigos.tabla_liga(Nube.tablas_liga.get(id, []), "ga") \
			.filter(func(f: Dictionary) -> bool: return bool(f.get("yo", false)))
	if not mia.is_empty():
		var tira: HBoxContainer = HBoxContainer.new()
		tira.alignment = BoxContainer.ALIGNMENT_CENTER
		box.add_child(tira)
		_chip(tira, "gol+asist", str(int(mia[0].valor)), CareerTheme.DANGER)
	var viva: bool = Amigos.dias_liga(int(liga.termina)) > 0
	var nota: Label = CareerUi.dim(box, I18n.t("Si vuelves, empiezas de 0.") if viva
		else I18n.t("No podrás volver."))
	nota.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	var no: Button = CareerUi.menu_row(I18n.t("CANCELAR"), "")
	no.set_meta("atras", true)
	no.set_meta(Entrada.PRIMERO_META, true)
	no.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(no)
	var si: Button = CareerUi.accion("puerta", I18n.t("SALIR", "liga"), CareerTheme.DANGER, true)
	si.pressed.connect(func() -> void:
		si.disabled = true
		if is_instance_valid(boton):
			boton.disabled = true
		CareerUi.close_modal(box)
		if not await _salir_de_liga(id):
			SalonFamaPantalla.aviso(self, I18n.t("SIN CONEXIÓN"))
		if is_inside_tree():
			_fill())
	box.add_child(si)
	CareerUi.normalize_caps(box)





func _salir_de_liga(id: String) -> bool:
	return await Nube.salir_liga(id)






const PODIO_ALTO: Array[float] = [150.0, 110.0, 80.0]


func _podio_liga(final: Array) -> void:
	if final.is_empty():
		return
	var podio: HBoxContainer = HBoxContainer.new()
	podio.alignment = BoxContainer.ALIGNMENT_CENTER
	podio.add_theme_constant_override("separation", 12)
	_body.add_child(podio)
	var metal: Array[Color] = [TrophyIcon.GOLD, TrophyIcon.SILVER, TrophyIcon.BRONZE]
	for k in [1, 0, 2]:
		if k >= final.size():
			continue
		var f: Dictionary = final[k]
		var col: VBoxContainer = VBoxContainer.new()
		col.alignment = BoxContainer.ALIGNMENT_END
		col.add_theme_constant_override("separation", 6)
		col.size_flags_vertical = Control.SIZE_FILL
		podio.add_child(col)
		if k == 0:
			var corona: Control = _icono("corona", CareerTheme.MONEY)
			corona.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
			col.add_child(corona)
		var cromo: PlayerCard = PlayerCard.build_archivado(f, Teams.by_id(String(f.get("team_id", ""))),
			String(f.get("nat", "")), f.get("look", {}) as Dictionary)
		cromo.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		col.add_child(cromo)
		var escalon: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = metal[k]
		sb.corner_radius_top_left = 14
		sb.corner_radius_top_right = 14
		escalon.add_theme_stylebox_override("panel", sb)
		escalon.custom_minimum_size = Vector2(0, PODIO_ALTO[k])
		col.add_child(escalon)
		var cifras: VBoxContainer = VBoxContainer.new()
		cifras.alignment = BoxContainer.ALIGNMENT_CENTER
		cifras.add_theme_constant_override("separation", 0)
		escalon.add_child(cifras)
		var pos: Label = _cifra(cifras, str(k + 1), CareerTheme.T_HEAD + 8, CareerTheme.INK_DARK)
		pos.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		var ga: HBoxContainer = HBoxContainer.new()
		ga.alignment = BoxContainer.ALIGNMENT_CENTER
		ga.add_theme_constant_override("separation", 4)
		cifras.add_child(ga)
		ga.add_child(_icono("gol+asist", CareerTheme.INK_DARK))
		_cifra(ga, str(int(f.get("valor", 0))), CareerTheme.T_BODY, CareerTheme.INK_DARK)


func _pide_liga(id: String) -> void:
	var ok: bool = await Nube.traer_tabla_liga(id)
	if not ok:
		_pedidos["liga:" + id] = false

	if is_inside_tree() and pestana == PESTANA_TABLA and en_ligas and liga_vista == id:
		_fill.call_deferred()





func _abrir_crear() -> void:
	if _pide_si_falta(_abrir_crear):
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("CREAR LIGA"), null, "", CareerTheme.NAV_GENTE)
	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	for cero in [false, true]:
		var b: Button = Button.new()
		b.text = I18n.t("DESDE CERO") if cero else I18n.t("CON TU CARRERA")
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button_tinted(b, CareerTheme.NAV_GENTE if cero else CareerTheme.NAV_YO,
			CareerTheme.T_HEAD, 0.4)
		box.add_child(b)
		CareerUi.dim(box, I18n.t("Sólo cuenta una carrera que empieces después de crearla.") if cero
			else I18n.t("Cuenta lo que sumes desde hoy con tu carrera."))
		b.pressed.connect(func() -> void:
			if not Nube.activa():
				aviso.text = I18n.t("SIN CONEXIÓN")
				return
			b.disabled = true
			var err: String = await Nube.crear_liga(cero)
			if not is_instance_valid(box):
				return
			b.disabled = false
			if err != "":
				aviso.text = I18n.t(err)
				return
			CareerUi.close_modal(box)
			liga_vista = String(Nube.ligas[0].id) if not Nube.ligas.is_empty() else ""
			_fill())
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)



func _abrir_unirse() -> void:
	if _pide_si_falta(_abrir_unirse):
		return
	var box: VBoxContainer = CareerUi.modal(self)
	if box == null:
		return
	CareerUi.head(box, I18n.t("UNIRSE A UNA LIGA"), null, "", CareerTheme.NAV_GENTE)
	var edit: LineEdit = CareerUi.campo("", 6, "ABC234")

	edit.set_meta(Entrada.TECLADO_SIN_MAYUS_META, true)
	box.add_child(edit)
	var aviso: Label = CareerUi.dim(box, "")
	aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	aviso.add_theme_color_override("font_color", CareerTheme.DANGER)
	var ok: Button = Button.new()
	ok.text = I18n.t("UNIRSE")
	ok.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button_tinted(ok, CareerTheme.NAV_GENTE, CareerTheme.T_HEAD, 0.4)
	box.add_child(ok)
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	ok.pressed.connect(func() -> void:
		if edit.text.strip_edges().length() != 6:
			aviso.text = I18n.t("LIGA NO ENCONTRADA")
			return
		ok.disabled = true
		aviso.text = ""
		var err: String = await Nube.unirse_liga(edit.text)
		if not is_instance_valid(box):
			return
		ok.disabled = false
		if err != "":
			aviso.text = I18n.t(err)
			return
		CareerUi.close_modal(box)
		for l in Nube.ligas:
			if String(l.codigo) == edit.text.strip_edges().to_upper():
				liga_vista = String(l.id)
		_fill())
	CareerUi.normalize_caps(box)




func _pide_ranking(cat_id: String, nat: String, liga: String, club: String = "") -> void:
	var ok: bool = await Nube.traer_ranking(cat_id, nat, liga, club)
	if not ok:
		_pedidos[Nube.clave_ranking(cat_id, nat, liga, club)] = false



	if is_inside_tree() and pestana == PESTANA_TABLA and mundo \
			and String(Amigos.CATEGORIAS[categoria][0]) == cat_id \
			and filtro_nat == nat and filtro_liga == liga and filtro_club == club:
		_fill.call_deferred()







func _filtros_mundo(cat_id: String) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	_body.add_child(fila)
	var con_nat: bool = filtro_nat != ""
	var nat_ico: Control = Flags.make_rect(filtro_nat, 30.0) if con_nat \
			else _icono("mundo", CareerTheme.NAV_GENTE)
	_filtro(fila, nat_ico, Nations.display_name(filtro_nat) if con_nat else I18n.t("PAÍS"),
		con_nat, _elige_nat.bind(cat_id), func() -> void:
			filtro_nat = ""
			_fill())
	var con_liga: bool = filtro_liga != ""
	var liga_ico: Control
	if con_liga:
		var logo: CompLogo = CompLogo.new()
		logo.custom_minimum_size = Vector2(CHIP_ICO, CHIP_ICO)
		logo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		logo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		logo.setup(Competitions.league_logo(filtro_liga), Teams.accent(filtro_liga))
		liga_ico = logo
	else:
		liga_ico = _icono("trofeo:liga", CareerTheme.NAV_GENTE)
	_filtro(fila, liga_ico, Competitions.league_label(filtro_liga) if con_liga else I18n.t("LIGA"),
		con_liga, _elige_liga.bind(cat_id), func() -> void:


			filtro_liga = ""
			filtro_club = ""
			_fill())


	var con_club: bool = filtro_club != ""
	var club_ico: Control
	if con_club:
		var escudo: CrestView = CrestView.new()
		escudo.custom_minimum_size = Vector2(CHIP_ICO, CHIP_ICO)
		escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		escudo.set_team(Teams.by_id(filtro_club))
		club_ico = escudo
	else:
		club_ico = _icono("equipo", CareerTheme.NAV_GENTE)
	_filtro(fila, club_ico, _club({"team_id": filtro_club}) if con_club else I18n.t("CLUB"),
		con_club, _elige_club.bind(cat_id), func() -> void:
			filtro_club = ""
			_fill())




func _filtro(fila: HBoxContainer, ico: Control, texto: String, puesto: bool,
		al_tocar: Callable, al_quitar: Callable) -> void:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, 62)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.focus_mode = Control.FOCUS_NONE



	CareerTheme.apply_button_tinted(b, CareerTheme.NAV_GENTE, CareerTheme.T_BODY,
		0.5 if puesto else 0.22)
	b.pressed.connect(al_tocar)
	fila.add_child(b)
	var dentro: HBoxContainer = HBoxContainer.new()
	dentro.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	dentro.offset_left = 16.0
	dentro.offset_right = -16.0
	dentro.add_theme_constant_override("separation", 10)
	dentro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	b.add_child(dentro)
	dentro.add_child(ico)
	var l: Label = _dato(dentro, CareerTheme.caps(texto), CareerTheme.T_BODY,
		CareerTheme.TEXT if puesto else CareerTheme.TEXT_DIM)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	if not puesto:
		return
	var quita: Button = Button.new()
	quita.custom_minimum_size = Vector2(62, 62)
	quita.focus_mode = Control.FOCUS_NONE
	CareerTheme.apply_button(quita, CareerTheme.Kind.NEUTRAL, CareerTheme.T_BODY)
	quita.pressed.connect(al_quitar)
	fila.add_child(quita)
	var centro: CenterContainer = CenterContainer.new()
	centro.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	quita.add_child(centro)
	centro.add_child(_icono("cerrar", CareerTheme.TEXT))




func _elige_nat(cat_id: String) -> void:
	var items: Array = []
	for n in Nations.POOL:
		var id: String = String(n["id"])
		items.append({"id": id, "name": Nations.display_name(id)})
	items.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return String(a.name).naturalnocasecmp_to(String(b.name)) < 0)
	var sug: Array = []
	for c in _carreras_cerca(cat_id):
		_sugiere(sug, Nations.canon_id(String(c.get("nat", ""))))
	FlagPicker.open(self, I18n.t("PAÍS"), items, filtro_nat, func(id: String) -> void:
		filtro_nat = id
		_fill(), sug)




func _elige_liga(cat_id: String) -> void:
	var paises: Array = []
	for t in Teams.all():
		var pais: String = String(t.get("country", ""))
		if pais != "" and not paises.has(pais):
			paises.append(pais)
	var items: Array = []




	for pais in paises:
		items.append({"id": pais, "name": Competitions.league_label(String(pais)),
			"flag": pais, "liga": pais, "busca": I18n.t(String(pais))})
	items.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return String(a.name).naturalnocasecmp_to(String(b.name)) < 0)
	var sug: Array = []
	for c in _carreras_cerca(cat_id):
		var club: String = String(c.get("team_id", ""))
		if club != "":
			_sugiere(sug, Teams.country_of(club))
	FlagPicker.open(self, I18n.t("LIGA"), items, filtro_liga, func(id: String) -> void:
		filtro_liga = id
		if filtro_club != "" and Teams.country_of(filtro_club) != id:
			filtro_club = ""
		_fill(), sug)





func _elige_club(cat_id: String) -> void:
	var desde: Dictionary = Teams.by_id(filtro_club) if filtro_club != "" else {}
	if desde.is_empty() and filtro_liga != "":
		desde = {"country": filtro_liga, "div": 1}
	if desde.is_empty():
		for c in _carreras_cerca(cat_id):
			var t: Dictionary = Teams.by_id(String(c.get("team_id", "")))
			if not t.is_empty():
				desde = {"country": String(t.get("country", "")), "div": int(t.get("div", 1))}
				break
	WorldPicker.open(self, I18n.t("CLUB"), desde, func(club: Dictionary) -> void:
		var id: String = String(club.get("id", ""))
		if id == "":
			return
		filtro_club = id
		filtro_liga = Teams.country_of(id)
		_fill(), true)




func _carreras_cerca(cat_id: String) -> Array:
	var out: Array = []
	out.append_array(Amigos.carreras_de(Amigos.yo()))
	for a in Amigos.lista():
		out.append_array(Amigos.carreras_de(a))
	out.append_array(Nube.rankings.get(cat_id, []))
	return out


func _sugiere(sug: Array, id: String) -> void:
	if id != "" and not sug.has(id) and sug.size() < FILTRO_SUGERIDAS:
		sug.append(id)


func _fila_mundo(p: Dictionary, cat: Array) -> void:
	var es_yo: bool = bool(p.get("yo", false))
	var team: Dictionary = Teams.by_id(String(p.get("team_id", "")))
	var panel: PanelContainer = PanelContainer.new()
	panel.add_theme_stylebox_override("panel", KitPattern.stylebox(team, int(p.get("season", 1))))
	_body.add_child(panel)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_child(row)
	if es_yo:
		var barra: ColorRect = ColorRect.new()
		barra.color = CareerTheme.NAV_YO
		barra.custom_minimum_size = Vector2(8, 0)
		barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(barra)
	var pos: int = int(p.pos)
	var n: Label = _cifra(row, "%d." % pos, CareerTheme.T_CARD,
		CareerTheme.NAV_LEGADO if pos == 1 else _tinta(0.72))
	n.custom_minimum_size = Vector2(80, 0)
	n.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_hueco_cromo(row, p)
	var nat: String = String(p.get("nat", ""))
	if Flags.has(nat):
		var flag: TextureRect = Flags.make_rect(nat, 30.0)
		flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		flag.mouse_filter = Control.MOUSE_FILTER_IGNORE
		row.add_child(flag)
	var col: VBoxContainer = VBoxContainer.new()
	col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(col)
	var nombre: String = String(p.get("name", ""))
	var titulo: String = I18n.t("TÚ") if es_yo else (CareerTheme.caps(nombre) if nombre != "" \
			else Apodo.o_codigo(_apodo_visible(p.get("apodo", ""), String(p.code)), String(p.code)))
	if not es_yo and nombre == "" and not bool(p.get("amigo", false)):
		_toque_desconocido(panel, p.get("apodo", ""), String(p.code))
	var tinte: Color = CareerTheme.NAV_YO if es_yo else \
			(CareerTheme.NAV_GENTE if bool(p.get("amigo", false)) else CareerTheme.INK_LIGHT)
	_nombre_fila(col, titulo, tinte, p)
	_dato(col, CareerTheme.caps(_club(p)), CareerTheme.T_CAPTION, _tinta(0.58))
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(48, 48)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.mouse_filter = Control.MOUSE_FILTER_IGNORE
	crest.set_team(team)
	row.add_child(crest)
	var cifra: HBoxContainer = HBoxContainer.new()
	cifra.add_theme_constant_override("separation", 8)
	cifra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(cifra)
	cifra.add_child(_icono(String(cat[2]), CareerTheme.INK_LIGHT))
	_cifra(cifra, str(int(p.valor)), CareerTheme.T_MONEY, CareerTheme.INK_LIGHT) \
			.vertical_alignment = VERTICAL_ALIGNMENT_CENTER







const CROMO_FILA_ESCALA: float = 0.5

const CROMO_FILA_ALTO: float = 274.0


func _hueco_cromo(row: Container, p: Dictionary) -> void:
	var hueco: Control = Control.new()
	hueco.name = "HuecoCromo"
	hueco.custom_minimum_size = Vector2(PlayerCard.MIN_W, CROMO_FILA_ALTO) * CROMO_FILA_ESCALA
	hueco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	row.add_child(hueco)
	_cromos_pendientes.append([hueco, p])
	_pide_cromos()


func _pide_cromos() -> void:
	if _cromos_en_cola or _cromos_pendientes.is_empty() or not is_inside_tree():
		return
	_cromos_en_cola = true


	SceneFade.arbol().process_frame.connect(_monta_cromos, CONNECT_ONE_SHOT)



func _monta_cromos() -> void:
	_cromos_en_cola = false
	if _scroll == null or not is_instance_valid(_scroll):
		return
	var vista: Rect2 = _scroll.get_global_rect().grow_individual(0, _scroll.size.y, 0, _scroll.size.y)
	var quedan: Array = []
	for e in _cromos_pendientes:


		if not is_instance_valid(e[0]):
			continue
		var hueco: Control = e[0]
		if not hueco.is_inside_tree() or hueco.is_queued_for_deletion():
			continue
		if vista.intersects(hueco.get_global_rect()):
			_monta_cromo(hueco, e[1])
		else:
			quedan.append(e)
	_cromos_pendientes = quedan


func _monta_cromo(hueco: Control, p: Dictionary) -> void:
	var ficha: Dictionary = p.duplicate()


	if String(ficha.get("name", "")) == "":
		var code: String = String(p.get("code", ""))
		var ape: String = Apodo.apellido(_apodo_visible(p.get("apodo", ""), code))
		ficha["name"] = ape if ape != "" else "#" + code
	var cromo: PlayerCard = PlayerCard.build_archivado(ficha,
		Teams.by_id(String(p.get("team_id", ""))), String(p.get("nat", "")),
		p.get("look", {}) as Dictionary)
	cromo.scale = Vector2.ONE * CROMO_FILA_ESCALA

	cromo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hueco.add_child(cromo)
	cromo.size = cromo.get_combined_minimum_size()
	hueco.custom_minimum_size = cromo.size * CROMO_FILA_ESCALA






func _nombre_fila(col: Container, texto: String, tinte: Color, p: Dictionary,
		dos_renglones: bool = true) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(fila)
	var l: Label = _dato(fila, texto, CareerTheme.T_HEAD, tinte)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if bool(p.get("retired", false)):
		_pastilla(fila, p)
	if not dos_renglones:
		return



	l.clip_text = false
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.max_lines_visible = 2





func _pastilla(parent: Container, c: Dictionary) -> void:
	var p: PanelContainer = CareerUi.status_pill(not bool(c.get("retired", false)),
		CareerTheme.T_CAPTION)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(p)
	if bool(c.get("hof", false)):
		var ic: Control = _icono("vitrina", CareerTheme.NAV_LEGADO)
		ic.custom_minimum_size = Vector2(30, 30)
		parent.add_child(ic)














func _celda_cromo(parent: Container, c: Dictionary, tinte: Color,
		apagado: bool = false) -> PlayerCard:
	var celda: VBoxContainer = VBoxContainer.new()
	celda.add_theme_constant_override("separation", 6)
	celda.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	celda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(celda)
	var cromo: PlayerCard = PlayerCard.build_archivado(c,
		Teams.by_id(String(c.get("team_id", ""))), String(c.get("nat", "")),
		c.get("look", {}) as Dictionary)
	cromo.apaga(apagado)
	celda.add_child(cromo)
	var raya: ColorRect = ColorRect.new()
	raya.custom_minimum_size = Vector2(0, RAYA_DUENO)
	raya.color = tinte
	raya.modulate.a = 0.0 if apagado else 1.0
	raya.mouse_filter = Control.MOUSE_FILTER_IGNORE
	celda.add_child(raya)
	var pie: HBoxContainer = HBoxContainer.new()
	pie.alignment = BoxContainer.ALIGNMENT_CENTER
	pie.add_theme_constant_override("separation", 8)


	pie.custom_minimum_size.y = 30.0
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	celda.add_child(pie)
	_pastilla(pie, c)
	return cromo











func _tira_carreras(parent: Container, carreras: Array, elegida: String, tinte: Color,
		al_elegir: Callable) -> void:
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = clampi(carreras.size(), 1, TIRA_COLUMNAS)
	rejilla.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", 12)
	parent.add_child(rejilla)
	var vista: Array = carreras
	if carreras.size() > TIRA_COLUMNAS:
		vista = carreras.slice(0, TIRA_COLUMNAS - 1)
		var esta: bool = false
		for c in vista:
			esta = esta or String((c as Dictionary).get("cid", "")) == elegida
		if not esta:
			for c in carreras:
				if String((c as Dictionary).get("cid", "")) == elegida:
					vista[vista.size() - 1] = c
	var alto_cromo: float = PlayerCard.AVATAR.y
	for c in vista:
		var cid: String = String((c as Dictionary).get("cid", ""))
		var cromo: PlayerCard = _celda_cromo(rejilla, c, tinte, cid != elegida)
		cromo.set_tap(func() -> void: al_elegir.call(cid))
		alto_cromo = maxf(alto_cromo, cromo.get_combined_minimum_size().y)
	if vista.size() < carreras.size():



		_baldosa_mas(rejilla, carreras.size() - vista.size(), tinte,
			Vector2(PlayerCard.MIN_W, alto_cromo),
			_todas_carreras.bind(carreras, elegida, tinte, al_elegir))






func _baldosa_mas(parent: Container, n: int, tinte: Color, tam: Vector2, al_tocar: Callable) -> Button:
	var mas: Button = Button.new()
	mas.text = "+%d" % n
	mas.custom_minimum_size = tam
	mas.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	CareerTheme.apply_button_tinted(mas, tinte, CareerTheme.T_CARD, 0.25)
	mas.pressed.connect(al_tocar)
	parent.add_child(mas)
	return mas





func _todas_carreras(carreras: Array, elegida: String, tinte: Color, al_elegir: Callable) -> void:
	var box: VBoxContainer = CareerUi.modal(self, false)
	if box == null:
		return
	CareerUi.head(box, I18n.tf("{0} CARRERAS", [carreras.size()]), null, "", tinte)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = TIRA_COLUMNAS
	rejilla.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	rejilla.add_theme_constant_override("h_separation", 10)
	rejilla.add_theme_constant_override("v_separation", 12)
	box.add_child(rejilla)
	for c in carreras:
		var cid: String = String((c as Dictionary).get("cid", ""))
		var cromo: PlayerCard = _celda_cromo(rejilla, c, tinte, cid != elegida)
		cromo.set_tap(func() -> void:
			CareerUi.close_modal(box)
			al_elegir.call(cid))
	var cerrar: Button = Button.new()
	cerrar.text = I18n.t("CERRAR")
	cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_HEAD)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	box.add_child(cerrar)
	CareerUi.normalize_caps(box)





func _lado(parent: Container, c: Dictionary, tinte: Color) -> void:
	if c.is_empty():
		var l: Label = _cifra(parent, "–", CareerTheme.T_HEAD, CareerTheme.TEXT_DIM)
		l.custom_minimum_size.x = PlayerCard.MIN_W
		l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		return
	_celda_cromo(parent, c, tinte)



func _vacio(texto: String) -> void:
	var l: Label = CareerUi.dim(_body, texto)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




func _icono(nombre: String, tinte: Color) -> Control:
	var ic: Control

	if nombre.contains("+"):
		var par: HBoxContainer = HBoxContainer.new()
		par.add_theme_constant_override("separation", 2)
		par.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		par.mouse_filter = Control.MOUSE_FILTER_IGNORE
		for parte in nombre.split("+"):
			par.add_child(_icono(parte, tinte))
		return par
	if nombre.begins_with("trofeo:"):
		var t: TrophyIcon = TrophyIcon.new()
		t.set_type(nombre.substr(7))
		ic = t
	else:
		var m: MenuIcon = MenuIcon.new()
		m.setup(nombre, tinte)
		ic = m
	ic.custom_minimum_size = Vector2(CHIP_ICO, CHIP_ICO)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic


func _chip(parent: Container, icono: String, valor: String, tinte: Color) -> void:
	var chip: PanelContainer = CareerUi.chip()
	chip.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	chip.custom_minimum_size.y = 56.0
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(chip)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 6)
	row.mouse_filter = Control.MOUSE_FILTER_IGNORE
	chip.add_child(row)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	row.add_child(_icono(icono, tinte))
	var v: Label = _cifra(row, valor, CareerTheme.T_HEAD + 4, CareerTheme.TEXT)
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER



func _dato(parent: Container, text: String, size: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(size, color)
	l.text = text
	l.clip_text = true
	l.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(l)
	return l



func _cifra(parent: Container, text: String, size: int, color: Color) -> Label:
	var l: Label = _dato(parent, text, size, color)
	l.clip_text = false
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	return l
