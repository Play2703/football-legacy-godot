class_name ScenarioStore
extends RefCounted

























const SAVE_PATH_BASE: String = "user://scenarios.cfg"



static func save_path() -> String:
	return ToolStash.activa(SAVE_PATH_BASE)


const FORMAT: int = 1



const KINDS: Array[String] = ["solo", "frontal", "lejano", "angulo", "rebote",
	"contra", "volea", "centro", "libre", "corner", "penal", "banda", "indirecta"]






const KIND_LABELS: Dictionary = {
	"solo": "Mano a mano", "frontal": "Disparo frontal", "lejano": "Desde lejos",
	"angulo": "Ángulo cerrado", "rebote": "Rebote en el área", "contra": "Contraataque",
	"volea": "Volea", "centro": "Centro al área", "libre": "Tiro libre",
	"corner": "Tiro de esquina", "penal": "Penal", "banda": "Saque de banda largo",
	"indirecta": "Falta indirecta en el área",
}




const FORMATIONS: Array[String] = ["4-4-2", "4-3-3", "4-2-3-1", "3-5-2",
	"5-3-2", "5-4-1", "4-5-1"]





const ROW_WIDTH: Dictionary = {
	"def": {2: 9.0, 3: 13.5, 4: 19.5, 5: 23.5},
	"mid": {1: 0.0, 2: 8.5, 3: 12.0, 4: 21.0, 5: 24.5},
	"att": {1: 0.0, 2: 7.5, 3: 18.5},
}




const HEIGHTS: Array[String] = ["AUTO", "BAJA", "MEDIA", "ALTA"]









const HEIGHT_BANDS: Dictionary = {
	"BAJA": [8.0, 36.0],
	"MEDIA": [32.0, 72.0],
	"ALTA": [48.0, 95.0],
}
const PITCH_LEN: float = 105.0
const HALF_LINE: float = 52.5



const HIGH_FROM: float = 89.0
const HIGH_TO: float = 95.0



const HEIGHT_WIDTH: Dictionary = {"AUTO": 1.0, "BAJA": 0.8, "MEDIA": 1.0, "ALTA": 1.1}








const HEIGHT_SHIFT: Dictionary = {"BAJA": -5.0, "MEDIA": 7.5, "ALTA": -5.0}



const LINE_MIN: float = 4.0

const ONSIDE_MARGIN: float = 0.6



const LINE_AHEAD_MIN: float = 6.0

















const BASCULA_RIVAL: float = 0.45
const BASCULA_MIA: float = 0.2
const BASCULA_CIERRE: float = 0.1
const BASCULA_X0: float = 6.0
const BASCULA_X1: float = 16.0



const BASCULA_EXTREMO_W: float = 15.0

const FORMATION_ROWS: Dictionary = {
	"4-4-2": [4, 4, 2], "4-3-3": [4, 3, 3], "4-2-3-1": [4, 2, 3, 1],
	"3-5-2": [3, 5, 2], "5-3-2": [5, 3, 2], "5-4-1": [5, 4, 1],
	"4-5-1": [4, 5, 1],



	"4-1-2-3": [4, 1, 2, 3], "4-2-1-3": [4, 2, 1, 3], "4-3-1-2": [4, 3, 1, 2],
	"4-4-1-1": [4, 4, 1, 1], "3-4-1-2": [3, 4, 1, 2], "3-4-3": [3, 4, 3],
}




















static func formation_of(club_id: String) -> String:
	if club_id.is_empty():
		return "4-4-2"
	return Squad.formation_of(club_id)



const KIND_SHORT: Dictionary = {
	"solo": "MANO A MANO", "frontal": "FRONTAL", "lejano": "DE LEJOS",
	"angulo": "ÁNGULO", "rebote": "REBOTE", "contra": "CONTRA", "volea": "VOLEA",
	"centro": "CENTRO", "libre": "LIBRE", "corner": "CÓRNER", "penal": "PENAL",
	"banda": "BANDA", "indirecta": "INDIRECTA",
}


const FIELD_EDGE: float = 30.0


const FIELD_BACK: float = 104.0
const BALL_EDGE: float = 29.5
const BALL_MIN_Z: float = 1.0
const BALL_MIN_DIST: float = 4.0



