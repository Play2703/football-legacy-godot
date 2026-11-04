extends Ceremony

























































const KEYS: Array = [
	{"t": 0.0, "dist": 3.5, "h": 1.7, "yaw": 181.0, "aim_y": 1.66, "fov": 35.0,
		"focus_x": -0.42, "focus_z": 0.1},
	{"t": 2.8, "dist": 4.3, "h": 1.55, "yaw": 176.0, "aim_y": 1.2, "fov": 40.0,
		"focus_x": 0.05, "focus_z": 0.55},
	{"t": 6.2, "dist": 4.6, "h": 1.55, "yaw": 196.0, "aim_y": 1.35, "fov": 44.0,
		"focus_x": -0.45, "focus_z": 1.6},
]


const DRIFT: float = 0.42

const T_CHYRON: float = 1.4



const T_DOOR: float = 5.6
const T_CARD: float = 6.4












const COACH_H: float = 1.8









const COACH_X: float = -1.15
const COACH_Z: float = 3.2







































const PASEO_X: Vector2 = Vector2(-1.15, -0.93)
const PASEO_MS: float = 0.32
const PASEO_PAUSA: Vector2 = Vector2(1.4, 2.6)



const PASEO_ESPERA: float = 0.0






















const NOTE_W: float = 0.36
const NOTE_H: float = 0.28











const NOTE_POS: Vector3 = Vector3(-0.05, 1.9, 0.03)
const NOTE_CREST: float = 0.8



const NOTE_BAND_H: float = 0.04

var room: LockerRoom


























const NEM_X: float = -34.0
const NEM_Z_OFF: float = 4.6
const NEM_ME_X: float = -33.8
const NEM_ME_Z_OFF: float = 6.0





const NEM_KEYS: Array = [
	{"t": 0.0, "dist": 13.0, "h": 1.45, "yaw": 116.0, "aim_y": 1.55, "fov": 36.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 5.3},
	{"t": 4.0, "dist": 9.5, "h": 1.5, "yaw": 100.0, "aim_y": 1.6, "fov": 32.0,
		"focus_x": -33.9, "focus_z": Stadium.HALF_LINE + 5.3},
]


const NEM_DRIFT: float = -0.5


const NEM_ATT: float = 0.7
const NEM_T_CHYRON: float = 1.0
const NEM_T_CARD: float = 4.4


var nem_sprite: AnimatedSprite3D = null


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())



func _nemesis() -> Dictionary:
	var n: Variant = data.get("nemesis", null)
	return n if n is Dictionary else {}


func _build() -> void:
	if not _nemesis().is_empty():
		_build_el_de_siempre()
		return



	focus = Vector3(0.1, 0.0, 1.05)
	room = LockerRoom.new()




	room.host_viewport = viewport



	room.force_club = true



	room.show_captain = false


	room.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(room)
	make_camera(KEYS, 32.0)
	orbit_speed = DRIFT
	_build_coach()
	_build_note()



	var rival: Dictionary = _rival()
	make_chyron(I18n.t("DERBI"), String(rival.get("name", "?")).to_upper(), rival, T_CHYRON)
	make_card(T_CARD)
	card_title(String(rival.get("name", "?")).to_upper(), 40)
	card_sub(I18n.t(_sub_line()))
	card_stats(_stats())
	var note: Dictionary = _note_line()
	card_note(I18n.tf(String(note["key"]), note.get("args", [])))
	card_cta(I18n.t("SEGUIR"))









func _rival() -> Dictionary:
	var id: String = String(data.get("rival", Career.rival_id))
	if bool(data.get("nat", false)):
		var nat: Dictionary = Nations.as_team(id)
		if not nat.is_empty():
			return nat
	var t: Dictionary = Teams.by_id(id)
	return t if not t.is_empty() else team()



func _sub_line() -> String:
	return "HOY, EN TU CASA" if bool(data.get("home", true)) else "HOY, EN LA SUYA"































