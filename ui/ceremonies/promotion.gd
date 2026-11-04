extends Ceremony












const INVADERS: int = 130
const INVADE_R: Vector2 = Vector2(3.0, 26.0)
const FAN_HEIGHT_M: float = 1.72
const FAN_FACES: int = 6














const KEYS: Array = [
	{"t": 0.0, "dist": 28.0, "h": 16.0, "yaw": 170.0, "aim_y": 5.2, "fov": 44.0},
	{"t": 2.6, "dist": 13.5, "h": 4.2, "yaw": 128.0, "aim_y": 2.0, "fov": 38.0},
	{"t": 5.8, "dist": 6.2, "h": 0.85, "yaw": 86.0, "aim_y": 1.45, "fov": 32.0},
	{"t": 8.4, "dist": 5.0, "h": 0.62, "yaw": 56.0, "aim_y": 1.4, "fov": 34.0},
]

const T_INVASION: float = 2.6
const REACT_EVERY: float = 2.8

var _invaders: Array[AnimatedSprite3D] = []
var _invaded: bool = false
var _next_react: float = 0.0


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": true,











		"weather": "day",
		"kit": kit,
		"banner": I18n.t("SUBIMOS"),
		"board": I18n.t("ASCENSO"),
	})
	make_camera(KEYS)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	make_player(look)
	make_audio(1.0, true)
	stadium.crowd_excite(1.0)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 16.0
	flash_burst_at = T_INVASION
	confetti_colors = [accent, CareerTheme.MONEY, Color.WHITE]
	_spawn_invaders()

	make_chyron(I18n.t("ASCENSO"), String(data.get("div_name",
		Teams.div_name(div()))).to_upper(), team())
	make_card()
	card_title(I18n.tf("¡A {0}!",
		[String(data.get("div_name", Teams.div_name(div()))).to_upper()]), 40)
	card_sub(String(team().get("name", "")).to_upper())
	card_count(int(_invaders.size()), I18n.t("SALTARON AL CÉSPED · Y NO CABÍA NADIE MÁS"))
	card_note(I18n.t("Subir cambia el club entero: otro presupuesto, otros rivales, otra vida."))
	card_cta(I18n.t("SEGUIR"))








func _spawn_invaders() -> void:



	var pool: Array[SpriteFrames] = stadium.fan_frames_variants(true, FAN_FACES)
	var frames: SpriteFrames = pool[0] if not pool.is_empty() else null
	if frames == null:
		return
	for i in INVADERS:
		var ang: float = rng.randf() * TAU
		var r: float = sqrt(rng.randf()) *(INVADE_R.y - INVADE_R.x) + INVADE_R.x
		var pos: Vector3 = Vector3(sin(ang) * r, 0.0, CENTER_Z + cos(ang) * r)

		if absf(pos.x) > Stadium.FIELD_HALF_W - 2.0 \
				or pos.z < 3.0 or pos.z > Stadium.FIELD_DEPTH - 3.0:
			continue
		var fan: AnimatedSprite3D = AnimatedSprite3D.new()


		fan.sprite_frames = pool[i % pool.size()]
		fan.pixel_size = FAN_HEIGHT_M / 32.0
		fan.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		fan.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		fan.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		fan.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		fan.position = pos + Vector3(0.0, FAN_HEIGHT_M * 0.5, 0.0)
		fan.visible = false
		viewport.add_child(fan)
		fan.play("cheer" if frames.has_animation("cheer") else "idle")

		fan.speed_scale = rng.randf_range(0.75, 1.5)
		if fan.sprite_frames.get_frame_count(fan.animation) > 1:
			fan.frame = rng.randi_range(0,
				fan.sprite_frames.get_frame_count(fan.animation) - 1)
		_invaders.append(fan)


func _tick(_delta: float) -> void:
	if not _invaded and t >= T_INVASION:
		_invade()
	if _invaded and not ficha_puesta and t >= _next_react:
		_next_react = t + REACT_EVERY
		stadium.crowd_react("home", "goal")
		ovation(-2.0)


func _skipped() -> void:
	if not _invaded:
		_invade()





func _invade() -> void:
	_invaded = true
	_next_react = t + REACT_EVERY
	set_confetti(true)
	stadium.crowd_react("home", "goal")
	stadium.pulse_ads(4.0)
	ovation(2.0)
	applause(true)
	sting("fanfare", -5.0)
	for fan in _invaders:
		var d: float = Vector2(fan.position.x, fan.position.z - CENTER_Z).length()
		var delay: float = clampf((INVADE_R.y - d) / INVADE_R.y, 0.0, 1.0) * 1.1
		var tw: Tween = create_tween()
		tw.tween_interval(delay)
		tw.tween_callback(func() -> void:
			if is_instance_valid(fan):
				fan.visible = true)
