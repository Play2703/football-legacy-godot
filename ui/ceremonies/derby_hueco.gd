extends "res://ui/ceremonies/derby_room.gd"








































































































const KEYS_HUECO: Array = [
	{"t": 0.0, "dist": 4.6, "h": 1.85, "yaw": 179.0, "aim_y": 1.38, "fov": 50.0,
		"focus_x": -0.42, "focus_z": 0.3},
	{"t": 3.0, "dist": 4.6, "h": 1.9, "yaw": 177.5, "aim_y": 1.24, "fov": 52.0,
		"focus_x": -0.41, "focus_z": 0.4},
	{"t": 6.6, "dist": 4.6, "h": 1.95, "yaw": 176.0, "aim_y": 1.1, "fov": 55.0,
		"focus_x": -0.4, "focus_z": 0.5},
]






const DRIFT_HUECO: float = 0.24





const T_PUERTA: float = 6.9
const T_FICHA: float = 7.4








const SUELO_X: float = -0.38
const SUELO_Z: float = 0.56

















const HOJA_ROT: Vector3 = Vector3(-86.0, 17.0, 0.0)
const HOJA_ALTO: float = 0.025
















const PLAYERA_ROT: Vector3 = Vector3(-90.0, -24.0, 0.0)
const PLAYERA_ALTO: float = 0.01




const DIM_BRILLO: float = 0.72
const DIM_SAT: float = 0.55





func _gano() -> bool:
	return bool(data.get("win", false))




func _accent_for() -> Color:
	return CareerTheme.accent_of(team()) if _gano() else CareerTheme.DANGER


func _build() -> void:



	focus = Vector3(-0.4, 0.0, 0.56)
	room = LockerRoom.new()




	room.host_viewport = viewport


	room.force_club = true



	room.show_captain = false







	room.celebrate = _gano()




	room.hide_suitcase = true
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)





	if room.me != null:
		room.me.visible = false
	make_camera(KEYS_HUECO, 35.0)
	orbit_speed = DRIFT_HUECO









	var prenda: Sprite3D = _playera_colgada()
	if _gano():
		if prenda != null:
			prenda.visible = false
		_hoja_pisada()
	else:



		_build_note()
		_tirar_playera(prenda)

		_dim_room()




	var rival: Dictionary = _rival()


	make_chyron(I18n.t("DERBI"),
		CareerTheme.caps(String(rival.get("name", "?"))), rival, 1.4)
	make_card(T_FICHA)
	card_title(I18n.t("VEINTE MINUTOS DESPUÉS"), 40)




	if _gano():
		card_sub(I18n.t("GANASTE EL DERBI"))
	else:
		card_sub(I18n.t("PERDISTE EL DERBI"))
	card_stats(_stats_hueco())
	if _gano():
		card_note(I18n.t("El escudo que amaneció clavado en tu hueco lo pisó media plantilla al salir."))
	else:
		card_note(I18n.t("Nadie descolgó la hoja del rival. Tu camiseta se quedó donde la tiraste."))
	card_cta(I18n.t("SEGUIR"))











func _stats_hueco() -> Array:
	var goles: int = int(data.get("goles", 0))
	var tercera: Dictionary = {"v": str(goles), "k": I18n.t("tus goles")} if goles > 0 \
			else {"v": "#%d" % maxi(Career.club_number(String(
			club_del_acto())), 1), "k": I18n.t("tu dorsal")}
	return [


		{"v": "%d-%d" % [int(data.get("gf", 0)), int(data.get("ga", 0))],
			"k": I18n.t("el marcador")},
		{"v": str(maxi(int(data.get("minutes", 0)), 0)), "k": I18n.t("minutos")},
		tercera,
	]
















func _playera_colgada() -> Sprite3D:
	var donde: Vector3 = Vector3(LockerRoom.JERSEY_X, LockerRoom.JERSEY_Y,
		LockerRoom.JERSEY_Z)
	for n in viewport.get_children():
		if n is Sprite3D and (n as Sprite3D).position.distance_to(donde) < 0.02:
			return n
	return null












func _tirar_playera(spr: Sprite3D) -> void:
	if spr == null:
		return
	spr.rotation_degrees = PLAYERA_ROT
	spr.position = Vector3(SUELO_X, room.piso_tope() + PLAYERA_ALTO, SUELO_Z)

















func _hoja_pisada() -> void:
	var raiz: Node3D = Node3D.new()
	raiz.position = Vector3(SUELO_X, room.piso_tope() + HOJA_ALTO, SUELO_Z)
	raiz.rotation_degrees = HOJA_ROT
	viewport.add_child(raiz)




	var slab: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(NOTE_W, NOTE_H, 0.012)
	slab.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color(0.86, 0.85, 0.82)
	mat.roughness = 1.0
	slab.material_override = mat
	raiz.add_child(slab)





	var kit_rival: Color = _rival().get("kit", CareerTheme.TEXT_DIM)
	var canto: MeshInstance3D = MeshInstance3D.new()
	var cm: BoxMesh = BoxMesh.new()
	cm.size = Vector3(NOTE_W, NOTE_BAND_H, 0.004)
	canto.mesh = cm
	var cmat: StandardMaterial3D = StandardMaterial3D.new()
	cmat.albedo_color = kit_rival
	cmat.roughness = 1.0
	canto.material_override = cmat
	canto.position = Vector3(0.0, - NOTE_H * 0.5 + NOTE_BAND_H * 0.5, 0.008)
	raiz.add_child(canto)




	var crest: Sprite3D = Sprite3D.new()
	crest.texture = crest_texture(_rival())
	crest.pixel_size =(NOTE_H * NOTE_CREST) / 256.0
	crest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	crest.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	crest.position = Vector3(0.0, 0.0, 0.012)
	raiz.add_child(crest)









func _dim_room() -> void:
	for n in viewport.get_children():
		if n is WorldEnvironment and (n as WorldEnvironment).environment != null:
			var env: Environment =(n as WorldEnvironment).environment
			env.adjustment_enabled = true
			env.adjustment_brightness = DIM_BRILLO
			env.adjustment_saturation = DIM_SAT
			return




func _tick(_delta: float) -> void:
	if not _knocked and t >= T_PUERTA:
		_knock()


func _skipped() -> void:
	if not _knocked:
		_knock()




func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["door_clack"])





func _knock() -> void:
	_knocked = true
	sting("door_clack", -14.0)