const KEEPER_RANGE: float = 2.6





const KEEPER_Z: float = 0.6













const KEEPER_HOME_NEAR_M: float = 12.0
const KEEPER_HOME_FAR_M: float = 26.0
const KEEPER_HOME_Z_FAR: float = 2.2
const KEEPER_NEAR_POST: float = 1.0
const KEEPER_NEAR_POST_NEAR_M: float = 22.0
const KEEPER_NEAR_POST_FAR_M: float = 30.0



const GOAL_HALF_W: float = 3.66
const CLEAR_BALL_R: float = 2.4
const CLEAR_PLAYER_R: float = 2.0
const CLEAR_LANE_HALF_W: float = 1.6
const KEEPER_CLEAR: float = 2.15
const ACTOR_SEP: float = 1.7





const OFF_CAM_RADIUS: float = 12.0
const RUNUP_BACK: float = 2.8
const WALL_STEP: float = 0.95
const WALL_DIST: float = 9.15



const PENALTY_BALL: Vector2 = Vector2(0.0, 11.0)
const CORNER_X: float = 29.5
const CORNER_Z: float = 1.0
const LOCKED_KINDS: Array[String] = ["penal", "corner"]

const MOVE_SPEED_MIN: float = 0.2
const MOVE_SPEED_LO: float = 0.3
const MOVE_SPEED_HI: float = 0.7










const CAM_PROFILES: Dictionary = {
	"penal": [0.7, 0.86, 50.0, 0.9],
	"corner": [0.98, 0.84, 60.0, 0.8],
	"libre": [1.06, 1.0, 56.0, 0.68],
	"regate": [0.56, 0.34, 58.0, 0.38],
}
const OPEN_CAM_DIST: float = 52.5











const CAM_PULLBACK: float = 0.586
const AIM_FOV: float = 55.0
const AIM_ASPECT: float = 0.5625
const VIS_FRAC: float = 0.92
const SPRITE_PAD: float = 0.5
const SAFE_MIN: float = 1.3

static var _cache: Array = []
static var _loaded: bool = false





static func blank() -> Dictionary:
	return {
		"id": "", "name": "", "kind": "frontal", "label": KIND_LABELS["frontal"],
		"ball": Vector2(0.0, 20.0), "keeper_x": 0.0, "keeper_auto": true,
		"mates": [], "rivals": [],
		"moving": {"kind": "", "dir": 1.0, "speed": 0.5},


		"form_rival": "4-4-2", "form_own": "4-4-2",
		"height_rival": "BAJA", "height_own": "ALTA",
		"approved": false, "created": 0, "version": FORMAT, "broken": false,
	}






static func to_chance(scn: Dictionary) -> Dictionary:
	var walls: Array[Vector2] = []
	var loose: Array[Vector2] = []
	for r in scn.get("rivals", []):
		if bool((r as Dictionary).get("wall", false)):
			walls.append(r["pos"])
		else:
			loose.append(r["pos"])
	var defenders: Array[Vector2] = []
	defenders.append_array(walls)
	defenders.append_array(loose)
	var mates: Array[Vector2] = []
	for m in scn.get("mates", []):
		mates.append(m)
	var out: Dictionary = {
		"kind": String(scn.get("kind", "frontal")),
		"name": String(scn.get("label", "Jugada")),
		"ball": scn.get("ball", Vector2(0.0, 20.0)),
		"teammates": mates,
		"defenders": defenders,
	}
	if not bool(scn.get("keeper_auto", true)):
		out["keeper_x"] = float(scn.get("keeper_x", 0.0))
	if not walls.is_empty():
		out["wall_count"] = walls.size()
	var mv: Dictionary = scn.get("moving", {})
	if String(mv.get("kind", "")) != "":
		out["moving"] = {"kind": String(mv["kind"]), "dir": float(mv.get("dir", 1.0)),
			"speed": float(mv.get("speed", 0.5))}
	return out



static func suggest_kind(ball: Vector2, has_wall: bool) -> String:
	if has_wall:
		return "libre" if ball.y > 16.0 else "indirecta"
	if absf(ball.x) > 26.0 and ball.y < 4.0:
		return "corner"
	if absf(ball.x) > 12.0 and ball.y < 12.0:
		return "centro"
	if absf(ball.x) > 11.0 and ball.y < 18.0:
		return "angulo"






	if ball.y < 10.0:
		return "solo"
	if ball.y > 28.0:
		return "contra"
	if ball.y > 26.0:
		return "lejano"
	return "frontal"



