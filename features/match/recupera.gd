class_name Recupera
extends RefCounted



























const TARGET_Z: float = Stadium.FIELD_DEPTH

const HALFWAY: float = Stadium.FIELD_DEPTH * 0.5



















const BALL_BACK: Vector2 = Vector2(47.0, 56.0)

const BALL_X: float = 26.0

















const GAP: Vector2 = Vector2(6.5, 10.0)





const GAP_MAX_F: float = 0.55


const GAP_SIDE: Vector2 = Vector2(0.8, 2.6)






const APOYOS: Vector2i = Vector2i(3, 4)




const COBERTURAS: Vector2i = Vector2i(4, 5)



const SEP_MIN: float = 2.2


const CORRO: float = 3.4






const CORRO_YO: float = 5.0




const CORRO_YO_VIVO: float = 2.6


const EDGE_X: float = 33.0

const Z_MAX: float = TARGET_Z - 2.5























const ALTURA_MIA: String = "BAJA"
const ALTURA_SUYA: String = "MEDIA"





const MI_ADELANTE: float = 6.0
const MI_FONDO: float = 90.0







const SU_ATRAS: float = 5.0
const SU_ADELANTE: float = 26.0






const BASCULA_MIA: float = 0.45
const BASCULA_SUYA: float = 0.3






const APOYO_ADELANTE: float = 6.0







static func chance(rng: RandomNumberGenerator, mi_forma: String = "4-4-2",
		su_forma: String = "4-4-2") -> Dictionary:
	var ball: Vector2 = Vector2(
		rng.randf_range(- BALL_X, BALL_X),
		TARGET_Z - rng.randf_range(BALL_BACK.x, BALL_BACK.y))



	var yo: Vector2 = _tu_salida(ball, rng)



	var n_apoyos: int = rng.randi_range(APOYOS.x, APOYOS.y)
	var n_cober: int = rng.randi_range(COBERTURAS.x, COBERTURAS.y)






	var mis: Array = _bloque(mi_forma, true, ball, ball.y + MI_ADELANTE, MI_FONDO,
		BASCULA_MIA)
	var mis_filas: Array = _filas(mi_forma, false)



	var quita: int = _sitio_mas_cerca(mis, yo)
	var mi_fila: int = 1
	if quita >= 0:
		mi_fila = int(mis_filas[quita])
		mis.remove_at(quita)
		mis_filas.remove_at(quita)



	var mi_ultimo: float = - INF
	for p in mis:
		mi_ultimo = maxf(mi_ultimo,(p as Vector2).y)





	var sus: Array = _bloque(su_forma, false, ball,
		maxf(HALFWAY, ball.y - SU_ATRAS),
		minf(ball.y + SU_ADELANTE, mi_ultimo - OFFSIDE_HOLGURA), BASCULA_SUYA)
	var sus_filas: Array = _filas(su_forma, true)




	var n_mis: int = mis.size()
	var todos: Array = _asienta(mis + sus, ball, yo)
	mis = todos.slice(0, n_mis)
	sus = todos.slice(n_mis)







	var sus_i: Array = _cercanos(sus, ball, n_apoyos, ball.y + APOYO_ADELANTE)
	var mis_i: Array = _cercanos(mis, ball, n_cober, - INF)

	var suyos: Array = [ball]
	var f_suyos: Array = [2]
	var extras_suyos: Array = []
	var f_ex_suyos: Array = []
	for i in sus.size():
		if sus_i.has(i):
			suyos.append(sus[i])
			f_suyos.append(sus_filas[i])
		else:
			extras_suyos.append(sus[i])
			f_ex_suyos.append(sus_filas[i])
	var mios: Array = [yo]
	var f_mios: Array = [mi_fila]
	var extras_mios: Array = []
	var f_ex_mios: Array = []
	for i in mis.size():
		if mis_i.has(i):
			mios.append(mis[i])
			f_mios.append(mis_filas[i])
		else:
			extras_mios.append(mis[i])
			f_ex_mios.append(mis_filas[i])

	return {
		"kind": "regate",
		"name": "Recuperar el balón",
		"ball": ball,

		"target_z": TARGET_Z,



		"defenders": suyos,
		"teammates": mios,
		"extras_rivals": extras_suyos,
		"extras_mates": extras_mios,





		"recu_filas_rivals": f_suyos + f_ex_suyos,
		"recu_filas_mates": f_mios + f_ex_mios,
		"recupera": true,
	}




static func _tu_salida(ball: Vector2, rng: RandomNumberGenerator) -> Vector2:
	var lado: float = 1.0 if rng.randf() < 0.5 else -1.0



	var pasillo: float = maxf(TARGET_Z - ball.y, 0.0)
	var hueco: float = minf(rng.randf_range(GAP.x, GAP.y), pasillo * GAP_MAX_F)
	hueco = maxf(hueco, minf(GAP.x, pasillo * GAP_MAX_F))
	var z: float = clampf(ball.y + hueco, HALFWAY, Z_MAX)





	var t: float = clampf((z - ball.y) / maxf(TARGET_Z - ball.y, 0.01), 0.0, 1.0)
	var x_carril: float = lerpf(ball.x, 0.0, t)
	return Vector2(
		clampf(x_carril + lado * rng.randf_range(GAP_SIDE.x, GAP_SIDE.y),
			- EDGE_X, EDGE_X), z)























static func _bloque(forma: String, mio: bool, ball: Vector2, z0: float, z1: float,
		bascula: float) -> Array:
	var sitios: Array = ScenarioStore.formation_positions(forma, mio, ball,
		ALTURA_MIA if mio else ALTURA_SUYA, {}, TARGET_Z)
	if sitios.is_empty():
		return []
	var lo: float = INF
	var hi: float = - INF
	for p in sitios:
		lo = minf(lo,(p as Vector2).y)
		hi = maxf(hi,(p as Vector2).y)
	var largo: float = hi - lo
	var ventana: float = maxf(z1 - z0, 1.0)
	var k: float = 1.0 if largo <= 0.001 else minf(1.0, ventana / largo)
	var out: Array = []
	for p in sitios:
		var q: Vector2 = p
		out.append(Vector2(
			clampf(q.x + ball.x * bascula, - EDGE_X, EDGE_X),
			clampf(z0 +(q.y - lo) * k, HALFWAY, Z_MAX)))
	return out