func _stats() -> Array:
	var teams: int = int(data.get("teams", 0))
	var goles: int = int(Career.derby_record(String(_rival().get("id", "")))
		.get("goals", 0))
	var tercera: Dictionary = {"v": str(goles), "k": I18n.t("tus goles")} if goles > 0 \
			else {"v": "#%d" % maxi(Career.club_number(String(
			club_del_acto())), 1), "k": I18n.t("tu dorsal")}
	return [
		{"v": _pos_text(int(data.get("pos", 0)), teams), "k": I18n.t("tu puesto")},
		{"v": _pos_text(int(data.get("pos_rival", 0)), teams), "k": I18n.t("el suyo")},
		tercera,
	]






func _pos_text(pos: int, teams: int = 0) -> String:
	if pos <= 0:
		return "—"
	return "%d/%d" % [pos, teams] if teams > 0 else I18n.ordinal(pos)













func _note_line() -> Dictionary:





	var rid: String = String(_rival().get("id", ""))
	var nem: Dictionary = Career.nemesis_at(rid)



	if _nemesis().is_empty() and int(nem.get("goals", 0)) >= 2:
		return {"key": "{0} os ha marcado {1} en estos derbis. Hoy no lo pierdas de vista.",
			"args": [String(nem.get("name", "")).to_upper(), int(nem["goals"])]}














	if not bool(data.get("home", true)) and Career.is_traitor_at(rid):
		return {"key": "Esa casa fue tuya. Hoy no te van a perdonar ni una.", "args": []}
	var head: Dictionary = Career.derby_headline(rid)
	var args: Array = head.get("args", [])
	match String(head.get("key", "")):
		"{0} DERBIS SIN GANARLE":
			return {"key": "Llevas {0} sin ganarles. En esta sala nadie lo ha olvidado.",
				"args": args}
		"NUNCA LE HAS GANADO":
			return {"key": "Nunca les has ganado. Algún día tiene que ser el primero.",
				"args": []}
		"NO LE GANAS DESDE HACE {0} AÑOS":
			return {"key": "No les ganas desde hace {0} años. La gente lleva la cuenta.",
				"args": args}
		"{0} DERBIS GANADOS SEGUIDOS":
			return {"key": "Llevas {0} seguidos contra ellos. Hoy vienen a por eso.",
				"args": args}
	var mine: int = int(data.get("pos", 0))
	var theirs: int = int(data.get("pos_rival", 0))
	var casa: bool = bool(data.get("home", true))
	if mine > 0 and theirs > 0:



		if absi(mine - theirs) <= 2:
			return {"key": "Sois vecinos en la tabla y en la ciudad. Esto no se olvida "
				+ "ni ganándolo.", "args": []}


		if mine < theirs:
			return {"key": "Vienen a tu casa a quitarte el sitio. Perder hoy vale por "
				+ "tres derrotas." if casa
				else "Vas a su casa de líder. No hay tarde que les guste más.",
				"args": []}
		return {"key": "Van por delante todo el año. Hoy la tabla no cuenta.",
			"args": []}
	return {"key": "No hay plan de partido que arregle un derbi. Se gana o se aguanta.",
		"args": []}












func _build_coach(at_x: float = NAN, at_z: float = NAN,
		look: Dictionary = {}, nombre: String = "", niv: int = -1) -> AnimatedSprite3D:
	if is_nan(at_x):




		paseo_x = PASEO_X
		paseo_ms = PASEO_MS
		paseo_pausa = PASEO_PAUSA
		paseo_espera = PASEO_ESPERA



	return coach_sprite(Vector3(COACH_X if is_nan(at_x) else at_x, 0.0,
		COACH_Z if is_nan(at_z) else at_z), COACH_H,
		look if not look.is_empty() else _mister_look(),
		nombre if not nombre.is_empty() else _mister_nombre(), false,
		niv if not nombre.is_empty() else _mister_nivel())








func _fecha_fifa() -> bool:
	return bool(data.get("nat", false))


func _mister_look() -> Dictionary:
	return Career.nat_coach_look() if _fecha_fifa() else Career.coach_look()


func _mister_nombre() -> String:
	return Career.nat_coach_name() if _fecha_fifa() else Career.coach_name()


func _mister_nivel() -> int:
	return Career.nat_coach_nivel() if _fecha_fifa() else Career.coach_nivel()






