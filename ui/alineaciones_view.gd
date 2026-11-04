class_name AlineacionesView
extends RefCounted





















const HUB_TRAINING: GDScript = preload("res://ui/hub_training.gd")

const RETRATO: Vector2 = Vector2(69, 90)
const DORSAL_W: float = 44.0
const FILA_SEP: int = 16
const COL_SEP: int = 16











static func bandos() -> Array:
	if Career.free_agent or GameState.season_close_pending:
		return []
	var f: Dictionary = GameState.current_fixture()
	var rival: Dictionary = GameState.current_rival()
	if f.is_empty() or rival.is_empty():
		return []
	var mio: Dictionary = GameState.you_of(f)
	var nat: bool = String(mio.get("id", "")) != GameState.player_team_id
	if nat:




		Career.nat_match_team_id()
		Career.nat_rival_prepare()
	var yo: Dictionary = _bando_nat(mio) if nat else _bando_club(mio)
	var el: Dictionary = _bando_rival(rival, nat)
	if yo.is_empty() or el.is_empty():
		return []
	yo["nat"] = nat
	el["nat"] = nat
	for b in [yo, el]:
		b["banca"] = por_lineas(b["banca"])
	return [yo, el] if bool(f.get("home", true)) else [el, yo]














static func por_lineas(fichas: Array) -> Array:
	var orden: Array = range(fichas.size())
	orden.sort_custom(func(a: int, b: int) -> bool:
		var la: int = _rango_linea(String((fichas[a] as Dictionary).get("pos", "")))
		var lb: int = _rango_linea(String((fichas[b] as Dictionary).get("pos", "")))
		return la < lb if la != lb else a < b)
	var out: Array = []
	for i in orden:
		out.append(fichas[i])
	return out


const ORDEN_LINEA: Dictionary = {"POR": 0, "DEF": 1, "MED": 2, "DEL": 3}


static func _rango_linea(pos: String) -> int:
	return int(ORDEN_LINEA.get(Squad.line_pintada(pos), 2))










static func _bando_club(team: Dictionary) -> Dictionary:
	var id: String = GameState.player_team_id

	var squad: Array = Squad.of_nominal(id).duplicate()
	if squad.is_empty():
		return {}
	var jornada: Dictionary = Career.club_matchday()


	var slots: Array = Squad.formation_slots(id)
	Squad.aplica_urgencias(id, squad)
	var titulares: Array =(jornada.get("once", []) as Array).duplicate()
	var convocados: Array =(jornada.get("banca", []) as Array).duplicate()
	if titulares.is_empty():
		for k in mini(Squad.STARTING_XI, squad.size()):
			titulares.append(k)
	var yo_idx: int = squad.size()
	squad.append({"name": Career.player_name, "pos": Squad.USER_POS,
		"number": GameState.shirt_number_now()})
	var en_once: Dictionary = {}
	for i in titulares:
		en_once[int(i)] = true
	var en_banca: Dictionary = {}
	for i in convocados:
		en_banca[int(i)] = true



	var banca: Array = []
	for i in yo_idx:
		if not en_once.has(i) and en_banca.has(i):
			banca.append(i)



	var status: String = Standing.STATUS_FUERA if not Career.can_play() \
			else String(Career.standing().get("status", Standing.STATUS_BANCA))
	if status == Standing.STATUS_TITULAR:
		var once_por_hueco: Array = []
		for j in titulares.size():
			once_por_hueco.append({"pos": String(slots[j]) if j < slots.size() else ""})
		var hueco: int = Squad.user_index(once_por_hueco)
		if hueco < 0:
			hueco = titulares.size() - 1
		banca.push_front(int(titulares[hueco]))
		titulares[hueco] = yo_idx
	elif status == Standing.STATUS_BANCA:
		banca.push_front(yo_idx)
	if banca.size() > Squad.BENCH_SIZE:
		banca.resize(Squad.BENCH_SIZE)
	var once: Array = []
	for j in titulares.size():
		var hueco_pos: String = String(slots[j]) if j < slots.size() else ""
		once.append(_ficha(squad, int(titulares[j]), hueco_pos, yo_idx))
	var suplentes: Array = []
	for i in banca:
		suplentes.append(_ficha(squad, int(i), "", yo_idx))
	return {"team": team, "kit": GameState.player_kit_slot, "club": id, "once": once,
		"banca": suplentes}






