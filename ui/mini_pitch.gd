class_name MiniPitch
extends Control




signal campo_cambio







































const Y_GK: float = 0.95
const Y_DEF: float = 0.84
const Y_ATK: float = 0.52
const X_MAX_GAP: float = 0.22
const X_SPAN: float = 0.64




const FONT: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")

const GOAL_RIV: Vector2 = Vector2(0.5, 0.025)
const GOAL_YOU: Vector2 = Vector2(0.5, 0.975)
const R_DOT: float = 9.0
const R_ME: float = 12.0





const ANILLO: float = 0.18
const FILO: float = 0.1
const HALO: float = 1.42


const R_BALL: float = 9.0





const ALTO_MAX: float = 22.0


const VUELO_DUR: float = 0.62



const ARCO_NORM: float = 1.4355

const ANCHO_MAX: float = 0.74


const EASE_BLOCK: float = 4.2
const EASE_ACT: float = 8.0
const EASE_BALL: float = 6.5









const IDLE_AMP: float = 0.009
const IDLE_F1: float = 0.37
const IDLE_F2: float = 0.53









const CIRCULA_CADA: float = 1.15
const CIRCULA_ESPERA: float = 0.55
const CIRCULA_MIN: float = 0.07
const CIRCULA_MAX: float = 0.36






const OLA_MAX: float = 0.2


const OLA_PEREZA: float = 0.12





const VEL_REF: float = 0.55
const VEL_ESTIRA: float = 0.16
const VEL_ARRASTRE: float = 0.34





const ESTELA: int = 5
const ESTELA_REF: float = 1.2



const SEP_X: float = 0.062
const SEP_Y: float = 0.042

var you_color: Color = UiKit.CYAN
var rival_color: Color = Color("c07be0")



var you_alt: Color = UiKit.INK_HI
var rival_alt: Color = UiKit.INK_HI
var you_pat: String = "solid"
var rival_pat: String = "solid"


var mow: int = 0
var _grass: ImageTexture = null

var _r_ficha: float = 21.0



var _disco: PackedVector2Array = PackedVector2Array()


var _buf: PackedVector2Array = PackedVector2Array()




var _you_nums: Array[int] = []
var _riv_nums: Array[int] = []

var _you_base: Array[Vector2] = []
var _riv_base: Array[Vector2] = []






var _me: int = 9


var _you_form: String = "4-4-2"
var _you: Array[Vector2] = []
var _riv: Array[Vector2] = []
var _you_out: Array[bool] = []
var _riv_out: Array[bool] = []


var _you_vel: Array[Vector2] = []
var _riv_vel: Array[Vector2] = []

var _you_espera: PackedFloat32Array = PackedFloat32Array()
var _riv_espera: PackedFloat32Array = PackedFloat32Array()





var _you_set: Array[Vector2] = []
var _riv_set: Array[Vector2] = []
var _ball: Vector2 = Vector2(0.5, 0.5)
var _ball_t: Vector2 = Vector2(0.5, 0.5)




var _z: float = 0.0
var _fly_t: float = 0.0
var _fly_dur: float = VUELO_DUR
var _fly_alto: float = 0.0


var _ball_vel: Vector2 = Vector2.ZERO
var _rastro: PackedVector2Array = PackedVector2Array()
var _rastro_alt: PackedFloat32Array = PackedFloat32Array()
var _rastro_i: int = 0


var _reloj: float = 0.0

var _circula_t: float = CIRCULA_ESPERA + CIRCULA_CADA


var circula: bool = true

var _act_team: String = ""
var _act_idx: int = -1
var _act_pos: Vector2 = Vector2(0.5, 0.5)


var _stopped: bool = false
var _kickoff: bool = false
var _flash: float = 0.0
var _flash_color: Color = UiKit.GOLD



var _word: String = ""
var _word_col: Color = UiKit.GOLD
var _word_t: float = 0.0
var _word_dur: float = 1.6




func rect_campo() -> Rect2:
	return _rect()


func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		campo_cambio.emit()


func _ready() -> void:

	_disco.resize(14)
	for i: int in 14:
		var a: float = TAU * float(i) / 14.0
		_disco[i] = Vector2(cos(a), sin(a))
	_buf.resize(14)
	_rastro.resize(ESTELA)
	_rastro_alt.resize(ESTELA)
	for i: int in ESTELA:
		_rastro[i] = _ball
	mouse_filter = Control.MOUSE_FILTER_IGNORE


	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	if _you_base.is_empty():
		setup(you_color, rival_color, "4-4-2", "4-4-2")
	set_process(true)





