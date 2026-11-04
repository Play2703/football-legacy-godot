class_name Duel
extends RefCounted





















































const RUN_MIN: float = 3.2
const RUN_MAX: float = 5.2












const CHASE_MIN: float = 3.0
const CHASE_MAX: float = 4.8











const STEAL_R: float = 0.75







const CHASE_ACCEL_K: float = 2.0



static func run_speed(speed: float) -> float:
	return lerpf(RUN_MIN, RUN_MAX, clampf(speed, 0.0, 1.0))



static func chase_speed(def_skill: float) -> float:
	return lerpf(CHASE_MIN, CHASE_MAX, clampf(def_skill, 0.0, 1.0))




















































































const TIRE_CTRL_FLOOR: float = 0.1
const TIRE_FULL_T_MIN: float = 4.5
const TIRE_FULL_T_MAX: float = 9.0



static func tire_full_t(fisico: float) -> float:
	return lerpf(TIRE_FULL_T_MIN, TIRE_FULL_T_MAX, clampf(fisico, 0.0, 1.0))










static func tire_step(fatigue: float, pace: float, fisico: float, dt: float,
		escala: float = 1.0) -> float:
	if pace > 0.05:
		fatigue += pace * dt /(tire_full_t(fisico) * maxf(escala, 0.001))
	return clampf(fatigue, 0.0, 1.0)


















static func tire_ctrl_mult(fatigue: float) -> float:
	return lerpf(1.0, TIRE_CTRL_FLOOR, clampf(fatigue, 0.0, 1.0))






static func tire_control(control: float, fatigue: float) -> float:
	return clampf(control, 0.0, 1.0) * tire_ctrl_mult(fatigue)



















































const CONTROL_ACCEL_MIN: float = 13.0
const CONTROL_ACCEL_MAX: float = 22.1






const CONTROL_STEAL_MAX: float = 0.86
const CONTROL_STEAL_MIN: float = 0.66















const TACKLE_STEAL_SPAN: float = 0.18



const NEUTRAL_TACKLE: float = 0.5


const STEAL_R_MIN: float = 0.58
const STEAL_R_MAX: float = 0.95






const NEUTRAL_CONTROL: float = 0.55












static func run_accel(control: float) -> float:
	return lerpf(CONTROL_ACCEL_MIN, CONTROL_ACCEL_MAX, clampf(control, 0.0, 1.0))










































const SPRINT_ACCEL_MIN: float = 7.0
const SPRINT_ACCEL_MAX: float = 55.0
static func sprint_accel(a: float) -> float:
	return lerpf(SPRINT_ACCEL_MIN, SPRINT_ACCEL_MAX, clampf(a, 0.0, 1.0))





static func step_sprint(vel: Vector2, dir: Vector2, top: float, a: float,
		dt: float) -> Vector2:
	var target: Vector2 = dir.normalized() * top if dir.length_squared() > 0.0001 \
			else Vector2.ZERO
	return vel.move_toward(target, sprint_accel(a) * dt)








































































const CUT_ANGLE: float = 50.0
const CUT_FULL: float = 95.0
const CUT_RELEASE: float = 35.0
const CUT_KEEP_MIN: float = 0.3
const CUT_KEEP_MAX: float = 0.6








const CUT_RECOVER_MULT: float = 0.25

const CUT_RECOVER_FLOOR: float = 5.0


const CUT_MIN_DIST: float = 1.5



static func cut_keep(control: float) -> float:
	return lerpf(CUT_KEEP_MIN, CUT_KEEP_MAX, clampf(control, 0.0, 1.0))




static func cut_angle(vel: Vector2, dir: Vector2) -> float:
	if vel.length() < 0.2 or dir.length_squared() < 0.0001:
		return -1.0
	return rad_to_deg(acos(clampf(vel.normalized().dot(dir.normalized()), -1.0, 1.0)))




static func cut_factor(vel: Vector2, dir: Vector2, control: float) -> float:
	var ang: float = cut_angle(vel, dir)
	if ang <= CUT_ANGLE:
		return 1.0
	var t: float = smoothstep(0.0, 1.0, clampf(
		(ang - CUT_ANGLE) /(CUT_FULL - CUT_ANGLE), 0.0, 1.0))
	return lerpf(1.0, cut_keep(control), t)

















static func step_sprint_cut(vel: Vector2, dir: Vector2, top: float, a: float,
		control: float, armed: bool, recov: bool, dt: float) -> Array:
	var v: Vector2 = vel
	var ang: float = cut_angle(v, dir)
	var arm: bool = armed
	var rec: bool = recov
	if ang < 0.0 or ang <= CUT_RELEASE:
		arm = true
	elif arm and ang > CUT_ANGLE:
		v *= cut_factor(v, dir, control)
		arm = false
		rec = true
	var acc: float = sprint_accel(a)
	if rec:
		if v.length() >= top - 0.02:
			rec = false
		else:
			acc = maxf(acc * CUT_RECOVER_MULT, CUT_RECOVER_FLOOR)
	var target: Vector2 = dir.normalized() * top if dir.length_squared() > 0.0001 \
			else Vector2.ZERO
	return [v.move_toward(target, acc * dt), arm, rec]




