extends "res://ui/house/house.gd"




const MAPA: GDScript = preload("res://ui/house/museo_mapa.gd")

var _visitadas: Array = []
var _sala_actual: String = ""
var _salas_btn: Button
var _pieza_wall: Array = []
var _pieza_items: Array = []
var _pieza_nombre: String = ""
var _mapa_ctl: Control
var _mapa_lista: Container
var _mapa_elegida: String = ""
var _muros_visita: Array = []
var _archivo_placa: Dictionary = {}
var _archivo_backup: Array = []


func _init() -> void:
	museo = true
	destino_salida = "res://ui/retirement.tscn"


func _ready() -> void:
	if not SalonFama.museo_pendiente.is_empty():
		_archivo_placa = SalonFama.museo_pendiente.duplicate(true)
		SalonFama.museo_pendiente.clear()
		_prepara_archivo()
	super._ready()
	Music.play("legacy")
	add_to_group(CareerUi.LIVE_3D_GROUP)
	_actualiza_sala()




func _process(delta: float) -> void:
	if CareerUi.modal_open(self):
		return
	super._process(delta)
	_actualiza_sala()



func set_live(on: bool) -> void:
	if viewport != null:
		viewport.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on else SubViewport.UPDATE_DISABLED
	set_process(on)


func _build_hud() -> void:
	super._build_hud()
	var antiguo: Control = _hud_top
	remove_child(antiguo)
	antiguo.queue_free()
	var top: MarginContainer = MarginContainer.new()
	top.set_anchors_preset(Control.PRESET_TOP_WIDE)
	for lado in ["left", "right", "top"]:
		top.add_theme_constant_override("margin_" + lado, 24)
	add_child(top)
	CareerUi.apply_safe_area(top, get_viewport())
	_hud_top = top
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	top.add_child(col)
	var back: Button = CareerUi.back_button(col, func() -> void:
		SceneFade.to_scene(destino_salida))
	CareerTheme.style_button(back, CareerTheme.Kind.NEUTRAL, CareerTheme.T_HEAD)
	_salas_btn = CareerUi.menu_row(I18n.t("SALAS"), "", CareerTheme.NAV_CASA, "mundo")
	_salas_btn.custom_minimum_size = Vector2(250, 92)
	_salas_btn.size_flags_horizontal = Control.SIZE_SHRINK_END
	_salas_btn.pressed.connect(_abre_mapa)
	back.get_parent().add_child(_salas_btn)
	var placa: PanelContainer = CareerUi.plate()

	placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	col.add_child(placa)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	placa.add_child(fila)
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(52, 52)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.setup("vitrina", CareerTheme.NAV_LEGADO)
	fila.add_child(ic)
	var nombres: VBoxContainer = VBoxContainer.new()
	nombres.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(nombres)
	var nombre: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
	nombre.text = CareerTheme.caps(Career.player_name)
	nombre.clip_text = true
	nombre.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	nombres.add_child(nombre)
	_room_lbl = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	_room_lbl.clip_text = true
	nombres.add_child(_room_lbl)

	var zy: float = 252.0 + UiKit.top_safe_inset(get_viewport())
	for b in [_zoom_in_btn, _zoom_out_btn]:
		b.offset_top = zy
		b.offset_bottom = zy + BTN_ZOOM

	_shelf_card.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_LEGADO))
	_prop_card.visible = false


func _refresh_labels() -> void:
	super._refresh_labels()


	_prop_card.visible = false
	_use_btn.visible = false
	_play_btn.visible = false
	_jersey_btn.visible = false
	_actualiza_sala()


func _actualiza_sala() -> void:
	if _room_lbl == null:
		return
	var sala: Dictionary = House.plan_room_at(_plano(), _pos)
	var id: String = String(sala.get("id", ""))
	if id.is_empty():
		return
	if not _visitadas.has(id):
		_visitadas.append(id)
	_sala_actual = id
	_room_lbl.text = CareerTheme.caps(_nombre_sala(id))




func _nombre_sala(id: String) -> String:
	match id:
		"vestibulo": return I18n.t("VESTÍBULO")
		"nave": return I18n.t("TROFEOS")
		"ala_este": return I18n.t("CAMISETAS")
		"ala_oeste": return I18n.t("HAT-TRICKS")
		"abside": return I18n.t("TU LEGADO")
	return I18n.t("MUSEO")


func _icono_sala(id: String) -> String:
	match id:
		"vestibulo": return "puerta"
		"nave": return "torneos"
		"ala_este": return "equipo"
		"ala_oeste": return "balon"
		"abside": return "leyendas"
	return "vitrina"


