class_name EncuestaTira
extends RefCounted


















const FILA_H_T: float = 66.0
const FILA_H_V: float = 76.0
const FILA_SEP: int = 12
const FILA_RADIO: int = 16
const CANTO: int = 3

const MINI_T: float = 48.0
const MINI_V: float = 56.0

const BOTON_T: Vector2 = Vector2(250.0, 104.0)
const BOTON_V: Vector2 = Vector2(300.0, 112.0)
const BOTON_RADIO: int = 20




static func es_suyo(f: Dictionary) -> bool:
	var hecho: String = String(f.get("hecho", ""))
	return (hecho == "pena_encuesta" or hecho == "pena_cumplida") \
			and not Celebs.by_id(String(f.get("celeb", ""))).is_empty()




static func pregunta() -> String:
	return I18n.t("¿Con qué festejo nos celebras el próximo gol en casa?")





static func encuesta_de(f: Dictionary) -> Dictionary:
	var enc: Dictionary = Career.encuesta_pena
	if String(f.get("hecho", "")) != "pena_encuesta" or enc.is_empty() \
			or String(enc.get("ganadora", "")) != String(f.get("celeb", "")) \
			or (enc.get("opciones", []) as Array).size() != EncuestaPena.MIN:
		return {}
	return enc




static func semilla(enc: Dictionary) -> int:
	return EncuestaPena.semilla(int(enc.get("temporada", 0)), int(enc.get("clave", 0)),
		String(enc.get("club", "")))




static func media(f: Dictionary, vertical: bool) -> Control:
	var enc: Dictionary = encuesta_de(f)
	if enc.is_empty():
		var sola: VBoxContainer = _pila("Votacion")
		sola.add_child(fila(String(f.get("celeb", "")), -1, true, vertical))
		return sola
	return votacion(enc, vertical)




static func votacion(enc: Dictionary, vertical: bool) -> VBoxContainer:
	var v: VBoxContainer = _pila("Votacion")
	var ops: Array = enc.get("opciones", []) as Array
	var gana: String = String(enc.get("ganadora", ""))
	var pct: Array = EncuestaPena.reparto(semilla(enc), ops.find(gana))



	var orden: Array = range(ops.size())
	orden.sort_custom(func(a: int, b: int) -> bool: return int(pct[a]) > int(pct[b]))
	for i in orden:
		v.add_child(fila(String(ops[i]), int(pct[i]), String(ops[i]) == gana, vertical))
	return v


static func _pila(nombre: String) -> VBoxContainer:
	var v: VBoxContainer = VBoxContainer.new()
	v.name = nombre
	v.add_theme_constant_override("separation", FILA_SEP)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return v





static func fila(id: String, pct: int, gana: bool, vertical: bool) -> PanelContainer:
	var pc: PanelContainer = PanelContainer.new()
	pc.name = "Opcion"
	pc.set_meta("encuesta_opcion", id)
	pc.set_meta("encuesta_gana", gana)
	pc.custom_minimum_size.y = FILA_H_V if vertical else FILA_H_T
	pc.mouse_filter = Control.MOUSE_FILTER_IGNORE

	pc.clip_children = CanvasItem.CLIP_CHILDREN_AND_DRAW
	pc.add_theme_stylebox_override("panel", RedesTira._caja(CareerTheme.REDES_SOFT, FILA_RADIO, 0))
	var barra: Control = Control.new()
	barra.name = "Barra"
	barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var parte: float = 1.0 if pct < 0 else clampf(float(pct) / 100.0, 0.0, 1.0)
	var relleno: Color = CareerTheme.REDES_MARCA_SOFT if gana else CareerTheme.REDES_LINE
	barra.draw.connect(func() -> void:
		barra.draw_rect(Rect2(Vector2.ZERO, Vector2(barra.size.x * parte, barra.size.y)), relleno)

		if gana:
			var canto: StyleBoxFlat = StyleBoxFlat.new()
			canto.draw_center = false
			canto.border_color = CareerTheme.REDES_MARCA
			canto.set_border_width_all(CANTO)
			canto.set_corner_radius_all(FILA_RADIO)
			barra.draw_style_box(canto, Rect2(Vector2.ZERO, barra.size)))
	pc.add_child(barra)
	var m: MarginContainer = RedesTira._margen(14, 18, 0, 0)
	pc.add_child(m)
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 16)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	m.add_child(h)
	h.add_child(miniatura(id, MINI_V if vertical else MINI_T))
	var nombre: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
	nombre.name = "Nombre"
	nombre.text = nombre_de(id)
	nombre.clip_text = true
	nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nombre.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	nombre.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(nombre)
	if pct >= 0:
		var p: Label = RedesTira._dato("%d%%" % pct, CareerTheme.T_LEE_TUMBADO,
			CareerTheme.REDES_MARCA_INK if gana else CareerTheme.REDES_DIM)
		p.name = "Pct"
		h.add_child(p)
	if gana:
		var visto: PanelContainer = PanelContainer.new()
		visto.name = "Gana"
		visto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		visto.mouse_filter = Control.MOUSE_FILTER_IGNORE
		var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_MARCA, 99, 0)
		RedesTira._relleno(sb, 4, 4, 4, 4)
		visto.add_theme_stylebox_override("panel", sb)
		visto.add_child(RedesTira._icono("check", CareerTheme.REDES_CARD, 22.0))
		h.add_child(visto)
	return pc



