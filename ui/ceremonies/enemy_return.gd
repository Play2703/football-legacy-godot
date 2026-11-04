extends Ceremony































const KEYS: Array = [
	{"t": 0.0, "dist": 9.0, "h": 1.9, "yaw": 256.0, "aim_y": 1.25, "fov": 34.0},
	{"t": 3.2, "dist": 16.5, "h": 4.6, "yaw": 236.0, "aim_y": 1.9, "fov": 42.0},
	{"t": 6.4, "dist": 24.0, "h": 8.4, "yaw": 216.0, "aim_y": 2.6, "fov": 46.0},
]


const DRIFT: float = -0.6









const FOCUS_X: float = 29.5


const ATT: float = 0.97












const T_BOO: float = 0.55
const T_CARD: float = 5.4









const PIG_COUNT: int = 14



const PIG_HERO: Array = [
	{"t": 1.55, "fly": 1.0, "z": -2.6, "x": 31.2, "row": 3.0, "size": 1.15},
	{"t": 2.2, "fly": 0.92, "z": 1.9, "x": 28.6, "row": 6.5, "size": 1.05},
]
const PIG_FIRST: float = 2.5
const PIG_LAST: float = 6.8







const PIG_ROW_MIN: float = 1.5
const PIG_ROW_MAX: float = 11.0
const PIG_ARC: float = 3.4




const PIG_SIZE: float = 0.48



const PIG_SKIN: Color = Color("d98a96")
const PIG_DARK: Color = Color("a85f6d")
const PIG_LINE: Color = Color("6b3540")
const PIG_CUT: Color = Color("8c2733")

var _booed: bool = false
var _pigs: Array[Dictionary] = []
var _pig_tex: ImageTexture
var _landed: int = 0

const MATCH_SCENE: String = "res://features/match/match.tscn"



var _from_queue: bool = false















func _consume() -> Dictionary:
	var armed: Dictionary = Career.take_enemy_return()
	if not armed.is_empty():
		return armed
	if String(Career.next_ceremony().get("kind", "")) == Ceremonies.ENEMY_RETURN:
		_from_queue = true
		return Career.consume_ceremony()
	return {}





func _ready() -> void:
	super()
	if data.is_empty() and not _leaving:
		SceneFade.to_scene(HUB_SCENE if _from_queue else MATCH_SCENE)







func _leave() -> void:
	if _leaving:
		return
	if standalone or _from_queue:
		super()
		return
	_leaving = true
	SceneFade.to_scene(MATCH_SCENE)







func _accent_for() -> Color:
	return CareerTheme.DANGER


func _build() -> void:


	var home: Dictionary = team()
	var home_kit: Dictionary = GameState.kit_variant(home, 0)
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,




		"weather": "day",
		"kit": home_kit,
		"banner": "",
		"board": I18n.t("VISITANTE"),
	})


	focus = Vector3(FOCUS_X, 0.0, CENTER_Z)
	make_camera(KEYS)
	orbit_speed = DRIFT



	var away_id: String = String(data.get("away_club", vivo_de("club", GameState.player_team_id)))
	var away: Dictionary = Teams.by_id(away_id)
	var away_kit: Dictionary = GameState.kit_variant(
		away if not away.is_empty() else home, 0)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(away_kit, true)








	make_player(look)
	player.sprite_frames = player_frames(look, "south", CLAP_SHEET)







	espalda_registra(player, "idle", player_prefix("south", CLAP_SHEET), 0)
	player.play("idle")

	make_audio(ATT, false)


	flash_pool = press_flash_pool(Vector3(FOCUS_X, 1.2, CENTER_Z), 18)
	flash_rate = 2.4

	_pig_tex = _make_pig_texture()
	for p in PIG_HERO:
		_pigs.append(_spawn_pig(p))




	var n: int = maxi(PIG_COUNT - PIG_HERO.size(), 0)
	for i in n:


		var k: float = float(i) / maxf(float(n - 1), 1.0)
		_pigs.append(_spawn_pig({
			"t": lerpf(PIG_FIRST, PIG_LAST, k) + rng.randf_range(-0.22, 0.22),
			"fly": rng.randf_range(0.82, 1.18),
			"z": rng.randf_range(-8.0, 8.0),
			"x": rng.randf_range(26.5, 33.5),
			"row": rng.randf_range(PIG_ROW_MIN, PIG_ROW_MAX),
			"size": rng.randf_range(0.85, 1.15),
		}))

	make_chyron(I18n.t("VUELTA"), String(home.get("name", "")).to_upper(), home, 1.6)
	make_card(T_CARD)
	card_title(I18n.t("NO TE HAN PERDONADO"), 38)
	card_sub(String(home.get("name", "")).to_upper())
	card_note(I18n.t("Te fuiste al rival. Cada vez que vuelvas a este campo la grada "
		+ "empezará en tu contra, y eso ya no se quita."))
	card_cta(I18n.t("SEGUIR"))