func _abre_mapa() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	_suelta_mando()
	CareerUi.back_button(box, func() -> void: CareerUi.close_modal(box))
	CareerUi.head(box, I18n.t("TU MUSEO"), null, "", CareerTheme.NAV_LEGADO)
	if UiKit.es_horizontal():
		_mapa_horizontal(box)
		return
	var scroll: DragScroll = DragScroll.new()
	scroll.sin_tope = false
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	box.add_child(scroll)
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	contenido.add_theme_constant_override("separation", 14)
	scroll.add_child(contenido)
	_mapa_elegida = _sala_actual
	_mapa_ctl = MAPA.new()
	_mapa_ctl.custom_minimum_size.y = 580.0
	contenido.add_child(_mapa_ctl)
	_mapa_ctl.call("setup", _plano(), _pos, _visitadas, _mapa_elegida)
	_mapa_ctl.connect("sala_elegida", _selecciona_sala)
	var datos: HFlowContainer = HFlowContainer.new()
	datos.add_theme_constant_override("h_separation", 18)
	datos.add_theme_constant_override("v_separation", 8)
	contenido.add_child(datos)
	datos.add_child(CareerUi.icon_stat("target", I18n.t("ESTÁS AQUÍ"), CareerTheme.NAV_YO))
	datos.add_child(CareerUi.icon_stat("torneos", str(Career.awards.size()), CareerTheme.NAV_LEGADO))
	datos.add_child(CareerUi.icon_stat("aficion", str(_fans.size()), CareerTheme.NAV_GENTE))
	_mapa_lista = VBoxContainer.new()
	_mapa_lista.add_theme_constant_override("separation", 8)
	contenido.add_child(_mapa_lista)
	_pinta_lista_salas()
	var honores: Button = CareerUi.primary_cta(I18n.t("RECONOCIMIENTOS"), func() -> void:
		CareerUi.close_modal(box)
		_abre_reconocimientos())
	honores.name = "VerReconocimientos"
	contenido.add_child(honores)
	var ir: Button = CareerUi.primary_cta(I18n.t("VISITAR SALA"), func() -> void:
		if _visita_sala(_mapa_elegida):
			CareerUi.close_modal(box))
	box.add_child(ir)
	CareerUi.normalize_caps(box)


func _mapa_horizontal(box: VBoxContainer) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 28)
	box.add_child(fila)
	_mapa_elegida = _sala_actual
	_mapa_ctl = MAPA.new()
	_mapa_ctl.custom_minimum_size = Vector2(560, 580)
	_mapa_ctl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_mapa_ctl.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_child(_mapa_ctl)
	_mapa_ctl.call("setup", _plano(), _pos, _visitadas, _mapa_elegida)
	_mapa_ctl.connect("sala_elegida", _selecciona_sala)
	var opciones: VBoxContainer = VBoxContainer.new()
	opciones.custom_minimum_size.x = 820.0
	opciones.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	opciones.add_theme_constant_override("separation", 14)
	fila.add_child(opciones)
	var rejilla: GridContainer = GridContainer.new()
	rejilla.columns = 2
	rejilla.add_theme_constant_override("h_separation", 12)
	rejilla.add_theme_constant_override("v_separation", 10)
	_mapa_lista = rejilla
	opciones.add_child(_mapa_lista)
	_pinta_lista_salas()
	opciones.add_child(CareerUi.primary_cta(I18n.t("RECONOCIMIENTOS"), func() -> void:
		CareerUi.close_modal(box)
		_abre_reconocimientos()))
	box.add_child(CareerUi.primary_cta(I18n.t("VISITAR SALA"), func() -> void:
		if _visita_sala(_mapa_elegida):
			CareerUi.close_modal(box)))
	CareerUi.normalize_caps(box)


func _selecciona_sala(id: String) -> void:
	_mapa_elegida = id
	_mapa_ctl.call("setup", _plano(), _pos, _visitadas, id)
	_pinta_lista_salas()


func _pinta_lista_salas() -> void:
	for n in _mapa_lista.get_children():
		_mapa_lista.remove_child(n)
		n.queue_free()
	var i: int = 0
	for sala in _cuartos():
		i += 1
		var id: String = String((sala as Dictionary)["id"])
		var valor: String = I18n.t("ESTÁS AQUÍ") if id == _sala_actual else ""
		var b: Button = CareerUi.menu_row("%d · %s" % [i, _nombre_sala(id)], valor,
			CareerTheme.NAV_YO, _icono_sala(id))
		if id == _mapa_elegida:
			CareerTheme.style_button(b, CareerTheme.Kind.PRIMARY, CareerTheme.T_HEAD)
		if UiKit.es_horizontal():
			b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			b.custom_minimum_size.x = 360.0
		b.pressed.connect(_selecciona_sala.bind(id))
		_mapa_lista.add_child(b)




