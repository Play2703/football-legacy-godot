class_name ResultadoTira
extends RefCounted






























const PAD_V: float = 24.0
const PAD_H: float = 28.0
const COL_SEP: int = 40
const LADO_SEP: int = 40

const CAB_H: float = 64.0
const ESCUDO: Vector2 = Vector2(44.0, 52.0)

const FILA_H: float = 112.0
const CHIP_W: float = 104.0
const CHIP_H: float = 56.0
const MEDALLA_W: float = 64.0
const OVR_NUM: int = 24
const VER_W: float = 144.0
const VER_H: float = 72.0
const CELDA_SEP: int = 16


const FILAS_MAX: int = 3


const FIG_W: float = 696.0
const FIG_FRAC: float = 0.34
const FIG_PAD: float = 32.0
const FIG_SEP: int = 24
const FIG_OVR_NUM: int = 32
const ESTRELLA: float = 48.0
const CTA_H: float = 120.0
const RADIO: int = 20



const ASIST_ICONO: float = 20.0
const ASIST_SEP: int = 6
const MAS_POR_COL: int = 6
const MAS_COLS: int = 3




static func build(v: MatchResultView, fila: HBoxContainer, data: Dictionary, alto: float,
		ancho: float) -> void:
	fila.add_theme_constant_override("separation", LADO_SEP)
	var you: Dictionary = data.get("you", {}) as Dictionary
	var rival: Dictionary = data.get("rival", {}) as Dictionary
	var siglas: Array = BracketTree.siglas_unicas([you, rival])
	var goles: Array = data.get("goles", []) as Array
	var k: int = filas_que_caben(alto)
	var placa: PanelContainer = _placa()
	placa.name = "PlacaGoles"
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(placa)
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 0)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(caja)
	var cols: HBoxContainer = HBoxContainer.new()
	cols.name = "Columnas"
	cols.add_theme_constant_override("separation", COL_SEP)
	cols.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(cols)


	var por_lado: Array = [[], []]
	for i in goles.size():
		por_lado[clampi(int((goles[i] as Dictionary).get("lado", 0)), 0, 1)].append(i)
	var fila_de: Dictionary = {}
	var elegibles: Array[Control] = []
	for lado in 2:
		var col: VBoxContainer = VBoxContainer.new()
		col.name = "Lado%d" % lado
		col.add_theme_constant_override("separation", 0)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cols.add_child(col)
		var equipo: Dictionary = you if lado == 0 else rival
		col.add_child(_cabecera(equipo, String(siglas[lado])))
		var suyos: Array = por_lado[lado]
		var caben: int = suyos.size() if suyos.size() <= k else k - 1
		for j in caben:
			var gi: int = int(suyos[j])
			var f: PanelContainer = _fila(v, goles[gi] as Dictionary, lado, equipo, data, true)
			f.name = "Gol%d" % gi
			col.add_child(f)
			fila_de[gi] = f
			v.filas[lado].append(f)
			if f.has_meta("ver"):
				elegibles.append(f.get_meta("ver") as Button)
		if caben < suyos.size():
			var todos: Array = []
			for gi in suyos:
				todos.append(goles[int(gi)])
			var mas: Button = _boton_mas(v, todos, lado, equipo, String(siglas[lado]), data,
				suyos.size() - caben)
			col.add_child(mas)
			elegibles.append(mas)
	for i in goles.size():
		if fila_de.has(i):
			v._orden.append(fila_de[i])
	if goles.is_empty():
		caja.add_child(_sin_goles())



	var derecha: VBoxContainer = VBoxContainer.new()
	derecha.name = "Derecha"
	derecha.custom_minimum_size.x = minf(FIG_W, FIG_FRAC * ancho)
	derecha.add_theme_constant_override("separation", 16)
	derecha.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(derecha)
	var figura: Dictionary = data.get("figura", {}) as Dictionary
	if not figura.is_empty():
		v._tarjeta = _figura(figura, data)
		v._tarjeta.size_flags_vertical = Control.SIZE_EXPAND_FILL
		derecha.add_child(v._tarjeta)
	else:
		var aire: Control = Control.new()
		aire.size_flags_vertical = Control.SIZE_EXPAND_FILL
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		derecha.add_child(aire)
	var cta: Button = CareerUi.primary_cta(I18n.t("CONTINUAR"), v._on_continuar)
	cta.name = "Continuar"
	cta.custom_minimum_size.y = CTA_H
	derecha.add_child(cta)
	v.boton_continuar = cta
	if elegibles.is_empty():

		cta.set_meta(Entrada.PRIMERO_META, true)
		return
	CareerUi.solo_con_mando(cta, false)
	elegibles[0].set_meta(Entrada.PRIMERO_META, true)
	var leyenda: HBoxContainer = CareerUi.leyenda_mando([[["fl_avanza"], "ELEGIR"],
		[["fl_atras"], "CONTINUAR"]], derecha.custom_minimum_size.x)
	leyenda.custom_minimum_size.y = maxf(CareerUi.LEYENDA_MANDO_H, CTA_H)
	derecha.add_child(leyenda)




