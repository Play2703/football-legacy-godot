extends Ceremony







































const KEYS: Array = [
	{"t": 0.0, "dist": 7.6, "h": 2.6, "yaw": 128.0, "aim_y": 1.3, "fov": 38.0},
	{"t": 5.0, "dist": 6.9, "h": 2.35, "yaw": 122.0, "aim_y": 1.15, "fov": 38.0},
]




const KEYS_REHAB: Array = [
	{"t": 0.0, "dist": 8.4, "h": 2.65, "yaw": 128.0, "aim_y": 1.2, "fov": 38.0},
	{"t": 5.0, "dist": 6.2, "h": 2.1, "yaw": 120.0, "aim_y": 1.35, "fov": 38.0},
]

const T_CARD: float = 3.2





const STAFF_DX: Array[float] = [-1.05, 0.95]
const STAFF_DZ: Array[float] = [0.35, -0.5]
const STAFF_H: float = 1.72



const STAFF_KIT: Dictionary = {
	"kit": Color("2a2d34"), "kit2": Color("3d424c"), "pattern": "solid",
}




const T_STING: float = 0.8

var room: RehabRoom









func _is_rehab() -> bool:
	return String(data.get("mode", "")) == "rehab"





func _accent_for() -> Color:
	return CareerTheme.accent_of(team()) if _is_rehab() else CareerTheme.DANGER


func _build() -> void:



	focus = Vector3.ZERO
	room = RehabRoom.new()




	room.div = div()
	room.club_color = CareerTheme.accent_of(team())



	room.crest = crest_texture(team())

	viewport.add_child(room)
	make_camera(KEYS_REHAB if _is_rehab() else KEYS)
	orbit_speed = 0.0


	var look: Dictionary = GameState.team_custom.duplicate()
	for k in KitRecolor.TEAM_KEYS:
		look.erase(k)
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look)
	_build_staff(look)





	if _is_rehab():
		_build_rehab()
	else:
		_build_injury()



func _build_injury() -> void:
	make_chyron(I18n.t("LESIÓN", "sim"), String(team().get("name", "?")).to_upper(),
		team(), 1.4)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t(_sub_line()))
	card_count(int(data.get("weeks", 0)), I18n.t("SEMANAS DE BAJA"))
	_build_drops()
	card_note(I18n.t("Vuelves cuando el cuerpo diga. Mientras tanto el equipo juega sin ti "
		+ "y el puesto no se guarda solo."))





	if _offers_retire():
		card_decision("momento_retiro", I18n.t("EL CUERPO DECIDE"))
	else:


		card_decision("momento_lesion", I18n.tf("{0} SEMANAS DE BAJA",
			[maxi(int(data.get("weeks", 0)), 1)]))










func _build_drops() -> void:
	var drops: Dictionary = data.get("drops", {})
	if drops.is_empty():
		return
	var keys: Array = drops.keys()
	keys.sort_custom(func(a, b) -> bool:
		var da: int = int(drops[a])
		var db: int = int(drops[b])
		return da > db if da != db else String(a) < String(b))
	var row: HBoxContainer = HBoxContainer.new()
	row.add_theme_constant_override("separation", 14)
	row.alignment = BoxContainer.ALIGNMENT_CENTER
	for k in keys:
		var cell: HBoxContainer = HBoxContainer.new()
		cell.add_theme_constant_override("separation", 4)
		var icon: MenuIcon = MenuIcon.new()
		icon.custom_minimum_size = Vector2(30, 30)
		icon.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		icon.setup(String(k), CareerUi.SKILL_ICON_COL.get(String(k),
			CareerTheme.accent_text()))
		cell.add_child(icon)
		var v: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.DANGER)
		v.text = "-%d" % int(drops[k])
		cell.add_child(v)
		row.add_child(cell)
	card_box.add_child(row)






func _offers_retire() -> bool:


	if bool(data.get("force_retire", false)):
		return true
	return not _is_rehab() \
			and int(data.get("weeks", 0)) >= 6 \
			and Career.age >= Career.DECLINE_AGE \
			and not Career.retired





func _build_rehab() -> void:
	make_chyron(I18n.t("ALTA MÉDICA", "sim"), String(team().get("name", "?")).to_upper(),
		team(), 1.4)
	make_card(T_CARD)
	card_title(CareerTheme.caps(Career.player_name), 40)
	card_sub(I18n.t("VUELVES AL EQUIPO"))
	var lost: int = maxi(int(data.get("matches", 0)), 0)
	card_count(lost, I18n.t("PARTIDOS PERDIDOS"))
	card_note(I18n.t("El cuerpo aguantó. El puesto no se guardó solo: ahora hay que "
		+ "ganárselo otra vez."))




func _sub_line() -> String:




	var w: int = int(data.get("weeks", 0))


	if w >= 10:
		return "MESES FUERA"
	if w >= 6:
		return "LA TEMPORADA, EN EL AIRE"
	if w >= Career.GRAVE_WEEKS:
		return "BAJA LARGA"
	return "TE PIERDES LO QUE VIENE"










func _build_staff(_look: Dictionary) -> void:
	var frames_by_i: Array[SpriteFrames] = []
	for i in STAFF_DX.size():


		frames_by_i.append(player_frames(
			KitRecolor.appearance_for("staff_%d" % i, STAFF_KIT)))
	var frames: SpriteFrames = frames_by_i[0]
	if frames.get_frame_count("idle") == 0:
		return
	var px: float = STAFF_H / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in STAFF_DX.size():
		var s: AnimatedSprite3D = AnimatedSprite3D.new()
		s.sprite_frames = frames_by_i[i]
		s.pixel_size = px
		s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		s.position = Vector3(focus.x + STAFF_DX[i], y, focus.z + STAFF_DZ[i])
		viewport.add_child(s)
		s.play("idle")
		s.frame = i
		s.speed_scale = 0.0


func _tick(_delta: float) -> void:
	if not _stung and t >= T_STING:
		_news()


var _stung: bool = false


func _skipped() -> void:
	if not _stung:
		_news()





func _news() -> void:
	_stung = true
	sting("fanfare" if _is_rehab() else "stinger_bad", -8.0)