func _destino_sala(id: String) -> Vector2:
	for sala in _cuartos():
		var s: Dictionary = sala as Dictionary
		if String(s["id"]) != id:
			continue
		var r: Rect2 = s["rect"] as Rect2
		var centro: Vector2 = Vector2(r.get_center().x, r.position.y + minf(1.6, r.size.y * 0.5))
		if House.plan_can_stand(_plano(), centro, House.BODY_R, Career.house_extras):
			return centro
		for z in range(1, int(r.size.y * 2.0)):
			for x in range(1, int(r.size.x * 2.0)):
				var p: Vector2 = r.position + Vector2(float(x), float(z)) * 0.5
				if House.plan_can_stand(_plano(), p, House.BODY_R, Career.house_extras):
					return p
	return Vector2.INF


func _visita_sala(id: String) -> bool:
	var destino: Vector2 = _destino_sala(id)
	if destino == Vector2.INF:
		return false
	_suelta_mando()
	_pos = destino
	_place_player()
	_snap_cam()
	_refresh_labels()
	return true




func _snap_cam() -> void:
	super._snap_cam()
	if player != null:
		_fade_walls(1.0)


func _suelta_mando() -> void:
	_finger = -1
	_stick = Vector2.ZERO


func _fill_exhibit(wall: Array, focus: Dictionary) -> void:
	_pieza_wall = wall.duplicate(true)
	_pieza_items = _exhibit_items(wall)
	for n in _shelf_box.get_children():
		_shelf_box.remove_child(n)
		n.queue_free()
	if _pieza_items.is_empty():
		return
	var cantidad: int = 0
	for it in _pieza_items:
		cantidad += int((it as Dictionary).get("count", 1))
	_pieza_nombre = I18n.t("HAT-TRICKS") if _keeps_prop else I18n.t("CAMISETAS")
	if not _keeps_prop and wall.is_empty():
		_pieza_nombre = I18n.t(String((_pieza_items[0] as Dictionary).get("name", "TROFEOS")))
	var icono: String = "balon" if _keeps_prop else ("equipo" if not wall.is_empty() else "torneos")
	var tarjeta: Button = CareerUi.menu_row(_pieza_nombre, "×%d" % cantidad,
		CareerTheme.NAV_LEGADO, icono, null, I18n.t("TOCA PARA EXPLORAR"))
	tarjeta.pressed.connect(_abre_pieza)
	_shelf_box.add_child(tarjeta)


func _abre_pieza() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	_suelta_mando()
	CareerUi.back_button(box, func() -> void: CareerUi.close_modal(box))
	if UiKit.es_horizontal():
		CareerUi.head(box, _pieza_nombre)
		_exhibit_selector(box, _pieza_items, _pieza_wall)
		CareerUi.normalize_caps(box)
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_TITLE_MODAL, CareerTheme.TEXT)
	titulo.text = CareerTheme.caps(_pieza_nombre)
	titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	box.add_child(titulo)
	var hero: PanelContainer = CareerUi.plate()
	hero.add_theme_stylebox_override("panel", CareerTheme.plate_edged(CareerTheme.NAV_LEGADO))
	box.add_child(hero)
	var resumen: HBoxContainer = HBoxContainer.new()
	resumen.add_theme_constant_override("separation", 24)
	hero.add_child(resumen)
	if not _keeps_prop and _pieza_wall.is_empty() and not _pieza_items.is_empty():
		var copa: TrophyIcon = TrophyIcon.new()
		copa.custom_minimum_size = Vector2(132, 132)
		copa.set_type(String((_pieza_items[0] as Dictionary).get("type", "")))
		resumen.add_child(copa)
	else:
		var icono: MenuIcon = MenuIcon.new()
		icono.custom_minimum_size = Vector2(132, 132)
		icono.setup("balon" if _keeps_prop else "equipo", CareerTheme.NAV_LEGADO)
		resumen.add_child(icono)
	var cifra: VBoxContainer = VBoxContainer.new()
	cifra.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cifra.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	resumen.add_child(cifra)
	var cantidad: int = 0
	for pieza in _pieza_items:
		cantidad += int((pieza as Dictionary).get("count", 1))
	var total: Label = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.NAV_LEGADO)
	total.text = "×%d" % cantidad
	cifra.add_child(total)
	var leyenda: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT_DIM)
	leyenda.text = I18n.t("BALONES") if _keeps_prop else (I18n.t("CAMISETAS") if not _pieza_wall.is_empty() else I18n.t("TROFEOS"))
	leyenda.clip_text = true
	cifra.add_child(leyenda)
	var sc: DragScroll = DragScroll.new()
	sc.sin_tope = false
	sc.size_flags_vertical = Control.SIZE_EXPAND_FILL
	sc.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	box.add_child(sc)
	var contenido: VBoxContainer = VBoxContainer.new()
	contenido.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	contenido.add_theme_constant_override("separation", 20)
	sc.add_child(contenido)


	for it in _pieza_items:
		var placa: PanelContainer = CareerUi.plate()
		contenido.add_child(placa)
		placa.add_child(_exhibit_row(it as Dictionary, _pieza_wall))
	CareerUi.normalize_caps(box)


