extends Ceremony

















const T_LLEGA: float = 3.6
const T_LUZ: float = 4.4

const KEYS: Array = [









	{"t": 0.0, "dist": 22.0, "h": 5.2, "yaw": 188.0, "aim_y": 3.4, "fov": 42.0,
		"focus_x": -0.4},
	{"t": T_LLEGA, "dist": 18.5, "h": 4.2, "yaw": 182.0, "aim_y": 3.2,
		"fov": 40.0, "focus_x": -0.4},

	{"t": T_LUZ + 0.4, "dist": 16.5, "h": 3.8, "yaw": 180.0, "aim_y": 3.3,
		"fov": 39.0, "focus_x": -0.4},
]

var _scape: HouseScape
var _walker: AnimatedSprite3D
var _lit: bool = false


var _from: Vector3 = Vector3(-4.6, 0.0, 7.2)
var _to: Vector3 = Vector3(0.0, 0.0, 2.3)


func _build() -> void:
	var lvl: int = House.clamp_level(int(data.get("level", Career.house_level)))

	var env: WorldEnvironment = WorldEnvironment.new()
	var e: Environment = Environment.new()
	e.background_mode = Environment.BG_COLOR
	e.background_color = Color("0d1118")
	e.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	e.ambient_light_color = Color("aeb4c4")
	e.ambient_light_energy = 0.7
	viewport.add_child(env)
	env.environment = e

	var moon: MeshInstance3D = MeshInstance3D.new()
	var sph: SphereMesh = SphereMesh.new()
	sph.radius = 0.8
	sph.height = 1.6
	var mm: StandardMaterial3D = StandardMaterial3D.new()
	mm.albedo_color = Color("e8e4d6")
	mm.emission_enabled = true
	mm.emission = Color("e8e4d6")
	mm.emission_energy_multiplier = 1.3
	mm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	sph.material = mm
	moon.mesh = sph
	moon.position = Vector3(7.5, 10.5, -16.0)
	viewport.add_child(moon)


	_scape = HouseScape.new()
	_scape.level = lvl
	_scape.extras = Career.house_extras


	_scape.huella = HouseScape.huella_de_plan(House.plan_of(lvl))
	_scape.accent = CareerTheme.accent()
	_scape.night = true
	_scape.lit = false
	viewport.add_child(_scape)




	focus = Vector3(0.0, 0.0, 2.6)
	_walker = make_player(KitRecolor.casual_of(GameState.team_custom), "south")
	_add_casual_walk(_walker)
	_walker.position = Vector3(_from.x,
		feet_offset(_walker.pixel_size) - PLAYER_SINK, _from.z)
	make_camera(KEYS)




	var terreno: bool = bool(data.get("terreno", false))
	var lado: int = int(data.get("lado", House.lado_of(Career.land_tier)))
	var nombre: String = I18n.t(String(House.level_data(lvl)["name"]))
	make_chyron(I18n.t("TERRENO") if terreno else I18n.t("MUDANZA"), nombre, team(), 1.2)
	card_at = 7.6
	make_card()
	card_title(I18n.t("TERRENO") if terreno else nombre)
	card_sub(I18n.t("EL SOLAR CRECE") if terreno else I18n.t("LAS LLAVES SON TUYAS"),
		CareerTheme.MONEY)
	var price: int = int(data.get("price", 0))
	if price > 0:
		card_count(price, I18n.t("LO QUE COSTO"))
	if terreno:
		card_note(I18n.tf(
			"El terreno crece a {0}×{0} m y todo lo que construiste se queda.",
			[str(lado)]))
	else:
		card_note(I18n.t(String(House.level_data(lvl)["desc"])))
	card_cta(I18n.t("ENTRAR"))


	confetti_colors = [Color("ffdcae"), Color("e8e2d2"), CareerTheme.MONEY]




func _add_casual_walk(spr: AnimatedSprite3D) -> void:
	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom)
	for d in ["south", "north", "east", "west"]:
		var anim: String = "walk_" + d
		var added: int = 0
		for i in range(1, WALK_FRAMES + 1):
			var path: String = "res://assets/sprites/anim/walk_player_%s_%02d.png" \
					% [d, i]
			if not ResourceLoader.exists(path):
				continue
			if added == 0:
				spr.sprite_frames.add_animation(anim)
				spr.sprite_frames.set_animation_loop(anim, true)
				spr.sprite_frames.set_animation_speed(anim, WALK_FPS)
			spr.sprite_frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
			added += 1


func _tick(_delta: float) -> void:

	var k: float = clampf(t / T_LLEGA, 0.0, 1.0)
	var at: Vector3 = _from.lerp(_to, smoothstep(0.0, 1.0, k))
	_walker.position = Vector3(at.x,
		feet_offset(_walker.pixel_size) - PLAYER_SINK, at.z)
	walk_play(_walker,(_to - _from) if k < 1.0 else Vector3.ZERO)
	if t >= T_LUZ and not _lit:
		_encender()




func _encender() -> void:
	_lit = true
	_scape.set_lit(true)
	screen_flash(0.2)
	punch_fov(2.5, 0.35)
	shake(0.05, 0.3)


	sting("fanfare", -8.0)
	set_confetti(true)


func _skipped() -> void:
	if not _lit:
		_encender()
	_walker.position = Vector3(_to.x,
		feet_offset(_walker.pixel_size) - PLAYER_SINK, _to.z)
	walk_play(_walker, Vector3.ZERO)