static func steal_radius(control: float,
		tackle: float = NEUTRAL_TACKLE) -> float:
	var base: float = lerpf(CONTROL_STEAL_MAX, CONTROL_STEAL_MIN, clampf(control, 0.0, 1.0))
	var edge: float =(clampf(tackle, 0.0, 1.0) - NEUTRAL_TACKLE) * TACKLE_STEAL_SPAN
	return clampf(base + edge, STEAL_R_MIN, STEAL_R_MAX)





const MIN_PACE: float = 0.4






















const BALL_FOOT: float = 0.42
const BALL_LEAD: float = 0.8



const BALL_LAG: float = 7.0






















static func step_player(pos: Vector2, vel: Vector2, steer: Vector2, spd: float,
		dt: float, control: float = NEUTRAL_CONTROL,
		accel: float = -1.0) -> Array:
	var want: Vector2 = steer * spd
	if steer.length_squared() < 0.0001:
		want = Vector2.ZERO
	var a: float = control if accel < 0.0 else accel
	var nvel: Vector2
	if vel.length() < 0.2:

		nvel = vel.move_toward(want, run_accel(a) * dt)
	else:







		var fwd: Vector2 = vel.normalized()
		var dv: Vector2 = want - vel
		var d_par: Vector2 = fwd * dv.dot(fwd)
		var d_perp: Vector2 = dv - d_par
		var ra: float = maxf(run_accel(a) * dt, 0.0001)
		var rc: float = maxf(run_accel(control) * dt, 0.0001)
		var ux: float = d_par.length() / ra
		var uy: float = d_perp.length() / rc
		var n: float = sqrt(ux * ux + uy * uy)
		nvel = want if n <= 1.0 else vel + dv / n
	return [pos + nvel * dt, nvel]






static func step_ball(ball: Vector2, player: Vector2, vel: Vector2, facing: Vector2,
		spd: float, dt: float) -> Vector2:
	var dir: Vector2 = vel.normalized() if vel.length() > 0.05 else facing
	if dir.length_squared() < 0.0001:
		dir = Vector2(0.0, -1.0)
	var pace: float = clampf(vel.length() / maxf(spd, 0.01), 0.0, 1.0)
	var target: Vector2 = player + dir *(BALL_FOOT + BALL_LEAD * pace)
	return ball.lerp(target, clampf(BALL_LAG * dt, 0.0, 1.0))





















































const ROZA: float = 5.0
const ROZA_V: float = 2.2



















const TOQUE_T: float = 1.1



const TOQUE_T_CORTO: float = 0.5



const TOQUE_T_CONTROL: float = 0.14




























const TOQUE_LEAD_MIN: float = 0.85





const CERCA_R: float = 3.6

















const TOQUE_R: float = 0.9



const TOQUE_CD: float = 0.16














const TOQUE_MIN_V: float = 0.15




const QUIEBRE_COS: float = 0.8










const QUIEBRE_R: float = 2.6







const TOQUE_MIRA: float = 2.0















const RESCATE_T: float = 0.35
const RESCATE_U_MAX: float = 20.0





static func roll_ball(ball: Vector2, bvel: Vector2, dt: float) -> Array:
	var v: float = bvel.length()
	if v <= 0.0001:
		return [ball, Vector2.ZERO]




	var nv: float = maxf(v -(ROZA + ROZA_V * v) * dt, 0.0)
	var nvel: Vector2 = bvel *(nv / v)
	return [ball + nvel * dt, nvel]





static func hay_toque(ball: Vector2, player: Vector2, pvel: Vector2, bvel: Vector2,
		desde_ultimo: float, giro_cos: float) -> bool:
	if desde_ultimo < TOQUE_CD:
		return false
	if pvel.length() < TOQUE_MIN_V:
		return false
	var d: float = ball.distance_to(player)



	if giro_cos < QUIEBRE_COS:
		return d <= QUIEBRE_R
	var acerca: bool =(ball - player).dot(bvel - pvel) < 0.0












	var atras_linea: bool =(ball - player).dot(pvel) < 0.0
	if d > TOQUE_R:












		if acerca or d > QUIEBRE_R:
			return false
		var rumbo: Vector2 = pvel.normalized() if pvel.length_squared() > 0.0001 \
				else Vector2.ZERO
		var perp: float = absf((ball - player).cross(rumbo)) if rumbo != Vector2.ZERO else d
		return perp > TOQUE_R or atras_linea








	return acerca or atras_linea





static func toque_t(control: float, def_d: float, quiebre: bool) -> float:
	if quiebre:
		return TOQUE_T_CORTO
	var t: float = TOQUE_T - TOQUE_T_CONTROL * clampf(control, 0.0, 1.0)
	if def_d < CERCA_R:
		t = lerpf(TOQUE_T_CORTO, t, clampf(def_d / CERCA_R, 0.0, 1.0))
	return maxf(t, TOQUE_T_CORTO)





static func roll_dist(u: float) -> float:
	if u <= 0.0:
		return 0.0
	return u / ROZA_V -(ROZA /(ROZA_V * ROZA_V)) * log(1.0 + ROZA_V * u / ROZA)





const PASA_LINEA: float = 1.08


const TOQUE_U_MAX: float = 14.0




const CURVA_OMEGA_MAX: float = 2.2


const OMEGA_TAU: float = 0.3