func _exhibit_row(it: Dictionary, wall: Array) -> Control:
	var fila: Control = super._exhibit_row(it, wall)
	if not _keeps_prop and wall.is_empty() and fila.get_child_count() > 0:
		var head: Node = fila.get_child(0)
		for n in head.get_children():


			if n is Button:
				head.remove_child(n)
				n.queue_free()
			elif n is Label and (n as Label).size_flags_horizontal == Control.SIZE_EXPAND_FILL:
				(n as Label).autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	return fila




func _rebuild_planta() -> void:
	_muros_visita.clear()
	super._rebuild_planta()
	var antes: Node3D = _box_parent
	_box_parent = _planta
	for sala in _cuartos():
		var s: Dictionary = sala as Dictionary
		var id: String = String(s["id"])
		var r: Rect2 = s["rect"] as Rect2
		if id == "vestibulo":
			_add_lamina([{"t": I18n.t("TU MUSEO"), "px": 3},
				{"t": Career.player_name, "px": 2}],
				Vector3(0, 2.12, r.position.y + 0.08), Vector2(4.0, 0.32),
				Vector2(0, 1), Museo.PALETA["wood"], Museo.PALETA["wall"])
			continue
		var at: Vector3 = Vector3(r.get_center().x, 2.05, r.end.y - 0.06)
		var mira: Vector2 = Vector2(0, -1)
		if id == "nave":


			at = Vector3(r.position.x + 0.06, 2.05, r.position.y + 2.4)
			mira = Vector2(1, 0)
		elif id == "abside":
			at.x = 2.2
			at.y = 2.05
		_add_lamina([{"t": _nombre_sala(id), "px": 3}], at,
			Vector2(3.2, 0.46), mira, Museo.PALETA["wood"], Museo.PALETA["wall"])


		if id in ["nave", "abside"]:
			_add_box(Vector3(0, 0.012, r.position.y + 0.1),
				Vector3(4.6, 0.012, 0.06), Museo.PALETA["trim"])


	for sala in _cuartos():
		var s: Dictionary = sala as Dictionary
		if String(s["id"]) != "nave":
			continue
		var r: Rect2 = s["rect"] as Rect2
		for x in [r.position.x + 0.82, r.end.x - 0.82]:
			var filo: MeshInstance3D = _add_box(Vector3(x, 0.012, r.get_center().y),
				Vector3(0.035, 0.012, r.size.y - 0.24), Museo.PALETA["trim"])
			filo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_add_reconocimientos_3d()
	_box_parent = antes






func _grano_muro(m: MeshInstance3D, col: Color, tipo: int) -> void:
	super._grano_muro(m, col, tipo)
	_muros_visita.append({"mesh": m, "acabado": m.material_override})


func _fade_walls(delta: float) -> void:
	super._fade_walls(delta)
	for dato in _muros_visita:
		var m: MeshInstance3D = SceneFade.vivo((dato as Dictionary)["mesh"]) as MeshInstance3D
		if not is_instance_valid(m) or not m.mesh is BoxMesh:
			continue
		var mat: StandardMaterial3D =(m.mesh as BoxMesh).material as StandardMaterial3D
		if mat == null:
			continue
		var objetivo: Material = null if mat.albedo_color.a < 0.995 else (dato as Dictionary)["acabado"]
		if m.material_override != objetivo:
			m.material_override = objetivo



func _prestigio_visita() -> Dictionary:
	if not _archivo_placa.is_empty():
		var foto: Dictionary = _archivo_placa.get("museo", {})
		if foto.has("prestigio"):
			return (foto["prestigio"] as Dictionary).duplicate(true)
		var premios: Array = _archivo_placa.get("awards", [])
		return {"clubes": 0, "ligas": 0, "historia": premios.has("Mejor Jugador de la Historia"),
			"visitantes": 12 if premios.has("Mejor Jugador de la Historia") else clampi(2 + int(premios.size() / 5), 2, 6)}
	var clubes: Array = Career.clubs_history()
	var paises: Array = []
	var club_top: int = 0
	var liga_top: int = 0
	for cid in clubes:
		var puesto: int = Career._user_club_rank(String(cid))
		if puesto > 0 and puesto <= 5:
			club_top += 1
		var pais: String = Teams.country_of(String(cid))
		if not pais.is_empty() and not paises.has(pais):
			paises.append(pais)
	for pais in paises:
		for fila in Legends.for_league(String(pais), 5):
			if bool((fila as Dictionary).get("user", false)):
				liga_top += 1
				break
	var titulos: int = 0
	for premio in Career.awards:
		if Trophies.CATALOG.has(String(premio)) and String(premio) not in ["Jugador del Partido", "Jugador del Mes", "Campeón del Torneo de Póquer", "Premio de la Afición", "Once Ideal de la Liga"]:
			titulos += 1
	var historia: bool = Career.awards.has("Mejor Jugador de la Historia")
	var objetivo: int = 2 + mini(4, int(titulos / 5)) + mini(3, club_top) + mini(3, liga_top)
	if historia:
		objetivo = Museo.FANS_MAX
	return {"clubes": club_top, "ligas": liga_top, "historia": historia,
		"visitantes": clampi(objetivo, Museo.FANS_MIN, Museo.FANS_MAX)}


