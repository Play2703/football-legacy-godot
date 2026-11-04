extends Ceremony






















































































const LINE_Z: float = CENTER_Z - 1.4












const LINE_GAP: float = 1.25









const RUN_LINE_CENTER: float = -4.4
const LOSE_LINE_CENTER: float = 4.6



const RUN_AXIS_X: float = RUN_LINE_CENTER



const RUNNERS: int = 8



const YOU_SLOT: int = 3


const LOSERS: int = 6




const HERO_TAKER_Z: float = 12.5
const HERO_KEEPER_Z: float = 2.2





















const OTHER_KEEPER_POS: Vector3 = Vector3(0.4, 0.0, 0.9)
const OTHER_TAKER_POS: Vector3 = Vector3(0.0, 0.0, Stadium.PEN_SPOT)



const RUN_SPEED: float = 6.2
const HERO_SPEED: float = 6.6





const T_BREAK: float = 0.55















const PILE_COLS: int = 4
const PILE_GAP: float = 0.94





const PILE_ROW_Z: Vector2 = Vector2(-0.42, -1.18)
const PILE_STAGGER: float = 0.47
const PILE_JUMP: float = 0.24
const PILE_FREQ: float = 7.5






const PILE_JUMP_GESTO: float = 0.45








const GESTOS: Array = [
	{"anim": "puno", "hasta": 6, "fps": 9.0},
	{"anim": "cielo", "hasta": 4, "fps": 7.0},
]

const GESTO_HEROE: String = "puno"




const PILE_HERO_LIFT: float = 0.34



const HOLD_WON: float = 2.7
const HOLD_LOST: float = 2.2







const WALK_SPEED: float = 1.25
const TUNNEL_Z: float = CENTER_Z
















const WALK_START_X: Vector2 = Vector2(-22.4, -25.6)
const WALK_START_Z: Vector2 = Vector2(51.2, 53.8)




const WALK_PACE: Array[float] = [0.7, 1.0, 0.86, 1.06, 0.78, 0.94, 0.82, 1.02]




const WALK_END: Vector3 = Vector3(-35.0, 0.0, TUNNEL_Z)


















const BENCH_BREAK: float = 0.55





const BENCH_INSET: float = 6.0


const BENCH_SPREAD: float = 3.2













































const KEYS_RUN: Array = [
	{"t": 0.0, "dist": 35.0, "h": 11.5, "yaw": 174.0, "aim_y": 7.0, "fov": 49.0},
	{"t": 1.0, "dist": 22.0, "h": 6.2, "yaw": 169.0, "aim_y": 2.2, "fov": 44.0},
	{"t": 2.0, "dist": 17.0, "h": 4.2, "yaw": 161.0, "aim_y": 1.7, "fov": 40.0},
	{"t": 3.0, "dist": 15.0, "h": 4.4, "yaw": 143.0, "aim_y": 1.6, "fov": 38.0},
]










const KEYS_TUNNEL: Array = [
	{"t": 0.0, "dist": 16.5, "h": 3.8, "yaw": 78.0, "aim_y": 1.5, "fov": 42.0},
	{"t": 4.6, "dist": 13.5, "h": 3.1, "yaw": 71.0, "aim_y": 1.3, "fov": 39.0},
]





const TUNNEL_FOCUS: Vector3 = Vector3(-29.5, 0.0, TUNNEL_Z)











const FINAL_RUN_SPEED: float = 7.0



const FINAL_KEEPER_Z: float = 1.3






const FINAL_MISSED_TAKER_POS: Vector3 = Vector3(4.0, 0.0, 3.5)





const BENCH_SUBS: int = 4
const BENCH_SUB_X: float = Stadium.DUGOUT_X + 8.6



const BENCH_SUB_DELAY: float = 0.5
const BENCH_SUB_SPEED: float = 6.6


const BENCH_SUB_SPOTS: Array[Vector2] = [
	Vector2(-2.55, 0.35), Vector2(-3.35, -0.45),
	Vector2(-2.75, -1.25), Vector2(-3.65, 0.45),
]