static func _filas(forma: String, sin_punta: bool) -> Array:
	var rows: Array = ScenarioStore.FORMATION_ROWS.get(forma,
		ScenarioStore.FORMATION_ROWS["4-4-2"])
	var out: Array = []
	for r in rows.size():
		var n: int = int(rows[r])
		if sin_punta and r == rows.size() - 1:
			n -= 1
		var caja: int = 0 if r == 0 else (2 if r == rows.size() - 1 else 1)
		for _i in maxi(n, 0):
			out.append(caja)
	return out



static func _sitio_mas_cerca(sitios: Array, ref: Vector2) -> int:
	var mejor: int = -1
	var d2: float = INF
	for i in sitios.size():
		var d: float =(sitios[i] as Vector2).distance_squared_to(ref)
		if d < d2:
			d2 = d
			mejor = i
	return mejor





static func _cercanos(sitios: Array, ball: Vector2, n: int, z_min: float) -> Array:
	var delante: Array = []
	var detras: Array = []
	for i in sitios.size():
		var p: Vector2 = sitios[i]
		var par: Array = [p.distance_squared_to(ball), i]
		if p.y >= z_min:
			delante.append(par)
		else:
			detras.append(par)
	delante.sort_custom(func(a: Array, b: Array) -> bool: return a[0] < b[0])
	detras.sort_custom(func(a: Array, b: Array) -> bool: return a[0] < b[0])
	var out: Array = []
	for par in delante.slice(0, mini(n, delante.size())):
		out.append(int(par[1]))
	for par in detras.slice(0, maxi(n - out.size(), 0)):
		out.append(int(par[1]))
	return out









const ASIENTA_PASADAS: int = 12


























static func _asienta(sitios: Array, ball: Vector2, yo: Vector2) -> Array:
	var out: Array = sitios.duplicate()
	for _pass in ASIENTA_PASADAS:
		var movido: bool = false
		for i in out.size():
			var p: Vector2 = out[i]
			p = _empuja(p, ball, CORRO)
			p = _empuja(p, yo, CORRO_YO)
			for j in out.size():
				if j != i:
					p = _empuja(p, out[j], SEP_MIN)
			p = Vector2(clampf(p.x, - EDGE_X, EDGE_X), clampf(p.y, HALFWAY, Z_MAX))
			p = _rodea(p, yo, CORRO_YO)
			p = _rodea(p, ball, CORRO)
			if p.distance_squared_to(out[i]) > 1e-06:
				movido = true
			out[i] = p
		if not movido:
			break
	return out



static func _empuja(p: Vector2, q: Vector2, r: float) -> Vector2:
	var d: Vector2 = p - q
	var l: float = d.length()
	if l >= r:
		return p


	var dir: Vector2 = d / l if l > 0.001 else Vector2(1.0, 0.0)
	return q + dir * r





static func _rodea(p: Vector2, q: Vector2, r: float) -> Vector2:
	if p.distance_to(q) >= r:
		return p
	var dz: float = p.y - q.y
	var falta: float = sqrt(maxf(r * r - dz * dz, 0.0))
	var a: Vector2 = Vector2(clampf(q.x + falta, - EDGE_X, EDGE_X), p.y)
	var b: Vector2 = Vector2(clampf(q.x - falta, - EDGE_X, EDGE_X), p.y)
	if p.x >= q.x:
		return a if a.distance_to(q) >= r - 0.001 else b
	return b if b.distance_to(q) >= r - 0.001 else a




static func en_mi_mitad(p: Vector2) -> bool:
	return p.y >= HALFWAY and p.y <= TARGET_Z




static func goal_side(yo: Vector2, ball: Vector2) -> bool:
	return yo.y > ball.y







































const PACE_LIBRE: Vector2 = Vector2(0.96, 1.06)
const PACE_TAPADO: float = 0.84








const PACE_BANDA: Vector2 = Vector2(2.5, 6.0)




const ARRANCA_D: float = 3.0



const ARRANCA_T: float = 0.9
const ARRANCA_MULT: float = 1.1










const CONTIENE_AHEAD: float = 0.3










const TOQUE_F_MAX: float = 1.38





static func carry_speed(mi_spd: float, su_norm: float, cerca: float) -> float:
	var libre: float = lerpf(PACE_LIBRE.x, PACE_LIBRE.y, clampf(su_norm, 0.0, 1.0))
	var t: float = clampf((cerca - PACE_BANDA.x) /(PACE_BANDA.y - PACE_BANDA.x),
		0.0, 1.0)
	return mi_spd * lerpf(PACE_TAPADO, libre, t)




static func cerca_d(ball: Vector2, defs: Array) -> float:
	var cerca: Vector2 = _mas_cerca(ball, defs)
	return INF if is_inf(cerca.x) else ball.distance_to(cerca)





const EVADE_R: float = 6.0
const EVADE_W: float = 0.85




const ROBO_LADO: float = 0.62



const ROBO_CUERPO_R: float = 0.4












static func tapado(ball: Vector2, defs: Array) -> bool:
	var cerca: Vector2 = _mas_cerca(ball, defs)
	return not is_inf(cerca.x) and ball.distance_to(cerca) <= Duel.ENGAGE_R


static func _mas_cerca(ball: Vector2, defs: Array) -> Vector2:
	var mejor: Vector2 = Vector2(INF, INF)
	var d2: float = INF
	for p in defs:
		var q: Vector2 = p
		var e: float = q.distance_squared_to(ball)
		if e < d2:
			d2 = e
			mejor = q
	return mejor








static func roba(yo: Vector2, ball: Vector2, target_z: float,
		control: float, tackle: float = Duel.NEUTRAL_TACKLE,
		pie_portador: Vector2 = Vector2.INF) -> bool:
	if yo.distance_to(ball) > Duel.steal_radius(control, tackle):
		return false
	if pie_portador.is_finite():
		var entrada: Vector2 = ball - yo
		var cerca: Vector2 = yo
		if entrada.length_squared() > 0.0001:
			var t: float = clampf((pie_portador - yo).dot(entrada)
				/ entrada.length_squared(), 0.0, 1.0)
			cerca += entrada * t
		return cerca.distance_to(pie_portador) >= ROBO_CUERPO_R
	if yo.y <= ball.y:
		return false
	var al_arco: Vector2 = Vector2(0.0, target_z) - ball
	var hacia_ti: Vector2 = yo - ball
	if al_arco.length() < 0.01 or hacia_ti.length() < 0.01:
		return false
	return al_arco.normalized().dot(hacia_ti.normalized()) >= ROBO_LADO