static func omega_carrera(omega_prev: float, facing_prev: Vector2, facing: Vector2,
		dt: float) -> float:
	var rate: float = 0.0
	if facing_prev.length_squared() > 0.0001 and facing.length_squared() > 0.0001:
		rate = clampf(facing_prev.angle_to(facing) / maxf(dt, 0.0001),
			- CURVA_OMEGA_MAX, CURVA_OMEGA_MAX)
	return lerpf(omega_prev, rate, 1.0 - exp(- dt / OMEGA_TAU))






static func roll_speed_for(d: float) -> float:
	if d <= 0.0:
		return 0.0
	var lo: float = 0.0
	var hi: float = TOQUE_U_MAX * 2.0
	for _i in 12:
		var mid: float =(lo + hi) * 0.5
		if roll_dist(mid) < d:
			lo = mid
		else:
			hi = mid
	return (lo + hi) * 0.5










static func avance_toque(pvel: Vector2, rumbo: Vector2, spd_top: float, t: float,
		accel: float, quiebre: bool) -> float:
	var v0: float = clampf(rumbo.dot(pvel), 0.0, spd_top)
	var acc: float = sprint_accel(accel)
	if quiebre:
		acc = maxf(acc * CUT_RECOVER_MULT, CUT_RECOVER_FLOOR)
	var t_tope: float =(spd_top - v0) / maxf(acc, 0.001)
	if t_tope >= t:
		return v0 * t + 0.5 * acc * t * t
	return v0 * t_tope + 0.5 * acc * t_tope * t_tope + spd_top *(t - t_tope)
























static func toque_vel(ball: Vector2, player: Vector2, pvel: Vector2, facing: Vector2,
		spd_top: float, control: float, def_d: float, quiebre: bool,
		accel: float = 1.0, omega: float = 0.0) -> Vector2:
	var rumbo: Vector2 = facing.normalized() if facing.length_squared() > 0.0001 \
			else pvel.normalized()
	if rumbo.length_squared() < 0.0001:
		rumbo = Vector2(0.0, -1.0)
























	var lead: float = lerpf(1.0, TOQUE_LEAD_MIN, clampf(control, 0.0, 1.0))
	var t_cad: float = toque_t(control, def_d, quiebre)








	var rumbo_meta: Vector2 = rumbo.rotated(omega * 0.5 * t_cad) \
			if absf(omega) > 0.001 else rumbo
	var meta: Vector2 = player + rumbo_meta *(avance_toque(pvel, rumbo, spd_top,
		t_cad, accel, quiebre) * lead + BALL_FOOT)
	var to: Vector2 = meta - ball
	var d: float = to.length()
	if d < 0.05:
		return Vector2.ZERO





	var d_max: float = roll_dist(TOQUE_U_MAX)
	if d > d_max:
		var b: Vector2 = ball - player
		var c: float = rumbo.dot(b)
		var disc: float = c * c - b.length_squared() + d_max * d_max
		if disc >= 0.0:
			to =(player + rumbo * maxf(c + sqrt(disc), 0.0)) - ball
			d = to.length()
		if d < 0.05:
			return Vector2.ZERO
	return to / d * minf(roll_speed_for(d), TOQUE_U_MAX)



















static func paso_toque(st: Dictionary, player: Vector2, pvel: Vector2,
		facing: Vector2, spd_top: float, control: float, def_d: float,
		dt: float, accel: float = 1.0, omega: float = 0.0) -> Dictionary:
	var ball: Vector2 = st["ball"]
	var bvel: Vector2 = st["bvel"]
	var reloj: float = float(st["toque_t"]) + dt
	var t_dir: Vector2 = st["toque_dir"]




	var perdido: float = float(st.get("perdido_t", 0.0))
	var giro: float = facing.dot(t_dir)
	var hubo: bool = false
	var fuerza: float = 0.0









	var d_bp: float = ball.distance_to(player)
	var atras: bool = pvel.length() > TOQUE_MIN_V \
			and (ball - player).dot(pvel) < 0.0 \
			and d_bp > TOQUE_R \
			and (ball - player).dot(bvel - pvel) >= 0.0
	perdido = perdido + dt if atras else 0.0
	if hay_toque(ball, player, pvel, bvel, reloj, giro):







		var quiebre: bool = giro < QUIEBRE_COS or ball.distance_to(player) > TOQUE_R
		bvel = toque_vel(ball, player, pvel, facing, spd_top, control, def_d, quiebre,
			accel, omega)
		reloj = 0.0
		t_dir = facing
		hubo = true
		fuerza = clampf(bvel.length() / TOQUE_U_MAX, 0.0, 1.0)
	elif perdido >= RESCATE_T and reloj >= TOQUE_CD:










		var d_ahora: float = ball.distance_to(player)




		var u_est: float = minf(roll_speed_for(maxf(d_ahora, 0.1)), RESCATE_U_MAX)
		var t_viaje: float = d_ahora / maxf(u_est * 0.5, 1.0)
		var to_pie: Vector2 =(player + pvel * t_viaje
			+ facing.normalized() * BALL_FOOT) - ball
		var d_res: float = to_pie.length()
		if d_res > 0.05:
			bvel = to_pie / d_res * minf(roll_speed_for(d_res), RESCATE_U_MAX)
			reloj = 0.0
			t_dir = facing
			hubo = true
			fuerza = 1.0
			perdido = 0.0
	var paso: Array = roll_ball(ball, bvel, dt)
	return {"ball": paso[0], "bvel": paso[1], "toque_t": reloj,
		"toque_dir": t_dir, "toque": hubo, "fuerza": fuerza, "perdido_t": perdido}










