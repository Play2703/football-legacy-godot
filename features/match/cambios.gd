class_name Cambios




























const CUPO: int = 3







const VENTANA: Array[int] = [65, 73, 81]





const ENERGIA_MIN_DEFECTO: float = 45.0






const FACTOR_CAMBIO: float = 1.0



const MARGEN_FATIGA: float = 10.0



const REFRESCOS: int = 2



















const PIERNAS_SEGUNDO_P: float = 0.5







const RUIDO_CAMBIO: float = 6.0




const PESO_TRAMO: float = 1000.0






static func exceso_de_carga(carga_hoy: int, carga_prev: int) -> int:
	return 2 * maxi(carga_hoy - 1, 0) + maxi(carga_prev - 1, 0)







static func piernas_sin_libro(carga_hoy: int, carga_prev: int, dado_semana: float) -> int:
	var exceso: int = exceso_de_carga(carga_hoy, carga_prev)
	if exceso >= 3:
		return CUPO
	if exceso >= 1:
		return mini(2, CUPO)
	return 2 if dado_semana < PIERNAS_SEGUNDO_P else 1





static func dado(team_id: String, semilla: int, clave: Variant) -> float:
	return float(absi(hash([team_id, semilla, clave])) % 1000) / 1000.0














static func plan(squad: Array, meta: Array, once: Array, banca: Array,
		factor: float, veta: Dictionary,
		energia_min: float = ENERGIA_MIN_DEFECTO, huecos: Dictionary = {}) -> Array:
	var out: Array = []
	if once.is_empty() or banca.is_empty():
		return out












	var cand: Array = []
	for i in once:
		var idx: int = int(i)
		if veta.has(idx) or idx >= meta.size() or idx >= squad.size():
			continue







		if String((squad[idx] as Dictionary).get("pos", "")) == "POR":
			continue
		var e: float = float(Rotation.energia(meta[idx]))
		var proyectada: float = e - Rotation.GASTO_90
		var fundido: bool = e < energia_min - MARGEN_FATIGA
		if fundido:
			cand.append([proyectada, idx, "fatiga"])
			continue

		if factor < FACTOR_CAMBIO or proyectada >= energia_min:
			continue
		cand.append([proyectada, idx, "carga"])
	if cand.is_empty():
		return out



	cand.sort_custom(func(a: Array, b: Array) -> bool:
		if not is_equal_approx(a[0], b[0]):
			return a[0] < b[0]
		return int(a[1]) < int(b[1]))

	var usados: Dictionary = {}




	for k in cand.size():
		if out.size() >= CUPO:
			break
		var sale: int = int(cand[k][1])
		var pos: String = puesto_de(squad, sale, huecos)





		var entra: int = _mejor_de(squad, meta, pos, banca, usados,
			piso_de_entrada(meta, sale, energia_min), veta)
		var natural: String = String((squad[sale] as Dictionary).get("pos", "MC"))
		if entra < 0 and natural != pos:
			entra = _mejor_de(squad, meta, natural, banca, usados,
				piso_de_entrada(meta, sale, energia_min), veta)
		if entra < 0:
			continue
		usados[entra] = true
		out.append({"sale": sale, "entra": entra,
			"minuto": int(VENTANA[mini(out.size(), VENTANA.size() - 1)]),
			"motivo": String(cand[k][2])})
	return out















static func piso_de_entrada(meta: Array, sale: int, energia_min: float) -> float:
	var e_sale: float = float(Rotation.energia(meta[sale])) \
			if sale >= 0 and sale < meta.size() else 0.0
	return maxf(energia_min, e_sale)





static func _mejor_de(squad: Array, meta: Array, pos: String,
		banca: Array, usados: Dictionary, piso: float = 0.0, veta: Dictionary = {}) -> int:
	var mejor: int = -1
	var mejor_nota: float = - Rotation.MURO
	for i in banca:
		var idx: int = int(i)
		if usados.has(idx) or veta.has(idx) or idx >= squad.size() or idx >= meta.size():
			continue
		if not Rotation.disponible(meta[idx]):
			continue
		if float(Rotation.energia(meta[idx])) < piso:
			continue
		var n: float = Rotation.encaje(squad[idx], meta[idx], pos, 1.0)
		if n <= - Rotation.MURO:
			continue
		if n > mejor_nota:
			mejor_nota = n
			mejor = idx
	return mejor




