static func llego(ball_z: float, target_z: float) -> bool:
	return ball_z >= target_z



static func label(why: String) -> String:
	match why:
		"robo":
			return I18n.t("RECUPERADA")
		"llego":
			return I18n.t("TE DESBORDÓ")
		"falta":


			return I18n.t("FALTA")
	return ""






















const GOLPE_ROZA: float = 0.45

const TIRO_R: float = 22.0


const TIRO_ANG: float = 0.72

const ARCO_HALF_W: float = 3.66


const TIRO_LLEGA: float = 14.0








const TIRO_ERROR_M: float = 6.0










const TIRO_ERROR_CENTRA: float = 1.2




























const COMBA_ACCEL: float = 4.0



const COMBA_REF_V: float = 24.0



const COMBA_MIN_V: float = 4.0



const COMBA_MAX: float = 1.0






const COMBA_P: float = 0.55












const COMBA_COMP: float = 0.8








const PRESION_R: float = 2.6


const TAPON_COS: float = 0.9
const TAPON_R: float = 4.5


static func presionado(ball: Vector2, defs: Array) -> bool:
	var cerca: Vector2 = _mas_cerca(ball, defs)
	return not is_inf(cerca.x) and ball.distance_to(cerca) <= PRESION_R




static func tiro_tapado(ball: Vector2, defs: Array, target_z: float) -> bool:
	var al_arco: Vector2 = Vector2(0.0, target_z) - ball
	if al_arco.length() < 0.01:
		return true
	var dir: Vector2 = al_arco.normalized()
	for p in defs:
		var q: Vector2 = p
		var v: Vector2 = q - ball
		var d: float = v.length()
		if d < 0.01 or d > TAPON_R:
			continue
		if v.normalized().dot(dir) >= TAPON_COS:
			return true
	return false










static func tiro_calidad(ball: Vector2, target_z: float, portero_x: float,
		tiro_r: float = TIRO_R) -> float:
	var al_arco: Vector2 = Vector2(0.0, target_z) - ball
	var d: float = al_arco.length()
	if d > tiro_r or d < 0.5:
		return 0.0

	var cerca: float = pow(1.0 - clampf(d / tiro_r, 0.0, 1.0), 0.75)

	var ang: float = clampf((absf(al_arco.normalized().y) - TIRO_ANG)
		/ maxf(1.0 - TIRO_ANG, 0.01), 0.0, 1.0)







	var x_ideal: float = clampf(ball.x * 0.35,
		- ScenarioStore.KEEPER_RANGE, ScenarioStore.KEEPER_RANGE)
	var hueco: float = clampf(absf(portero_x - x_ideal) /(ARCO_HALF_W * 2.0), 0.0, 1.0)
	return clampf(cerca * 0.55 + ang * 0.3 + hueco * 0.15, 0.0, 1.0)


































const TIRO_UMBRAL: float = 0.66
const TIRO_UMBRAL_PRESION: float = 0.42







static func quiere_tirar(ball: Vector2, defs: Array, target_z: float,
		portero_x: float, umbral_n: float = TIRO_UMBRAL,
		umbral_p: float = TIRO_UMBRAL_PRESION,
		tiro_r: float = TIRO_R) -> bool:
	if tiro_tapado(ball, defs, target_z):
		return false
	var umbral: float = umbral_p if presionado(ball, defs) else umbral_n
	return tiro_calidad(ball, target_z, portero_x, tiro_r) >= umbral




static func tiro_destino(ball: Vector2, target_z: float, portero_x: float,
		punteria: float, dado: float, presion: bool) -> Vector2:
	var d: float = ball.distance_to(Vector2(0.0, target_z))
	var lejos: float = clampf(d / TIRO_R, 0.25, 1.0)

	var lado: float = - signf(portero_x) if absf(portero_x) > 0.35 \
			else (1.0 if dado >= 0.5 else -1.0)










	var busca: float = lado * ARCO_HALF_W * lerpf(0.62, 0.92, clampf(punteria, 0.0, 1.0))















	var dado_err: float = fposmod(dado * 97.0 + 0.37, 1.0)






	var err: float =(dado_err * 2.0 - 1.0) * TIRO_ERROR_M * TIRO_ERROR_CENTRA \
			*(1.0 - clampf(punteria, 0.0, 1.0) * 0.7) * lejos \
			*(1.45 if presion else 1.0)
	return Vector2(clampf(busca + err, - ARCO_HALF_W * 2.2, ARCO_HALF_W * 2.2), target_z)



static func golpe_vel(d: float, llega: float = TIRO_LLEGA) -> float:
	return llega + GOLPE_ROZA * maxf(d, 0.0)





const TIRO_CANONAZO_D: float = 9.0

const TIRO_BOMBA_D: float = 18.0


static func tiro_vel(origen: Vector2, destino: Vector2, presion: bool = false,
		spin: float = 0.0) -> Vector2:
	var dir: Vector2 = destino - origen
	if dir.length() < 0.01:
		return Vector2(0.0, 1.0) * TIRO_LLEGA




	var llega: float = TIRO_LLEGA
	if presion:
		llega *= 0.88
	elif dir.length() < TIRO_CANONAZO_D:
		llega *= 1.12
	elif dir.length() > TIRO_BOMBA_D:



		llega *= 1.15
	var vel: Vector2 = dir.normalized() * golpe_vel(dir.length(), llega)





	if absf(spin) > 0.01:
		var deriva: float = comba_deriva(spin, vel.length(), dir.length()) * COMBA_COMP
		vel = vel.rotated(- signf(spin) * atan2(deriva, maxf(dir.length(), 0.5)))
	return vel















static func tiro_comba(ball: Vector2, rosca: float, presion: bool, dado: float,
		fuerza: float = 1.0) -> float:
	if presion:
		return 0.0
	var r: float = clampf(rosca, 0.0, 1.0)
	if dado >= COMBA_P * r:
		return 0.0
	var mag: float = COMBA_MAX *(0.25 + 0.75 * r) * clampf(fuerza, 0.0, 1.0)
	return mag *(1.0 if ball.x >= 0.0 else -1.0)







