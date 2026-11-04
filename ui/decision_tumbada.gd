class_name DecisionTumbada
extends Control



























const TARJETA: Vector2 = Vector2(1120.0, 640.0)
const RADIO: int = 28
const TOPE: int = 12
const FILO: int = 2

const PAD: float = 32.0
const CAB_H: float = 80.0
const ICONO_CAB: float = 72.0
const SEP_CUERPO: int = 36

const FICHA_H: float = 56.0
const ICONO: float = 32.0

const RANURA_H: float = 144.0
const MEDALLA: int = 22

const BOTON: Vector2 = Vector2(514.0, 88.0)
const SEP: int = 24

const BARRA_H: float = 16.0

const VELO_A: float = 0.62

const LEYENDA_ABAJO: float = 32.0
const LEYENDA_PAD: float = 24.0

const MANTEN_MANDO_S: float = 1.0

var cuerpo: VBoxContainer
var columna: VBoxContainer
var boton_si: Button
var boton_no: Button
var tarjeta: PanelContainer

var _pista: HBoxContainer
var _glifo_pista: Control
var _texto_pista: Label
var _barra: ProgressBar
var _leyenda: PanelContainer
var _manten_dedo: float = 0.0
var _rotulo_dedo: String = ""
var _rotulo_mando: String = ""
var _pista_dedo: String = ""
var _on_si: Callable = Callable()
var _hecho: bool = false
var _fichas_al_centro: bool = false

var _tinta: Color = CareerTheme.DANGER









static func abre(host: Node, cfg: Dictionary) -> DecisionTumbada:
	if host == null or CareerUi.modal_open(host):
		return null
	var d: DecisionTumbada = DecisionTumbada.new()
	d._monta(cfg)
	host.add_child(d)
	CareerUi._set_stages_live(host, false)
	d._al_entrar()
	return d


