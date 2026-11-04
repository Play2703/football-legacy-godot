extends Ceremony















































const KEYS: Array = [
	{"t": 0.0, "dist": 5.0, "h": 1.76, "yaw": 182.0, "aim_y": 1.3, "fov": 50.0,
		"focus_x": -1.9, "focus_z": 2.6},
	{"t": 3.6, "dist": 2.6, "h": 1.5, "yaw": 180.0, "aim_y": 1.44, "fov": 46.0,
		"focus_x": LockerRoom.BOARD_X, "focus_z": LockerRoom.BOARD_Z + 0.05},
]


const DRIFT: float = 0.35

const T_CHYRON: float = 1.4
const T_CARD: float = 6.4








const COACH_X: float = -1.45
const COACH_Z: float = 3.1
const COACH_H: float = 1.8












const FACE_W: int = 256
const FACE_H: int = 180






const FACE_Z: float = LockerRoom.BOARD_Z + 0.045
const FACE_M: float = 0.94 / float(FACE_W)









const PH_W: int = 76
const PH_H: int = 92
const PH_C: Vector2i = Vector2i(128, 88)
const PH_BORDE: int = 5


const PH_FONDO: Color = Color("b9c2ca")
const PH_PAPEL: Color = Color("f2efe6")


const CINTA: Color = Color("e8dfae")










const FLECHA_W: int = 5
const FLECHA_PUNTA: int = 16


const NUM_FONT: int = 5

var room: LockerRoom






func _accent_for() -> Color:
	return CareerTheme.DANGER




func _rival() -> Dictionary:
	var rt: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rt if not rt.is_empty() else team()


func _build() -> void:


	focus = Vector3(-2.0, 0.0, 2.9)
	room = LockerRoom.new()
	room.host_viewport = viewport


	room.override_club = String(_rival().get("id", ""))

	room.ajena = true


	room.force_club = true


	room.show_captain = false


	room.face_x = LockerRoom.BOARD_X







	var yaw: float = deg_to_rad(float(KEYS[0]["yaw"]))
	room.face_z = LockerRoom.BOARD_Z
	room.face_derecha = Vector3(- cos(yaw), 0.0, - sin(yaw))
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT




	var rival_id: String = String(_rival().get("id", ""))
	coach_sprite(Vector3(COACH_X, 0.0, COACH_Z), COACH_H,
		Coach.look_de(Coaches.face_of(rival_id)), Coaches.name_of(rival_id), true,
		Coaches.nivel_of(rival_id))
	_build_board_face()



	var rv: Dictionary = _rival()
	make_chyron(I18n.t("LA PIZARRA DEL RIVAL"),
		String(rv.get("name", "?")).to_upper(), rv, T_CHYRON)
	make_card(T_CARD)
	card_title(I18n.t("ESE ERES TU"), 40)
	card_club(rv)
	card_sub(I18n.t("LA CHARLA DE HOY"))
	card_stats(_stats())
	card_note(I18n.t("De todo lo que hay en esa pizarra, la única foto es la tuya."))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var a: int = maxi(int(data.get("a", 0)), 0)
	var pj: int = maxi(int(data.get("pj", 0)), 0)
	return [
		{"v": str(maxi(int(data.get("g", 0)), 0)), "k": I18n.t("goles")},
		{"v": str(a) if a > 0 else "—", "k": I18n.t("asist.")},
		{"v": str(pj) if pj > 0 else "—", "k": I18n.t("partidos")},
	]















func _build_board_face() -> void:
	var img: Image = Image.create(FACE_W, FACE_H, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	_flechas(img)
	_foto(img)
	_dorsal(img)

	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(float(FACE_W) * FACE_M, float(FACE_H) * FACE_M)
	quad.mesh = qm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA


	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST


	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	quad.material_override = mat
	quad.position = Vector3(LockerRoom.BOARD_X, 1.44, FACE_Z)
	viewport.add_child(quad)







func _flechas(img: Image) -> void:
	var col: Color = CareerTheme.DANGER
	var hacia: Vector2 = Vector2(float(PH_C.x), float(PH_C.y))
	for desde in [Vector2(24.0, 158.0), Vector2(232.0, 158.0)]:
		var d: Vector2 = desde
		var dir: Vector2 =(hacia - d).normalized()


		var fin: Vector2 = hacia - dir *(float(PH_W) * 0.5 + float(PH_BORDE) + 7.0)
		_linea(img, d, fin, FLECHA_W, col)
		_punta(img, fin, dir, FLECHA_PUNTA, col)




func _linea(img: Image, a: Vector2, b: Vector2, w: int, col: Color) -> void:
	var pasos: int = int(maxf(a.distance_to(b), 1.0))
	for i in pasos + 1:
		var p: Vector2 = a.lerp(b, float(i) / float(pasos))
		_bloque(img, int(p.x), int(p.y), w, col)





func _punta(img: Image, tip: Vector2, dir: Vector2, size: int, col: Color) -> void:
	var perp: Vector2 = Vector2(- dir.y, dir.x)
	for i in size:
		var k: float = float(i) / float(size)
		var centro: Vector2 = tip - dir * float(i)
		var medio: float = float(size) * 0.55 * k
		var j: float = - medio
		while j <= medio:
			_bloque(img, int(centro.x + perp.x * j), int(centro.y + perp.y * j),
				1, col)
			j += 1.0


func _bloque(img: Image, x: int, y: int, w: int, col: Color) -> void:
	var r: int = w / 2
	for dy in range(- r, r + 1):
		for dx in range(- r, r + 1):
			var px: int = x + dx
			var py: int = y + dy
			if px >= 0 and py >= 0 and px < FACE_W and py < FACE_H:
				img.set_pixel(px, py, col)












func _foto(img: Image) -> void:
	var x0: int = PH_C.x - PH_W / 2
	var y0: int = PH_C.y - PH_H / 2


	_rect(img, x0 - PH_BORDE, y0 - PH_BORDE, PH_W + PH_BORDE * 2,
		PH_H + PH_BORDE * 2, PH_PAPEL)
	_rect(img, x0, y0, PH_W, PH_H, PH_FONDO)
	var cara: Image = _cara()
	if cara != null:
		img.blend_rect(cara, Rect2i(0, 0, cara.get_width(), cara.get_height()),
			Vector2i(x0, y0))


	_rect(img, PH_C.x - 15, y0 - PH_BORDE - 5, 30, 11, CINTA)





func _cara() -> Image:
	return retrato_image(PH_W, PH_H, GameState.kit_variant(team(), 0))




func _dorsal(img: Image) -> void:
	var txt: String = str(maxi(int(data.get("number", 0)), 0))
	var w: int = PixelText.text_width(txt, NUM_FONT)
	PixelText.draw_text(img, PH_C.x - w / 2,
		PH_C.y + PH_H / 2 + PH_BORDE + 6, txt, CareerTheme.DANGER, NUM_FONT)






func _rect(img: Image, x: int, y: int, w: int, h: int, col: Color) -> void:
	for dy in h:
		for dx in w:
			var px: int = x + dx
			var py: int = y + dy
			if px >= 0 and py >= 0 and px < FACE_W and py < FACE_H:
				img.set_pixel(px, py, col)




func _u(dx: float) -> float:
	return (dx + 0.47) / 0.94 * float(FACE_W)


func _v(y: float) -> float:
	return (1.77 - y) / 0.66 * float(FACE_H)