static func step_defender(dpos: Vector2, dvel: Vector2, ball: Vector2, spd: float,
		dt: float, k: float = CHASE_ACCEL_K) -> Array:
	var to: Vector2 = ball - dpos
	var desired: Vector2 = Vector2.ZERO
	if to.length() > 0.0001:
		desired = to.normalized() * spd




	var nvel: Vector2 = dvel.move_toward(desired, k * spd * dt)
	return [dpos + nvel * dt, nvel]




















static func step_defender_cut(dpos: Vector2, dvel: Vector2, ball: Vector2, spd: float,
		dt: float, k: float, agil: float, armed: bool, recov: bool) -> Array:
	var to: Vector2 = ball - dpos
	var desired: Vector2 = Vector2.ZERO
	if to.length() > 0.0001:
		desired = to.normalized() * spd
	var v: Vector2 = dvel







	var ang: float = -1.0 if to.length() < CUT_MIN_DIST else cut_angle(v, desired)
	var arm: bool = armed
	var rec: bool = recov
	if ang < 0.0 or ang <= CUT_RELEASE:
		arm = true
	elif arm and ang > CUT_ANGLE:
		v *= cut_factor(v, desired, agil)
		arm = false
		rec = true
	var acc: float = k * spd
	if rec:
		if v.length() >= spd - 0.02:
			rec = false
		else:
			acc = maxf(acc * CUT_RECOVER_MULT, CUT_RECOVER_FLOOR)
	var nvel: Vector2 = v.move_toward(desired, acc * dt)
	return [dpos + nvel * dt, nvel, arm, rec]




































const LEAD_MAX_T: float = 0.55




const LEAD_NEAR_R: float = 2.5
const LEAD_FAR_R: float = 9.0



const CONTAIN_M: float = 5.0


const CONTAIN_AHEAD: float = 1.5




const ENGAGE_R: float = 4.0


const CONTAIN_LEAD_T: float = 0.45



static func lead_time(dpos: Vector2, ball: Vector2, lead: float) -> float:
	var far: float = clampf((dpos.distance_to(ball) - LEAD_NEAR_R)
		/(LEAD_FAR_R - LEAD_NEAR_R), 0.0, 1.0)
	return LEAD_MAX_T * clampf(lead, 0.0, 1.0) * far


















static func contains(dpos: Vector2, ball: Vector2,
		engage: float = ENGAGE_R, dir: float = -1.0) -> bool:
	return (dpos.y - ball.y) * dir > CONTAIN_AHEAD and dpos.distance_to(ball) > engage





static func cede(z: float, linea: float, dir: float) -> float:
	return maxf(z, linea) if dir < 0.0 else minf(z, linea)











static func contain_point(ball: Vector2, ball_vel: Vector2,
		floor_z: float = - INF, contain_m: float = CONTAIN_M,
		dir: float = -1.0) -> Vector2:
	return Vector2(ball.x + ball_vel.x * CONTAIN_LEAD_T,
		cede(ball.y + contain_m * dir, floor_z, dir))




























const JOCKEY_R: float = 2.6

const JOCKEY_ENTER: float = 4.2

const JOCKEY_SPD_F: float = 0.85


const SHOW_BALL_D: float = 1.15


const JOCKEY_MIN_READ: float = 0.62



static func shows_ball(ball: Vector2, player: Vector2) -> bool:
	return ball.distance_to(player) > SHOW_BALL_D







const JOCKEY_PACE_MAX: float = 0.8








static func should_jockey(dpos: Vector2, ball: Vector2, player: Vector2,
		read: float, pace: float = 0.0, dir: float = -1.0) -> bool:
	return read >= JOCKEY_MIN_READ and pace < JOCKEY_PACE_MAX \
			and (dpos.y - ball.y) * dir > 0.3 \
			and not shows_ball(ball, player) \
			and dpos.distance_to(ball) < JOCKEY_ENTER





static func jockey_point(ball: Vector2, floor_z: float = - INF,
		dir: float = -1.0) -> Vector2:
	return Vector2(ball.x, cede(ball.y + JOCKEY_R * dir, floor_z, dir))


































const COVER_GOAL_M: float = 8.0



const COVER_GOAL_MIN_Z: float = 5.0



const COVER_GOAL_MAX_X: float = 3.4











































const INTERCEPT_MAX_T: float = 3.0


const INTERCEPT_MIN_V: float = 0.8



static func intercept_time(ball: Vector2, bvel: Vector2, dpos: Vector2,
		spd: float) -> float:
	var r: Vector2 = ball - dpos
	var a: float = bvel.length_squared() - spd * spd
	var b: float = 2.0 * r.dot(bvel)
	var c: float = r.length_squared()


	if absf(a) < 0.0001:
		if absf(b) < 0.0001:
			return -1.0
		var tl: float = - c / b
		return tl if tl > 0.0 and tl <= INTERCEPT_MAX_T else -1.0
	var disc: float = b * b - 4.0 * a * c
	if disc < 0.0:
		return -1.0
	var s: float = sqrt(disc)
	var t1: float =(- b - s) /(2.0 * a)
	var t2: float =(- b + s) /(2.0 * a)

	var t: float = -1.0
	for cand in [minf(t1, t2), maxf(t1, t2)]:
		if cand > 0.0:
			t = cand
			break
	if t <= 0.0 or t > INTERCEPT_MAX_T:
		return -1.0
	return t