static func filas_que_caben(alto: float) -> int:
	return clampi(floori((alto - 2.0 * PAD_V - CAB_H) / FILA_H), 1, FILAS_MAX)






static func _placa() -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.SURFACE, 0.94)
	sb.set_border_width_all(2)
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_corner_radius_all(RADIO)
	sb.content_margin_left = PAD_H
	sb.content_margin_right = PAD_H
	sb.content_margin_top = PAD_V
	sb.content_margin_bottom = PAD_V
	p.add_theme_stylebox_override("panel", sb)
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return p



static func _con_raya(alto: float) -> PanelContainer:
	var p: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color.TRANSPARENT
	sb.border_width_bottom = 1
	sb.border_color = CareerTheme.SURFACE_LINE
	p.add_theme_stylebox_override("panel", sb)
	p.custom_minimum_size.y = alto
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return p



static func _cabecera(equipo: Dictionary, sigla: String) -> PanelContainer:
	var p: PanelContainer = _con_raya(CAB_H)
	p.name = "Cabecera"
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", CELDA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	var escudo: CrestView = CrestView.new()
	escudo.custom_minimum_size = ESCUDO
	escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(escudo)
	escudo.set_team(equipo)
	var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, sigla)
	l.name = "Sigla"
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(l)
	return p






static func _fila(v: MatchResultView, gol: Dictionary, lado: int, equipo: Dictionary,
		data: Dictionary, registra: bool) -> PanelContainer:
	var p: PanelContainer = _con_raya(FILA_H)
	p.name = "Gol"
	p.set_meta("lado", lado)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", CELDA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(h)
	h.add_child(_chip_minuto(ScoreboardFinal.minuto(gol)))
	var nom: String = String(gol.get("name", "")).strip_edges()
	var jugador: Dictionary = ficha(nom, lado, equipo, data, int(gol.get("num", 0)))
	h.add_child(_celda_medalla(int(jugador.get("ovr", 0)), MEDALLA_W, OVR_NUM))
	var textos: VBoxContainer = VBoxContainer.new()
	textos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	textos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	textos.add_theme_constant_override("separation", 4)
	textos.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(textos)


	var nombre: Label = _texto(CareerTheme.T_LEE_TUMBADO,
		CareerTheme.TEXT if not nom.is_empty() else CareerTheme.TEXT_DIM, "")
	nombre.name = "Nombre"
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	textos.add_child(nombre)
	if nom.is_empty():
		nombre.text = I18n.t("GOL")
	else:

		_por_peldanos(nombre, CareerUi.display_name(nom), [CareerTheme.T_LEE_TUMBADO])
	var asist: String = String(gol.get("asist", "")).strip_edges()
	if not asist.is_empty() and CareerTheme.caps(asist) != CareerTheme.caps(nom):



		var fila_asist: HBoxContainer = HBoxContainer.new()
		fila_asist.name = "Asistencia"
		fila_asist.add_theme_constant_override("separation", ASIST_SEP)
		fila_asist.mouse_filter = Control.MOUSE_FILTER_IGNORE
		textos.add_child(fila_asist)
		fila_asist.add_child(_icono("asist", CareerTheme.TEXT_DIM, ASIST_ICONO))
		var al: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM, "")
		al.name = "Asistente"
		al.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila_asist.add_child(al)

		var quien: String = CareerUi.display_name(asist)
		_por_peldanos(al, CareerTheme.caps(quien), [CareerTheme.T_CAP_TUMBADO],
			CareerTheme.caps(CareerUi.surname(quien)))
	var rid: int = int(gol.get("rid", -1))
	if rid > 0:
		var ver: Button = CareerUi.accion_compacta("camera", I18n.t("VER"), v._acento)
		ver.name = "Ver"
		ver.custom_minimum_size = Vector2(VER_W, VER_H)
		ver.size_flags_horizontal = Control.SIZE_SHRINK_END
		ver.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ver.set_meta("rid", rid)
		ver.pressed.connect(func() -> void: v.repeticion.emit(rid))
		h.add_child(ver)
		p.set_meta("ver", ver)
		if registra:
			v.botones_gol[rid] = ver
	return p




