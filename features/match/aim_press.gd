class_name AimPress
extends RefCounted























































































const MIN_D0: float = 4.6














const FLOOR_EPS: float = 0.05















static func can_press(dist_to_ball: float) -> bool:
	return dist_to_ball >= MIN_D0 - FLOOR_EPS








static func floor_al(a: float, l: float, min_d: float = MIN_D0) -> float:
	if absf(l) >= min_d:
		return a
	var want: float = sqrt(min_d * min_d - l * l)


	return maxf(a, want)














const W_MID: float = 0.45
const W_TOP: float = 0.75



static func tier_count(w: float) -> int:
	if w < W_MID:
		return 1
	if w < W_TOP:
		return 2
	return 3






const W_REF: float = 0.52





const W_DIV: float = 0.08

















const W_DERBY: float = 0.12










const W_AWAY: float = 0.06












const W_CALOR: float = 0.06




static func calor_term(calor: float) -> float:
	return - clampf(calor, -1.0, 1.0) * W_CALOR






static func weight_for(w: float, div: int, derby: bool = false,
		away: bool = false) -> float:
	return clampf(w - W_DIV * float(maxi(div, 1) - 1)
		+(W_DERBY if derby else 0.0) +(W_AWAY if away else 0.0), 0.0, 1.0)























const PACE_W: float = 0.22
static func pace_term(w: float) -> float:
	return PACE_W *(w - W_REF)














const MOTION_GATE: float = 0.6





const MOTION_CAP: float = 0.72




















const MOTION_W: float = 0.1









const MOTION_FLOOR: float = 1.0
static func motion_scale(chance: float, w: float, set_piece: bool = false) -> float:
	if set_piece or chance <= 0.0 or chance > MOTION_GATE:
		return chance
	var k: float = maxf(1.0 + MOTION_W *(w - W_REF) /(1.0 - W_REF), MOTION_FLOOR)
	return minf(chance * k, MOTION_CAP)


























































const OPEN_KINDS: Array[String] = ["solo", "frontal", "lejano", "angulo",
	"rebote", "contra", "volea", "centro"]
const SET_KINDS: Array[String] = ["libre", "corner", "penal", "banda", "indirecta"]


static func allowed_kind(kind: String) -> bool:
	return OPEN_KINDS.has(kind)











static func steal_allowed(kind: String, moving: bool, header: bool) -> bool:
	if moving or header:
		return false
	return allowed_kind(kind)

































const REACT_SLOW: float = 0.34
const REACT_FAST: float = 0.1

























const REACT_Q_W: float = 0.72




const REACT_W_SPAN: float = 0.5







static func react_delay(w: float, q: float) -> float:
	var lvl: float = clampf(0.5 +(w - W_REF) /(2.0 * REACT_W_SPAN), 0.0, 1.0)
	var mix: float = clampf(REACT_Q_W * clampf(q, 0.0, 1.0)
		+(1.0 - REACT_Q_W) * lvl, 0.0, 1.0)
	return lerpf(REACT_SLOW, REACT_FAST, mix)


















































































const SLOW_REF: float = 0.38



const SLOW_W: float = 0.3
const SLOW_MIN: float = 0.24


const SLOW_MAX: float = 0.5














const SLOW_DIV: float = 0.05





static func slow_scale(w: float, div: int = 1) -> float:
	return clampf(SLOW_REF + SLOW_W *(w - W_REF)
		- SLOW_DIV * float(maxi(div, 1) - 1), SLOW_MIN, SLOW_MAX)









const SPEED_FALLBACK: float = 2.45



























const COVER_SPEED: float = 1.35

const COVER_REACH: float = 7.0

const COVER_KEEP: float = 3.0























const COVER_MOUTH: float = 3.34




static func cover_share(i: int, n: int) -> float:
	if n <= 1:
		return 0.0
	return -1.0 + 2.0 * float(i) / float(n - 1)





static func cover_point(d: Vector2, ball: Vector2, share: float = 0.0) -> Vector2:

	var lane: Vector2 = Vector2(clampf(share, -1.0, 1.0) * COVER_MOUTH, 0.0) - ball
	var largo: float = lane.length()
	if largo < 1.0:
		return d
	var u: Vector2 = lane / largo

	var t: float =(d - ball).dot(u)
	if t <= 0.0:
		return d

	var sobre: Vector2 = ball + u * minf(t, maxf(largo - COVER_KEEP, 0.0))
	if d.distance_to(sobre) > COVER_REACH:
		return d
	return sobre