const KEYS_FINAL: Array = [
	{"t": 0.0, "dist": 35.0, "h": 11.5, "yaw": 174.0, "aim_y": 7.0, "fov": 49.0},
	{"t": 1.0, "dist": 24.0, "h": 7.5, "yaw": 170.0, "aim_y": 2.2, "fov": 44.0},
	{"t": 2.0, "dist": 16.0, "h": 4.3, "yaw": 158.0, "aim_y": 1.7, "fov": 40.0},
	{"t": 3.0, "dist": 15.0, "h": 4.4, "yaw": 143.0, "aim_y": 1.6, "fov": 38.0},
]

const ATT: float = 0.97
const DRIFT: float = 0.3


var _runners: Array[AnimatedSprite3D] = []
var _losers: Array[AnimatedSprite3D] = []
var _hero_spr: AnimatedSprite3D = null


var _other_spr: AnimatedSprite3D = null


var _festejo: Dictionary = {}




var _bench_to: Array[Vector3] = []
var _bench_dur: Array[float] = []

var _run_from: Array[Vector3] = []
var _run_to: Array[Vector3] = []
var _hero_from: Vector3 = Vector3.ZERO
var _hero_to: Vector3 = Vector3.ZERO



var _run_dur: Array[float] = []

var _walk_from: Array[Vector3] = []
var _walk_to: Array[Vector3] = []
var _walk_dur: Array[float] = []





var _open_x: float = 0.0
var _t_mob: float = 3.5
var _t_cut: float = 0.0
var _mobbed: bool = false
var _cut_done: bool = false






var _foot_y: float = 0.0


var _subs: Array[AnimatedSprite3D] = []
var _sub_cfg: Array[Dictionary] = []
var _sub_from: Array[Vector3] = []
var _sub_to: Array[Vector3] = []
var _sub_dur: Array[float] = []



func _won() -> bool:
	return String(data.get("mode", "won")) == "won"




func _es_final() -> bool:
	return _won() and bool(data.get("final", false))



func _bench_look(i: int) -> Dictionary:
	return _sub_cfg[i] if i >= 0 and i < _sub_cfg.size() else {}





func _hero() -> Dictionary:
	var h: Variant = data.get("hero", {})
	return h if h is Dictionary else {}




func _party_team() -> Dictionary:
	return team() if _won() else _other_team()


func _sad_team() -> Dictionary:
	return _other_team() if _won() else team()




func _other_team() -> Dictionary:
	var t: Dictionary = Teams.by_id(String(data.get("rival", "")))
	return t if not t.is_empty() else GameState.current_rival()






func _accent_for() -> Color:
	if not _won():
		return CareerTheme.DANGER
	return CareerTheme.accent_of(team())


func _build() -> void:
	_foot_y = feet_offset(PLAYER_HEIGHT_M / PLAYER_METRICS.x) - PLAYER_SINK
	var mine_kit: Dictionary = GameState.kit_variant(team(), 0)



	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": false,
		"weather": String(data.get("weather", "night")),
		"kit": mine_kit,
		"home_club": String(team().get("id", "")),
		"banner": "",
	})





	if not _won() and div() == 1:
		make_tunnel_mouth(TUNNEL_Z)



	_lay_out_run()







	_open_x =(_line_x(RUN_LINE_CENTER, 0, RUNNERS)
		+ _line_x(LOSE_LINE_CENTER, LOSERS - 1, LOSERS)) * 0.5
	focus = Vector3(_open_x, 1.5, LINE_Z)
	make_camera(_cam_keys(), 42.0)
	orbit_speed = DRIFT



	_build_hero()
	_build_counterpart()
	_build_runners()
	_build_losers()
	_build_bench()





	make_audio(ATT, _won())
	stadium.crowd_excite(0.95 if _won() else 0.55)
	flash_pool = stand_flash_pool(_hero_to.z, 38.0)
	flash_rate = 9.0 if _won() else 4.0
	flash_burst_at = _t_mob
	flash_burst_dur = 1.8

	_build_texts()








