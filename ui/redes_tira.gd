class_name RedesTira
extends RefCounted











































const DISENO_W: float = 1980.0
const TIRA_W: float = 843.0
const TIRA_MIN: float = 720.0
const COL_SEP: float = 32.0


const FILA_H: float = 108.0
const FILA_SEP: int = 16
const FILA_SEP_V: int = 20

const FILAS: int = 4

const MAS_H: float = 88.0

const RADIO: int = 26
const RADIO_FILA: int = 22
const RADIO_MEDIA: int = 18

const LABIO: int = 4

const AVATAR: float = 56.0
const AVATAR_FILA: float = 52.0

const ARO_HUECO: int = 4
const ARO: int = 3

const HISTORIA: float = 60.0
const HISTORIA_V: float = 70.0
const HISTORIA_SEP: int = 28

const MEDIA_MIN: float = 120.0
const MEDIA_MIN_V: float = 200.0
const MEDIA_ESCUDO: float = 64.0



const FOTO_TUMBADA: Vector2 = Vector2(396.0, 528.0)
const FOTO_V_MAX: float = 600.0
const FOTO_RADIO: int = 22
const FOTO_MINI: Vector2 = Vector2(66.0, 88.0)
const FOTO_MINI_RADIO: int = 8


const CARA_RECORTE: float = 0.3

const COMPOSITOR_PARTE: float = 2.12
const COMPOSITOR_MIN: float = 640.0

const BORRADOR_H: float = 92.0
const BORRADOR_BTN_MIN: float = 220.0
const BORRADOR_BTN_MAX: float = 300.0
const BORRADOR_RADIO: int = 20

const NOMBRE_MAX: float = 520.0

const BORRADORES: Array = [
	["a", "IGNORAR", "No contestas. Pasa solo."],
	["b", "CON CLASE", "Toca mejorar. Y mejoraré."],
	["c", "ZASCA", "En el próximo hablo yo. #CALLABOCAS"],
]





const BORRADORES_PIQUE: Array = [
	["a", "DEJARLO PASAR", "Ni le contestas. Tu técnico lo agradece."],
	["b", "CONTESTAR", "Hablamos en el campo."],
]
const CONTESTA_FINAL: String = "La final ya pasó. Ahora, otra historia."

const PIQUE_BARRA_PX: float = 8.0



const ICONO_VOZ: Dictionary = {
	MuroRedes.HINCHA: "aficion",
	MuroRedes.PRENSA: "prensa",
	MuroRedes.COMPANERO: "equipo",
	MuroRedes.MARCA: "patrocinador",
	MuroRedes.RIVAL: "aficion",
	MuroRedes.FAN: "aficion",
}

const NOMBRE_VOZ: Dictionary = {
	MuroRedes.HINCHA: "La Grada",
	MuroRedes.PRENSA: "El Diario",
	MuroRedes.COMPANERO: "Vestuario",
	MuroRedes.MARCA: "Tu marca",
	MuroRedes.RIVAL: "Hincha rival",
}
const ARROBA_VOZ: Dictionary = {
	MuroRedes.HINCHA: "@lagradafiel",
	MuroRedes.PRENSA: "@eldiario",
	MuroRedes.COMPANERO: "@el_10_del_equipo",
	MuroRedes.MARCA: "@tumarca_oficial",
	MuroRedes.RIVAL: "@ultra_norte",
}

const HISTORIA_VOZ: Dictionary = {
	MuroRedes.YO: "TÚ",
	MuroRedes.PRENSA: "PRENSA",
	MuroRedes.HINCHA: "GRADA",
	MuroRedes.COMPANERO: "VESTUARIO",
	MuroRedes.RIVAL: "RIVAL",
	MuroRedes.MARCA: "MARCA",

	MuroRedes.JUGADOR: "RIVAL",
}



const ORDEN_HISTORIAS: Array = [MuroRedes.YO, MuroRedes.PRENSA, MuroRedes.HINCHA,
	MuroRedes.COMPANERO, MuroRedes.RIVAL, MuroRedes.JUGADOR, MuroRedes.MARCA]

const ROL_TONO: Dictionary = {
	MuroRedes.FUEGO: "FUEGO",
	MuroRedes.APLAUSO: "APLAUSO",
	MuroRedes.PITADA: "PITADA",
	MuroRedes.RISA: "RISA",
}


const OTROS_TONOS: Dictionary = {
	MuroRedes.PITADA: [MuroRedes.RISA, MuroRedes.APLAUSO],
	MuroRedes.APLAUSO: [MuroRedes.FUEGO, MuroRedes.PITADA],
	MuroRedes.FUEGO: [MuroRedes.APLAUSO, MuroRedes.RISA],
	MuroRedes.RISA: [MuroRedes.PITADA, MuroRedes.APLAUSO],
}



const OTROS_HECHO: Dictionary = {
	"pique": [MuroRedes.RISA, MuroRedes.APLAUSO],
}

const ICONO_REL: Dictionary = {"prensa": "prensa", "aficion": "aficion", "tecnico": "tecnico"}





static func build_tumbada(host: Node, caja: VBoxContainer, ancho: float) -> void:
	var filas: Array = Career.muro_redes
	if filas.is_empty():
		var placa: Control = CareerUi.vacio_apaisado(caja, I18n.t("Tu muro todavía está vacío."),
			"smartphone")
		host.call("_wnews_vacio_cabe", placa, ancho)
		return



	var critica: Dictionary = mencion_viva()
	if not critica.is_empty():
		var cuerpo_c: HBoxContainer = _cuerpo(caja)
		var ancho_comp: float = compositor_ancho(ancho)
		cuerpo_c.add_child(portada(host, critica, ancho - ancho_comp - COL_SEP, false))
		cuerpo_c.add_child(compositor(host, ancho_comp, false))
		return



	var enc: Dictionary = encuesta_viva()
	if not enc.is_empty():
		var cuerpo_e: HBoxContainer = _cuerpo(caja)
		var ancho_p: float = compositor_ancho(ancho)
		cuerpo_e.add_child(portada(host, enc, ancho - ancho_p - COL_SEP, false))
		cuerpo_e.add_child(EncuestaTira.placa(host, ancho_p, false))
		return
	caja.add_child(_historias(host, filas, false))
	var cuerpo: HBoxContainer = _cuerpo(caja)

	if filas.size() == 1:
		cuerpo.add_child(portada(host, filas[0], ancho, false))
		return
	var ancho_col: float = tira_ancho(ancho)
	cuerpo.add_child(portada(host, filas[0], ancho - ancho_col - COL_SEP, false))
	cuerpo.add_child(_columna(host, filas, ancho_col, false))


static func _cuerpo(caja: VBoxContainer) -> HBoxContainer:
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.name = "Cuerpo"
	cuerpo.add_theme_constant_override("separation", int(COL_SEP))
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(cuerpo)
	return cuerpo





static func build_retrato(host: Node, content: VBoxContainer, ancho: float) -> void:
	var filas: Array = Career.muro_redes
	if filas.is_empty():
		CareerUi.vacio_apaisado(content, I18n.t("Tu muro todavía está vacío."), "smartphone")
		return
	content.add_child(seguidores(ancho, true))
	content.add_child(_historias(host, filas, true))
	var critica: Dictionary = mencion_viva()
	if not critica.is_empty():
		content.add_child(portada(host, critica, ancho, true))
		content.add_child(compositor(host, ancho, true))
		return

	var enc: Dictionary = encuesta_viva()
	if not enc.is_empty():
		content.add_child(portada(host, enc, ancho, true))
		content.add_child(EncuestaTira.placa(host, ancho, true))
		return
	content.add_child(portada(host, filas[0], ancho, true))
	if host.has_meta("redes_todas"):
		content.add_child(columna_entera(host, filas, ancho))
	elif filas.size() > 1:
		content.add_child(_columna(host, filas, ancho, true))




static func tira_ancho(ancho: float) -> float:
	return clampf(floorf(ancho * TIRA_W / DISENO_W), TIRA_MIN, TIRA_W)








static func cabecera(app: VBoxContainer, de_pie: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "CabeceraApp"
	h.custom_minimum_size.y = Celular.CAB_H
	h.add_theme_constant_override("separation", 18)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	app.add_child(h)
	h.add_child(Celular.baldosa("redes", 56.0, 4.0))
	var t: VBoxContainer = VBoxContainer.new()
	t.alignment = BoxContainer.ALIGNMENT_CENTER
	t.add_theme_constant_override("separation", 4)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(t)

	var tit: Label = _rotulo(CareerTheme.caps(I18n.t("TUS REDES")), CareerTheme.T_DATO_TUMBADO,
		CareerTheme.REDES_INK)
	tit.name = "TituloApp"
	t.add_child(tit)
	var arroba: Label = _dato(_tu_arroba(), CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM)
	arroba.name = "Arroba"
	t.add_child(arroba)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	if de_pie:
		h.add_child(_medalla(CareerTheme.T_BODY))
	else:
		h.add_child(_perfil())
	return h






static func _perfil() -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "RedesSeguidores"
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, 99, 0)
	_relleno(sb, 10, 26, 8, 8)
	pc.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	h.add_child(_medalla(CareerTheme.T_CAP_TUMBADO))
	h.add_child(_raya(40.0))
	_cifra_seguidores(h, CareerTheme.T_LEE_TUMBADO, 32.0)
	var esc: VBoxContainer = _escalon(14.0)
	esc.custom_minimum_size.x = 150.0
	h.add_child(esc)
	return pc





