class_name SubastaPlayera
extends Node





















const _SUB = preload("res://features/career/subasta.gd")
const _SALA = preload("res://ui/sala_subasta.gd")
const _YO: String = "res://ui/subasta_playera.gd"

enum Fase{INTRO, PIDE, ALTO, VENDIDA, DESIERTA}



const T_INTRO: float = 2.6
const T_TASA: float = 0.4
const DUR_TASA: float = 1.3

const T_CAE: float = 0.7


const BARRA_K: float = 2.0
const ALTO_SALA: float = 860.0
const COL_W: float = 680.0
const JERSEY_PX: Vector2 = Vector2(130, 150)
const JERSEY_PX_TUMBADO: Vector2 = Vector2(84, 96)

var _kd: Dictionary = {}
var _st: Dictionary = {}
var _al_cerrar: Callable
var _fase: int = Fase.INTRO
var _t: float = 0.0
var _espera: float = 0.0
var _quien: int = -1
var _precio: int = 0
var _lider: int = -1
var _sellada: bool = false
var _cobrado: int = 0
var _cerrado: bool = false
var _caidas: Array = []

var _col: VBoxContainer
var _sala: Control
var _tasa_lbl: Label
var _rot: Label
var _cifra: Label
var _placa: PanelContainer
var _placa_num: Label
var _fill: ColorRect
var _cuenta: ColorRect
var _chips: Array = []
var _adjudicar: Button
var _retirar: Button
var _sello: Label
var _candado: HBoxContainer





static func abre(host: Node, kd: Dictionary, tex: Texture2D, al_cerrar: Callable) -> Node:
	var col: VBoxContainer = CareerUi.modal_pantalla(host, false)
	if col == null:
		return null
	var yo: Node =(load(_YO) as GDScript).new()
	yo.name = "SubastaPlayera"
	col.get_parent().add_child(yo)
	yo.call("_monta", col, kd, tex, al_cerrar)
	return yo


func _monta(col: VBoxContainer, kd: Dictionary, tex: Texture2D, al_cerrar: Callable) -> void:
	_col = col
	_kd = kd
	_al_cerrar = al_cerrar
	var derbi: bool = Career.is_derby(String(kd.get("rival", "")))
	_st = _SUB.monta(kd, GameState.season_num, derbi, _SUB.sello_hoy())
	_precio = int(_st["salida"])
	var tumbado: bool = UiKit.es_horizontal()

	_cabecera(tex, tumbado)

	_sala = _SALA.new()
	_sala.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_sala.clip_contents = true
	if tumbado:


		var capa: Control = col.get_parent()
		_sala.set_anchors_preset(Control.PRESET_FULL_RECT)
		_sala.offset_left = - COL_W
		capa.add_child(_sala)
		capa.move_child(_sala, col.get_index())
		var velo: Panel = Panel.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color(CareerTheme.BG_DEEP, 0.84)
		velo.add_theme_stylebox_override("panel", sb)
		velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		velo.anchor_left = 1.0
		velo.anchor_right = 1.0
		velo.anchor_bottom = 1.0
		velo.offset_left = col.offset_right - COL_W - 30.0
		capa.add_child(velo)
		capa.move_child(velo, col.get_index())
		col.anchor_left = 1.0
		col.offset_left = col.offset_right - COL_W
		col.alignment = BoxContainer.ALIGNMENT_CENTER
	else:
		_sala.custom_minimum_size = Vector2(0, ALTO_SALA)
		_sala.size_flags_vertical = Control.SIZE_EXPAND_FILL
		col.add_child(_sala)
	var nums: Array = []
	for p in _st["postores"]:
		nums.append(int((p as Dictionary)["num"]))
	_sala.call("monta", nums, int(_st["semilla"]), tex)


	_sello = CareerUi.plain(64, CareerTheme.MONEY)
	_sello.set_anchors_preset(Control.PRESET_CENTER)
	_sello.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_sello.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_sello.grow_vertical = Control.GROW_DIRECTION_BOTH
	_sello.rotation = deg_to_rad(-8.0)
	_sello.add_theme_constant_override("outline_size", 14)
	_sello.add_theme_color_override("font_outline_color", CareerTheme.BG_DEEP)
	_sello.visible = false
	if tumbado:

		var hueco: Control = Control.new()
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		hueco.set_anchors_preset(Control.PRESET_FULL_RECT)
		hueco.offset_right = - COL_W
		col.get_parent().add_child(hueco)
		col.get_parent().move_child(hueco, col.get_index())
		hueco.add_child(_sello)
	else:
		_sala.add_child(_sello)

	_marcador(tumbado)
	_fichas(tumbado)
	_botones()
	CareerUi.normalize_caps(col)
	_entra_intro()





