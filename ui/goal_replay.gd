class_name GoalReplay
extends PostReplay






































const FIX_FOV: float = 70.0





































const CAM_X: float = 0.35
const CAM_Y: float = 6.7
const CAM_BACK: float = 14.5



const LOOK_Y: float = 1.2










const NET_FORCE: float = 1.0
const NET_DUR: float = 1.1

const GOAL_DUR: Array[float] = [1.75, 1.35]













const MAX_VUELO: float = 2.6








const JUGADA_S: float = 2.5


const JUGADA_MAX_S: float = 2.0

const JUGADA_MIN_S: float = 0.4



const JUGADA_QUIETO_M: float = 0.03

const JUGADA_COLA_S: float = 0.15




const JUGADA_CANO_MAX_S: float = 3.5




var _plano_listo: bool = false
var _fix_pos: Vector3 = Vector3.ZERO
var _fix_look: Vector3 = Vector3.ZERO

var _vista_limpia: bool = false





var _net_t: float = 0.0
var _net_done: bool = false
var _net_p: Vector3 = Vector3.ZERO



var net_toca: bool = false

















var _live_net_p: Vector3 = Vector3.INF




var _tubo_p: Vector3 = Vector3.INF
var _tubo_punch: float = 1.0
var _tubo_bar: bool = false
var _tubo_t: float = 0.0
var _tubo_done: bool = false




var _side: float = 1.0






func start_goal(clip: ReplayRec.Clip, world: Node3D, hide_while: Array,
		cruce: Vector3, stadium: Stadium, flight_s: float = 0.0,
		red_p: Vector3 = Vector3.INF, tubo_p: Vector3 = Vector3.INF,
		tubo_punch: float = 1.0, tubo_bar: bool = false,
		sub: String = "") -> bool:
	_dur = [GOAL_DUR[0], GOAL_DUR[1]]

	_sub_txt = sub
	_live_net_p = red_p
	_tubo_p = tubo_p
	_tubo_punch = clampf(tubo_punch, 0.3, 1.25)
	_tubo_bar = tubo_bar



	_side = - signf(cruce.x) if absf(cruce.x) > 0.5 else 1.0



	var vuelo: float = flight_s if flight_s > 0.05 else 1.0


	if not super.start(clip, world, hide_while, cruce, false, 1.0, stadium, vuelo):
		return false








	if _hit_t - _t0 > MAX_VUELO:
		_t0 = _hit_t - MAX_VUELO
		_rate = MAX_VUELO / _dur[PHASE_FLIGHT]
		if _salto_de >= 0.0:
			_salto_a = maxf(_salto_a, _t0)
		else:
			_t = _t0
		pose_ghosts(_t)



	if _tubo_p != Vector3.INF:
		_tubo_t = _time_of(_tubo_p)





		if _tubo_bar and stadium != null and is_instance_valid(stadium):
			stadium.bar_snow_restore(_tubo_p.x)
	_arma_jugada()
	_net_t = _tiempo_red()






	if stadium != null and is_instance_valid(stadium):
		stadium.net_impact(cruce, true, 1.0, 0.0, 0.02)



		stadium.confetti_cannons_replay_begin()







	return true








func _arma_jugada() -> void:
	if _salto_de >= 0.0:
		return
	if _t0 > maxf(_strike_t - PRE_ROLL, 0.0) + 0.01:
		return
	var ts: PackedFloat32Array = _clip.times
	var n: int = ts.size()
	if n < 3:
		return

	var k: int = 0
	while k + 1 < n and ts[k + 1] <= _t0:
		k += 1



	var fin_k: int = k
	while fin_k > 0 and _paso_balon(ts[fin_k - 1], ts[fin_k]) < JUGADA_QUIETO_M:
		fin_k -= 1
	var fin: float = ts[fin_k]


	var ini: float = maxf(ts[0], fin - JUGADA_S)
	var cano: bool = _clip.cano_t >= ts[0] and _clip.cano_t < fin
	if cano:
		ini = _clip.cano_t
	var j: int = 0
	while j + 1 < n and ts[j] < ini:
		j += 1


	while not cano and j + 1 <= fin_k and _paso_balon(ts[j], ts[j + 1]) < JUGADA_QUIETO_M:
		j += 1
	ini = ts[j]


	var tirador: int = int(_golpe_del_tirador()[0])
	if tirador > 0 and not cano:
		var plantado: Dictionary = _busca_desliz(tirador, ini, fin)
		if not plantado.is_empty():
			ini = float(plantado["tb"])
	if fin - ini < JUGADA_MIN_S:
		return
	_t = ini
	_salto_de = minf(fin + JUGADA_COLA_S, _t0) if fin_k < k else _t0
	_salto_a = _t0
	_rate_rec = maxf(1.0,(_salto_de - ini) /(JUGADA_CANO_MAX_S if cano else JUGADA_MAX_S))
	pose_ghosts(_t)



func _paso_balon(a: float, b: float) -> float:
	return (_clip.pose(0, b)["pos"] - _clip.pose(0, a)["pos"]).length()









