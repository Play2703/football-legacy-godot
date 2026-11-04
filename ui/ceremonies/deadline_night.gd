extends Ceremony























































const T_PUJAS: Array[float] = [2.2, 3.5, 4.8, 6.0]
const T_CIERRE: float = 7.5
const T_CARD: float = 8.3
const T_CHYRON: float = 1.0
const MAX_FILAS: int = 4



const T_PUJAS_J: Array[float] = [0.9, 1.6, 2.3, 3.0]
const T_FIN_J: float = 4.6
const T_CHYRON_J: float = 0.5








const TV_W: float = 2.45
const TV_H: float = TV_W * 0.5625
const TV_Z: float = -1.25




const TV_Y: float = 2.9



const TV_PX: Vector2i = Vector2i(1024, 576)

const MESA_Y: float = 1.06
const MESA_Z: float = 1.32
const HOST_Z: float = 0.35



const HOST_X: float = 0.7

const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"
const COACH_SHEET: String = "res://assets/sprites/anim/coach_south_"



const GALA_ART: String = "res://assets/sprites/anim/gala_south_00.png"
const COACH_ART: String = "res://assets/sprites/anim/coach_south_00.png"

const TEMA: Theme = preload("res://ui/theme/theme.tres")

const KEYS: Array = [



	{"t": 0.0, "dist": 7.6, "h": 2.45, "yaw": 183.0, "aim_y": 2.25, "fov": 36.0,
		"focus_x": 0.0, "focus_z": 0.35},





	{"t": 2.6, "dist": 7.0, "h": 2.9, "yaw": 180.0, "aim_y": 2.75, "fov": 35.0,
		"focus_x": 0.0, "focus_z": TV_Z + 0.9},



	{"t": 6.3, "dist": 8.0, "h": 2.35, "yaw": 176.0, "aim_y": 2.35, "fov": 38.0,
		"focus_x": 0.0, "focus_z": 0.2},
]



const KEYS_J: Array = [
	{"t": 0.0, "dist": 8.0, "h": 2.45, "yaw": 181.0, "aim_y": 2.35, "fov": 37.0,
		"focus_x": 0.0, "focus_z": 0.35},
	{"t": 3.4, "dist": 7.0, "h": 2.85, "yaw": 179.0, "aim_y": 2.72, "fov": 35.0,
		"focus_x": 0.0, "focus_z": TV_Z + 0.9},
]

const DRIFT: float = 0.5

var _board: Board
var _pujas: Array = []
var _puja_i: int = -1
var _cerrado: bool = false
var _hosts: Array[AnimatedSprite3D] = []
var _host_y0: Array[float] = []
var _mat_panel: StandardMaterial3D
var _tv_vp: SubViewport




func _es_cierre() -> bool:
	return bool(data.get("cierre", true))




func _accent_for() -> Color:
	return CareerTheme.MONEY


func _build() -> void:
	_pujas = _leer_pujas()
	focus = Vector3(0.0, 0.0, 0.35)
	_mundo_de_plato()
	_build_set()
	_build_tv()
	_build_hosts()

	make_camera(KEYS if _es_cierre() else KEYS_J, 38.0)
	orbit_speed = DRIFT
	make_audio(0.0, false)

	make_chyron(I18n.t("CIERRA EL MERCADO") if _es_cierre()
			else I18n.t("MERCADO ABIERTO"),
		team_name("?").to_upper(), team(),
		T_CHYRON if _es_cierre() else T_CHYRON_J)
	if not _es_cierre():


		card_at = 0.0
		return
	make_card(T_CARD)
	if _gana():
		card_title(I18n.t("TE VAS"), 40)
		card_sub(Nations.team_label(_club_final(), "?").to_upper(), CareerTheme.MONEY)
	else:
		card_title(I18n.t("TE QUEDAS"), 40)
		card_sub(team_name("?").to_upper())
	card_stats(_stats())
	card_note(_note_line())
	card_cta(I18n.t("SEGUIR"))





func _mundo_de_plato() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("06080d")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("9fb0cc")
	e.ambient_light_energy = 0.66
	viewport.add_child(env)
	env.environment = e






	_omni(Vector3(0.0, 3.1, 1.7), Color("fff2d8"), 5.4, 4.6)
	_omni(Vector3(0.0, 1.9, 2.3), accent, 3.4, 5.5)


