extends Ceremony


























const GALA_SHEET: String = "res://assets/sprites/anim/gala_south_"









const KEYS: Array = [
	{"t": 0.0, "dist": 46.0, "h": 13.0, "yaw": 148.0, "aim_y": 1.0, "fov": 42.0},
	{"t": 4.0, "dist": 16.0, "h": 4.2, "yaw": 166.0, "aim_y": 1.2, "fov": 36.0},
	{"t": 8.0, "dist": 8.6, "h": 2.0, "yaw": 176.0, "aim_y": 1.1, "fov": 34.0},
]












const FRAME_X: float = -1.15
const FRAME_SIZE: Vector3 = Vector3(0.96, 1.18, 0.1)


const STAND_SIZE: Vector3 = Vector3(1.06, 0.15, 0.3)
const FRAME_Y: float = STAND_SIZE.y + FRAME_SIZE.y * 0.5 - 0.02
const JERSEY_H: float = 0.86




const GALA_CLAP_SHEET: String = "res://assets/sprites/anim/gala_clap_south_"








const TROPHY_XS: Array = [1.1, 1.8, -2.2, -2.9]
const PLINTH_SIZE: Vector3 = Vector3(0.55, 0.85, 0.45)
const TROPHY_H: float = 0.5

const TROPHY_SINK: float = 0.1


const DRIFT: float = -0.22
const T_CARD: float = 6.6

const T_BURST: float = 4.2



func _accent_for() -> Color:
	var nat: Dictionary = Nations.as_team(Career.nationality)
	if not nat.is_empty():
		return CareerTheme.accent_of(nat)
	return super()


func _build() -> void:
	var nat: Dictionary = Nations.as_team(Career.nationality)
	if nat.is_empty():
		nat = team()
	var kit: Dictionary = GameState.kit_variant(nat, 0)



	make_stadium({
		"div": div(),
		"attendance": 1.0,
		"party": false,
		"weather": "night",
		"kit": kit,
		"banner": I18n.t("GRACIAS"),
		"board": I18n.t("GRACIAS"),
	})
	focus = Vector3(0.0, 0.0, CENTER_Z)
	make_camera(KEYS)
	orbit_speed = DRIFT


	make_player(GameState.team_custom.duplicate(), "south", GALA_CLAP_SHEET, true)





	_build_framed_jersey(kit, int(data.get("number", _nat_shirt())))

	_build_trophies(int(data.get("wc", 0)), int(data.get("cont", 0)))
	make_audio(1.0, true)



	stadium.crowd_excite(0.75)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)
	flash_rate = 6.0
	flash_burst_at = T_BURST
	flash_burst_dur = 1.6


	make_chyron(I18n.t("ADIÓS INTERNACIONAL"), Nations.team_label(nat, "?").to_upper(),
		nat, 0.8)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t("SE RETIRA DE LA SELECCIÓN"))



	card_count(int(data.get("caps", 0)), I18n.t("APARICIONES CON TU PAÍS"))
	var titles: int = int(data.get("wc", 0)) + int(data.get("cont", 0))
	var stats: Array = [
		{"v": str(int(data.get("goals", 0))), "k": I18n.t("goles")},
		{"v": str(int(data.get("assists", 0))), "k": I18n.t("asist.")},
	]

	if titles > 0:
		stats.append({"v": str(titles), "k": I18n.t("títulos")})
	card_stats(stats)
	card_note(I18n.t("La camiseta del país no se cuelga: se entrega. Que la sude otro."))
	card_cta(I18n.t("SEGUIR"))










func _nat_shirt() -> int:
	var n: int = Career.nat_number()
	return n if n > 0 else GameState.player_number