func _key_t() -> float:
	var n: int = _clip.samples()
	var prev_t: float = 0.0
	var prev_z: float = INF
	for s in n:
		var t: float = _clip.length() * float(s) / maxf(float(n - 1), 1.0)
		var p: Vector3 = _clip.pose(0, t)["pos"]
		if p.z <= 0.0 and absf(p.x) <= GOAL_HALF_W + 0.6 and prev_z > 0.0 \
				and prev_z < INF:
			var dz: float = prev_z - p.z
			return prev_t if dz <= 0.0001 \
					else lerpf(prev_t, t, clampf(prev_z / dz, 0.0, 1.0))
		prev_t = t
		prev_z = p.z


	return super._key_t()












func _impact_fx() -> void:
	pass





















func _tiempo_red() -> float:
	if _live_net_p != Vector3.INF:
		net_toca = true
		return _instante_mas_cerca(_live_net_p)
	var n: int = _clip.samples()

	var paso: float = _clip.length() / maxf(float((n - 1) * 8), 1.0)
	var t: float = _hit_t
	while t <= _clip.length():
		var p: Vector3 = _clip.pose(0, t)["pos"]
		if p.z <= - NET_DEPTH + 0.22 or (p.z <= -0.15 and absf(p.x) >= 3.42):
			net_toca = true
			return t
		t += paso
	return -1.0





func _instante_mas_cerca(punto: Vector3) -> float:
	var n: int = _clip.samples()
	var paso: float = _clip.length() / maxf(float((n - 1) * 8), 1.0)
	var best_t: float = _hit_t
	var best_d: float = INF
	var t: float = _hit_t
	while t <= _clip.length():
		var d: float = _clip.pose(0, t)["pos"].distance_squared_to(punto)
		if d < best_d:
			best_d = d
			best_t = t
		t += paso
	return best_t












func _tick() -> void:











	if not _tubo_done and _tubo_p != Vector3.INF and _t >= _tubo_t:
		_tubo_done = true
		if _stadium != null and is_instance_valid(_stadium):
			_stadium.post_impact(_tubo_p, _tubo_punch, true, BUZZ_SLOWMO,
				1 if _tubo_bar else 0)
	if _net_done or not net_toca or _t < _net_t:
		return
	_net_done = true
	if _stadium == null or not is_instance_valid(_stadium):
		return





	_net_p = _live_net_p if _live_net_p != Vector3.INF \
			else _clip.pose(0, _net_t)["pos"]
	_stadium.net_impact(_net_p, true, BUZZ_SLOWMO, NET_FORCE, NET_DUR)
	_stadium.confetti_cannons_replay_goal()










	_stadium.net_spray(_net_p, NET_FORCE, true, BUZZ_SLOWMO)





func _squash_ball() -> void:
	pass





















func _place_cam(_push: float) -> void:
	if not is_instance_valid(_cam):
		return

	_cam.near = 0.05
	if not _plano_listo:
		_plano_listo = true
		_calcula_plano()


	_cam.fov = _lente(FIX_FOV)
	_cam.position = _fix_pos
	_cam.look_at(_fix_look)
	if not _vista_limpia:
		_vista_limpia = true
		_despeja_azotea()










func _despeja_azotea() -> void:
	if _stadium == null or not is_instance_valid(_stadium) or not _stadium.es_azotea():
		return
	var mira: PackedVector3Array = PackedVector3Array([
		Vector3(- GOAL_HALF_W, LOOK_Y, 0.0), Vector3(GOAL_HALF_W, LOOK_Y, 0.0), _fix_look,
		_clip.pose(0, _t0)["pos"]])
	_stadium.view_clip_now(_cam, mira)





func _calcula_plano() -> void:








	var origen: Vector3 = _clip.pose(0, _t0)["pos"]
	var eje: Vector3 = Vector3(origen.x, 0.0, origen.z)
	eje = eje.normalized() if eje.length() > 1.0 else Vector3(0.0, 0.0, 1.0)
	var lejos: float = Vector2(origen.x, origen.z).length()














	_fix_pos = Vector3(- eje.x * CAM_BACK + _side * CAM_X, CAM_Y, - eje.z * CAM_BACK)









	var mira_d: float = clampf(lejos * 0.35, 3.0, 12.0)

	if UiKit.es_horizontal() and not lente_retrato:
		mira_d = _mira_tumbada(lejos)



	_fix_look = Vector3(eje.x * mira_d, LOOK_Y, eje.z * mira_d)















const CABEZA_Y: float = 1.7


func _mira_tumbada(lejos: float) -> float:
	var a_raya: float = atan2(CAM_Y, CAM_BACK)
	var a_cabeza: float = atan2(CAM_Y - CABEZA_Y, CAM_BACK + lejos)
	var picado: float =(a_raya + a_cabeza) * 0.5
	return clampf((CAM_Y - LOOK_Y) / tan(picado) - CAM_BACK, 0.5, 12.0)









func _exit_tree() -> void:
	if _net_done and _stadium != null and is_instance_valid(_stadium):
		_stadium.net_impact(_net_p, false, 1.0, NET_FORCE * 0.5, 0.6)




	if not sin_reloj and _stadium != null and is_instance_valid(_stadium):
		_stadium.confetti_cannons_replay_goal()
	super._exit_tree()














var _sub_txt: String = ""






func _build_ui() -> void:
	super._build_ui()
	if is_instance_valid(_label_sub):
		_label_sub.text = I18n.t(_sub_txt if not _sub_txt.is_empty() else "GOL")