static func ball_locked(kind: String) -> bool:
	return LOCKED_KINDS.has(kind)



static func locked_ball(kind: String, right: bool = true) -> Vector2:
	if kind == "penal":
		return PENALTY_BALL
	return Vector2(CORNER_X if right else - CORNER_X, CORNER_Z)



























static func keeper_auto_x(ball: Vector2, goal_y: float = 0.0,
		dir: float = 1.0, plane: float = KEEPER_Z) -> float:
	var z: float = goal_y + plane * dir
	if (ball.y - z) * dir <= 0.5:

		return clampf(ball.x, - KEEPER_RANGE, KEEPER_RANGE)
	var u1: Vector2 =(Vector2(- GOAL_HALF_W, goal_y) - ball).normalized()
	var u2: Vector2 =(Vector2(GOAL_HALF_W, goal_y) - ball).normalized()
	var bis: Vector2 = u1 + u2
	if absf(bis.y) < 0.001:
		return clampf(ball.x, - KEEPER_RANGE, KEEPER_RANGE)
	var t: float =(z - ball.y) / bis.y
	return clampf(ball.x + bis.x * t, - KEEPER_RANGE, KEEPER_RANGE)








static func keeper_home_depth(depth: float, skill: float = 0.5) -> float:
	var t: float = clampf((depth - KEEPER_HOME_NEAR_M)
		/ maxf(KEEPER_HOME_FAR_M - KEEPER_HOME_NEAR_M, 0.001), 0.0, 1.0)
	var adv: float =(KEEPER_HOME_Z_FAR - KEEPER_Z) * t *(0.75 + 0.35 * skill)
	return minf(KEEPER_Z + adv, KEEPER_HOME_Z_FAR)















static func keeper_spot_x(ball: Vector2, goal_y: float = 0.0, dir: float = 1.0,
		home: float = KEEPER_Z, dial: float = KEEPER_NEAR_POST,
		near_m: float = KEEPER_NEAR_POST_NEAR_M) -> float:
	var linea: float = keeper_auto_x(ball, goal_y, dir)
	var d: float = dial * clampf(((ball.y - goal_y) * dir - near_m)
		/ maxf(KEEPER_NEAR_POST_FAR_M - near_m, 0.001), 0.0, 1.0)
	if d <= 0.0:
		return linea
	return lerpf(linea, keeper_auto_x(ball, goal_y, dir, home), minf(d, 1.0))




static func sync_keeper(scn: Dictionary) -> bool:
	if not bool(scn.get("keeper_auto", true)):
		return false



	var b: Vector2 = scn.get("ball", Vector2.ZERO)




	var want: float = keeper_spot_x(b, 0.0, 1.0, keeper_home_depth(b.y))
	if is_equal_approx(float(scn.get("keeper_x", 0.0)), want):
		return false
	scn["keeper_x"] = want
	return true




static func snap_ball(scn: Dictionary) -> bool:
	var kind: String = String(scn.get("kind", ""))
	if not ball_locked(kind):
		return false
	var right: bool = float((scn.get("ball", Vector2.ZERO) as Vector2).x) >= 0.0
	var want: Vector2 = locked_ball(kind, right)
	if scn.get("ball", Vector2.ZERO) == want:
		return false
	scn["ball"] = want
	return true















