static func _bando_nat(team: Dictionary) -> Dictionary:
	var id: String = Career.nat_match_team_id()
	var rows: Array = Squad.of(id)
	if rows.size() < Squad.STARTING_XI:
		return {}
	var yo_idx: int = -1
	for i in rows.size():
		if String((rows[i] as Dictionary).get("name", "")) == Career.player_name:
			yo_idx = i
			break
	var titulares: Array = range(Squad.STARTING_XI)
	var banca: Array = []
	for i in range(Squad.STARTING_XI, mini(rows.size(), Squad.STARTING_XI + Squad.BENCH_SIZE)):
		banca.append(i)
	var status: String = String(Career.nat_standing().get("status", ""))
	if yo_idx >= Squad.STARTING_XI + Squad.BENCH_SIZE and status != Standing.STATUS_FUERA:
		banca.push_front(yo_idx)
		banca.resize(mini(banca.size(), Squad.BENCH_SIZE))
	var once: Array = []
	for i in titulares:
		once.append(_ficha(rows, int(i), "", yo_idx))
	var suplentes: Array = []
	for i in banca:
		suplentes.append(_ficha(rows, int(i), "", yo_idx))
	return {"team": team, "kit": GameState.player_kit_slot, "club": id, "once": once,
		"banca": suplentes}










static func _bando_rival(team: Dictionary, nat: bool) -> Dictionary:
	var id: String = String(team.get("id", ""))
	if id.is_empty():
		return {}
	var rows: Array = HUB_TRAINING.once_con_bajas(id)
	var club: String = Nations.canon_id(id) if nat else id
	var slots: Array = []
	if not rows.is_empty():
		slots = Squad.slots_of(Squad.forma_con_bajas(id, Career.bajas_asientos(id)))
	else:
		rows = Squad.of(club)
		if not nat:
			slots = Squad.formation_slots(id)
	if rows.size() < Squad.STARTING_XI:
		return {}
	var once: Array = []
	for i in Squad.STARTING_XI:
		once.append(_ficha(rows, i, String(slots[i]) if i < slots.size() else "", -1))
	var banca: Array = []
	for i in range(Squad.STARTING_XI, mini(rows.size(), Squad.STARTING_XI + Squad.BENCH_SIZE)):
		banca.append(_ficha(rows, i, "", -1))
	return {"team": team, "kit": GameState.rival_kit_slot, "club": club, "once": once,
		"banca": banca}












static func _ficha(rows: Array, i: int, hueco: String, yo_idx: int) -> Dictionary:
	var r: Dictionary = rows[i] if i >= 0 and i < rows.size() else {}
	var ovr: int = 0
	if i == yo_idx:
		ovr = Career.ovr_shown()
	elif not r.is_empty():
		ovr = SquadMeta.ovr_of(r, String(r.get("pos", "MC")))
	return {
		"name": String(r.get("name", "")),
		"pos": hueco if not hueco.is_empty() else String(r.get("pos", "")),
		"number": int(r.get("number", 0)),
		"tu": i == yo_idx,
		"ovr": ovr,
		"fila": r,
	}






static func abrir(host: Node) -> Control:
	var datos: Array = bandos()
	if datos.size() < 2:
		return null
	var col: VBoxContainer = CareerUi.modal_pantalla(host)
	if col == null:
		return null
	col.name = "Alineaciones"
	var title: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	title.text = CareerTheme.caps(I18n.t("ALINEACIONES"))
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(title)




	var tabla: VBoxContainer = VBoxContainer.new()
	tabla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	tabla.add_theme_constant_override("separation", 0)
	col.add_child(tabla)
	var cab: HBoxContainer = HBoxContainer.new()
	cab.add_theme_constant_override("separation", COL_SEP)
	tabla.add_child(cab)
	for b in datos:
		cab.add_child(_cabecera(b as Dictionary))



	var scroll: ScrollContainer = DragScroll.new()
	scroll.name = "LineupsScroll"
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	tabla.add_child(scroll)
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cuerpo.add_theme_constant_override("separation", COL_SEP)
	scroll.add_child(cuerpo)
	for b in datos:
		cuerpo.add_child(_columna(b as Dictionary, host))

	CareerUi.back_button(col, func() -> void: CareerUi.close_modal(col))
	return col.get_parent() as Control