func _omni(pos: Vector3, col: Color, energia: float, rango: float) -> void:
	var l: OmniLight3D = OmniLight3D.new()
	l.position = pos
	l.light_color = col
	l.light_energy = energia
	l.omni_range = rango
	l.shadow_enabled = false
	viewport.add_child(l)




func _build_set() -> void:











	_caja(Vector3(0.0, -0.05, 0.0), Vector3(34.0, 0.1, 34.0), Color("0d1017"), 0.35)




	_caja(Vector3(0.0, 3.85, TV_Z - 0.55), Vector3(30.0, 8.3, 0.3),
		Color("0c111c"), 0.85)




	for i in 27:
		var x: float = -11.7 + float(i) * 0.9
		_caja(Vector3(x, 2.6, TV_Z - 0.38), Vector3(0.1, 5.2, 0.1),
			Color("1a2434"), 0.75)






	for par: Array in [[2.05, 1.5, 0.0], [5.6, 1.0, 0.35]]:
		var tono: Color = accent.darkened(float(par[2]))
		for lado: float in [-1.0, 1.0]:
			var col: MeshInstance3D = _caja(
				Vector3(lado * float(par[0]), 2.1, TV_Z - 0.12),
				Vector3(0.13, 4.1, 0.13), tono, 0.6)
			_emitir(col, tono, float(par[1]))
	_build_parrilla()
	_build_mesa()





func _build_parrilla() -> void:






	_caja(Vector3(0.0, 4.2, 0.6), Vector3(26.0, 0.1, 0.1), Color("1b2230"), 0.9)
	for i in 10:
		var x: float = -5.85 + float(i) * 1.3
		var foco: MeshInstance3D = _caja(Vector3(x, 4.02, 0.6),
			Vector3(0.24, 0.26, 0.24), Color("2a323f"), 0.8)
		_emitir(foco, Color("ffe9bd"), 0.7)











func _build_mesa() -> void:




	_caja(Vector3(0.0, MESA_Y, MESA_Z), Vector3(2.7, 0.1, 0.78),
		Color("2a3546"), 0.45)
	_caja(Vector3(0.0, MESA_Y * 0.5, MESA_Z + 0.3),
		Vector3(2.5, MESA_Y, 0.16), Color("121a26"), 0.7)
	var franja: MeshInstance3D = _caja(Vector3(0.0, 0.8, MESA_Z + 0.39),
		Vector3(2.5, 0.07, 0.03), accent, 0.5)
	_emitir(franja, accent, 2.6)















func _build_tv() -> void:


	_caja(Vector3(0.0, TV_Y, TV_Z - 0.26), Vector3(0.44, 0.44, 0.12),
		Color("161c28"), 0.8)
	_caja(Vector3(0.0, TV_Y, TV_Z - 0.14), Vector3(0.12, 0.12, 0.16),
		Color("1e2634"), 0.7)

	_caja(Vector3(0.0, TV_Y, TV_Z - 0.04),
		Vector3(TV_W + 0.1, TV_H + 0.1, 0.09), Color("15181f"), 0.55)


	var panel: MeshInstance3D = _caja(Vector3(0.0, TV_Y, TV_Z + 0.005),
		Vector3(TV_W, TV_H, 0.02), Color("0c1626"), 1.0)
	_mat_panel =(panel.mesh as PrimitiveMesh).material
	_mat_panel.emission_enabled = true
	_mat_panel.emission = Color("0c1626")
	_mat_panel.emission_energy_multiplier = 1.4
	_mat_panel.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED










	var vp: SubViewport = SubViewport.new()
	vp.size = TV_PX
	vp.disable_3d = true
	vp.transparent_bg = false
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	_tv_vp = vp
	add_child(vp)
	_montar_pantalla(vp)

	var img: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(TV_W - 0.03, TV_H - 0.03)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED



	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR

	mat.emission_enabled = true
	mat.emission_texture = vp.get_texture()
	mat.emission = Color(1, 1, 1)
	mat.emission_energy_multiplier = 0.45
	img.mesh = qm
	img.material_override = mat
	img.position = Vector3(0.0, TV_Y, TV_Z + 0.03)
	viewport.add_child(img)



	var barra: MeshInstance3D = _caja(
		Vector3(0.0, TV_Y - TV_H * 0.5 - 0.07, TV_Z + 0.02),
		Vector3(TV_W * 0.45, 0.03, 0.03), Color("58c8e8"), 1.0)
	_emitir(barra, Color("58c8e8"), 2.2)