static func _chip_minuto(texto: String) -> Control:
	if texto.is_empty():
		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(CHIP_W, 0.0)
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return hueco
	var chip: PanelContainer = PanelContainer.new()
	chip.name = "Minuto"
	chip.custom_minimum_size = Vector2(CHIP_W, CHIP_H)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI
	sb.set_corner_radius_all(CareerTheme.RADIUS)
	sb.content_margin_left = 8.0
	sb.content_margin_right = 8.0
	chip.add_theme_stylebox_override("panel", sb)
	var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_MID, "")
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	chip.add_child(l)
	_por_peldanos(l, texto, [CareerTheme.T_LEE_TUMBADO, CareerTheme.T_CAP_TUMBADO])
	return chip


static func _celda_medalla(media: int, ancho: float, num: int) -> Control:
	var c: CenterContainer = CenterContainer.new()
	c.name = "Medalla"
	c.custom_minimum_size = Vector2(ancho, 0.0)
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if media > 0:
		var m: OvrBadge = OvrBadge.new()
		m.setup(media, num)
		m.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(m)
	return c



static func _sin_goles() -> Control:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "SinGoles"
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.add_theme_constant_override("separation", CELDA_SEP)
	h.custom_minimum_size.y = FILA_H
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(_icono("gol", CareerTheme.TEXT_DIM, 32.0))
	var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM, I18n.t("SIN GOLES"))
	l.clip_text = false
	h.add_child(l)
	return h









static func ficha(nom: String, lado: int, equipo: Dictionary, data: Dictionary, num: int = 0,
		mia: bool = false) -> Dictionary:
	var up: String = nom.strip_edges().to_upper()
	if up.is_empty() and not mia:
		return {}
	if mia or (lado == 0 and up == Career.player_name.strip_edges().to_upper()):
		return {"ovr": Career.ovr_shown(),
			"pos": Career.puesto_seleccion() if bool(data.get("is_nat", false)) else Career.puesto_hoy()}
	var plantilla: Array = Squad.of(String(equipo.get("id", "")))
	var por_nombre: Dictionary = {}
	var por_apellido: Array = []
	var ape: String = CareerUi.surname(up)
	for q in plantilla:
		var p: Dictionary = q as Dictionary
		var su: String = String(p.get("name", "")).strip_edges().to_upper()
		if su == up:
			if num <= 0 or int(p.get("number", 0)) == num:
				return _de(p)
			por_nombre = p
		elif not ape.is_empty() and CareerUi.surname(su) == ape:
			por_apellido.append(p)
	if not por_nombre.is_empty():
		return _de(por_nombre)
	if por_apellido.size() == 1:
		return _de(por_apellido[0] as Dictionary)
	return {}


static func _de(p: Dictionary) -> Dictionary:
	var pos: String = String(p.get("pos", ""))
	return {"ovr": SquadMeta.ovr_pintado(p, pos, false), "pos": pos}