func _cam_keys() -> Array:
	var keys: Array = []


	var ts: Array = [0.0, T_BREAK +(_t_mob - T_BREAK) * 0.55, _t_mob,
		_t_mob + 2.0]
	var fuente: Array = KEYS_FINAL if _es_final() else KEYS_RUN
	for i in fuente.size():
		var k: Dictionary =(fuente[i] as Dictionary).duplicate()
		k["t"] = ts[i]
		keys.append(k)
	if _won():
		return keys



	_t_cut = _t_mob + HOLD_LOST
	for i in KEYS_TUNNEL.size():
		var k2: Dictionary =(KEYS_TUNNEL[i] as Dictionary).duplicate()
		k2["t"] = _t_cut + float(k2["t"])
		keys.append(k2)


	var last_party: Dictionary = keys[KEYS_RUN.size() - 1]
	last_party["t"] = minf(float(last_party["t"]), _t_cut - 0.001)
	return keys








func _lay_out_run() -> void:
	var hero_z: float = HERO_KEEPER_Z if _hero_is_keeper() else HERO_TAKER_Z
	var meet_z: float =(LINE_Z * HERO_SPEED + hero_z * RUN_SPEED) \
			/ maxf(HERO_SPEED + RUN_SPEED, 0.001)
	_t_mob = T_BREAK +(LINE_Z - meet_z) / RUN_SPEED
	if _es_final():


		var spot: Vector3 = Vector3(0.0, 0.0, FINAL_KEEPER_Z) if _hero_is_keeper() \
				else Vector3(0.0, 0.0, Stadium.PEN_SPOT)
		_hero_from = spot
		_hero_to = spot
		_t_mob = T_BREAK +(LINE_Z - spot.z) / FINAL_RUN_SPEED
		_lay_out_pile()
		return






	_hero_from = Vector3(RUN_AXIS_X, 0.0, hero_z)
	_hero_to = Vector3(RUN_AXIS_X, 0.0, meet_z)
	_lay_out_pile()





func _lay_out_pile() -> void:
	_run_from.clear()
	_run_to.clear()
	_run_dur.clear()
	var base_dur: float = _t_mob - T_BREAK
	for i in RUNNERS:

		_run_from.append(Vector3(_line_x(RUN_LINE_CENTER, i, RUNNERS), 0.0, LINE_Z))





		var col: int = i / 2
		var back: bool = i % 2 == 1
		var dx: float =(float(col) - float(PILE_COLS - 1) * 0.5) * PILE_GAP \
				+(PILE_STAGGER if back else 0.0) - PILE_STAGGER * 0.5
		_run_to.append(_hero_to
			+ Vector3(dx, 0.0, PILE_ROW_Z.y if back else PILE_ROW_Z.x))





		_run_dur.append(base_dur *(0.93 + float((i * 5) % 7) / 7.0 * 0.2))





func _line_x(center: float, i: int, n: int) -> float:
	return center +(float(i) - float(n - 1) * 0.5) * LINE_GAP


func _hero_is_keeper() -> bool:
	return String(_hero().get("kind", "taker")) == "keeper"




func _hero_is_you() -> bool:
	return _won() and bool(_hero().get("you", false))




func _build_hero() -> void:
	var kit: Dictionary = GameState.kit_variant(_party_team(), 0)


	var _hero_cfg: Dictionary = {}
	if _hero_is_you():
		var look: Dictionary = GameState.team_custom.duplicate()
		look.merge(kit, true)
		look["number"] = dorsal_vivido()
		make_player(look)
		add_run(player, look)
		_hero_spr = player
		_hero_cfg = look
	elif _hero_is_keeper():








		var klook: Dictionary = _keeper_look(_hero())
		var field: Dictionary = KitRecolor.keeper_field_cfg(klook)
		_hero_spr = _make_actor(_keeper_frames_for(klook), field)
		_hero_cfg = field
	else:


		var cfg: Dictionary = person_look(_hero(), KitRecolor.team_only(kit))
		_hero_spr = _make_actor(player_frames(cfg, "south"), cfg)
		_hero_cfg = cfg
	_place(_hero_spr, _hero_from)


	_dar_festejo(_hero_spr, _hero_cfg, GESTO_HEROE)