func _monta(cfg: Dictionary) -> void:
	name = "Modal"
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP

	process_mode = Node.PROCESS_MODE_ALWAYS
	add_to_group(CareerUi.MODAL_GROUP)
	add_to_group(CareerUi.ATRAS_CAPA_GROUP)
	_manten_dedo = float(cfg.get("manten_dedo", 0.0))
	_rotulo_dedo = String(cfg.get("accion", ""))
	_rotulo_mando = String(cfg.get("accion_mando", _rotulo_dedo))
	_pista_dedo = String(cfg.get("pista_dedo", ""))
	_on_si = cfg.get("on_si", Callable())
	_tinta = cfg.get("tinta", CareerTheme.DANGER)

	var velo: ColorRect = CareerTheme.modal_scrim()
	velo.name = "Velo"
	velo.color.a = minf(velo.color.a, VELO_A)
	add_child(velo)




	tarjeta = PanelContainer.new()
	tarjeta.name = "Tarjeta"
	tarjeta.custom_minimum_size = TARJETA
	tarjeta.anchor_left = 0.5
	tarjeta.anchor_right = 0.5
	tarjeta.anchor_top = 0.5
	tarjeta.anchor_bottom = 0.5
	tarjeta.offset_left = - TARJETA.x * 0.5
	tarjeta.offset_right = TARJETA.x * 0.5
	tarjeta.offset_top = - TARJETA.y * 0.5
	tarjeta.offset_bottom = TARJETA.y * 0.5
	tarjeta.grow_horizontal = Control.GROW_DIRECTION_BOTH
	tarjeta.grow_vertical = Control.GROW_DIRECTION_BOTH
	var fuera: StyleBoxFlat = StyleBoxFlat.new()
	fuera.bg_color = CareerTheme.SURFACE_LINE
	fuera.set_corner_radius_all(RADIO)
	fuera.set_content_margin_all(FILO)
	tarjeta.add_theme_stylebox_override("panel", fuera)
	add_child(tarjeta)
	var dentro: PanelContainer = PanelContainer.new()
	dentro.name = "Dentro"
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.set_corner_radius_all(RADIO - FILO)
	sb.border_width_top = TOPE
	sb.border_color = cfg.get("acento", CareerTheme.accent())
	sb.content_margin_left = PAD
	sb.content_margin_right = PAD
	sb.content_margin_top = PAD
	sb.content_margin_bottom = PAD
	dentro.add_theme_stylebox_override("panel", sb)
	tarjeta.add_child(dentro)

	var col: VBoxContainer = VBoxContainer.new()
	columna = col
	col.name = "Columna"
	col.add_theme_constant_override("separation", SEP)
	dentro.add_child(col)


	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.custom_minimum_size = Vector2(0, CAB_H)
	cab.add_theme_constant_override("separation", 28)
	cab.add_child(icono(String(cfg.get("icono", "cerrar")),
		cfg.get("tinta_icono", CareerTheme.TEXT_MID), ICONO_CAB))
	var titulo: Label = texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		String(cfg.get("titulo", "")))
	titulo.name = "Titulo"
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(titulo)
	col.add_child(cab)
	CareerUi.letra_por_peldanos(titulo, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])



	var arriba: float = float(cfg.get("arriba", 0.0))
	_fichas_al_centro = bool(cfg.get("fichas_al_centro", false))
	var marco: MarginContainer = MarginContainer.new()
	marco.name = "CuerpoMarco"
	marco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_theme_constant_override("margin_top", maxi(0, roundi(arriba) - SEP)
		if arriba > 0.0 else 0)
	cuerpo = VBoxContainer.new()
	cuerpo.name = "Cuerpo"
	cuerpo.alignment = BoxContainer.ALIGNMENT_BEGIN if arriba > 0.0 else BoxContainer.ALIGNMENT_CENTER
	cuerpo.add_theme_constant_override("separation", SEP_CUERPO)
	marco.add_child(cuerpo)
	col.add_child(marco)


	var pie: HBoxContainer = HBoxContainer.new()
	pie.name = "Pie"
	pie.alignment = BoxContainer.ALIGNMENT_END
	pie.add_theme_constant_override("separation", SEP)
	col.add_child(pie)
	boton_no = _boton(I18n.t("CANCELAR"))
	boton_no.name = "Cancelar"
	CareerTheme.apply_button(boton_no, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	boton_no.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	boton_no.set_meta("atras", true)
	boton_no.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	boton_no.pressed.connect(cierra)
	pie.add_child(boton_no)

	var lado: VBoxContainer = VBoxContainer.new()
	lado.name = "Accion"
	lado.add_theme_constant_override("separation", 12)
	pie.add_child(lado)
	boton_si = _boton(_rotulo_dedo)
	boton_si.name = "Si"
	CareerTheme.apply_button_accent(boton_si, _tinta, CareerTheme.T_LEE_TUMBADO)

	boton_si.set_meta(Entrada.PRIMERO_META, true)
	CareerUi.hold_gesture(boton_si, MANTEN_MANDO_S, _confirma, _mantiene)
	boton_si.pressed.connect(_toque)
	lado.add_child(boton_si)

	_pista = HBoxContainer.new()
	_pista.name = "Pista"
	_pista.custom_minimum_size = Vector2(BOTON.x, ICONO)
	_pista.add_theme_constant_override("separation", 20)
	_pista.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_glifo_pista = Glifos.chip("fl_avanza", "", ICONO)
	_glifo_pista.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_pista.add_child(_glifo_pista)
	_texto_pista = texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_MID, "")
	_texto_pista.clip_text = false
	_pista.add_child(_texto_pista)


	_barra = ProgressBar.new()
	_barra.name = "Barra"
	_barra.show_percentage = false
	_barra.max_value = 1.0
	_barra.custom_minimum_size = Vector2(0, BARRA_H)
	_barra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fondo_barra: StyleBoxFlat = StyleBoxFlat.new()
	fondo_barra.bg_color = CareerTheme.SURFACE_HI
	fondo_barra.set_corner_radius_all(4)
	var lleno: StyleBoxFlat = StyleBoxFlat.new()
	lleno.bg_color = _tinta
	lleno.set_corner_radius_all(4)
	_barra.add_theme_stylebox_override("background", fondo_barra)
	_barra.add_theme_stylebox_override("fill", lleno)
	_pista.add_child(_barra)
	lado.add_child(_pista)


	var seguro: Control = Control.new()
	seguro.name = "Seguro"
	seguro.set_anchors_preset(Control.PRESET_FULL_RECT)
	seguro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(seguro)
	_leyenda = PanelContainer.new()
	_leyenda.name = "Leyenda"
	var pl: StyleBoxFlat = StyleBoxFlat.new()
	pl.bg_color = CareerTheme.PLATE_BG
	pl.set_corner_radius_all(12)
	pl.content_margin_left = LEYENDA_PAD
	pl.content_margin_right = LEYENDA_PAD
	_leyenda.add_theme_stylebox_override("panel", pl)
	_leyenda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_leyenda.anchor_left = 1.0
	_leyenda.anchor_right = 1.0
	_leyenda.anchor_top = 1.0
	_leyenda.anchor_bottom = 1.0
	_leyenda.offset_right = - LEYENDA_ABAJO
	_leyenda.offset_bottom = - LEYENDA_ABAJO
	_leyenda.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	_leyenda.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_leyenda.add_child(CareerUi.leyenda_mando([[["fl_avanza"], "MANTÉN 1 S"],
		[["fl_atras"], "CANCELAR"]]))
	seguro.add_child(_leyenda)
	_pinta_modo(Entrada.modo)