static func _colores(b: Dictionary) -> Dictionary:
	var team: Dictionary = b.get("team", {})
	var kv: Dictionary = GameState.kit_variant(team, int(b.get("kit", 0)))
	var tinte: Color = CareerTheme.accent_of(kv)
	var filo: Color = kv["kit2"] if kv.get("kit2") is Color else tinte
	return {"kit": kv, "filo": filo, "tinte": tinte,
		"tinta": CareerTheme.text_on_dark(tinte)}








static func _tela(panel: PanelContainer, kit: Dictionary, alfa_base: float,
		alfa_patron: float, teja: float = 0.0) -> void:
	var tela: KitPatch = KitPatch.new()
	tela.teja = teja
	tela.mouse_filter = Control.MOUSE_FILTER_IGNORE
	tela.esquinas = Vector4.ZERO
	tela.alfa_base = alfa_base
	tela.alfa_patron = alfa_patron
	tela.kit = kit
	panel.add_child(tela)


static func _margenes(izq: int, arr: int, der: int, aba: int) -> MarginContainer:
	var m: MarginContainer = MarginContainer.new()
	m.mouse_filter = Control.MOUSE_FILTER_PASS
	m.add_theme_constant_override("margin_left", izq)
	m.add_theme_constant_override("margin_top", arr)
	m.add_theme_constant_override("margin_right", der)
	m.add_theme_constant_override("margin_bottom", aba)
	return m












const FILO_FRANJA: int = 8
const FRANJA_MARCO: int = 12


static func _cabecera(b: Dictionary) -> Control:
	var team: Dictionary = b.get("team", {})
	var tonos: Dictionary = _colores(b)
	var franja: PanelContainer = PanelContainer.new()
	franja.name = "Franja"
	franja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.INK_DARK
	sb.border_color = tonos.filo
	sb.border_width_bottom = FILO_FRANJA
	sb.content_margin_left = 0.0
	sb.content_margin_right = 0.0
	sb.content_margin_top = 0.0
	sb.content_margin_bottom = float(FILO_FRANJA)
	franja.add_theme_stylebox_override("panel", sb)
	_tela(franja, tonos.kit, TELA_BASE, TELA_PATRON)
	var m: MarginContainer = _margenes(FRANJA_MARCO, FRANJA_MARCO, FRANJA_MARCO, FRANJA_MARCO)
	franja.add_child(m)
	var rotulo: PanelContainer = PanelContainer.new()
	rotulo.name = "Rotulo"
	var sbr: StyleBoxFlat = _placa(tonos.tinte)
	sbr.content_margin_left = 12.0
	sbr.content_margin_right = 12.0
	sbr.content_margin_top = 6.0
	sbr.content_margin_bottom = 6.0
	rotulo.add_theme_stylebox_override("panel", sbr)
	m.add_child(rotulo)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	rotulo.add_child(row)
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(64, 64)
	crest.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	crest.set_team(team)
	row.add_child(crest)
	var nm: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.INK_LIGHT)

	nm.text = CareerTheme.caps(Nations.team_label(team, "?"))
	nm.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	nm.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	nm.clip_text = true
	row.add_child(nm)





	var media: int = _media(b.get("once", []))
	if media > 0:
		var badge: OvrBadge = OvrBadge.new()
		badge.name = "MediaEquipo"
		badge.custom_minimum_size = MEDALLA
		badge.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		badge.setup(media, 22)
		row.add_child(badge)
	return franja



static func _media(once: Array) -> int:
	var suma: int = 0
	var n: int = 0
	for p in once:
		var o: int = int((p as Dictionary).get("ovr", 0))
		if o > 0:
			suma += o
			n += 1
	return int(round(float(suma) / float(n))) if n > 0 else 0





