static func formation_positions(name: String, rival: bool, ball: Vector2,
		height: String = "AUTO", ctx: Dictionary = {},
		attack_z: float = 0.0) -> Array:





	if attack_z > HALF_LINE:
		var ctx_e: Dictionary = ctx.duplicate()
		if ctx.has("others"):
			var otros: Array = []
			for o in (ctx["others"] as Array):
				otros.append(Vector2((o as Vector2).x, PITCH_LEN -(o as Vector2).y))
			ctx_e["others"] = otros



		if ctx.has("last_def") and float(ctx["last_def"]) < INF:
			ctx_e["last_def"] = PITCH_LEN - float(ctx["last_def"])
		var esp: Array = formation_positions(name, rival,
			Vector2(ball.x, PITCH_LEN - ball.y), height, ctx_e, 0.0)
		var out_e: Array = []
		for p in esp:
			out_e.append(Vector2((p as Vector2).x, PITCH_LEN -(p as Vector2).y))
		return out_e
	var rows: Array = FORMATION_ROWS.get(name, FORMATION_ROWS["4-4-2"])
	var bz: float = maxf(ball.y, 1.0)







	var back_line: float = clampf(bz * 0.55 - 2.0, 5.5, 52.0) \
			* float(ctx.get("line_k", 1.0))
	back_line = clampf(back_line, 5.5, minf(52.0, maxf(bz - LINE_AHEAD_MIN, 5.5)))



	var block: float = clampf(bz * 0.75, 26.0, 42.0)
	var gap: float = block / float(maxi(rows.size() - 1, 1))
	var out: Array = []




	var z_stagger: float = 0.0 if rival else gap * 0.5
	var x_stagger: float = 0.0 if rival else 1.7


	var bascula: float = 0.0
	var cierre: float = 1.0
	var bk: float = float(ctx.get("bascula", 0.0))
	if bk > 0.0:
		bascula =(BASCULA_RIVAL if rival else BASCULA_MIA) * bk
		if rival:
			cierre = 1.0 - BASCULA_CIERRE * bk * clampf(
				(absf(ball.x) - BASCULA_X0) /(BASCULA_X1 - BASCULA_X0), 0.0, 1.0)
	var front_from: int = 0
	for r in rows.size():
		var n: int = int(rows[r])
		var depth: int = r if rival else (rows.size() - 1 - r)
		if not rival and depth == 0:
			front_from = out.size()
		var z: float = clampf(back_line + float(depth) * gap + z_stagger, 1.5, FIELD_BACK)
		if height != "AUTO":
			z = _height_z(r, rows.size(), rival, height)
			z = _avoid_lines(z, ctx.get("others", []), rival)


			if r == 0 or height == "BAJA":
				z = _keep_own_half(z, rival)
			z = clampf(z, 1.5, FIELD_BACK)












		if not rival:
			var lastd: float = float(ctx.get("last_def", INF))
			if lastd < INF:
				z = maxf(z, minf(lastd, ball.y) + ONSIDE_MARGIN)
			z = clampf(z, 1.5, FIELD_BACK)


		var role: String = "def" if r == 0 else ("att" if r == rows.size() - 1 else "mid")
		var w: float = float((ROW_WIDTH[role] as Dictionary).get(n, 12.0)) \
				* float(HEIGHT_WIDTH.get(height, 1.0))
		w = minf(w, FIELD_EDGE - absf(x_stagger) - 0.5)
		var wk: float = w * cierre


		var room: float = maxf(FIELD_EDGE - 0.5 - wk - absf(x_stagger), 0.0)
		var s: float = clampf(bascula * ball.x, - room, room)
		for i in n:
			var t: float = 0.5 if n <= 1 else float(i) / float(n - 1)
			var x: float = lerpf(- wk, wk, t) + x_stagger + s

			if not rival and bascula > 0.0 and role != "def" and w >= BASCULA_EXTREMO_W \
					and (i == 0 or i == n - 1) and absf(ball.x) >= BASCULA_X0:
				var x0: float = lerpf(- w, w, t) + x_stagger
				if signf(x0) != signf(ball.x):
					x = x0
			out.append(Vector2(x, z))




	if not rival and out.size() > front_from and not bool(ctx.get("con_punta", false)):



		var pick: int = front_from
		var best: float = INF
		for i in range(front_from, out.size()):
			var d2: float = absf((out[i] as Vector2).x - ball.x)
			if d2 < best:
				best = d2
				pick = i
		out.remove_at(pick)
	return out






static func _avoid_lines(z: float, others: Array, _rival: bool) -> float:
	if others.is_empty():
		return z




	var cands: Array = [z]
	for o in others:
		var oz: float =(o as Vector2).y
		cands.append(oz - LINE_MIN)
		cands.append(oz + LINE_MIN)
	var best: float = z
	var best_score: float = - INF
	for c in cands:
		var clear: float = INF
		for o2 in others:
			clear = minf(clear, absf(float(c) -(o2 as Vector2).y))

		var score: float = minf(clear, LINE_MIN) * 1000.0 - absf(float(c) - z)
		if score > best_score:
			best_score = score
			best = float(c)
	return best



