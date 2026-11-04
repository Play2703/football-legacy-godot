extends "res://ui/ceremonies/juvenil_base.gd"





















const FirmaLienzo := preload("res://ui/ceremonies/firma_lienzo.gd")



const YO_AT: Vector3 = Vector3(0.0, 0.0, 20.0)
const NINO_AT: Vector3 = Vector3(1.05, 0.0, 20.55)

const CORRO: Array = [Vector3(-1.5, 0, 19.3), Vector3(-2.5, 0, 20.2),
	Vector3(2.3, 0, 19.2), Vector3(3.1, 0, 20.1), Vector3(-0.4, 0, 18.7)]

const CONOS_Z: float = 16.8
const CONOS_N: int = 9
const CONO_PASO: float = 1.4

const KEYS: Array = [
	{"t": 0.0, "dist": 12.0, "h": 3.4, "yaw": 198.0, "aim_y": 0.9, "fov": 44.0,
		"focus_x": 0.4, "focus_z": 19.4},
	{"t": 3.6, "dist": 5.4, "h": 1.55, "yaw": 186.0, "aim_y": 0.95, "fov": 36.0,
		"focus_x": 0.6, "focus_z": 20.3},
]
const DRIFT: float = 0.25
const T_CHYRON: float = 1.0
const T_CARD: float = 4.0



const HELD_RATIO: float = KID_H / PLAYER_HEIGHT_M

const ESC: int = 16
const LADO: int = JerseyArt.SIZE * ESC
const CUERPO: Rect2i = Rect2i(JerseyArt.BODY_X0 * ESC, JerseyArt.BODY_Y0 * ESC,
	(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1) * ESC,(JerseyArt.BODY_Y1 - JerseyArt.BODY_Y0 + 1) * ESC)

var nino: AnimatedSprite3D = null
var playera: Sprite3D = null

var decision: String = ""
var firmada: bool = false
var _nino_cfg: Dictionary = {}
var _img: Image = null
var _lienzo: FirmaLienzo = null
var _ajustado: bool = false


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	_campo()



	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var club_id: String = String(team().get("id", ""))
	for i in CORRO.size():
		var cfg: Dictionary = KitRecolor.infantil(KitRecolor.appearance_for(
			"juv_corro_%d" % i, kit))
		cfg["club"] = club_id
		persona(player_frames(cfg, "south"), CORRO[i], KID_H / PLAYER_METRICS.x)
	_pon_nino(NINO_AT)
	_playera()
	make_audio(0.0, false)

	make_chyron(I18n.t("LA CANTERA"), CareerTheme.caps(team_name("?")), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.tf("{0} AÑOS · CANTERA", [str(int(data.get("age", 16)))]))
	sub.clip_text = true
	card_note(I18n.t("—¿Me firmas la playera?"))
	_botones(I18n.t("RECHAZAR"), I18n.t("ACEPTAR"))





func _campo(keys: Array = KEYS) -> void:
	make_stadium({
		"div": 3,
		"attendance": 0.0,
		"venue_empty": true,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(team(), 0),
		"board": "",
	})
	focus = YO_AT
	make_camera(keys, 38.0)
	orbit_speed = DRIFT
	yo_en(YO_AT)
	_conos()




func _pon_nino(at: Vector3) -> void:
	chaval_de_tu_pais()
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	_nino_cfg = KitRecolor.infantil(person_look({"name": String(data.get("name", ""))}, kit))
	_nino_cfg["club"] = String(team().get("id", ""))
	nino = persona(player_frames(_nino_cfg, "south"), at, KID_H / PLAYER_METRICS.x)







const DECIDE_HOLD_S: float = 0.8


func _botones(txt_no: String, txt_si: String) -> void:
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 16)
	card_box.add_child(fila)
	for par in [[txt_no, rechaza, CareerTheme.DANGER], [txt_si, acepta, CareerTheme.GOOD]]:
		var b: Button = CareerUi.hold_button(fila, String(par[0]), DECIDE_HOLD_S,
			par[1], CareerTheme.T_BODY, par[2])
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.clip_text = true



func _conos() -> void:
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = 0.015
	mesh.bottom_radius = 0.12
	mesh.height = 0.28
	mesh.radial_segments = 10
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("ff7a1a")
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	for i in CONOS_N:
		var m: MeshInstance3D = MeshInstance3D.new()
		m.mesh = mesh
		m.material_override = mat
		m.position = Vector3((i -(CONOS_N - 1) * 0.5) * CONO_PASO, 0.14, CONOS_Z)
		viewport.add_child(m)





func _playera() -> void:




	var kit_v: Dictionary = GameState.kit_variant(team(), 0)
	var num: int = maxi(GameState.player_number, 1)
	playera = make_jersey(kit_v, 0, 1.05 * HELD_RATIO, 0.79 * HELD_RATIO)
	playera.position = Vector3(NINO_AT.x, playera.position.y, NINO_AT.z)
	var tex: Texture2D = JerseyArt.texture(kit_v, 0)
	if tex == null:
		return



	var raw: Image = tex.get_image()
	if raw == null or raw.is_empty():
		return
	var base: Image = raw.duplicate()
	if base.is_compressed():
		base.decompress()
	base.convert(Image.FORMAT_RGBA8)
	var img: Image = base.duplicate()
	if img.get_width() != LADO or img.get_height() != LADO:
		img.resize(LADO, LADO, Image.INTERPOLATE_NEAREST)
	_hornea_espalda(img, base, kit_v, Career.nombre_espalda(), num)
	_img = img
	_sube_playera()