static func intercept_point(ball: Vector2, bvel: Vector2, dpos: Vector2,
		spd: float) -> Vector2:
	if bvel.length() < INTERCEPT_MIN_V:
		return Vector2.INF
	var t: float = intercept_time(ball, bvel, dpos, spd)
	if t < 0.0:
		return Vector2.INF
	return ball + bvel * t




static func cover_goal_point(ball: Vector2) -> Vector2:
	var l: float = maxf(ball.length(), 0.001)
	var p: Vector2 = ball / l * COVER_GOAL_M
	p.y = maxf(p.y, COVER_GOAL_MIN_Z)
	p.x = clampf(p.x, - COVER_GOAL_MAX_X, COVER_GOAL_MAX_X)
	return p



















const PINCH_AHEAD: float = 6.0












static func pinch_point(ball: Vector2, ball_vel: Vector2, floor_z: float = - INF,
		dir: float = -1.0) -> Vector2:
	var rumbo: Vector2 = ball_vel.normalized() if ball_vel.length() > 0.3 \
			else Vector2(0.0, dir)

	rumbo.y = minf(rumbo.y, -0.25) if dir < 0.0 else maxf(rumbo.y, 0.25)
	rumbo = rumbo.normalized()
	var p: Vector2 = ball + rumbo * PINCH_AHEAD
	p.y = cede(p.y, floor_z, dir)
	return p







static func can_pinch(dpos: Vector2, ball: Vector2, dir: float = -1.0) -> bool:
	return (dpos.y - ball.y) * dir > 0.0







const PINCH_MIN_SPARES: int = 2








static func container_of(defenders: Array, ball: Vector2, skip: int = -1,
		engage: float = ENGAGE_R, dir: float = -1.0) -> int:
	var best: int = -1



	var best_p: float = - INF
	for i in defenders.size():
		if i == skip:
			continue
		var d: Vector2 = defenders[i]
		if contains(d, ball, engage, dir) and d.y * dir > best_p:
			best_p = d.y * dir
			best = i
	return best















static func hunt_point(ball: Vector2, ball_vel: Vector2, dpos: Vector2,
		lead: float, sesgo_x: float = 0.0) -> Vector2:
	return ball + ball_vel * lead_time(dpos, ball, lead) + Vector2(sesgo_x, 0.0)



static func caught(defenders: Array, ball: Vector2,
		control: float = NEUTRAL_CONTROL, tackles: Array = []) -> bool:
	return stealer(defenders, ball, control, tackles) >= 0































const SHIELD_PACE_MAX: float = 0.75
const SHIELD_FACTOR: float = 0.45
const SHIELD_BALL_MAX: float = 2.6

static func stealer(defenders: Array, ball: Vector2,
		control: float = NEUTRAL_CONTROL, tackles: Array = [],
		bonus: Array = [], carrier: Vector2 = Vector2.INF,
		carrier_pace: float = 1.0) -> int:

	var escudo: float = 1.0
	var al_balon: Vector2 = Vector2.ZERO
	if carrier.x != INF and carrier_pace < SHIELD_PACE_MAX:
		al_balon = ball - carrier
		if al_balon.length() > 0.01 and al_balon.length() <= SHIELD_BALL_MAX:
			escudo = lerpf(1.0, SHIELD_FACTOR,
				clampf(1.0 - carrier_pace / SHIELD_PACE_MAX, 0.0, 1.0))
	for i in defenders.size():
		var t: float = float(tackles[i]) if i < tackles.size() else NEUTRAL_TACKLE
		var b: float = float(bonus[i]) if i < bonus.size() else 0.0
		var r: float = steal_radius(control, t) + b

		if escudo < 1.0 and al_balon.dot((defenders[i] as Vector2) - carrier) < 0.0:
			r *= escudo
		if (defenders[i] as Vector2).distance_to(ball) < r:
			return i
	return -1















const BEAT_MARGIN: float = 0.6





const MIN_BREAK: float = 7.0








const FOUL_BEHIND: float = 0.25












const FOUL_BEHIND_CLUMSY: float = 0.1
const FOUL_BEHIND_CLEAN: float = 0.4


static func foul_behind(tackle: float) -> float:
	return lerpf(FOUL_BEHIND_CLUMSY, FOUL_BEHIND_CLEAN, clampf(tackle, 0.0, 1.0))





static func line_z(chasers: Array) -> float:
	var z: float = INF
	for c in chasers:
		z = minf(z,(c as Vector2).y)
	return z





static func hold_line(prev: float, chasers: Array) -> float:
	return minf(prev, line_z(chasers))





static func start_line(ball: Vector2, chasers: Array) -> float:
	var live: float = line_z(chasers)
	if is_inf(live):
		return INF
	return minf(live, ball.y - MIN_BREAK)





