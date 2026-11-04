extends "res://ui/ceremonies/legend_meet.gd"
























const CARA_VARIANTE: Dictionary = {
	"final_ganada": "llorar_alegria", "final_perdida": "tristeza",
	"derbi": "alegria", "derbi_perdido": "tristeza",
}




const KEYS_IDOLO: Array = [
	{"t": 0.0, "dist": 26.0, "h": 1.3, "yaw": 138.0, "aim_y": 2.3, "fov": 18.0},
	{"t": 3.0, "dist": 16.0, "h": 1.35, "yaw": 116.0, "aim_y": 2.0, "fov": 24.0},
	{"t": 6.0, "dist": 9.5, "h": 1.42, "yaw": 99.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 10.2, "dist": 8.5, "h": 1.44, "yaw": 94.0, "aim_y": 1.68, "fov": 32.0},
	{"t": 13.0, "dist": 9.6, "h": 1.45, "yaw": 89.0, "aim_y": 1.72, "fov": 33.0},
]

const T_CHYRON_IDOLO: float = 1.0


const IDOLO_HABLA: float = 7.0
const IDOLO_CALLA: float = 10.4
const T_CARD_IDOLO: float = 10.9



const CITA_ARRIBA_TUMBADO: float = 280.0

var _idolo_fig: AnimatedSprite3D = null
var _cita: PanelContainer = null


func _variante() -> String:
	var v: String = String(data.get("variante", "final_ganada"))
	return v if IdoloEscenas.CONOCE_FRASES.has(v) else "final_ganada"


func _es_final() -> bool:
	return _variante().begins_with("final")


func _build() -> void:
	var casa: bool = bool(data.get("home", true))
	var rival: Dictionary = Teams.by_id(String(data.get("rival", "")))
	var dueno: Dictionary = team() if casa or rival.is_empty() else rival
	var es_final: bool = _es_final()
	make_stadium({
		"div": div(),
		"attendance": 1.0 if es_final else 0.95,
		"party": false,
		"home_club": String(dueno.get("id", "")),
		"home_only": true,
		"weather": "night" if es_final else "sunset",
		"kit": GameState.kit_variant(dueno, 0),

		"board": String(data.get("nombre", "")).to_upper(),
	})
	make_camera(KEYS_IDOLO)
	orbit_speed = DRIFT
	make_audio(ATT, false)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 10.0
	flash_burst_at = T_FLASH
	flash_burst_dur = 1.8
	flash_burst_mult = 6.0

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look, "south")
	player.position.z = CENTER_Z + PLAYER_DZ
	var cara: CaraViva = CaraViva.de(player)
	if cara != null:
		cara.anima(String(CARA_VARIANTE[_variante()]))
	_build_idolo()
	_build_textos()




func _build_idolo() -> void:
	var cfg: Dictionary = KitRecolor.appearance_for(_cara(), {})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "IdoloConoce"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = player_frames(cfg, "south", ESMOQUIN_SHEET, true)
	esmoquin_clap(frames, cfg)
	spr.sprite_frames = frames
	spr.position = Vector3(0.0, feet_offset(spr.pixel_size, ESMOQUIN_SHEET + "00.png")
		- PLAYER_SINK, CENTER_Z + LEGEND_DZ)
	spr.play("clap" if frames.has_animation("clap") else "idle")
	viewport.add_child(spr)
	_idolo_fig = spr
	CaraViva.pon(spr)


func _build_textos() -> void:
	var nombre: String = String(data.get("nombre", ""))
	var anios: int = int(data.get("anios", IdoloEscenas.CONOCE_ANIOS))
	make_chyron(I18n.t("TU IDOLO VINO A VERTE"), CareerUi.display_name(nombre).to_upper(),
		team(), T_CHYRON_IDOLO)
	_cita = make_cita_idolo(nombre, I18n.t(String(IdoloEscenas.CONOCE_FRASES[_variante()])))
	if UiKit.es_horizontal():
		_cita.anchor_top = 0.0
		_cita.anchor_bottom = 0.0
		_cita.offset_top = UiKit.top_safe_inset(get_viewport()) + CITA_ARRIBA_TUMBADO
		_cita.offset_bottom = _cita.offset_top
		_cita.grow_vertical = Control.GROW_DIRECTION_END
	make_card(T_CARD_IDOLO)
	card_title(CareerUi.display_name(nombre).to_upper(), 40)
	card_sub(I18n.t("LA PRIMERA VEZ EN PERSONA"))
	card_stats([
		{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
			"k": I18n.t("la final") if _es_final() else I18n.t("el derbi")},
		{"v": str(anios), "k": I18n.t("temporadas después")},
	])
	card_note(I18n.tf("Lo dijiste hace {0} temporadas en una rueda de prensa. Hoy bajó a buscarte.",
		[anios]))
	card_cta(I18n.t("SEGUIR"))




func _tick(_delta: float) -> void:
	if _idolo_fig == null:
		return
	var anim: String = "clap" if t < IDOLO_HABLA - 0.5 \
			and _idolo_fig.sprite_frames.has_animation("clap") else "idle"
	if _idolo_fig.animation != anim:
		_idolo_fig.play(anim)
	var dice: bool = t >= IDOLO_HABLA and t < IDOLO_CALLA - 0.4
	var cara: CaraViva = CaraViva.de(_idolo_fig)
	if cara != null and cara._hablando != dice:
		cara.habla(dice)
	if _cita != null:
		_cita.modulate.a = clampf(minf((t - IDOLO_HABLA) / 0.25,(IDOLO_CALLA - t) / 0.3),
			0.0, 1.0)
