class_name Billar
































const LARGO: float = 2.24
const ANCHO: float = 1.12
const BOLA_R: float = 0.0285




const TRONERA_R: float = 0.058




const ROCE: float = 0.62


const PARADA: float = 0.035




const BANDA_REST: float = 0.72
const BOLA_REST: float = 0.94



const GOLPE_MIN: float = 0.55
const GOLPE_MAX: float = 4.6





const SUB_DT: float = 1.0 / 240.0


const SUB_MAX: int = 40




const TIRO_MAX_SEG: float = 22.0





static func troneras() -> Array:
	var hx: float = LARGO * 0.5
	var hy: float = ANCHO * 0.5
	return [
		Vector2(- hx, - hy), Vector2(0.0, - hy), Vector2(hx, - hy),
		Vector2(- hx, hy), Vector2(0.0, hy), Vector2(hx, hy),
	]








const BLANCA: int = 0
const NEGRA: int = 8
const GRUPO_NINGUNO: int = 0
const GRUPO_LISAS: int = 1
const GRUPO_RAYADAS: int = 2



static func grupo_de(n: int) -> int:
	if n >= 1 and n <= 7:
		return GRUPO_LISAS
	if n >= 9 and n <= 15:
		return GRUPO_RAYADAS
	return GRUPO_NINGUNO









static func saque(rng: RandomNumberGenerator) -> Array:
	var bolas: Array = [{"n": BLANCA, "p": Vector2(- LARGO * 0.25, 0.0),
		"v": Vector2.ZERO, "viva": true}]



	var lisas: Array = [1, 2, 3, 4, 5, 6, 7]
	var rayas: Array = [9, 10, 11, 12, 13, 14, 15]



	_barajar(lisas, rng)
	_barajar(rayas, rng)
	var orden: Array = []
	var li: int = 0
	var ra: int = 0
	for i in 15:
		if i == 4:
			orden.append(NEGRA)
		elif i % 2 == 0:
			orden.append(lisas[li] if li < lisas.size() else rayas[ra])
			li += 1
		else:
			orden.append(rayas[ra] if ra < rayas.size() else lisas[li])
			ra += 1



	if grupo_de(int(orden[10])) == grupo_de(int(orden[14])):
		var tmp: int = int(orden[14])
		orden[14] = int(orden[11])
		orden[11] = tmp
	var paso: float = BOLA_R * 2.0 + 0.002
	var cab: Vector2 = Vector2(LARGO * 0.25, 0.0)
	var i2: int = 0
	for fila in 5:
		for col in (fila + 1):
			var p: Vector2 = cab + Vector2(float(fila) * paso * 0.866,
				(float(col) - float(fila) * 0.5) * paso)
			bolas.append({"n": int(orden[i2]), "p": p, "v": Vector2.ZERO,
				"viva": true})
			i2 += 1
	return bolas


static func _barajar(a: Array, rng: RandomNumberGenerator) -> void:
	for i in range(a.size() - 1, 0, -1):
		var j: int = rng.randi_range(0, i)
		var t: Variant = a[i]
		a[i] = a[j]
		a[j] = t





static func bola(bolas: Array, n: int) -> Dictionary:
	for b in bolas:
		if int((b as Dictionary)["n"]) == n:
			return b
	return {}



static func vivas_de(bolas: Array, grupo: int) -> Array:
	var out: Array = []
	for b in bolas:
		var d: Dictionary = b
		if bool(d["viva"]) and grupo_de(int(d["n"])) == grupo:
			out.append(d)
	return out



static func quieta(bolas: Array) -> bool:
	for b in bolas:
		var d: Dictionary = b
		if bool(d["viva"]) and (d["v"] as Vector2).length_squared() > 0.0:
			return false
	return true









static func nuevo_tiro() -> Dictionary:
	return {"primer": -1, "metidas": [], "blanca_dentro": false, "t": 0.0}