func setup(you_kit: Variant, rival_kit: Variant,
		you_form: String = "4-4-2", riv_form: String = "4-4-2",
		you_nums: Array = [], riv_nums: Array = [], mow_pattern: int = 0) -> void:
	mow = mow_pattern



	_grass = _grass_tex()
	you_color = _kit_col(you_kit, UiKit.CYAN)
	you_alt = _kit_alt(you_kit, you_color)
	you_pat = _kit_pat(you_kit)
	rival_color = _separa(you_color, _kit_col(rival_kit, Color("c07be0")))
	rival_alt = _kit_alt(rival_kit, rival_color)
	rival_pat = _kit_pat(rival_kit)
	_you_nums = _dorsales(you_nums)
	_riv_nums = _dorsales(riv_nums)
	_you_base = _formacion(you_form, false)
	_riv_base = _formacion(riv_form, true)
	_you_form = you_form
	_me = _mi_ficha(you_form)
	_you = _you_base.duplicate()
	_riv = _riv_base.duplicate()
	_you_out.clear();_you_out.resize(_you.size())
	_riv_out.clear();_riv_out.resize(_riv.size())
	_you_vel.clear();_you_vel.resize(_you.size())
	_riv_vel.clear();_riv_vel.resize(_riv.size())
	_you_espera.resize(_you.size())
	_riv_espera.resize(_riv.size())
	_you_espera.fill(0.0)
	_riv_espera.fill(0.0)
	queue_redraw()


func _kit_col(k: Variant, fallback: Color) -> Color:
	if k is Color:
		return k
	if k is Dictionary:
		return (k as Dictionary).get("kit", fallback)
	return fallback


func _kit_alt(k: Variant, base: Color) -> Color:
	if k is Dictionary:
		var a: Color =(k as Dictionary).get("kit2", UiKit.INK_HI)

		var d: float = absf(a.r - base.r) + absf(a.g - base.g) + absf(a.b - base.b)
		if d < 0.3:
			return UiKit.INK_HI if base.get_luminance() < 0.45 else Color("15151c")
		return a
	return UiKit.INK_HI if base.get_luminance() < 0.45 else Color("15151c")





func _kit_pat(k: Variant) -> String:
	if not (k is Dictionary):
		return "solid"



	return KitRecolor.familia_2d(String((k as Dictionary).get("pattern", "solid")))




func _dorsales(nums: Array) -> Array[int]:
	var out: Array[int] = []
	for n: Variant in nums:
		out.append(int(n))
	var clasicos: Array[int] = [1, 2, 5, 6, 3, 4, 8, 10, 7, 9, 11]
	while out.size() < 11:
		out.append(clasicos[out.size()])
	return out







func _separa(mio: Color, suyo: Color) -> Color:
	var dh: float = absf(mio.h - suyo.h)
	dh = minf(dh, 1.0 - dh)
	if dh > 0.12 or absf(mio.v - suyo.v) > 0.45:
		return suyo
	return Color("c07be0")



func _formacion(nombre: String, espejo: bool) -> Array[Vector2]:
	var rows: Array = ScenarioStore.FORMATION_ROWS.get(
		nombre, ScenarioStore.FORMATION_ROWS["4-4-2"])
	var out: Array[Vector2] = [Vector2(0.5, Y_GK)]
	var n: int = rows.size()
	for li: int in n:
		var cuantos: int = int(rows[li])


		var y: float = Y_DEF if n <= 1 else lerpf(Y_DEF, Y_ATK, float(li) / float(n - 1))
		var gap: float = minf(X_MAX_GAP, X_SPAN / float(maxi(1, cuantos - 1)))
		for j: int in cuantos:
			var x: float = 0.5 +(float(j) - float(cuantos - 1) * 0.5) * gap
			out.append(Vector2(clampf(x, 0.1, 0.9), y))

	while out.size() < 11:
		out.append(Vector2(0.5, Y_ATK))
	if espejo:
		for i: int in out.size():
			out[i] = Vector2(out[i].x, 1.0 - out[i].y)
	return out





























func _mi_ficha(nombre: String) -> int:
	var rows: Array = ScenarioStore.FORMATION_ROWS.get(
		nombre, ScenarioStore.FORMATION_ROWS["4-4-2"])
	var por_asiento: int = _ficha_de_asiento(nombre, rows)
	if por_asiento >= 0:
		return por_asiento
	var linea: String = Squad.line_of(Squad.USER_POS)
	var fila: int = rows.size() - 1
	if linea == "MED":
		fila = maxi(0, rows.size() - 2)
	elif linea == "DEF":
		fila = 0
	var antes: int = 1
	for li: int in fila:
		antes += int(rows[li])
	return antes + int(int(rows[fila]) / 2)




