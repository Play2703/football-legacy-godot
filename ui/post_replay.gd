class_name PostReplay
extends ReplayView





































const PHASE_FLIGHT: int = 0
const PHASE_BUZZ: int = 1








const DUR: Array[float] = [2.2, 2.9]




var _dur: Array[float] = [DUR[0], DUR[1]]


const PRE_ROLL: float = 0.3

const POST_FOV: float = 58.0
















const BAR_FOV: float = 44.0




















const REVEAL_FOV: float = 84.0




















const RING_HASTA: float = 0.3








const WIDE_FOV: float = 72.0


const BANDAS_H: Vector2 = Vector2(136.0, 100.0)





const BUZZ_SLOWMO: float = 0.32








const IMPACT_WINDOW: float = 0.17
const IMPACT_SLOWMO: float = 0.2


const COLA_SUELO: float = 0.15






const SQUASH_T: float = 0.06



const GOAL_HALF_W: float = 3.66
const CROSSBAR_H: float = 2.44






const NET_DEPTH: float = 2.1


















var _contact: Vector3 = Vector3.ZERO


var _bar_hit: bool = false


var _strength: float = 1.0


var _post_x: float = 0.0



var _hit_t: float = 0.0
var _phase: int = PHASE_FLIGHT
var _phase_t: float = 0.0




var _last_ms: int = 0


var _rate: float = 1.0



const AUDIO_PISO: float = 0.34


var _buzzed: bool = false


var _strike_t: float = 0.0


var _t0: float = 0.0














var _salto_de: float = -1.0
var _salto_a: float = 0.0
var _rate_rec: float = 1.0











var _barrido_u: float = -1.0
var _barrido_d: float = 0.0
var _barrido_p0: float = 0.0
var _barrido_p1: float = 0.0
var _barrido_v0: float = 1.0
var _barrido_v1: float = 1.0


const BARRIDO_MIN_S: float = 0.25
const BARRIDO_MAX_S: float = 0.4


const RECEPCION_BUSCA_S: float = 4.0


const RECEPCION_COLA_S: float = 0.15

const RECEPCION_PREVIO_S: float = 0.2



const RECEPCION_MAX_S: float = 1.2






var _desliz: Dictionary = {}


const DESLIZ_MIN_M: float = 0.4


const DESLIZ_PREVIO_S: float = 0.2


var _ball_now: Vector3 = Vector3.ZERO
var _shot_from: Vector3 = Vector3.ZERO
var _tapar: Array = []

var _label_main: Label
var _label_sub: Label
var _dot: ColorRect






func start(clip: ReplayRec.Clip, world: Node3D, hide_while: Array,
		contact: Vector3, is_bar: bool, strength: float, stadium: Stadium,
		flight_s: float = 0.0) -> bool:
	_bar_hit = is_bar
	_strength = clampf(strength, 0.3, 1.25)
	_contact = contact



	_post_x =(signf(contact.x) * GOAL_HALF_W) if not is_bar else contact.x


	open(clip, world, hide_while, stadium)
	if _clip == null:
		return false


	_reposo_giro.clear()
	_rumbo_prev.clear()
	_giro_paso.clear()
	_flip_prev.clear()
	_tapar = hide_while
	_last_ms = Time.get_ticks_msec()






	_hit_t = _key_t()
	_strike_t = maxf(_hit_t - maxf(flight_s, 0.0), 0.0)
	_t = maxf(_strike_t - PRE_ROLL, 0.0)
	_t0 = _t
	_shot_from = _clip.pose(0, _strike_t)["pos"]
	_rate = maxf(_hit_t - _t, 0.05) / _dur[PHASE_FLIGHT]






	_tiempos_listos = true
	_golpe = [-1, 0.0, &""]
	_arma_recepcion()




	if _stadium != null and is_instance_valid(_stadium):
		if _bar_hit:
			_stadium.bar_snow_restore(_contact.x)



		_stadium.weather_under_pause(true, BUZZ_SLOWMO)
	pose_ghosts(_t)
	_place_cam(0.0)





	_rumbo_prev.clear()
	return true







func _key_t() -> float:
	return _time_of(_contact)





func _time_of(punto: Vector3) -> float:
	var best_t: float = 0.0
	var best_d: float = INF
	var n: int = _clip.samples()
	for s in n:
		var t: float = _clip.length() * float(s) / maxf(float(n - 1), 1.0)
		var d: float = _clip.pose(0, t)["pos"].distance_squared_to(punto)
		if d < best_d:
			best_d = d
			best_t = t
	return best_t




