extends "res://ui/ceremonies/deadline_night.gd"

















































const T_ROTULO: float = 0.7
const T_DIAPO: float = 2.35
const DIAPO: float = 1.8

const PASO: float = 0.22
const T_FICHA: float = 8.4



const TOPE_FILAS: int = 3

















const T_K0B: float = 1.3
const T_K1: float = 2.2
const T_K1B: float = 7.2
const TV_DIST: float = 6.8









const KEYS_MERCADO: Array = [
	{"t": 0.0, "dist": 7.6, "h": 2.45, "yaw": 183.0, "aim_y": 2.25, "fov": 36.0,
		"focus_x": 0.0, "focus_z": 0.35},
	{"t": T_K0B, "dist": 7.3, "h": 2.4, "yaw": 182.0, "aim_y": 2.35, "fov": 36.0,
		"focus_x": 0.0, "focus_z": 0.35},
	{"t": T_K1, "dist": TV_DIST, "h": TV_Y - 0.6, "yaw": 180.0, "aim_y": TV_Y - 0.6,
		"fov": 35.0, "focus_x": 0.0, "focus_z": TV_Z + 0.9},
	{"t": T_K1B, "dist": TV_DIST, "h": TV_Y - 0.6, "yaw": 180.0, "aim_y": TV_Y - 0.6,
		"fov": 35.0, "focus_x": 0.0, "focus_z": TV_Z + 0.9},
]




const PANEL_REPOSO: float = 1.4
const PANEL_GOLPE: float = 2.4


var _tab: Tablero


var _tab3d: Tablero


var _tam_pedido: Vector2 = Vector2.ZERO


var _diapo: int = -1




var _calientes: int = 3








func _accent_for() -> Color:
	return CareerTheme.DANGER if _nivel() >= 3 else CareerTheme.MONEY


func _build() -> void:
	focus = Vector3(0.0, 0.0, 0.35)
	_mundo_de_plato()
	_build_set()

	_build_tv()
	_build_hosts()
	make_camera(KEYS_MERCADO, 36.0)


	orbit_speed = 0.0
	make_audio(0.0, false)

	make_chyron(I18n.t("SE ABRE EL MERCADO"),
		CareerTheme.caps(String(team().get("name", "?"))), team(), T_ROTULO)
	make_card(T_FICHA)
	card_title(I18n.t("SE ABRE EL MERCADO"), 40)
	card_sub(I18n.tf("{0} · TEMPORADA {1}",
		[I18n.t("MERCADO DE VERANO"), _season()]), CareerTheme.MONEY)
	card_stats(_stats())
	card_note(_por_que_texto())
	card_cta(I18n.t("SEGUIR"))





func _montar_pantalla(vp: SubViewport) -> void:
	var club_id: String = club_del_acto()


	var sin_pantallas: Array[int] = []
	_tab3d = Tablero.new()
	_tab3d.en_tele = true
	_tab3d.theme = TEMA
	_tab3d.size = Vector2(TV_PX)
	_tab3d.montar(team(), "", _season(), [[], [], []], {}, -1, _color_tu(),
		TOPE_FILAS, sin_pantallas)
	vp.add_child(_tab3d)




	_tab = Tablero.new()
	_tab.theme = TEMA
	_tab.size = Vector2(TV_PX)
	_tab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_tab.visible = false
	_tab.montar(team(), club_id, _season(),
		[_filas("venta"), _filas("cesion"), _filas("intocables")], _tu(),
		_tu_bloque(), _color_tu(), TOPE_FILAS, _orden())
	add_child(_tab)





func _orden() -> Array[int]:
	var o: Array[int] = [0, 1, 2]
	var yo: int = _tu_bloque()
	if yo >= 0:
		o.erase(yo)
		o.append(yo)
	return o


