class_name Drive
extends RefCounted






















































































































const KINDS: Array[String] = ["solo", "frontal", "angulo", "lejano", "rebote",
	"contra", "volea", "centro", "banda", "cambio_banda"]




































const STANCE_M: float = 2.05







const STANCE_SPAN: float = 0.25



































const STANCE_NEAR_M: float = 1.0





const STANCE_NEAR_SPAN: float = 0.15








const STANCE_SIDE_MIN: float = 0.85
























const STANCE_RITUAL_KINDS: Array[String] = ["libre", "corner", "penal", "indirecta"]















const RING_R: float = 1.7
























































static func out_of_play(ball: Vector2) -> bool:
	return absf(ball.x) > Stadium.FIELD_HALF_W or ball.y < 0.0 \
			or ball.y > Stadium.FIELD_DEPTH




static func walked_in(ball: Vector2, goal_half_w: float) -> bool:
	return ball.y < 0.0 and absf(ball.x) <= goal_half_w






const PRESS_N: int = 3




const PRESS_R: float = 14.0



























































const COAST_STOP: float = 0.15
const COAST_BALL: float = 0.06
const COAST_MAX_T: float = 0.6




static func coast_done(vel: Vector2, gap: float, t: float) -> bool:
	if t >= COAST_MAX_T:
		return true
	return vel.length() < COAST_STOP and absf(gap) < COAST_BALL

















































const FOUL_COS: float = 0.78





const FOUL_MIN_PACE: float = 0.25




static func is_foul(dpos: Vector2, ball: Vector2, facing: Vector2,
		pace: float) -> bool:
	if pace < FOUL_MIN_PACE or facing.length_squared() < 0.0001:
		return false
	var to_def: Vector2 = dpos - ball
	if to_def.length() < 0.001:
		return false
	return to_def.normalized().dot(facing.normalized()) < - FOUL_COS












































const FALTA_TUYA_BASE: float = 0.2
const FALTA_TUYA_SPAN_REGATE: float = 0.3
const FALTA_TUYA_SPAN_FISICO: float = 0.15
const FALTA_TUYA_FATIGA: float = 0.18
const FALTA_TUYA_MIN: float = 0.1
const FALTA_TUYA_MAX: float = 0.55






static func falta_tuya_odds(control: float, tackle: float, fisico: float, peso: float,
		fatiga: float) -> float:
	var v: float = FALTA_TUYA_BASE \
			+(clampf(tackle, 0.0, 1.0) - clampf(control, 0.0, 1.0)) * FALTA_TUYA_SPAN_REGATE \
			+(clampf(peso, 0.0, 1.0) - clampf(fisico, 0.0, 1.0)) * FALTA_TUYA_SPAN_FISICO \
			+ clampf(fatiga, 0.0, 1.0) * FALTA_TUYA_FATIGA
	return clampf(v, FALTA_TUYA_MIN, FALTA_TUYA_MAX)



static func falta_es_tuya(control: float, tackle: float, fisico: float, peso: float,
		fatiga: float, roll: float) -> bool:
	return roll < falta_tuya_odds(control, tackle, fisico, peso, fatiga)




static func allowed(kind: String, moving: bool, header: bool) -> bool:
	if moving or header:
		return false
	return KINDS.has(kind)
































static func can_trap(kind: String, moving: bool, header: bool) -> bool:
	if not moving or header or kind == "volea":
		return false
	return KINDS.has(kind)



static func trap_slop(regate: float) -> float:
	return lerpf(1.0, 0.2, clampf(regate, 0.0, 1.0))



static func trap_lock(regate: float) -> float:
	return lerpf(0.55, 0.15, clampf(regate, 0.0, 1.0))









static func in_ring(ground: Vector2, feet: Vector2, r: float = RING_R) -> bool:
	return ground.distance_to(feet) <= r




















const PRESS_STICKY_M: float = 0.9




