static func nombre_de(id: String) -> String:
	return CareerTheme.caps(I18n.t(String(Celebs.by_id(id).get("name", ""))))





static func miniatura(id: String, lado: float) -> PanelContainer:
	var caja: PanelContainer = PanelContainer.new()
	caja.name = "Miniatura"
	caja.custom_minimum_size = Vector2(lado, lado)
	caja.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	caja.clip_contents = true
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_theme_stylebox_override("panel", RedesTira._caja(CareerTheme.REDES_CARD, 12, 0))
	var ruta: String = Celebs.thumb_path(id)
	if ResourceLoader.exists(ruta):
		var tr: TextureRect = TextureRect.new()
		tr.texture = load(ruta) as Texture2D
		tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		tr.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
		caja.add_child(tr)
	else:
		var c: CenterContainer = CenterContainer.new()
		c.mouse_filter = Control.MOUSE_FILTER_IGNORE
		c.add_child(RedesTira._icono("party", CareerTheme.REDES_MARCA_INK, lado * 0.6))
		caja.add_child(c)
	return caja



static func votos_pie(f: Dictionary) -> HBoxContainer:
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Votos"
	h.custom_minimum_size.y = 36.0
	h.add_theme_constant_override("separation", 12)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var enc: Dictionary = encuesta_de(f)
	var s: int = semilla(enc) if not enc.is_empty() else absi(int(f.get("semilla", 0)))
	h.add_child(RedesTira._icono("aficion", CareerTheme.REDES_DIM, 28.0))
	var l: Label = RedesTira._dato(CareerTheme.caps(I18n.tf("{0} VOTOS",
		[I18n.num(EncuestaPena.votos(s))])), CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_DIM)
	l.name = "Cifra"
	h.add_child(l)
	return h







static func placa(host: Node, ancho: float, vertical: bool) -> PanelContainer:
	var enc: Dictionary = Career.encuesta_pena
	var gana: String = String(enc.get("ganadora", ""))
	var p: PanelContainer = PanelContainer.new()
	p.name = "PenaPropone"
	p.set_meta("encuesta_placa", gana)
	p.custom_minimum_size.x = ancho
	p.size_flags_vertical = Control.SIZE_SHRINK_BEGIN if vertical else Control.SIZE_EXPAND_FILL
	p.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_CARD, RedesTira.RADIO, RedesTira.LABIO)
	RedesTira._relleno(sb, 24, 24, 22 if vertical else 20, 20)
	p.add_theme_stylebox_override("panel", sb)
	var v: VBoxContainer = VBoxContainer.new()
	v.add_theme_constant_override("separation", 18)
	v.mouse_filter = Control.MOUSE_FILTER_IGNORE
	p.add_child(v)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.name = "Cabecera"
	cab.custom_minimum_size.y = 56.0
	cab.add_theme_constant_override("separation", 16)
	cab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	v.add_child(cab)
	cab.add_child(RedesTira._medalla(CareerTheme.T_CAP_TUMBADO))
	var t: VBoxContainer = VBoxContainer.new()
	t.alignment = BoxContainer.ALIGNMENT_CENTER
	t.add_theme_constant_override("separation", 6)
	t.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	t.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cab.add_child(t)

	var tope: float = maxf(ancho - 48.0 - 140.0, 120.0)
	var tit: Label = RedesTira._dato(CareerTheme.caps(I18n.tf("Ganó {0}",
		[I18n.t(String(Celebs.by_id(gana).get("name", "")))])), CareerTheme.T_LEE_TUMBADO,
		CareerTheme.REDES_INK, tope)
	tit.name = "Gano"
	t.add_child(tit)
	var quien: Label = RedesTira._dato(CareerTheme.caps(I18n.tf("Lo votó {0}",
		[I18n.t(String(RedesTira.ARROBA_VOZ[MuroRedes.HINCHA]))])), CareerTheme.T_CAP_TUMBADO,
		CareerTheme.REDES_DIM, tope)
	quien.name = "Voto"
	t.add_child(quien)
	var llevar: HBoxContainer = _salida(host, "bombo", vertical)

	(llevar.find_child("Responde", false, false) as Control).set_meta(Entrada.PRIMERO_META, true)
	v.add_child(llevar)
	v.add_child(_salida(host, "ignorar", vertical))
	if not vertical:
		var hueco: Control = Control.new()
		hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
		hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
		v.add_child(hueco)
	v.add_child(_proximo_pie())
	return p