func _tick(delta: float) -> void:

	if _calientes > 0:
		_calientes -= 1
		_repintar()
	if t >= T_DIAPO:
		var k: int = mini(int((t - T_DIAPO) / DIAPO), 2)
		if k != _diapo:
			_diapo = k
			_pon_diapo(k)
	if _mat_panel != null and _mat_panel.emission_energy_multiplier > PANEL_REPOSO:
		_mat_panel.emission_energy_multiplier = maxf(PANEL_REPOSO,
			_mat_panel.emission_energy_multiplier - 3.0 * delta)


	if _tab3d != null and is_instance_valid(_tab3d) and _tab3d.tick(t):
		_repintar()
	if _tab != null and is_instance_valid(_tab):
		_tab.tick(t)
		_encaja_tele()
	_respirar()














func _encaja_tele() -> void:
	if t < T_K1 or cam == null:
		_tab.visible = false
		return
	var centro: Vector3 = Vector3(0.0, TV_Y, TV_Z + 0.03)
	var hw: float =(TV_W - 0.03) * 0.5
	var hh: float =(TV_H - 0.03) * 0.5
	var a: Vector2 = cam.unproject_position(centro + Vector3(- hw, hh, 0.0))
	var b: Vector2 = cam.unproject_position(centro + Vector3(hw, - hh, 0.0))
	var r: Rect2 = Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),
		(b - a).abs()).abs()



	r.position += viewport_box.position
	var pos: Vector2 = r.position.round()
	var tam: Vector2 = r.size.round()
	if _tab.position != pos:
		_tab.position = pos






	if absf(_tam_pedido.x - tam.x) > 1.0 or absf(_tam_pedido.y - tam.y) > 1.0:
		_tam_pedido = tam
		_tab.size = tam
	_tab.visible = true





func _pon_diapo(k: int) -> void:
	if _tab == null or not is_instance_valid(_tab):
		return
	_tab.muestra(k, PASO)
	if _mat_panel != null:
		_mat_panel.emission_energy_multiplier = PANEL_GOLPE
	if _orden()[k] == _tu_bloque():
		sting("stinger_bad" if _mala() else "ui_confirm", -10.0)
		shake(0.008, 0.18)
	else:
		sting("ui_pop", -14.0)





func _skipped() -> void:
	if _tab == null or not is_instance_valid(_tab):
		return
	_diapo = 2
	_tab.muestra(2, 0.0)











func _season() -> int:
	return maxi(temporada_del_acto(), 1)






func _filas(lado: String) -> Array:
	var raw: Variant = data.get(lado, [])
	if not (raw is Array):
		return []
	var out: Array = []
	for f in (raw as Array):
		if f is Dictionary:
			out.append(f)
		if out.size() >= TOPE_FILAS:
			break
	return out


func _tu() -> Dictionary:
	var raw: Variant = data.get("tu", {})
	return raw as Dictionary if raw is Dictionary else {}





func _tu_bloque() -> int:
	match String(data.get("tu_lista", "")):
		"venta":
			return 0
		"cesion":
			return 1
		"intocables":
			return 2
	return -1


func _nivel() -> int:
	return clampi(int(_tu().get("nivel", 0)), 0, 3)


func _mala() -> bool:
	return bool(_tu().get("mala", false))






func _color_tu() -> Color:
	if _mala():
		return CareerTheme.DANGER
	return CareerTheme.text_on_dark(CareerTheme.accent_of(team()))












func _stats() -> Array:


	var media: int = 0
	if int(_tu().get("media", 0)) > 0:
		var ficha: Dictionary = Tablero.ficha_mia(_tu())
		media = SquadMeta.ovr_of(ficha, String(ficha["pos"]))
	var yo: int = _tu_bloque()
	var out: Array = [{"v": str(media) if media > 0 else "—", "k": I18n.t("TU MEDIA")}]
	var claves: Array = ["venta", "cesion", "intocables"]
	var rotulos: Array = ["EN VENTA", "PARA CEDER", "INTOCABLES"]
	for i in 3:
		var n: int = mini(_filas(String(claves[i])).size() +(1 if yo == i else 0),
			TOPE_FILAS)
		out.append({"v": str(n), "k": I18n.t(String(rotulos[i]))})
	return out