func _build_runners() -> void:
	var kit: Dictionary = GameState.kit_variant(_party_team(), 0)
	var mine: bool = _won()

	var yours: int = YOU_SLOT if (mine and not _hero_is_you()) else -1













	var kslot: int =(RUNNERS - 1) if not _hero_is_keeper() else -1
	var gente: Array = squad_people(String(_party_team().get("id", "")), RUNNERS,
		mine, String(_hero().get("name", "")), true)
	for i in RUNNERS:
		var spr: AnimatedSprite3D
		var cfg_actor: Dictionary = {}
		if i == kslot:




			var klook: Dictionary = _keeper_look(
				Squad.keeper(String(_party_team().get("id", ""))))
			var kfield: Dictionary = KitRecolor.keeper_field_cfg(klook)
			spr = _make_actor(_keeper_frames_for(klook), kfield)
			cfg_actor = kfield
		elif i == yours:
			var look: Dictionary = GameState.team_custom.duplicate()
			look.merge(kit, true)
			look["number"] = dorsal_vivido()
			make_player(look)
			add_run(player, look)
			spr = player
			cfg_actor = look
		else:
			var cfg: Dictionary = person_look(gente[i], KitRecolor.team_only(kit))
			spr = _make_actor(player_frames(cfg, "south"), cfg)
			cfg_actor = cfg


		_dar_festejo(spr, cfg_actor, String(GESTOS[i % GESTOS.size()]["anim"]))
		_runners.append(spr)
		_place(spr, _run_from[i])





func _build_counterpart() -> void:
	var sad: Dictionary = _sad_team()
	var sad_id: String = String(sad.get("id", ""))
	if sad_id.is_empty():
		return
	if _hero_is_keeper():



		var kit: Dictionary = GameState.kit_variant(sad, 1)
		var gente: Array = squad_people(sad_id, 1, not _won(),
			String(_hero().get("name", "")), true)
		if gente.is_empty():
			return
		var cfg: Dictionary = person_look(gente[0], KitRecolor.team_only(kit))
		_other_spr = _make_actor(player_frames(cfg, "north"), cfg, false)
		_place(_other_spr, FINAL_MISSED_TAKER_POS if _es_final() else OTHER_TAKER_POS)
		return






	var klook: Dictionary = _keeper_look(Squad.keeper(sad_id), sad_id)
	_other_spr = _make_actor(_keeper_frames_for(klook, sad_id), {}, false)
	_place(_other_spr, OTHER_KEEPER_POS)










func _build_losers() -> void:
	var sad: Dictionary = _sad_team()
	var kit: Dictionary = GameState.kit_variant(sad, 1)
	var mine: bool = not _won()
	var gente: Array = squad_people(String(sad.get("id", "")), LOSERS,
		mine, String(_hero().get("name", "")), true)
	_walk_from.clear()
	_walk_to.clear()
	_walk_dur.clear()
	for i in LOSERS:
		var spr: AnimatedSprite3D
		var f: float = float(i) / maxf(float(LOSERS - 1), 1.0)
		if mine and i == 0:


			var look: Dictionary = GameState.team_custom.duplicate()
			look.merge(kit, true)
			look["number"] = dorsal_vivido()
			make_player(look, "north")
			add_walk(player, look)
			spr = player
		else:


			var cfg: Dictionary = person_look(gente[i], KitRecolor.team_only(kit))
			spr = _make_actor(player_frames(cfg, "north"), cfg, false)





			add_walk(spr, cfg)
		_losers.append(spr)


		_place(spr, Vector3(_line_x(LOSE_LINE_CENTER, i, LOSERS), 0.0, LINE_Z))







		var back: float = 1.1 if i % 2 == 1 else 0.0
		_walk_from.append(Vector3(
			lerpf(WALK_START_X.x, WALK_START_X.y, f) + back, 0.0,
			lerpf(WALK_START_Z.x, WALK_START_Z.y, f)))
		_walk_to.append(WALK_END + Vector3(back * 0.5, 0.0,(f - 0.5) * 2.4))


		var largo: float = maxf(Vector2(
			_walk_to[i].x - _walk_from[i].x,
			_walk_to[i].z - _walk_from[i].z).length(), 0.1)
		var pace: float = WALK_PACE[i % WALK_PACE.size()]
		_walk_dur.append(largo / maxf(WALK_SPEED * pace, 0.01))






		var desde: Vector3 = Vector3(_line_x(LOSE_LINE_CENTER, i, LOSERS), 0.0, LINE_Z)
		_bench_to.append(Vector3(
			Stadium.DUGOUT_X + BENCH_INSET, 0.0,
			_bench_z() +(f - 0.5) * BENCH_SPREAD))
		var largo_b: float = maxf(Vector2(
			_bench_to[i].x - desde.x, _bench_to[i].z - desde.z).length(), 0.1)
		_bench_dur.append(largo_b / maxf(WALK_SPEED * pace, 0.01))