static func seguidores(_ancho: float, _vertical: bool) -> PanelContainer:
	var placa: PanelContainer = PanelContainer.new()
	placa.name = "RedesSeguidores"
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, 24, LABIO)
	_relleno(sb, 24, 24, 18, 18)
	placa.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 18)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(h)
	_cifra_seguidores(h, CareerTheme.T_DATO_TUMBADO, 40.0)
	h.add_child(_raya(44.0))
	var esc: VBoxContainer = _escalon(14.0)
	esc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	h.add_child(esc)
	return placa



static func _cifra_seguidores(h: HBoxContainer, px: int, icono: float) -> void:
	h.add_child(_icono("aficion", CareerTheme.REDES_MARCA_INK, icono))
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 2)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(v)
	var cifra: Label = _dato(I18n.num(Career.seguidores_visual()), px, CareerTheme.REDES_INK)
	cifra.name = "Cifra"
	v.add_child(cifra)
	v.add_child(_rotulo(CareerTheme.caps(I18n.t("SEGUIDORES")), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM))



static func _escalon(alto_barra: float) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 8)
	v.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var l: Label = _dato(CareerTheme.caps(I18n.t(Career.prensa_escalon_nombre(), "fama")),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_GOOD_INK)
	l.name = "Escalon"
	v.add_child(l)
	var relleno: ColorRect = CareerUi.bar(v, CareerTheme.NAV_YO, alto_barra)
	relleno.name = "Progreso"
	relleno.anchor_right = MuroRedes.progreso(Career.prensa_escalon(), Career.rel_eff("prensa"))

	var carril: Control = relleno.get_parent() as Control
	(carril.get_child(0) as ColorRect).color = CareerTheme.REDES_LINE

	CareerUi.bar_notch(carril, 1.0)
	return v



static func _tu_arroba() -> String:
	return CareerTheme.caps("@" + _tu_nombre().replace(" ", ""))


static func _tu_nombre() -> String:
	return CareerUi.surname(CareerUi.display_name(Career.player_name))











static func _historias(host: Node, filas: Array, vertical: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Historias"
	h.add_theme_constant_override("separation", HISTORIA_SEP)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var ultima: Dictionary = filas[0]




	var i_ref: int = 0
	for i in filas.size():
		if not String((filas[i] as Dictionary).get("hecho", "")) in ["pique", "post_pique"]:
			i_ref = i
			break
	var ref: Dictionary = filas[i_ref]
	for autor in ORDEN_HISTORIAS:
		var g: Dictionary = {}
		var i_g: int = -1
		for i in filas.size():
			if String((filas[i] as Dictionary).get("autor", "")) == autor:
				g = filas[i]
				i_g = i
				break
		if g.is_empty():
			continue
		var fresca: bool = i_g < i_ref or _fresca(g, ref)
		h.add_child(_historia(host, g, String(autor), fresca, vertical, g == ultima))


	if vertical and h.get_child_count() < 4:
		for n in h.get_children():
			(n as Control).size_flags_horizontal = Control.SIZE_FILL
	return h


static func _historia(host: Node, g: Dictionary, autor: String, fresca: bool,
		vertical: bool, es_portada: bool = false) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Historia"
	pc.set_meta("redes_historia", autor)
	pc.set_meta("redes_portada", es_portada)
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	if vertical:
		pc.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 6)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(v)
	var circulo: Control = _avatar(g, autor, HISTORIA_V if vertical else HISTORIA)
	var aro: PanelContainer = _aro(circulo, CareerTheme.REDES_MARCA if fresca else CareerTheme.REDES_LINE,
		CareerTheme.REDES_BG, 4, 4)
	aro.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	v.add_child(aro)
	var l: Label = _rotulo(CareerTheme.caps(I18n.t(String(HISTORIA_VOZ.get(autor, "PRENSA")))),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_INK if fresca else CareerTheme.REDES_DIM)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	v.add_child(l)
	var toque: Button = CareerUi.hit_overlay(88.0, func() -> void: lee(host, g))
	toque.name = "Abre"
	if not es_portada:
		toque.set_meta(Entrada.SIN_FOCO_META, true)
	pc.add_child(toque)
	return pc



static func _fresca(g: Dictionary, ultima: Dictionary) -> bool:
	if int(g.get("season", -1)) != int(ultima.get("season", -2)):
		return false
	var p: int = int(ultima.get("partido", -1))
	if p >= 0:
		return int(g.get("partido", -1)) == p
	return int(g.get("day", -1)) == int(ultima.get("day", -2))







static func portada(host: Node, f: Dictionary, ancho: float, vertical: bool,
		completa: bool = false) -> PanelContainer:
	var autor: String = String(f.get("autor", ""))
	var hecho: String = String(f.get("hecho", ""))
	var tono: String = MuroRedes.tono(f)
	var yo: bool = autor == MuroRedes.YO
	var zasca: bool = hecho == "zasca_ok" or hecho == "zasca_ko"


	var viva: bool =(hecho == "critica" or hecho == "pique") and mencion_viva() == f \
			and not completa


	var encuesta: bool = hecho == "pena_encuesta" and encuesta_viva() == f and not completa
	var card: PanelContainer = PanelContainer.new()
	card.name = "RedesPost"
	card.set_meta("redes_post", hecho)
	card.set_meta("fl_fila", true)
	card.custom_minimum_size.x = ancho
	card.size_flags_vertical = Control.SIZE_EXPAND_FILL if not vertical else Control.SIZE_SHRINK_BEGIN
	card.mouse_filter = Control.MOUSE_FILTER_PASS
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, RADIO, LABIO)
	_relleno(sb, 24, 24, 22 if vertical else 20, 20 if vertical else 16)
	card.add_theme_stylebox_override("panel", sb)
	var pila: VBoxContainer = VBoxContainer.new()
	pila.name = "Pila"
	pila.add_theme_constant_override("separation", 18 if vertical else 14)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	card.add_child(pila)

	var w: float = ancho - 48.0 - 4.0



	var foto: Texture2D = SelfieFotos.carga(String(f.get("foto", ""))) \
			if autor == MuroRedes.FAN else null
	if foto != null and not vertical:
		card.remove_child(pila)
		var lado_a_lado: HBoxContainer = HBoxContainer.new()
		lado_a_lado.name = "ConFoto"
		lado_a_lado.add_theme_constant_override("separation", 28)
		lado_a_lado.mouse_filter = Control.MOUSE_FILTER_IGNORE
		card.add_child(lado_a_lado)
		pila.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		lado_a_lado.add_child(pila)
		lado_a_lado.add_child(_foto_selfie(foto, FOTO_TUMBADA, FOTO_RADIO, false))
		w -= FOTO_TUMBADA.x + 28.0
	pila.add_child(_cabecera(f, autor, hecho, tono, zasca, viva or encuesta, vertical))
	var peldanos: Array = [[24, 3]] if zasca else [[32, 2], [24, 3]]


	if foto != null and not vertical:
		peldanos = [[32, 4], [24, 6]]
	pila.add_child(renglones(host, EncuestaTira.pregunta() if encuesta else Career.muro_texto(f),
		peldanos, w, 10, _cabeza_de(f)))


	var media: Control = EncuestaTira.media(f, vertical) if EncuestaTira.es_suyo(f) \
			else (null if autor == MuroRedes.FAN else _media(f, yo, vertical))
	if foto != null and vertical:
		var lado_v: float = minf(FOTO_V_MAX, w)
		media = _foto_selfie(foto, Vector2(lado_v, lado_v * 4.0 / 3.0), FOTO_RADIO, true)
	if media != null:
		pila.add_child(media)
	if yo and completa:
		var hilo: Array = Career.muro_hilo(f)
		if not hilo.is_empty():
			pila.add_child(_hilo(f, hilo, vertical))
	elif zasca:
		pila.add_child(_cobro(f))


	if (media == null or EncuestaTira.es_suyo(f)) and not vertical:
		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		pila.add_child(hueco)
	pila.add_child(EncuestaTira.votos_pie(f) if encuesta else _reacciones(host, f, tono, viva))
	return card






static func critica_viva() -> Dictionary:
	if not Career.zasca_vivo():
		return {}
	for g in Career.muro_redes:
		if String((g as Dictionary).get("hecho", "")) == "critica":
			return g
	return {}






