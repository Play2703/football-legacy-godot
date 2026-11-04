extends Ceremony


















































const CEIL_Y: float = 3.32
const C_CEIL: Color = Color("2a2f37")






const TV_R: float = -0.95
const TV_Y: float = 1.92
const TV_W: float = 1.32
const TV_H: float = 0.88
const TV_BEZEL: float = 0.07
const C_TV_FRAME: Color = Color("15181d")









const LETTER_PX: Vector2i = Vector2i(168, 228)
const LETTER_W: float = 0.44
const C_PAPER: Color = Color("efece2")
const C_INK: Color = Color("1b1f26")
const C_INK_SOFT: Color = Color("5a616c")
















const FRAME_R: float = -1.06
const FRAME_F: float = 2.28
const FRAME_W: float = 0.86
const FRAME_H: float = 1.08
const FRAME_LEAN: float = -11.0
const C_FRAME_WOOD: Color = Color("6b4c2c")
const C_FRAME_MAT: Color = Color("191c22")








const PAPER_F: float = 2.62
const PAPER_R: float = -0.34
const YOU_F: float = 0.55
const YOU_R: float = 0.62





const PAPER_Y_FLAT: float = 0.82
const PAPER_Y_UP: float = 1.16
const PAPER_TILT_FLAT: float = -86.0
const PAPER_TILT_UP: float = -18.0









const KEYS: Array = [
	{"t": 0.0, "dist": 6.2, "h": 2.05, "yaw": 174.0, "aim_y": 1.2, "fov": 44.0,
		"look": "sala"},
	{"t": 2.2, "dist": 1.78, "h": 1.34, "yaw": 176.0, "aim_y": 1.15, "fov": 33.0,
		"look": "carta"},
	{"t": 5.2, "dist": 1.66, "h": 1.31, "yaw": 178.0, "aim_y": 1.15, "fov": 32.0,
		"look": "carta"},
	{"t": 7.6, "dist": 6.4, "h": 2.1, "yaw": 172.0, "aim_y": 1.22, "fov": 45.0,
		"look": "sala"},
]


const DRIFT: float = -0.22




const T_OPEN: float = 2.1



const T_JOY: float = 6.9
const T_CARD: float = 9.8

var _sala: DecisionRoom
var _sobre: Node3D
var _carta: MeshInstance3D
var _tv_luz: OmniLight3D
var _tv_mat: StandardMaterial3D
var _jersey: Sprite3D
var _fila_dorsal: HBoxContainer
var _boton_quedarse: Button
var _titulo_dorsal: Label
var _abierto: bool = false
var _auto_pedido: bool = false
var _festejo: bool = false


var _frames_aplauso: SpriteFrames





func _accent_for() -> Color:
	var nat: Dictionary = _nation()
	if not nat.is_empty():
		return CareerTheme.accent_of(nat)
	return super()


func _nation() -> Dictionary:
	return Nations.as_team(_nat_id())


func _nat_id() -> String:
	return String(data.get("nation", Career.nationality))






func _torneo() -> String:
	var raw: String = String(data.get("torneo", ""))
	if raw.is_empty():










		raw = I18n.t("MUNDIAL") if _es_mundial() \
				else Nations.continental_name_of(_nat_id())
	return CareerTheme.caps(raw)






func _es_mundial() -> bool:
	return String(data.get("comp", "wc")) == "wc"


func _build() -> void:



	focus = Vector3.ZERO
	_sala = DecisionRoom.new()
	_sala.kind = DecisionRoom.DESPACHO
	_sala.div = div()


	_sala.club_color = accent

	_sala.crest = null
	viewport.add_child(_sala)
	_build_techo()
	_build_tv()
	_build_jersey_frame()
	_build_paper()
	make_camera(_keys_en_la_sala())
	orbit_speed = DRIFT






	var look: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	make_player(look)













	_frames_aplauso = player_frames(look, "south", CLAP_SHEET)
	AudioBank.stream("sting_mundial")
	AudioBank.stream("ui_whoosh")
	var at: Vector3 = _sala.cone(YOU_F, YOU_R)
	player.position.x = at.x
	player.position.z = at.z



	var badge: Dictionary = _nation()

	make_chyron(I18n.t("CONVOCADO"),
		Nations.team_label(badge, "?").to_upper(), badge, 0.6)
	make_card(T_CARD)





	card_title(_torneo(), 40)
	card_sub(_sub_line())
	card_count(int(data.get("age", Career.age)),
		I18n.t("AÑOS AL IR AL MUNDIAL") if _es_mundial()
		else I18n.t("AÑOS AL ENTRAR EN LA LISTA"))
	card_note(I18n.t("Una carrera cabe en tres o cuatro. Éste es uno.")
		if _es_mundial() else I18n.t("Un continente entero, y tú dentro."))
	_build_shirt_ask()
	card_cta(I18n.t("SEGUIR"))





