static func tiempo_a(d: float, v0: float) -> float:
	if d <= 0.0 or v0 <= 0.01:
		return 0.0
	if GOLPE_ROZA < 0.0001:
		return d / v0
	var queda: float = 1.0 - GOLPE_ROZA * d / v0
	if queda <= 0.001:
		return -1.0
	return - log(queda) / GOLPE_ROZA







static func comba_deriva(spin: float, v0: float, d: float) -> float:
	if absf(spin) < 0.01:
		return 0.0
	var t: float = tiempo_a(d, v0)
	if t <= 0.0:
		return 0.0
	var v_med: float = d / t
	if v_med < COMBA_MIN_V:
		return 0.0
	return 0.5 * absf(spin) * COMBA_ACCEL * minf(v_med / COMBA_REF_V, 1.0) * t * t




static func rueda_golpe(ball: Vector2, bvel: Vector2, dt: float,
		spin: float = 0.0) -> Array:
	if bvel.length_squared() < 1e-06:
		return [ball, Vector2.ZERO]
	var nvel: Vector2 = bvel * exp(- GOLPE_ROZA * dt)





	var v: float = nvel.length()
	if absf(spin) > 0.01 and v > COMBA_MIN_V:
		var d: Vector2 = nvel / v
		nvel += Vector2(- d.y, d.x) * spin * COMBA_ACCEL \
				* minf(v / COMBA_REF_V, 1.0) * dt
	return [ball + nvel * dt, nvel]



static func es_gol(x_en_linea: float) -> bool:
	return absf(x_en_linea) <= ARCO_HALF_W

















static func label_tiro(why: String) -> String:
	match why:
		"gol":
			return I18n.t("GOL EN CONTRA")
		"parada":
			return I18n.t("LA PARÓ TU PORTERO")
		"fuera":
			return I18n.t("LE DEJASTE TIRAR")
	return ""





















const DIR: float = 1.0


const ARCO: Vector2 = Vector2(0.0, TARGET_Z)


enum {
	ROL_PRESOR = 0,
	ROL_CONTIENE,
	ROL_MARCA,
	ROL_CARRIL,
	ROL_PINZA,
}












const REPARTO_T: float = 0.45



const CERCA_JUGADA_R: float = 30.0





const CENSO_ENTRA: float = 26.0
const CENSO_SALE: float = 34.0















const ENGANCHAN_EXTRA: int = 2

const ENGANCHAN_MIN: int = 3



static func enganchan_max(n_apoyos: int) -> int:
	return maxi(n_apoyos + ENGANCHAN_EXTRA, ENGANCHAN_MIN)









const JOCKEY_ENTRA: float = 11.0




const JOCKEY_LEE: float = 0.12








const JOCKEY_PACE: float = 0.92





static func quiere_jockey(dpos: Vector2, ball: Vector2, player: Vector2,
		read: float, pace: float) -> bool:
	return read >= JOCKEY_LEE and pace < JOCKEY_PACE \
			and (dpos.y - ball.y) * DIR > 0.3 \
			and not Duel.shows_ball(ball, player) \
			and dpos.distance_to(ball) < JOCKEY_ENTRA


const PRESOR_N: int = 1




const CARRIL_T: float = 0.62


const CARRIL_ADELANTA: float = 1.1





const MARCA_CIERRA: float = 0.45


const MARCA_CIERRA_COS: float = 0.15







const MARCA_MAX_D: float = 2.1






const PRESOR_HIST: float = 1.2
const MARCA_CONSERVA: float = 1.6


const CONTIENE_HIST: float = 1.6




const MARCA_LEAD_T: float = 0.45










static func reparte(defs: Array, ball: Vector2, apoyos: Array,
		engage: float = Duel.ENGAGE_R, prev_roles: Array = [],
		prev_marcas: Array = []) -> Array:
	var n: int = defs.size()
	var roles: Array[int] = []
	var marcas: Array[int] = []
	for _i in n:
		roles.append(ROL_MARCA)
		marcas.append(-1)
	if n == 0:
		return [roles, marcas]


	var hay_prev: bool = prev_roles.size() == n and prev_marcas.size() == n




	var presor: int = -1
	var mejor: float = INF
	for i in n:
		var d: float =(defs[i] as Vector2).distance_to(ball)
		if d < mejor:
			mejor = d
			presor = i
	if hay_prev:
		for i in n:
			if int(prev_roles[i]) == ROL_PRESOR and i != presor \
					and (defs[i] as Vector2).distance_to(ball) <= mejor + PRESOR_HIST:
				presor = i
				break
	if presor >= 0:
		roles[presor] = ROL_PRESOR






















	var cont: int = -1
	var cont_d: float = INF
	for i in n:
		if i == presor \
				or ((defs[i] as Vector2).y - ball.y) * DIR <= CONTIENE_AHEAD:
			continue
		var dc: float =(defs[i] as Vector2).distance_to(ball)
		if dc < cont_d:
			cont_d = dc
			cont = i
	if hay_prev:
		for i in n:
			if i != presor and int(prev_roles[i]) == ROL_CONTIENE \
					and ((defs[i] as Vector2).y - ball.y) * DIR > CONTIENE_AHEAD \
					and (defs[i] as Vector2).distance_to(ball) <= cont_d + CONTIENE_HIST:
				cont = i
				break
	if cont >= 0:
		roles[cont] = ROL_CONTIENE





	var tomados: Dictionary = {}
	if hay_prev:
		for i in n:
			if roles[i] != ROL_MARCA:
				continue
			var pj: int = int(prev_marcas[i])
			if int(prev_roles[i]) == ROL_MARCA and pj >= 0 and pj < apoyos.size() \
					and not tomados.has(pj) \
					and (defs[i] as Vector2).distance_to(apoyos[pj]) \
					<= MARCA_MAX_D * MARCA_CONSERVA:
				tomados[pj] = true
				marcas[i] = pj






	var pendientes: Array = []
	for j in apoyos.size():
		if not tomados.has(j):
			pendientes.append(j)
	while not pendientes.is_empty():
		var amenaza: int = 0
		var riesgo: float = - INF
		for k in pendientes.size():
			var peligro: float = _amenaza_apoyo(apoyos[int(pendientes[k])])
			if peligro > riesgo:
				riesgo = peligro
				amenaza = k
		var j: int = int(pendientes[amenaza])
		pendientes.remove_at(amenaza)
		var elegido: int = -1
		var distancia: float = INF
		for i in n:
			if roles[i] != ROL_MARCA or marcas[i] >= 0:
				continue
			var d: float =(defs[i] as Vector2).distance_to(apoyos[j])
			if d < distancia:
				distancia = d
				elegido = i
		if elegido < 0:
			break
		marcas[elegido] = j
		tomados[j] = true



	var hay_pinza: bool = false
	var canales: Array = []
	for i in n:
		if roles[i] != ROL_MARCA or marcas[i] >= 0:
			continue
		if not hay_pinza and Duel.can_pinch(defs[i], ball, DIR):
			roles[i] = ROL_PINZA
			hay_pinza = true
		else:
			roles[i] = ROL_CARRIL
			marcas[i] = mas_peligroso(apoyos, canales)
			if marcas[i] >= 0:
				canales.append(marcas[i])
	return [roles, marcas]