func _al_entrar() -> void:
	CareerUi.apply_safe_area(get_node("Seguro") as Control, get_viewport())
	Entrada.modo_cambiado.connect(_pinta_modo)
	var velo: ColorRect = get_node("Velo") as ColorRect
	velo.modulate.a = 0.0
	var tw: Tween = velo.create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.tween_property(velo, "modulate:a", 1.0, 0.14)
	UiKit.pop_in(tarjeta)
	CareerUi._avisa_modal(columna, false)


func _exit_tree() -> void:
	if Entrada.modo_cambiado.is_connected(_pinta_modo):
		Entrada.modo_cambiado.disconnect(_pinta_modo)


func _boton(txt: String) -> Button:
	var b: Button = Button.new()
	b.text = txt
	b.clip_text = true
	b.custom_minimum_size = BOTON
	return b



func _pinta_modo(_m: int) -> void:
	var tactil: bool = Entrada.modo == Entrada.Modo.TACTIL
	var mando: bool = Entrada.modo == Entrada.Modo.MANDO
	boton_no.visible = not mando
	_leyenda.visible = mando
	_glifo_pista.visible = mando
	_barra.visible = _mantiene()
	_pista.visible = not tactil or _manten_dedo > 0.0
	_texto_pista.text = _caps(I18n.t("MANTÉN 1 S") if not tactil else _pista_dedo)
	_pista.visible = _pista.visible and not _texto_pista.text.is_empty()
	boton_si.text = _caps(_rotulo_dedo if tactil else _rotulo_mando)
	boton_si.set_meta("hold_secs", _manten_dedo if tactil else MANTEN_MANDO_S)
	if mando and is_inside_tree() and not boton_si.has_focus():
		boton_si.grab_focus.call_deferred()




static func _caps(t: String) -> String:
	return CareerTheme.deaccent_grito(t) if CareerUi._is_shout(t) else t


func _process(_d: float) -> void:
	if _barra == null or not _barra.visible:
		return
	var v: float = 0.0
	for c in boton_si.get_children():
		if c is ColorRect:
			v =(c as ColorRect).anchor_right
	_barra.value = v




func _mantiene() -> bool:
	return Entrada.modo != Entrada.Modo.TACTIL or _manten_dedo > 0.0


func _toque() -> void:
	if _mantiene():
		return
	_confirma()


func _confirma() -> void:
	if _hecho:
		return
	_hecho = true
	remove_from_group(CareerUi.ATRAS_CAPA_GROUP)
	CareerUi.close_modal(self)
	if _on_si.is_valid():
		_on_si.call()



func cierra() -> void:
	if _hecho:
		return
	_hecho = true
	remove_from_group(CareerUi.ATRAS_CAPA_GROUP)
	CareerUi.close_modal(self)