func _plano_museo() -> Dictionary:
	if not _museo_pl.is_empty():
		return _museo_pl
	_museo_pl = Museo.planta(Trophies.cabinet(Career.awards), Career.keepsakes.size())
	var prestigio: Dictionary = _prestigio_visita()
	_museo_pl["prestigio"] = prestigio
	var props: Array = _museo_pl["props"]
	var candidatos: Array[Vector2] = []
	for i in range(props.size() - 1, -1, -1):
		if String((props[i] as Dictionary).get("kind", "")) == Museo.KIND_FAN:
			candidatos.push_front((props[i]["rect"] as Rect2).get_center())
			props.remove_at(i)
	var afinidades: Dictionary = {}
	var vitrinas: Array = []
	for prop in props:
		if not prop.get("acepta", []).is_empty():
			vitrinas.append(prop)
	vitrinas.sort_custom(func(a, b):
		return Trophies.ORDER.find(String(a["acepta"][0])) < Trophies.ORDER.find(String(b["acepta"][0])))
	var preferidos: Array[Vector2] = []
	for vitrina in vitrinas:
		var r: Rect2 = vitrina["rect"]
		var dir: Vector2 = Museo.CARA_DIR[int(vitrina.get("face", 0))]
		var key: String = String(vitrina["acepta"][0])
		var nombre: String = String(Trophies.CATALOG.get(key, {}).get("name", key))
		var procedencia: Array = Trophies.provenance(nombre, Career.season_history, Career.current_season_awards(), GameState.player_team_id, GameState.season_num, GameState.player_div())
		var cid: String = String(procedencia[0].get("club", "")) if not procedencia.is_empty() else ""
		var extent: float = r.size.x * 0.5 if absf(dir.x) > 0.5 else r.size.y * 0.5
		for lateral in [-0.75, 0.75, 0.0]:
			var puesto: Vector2 = r.get_center() + dir *(extent + Museo.FAN_FRENTE) + Vector2(- dir.y, dir.x) * float(lateral)
			if absf(puesto.x) < 1.2:
				continue
			preferidos.append(puesto)
			afinidades[puesto] = {"pieza": vitrina["id"], "club": cid}
	preferidos.append_array(candidatos)
	candidatos = preferidos

	for sala in _museo_pl["rooms"]:
		var r: Rect2 = sala["rect"]
		var z: float = r.position.y + 1.5
		while z < r.end.y - 1.0:
			for x in [r.position.x + 1.4, r.end.x - 1.4]:
				if absf(float(x)) > 1.2:
					candidatos.append(Vector2(float(x), z))
			z += 1.5
	var n: int = 0
	for punto in candidatos:
		if n >= int(prestigio["visitantes"]):
			break
		var huella: Rect2 = Rect2(punto - Vector2.ONE * Museo.FAN_R, Vector2.ONE * Museo.FAN_R * 2.0)
		var libre: bool = House.plan_can_stand(_museo_pl, punto)
		for esquina in [huella.position, huella.end, Vector2(huella.position.x, huella.end.y), Vector2(huella.end.x, huella.position.y)]:
			libre = libre and House.plan_can_stand(_museo_pl, esquina)
		for prop in props:
			if not bool((prop as Dictionary).get("pass", false)) and huella.grow(0.3).intersects(prop["rect"]):
				libre = false
		if not libre:
			continue
		props.append({"id": "fan_%d" % n, "kind": Museo.KIND_FAN,
			"rect": huella, "slot": "", "tiers": 0, "cap": 1, "pass": false,
			"pieza": afinidades.get(punto, {}).get("pieza", ""),
			"club": afinidades.get(punto, {}).get("club", "")})
		n += 1
	prestigio["presentes"] = n
	return _museo_pl


func _archivo_set(obj: Object, datos: Dictionary) -> void:
	for key in datos:
		var anterior: Variant = obj.get(key)
		if anterior is Array or anterior is Dictionary:
			anterior = anterior.duplicate(true)
		_archivo_backup.append({"obj": obj, "key": key, "valor": anterior})
		obj.set(key, datos[key])


