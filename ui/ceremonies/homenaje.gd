extends Ceremony




























const ATT: float = 0.95
const T_CHYRON: float = 2.2

const T_ENTREGA: float = 5.0
const ENTREGA_DUR: float = 0.7
const T_CARD: float = 8.6



const ME_X: float = -0.55
const PRES_X: float = 0.55


const PRES_SHEET: String = "res://assets/sprites/anim/coach_sostiene_south_"
const PRES_ALTO: float = 1.7
const PRES_FPS: float = 5.0





const FRAME_W: float = 0.8
const FRAME_H: float = 0.98
const FRAME_Y: float = 1.02
const FRAME_DZ: float = 0.45
const SHIRT_H: float = 0.74

const FRAME_X0: float = PRES_X - 0.06
const FRAME_X1: float = 0.0
const PLATE_H: float = 0.085




const CORRO: int = 10
const CORRO_R: Vector2 = Vector2(4.6, 2.2)
const CORRO_Z: float = -1.6
const CORRO_DEG: float = 62.0



const KEYS: Array = [


	{"t": 0.0, "dist": 36.0, "h": 17.0, "yaw": 148.0, "aim_y": 6.0, "fov": 42.0},
	{"t": 3.0, "dist": 11.5, "h": 3.4, "yaw": 166.0, "aim_y": 1.3, "fov": 42.0},
	{"t": T_ENTREGA + 0.5, "dist": 5.4, "h": 1.6, "yaw": 178.0, "aim_y": 1.25,
		"fov": 40.0},
]

var _marco: Node3D
var _entregado: bool = false
var _pres: AnimatedSprite3D = null



var _pres_look: Dictionary = {}


func _build() -> void:
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var apps: int = _apps()
	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": kit,


		"board": board_fit(str(apps)),
		"banner": I18n.t("GRACIAS") + " " + Career.nombre_espalda(),
	})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS, 42.0)
	orbit_speed = -0.8
	make_player(GameState.player_look(), "south")
	player.position = Vector3(ME_X, player.position.y, CENTER_Z)
	_presidente()
	_make_marco(kit, apps)
	_corro(kit)
	make_audio(ATT, false)
	stadium.crowd_excite(0.6)

	applause(true, -13.0)

	flash_pool = stand_flash_pool(CENTER_Z, 34.0)
	flash_rate = 5.0
	flash_burst_at = T_ENTREGA

	make_chyron(I18n.t("HOMENAJE"), CareerTheme.caps(Career.player_name), team(),
		T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.tf("{0} PARTIDOS", [apps]), 46)
	card_club(team())
	card_stats(_stats())
	card_note(I18n.tf(
		"{0} veces con esta camiseta. El club te lo agradece antes del saque.", [apps]))
	card_cta(I18n.t("SEGUIR"))


func _apps() -> int:
	return maxi(int(data.get("apps", 100)), 1)




func _stats() -> Array:
	return [
		{"v": str(maxi(int(data.get("goals", 0)), 0)), "k": I18n.t("goles")},
		{"v": str(maxi(int(data.get("assists", 0)), 0)), "k": I18n.t("asistencias")},
		{"v": str(maxi(int(data.get("seasons", 1)), 1)), "k": I18n.t("temporadas")},
	]


func _presidente() -> void:


	_pres_look = directivo_look()
	var frames: SpriteFrames = player_frames(_pres_look, "south", PRES_SHEET, true)
	if frames.get_frame_count("idle") == 0:
		return
	frames.set_animation_speed("idle", PRES_FPS)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = PRES_ALTO / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(PRES_X,
		feet_offset(spr.pixel_size, PRES_SHEET + "00.png"), CENTER_Z)
	viewport.add_child(spr)
	spr.play("idle")
	_pres = spr


func _make_marco(kit: Dictionary, apps: int) -> void:
	_marco = Node3D.new()
	viewport.add_child(_marco)
	_marco.position = Vector3(FRAME_X0, FRAME_Y, CENTER_Z + FRAME_DZ)
	_box(_marco, Vector3(FRAME_W, FRAME_H, 0.05), Vector3.ZERO, Color("2b1d12"))


	_box(_marco, Vector3(FRAME_W - 0.09, FRAME_H - 0.09, 0.02), Vector3(0.0, 0.0, 0.03),
		Color("d9d0b8"))
	var tex: Texture2D = JerseyArt.texture_named(kit, apps, Career.nombre_espalda())
	if tex != null:
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = tex
		spr.pixel_size = SHIRT_H / float(maxi(1, tex.get_height()))
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

		spr.position = Vector3(0.0, 0.05, 0.05)
		_marco.add_child(spr)
	_plate(apps)





