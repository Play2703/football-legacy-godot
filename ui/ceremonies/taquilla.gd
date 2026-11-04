extends Ceremony























































const KEYS: Array = [
	{"t": 0.0, "dist": 4.2, "h": 1.7, "yaw": 210.0, "aim_y": 1.2, "fov": 42.0,
		"focus_x": -0.25, "focus_z": 0.35},
	{"t": 3.0, "dist": 5.6, "h": 1.8, "yaw": 180.0, "aim_y": 1.2, "fov": 48.0,
		"focus_x": 0.05, "focus_z": 1.2},
	{"t": 6.4, "dist": 3.1, "h": 1.6, "yaw": 194.0, "aim_y": 0.92, "fov": 42.0,
		"focus_x": -1.55, "focus_z": 2.05},
]


const DRIFT: float = 0.42

const T_CHYRON: float = 1.0
const T_CARD: float = 7.4







const BENCH_X: float = -1.7
const BENCH_Z: float = 2.05
const BENCH_TOP: float = 0.46
const BENCH_W: float = 2.4
const BENCH_D: float = 0.42





const PROPS_X: float = -1.5


const BALL_M: float = 0.22



const BALLS_MAX: int = 5














const BAG_W: float = 0.56
const BAG_H: float = 0.38
const BAG_D: float = 0.28




const BAG_DX: float = 0.3






const CASE_X: float = -0.14
const CASE_Z: float = 1.62

var room: LockerRoom


var _club: String = ""






func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:
	_club = club_del_acto()

	focus = Vector3(-0.34, 0.0, 0.1)
	room = LockerRoom.new()
	room.host_viewport = viewport


	room.override_club = _club



	room.farewell = true



	room.show_captain = false
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 36.0)
	orbit_speed = DRIFT
	_build_case()
	_build_keepsakes()




	make_audio(0.0, false)

	var t_club: Dictionary = team()
	make_chyron(I18n.t("TU TAQUILLA"), String(t_club.get("name", "?")).to_upper(),
		t_club, T_CHYRON)
	make_card(T_CARD)





	card_title(I18n.t("SE VA UNA LEYENDA" if bool(data.get("leyenda", false))
		else "FIN DE ETAPA"), 40)
	card_sub(String(t_club.get("name", "?")).to_upper())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))





func _stats() -> Array:
	var seasons: int = maxi(int(data.get("seasons", 0)), 0)
	var apps: int = maxi(int(data.get("apps", 0)), 0)
	var goals: int = maxi(int(data.get("goals", 0)), 0)
	return [
		{"v": str(seasons) if seasons > 0 else "—", "k": I18n.t("temporadas")},
		{"v": str(apps) if apps > 0 else "—", "k": I18n.t("partidos")},
		{"v": str(goals), "k": I18n.t("goles")},
	]










func _note_line() -> String:
	var coh: Dictionary = data.get("coh", {})
	var estado: String = String(coh.get("estado", ""))








	var rotulo: String = I18n.t(Salida.rotulo(Salida.VIA_TRASPASO,
		String(coh.get("motivo", ""))))
	if rotulo.is_empty():
		estado = ""
	if estado == Salida.CUMPLIDO:
		return I18n.tf("Dijiste «{0}», y te vas a donde dijiste.", [rotulo])
	if estado == Salida.CONTRADICHO:


		return I18n.tf("Dijiste «{0}». Acabas firmando otra cosa.", [rotulo])



	if bool(data.get("palabra", false)):
		return I18n.t("Dijiste que te quedabas, y te vas igual. Tu grada no lo olvida.")
	var n: int = Keepsakes.of_kind(_mine_here(), Keepsakes.BALL).size()
	if n == 0:



		if bool(data.get("leyenda", false)):
			return I18n.t("La maleta va vacía. Lo que dejaste aquí no cabe en ella: se queda en la grada.")

		return I18n.t("Ni un balón. Aquí no se quedó nada tuyo, y tú no te llevas nada.")
	if n == 1:
		return I18n.t("Una sola cosa cabe en la maleta. Con una basta para acordarse.")
	return I18n.t("Lo que cabe en una maleta después de todos estos años.")





func _mine_here() -> Array:
	var out: Array = []
	for k in Career.keepsakes:
		if k is Dictionary and String((k as Dictionary).get("club", "")) == _club:
			out.append(k)
	return out





func _build_case() -> void:
	var col: Color = _accent_for().darkened(0.62)
	_slab(Vector3(0.46, 0.32, 0.2), Vector3(CASE_X, 0.16, CASE_Z), col)
	_slab(Vector3(0.16, 0.04, 0.04), Vector3(CASE_X, 0.35, CASE_Z),
		col.darkened(0.4))
	_slab(Vector3(0.48, 0.06, 0.21), Vector3(CASE_X, 0.2, CASE_Z), _accent_for())






func _build_keepsakes() -> void:
	var balls: Array = Keepsakes.of_kind(_mine_here(), Keepsakes.BALL)


	if balls.size() > BALLS_MAX:
		balls = balls.slice(balls.size() - BALLS_MAX)
	_place_balls(balls)
	_build_bag()










func _build_bag() -> void:
	var destino: String = String(data.get("to", ""))
	var t_dest: Dictionary = Teams.by_id(destino)
	if t_dest.is_empty():
		return
	var col_dest: Color = CareerTheme.accent_of(t_dest)






	var cuerpo: Color = Color("2b2723")



	if col_dest.get_luminance() < 0.32:
		col_dest = col_dest.lightened(0.42)
	var x: float = PROPS_X + BAG_DX
	var y: float = BENCH_TOP + BAG_H * 0.5
	_slab(Vector3(BAG_W, BAG_H, BAG_D), Vector3(x, y, BENCH_Z), cuerpo)
	_slab(Vector3(BAG_W * 0.34, 0.05, 0.05),
		Vector3(x, BENCH_TOP + BAG_H + 0.04, BENCH_Z), cuerpo.darkened(0.4))


	_slab(Vector3(BAG_W + 0.02, 0.14, BAG_D + 0.02),
		Vector3(x, y - BAG_H * 0.1, BENCH_Z), col_dest)





func _place_balls(balls: Array) -> void:
	if balls.is_empty():
		return





	var usable: float = BENCH_W * 0.55
	var step: float = usable / float(BALLS_MAX)
	var x0: float = PROPS_X - usable * 0.5 + step * 0.5
	for i in balls.size():
		var k: Dictionary = balls[i]






		var frames: SpriteFrames = BallDeco.frames_for(Keepsakes.fixture_of(k), true)
		if frames == null or not frames.has_animation("idle") \
				or frames.get_frame_count("idle") == 0:
			continue
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = frames.get_frame_texture("idle", 0)
		spr.pixel_size = BALL_M / float(maxi(1, spr.texture.get_height()))
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



		spr.position = Vector3(x0 + step * float(i),
			BENCH_TOP + BALL_M * 0.5, BENCH_Z + 0.1)
		viewport.add_child(spr)






func _slab(size: Vector3, pos: Vector3, col: Color) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	m.mesh = box
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 0.85
	m.material_override = mat
	m.position = pos
	viewport.add_child(m)