const TELA_BASE: float = 1.0
const TELA_PATRON: float = 0.0
const MARCO: int = 18
const TEJA: float = 120.0







const FILO_SECCION: int = 4


static func _columna(b: Dictionary, host: Node) -> Control:
	var tonos: Dictionary = _colores(b)
	var placa: PanelContainer = PanelContainer.new()
	placa.name = "Columna"
	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE
	sb.border_color = tonos.tinte
	sb.border_width_left = 3
	sb.border_width_right = 3
	sb.border_width_bottom = 3
	for lado in [SIDE_LEFT, SIDE_TOP, SIDE_RIGHT, SIDE_BOTTOM]:
		sb.set_content_margin(lado, 0.0)
	placa.add_theme_stylebox_override("panel", sb)
	_tela(placa, tonos.kit, TELA_BASE, TELA_PATRON, TEJA)
	var bloques: VBoxContainer = VBoxContainer.new()
	bloques.add_theme_constant_override("separation", 0)
	placa.add_child(bloques)
	var team: Dictionary = b.get("team", {})
	var kit: int = int(b.get("kit", 0))
	var club: String = String(b.get("club", ""))
	var nat: bool = bool(b.get("nat", false))
	var banca: Array = b.get("banca", [])
	_seccion(bloques, I18n.t("TITULARES"), tonos)
	var c: VBoxContainer = _bloque(bloques, banca.is_empty())
	for p in b.get("once", []):
		c.add_child(_fila(p as Dictionary, team, kit, tonos,
			_abre_ficha(host, p as Dictionary, club, nat)))
	if not banca.is_empty():
		_seccion(bloques, I18n.t("BANCA"), tonos)
		c = _bloque(bloques, true)
		for p in banca:
			c.add_child(_fila(p as Dictionary, team, kit, tonos,
				_abre_ficha(host, p as Dictionary, club, nat)))
	return placa




static func _bloque(bloques: VBoxContainer, ultimo: bool) -> VBoxContainer:
	var m: MarginContainer = _margenes(MARCO, MARCO, MARCO, MARCO + 4 if ultimo else MARCO)
	bloques.add_child(m)
	var c: VBoxContainer = VBoxContainer.new()
	c.add_theme_constant_override("separation", FILA_SEP)
	m.add_child(c)
	return c






static func _seccion(c: VBoxContainer, texto: String, tonos: Dictionary) -> void:
	var tira: PanelContainer = PanelContainer.new()
	tira.name = "Seccion"
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.PLATE_BG
	sb.bg_color.a = 1.0
	sb.border_color = tonos.filo
	sb.border_width_top = FILO_SECCION
	sb.border_width_bottom = FILO_SECCION
	sb.content_margin_left = float(MARCO)
	sb.content_margin_right = float(MARCO)
	sb.content_margin_top = 10.0 + FILO_SECCION
	sb.content_margin_bottom = 10.0 + FILO_SECCION
	tira.add_theme_stylebox_override("panel", sb)
	c.add_child(tira)
	var v: VBoxContainer = VBoxContainer.new()
	tira.add_child(v)
	CareerUi.head(v, texto, null, "", tonos.tinta)






static func _placa(tinte: Color) -> StyleBoxFlat:
	var sb: StyleBoxFlat = CareerTheme.plate_edged(tinte)
	sb.bg_color.a = 1.0
	sb.border_color.a = 1.0
	return sb






static func _abre_ficha(host: Node, p: Dictionary, club: String, nat: bool) -> Callable:
	return func() -> void:
		CareerPage.ficha_fuera(host, p.get("fila", {}), club, nat, bool(p.get("tu", false)))


























const MEDALLA: Vector2 = Vector2(58, 62)
const TAP_HOLGURA: float = 24.0
const PLACA_TINTE: float = 0.42
const TINTA_CONTRASTE: float = 4.5







static func _legible(c: Color, fondo: Color) -> Color:
	var out: Color = c
	for _i in range(16):
		if CareerTheme.contrast(out, fondo) >= TINTA_CONTRASTE:
			return out
		out = out.lightened(0.12)
	return out