static func beaten(hold_z: float, ball: Vector2) -> bool:
	if is_inf(hold_z):
		return false
	return ball.y <= hold_z - BEAT_MARGIN

















static func is_foul_tackle(dpos: Vector2, ball: Vector2,
		tackle: float = NEUTRAL_TACKLE, dir: float = -1.0) -> bool:
	return (dpos.y - ball.y) * dir < - foul_behind(tackle)





























const CLEAN_DUEL_SPAN: float = 0.45
const CLEAN_ODDS_MIN: float = 0.12
const CLEAN_ODDS_MAX: float = 0.88






static func clean_odds(dpos: Vector2, ball: Vector2,
		tackle: float = NEUTRAL_TACKLE, control: float = NEUTRAL_CONTROL) -> float:
	if not is_foul_tackle(dpos, ball, tackle):
		return 1.0
	var ventaja: float = clampf(tackle, 0.0, 1.0) - clampf(control, 0.0, 1.0)
	return clampf(0.5 + ventaja * CLEAN_DUEL_SPAN, CLEAN_ODDS_MIN, CLEAN_ODDS_MAX)






static func steal_is_foul(dpos: Vector2, ball: Vector2,
		tackle: float = NEUTRAL_TACKLE, control: float = NEUTRAL_CONTROL,
		roll: float = 1.0) -> bool:
	if not is_foul_tackle(dpos, ball, tackle):
		return false
	return roll >= clean_odds(dpos, ball, tackle, control)




static func crossed(ball_z: float, target_z: float) -> bool:
	return ball_z <= target_z
























const FIX_TRIGGER_D: float = 3.5



const WIDE_MARGIN: float = 3.0








static func wide_run(mate: Vector2, half_w: float) -> Vector2:
	var side: float = signf(mate.x) if absf(mate.x) > 0.5 else 1.0
	if absf(mate.x) >= half_w - WIDE_MARGIN:
		return Vector2(0.0, -1.0)
	return Vector2(side * 0.9, -0.45).normalized()











static func pro_foul(dpos: Vector2, ball: Vector2, read: float,
		defenders: Array, thief: int, dir: float = -1.0) -> bool:
	if read < JOCKEY_MIN_READ:
		return false
	if (dpos.y - ball.y) * dir >= - FOUL_BEHIND:
		return false
	for i in defenders.size():
		if i != thief and ((defenders[i] as Vector2).y - ball.y) * dir > 0.0:
			return false
	return true


const MATE_DRIFT_F: float = 0.72
const MATE_BURST_F: float = 1.04
const BURST_T: float = 1.2
const BURST_CD: float = 2.2
const COVER_TIGHT_R: float = 2.4
const COVER_M: float = 1.5
const COVER_LEAD: float = 0.6
const FREE_R: float = 3.0
const ONSIDE_SLACK: float = 0.4



static func covered(mate: Vector2, defenders: Array) -> bool:
	for d in defenders:
		if (d as Vector2).distance_to(mate) < COVER_TIGHT_R:
			return true
	return false





static func free_mate(mate: Vector2, defenders: Array, skip: int = -1) -> bool:
	for i in defenders.size():
		if i == skip:
			continue
		if (defenders[i] as Vector2).distance_to(mate) < FREE_R:
			return false
	return true




static func mate_run(mate: Vector2, marker: Vector2, ball: Vector2,
		burst: bool) -> Vector2:
	if not burst:
		var away: float = signf(mate.x - ball.x)
		if away == 0.0:
			away = 1.0
		return Vector2(away * 0.35, -1.0).normalized()
	var side: float = signf(mate.x - marker.x)
	if absf(mate.x - marker.x) < 0.3:
		side = signf(mate.x - ball.x)
	if side == 0.0:
		side = 1.0
	return Vector2(side * 0.85, -1.0).normalized()



static func step_mate(mate: Vector2, dir: Vector2, spd: float, delta: float,
		hold_z: float, target_z: float, half_w: float) -> Vector2:
	var m: Vector2 = mate + dir * spd * delta
	m.x = clampf(m.x, - half_w + 2.0, half_w - 2.0)
	m.y = maxf(m.y, target_z - 6.0)
	m.y = maxf(m.y, hold_z + ONSIDE_SLACK)
	return m








static func cover_point(mate: Vector2, run_dir: Vector2,
		arco: Vector2 = Vector2.ZERO) -> Vector2:
	var hacia: Vector2 = arco - mate
	var goal_dir: Vector2 = hacia.normalized() if hacia.length() > 0.01 \
			else Vector2(0.0, -1.0)
	return mate + goal_dir * COVER_M + run_dir * COVER_LEAD





