func _hornea_espalda(img: Image, base: Image, kit_v: Dictionary, ape: String, num: int) -> void:
	var pecho: Rect2 = Rect2(JerseyArt.BODY_X0, JerseyArt.BODY_Y0 + 5,
		JerseyArt.BODY_X1 - JerseyArt.BODY_X0 + 1, 9)
	var rec: Dictionary = Espalda.receta_para(kit_v, base, pecho)
	var lam_t: Texture2D = Espalda.textura(ape.strip_edges(), num, rec)
	if lam_t == null:
		return

	var lam_raw: Image = lam_t.get_image()
	if lam_raw == null or lam_raw.is_empty():
		return
	var lam: Image = lam_raw.duplicate()
	if lam.is_compressed():
		lam.decompress()
	lam.convert(Image.FORMAT_RGBA8)
	var ancho_util: float = float(JerseyArt.BODY_X1 - JerseyArt.BODY_X0 - 1)
	var centro_y: float = float(JerseyArt.BODY_Y0 + JerseyArt.BODY_Y1 + 1) * 0.5
	var k: float = ancho_util / float(Espalda.NOMBRE_ANCHO) / float(Espalda.RES) * float(ESC)
	var w: int = maxi(int(round(lam.get_width() * k)), 1)
	var h: int = maxi(int(round(lam.get_height() * k)), 1)
	lam.resize(w, h, Image.INTERPOLATE_BILINEAR)
	img.blend_rect(lam, Rect2i(0, 0, w, h),
		Vector2i(LADO / 2 - w / 2, int(centro_y * ESC) - h / 2))


func _sube_playera() -> void:
	if playera == null or _img == null:
		return
	playera.texture = ImageTexture.create_from_image(_img)
	playera.pixel_size = 1.05 * HELD_RATIO / float(_img.get_height())




func acepta() -> void:
	if not decision.is_empty():
		return
	decision = "acepta"
	card.visible = false
	if _img == null:
		_on_firmada(false)
		return
	_lienzo = FirmaLienzo.new()
	add_child(_lienzo)
	var usado: Rect2i = _img.get_used_rect().grow(12)
	_lienzo.monta(_img, usado.intersection(Rect2i(0, 0, LADO, LADO)), CUERPO,
		I18n.t("FIRMA SU PLAYERA"), I18n.t("Firma con el dedo"))
	_lienzo.firmada.connect(_on_firmada)
	if bool(data.get("firma_auto", false)):
		_lienzo.firma_sola(false)


func rechaza() -> void:
	if not decision.is_empty():
		return
	decision = "rechaza"
	if not standalone and not replay:
		Career.juvenil_cadena_paso(1, false)
	_rehace_ficha(I18n.t("OTRO DÍA"),
		I18n.t("Se quedó con la playera en blanco en las manos. No dijo nada."))




func _on_firmada(_premio: bool) -> void:
	if firmada:
		return
	firmada = true
	if _lienzo != null:
		_img = _lienzo.img
		_lienzo.queue_free()
		_lienzo = null
	_sube_playera()
	_aplaude_nino()
	sting("fanfare", -8.0)


	if not standalone and not replay:
		Career.juvenil_cadena_paso(1, true)
	_rehace_ficha(nombre_chaval(), I18n.t("«Mi sueño es jugar junto a ti pronto.»"))



func _aplaude_nino() -> void:
	if nino != null:
		var aplaude: SpriteFrames = player_frames(_nino_cfg, "south", CLAP_SHEET)
		if aplaude != null and aplaude.has_animation("idle"):




			var px: float = KID_H / PLAYER_METRICS.x * _alto_fig(IDLE_0) / _alto_fig(CLAP_SHEET + "00.png")
			nino.sprite_frames = aplaude
			nino.pixel_size = px
			nino.position.y = feet_offset(px, CLAP_SHEET + "00.png") - PLAYER_SINK
			nino.play("idle")


const IDLE_0: String = "res://assets/sprites/anim/idle_south_00.png"



func _alto_fig(path: String) -> float:
	if not ResourceLoader.exists(path):
		return PLAYER_METRICS.x
	var img: Image = SceneFade.imagen(load(path))
	if img == null:
		return PLAYER_METRICS.x
	if img.is_compressed():
		img.decompress()
	return maxf(float(img.get_used_rect().size.y), 1.0)



func _rehace_ficha(titulo: String, nota: String) -> void:
	for c in card_box.get_children():
		card_box.remove_child(c)
		c.queue_free()
	card_title(titulo, 40)
	card_note(nota)
	card_cta(I18n.t("SEGUIR"))


	card.visible = true
	super._armar_auto_seguir()


func _tick(delta: float) -> void:
	if _lienzo != null:
		_lienzo.tick(delta)

	var auto: String = String(data.get("decide", ""))
	if decision.is_empty() and not auto.is_empty() and ficha_puesta and t >= card_at + 0.8:
		if auto == "rechaza":
			rechaza()
		else:
			acepta()
	if _ajustado or not ficha_puesta or card == null or not card.visible:
		return
	if card.size.y <= 0.0:
		return
	_ajustado = true
	fit_world_above(card.size.y)



func _armar_auto_seguir() -> void:
	pass


func _on_skip() -> void:
	if t >= card_at and decision.is_empty():
		return
	if _lienzo != null:
		return
	super._on_skip()
