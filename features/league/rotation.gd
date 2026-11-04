class_name Rotation
























const MAX: int = 100










const SUELO: float = 25.0












const PESO_FRESCURA: float = 72.0













































const EXP_FRESCURA: float = 2.0






const FACTOR_GRANDE: float = 0.5
























static func factor_frescura(peso_hoy: float, peso_prox: float, p_win: float) -> float:
	var tramite: float = clampf((p_win - ODDS_ROTA_DESDE)
		/ maxf(ODDS_ROTA_TOPE - ODDS_ROTA_DESDE, 0.001), 0.0, 1.0)
	var f: float = FACTOR_BASE - K_HOY * peso_hoy \
			+ K_PROX * maxf(0.0, peso_prox - peso_hoy) \
			+ K_TRAMITE * tramite
	return clampf(f, FACTOR_MIN, FACTOR_MAX)

























const CTX_NADA: float = -0.3
const CTX_EN_JUEGO: float = 0.15
const IDA_HOLGADA: int = 3
static func peso_en_contexto(peso: float, importancia: String, ventaja_ida: int) -> float:
	var w: float = peso
	if importancia == DescansoPactado.NADA \
			or (importancia == DescansoPactado.VUELTA and ventaja_ida >= IDA_HOLGADA):
		w += CTX_NADA
	elif importancia == DescansoPactado.EN_JUEGO:
		w += CTX_EN_JUEGO
	return clampf(w, 0.0, 1.0)















static func mult_guardar(peso_hoy: float, peso_prox: float, dias: float, dias_max: float,
		ganancia: float = 1.0) -> float:
	if peso_prox <= peso_hoy or dias > dias_max:
		return 1.0
	var base: float = factor_frescura(peso_hoy, peso_hoy, 0.0)
	if base <= 0.0:
		return 1.0
	var razon: float = factor_frescura(peso_hoy, peso_prox, 0.0) / base
	return maxf(1.0, 1.0 +(razon - 1.0) * ganancia)








const FACTOR_BASE: float = 1.3
const K_HOY: float = 1.0







const K_PROX: float = 0.6







const K_TRAMITE: float = 0.5
























const ODDS_ROTA_DESDE: float = 0.8
const ODDS_ROTA_TOPE: float = 0.89






const FACTOR_MIN: float = 0.35
const FACTOR_MAX: float = 2.0




static func energia(pm: Dictionary) -> int:
	return clampi(int(pm.get("energy", MAX)), 0, MAX)














const GASTO_90: float = 25.0
const GASTO_PISO: float = 0.3






















const REPONE_SEMANA: float = 0.45























const REPONE_DESCANSO: float = 0.75









const REPONE_RESERVA: float = 0.9






const DIAS_MIN: float = 2.0
const DIAS_MAX: float = 14.0
















const DIAS_DEFECTO: float = 7.0

static func dias_validos(dias: float) -> float:
	if dias < 0.0:
		return DIAS_DEFECTO
	return clampf(dias, DIAS_MIN, DIAS_MAX)



















static func tick(pm: Dictionary, minutos: int, dias: float = DIAS_DEFECTO,
		reserva: bool = false, gasto: float = 1.0, repone: float = 1.0) -> void:
	var e: float = float(energia(pm))
	var w: float = REPONE_RESERVA if reserva else REPONE_DESCANSO
	if minutos > 0:
		e -= GASTO_90 * maxf(float(minutos) / 90.0, GASTO_PISO) * gasto
		w = REPONE_SEMANA
	var d: float = clampf(dias, DIAS_MIN, DIAS_MAX)
	e +=(float(MAX) - e) *(1.0 - pow(1.0 - w, d / 7.0 * repone))




	if minutos <= 0 and float(MAX) - e < 1.0:
		e = float(MAX)
	pm["energy"] = clampi(int(round(e)), int(SUELO), MAX)







static func clava(pm: Dictionary) -> void:
	pm["energy"] = MAX





static func disponible(pm: Dictionary) -> bool:
	return int(pm.get("injury_weeks", 0)) <= 0 and int(pm.get("sancion", 0)) <= 0











static func nota(media: int, pm: Dictionary, factor: float = 1.0) -> float:
	var peso: float = PESO_FRESCURA * factor
	var d: float = 1.0 - float(energia(pm)) / 100.0
	return float(media) - peso * pow(d, EXP_FRESCURA)






















