func _prepara_archivo() -> void:
	museo_archivo = true
	destino_salida = "res://ui/salon_fama.tscn"
	var p: Dictionary = _archivo_placa
	var foto: Dictionary = p.get("museo", {})
	var historia: Array = foto.get("season_history", []).duplicate(true)




	var tr: Array = foto.get("transfers", []).duplicate(true)
	_archivo_set(GameState, {"readonly_save": true, "player_team_id": p.get("team_id", ""),
		"team_custom": GameState.look_de(p.get("team_custom", {})), "player_number": p.get("number", 0),
		"season_num": p.get("season", 1), "career_goals": p.get("goals", 0),
		"career_assists": p.get("assists", 0), "matches_played": p.get("matches", 0)})
	_archivo_set(Career, {"player_name": p.get("name", ""), "nationality": p.get("nat", ""),
		"age": p.get("age", 40), "retired": true, "retire_reason": "edad", "comeback_used": 1,
		"comeback_mirado": false, "awards": p.get("awards", []).duplicate(),
		"_season_award_mark":(p.get("awards", []) as Array).size(), "season_history": historia,


		"season_best": {},
		"transfers": tr, "keepsakes": foto.get("keepsakes", []).duplicate(true),
		"goal_reel": foto.get("goal_reel", {}).duplicate(true), "first_goal": foto.get("first_goal", {}).duplicate(true),
		"nat_debut": foto.get("nat_debut", {}).duplicate(true), "best_goal_dist": foto.get("best_goal_dist", {}).duplicate(true),
		"nat_caps": p.get("nat_caps", 0), "nat_goals": p.get("nat_goals", 0),
		"nat_assists": p.get("nat_assists", 0), "jersey_picks": {}, "trophy_pins": [],
		"vitrina_picks": {}})


func _exit_tree() -> void:

	for i in range(_archivo_backup.size() - 1, -1, -1):
		var dato: Dictionary = _archivo_backup[i]
		(dato["obj"] as Object).set(dato["key"], dato["valor"])
	_archivo_backup.clear()


func _honores_visita() -> Array:
	if not _archivo_placa.is_empty():
		return (_archivo_placa.get("museo", {}) as Dictionary).get("honores", [])
	if not has_meta("honores_visita"):
		set_meta("honores_visita", SalonFama.reconocimientos_carrera())
	return get_meta("honores_visita")






func _nombre_honor(h: Dictionary) -> String:
	match String(h["tipo"]):
		"club":
			return String(Teams.by_id(String(h["id"])).get("name", ""))
		"seleccion":
			return Nations.display_name(String(h["id"]))
	return Competitions.league_label(String(h["id"]))




func _rotulo_honor(h: Dictionary) -> String:
	match String(h["tipo"]):
		"club":
			return I18n.t("LEYENDA DEL CLUB")
		"seleccion":
			return I18n.t("LEYENDA DE LA SELECCIÓN")
	return I18n.t("LEYENDA DE LA LIGA")


func _records_visita() -> Dictionary:
	if not _archivo_placa.is_empty():
		return (_archivo_placa.get("museo", {}) as Dictionary).get("records", {})
	return Career.record_marks


func _abre_reconocimientos() -> void:
	var box: VBoxContainer = CareerUi.modal_pantalla(self)
	if box == null:
		return
	_suelta_mando()
	box.name = "ReconocimientosMuseo"
	CareerUi.back_button(box, func() -> void: CareerUi.close_modal(box))
	CareerUi.head(box, I18n.t("RECONOCIMIENTOS"))
	if UiKit.es_horizontal():
		_reconocimientos_horizontal(box)
		return
	var scroll: DragScroll = DragScroll.new()
	scroll.sin_tope = false
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	box.add_child(scroll)
	var lista: VBoxContainer = VBoxContainer.new()
	lista.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	lista.add_theme_constant_override("separation", 16)
	scroll.add_child(lista)
	for h in _honores_visita():
		var card: PanelContainer = CareerUi.plate()
		lista.add_child(card)
		var row: HBoxContainer = HBoxContainer.new()
		row.add_theme_constant_override("separation", 18)
		card.add_child(row)
		if h["tipo"] == "club":
			var crest: CrestView = CrestView.new()
			crest.custom_minimum_size = Vector2(52, 52)
			crest.set_team(Teams.by_id(String(h["id"])))
			row.add_child(crest)
		elif h["tipo"] == "seleccion":
			var flag: TextureRect = Flags.make_rect(String(h["id"]), 36.0)
			flag.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			row.add_child(flag)
		else:
			row.add_child(CareerUi.icon_stat("mundo", "", CareerTheme.HISTORIA))
		var col: VBoxContainer = VBoxContainer.new()
		col.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(col)
		var nombre: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
		nombre.text = _nombre_honor(h)
		nombre.clip_text = true
		col.add_child(nombre)
		CareerUi.dim(col, _rotulo_honor(h))
		var puesto: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.NAV_LEGADO)
		puesto.text = "#%d" % int(h["puesto"])
		row.add_child(puesto)
	if _honores_visita().is_empty():
		CareerUi.dim(lista, I18n.t("SIN DATOS"))
	var records: Dictionary = _records_visita()
	if not records.is_empty():
		CareerUi.head(lista, I18n.t("RÉCORDS REGISTRADOS"))
		for key in records:
			var r: Dictionary = records[key]
			if String(r.get("holder", "")) != Career.player_name:
				continue
			var fila: HBoxContainer = HBoxContainer.new()
			fila.add_theme_constant_override("separation", 14)
			lista.add_child(fila)
			fila.add_child(CareerUi.icon_stat("muro_records", str(int(r.get("value", 0))), CareerTheme.NAV_LEGADO))
			var texto: Label = CareerUi.plain(CareerTheme.T_DIM, CareerTheme.TEXT)
			texto.text = I18n.t(Records.short_label(String(key))) + " · T%d" % int(r.get("year", 0))
			texto.clip_text = true
			texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			fila.add_child(texto)
	CareerUi.normalize_caps(box)