static func _keep_own_half(z: float, rival: bool) -> float:
	return minf(z, HALF_LINE - 1.0) if rival else maxf(z, HALF_LINE + 1.0)





static func _height_z(line: int, n_rows: int, rival: bool, height: String) -> float:
	var band: Array = HEIGHT_BANDS.get(height, HEIGHT_BANDS["MEDIA"])
	var lo: float = float(band[0])
	var hi: float = float(band[1])
	var d: float =(lo + hi) * 0.5
	if height == "ALTA":



		if line == 0:
			d = lo
		elif n_rows <= 1:
			d = HIGH_TO
		else:
			d = lerpf(HIGH_FROM, HIGH_TO, float(line - 1) / float(maxi(n_rows - 2, 1)))
	elif n_rows > 1:
		d = lerpf(lo, hi, float(line) / float(n_rows - 1))
	if not rival and (height != "ALTA" or line == 0):
		d += float(HEIGHT_SHIFT.get(height, 0.0))


	if line == 0:
		d = minf(d, HALF_LINE - 1.0)
	d = clampf(d, 5.0, 100.0)
	return clampf(d if rival else PITCH_LEN - d, 1.5, FIELD_BACK)



static func counts() -> Dictionary:
	var out: Dictionary = {}
	for k in KINDS:
		out[k] = 0
	for s in all():
		var k2: String = String(s.get("kind", ""))
		if out.has(k2):
			out[k2] = int(out[k2]) + 1
	return out











static func vis_half(d: float, a: float, aspect: float = AIM_ASPECT,
		kind: String = "") -> float:
	var dd: float = maxf(d, 4.0)
	var cam: Dictionary = cam_params(kind, dd, false)
	var h: float = float(cam["h"])
	var back: float = float(cam["back"])
	var ax: float = float(cam["look"]) * dd + back
	var k: float = tan(deg_to_rad(float(cam["fov"]) * 0.5)) * aspect
	return k *((a + back) * ax + h * h) / sqrt(ax * ax + h * h)







static func cam_params(kind: String, dist: float,
		apply_multipliers: bool = true) -> Dictionary:



	var p: Array = CAM_PROFILES.get(kind, CAM_PROFILES["regate"])
	if p == CAM_PROFILES["regate"]:
		dist = OPEN_CAM_DIST



	var h_max: float = clampf(20.0 +(dist - 50.0) * 0.26, 20.0, 34.0)
	var back_max: float = clampf(20.0 +(dist - 50.0) * 0.14, 20.0, 27.0)
	var look_far: float = clampf(1.0 - 26.0 / maxf(dist, 1.0), 0.0, 0.8)





	var mult: float =(CAM_PULLBACK * Settings.cam_zoom_mul()) if apply_multipliers else 1.0
	return {
		"h": clampf(dist * 0.44 + 3.5, 7.5, h_max) * float(p[0]) * mult,
		"back": clampf(dist * 0.36 + 3.5, 5.5, back_max) * float(p[1]) * mult,
		"fov": float(p[2]),
		"look": maxf(float(p[3]), look_far),
	}




static func along_sep(a: float) -> float:
	return clampf(2.6 + 0.1 * a, 2.6, 4.4)




static func shot_frame(ball: Vector2) -> Dictionary:
	var to_goal: Vector2 = Vector2.ZERO - ball
	var dist: float = maxf(to_goal.length(), 0.001)
	var fwd: Vector2 = to_goal / dist
	return {
		"fwd": fwd, "perp": Vector2(- fwd.y, fwd.x), "dist": dist,
		"runup": ball - fwd * RUNUP_BACK,
		"lane": clampf(dist * 0.45, 2.5, 6.0),
	}



static func frame_al(p: Vector2, ball: Vector2, f: Dictionary) -> Vector2:
	var rel: Vector2 = p - ball
	return Vector2(rel.dot(f["fwd"]), rel.dot(f["perp"]))