static func lineup(squad: Array, meta: Array, slots: Array,
		factor: float = 1.0, fijos: Dictionary = {},
		excluye: Dictionary = {}, umbral: float = 0.0,
		habituales: Dictionary = {}) -> Array:
	var n: int = slots.size()
	if n <= 0:
		return []
	var tope: int = mini(squad.size(), meta.size())


	var clavado: Array[int] = []
	clavado.resize(n)
	clavado.fill(-1)
	var reservados: Dictionary = {}
	for k in fijos.keys():
		var kk: int = int(k)
		var ii: int = int(fijos[k])
		if kk < 0 or kk >= n or ii < 0 or ii >= tope:
			continue
		if reservados.has(ii) or clavado[kk] >= 0 or not disponible(meta[ii]):
			continue
		clavado[kk] = ii
		reservados[ii] = true



	var cand: Array[int] = []
	for i in tope:
		if not reservados.has(i) and not excluye.has(i) and disponible(meta[i]):
			cand.append(i)
	var libres: Array[int] = []
	for k in n:
		if clavado[k] < 0:
			libres.append(k)
	if cand.size() < libres.size():
		return []
	if not libres.is_empty():

		var coste: Array = []
		for f in libres.size():
			var pos: String = String(slots[libres[f]])
			var fila: Array[float] = []
			fila.resize(cand.size())
			for c in cand.size():
				var jer: float = JERARQUIA if habituales.has(cand[c]) else 0.0
				fila[c] = -(_celda(squad[cand[c]], meta[cand[c]], pos, factor, umbral) + jer)
			coste.append(fila)
		var asigna: Array = _hungaro(coste, libres.size(), cand.size())
		if asigna.size() != libres.size():
			return []
		for f in libres.size():
			var c: int = int(asigna[f])
			if c < 0:
				return []
			clavado[libres[f]] = cand[c]
	var once: Array = []
	for k in n:
		if clavado[k] < 0:
			return []
		once.append(clavado[k])
	return once



























const JERARQUIA: float = 4.0














static func _celda(p: Dictionary, pm: Dictionary, pos: String,
		factor: float, umbral: float = 0.0) -> float:
	var pena: float = CASTIGO_CANSADO if float(energia(pm)) < umbral else 0.0
	var e: float = encaje(p, pm, pos, factor)
	if e > - MURO:
		return e - pena
	var suyo: String = String(p.get("pos", "MC"))
	return nota(SquadMeta.media_of(p, suyo), pm, factor) - CASTIGO_APURO - pena







const CASTIGO_APURO: float = 500.0

















const CASTIGO_CANSADO: float = 200.0





const MURO: float = 1000000.0




















const CASTIGO_AFIN: float = 4.0
const CASTIGO_DECLARADO: float = 1.5





























static func encaje(p: Dictionary, pm: Dictionary, pos: String,
		factor: float = 1.0) -> float:
	var suyo: String = String(p.get("pos", "MC"))
	var castigo: float = 0.0
	if suyo != pos:
		if Squad.poss_of(p).has(pos):
			castigo = CASTIGO_DECLARADO
		else:











			return - MURO
	return nota(SquadMeta.media_of(p, pos), pm, factor) - castigo















static func mejor_para(squad: Array, meta: Array, pos: String,
		usados: Dictionary, factor: float) -> int:
	var mejor: int = -1
	var mejor_nota: float = - MURO
	for i in mini(squad.size(), meta.size()):
		if usados.has(i) or not disponible(meta[i]):
			continue
		var n: float = encaje(squad[i], meta[i], pos, factor)
		if n <= - MURO:
			continue
		if n > mejor_nota:
			mejor_nota = n
			mejor = i
	return mejor

























static func huecos_sin_puesto(squad: Array, meta: Array, slots: Array) -> int:
	var n: int = slots.size()
	if n <= 0:
		return 0
	var sabe: Array = []
	for i in mini(squad.size(), meta.size()):
		if disponible(meta[i]):
			sabe.append(_sabe_puestos(squad[i]))
	var ady: Array = []
	for f in n:
		var pos: String = String(slots[f])
		var lista: Array[int] = []
		for c in sabe.size():
			if (sabe[c] as Dictionary).has(pos):
				lista.append(c)
		ady.append(lista)
	var dueno: Array[int] = []
	dueno.resize(sabe.size())
	dueno.fill(-1)
	var cubiertos: int = 0
	for f in n:
		var visto: Array[bool] = []
		visto.resize(sabe.size())
		visto.fill(false)
		if _aumenta(f, ady, dueno, visto):
			cubiertos += 1
	return n - cubiertos









static func _sabe_puestos(p: Dictionary) -> Dictionary:
	var out: Dictionary = {String(p.get("pos", "MC")): true}
	for q in Squad.poss_of(p):
		out[String(q)] = true
	return out




static func _aumenta(f: int, ady: Array, dueno: Array[int], visto: Array[bool]) -> bool:
	for c in (ady[f] as Array):
		var k: int = int(c)
		if visto[k]:
			continue
		visto[k] = true
		if dueno[k] < 0 or _aumenta(dueno[k], ady, dueno, visto):
			dueno[k] = f
			return true
	return false