func _build_note() -> void:
	var slab: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(NOTE_W, NOTE_H, 0.012)
	slab.mesh = bm
	var mat: StandardMaterial3D = StandardMaterial3D.new()


	mat.albedo_color = Color(0.86, 0.85, 0.82)
	mat.roughness = 1.0
	slab.material_override = mat
	slab.position = NOTE_POS
	viewport.add_child(slab)















	var kit_rival: Color = _rival().get("kit", CareerTheme.TEXT_DIM)
	var canto: MeshInstance3D = MeshInstance3D.new()
	var cm: BoxMesh = BoxMesh.new()
	cm.size = Vector3(NOTE_W, NOTE_BAND_H, 0.004)
	canto.mesh = cm
	var cmat: StandardMaterial3D = StandardMaterial3D.new()
	cmat.albedo_color = kit_rival
	cmat.roughness = 1.0
	canto.material_override = cmat


	canto.position = NOTE_POS + Vector3(0.0, - NOTE_H * 0.5 + NOTE_BAND_H * 0.5, 0.008)
	viewport.add_child(canto)
	var crest: Sprite3D = Sprite3D.new()
	crest.texture = crest_texture(_rival())
	crest.pixel_size =(NOTE_H * NOTE_CREST) / 256.0
	crest.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	crest.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD


	crest.position = NOTE_POS + Vector3(0.0, 0.0, 0.012)
	viewport.add_child(crest)





func _build_el_de_siempre() -> void:
	var nem: Dictionary = _nemesis()
	var rival: Dictionary = _rival()
	var casa: bool = bool(data.get("home", true))



	var dueno: Dictionary = team() if casa else rival
	make_stadium({
		"div": div(),
		"attendance": NEM_ATT,
		"party": true,
		"home_club": String(dueno.get("id", "")),
		"home_only": true,
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(dueno, 0),
	})
	focus = Vector3(NEM_ME_X, 0.0, Stadium.HALF_LINE + NEM_ME_Z_OFF)
	make_camera(NEM_KEYS, 36.0)
	orbit_speed = NEM_DRIFT



	if div() == 1:
		make_tunnel_mouth()



	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	make_player(look, "south")
	player.position = Vector3(NEM_ME_X, player.position.y,
		Stadium.HALF_LINE + NEM_ME_Z_OFF)
	_build_nemesis_sprite(nem, rival)
	make_audio(NEM_ATT, false)

	make_chyron(I18n.t("TU VILLANO"), String(rival.get("name", "?")).to_upper(),
		rival, NEM_T_CHYRON)
	make_card(NEM_T_CARD)
	card_title(String(nem.get("nombre", "?")).to_upper(), 40)
	card_club(rival)


	var sub: Label = card_sub(I18n.tf("TE HA MARCADO {0} EN ESTE DERBI",
		[str(int(nem.get("goals", 0)))]))
	sub.clip_text = true
	card_stats(_stats())
	var note: Dictionary = _note_line()
	card_note(I18n.tf(String(note["key"]), note.get("args", [])))
	card_cta(I18n.t("SEGUIR"))











func _build_nemesis_sprite(nem: Dictionary, rival: Dictionary) -> void:
	var rid: String = String(rival.get("id", ""))
	var cfg: Dictionary = person_look({"name": String(nem.get("cara", "")),
		"number": int(nem.get("number", 0))}, GameState.kit_variant(rival, 0))
	cfg["club"] = rid
	nem_sprite = AnimatedSprite3D.new()
	nem_sprite.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	nem_sprite.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	nem_sprite.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	nem_sprite.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	nem_sprite.sprite_frames = player_frames(cfg, "south")
	nem_sprite.position = Vector3(NEM_X,
		feet_offset(nem_sprite.pixel_size) - PLAYER_SINK,
		Stadium.HALF_LINE + NEM_Z_OFF)
	viewport.add_child(nem_sprite)
	nem_sprite.play("idle")
	PlacaNombre.cuelga(nem_sprite, String(nem.get("nombre", "")), true, true)


var _knocked: bool = false


func _tick(delta: float) -> void:
	tick_paseo(delta)
	if not _knocked and t >= T_DOOR:
		_knock()


func _skipped() -> void:
	if not _knocked:
		_knock()




func _knock() -> void:
	_knocked = true
	sting("whistle", -9.0)