static func make_wall(ball: Vector2, count: int) -> Array:
	var to_goal: Vector2 =(Vector2.ZERO - ball).normalized()
	var perp: Vector2 = Vector2(- to_goal.y, to_goal.x)
	var base: Vector2 = ball + to_goal * WALL_DIST
	var out: Array = []
	for i in count:
		out.append(base + perp *((float(i) - float(count - 1) * 0.5) * WALL_STEP))
	return out


static func keeper_spot(scn: Dictionary) -> Vector2:
	return Vector2(clampf(float(scn.get("keeper_x", 0.0)), - KEEPER_RANGE, KEEPER_RANGE),
		KEEPER_Z)






static func validate(scn: Dictionary, aspect: float = AIM_ASPECT) -> Dictionary:
	var vkind: String = String(scn.get("kind", ""))
	var errors: Array[String] = []
	var warnings: Array[String] = []
	var ball: Vector2 = scn.get("ball", Vector2.ZERO)
	var mates: Array = scn.get("mates", [])
	var rivals: Array = scn.get("rivals", [])






	if ball.y < BALL_MIN_Z:
		errors.append(I18n.tf("El balón debe estar al menos a {0} m de la línea de gol.",
			["%.1f" % BALL_MIN_Z]))
	if ball.length() < BALL_MIN_DIST:
		errors.append(I18n.tf("El balón está demasiado cerca del arco (mínimo {0} m).",
			["%.0f" % BALL_MIN_DIST]))
	if absf(ball.x) > BALL_EDGE:
		errors.append(I18n.tf("Con el balón tan abierto la cámara cae tras la tribuna (máx {0} m).",
			["%.1f" % BALL_EDGE]))
	for p in _all_positions(scn):
		if absf(p.x) > FIELD_EDGE or p.y > FIELD_BACK or p.y < -1.5:
			errors.append(I18n.t("Hay un jugador fuera del campo."))
			break
	var mv: Dictionary = scn.get("moving", {})
	if String(mv.get("kind", "")) != "" and float(mv.get("speed", 0.0)) < MOVE_SPEED_MIN:
		errors.append(I18n.t("Un balón en movimiento tan lento nunca sale de la pantalla de tiro."))
	if not KINDS.has(String(scn.get("kind", ""))):
		errors.append(I18n.t("Tipo de jugada desconocido."))


	if ball.length() >= BALL_MIN_DIST:
		var f: Dictionary = shot_frame(ball)
		var d: float = f["dist"]
		var off_cam: int = 0
		var lane_in: int = 0
		var vital: int = 0
		for i in rivals.size():
			var rp: Vector2 =(rivals[i] as Dictionary)["pos"]
			var is_wall: bool = bool((rivals[i] as Dictionary).get("wall", false))
			var al: Vector2 = frame_al(rp, ball, f)
			if rp.distance_to(ball) < OFF_CAM_RADIUS \
					and (absf(al.y) > vis_half(d, al.x, aspect, vkind) + 0.6 or al.x < -1.9):
				off_cam += 1
			if not is_wall and al.x > 0.0 and al.x < f["lane"] and absf(al.y) < CLEAR_LANE_HALF_W:
				lane_in += 1
			if not is_wall and (rp.distance_to(ball) < CLEAR_BALL_R
					or rp.distance_to(f["runup"]) < CLEAR_PLAYER_R):
				vital += 1
			if is_wall and absf(rp.distance_to(ball) - WALL_DIST) > 1.5:
				warnings.append(I18n.t("Un jugador de la barrera no está a los 9.15 m."))
		for m in mates:
			var al2: Vector2 = frame_al(m, ball, f)
			if (m as Vector2).distance_to(ball) < OFF_CAM_RADIUS \
					and (absf(al2.y) > vis_half(d, al2.x, aspect, vkind) + 0.6 or al2.x < -1.9):
				off_cam += 1
			if (m as Vector2).distance_to(ball) < CLEAR_BALL_R \
					or (m as Vector2).distance_to(f["runup"]) < CLEAR_PLAYER_R:
				vital += 1



		if off_cam > 0:
			warnings.append(I18n.tf("{0} {1} CERCA de la jugada quedan fuera del encuadre.",
				[off_cam, I18n.plural(off_cam, "jugador", "jugadores")]))
		if lane_in > 0:
			warnings.append(I18n.tf("{0} {1} tapan tu carril de tiro.",
				[lane_in, I18n.plural(lane_in, "rival", "rivales")]))
		if vital > 0:
			warnings.append(I18n.tf("{0} {1} pegados al balón o a tu carrera.",
				[vital, I18n.plural(vital, "jugador", "jugadores")]))


	var merged: int = 0
	var all_p: Array = _all_positions(scn)
	var wall_flags: Array = _wall_flags(scn)
	for i in all_p.size():
		for j in range(i + 1, all_p.size()):
			if bool(wall_flags[i]) and bool(wall_flags[j]):
				continue
			if (all_p[i] as Vector2).distance_to(all_p[j]) < ACTOR_SEP:
				merged += 1
	if merged > 0:
		warnings.append(I18n.tf("{0} {1} de jugadores encimados.",
			[merged, I18n.plural(merged, "par", "pares")]))





	var last_def: float = INF
	for r in rivals:
		if not bool((r as Dictionary).get("wall", false)):
			last_def = minf(last_def,((r as Dictionary)["pos"] as Vector2).y)
	if last_def < INF:
		var caught: int = 0
		for m in mates:
			if (m as Vector2).y < last_def - 0.1 and (m as Vector2).y < ball.y - 0.1:
				caught += 1
		if caught > 0:
			warnings.append(I18n.tf("{0} {1} en fuera de juego: el pase se pitará.",
				[caught, I18n.plural(caught, "compañero", "compañeros")]))

	var kind: String = String(scn.get("kind", ""))
	if mates.is_empty() and (kind == "centro" or kind == "corner" or kind == "banda"):
		warnings.append(I18n.t("Un centro sin rematadores no tiene a quién buscar."))

	return {"errors": errors, "warnings": warnings}