static func golpe(bolas: Array, dir: Vector2, fuerza: float) -> void:
	var b: Dictionary = bola(bolas, BLANCA)
	if b.is_empty() or not bool(b["viva"]):
		return
	var d: Vector2 = dir.normalized()
	if d == Vector2.ZERO:
		return
	b["v"] = d * lerpf(GOLPE_MIN, GOLPE_MAX, clampf(fuerza, 0.0, 1.0))






static func avanza(bolas: Array, tiro: Dictionary, delta: float) -> bool:
	var pasos: int = mini(int(ceilf(delta / SUB_DT)), SUB_MAX)
	for _i in pasos:
		_sub_paso(bolas, tiro, SUB_DT)
		tiro["t"] = float(tiro["t"]) + SUB_DT
		if quieta(bolas):
			return true
	return quieta(bolas)





static func _sub_paso(bolas: Array, tiro: Dictionary, dt: float) -> void:
	var roce: float = pow(ROCE, dt)
	for b in bolas:
		var d: Dictionary = b
		if not bool(d["viva"]):
			continue
		var v: Vector2 = d["v"]
		if v == Vector2.ZERO:
			continue
		v *= roce
		if v.length() < PARADA:
			v = Vector2.ZERO
		d["v"] = v
		d["p"] =(d["p"] as Vector2) + v * dt
	_troneras(bolas, tiro)
	_bandas(bolas)
	_choques(bolas, tiro)


static func _troneras(bolas: Array, tiro: Dictionary) -> void:
	var ts: Array = troneras()
	for b in bolas:
		var d: Dictionary = b
		if not bool(d["viva"]):
			continue
		var p: Vector2 = d["p"]
		for t in ts:
			if p.distance_to(t) > TRONERA_R:
				continue
			d["viva"] = false
			d["v"] = Vector2.ZERO
			if int(d["n"]) == BLANCA:
				tiro["blanca_dentro"] = true
			else:
				(tiro["metidas"] as Array).append(int(d["n"]))
			break





static func _bandas(bolas: Array) -> void:
	var hx: float = LARGO * 0.5 - BOLA_R
	var hy: float = ANCHO * 0.5 - BOLA_R
	for b in bolas:
		var d: Dictionary = b
		if not bool(d["viva"]):
			continue
		var p: Vector2 = d["p"]
		var v: Vector2 = d["v"]
		if p.x < - hx:
			p.x = - hx
			v.x = absf(v.x) * BANDA_REST
		elif p.x > hx:
			p.x = hx
			v.x = - absf(v.x) * BANDA_REST
		if p.y < - hy:
			p.y = - hy
			v.y = absf(v.y) * BANDA_REST
		elif p.y > hy:
			p.y = hy
			v.y = - absf(v.y) * BANDA_REST
		d["p"] = p
		d["v"] = v





static func _choques(bolas: Array, tiro: Dictionary) -> void:
	var n: int = bolas.size()
	for i in n:
		var a: Dictionary = bolas[i]
		if not bool(a["viva"]):
			continue
		for j in range(i + 1, n):
			var b: Dictionary = bolas[j]
			if not bool(b["viva"]):
				continue
			var pa: Vector2 = a["p"]
			var pb: Vector2 = b["p"]
			var delta: Vector2 = pb - pa
			var dist: float = delta.length()
			if dist >= BOLA_R * 2.0 or dist <= 0.0:
				continue
			var nrm: Vector2 = delta / dist


			var solape: float = BOLA_R * 2.0 - dist
			a["p"] = pa - nrm *(solape * 0.5)
			b["p"] = pb + nrm *(solape * 0.5)
			var va: Vector2 = a["v"]
			var vb: Vector2 = b["v"]
			var rel: float =(vb - va).dot(nrm)

			if rel > 0.0:
				continue
			var imp: Vector2 = nrm * rel * BOLA_REST
			a["v"] = va + imp
			b["v"] = vb - imp


			if int(tiro["primer"]) < 0:
				if int(a["n"]) == BLANCA:
					tiro["primer"] = int(b["n"])
				elif int(b["n"]) == BLANCA:
					tiro["primer"] = int(a["n"])