static func mencion_viva() -> Dictionary:
	if Career.pique_vivo():
		for g in Career.muro_redes:
			if String((g as Dictionary).get("hecho", "")) == "pique":
				if String((g as Dictionary).get("quien", "")) == String(Career.pique_red.get("quien", "")):
					return g
				break
	return critica_viva()






static func encuesta_viva() -> Dictionary:
	if not Career.encuesta_viva():
		return {}
	for g in Career.muro_redes:
		if String((g as Dictionary).get("hecho", "")) == "pena_encuesta":
			if String((g as Dictionary).get("celeb", "")) \
					== String(Career.encuesta_pena.get("ganadora", "")):
				return g
			break
	return {}




static func pique_final(f: Dictionary) -> bool:
	return int(f.get("n", 0)) == 1




static func nombre_pique(f: Dictionary) -> String:
	var n: String = String(f.get("nombre", ""))
	if n.is_empty() and not String(f.get("quien", "")).is_empty():
		n = Competitions.demarca(String(f.get("quien", "")))
	return n if not n.is_empty() else I18n.t("RIVAL")



static func arroba_pique(f: Dictionary) -> String:
	return CareerTheme.caps("@" + nombre_pique(f).replace(" ", "").replace(".", ""))



static func _club_pique(f: Dictionary) -> String:
	var slot: Dictionary = _partido(f)
	return "" if slot.is_empty() else String(GameState.rival_of(slot).get("id", ""))



static func _ficha_pique(f: Dictionary) -> Dictionary:
	var club: String = _club_pique(f)
	var quien: String = String(f.get("quien", ""))
	if club.is_empty() or quien.is_empty():
		return {}
	for row in Squad.of(club):
		if String((row as Dictionary).get("name", "")) == quien:
			return row
	return {}




static func _avatar_pique(f: Dictionary) -> Control:
	var row: Dictionary = _ficha_pique(f)
	if row.is_empty():
		return _avatar(f, MuroRedes.JUGADOR, AVATAR)
	var med: OvrBadge = OvrBadge.new()
	med.name = "MedallaRival"
	med.setup(Squad.ovr_scale(float(SquadMeta.media_of(row, String(row.get("pos", ""))))),
		CareerTheme.T_LEE_TUMBADO)
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	med.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return med





static func medalla_pique(f: Dictionary, de_pie: bool) -> Control:
	var row: Dictionary = _ficha_pique(f)
	if row.is_empty():
		return null
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "MedallaRival"
	h.add_theme_constant_override("separation", 8)
	h.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var pos: String = String(row.get("pos", ""))
	var med: OvrBadge = OvrBadge.new()
	med.setup(Squad.ovr_scale(float(SquadMeta.media_of(row, pos))),
		14 if de_pie else CareerTheme.T_CAP_TUMBADO)
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	med.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(med)
	var chip: PanelContainer = CareerUi.pos_chip(pos) if de_pie \
			else CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
			CareerTheme.T_CAP_TUMBADO, 12.0, 4.0)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(chip)
	return h




static func _nombre_pique(f: Dictionary, vertical: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 10)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var row: Dictionary = _ficha_pique(f)
	if not row.is_empty():
		var pos: String = String(row.get("pos", ""))
		var chip: PanelContainer = CareerUi.pos_chip(pos) if vertical \
				else CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
				CareerTheme.T_CAP_TUMBADO, 12.0, 4.0)
		chip.name = "PuestoRival"
		chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(chip)
	var nombre: Label = _dato(nombre_pique(f), CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK,
		NOMBRE_MAX)
	nombre.name = "Quien"
	h.add_child(nombre)
	var slot: Dictionary = _partido(f)
	if not slot.is_empty():
		var rival: Dictionary = GameState.rival_of(slot)
		if not rival.is_empty():
			h.add_child(_escudo(rival, 24.0))
	return h





static func _cabecera(f: Dictionary, autor: String, hecho: String, tono: String,
		zasca: bool, viva: bool, vertical: bool = false) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Cabecera"
	h.custom_minimum_size.y = 64.0
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var jugador: bool = autor == MuroRedes.JUGADOR
	var av: Control = _avatar_pique(f) if jugador else _avatar(f, autor, AVATAR)
	if viva and not jugador:
		av = _aro(av, CareerTheme.REDES_MARCA, CareerTheme.REDES_CARD, ARO, ARO_HUECO)
	av.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(av)
	var quien: VBoxContainer = VBoxContainer.new()
	quien.alignment = BoxContainer.ALIGNMENT_CENTER
	quien.add_theme_constant_override("separation", 6)
	quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(quien)



	if jugador:
		quien.add_child(_nombre_pique(f, vertical))
	else:
		var nombre: Label = _dato(_nombre(autor, f), CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK,
			NOMBRE_MAX)
		nombre.name = "Quien"
		quien.add_child(nombre)
	var cuando_l: Label = _dato(_arroba_cuando(f, autor), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM, NOMBRE_MAX)
	cuando_l.name = "Cuando"
	quien.add_child(cuando_l)
	if autor == MuroRedes.YO:
		h.add_child(_medalla(CareerTheme.T_CAP_TUMBADO))
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	if autor == MuroRedes.YO:
		h.add_child(_pildora(CareerTheme.caps(I18n.t("TU POST")), CareerTheme.REDES_MARCA_SOFT,
			CareerTheme.REDES_MARCA_INK, null))
	if hecho == "critica" or zasca:
		h.add_child(_nota(float(int(f.get("n", 0))) / 10.0))


	if jugador:
		h.add_child(_pildora(CareerTheme.caps(I18n.t("LA FINAL" if pique_final(f) else "DERBI")),
			CareerTheme.REDES_FUEGO_BG, CareerTheme.REDES_FUEGO_INK,
			MuroIcon.nuevo(MuroRedes.FUEGO, 16.0)))
	elif hecho == "pena_encuesta":

		h.add_child(_pildora(CareerTheme.caps(I18n.t("ENCUESTA")), CareerTheme.REDES_MARCA_SOFT,
			CareerTheme.REDES_MARCA_INK, _icono("stats", CareerTheme.REDES_MARCA_INK, 16.0)))
	elif autor == MuroRedes.FAN:


		h.add_child(_pildora(CareerTheme.caps(I18n.t("FAN")), CareerTheme.REDES_MARCA_SOFT,
			CareerTheme.REDES_MARCA_INK, null))
	elif not zasca and ROL_TONO.has(tono):
		var malo: bool = tono == MuroRedes.PITADA
		h.add_child(_pildora(CareerTheme.caps(I18n.t(String(ROL_TONO[tono]))),
			CareerTheme.REDES_BAD_BG if malo else CareerTheme.REDES_SOFT, tinta_tono(tono),
			MuroIcon.nuevo(tono, 16.0)))
	return h



static func _nombre(autor: String, f: Dictionary = {}) -> String:
	if autor == MuroRedes.YO:
		return _tu_nombre()
	if autor == MuroRedes.JUGADOR:
		return nombre_pique(f)
	if autor == MuroRedes.FAN:
		var n: String = String(f.get("nombre", ""))
		return n if not n.is_empty() else I18n.t("FAN")
	return I18n.t(String(NOMBRE_VOZ.get(autor, "El Diario")))



static func _arroba_cuando(f: Dictionary, autor: String) -> String:
	var a: String = _arroba(f, autor)
	var j: String = jornada(f)




	var slot: Dictionary = _partido(f)
	var antes: bool = not slot.is_empty() and not bool(slot.get("played", false))
	var c: String = I18n.tf("antes de la {0}" if antes else "tras la {0}", [j]) if not j.is_empty() \
			else I18n.tf("T{0}", [int(f.get("season", 0)) + 1])
	return CareerTheme.caps("%s · %s" % [a, c])



static func _arroba(f: Dictionary, autor: String) -> String:
	if autor == MuroRedes.YO:
		return _tu_arroba()
	if autor == MuroRedes.JUGADOR:
		return arroba_pique(f)
	if autor == MuroRedes.FAN:
		return arroba_fan(f)
	return I18n.t(String(ARROBA_VOZ.get(autor, "@eldiario")))




static func arroba_fan(f: Dictionary) -> String:
	var n: String = _nombre(MuroRedes.FAN, f).replace(" ", "").replace(".", "")
	return CareerTheme.caps("@%s%02d" % [n, absi(int(f.get("semilla", 0))) % 100])



static func _medalla(px: int) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	h.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var med: OvrBadge = OvrBadge.new()
	med.setup(Squad.ovr_scale(Career.skills_avg()), px)
	med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	med.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(med)


	var pos: String = Career.puesto_hoy()
	var chip: PanelContainer = CareerUi.pos_chip(pos) if px != CareerTheme.T_CAP_TUMBADO \
			else CareerUi.code_chip(CareerUi.pos_rotulo(pos), CareerUi.pos_color(pos),
			CareerTheme.T_CAP_TUMBADO, 12.0, 4.0)
	chip.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(chip)
	return h