func atras() -> bool:
	cierra()
	return true





func linea(tipo: String, txt: String, tinta: Color = CareerTheme.TEXT_MID) -> HBoxContainer:
	var f: HBoxContainer = HBoxContainer.new()
	f.add_theme_constant_override("separation", 20)
	f.mouse_filter = Control.MOUSE_FILTER_IGNORE
	f.add_child(icono(tipo, tinta, ICONO))
	var l: Label = texto(CareerTheme.T_CAP_TUMBADO, tinta, txt)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	f.add_child(l)
	cuerpo.add_child(f)
	return f




func fichas(lista: Array) -> HBoxContainer:
	var f: HBoxContainer = HBoxContainer.new()
	f.name = "Fichas"
	if _fichas_al_centro:
		f.alignment = BoxContainer.ALIGNMENT_CENTER
	f.add_theme_constant_override("separation", 20)
	f.mouse_filter = Control.MOUSE_FILTER_IGNORE
	for d in lista:
		f.add_child(ficha(String(d.get("icono", "")), d.get("tinta", CareerTheme.TEXT_MID),
			d.get("partes", [])))
	cuerpo.add_child(f)
	return f


static func ficha(tipo: String, tinta: Color, partes: Array) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "Ficha"
	p.custom_minimum_size = Vector2(0, FICHA_H)
	p.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN

	p.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PLATE_BG
	sb.set_border_width_all(2)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(12)
	sb.content_margin_left = 20.0
	sb.content_margin_right = 20.0
	p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if not tipo.is_empty():
		h.add_child(icono(tipo, tinta, ICONO))
	for par in partes:
		var l: Label = texto(CareerTheme.T_CAP_TUMBADO, par[1], String(par[0]))

		l.clip_text = false
		h.add_child(l)
	p.add_child(h)
	return p



func aviso(txt: String) -> Label:
	var l: Label = texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.DANGER, txt)
	l.name = "Aviso"
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	cuerpo.add_child(l)
	return l




func ranura(slot: int, info: Dictionary) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	p.name = "Ranura"
	p.custom_minimum_size = Vector2(0, RANURA_H)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PLATE_BG
	sb.set_border_width_all(2)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(12)
	sb.content_margin_left = 32.0
	sb.content_margin_right = 32.0
	p.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 24)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	var team: Dictionary = Teams.by_id(String(info.get("team_id", "")))
	if not team.is_empty():
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(44.0, 52.0)
		esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
		esc.set_team(team)
		h.add_child(esc)
	var med: OvrBadge = OvrBadge.new()
	med.setup(int(info.get("ovr", 0)), MEDALLA)
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	med.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(med)
	var poss: Array = info.get("poss", ["DC"])
	var pos: String = String(poss[0]) if not poss.is_empty() else "DC"

	var chip: Control = CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
		CareerTheme.T_LEE_TUMBADO, 12.0, 6.0)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(chip)
	var nombre: String = CareerUi.display_name(String(info.get("name", "")).strip_edges())
	var nl: Label = texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, nombre)
	nl.name = "Nombre"
	nl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(nl)


	nl.set_meta("peldano_entero", nombre)
	if CareerUi.surname(nombre) != nombre:
		nl.set_meta("peldano_corto", CareerUi.surname(nombre))
	CareerUi.letra_por_peldanos(nl, [CareerTheme.T_LEE_TUMBADO])
	if slot == SaveSlots.active:
		h.add_child(ficha("", CareerTheme.TEXT, [[I18n.t("ACTIVA"), CareerTheme.TEXT]]))
	var der: VBoxContainer = VBoxContainer.new()
	der.alignment = BoxContainer.ALIGNMENT_CENTER
	der.add_theme_constant_override("separation", 16)
	der.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var t: Label = texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT,
		I18n.tf("T{0}", [int(info.get("season", 1))]))
	t.clip_text = false
	t.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	der.add_child(t)
	var dias: int = int(info["dias"]) if info.has("dias") \
			else dias_desde(SaveSlots.slot_path("career.json", slot))
	if dias >= 0:
		var c: Label = texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
			I18n.t("HOY") if dias == 0 else I18n.tf("HACE {0} D", [dias]))
		c.clip_text = false
		c.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		der.add_child(c)
	h.add_child(der)
	cuerpo.add_child(p)
	return p