func _cabecera(tex: Texture2D, tumbado: bool) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 18)
	_col.add_child(fila)
	var lam: TextureRect = TextureRect.new()
	lam.texture = tex
	lam.custom_minimum_size = JERSEY_PX_TUMBADO if tumbado else JERSEY_PX
	lam.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	lam.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	lam.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	fila.add_child(lam)
	var datos: VBoxContainer = VBoxContainer.new()
	datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	datos.alignment = BoxContainer.ALIGNMENT_CENTER
	datos.add_theme_constant_override("separation", 8)
	fila.add_child(datos)
	var quien: Label = CareerUi.plain(24 if tumbado else 28, CareerTheme.TEXT)
	quien.text = Keepsakes.quien_pintado(_kd)
	quien.clip_text = true
	datos.add_child(quien)


	var jug: HBoxContainer = HBoxContainer.new()
	jug.add_theme_constant_override("separation", 10)
	datos.add_child(jug)
	var ovr: int = int(_kd.get("who_ovr", 0))
	if ovr > 0:
		var badge: OvrBadge = OvrBadge.new()
		jug.add_child(badge)
		badge.setup(ovr, 22)
	var pos: String = _pos_de(_kd)
	if not pos.is_empty():
		jug.add_child(CareerUi.pos_chip(pos))
	var tasa_fila: HBoxContainer = HBoxContainer.new()
	tasa_fila.add_theme_constant_override("separation", 12)
	datos.add_child(tasa_fila)
	var rot: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	rot.text = I18n.t("TASACIÓN")
	rot.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tasa_fila.add_child(rot)
	_tasa_lbl = CareerUi.plain(30, CareerTheme.MONEY)
	_tasa_lbl.text = CareerUi.short_money(0)
	_tasa_lbl.clip_text = true
	_tasa_lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tasa_fila.add_child(_tasa_lbl)



func _marcador(tumbado: bool) -> void:
	_rot = CareerUi.plain(22, CareerTheme.TEXT_DIM)
	_rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_rot.clip_text = true
	_col.add_child(_rot)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 22)
	_col.add_child(fila)
	_cifra = CareerUi.plain(52 if tumbado else 60, CareerTheme.TEXT)
	_cifra.clip_text = true

	_cifra.custom_minimum_size.x = 380.0 if tumbado else 440.0
	_cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	fila.add_child(_cifra)


	_placa = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.tag(CareerTheme.MONEY)
	sb.set_corner_radius_all(30)
	sb.content_margin_left = 18.0
	sb.content_margin_right = 18.0
	_placa.add_theme_stylebox_override("panel", sb)
	_placa.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_placa_num = CareerUi.plain(30, CareerTheme.BG_DEEP)
	_placa.add_child(_placa_num)
	_placa.visible = false
	fila.add_child(_placa)
	_fill = CareerUi.bar(_col, CareerTheme.MONEY, 16.0)
	CareerUi.bar_notch(_fill.get_parent(), 1.0 / BARRA_K)




