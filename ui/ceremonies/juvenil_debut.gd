extends "res://ui/ceremonies/juvenil_base.gd"

















const LINEA_X: float = -34.0


const ARB_Z_OFF: float = 3.2
const CHAVAL_Z_OFF: float = 4.3
const YO_Z_OFF: float = 5.4



const KEYS: Array = [
	{"t": 0.0, "dist": 4.6, "h": 1.75, "yaw": 104.0, "aim_y": 1.85, "fov": 40.0,
		"focus_x": LINEA_X, "focus_z": Stadium.HALF_LINE + ARB_Z_OFF + 0.4},
	{"t": 4.0, "dist": 11.5, "h": 1.6, "yaw": 96.0, "aim_y": 1.45, "fov": 32.0,
		"focus_x": LINEA_X, "focus_z": Stadium.HALF_LINE +(ARB_Z_OFF + YO_Z_OFF) * 0.5},
]
const DRIFT: float = -0.4
const ATT: float = 0.7
const T_CHYRON: float = 1.0
const T_CARD: float = 4.6

var chaval: AnimatedSprite3D = null
var arbitro: AnimatedSprite3D = null


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	estadio_de(team(), ATT)
	focus = Vector3(LINEA_X, 0.0, Stadium.HALF_LINE + CHAVAL_Z_OFF)
	make_camera(KEYS, 36.0)
	orbit_speed = DRIFT
	yo_en(Vector3(LINEA_X + 0.2, 0.0, Stadium.HALF_LINE + YO_Z_OFF))
	chaval = persona(player_frames(chaval_cfg(String(team().get("id", ""))), "south"),
		Vector3(LINEA_X, 0.0, Stadium.HALF_LINE + CHAVAL_Z_OFF))
	PlacaNombre.cuelga(chaval, apellido_chaval(), true, false)
	_build_arbitro()
	make_audio(ATT, false)

	make_chyron(I18n.t("DEBUTA"), nombre_chaval(), team(), T_CHYRON)
	make_card(T_CARD)
	card_title(nombre_chaval(), 40)
	var sub: Label = card_sub(I18n.tf("{0} AÑOS · PRIMER PARTIDO", [str(int(data.get("age", 18)))]))
	sub.clip_text = true
	card_stats([
		{"v": "#%d" % maxi(int(data.get("number", 0)), 1), "k": I18n.t("dorsal")},
		{"v": String(data.get("pos", "MC")), "k": I18n.t("puesto")},
	])
	card_note(I18n.t("Hoy entra por primera vez. Tú te acuerdas de lo que se siente."))
	card_cta(I18n.t("SEGUIR"))











const REF_SHEET: String = "res://assets/sprites/anim/ref4_cartel_south_"

const REF_FRAME: int = 3


func _build_arbitro() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)


	var en_cancha: Array = []
	if kit.get("kit") is Color:
		en_cancha.append(kit["kit"])
	var cfg: Dictionary = KitRecolor.appearance_for("juv_debut_arbitro", RefKit.cfg(en_cancha))
	var frames: SpriteFrames = SpriteFrames.new()
	frames.set_animation_loop("default", false)
	frames.rename_animation("default", "idle")
	var path: String = "%s%02d.png" % [REF_SHEET, REF_FRAME]
	frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	arbitro = persona(frames, Vector3(LINEA_X, 0.0, Stadium.HALF_LINE + ARB_Z_OFF))
	var tex: ImageTexture = _cartel(int(data.get("sale", 0)), maxi(int(data.get("number", 0)), 1))
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = tex
	spr.pixel_size = Stadium.ADDED_BOARD_SIZE.x / float(tex.get_width())
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	var h_lamina: float = float(arbitro.sprite_frames.get_frame_texture("idle", 0).get_height())
	var mano_y: float = arbitro.position.y \
			+(h_lamina * 0.5 - float(Stadium.REF_CARTEL_HAND_ROW[REF_FRAME])) * arbitro.pixel_size
	var alto: float = float(tex.get_height()) * spr.pixel_size
	var pos: Vector3 = Vector3(LINEA_X, mano_y + alto * 0.5 - Stadium.BOARD_GRIP,
		Stadium.HALF_LINE + ARB_Z_OFF)




	spr.no_depth_test = true
	spr.render_priority = 1
	spr.position = pos
	viewport.add_child(spr)










func _cartel(sale: int, entra: int) -> ImageTexture:
	if sale > 0:
		return stadium._sub_num_face(sale, entra)
	var img: Image = stadium._board_canvas()
	stadium._board_number(img, clampi(entra, 0, 99), 7, Color("46d05a"))
	return ImageTexture.create_from_image(img)
