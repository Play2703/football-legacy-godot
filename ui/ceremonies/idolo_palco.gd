extends "res://ui/ceremonies/dueno_palco.gd"
























const T_CHYRON_PALCO: float = 3.0
const T_DICE: float = 5.4
const T_CALLA: float = 9.2
const T_CARD_PALCO: float = 9.6


const TU_DX: float = 37.0
const TU_DZ: float = 0.7



const ESCALON: float = 0.45

const CITA_ARRIBA_TUMBADO: float = 280.0









const PalcoCinta := preload("res://ui/ceremonies/palco_cinta.gd")

var _en_cinta: bool = false
var _idolo_fig: AnimatedSprite3D = null
var _cita: PanelContainer = null
var _acomp: Array[AnimatedSprite3D] = []


func _variante() -> String:
	var v: String = String(data.get("variante", "doblete"))
	return v if IdoloEscenas.PALCO_FRASES.has(v) else "doblete"


func _build() -> void:
	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": false,
		"weather": "night",
		"kit": GameState.kit_variant(team(), 0),

		"board": "%d - %d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
	})
	_en_cinta = _mide_cinta()
	if not _en_cinta:
		_mide_palco()
		_build_palco()
	_build_idolo()
	focus = Vector3(_palco.x, 0.0, _palco.z)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look, "north")
	player.position.x = _palco.x - LADO_X * TU_DX
	player.position.z = _palco.z + TU_DZ
	var cara: CaraViva = CaraViva.de(player)
	if cara != null:
		cara.anima("alegria")
	make_camera(_keys())
	orbit_speed = DRIFT
	make_audio(1.0, false)
	_build_textos()




func _build_idolo() -> void:
	var semilla: String = String(data.get("cara", data.get("nombre", "idolo")))
	var cfg: Dictionary = KitRecolor.appearance_for(semilla, {})
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.name = "IdoloPalco"
	spr.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var frames: SpriteFrames = player_frames(cfg, "south", ESMOQUIN_SHEET, true)
	esmoquin_clap(frames, cfg)
	spr.sprite_frames = frames
	spr.position = Vector3(_palco.x, _palco.y +(0.0 if _en_cinta else ESCALON)
		+ feet_offset(spr.pixel_size, ESMOQUIN_SHEET + "00.png") - PLAYER_SINK, _palco.z)
	spr.play("clap" if frames.has_animation("clap") else "idle")
	viewport.add_child(spr)
	_idolo_fig = spr
	CaraViva.pon(spr)

	_dueno_y = spr.position.y
	_build_acompanantes(spr.position)




func _build_acompanantes(el: Vector3) -> void:
	_acomp = PalcoCinta.acompanantes(self, el, _idolo_fig.pixel_size,
		String(team().get("id", "palco")), LADO_X)





func _mide_cinta() -> bool:
	var m: Dictionary = PalcoCinta.mide(stadium, LADO_X, CENTER_Z)
	if m.is_empty():
		return false
	var cristal_x: float = float(m["cristal_x"])
	_hay_cinta = true
	_frente_x = cristal_x
	_palco = m["suelo"]
	PalcoCinta.abre(stadium, cristal_x, _palco.y, CENTER_Z, LADO_X)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.name = "LuzPalco"
	luz.light_color = Color(1.0, 0.86, 0.66)
	luz.light_energy = 1.6
	luz.omni_range = 5.0
	luz.position = Vector3(cristal_x - LADO_X * 1.2, _palco.y + 2.0, CENTER_Z)
	viewport.add_child(luz)
	return true


func _build_textos() -> void:
	var nombre: String = String(data.get("nombre", ""))
	var anios: int = int(data.get("anios", IdoloEscenas.PALCO_ANIOS))
	make_chyron(I18n.t("TU ÍDOLO, EN EL PALCO"), CareerUi.display_name(nombre).to_upper(),
		team(), T_CHYRON_PALCO)
	_cita = make_cita_idolo(nombre, I18n.t(String(IdoloEscenas.PALCO_FRASES[_variante()])))
	_cita.modulate.a = 0.0
	if UiKit.es_horizontal():
		_cita.anchor_top = 0.0
		_cita.anchor_bottom = 0.0
		_cita.offset_top = UiKit.top_safe_inset(get_viewport()) + CITA_ARRIBA_TUMBADO
		_cita.offset_bottom = _cita.offset_top
		_cita.grow_vertical = Control.GROW_DIRECTION_END
	make_card(T_CARD_PALCO)
	card_title(CareerUi.display_name(nombre).to_upper(), 40)
	card_sub(I18n.t("SE LEVANTÓ POR TI"))
	card_stats([
		{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
			"k": I18n.t("el derbi") if _variante() == "derbi" else I18n.t("el partido")},
		{"v": str(int(data.get("goles", 0))), "k": I18n.t("tus goles")},
		{"v": str(anios), "k": I18n.t("temporadas después")},
	])
	card_note(I18n.tf("Lo dijiste hace {0} temporadas. Hoy, en la que fue su casa, el palco entero miró cómo te aplaudía.",
		[anios]))
	card_cta(I18n.t("SEGUIR"))

	card_at = T_CARD_PALCO





func _keys() -> Array:
	var k: Array = super._keys()
	(k[0] as Dictionary)["dist"] = TU_DX + 6.0


	(k[0] as Dictionary)["yaw"] = 90.0
	(k[0] as Dictionary)["fov"] = 46.0
	if _en_cinta:





		var y: float = _palco.y
		(k[1] as Dictionary)["h"] = y + 0.6
		(k[1] as Dictionary)["aim_y"] = y + 1.1
		(k[2] as Dictionary)["h"] = y + 1.5
		(k[2] as Dictionary)["aim_y"] = y + 1.35
		(k[2] as Dictionary)["dist"] = 7.0


		(k[2] as Dictionary)["yaw"] = 90.0
	return k


func _tick(_delta: float) -> void:
	if _idolo_fig != null:
		var dice: bool = t >= T_DICE and t < T_CALLA - 0.4
		var anim: String = "idle" if dice or not _idolo_fig.sprite_frames.has_animation("clap") \
				else "clap"
		if _idolo_fig.animation != anim:
			_idolo_fig.play(anim)
		var cara: CaraViva = CaraViva.de(_idolo_fig)
		if cara != null and cara._hablando != dice:
			cara.habla(dice)
		for a in _acomp:
			var a_anim: String = "idle" if dice or not a.sprite_frames.has_animation("clap") \
					else "clap"
			if a.animation != a_anim:
				a.play(a_anim)
	if _cita != null:
		_cita.modulate.a = clampf(minf((t - T_DICE) / 0.25,(T_CALLA - t) / 0.3), 0.0, 1.0)


func _skipped() -> void:
	pass