func _bench_z() -> float:
	return CENTER_Z +(Stadium.DUGOUT_OFFSET_Z if _won() else - Stadium.DUGOUT_OFFSET_Z)






func _bench_walk() -> void:
	if not _won() or _losers.is_empty() or _bench_to.is_empty():
		return
	var desde_t: float = T_BREAK + BENCH_BREAK
	if t < desde_t:
		return
	for i in _losers.size():
		var spr: AnimatedSprite3D = _losers[i]
		if not is_instance_valid(spr):
			continue
		var origen: Vector3 = Vector3(
			_line_x(LOSE_LINE_CENTER, i, LOSERS), 0.0, LINE_Z)
		var ki: float = clampf((t - desde_t) / maxf(_bench_dur[i], 0.001), 0.0, 1.0)
		_place(spr, origen.lerp(_bench_to[i], ki))


		walk_play(spr,(_bench_to[i] - origen) if ki < 1.0 else Vector3.ZERO)





func _build_bench() -> void:
	_subs.clear()
	_sub_cfg.clear()
	_sub_from.clear()
	_sub_to.clear()
	_sub_dur.clear()
	if not _es_final():
		return
	var kit: Dictionary = GameState.kit_variant(team(), 0)
	var gente: Array = squad_people(String(team().get("id", "")),
		RUNNERS + BENCH_SUBS, true, String(_hero().get("name", "")), true)

	var cajon_z: float = CENTER_Z - Stadium.DUGOUT_OFFSET_Z
	for j in BENCH_SUBS:
		var idx: int = RUNNERS + j
		if idx >= gente.size():
			break
		var cfg: Dictionary = person_look(gente[idx], KitRecolor.team_only(kit))
		cfg["bib"] = Stadium.BIB_COLORS[0]




		var spr: AnimatedSprite3D = _make_actor(player_frames(cfg, "south"), cfg)



		var spot: Vector2 = BENCH_SUB_SPOTS[j % BENCH_SUB_SPOTS.size()]
		var desde: Vector3 = Vector3(BENCH_SUB_X + spot.x, 0.0, cajon_z + spot.y)
		var hasta: Vector3 = _hero_to + Vector3(spot.x, 0.0, spot.y)
		_subs.append(spr)
		_sub_cfg.append(cfg)
		_sub_from.append(desde)
		_sub_to.append(hasta)
		_sub_dur.append(desde.distance_to(hasta) / BENCH_SUB_SPEED)
		_place(spr, desde)




func _advance_subs() -> void:
	var desde_t: float = T_BREAK + BENCH_SUB_DELAY
	for j in _subs.size():
		var spr: AnimatedSprite3D = _subs[j]
		var kj: float = clampf((t - desde_t) / maxf(_sub_dur[j], 0.001), 0.0, 1.0)
		if kj >= 1.0:
			_settle(spr, _sub_to[j], 2.3 + float(j) * 0.9, PILE_JUMP)
			continue
		_place(spr, _sub_from[j].lerp(_sub_to[j], kj))
		if kj > 0.0:
			run_play(spr, _sub_to[j] - _sub_from[j])










func _make_actor(frames: SpriteFrames, cfg: Dictionary = {},
		con_carrera: bool = true) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = frames
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	viewport.add_child(s)
	s.play("idle")


	s.speed_scale = rng.randf_range(0.8, 1.2)
	if frames.get_frame_count("idle") > 1:
		s.frame = rng.randi_range(0, frames.get_frame_count("idle") - 1)
	if con_carrera:
		add_run(s, cfg)
	return s


















