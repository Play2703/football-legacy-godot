extends "res://ui/ceremonies/legend_meet.gd"























const CONOCE: GDScript = preload("res://ui/ceremonies/idolo_conoce.gd")



const KEYS_FESTEJO: Array = [
	{"t": 0.0, "dist": 26.0, "h": 1.3, "yaw": 138.0, "aim_y": 2.3, "fov": 18.0},
	{"t": 3.0, "dist": 13.0, "h": 1.35, "yaw": 112.0, "aim_y": 1.95, "fov": 27.0},
	{"t": 5.5, "dist": 9.5, "h": 1.42, "yaw": 99.0, "aim_y": 1.7, "fov": 32.0},
	{"t": 9.6, "dist": 9.0, "h": 1.42, "yaw": 92.0, "aim_y": 1.66, "fov": 32.0},
	{"t": 14.0, "dist": 9.8, "h": 1.45, "yaw": 88.0, "aim_y": 1.72, "fov": 33.0},
]
const T_CHYRON_F: float = 1.0




const EL_FESTEJA: float = 3.4
const EL_PARA: float = 6.6
const EL_HABLA: float = 6.8
const EL_CALLA: float = 9.6
const TU_FESTEJAS: float = 9.6
const T_CARD_F: float = 12.2

var _idolo_fig: AnimatedSprite3D = null
var _cita: PanelContainer = null


func _variante() -> String:
	var v: String = String(data.get("variante", "leyenda"))
	return v if IdoloEscenas.FESTEJO_FRASES.has(v) else "leyenda"




func _hoja() -> Dictionary:
	return IdoloEscenas.hoja_festejo(String(data.get("gesto", "")))


func _build() -> void:
	var casa: bool = bool(data.get("home", true))
	var rival: Dictionary = Teams.by_id(String(data.get("rival", "")))
	var dueno: Dictionary = team() if casa or rival.is_empty() else rival
	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": false,
		"home_club": String(dueno.get("id", "")),
		"home_only": true,
		"weather": "night",
		"kit": GameState.kit_variant(dueno, 0),
		"board": String(data.get("nombre", "")).to_upper(),
	})
	make_camera(KEYS_FESTEJO)
	orbit_speed = DRIFT
	make_audio(ATT, false)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 10.0
	flash_burst_at = EL_FESTEJA + 0.3
	flash_burst_dur = 1.8
	flash_burst_mult = 6.0

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look, "south")
	player.position.z = CENTER_Z + PLAYER_DZ
	var cara: CaraViva = CaraViva.de(player)
	if cara != null:
		cara.anima("alegria")
	_festejo_anim(player)
	_build_idolo()
	_build_textos()




func _build_idolo() -> void:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "IdoloFestejo"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.sprite_frames = _legend_frames()
	spr.position = Vector3(0.0, feet_offset(spr.pixel_size) - PLAYER_SINK,
		CENTER_Z + LEGEND_DZ)
	spr.play("idle")
	viewport.add_child(spr)
	_idolo_fig = spr
	CaraViva.pon(spr)
	_festejo_anim(spr)






func _festejo_anim(spr: AnimatedSprite3D) -> void:
	var hoja: Dictionary = _hoja()
	if spr == null or spr.sprite_frames == null or hoja.is_empty() \
			or spr.sprite_frames.has_animation("festejo"):
		return
	var frames: SpriteFrames = spr.sprite_frames
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	var prefijo: String = String(hoja["hoja"])
	frames.add_animation("festejo")
	frames.set_animation_loop("festejo", true)
	frames.set_animation_speed("festejo", float(hoja["fps"]))
	for i in range(1, int(hoja["cuadros"]) + 1):
		var path: String = "%s%02d.png" % [prefijo, i]
		if ResourceLoader.exists(path):
			frames.add_frame("festejo", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("festejo") == 0:
		frames.remove_animation("festejo")
		return
	espalda_registra(spr, "festejo", prefijo, 1)


func _build_textos() -> void:
	var nombre: String = String(data.get("nombre", ""))
	var gesto: String = String(data.get("gesto", ""))
	var nuevo: bool = bool(data.get("nuevo", false))
	make_chyron(I18n.t("TU IDOLO TE ESPERABA"), CareerUi.display_name(nombre).to_upper(),
		team(), T_CHYRON_F)
	_cita = make_cita_idolo(nombre, I18n.t(String(IdoloEscenas.FESTEJO_FRASES[_variante()])))


	if UiKit.es_horizontal():
		_cita.anchor_top = 0.0
		_cita.anchor_bottom = 0.0
		_cita.offset_top = UiKit.top_safe_inset(get_viewport()) + CONOCE.CITA_ARRIBA_TUMBADO
		_cita.offset_bottom = _cita.offset_top
		_cita.grow_vertical = Control.GROW_DIRECTION_END
	make_card(T_CARD_F)
	var ficha: Dictionary = Celebs.by_id(Celebs.id_for(Celebs.GESTO, gesto))
	card_title(CareerTheme.caps(I18n.t(String(ficha.get("name", "")))), 40)


	card_sub(I18n.t("NUEVO FESTEJO") if nuevo else I18n.t("SU FESTEJO"),
		CareerTheme.MONEY if nuevo else Color.TRANSPARENT)
	card_stats([
		{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))], "k": I18n.t("la final")},
		{"v": str(int(data.get("anios", 0))), "k": I18n.t("temporadas después")},
	])
	var nota: String = I18n.t("Se lo ganaste en una final, a él.") \
			if _variante() == "activo" else I18n.t("Ganaste una final con su camiseta.")
	if nuevo:
		nota += " " + I18n.t("Lo estrenas en tu próximo gol.")
	card_note(nota)
	card_cta(I18n.t("SEGUIR"))




func _tick(_delta: float) -> void:
	if _idolo_fig == null:
		return
	_pon(_idolo_fig, "festejo" if t >= EL_FESTEJA and t < EL_PARA else "idle")
	_pon(player, "festejo" if t >= TU_FESTEJAS else "idle")
	var dice: bool = t >= EL_HABLA and t < EL_CALLA - 0.4
	var cara: CaraViva = CaraViva.de(_idolo_fig)
	if cara != null and cara._hablando != dice:
		cara.habla(dice)
	if _cita != null:
		_cita.modulate.a = clampf(minf((t - EL_HABLA) / 0.25,(EL_CALLA - t) / 0.3),
			0.0, 1.0)


func _pon(spr: AnimatedSprite3D, anim: String) -> void:
	if spr == null or spr.sprite_frames == null or not spr.sprite_frames.has_animation(anim):
		return
	if spr.animation != anim:
		spr.play(anim)