func _process(_delta: float) -> void:
	if _clip == null or sin_reloj:
		return
	var now: int = Time.get_ticks_msec()
	var delta: float = clampf(float(now - _last_ms) / 1000.0, 0.0, 0.05)
	_last_ms = now
	if not avanza(delta):
		close()








var sin_reloj: bool = false




func avanza(delta: float) -> bool:
	_keep_camera()
	_keep_hidden()
	_phase_t += delta
	var compas: float = _rate * _ritmo()







	if _salto_de >= 0.0 and _t < _salto_de:
		compas = _rate_rec


	var compas_audio: float = compas













	if _barrido_u >= 0.0:


		_barrido_u = minf(_barrido_u + delta / _barrido_d, 1.0)
		_t = _barrido_en(_barrido_u)
		compas_audio = lerpf(_barrido_v0, _barrido_v1, _barrido_u)
		if _barrido_u >= 1.0:
			_barrido_u = -1.0
	else:
		if _phase == PHASE_BUZZ:
			var queda_s: float = maxf(_dur[PHASE_BUZZ] - _phase_t + delta, delta)
			compas = minf(compas, maxf((_clip.length() - _t) / queda_s, COLA_SUELO * _rate))
		_t = minf(_t + delta * compas, _clip.length())
		if _salto_de >= 0.0 and _t >= _salto_de:
			_arma_barrido(compas)








	if not sin_reloj:
		AudioServer.playback_speed_scale = clampf(compas_audio, AUDIO_PISO, 1.0)




	if _stadium != null and is_instance_valid(_stadium):
		_stadium.tick_crowd_manual(delta)
	if not _buzzed and _t >= _hit_t:
		_buzzed = true
		_impact_fx()
		_phase = PHASE_BUZZ
		_phase_t = 0.0
	_ball_now = pose_ghosts(_t)
	_squash_ball()
	_tick()
	var push: float = clampf(_phase_t / _dur[PHASE_BUZZ], 0.0, 1.0) \
			if _phase == PHASE_BUZZ else 0.0
	_place_cam(push)
	return not (_phase == PHASE_BUZZ and _phase_t >= _dur[PHASE_BUZZ])








func _arma_barrido(v0: float) -> void:
	_salto_de = -1.0
	var tramo: float = _salto_a - _t
	if tramo <= 0.001:
		return
	_barrido_p0 = _t
	_barrido_p1 = _salto_a
	_barrido_v0 = maxf(v0, 0.0)
	_barrido_v1 = _rate * _ritmo_en(_salto_a)
	var natural: float = tramo / maxf(0.5 *(_barrido_v0 + _barrido_v1), 0.05)
	_barrido_d = minf(minf(natural, maxf(natural / 3.0, BARRIDO_MIN_S)), BARRIDO_MAX_S)
	_barrido_u = 0.0




	var tirador: int = int(_golpe_del_tirador()[0])
	if tirador > 0 and _desliz.is_empty():
		var plantado: Dictionary = _busca_desliz(tirador, _barrido_p0, _barrido_p1)
		if not plantado.is_empty():
			plantado["ta0"] = _barrido_p0
			_desliz = plantado




func _barrido_en(u: float) -> float:
	var u2: float = u * u
	var u3: float = u2 * u
	return (2.0 * u3 - 3.0 * u2 + 1.0) * _barrido_p0 \
			+(u3 - 2.0 * u2 + u) * _barrido_d * _barrido_v0 \
			+(-2.0 * u3 + 3.0 * u2) * _barrido_p1 \
			+(u3 - u2) * _barrido_d * _barrido_v1






func close() -> void:
	AudioServer.playback_speed_scale = 1.0
	super()


func _exit_tree() -> void:
	AudioServer.playback_speed_scale = 1.0


	super()






func _tick() -> void:
	pass







func _impact_fx() -> void:
	if _stadium == null or not is_instance_valid(_stadium):
		return
	_stadium.post_impact(_contact, _strength, true, BUZZ_SLOWMO, 1 if _bar_hit else 0)



	_stadium.crowd_react("home", "post")



