static func _media(f: Dictionary, yo: bool, vertical: bool) -> Control:
	var slot: Dictionary = _partido(f)


	var proximo: bool = String(f.get("hecho", "")) == "pique" and not slot.is_empty() \
			and not bool(slot.get("played", false))
	if slot.is_empty() or (not bool(slot.get("played", false)) and not proximo):
		return null
	var rival: Dictionary = GameState.rival_of(slot)
	if rival.is_empty():
		return null
	var caja: PanelContainer = PanelContainer.new()
	caja.name = "Media"
	caja.custom_minimum_size.y = MEDIA_MIN_V if vertical else MEDIA_MIN
	caja.size_flags_vertical = Control.SIZE_SHRINK_BEGIN if vertical else Control.SIZE_EXPAND_FILL
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE

	caja.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	var fondo: Color = _fondo_media(yo)
	caja.add_theme_stylebox_override("panel", _caja(fondo, RADIO_MEDIA, 0))
	var rayas: Control = Control.new()
	rayas.name = "Rayas"
	rayas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rayas.draw.connect(func() -> void:
		var col: Color = Color(CareerTheme.CELULAR_BISEL, 0.16)
		var x: float = - rayas.size.y
		while x < rayas.size.x:
			rayas.draw_line(Vector2(x, rayas.size.y), Vector2(x + rayas.size.y, 0.0), col, 12.0)
			x += 34.0)
	caja.add_child(rayas)
	var arriba: MarginContainer = _margen(16, 16, 14, 14)
	caja.add_child(arriba)
	var chip: PanelContainer = PanelContainer.new()
	chip.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	chip.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	chip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sc: StyleBoxFlat = _caja(Color(CareerTheme.CELULAR_BISEL, 0.45), 8, 0)
	_relleno(sc, 12, 12, 6, 6)
	chip.add_theme_stylebox_override("panel", sc)
	arriba.add_child(chip)
	var j: String = jornada(f)
	var final: String = I18n.t("FINAL")
	var tramos: Array = [final, j]



	if proximo:
		var dia: String = Celular.dia_de(int(f.get("partido", -1)))
		tramos = [j, dia, I18n.t("LA REVANCHA")] if pique_final(f) else [I18n.t("DERBI"), j, dia]
	var cartel: Array = tramos.filter(func(x: Variant) -> bool: return not String(x).is_empty())

	var rotulo_media: Label = _dato(CareerTheme.caps(" · ".join(PackedStringArray(cartel))),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.CELULAR_TINTA)
	rotulo_media.name = "Cartel"
	chip.add_child(rotulo_media)
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(centro)
	var marcador: HBoxContainer = HBoxContainer.new()
	marcador.add_theme_constant_override("separation", 32)
	marcador.mouse_filter = Control.MOUSE_FILTER_IGNORE
	centro.add_child(marcador)

	var casa: bool = bool(slot.get("home", true))
	var gf: int = int(slot.get("gf", 0))
	var gc: int = int(slot.get("gc", 0))
	marcador.add_child(_escudo(GameState.you_team() if casa else rival, MEDIA_ESCUDO))
	var goles: Label = _dato(CareerTheme.caps(I18n.t("VS")) if proximo \
			else "%d - %d" %([gf, gc] if casa else [gc, gf]),
		CareerTheme.T_TITULO_TUMBADO, CareerTheme.CELULAR_TINTA)
	goles.name = "VS" if proximo else "Marcador"
	marcador.add_child(goles)
	marcador.add_child(_escudo(rival if casa else GameState.you_team(), MEDIA_ESCUDO))
	return caja





static func _fondo_media(yo: bool) -> Color:
	if not yo:
		return CareerTheme.REDES_MEDIA
	var fondo: Color = CareerTheme.accent().darkened(0.35)
	for _i in range(12):
		if CareerTheme.contrast(CareerTheme.CELULAR_TINTA, fondo) >= 4.5:
			break
		fondo = fondo.darkened(0.1)
	return fondo





static func _partido(f: Dictionary) -> Dictionary:
	if int(f.get("season", -1)) != GameState.season_num - 1:
		return {}
	if String(f.get("club", "")) != GameState.player_team_id:
		return {}
	var p: int = int(f.get("partido", -1))
	if p < 0 or p >= GameState.calendar.size():
		return {}
	return GameState.calendar[p]






static func _reacciones(host: Node, f: Dictionary, tono: String, viva: bool) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Reacciones"
	h.custom_minimum_size.y = 36.0
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var reparto: Array = _reparto(f, tono)
	for i in reparto.size():
		var par: Array = reparto[i]
		if i > 0:
			var aire: Control = Control.new()
			aire.custom_minimum_size.x = 12.0
			aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
			h.add_child(aire)
		h.add_child(MuroIcon.nuevo(String(par[0]), 28.0))
		var l: Label = _dato(I18n.num(int(par[1])), CareerTheme.T_LEE_TUMBADO,
			CareerTheme.REDES_DIM if i == 2 else tinta_tono(String(par[0])))
		h.add_child(l)
	if viva:
		var hueco: Control = Control.new()
		hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(hueco)
		h.add_child(_responder(host))
	return h





static func _reparto(f: Dictionary, tono: String) -> Array:
	var total: int = Career.muro_reacciones(f)
	var out: Array = [[tono, total]]
	var otros: Array = OTROS_HECHO.get(String(f.get("hecho", "")),
		OTROS_TONOS.get(tono, [MuroRedes.RISA, MuroRedes.APLAUSO]))
	var s: int = absi(int(f.get("semilla", 0)))
	var segunda: int = total *(15 + s % 16) / 100
	var tercera: int = total *(1 +(s / 16) % 8) / 100
	if segunda > 0:
		out.append([otros[0], segunda])
		if tercera > 0:
			out.append([otros[1], tercera])
	return out




static func tinta_tono(tono: String) -> Color:
	match tono:
		MuroRedes.PITADA:
			return CareerTheme.REDES_BAD_INK
		MuroRedes.RISA:
			return CareerTheme.REDES_RISA_INK
		MuroRedes.FUEGO:
			return CareerTheme.REDES_FUEGO_INK
	return CareerTheme.REDES_GOOD_INK




static func _responder(host: Node) -> PanelContainer:
	var zona: PanelContainer = PanelContainer.new()
	zona.name = "ResponderZona"
	zona.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	zona.mouse_filter = Control.MOUSE_FILTER_IGNORE
	zona.add_theme_stylebox_override("panel", StyleBoxEmpty.new())
	var centro: CenterContainer = CenterContainer.new()
	centro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	zona.add_child(centro)
	centro.add_child(_pildora(CareerTheme.caps(I18n.t("RESPONDER")), CareerTheme.REDES_MARCA_SOFT,
		CareerTheme.REDES_MARCA_INK, _icono("flecha_der", CareerTheme.REDES_MARCA_INK, 16.0)))
	var toque: Button = CareerUi.hit_overlay(88.0, func() -> void: _a_contestar(host))
	toque.name = "Responder"
	toque.set_meta(Entrada.SIN_FOCO_META, true)
	zona.add_child(toque)
	return zona





static func _a_contestar(host: Node) -> void:
	var comp: Control = host.find_child("Compositor", true, false) as Control
	if comp == null:
		return
	var n: Node = comp.get_parent()
	while n != null and not (n is ScrollContainer):
		n = n.get_parent()
	if n != null:
		(n as ScrollContainer).ensure_control_visible(comp)
	var b: Control = comp.find_child("Contesta", true, false) as Control
	if b != null and Entrada.foco_vivo():
		b.grab_focus()




static func _hilo(f: Dictionary, hilo: Array, vertical: bool) -> PanelContainer:
	var placa: PanelContainer = PanelContainer.new()
	placa.name = "Hilo"
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_SOFT, 16, 0)
	_relleno(sb, 16, 16, 16 if vertical else 12, 16 if vertical else 12)
	placa.add_theme_stylebox_override("panel", sb)
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 18 if vertical else 12)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(v)
	for r in hilo:
		var d: Dictionary = r
		var autor: String = String(d.get("autor", ""))
		var h: HBoxContainer = HBoxContainer.new()
		h.name = "Respuesta"
		h.set_meta("redes_respuesta", autor)
		h.custom_minimum_size.y = 48.0
		h.add_theme_constant_override("separation", 16)
		h.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(h)
		h.add_child(_avatar(f, autor, 44.0))
		h.add_child(MuroIcon.nuevo(String(d.get("tono", "")), 24.0))
		var txt: VBoxContainer = VBoxContainer.new()
		txt.add_theme_constant_override("separation", 8)
		txt.alignment = BoxContainer.ALIGNMENT_CENTER
		txt.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		txt.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(txt)
		var rol: Label = _dato(CareerTheme.caps(_nombre(autor)), CareerTheme.T_CAP_TUMBADO,
			CareerTheme.REDES_DIM)
		txt.add_child(rol)
		var dice: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
		dice.text = String(d.get("texto", ""))
		dice.clip_text = true
		dice.mouse_filter = Control.MOUSE_FILTER_IGNORE
		txt.add_child(dice)
	return placa