const _BANDA_IZQ: Array[String] = ["LTI", "MI", "EI"]
const _BANDA_DER: Array[String] = ["LTD", "MD", "ED"]


















func _ficha_de_asiento(nombre: String, rows: Array) -> int:
	var xi: Array =((Squad.FORMATIONS.get(nombre, {}) as Dictionary)
		.get("xi", []) as Array)
	if xi.size() != Squad.STARTING_XI:
		return -1
	var once: Array = []
	for pos in xi:
		once.append({"pos": String(pos)})
	var asiento: int = Squad.user_index(once)
	if asiento < 1:
		return -1
	var antes: int = 1
	for li: int in rows.size():
		var cuantos: int = int(rows[li])
		if asiento < antes + cuantos:
			var pos_a: String = String(xi[asiento])
			if pos_a in _BANDA_IZQ:
				return antes
			if pos_a in _BANDA_DER:
				return antes + cuantos - 1
			return antes + int(cuantos / 2)
		antes += cuantos
	return -1




func _punta(nombre: String) -> int:
	var rows: Array = ScenarioStore.FORMATION_ROWS.get(
		nombre, ScenarioStore.FORMATION_ROWS["4-4-2"])
	var antes: int = 1
	for li: int in rows.size() - 1:
		antes += int(rows[li])
	var ultimos: int = int(rows[rows.size() - 1])
	return antes + int(ultimos / 2)






func narra(kind: String, _num: int = 0, team: String = "") -> void:
	_stopped = false
	_kickoff = false

	_you_set.clear()
	_riv_set.clear()


	_circula_t = CIRCULA_ESPERA + CIRCULA_CADA
	match kind:
		"goal_you":

			_act("you", _me, Vector2(0.5, 0.14))
			_ball_t = GOAL_RIV
			_vuela(0.85)
			_bang(UiKit.GOLD)
		"goal_team":





			var otro: int = maxi(1, _me - 1) if _me == _punta(_you_form) \
					else _punta(_you_form)
			_act("you", otro, Vector2(0.44, 0.14))
			_ball_t = GOAL_RIV
			_vuela(0.85)
			_bang(UiKit.GOLD)
		"goal_rival":
			_act("riv", 9, Vector2(0.48, 0.84))
			_ball_t = GOAL_YOU
			_vuela(0.85)
			_bang(UiKit.DANGER)
		"near_team":
			_act("you", _me, Vector2(0.52, 0.3))
			_ball_t = Vector2(0.46, 0.06)


			_vuela(1.0)
		"near_rival":
			_act("riv", 9, Vector2(0.46, 0.78))
			_ball_t = Vector2(0.52, 0.93)
			_vuela(1.0)
		"you", "assist":
			_act("you", _me, Vector2(0.5, 0.4))
			_ball_t = Vector2(0.5, 0.4)


			_vuela(0.22)
		"assist_rival":



			_act("riv", 9, Vector2(0.5, 0.6))
			_ball_t = Vector2(0.5, 0.6)
			_vuela(0.22)
		"sub":
			_stopped = true
			_act("you", _me, Vector2(0.5, 0.5))
			_ball_t = Vector2(0.5, 0.5)
			_vuela(0.0)
		"red", "red_you":


			if team == "you":
				_you_out[8] = true
			else:
				_riv_out[4] = true
			_act(team if team == "you" else "riv", 4, Vector2(0.8, 0.22))
			_vuela(0.0)
		"set_piece":
			_stopped = true
			_act("you", _me, Vector2(0.06, 0.06))
			_ball_t = Vector2(0.06, 0.06)

			_vuela(0.0)
		"plan":



			return
		"card", "card_you", "injury", "red_you":

			_stopped = true
			_vuela(0.0)
		"post":
			_act("you", _me, Vector2(0.5, 0.26))
			_ball_t = Vector2(0.435, 0.03)

			_vuela(0.7, 0.48)
		"break":
			_kickoff = true
			_stopped = true
			_act("", -1, Vector2.ZERO)
			_ball_t = Vector2(0.5, 0.5)
			_vuela(0.0)
		_:
			_act("", -1, Vector2.ZERO)
			_ball_t = Vector2(randf_range(0.32, 0.68), randf_range(0.34, 0.66))
			_vuela(0.45)
	_ola()
	queue_redraw()











func _pasa() -> void:
	var equipo: String = _act_team if _act_team != "" else _duenio()
	var arr: Array[Vector2] = _you if equipo == "you" else _riv
	var fuera: Array[bool] = _you_out if equipo == "you" else _riv_out
	var cand: Array[int] = []
	for i: int in range(1, arr.size()):
		if fuera[i]:
			continue
		var d: float = arr[i].distance_to(_ball)
		if d > CIRCULA_MIN and d < CIRCULA_MAX:
			cand.append(i)
	if cand.is_empty():
		return
	_ball_t = arr[cand[randi() % cand.size()]]


	_vuela(0.18, 0.42)