func _fichas(tumbado: bool) -> void:
	var caja: GridContainer = GridContainer.new()
	caja.columns = 2 if tumbado else 4
	caja.add_theme_constant_override("h_separation", 10)
	caja.add_theme_constant_override("v_separation", 10)
	_col.add_child(caja)
	for p in _st["postores"]:
		var pd: Dictionary = p
		var panel: PanelContainer = PanelContainer.new()
		panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var sb: StyleBoxFlat = CareerTheme.chip()
		sb.content_margin_left = 12.0
		sb.content_margin_right = 12.0
		panel.add_theme_stylebox_override("panel", sb)
		caja.add_child(panel)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 10)
		panel.add_child(fila)
		var ic: MenuIcon = MenuIcon.new()
		ic.custom_minimum_size = Vector2(36, 36)
		ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ic.setup(_icono(String(pd["rol"])), CareerTheme.TEXT_DIM)
		fila.add_child(ic)
		var txt: VBoxContainer = VBoxContainer.new()
		txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		txt.add_theme_constant_override("separation", 2)
		fila.add_child(txt)
		var num: Label = CareerUi.plain(26, CareerTheme.TEXT)
		num.text = str(int(pd["num"]))
		txt.add_child(num)
		var est: Label = CareerUi.plain(14, CareerTheme.TEXT_DIM)
		est.clip_text = true
		txt.add_child(est)
		_chips.append({"panel": panel, "sb": sb, "icono": ic, "num": num, "estado": est})


func _botones() -> void:
	_adjudicar = CareerUi.accion("martillo", I18n.t("ADJUDICAR"), CareerTheme.DANGER)
	_adjudicar.custom_minimum_size = Vector2(0, 110)
	_adjudicar.disabled = true
	Glifos.cuelga(_adjudicar, "fl_avanza")
	_adjudicar.pressed.connect(adjudica)
	_col.add_child(_adjudicar)

	_cuenta = CareerUi.bar(_col, CareerTheme.MONEY, 6.0)
	_candado = HBoxContainer.new()
	_candado.alignment = BoxContainer.ALIGNMENT_CENTER
	_candado.add_theme_constant_override("separation", 10)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(30, 30)
	ic.setup("candado", CareerTheme.TEXT_DIM)
	_candado.add_child(ic)
	var l: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	l.text = I18n.t("PRÓXIMO PARTIDO")
	_candado.add_child(l)
	_candado.visible = false
	_col.add_child(_candado)
	_retirar = CareerUi.accion("cerrar", I18n.t("QUEDÁRMELA"), UiKit.BTN_BLUE["bg"] as Color)
	_retirar.custom_minimum_size = Vector2(0, 80)
	_retirar.set_meta("atras", true)
	Glifos.cuelga(_retirar, "fl_atras")
	_retirar.pressed.connect(_cierra)
	_col.add_child(_retirar)




func _process(delta: float) -> void:
	avanza(delta)



func avanza(dt: float) -> void:
	if _cerrado:
		return
	_t += dt
	for c in _caidas:
		c[1] = float(c[1]) - dt
		if float(c[1]) <= 0.0:
			_sala.call("pose", int(c[0]), "fuera")
	_caidas = _caidas.filter(func(c: Array) -> bool: return float(c[1]) > 0.0)
	match _fase:
		Fase.INTRO:
			var f: float = clampf((_t - T_TASA) / DUR_TASA, 0.0, 1.0)
			f = 1.0 - pow(1.0 - f, 3.0)
			_tasa_lbl.text = CareerUi.short_money(int(round(f * float(_st["tasa"]) / 500.0)) * 500)
			if _t >= T_INTRO:
				_sala.call("plano_sala")
				_pide()
		Fase.PIDE:
			if _t >= _espera:
				_levanta()
		Fase.ALTO:
			_cuenta.anchor_right = clampf(1.0 - _t / _SUB.VENTANA_S, 0.0, 1.0)
			if _t >= _SUB.VENTANA_S:
				_baja()


