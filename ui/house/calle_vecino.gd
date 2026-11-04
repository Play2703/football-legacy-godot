class_name CalleVecino
extends RefCounted





















const CROMO_ESCALA: float = 1.2

const COLUMNA_W: float = 560.0
const SEP_CROMO: int = 28

const FILA_H: float = 60.0
const ICONO: float = 30.0
const ESCUDO: float = 48.0

const BOTON_H: float = 88.0




static var red_forzada: Variant = null




static func sin_red() -> bool:
	if red_forzada is bool:
		return not bool(red_forzada)
	return not Nube.activa() or Nube.sin_red






static func abre(host: Control, p: Dictionary, al_entrar: Callable, al_amigos: Callable,
		con_foto: bool = false) -> VBoxContainer:
	var box: VBoxContainer = CareerUi.modal(host)
	if box == null:
		return null
	box.name = "FichaVecino"
	var a: Dictionary = p.get("amigo", {})
	var cid: String = String(p.get("cid", ""))
	var c: Dictionary = Amigos.carrera(a, cid) if cid != "" else a
	var pedido: Dictionary = {"uid": String(a.get("uid", "")), "cid": cid}
	_cabecera(box, String(p.get("nombre", "")))



	var hecho: Array = [false]
	var sale: Callable = func(que: Callable) -> void:
		if hecho[0]:
			return
		hecho[0] = true
		CareerUi.close_modal(box)
		que.call()
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.add_theme_constant_override("separation", SEP_CROMO)
	cuerpo.alignment = BoxContainer.ALIGNMENT_CENTER
	box.add_child(cuerpo)
	cuerpo.add_child(_cromo(c, String(p.get("nombre", "")), func() -> void:
		sale.call(al_amigos.bind(pedido))))
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "Datos"
	col.custom_minimum_size.x = COLUMNA_W
	col.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	col.add_theme_constant_override("separation", 16)
	cuerpo.add_child(col)
	var escudo: Control = _escudo(String(c.get("team_id", "")))
	_fila(col, "legado", escudo, _icono("estatua", CareerTheme.TEXT_DIM),
		str(int(c.get("legacy", 0))), I18n.t("LEGADO"))
	var lvl: int = int((p.get("fachada", {}) as Dictionary).get("lvl", 0))
	_fila(col, "casa", null, _icono("local", CareerTheme.NAV_CASA), str(lvl + 1), I18n.t("CASA"))
	var botones: HBoxContainer = HBoxContainer.new()
	botones.name = "Botones"
	botones.add_theme_constant_override("separation", 16)
	col.add_child(botones)
	var fuera: bool = sin_red()
	var entrar: Button = CareerUi.accion("puerta", I18n.t("ENTRAR"), CareerTheme.NAV_CASA)
	entrar.name = "Entrar"
	entrar.custom_minimum_size.y = BOTON_H
	entrar.disabled = fuera and not con_foto

	entrar.set_meta(Entrada.PRIMERO_META, true)
	entrar.pressed.connect(func() -> void: sale.call(al_entrar))


	botones.add_child(entrar)
	var retar: Button = CareerUi.accion("penal", I18n.t("RETAR"), CareerTheme.NAV_GENTE)
	retar.name = "Retar"
	retar.custom_minimum_size.y = BOTON_H
	retar.disabled = fuera
	var reto: Dictionary = pedido.duplicate()
	reto["reto"] = true
	retar.pressed.connect(func() -> void: sale.call(al_amigos.bind(reto)))


	var ev: InputEventAction = InputEventAction.new()
	ev.action = "fl_modo"
	var sc: Shortcut = Shortcut.new()
	sc.events = [ev]
	retar.shortcut = sc
	retar.shortcut_in_tooltip = false
	botones.add_child(retar)
	Glifos.cuelga(retar, "fl_modo")
	if fuera:
		var aviso: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
		aviso.name = "SinRed"
		aviso.text = I18n.t("SIN CONEXIÓN")
		aviso.clip_text = true
		col.add_child(aviso)
	return box






static func _cabecera(box: VBoxContainer, titulo: String) -> void:
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.add_theme_constant_override("separation", 16)
	box.add_child(cab)
	var tab: ColorRect = ColorRect.new()
	tab.color = CareerTheme.NAV_CASA
	tab.custom_minimum_size = Vector2(6, 40)
	tab.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(tab)
	var t: Label = CareerUi.plain(CareerTheme.T_TITULO_TUMBADO, CareerTheme.TEXT)
	t.name = "Titulo"
	t.text = CareerTheme.caps(titulo)
	t.clip_text = true
	t.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(t)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(CareerUi.LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	cerrar.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	cab.add_child(cerrar)






static func _cromo(c: Dictionary, nombre: String, al_tocar: Callable) -> Control:
	var ficha: Dictionary = c.duplicate()
	if String(ficha.get("name", "")) == "":
		ficha["name"] = nombre
	var cromo: PlayerCard = PlayerCard.build_archivado(ficha,
		Teams.by_id(String(c.get("team_id", ""))), String(c.get("nat", "")),
		c.get("look", {}) as Dictionary)
	cromo.scale = Vector2.ONE * CROMO_ESCALA
	cromo.set_tap(al_tocar)
	var hueco: Control = Control.new()
	hueco.name = "Cromo"
	hueco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hueco.add_child(cromo)
	cromo.size = cromo.get_combined_minimum_size()
	hueco.custom_minimum_size = cromo.size * CROMO_ESCALA


	cromo.resized.connect(func() -> void: hueco.custom_minimum_size = cromo.size * CROMO_ESCALA)
	return hueco



static func _fila(col: VBoxContainer, nombre: String, escudo: Control, icono: Control,
		cifra: String, rotulo: String) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = nombre.capitalize()
	fila.custom_minimum_size.y = FILA_H
	fila.add_theme_constant_override("separation", 12)
	col.add_child(fila)
	if escudo != null:
		fila.add_child(escudo)
	fila.add_child(icono)
	var v: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT)
	v.name = "Cifra"
	v.text = cifra
	v.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(v)
	var r: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_DIM)
	r.name = "Rotulo"
	r.text = rotulo
	r.clip_text = true
	r.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	r.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	fila.add_child(r)


static func _icono(tipo: String, tinte: Color) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(ICONO, ICONO)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, tinte)
	return ic



static func _escudo(club: String) -> Control:
	if club.is_empty() or Teams.by_id(club).is_empty():
		return null
	var cr: CrestView = CrestView.new()
	cr.custom_minimum_size = Vector2(ESCUDO, ESCUDO)
	cr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cr.set_team(Teams.by_id(club))
	return cr