static func _amenaza_apoyo(apoyo: Vector2) -> float:
	return apoyo.y * DIR - absf(apoyo.x) * 0.45 - apoyo.distance_to(ARCO) * 0.2


static func mas_peligroso(apoyos: Array, excluidos: Array = []) -> int:
	var mejor: int = -1
	var mejor_p: float = - INF
	for j in apoyos.size():
		if excluidos.has(j):
			continue
		var p: float = _amenaza_apoyo(apoyos[j])
		if p > mejor_p:
			mejor_p = p
			mejor = j
	return mejor



static func carril_punto(ball: Vector2, apoyo: Vector2) -> Vector2:
	var p: Vector2 = ball.lerp(apoyo, CARRIL_T)
	var hacia: Vector2 = ARCO - p
	if hacia.length() > 0.01:
		p += hacia.normalized() * CARRIL_ADELANTA
	return p










static func marca_punto(apoyo: Vector2, run_dir: Vector2, ball: Vector2) -> Vector2:
	var base: Vector2 = Duel.cover_point(apoyo, run_dir, ARCO)
	var al_balon: Vector2 = ball - apoyo
	var al_arco: Vector2 = ARCO - apoyo
	if al_balon.length() < 0.01 or al_arco.length() < 0.01:
		return base


	var coseno: float = al_balon.normalized().dot(al_arco.normalized())
	var cierra: float = smoothstep(MARCA_CIERRA_COS, 0.65, coseno) * MARCA_CIERRA
	var p: Vector2 = base.lerp(carril_punto(ball, apoyo), cierra)

	var sep: Vector2 = p - apoyo
	if sep.length() > MARCA_MAX_D:
		p = apoyo + sep.normalized() * MARCA_MAX_D
	return p
















const CARGA_R: float = 1.7
const CARGA_CIERRE: float = 0.3
const CARGA_CD: float = 0.9


const CARGA_EMPUJE: float = 1.18



static func quiere_cargar(dpos: Vector2, dvel: Vector2, rival: Vector2,
		cd: float) -> bool:
	if cd > 0.0:
		return false
	var sep: Vector2 = rival - dpos
	var d: float = sep.length()
	if d > CARGA_R or d < 0.05:
		return false
	if dvel.length() < 0.4:
		return false
	if dvel.normalized().dot(sep.normalized()) < CARGA_CIERRE:
		return false


	return not Duel.is_foul_tackle(dpos, rival, Duel.NEUTRAL_TACKLE, DIR)


































const REGATE_RAYOS: int = 11




const REGATE_ABRE: float = 1.75
const REGATE_MIRA: float = 5.5
const REGATE_PELIGRO_R: float = 7.0
const REGATE_W_AVANCE: float = 1.0
const REGATE_W_PELIGRO: float = 1.45
const REGATE_W_INERCIA: float = 0.35


const REGATE_FUERA: float = 3.0




static func carry_steer(ball: Vector2, defs: Array, target_z: float,
		vel: Vector2 = Vector2.ZERO, w_avance: float = REGATE_W_AVANCE,
		w_peligro: float = REGATE_W_PELIGRO,
		w_inercia: float = REGATE_W_INERCIA) -> Vector2:
	var al_arco: Vector2 = Vector2(0.0, target_z) - ball
	if al_arco.length() < 0.01:
		return Vector2.ZERO
	var eje: Vector2 = al_arco.normalized()
	var base: float = eje.angle()
	var rumbo: Vector2 = vel.normalized() if vel.length() > 0.5 else eje
	var mejor: Vector2 = eje
	var mejor_p: float = - INF
	for i in REGATE_RAYOS:
		var t: float = -1.0 + 2.0 * float(i) / float(maxi(REGATE_RAYOS - 1, 1))
		var d: Vector2 = Vector2.from_angle(base + t * REGATE_ABRE)
		var p: float = _rumbo_puntua(ball, d, defs, target_z, rumbo,
			w_avance, w_peligro, w_inercia)
		if p > mejor_p:
			mejor_p = p
			mejor = d
	return mejor





static func _rumbo_puntua(ball: Vector2, d: Vector2, defs: Array, target_z: float,
		rumbo: Vector2, w_avance: float = REGATE_W_AVANCE,
		w_peligro: float = REGATE_W_PELIGRO,
		w_inercia: float = REGATE_W_INERCIA) -> float:
	var arco: Vector2 = Vector2(0.0, target_z)
	var fin: Vector2 = ball + d * REGATE_MIRA
	var medio: Vector2 = ball + d *(REGATE_MIRA * 0.5)
	var avance: float =(ball.distance_to(arco) - fin.distance_to(arco)) / REGATE_MIRA
	var peligro: float = maxf(_peligro(fin, defs), _peligro(medio, defs) * 0.8)
	var fuera: float = 0.0
	if absf(fin.x) > EDGE_X or fin.y > Z_MAX or fin.y < HALFWAY - 6.0:
		fuera = REGATE_FUERA
	return w_avance * avance - w_peligro * peligro \
			+ w_inercia * d.dot(rumbo) - fuera



static func _peligro(p: Vector2, defs: Array) -> float:
	var peor: float = 0.0
	for dd in defs:
		var d: float = p.distance_to(dd as Vector2)
		peor = maxf(peor, clampf(1.0 - d / REGATE_PELIGRO_R, 0.0, 1.0))
	return peor







enum {
	OFR_PIE = 0,
	OFR_RUPTURA,
	OFR_AMPLITUD,
}


const OFR_T: float = 0.6