func _plate(apps: int) -> void:
	var l1: String = PixelText.normalize(CareerTheme.caps(I18n.tf("{0} PARTIDOS", [apps])))
	var l2: String = PixelText.normalize(CareerTheme.caps(String(team().get("name", ""))))
	var px: int = 2
	var ancho: int = maxi(PixelText.text_width(l1, px), PixelText.text_width(l2, px)) + 10
	var alto: int = PixelText.GLYPH_H * px * 2 + 12
	var img: Image = Image.create(ancho, alto, false, Image.FORMAT_RGBA8)
	img.fill(Color("b39a5e"))
	for x in ancho:
		img.set_pixel(x, 0, Color("d8c28a"))
		img.set_pixel(x, alto - 1, Color("7a6638"))
	var ink: Color = Color("2a2112")
	PixelText.draw_text(img,(ancho - PixelText.text_width(l1, px)) / 2, 4, l1, ink, px)
	PixelText.draw_text(img,(ancho - PixelText.text_width(l2, px)) / 2,
		4 + PixelText.GLYPH_H * px + 3, l2, ink, px)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = ImageTexture.create_from_image(img)
	spr.pixel_size = PLATE_H / float(alto)
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.position = Vector3(0.0, - FRAME_H * 0.5 + 0.075, 0.05)
	_marco.add_child(spr)











static func corro_people(plantel: Array, socios: Array, n: int = CORRO) -> Array:
	var out: Array = plantel.duplicate()
	var centro: int = n / 2 - 1
	for s in socios:
		if int((s as Dictionary).get("v", 0)) <= 0:
			continue
		var nm: String = String((s as Dictionary).get("name", ""))
		for i in out.size():
			if String((out[i] as Dictionary).get("name", "")) != nm:
				continue
			var quien: Dictionary = out[i]
			out.remove_at(i)
			out.insert(mini(centro, out.size()), quien)
			return out.slice(0, n)
	return out.slice(0, n)


func _corro(kit: Dictionary) -> void:
	var people: Array = corro_people(
		squad_people(String(team().get("id", "")), PEOPLE_MAX, true), Career.socios_top(3))
	var pool: Array[SpriteFrames] = people_frames_pool(people, kit, "south", CLAP_SHEET)
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px, CLAP_SHEET + "00.png") - PLAYER_SINK
	var n: int = pool.size()
	for i in n:
		var k: float =(float(i) / float(maxi(n - 1, 1))) * 2.0 - 1.0
		var a: float = deg_to_rad(k * CORRO_DEG)
		var at: Vector3 = Vector3(sin(a) * CORRO_R.x, 0.0,
			CENTER_Z + CORRO_Z - cos(a) * CORRO_R.y)
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = pool[i]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = at + Vector3(0.0, y, 0.0)
		viewport.add_child(s)
		s.play("idle")

		s.frame = i % 4
		s.speed_scale = rng.randf_range(0.85, 1.2)


func _box(parent: Node3D, size: Vector3, pos: Vector3, col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	m.mesh = b
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.85
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = pos
	parent.add_child(m)
	return m


func _tick(_delta: float) -> void:
	if t < T_ENTREGA:
		return
	var k: float = clampf((t - T_ENTREGA) / ENTREGA_DUR, 0.0, 1.0)
	_marco.position.x = lerpf(FRAME_X0, FRAME_X1, smoothstep(0.0, 1.0, k))
	if not _entregado:
		_entregar()



func _entregar() -> void:
	_entregado = true
	ovation(1.0)
	punch_fov(2.0, 0.4)
	stadium.crowd_excite(1.0)
	_suelta()







func _suelta() -> void:
	if _pres == null:
		return
	var frames: SpriteFrames = player_frames(_pres_look, "south", COACH_IDLE_SHEET, true)
	if frames.get_frame_count("idle") == 0:
		return
	_pres.sprite_frames = frames
	_pres.position.y = feet_offset(_pres.pixel_size, COACH_IDLE_ART)
	_pres.play("idle")


func _skipped() -> void:
	if not _entregado:
		_entregar()
	_marco.position.x = FRAME_X1