func _build_shirt_ask() -> void:
	var opciones: Array = _shirt_options()
	if opciones.is_empty():
		return
	var titulo: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)


	titulo.text = I18n.t("CAMBIA TU DORSAL") if Career.nat_shirt_pick > 0 \
			else I18n.t("PIDE TU DORSAL")
	titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	card_box.add_child(titulo)
	_titulo_dorsal = titulo
	_fila_dorsal = HBoxContainer.new()
	_fila_dorsal.add_theme_constant_override("separation", 10)
	card_box.add_child(_fila_dorsal)
	for raw in opciones:
		var n: int = int(raw)
		var b: Button = Button.new()
		b.text = str(n)
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_HEAD)
		b.pressed.connect(_on_pide_dorsal.bind(n))
		_fila_dorsal.add_child(b)









	var quedarse: Button = CareerUi.accion("camiseta",
		I18n.tf("ME QUEDO EL {0}", [_dorsal()]), UiKit.BTN_BLUE["bg"] as Color)
	quedarse.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H - 12)
	quedarse.pressed.connect(_on_conserva_dorsal)
	card_box.add_child(quedarse)
	_boton_quedarse = quedarse




func _shirt_options() -> Array:
	if data.has("shirt_options"):
		return data["shirt_options"] as Array
	if standalone:
		return []


	return Career.nat_shirt_ask_now()





func _on_pide_dorsal(n: int) -> void:
	if not standalone and not Career.request_nat_shirt(n):
		return
	if _jersey != null:


		_jersey.texture = JerseyArt.texture_named(_nation(), n,
			Career.nombre_espalda())
	sting("ui_confirm", -8.0)
	_cierra_dorsal(I18n.tf("EL {0} ES TUYO HASTA EL PROXIMO TORNEO", [n]))





func _on_conserva_dorsal() -> void:
	if not standalone and not Career.keep_nat_shirt():
		return
	sting("ui_confirm", -10.0)
	_cierra_dorsal(I18n.tf("SIGUES CON EL {0}", [_dorsal()]))





func _cierra_dorsal(texto: String) -> void:
	if _fila_dorsal != null:
		var padre: Node = _fila_dorsal.get_parent()
		var idx: int = _fila_dorsal.get_index()
		var hecho: Label = CareerUi.plain(CareerTheme.T_VALUE, text_accent())
		hecho.text = texto
		hecho.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		hecho.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		padre.add_child(hecho)
		padre.move_child(hecho, idx)
		_fila_dorsal.queue_free()
		_fila_dorsal = null
	if _boton_quedarse != null:
		_boton_quedarse.queue_free()
		_boton_quedarse = null


	if _titulo_dorsal != null:
		_titulo_dorsal.queue_free()
		_titulo_dorsal = null




func _sub_line() -> String:
	return I18n.t("TITULAR CON TU SELECCIÓN") \
			if String(data.get("status", "")) == "titular" \
			else I18n.t("EN LA LISTA DE TU SELECCIÓN")





func _keys_en_la_sala() -> Array:
	var carta: Vector3 = _sala.cone(PAPER_F, PAPER_R)
	var out: Array = []
	for raw in KEYS:
		var k: Dictionary =(raw as Dictionary).duplicate()
		var mira: String = String(k.get("look", "sala"))
		k.erase("look")
		if mira == "carta":
			k["focus_x"] = carta.x
			k["focus_z"] = carta.z
		else:


			var eje: Vector3 = _sala.cone(1.5, 0.0)
			k["focus_x"] = eje.x
			k["focus_z"] = eje.z
		out.append(k)
	return out