static func _all_positions(scn: Dictionary) -> Array:
	var out: Array = []
	for m in scn.get("mates", []):
		out.append(m)
	for r in scn.get("rivals", []):
		out.append((r as Dictionary)["pos"])
	return out


static func _wall_flags(scn: Dictionary) -> Array:
	var out: Array = []
	for _m in scn.get("mates", []):
		out.append(false)
	for r in scn.get("rivals", []):
		out.append(bool((r as Dictionary).get("wall", false)))
	return out




static func all() -> Array:
	_ensure_loaded()
	return _cache


static func get_by_id(id: String) -> Dictionary:
	for s in all():
		if String(s["id"]) == id:
			return s
	return {}



static func save(scn: Dictionary) -> String:
	_ensure_loaded()
	if String(scn.get("id", "")) == "":
		scn["id"] = "scn_%d_%d" % [Time.get_unix_time_from_system(), _cache.size()]
		scn["created"] = int(Time.get_unix_time_from_system())
	var found: int = -1
	for i in _cache.size():
		if String(_cache[i]["id"]) == String(scn["id"]):
			found = i
			break
	if found >= 0:
		_cache[found] = scn
	else:
		_cache.append(scn)
	_write()
	return String(scn["id"])


static func erase(id: String) -> void:
	_ensure_loaded()
	for i in _cache.size():
		if String(_cache[i]["id"]) == id:
			_cache.remove_at(i)
			break
	_write()


static func duplicate_scenario(id: String) -> String:
	var src: Dictionary = get_by_id(id)
	if src.is_empty():
		return ""
	var copy: Dictionary = src.duplicate(true)
	copy["id"] = ""
	copy["approved"] = false



	copy["name"] = String(src.get("name", "Jugada")) + " (copia)"
	return save(copy)


static func invalidate() -> void:
	_loaded = false
	_cache = []

















static func stash_for_tool() -> void:
	ToolStash.desvia(SAVE_PATH_BASE)
	invalidate()


static func unstash_for_tool() -> void:
	ToolStash.devuelve(SAVE_PATH_BASE)
	invalidate()


static func _ensure_loaded() -> void:
	if _loaded:
		return
	_loaded = true
	_cache = []
	var cfg: ConfigFile = ConfigFile.new()
	if cfg.load(save_path()) != OK:
		return
	for section in cfg.get_sections():
		if section == "meta" or section == "draft":
			continue
		_cache.append(_read_section(cfg, section))