func _por_que_texto() -> String:
	match String(_tu().get("por_que", "")):
		"sin_muestra":
			return I18n.t("Nadie ha visto todavía lo que haces")
		"gran_temporada":
			return I18n.t("La temporada que hiciste te pone por encima")
		"lealtad":
			return I18n.t("Llevas años aquí y eso pesa")
		"peso_en_el_once":
			return I18n.t("El once no se entiende sin ti")
		"temporada_floja":
			return I18n.t("La temporada que hiciste no te defiende")
		"fuera_del_once":
			return I18n.t("Casi no juegas, y eso se nota en la lista")
		"club_hundido":
			return I18n.t("El club se hundió y hay que hacer caja")
		"club_salvado":
			return I18n.t("El club salvó el año y no necesita vender")
		"precio_alto":
			return I18n.t("Lo que vales hoy es dinero que el club mira")
		_:
			return ""




















class Tablero extends Control:


	const C_FONDO: Color = Color("0a1320")
	const C_BARRA: Color = Color("111c2e")

	const MARGEN_X: float = 24.0


	const SEP_CROMO: float = 28.0

	const PILOTO_MS: float = 0.5



	var en_tele: bool = false
	var _diapos: Array[Control] = []

	var _cromos: Array = []
	var _piloto: ColorRect
	var _piloto_on: bool = true


	var _squad: Array = []
	var _club_id: String = ""


	var _cedidos: Dictionary = {}





	func montar(mi_club: Dictionary, club_id: String, season: int, listas: Array,
			tu: Dictionary, tu_bloque: int, col_tu: Color, max_filas: int,
			orden: Array[int]) -> void:
		_club_id = club_id
		if not club_id.is_empty():
			_squad = Squad.of_nominal(club_id)
			_cedidos = Career.cedidos_de(club_id)

		var fondo: ColorRect = ColorRect.new()
		fondo.color = C_FONDO
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(fondo)

		var col: VBoxContainer = VBoxContainer.new()
		col.set_anchors_preset(Control.PRESET_FULL_RECT)
		col.add_theme_constant_override("separation", 0)
		add_child(col)
		col.add_child(_barra_superior(mi_club))



		var escenario: Control = Control.new()
		escenario.size_flags_vertical = Control.SIZE_EXPAND_FILL
		escenario.clip_contents = true
		col.add_child(escenario)



		var con_tu: bool = tu_bloque >= 0 \
				and not String(tu.get("etiqueta", "")).strip_edges().is_empty()
		var titulos: Array = [I18n.t("EN VENTA"), I18n.t("PARA CEDER"),
			I18n.t("INTOCABLES")]
		var vacios: Array = [I18n.t("Nadie en venta"), I18n.t("Nadie para ceder"),
			I18n.t("Nadie es intocable")]
		for k in orden.size():
			var b: int = orden[k]
			var filas: Array = listas[b] if b < listas.size() else []
			var tuyo: Dictionary = tu if con_tu and b == tu_bloque else {}
			var d: Control = _pantalla(String(titulos[b]), filas, max_filas,
				String(vacios[b]), tuyo, col_tu, mi_club, k, orden.size())
			d.set_anchors_preset(Control.PRESET_FULL_RECT)
			d.visible = false
			escenario.add_child(d)
			_diapos.append(d)

		col.add_child(_barra_inferior(mi_club, season))





	func _pantalla(titulo: String, filas: Array, max_filas: int, vacio: String,
			tu: Dictionary, col_tu: Color, mi_club: Dictionary, k: int,
			total: int) -> Control:
		var m: MarginContainer = MarginContainer.new()
		m.add_theme_constant_override("margin_left", int(MARGEN_X))
		m.add_theme_constant_override("margin_right", int(MARGEN_X))
		m.add_theme_constant_override("margin_top", 12)
		m.add_theme_constant_override("margin_bottom", 12)
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 10)
		m.add_child(v)

		var cab: HBoxContainer = HBoxContainer.new()
		cab.add_theme_constant_override("separation", 16)
		v.add_child(cab)
		var tit: Label = _texto(CareerTheme.caps(titulo), CareerTheme.T_TITLE_MODAL,
			CareerTheme.TEXT)
		tit.clip_text = true
		tit.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		cab.add_child(tit)
		var cuenta: Label = _texto("%d/%d" % [k + 1, total], CareerTheme.T_HEAD,
			CareerTheme.TEXT_DIM)
		cuenta.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		cab.add_child(cuenta)
		var raya: ColorRect = ColorRect.new()
		raya.color = CareerTheme.accent()
		raya.custom_minimum_size = Vector2(0.0, 3.0)
		v.add_child(raya)

		var centro: CenterContainer = CenterContainer.new()
		centro.size_flags_vertical = Control.SIZE_EXPAND_FILL
		v.add_child(centro)
		var nodos: Array = []
		var hay_tu: bool = not tu.is_empty()
		if filas.is_empty() and not hay_tu:
			var l: Label = _texto(CareerTheme.caps(vacio), CareerTheme.T_HEAD,
				CareerTheme.TEXT_MID)
			l.modulate.a = 0.0
			centro.add_child(l)
			nodos.append(l)
		else:
			var fila: HBoxContainer = HBoxContainer.new()
			fila.add_theme_constant_override("separation", int(SEP_CROMO))
			centro.add_child(fila)
			if hay_tu:
				var mio: Control = _mi_cromo(tu, col_tu, mi_club)
				fila.add_child(mio)
				nodos.append(mio)
			for i in mini(filas.size(), max_filas -(1 if hay_tu else 0)):
				var c: Control = _cromo(filas[i] as Dictionary, mi_club)
				fila.add_child(c)
				nodos.append(c)
		_cromos.append(nodos)
		return m









	func _cromo(f: Dictionary, mi_club: Dictionary) -> Control:
		var nombre: String = String(f.get("name", ""))
		var idx: int = -1
		for i in _squad.size():
			if String((_squad[i] as Dictionary).get("name", "")) == nombre:
				idx = i
				break
		var p: Dictionary = _squad[idx] if idx >= 0 else {
			"name": nombre, "pos": String(f.get("pos", "MC")), "number": 0}
		var nat: String = String(p.get("nat", ""))
		if nat.is_empty() and idx >= 0:
			nat = SquadMeta.nation_at(_club_id, Teams.country_of(_club_id), idx,
				String(p.get("pos", "MC")))
		var card: PlayerCard = PlayerCard.build(p, mi_club,
			Nations.id_for_country(nat) if not nat.is_empty() else "", false, false,
			not _club_id.is_empty() and Squad.captain_name(_club_id) == nombre,
			0, -1, false, false, {}, "", idx >= 0 and _cedidos.has(idx))


		card.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		card.modulate.a = 0.0
		return card






	func _mi_cromo(tu: Dictionary, col: Color, mi_club: Dictionary) -> Control:
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 8)
		v.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		v.modulate.a = 0.0







		var p: Dictionary = ficha_mia(tu)
		var card: PlayerCard = PlayerCard.build(p, mi_club,
			Nations.id_for_country(Career.nationality), true, false,
			Career.is_player_captain(), Career.dias_baja(), -1, false, false,
			GameState.player_look())
		card.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		v.add_child(card)
		var etq: Label = _texto(CareerTheme.caps(I18n.t(String(tu.get("etiqueta", "")))),
			CareerTheme.T_CAPTION, col)
		etq.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




		v.add_child(etq)
		return v








	static func ficha_mia(tu: Dictionary) -> Dictionary:
		return {
			"name": String(tu.get("name", Career.player_name)),
			"pos": String(tu.get("pos", Squad.USER_POS)),
			"number": GameState.shirt_number_now(),
			"media": int(tu.get("media", int(round(Career.skills_avg())))),


			"poss": Career.puestos(),
		}




	func _barra_superior(mi_club: Dictionary) -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = C_BARRA
		sb.border_color = CareerTheme.accent()
		sb.border_width_bottom = 3
		sb.content_margin_left = 0.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 0.0
		sb.content_margin_bottom = 0.0
		barra.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 18)
		barra.add_child(fila)

		var rojo: PanelContainer = PanelContainer.new()
		var sr: StyleBoxFlat = StyleBoxFlat.new()
		sr.bg_color = CareerTheme.DANGER
		sr.content_margin_left = 20.0
		sr.content_margin_right = 20.0
		sr.content_margin_top = 12.0
		sr.content_margin_bottom = 12.0
		rojo.add_theme_stylebox_override("panel", sr)
		fila.add_child(rojo)
		var dentro: HBoxContainer = HBoxContainer.new()
		dentro.add_theme_constant_override("separation", 12)
		rojo.add_child(dentro)
		_piloto = ColorRect.new()
		_piloto.color = CareerTheme.TEXT
		_piloto.custom_minimum_size = Vector2(14, 14)
		_piloto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		dentro.add_child(_piloto)
		dentro.add_child(_texto(CareerTheme.caps(I18n.t("ÚLTIMA HORA")),
			CareerTheme.T_HEAD, CareerTheme.TEXT))

		var titulo: Label = _texto(CareerTheme.caps(I18n.t("SE ABRE EL MERCADO")),
			CareerTheme.T_HEAD, CareerTheme.TEXT)
		titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		titulo.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		titulo.clip_text = true
		fila.add_child(titulo)
		if not mi_club.is_empty():
			var esc: CrestView = CrestView.new()
			esc.custom_minimum_size = Vector2(38, 38)
			esc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
			esc.set_team(mi_club)
			fila.add_child(esc)
		return barra




	func _barra_inferior(mi_club: Dictionary, season: int) -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = C_BARRA
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 8.0
		sb.content_margin_bottom = 8.0
		barra.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 20)
		barra.add_child(fila)
		var izq: Label = _texto(I18n.tf("{0} · TEMPORADA {1}",
			[I18n.t("MERCADO DE VERANO"), season]), CareerTheme.T_CAPTION,
			CareerTheme.TEXT_DIM)
		fila.add_child(izq)
		var der: Label = _texto(CareerTheme.caps(String(mi_club.get("name", ""))),
			CareerTheme.T_CAPTION, CareerTheme.TEXT)
		der.clip_text = true
		der.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		der.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		fila.add_child(der)
		return barra




	func muestra(k: int, paso: float) -> void:
		for i in _diapos.size():
			_diapos[i].visible = i == k
		if k < 0 or k >= _cromos.size():
			return
		var nodos: Array = _cromos[k]
		for j in nodos.size():
			var nodo: Control = nodos[j]
			if nodo == null or not is_instance_valid(nodo):
				continue
			if paso <= 0.0 or j == 0:
				nodo.modulate.a = 1.0
				continue


			var tw: Tween = create_tween()
			tw.tween_interval(paso * float(j))
			tw.tween_property(nodo, "modulate:a", 1.0, 0.18)
			tw.tween_callback(_pide_cuadro)






	func tick(t: float) -> bool:
		if _piloto == null:
			return false
		var on: bool = int(t / PILOTO_MS) % 2 == 0
		if on == _piloto_on:
			return false
		_piloto_on = on
		_piloto.modulate.a = 1.0 if on else 0.25
		return true










	func _pide_cuadro() -> void:
		if not en_tele:
			return
		var vp: Viewport = get_viewport()
		if vp is SubViewport:
			(vp as SubViewport).render_target_update_mode = SubViewport.UPDATE_ONCE


	func _texto(txt: String, px: int, col: Color) -> Label:
		var l: Label = CareerUi.plain(px, col)
		l.text = txt
		return l