func _build_tv() -> void:
	var at: Vector3 = _sala.cone(DecisionRoom.DESP_WALL_F - 0.16, TV_R)
	at.y = TV_Y
	var marco: MeshInstance3D = _caja(
		Vector3(TV_W + TV_BEZEL * 2.0, TV_H + TV_BEZEL * 2.0, 0.09), at, C_TV_FRAME)
	marco.rotation_degrees.y = _sala.face()
	_tv_mat = StandardMaterial3D.new()
	_tv_mat.albedo_texture = Flags.texture(_nat_id())
	_tv_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_tv_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_tv_mat.emission_enabled = true
	_tv_mat.emission_texture = _tv_mat.albedo_texture



	_tv_mat.emission_energy_multiplier = 0.35
	var pantalla: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(TV_W, TV_H)
	pantalla.mesh = qm
	pantalla.material_override = _tv_mat


	pantalla.position = at + _hacia_camara(0.055)
	pantalla.rotation_degrees.y = _sala.face()
	viewport.add_child(pantalla)
	_tv_luz = OmniLight3D.new()
	_tv_luz.light_color = Color("8fb6ff")
	_tv_luz.light_energy = 0.5
	_tv_luz.omni_range = 5.5
	_tv_luz.position = at + _hacia_camara(0.6)
	viewport.add_child(_tv_luz)






func _build_techo() -> void:
	var centro: Vector3 = _sala.cone(1.6, 0.0)
	centro.y = CEIL_Y + 0.07
	_caja(Vector3(15.0, 0.14, 15.0), centro, C_CEIL)
	var cornisa: Vector3 = _sala.cone(DecisionRoom.DESP_WALL_F - 0.12, 0.0)
	cornisa.y = CEIL_Y - 0.06
	var m: MeshInstance3D = _caja(Vector3(12.0, 0.1, 0.12), cornisa,
		C_CEIL.lightened(0.18))
	m.rotation_degrees.y = _sala.face()





	var luminaria: Vector3 = _sala.cone(2.9, 0.1)
	luminaria.y = CEIL_Y - 0.02
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("cfc9b4")
	mat.emission_enabled = true
	mat.emission = Color("ffe9c4")
	mat.emission_energy_multiplier = 0.5
	var pl: MeshInstance3D = _caja_mat(Vector3(1.15, 0.06, 0.42), luminaria, mat)
	pl.rotation_degrees.y = _sala.face()
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ffe6bd")
	luz.light_energy = 0.75
	luz.omni_range = 7.0
	luz.position = luminaria + Vector3(0.0, -0.3, 0.0)
	viewport.add_child(luz)






func _build_jersey_frame() -> void:
	var at: Vector3 = _sala.cone(FRAME_F, FRAME_R)
	var pivote: Node3D = Node3D.new()
	pivote.position = Vector3(at.x, 0.0, at.z)
	pivote.rotation_degrees.y = _sala.face()
	viewport.add_child(pivote)
	var cuadro: Node3D = Node3D.new()
	cuadro.rotation_degrees.x = FRAME_LEAN
	pivote.add_child(cuadro)


	_marco_pieza(cuadro, Vector3(FRAME_W, FRAME_H, 0.04),
		Vector3(0.0, FRAME_H * 0.5, 0.0), C_FRAME_MAT)
	for y in [0.0, FRAME_H]:
		_marco_pieza(cuadro, Vector3(FRAME_W + 0.07, 0.055, 0.07),
			Vector3(0.0, y, 0.015), C_FRAME_WOOD)
	for x in [-1.0, 1.0]:
		_marco_pieza(cuadro, Vector3(0.055, FRAME_H + 0.07, 0.07),
			Vector3(x *(FRAME_W * 0.5 + 0.005), FRAME_H * 0.5, 0.015), C_FRAME_WOOD)


	var spr: Sprite3D = Sprite3D.new()
	spr.texture = JerseyArt.texture_named(_nation(), _dorsal(),
		Career.nombre_espalda())
	spr.pixel_size =(FRAME_W - 0.13) / float(maxi(1, spr.texture.get_height()))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	spr.billboard = BaseMaterial3D.BILLBOARD_DISABLED
	spr.shaded = false
	spr.position = Vector3(0.0, FRAME_H * 0.52, 0.032)
	cuadro.add_child(spr)
	_jersey = spr





func _marco_pieza(padre: Node3D, size: Vector3, pos: Vector3,
		col: Color) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	mi.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.85
	mi.material_override = mat
	mi.position = pos
	padre.add_child(mi)
	return mi