func _entra_intro() -> void:
	_fase = Fase.INTRO
	_t = 0.0
	_rot.text = I18n.t("SALIDA")
	_cifra.text = CareerUi.short_money(_precio)
	_cuenta.anchor_right = 0.0
	for i in _chips.size():
		_estado(i, "")



func _pide() -> void:
	var t: Dictionary = _SUB.turno(_st, _precio, _lider)
	for i in t["caen"]:
		_sala.call("pose", int(i), "lamenta")
		_caidas.append([int(i), T_CAE])
		_estado(int(i), "fuera")
	var piensan: Array = t["piensan"]
	var postores: Array = _st["postores"]
	for i in postores.size():
		if bool((postores[i] as Dictionary)["fuera"]) or i == _lider:
			continue
		var duda: bool = piensan.has(i)
		_sala.call("pose", i, "piensa" if duda else "sentado")
		_estado(i, "duda" if duda else "")
	if _lider >= 0:
		_sala.call("pose", _lider, "sentado")
		_estado(_lider, "")
	_rot.text = I18n.t("PIDE")
	_cifra.text = CareerUi.short_money(_precio)
	_cifra.add_theme_color_override("font_color", CareerTheme.TEXT)
	_placa.visible = false
	_quien = int(t["quien"])
	if _quien < 0:
		_desierta()
		return
	_fase = Fase.PIDE
	_t = 0.0
	_espera = float(t["retraso"])



func _levanta() -> void:
	_lider = _quien
	if not _sellada:


		_sellada = Career.sella_subasta_playera(_kd, _SUB.sello_hoy())
		CareerUi.pinta_accion(_retirar, "cerrar", I18n.t("RETIRAR"), UiKit.BTN_BLUE["bg"] as Color)
		CareerUi.normalize_caps(_retirar)
	_sala.call("pose", _lider, "puja")
	_sala.call("foco", _lider)
	_estado(_lider, "puja")
	_rot.text = I18n.t("PUJA")
	_cifra.add_theme_color_override("font_color", CareerTheme.MONEY)
	_placa_num.text = str(int((_st["postores"][_lider] as Dictionary)["num"]))
	_placa.visible = true
	CareerUi.set_bar(_fill, float(_precio) /(float(_st["tasa"]) * BARRA_K), true)
	_cuenta.anchor_right = 1.0
	_adjudicar.disabled = false
	if Entrada.foco_vivo():
		Entrada.foco_para(_adjudicar)
	_fase = Fase.ALTO
	_t = 0.0



func _baja() -> void:
	_sala.call("foco", -1)
	_adjudicar.disabled = true
	_cuenta.anchor_right = 0.0
	_precio += int(_st["paso"])
	_pide()




func adjudica() -> void:
	if _fase != Fase.ALTO or _cerrado:
		return
	_fase = Fase.VENDIDA
	_cobrado = Career.vender_playera(_kd, _precio)
	_sala.call("plano_estrado")
	_sala.call("martillazo")
	_sala.call("foco", -1)
	_adjudicar.visible = false
	_cuenta.get_parent().visible = false
	_rot.text = I18n.tf("PARA EL {0}", [_placa_num.text])
	_chips_final(_lider)
	_pon_sello(I18n.t("¡VENDIDA!"), CareerTheme.MONEY)
	CareerUi.pinta_accion(_retirar, "moneda", I18n.t("COBRAR"), CareerTheme.MONEY, true)
	CareerUi.normalize_caps(_retirar)
	if Entrada.foco_vivo():
		Entrada.foco_para(_retirar)