func _reconocimientos_horizontal(box: VBoxContainer) -> void:
	var categorias: Dictionary = {"LEYENDA DEL CLUB": [], "LEYENDA DE LA LIGA": [], "LEYENDA DE LA SELECCIÓN": [], "RÉCORDS REGISTRADOS": []}
	for h in _honores_visita():
		var key: String = "LEYENDA DEL CLUB" if h["tipo"] == "club" else "LEYENDA DE LA LIGA"
		if h["tipo"] == "seleccion":
			key = "LEYENDA DE LA SELECCIÓN"
		categorias[key].append({"titulo": _nombre_honor(h), "nota": I18n.t(key), "valor": "#%d" % int(h["puesto"]), "club": String(h["id"]) if h["tipo"] == "club" else ""})
	for key in _records_visita():
		var r: Dictionary = _records_visita()[key]
		if String(r.get("holder", "")) != Career.player_name:
			continue
		categorias["RÉCORDS REGISTRADOS"].append({"titulo": I18n.t(Records.short_label(String(key))), "nota": "T%d" % int(r.get("year", 0)), "valor": str(int(r.get("value", 0))), "club": ""})
	var fila: HBoxContainer = HBoxContainer.new()
	fila.size_flags_vertical = Control.SIZE_EXPAND_FILL
	fila.add_theme_constant_override("separation", 24)
	box.add_child(fila)
	var tabs: VBoxContainer = VBoxContainer.new()
	tabs.custom_minimum_size.x = 280.0
	tabs.add_theme_constant_override("separation", 10)
	fila.add_child(tabs)
	var centro: VBoxContainer = VBoxContainer.new()
	centro.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	fila.add_child(centro)
	var detalle: VBoxContainer = VBoxContainer.new()
	detalle.custom_minimum_size.x = 420.0
	detalle.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	detalle.add_theme_constant_override("separation", 18)
	fila.add_child(detalle)
	var botones: Array[Button] = []
	var rotulos: Dictionary = {"LEYENDA DEL CLUB": "CLUBES", "LEYENDA DE LA LIGA": "LIGA", "LEYENDA DE LA SELECCIÓN": "SELECCIÓN", "RÉCORDS REGISTRADOS": "RÉCORDS REGISTRADOS"}
	for key in categorias:
		var clave: String = String(key)
		var tab: Button = _bag_selector(I18n.t(String(rotulos[clave])), false, func() -> void: pass)
		tab.custom_minimum_size.x = 280.0
		tabs.add_child(tab)
		botones.append(tab)
		tab.pressed.connect(func() -> void:
			for n in centro.get_children():
				centro.remove_child(n)
				n.queue_free()
			for b in botones:
				CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY if b == tab else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION)
			var datos: Array = categorias[clave]
			if datos.is_empty():
				CareerUi.dim(centro, I18n.t("SIN DATOS"))
			var nombres: Array = []
			for d in datos:
				nombres.append(String(d["titulo"]))
			var opciones: Array[Button] = []
			var limpiar: Callable = func() -> void:
				opciones.clear()
				for n in detalle.get_children():
					detalle.remove_child(n)
					n.queue_free()
			SELECTOR_COLECCION.crear(centro, nombres,
				func(i: int, filtrada: bool) -> Control:
					var pieza: Dictionary = datos[i]
					var texto: String =("#%d · " % [i + 1] if filtrada else "") + String(pieza["titulo"])
					var b: Button = _bag_selector(texto, false, func() -> void: pass)
					b.custom_minimum_size = Vector2(170, 72)
					b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
					opciones.append(b)
					b.pressed.connect(func() -> void:
						for n in detalle.get_children():
							detalle.remove_child(n)
							n.queue_free()
						if not String(pieza["club"]).is_empty():
							var crest: CrestView = CrestView.new()
							crest.custom_minimum_size = Vector2(96, 96)
							crest.set_team(Teams.by_id(String(pieza["club"])))
							detalle.add_child(crest)
						var nombre: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)
						nombre.text = String(pieza["titulo"])
						nombre.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
						detalle.add_child(nombre)
						CareerUi.dim(detalle, String(pieza["nota"]))
						var valor: Label = CareerUi.plain(CareerTheme.T_TITLE, CareerTheme.NAV_LEGADO)
						valor.text = String(pieza["valor"])
						detalle.add_child(valor)
						for opcion in opciones:
							CareerTheme.apply_button(opcion, CareerTheme.Kind.PRIMARY if opcion == b else CareerTheme.Kind.NEUTRAL, CareerTheme.T_CAPTION))
					return b,
				SELECTOR_COLECCION.columnas(self, 836.0, 170.0), 10, Vector2(170, 72), limpiar))
	botones[0].pressed.emit()
	CareerUi.normalize_caps(box)



