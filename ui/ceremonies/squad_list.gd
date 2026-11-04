extends Ceremony


































const MODE_STARTER: String = "starter"
const MODE_BENCH: String = "bench"
const MODE_OUT: String = "out"











const BIB_COLOR: Color = Color("e8811f")
const BIB_PX: int = 32
const BIB_H: float = 0.66





const BIB_BODY_F: float = 0.585







const KEYS: Array = [
	{"t": 0.0, "dist": 7.2, "h": 2.4, "yaw": 180.0, "aim_y": 1.32, "fov": 46.0},
	{"t": 2.6, "dist": 5.8, "h": 1.95, "yaw": 180.0, "aim_y": 1.38, "fov": 40.0},
	{"t": 5.4, "dist": 3.7, "h": 1.62, "yaw": 180.0, "aim_y": 1.46, "fov": 31.0},
]



const YOU_F: float = 3.35
const YOU_R: float = 0.6





const XI_N: int = 11
const SUBS_N: int = 7
const DRIFT_OK: float = -0.5
const DRIFT_BAD: float = -0.18




const FOCUS_T0: float = 3.1
const FOCUS_T1: float = 5.6

var _mood: float = 0.0
var _focus_from: Vector3 = Vector3.ZERO
var _focus_to: Vector3 = Vector3.ZERO
var _elapsed: float = 0.0


func mode() -> String:
	return String(data.get("mode", MODE_STARTER))




func _accent_for() -> Color:
	if mode() == MODE_OUT:
		return CareerTheme.DANGER
	return super()


func _build() -> void:
	var bad: bool = mode() != MODE_STARTER


	_mood = 0.0 if mode() == MODE_STARTER else (0.55 if mode() == MODE_BENCH else 1.0)
	var deco: DecisionRoom = DecisionRoom.new()
	deco.kind = DecisionRoom.INSTALACIONES
	deco.div = div()
	deco.club_color = CareerTheme.accent_of(team())
	deco.crest = crest_texture(team())
	deco.mood = _mood
	deco.list_title = I18n.t(_list_title())
	var rows: Array = _list_rows()
	deco.list_rows = rows
	deco.list_mark = _mark_row(rows)
	deco.list_mark_bad = mode() == MODE_OUT
	viewport.add_child(deco)















	_focus_from = deco.cone(DecisionRoom.INST_BOARD_F,
		DecisionRoom.INST_BOARD_R * 0.6 + YOU_R * 0.4)
	_focus_from.y = DecisionRoom.INST_BOARD_Y
	_focus_to = deco.cone(DecisionRoom.INST_BOARD_F, DecisionRoom.INST_BOARD_R)
	_focus_to.y = DecisionRoom.INST_BOARD_Y
	focus = _focus_from
	make_camera(KEYS)
	orbit_speed = DRIFT_BAD if bad else DRIFT_OK

	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look)
	var at: Vector3 = deco.cone(YOU_F, YOU_R)
	player.position.x = at.x
	player.position.z = at.z
	_wear_bib(at)

	make_audio(0.05, false)

	make_chyron(I18n.t(_kicker()), String(team().get("name", "?")).to_upper(), team())
	make_card(6.6)
	card_title(I18n.t(_title()), 40)
	card_sub(I18n.t(_subtitle()))
	card_note(I18n.t(_note()))
	card_cta(I18n.t("SEGUIR" if bad else "A ENTRENAR"))




func _kicker() -> String:
	return "NO CONVOCADO" if mode() == MODE_OUT else "LA LISTA"


func _list_title() -> String:
	if mode() == MODE_OUT:
		return "CONVOCATORIA"
	return "ONCE INICIAL"





















func _plantel() -> Array:
	var guardado: Variant = data.get("plantel")
	if guardado is Array and not (guardado as Array).is_empty():
		return guardado
	return Squad.of(club_del_acto())


func _recuerdo() -> Dictionary:
	var out: Dictionary = data.duplicate(true)
	var filas: Array = []
	for row in Squad.of(club_del_acto()):
		var r: Dictionary = row
		filas.append({"name": String(r.get("name", "")), "pos": String(r.get("pos", "")),
			"number": int(r.get("number", 0))})
	out["plantel"] = filas
	return out