func _place_cam(push: float) -> void:
	if not is_instance_valid(_cam):
		return


	_cam.near = 0.05
	var side: float = signf(_post_x) if absf(_post_x) > 0.1 else 1.0


	var eje: Vector3 = Vector3(_shot_from.x, 0.0, _shot_from.z)
	eje = eje.normalized() if eje.length() > 1.0 else Vector3(0.0, 0.0, 1.0)
	var look_a: Vector3 = Vector3(eje.x * 7.5, 1.2, eje.z * 7.5)
	var pos_a: Vector3 = Vector3(- eje.x * 5.4 + side * 1.3, 4.8, - eje.z * 5.4 - 0.8)





	var abre: float = smoothstep(RING_HASTA, 1.0, push)
	var look_b: Vector3
	var pos_b: Vector3
	if _bar_hit:
























		look_b = Vector3(_contact.x + side * 0.2, CROSSBAR_H - 0.06, 0.25)
		pos_b = Vector3(_contact.x + side * 2.6, 1.45, -1.3)
	else:











		look_b = Vector3(_post_x - side * 0.3, 1.1, 0.75)
		pos_b = Vector3(_post_x + side * 1.65, 1.3, -1.55)


	pos_b.z = clampf(pos_b.z, -(NET_DEPTH - 0.2), -0.45)









	if abre > 0.0 and _ball_now != Vector3.ZERO:
		look_b = look_b.lerp(
			Vector3(_ball_now.x, maxf(_ball_now.y, 0.5), _ball_now.z), abre)

	var f: float = _viaje()
	var pos: Vector3 = pos_a.lerp(pos_b, f)
	pos.y = maxf(pos.y, CAM_MIN_Y)






	var cerca_fov: float = BAR_FOV if _bar_hit else POST_FOV
	_cam.fov = lerpf(WIDE_FOV, lerpf(cerca_fov, REVEAL_FOV, abre), f)
	_cam.position = pos
	_cam.look_at(look_a.lerp(look_b, f))









func _viaje() -> float:
	if _phase == PHASE_BUZZ:
		return 1.0
	return smoothstep(0.0, 1.0,
		clampf((_t - _t0) / maxf(_hit_t - _t0, 0.001), 0.0, 1.0))






func _ritmo() -> float:
	return _ritmo_en(_t)



func _ritmo_en(t: float) -> float:
	var d: float = absf(_hit_t - t)
	if d >= IMPACT_WINDOW:
		return 1.0
	return lerpf(IMPACT_SLOWMO, 1.0, smoothstep(0.0, 1.0, d / IMPACT_WINDOW))












func _squash_ball() -> void:
	if _ghosts.is_empty() or not is_instance_valid(_ghosts[0]):
		return
	var g: AnimatedSprite3D = _ghosts[0]
	var dt: float = _t - _hit_t
	if dt < 0.0 or dt > SQUASH_T:
		g.scale = Vector3.ONE
		return



	var k: float = 1.0 - smoothstep(0.0, 1.0, dt / SQUASH_T)
	g.scale = Vector3(1.0 + 0.25 * k, 1.0 - 0.25 * k, 1.0 + 0.25 * k)























const MIRROR: Dictionary = {
	&"idle": &"idle_back", &"idle_back": &"idle",
	&"idle_east": &"idle_west", &"idle_west": &"idle_east",




	&"dive": &"dive_north", &"dive_high": &"dive_high_north",




	&"jump": &"jump_north", &"jump_catch": &"jump_catch_north",
	&"catch": &"catch_north",

	&"saque_mano": &"saque_mano_north",

	&"pie_lateral": &"pie_lateral_north", &"pie_raso": &"pie_raso_north",

	&"blocaje_lado": &"blocaje_lado_north", &"blocaje_bruces": &"blocaje_bruces_north",

	&"parada_mano": &"parada_mano_north", &"parada_plancha": &"parada_plancha_north",
	&"parada_caida": &"parada_caida_north", &"parada_colapso": &"parada_colapso_north",
}





























const DIR_DT: float = 0.08



const DIR_MIN_M: float = 0.05






















const DIR_MOV_CLARO: float = 0.2


const DIR_DEPTH_BIAS: float = 0.8

const IDLE_POR_RUMBO: Dictionary = {
	"north": &"idle_back", "south": &"idle",
	"east": &"idle_east", "west": &"idle_west",
}







const RUMBO_DE_IDLE: Dictionary = {
	&"idle": "south", &"idle_back": "north",
	&"idle_east": "east", &"idle_west": "west",
}
const RUMBOS: Array[String] = ["north", "south", "east", "west"]















































const GIRO_CONFIRMA_S: float = 0.3




var _reposo_giro: Dictionary = {}


var _rumbo_prev: Dictionary = {}













var _giro_paso: Dictionary = {}


var _flip_prev: Dictionary = {}
const GIRO_PASO_S: float = 0.12









var _golpe: Array = [-1, 0.0, &""]


var _tiempos_listos: bool = false


var _golpe_tramo: Array = [0.0, 0.0]


var _golpe_hasta: float = 0.0


var _golpe_dir: Vector2 = Vector2.ZERO





const GOLPE_BUSCA_DESPUES: float = 0.2
const GOLPE_BUSCA_ANTES: float = 0.6




const GOLPE_CERCA_M: float = 1.6








