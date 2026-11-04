extends Ceremony











































const ROWS: int = 6


















const ROW_GAP: float = 6.0
const ROW_STEP: float = 1.75

const ROW_X0: float = -34.4
const ROW_H: float = 1.72



const LINE_OUT: int = 5
const WALK_SPEED: float = 1.25
const WALK_GAP: float = 0.62



const QUEUE_X: float = -37.9
const QUEUE_STEP: float = 0.42


const STOP_X: float = -23.5
const FAN_Z: float = 0.62



































const KEYS: Array = [
	{"t": 0.0, "dist": 10.5, "h": 4.5, "yaw": 184.0, "aim_y": 1.4, "fov": 40.0,
		"focus_x": -35.2, "focus_z": Stadium.HALF_LINE},
	{"t": 4.2, "dist": 11.2, "h": 4.8, "yaw": 190.0, "aim_y": 1.4, "fov": 41.0,
		"focus_x": -31.5, "focus_z": Stadium.HALF_LINE},
	{"t": 8.4, "dist": 12.4, "h": 5.4, "yaw": 198.0, "aim_y": 1.4, "fov": 43.0,
		"focus_x": -26.2, "focus_z": Stadium.HALF_LINE},
]


const DRIFT: float = -0.25



const ATT: float = 0.98
const T_CLAP: float = 1.8
const T_CARD: float = 9.0




const FACES: int = ROWS * 2

const MATCH_SCENE: String = "res://features/match/match.tscn"



var _from_queue: bool = false















func _consume() -> Dictionary:
	var armed: Dictionary = Career.take_rival_guard()
	if not armed.is_empty():
		return armed
	if String(Career.next_ceremony().get("kind", "")) == Ceremonies.RIVAL_GUARD:
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
	return CareerTheme.accent_of(_mine())




func _mine() -> Dictionary:
	var t: Dictionary = Teams.by_id(String(data.get("away_club", vivo_de("club", GameState.player_team_id))))
	return t if not t.is_empty() else GameState.you_team()


func _build() -> void:
	var host: Dictionary = team()
	var host_kit: Dictionary = GameState.kit_variant(host, 0)
	make_stadium({



		"div": div(),
		"attendance": ATT,
		"party": false,



		"home_club": String(host.get("id", "")),

		"home_only": true,
		"weather": String(data.get("weather", "sunset")),
		"kit": host_kit,
		"banner": "",
		"board": I18n.t("CAMPEON"),
	})

	focus = Vector3(ROW_X0, 0.0, CENTER_Z)
	make_camera(KEYS, 40.0)
	orbit_speed = DRIFT





	if div() == 1:
		make_tunnel_mouth()


	_build_corridor(host_kit)
	_build_walkout()
	make_audio(ATT, false)
	stadium.crowd_excite(0.55)
	flash_pool = stand_flash_pool(CENTER_Z, 34.0)
	flash_rate = 14.0
	flash_burst_at = T_CLAP

	make_chyron(I18n.t("PASILLO DE HONOR"), String(_mine().get("name", "?")).to_upper(),
		_mine(), 1.2)
	make_card(T_CARD)
	card_title(I18n.t("CAMPEON"), 44)
	card_sub(_sub_line())
	card_stats(_stats())
	card_note(I18n.t(_note_line()))
	card_cta(I18n.t("SEGUIR"))



func _sub_line() -> String:
	return I18n.tf("EN CASA DE {0}", [String(team().get("name", "?")).to_upper()])





func _stats() -> Array:
	return [
		{"v": str(int(data.get("pts", 0))), "k": I18n.t("puntos")},
		{"v": "+%d" % maxi(int(data.get("gap", 0)), 0), "k": I18n.t("de ventaja")},
		{"v": str(maxi(_left(), 0)), "k": I18n.t("jornadas")},
	]





func _left() -> int:
	var n: int = 0
	for i in range(GameState.season_day + 1, GameState.calendar.size()):
		var f: Dictionary = GameState.calendar[i]
		if String(f.get("comp", "")) == "league" and not bool(f.get("dead", false)):
			n += 1
	return n






func _note_line() -> String:
	if _left() >= 4:
		return "Con jornadas de sobra y ya no hay nada que discutir. Por eso te " \
				+ "aplauden ellos."
	return "Te lo reconocen los que lo perdieron. No hay elogio mejor."






func _build_corridor(kit: Dictionary) -> void:









	var pool: Array[SpriteFrames] = squad_frames_pool(kit, FACES,
		String(team().get("id", "")), "south", false, "", false, CLAP_SHEET)
	var frames: SpriteFrames = pool[0]
	if frames.get_frame_count("idle") == 0:
		return
	var px: float = ROW_H / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in ROWS:
		for side in [-1.0, 1.0]:
			var s: AnimatedSprite3D = AnimatedSprite3D.new()

			s.sprite_frames = pool[(i * 2 + int(side > 0.0)) % pool.size()]
			s.pixel_size = px
			s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
			s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


			s.position = Vector3(ROW_X0 + float(i) * ROW_STEP, y,
				CENTER_Z + side * ROW_GAP * 0.5)
			viewport.add_child(s)
			s.play("idle")
			s.speed_scale = rng.randf_range(0.7, 1.45)
			if frames.get_frame_count("idle") > 1:
				s.frame = rng.randi_range(0, frames.get_frame_count("idle") - 1)









func _build_walkout() -> void:
	var mine_kit: Dictionary = GameState.kit_variant(_mine(), 1)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(mine_kit, true)



	look["number"] = dorsal_vivido()
	var team_only: Dictionary = KitRecolor.team_only(mine_kit)
	var faces: Array[Dictionary] = []
	for i in WALK_FACES:
		faces.append(KitRecolor.appearance_for("rival_guard_%d" % i, team_only))
	var px: float = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	var y: float = feet_offset(px) - PLAYER_SINK
	for i in LINE_OUT:
		var mine: bool = i == 0
		var cfg: Dictionary = look if mine else faces[i % faces.size()]
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.sprite_frames = player_frames(cfg)
		spr.pixel_size = px
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		spr.position = Vector3(QUEUE_X - float(i) * QUEUE_STEP, y, CENTER_Z)
		viewport.add_child(spr)
		add_walk(spr, cfg)
		spr.play("idle")
		if mine:
			player = spr
		_walkers.append({
			"spr": spr,


			"to": Vector3(STOP_X - float(i) * 0.9, y,
				CENTER_Z +(1.0 if i % 2 == 0 else -1.0) * FAN_Z * float((i + 1) / 2)),
			"at": float(i) * WALK_GAP,
		})




func _tick_walkout(delta: float) -> void:
	for w in _walkers:
		var spr: AnimatedSprite3D = w["spr"]
		if t < float(w["at"]):
			continue
		var to: Vector3 = w["to"]
		var dir: Vector3 = to - spr.position
		dir.y = 0.0
		if dir.length() <= WALK_SPEED * delta:
			spr.position = Vector3(to.x, spr.position.y, to.z)
			walk_play(spr, Vector3.ZERO)
			continue
		spr.position += dir.normalized() * WALK_SPEED * delta
		walk_play(spr, dir)


const WALK_FACES: int = 4
var _walkers: Array[Dictionary] = []
var _clapped: bool = false


func _tick(delta: float) -> void:
	_tick_walkout(delta)
	if not _clapped and t >= T_CLAP:
		_clap()


func _skipped() -> void:
	if not _clapped:
		_clap()





func _clap() -> void:
	_clapped = true
	applause(true)
	ovation(-4.0)