const OFR_PIE_D: float = 8.5
const OFR_VALVULA_D: float = 6.5
const OFR_RUPTURA_D: float = 13.0
const OFR_ANCHO: float = 21.0

const OFR_ESCAPA: float = 3.2


const OFR_SEPARA: float = 5.5

const OFR_Z_MIN: float = HALFWAY - 4.0




static func reparte_apoyos(apoyos: Array, ball: Vector2) -> Array:
	var roles: Array = []
	var pie: int = -1
	var coste_pie: float = INF
	for i in apoyos.size():
		roles.append(OFR_RUPTURA)
		var p: Vector2 = apoyos[i]
		var coste: float = p.distance_to(ball) + maxf(p.y - ball.y, 0.0) * 0.35
		if coste < coste_pie:
			coste_pie = coste
			pie = i
	if pie < 0:
		return roles
	roles[pie] = OFR_PIE
	var abierto: int = -1
	var ancho: float = - INF
	for i in apoyos.size():
		if i == pie:
			continue
		var p: Vector2 = apoyos[i]
		var espacio: float = absf(p.x) + absf(p.x - ball.x) * 0.3
		if espacio > ancho:
			ancho = espacio
			abierto = i
	if abierto >= 0:
		roles[abierto] = OFR_AMPLITUD
	return roles





static func ofrece(i: int, apoyo: Vector2, ball: Vector2, target_z: float,
		defs: Array, linea: float = INF, apoyos: Array = [], destinos: Array = [],
		rol: int = -1) -> Array:
	if rol < 0:
		rol = i % 3
	var arco: Vector2 = Vector2(0.0, target_z)
	var hacia: Vector2 =(arco - ball).normalized() if (arco - ball).length() > 0.01 \
			else Vector2(0.0, 1.0)
	var p: Vector2 = apoyo
	var juntos: bool = apoyos.size() > 1
	var ancho: float = -1.0 if ball.x > 0.0 else 1.0


	var lado: float = signf(apoyo.x - ball.x) if absf(apoyo.x - ball.x) > 2.0 else - ancho
	if juntos and i < destinos.size():
		var antes: Vector2 = destinos[i]
		if absf(antes.x - ball.x) > 2.0:
			lado = signf(antes.x - ball.x)
	match rol:
		OFR_PIE:









			if presionado(ball, defs):
				p = ball - hacia * OFR_VALVULA_D + Vector2(lado * 5.0, 0.0)
			else:


				p = ball + hacia * 2.5 + Vector2(lado * OFR_PIE_D, 0.0)
		OFR_RUPTURA:
			p = ball + hacia * OFR_RUPTURA_D


			p.x = apoyo.x * 0.7 + ball.x * 0.3 if juntos \
					else p.x + signf(apoyo.x - ball.x) * 5.0
		_:
			var banda: float = signf(apoyo.x) if juntos and absf(apoyo.x) > 2.0 else ancho
			p = Vector2(banda * OFR_ANCHO, ball.y + hacia.y * 4.0)



	if Duel.covered(apoyo, defs):
		var m: Vector2 = _mas_cerca(apoyo, defs)
		if not is_inf(m.x):
			var lejos: Vector2 =(apoyo - m).normalized()
			p += Vector2(lejos.x, 0.0).normalized() * OFR_ESCAPA \
					if absf(lejos.x) > 0.01 else Vector2(OFR_ESCAPA, 0.0)
	p = _ofrece_limita(p, linea)


	var mejor: Vector2 = p
	var valor: float = - INF
	for dx in [0.0, - OFR_ESCAPA, OFR_ESCAPA, - OFR_ESCAPA * 2.0, OFR_ESCAPA * 2.0]:
		for dz in [0.0, -3.5, 3.5]:
			var candidato: Vector2 = _ofrece_limita(p + Vector2(float(dx), float(dz)), linea)
			var v: float = _ofrece_valor(i, candidato, p, apoyo, ball, defs, apoyos, destinos)
			if v > valor:
				valor = v
				mejor = candidato
	return [rol, mejor]




static func _ofrece_limita(p: Vector2, linea: float) -> Vector2:
	p.x = clampf(p.x, - EDGE_X, EDGE_X)
	p.y = clampf(p.y, OFR_Z_MIN, Z_MAX)
	if not is_inf(linea):
		p.y = minf(p.y, linea - OFFSIDE_HOLGURA)
	return p


static func _ofrece_valor(i: int, p: Vector2, base: Vector2, apoyo: Vector2,
		ball: Vector2, defs: Array, apoyos: Array, destinos: Array) -> float:
	var valor: float = - p.distance_to(base) * 0.24 - p.distance_to(apoyo) * 0.045


	valor += clampf(carril_margen(ball, p, defs), -2.0, 3.0) * 1.15
	valor -= maxf(0.0, 4.5 - p.distance_to(ball)) * 3.0
	for defensa in defs:
		valor -= maxf(0.0, 4.0 - p.distance_to(defensa as Vector2)) * 1.5
	for j in apoyos.size():
		if j == i:
			continue


		valor -= maxf(0.0, OFR_SEPARA - p.distance_to(apoyos[j])) * 0.75
		if j < destinos.size():
			valor -= maxf(0.0, OFR_SEPARA - p.distance_to(destinos[j])) * 2.3
	if i < destinos.size():
		valor -= p.distance_to(destinos[i]) * 0.055
	return valor











const PASE_MIN_D: float = 4.0
const PASE_MAX_D: float = 30.0
const PASE_CARRIL_W: float = 1.3
const PASE_VEL_MIN: float = 7.0
const PASE_VEL_MAX: float = 17.0



const PASE_LLEGA: float = 6.2









const PASE_UMBRAL: float = 0.45
const PASE_UMBRAL_PRESION: float = 0.26














const PASE_GANA_MIN: float = 1.5








const PASE_GANA_MIN_PRESION: float = -8.0





const PASE_ADELANTA: float = 6.0
const PASE_ANTICIPA_MAX: float = 1.25



const PASE_W_PELIGRO: float = 0.15


const PASE_RETHINK: float = 0.45







const PASE_CORTE_R: float = 0.85



const PASE_CORTE_R_DEF: float = 1.1






const PASE_SALE_D: float = 2.0

const PASE_CORTE_K: float = 0.35