func _list_rows() -> Array:
	var squad: Array = _plantel()
	var mine: String = CareerTheme.caps(Career.player_name)


	var pool: Array = []
	for row in squad:
		var nm: String = String((row as Dictionary).get("name", "")).to_upper()
		if nm.is_empty() or nm == mine:
			continue
		pool.append(row)
	var you: Dictionary = {
		"name": mine,



		"pos": Squad.USER_POS,
		"number": GameState.player_number,
	}
	var xi: Array = pool.slice(0, XI_N)
	var subs: Array = pool.slice(XI_N, XI_N + SUBS_N)












	var slot: int = Squad.user_index(xi)
	match mode():
		MODE_STARTER:


			if slot >= 0:
				subs.insert(0, xi[slot])
				xi[slot] = you
		MODE_BENCH:


			subs.insert(0, you)
		_:
			pass
	var out: Array = [{"left": I18n.t("TITULARES"), "right": "", "head": true}]
	for i in xi.slice(0, XI_N).size():
		var fila: Dictionary = _row_of(xi[i], mine)



		fila["asiento"] = i == slot
		out.append(fila)
	out.append({"left": I18n.t("SUPLENTES"), "right": "", "head": true})
	for row in subs.slice(0, SUBS_N):
		out.append(_row_of(row, mine))
	return out





func _row_of(row: Dictionary, mine: String) -> Dictionary:
	var name: String = String(row.get("name", "")).to_upper()
	var surname: String = name.get_slice(" ", name.count(" "))
	var num: int = int(row.get("number", 0))
	var left: String =("%d %s" % [num, surname]) if num > 0 else surname
	return {
		"left": left,
		"right": String(row.get("pos", "")).to_upper(),
		"head": false,
		"mine": name == mine,
	}







func _mark_row(rows: Array) -> int:
	for i in rows.size():
		if bool((rows[i] as Dictionary).get("mine", false)):
			return i
	for i in rows.size():
		var r: Dictionary = rows[i]
		if not bool(r.get("head", false)) and bool(r.get("asiento", false)):
			return i
	return -1


func _title() -> String:
	match mode():
		MODE_STARTER:
			return "ESTÁS EN EL ONCE"
		MODE_BENCH:
			return "TE QUEDAS FUERA DEL ONCE"
		_:
			return "NO ESTÁS EN LA LISTA"


func _subtitle() -> String:
	match mode():
		MODE_STARTER:
			return "TITULAR"
		MODE_BENCH:
			return "SUPLENTE"
		_:
			return "NO CONVOCADO"





func _note() -> String:
	match mode():
		MODE_STARTER:
			return "El míster te pone de salida. El sitio hay que sostenerlo."
		MODE_BENCH:
			return "Empiezas en el banco. Se recupera jugando, no discutiendo."
		_:
			return "Esta semana ni te vistes. El lunes se vuelve a empezar."





func _tick(delta: float) -> void:
	_elapsed += delta
	var k: float = clampf((_elapsed - FOCUS_T0) /(FOCUS_T1 - FOCUS_T0), 0.0, 1.0)
	focus = _focus_from.lerp(_focus_to, sin(k * PI * 0.5))







func _wear_bib(at: Vector3) -> void:
	var bib: Sprite3D = Sprite3D.new()
	bib.texture = _bib_texture()
	bib.pixel_size = BIB_H / float(BIB_PX)
	bib.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	bib.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	bib.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	bib.no_depth_test = true
	bib.render_priority = 1






	var feet: float = player.position.y - PLAYER_METRICS.y * player.pixel_size
	bib.position = Vector3(at.x, feet + PLAYER_HEIGHT_M * BIB_BODY_F, at.z)
	viewport.add_child(bib)






func _bib_texture() -> ImageTexture:
	var img: Image = Image.create(BIB_PX, BIB_PX, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var edge: Color = BIB_COLOR.darkened(0.42)



	var top: int = 5
	var bot: int = 27
	var l: int = 6
	var r: int = 25
	for y in range(top, bot + 1):
		for x in range(l, r + 1):


			var cut: int = 2 if y == top else (1 if y == top + 1 else 0)
			if x < l + cut or x > r - cut:
				continue
			var border: bool = x <= l + cut or x >= r - cut or y == bot
			img.set_pixel(x, y, edge if border else BIB_COLOR)



	var neck: Array = [[top, 11, 20], [top + 1, 11, 20], [top + 2, 12, 19],
		[top + 3, 12, 19], [top + 4, 13, 18], [top + 5, 14, 17]]
	for row in neck:
		for x in range(int(row[1]), int(row[2]) + 1):
			img.set_pixel(x, int(row[0]), Color(0, 0, 0, 0))

	for row in neck:
		var y: int = int(row[0]) + 1
		if y > bot:
			continue
		for x in [int(row[1]), int(row[2])]:
			if img.get_pixel(x, y).a > 0.0:
				img.set_pixel(x, y, edge)
	return ImageTexture.create_from_image(img)