static func _fila(p: Dictionary, team: Dictionary, kit: int, tonos: Dictionary,
		toque: Callable) -> Control:
	var tu: bool = bool(p.get("tu", false))
	var tinta: Color = tonos.tinta
	var capa: PanelContainer = PanelContainer.new()
	capa.name = "Fila"
	capa.mouse_filter = Control.MOUSE_FILTER_PASS
	var col_puesto: Color = CareerUi.pos_color(String(p.get("pos", "")))
	var sb: StyleBoxFlat = _placa(col_puesto)
	sb.bg_color = CareerTheme.SURFACE.lerp(col_puesto, PLACA_TINTE)
	sb.bg_color.a = 1.0
	sb.content_margin_left = 10.0
	sb.content_margin_right = 10.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	capa.add_theme_stylebox_override("panel", sb)
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	row.mouse_filter = Control.MOUSE_FILTER_PASS
	capa.add_child(row)

	var num: Label = CareerUi.plain(CareerTheme.T_DIM, _legible(tinta, sb.bg_color))
	var n: int = int(p.get("number", 0))
	num.text = str(n) if n > 0 else ""
	num.custom_minimum_size = Vector2(DORSAL_W, 0)
	num.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	num.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	row.add_child(num)

	var av: PlayerAvatar = PlayerAvatar.new()
	av.custom_minimum_size = RETRATO
	av.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	av.bust = PlayerAvatar.BUST_CLOSE
	av.club = team
	row.add_child(av)
	av.set_look(_look(p, team, kit), PlayerCard.KEEPER_TEX \
			if String(p.get("pos", "")) == "POR" else null)

	var info: VBoxContainer = VBoxContainer.new()
	info.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	info.alignment = BoxContainer.ALIGNMENT_CENTER
	info.add_theme_constant_override("separation", 6)
	row.add_child(info)
	var nm: Label = CareerUi.plain(CareerTheme.T_BODY,
		_legible(CareerTheme.accent_text(), sb.bg_color) if tu else CareerTheme.TEXT)
	nm.text = CareerUi.display_name(CareerUi.surname(String(p.get("name", ""))))
	nm.clip_text = true
	info.add_child(nm)
	var marcas: HBoxContainer = HBoxContainer.new()
	marcas.add_theme_constant_override("separation", 8)
	info.add_child(marcas)





	marcas.add_child(PlayerCard.pastilla(String(p.get("pos", "")), true))



	var ovr: int = int(p.get("ovr", 0))
	if ovr > 0:
		var med: OvrBadge = OvrBadge.new()
		med.custom_minimum_size = MEDALLA
		med.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		med.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		row.add_child(med)
		med.setup(ovr, 22)

	if toque.is_valid():
		var catcher: Control = Control.new()
		catcher.name = "Toque"
		catcher.mouse_filter = Control.MOUSE_FILTER_STOP


		CareerUi.tocable_mando(catcher)
		capa.add_child(catcher)
		catcher.gui_input.connect(func(ev: InputEvent) -> void:
			var mb: InputEventMouseButton = ev as InputEventMouseButton
			if mb == null or mb.button_index != MOUSE_BUTTON_LEFT:
				return
			if mb.pressed:
				catcher.set_meta("down", mb.global_position)
			elif catcher.has_meta("down"):
				var d: float =(mb.global_position \
						-(catcher.get_meta("down") as Vector2)).length()
				catcher.remove_meta("down")
				if d < TAP_HOLGURA:
					toque.call())
	return capa






static func _look(p: Dictionary, team: Dictionary, kit: int) -> Dictionary:
	var base: Dictionary = GameState.kit_variant(team, kit)
	if String(p.get("pos", "")) == "POR":
		base = KitRecolor.keeper_cfg(String(team.get("id", "")), -1,
			String(base.get("pattern", "solid")))
	base["number"] = int(p.get("number", 0))
	if not bool(p.get("tu", false)):
		return KitRecolor.appearance_for(String(p.get("name", "")), base)
	var cfg: Dictionary = GameState.player_look().duplicate()
	for k in GameState.player_kit().keys():
		if not base.has(k):
			cfg.erase(k)
	cfg.merge(base, true)
	return cfg