static func _cobro(f: Dictionary) -> PanelContainer:
	var placa: PanelContainer = PanelContainer.new()
	placa.name = "Cobro"
	placa.custom_minimum_size.y = 48.0
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_SOFT, 16, 0)
	_relleno(sb, 16, 16, 8, 8)
	placa.add_theme_stylebox_override("panel", sb)
	var cobro: Dictionary = RuedaPrensa.zasca_cobro(float(int(f.get("n", 0))) / 10.0, 90)
	placa.add_child(apuesta(cobro, CareerTheme.T_LEE_TUMBADO, 20))
	return placa





static func apuesta(delta: Dictionary, px: int, aire: int, icono: float = 32.0) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Apuesta"
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var primero: bool = true
	for k in delta:
		var v: float = float(delta[k])
		if is_zero_approx(v):
			continue
		if not primero:
			var hueco: Control = Control.new()
			hueco.custom_minimum_size.x = float(aire) - 12.0
			hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
			h.add_child(hueco)
		primero = false
		var col: Color = CareerTheme.REDES_GOOD_INK if v > 0.0 else CareerTheme.REDES_BAD_INK
		h.add_child(_icono(String(ICONO_REL.get(String(k), "prensa")), col, icono))
		h.add_child(_dato(I18n.num_signo(int(v)), px, col))
	return h




static func compositor_ancho(ancho: float) -> float:
	return maxf(floorf((ancho - COL_SEP) / COMPOSITOR_PARTE), COMPOSITOR_MIN)












static func compositor(host: Node, ancho: float, vertical: bool) -> PanelContainer:
	var mencion: Dictionary = mencion_viva()
	var pique: bool = String(mencion.get("hecho", "")) == "pique"
	var placa: PanelContainer = PanelContainer.new()
	placa.name = "Compositor"
	placa.set_meta("redes_modo", "pique" if pique else "zasca")
	placa.custom_minimum_size.x = ancho
	placa.size_flags_vertical = Control.SIZE_SHRINK_BEGIN if vertical else Control.SIZE_EXPAND_FILL
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, RADIO, LABIO)
	_relleno(sb, 24, 24, 20, 20)
	placa.add_theme_stylebox_override("panel", sb)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 16)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(v)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.custom_minimum_size.y = 48.0
	cab.add_theme_constant_override("separation", 16)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(cab)
	cab.add_child(_medalla(CareerTheme.T_CAP_TUMBADO))
	var t: VBoxContainer = VBoxContainer.new()
	t.alignment = BoxContainer.ALIGNMENT_CENTER
	t.add_theme_constant_override("separation", 4)
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(t)
	var pregunta: Label = _rotulo(CareerTheme.caps(I18n.t("¿ENTRAS AL TRAPO?" if pique
		else "¿CONTESTAS?")), CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
	pregunta.name = "Pregunta"
	t.add_child(pregunta)
	var a_quien: HBoxContainer = HBoxContainer.new()
	a_quien.add_theme_constant_override("separation", 12)
	a_quien.mouse_filter = Control.MOUSE_FILTER_IGNORE
	t.add_child(a_quien)
	a_quien.add_child(_rotulo(CareerTheme.caps(I18n.t("RESPONDIENDO A")), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM))
	var a_quien_l: Label = _dato(arroba_pique(mencion) if pique
		else CareerTheme.caps(I18n.t(String(ARROBA_VOZ[MuroRedes.PRENSA]))),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_MARCA_INK, NOMBRE_MAX)
	a_quien_l.name = "AQuien"
	a_quien.add_child(a_quien_l)
	var momento: Dictionary = WeekEvents.moment_by_id("momento_pique" if pique else "momento_zasca")
	var borradores: Array = BORRADORES_PIQUE.duplicate(true) if pique else BORRADORES
	if pique and pique_final(mencion):
		borradores[1][2] = CONTESTA_FINAL



	var letras: int = 0
	for d in borradores:
		letras = maxi(letras, CareerTheme.caps(I18n.t(String(d[1]))).length())
	var px: int = CareerTheme.T_LEE_TUMBADO
	if float(letras * px) + 48.0 > BORRADOR_BTN_MAX:
		px = CareerTheme.T_CAP_TUMBADO
	var btn_w: float = clampf(float(letras * px) + 48.0, BORRADOR_BTN_MIN, BORRADOR_BTN_MAX)

	var globo_w: float = ancho - 48.0 - btn_w - 14.0 - 32.0 - 4.0



	var primero: bool = true
	for d in borradores:
		var k: String = String(d[0])
		if not momento.has(k):
			continue
		var fb: HBoxContainer = _borrador(host, k, String(d[1]), String(d[2]), momento[k], btn_w, px,
			globo_w, pique)
		if primero:
			(fb.find_child("Contesta", false, false) as Control).set_meta(Entrada.PRIMERO_META, true)
			primero = false
		v.add_child(fb)
	if not vertical:
		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(hueco)
	v.add_child(_se_cobra(pique and not bool(GameState.current_fixture().get("home", true))))
	return placa








static func _borrador(host: Node, k: String, rotulo: String, texto: String, salida: Dictionary,
		btn_w: float, px: int, globo_w: float, pique: bool = false) -> HBoxContainer:
	var fila_b: HBoxContainer = HBoxContainer.new()
	fila_b.name = "Borrador_" + k
	fila_b.custom_minimum_size.y = BORRADOR_H
	fila_b.add_theme_constant_override("separation", 14)
	fila_b.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var b: Button = Button.new()
	b.name = "Contesta"
	b.set_meta("redes_contesta", k)
	b.text = CareerTheme.caps(I18n.t(rotulo))
	b.custom_minimum_size = Vector2(btn_w, BORRADOR_H)
	b.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	b.clip_text = true
	CareerTheme.apply_button_accent(b, _color_salida(k, pique), px)


	for estado in ["normal", "pressed"]:
		(b.get_theme_stylebox(estado) as StyleBoxFlat).set_corner_radius_all(BORRADOR_RADIO)
	b.pressed.connect(func() -> void:
		var r: String = Career.pique_responde(k) if pique else Career.zasca_responde(k)
		if not r.is_empty():
			host.call("_toast", r, CareerTheme.TEXT)
		host.call("_refresh"))
	fila_b.add_child(b)
	var globo: PanelContainer = PanelContainer.new()
	globo.name = "Globo"
	globo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	globo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_SOFT, 20, 0)

	sb.corner_radius_top_left = 6
	_relleno(sb, 16, 16, 10, 10)
	globo.add_theme_stylebox_override("panel", sb)
	fila_b.add_child(globo)
	var pila: VBoxContainer = VBoxContainer.new()
	pila.alignment = BoxContainer.ALIGNMENT_CENTER
	pila.add_theme_constant_override("separation", 8)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	globo.add_child(pila)
	var frase: String = I18n.t(texto)
	var etiqueta: String = ""
	var corte: int = frase.rfind(" #")
	var linea: HBoxContainer = HBoxContainer.new()
	linea.add_theme_constant_override("separation", 16)
	linea.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fx: Dictionary = salida.get("fx", {})
	var apuesta_w: float = 0.0
	if fx.has("rel"):
		linea.add_child(apuesta(fx["rel"], CareerTheme.T_LEE_TUMBADO, 24, 24.0))
	elif pique:
		linea.add_child(_apuesta_pique())
	else:
		linea.add_child(_apuesta_zasca())
	for c in linea.get_child(0).get_children():
		apuesta_w +=(c as Control).get_combined_minimum_size().x + 12.0
	if corte > 0 and apuesta_w + 16.0 + float((frase.length() - corte - 1) * CareerTheme.T_CAP_TUMBADO) \
			<= globo_w:
		etiqueta = CareerTheme.caps(frase.substr(corte + 1))
		frase = frase.left(corte)




	var dice: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
	dice.name = "Borrador"
	dice.text = frase
	dice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dice.max_lines_visible = 3
	dice.custom_minimum_size.x = 1.0
	dice.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(dice)
	pila.add_child(linea)
	if not etiqueta.is_empty():
		var tag: Label = _rotulo(etiqueta, CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_MARCA_INK)
		tag.name = "Hashtag"
		linea.add_child(tag)
	return fila_b






static func _color_salida(k: String, pique: bool = false) -> Color:
	if pique:
		return UiKit.BTN_BLUE["bg"] as Color if k == "a" else CareerTheme.DANGER
	match k:
		"a":
			return UiKit.BTN_BLUE["bg"] as Color
		"b":
			return CareerTheme.accent()
	return CareerTheme.DANGER







