extends Ceremony















































const P_YO: Vector3 = Vector3(0.7, 0.0, 9.0)


const Z_FIN: float = 7.0

const WALK_MS: float = 1.1







const N_MIN: int = 6
const N_MAX: int = 10
const BAR_X: float = Stadium.GOAL_HALF_W - 0.36
const BAR_JIT: float = 0.08
const BAR_Y: float = Stadium.CROSSBAR_H + 0.06 + 9.0 * 0.34 / 12.0 * 0.5





const T_GIRO: float = 1.2
const GIRO_PASO: float = 0.09


const HOP_S: float = 0.14
const HOP_H: float = 0.08


const T_PERDON: float = 2.2
const T_CORTE: float = T_PERDON



const MIRA_HIST_PX: float = 6.0


const T_VUELO: float = 3.6
const VUELO_DESFASE: float = 0.12

const VUELO_S: float = 1.8








const VUELO_ACEL: float = 1.2








const T_PLUMAS: float = 4.6
const PLUMAS_OFF: Vector3 = Vector3(0.0, 3.4, -0.3)


const T_ANDA: float = 4.8

const T_CARD: float = 5.2

const DRIFT: float = -0.4

var _pigeons: Array[Sprite3D] = []
var _p0: Array[Vector3] = []
var _vel: Array[Vector3] = []
var _giro_t: Array[float] = []
var _vuelo_t: Array[float] = []
var _mira_a_ti: Array[bool] = []
var _wings: Texture2D = null
var _plumas: bool = false
var _parado: bool = false
var _perdon_ok: bool = false
var _contra: bool = false



func _accent_for() -> Color:
	return CareerTheme.accent_of(team())


func _build() -> void:


	rng.seed = hash("palomas|%d|%s" % [int(data.get("season", 0)),
		String(data.get("club", ""))])
	var local: Dictionary = _local_team()






	make_stadium({
		"div": div(),
		"attendance": 0.0,
		"venue_empty": true,
		"home_only": true,
		"party": false,
		"flare_odds": 0.0,
		"weather": "night",
		"kickoff": 1.0,
		"home_club": String(local.get("id", "")),
		"kit": GameState.kit_variant(local, 0),
		"comp": "league",
	})
	make_camera(_llaves(), 40.0)
	orbit_speed = DRIFT


	scrim_dim(0.55)

	_planta_palomas()
	_planta_persona()

	make_card(T_CARD)
	card_title(I18n.t("LAS PALOMAS NO OLVIDAN"), 40)




	card_club(local)
	card_note(I18n.t("Una paloma del larguero no volvió a casa. Las demás se acuerdan.")
		if bool(data.get("first", true))
		else I18n.t("Otra vez tú. Ellas llevan la cuenta."))
	card_cta(I18n.t("SEGUIR"))







func _local_team() -> Dictionary:
	var mio: Dictionary = team()
	if bool(data.get("home", true)):
		return mio
	var rival: Dictionary = Teams.by_id(String(data.get("opp", "")))
	return rival if not rival.is_empty() else mio














func _llaves() -> Array:
	return [
		{"t": 0.0, "dist": 20.0, "h": 2.9, "yaw": 186.0, "aim_y": 1.5, "fov": 40.0,
			"focus_x": 0.0, "focus_z": 3.0},
		{"t": 2.0, "dist": 16.8, "h": 2.8, "yaw": 182.0, "aim_y": 1.5, "fov": 40.0,
			"focus_x": 0.0, "focus_z": 3.0},
	]










func _contraplano() -> Array:
	return [
		{"t": T_CORTE, "dist": 15.0, "h": 5.0, "yaw": 2.0, "aim_y": 0.7, "fov": 34.0,
			"focus_x": P_YO.x, "focus_z": P_YO.z},
		{"t": T_CARD + 0.6, "dist": 14.2, "h": 4.8, "yaw": 0.5, "aim_y": 0.75,
			"fov": 34.0, "focus_x": P_YO.x, "focus_z": P_YO.z},
	]










