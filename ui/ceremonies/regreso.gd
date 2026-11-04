extends Ceremony






























const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"




const SUELO: Color = Color("15171c")
const MURO: Color = Color("1c2029")
const FONDO: Color = Color("0b0d11")




const ESCUDO_M: float = 2.2
const ESCUDO_Y: float = 2.18
const ESCUDO_Z: float = -2.55



const ESCUDO_ALFA: float = 0.52
const MURO_Z: float = -2.8




const JERSEY_M: float = 0.98
const JERSEY_Y: float = 0.74
















const KEYS: Array = [
	{"t": 0.0, "dist": 8.6, "h": 2.05, "yaw": 180.0, "aim_y": 1.48, "fov": 34.0},
	{"t": 2.6, "dist": 8.0, "h": 1.95, "yaw": 176.0, "aim_y": 1.45, "fov": 33.0},
]
const DRIFT: float = -0.18
const T_CHYRON: float = 1.0
const T_CARD: float = 2.4

var _sel: int = 0
var _filas: Array[Button] = []
var _jersey: Sprite3D
var _escudo: CrestView
var _ajustado: bool = false

var _ucl: Dictionary = {}
var _eul: Dictionary = {}
var _conf: Dictionary = {}

var _amer: Dictionary = {}






func _accent_for() -> Color:
	return CareerTheme.MONEY


func _ofertas() -> Array:
	var de_data: Array = data.get("ofertas", []) as Array
	return de_data if not de_data.is_empty() else Career.pending_offers


func _build() -> void:
	_campos_europeos()
	_tarima()
	focus = Vector3.ZERO
	make_camera(KEYS, 34.0)
	orbit_speed = DRIFT



	make_player(GameState.team_custom, "south", GALA_SHEET, true)
	if player != null:
		player.position.y = feet_offset(player.pixel_size, GALA_SHEET + "00.png") \
				- PLAYER_SINK
	_escudo_fondo()
	_playera()
	_ficha()







	_elige(int(data.get("sel", 0)))





func _tarima() -> void:
	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = FONDO
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("cfd6e6")
	e.ambient_light_energy = 0.7
	viewport.add_child(env)
	env.environment = e
	var luz: DirectionalLight3D = DirectionalLight3D.new()
	luz.light_color = Color("fff2da")
	luz.light_energy = 1.1
	luz.rotation_degrees = Vector3(-58.0, 12.0, 0.0)
	viewport.add_child(luz)
	_caja(Vector3(0.0, -0.5, 0.0), Vector3(24.0, 1.0, 24.0), SUELO)
	_caja(Vector3(0.0, 2.6, MURO_Z - 0.1), Vector3(24.0, 5.2, 0.2), MURO)



	_caja(Vector3(0.0, 0.014, 0.1), Vector3(2.6, 0.02, 1.9),
		Color("2b3040"), 0.35)






func _escudo_fondo() -> void:
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(512, 512)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	vp.disable_3d = true
	add_child(vp)
	_escudo = CrestView.new()
	_escudo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_escudo.custom_minimum_size = Vector2(512, 512)
	vp.add_child(_escudo)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = vp.get_texture()
	spr.pixel_size = ESCUDO_M / 512.0



	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD






	spr.modulate = Color(ESCUDO_ALFA, ESCUDO_ALFA, ESCUDO_ALFA, 1.0)
	spr.position = Vector3(0.0, ESCUDO_Y, ESCUDO_Z)
	viewport.add_child(spr)






func _playera() -> void:
	_jersey = make_jersey({}, 0, JERSEY_M, JERSEY_Y)



	_jersey.billboard = BaseMaterial3D.BILLBOARD_DISABLED


func _ficha() -> void:
	make_chyron(I18n.t("TE QUIEREN DE VUELTA"),
		CareerTheme.caps(Career.player_name), {}, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("¿CON QUIÉN VUELVES?"), 40)
	var ofertas: Array = _ofertas()
	if ofertas.is_empty():



		var v: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT_MID)
		v.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		v.text = I18n.t("No llamó nadie. El teléfono de un retirado de tu edad "
			+ "suena poco, y ese silencio también es una respuesta.")
		card_box.add_child(v)
		_boton(I18n.t("VOLVER AL MUSEO"), CareerTheme.Kind.GHOST,
			func() -> void: SceneFade.to_scene("res://ui/house/museo.tscn"))
		return
	for i in ofertas.size():
		_filas.append(_fila(i, ofertas[i] as Dictionary))




	var b: Button = Button.new()
	b.text = I18n.t("FIRMAR Y VOLVER")
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
	b.clip_text = true
	CareerTheme.apply_button_accent(b, CareerTheme.MONEY, CareerTheme.T_BODY)
	b.pressed.connect(_firma)
	card_box.add_child(b)