func _add_reconocimientos_3d() -> void:
	var honores: Array = _honores_visita()
	for i in mini(6, honores.size()):
		var h: Dictionary = honores[i]
		var lado: float = -1.0 if i < 3 else 1.0
		_add_lamina([{"t": I18n.t("LEYENDA"), "px": 3}, {"t": _nombre_honor(h), "px": 2},
			{"t": "#%d" % int(h["puesto"]), "px": 3}],
			Vector3(lado * 4.94, 1.6, 1.2 + float(i % 3) * 1.7), Vector2(1.4, 0.7), Vector2(- lado, 0), Museo.PALETA["wood"], Museo.PALETA["trim"])
	for prop in _plano()["props"]:
		if not prop.get("acepta", []).has("Mejor Jugador de la Historia"):
			continue
		var r: Rect2 = prop["rect"]
		var centro: Vector2 = r.get_center()
		var dir: Vector2 = Museo.CARA_DIR[int(prop.get("face", 0))]
		var base: MeshInstance3D = _add_box(Vector3(centro.x, 0.1, centro.y), Vector3(r.size.x, 0.2, r.size.y), CareerTheme.HISTORIA_D)
		base.name = "PedestalBalonMorado"
		_add_box(Vector3(centro.x, 0.21, centro.y), Vector3(r.size.x, 0.035, r.size.y), CareerTheme.HISTORIA)
		var luz: OmniLight3D = OmniLight3D.new()
		luz.name = "LuzBalonMorado"
		luz.light_color = CareerTheme.HISTORIA
		luz.light_energy = 0.65
		luz.omni_range = 2.6
		luz.shadow_enabled = false
		luz.position = Vector3(centro.x + dir.x * 0.8, 1.8, centro.y + dir.y * 0.8)
		_planta.add_child(luz)
		var fecha: String = ""
		for h in Career.season_history:
			if h.get("awards", []).has("Mejor Jugador de la Historia"):
				fecha = "T%d" % int(h.get("season", 0))
				break
		_add_lamina([{"t": I18n.t("MEJOR DE LA HISTORIA"), "px": 2}, {"t": fecha, "px": 2}],
			Vector3(centro.x - dir.x * 0.3, 2.12, centro.y - dir.y * 0.3), Vector2(1.6, 0.42), dir,
			CareerTheme.HISTORIA_D, CareerTheme.HISTORIA)



func _fan_tinte(i: int) -> Dictionary:
	var cfg: Dictionary = super._fan_tinte(i)
	var gente: Array = []
	for prop in _plano()["props"]:
		if prop.get("kind", "") == Museo.KIND_FAN:
			gente.append(prop)
	if i < gente.size():
		var club: String = String(gente[i].get("club", ""))
		if not club.is_empty():
			var team: Dictionary = Teams.by_id(club)
			cfg["kit"] = team.get("kit", cfg.get("kit", Color.WHITE))
			cfg["kit_b"] = team.get("kit_b", team.get("kit2", cfg["kit"]))
			cfg["pattern"] = team.get("pattern", "solid")
	return cfg


func _fan_mira_su_pieza(fan: Dictionary) -> bool:
	var pieza: String = String((fan["prop"] as Dictionary).get("pieza", ""))
	if not pieza.is_empty():
		for prop in _plano()["props"]:
			if String(prop.get("id", "")) == pieza:
				var hacia: Vector2 =(prop["rect"] as Rect2).get_center() -(fan["pos"] as Vector2)
				if hacia.length_squared() < FAN_MIRA_R * FAN_MIRA_R and hacia.length_squared() > 0.0001:
					_pon_frames(fan, "idle", _dir_de(hacia))
					return true
	return super._fan_mira_su_pieza(fan)