func _duenio() -> String:
	var dy: float = 9.9
	var dr: float = 9.9
	for p: Vector2 in _you:
		dy = minf(dy, p.distance_to(_ball))
	for p: Vector2 in _riv:
		dr = minf(dr, p.distance_to(_ball))
	return "you" if dy <= dr else "riv"






func _metros(v: Vector2, m: float) -> Vector2:
	return Vector2(v.x * m / 68.0, v.y * m / 105.0)






















func acomoda_parado(penal: bool, punto: Vector2, barrera: int, mia: bool) -> void:
	if _you.is_empty() or _riv.is_empty():
		return
	_stopped = true
	_kickoff = false


	_ball = punto
	_ball_t = punto
	_vuela(0.0)
	_circula_t = 1000000000.0
	_act("", -1, Vector2.ZERO)
	_you_set.assign(_you_base)
	_riv_set.assign(_riv_base)


	var ata: Array[Vector2] = _you_set if mia else _riv_set
	var deff: Array[Vector2] = _riv_set if mia else _you_set
	var arco: Vector2 = GOAL_RIV if mia else GOAL_YOU
	var propio: Vector2 = GOAL_YOU if mia else GOAL_RIV
	var haciaarco: float = -1.0 if mia else 1.0
	var lanza: int = _me if mia else 9



	ata[0] = Vector2(0.5, propio.y - 0.055 * haciaarco)

	if penal:




		deff[0] = Vector2(0.5, arco.y + 0.02 * - haciaarco)
		_arco_de_gente(ata, deff, punto, haciaarco, lanza, arco.y)
		ata[lanza] = punto + Vector2(0.0, SEP_Y * 1.15 * - haciaarco)
		_ola()
		queue_redraw()
		return



	var dir: Vector2 =(arco - punto).normalized()
	var perp: Vector2 = Vector2(- dir.y, dir.x)
	var muro: int = clampi(barrera, 0, 5)
	var centro: Vector2 = punto + _metros(dir, 9.15)
	for j: int in muro:
		var off: float =(float(j) -(float(muro) - 1.0) * 0.5) * SEP_X * 1.02
		deff[1 + j] = centro + perp * off




	deff[0] = Vector2(clampf(0.5 +(punto.x - 0.5) * 0.42, 0.36, 0.64),
		arco.y + 0.02 * - haciaarco)








	var lejos: float = - haciaarco






	const SUBEN: int = 5




	var fila_y: Array[float] = [arco.y + 0.045 * lejos, arco.y + 0.108 * lejos]
	var fila_x: Array = [[0.35, 0.5, 0.65], [0.42, 0.58]]
	var d: int = 1 + muro
	var puesto: int = 0
	for i: int in range(1, mini(11, ata.size())):
		if i == lanza or puesto >= SUBEN:
			continue
		var fila: int = 0 if puesto < 3 else 1
		var col: int = puesto if puesto < 3 else puesto - 3
		var x: float = float((fila_x[fila] as Array)[col])
		ata[i] = Vector2(x, fila_y[fila])
		if d < deff.size():



			deff[d] = Vector2(clampf(x + SEP_X * 0.55, 0.12, 0.88),
				fila_y[fila] - SEP_Y * 0.62 * lejos)
			d += 1
		puesto += 1

	ata[lanza] = punto - _metros(dir, 3.0) - perp *(SEP_X * 0.42)
	_ola()
	queue_redraw()






func _arco_de_gente(ata: Array[Vector2], deff: Array[Vector2], punto: Vector2,
		haciaarco: float, lanza: int, arco_y: float) -> void:
	var lejos: float = - haciaarco
	for i: int in range(1, mini(11, ata.size())):
		var t: float =(float(i) - 1.0) / 9.0
		var ang: float = lerpf(-1.4, 1.4, t)
		var fuera: Vector2 = Vector2(sin(ang), cos(ang) * lejos)
		if i != lanza:
			ata[i] = _dentro(_fuera_del_area(
				punto + Vector2(fuera.x * 0.3, fuera.y * 0.125), arco_y, lejos))
		if i < deff.size():

			var ang2: float = ang + 0.14
			var f2: Vector2 = Vector2(sin(ang2), cos(ang2) * lejos)
			deff[i] = _dentro(_fuera_del_area(
				punto + Vector2(f2.x * 0.39, f2.y * 0.175), arco_y, lejos))







func _fuera_del_area(p: Vector2, arco_y: float, lejos: float) -> Vector2:
	var minimo: float = arco_y + 0.185 * lejos
	return Vector2(p.x, maxf(p.y, minimo) if lejos > 0.0 else minf(p.y, minimo))