static func _read_section(cfg: ConfigFile, id: String) -> Dictionary:
	var scn: Dictionary = blank()
	scn["id"] = id
	scn["name"] = String(cfg.get_value(id, "name", "Jugada"))
	scn["kind"] = String(cfg.get_value(id, "kind", "frontal"))
	scn["label"] = String(cfg.get_value(id, "label", KIND_LABELS.get(scn["kind"], "Jugada")))
	scn["ball"] = cfg.get_value(id, "ball", Vector2(0.0, 20.0))
	scn["keeper_x"] = float(cfg.get_value(id, "keeper_x", 0.0))
	scn["keeper_auto"] = bool(cfg.get_value(id, "keeper_auto", true))
	for key in ["form_rival", "form_own"]:
		var fv: String = String(cfg.get_value(id, key, "4-4-2"))
		scn[key] = fv if FORMATIONS.has(fv) else "4-4-2"
	for key2 in [["height_rival", "BAJA"], ["height_own", "ALTA"]]:
		var hv: String = String(cfg.get_value(id, key2[0], key2[1]))
		scn[key2[0]] = hv if HEIGHTS.has(hv) else String(key2[1])
	scn["approved"] = bool(cfg.get_value(id, "approved", false))
	scn["created"] = int(cfg.get_value(id, "created", 0))
	scn["version"] = int(cfg.get_value(id, "version", FORMAT))
	var mates: Array = []
	for m in cfg.get_value(id, "mates", []):
		if m is Vector2:
			mates.append(m)
	scn["mates"] = mates

	var pos: Array = cfg.get_value(id, "rival_pos", [])
	var wall: Array = cfg.get_value(id, "rival_wall", [])
	var rivals: Array = []
	for i in pos.size():
		if pos[i] is Vector2:
			rivals.append({"pos": pos[i], "wall": bool(wall[i]) if i < wall.size() else false})
	scn["rivals"] = rivals
	scn["moving"] = {
		"kind": String(cfg.get_value(id, "moving_kind", "")),
		"dir": float(cfg.get_value(id, "moving_dir", 1.0)),
		"speed": float(cfg.get_value(id, "moving_speed", 0.5)),
	}
	snap_ball(scn)
	sync_keeper(scn)


	scn["broken"] = int(scn["version"]) > FORMAT \
			or not validate(scn)["errors"].is_empty()
	return scn


static func _write() -> void:
	var cfg: ConfigFile = ConfigFile.new()
	cfg.set_value("meta", "version", FORMAT)
	for scn in _cache:
		var id: String = String(scn["id"])
		cfg.set_value(id, "name", String(scn.get("name", "Jugada")))
		cfg.set_value(id, "kind", String(scn.get("kind", "frontal")))
		cfg.set_value(id, "label", String(scn.get("label", "Jugada")))
		cfg.set_value(id, "ball", scn.get("ball", Vector2(0.0, 20.0)))
		cfg.set_value(id, "keeper_x", float(scn.get("keeper_x", 0.0)))
		cfg.set_value(id, "keeper_auto", bool(scn.get("keeper_auto", true)))
		cfg.set_value(id, "mates", scn.get("mates", []))
		var pos: Array = []
		var wall: Array = []
		for r in scn.get("rivals", []):
			pos.append((r as Dictionary)["pos"])
			wall.append(bool((r as Dictionary).get("wall", false)))
		cfg.set_value(id, "rival_pos", pos)
		cfg.set_value(id, "rival_wall", wall)
		var mv: Dictionary = scn.get("moving", {})
		cfg.set_value(id, "moving_kind", String(mv.get("kind", "")))
		cfg.set_value(id, "moving_dir", float(mv.get("dir", 1.0)))
		cfg.set_value(id, "moving_speed", float(mv.get("speed", 0.5)))
		for key3 in ["form_rival", "form_own", "height_rival", "height_own"]:
			cfg.set_value(id, key3, String(scn.get(key3, "")))
		cfg.set_value(id, "approved", bool(scn.get("approved", false)))
		cfg.set_value(id, "created", int(scn.get("created", 0)))
		cfg.set_value(id, "version", int(scn.get("version", FORMAT)))
	cfg.save(save_path())