static func simulate(start: Vector2, target_z: float, defenders: Array, run_spd: float,
		chase_spd: float, policy: Callable, dt: float = 1.0 / 60.0,
		max_t: float = 8.0, control: float = NEUTRAL_CONTROL,
		tackles: Array = [], spds: Array = [], leads: Array = [],
		contain: bool = false, jockey: bool = false) -> Dictionary:






	var player: Vector2 = start + Vector2(0.0, BALL_FOOT)
	var ball: Vector2 = start
	var pvel: Vector2 = Vector2.ZERO
	var facing: Vector2 = Vector2(0.0, -1.0)
	var bst: Dictionary = {"ball": ball, "bvel": Vector2.ZERO,
		"toque_t": TOQUE_CD, "toque_dir": facing}
	var defs: Array = defenders.duplicate()
	var vels: Array = []
	for _d in defs:
		vels.append(Vector2.ZERO)
	var t: float = 0.0
	var min_dist: float = INF

	var hold: float = start_line(start, defs)
	while t < max_t:
		for d in defs:
			min_dist = minf(min_dist,(d as Vector2).distance_to(ball))
		hold = hold_line(hold, defs)
		if beaten(hold, ball):
			return {"won": true, "beaten": true, "crossed": false, "caught": false,
				"t": t, "min_dist": min_dist}
		if crossed(ball.y, target_z):
			return {"won": true, "beaten": false, "crossed": true, "caught": false,
				"t": t, "min_dist": min_dist}




		if stealer(defs, ball, control, tackles, [], player,
				clampf(pvel.length() / maxf(run_spd, 0.01), 0.0, 1.0)) >= 0:
			return {"won": false, "beaten": false, "crossed": false, "caught": true,
				"t": t, "min_dist": min_dist}
		var steer: Vector2 = policy.call(ball, defs)
		if steer.length_squared() > 0.0001:
			facing = steer.normalized()
		var out_p: Array = step_player(player, pvel, steer, run_spd, dt, control)
		player = out_p[0]
		pvel = out_p[1]
		if steer.length_squared() < 0.0001:


			bst["bvel"] = Vector2.ZERO
			bst["toque_t"] = TOQUE_CD
			bst["toque_dir"] = facing
			ball = step_ball(ball, player, pvel, facing, run_spd, dt)
			bst["ball"] = ball
		else:




			var def_d: float = INF
			for i in defs.size():
				def_d = minf(def_d,((defs[i] as Vector2)
					+(vels[i] as Vector2) * TOQUE_T).distance_to(ball))
			bst = paso_toque(bst, player, pvel, facing, run_spd, control, def_d, dt)
			ball = bst["ball"]



		var bvel_now: Vector2 = bst["bvel"]
		var vant: Vector2 = bvel_now if bvel_now.length() > 0.2 else pvel



		var presser: int = -1
		if contain or jockey:
			var pd: float = INF
			for i in defs.size():
				var d_b: float =(defs[i] as Vector2).distance_to(ball)
				if d_b < pd:
					pd = d_b
					presser = i
		var holder: int = container_of(defs, ball, presser) if contain else -1


		var pincher: int = -1
		var pinch_p: Vector2 = Vector2.ZERO
		if contain:
			pinch_p = pinch_point(ball, vant, target_z + 0.5)
			var spares: int = 0
			var ppd: float = INF
			var cand: int = -1
			for i in defs.size():
				if i == presser or i == holder:
					continue
				spares += 1
				if not can_pinch(defs[i], ball):
					continue
				var d_p: float =(defs[i] as Vector2).distance_to(pinch_p)
				if d_p < ppd:
					ppd = d_p
					cand = i
			if spares >= PINCH_MIN_SPARES:
				pincher = cand
		for i in defs.size():
			var spd: float = float(spds[i]) if i < spds.size() else chase_spd
			var ld: float = float(leads[i]) if i < leads.size() else 0.0
			var goal_p: Vector2
			if i == holder:
				goal_p = contain_point(ball, vant, target_z + 0.5)
			elif i == pincher and (defs[i] as Vector2).distance_to(ball) > ENGAGE_R:
				goal_p = pinch_p
			elif jockey and i == presser and should_jockey(defs[i], ball,
					player, ld, pvel.length() / maxf(run_spd, 0.01)):

				goal_p = jockey_point(ball, target_z + 0.5)
				spd *= JOCKEY_SPD_F
			else:
				goal_p = hunt_point(ball, vant, defs[i], ld)
			var out: Array = step_defender(defs[i], vels[i], goal_p, spd, dt)
			defs[i] = out[0]
			vels[i] = out[1]
		t += dt


	return {"won": false, "beaten": false, "crossed": false, "caught": false,
		"t": t, "min_dist": min_dist}

















































const POP_LO: float = 0.41
const POP_HI: float = 0.85










const EDGE: float = 0.12




static func spread(q: float) -> float:
	var x: float = clampf(q, 0.0, 1.0)
	if x < POP_LO:
		return EDGE *(x / POP_LO)
	if x > POP_HI:
		return (1.0 - EDGE) + EDGE *((x - POP_HI) /(1.0 - POP_HI))
	return EDGE +(1.0 - 2.0 * EDGE) *((x - POP_LO) /(POP_HI - POP_LO))








































const PESO_NEUTRO: float = 0.5
const PESO_ENTRADA_W: float = 0.65




static func peso(entrada: float, aceleracion: float) -> float:
	var e: float = clampf(entrada, 0.0, 1.0)
	var a: float = clampf(aceleracion, 0.0, 1.0)
	return clampf(PESO_ENTRADA_W * e +(1.0 - PESO_ENTRADA_W) *(1.0 - a), 0.0, 1.0)


















const CARGA_R: float = 1.3

















const CARGA_MIN_V: float = 0.2











const CARGA_FULL_R: float = 0.7













const CARGA_K: float = 0.75



const CARGA_MAX_V: float = 2.2
