static func rebote(bvel: Vector2, defensa: Vector2, ball: Vector2) -> Vector2:
	var fuera: Vector2 = ball - defensa
	if fuera.length() < 0.01:
		fuera = Vector2(0.0, - DIR)
	fuera = fuera.normalized()
	var atras: Vector2 =(Vector2(0.0, - DIR) + fuera * 0.7).normalized()
	return atras * maxf(bvel.length() * PASE_CORTE_K, 3.0)





static func carril_margen(ball: Vector2, destino: Vector2, defs: Array) -> float:
	var v: Vector2 = destino - ball
	var largo: float = v.length()
	if largo < 0.01:
		return -1.0
	var n: Vector2 = v / largo
	var peor: float = INF
	for dd in defs:
		var dv: Vector2 =(dd as Vector2) - ball
		var t: float = dv.dot(n)







		if t <= PASE_SALE_D or t >= largo - 0.3:
			continue
		peor = minf(peor, absf(dv.cross(n)))
	if is_inf(peor):
		return PASE_CARRIL_W * 2.0
	return peor - PASE_CARRIL_W







static func pase_destino(apoyo: Vector2, ap_vel: Vector2,
		ball: Vector2 = Vector2.INF) -> Vector2:
	if ap_vel.length_squared() < 0.0025:
		return apoyo




	var t: float = 0.75
	var carrera: Vector2 = ap_vel.limit_length(6.5)
	var p: Vector2 = apoyo
	for _vuelta in 4:
		if ball.is_finite():
			var vuelo: float = tiempo_a(ball.distance_to(p), pase_vel(ball, p).length())
			t = clampf(vuelo, 0.0, PASE_ANTICIPA_MAX) if vuelo >= 0.0 \
					else PASE_ANTICIPA_MAX
		p = apoyo +(carrera * t).limit_length(PASE_ADELANTA)
		p = Vector2(clampf(p.x, - EDGE_X, EDGE_X), clampf(p.y, 0.0, Z_MAX))
	return Vector2(clampf(p.x, - EDGE_X, EDGE_X), clampf(p.y, 0.0, Z_MAX))








static func _pase_seguridad(ball: Vector2, destino: Vector2, defs: Array,
		defs_vel: Array) -> float:
	if defs_vel.is_empty():
		return 1.0
	var largo: float = ball.distance_to(destino)
	if largo <= PASE_SALE_D + 1.0:
		return 1.0
	var bvel: Vector2 = pase_vel(ball, destino)
	var sale: float = tiempo_a(PASE_SALE_D, bvel.length())
	var llega: float = tiempo_a(largo - 0.8, bvel.length())
	if llega <= sale:
		return 1.0
	var seguridad: float = 1.0
	for i in mini(defs.size(), defs_vel.size()):
		var dv: Vector2 =(defs_vel[i] as Vector2).limit_length(6.5)
		if dv.length_squared() < 0.04:
			continue
		var defensor: Vector2 = defs[i]
		var previo: Vector2 = _balon_en(ball, bvel, sale) \
				-(defensor + dv * minf(sale, PASE_ANTICIPA_MAX))
		for paso in range(1, 9):
			var t: float = lerpf(sale, llega, float(paso) / 8.0)
			var relativo: Vector2 = _balon_en(ball, bvel, t) \
					-(defensor + dv * minf(t, PASE_ANTICIPA_MAX))
			var tramo: Vector2 = relativo - previo
			var fraccion: float = clampf(- previo.dot(tramo) \
					/ maxf(tramo.length_squared(), 0.0001), 0.0, 1.0)
			var distancia: float =(previo + tramo * fraccion).length()
			seguridad = minf(seguridad,
				clampf((distancia - PASE_CORTE_R_DEF) / 1.4, 0.0, 1.0))
			previo = relativo
	return seguridad






static func pase_calidad(ball: Vector2, apoyo: Vector2, defs: Array,
		target_z: float, ap_vel: Vector2 = Vector2.ZERO,
		gana_min: float = PASE_GANA_MIN, portero_x: float = 0.0,
		defs_vel: Array = []) -> float:
	var destino: Vector2 = pase_destino(apoyo, ap_vel, ball)
	var d: float = ball.distance_to(destino)
	if d < PASE_MIN_D or d > PASE_MAX_D:
		return 0.0
	var m: float = carril_margen(ball, destino, defs)
	if m <= 0.0:
		return 0.0
	var seguridad: float = _pase_seguridad(ball, destino, defs, defs_vel)
	if seguridad <= 0.05:
		return 0.0











	var metros: float = absf(target_z - ball.y) - absf(target_z - destino.y)
	var minimo: float = PASE_GANA_MIN_PRESION if presionado(ball, defs) else gana_min
	if metros < minimo:
		return 0.0
	var gana: float = clampf(metros / PASE_MAX_D, -1.0, 1.0)
	var carril: float = clampf(m /(PASE_CARRIL_W * 2.0), 0.0, 1.0)








	var libre: float = 0.2 if Duel.covered(apoyo, defs) \
			else (1.0 if Duel.free_mate(apoyo, defs) else 0.55)












	var peligro: float = tiro_calidad(destino, target_z, portero_x)
	return clampf(carril * 0.25 + clampf(gana * 2.0, 0.0, 1.0) * 0.5 + libre * 0.3
		+ peligro * PASE_W_PELIGRO, 0.0, 1.0) * lerpf(0.3, 1.0, seguridad)




static func mejor_pase(ball: Vector2, apoyos: Array, defs: Array,
		target_z: float, ap_vel: Array = [], umbral_n: float = PASE_UMBRAL,
		umbral_p: float = PASE_UMBRAL_PRESION,
		gana_min: float = PASE_GANA_MIN, portero_x: float = 0.0,
		defs_vel: Array = [], linea: float = INF) -> int:
	var umbral: float = umbral_p if presionado(ball, defs) else umbral_n
	var mejor: int = -1
	var mejor_q: float = umbral
	for i in apoyos.size():


		if not is_inf(linea) and en_fuera_de_juego(apoyos[i], linea):
			continue
		var v: Vector2 = ap_vel[i] if i < ap_vel.size() else Vector2.ZERO
		var q: float = pase_calidad(ball, apoyos[i], defs, target_z, v, gana_min,
			portero_x, defs_vel)
		if q > mejor_q:
			mejor_q = q
			mejor = i
	return mejor












const PASE_ERROR_M: float = 2.6