func _dentro(p: Vector2) -> Vector2:
	return Vector2(clampf(p.x, 0.07, 0.93), clampf(p.y, 0.04, 0.96))



func saque_de_centro() -> void:
	narra("break")





func palabra(txt: String, col: Color, secs: float = 1.6) -> void:
	_word = txt
	_word_col = col
	_word_dur = secs
	_word_t = secs
	queue_redraw()








static func _suave(k: float, delta: float) -> float:
	return 1.0 - exp(- k * delta)





func _idle(team: String, i: int) -> Vector2:
	var semilla: float = float(i) * 1.7 +(0.0 if team == "you" else 3.1)
	return Vector2(
		sin(_reloj * TAU * IDLE_F1 + semilla) * IDLE_AMP,
		cos(_reloj * TAU * IDLE_F2 + semilla * 1.3) * IDLE_AMP * 0.72)





func _ola() -> void:










	var dmin: float = 9.9
	var dmax: float = -1.0
	for p: Vector2 in _you:
		var d: float = p.distance_to(_ball_t)
		dmin = minf(dmin, d)
		dmax = maxf(dmax, d)
	for p: Vector2 in _riv:
		var d: float = p.distance_to(_ball_t)
		dmin = minf(dmin, d)
		dmax = maxf(dmax, d)
	var span: float = maxf(dmax - dmin, 0.0001)
	for i: int in _you_espera.size():
		_you_espera[i] =(_you[i].distance_to(_ball_t) - dmin) / span * OLA_MAX
	for i: int in _riv_espera.size():
		_riv_espera[i] =(_riv[i].distance_to(_ball_t) - dmin) / span * OLA_MAX


	if _act_idx >= 0:
		if _act_team == "you" and _act_idx < _you_espera.size():
			_you_espera[_act_idx] = 0.0
		elif _act_team == "riv" and _act_idx < _riv_espera.size():
			_riv_espera[_act_idx] = 0.0


func _act(team: String, idx: int, pos: Vector2) -> void:
	_act_team = team
	_act_idx = idx
	_act_pos = pos


func _bang(c: Color) -> void:
	_flash = 1.0
	_flash_color = c





func _vuela(alto: float, dur: float = VUELO_DUR) -> void:
	_fly_alto = clampf(alto, 0.0, 1.0)
	_fly_dur = maxf(0.01, dur)
	_fly_t = _fly_dur if _fly_alto > 0.0 else 0.0
	if _fly_alto <= 0.0:
		_z = 0.0


func _process(delta: float) -> void:
	_reloj += delta


	if circula and not _stopped and not _kickoff:
		_circula_t -= delta
		if _circula_t <= 0.0:
			_circula_t = CIRCULA_CADA
			_pasa()
	var ball_antes: Vector2 = _ball
	_ball = _ball.lerp(_ball_t, _suave(EASE_BALL, delta))
	_ball_vel = _ball_vel.lerp((_ball - ball_antes) / maxf(delta, 0.0001),
		_suave(9.0, delta))







	if _fly_t > 0.0:
		_fly_t = maxf(0.0, _fly_t - delta)
		var p: float = clampf(1.0 - _fly_t / _fly_dur, 0.0, 1.0)
		_z = _fly_alto * absf(sin(TAU * p)) * pow(1.0 - p, 1.4) * ARCO_NORM
	elif _z != 0.0:
		_z = 0.0
	_step(_you, _you_out, "you", delta)
	_step(_riv, _riv_out, "riv", delta)
	if _flash > 0.0:
		_flash = maxf(0.0, _flash - delta * 1.6)
	if _word_t > 0.0:
		_word_t = maxf(0.0, _word_t - delta)

	_rastro_i =(_rastro_i + 1) % ESTELA
	_rastro[_rastro_i] = _ball
	_rastro_alt[_rastro_i] = _z
	queue_redraw()


func _step(arr: Array[Vector2], fuera: Array[bool], team: String, delta: float) -> void:
	var base: Array[Vector2] = _you_base if team == "you" else _riv_base
	var vel: Array[Vector2] = _you_vel if team == "you" else _riv_vel
	var espera: PackedFloat32Array = _you_espera if team == "you" else _riv_espera
	for i: int in arr.size():
		var tgt: Vector2 = _target(team, i, base[i])
		if fuera[i]:
			tgt = Vector2(1.06 if team == "you" else -0.06, 0.5)
		var e: float = EASE_ACT if (team == _act_team and i == _act_idx) else EASE_BLOCK
		if i < espera.size() and espera[i] > 0.0:
			espera[i] = maxf(0.0, espera[i] - delta)


			e *= OLA_PEREZA
		var antes: Vector2 = arr[i]
		arr[i] = arr[i].lerp(tgt, _suave(e, delta))
		if i < vel.size():
			vel[i] = vel[i].lerp((arr[i] - antes) / maxf(delta, 0.0001),
				_suave(9.0, delta))