static func huecos_descubiertos(squad: Array, meta: Array, slots: Array) -> Array:
	var n: int = slots.size()
	if n <= 0:
		return []
	var cand: Array[int] = []
	for i in mini(squad.size(), meta.size()):
		if disponible(meta[i]):
			cand.append(i)
	var m: int = cand.size() + n


	var sabe: Array = []
	for c in cand.size():
		sabe.append(_sabe_puestos(squad[cand[c]]))
	var coste: Array = []
	for f in n:
		var pos: String = String(slots[f])
		var fila: Array[float] = []
		fila.resize(m)
		for c in cand.size():
			fila[c] = 0.0 if (sabe[c] as Dictionary).has(pos) else 1.5
		for c in range(cand.size(), m):
			fila[c] = 1.0 if c - cand.size() == f else 1000000000.0
		coste.append(fila)
	var asigna: Array = _hungaro(coste, n, m)
	var out: Array = []
	for f in n:
		var c: int = int(asigna[f]) if f < asigna.size() else -1
		if c < 0 or c >= cand.size() or float((coste[f] as Array)[c]) > 0.0:
			out.append(String(slots[f]))
	return out














static func _hungaro(a: Array, n: int, m: int) -> Array:
	var inf: float = 1e+18
	var u: Array[float] = []
	u.resize(n + 1)
	u.fill(0.0)
	var v: Array[float] = []
	v.resize(m + 1)
	v.fill(0.0)


	var p: Array[int] = []
	p.resize(m + 1)
	p.fill(0)
	var way: Array[int] = []
	way.resize(m + 1)
	way.fill(0)
	for i in range(1, n + 1):
		p[0] = i
		var j0: int = 0
		var minv: Array[float] = []
		minv.resize(m + 1)
		minv.fill(inf)
		var used: Array[bool] = []
		used.resize(m + 1)
		used.fill(false)
		while true:
			used[j0] = true
			var i0: int = p[j0]
			var delta: float = inf
			var j1: int = 0
			for j in range(1, m + 1):
				if used[j]:
					continue
				var cur: float = float((a[i0 - 1] as Array)[j - 1]) - u[i0] - v[j]
				if cur < minv[j]:
					minv[j] = cur
					way[j] = j0
				if minv[j] < delta:
					delta = minv[j]
					j1 = j


			if j1 == 0:
				return []
			for j in range(0, m + 1):
				if used[j]:
					u[p[j]] += delta
					v[j] -= delta
				else:
					minv[j] -= delta
			j0 = j1
			if p[j0] == 0:
				break
		while j0 != 0:
			var j2: int = way[j0]
			p[j0] = p[j2]
			j0 = j2
	var out: Array[int] = []
	out.resize(n)
	out.fill(-1)
	for j in range(1, m + 1):
		if p[j] > 0:
			out[p[j] - 1] = j - 1
	return out





































































static func bench(squad: Array, meta: Array, once: Array, n: int,
		factor: float = 1.0, slots: Array = [], umbral: float = 0.0) -> Array:
	factor = maxf(factor, 1.0)
	var fuera: Dictionary = {}
	for i in once:
		fuera[int(i)] = true
	if not slots.is_empty():
		var por_hueco: Array = lineup(squad, meta,
			slots.slice(0, mini(n, slots.size())), factor, {}, fuera, umbral)
		if not por_hueco.is_empty():


			por_hueco.sort_custom(func(a: int, b: int) -> bool:
				var na: float = nota(SquadMeta.media_of(squad[a],
					String((squad[a] as Dictionary).get("pos", "MC"))), meta[a], factor)
				var nb: float = nota(SquadMeta.media_of(squad[b],
					String((squad[b] as Dictionary).get("pos", "MC"))), meta[b], factor)
				if not is_equal_approx(na, nb):
					return na > nb
				return a < b)
			return por_hueco
	var cand: Array = []
	for i in mini(squad.size(), meta.size()):
		if fuera.has(i) or not disponible(meta[i]):
			continue
		var pos: String = String((squad[i] as Dictionary).get("pos", "MC"))
		var pena: float = CASTIGO_CANSADO if float(energia(meta[i])) < umbral else 0.0
		cand.append([nota(SquadMeta.media_of(squad[i], pos), meta[i], factor) - pena, i])


	cand.sort_custom(func(a: Array, b: Array) -> bool:
		if a[0] != b[0]:
			return a[0] > b[0]
		return int(a[1]) < int(b[1]))
	var out: Array = []
	for k in mini(n, cand.size()):
		out.append(int(cand[k][1]))
	return out