static func _salida(host: Node, k: String, vertical: bool) -> HBoxContainer:
	var bombo: bool = k == "bombo"
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Salida_" + k
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var b: Button = Button.new()
	b.name = "Responde"
	b.set_meta("encuesta_responde", k)
	b.text = CareerTheme.caps(I18n.t("LLEVAR AL BOMBO" if bombo else "IGNORAR"))
	b.custom_minimum_size = BOTON_V if vertical else BOTON_T
	b.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	b.clip_text = true


	CareerTheme.apply_button_accent(b, color_boton(k),
		CareerTheme.T_BODY if vertical else CareerTheme.T_CAP_TUMBADO)
	for estado in ["normal", "pressed"]:
		(b.get_theme_stylebox(estado) as StyleBoxFlat).set_corner_radius_all(BOTON_RADIO)
	b.pressed.connect(func() -> void:
		if bombo:
			llevar(host)
		else:
			Career.encuesta_responde("ignorar")
			host.call("_refresh"))
	h.add_child(b)
	var g: PanelContainer = PanelContainer.new()
	g.name = "Globo"
	g.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	g.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_SOFT, BOTON_RADIO, 0)
	sb.corner_radius_top_left = 6
	RedesTira._relleno(sb, 16, 16, 14, 14)
	g.add_theme_stylebox_override("panel", sb)
	h.add_child(g)
	var pila: VBoxContainer = VBoxContainer.new()
	pila.alignment = BoxContainer.ALIGNMENT_CENTER
	pila.add_theme_constant_override("separation", 12)
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	g.add_child(pila)
	var dice: Label = CareerUi.plain(CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK)
	dice.name = "Dice"
	dice.text = I18n.t("Abre tu bombo de CELEBRACIONES." if bombo else "Tú celebras a tu manera.")
	dice.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dice.max_lines_visible = 2
	dice.custom_minimum_size.x = 1.0
	dice.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(dice)
	var linea: HBoxContainer = HBoxContainer.new()
	linea.name = "Apuesta_" + k
	linea.add_theme_constant_override("separation", 12)
	linea.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(linea)
	if bombo:
		linea.add_child(RedesTira.apuesta({"aficion": EncuestaPena.AFICION},
			CareerTheme.T_LEE_TUMBADO, 12, 24.0))
		linea.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.t("SI SALE EN CASA")),
			CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM))
	else:
		linea.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.t("NO CUESTA NADA")),
			CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM))
	return h





static func color_boton(k: String) -> Color:
	return CareerTheme.REDES_MARCA if k == "bombo" else UiKit.BTN_BLUE["bg"] as Color






static func llevar(host: Node) -> void:
	var gana: String = String(Career.encuesta_pena.get("ganadora", ""))
	if not Career.encuesta_responde("bombo"):
		host.call("_refresh")
		return
	Celebs.abre_en = gana
	Celebs.volver_a = "res://ui/career_page.tscn"
	GameState.career_page = "noticias"




	(load("res://ui/career_page.gd") as GDScript).set("abrir_redes", true)
	SceneFade.to_scene("res://ui/logros.tscn")




static func _proximo_pie() -> PanelContainer:
	var pie: PanelContainer = PanelContainer.new()
	pie.name = "Pie"
	pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = RedesTira._caja(CareerTheme.REDES_SOFT, 16, 0)
	RedesTira._relleno(sb, 16, 16, 10, 10)
	pie.add_theme_stylebox_override("panel", sb)
	var h: HBoxContainer = HBoxContainer.new()
	h.name = "Proximo"
	h.custom_minimum_size.y = 44.0
	h.add_theme_constant_override("separation", 14)
	h.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pie.add_child(h)
	h.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.t("Tu próximo gol en casa")),
		CareerTheme.T_CAP_TUMBADO, CareerTheme.REDES_DIM))
	var hueco: Control = Control.new()
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	h.add_child(hueco)
	var i: int = proximo_en_casa()
	if i < 0:
		return pie
	var slot: Dictionary = GameState.calendar[i]
	var rival: Dictionary = GameState.rival_of(slot)
	h.add_child(RedesTira._icono("local", CareerTheme.REDES_DIM, 24.0))
	var j: String = RedesTira.jornada({"partido": i, "season": GameState.season_num - 1,
		"club": GameState.player_team_id})
	if not j.is_empty():
		h.add_child(RedesTira._dato(j, CareerTheme.T_LEE_TUMBADO, CareerTheme.REDES_INK))
	h.add_child(RedesTira._escudo(GameState.you_team(), 40.0))
	if not rival.is_empty():
		h.add_child(RedesTira._rotulo(CareerTheme.caps(I18n.t("VS")), CareerTheme.T_CAP_TUMBADO,
			CareerTheme.REDES_DIM))
		h.add_child(RedesTira._escudo(rival, 40.0))
	return pie












static func proximo_en_casa() -> int:
	for i in range(maxi(GameState.season_day, 0), GameState.calendar.size()):
		var slot: Dictionary = GameState.calendar[i]
		if bool(slot.get("played", false)) or bool(slot.get("dead", false)) \
				or String(slot.get("comp", "")) == "nat" or not bool(slot.get("home", false)) \
				or bool(slot.get("neutral", false)) or Competitions.is_neutral(slot):
			continue
		return i
	return -1