func _montar_pantalla(vp: SubViewport) -> void:
	_board = Board.new()
	_board.theme = TEMA




	_board.size = Vector2(TV_PX)
	_board.montar(team(), _valor(), _asking(), _pujas, MAX_FILAS,
		-1 if _es_cierre() else maxi(int(data.get("quedan", 1)), 0),
		data.get("estado", {}), data.get("partes", []))
	vp.add_child(_board)




func _build_hosts() -> void:
	_hosts.append(_persona(GALA_SHEET, - HOST_X, {
		"hair": Color(0.16, 0.13, 0.12),
		"hair_style": "part",
	}, GALA_ART))
	_hosts.append(_persona(COACH_SHEET, HOST_X, {
		"hair": Color(0.74, 0.7, 0.64),
		"hair_style": "entradas",
		"facial_hair": "beard",
	}, COACH_ART))
	for h in _hosts:
		_host_y0.append(h.position.y if h != null else 0.0)




func _persona(sheet: String, x: float, look: Dictionary,
		art: String) -> AnimatedSprite3D:
	var frames: SpriteFrames = player_frames(look, "south", sheet, true)
	if frames.get_frame_count("idle") == 0:
		return null
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(x, feet_offset(spr.pixel_size, art) - PLAYER_SINK, HOST_Z)
	viewport.add_child(spr)
	spr.play("idle")
	return spr





func _repintar() -> void:
	if _tv_vp != null and is_instance_valid(_tv_vp):
		_tv_vp.render_target_update_mode = SubViewport.UPDATE_ONCE


func _caja(pos: Vector3, size: Vector3, col: Color,
		rug: float = 0.7) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rug
	bm.material = m
	mi.mesh = bm
	mi.position = pos
	viewport.add_child(mi)
	return mi


func _emitir(mi: MeshInstance3D, col: Color, energia: float) -> void:
	var m: StandardMaterial3D =(mi.mesh as PrimitiveMesh).material
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = energia
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED


func _tick(delta: float) -> void:


	var pasos: Array[float] = T_PUJAS if _es_cierre() else T_PUJAS_J
	for i in pasos.size():
		if _puja_i < i and t >= pasos[i] and i < MAX_FILAS and i < _pujas.size():
			_puja_i = i
			_board.revelar(i)
			_repintar()
			_mat_panel.emission_energy_multiplier = 2.4
			shake(0.01, 0.2)
			sting("ui_pop", -11.0)
	if _mat_panel.emission_energy_multiplier > 1.4:
		_mat_panel.emission_energy_multiplier = maxf(
			1.4, _mat_panel.emission_energy_multiplier - 3.0 * delta)
	if _board.tick(t, _cerrado):
		_repintar()
	_respirar()
	if not _es_cierre():


		if t >= T_FIN_J:
			_leave()
		return
	if not _cerrado and t >= T_CIERRE:
		_cerrar()





func _respirar() -> void:
	for i in _hosts.size():
		var h: AnimatedSprite3D = _hosts[i]
		if h == null or not is_instance_valid(h):
			continue
		h.position.y = _host_y0[i] + sin(t * 1.6 + float(i) * PI) * 0.008






func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["stinger_bad"])




func _cerrar() -> void:
	_cerrado = true
	for i in mini(_pujas.size(), MAX_FILAS):
		_board.revelar(i)
	_board.cerrar(_gana(), _id_ganador())
	_repintar()
	if _gana():
		_mat_panel.emission = CareerTheme.MONEY.darkened(0.62)
		_mat_panel.emission_energy_multiplier = 2.2
		screen_flash(0.14)
		sting("fanfare", -8.0)
	else:
		_mat_panel.emission = Color("0a0c11")
		_mat_panel.emission_energy_multiplier = 0.8
		sting("stinger_bad", -10.0)