static func _apuesta_zasca() -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Apuesta"
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var alto: Dictionary = RuedaPrensa.zasca_cobro(RuedaPrensa.ZASCA_ALTA, 90)
	var bajo: Dictionary = RuedaPrensa.zasca_cobro(0.0, 90)
	var claves: Array = alto.keys()
	for k in bajo:
		if not claves.has(k):
			claves.append(k)
	for k in claves:
		var va: int = int(alto.get(k, 0.0))
		var vb: int = int(bajo.get(k, 0.0))
		var icono: String = String(ICONO_REL.get(String(k), "prensa"))
		if va != 0 and vb != 0:
			h.add_child(_icono(icono, CareerTheme.REDES_INK, 24.0))
			h.add_child(_dato("±" + I18n.num(maxi(absi(va), absi(vb))), CareerTheme.T_LEE_TUMBADO,
				CareerTheme.REDES_INK))
			continue
		var v: int = va if va != 0 else vb
		if v == 0:
			continue
		var col: Color = CareerTheme.REDES_GOOD_INK if v > 0 else CareerTheme.REDES_BAD_INK
		h.add_child(_icono(icono, col, 24.0))
		h.add_child(_dato(I18n.num_signo(v), CareerTheme.T_LEE_TUMBADO, col))
	var escala: HBoxContainer = HBoxContainer.new()
	escala.name = "Escala"
	escala.add_theme_constant_override("separation", 0)
	escala.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	escala.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(escala)
	var tramos: Array = [
		[RuedaPrensa.ZASCA_BAJA, CareerTheme.REDES_BAD_INK],
		[RuedaPrensa.ZASCA_ALTA - RuedaPrensa.ZASCA_BAJA, CareerTheme.REDES_LINE],
		[10.0 - RuedaPrensa.ZASCA_ALTA, CareerTheme.REDES_GOOD_INK],
	]
	for t in tramos:
		var r: ColorRect = ColorRect.new()
		r.color = t[1]
		r.custom_minimum_size = Vector2(roundf(float(t[0]) * 10.0), 10.0)
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		escala.add_child(r)
	return h





static func _apuesta_pique() -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Apuesta"
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var gana: int = int(Career.SPICY_WIN_REL)
	var pierde: int = int(Career.SPICY_LOSE_REL)
	h.add_child(_icono(String(ICONO_REL["aficion"]), CareerTheme.REDES_INK, 24.0))
	var mas: Label = _dato(I18n.num_signo(gana), CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_GOOD_INK)
	mas.name = "Gana"
	h.add_child(mas)
	var barra: HBoxContainer = HBoxContainer.new()
	barra.name = "Escala"
	barra.add_theme_constant_override("separation", 0)
	barra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(barra)
	for t in [[absi(gana), CareerTheme.REDES_GOOD_INK], [absi(pierde), CareerTheme.REDES_BAD_INK]]:
		var r: ColorRect = ColorRect.new()
		r.color = t[1]
		r.custom_minimum_size = Vector2(float(t[0]) * PIQUE_BARRA_PX, 10.0)
		r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		barra.add_child(r)
	var menos: Label = _dato(I18n.num_signo(pierde), CareerTheme.T_LEE_TUMBADO,
		CareerTheme.REDES_BAD_INK)
	menos.name = "Pierde"
	h.add_child(menos)
	return h





static func _se_cobra(de_visita: bool = false) -> PanelContainer:
	var pie: PanelContainer = PanelContainer.new()
	pie.name = "Pie"
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_SOFT, 16, 0)
	_relleno(sb, 16, 16, 8, 8)
	pie.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "SeCobra"
	h.custom_minimum_size.y = 40.0
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pie.add_child(h)
	h.add_child(_rotulo(CareerTheme.caps(I18n.t("SE COBRA")), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM))
	var j: String = Celular.jornada_hoy()
	if not j.is_empty():
		h.add_child(_icono("jornada", CareerTheme.REDES_DIM, 24.0))
		h.add_child(_dato(j, CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK))
	var slot: Dictionary = GameState.current_fixture()
	var rival: Dictionary = {} if slot.is_empty() else GameState.rival_of(slot)
	if rival.is_empty():
		return pie


	var casa: bool = bool(slot.get("home", true))



	var nom_t: String = CareerTheme.caps(Nations.team_label(rival, "?"))
	h.add_child(_escudo(GameState.you_team() if casa else rival, 40.0))
	if not casa:
		var nom_f: Label = _dato(nom_t, CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_INK, 240.0)
		nom_f.name = "Rival"
		h.add_child(nom_f)
	h.add_child(_rotulo(CareerTheme.caps(I18n.t("VS")), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM))
	h.add_child(_escudo(rival if casa else GameState.you_team(), 40.0))
	if casa:
		var nom: Label = CareerUi.plain(CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_INK)
		nom.name = "Rival"
		nom.text = nom_t
		nom.clip_text = true
		nom.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		nom.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		nom.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(nom)
	else:
		var hueco: Control = Control.new()
		hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(hueco)
	if de_visita:
		var fuera: PanelContainer = _pildora(CareerTheme.caps(I18n.t("DE VISITA")),
			CareerTheme.REDES_BAD_BG, CareerTheme.REDES_BAD_INK, null)
		fuera.name = "DeVisita"
		h.add_child(fuera)
	return pie


static func _escudo(equipo: Dictionary, lado: float) -> CrestView:
	var esc: CrestView = CrestView.new()
	esc.custom_minimum_size = Vector2(lado, lado)
	esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	esc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	esc.set_team(equipo)
	return esc






static func _columna(host: Node, filas: Array, ancho: float, vertical: bool) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "TiraRedes"
	col.custom_minimum_size.x = ancho
	col.add_theme_constant_override("separation", FILA_SEP_V if vertical else FILA_SEP)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.set_meta("fl_lista", "redes")
	for i in range(1, mini(filas.size(), FILAS)):
		var b: Button = fila(host, filas[i], ancho, i, vertical)
		if i == 1:
			b.set_meta(Entrada.PRIMERO_META, true)
		col.add_child(b)
		CareerUi.entrada_escalonada(b)
	if filas.size() > FILAS:
		col.add_child(_mas(host, filas.size(), vertical))
	return col





static func fila(host: Node, f: Dictionary, ancho: float, i: int, _vertical: bool) -> Button:
	var autor: String = String(f.get("autor", ""))
	var tono: String = MuroRedes.tono(f)
	var yo: bool = autor == MuroRedes.YO
	var b: Button = Button.new()
	b.name = "RedesFila%d" % i
	b.set_meta("redes_compacta", i)
	b.set_meta("fl_fila", true)
	b.custom_minimum_size = Vector2(0.0, FILA_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.clip_text = true
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_LEE_TUMBADO)
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, RADIO_FILA, LABIO)
	if yo:
		sb.border_color = CareerTheme.REDES_MARCA
		sb.border_width_left = 2
		sb.border_width_top = 2
		sb.border_width_right = 2
		sb.set_content_margin_all(0.0)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	b.add_theme_stylebox_override("focus", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.REDES_SOFT
	b.add_theme_stylebox_override("pressed", hundida)
	b.add_theme_stylebox_override("hover_pressed", hundida)
	if yo:
		b.set_meta("fl_tuya", true)
	b.pressed.connect(func() -> void: lee(host, f))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 20, 0)
	relleno.offset_bottom = 0.0
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_avatar(f, autor, AVATAR_FILA))
	var v: VBoxContainer = VBoxContainer.new()
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 10)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(v)
	var meta: HBoxContainer = HBoxContainer.new()
	meta.add_theme_constant_override("separation", 16)
	meta.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(meta)
	var nombre: Label = _dato(CareerTheme.caps(_nombre(autor, f)), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_MARCA_INK if yo else CareerTheme.REDES_INK, NOMBRE_MAX)
	nombre.name = "Quien"
	meta.add_child(nombre)
	var cifra_t: String = I18n.num(Career.muro_reacciones(f))



	var miniatura: Texture2D = SelfieFotos.carga(String(f.get("foto", ""))) \
			if autor == MuroRedes.FAN else null
	var w_mini: float = FOTO_MINI.x + 16.0 if miniatura != null else 0.0
	var resto: float = ancho - 40.0 - AVATAR_FILA - 16.0 - 4.0 - w_mini - nombre.custom_minimum_size.x \
			- 16.0 * 3.0 - 16.0 - float(cifra_t.length() * CareerTheme.T_CAP_TUMBADO)
	var a: String = CareerTheme.caps(_arroba(f, autor))
	var j: String = jornada(f)
	var cuenta: String = a if j.is_empty() else "%s · %s" % [a, CareerTheme.caps(j)]
	if float(cuenta.length() * CareerTheme.T_CAP_TUMBADO) > resto:
		cuenta = a
	var rol: Label = _dato(cuenta, CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM, maxf(resto, 0.0))
	rol.name = "Rol"
	meta.add_child(rol)
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	meta.add_child(hueco)
	meta.add_child(MuroIcon.nuevo(tono, 16.0))
	var cifra: Label = _dato(cifra_t, CareerTheme.T_CAP_TUMBADO, tinta_tono(tono))
	cifra.name = "Cifra"
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	meta.add_child(cifra)

	var w: float = ancho - 40.0 - AVATAR_FILA - 16.0 - 4.0 - w_mini

	var cabeza: String = _cabeza_de(f)
	var texto: String = Career.muro_texto(f)
	var lineas: PackedStringArray = host.call("_wnews_renglones",
		texto if cabeza.is_empty() else "%s %s" % [cabeza, texto], CareerTheme.T_LEE_TUMBADO, w)
	for k in mini(lineas.size(), 2):
		v.add_child(_renglon(lineas[k], cabeza if k == 0 else "", CareerTheme.T_LEE_TUMBADO))
	if miniatura != null:
		var m: PanelContainer = _foto_selfie(miniatura, FOTO_MINI, FOTO_MINI_RADIO, false)
		m.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		h.add_child(m)
	return b