func _target(team: String, i: int, base: Vector2) -> Vector2:
	var jit: Vector2 = _idle(team, i)




	var puesto: Array[Vector2] = _you_set if team == "you" else _riv_set
	if i < puesto.size():
		return Vector2(clampf(puesto[i].x + jit.x, 0.04, 0.96),
			clampf(puesto[i].y + jit.y, 0.02, 0.98))
	if team == _act_team and i == _act_idx:


		return _act_pos + jit * 0.5

	if i == 0:
		var x: float = clampf(0.5 +(_ball.x - 0.5) * 0.24 + jit.x, 0.38, 0.62)
		if team == "you":
			return Vector2(x, clampf(0.88 +(_ball.y - 0.6) * 0.1 + jit.y, 0.88, 0.96))
		return Vector2(x, clampf(0.12 -(0.6 - _ball.y) * 0.1 + jit.y, 0.04, 0.12))

	if _kickoff:
		var ky: float = clampf(base.y, 0.52, 0.96) if team == "you" else clampf(base.y, 0.04, 0.48)
		return Vector2(base.x, ky)
	if _stopped:

		return Vector2(clampf(base.x + jit.x, 0.06, 0.94), clampf(base.y + jit.y, 0.04, 0.96))





	var anchor: float = 0.58 if team == "you" else 0.42
	var crudo: float =(_ball.y - anchor) * 0.55
	var arriba: float = -0.34 if team == "you" else -0.16
	var abajo: float = 0.16 if team == "you" else 0.34
	var shift: float = clampf(crudo, arriba, abajo)




	var lejania: float = absf(base.y -(0.9 if team == "you" else 0.1))
	shift *= lerpf(0.45, 1.0, clampf(lejania / 0.45, 0.0, 1.0))




	var suelo: float = 0.12 if team == "riv" else 0.07
	var techo: float = 0.88 if team == "you" else 0.93
	return Vector2(clampf(base.x +(_ball.x - 0.5) * 0.22 + jit.x, 0.06, 0.94),
		clampf(base.y + shift + jit.y, suelo, techo))






func _rect() -> Rect2:
	var ratio: float = 68.0 / 105.0




	var w: float = minf(size.x * ANCHO_MAX, size.y * ratio)
	var h: float = w / ratio
	return Rect2(Vector2((size.x - w) * 0.5,(size.y - h) * 0.5), Vector2(w, h))