static func pressers(defs: Array, ball: Vector2, n: int = PRESS_N,
		radius: float = PRESS_R, sticky: Array = [], spds: Array = []) -> Array[int]:
	var d_eff: Callable = func(i: int) -> float:
		return (defs[i] as Vector2).distance_to(ball) \
				-(PRESS_STICKY_M if sticky.has(i) else 0.0)
	var t_eff: Callable = func(i: int) -> float:
		if i >= spds.size():
			return d_eff.call(i)
		return d_eff.call(i) / maxf(float(spds[i]), 0.5)
	var near: Array[int] = []
	for i in defs.size():
		if d_eff.call(i) <= radius:
			near.append(i)
	near.sort_custom(func(a: int, b: int) -> bool:
		return t_eff.call(a) < t_eff.call(b))
	return near.slice(0, n)









static func press_step(dpos: Vector2, dvel: Vector2, ball: Vector2, spd: float,
		dt: float, k: float = Duel.CHASE_ACCEL_K) -> Array:
	return Duel.step_defender(dpos, dvel, ball, spd, dt, k)
























const PRESS_SPREAD_M: float = 1.15
const PRESS_FADE_M: float = 2.6
static func press_point(ball: Vector2, dpos: Vector2, share: float,
		spread: float = PRESS_SPREAD_M, fade: float = PRESS_FADE_M) -> Vector2:
	var to_ball: Vector2 = ball - dpos
	var d: float = to_ball.length()
	if is_zero_approx(share) or d <= fade or d < 0.001:
		return ball
	var perp: Vector2 = Vector2(- to_ball.y, to_ball.x) / d


	var k: float = minf((d - fade) / fade, 1.0)
	return ball + perp * share * spread * k













static func press_brake(dpos: Vector2, dvel: Vector2, spd: float,
		dt: float, k: float = Duel.CHASE_ACCEL_K) -> Array:
	var nvel: Vector2 = dvel.move_toward(Vector2.ZERO, k * spd * dt)
	return [dpos + nvel * dt, nvel]

















static func simulate(start: Vector2, defs: Array, def_spds: Array, run_spd: float,
		control: float, policy: Callable, dt: float = 1.0 / 60.0,
		max_t: float = 8.0) -> Dictionary:
	var ball: Vector2 = start
	var player: Vector2 = start + start.normalized() * BALL_FOOT_BACK
	var pvel: Vector2 = Vector2.ZERO
	var facing: Vector2 = - start.normalized()
	var dpos: Array = defs.duplicate()
	var dvel: Array = []
	for _d in dpos:
		dvel.append(Vector2.ZERO)
	var t: float = 0.0
	var min_dist: float = INF
	while t < max_t:
		for d in dpos:
			min_dist = minf(min_dist,(d as Vector2).distance_to(ball))
		var thief: int = Duel.stealer(dpos, ball, control)
		if thief >= 0:
			var pace_now: float = clampf(pvel.length() / maxf(run_spd, 0.01), 0.0, 1.0)
			return {"held": t, "stolen": true,
				"foul": is_foul(dpos[thief], ball, facing, pace_now),
				"thief": thief, "ball": ball,
				"gained_side": absf(ball.x - start.x), "min_dist": min_dist}
		var steer: Vector2 = policy.call(ball, dpos)
		if steer.length_squared() > 0.0001:
			facing = steer.normalized()
		var out_p: Array = Duel.step_player(player, pvel, steer, run_spd, dt, control)
		player = out_p[0]
		pvel = out_p[1]


		ball = Duel.step_ball(ball, player, pvel, facing, run_spd, dt)

		var active: Array[int] = pressers(dpos, ball)
		for i in active:
			var spd: float = float(def_spds[i]) if i < def_spds.size() else 3.0
			var out: Array = press_step(dpos[i], dvel[i], ball, spd, dt)
			dpos[i] = out[0]
			dvel[i] = out[1]
		t += dt
	return {"held": t, "stolen": false, "foul": false, "thief": -1, "ball": ball,
		"gained_side": absf(ball.x - start.x), "min_dist": min_dist}





const BALL_FOOT_BACK: float = Duel.BALL_FOOT
