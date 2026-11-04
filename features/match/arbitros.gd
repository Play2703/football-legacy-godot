class_name Arbitros
extends RefCounted




























const BAND_OUT: float = 0.9





const LINE_Z_MIN: float = 0.0






const ASSIST_SPEED: float = 5.4































const CORNER_NEAR_M: float = 6.5





const CORNER_UP: float = 12.0













const CENTER_BACK: float = 8.5












const CENTER_SIDE: float = 10.5











const LANE_M: float = 6.0



const EDGE_M: float = 3.0





const CENTER_Z_MIN: float = 2.0


const CENTER_SPEED: float = 3.6





const SIDE_SWAP_M: float = 6.0





const SLOW_M: float = 1.2


const SLOW_MIN: float = 0.28


const ARRIVE_M: float = 0.06
























static func linea_z(last_def_z: float, ball_z: float, depth: float) -> float:
	var z: float = ball_z if last_def_z == INF else minf(last_def_z, ball_z)
	return clampf(z, LINE_Z_MIN, depth * 0.5)



static func banda_x(side: float, half_w: float) -> float:
	return signf(side) *(half_w + BAND_OUT)



static func esquina(side: float, half_w: float) -> Vector2:
	return Vector2(signf(side) * half_w, 0.0)




static func en_mi_esquina(side: float, ball: Vector2, half_w: float) -> bool:
	return ball.distance_to(esquina(side, half_w)) <= CORNER_NEAR_M




static func sitio_asistente(side: float, ball: Vector2, last_def_z: float,
		half_w: float, depth: float) -> Vector2:
	var z: float = linea_z(last_def_z, ball.y, depth)




	if en_mi_esquina(side, ball, half_w):
		z = maxf(z, CORNER_UP)
	return Vector2(banda_x(side, half_w), z)





static func lado_central(ball_x: float, prev: float) -> float:
	if ball_x > SIDE_SWAP_M:
		return -1.0
	if ball_x < - SIDE_SWAP_M:
		return 1.0
	return signf(prev) if not is_zero_approx(prev) else -1.0





static func _pasillo(ball: Vector2) -> Array:
	var axis: Vector2 = ball
	if axis.length_squared() < 0.01:
		axis = Vector2(0.0, 1.0)
	axis = axis.normalized()
	return [axis, Vector2(- axis.y, axis.x)]



























static func sitio_central(ball: Vector2, side: float, half_w: float,
		depth: float) -> Vector2:
	var pas: Array = _pasillo(ball)
	var axis: Vector2 = pas[0]
	var n: Vector2 = pas[1]
	var lim_x: float = half_w - EDGE_M
	var lim_z: float = depth - EDGE_M
	var pref: float = _signo_n(n, side)
	var primero: Vector2 = Vector2.ZERO
	for i in 2:
		var lat: Vector2 = n *(CENTER_SIDE *(pref if i == 0 else - pref))
		var t: float = CENTER_BACK



		if ball.y + axis.y * t + lat.y < CENTER_Z_MIN and axis.y > 0.02:
			t =(CENTER_Z_MIN - ball.y - lat.y) / axis.y
		var p: Vector2 = ball + axis * t + lat
		if i == 0:
			primero = p





		if absf(p.x) <= lim_x and p.y >= CENTER_Z_MIN - 0.01 and p.y <= lim_z:
			return p
	return _dentro_del_campo(primero, n, lim_x, lim_z)






static func _signo_n(n: Vector2, side: float) -> float:
	var nx: float = signf(n.x)
	if is_zero_approx(nx):
		return 1.0
	return nx * signf(side)







static func _dentro_del_campo(p: Vector2, n: Vector2, lim_x: float,
		lim_z: float) -> Vector2:
	var out: Vector2 = Vector2(clampf(p.x, - lim_x, lim_x),
		clampf(p.y, CENTER_Z_MIN, lim_z))
	if absf(out.dot(n)) >= LANE_M or absf(n.y) < 0.02:
		return out
	var mejor: float = INF
	for objetivo in [LANE_M, - LANE_M]:
		var z: float =(objetivo - out.x * n.x) / n.y
		if z >= CENTER_Z_MIN and z <= lim_z \
				and (mejor == INF or absf(z - out.y) < absf(mejor - out.y)):
			mejor = z
	if mejor != INF:
		out.y = mejor
	return out