static func plan_por_nivel(squad: Array, meta: Array, once: Array, banca: Array,
		veta: Dictionary, energia_min: float = ENERGIA_MIN_DEFECTO,
		huecos: Dictionary = {}) -> Array:
	var cand: Array = []
	for seat in once:
		var i: int = int(seat)
		if veta.has(i) or i < 0 or i >= squad.size():
			continue
		var p: Dictionary = squad[i]
		if String(p.get("pos", "MC")) == "POR":
			continue
		var e: float = float(Rotation.energia(meta[i])) if i < meta.size() \
				else float(Rotation.MAX)
		cand.append([e, float(p.get("_lvl", 0.0)), i])
	cand.sort_custom(func(a: Array, b: Array) -> bool:
		if not is_equal_approx(a[0], b[0]):
			return a[0] < b[0]
		if not is_equal_approx(a[1], b[1]):
			return a[1] < b[1]
		return int(a[2]) < int(b[2]))
	var out: Array = []
	var usados: Dictionary = {}




	for k in cand.size():
		if out.size() >= REFRESCOS:
			break
		var sale: int = int(cand[k][2])
		var pos: String = puesto_de(squad, sale, huecos)
		var piso: float = piso_de_entrada(meta, sale, energia_min)








		var entra: int = -1
		var mejor: float = - Rotation.MURO
		for objetivo in _objetivos(squad, sale, pos):
			if entra >= 0:
				break
			for seat in banca:
				var j: int = int(seat)
				if usados.has(j) or veta.has(j) or j < 0 or j >= squad.size():
					continue
				var q: Dictionary = squad[j]
				var pm: Dictionary = meta[j] if j < meta.size() else {}
				if j < meta.size() and (not Rotation.disponible(meta[j])
						or float(Rotation.energia(meta[j])) < piso):
					continue
				var n: float = Rotation.encaje(q, pm, String(objetivo), 1.0)
				if n <= - Rotation.MURO:
					continue
				if n > mejor:
					mejor = n
					entra = j
		if entra < 0:
			continue
		usados[entra] = true
		out.append({"sale": sale, "entra": entra, "motivo": "refresco",
			"minuto": int(VENTANA[mini(out.size(), VENTANA.size() - 1)])})
	return out









static func puesto_de(squad: Array, i: int, huecos: Dictionary) -> String:
	var p: Dictionary = squad[i]
	var natural: String = String(p.get("pos", "MC"))
	var hueco: String = String(huecos.get(i, natural))
	return hueco if Squad.poss_of(p).has(hueco) else natural





static func _objetivos(squad: Array, i: int, hueco: String) -> Array:
	var natural: String = String((squad[i] as Dictionary).get("pos", "MC"))
	return [hueco] if natural == hueco else [hueco, natural]





static func huecos_de(once: Array, slots: Array) -> Dictionary:
	var out: Dictionary = {}
	for k in mini(once.size(), slots.size()):
		out[int(once[k])] = String(slots[k])
	return out



static func _relevo_hueco(squad: Array, meta: Array, sale: int, huecos: Dictionary,
		banca: Array, cerrados: Dictionary, veta: Dictionary) -> int:
	for objetivo in _objetivos(squad, sale, puesto_de(squad, sale, huecos)):
		var j: int = _relevo_sin_libro(squad, meta, String(objetivo), banca, cerrados, veta)
		if j >= 0:
			return j
	return -1










static func _relevo_sin_libro(squad: Array, meta: Array, pos: String, banca: Array,
		cerrados: Dictionary, veta: Dictionary) -> int:
	var mejor: int = -1
	var mejor_media: float = - INF
	for seat in banca:
		var j: int = int(seat)
		if cerrados.has(j) or veta.has(j) or j < 0 or j >= squad.size():
			continue
		var q: Dictionary = squad[j]
		var m: float = float(SquadMeta.media_of(q, pos))
		if String(q.get("pos", "MC")) != pos:
			if not Squad.poss_of(q).has(pos):
				continue
			m -= Rotation.CASTIGO_DECLARADO
		if j < meta.size() and not Rotation.disponible(meta[j]):
			continue
		if m > mejor_media:
			mejor_media = m
			mejor = j
	return mejor








static func _orden_sin_libro(squad: Array, meta: Array, once: Array, banca: Array,
		veta: Dictionary, cerrados: Dictionary, tramo: Dictionary, solo: bool,
		team_id: String, semilla: int, clave: Variant, huecos: Dictionary = {}) -> Array:
	var cand: Array = []
	for s in once:
		var i: int = int(s)
		if veta.has(i) or cerrados.has(i) or i < 0 or i >= squad.size():
			continue
		if solo and not tramo.has(i):
			continue
		var p: Dictionary = squad[i]
		if String(p.get("pos", "MC")) == "POR":
			continue
		var pos: String = ""
		var j: int = -1
		for objetivo in _objetivos(squad, i, puesto_de(squad, i, huecos)):
			pos = String(objetivo)
			j = _relevo_sin_libro(squad, meta, pos, banca, cerrados, veta)
			if j >= 0:
				break
		if j < 0:
			continue
		var ventaja: float = float(SquadMeta.media_of(p, pos)) \
				- float(SquadMeta.media_of(squad[j], pos))
		var ruido: float = dado(team_id, semilla, [clave, i]) * RUIDO_CAMBIO
		cand.append([float(int(tramo.get(i, 0))) * PESO_TRAMO + ventaja + ruido, i])

	cand.sort_custom(func(a: Array, b: Array) -> bool:
		if not is_equal_approx(a[0], b[0]):
			return a[0] < b[0]
		return int(a[1]) < int(b[1]))
	return cand