func _rumbo_de(i: int, t: float, minimo: float = DIR_MIN_M) -> String:
	if not is_instance_valid(_cam) or _clip == null:
		return ""
	var a: Vector3 = _clip.pose(i, maxf(t - DIR_DT, 0.0))["pos"]
	var b: Vector3 = _clip.pose(i, minf(t + DIR_DT, _clip.length()))["pos"]
	var d: Vector2 = Vector2(b.x - a.x, b.z - a.z)
	if d.length() < minimo:
		return ""
	return _rumbo_hacia(d.normalized())






func _rumbo_hacia(d: Vector2) -> String:
	if not is_instance_valid(_cam):
		return ""



	var bas: Basis = _cam.global_transform.basis
	var into: Vector2 = Vector2(- bas.z.x, - bas.z.z)
	var right: Vector2 = Vector2(bas.x.x, bas.x.z)
	if into.length() < 0.001 or right.length() < 0.001:
		return ""
	var depth: float = d.dot(into.normalized())
	var lateral: float = d.dot(right.normalized())
	if absf(depth) * DIR_DEPTH_BIAS >= absf(lateral):

		return "north" if depth > 0.0 else "south"
	return "east" if lateral > 0.0 else "west"


















































func _rumbo_grabado(anim: StringName, t: float) -> String:
	if _clip == null or not _clip.has_cam() or not is_instance_valid(_cam):
		return ""
	var n: String = String(anim)


	var par: String = String(RUMBO_DE_IDLE.get(anim, ""))
	if par == "":
		for r in RUMBOS:
			if n.ends_with("_" + r):
				par = r
				break
	if par == "":
		return ""


	var bas: Basis = Basis(_clip.cam_pose(t)["quat"] as Quaternion)
	var into: Vector2 = Vector2(- bas.z.x, - bas.z.z)
	var right: Vector2 = Vector2(bas.x.x, bas.x.z)
	if into.length() < 0.001 or right.length() < 0.001:
		return ""
	into = into.normalized()
	right = right.normalized()


	var d: Vector2 = into
	if par == "south":
		d = - into
	elif par == "east":
		d = right
	elif par == "west":
		d = - right
	return _rumbo_hacia(d)





func _opuesto(a: String, b: String) -> bool:
	if a.is_empty() or b.is_empty():
		return false
	return (a == "north" and b == "south") or (a == "south" and b == "north") \
			or (a == "east" and b == "west") or (a == "west" and b == "east")







const FAMILIAS_MOVER: Array[String] = ["run_", "walk_", "dribble_"]

























func _es_gesto(anim: StringName) -> bool:
	var n: String = String(anim)
	if n.begins_with("idle"):
		return false
	for fam in FAMILIAS_MOVER:
		if n.contains(fam):
			return false
	return true




func _anim_hacia(anim: StringName, rumbo: String) -> StringName:
	var n: String = String(anim)


	if n.begins_with("idle"):
		return IDLE_POR_RUMBO.get(rumbo, &"")
	for par in RUMBOS:
		if n.ends_with("_" + par):
			return StringName(n.substr(0, n.length() - par.length()) + rumbo)
	return &""






func _rumbo_para(i: int, anim: StringName, t: float) -> String:





	var rumbo: String = ""







	if _golpe_dir != Vector2.ZERO and i == int(_golpe[0]) \
			and _en_golpe(t) and _es_gesto(anim):
		rumbo = _rumbo_hacia(_golpe_dir)
		if rumbo != "":
			return rumbo
	if _es_gesto(anim):
		rumbo = _rumbo_grabado(anim, t)


















	var grabado: String = ""
	if rumbo == "":
		grabado = _rumbo_grabado(anim, t)





		if grabado != "" and RUMBO_DE_IDLE.has(anim):
			var arranca: String = _rumbo_tras_reposo(i, t)
			if arranca != "" and _opuesto(grabado, arranca):
				grabado = arranca
	if rumbo == "":

		rumbo = _rumbo_de(i, t, DIR_MOV_CLARO if grabado != "" else DIR_MIN_M)










		if grabado != "" and _opuesto(rumbo, grabado):
			rumbo = grabado




	if rumbo == "":
		rumbo = grabado
	return rumbo














func _rumbo_tras_reposo(i: int, t: float) -> String:
	if _clip == null:
		return ""
	if not _reposo_giro.has(i):
		_reposo_giro[i] = _tabla_reposo(i)
	for tr in _reposo_giro[i]:
		if t < float(tr["desde"]) or t > float(tr["hasta"]):
			continue
		var arr: float = float(tr["arranque"])
		if arr < 0.0:
			return ""














		var bas: Basis = _cam.global_transform.basis if is_instance_valid(_cam) else Basis()
		if tr.has("sello") and tr["sello"] == bas:
			return String(tr["cara"])
		var cara: String = _rumbo_para(i, _clip.pose(i, arr)["anim"], arr)
		tr["sello"] = bas
		tr["cara"] = cara
		return cara
	return ""
