static func dias_desde(ruta: String) -> int:
	var mt: int = FileAccess.get_modified_time(ruta) if FileAccess.file_exists(ruta) else 0
	if mt <= 0:
		return -1
	return maxi(0, int((Time.get_unix_time_from_system() - float(mt)) / 86400.0))




static func fecha_partida() -> String:
	var txt: String = I18n.tf("T{0}", [GameState.season_num])
	var fx: Dictionary = GameState.current_fixture()
	if String(fx.get("comp", "")) == "league" and fx.has("round_idx") \
			and Competitions.torneo_key(fx).is_empty():
		txt += " · J%d" %(int(fx["round_idx"]) + 1)
	return txt




static func texto(tam: int, tinta: Color, txt: String) -> Label:
	var l: Label = CareerUi.plain(tam, tinta)
	l.text = txt
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


static func icono(tipo: String, tinta: Color, lado: float) -> Control:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, tinta)
	return ic







static func salir_juego(host: Node, on_si: Callable, guardada: int = -1) -> DecisionTumbada:
	var d: DecisionTumbada = abre(host, {"titulo": I18n.t("¿SALIR DEL JUEGO?"), "icono": "puerta",
		"accion": I18n.t("SALIR"), "on_si": on_si})
	if d == null:
		return null
	if (Career.has_save() and not Career.retired) if guardada < 0 else guardada > 0:
		d.linea("check", I18n.t("LA PARTIDA ESTÁ GUARDADA"))
		d.fichas([{"icono": "jornada", "partes": [[fecha_partida(), CareerTheme.TEXT]]}])
	CareerUi.normalize_caps(d)
	return d




static func borrar_ranura(host: Node, slot: int, on_si: Callable,
		info: Dictionary = {}) -> DecisionTumbada:
	if info.is_empty():
		info = SaveSlots.summary(slot)
	var team: Dictionary = Teams.by_id(String(info.get("team_id", "")))
	var d: DecisionTumbada = abre(host, {"titulo": I18n.tf("¿BORRAR RANURA {0}?", [slot + 1]),
		"icono": "cerrar", "tinta_icono": CareerTheme.DANGER, "accion": I18n.t("BORRAR"),
		"acento": CareerTheme.accent_of(team) if not team.is_empty() else CareerTheme.accent(),
		"arriba": 40.0,
		"on_si": on_si})
	if d == null:
		return null
	d.ranura(slot, info)
	d.aviso(I18n.t("SE PIERDE PARA SIEMPRE"))
	CareerUi.normalize_caps(d)
	return d




static func retirarse(host: Node, manten_dedo: float, on_si: Callable) -> DecisionTumbada:
	var d: DecisionTumbada = abre(host, {"titulo": I18n.t("¿COLGAR LAS BOTAS?"),
		"icono": "leyendas", "tinta_icono": CareerTheme.TEXT_MID,
		"accion": I18n.t("COLGAR LAS BOTAS"), "manten_dedo": manten_dedo,
		"pista_dedo": I18n.t("MANTÉN PARA RETIRARTE"), "arriba": 80.0, "fichas_al_centro": true,
		"on_si": on_si})
	if d == null:
		return null
	d.fichas([
		{"icono": "jornada", "partes": [[I18n.tf("T{0}", [GameState.season_num]), CareerTheme.TEXT]]},
		{"icono": "gol", "partes": [[I18n.tf("{0} GOLES", [GameState.career_goals]),
			CareerTheme.TEXT]]},
		{"icono": "laurel", "partes": [[I18n.t("LEGADO"), CareerTheme.TEXT_DIM],
			[str(Career.legacy_score()), CareerTheme.TEXT]]},
	])
	d.aviso(I18n.t("NO HAY VUELTA ATRÁS"))
	CareerUi.normalize_caps(d)
	return d