func _boton(texto: String, kind: CareerTheme.Kind, al_tocar: Callable) -> Button:
	var b: Button = Button.new()
	b.text = texto
	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_SECONDARY_H)
	b.clip_text = true
	CareerTheme.apply_button(b, kind, CareerTheme.T_BODY)
	b.pressed.connect(al_tocar)
	card_box.add_child(b)
	return b








func _fila(i: int, of: Dictionary) -> Button:
	var crest: CrestView = CrestView.new()
	crest.custom_minimum_size = Vector2(48, 48)
	crest.set_team(Teams.by_id(String(of.get("id", ""))))
	var b: Button = CareerUi.menu_row(Market.club_name(of, ""),
		CareerUi.money(int(of.get("wage", 0))), CareerTheme.MONEY, "",
		crest, _nota(of))




	b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	b.pressed.connect(func() -> void: _elige(i))
	card_box.add_child(b)
	return b







func _nota(of: Dictionary) -> String:
	var t: String = _torneos(String(of.get("id", "")))



	var ex_v: Variant = of.get("ex", false)
	var ex_ok: bool =(ex_v is bool and bool(ex_v)) \
			or (ex_v is Dictionary and not (ex_v as Dictionary).is_empty())
	if ex_ok:
		return I18n.t("JUGASTE AQUÍ") + " · " + t
	return t







func _campos_europeos() -> void:
	_ucl = _ids(GameState.ucl_field(GameState.UCL_FIELD))
	_eul = _ids(GameState.eul_field(GameState.EUL_FIELD))
	_conf = _ids(GameState.conf_field(GameState.CONF_FIELD))





	for c in Continental.AMER_COMPS:
		var en_copa: Dictionary = {}
		for id in GameState.amer_field(c):
			en_copa[String(id)] = true
		_amer[c] = en_copa


func _ids(field: Array) -> Dictionary:
	var out: Dictionary = {}
	for t in field:
		out[String((t as Dictionary).get("id", ""))] = true
	return out









func _torneos(id: String) -> String:





	var partes: Array[String] = [
		Competitions.league_div_brand(Teams.country_of(id), GameState.div_of(id)).to_upper(),
	]
	if _ucl.has(id):
		partes.append(Competitions.comp_name("champions").to_upper())
	elif _eul.has(id):
		partes.append(Competitions.comp_name("europa").to_upper())
	elif _conf.has(id):
		partes.append(Competitions.comp_name("conference").to_upper())
	else:


		for c in Continental.AMER_COMPS:
			if (_amer.get(c, {}) as Dictionary).has(id):
				partes.append(Competitions.comp_name(Continental.marca(c)).to_upper())
				break
	return " · ".join(partes)





func _elige(i: int) -> void:
	var ofertas: Array = _ofertas()
	if i < 0 or i >= ofertas.size():
		return
	_sel = i
	var of: Dictionary = ofertas[i] as Dictionary
	var club: Dictionary = Teams.by_id(String(of.get("id", "")))
	if _jersey != null and is_instance_valid(_jersey):


		_jersey.texture = JerseyArt.texture(GameState.kit_variant(club, 0), 0)
	if _escudo != null and is_instance_valid(_escudo):
		_escudo.set_team(club)






	for k in _filas.size():
		var puesta: bool = k == i
		CareerTheme.apply_button(_filas[k],
			CareerTheme.Kind.NEUTRAL if puesta else CareerTheme.Kind.GHOST, 26)
		_filas[k].modulate.a = 1.0 if puesta else 0.72









func _firma() -> void:

	if replay:
		_leave()
		return
	if Career.volver_con(_sel):
		_leave()





func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	out["ofertas"] = _ofertas().duplicate(true)
	return out






func _tick(_delta: float) -> void:
	if _ajustado or not ficha_puesta or card == null:
		return
	if card.size.y <= 0.0:
		return
	_ajustado = true
	fit_world_above(card.size.y)





func _armar_auto_seguir() -> void:
	pass


func _on_skip() -> void:
	if t >= card_at:
		return
	super._on_skip()






func _caja(at: Vector3, size: Vector3, col: Color, emis: float = 0.0) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	if emis > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emis
	box.material = mat
	m.mesh = box
	m.position = at
	viewport.add_child(m)