func _tabla_reposo(i: int) -> Array:
	var out: Array = []
	var n: int = _clip.times.size()
	var ini: float = -1.0
	var previa: StringName = &""
	for k in range(n):
		var u: float = _clip.times[k]
		var a: StringName = _clip.pose(i, u)["anim"]
		if RUMBO_DE_IDLE.has(a):
			if ini < 0.0:
				ini = u
			continue
		if ini >= 0.0:




			var tras_gesto: bool = previa != &"" and _es_gesto(previa)
			var anticipa: bool = ini < _hit_t and not tras_gesto
			out.append({"desde": ini, "hasta": u, "arranque": u if anticipa else -1.0})
			ini = -1.0
		previa = a


	if ini >= 0.0:
		out.append({"desde": ini, "hasta": _clip.length(), "arranque": -1.0})
	return out














func _golpe_del_tirador() -> Array:
	if not _tiempos_listos or _clip == null:
		return [0, 0.0, &""]
	if int(_golpe[0]) != -1:
		return _golpe
	_golpe = [0, 0.0, &""]
	_golpe_tramo = [0.0, 0.0]
	_golpe_hasta = 0.0
	_golpe_dir = Vector2.ZERO
	var paso: float = 1.0 / ReplayRec.HZ
	var m: int = 0
	while float(m) * paso <= GOLPE_BUSCA_ANTES:
		var d: float = float(m) * paso


		for t in ([_strike_t] if m == 0 else [_strike_t + d, _strike_t - d]):
			if t < 0.0 or t > _clip.length() or t - _strike_t > GOLPE_BUSCA_DESPUES:
				continue
			var hallado: Array = _gesto_de_golpe_en(t)
			if hallado.is_empty():
				continue
			if int(hallado[0]) == 0:
				return _golpe
			_golpe = [int(hallado[0]), t, hallado[1]]
			_golpe_tramo = _tramo_del_gesto(int(hallado[0]), t)
			_golpe_hasta = _clip.length()
			for u in _clip.times:
				if u > float(_golpe_tramo[1]):
					_golpe_hasta = u
					break
			_golpe_dir = _dir_del_golpe(int(hallado[0]), hallado[1])
			return _golpe
		m += 1
	return _golpe








func _en_golpe(t: float) -> bool:
	return t >= float(_golpe_tramo[0]) and t < _golpe_hasta





const GOLPEOS_PIE: Array[String] = ["kick_", "empeine_", "volea_", "despeje_", "bloqueo_"]


static func _es_golpeo_pie(anim: String) -> bool:
	for pre: String in GOLPEOS_PIE:
		if anim.begins_with(pre):
			return true
	return false




func _gesto_de_golpe_en(t: float) -> Array:
	var hallado: Array = []
	for i in range(1, _ghosts.size()):
		var a: StringName = _clip.pose(i, t)["anim"]
		var n: String = String(a)
		if n.begins_with("chilena_"):
			return [0, &""]


		if hallado.is_empty() and (_es_golpeo_pie(n) or n.begins_with("header_")
				or n.begins_with("palomita_")):
			hallado = [i, a]
	return hallado






func _tramo_del_gesto(i: int, t: float) -> Array:
	var ts: PackedFloat32Array = _clip.times
	var n: String = String(_clip.pose(i, t)["anim"])
	var fam: String = n.substr(0, n.find("_") + 1)

	var k0: int = 0
	while k0 + 1 < ts.size() and ts[k0 + 1] <= t:
		k0 += 1
	var ki: int = k0
	while ki > 0 and ts[ki - 1] >= t - 1.5 \
			and String(_clip.pose(i, ts[ki - 1])["anim"]).begins_with(fam):
		ki -= 1
	var kf: int = k0
	while kf + 1 < ts.size() and ts[kf + 1] <= t + 1.5 \
			and String(_clip.pose(i, ts[kf + 1])["anim"]).begins_with(fam):
		kf += 1
	return [ts[ki], ts[kf]]
