func _skipped() -> void:
	if not _es_cierre():
		for i in mini(_pujas.size(), MAX_FILAS):
			_board.revelar(i)
		_repintar()
		return
	if not _cerrado:
		_cerrar()




func _id_ganador() -> String:
	var dest: String = String(data.get("to", ""))
	if not dest.is_empty():
		return dest
	var mejor: String = ""
	var top: int = -1
	for p in _pujas:
		if int(p.get("fee", 0)) > top:
			top = int(p.get("fee", 0))
			mejor = String(p.get("id", ""))
	return mejor






func _leer_pujas() -> Array:
	var dadas: Array = data.get("bids", [])
	if dadas is Array and (dadas as Array).size() > 0:
		return dadas
	var fin: int = maxi(int(data.get("fee", 0)), 0)
	if fin <= 0:
		return []
	var out: Array = []
	var pasos: Array[float] = [0.62, 0.78, 0.91, 1.0]
	for i in pasos.size():
		out.append({"abbrev": String(data.get("abbrev", "")),
			"id": String(data.get("to", "")),
			"fee": int(float(fin) * pasos[i])})
	return out





func _valor() -> int:
	var v: int = int(data.get("value", 0))
	return v if v > 0 else Career.market_value()


func _asking() -> int:
	return maxi(int(data.get("asking", 0)), 0)


func _gana() -> bool:
	return not String(data.get("to", "")).is_empty()


func _club_final() -> Dictionary:
	var t_dest: Dictionary = Teams.by_id(String(data.get("to", "")))
	return t_dest if not t_dest.is_empty() else team()





func _stats() -> Array:
	var pujantes: int = maxi(int(data.get("suitors", _pujas.size())), 0)
	var top: int = maxi(int(data.get("fee", 0)), 0)
	var piden: int = _asking()
	return [
		{"v": str(pujantes) if pujantes > 0 else "—", "k": I18n.t("ofertas")},


		{"v": CareerUi.short_money(top) if top > 0 else "—", "k": I18n.t("la mejor")},
		{"v": CareerUi.short_money(piden) if piden > 0 else "—", "k": I18n.t("pedían")},
	]


func _note_line() -> String:
	if _gana():
		return I18n.t("Acordado en el último minuto.")



	var estado: Dictionary = data.get("estado", {})
	if String(estado.get("estado", "")) == "TU CLUB TE RETIENE":
		return I18n.t(String(estado.get("nota", "No te dejan salir: pide el traspaso primero.")))
	if int(data.get("fee", 0)) > 0:
		return I18n.t("Nadie llegó a lo que pedía tu club.")
	return I18n.t("Se cerró la ventana y no llamó nadie.")