static func _mas(host: Node, total: int, vertical: bool) -> Button:
	var b: Button = Button.new()
	b.name = "RedesMas"
	b.set_meta("redes_mas", total)
	b.custom_minimum_size = Vector2(0.0, MAS_H)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DATO_TUMBADO)
	var sb: StyleBoxFlat = _caja(CareerTheme.REDES_CARD, RADIO_FILA, LABIO)
	b.add_theme_stylebox_override("normal", sb)
	b.add_theme_stylebox_override("hover", sb)
	b.add_theme_stylebox_override("focus", sb)
	var hundida: StyleBoxFlat = sb.duplicate()
	hundida.bg_color = CareerTheme.REDES_SOFT
	b.add_theme_stylebox_override("pressed", hundida)
	b.add_theme_stylebox_override("hover_pressed", hundida)
	b.pressed.connect(func() -> void:
		if vertical:
			host.set_meta("redes_todas", true)
			host.call("_refresh")
		else:
			archivo(host))
	var relleno: MarginContainer = CareerUi._relleno_boton(b, 24, 0)
	relleno.offset_bottom = 0.0
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 24)
	h.alignment = BoxContainer.ALIGNMENT_CENTER
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	relleno.add_child(h)
	h.add_child(_icono("menu", CareerTheme.REDES_INK, 32.0))
	for par in [[CareerTheme.caps(I18n.t("MÁS")), CareerTheme.REDES_INK],
			["·", CareerTheme.REDES_DIM], [I18n.num(total), CareerTheme.REDES_INK]]:
		h.add_child(_rotulo(String(par[0]), CareerTheme.T_DATO_TUMBADO, par[1]))
	return b



static func columna_entera(host: Node, filas: Array, ancho: float) -> VBoxContainer:
	var col: VBoxContainer = VBoxContainer.new()
	col.name = "TiraRedes"
	col.add_theme_constant_override("separation", FILA_SEP_V)
	col.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.set_meta("fl_lista", "redes")

	for i in range(1, filas.size()):
		var b: Button = fila(host, filas[i], ancho, i, true)
		if i == 1:
			b.set_meta(Entrada.PRIMERO_META, true)
		col.add_child(b)
	return col







static func lee(host: Node, f: Dictionary) -> void:
	if not UiKit.es_horizontal():
		var tarjeta: VBoxContainer = CareerUi.modal(host)
		if tarjeta == null:
			return
		tarjeta.set_meta("redes_lectura", true)
		tarjeta.add_child(portada(host, f, CareerUi.MODAL_HALF_W * 2.0 - 64.0, true, true))
		var cerrar: Button = Button.new()
		cerrar.text = I18n.t("CERRAR")
		cerrar.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		CareerTheme.apply_button(cerrar, CareerTheme.Kind.NEUTRAL, CareerTheme.BTN_ROW_FONT)
		cerrar.pressed.connect(func() -> void: CareerUi.close_modal(tarjeta))
		tarjeta.add_child(cerrar)
		return
	var box: VBoxContainer = CareerUi.modal_pantalla(host, false)
	if box == null:
		return
	box.set_meta("redes_lectura", true)
	CareerUi.margen_modal_tumbada(box)
	box.add_child(_cabeza_modal(host, box))
	var caja: Vector2 = host.call("_wnews_modal_caja", box)
	var p: PanelContainer = portada(host, f, caja.x, false, true)
	box.add_child(p)
	CareerUi.modal_opaca(box)





static func archivo(host: Node) -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(host)
	if box == null:
		return
	box.set_meta("redes_archivo", true)
	CareerUi.margen_modal_tumbada(box)
	box.add_child(_cabeza_modal(host, box))
	var ts: Array = []
	var por_t: Dictionary = {}
	for f in Career.muro_redes:
		var t: int = int((f as Dictionary).get("season", 0))
		if not por_t.has(t):
			if ts.size() >= 3:
				continue
			ts.append(t)
			por_t[t] = []
		(por_t[t] as Array).append(f)
	var cols: HBoxContainer = HBoxContainer.new()
	cols.add_theme_constant_override("separation", int(COL_SEP))
	cols.size_flags_vertical = Control.SIZE_EXPAND_FILL
	box.add_child(cols)
	var caja: Vector2 = host.call("_wnews_modal_caja", box)
	var sep_box: float = float(box.get_theme_constant("separation"))

	var alto: float = caja.y - CareerTheme.TOQUE_TUMBADO - sep_box \
			- float(CareerTheme.T_LEE_TUMBADO) - 8.0
	var n: int = maxi(ts.size(), 1)
	var ancho_col: float = minf((caja.x - COL_SEP * float(n - 1)) / float(n), TIRA_W)
	for t in ts:
		cols.add_child(_archivo_columna(host, int(t), por_t[t], alto, ancho_col))
	CareerUi.modal_opaca(box)



static func _archivo_columna(host: Node, t: int, filas: Array, alto: float,
		ancho: float) -> VBoxContainer:
	var c: VBoxContainer = VBoxContainer.new()
	c.add_theme_constant_override("separation", 8)
	c.custom_minimum_size.x = ancho
	c.set_meta("redes_temporada", t)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 16)
	c.add_child(cab)
	var l: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT_DIM)
	l.text = CareerTheme.caps(I18n.tf("TEMPORADA {0}", [t + 1]))
	l.clip_text = true
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cab.add_child(l)
	var num: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.TEXT)
	num.text = I18n.num(filas.size())
	num.clip_text = true
	num.custom_minimum_size.x = float(num.text.length() * CareerTheme.T_LEE_TUMBADO)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	cab.add_child(num)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", FILA_SEP)
	v.size_flags_vertical = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.set_meta("fl_lista", "redes_temporada_%d" % t)
	c.add_child(v)

	var paso: float = FILA_H + float(FILA_SEP)
	var idx: Array = CareerUi.ventana_foco(filas.size(), -1, 3, alto + float(FILA_SEP), paso)
	CareerUi.ventana_pinta(v, idx, func(k: int) -> Control:
		return fila(host, filas[k], ancho, k, false),
		Callable())
	return c



static func _cabeza_modal(host: Node, box: VBoxContainer) -> HBoxContainer:
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", 32)
	var tit: Label = CareerUi.plain(CareerTheme.T_DATO_TUMBADO, CareerTheme.NAV_MUNDO)
	tit.text = CareerTheme.caps("%s · %s" % [I18n.t("NOTICIAS"), I18n.t("TUS REDES")])
	tit.clip_text = true
	tit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	tit.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	cab.add_child(tit)
	cab.add_child(host.call("_wnews_boton_cerrar", box))
	return cab





static func cuando(f: Dictionary) -> String:
	var t: String = I18n.tf("T{0}", [int(f.get("season", 0)) + 1])
	var j: String = jornada(f)
	return t if j.is_empty() else "%s · %s" % [j, t]






static func jornada(f: Dictionary) -> String:
	var slot: Dictionary = _partido(f)
	if slot.is_empty():
		return ""
	if String(slot.get("comp", "")) == "league" and slot.has("round_idx") \
			and Competitions.torneo_key(slot).is_empty():
		return I18n.tf("J{0}", [int(slot["round_idx"]) + 1])
	return ""








static func renglones(host: Node, texto: String, peldanos: Array, ancho: float,
		sep: int, cabeza: String = "") -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Renglones"
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", sep)
	v.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var px: int = CareerTheme.T_LEE_TUMBADO
	var tope: int = 4
	var lineas: PackedStringArray = PackedStringArray()
	var entero: String = texto if cabeza.is_empty() else "%s %s" % [cabeza, texto]
	for p in peldanos:
		px = int(p[0])
		tope = int(p[1])
		lineas = host.call("_wnews_renglones", entero, px, ancho)
		if lineas.size() <= tope:
			break
	for k in mini(lineas.size(), tope):
		v.add_child(_renglon(lineas[k], cabeza if k == 0 else "", px))
	return v