func _dir_del_golpe(i: int, anim: StringName) -> Vector2:
	var n: String = String(anim)
	if not (_es_golpeo_pie(n) or n.begins_with("header_")):
		return Vector2.ZERO
	var desde: float = minf(_strike_t + 0.12, _hit_t - 0.05)
	if desde <= 0.0 or _hit_t - desde < 0.05:
		return Vector2.ZERO
	var a: Vector3 = _clip.pose(0, desde)["pos"]
	var b: Vector3 = _clip.pose(0, _hit_t)["pos"]
	var dir: Vector2 = Vector2(b.x - a.x, b.z - a.z)
	if dir.length() < 0.5:
		return Vector2.ZERO


	var hasta: float = maxf(float(_golpe_tramo[1]), desde)
	var cerca: float = INF
	for u in _clip.times:
		if u < float(_golpe_tramo[0]) or u > hasta:
			continue
		var bu: Vector3 = _clip.pose(0, u)["pos"]
		var cu: Vector3 = _clip.pose(i, u)["pos"]
		cerca = minf(cerca, Vector2(bu.x - cu.x, bu.z - cu.z).length())
	return dir.normalized() if cerca <= GOLPE_CERCA_M else Vector2.ZERO




func _es_recepcion(anim: StringName) -> bool:
	var n: String = String(anim)
	return (n.begins_with("chest_") and not n.begins_with("chest_catch")) \
			or n.begins_with("control_")






func _arma_recepcion() -> void:
	_salto_de = -1.0
	_barrido_u = -1.0
	_desliz = {}
	var gp: Array = _golpe_del_tirador()
	var i: int = int(gp[0])
	if i <= 0:
		return
	var ini_golpe: float = float(_golpe_tramo[0])
	var ts: PackedFloat32Array = _clip.times


	var k_fin: int = -1
	for k in range(ts.size() - 1, -1, -1):
		if ts[k] >= ini_golpe:
			continue
		if ts[k] < ini_golpe - RECEPCION_BUSCA_S:
			break
		if _es_recepcion(_clip.pose(i, ts[k])["anim"]):
			k_fin = k
			break
	if k_fin < 0:
		_desliz = _busca_desliz(i, _t0, ini_golpe + 0.1)
		return
	var k_ini: int = k_fin
	while k_ini > 0 and _es_recepcion(_clip.pose(i, ts[k_ini - 1])["anim"]):
		k_ini -= 1
	var rec_ini: float = ts[k_ini]
	if rec_ini >= _t0:

		_desliz = _busca_desliz(i, _t0, ini_golpe + 0.1)
		return




	var fmax: int = -1
	for k in range(k_ini, k_fin + 1):
		fmax = maxi(fmax, int(_clip.pose(i, ts[k])["frame"]))
	var k_tope: int = k_fin
	for k in range(k_ini, k_fin + 1):
		if int(_clip.pose(i, ts[k])["frame"]) >= fmax:
			k_tope = k
			break
	var rec_fin: float = ts[k_tope] + RECEPCION_COLA_S



	var arranque: float = minf(_t0, ini_golpe - PRE_ROLL)




	arranque = maxf(arranque, ts[k_fin + 1])




	var plantado: Dictionary = _busca_desliz(i, rec_fin, ini_golpe + 0.1)
	if not plantado.is_empty():
		if float(plantado["tb"]) <= ini_golpe - 0.05:
			arranque = maxf(arranque, float(plantado["tb"]))
		else:
			_desliz = plantado
	_t0 = arranque
	_rate = maxf(_hit_t - _t0, 0.05) / _dur[PHASE_FLIGHT]
	_t = maxf(rec_ini - RECEPCION_PREVIO_S, 0.0)


	_salto_de = minf(rec_fin, _t0)
	_salto_a = _t0

	_rate_rec = maxf(_rate,(_salto_de - _t) / RECEPCION_MAX_S)





func _busca_desliz(i: int, desde: float, hasta: float) -> Dictionary:
	var ts: PackedFloat32Array = _clip.times
	for k in range(ts.size() - 1):
		if ts[k] < desde:
			continue
		if ts[k] > hasta:
			break
		var a: Dictionary = _clip.pose(i, ts[k])
		var pa: Vector3 = a["pos"]
		var pb: Vector3 = _clip.pose(i, ts[k + 1])["pos"]
		if Vector2(pb.x - pa.x, pb.z - pa.z).length() <= DESLIZ_MIN_M:
			continue
		var viene_corriendo: bool = false
		for fam in FAMILIAS_MOVER:
			if String(a["anim"]).contains(fam):
				viene_corriendo = true
		if not viene_corriendo:
			return {"i": i, "ta": ts[k], "tb": ts[k + 1], "pb": pb}
	return {}