func _tick(_delta: float) -> void:
	if not _booed and t >= T_BOO:
		_boo()
	for pig in _pigs:
		_tick_pig(pig)


func _skipped() -> void:
	if not _booed:
		_boo()









func _boo() -> void:
	_booed = true




	stadium.crowd_boo(T_CARD + 1.4)
	sting("whistle", -3.0)
	ovation(-2.0)











func _spawn_pig(cfg: Dictionary) -> Dictionary:
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = _pig_tex
	spr.pixel_size = PIG_SIZE * float(cfg.get("size", 1.0)) / 16.0
	spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.visible = false
	viewport.add_child(spr)


	var row: float = float(cfg.get("row", 4.0))
	var from: Vector3 = Vector3(Stadium.SIDE_STAND_X + row,
		1.0 +(row - 1.5) * 1.6 + 0.85,
		CENTER_Z + float(cfg["z"]) * 1.6)


	var to: Vector3 = Vector3(float(cfg["x"]), PIG_SIZE * 0.34,
		CENTER_Z + float(cfg["z"]))
	return {"node": spr, "from": from, "to": to, "t0": float(cfg["t"]),
		"fly": float(cfg["fly"]), "landed": false}





func _tick_pig(pig: Dictionary) -> void:
	var spr: Sprite3D = pig["node"]
	if not is_instance_valid(spr):
		return
	var t0: float = float(pig["t0"])
	if t < t0:
		return
	var k: float = clampf((t - t0) / float(pig["fly"]), 0.0, 1.0)
	spr.visible = true
	var from: Vector3 = pig["from"]
	var to: Vector3 = pig["to"]
	var pos: Vector3 = from.lerp(to, k)

	pos.y += PIG_ARC * 4.0 * k *(1.0 - k)
	spr.position = pos

	spr.rotation.z =(1.0 - k) * 5.5
	if k >= 1.0 and not pig["landed"]:
		pig["landed"] = true
		_landed += 1


		if _landed == 1:
			shake(0.06, 0.22)
			sting("whistle", -9.0)





func _make_pig_texture() -> ImageTexture:
	var img: Image = Image.create(16, 16, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))

	for y in range(3, 14):
		for x in range(16):
			var dx: float =(float(x) - 7.5) / 6.4
			var dy: float =(float(y) - 8.2) / 5.2
			if dx * dx + dy * dy <= 1.0:
				img.set_pixel(x, y, PIG_SKIN)

	for i in 3:
		for x in range(2 + i, 6):
			img.set_pixel(x, 4 - i + 2, PIG_DARK)
		for x in range(10, 14 - i):
			img.set_pixel(x, 4 - i + 2, PIG_DARK)


	for y in range(9, 13):
		for x in range(5, 11):
			img.set_pixel(x, y, PIG_DARK)
	img.set_pixel(6, 10, PIG_LINE)
	img.set_pixel(9, 10, PIG_LINE)

	for x in range(4, 7):
		img.set_pixel(x, 7, PIG_LINE)
	for x in range(9, 12):
		img.set_pixel(x, 7, PIG_LINE)


	for y in range(13, 15):
		for x in range(5, 11):
			img.set_pixel(x, y, PIG_CUT)
	return ImageTexture.create_from_image(img)