static func _renglon(linea: String, cabeza: String, px: int) -> Control:
	if cabeza.is_empty() or not linea.begins_with(cabeza):
		var l: Label = CareerUi.plain(px, CareerTheme.REDES_INK)
		l.text = linea
		l.clip_text = true
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		return l
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "ConCabeza"

	h.add_theme_constant_override("separation", int(px * 0.5))
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE

	var a: Label = _dato(cabeza, px, CareerTheme.REDES_MARCA_INK, NOMBRE_MAX)
	a.name = "Cabeza"
	h.add_child(a)
	var resto: String = linea.substr(cabeza.length()).strip_edges()
	if not resto.is_empty():
		var l: Label = CareerUi.plain(px, CareerTheme.REDES_INK)
		l.name = "Resto"
		l.text = resto
		l.clip_text = true
		l.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		l.mouse_filter = Control.MOUSE_FILTER_IGNORE
		h.add_child(l)
	return h




static func _cabeza_de(f: Dictionary) -> String:
	return _tu_arroba() if String(f.get("autor", "")) == MuroRedes.JUGADOR else ""





static func _avatar(f: Dictionary, autor: String, lado: float) -> PanelContainer:
	var c: PanelContainer = PanelContainer.new()
	c.name = "Plato"
	c.custom_minimum_size = Vector2(lado, lado)
	c.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	c.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	c.mouse_filter = Control.MOUSE_FILTER_IGNORE
	c.add_theme_stylebox_override("panel", _caja(color_voz(autor), ceili(lado * 0.5), 0))
	if autor == MuroRedes.YO:
		c.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW




		var marco: Control = Control.new()
		marco.custom_minimum_size = Vector2(lado, lado)
		marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(marco)
		var av: PlayerAvatar = PlayerAvatar.new()
		av.chrome = false
		av.bust = PlayerAvatar.BUST_CLOSE
		av.mouse_filter = Control.MOUSE_FILTER_IGNORE
		av.set_anchors_preset(Control.PRESET_FULL_RECT)
		av.offset_left = - lado * 0.35
		av.offset_right = lado * 0.35
		av.offset_top = - lado * 0.15
		av.offset_bottom = lado * 0.55
		av.set_look(GameState.player_look())
		marco.add_child(av)
	elif autor == MuroRedes.FAN and SelfieFotos.carga(String(f.get("foto", ""))) != null:


		c.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
		var tex: Texture2D = SelfieFotos.carga(String(f.get("foto", "")))
		var tam: Vector2 = tex.get_size()
		var cara: Array = f.get("cara", [0.5, 0.35]) if f.get("cara") is Array else [0.5, 0.35]
		var lado_px: float = tam.x * CARA_RECORTE
		var esquina: Vector2 =(Vector2(float(cara[0]), float(cara[1])) * tam
			- Vector2.ONE * lado_px * 0.5).clamp(Vector2.ZERO, tam - Vector2.ONE * lado_px)
		var recorte: AtlasTexture = AtlasTexture.new()
		recorte.atlas = tex
		recorte.region = Rect2(esquina.round(), Vector2.ONE * lado_px)
		var cara_r: TextureRect = TextureRect.new()
		cara_r.texture = recorte
		cara_r.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		cara_r.stretch_mode = TextureRect.STRETCH_SCALE
		cara_r.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		cara_r.custom_minimum_size = Vector2(lado, lado)
		cara_r.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(cara_r)
	elif autor == MuroRedes.RIVAL or autor == MuroRedes.JUGADOR:


		var esc: Control = _escudo_rival(f, lado * 0.66)
		esc.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		c.add_child(esc)
	else:


		var ic: MenuIcon = _icono(String(ICONO_VOZ.get(autor, "aficion")),
			CareerTheme.on_color(color_voz(autor)), lado * 0.55)
		ic.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		c.add_child(ic)
	return c



static func _foto_selfie(tex: Texture2D, tam: Vector2, radio: int, de_pie: bool) -> PanelContainer:
	var marco: PanelContainer = PanelContainer.new()
	marco.name = "FotoSelfie"
	marco.custom_minimum_size = tam
	marco.size_flags_horizontal = Control.SIZE_SHRINK_CENTER if de_pie else Control.SIZE_SHRINK_END
	marco.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_theme_stylebox_override("panel", _caja(CareerTheme.BG_DEEP, radio, 0))
	marco.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	var img: TextureRect = TextureRect.new()
	img.texture = tex
	img.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	img.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	img.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	img.mouse_filter = Control.MOUSE_FILTER_IGNORE
	marco.add_child(img)
	return marco




static func color_voz(autor: String) -> Color:
	match autor:
		MuroRedes.PRENSA:
			return CareerTheme.VOZ_PRENSA
		MuroRedes.HINCHA:
			return CareerTheme.NAV_GENTE
		MuroRedes.COMPANERO:
			return CareerTheme.NAV_PLANTILLA
		MuroRedes.RIVAL, MuroRedes.JUGADOR:
			return CareerTheme.VOZ_RIVAL
		MuroRedes.MARCA:
			return CareerTheme.MONEY
	return CareerTheme.REDES_MARCA_SOFT




static func _aro(dentro: Control, col: Color, hueco: Color, grosor: int, aire: int) -> PanelContainer:
	var fuera: PanelContainer = PanelContainer.new()
	fuera.name = "Aro"
	fuera.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fuera.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var lado: float = dentro.custom_minimum_size.x + 2.0 * float(grosor + aire)
	var sf: StyleBoxFlat = _caja(col, ceili(lado * 0.5), 0)
	sf.set_content_margin_all(float(grosor))
	fuera.add_theme_stylebox_override("panel", sf)
	var medio: PanelContainer = PanelContainer.new()
	medio.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sm: StyleBoxFlat = _caja(hueco, ceili(lado * 0.5) - grosor, 0)
	sm.set_content_margin_all(float(aire))
	medio.add_theme_stylebox_override("panel", sm)
	fuera.add_child(medio)
	medio.add_child(dentro)
	return fuera




static func _escudo_rival(f: Dictionary, lado: float) -> Control:
	var slot: Dictionary = _partido(f)
	if not slot.is_empty():
		var rival: Dictionary = GameState.rival_of(slot)
		if not rival.is_empty():
			return _escudo(rival, lado)
	return _icono("aficion", CareerTheme.CELULAR_TINTA, lado)




static func _nota(nota: float) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = "Nota"
	v.alignment = BoxContainer.ALIGNMENT_CENTER
	v.add_theme_constant_override("separation", 4)
	v.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var rot: Label = _rotulo(CareerTheme.caps(I18n.t("NOTA")), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM)
	rot.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.add_child(rot)
	var col: Color = CareerTheme.REDES_INK
	if nota < 6.0:
		col = CareerTheme.REDES_BAD_INK
	elif nota >= 7.0:
		col = CareerTheme.REDES_GOOD_INK
	var cifra: Label = _dato(I18n.num(nota, 1), CareerTheme.T_LEE_TUMBADO, col)
	cifra.name = "Cifra"
	cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	v.add_child(cifra)
	return v




static func _pildora(texto: String, fondo: Color, tinta: Color, icono: Control) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Etiqueta"
	pc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = _caja(fondo, 99, 0)
	_relleno(sb, 16, 16, 8, 8)
	pc.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 8)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pc.add_child(h)
	if icono != null:
		h.add_child(icono)
	h.add_child(_rotulo(texto, CareerTheme.T_CAP_TUMBADO, tinta))
	return pc



static func _raya(alto: float) -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = CareerTheme.REDES_LINE
	r.custom_minimum_size = Vector2(2.0, alto)
	r.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return r


static func _icono(tipo: String, col: Color, lado: float) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.setup(tipo, col)
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return ic



static func _rotulo(texto: String, px: int, col: Color) -> Label:
	var l: Label = CareerUi.plain(px, col)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l






static func _dato(texto: String, px: int, col: Color, tope: float = INF) -> Label:
	var l: Label = _rotulo(texto, px, col)
	l.clip_text = true
	var w: float = float(texto.length() * px)
	var fuente: Font = l.get_theme_font("font")
	if fuente != null:
		w = maxf(w, ceilf(fuente.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x))
	l.custom_minimum_size.x = minf(w, tope)
	return l


static func _margen(izq: int, der: int, arriba: int, abajo: int) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_theme_constant_override("margin_left", izq)
	m.add_theme_constant_override("margin_right", der)
	m.add_theme_constant_override("margin_top", arriba)
	m.add_theme_constant_override("margin_bottom", abajo)
	return m





static func _caja(fondo: Color, radio: int, labio: int) -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = fondo
	sb.set_corner_radius_all(radio)
	sb.set_content_margin_all(0.0)
	if labio > 0:
		sb.border_color = CareerTheme.REDES_SOMBRA
		sb.border_width_bottom = labio
		sb.expand_margin_bottom = float(labio)
	return sb


static func _relleno(sb: StyleBoxFlat, izq: int, der: int, arriba: int, abajo: int) -> void:
	sb.content_margin_left = izq
	sb.content_margin_right = der
	sb.content_margin_top = arriba
	sb.content_margin_bottom = abajo