func _dorsal() -> int:
	var n: int = int(data.get("number", 0))
	if n <= 0:
		n = Career.nat_number()
	if n <= 0:
		n = Career.club_number(String(vivo_de("club", GameState.player_team_id)))
	return maxi(n, 1)








func _build_paper() -> void:
	var at: Vector3 = _sala.cone(PAPER_F, PAPER_R)
	_sobre = Node3D.new()
	viewport.add_child(_sobre)
	var cuerpo: MeshInstance3D = _caja(Vector3(0.36, 0.014, 0.25),
		Vector3(at.x, PAPER_Y_FLAT, at.z), Color("ece7da"), _sobre)
	cuerpo.rotation_degrees.y = _sala.face()


	var solapa: MeshInstance3D = _caja(Vector3(0.36, 0.014, 0.11),
		Vector3(at.x, PAPER_Y_FLAT + 0.004, at.z), Color("cfc7b3"), _sobre)
	solapa.rotation_degrees.y = _sala.face()




	var sello: MeshInstance3D = _caja(Vector3(0.07, 0.015, 0.05),
		Vector3(at.x, PAPER_Y_FLAT + 0.006, at.z), accent, _sobre)
	sello.rotation_degrees.y = _sala.face()
	sello.position += _sala.cone(0.0, 0.12)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = _letter_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA


	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	_carta = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(LETTER_W,
		LETTER_W * float(LETTER_PX.y) / float(LETTER_PX.x))
	_carta.mesh = qm




	_carta.material_override = mat
	_carta.position = Vector3(at.x, PAPER_Y_FLAT + 0.02, at.z)
	_carta.rotation_degrees = Vector3(PAPER_TILT_FLAT, _sala.face(), 0.0)
	_carta.visible = false
	viewport.add_child(_carta)






func _letter_texture() -> ImageTexture:
	var w: int = LETTER_PX.x
	var h: int = LETTER_PX.y
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(C_PAPER)







	var flag: Texture2D = Flags.texture(_nat_id())
	if flag != null:
		var fi: Image = flag.get_image()
		if fi != null:
			fi.convert(Image.FORMAT_RGBA8)


			fi.resize(fi.get_width() * 3, fi.get_height() * 3,
				Image.INTERPOLATE_NEAREST)
			img.blit_rect(fi, Rect2i(Vector2i.ZERO, fi.get_size()),
				Vector2i((w - fi.get_width()) / 2, 10))


	var pais: String = CareerTheme.caps(Nations.team_label(_nation()))
	_centrado(img, pais, 78, _px_que_cabe(pais), C_INK_SOFT)
	_regla(img, 12, 94, w - 12, Color("b9b3a5"))





	var oficial: String = I18n.t("CONVOCATORIA OFICIAL")
	_centrado(img, oficial, 102, _px_que_cabe(oficial), C_INK_SOFT)
	var quien: String = CareerTheme.caps(Career.player_name)
	_centrado(img, quien, 120, _px_que_cabe(quien), C_INK)




	var abajo: int = _titular(img, _torneo(), 142)
	_regla(img, 34, abajo + 8, w - 34, Color("b9b3a5"))
	var convocado: String = I18n.t("QUEDAS CONVOCADO")
	_centrado(img, convocado, abajo + 22, _px_que_cabe(convocado), C_INK_SOFT)


	_texto(img, "~~~~~", w - 62, 202, 2, C_INK_SOFT)
	return ImageTexture.create_from_image(img)







func _titular(img: Image, texto: String, y0: int) -> int:
	var util: int = img.get_width() - 20
	for px in [4, 3, 2]:
		var lineas: Array = _reparte(texto, util, px)
		if lineas.is_empty():
			continue
		var y: int = y0
		for l in lineas:
			_centrado(img, String(l), y, px, C_INK)
			y += PixelText.GLYPH_H * px + px
		return y
	return y0




func _reparte(texto: String, util: int, px: int) -> Array:
	var out: Array = []
	var actual: String = ""
	for palabra in texto.split(" ", false):
		var w: String = String(palabra)
		if PixelText.text_width(w, px) > util:
			return []
		var cand: String = w if actual.is_empty() else actual + " " + w
		if PixelText.text_width(cand, px) > util:
			out.append(actual)
			actual = w
		else:
			actual = cand
	if not actual.is_empty():
		out.append(actual)
	return out