const CARGA_PLANTADO: float = 0.45
const CARGA_ENCARANDO: float = 0.55
const CARGA_PERFIL: float = 1.0


const CARGA_PARADO_V: float = 0.4




static func carga_apoyo(pvel: Vector2, push_dir: Vector2) -> float:
	if pvel.length() < CARGA_PARADO_V:
		return CARGA_PLANTADO
	if push_dir.length_squared() < 0.0001:
		return CARGA_PERFIL


	var d: float = pvel.normalized().dot(push_dir.normalized())
	if d >= 0.0:
		return CARGA_PERFIL
	return lerpf(CARGA_PERFIL, CARGA_ENCARANDO, - d)














static func carga_push(dpos: Vector2, dvel: Vector2, ppos: Vector2, pvel: Vector2,
		peso_def: float = PESO_NEUTRO, peso_yo: float = PESO_NEUTRO) -> Vector2:
	var hacia_mi: Vector2 = ppos - dpos
	var dist: float = hacia_mi.length()
	if dist >= CARGA_R or dist < 0.0001:
		return Vector2.ZERO
	var dir: Vector2 = hacia_mi / dist













	var cierre: float = maxf(dvel.dot(dir) - maxf(pvel.dot(dir), 0.0), 0.0)
	if cierre < CARGA_MIN_V:
		return Vector2.ZERO






	var hondura: float = clampf((CARGA_R - dist) / maxf(CARGA_R - CARGA_FULL_R, 0.01),
		0.0, 1.0)
	var frac: float = peso_def / maxf(peso_def + peso_yo, 0.0001)
	var v: float = cierre * frac * carga_apoyo(pvel, dir) * hondura * CARGA_K
	return dir * minf(v, CARGA_MAX_V)















static func carga_desvio(push: Vector2, pvel: Vector2) -> Vector2:
	if pvel.length() < CARGA_PARADO_V:
		return push
	var fwd: Vector2 = pvel.normalized()
	return push - fwd * push.dot(fwd)





















const CARGA_ESPALDA_COS: float = -0.75















const CARGA_FALTA_MIN: float = 0.83




















const CARGA_FALTA_CLUMSY: float = 0.65
const CARGA_FALTA_CLEAN: float = 1.0


static func carga_falta_min(tackle: float = NEUTRAL_TACKLE) -> float:
	return lerpf(CARGA_FALTA_CLUMSY, CARGA_FALTA_CLEAN, clampf(tackle, 0.0, 1.0))






static func carga_es_falta(dpos: Vector2, ppos: Vector2, facing: Vector2,
		push: Vector2, min_push: float = CARGA_FALTA_MIN,
		espalda_cos: float = CARGA_ESPALDA_COS) -> bool:
	if push.length() < min_push:
		return false
	if facing.length_squared() < 0.0001:
		return false
	var hacia_el: Vector2 = dpos - ppos
	if hacia_el.length() < 0.0001:
		return false
	return hacia_el.normalized().dot(facing.normalized()) <= espalda_cos


























const CARGA_DURA_F: float = 2.0
const CARGA_DURA_MIN: float = CARGA_FALTA_MIN * CARGA_DURA_F


static func carga_es_dura(dpos: Vector2, ppos: Vector2, facing: Vector2,
		push: Vector2) -> bool:
	return push.length() >= CARGA_DURA_MIN \
			and carga_es_falta(dpos, ppos, facing, push)

























































const SHOULDER_MIN_READ: float = 0.4


const SHOULDER_MIN_PESO: float = 0.52



const SHOULDER_R: float = 3.2



const SHOULDER_MIN_PACE: float = 0.35


const SHOULDER_LEAD_T: float = 0.28




const SHOULDER_SIDE_M: float = 0.35




















const SHOULDER_BEHIND_COS: float = -0.35













const SHOULDER_SWING_COS: float = -0.75

















const SHOULDER_EDGE_S: float = 0.3
















static func should_shoulder(dpos: Vector2, ppos: Vector2, pvel: Vector2,
		read: float, peso: float, ball_d: float = INF,
		ventaja: float = 0.0, swing: float = SHOULDER_SWING_COS) -> bool:
	if read < SHOULDER_MIN_READ or peso < SHOULDER_MIN_PESO:
		return false


	if ventaja >= SHOULDER_EDGE_S:
		return false
	if pvel.length() < SHOULDER_MIN_PACE:
		return false
	var d: float = dpos.distance_to(ppos)
	if d > SHOULDER_R or d < 0.0001:
		return false

	var atras: float =(dpos - ppos).normalized().dot(pvel.normalized())
	if d <= CARGA_R:


		if atras <= SHOULDER_BEHIND_COS:
			return false
	elif atras <= swing:


		return false

	return ball_d > d






static func shoulder_point(ppos: Vector2, pvel: Vector2, dpos: Vector2) -> Vector2:
	if pvel.length() < 0.0001:
		return ppos
	var fwd: Vector2 = pvel.normalized()
	var cita: Vector2 = ppos + fwd *(pvel.length() * SHOULDER_LEAD_T)
	var lado: Vector2 = Vector2(- fwd.y, fwd.x)
	var s: float = signf(lado.dot(dpos - ppos))
	if s == 0.0:
		s = 1.0

	return cita - lado *(s * SHOULDER_SIDE_M)