func _draw() -> void:
	var r0: Rect2 = _rect()
	var s: Vector2 = r0.size
	draw_set_transform(r0.position, 0.0, Vector2.ONE)
	if _grass == null:
		_grass = _grass_tex()




	draw_texture_rect(_grass, Rect2(Vector2.ZERO, s), false)

	var dom: float = clampf(1.0 - _ball.y, 0.0, 1.0)
	draw_rect(Rect2(Vector2.ZERO, Vector2(s.x, s.y * 0.44)),
		Color(rival_color.r, rival_color.g, rival_color.b, 0.08 + 0.14 *(1.0 - dom)), true)
	draw_rect(Rect2(Vector2(0.0, s.y * 0.56), Vector2(s.x, s.y * 0.44)),
		Color(you_color.r, you_color.g, you_color.b, 0.05 + 0.12 * dom), true)
	_r_ficha = clampf(s.x * 0.0274, 9.0, 23.0)
	_lines(s, Color(0.98, 0.98, 0.96, 0.72))



	for i: int in _riv.size():
		_sombra(_riv[i] * s, _r_ficha, _riv_vel[i] if i < _riv_vel.size() else Vector2.ZERO)
	for i: int in _you.size():
		_sombra(_you[i] * s, _r_ficha *(1.26 if i == _me else 1.0),
			_you_vel[i] if i < _you_vel.size() else Vector2.ZERO)
	for i: int in _riv.size():
		_ficha(_riv[i] * s, rival_color, rival_alt, _riv_nums[i], false,
			_act_team == "riv" and i == _act_idx, i == 0,
			_riv_vel[i] if i < _riv_vel.size() else Vector2.ZERO)
	for i: int in _you.size():
		_ficha(_you[i] * s, you_color, you_alt, _you_nums[i], i == _me,
			_act_team == "you" and i == _act_idx, i == 0,
			_you_vel[i] if i < _you_vel.size() else Vector2.ZERO)




	var suelo: Vector2 = _ball * s + Vector2(0.0, 3.0)
	var r_som: float = R_BALL *(0.9 + 0.8 * _z)


	draw_circle(suelo, r_som * 1.45, Color(0, 0, 0, 0.13 *(1.0 - 0.45 * _z)))
	draw_circle(suelo, r_som, Color(0, 0, 0, 0.42 *(1.0 - 0.5 * _z)))



	var pb: Vector2 = _ball * s - Vector2(0.0, _z * ALTO_MAX)
	var rb: float = R_BALL *(1.0 + 0.28 * _z)



	var fuerza: float = clampf(_ball_vel.length() / ESTELA_REF, 0.0, 1.0)
	if fuerza > 0.05:
		for k: int in range(1, ESTELA):
			var idx: int =(_rastro_i - k + ESTELA * 2) % ESTELA
			var edad: float = 1.0 - float(k) / float(ESTELA)
			draw_circle(_rastro[idx] * s - Vector2(0.0, _rastro_alt[idx] * ALTO_MAX),
				rb *(0.4 + 0.45 * edad),
				Color(UiKit.GOLD.r, UiKit.GOLD.g, UiKit.GOLD.b, 0.34 * edad * fuerza),
				true, -1.0, true)
	draw_circle(pb, rb * 2.3, Color(UiKit.GOLD.r, UiKit.GOLD.g, UiKit.GOLD.b, 0.16),
		true, -1.0, true)
	draw_circle(pb, rb, UiKit.GOLD, true, -1.0, true)


	if _word_t > 0.0 and not _word.is_empty():
		var vida: float = _word_t / maxf(0.01, _word_dur)
		var pop: float = lerpf(0.75, 1.0, clampf((1.0 - vida) / 0.12, 0.0, 1.0))
		var a: float = clampf(_word_t / 0.3, 0.0, 1.0)
		var fs: int = int(s.x / 9.0 * pop)
		var m: Vector2 = FONT.get_string_size(_word, HORIZONTAL_ALIGNMENT_LEFT, -1, fs)
		var p0: Vector2 = Vector2((s.x - m.x) * 0.5, s.y * 0.5 + fs * 0.35)
		draw_string(FONT, p0 + Vector2(3, 3), _word, HORIZONTAL_ALIGNMENT_LEFT, -1, fs,
			Color(0, 0, 0, 0.55 * a))
		draw_string(FONT, p0, _word, HORIZONTAL_ALIGNMENT_LEFT, -1, fs,
			Color(_word_col.r, _word_col.g, _word_col.b, a))
	if _flash > 0.0:
		draw_rect(Rect2(Vector2.ZERO, s),
			Color(_flash_color.r, _flash_color.g, _flash_color.b, 0.22 * _flash), true)






func _grass_tex() -> ImageTexture:
	var w: int = 68
	var h: int = 105
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGB8)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%d|%s" % [mow, name])
	for y: int in h:
		for x: int in w:
			var franja: bool = _corte(x, y, w, h)




			var c: Color = Stadium.GRASS_A.lightened(0.07) if franja \
					else Stadium.GRASS_A.darkened(0.07)
			var n: float = rng.randf_range(-0.02, 0.02)
			img.set_pixel(x, y, Color(clampf(c.r + n, 0, 1), clampf(c.g + n, 0, 1),
				clampf(c.b + n, 0, 1)))
	return ImageTexture.create_from_image(img)


func _corte(x: int, y: int, w: int, h: int) -> bool:
	match mow:
		1: return ((int(x / 10.0) + int(y / 10.0)) % 2) == 0
		2: return (int((x + y) / 12.0) % 2) == 0
		3: return (int(Vector2(x - w * 0.5, y - h * 0.5).length() / 8.0) % 2) == 0
		4: return (int(y / 5.0) % 2) == 0
		5: return (int(y / 9.0) % 2) == 0 if (y % 19) < 10 else (int(y / 7.0) % 2) == 0
		6: return (int(x / 10.0) % 2) == 0
		7:
			var band: int = int(y / 13.0)
			var d: int = int(((x + y) if band % 2 == 0 else (x - y + w)) / 9.0)
			return (d % 2) == 0
		8: return ((int(x / 17.0) + int(y / 17.0)) % 2) == 0
	return ((y / 2) % 2) == 0





func _sombra(p: Vector2, r: float, vel: Vector2) -> void:



	var v: float = vel.length()
	var m: float = clampf(v / VEL_REF, 0.0, 1.0)
	var dir: Vector2 = vel / v if v > 0.0001 else Vector2.RIGHT
	var c: Vector2 = p + Vector2(0.0, r * 0.58) - dir *(r * VEL_ARRASTRE * m)
	for i: int in _disco.size():




		var q: Vector2 = Vector2(_disco[i].x * r * 1.05, _disco[i].y * r * 0.42)
		_buf[i] = c + q + dir *(q.dot(dir) * 0.55 * m)
	draw_colored_polygon(_buf, Color(0, 0, 0, 0.34 - 0.1 * m))







