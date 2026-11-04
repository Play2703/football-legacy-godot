extends Ceremony
































const ATT: float = 0.9

const T_NOMBRE: float = 0.8
const T_PITO: float = 1.7
const T_CHYRON: float = 2.6
const T_CARD: float = 8.8


const BOO_DUR: float = 8.0


const OLAS: Array[float] = [0.0, 2.3, 4.8]




const ME_Z: float = 19.0



const LOST_SHEET: String = "res://assets/sprites/anim/lost_player_north_"
const LOST_FPS: float = 12.0



const SB_FALLBACK: Vector3 = Vector3(0.0, 12.0, -16.0)

const SB_AIM: float = 2.4

var _nombre_puesto: bool = false
var _pitando: bool = false
var _olas: int = 0




func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,

		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "night")),
		"kit": kit,
		"board": board_fit(I18n.t("ALINEACIÓN")),
	})
	var sb: Vector3 = _board_pos()
	make_camera(_keys(sb), 40.0)


	orbit_speed = -0.35



	var look: Dictionary = GameState.player_look()
	make_player(look, "north")
	player.position = Vector3(0.0, player.position.y, ME_Z)
	_add_lost(look)
	make_audio(ATT, false)


	stadium.crowd_excite(0.35)

	make_chyron(I18n.t("PITADA"), CareerTheme.caps(Career.player_name), team(),
		T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("TU GRADA TE PITA"), 40)
	card_sub(String(team().get("name", "?")).to_upper())
	card_stats(_stats())
	card_note(I18n.t("Te silbaron al oír tu nombre. El partido de hoy es la respuesta."))
	card_cta(I18n.t("SEGUIR"))





func _board_pos() -> Vector3:
	var root: Node3D = SceneFade.vivo(stadium.get("_scoreboard_root")) as Node3D
	if root == null or not is_instance_valid(root) or not root.is_inside_tree():
		return SB_FALLBACK
	return root.global_position




func _keys(sb: Vector3) -> Array:
	var aim: float = sb.y + SB_AIM
	return [



		{"t": 0.0, "dist": 48.0, "h": sb.y - 3.0, "yaw": 180.0, "aim_y": aim,
			"fov": 30.0, "focus_x": 0.0, "focus_z": sb.z},
		{"t": 2.2, "dist": 44.0, "h": sb.y - 4.0, "yaw": 185.0, "aim_y": aim - 1.0,
			"fov": 32.0, "focus_x": 0.0, "focus_z": sb.z},


		{"t": 4.4, "dist": 25.0, "h": 6.5, "yaw": 198.0, "aim_y": 5.2,
			"fov": 44.0, "focus_x": 0.0, "focus_z": sb.z + 7.0},




		{"t": 7.0, "dist": 12.0, "h": 2.8, "yaw": 184.0, "aim_y": 3.2,
			"fov": 50.0, "focus_x": 0.0, "focus_z": ME_Z},
	]





func _add_lost(look: Dictionary) -> void:
	var cfg: Dictionary = player_cfg(look)
	if espalda_toca(cfg):
		cfg = cfg.duplicate()
		cfg["num_lamina"] = true
	cfg = _cfg_con_escudo(cfg, false)
	var frames: SpriteFrames = player.sprite_frames
	var added: int = 0
	for i in range(1, 9):
		var path: String = "%s%02d.png" % [LOST_SHEET, i]
		if not ResourceLoader.exists(path):
			continue
		if added == 0:
			frames.add_animation("lost")
			frames.set_animation_loop("lost", false)
			frames.set_animation_speed("lost", LOST_FPS)
		frames.add_frame("lost", KitRecolor.apply(load(path), cfg))
		added += 1
	if added > 0:
		espalda_registra(player, "lost", LOST_SHEET, 1)




func _stats() -> Array:
	var r: float = float(data.get("rating", 0.0))
	return [
		{"v": str(maxi(int(data.get("streak", 0)), 0)), "k": I18n.t("tardes malas")},
		{"v": "%.1f" % r if r > 0.0 else "—", "k": I18n.t("tu nota")},
		{"v": str(clampi(int(data.get("aficion", 0)), 0, 100)),
			"k": I18n.t("afición")},
	]


func _tick(_delta: float) -> void:
	if not _nombre_puesto and t >= T_NOMBRE:
		_poner_nombre()
	if not _pitando and t >= T_PITO:
		_pitar()
	if _pitando and _olas < OLAS.size() and t >= T_PITO + OLAS[_olas]:
		sting("crowd_whistles", -2.0 - 4.0 * float(_olas))
		_olas += 1




func _skipped() -> void:
	if not _nombre_puesto:
		_poner_nombre()
	if not _pitando:
		_pitar()
	if player.sprite_frames.has_animation("lost"):
		player.frame = maxi(player.sprite_frames.get_frame_count("lost") - 1, 0)





func _poner_nombre() -> void:
	_nombre_puesto = true
	stadium.set_scoreboard_text(board_fit(Career.nombre_espalda()))


func _pitar() -> void:
	_pitando = true
	stadium.crowd_boo(BOO_DUR)
	if audio != null:
		audio.boo(BOO_DUR)
	if player.sprite_frames.has_animation("lost"):
		player.play("lost")