static func dist_pasillo(p: Vector2, ball: Vector2) -> float:
	return absf(p.dot(_pasillo(ball)[1]))


































const FOCO_TAU: float = 0.55




const FOCO_SNAP_M: float = 25.0









static func foco(prev: Vector2, ball: Vector2, delta: float) -> Vector2:
	if prev == Vector2.INF or prev.distance_to(ball) >= FOCO_SNAP_M:
		return ball
	if delta <= 0.0:
		return prev
	return prev.lerp(ball, 1.0 - exp(- delta / FOCO_TAU))












const ACCEL: float = 4.5

const DECEL: float = 8.0









static func paso_acel(from: Vector2, to: Vector2, vel: float, speed: float,
		delta: float) -> Array:
	var d: Vector2 = to - from
	var dist: float = d.length()
	if dist <= ARRIVE_M:
		return [to, 0.0]
	if delta <= 0.0:
		return [from, vel]
	var quiere: float = speed * clampf(dist / SLOW_M, SLOW_MIN, 1.0)
	var v: float = vel
	if quiere > v:
		v = minf(quiere, v + ACCEL * delta)
	else:
		v = maxf(quiere, v - DECEL * delta)
	var adv: float = minf(dist, v * delta)
	return [from + d / dist * adv, v]



















const HIT_R: float = 0.52

const HIT_H: float = 1.95





const KNOCK_SPEED: float = 18.0



const REACT_S: float = 0.22



const DODGE_M: float = 2.6
const DODGE_SPEED: float = 6.5



const DODGE_HORIZON_S: float = 1.6





static func dist_tramo(p: Vector2, a: Vector2, b: Vector2) -> float:
	var ab: Vector2 = b - a
	var len2: float = ab.length_squared()
	if len2 <= 0.0001:
		return p.distance_to(a)
	var t: float = clampf((p - a).dot(ab) / len2, 0.0, 1.0)
	return p.distance_to(a + ab * t)








static func atropella(p: Vector2, a: Vector3, b: Vector3) -> bool:
	if minf(a.y, b.y) > HIT_H:
		return false
	return dist_tramo(p, Vector2(a.x, a.z), Vector2(b.x, b.z)) <= HIT_R









static func sitio_esquiva(p: Vector2, a: Vector2, b: Vector2) -> Vector2:
	var dir: Vector2 = b - a
	if dir.length_squared() < 0.0001:
		return p
	dir = dir.normalized()
	var n: Vector2 = Vector2(- dir.y, dir.x)


	var rel: Vector2 = p - a
	var lado: float = rel.dot(n)
	if is_zero_approx(lado):
		lado = 1.0
	return p + n * signf(lado) * DODGE_M
































const PERFIL_SPAN: float = 0.8


const ESTILO_HI: float = 0.68





const FACTOR_MIN: float = 0.6
const FACTOR_MAX: float = 1.4






static func perfil(semilla: int) -> Dictionary:
	var h: int = hash(semilla)
	var s1: float = float(h&1023) / 1023.0
	var s2: float = float((h>>10)&1023) / 1023.0
	var severidad: float = clampf(0.5 +(s1 - 0.5) * PERFIL_SPAN, 0.0, 1.0)
	var ventaja: float = clampf(0.5 +(s2 - 0.5) * PERFIL_SPAN, 0.0, 1.0)
	return {
		"severidad": severidad,
		"ventaja": ventaja,
		"estilo": estilo_name(severidad, ventaja),
	}





static func estilo_name(severidad: float, ventaja: float) -> String:
	var ds: float = severidad - 0.5
	var dv: float = ventaja - 0.5
	if maxf(absf(ds), absf(dv)) < ESTILO_HI - 0.5:
		return "Equilibrado"
	if absf(ds) >= absf(dv):
		return "Tarjetero" if ds > 0.0 else "Permisivo"
	return "Deja seguir" if dv > 0.0 else "Pita todo"





static func factor_tarjeta(p: Dictionary) -> float:
	return lerpf(FACTOR_MIN, FACTOR_MAX,
		clampf(float(p.get("severidad", 0.5)), 0.0, 1.0))