func _build_framed_jersey(cfg: Dictionary, number: int) -> void:
	var fx: float = focus.x + FRAME_X

	var stand: MeshInstance3D = MeshInstance3D.new()
	var smesh: BoxMesh = BoxMesh.new()
	smesh.size = STAND_SIZE
	stand.mesh = smesh
	var stmat: StandardMaterial3D = StandardMaterial3D.new()
	stmat.albedo_color = Color(0.1, 0.11, 0.14)
	stmat.roughness = 0.9
	stand.material_override = stmat
	stand.position = Vector3(fx, STAND_SIZE.y * 0.5, focus.z)
	viewport.add_child(stand)

	var board: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = FRAME_SIZE
	board.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.17, 0.13, 0.1)
	mat.roughness = 0.95
	board.material_override = mat
	board.position = Vector3(fx, FRAME_Y, focus.z)
	viewport.add_child(board)



	var rim: MeshInstance3D = MeshInstance3D.new()
	var rq: QuadMesh = QuadMesh.new()
	rq.size = Vector2(FRAME_SIZE.x * 0.94, FRAME_SIZE.y * 0.94)
	rim.mesh = rq
	var rmat: StandardMaterial3D = StandardMaterial3D.new()
	rmat.albedo_color = CareerTheme.MONEY
	rmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	rim.material_override = rmat
	rim.position = Vector3(fx, FRAME_Y, focus.z + FRAME_SIZE.z * 0.5 + 0.01)
	viewport.add_child(rim)

	var mount: MeshInstance3D = MeshInstance3D.new()
	var mq: QuadMesh = QuadMesh.new()
	mq.size = Vector2(FRAME_SIZE.x * 0.8, FRAME_SIZE.y * 0.82)
	mount.mesh = mq
	var mmat: StandardMaterial3D = StandardMaterial3D.new()
	mmat.albedo_color = Color(0.93, 0.91, 0.86)
	mmat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mount.material_override = mmat
	mount.position = Vector3(fx, FRAME_Y, focus.z + FRAME_SIZE.z * 0.5 + 0.02)
	viewport.add_child(mount)



	var cfg_n: Dictionary = cfg.duplicate()
	cfg_n["apellido"] = Career.nombre_espalda()
	var shirt: Sprite3D = make_jersey(cfg_n, number, JERSEY_H, FRAME_Y)
	shirt.position = Vector3(fx, FRAME_Y, focus.z + FRAME_SIZE.z * 0.5 + 0.04)
	shirt.billboard = BaseMaterial3D.BILLBOARD_DISABLED





func _build_trophies(wc: int, cont: int) -> void:
	var kinds: Array = []
	for i in wc:
		kinds.append("mundial")
	for i in cont:



		kinds.append("continental")
	var n: int = mini(kinds.size(), TROPHY_XS.size())
	for i in n:
		var px: float = focus.x + float(TROPHY_XS[i])
		var pz: float = focus.z + 0.45
		var box: MeshInstance3D = MeshInstance3D.new()
		var mesh: BoxMesh = BoxMesh.new()
		mesh.size = PLINTH_SIZE
		box.mesh = mesh
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = Color(0.1, 0.11, 0.14)
		mat.roughness = 0.9
		box.material_override = mat
		box.position = Vector3(px, PLINTH_SIZE.y * 0.5, pz)
		viewport.add_child(box)
		var skirt: MeshInstance3D = MeshInstance3D.new()
		var sq: QuadMesh = QuadMesh.new()
		sq.size = Vector2(PLINTH_SIZE.x * 0.9, PLINTH_SIZE.y * 0.55)
		skirt.mesh = sq
		var smat: StandardMaterial3D = StandardMaterial3D.new()
		smat.albedo_color = accent
		smat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		skirt.material_override = smat

		skirt.position = Vector3(px, PLINTH_SIZE.y * 0.55,
			pz + PLINTH_SIZE.z * 0.5 + 0.01)
		viewport.add_child(skirt)
		make_trophy(String(kinds[i]),
			Vector3(px, PLINTH_SIZE.y + TROPHY_H * 0.5 - TROPHY_SINK, pz),
			TROPHY_H)