func _disco_veloz(c: Vector2, r: float, dir: Vector2, k: float, col: Color) -> void:
	var ex: Vector2 = dir *(r *(1.0 + k))
	var ey: Vector2 = Vector2(- dir.y, dir.x) *(r *(1.0 - k * 0.55))
	for i: int in _disco.size():
		_buf[i] = c + ex * _disco[i].x + ey * _disco[i].y
	draw_colored_polygon(_buf, col)
















func _ficha(p: Vector2, base: Color, alt: Color, num: int, yo: bool,
		act: bool, gk: bool, vel: Vector2) -> void:



	var r: float = _r_ficha *(1.26 if yo else 1.0)
	var relleno: Color = alt if gk else base
	var anillo: Color = base if gk else alt
	if yo:



		relleno = UiKit.CYAN
		anillo = UiKit.INK_HI
	elif _pegados(anillo, relleno):


		anillo = relleno.darkened(0.5) if relleno.get_luminance() > 0.22 \
				else relleno.lightened(0.45)


	if act:
		draw_circle(p, r * HALO, Color(UiKit.GOLD.r, UiKit.GOLD.g, UiKit.GOLD.b, 0.3),
			true, -1.0, true)



	var v: float = vel.length()
	var m: float = clampf(v / VEL_REF, 0.0, 1.0)
	var k: float = m * VEL_ESTIRA
	var dir: Vector2 = vel / v if v > 0.0001 else Vector2.RIGHT



	if m < 0.06:
		draw_circle(p, r *(1.0 + FILO), Color(0.04, 0.04, 0.06, 0.85), true, -1.0, true)
		draw_circle(p, r, anillo, true, -1.0, true)
		draw_circle(p, r *(1.0 - ANILLO), relleno, true, -1.0, true)
	else:
		_disco_veloz(p, r *(1.0 + FILO), dir, k, Color(0.04, 0.04, 0.06, 0.85))
		_disco_veloz(p, r, dir, k, anillo)
		_disco_veloz(p, r *(1.0 - ANILLO), dir, k, relleno)
	if num <= 0:
		return


	var fs: int = int(r *(0.86 if num < 10 else 0.62))
	if fs < 6:
		return
	var txt: String = str(num)
	var tw: Vector2 = FONT.get_string_size(txt, HORIZONTAL_ALIGNMENT_LEFT, -1, fs)


	var tinta: Color = UiKit.INK if relleno.get_luminance() < 0.45 else CareerTheme.INK_DARK
	draw_string(FONT, p + Vector2(- tw.x * 0.5, fs * 0.42), txt,
		HORIZONTAL_ALIGNMENT_LEFT, -1, fs, tinta)



func _pegados(a: Color, b: Color) -> bool:
	return absf(a.r - b.r) + absf(a.g - b.g) + absf(a.b - b.b) < 0.3


func _lines(s: Vector2, c: Color) -> void:
	var w: float = 2.0
	draw_rect(Rect2(Vector2(6, 6), s - Vector2(12, 12)), c, false, w)
	draw_line(Vector2(6, s.y * 0.5), Vector2(s.x - 6, s.y * 0.5), c, w)
	draw_arc(s * 0.5, s.x * 0.14, 0.0, TAU, 40, c, w, true)
	for arriba: bool in [true, false]:
		var ay: float = 6.0 if arriba else s.y - 6.0 - s.y * 0.155
		draw_rect(Rect2(Vector2(s.x * 0.18, ay), Vector2(s.x * 0.64, s.y * 0.155)), c, false, w)
		var by: float = 6.0 if arriba else s.y - 6.0 - s.y * 0.062
		draw_rect(Rect2(Vector2(s.x * 0.34, by), Vector2(s.x * 0.32, s.y * 0.062)), c, false, w)



		var py: float = s.y * 0.105 if arriba else s.y * 0.895
		draw_circle(Vector2(s.x * 0.5, py), 4.0, c, true, -1.0, true)




	var re: float = s.x * 0.035
	for esq: Array in [[Vector2(6, 6), 0.0], [Vector2(s.x - 6, 6), PI * 0.5],
			[Vector2(s.x - 6, s.y - 6), PI], [Vector2(6, s.y - 6), PI * 1.5]]:
		draw_arc(esq[0], re, float(esq[1]), float(esq[1]) + PI * 0.5, 10, c, w, true)