static func simula(bolas: Array, dir: Vector2, fuerza: float) -> Dictionary:
	var tiro: Dictionary = nuevo_tiro()
	golpe(bolas, dir, fuerza)
	var t: float = 0.0
	while t < TIRO_MAX_SEG:
		_sub_paso(bolas, tiro, SUB_DT)
		t += SUB_DT
		if quieta(bolas):
			break
	tiro["t"] = t
	return tiro















static func veredicto(bolas: Array, tiro: Dictionary, mi_grupo: int,
		rival_grupo: int) -> Dictionary:
	var metidas: Array = tiro["metidas"]
	var primer: int = int(tiro["primer"])
	var blanca_dentro: bool = bool(tiro["blanca_dentro"])
	var out: Dictionary = {"grupo": mi_grupo, "sigo": false, "falta": false,
		"gana": false, "pierde": false}
	var negra_dentro: bool = metidas.has(NEGRA)



	if negra_dentro:
		var me_quedaban: int = vivas_de(bolas, mi_grupo).size() if mi_grupo != GRUPO_NINGUNO else 1



		if mi_grupo != GRUPO_NINGUNO and me_quedaban == 0 and not blanca_dentro:
			out["gana"] = true
		else:
			out["pierde"] = true
		return out


	var falta: bool = blanca_dentro
	if primer < 0:


		falta = true
	elif primer == NEGRA and mi_grupo != GRUPO_NINGUNO:
		falta = true
	elif mi_grupo != GRUPO_NINGUNO and grupo_de(primer) != mi_grupo:
		falta = true



	var mias: int = 0
	var suyas: int = 0
	if mi_grupo == GRUPO_NINGUNO and not falta:
		var l: int = 0
		var r: int = 0
		for m in metidas:
			if grupo_de(int(m)) == GRUPO_LISAS:
				l += 1
			elif grupo_de(int(m)) == GRUPO_RAYADAS:
				r += 1
		if l > 0 and r == 0:
			out["grupo"] = GRUPO_LISAS
		elif r > 0 and l == 0:
			out["grupo"] = GRUPO_RAYADAS
		mias = l + r
	else:
		for m in metidas:
			if grupo_de(int(m)) == mi_grupo:
				mias += 1
			elif rival_grupo != GRUPO_NINGUNO and grupo_de(int(m)) == rival_grupo:
				suyas += 1
	out["falta"] = falta



	out["sigo"] =(not falta) and mias > 0
	return out








static func mano(bolas: Array, rng: RandomNumberGenerator) -> Vector2:
	var base: Vector2 = Vector2(- LARGO * 0.25, 0.0)
	for i in 60:


		var rad: float = float(i) * 0.012
		var ang: float = float(i) * 2.4
		var p: Vector2 = base + Vector2(cos(ang), sin(ang)) * rad
		p.x = clampf(p.x, - LARGO * 0.5 + BOLA_R * 2.0, LARGO * 0.5 - BOLA_R * 2.0)
		p.y = clampf(p.y, - ANCHO * 0.5 + BOLA_R * 2.0, ANCHO * 0.5 - BOLA_R * 2.0)
		var libre: bool = true
		for b in bolas:
			var d: Dictionary = b
			if not bool(d["viva"]) or int(d["n"]) == BLANCA:
				continue
			if (d["p"] as Vector2).distance_to(p) < BOLA_R * 2.4:
				libre = false
				break
		if libre:
			return p

	return base + Vector2(rng.randf_range(-0.02, 0.02), 0.0)













const RIVALES: Array = [
	{"id": "utilero", "name": "EL UTILERO", "hab": 0.3, "dif": "FACIL"},
	{"id": "companero", "name": "UN COMPAÑERO", "hab": 0.58, "dif": "MEDIO"},
	{"id": "capitan", "name": "EL CAPITAN", "hab": 0.85, "dif": "DIFICIL"},
]















const ERROR_MALO: float = 0.085
const ERROR_BUENO: float = 0.005