func _desierta() -> void:
	_fase = Fase.DESIERTA
	if not _sellada:
		_sellada = Career.sella_subasta_playera(_kd, _SUB.sello_hoy())
	_sala.call("foco", -1)
	_adjudicar.visible = false
	_cuenta.get_parent().visible = false
	_rot.text = I18n.t("SE FUE")
	_cifra.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	_placa.visible = false
	_candado.visible = true
	_chips_final(-1)
	_pon_sello(I18n.t("DESIERTA"), CareerTheme.DANGER)
	CareerUi.pinta_accion(_retirar, "cerrar", I18n.t("CONTINUAR"), UiKit.BTN_BLUE["bg"] as Color)
	CareerUi.normalize_caps(_retirar)
	if Entrada.foco_vivo():
		Entrada.foco_para(_retirar)


func _cierra() -> void:
	if _cerrado:
		return
	_cerrado = true
	set_process(false)
	CareerUi.close_modal(_col)
	if _al_cerrar.is_valid():
		_al_cerrar.call(_cobrado)




func _pon_sello(texto: String, color: Color) -> void:
	_sello.text = CareerTheme.deaccent_grito(texto)
	_sello.add_theme_color_override("font_color", color)
	_sello.visible = true
	_sello.pivot_offset = _sello.size * 0.5
	if Settings.reduce_motion:
		return
	_sello.scale = Vector2(1.8, 1.8)
	_sello.modulate.a = 0.0
	var tw: Tween = _sello.create_tween().set_parallel()
	tw.tween_property(_sello, "scale", Vector2.ONE, 0.22) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	tw.tween_property(_sello, "modulate:a", 1.0, 0.12)



func _estado(i: int, que: String) -> void:
	if i < 0 or i >= _chips.size():
		return
	var c: Dictionary = _chips[i]
	var est: Label = c["estado"]
	var sb: StyleBoxFlat = c["sb"]
	var ic: MenuIcon = c["icono"]
	var panel: PanelContainer = c["panel"]
	match que:
		"puja":
			est.text = I18n.t("PUJA")
			est.add_theme_color_override("font_color", CareerTheme.MONEY)
			sb.border_color = CareerTheme.MONEY
			sb.set_border_width_all(3)
			panel.modulate.a = 1.0
		"duda":
			est.text = I18n.t("DUDA")
			est.add_theme_color_override("font_color", CareerTheme.TEXT)
			sb.border_color = CareerTheme.SURFACE_LINE
			sb.set_border_width_all(1)
			panel.modulate.a = 1.0
		"fuera":

			est.text = ""
			sb.border_color = CareerTheme.SURFACE_LINE
			sb.set_border_width_all(1)


			ic.setup("cerrar", CareerTheme.TEXT)
			panel.modulate.a = 0.4
		_:
			est.text = ""
			sb.border_color = CareerTheme.SURFACE_LINE
			sb.set_border_width_all(1)
	CareerUi.normalize_caps(est)



func _chips_final(ganador: int) -> void:
	for i in _chips.size():
		var c: Dictionary = _chips[i]
		if i == ganador:
			_estado(i, "puja")
			(c["icono"] as MenuIcon).setup("martillo", CareerTheme.MONEY)
			(c["estado"] as Label).text = ""
		elif (c["panel"] as Control).modulate.a > 0.5:
			_estado(i, "")
			(c["panel"] as Control).modulate.a = 0.6


static func _icono(rol: String) -> String:
	match rol:
		"MUSEO":
			return "palmares"
		"COLECCIONISTA":
			return "vitrina"
	return "aficion"





static func _pos_de(kd: Dictionary) -> String:
	var ley: String = Keepsakes.legend_key_of(kd)
	if not ley.is_empty():
		return String((Legends.ACTIVOS.get(ley, {}) as Dictionary).get("pos", ""))
	var idx: int = int(kd.get("who_idx", -1))
	var rival: String = String(kd.get("rival", ""))
	if idx < 0 or rival.is_empty():
		return ""
	var plantel: Array = Squad.of(rival)
	if idx >= plantel.size():
		return ""
	var p: Dictionary = plantel[idx]
	if String(p.get("name", "")) != String(kd.get("who", "")):
		return ""
	return String(p.get("pos", ""))