class Board extends Control:
	const FILA_H: float = 74.0

	const PILOTO_MS: float = 0.5

	var _filas: Array = []
	var _piloto: ColorRect
	var _live: Label
	var _ticker: Label
	var _espera: Label

	var _estado: Dictionary = {}
	var _asking: int = 0
	var _valor: int = 0


	var _partes: Array = []


	var _quedan: int = -1
	var _tope: int = 1
	var _cerrado: bool = false
	var _piloto_on: bool = true



	func montar(mi_club: Dictionary, valor: int, piden: int, pujas: Array,
			max_filas: int, quedan: int = -1, estado: Dictionary = {},
			partes: Array = []) -> void:
		_asking = piden
		_valor = valor
		_partes = partes
		_quedan = quedan
		_estado = estado



		_tope = maxi(piden, 1)
		for p in pujas:
			_tope = maxi(_tope, int(p.get("fee", 0)))
		var fondo: ColorRect = ColorRect.new()
		fondo.color = Color("0a1320")
		fondo.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(fondo)

		var col: VBoxContainer = VBoxContainer.new()
		col.set_anchors_preset(Control.PRESET_FULL_RECT)
		col.add_theme_constant_override("separation", 0)
		add_child(col)
		col.add_child(_barra_superior(mi_club))






		if not _estado.is_empty():
			col.add_child(_barra_estado())

		var cuerpo: HBoxContainer = HBoxContainer.new()
		cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
		cuerpo.add_theme_constant_override("separation", 0)
		col.add_child(cuerpo)






		if not _estado.is_empty():
			cuerpo.add_child(_panel_retrato(mi_club))
		cuerpo.add_child(_panel_ofertas(pujas, max_filas))
		col.add_child(_barra_inferior())



	func _barra_superior(mi_club: Dictionary) -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color("111c2e")
		sb.border_color = CareerTheme.accent()
		sb.border_width_bottom = 3
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 12.0
		sb.content_margin_bottom = 12.0
		barra.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 14)
		barra.add_child(fila)
		_piloto = ColorRect.new()
		_piloto.color = CareerTheme.DANGER
		_piloto.custom_minimum_size = Vector2(18, 18)
		_piloto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		fila.add_child(_piloto)
		_live = _texto(I18n.t("EN VIVO"), CareerTheme.T_HEAD, CareerTheme.TEXT)
		fila.add_child(_live)



		var titulo: Label = _texto(
			_con_fecha(I18n.t("CIERRA EL MERCADO")) if _quedan < 0
				else _cuenta_atras(),
			CareerTheme.T_HEAD,
			CareerTheme.TEXT_DIM if _quedan < 0 else CareerTheme.MONEY)
		titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		titulo.clip_text = true
		fila.add_child(titulo)
		var esc: CrestView = CrestView.new()
		esc.custom_minimum_size = Vector2(38, 38)
		esc.set_team(mi_club)
		fila.add_child(esc)






		var caja: VBoxContainer = VBoxContainer.new()
		caja.add_theme_constant_override("separation", 0)
		barra.remove_child(fila)
		caja.add_child(fila)
		caja.add_child(_cifras_cabecera())
		barra.add_child(caja)
		return barra


	func _cifras_cabecera() -> Control:
		var fila: HBoxContainer = HBoxContainer.new()


		fila.add_theme_constant_override("separation", 34)
		var hueco: Control = Control.new()
		hueco.custom_minimum_size = Vector2(0, 6)
		fila.add_child(hueco)
		fila.add_child(_par(I18n.t("VALOR"), _corto(_valor), CareerTheme.MONEY))
		fila.add_child(_par(I18n.t("PIDEN"), _corto(_asking), CareerTheme.TEXT))
		var relleno: Control = Control.new()
		relleno.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(relleno)
		return fila


	func _par(cap: String, val: String, col: Color) -> Control:
		var h: HBoxContainer = HBoxContainer.new()
		h.add_theme_constant_override("separation", 12)
		h.add_child(_texto(cap, CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM))
		h.add_child(_texto(val, CareerTheme.T_MONEY, col))
		return h





	func _barra_estado() -> Control:
		var urgente: bool = bool(_estado.get("urgente", false))
		var col: Color = CareerTheme.DANGER if urgente else CareerTheme.TEXT
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color(col.r, col.g, col.b, 0.16 if urgente else 0.08)
		sb.border_color = col
		sb.border_width_left = 6
		sb.content_margin_left = 16.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 6.0
		sb.content_margin_bottom = 6.0
		barra.add_theme_stylebox_override("panel", sb)
		var fila: HBoxContainer = HBoxContainer.new()
		fila.add_theme_constant_override("separation", 16)
		barra.add_child(fila)
		var texto: Label = _texto(
			CareerTheme.caps(I18n.t(String(_estado.get("estado", "")))),
			CareerTheme.T_HEAD, col)



		texto.clip_text = true
		texto.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		fila.add_child(texto)
		return barra


























	func _retrato(mi_club: Dictionary) -> Control:
		var caja: Control = Control.new()
		caja.custom_minimum_size = Vector2(186, 246)
		caja.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
		var av: PlayerAvatar = PlayerAvatar.new()
		av.set_anchors_preset(Control.PRESET_FULL_RECT)
		av.mouse_filter = Control.MOUSE_FILTER_IGNORE



		var base: Dictionary = mi_club.duplicate() if not mi_club.is_empty() \
				else Teams.free_team()
		base["number"] = 0
		av.club = base



		av.bust = PlayerAvatar.BUST_TORSO
		av.set_look(GameState.player_look())
		caja.add_child(av)
		return caja





	func _panel_retrato(mi_club: Dictionary) -> Control:
		var caja: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color("0d1a2b")
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 16.0
		sb.content_margin_bottom = 16.0
		caja.add_theme_stylebox_override("panel", sb)
		caja.custom_minimum_size = Vector2(230, 0)
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 8)
		caja.add_child(v)
		v.add_child(_retrato(mi_club))
		return caja



	func _panel_ofertas(pujas: Array, max_filas: int) -> Control:
		var caja: MarginContainer = MarginContainer.new()
		caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		caja.add_theme_constant_override("margin_left", 22)
		caja.add_theme_constant_override("margin_right", 22)
		caja.add_theme_constant_override("margin_top", 14)
		caja.add_theme_constant_override("margin_bottom", 10)
		var v: VBoxContainer = VBoxContainer.new()
		v.add_theme_constant_override("separation", 6)
		caja.add_child(v)
		v.add_child(_texto(I18n.t("ofertas").to_upper(), CareerTheme.T_DIM,
			CareerTheme.TEXT_DIM))



		_espera = _texto(I18n.t("ESPERANDO OFERTAS"), CareerTheme.T_BODY,
			CareerTheme.TEXT_DIM)
		v.add_child(_espera)
		for i in mini(pujas.size(), max_filas):
			var f: Dictionary = _fila(pujas[i])
			v.add_child(f["nodo"])
			_filas.append(f)
		return caja


	func _fila(puja: Dictionary) -> Dictionary:
		var id: String = String(puja.get("id", ""))
		var equipo: Dictionary = Teams.by_id(id) if not id.is_empty() else {}
		var fee: int = int(puja.get("fee", 0))
		var caja: VBoxContainer = VBoxContainer.new()
		caja.custom_minimum_size = Vector2(0, FILA_H)
		caja.add_theme_constant_override("separation", 4)
		caja.modulate.a = 0.0
		var arriba: HBoxContainer = HBoxContainer.new()
		arriba.add_theme_constant_override("separation", 12)
		caja.add_child(arriba)




		if not equipo.is_empty():
			var esc: CrestView = CrestView.new()
			esc.custom_minimum_size = Vector2(34, 34)
			esc.set_team(equipo)
			arriba.add_child(esc)
		var nombre: Label = _texto(CareerTheme.caps(String(equipo.get("name",
			String(puja.get("abbrev", "?"))))), CareerTheme.T_CARD,
			CareerTheme.TEXT)


		nombre.clip_text = true
		nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		arriba.add_child(nombre)









		var rumor: bool = bool(puja.get("rumor", false)) or fee <= 0



		var mate: String = String(puja.get("mate", ""))
		var cifra: Label = _texto(
			(I18n.t("TU VESTUARIO") if not mate.is_empty() else I18n.t("INTERESADO")) \
					if rumor else _corto(fee),
			CareerTheme.T_CAPTION if rumor else CareerTheme.T_BODY,
			CareerTheme.TEXT_DIM if rumor else CareerTheme.MONEY)
		cifra.custom_minimum_size = Vector2(132, 0)
		cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		arriba.add_child(cifra)





		var nota: String = _nota_de(puja, id, rumor)
		if not nota.is_empty():



			var l: Label = _texto(nota, CareerTheme.T_CAPTION,
				CareerTheme.TEXT)
			l.clip_text = true
			caja.add_child(l)
		var fill: ColorRect = CareerUi.bar(caja, CareerTheme.MONEY.darkened(0.15))
		CareerUi.set_bar(fill, 0.0 if rumor else float(fee) / float(_tope))









		var asking_fila: int = int(puja.get("asking", _asking))
		if asking_fila > 0:
			CareerUi.bar_mark(fill, float(asking_fila) / float(_tope),
				CareerTheme.TEXT, 5.0)
		return {"nodo": caja, "cifra": cifra, "nombre": nombre, "id": id,
			"fee": fee}




	func _nota_de(puja: Dictionary, id: String, rumor: bool) -> String:
		var fee: int = int(puja.get("fee", 0))


		var mate: String = String(puja.get("mate", ""))
		if not mate.is_empty():


			return I18n.t("SE LLEVAN A {0}").format([CareerTheme.caps(_apellido(mate))])
		if rumor:
			return I18n.t("SOLO PREGUNTA")
		for e: Dictionary in _partes:
			if String(e.get("id", "")) == id:
				return I18n.t(String(e.get("tag", ""))).to_upper()














		var asking_fila: int = int(puja.get("asking", _asking))
		if asking_fila > 0 and fee > 0 and fee < asking_fila:
			return I18n.t("LES FALTAN {0}").format([_corto(asking_fila - fee)])
		return ""




	func _apellido(full: String) -> String:
		var parts: PackedStringArray = full.strip_edges().split(" ", false)
		return String(parts[parts.size() - 1]) if parts.size() > 0 else full



	func _barra_inferior() -> Control:
		var barra: PanelContainer = PanelContainer.new()
		var sb: StyleBoxFlat = StyleBoxFlat.new()
		sb.bg_color = Color("111c2e")
		sb.content_margin_left = 20.0
		sb.content_margin_right = 20.0
		sb.content_margin_top = 8.0
		sb.content_margin_bottom = 8.0
		barra.add_theme_stylebox_override("panel", sb)




		_ticker = _texto(_teletipo(), CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		_ticker.clip_text = true
		barra.add_child(_ticker)
		return barra











	static func _corto(v: int) -> String:
		if v <= 0:
			return "—"
		if v >= 1000000:
			var m: float = float(v) / 1000000.0
			return I18n.num(m, 0 if m >= 100.0 else 1) + " M"
		return I18n.num(float(v) / 1000.0) + " K"













	func _cuenta_atras() -> String:
		var base: String = I18n.t("ULTIMA JORNADA") if _quedan <= 1 \
				else I18n.t("QUEDAN {0}").format([_quedan])
		return _con_fecha(base)



	func _con_fecha(base: String) -> String:
		var f: Dictionary = Market.fecha_de_jornada(GameState.season_day,
			GameState.winter_day(), GameState.calendar.size())
		var txt: String = CareerUi.fecha_corta(int(f["dia"]), int(f["mes"]))
		return base if txt.is_empty() else "%s · %s" % [base, txt]

	func _teletipo() -> String:



		var nota: String = String(_estado.get("nota", ""))
		if not nota.is_empty():
			return I18n.t(nota)
		if _quedan < 0:
			return I18n.t("La ventana cierra esta noche.")
		if _quedan <= 1:
			return I18n.t("Ultima jornada: mañana ya no hay mercado.")
		return I18n.t("Quedan {0} jornadas de mercado.").format([_quedan])

	func _texto(txt: String, px: int, col: Color) -> Label:
		var l: Label = Label.new()
		l.text = txt
		l.add_theme_font_size_override("font_size", px)
		l.add_theme_color_override("font_color", col)
		return l

	func revelar(i: int) -> void:
		if i < 0 or i >= _filas.size():
			return
		if _espera != null:
			_espera.visible = false
		var nodo: Control = _filas[i]["nodo"]
		nodo.modulate.a = 1.0









	func tick(t: float, cerrado: bool) -> bool:
		if cerrado or _piloto == null:
			return false
		var on: bool = int(t / PILOTO_MS) % 2 == 0
		if on == _piloto_on:
			return false
		_piloto_on = on
		_piloto.modulate.a = 1.0 if on else 0.3
		return true




	func cerrar(gana: bool, id_ganador: String) -> void:
		_cerrado = true
		_live.text = I18n.t("CERRADO")
		_piloto.modulate.a = 1.0
		if gana:
			_live.add_theme_color_override("font_color", CareerTheme.MONEY)
			_piloto.color = CareerTheme.MONEY
			_ticker.text = I18n.t("Acordado en el último minuto.")
		else:
			_live.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
			_piloto.color = CareerTheme.SURFACE_LINE
			_ticker.text = I18n.t("Se cerró la ventana.")
		for f: Dictionary in _filas:
			var nodo: Control = f["nodo"]
			var suya: bool = gana and String(f.get("id", "")) == id_ganador


			nodo.modulate.a = 1.0 if suya else 0.7
			if suya:
				var nombre: Label = f["nombre"]
				nombre.add_theme_color_override("font_color", CareerTheme.MONEY)