static func rival_by_id(id: String) -> Dictionary:
	for r in RIVALES:
		if String(r["id"]) == id:
			return r
	return {}













static func apunta_ia(bolas: Array, grupo: int, hab: float,
		rng: RandomNumberGenerator) -> Dictionary:
	var blanca: Dictionary = bola(bolas, BLANCA)
	if blanca.is_empty():
		return {"dir": Vector2.RIGHT, "fuerza": 0.5}
	var cue: Vector2 = blanca["p"]


	var objetivo: Array = []
	if grupo == GRUPO_NINGUNO:
		objetivo = vivas_de(bolas, GRUPO_LISAS) + vivas_de(bolas, GRUPO_RAYADAS)
	else:
		objetivo = vivas_de(bolas, grupo)
		if objetivo.is_empty():
			var n8: Dictionary = bola(bolas, NEGRA)
			if not n8.is_empty() and bool(n8["viva"]):
				objetivo = [n8]
	var mejor: Dictionary = {}
	var mejor_val: float = -1.0
	for b in objetivo:
		var bp: Vector2 =(b as Dictionary)["p"]
		for t in troneras():
			var a_tronera: Vector2 = t - bp
			var d_bt: float = a_tronera.length()
			if d_bt <= 0.001:
				continue
			var u: Vector2 = a_tronera / d_bt
			var fantasma: Vector2 = bp - u *(BOLA_R * 2.0)
			var a_fant: Vector2 = fantasma - cue
			var d_cf: float = a_fant.length()
			if d_cf <= 0.001:
				continue
			var corte: float =(a_fant / d_cf).dot(u)


			if corte < 0.26:
				continue
			if not _libre(bolas, cue, fantasma, int((b as Dictionary)["n"])) \
					or not _libre(bolas, bp, t, int((b as Dictionary)["n"])):
				continue


			var val: float =(corte * corte) /(0.35 + d_cf * 0.5 + d_bt)
			if val > mejor_val:
				mejor_val = val
				mejor = {"fantasma": fantasma, "d": d_cf + d_bt}
	if mejor.is_empty():



		var cerca: Dictionary = {}
		var cd: float = 1000000000.0
		for b in objetivo:
			var dd: float =((b as Dictionary)["p"] as Vector2).distance_to(cue)
			if dd < cd:
				cd = dd
				cerca = b
		if cerca.is_empty():
			return {"dir": Vector2.RIGHT, "fuerza": 0.35}
		var dir_s: Vector2 =((cerca["p"] as Vector2) - cue).normalized()
		return {"dir": dir_s, "fuerza": 0.3}
	var dir: Vector2 =((mejor["fantasma"] as Vector2) - cue).normalized()
	var err: float = lerpf(ERROR_MALO, ERROR_BUENO, clampf(hab, 0.0, 1.0))
	dir = dir.rotated(rng.randf_range(- err, err))



	var fuerza: float = clampf(0.28 + float(mejor["d"]) * 0.2, 0.25, 0.85)
	return {"dir": dir, "fuerza": fuerza}






static func _libre(bolas: Array, a: Vector2, b: Vector2, salvo: int) -> bool:
	var ab: Vector2 = b - a
	var largo2: float = ab.length_squared()
	if largo2 <= 0.0:
		return true
	for x in bolas:
		var d: Dictionary = x
		if not bool(d["viva"]):
			continue
		var n: int = int(d["n"])
		if n == salvo or n == BLANCA:
			continue
		var p: Vector2 = d["p"]
		var k: float = clampf((p - a).dot(ab) / largo2, 0.0, 1.0)
		if p.distance_to(a + ab * k) < BOLA_R * 2.0:
			return false
	return true







const RETO_QUIMICA: float = 3.0
const RETO_PALIZA: int = 4



static func reto_quimica(gane: bool, restantes: int) -> float:
	if not gane:
		return 0.0
	return RETO_QUIMICA *(2.0 if restantes >= RETO_PALIZA else 1.0)