func _dar_festejo(spr: AnimatedSprite3D, cfg_base: Dictionary, anim: String) -> void:
	if spr == null or spr.sprite_frames == null or anim.is_empty():
		return
	var receta: Dictionary = {}
	for g in GESTOS:
		if String(g["anim"]) == anim:
			receta = g
			break
	if receta.is_empty():
		return
	var cfg: Dictionary = cfg_base.duplicate()
	if _espalda_puesta(spr) or espalda_toca(cfg):
		cfg["num_lamina"] = true
	cfg = _cfg_con_escudo(cfg, false)
	var frames: SpriteFrames = spr.sprite_frames
	if frames.has_animation(anim):
		_festejo[spr] = anim
		return
	frames.add_animation(anim)
	frames.set_animation_loop(anim, true)
	frames.set_animation_speed(anim, float(receta["fps"]))
	for i in range(1, int(receta["hasta"]) + 1):
		var path: String = "res://assets/sprites/anim/%s_south_%02d.png" % [anim, i]
		if ResourceLoader.exists(path):
			frames.add_frame(anim, KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count(anim) == 0:
		frames.remove_animation(anim)
		return
	_festejo[spr] = anim


















func _keeper_look(persona: Dictionary, team_id: String = "") -> Dictionary:
	var club: String = team_id if not team_id.is_empty() \
			else String(_party_team().get("id", ""))


	var de_campo: Dictionary = GameState.kit_variant(Teams.by_id(club), 0)
	var base: Dictionary = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(club, -1,
		String(de_campo.get("pattern", "solid"))), de_campo)
	return person_look(persona, base)











func _keeper_frames_for(look: Dictionary, team_id: String = "") -> SpriteFrames:
	return keeper_idle_frames(look, team_id if not team_id.is_empty() \
			else String(_party_team().get("id", "")))




func _place(spr: AnimatedSprite3D, at: Vector3) -> void:
	if spr == null:
		return
	spr.position = Vector3(at.x, _foot_y, at.z)






func _build_texts() -> void:
	var h: Dictionary = _hero()


	var hero_name: String = String(h.get("name", ""))


	make_chyron(I18n.tf("PENALES {0}-{1}",
			[int(h.get("for", 0)), int(h.get("against", 0))]),
		CareerTheme.caps(hero_name if not hero_name.is_empty()
			else String(_party_team().get("name", "?"))),
		_party_team(), 1.5)


	card_at =(_t_mob + HOLD_WON) if _won() else (_t_cut + 3.0)
	make_card()
	card_title(CareerTheme.caps(I18n.t("GANAS LA TANDA") if _won()
		else I18n.t("ELIMINADO EN PENALES")), 40)
	card_sub(CareerTheme.caps(I18n.tf("PENALES {0}-{1}",
		[int(h.get("for", 0)), int(h.get("against", 0))])))
	card_note(_note(hero_name))
	card_cta(I18n.t("SEGUIR"))




func _note(hero_name: String) -> String:
	if not _won():
		return I18n.t("La fiesta la dan ellos. A ti te quedan cuarenta metros hasta el túnel.")
	if _es_final():


		if not _hero_is_keeper():
			if _hero_is_you():
				return I18n.t("La metiste tú. Hasta el banquillo saltó al campo a por ti.")
			return I18n.tf("La metió {0}. Hasta el banquillo saltó al campo a por él.",
				[hero_name])
		if bool(_hero().get("save", false)):
			return I18n.tf("La sacó {0}. Hasta el banquillo saltó al campo a por él.",
				[hero_name])
		return I18n.t("La mandaron fuera. Hasta el banquillo saltó al campo.")
	if not _hero_is_keeper():
		if _hero_is_you():
			return I18n.t("La metiste tú. Los otros diez cruzaron medio campo para decírtelo.")
		return I18n.tf("La metió {0}. Los otros diez cruzaron medio campo para decírselo.",
			[hero_name])
	if bool(_hero().get("save", false)):
		return I18n.tf("La sacó {0}. Los otros diez cruzaron medio campo para decírselo.",
			[hero_name])
	return I18n.t("La mandaron fuera. Los otros diez cruzaron medio campo igual.")



func _tick(_delta: float) -> void:


	_bench_walk()
	if t >= _t_mob:
		_pile()
		if not _won():
			_tunnel()
		return
	_charge()







func _look_at_ground(at: Vector3) -> void:
	focus = Vector3(at.x, 1.5, at.z)