func _planta_palomas() -> void:
	if stadium == null:
		return
	var n: int = rng.randi_range(N_MIN, N_MAX)
	var puntos: Array = []
	for i in n:
		var x: float = lerpf(- BAR_X, BAR_X, float(i) / float(n - 1)) \
				+ rng.randf_range(- BAR_JIT, BAR_JIT)
		puntos.append(Vector3(x, BAR_Y, 0.0))
	_pigeons = stadium.perch_pigeons(puntos)
	_wings = stadium.pigeon_wings()
	var orden: Array[int] = []
	for i in _pigeons.size():
		orden.append(i)


	for i in range(orden.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var tmp: int = orden[i]
		orden[i] = orden[j]
		orden[j] = tmp
	_giro_t.resize(_pigeons.size())
	for k in orden.size():
		_giro_t[orden[k]] = T_GIRO + float(k) * GIRO_PASO
	for i in _pigeons.size():
		var s: Sprite3D = _pigeons[i]
		s.shaded = false
		var p: Vector3 = s.position
		_p0.append(p)




		var hacia_ti: bool = _pantalla_x(P_YO + Vector3.UP) > _pantalla_x(p)
		_mira_a_ti.append(hacia_ti)
		s.flip_h = not hacia_ti


		_vel.append(Vector3(rng.randf_range(-1.6, 1.6) +(P_YO.x - p.x) * 0.3,
			rng.randf_range(0.2, 0.6), rng.randf_range(7.5, 9.5)))
		_vuelo_t.append(T_VUELO + rng.randf_range(0.0, VUELO_DESFASE))





func _planta_persona() -> void:
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(GameState.kit_variant(team(), 0), true)
	look["number"] = shirt()
	make_player(look)
	add_walk(player, look)
	add_idle_views(player, look)
	_perdon_ok = _add_perdon(player, look)
	player.position = Vector3(P_YO.x,
		feet_offset(player.pixel_size) - PLAYER_SINK, P_YO.z)







const PERDON_SHEET: String = "res://assets/sprites/anim/perdon_south_"
const PERDON_FPS: float = 6.0


func _add_perdon(spr: AnimatedSprite3D, cfg: Dictionary) -> bool:
	var frames: SpriteFrames = spr.sprite_frames
	var c: Dictionary = _cfg_laminas(spr, cfg)
	var added: int = 0
	for i in range(1, 5):
		var path: String = "%s%02d.png" % [PERDON_SHEET, i]
		if not ResourceLoader.exists(path):
			continue
		if added == 0:
			frames.add_animation("perdon")
			frames.set_animation_loop("perdon", true)
			frames.set_animation_speed("perdon", PERDON_FPS)
		frames.add_frame("perdon", KitRecolor.apply(load(path), c))
		added += 1
	if added > 0:
		espalda_registra(spr, "perdon", PERDON_SHEET, 1)
	return added > 0




func _tick(_delta: float) -> void:



	if not _contra and t >= T_CORTE:
		_contra = true
		cam_keys.assign(_contraplano())
	_tick_palomas()
	_tick_persona()
	if not _plumas and t >= T_PLUMAS and stadium != null:
		_plumas = true
		stadium.fire_feathers(P_YO + PLUMAS_OFF)


func _tick_palomas() -> void:
	for i in _pigeons.size():
		var s: Sprite3D = _pigeons[i]
		if not is_instance_valid(s):
			continue
		var dv: float = t - _vuelo_t[i]
		if dv >= 0.0:


			if dv > VUELO_S:
				s.visible = false
				continue
			s.texture = _wings
			s.position = _p0[i] + _vel[i] * dv + Vector3.UP *(0.5 * VUELO_ACEL * dv * dv)
			continue
		_mira_hacia_ti(i)
		var dg: float = t - _giro_t[i]
		s.flip_h = _mira_a_ti[i] if dg >= 0.0 else not _mira_a_ti[i]
		var hop: float = 0.0
		if dg >= 0.0 and dg < HOP_S:
			hop = sin(PI * dg / HOP_S) * HOP_H
		s.position = _p0[i] + Vector3.UP * hop





func _pantalla_x(p: Vector3) -> float:
	if cam == null or not cam.is_inside_tree():
		return p.x
	return cam.unproject_position(p).x







func _mira_hacia_ti(i: int) -> void:
	var yo: Vector3 =(player.position if player != null else P_YO) + Vector3.UP
	var dx: float = _pantalla_x(yo) - _pantalla_x(_pigeons[i].global_position)
	if absf(dx) > MIRA_HIST_PX:
		_mira_a_ti[i] = dx > 0.0


func _tick_persona() -> void:
	if player == null:
		return
	if t < T_PERDON:

		idle_play(player, Vector3(0.0, 0.0, -1.0))
		return
	if t < T_ANDA:


		if _perdon_ok and player.animation != "perdon":
			player.play("perdon")
		return
	var z: float = maxf(P_YO.z - WALK_MS *(t - T_ANDA), Z_FIN)
	player.position.z = z
	if z > Z_FIN:
		walk_play(player, Vector3(0.0, 0.0, -1.0))
		return


	if not _parado:
		_parado = true
		walk_play(player, Vector3.ZERO)
	idle_play(player, Vector3(0.0, 0.0, -1.0))





func _skipped() -> void:
	_plumas = true