static func plan_sin_libro(squad: Array, meta: Array, once: Array, banca: Array,
		veta: Dictionary, ctx: Dictionary, huecos: Dictionary = {}) -> Array:
	var out: Array = []
	if once.is_empty() or banca.is_empty():
		return out
	var team_id: String = String(ctx.get("team_id", ""))
	var semilla: int = int(ctx.get("semilla", 0))
	var hoy: int = int(ctx.get("carga_hoy", 1))
	var prev: int = int(ctx.get("carga_prev", 1))
	var n: int = piernas_sin_libro(hoy, prev, dado(team_id, semilla, "piernas"))
	var motivo: String = "carga" if exceso_de_carga(hoy, prev) > 0 else "refresco"
	var cerrados: Dictionary =(ctx.get("fuera", {}) as Dictionary).duplicate()
	for c in _orden_sin_libro(squad, meta, once, banca, veta, cerrados, {}, false,
			team_id, semilla, "piernas", huecos):
		if out.size() >= n:
			break
		var sale: int = int(c[1])


		var entra: int = _relevo_hueco(squad, meta, sale, huecos, banca, cerrados, veta)
		if entra < 0:
			continue
		cerrados[entra] = true
		out.append({"sale": sale, "entra": entra, "motivo": motivo,
			"minuto": int(VENTANA[mini(out.size(), VENTANA.size() - 1)])})
	return out




static func ventanas_tacticas(hechos: int) -> Array:
	var out: Array = []
	for k in range(clampi(hechos, 0, VENTANA.size()), mini(CUPO, VENTANA.size())):
		out.append(int(VENTANA[k]))
	return out













static func tacticos(squad: Array, meta: Array, once: Array, banca: Array,
		veta: Dictionary, ctx: Dictionary, diff: int, minuto: int,
		amonestados: Dictionary, cerrados: Dictionary, huecos: Dictionary = {}) -> Array:
	var out: Array = []
	if once.is_empty() or banca.is_empty():
		return out
	var tramo: Dictionary = {}
	var solo: bool = false
	if diff == 1:
		for s in amonestados:
			tramo[int(s)] = 0
		solo = true
		if tramo.is_empty():
			return out
	elif diff <= 0:
		for s in once:
			var i: int = int(s)
			if i < 0 or i >= squad.size():
				continue
			var linea: String = Squad.line_of(String((squad[i] as Dictionary).get("pos", "MC")))
			tramo[i] = 0 if linea == "DEL" else (1 if linea == "MED" else 2)
	else:
		for s in once:
			tramo[int(s)] = 0 if amonestados.has(int(s)) else 1
	var team_id: String = String(ctx.get("team_id", ""))
	var semilla: int = int(ctx.get("semilla", 0))
	var fuera: Dictionary =(ctx.get("fuera", {}) as Dictionary).duplicate()
	fuera.merge(cerrados, true)
	for c in _orden_sin_libro(squad, meta, once, banca, veta, fuera, tramo, solo,
			team_id, semilla, minuto, huecos):
		var sale: int = int(c[1])
		var entra: int = _relevo_hueco(squad, meta, sale, huecos, banca, fuera, veta)
		if entra < 0:
			continue
		out.append({"sale": sale, "entra": entra, "minuto": minuto, "motivo": "tactico"})
	return out
















static func minutos(once: Array, cambios: Array, total: int = 90) -> Dictionary:
	var desde: Dictionary = {}
	var out: Dictionary = {}
	for i in once:
		desde[int(i)] = 0



	var orden: Array = []
	for k in cambios.size():
		var c: Dictionary = cambios[k]
		orden.append([clampi(int(c.get("minuto", total)), 0, total), k, c])
	orden.sort_custom(func(a: Array, b: Array) -> bool:
		if int(a[0]) != int(b[0]):
			return int(a[0]) < int(b[0])
		return int(a[1]) < int(b[1]))
	for o in orden:
		var m: int = int(o[0])
		var c: Dictionary = o[2]
		var sale: int = int(c.get("sale", -1))
		if desde.has(sale):
			out[sale] = int(out.get(sale, 0)) + m - int(desde[sale])
			desde.erase(sale)
		var entra: int = int(c.get("entra", -1))
		if entra >= 0 and not desde.has(entra):
			desde[entra] = m
	for s in desde.keys():
		out[s] = int(out.get(s, 0)) + total - int(desde[s])
	return out