static func _boton_mas(v: MatchResultView, todos: Array, lado: int, equipo: Dictionary,
		sigla: String, data: Dictionary, n: int) -> Button:
	var b: Button = Button.new()
	b.name = "Mas"
	b.custom_minimum_size.y = VER_H
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	b.set_meta("rt_mas", n)
	b.pressed.connect(func() -> void: abre_mas(v, todos, lado, equipo, sigla, data))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 24, 0)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", CELDA_SEP)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_icono("menu", CareerTheme.TEXT, 32.0))
	var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT,
		CareerTheme.caps("%s · %d" % [I18n.t("MÁS"), n]))
	l.name = "Rotulo"
	l.clip_text = false
	h.add_child(l)
	return b





static func abre_mas(v: MatchResultView, todos: Array, lado: int, equipo: Dictionary,
		sigla: String, data: Dictionary) -> VBoxContainer:
	var box: VBoxContainer = CareerUi.modal_pantalla(v)
	if box == null:
		return null
	box.name = "MasGoles"
	box.set_meta("rt_mas", todos.size())
	CareerUi.margen_modal_tumbada(box)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 32)
	box.add_child(cab)
	var escudo: CrestView = CrestView.new()
	escudo.custom_minimum_size = ESCUDO
	escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(escudo)
	escudo.set_team(equipo)
	var tit: Label = _texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT,
		"%s · %s" % [sigla, CareerTheme.caps(I18n.t("GOLES"))])
	tit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tit.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	cab.add_child(tit)
	var cerrar: Button = Button.new()
	cerrar.name = "Cerrar"
	cerrar.text = I18n.t("CERRAR")
	cerrar.clip_text = true
	cerrar.custom_minimum_size = Vector2(CareerUi.LISTA_VOLVER_W, CareerTheme.TOQUE_TUMBADO)
	cerrar.size_flags_horizontal = Control.SIZE_SHRINK_END
	CareerTheme.apply_button(cerrar, CareerTheme.Kind.GHOST, CareerTheme.T_LEE_TUMBADO)
	UiKit.set_cue(cerrar, "ui_back")
	cerrar.add_to_group(CareerUi.ATRAS_BTN_GROUP)
	cerrar.pressed.connect(func() -> void: CareerUi.close_modal(box))
	cab.add_child(cerrar)
	var cols: HBoxContainer = HBoxContainer.new()
	cols.name = "Columnas"
	cols.add_theme_constant_override("separation", COL_SEP)
	cols.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cols.mouse_filter = Control.MOUSE_FILTER_IGNORE
	box.add_child(cols)
	var lista: Array = todos.slice(0, MAS_POR_COL * MAS_COLS)
	var n_cols: int = maxi(1, ceili(float(lista.size()) / float(MAS_POR_COL)))
	var vs: Array = []
	for c in n_cols:
		var col: VBoxContainer = VBoxContainer.new()
		col.name = "Col%d" % c
		col.add_theme_constant_override("separation", 0)
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		col.mouse_filter = Control.MOUSE_FILTER_IGNORE
		cols.add_child(col)
		vs.append(col)
	var primero: Button = null
	for i in lista.size():
		var f: PanelContainer = _fila(v, lista[i] as Dictionary, lado, equipo, data, false)
		f.name = "Gol%d" % i
		(vs[i / MAS_POR_COL] as VBoxContainer).add_child(f)
		if primero == null and f.has_meta("ver"):
			primero = f.get_meta("ver") as Button
	(primero if primero != null else cerrar).set_meta(Entrada.PRIMERO_META, true)
	CareerUi.modal_opaca(box)
	return box