func _charge() -> void:
	var k: float = clampf((t - T_BREAK) / maxf(_t_mob - T_BREAK, 0.001), 0.0, 1.0)
	if k <= 0.0:
		return
	_advance_runners()
	_advance_subs()
	if _hero_spr != null:
		if _es_final():

			_settle(_hero_spr, _hero_to, 0.0, PILE_JUMP * 0.6)
		else:
			_place(_hero_spr, _hero_from.lerp(_hero_to, k))
			run_play(_hero_spr, _hero_to - _hero_from)









	_look_at_ground(Vector3(lerpf(_open_x, _hero_to.x, clampf(k * 2.4, 0.0, 1.0)),
		0.0, lerpf(LINE_Z, _hero_to.z, k * 0.62 + 0.38 * minf(k * 4.0, 1.0))))


















func _advance_runners() -> void:
	for i in _runners.size():
		var spr: AnimatedSprite3D = _runners[i]
		var ki: float = clampf((t - T_BREAK) / maxf(_run_dur[i], 0.001), 0.0, 1.0)
		if ki >= 1.0:
			_settle(spr, _run_to[i], float(i) * 1.1, PILE_JUMP)
			continue
		_place(spr, Vector3(
			lerpf(_run_from[i].x, _run_to[i].x, smoothstep(0.62, 1.0, ki)), 0.0,
			lerpf(_run_from[i].z, _run_to[i].z, ki)))
		run_play(spr, _run_to[i] - _run_from[i])









func _settle(spr: AnimatedSprite3D, at: Vector3, phase: float,
		amp: float, lift: float = 0.0) -> void:
	var gesto: String = String(_festejo.get(spr, ""))
	var hop: float = absf(sin(t * PILE_FREQ + phase))
	if not gesto.is_empty():
		amp *= PILE_JUMP_GESTO
	spr.position = Vector3(at.x, _foot_y + lift + hop * amp, at.z)
	if gesto.is_empty():
		run_play(spr, Vector3.ZERO)
		return
	if spr.animation != gesto:


		spr.play(gesto)







func _pile() -> void:
	if not _mobbed:
		_mobbed = true


		shake(0.24, 0.55)
		punch_fov(5.0)
		if _won():
			ovation(0.0)
			stadium.crowd_excite(1.0)
		else:


			ovation(-8.0)



	_advance_runners()
	_advance_subs()
	if _hero_spr != null:
		_settle(_hero_spr, _hero_to, 0.0, PILE_JUMP * 0.6, PILE_HERO_LIFT)
	if _won() or t < _t_cut:
		_look_at_ground(_pile_focus())





func _pile_focus() -> Vector3:
	return _hero_to +(Vector3(-1.3, 0.0, 0.0) if _es_final() else Vector3.ZERO)





func _tunnel() -> void:
	if t < _t_cut:
		return
	if not _cut_done:
		_cut_done = true
		screen_flash(0.2)
		for i in _losers.size():
			_place(_losers[i], _walk_from[i])





		_look_at_ground(TUNNEL_FOCUS)

		stadium.crowd_excite(0.2)
	if _losers.is_empty():
		return
	for i in _losers.size():
		var spr: AnimatedSprite3D = _losers[i]




		var ki: float = clampf((t - _t_cut) / maxf(_walk_dur[i], 0.001), 0.0, 1.0)
		_place(spr, _walk_from[i].lerp(_walk_to[i], ki))
		walk_play(spr,(_walk_to[i] - _walk_from[i]) if ki < 1.0 else Vector3.ZERO)




func _skipped() -> void:
	_mobbed = true
	_look_at_ground(_pile_focus() if _won() else TUNNEL_FOCUS)
	for i in _runners.size():
		_settle(_runners[i], _run_to[i], float(i) * 1.1, PILE_JUMP)
	if _hero_spr != null:
		_settle(_hero_spr, _hero_to, 0.0, PILE_JUMP * 0.6, PILE_HERO_LIFT)
	for j in _subs.size():
		_settle(_subs[j], _sub_to[j], 2.3 + float(j) * 0.9, PILE_JUMP)
	if _won():


		for i in _losers.size():
			if i < _bench_to.size():
				_place(_losers[i], _bench_to[i])
				walk_play(_losers[i], Vector3.ZERO)
		return
	_cut_done = true
	for i in _losers.size():
		_place(_losers[i], _walk_to[i])
		walk_play(_losers[i], Vector3.ZERO)