func _texto(img: Image, s: String, x: int, y: int, px: int, col: Color) -> void:
	PixelText.draw_text(img, x, y, s, col, px)








func _px_que_cabe(txt: String) -> int:
	return 2 if PixelText.text_width(txt, 2) <= LETTER_PX.x - 20 else 1


func _centrado(img: Image, s: String, y: int, px: int, col: Color) -> void:
	var ancho: int = PixelText.text_width(s, px)
	PixelText.draw_text(img,(img.get_width() - ancho) / 2, y, s, col, px)


func _regla(img: Image, x0: int, y: int, x1: int, col: Color) -> void:
	for x in range(x0, x1):
		img.set_pixel(x, y, col)





func _caja(size: Vector3, pos: Vector3, col: Color,
		padre: Node = null) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	mi.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.9
	mi.material_override = mat
	mi.position = pos


	(padre if padre != null else viewport).add_child(mi)
	return mi



func _caja_mat(size: Vector3, pos: Vector3, mat: Material) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = size
	mi.mesh = bm
	mi.material_override = mat
	mi.position = pos
	viewport.add_child(mi)
	return mi




func _hacia_camara(m: float) -> Vector3:
	var y: float = deg_to_rad(float(DecisionRoom.YAW[DecisionRoom.DESPACHO]))
	return Vector3(sin(y), 0.0, - cos(y)) * m


func _tick(_delta: float) -> void:
	if not _abierto and t >= T_OPEN:
		_abierto = true
		_abre_sobre()
	if not _festejo and t >= T_JOY:
		_festejo = true
		_celebra()




	if not _auto_pedido and t >= T_CARD + 0.8:
		if int(data.get("auto_pick", 0)) > 0:
			_auto_pedido = true
			_on_pide_dorsal(int(data["auto_pick"]))
		elif bool(data.get("auto_keep", false)):
			_auto_pedido = true
			_on_conserva_dorsal()




func _abre_sobre() -> void:
	if _sobre != null:
		_sobre.visible = false
	if _carta == null:
		return
	_carta.visible = true
	sting("ui_whoosh", -12.0)
	var tw: Tween = create_tween().set_parallel(true)
	tw.tween_property(_carta, "position:y", PAPER_Y_UP, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(_carta, "rotation_degrees:x", PAPER_TILT_UP, 0.45) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)









func _celebra() -> void:
	if player != null:

		var frames: SpriteFrames = _frames_aplauso
		if frames == null or frames.get_frame_count("idle") <= 0:
			frames = player_frames(KitRecolor.casual_of(GameState.team_custom),
				"south", CLAP_SHEET)
		if frames.get_frame_count("idle") > 0:
			player.sprite_frames = frames
			player.play("idle")


	if _carta != null:
		var tw: Tween = create_tween().set_parallel(true)
		tw.tween_property(_carta, "position:y", PAPER_Y_UP - 0.14, 0.6)
		tw.tween_property(_carta, "rotation_degrees:x", -40.0, 0.6)
	if _tv_mat != null:
		_tv_mat.emission_energy_multiplier = 1.15
	if _tv_luz != null:
		_tv_luz.light_energy = 1.6
	confetti_colors = _colores_bandera()
	set_confetti(true)
	sting("sting_mundial", -5.0)










func _colores_bandera() -> Array[Color]:
	var out: Array[Color] = []
	var tex: Texture2D = Flags.texture(_nat_id())
	if tex == null:
		return [accent, CareerTheme.TEXT]
	var img: Image = tex.get_image()
	if img == null:
		return [accent, CareerTheme.TEXT]
	img.convert(Image.FORMAT_RGBA8)
	for p in [Vector2i(5, 4), Vector2i(15, 10), Vector2i(25, 15),
			Vector2i(15, 4), Vector2i(5, 15)]:
		var c: Color = img.get_pixelv(p)
		if c.a < 0.5 or c.v < 0.18:
			continue
		var repetido: bool = false
		for prev in out:
			if prev.is_equal_approx(c):
				repetido = true
				break
		if not repetido:
			out.append(c)
	if out.is_empty():
		out.append(accent)
	return out






func _skipped() -> void:
	if not _abierto:
		_abierto = true
		_abre_sobre()
	if not _festejo:
		_festejo = true
		_celebra()