static func _figura(figura: Dictionary, data: Dictionary) -> PanelContainer:
	var caja: PanelContainer = _placa()
	caja.name = "Figura"
	var sb: StyleBoxFlat = caja.get_theme_stylebox("panel") as StyleBoxFlat
	sb.content_margin_left = FIG_PAD
	sb.content_margin_right = FIG_PAD
	sb.content_margin_top = FIG_PAD
	sb.content_margin_bottom = FIG_PAD
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", FIG_SEP)
	col.alignment = BoxContainer.ALIGNMENT_CENTER
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(col)
	var mia: bool = bool(figura.get("mia", false))
	var lado: int = clampi(int(figura.get("lado", 0)), 0, 1)
	var equipo: Dictionary = data.get("you" if lado == 0 else "rival", {}) as Dictionary
	var nom: String = Career.player_name if mia else String(figura.get("name", ""))

	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", CELDA_SEP)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(cab)
	var copa: TrophyIcon = TrophyIcon.new()
	copa.custom_minimum_size = Vector2(32, 32)
	copa.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	copa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(copa)
	copa.set_type(TrophyIcon.partido_de(String(data.get("comp", "league"))))
	var rot: Label = _texto(CareerTheme.T_CAP_TUMBADO, CareerTheme.TEXT_DIM,
		I18n.t("JUGADOR DEL PARTIDO"))
	rot.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(rot)
	var escudo: CrestView = CrestView.new()
	escudo.custom_minimum_size = ESCUDO
	escudo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	escudo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(escudo)
	escudo.set_team(equipo)

	var quien: HBoxContainer = HBoxContainer.new()
	quien.name = "Quien"
	quien.add_theme_constant_override("separation", CELDA_SEP)
	quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(quien)
	var jugador: Dictionary = ficha(nom, lado, equipo, data, 0, mia)
	if int(jugador.get("ovr", 0)) > 0:
		quien.add_child(_celda_medalla(int(jugador["ovr"]), FIG_OVR_NUM * 2.5, FIG_OVR_NUM))
	var pos: String = String(jugador.get("pos", ""))
	if pos.is_empty() and bool(figura.get("portero", false)):
		pos = "POR"
	if not pos.is_empty():
		var chip: PanelContainer = CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
			CareerTheme.T_LEE_TUMBADO, 12.0, 6.0)
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		quien.add_child(chip)
	var nombre: Label = _texto(CareerTheme.T_DATO_TUMBADO, CareerTheme.TEXT, "")
	nombre.name = "Nombre"
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	quien.add_child(nombre)
	_por_peldanos(nombre, CareerUi.display_name(nom), [CareerTheme.T_DATO_TUMBADO,
		CareerTheme.T_LEE_TUMBADO])

	var hizo: HBoxContainer = HBoxContainer.new()
	hizo.name = "Hizo"
	hizo.add_theme_constant_override("separation", 32)
	hizo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	if mia and figura.has("rating"):
		var r: float = float(figura["rating"])
		var nota: HBoxContainer = HBoxContainer.new()
		nota.name = "Nota"
		nota.add_theme_constant_override("separation", CELDA_SEP)
		nota.mouse_filter = Control.MOUSE_FILTER_IGNORE
		nota.add_child(_icono("media", CareerTheme.NAV_YO, ESTRELLA))
		var cifra: Label = _texto(CareerTheme.T_TITULO_TUMBADO, MatchResultView.color_nota(r),
			I18n.num(r, 1))
		cifra.clip_text = false
		nota.add_child(cifra)
		hizo.add_child(nota)
	for parte in MatchResultView.partes_figura(figura):
		var pd: Dictionary = parte as Dictionary
		if String(pd["rol"]) == "nota":
			continue
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", 8)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(_icono(String(pd["icono"]), CareerTheme.TEXT_MID, 32.0))
		var l: Label = _texto(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT, String(pd["texto"]))
		l.clip_text = false
		h.add_child(l)
		hizo.add_child(h)
	if hizo.get_child_count() > 0:
		col.add_child(hizo)
	else:
		hizo.free()
	return caja






static func _texto(size: int, color: Color, txt: String) -> Label:
	var l: Label = CareerUi.plain(size, color)
	l.text = txt
	l.clip_text = true
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l




static func _por_peldanos(l: Label, entero: String, peldanos: Array, corto: String = "") -> void:
	l.text = entero
	l.set_meta("peldano_entero", entero)
	var c: String = corto if not corto.is_empty() else CareerUi.surname(entero)
	if c != entero:
		l.set_meta("peldano_corto", c)
	CareerUi.letra_por_peldanos(l, peldanos)


static func _icono(tipo: String, color: Color, lado: float) -> Control:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, color)
	return ic