static func pase_con_error(ball: Vector2, destino: Vector2, dado: float,
		presion: bool, punteria: float = 0.5) -> Vector2:
	var v: Vector2 = destino - ball
	if v.length() < 0.01:
		return destino
	var lado: Vector2 = Vector2(- v.y, v.x).normalized()



	var desvio: float = clampf(dado, 0.0, 1.0) * 2.0 - 1.0
	var err: float = desvio * absf(desvio) * PASE_ERROR_M \
			*(1.0 - clampf(punteria, 0.0, 1.0) * 0.6) \
			* clampf(v.length() / PASE_MAX_D, 0.2, 1.0) *(1.5 if presion else 1.0)
	var p: Vector2 = destino + lado * err


	return Vector2(clampf(p.x, - EDGE_X, EDGE_X), clampf(p.y, 0.0, Z_MAX))




static func pase_vel(ball: Vector2, destino: Vector2) -> Vector2:
	var v: Vector2 = destino - ball
	var d: float = v.length()
	if d < 0.01:
		return Vector2.ZERO
	var u: float = golpe_vel(d, PASE_LLEGA)
	return v.normalized() * clampf(u, PASE_VEL_MIN, PASE_VEL_MAX)









static func corta(ball: Vector2, cuerpos: Array, r: float = PASE_CORTE_R,
		ball_prev: Vector2 = Vector2.INF) -> int:
	var seg: Vector2 = Vector2.ZERO
	var largo: float = 0.0
	if ball_prev.is_finite():
		seg = ball - ball_prev
		largo = seg.length()
	var mejor: int = -1
	var mejor_d: float = r
	for i in cuerpos.size():
		var c: Vector2 = cuerpos[i] as Vector2
		var d: float = ball.distance_to(c)
		if largo > 0.01:
			var t: float = clampf((c - ball_prev).dot(seg) /(largo * largo), 0.0, 1.0)
			d = minf(d, c.distance_to(ball_prev + seg * t))
		if d < mejor_d:
			mejor_d = d
			mejor = i
	return mejor



















const CITA_PASO: float = 0.05
const CITA_MAX_T: float = 2.6


static func cita(ball: Vector2, bvel: Vector2, cuerpo: Vector2, spd: float) -> Vector2:
	if spd < 0.1:
		return ball
	var t: float = 0.0
	while t <= CITA_MAX_T:
		var p: Vector2 = _balon_en(ball, bvel, t)
		if cuerpo.distance_to(p) <= spd * t:
			return p
		t += CITA_PASO


	return _balon_en(ball, bvel, CITA_MAX_T)




static func _balon_en(ball: Vector2, bvel: Vector2, t: float) -> Vector2:
	if GOLPE_ROZA < 0.0001:
		return ball + bvel * t
	return ball + bvel *((1.0 - exp(- GOLPE_ROZA * t)) / GOLPE_ROZA)








static func decide(ball: Vector2, defs: Array, apoyos: Array, target_z: float,
		portero_x: float, ap_vel: Array = []) -> Array:
	if quiere_tirar(ball, defs, target_z, portero_x):
		return ["tiro", -1]
	var i: int = mejor_pase(ball, apoyos, defs, target_z, ap_vel)
	if i >= 0:
		return ["pase", i]
	return ["conduce", -1]



































const BARRIDA_R: float = 2.5




const BARRIDA_MARGEN: float = 0.6





const BARRIDA_COS: float = 0.35


const BARRIDA_CD: float = 3.2







const BARRIDA_CD_YO: float = 2.4


const BARRIDA_T: float = 0.42
const BARRIDA_SUELO: float = 1.15

const BARRIDA_SPD: float = 1.6
const BARRIDA_FRENA: float = 2.4









































const BARRIDA_LARGO: Vector2 = Vector2(0.8, 1.2)








const BARRIDA_SURCO_W: Vector2 = Vector2(0.82, 1.22)












const BARRIDA_FALLA: Vector2 = Vector2(1.15, 1.7)






const BARRIDA_ROBA_P: Vector2 = Vector2(0.1, 0.25)





const BARRIDA_LEAD_T: float = 0.28






const ROBO_NPC_R: float = 0.35








static func barrida_largo(tackle: float) -> float:
	return lerpf(BARRIDA_LARGO.x, BARRIDA_LARGO.y, clampf(tackle, 0.0, 1.0))





static func barrida_surco_w(tackle: float) -> float:
	return lerpf(BARRIDA_SURCO_W.x, BARRIDA_SURCO_W.y, clampf(tackle, 0.0, 1.0))















static func barrida_alcance(spd: float, tackle: float = 0.5) -> float:
	return spd * BARRIDA_SPD * barrida_largo(tackle) * BARRIDA_T * 0.5










static func quiere_barrerse(dpos: Vector2, dvel: Vector2, ball: Vector2,
		cd: float, spd: float, tackle: float = 0.5) -> bool:
	if cd > 0.0:
		return false
	var sep: Vector2 = ball - dpos
	var d: float = sep.length()
	if d > minf(barrida_alcance(spd, tackle) + BARRIDA_MARGEN, BARRIDA_R) or d < 0.6:
		return false
	if dvel.length() < 1.2:
		return false
	return dvel.normalized().dot(sep.normalized()) >= BARRIDA_COS





static func barrida_dir(dpos: Vector2, dvel: Vector2, ball: Vector2,
		falla: float) -> Vector2:
	var sep: Vector2 = ball - dpos
	if sep.length() < 0.01:
		return Vector2(0.0, DIR)
	var n: Vector2 = sep.normalized()
	var lat: Vector2 = Vector2(- n.y, n.x)


	var lado: float = signf(lat.dot(dvel))
	if absf(lat.dot(dvel)) < 0.15:
		lado = signf(- ball.x) if absf(ball.x) > 0.5 else 1.0
	return (ball + lat * lado * falla - dpos).normalized()























const OFFSIDE_HOLGURA: float = 0.6



const LINEA_TOLERA: float = 2.5




static func linea_fuera_juego(mios: Array, portero_z: float, ball: Vector2) -> float:
	var zs: Array[float] = [portero_z]
	for m in mios:
		zs.append((m as Vector2).y)
	if zs.size() < 2:
		return TARGET_Z
	zs.sort()
	zs.reverse()


	return maxf(zs[1], ball.y)



static func en_fuera_de_juego(p: Vector2, linea: float) -> bool:
	return p.y > linea + 0.05