func pose_ghosts(t: float) -> Vector3:
	var ball: Vector3 = super.pose_ghosts(t)
	var gp: Array = _golpe_del_tirador()



	if not _desliz.is_empty():

		var ta0: float = float(_desliz.get("ta0", float(_desliz["ta"]) - DESLIZ_PREVIO_S))
		var tb: float = float(_desliz["tb"])
		var j: int = int(_desliz["i"])
		if t > ta0 and t < tb and j < _ghosts.size():
			var gj: AnimatedSprite3D = _ghosts[j]
			var p: Vector3 =(_clip.pose(j, ta0)["pos"] as Vector3).lerp(
				_desliz["pb"], smoothstep(ta0, tb, t))
			gj.position = Vector3(p.x, gj.position.y, p.z)
			_pose_lams(j, gj)
	for i in range(1, _ghosts.size()):
		var g: AnimatedSprite3D = _ghosts[i]
		if g.sprite_frames == null or not g.visible:
			continue
		var rumbo: String = _rumbo_para(i, g.animation, t)








		var tiro: bool = rumbo != "" and _golpe_dir != Vector2.ZERO and i == int(gp[0]) \
				and _en_golpe(t) and _es_gesto(g.animation)
















		var antes: String = String(_rumbo_prev.get(i, ""))
		if not tiro and antes != "" and rumbo != "" and rumbo != antes:
			var luego: float = minf(t + GIRO_CONFIRMA_S, _clip.length())
			var despues: String = _rumbo_para(i, _clip.pose(i, luego)["anim"], luego)
			if despues == antes or _opuesto(rumbo, despues):
				rumbo = antes



		if i == int(gp[0]) and t > float(gp[1]):
			var mira: String = _rumbo_para(i, gp[2], float(gp[1]))
			if mira != "" and _opuesto(mira, rumbo):
				rumbo = mira
		if tiro:
			_giro_paso.erase(i)
		else:
			rumbo = _media_vuelta(i, t, String(_rumbo_prev.get(i, "")), rumbo)
		_rumbo_prev[i] = rumbo
		if rumbo != "":
			var quiero: StringName = _anim_hacia(g.animation, rumbo)
			if quiero == g.animation:





				_mismo_espejo(i, g, rumbo)
				_pose_lams(i, g)
				continue
			if quiero != &"" and g.sprite_frames.has_animation(quiero):
				var fr: int = g.frame
				g.animation = quiero
				g.frame = mini(fr,
					maxi(g.sprite_frames.get_frame_count(quiero) - 1, 0))
				_mismo_espejo(i, g, rumbo)


				_pose_lams(i, g)
				continue









		g.flip_h = not g.flip_h
		var espejo: StringName = _mirror_of(g.animation)
		if espejo == g.animation or not g.sprite_frames.has_animation(espejo):


			_mismo_espejo(i, g, _rumbo_del_cuadro(g.animation))
			_pose_lams(i, g)
			continue
		var f: int = g.frame
		g.animation = espejo
		g.frame = mini(f, maxi(g.sprite_frames.get_frame_count(espejo) - 1, 0))






		_mismo_espejo(i, g, _rumbo_del_cuadro(g.animation))











		_pose_lams(i, g)
		ball = _blocaje_bajo_guantes(g, ball)
	pose_caras(t)
	return ball



func _caras_en_base() -> bool:
	return false






func _anim_prevista(i: int, anim: StringName, t: float) -> StringName:
	if i == 0:
		return anim
	var rumbo: String = _rumbo_para(i, anim, t)
	if rumbo != "":
		var quiero: StringName = _anim_hacia(anim, rumbo)
		if quiero != &"":
			return quiero
	return _mirror_of(anim)







func _rumbo_del_cuadro(anim: StringName) -> String:
	return String(RUMBO_DE_IDLE.get(anim, ""))




func _mismo_espejo(i: int, g: AnimatedSprite3D, rumbo: String) -> void:
	if (rumbo == "north" or rumbo == "south") and _flip_prev.has(i) \
			and _flip_prev[i][0] == g.animation:
		g.flip_h = bool(_flip_prev[i][1])
	_flip_prev[i] = [g.animation, g.flip_h]





func _media_vuelta(i: int, t: float, antes: String, rumbo: String) -> String:
	var paso: Array = _giro_paso.get(i, [])
	if not paso.is_empty():
		if rumbo == String(paso[1]) and t >= float(paso[0]) and t < float(paso[0]) + GIRO_PASO_S:
			return String(paso[2])
		_giro_paso.erase(i)
		if rumbo == String(paso[1]):
			return rumbo
		antes = String(paso[2]) if rumbo != String(paso[2]) else antes
	if not _opuesto(antes, rumbo):
		return rumbo
	var medio: String = "south"
	if rumbo == "north" or rumbo == "south":


		var lado: String = _rumbo_de(i, t, 0.0)
		medio = lado if lado == "west" else "east"
	_giro_paso[i] = [t, rumbo, medio]
	return medio










const BLOCAJE_MANOS_NORTE: Dictionary = {
	&"blocaje_lado_north": 0.67, &"blocaje_bruces_north": 0.68,
}
const BLOCAJE_DELANTE: float = 0.15


func _blocaje_bajo_guantes(g: AnimatedSprite3D, ball: Vector3) -> Vector3:
	if not BLOCAJE_MANOS_NORTE.has(g.animation) or _ghosts.is_empty():
		return ball
	if g.frame < g.sprite_frames.get_frame_count(g.animation) - 3:
		return ball
	if ball.y > 0.5 or Vector2(ball.x - g.position.x, ball.z - g.position.z).length() > 1.2:
		return ball


	var lado: float = 1.0 if g.flip_h else -1.0
	var hacia: float = 1.0 if _cam.global_position.z >= g.position.z else -1.0
	var b := Vector3(g.position.x + lado * float(BLOCAJE_MANOS_NORTE[g.animation]), ball.y,
		g.position.z + hacia * BLOCAJE_DELANTE)
	_ghosts[0].position = b
	return b





func _mirror_of(anim: StringName) -> StringName:
	if MIRROR.has(anim):
		return MIRROR[anim]
	var n: String = String(anim)
	for par in [["south", "north"], ["north", "south"],
			["east", "west"], ["west", "east"]]:
		if n.ends_with("_" + par[0]):
			return StringName(n.substr(0, n.length() - par[0].length()) + par[1])
	return anim










func _keep_hidden() -> void:
	for n in _tapar:
		if is_instance_valid(n) and "visible" in n and n.visible:
			n.visible = false
			if not _hidden.has(n):
				_hidden.append(n)





func _keep_camera() -> void:
	if not is_instance_valid(_cam):
		return
	var cur: Camera3D = SceneFade.camara_de(self)
	if cur == _cam:
		return
	if is_instance_valid(cur):
		_prev_cam = cur
	_cam.current = true



func _unhandled_input(ev: InputEvent) -> void:

	if sin_reloj:
		return
	if (ev is InputEventScreenTouch and ev.pressed) \
			or (ev is InputEventMouseButton and ev.pressed):
		get_viewport().set_input_as_handled()
		close()
		return




	if ev is InputEventJoypadButton and ev.pressed \
			and (ev.is_action("fl_avanza") or ev.is_action("fl_toque")):
		get_viewport().set_input_as_handled()
		close()





func _build_ui() -> void:





	if UiKit.es_horizontal():
		_bandas_h = BANDAS_H
	add_child(_bar(true))
	add_child(_bar(false))

	_label_main = Label.new()
	_label_main.text = I18n.t("LA REPETICION")
	UiKit.style_title(_label_main, 34, Color.WHITE)
	_label_main.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_label_main.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER




	_label_main.clip_text = true
	_label_main.offset_top = 44.0 + UiKit.top_safe_inset(get_viewport())
	_label_main.offset_bottom = _label_main.offset_top + 44.0





	var lado: float = UiKit.side_safe_inset(get_viewport()) if UiKit.es_horizontal() else 0.0
	_label_main.offset_left = lado
	_label_main.offset_right = - lado
	_label_main.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_label_main)



	_dot = ColorRect.new()
	_dot.color = CareerTheme.DANGER
	_dot.set_anchors_preset(Control.PRESET_TOP_LEFT)
	_dot.offset_left = 64.0


	if UiKit.es_horizontal():
		_dot.offset_left += UiKit.side_safe_inset(get_viewport())
	_dot.offset_top = _label_main.offset_top + 12.0
	_dot.size = Vector2(20.0, 20.0)
	_dot.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_dot)
	var blink: Tween = create_tween().set_loops()
	blink.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	blink.set_ignore_time_scale(true)
	blink.tween_property(_dot, "modulate:a", 0.15, 0.45)
	blink.tween_property(_dot, "modulate:a", 1.0, 0.45)

	_label_sub = Label.new()


	_label_sub.text = I18n.t("AL LARGUERO") if _bar_hit else I18n.t("AL POSTE")
	_label_sub.add_theme_font_size_override("font_size", 22)


	_label_sub.add_theme_color_override("font_color", CareerTheme.MUTED)
	_label_sub.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_label_sub.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_label_sub.clip_text = true
	_label_sub.offset_top = _label_main.offset_bottom + 6.0
	_label_sub.offset_bottom = _label_sub.offset_top + 30.0
	_label_sub.offset_left = lado
	_label_sub.offset_right = - lado
	_label_sub.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_label_sub)
