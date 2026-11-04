class_name Crowding
extends RefCounted





































const SEP: float = 1.05






const DUEL_SEP: float = 0.7






const EASE: float = 0.35


























static func relax(points: Array, sep: float = SEP, ease: float = EASE,
		frozen: Dictionary = {}, bandos: Array = [], sep_rival: float = -1.0,
		firmes: Dictionary = {}) -> Array:
	var out: Array = points.duplicate()
	var por_bando: bool = sep_rival > 0.0 and bandos.size() == out.size()
	for i in out.size():



		var fi: bool = frozen.has(i)
		for j in range(i + 1, out.size()):
			var fj: bool = frozen.has(j)

			var qi: bool = fi
			var qj: bool = fj
			if fi and fj:
				if firmes.is_empty() or (firmes.has(i) and firmes.has(j)):
					continue
				qi = firmes.has(i)
				qj = firmes.has(j)
			var s: float = sep
			if por_bando and not fi and not fj and bandos[i] != bandos[j]:
				s = sep_rival
			var a: Vector2 = out[i]
			var b: Vector2 = out[j]
			var d: Vector2 = b - a
			var dist: float = d.length()
			if dist >= s:
				continue



			var dir: Vector2 = d / dist if dist > 0.0001 \
					else Vector2.RIGHT.rotated(float(i) * 1.7)
			var push: float =(s - dist) * ease
			if qi:
				out[j] = b + dir * push
			elif qj:
				out[i] = a - dir * push
			else:
				out[i] = a - dir *(push * 0.5)
				out[j] = b + dir *(push * 0.5)
	return out











static func relax_packed(points: PackedVector2Array, sep: float = SEP, ease: float = EASE,
		frozen: PackedByteArray = PackedByteArray(), bandos: PackedByteArray = PackedByteArray(),
		sep_rival: float = -1.0, firmes: PackedByteArray = PackedByteArray()) -> PackedVector2Array:
	var out: PackedVector2Array = points.duplicate()
	var n: int = out.size()
	var por_bando: bool = sep_rival > 0.0 and bandos.size() == n
	var con_frozen: bool = frozen.size() == n

	var hay_firmes: bool = false
	if firmes.size() == n:
		for k in n:
			if firmes[k] != 0:
				hay_firmes = true
				break
	for i in n:
		var fi: bool = con_frozen and frozen[i] != 0
		for j in range(i + 1, n):
			var fj: bool = con_frozen and frozen[j] != 0
			var qi: bool = fi
			var qj: bool = fj
			if fi and fj:
				if not hay_firmes or (firmes[i] != 0 and firmes[j] != 0):
					continue
				qi = firmes[i] != 0
				qj = firmes[j] != 0
			var s: float = sep
			if por_bando and not fi and not fj and bandos[i] != bandos[j]:
				s = sep_rival
			var a: Vector2 = out[i]
			var b: Vector2 = out[j]
			var d: Vector2 = b - a
			var dist: float = d.length()
			if dist >= s:
				continue
			var dir: Vector2 = d / dist if dist > 0.0001 \
					else Vector2.RIGHT.rotated(float(i) * 1.7)
			var push: float =(s - dist) * ease
			if qi:
				out[j] = b + dir * push
			elif qj:
				out[i] = a - dir * push
			else:
				out[i] = a - dir *(push * 0.5)
				out[j] = b + dir *(push * 0.5)
	return out




static func marcas(idx: Dictionary, n: int) -> PackedByteArray:
	var out: PackedByteArray = PackedByteArray()
	if idx.is_empty():
		return out
	out.resize(n)
	for k in idx:
		if int(k) >= 0 and int(k) < n:
			out[int(k)] = 1
	return out




static func overlaps(points: Array, sep: float = SEP) -> int:
	var n: int = 0
	for i in points.size():
		for j in range(i + 1, points.size()):
			if (points[i] as Vector2).distance_to(points[j]) < sep - 0.01:
				n += 1
	return n














































const CARGA_DPESO_CAE: float = 0.3
























const CARGA_FORCEJEO_CAE: float = 0.45































const CARGA_IMPULSO: float = 1.6




const CARGA_COOLDOWN: float = 0.6





const CARGA_CIERRE_MIN: float = 0.2










const CARGA_CIERRE_PLENO: float = 1.0
const CARGA_LANZADO_MAX: float = 1.5












const CARGA_CONTACTO_K: float = 1.15

























static func choque(points: Array, vels: Array, pesos: Array, bandos: Array,
		elegibles: Dictionary, sep: float = DUEL_SEP,
		presentes: Dictionary = {}, forcejeo: Dictionary = {}) -> Dictionary:
	var impulso: Dictionary = {}
	var carga: Dictionary = {}
	var caen: Dictionary = {}
	var contacto: Dictionary = {}
	var cede: Dictionary = {}
	var pulso: Dictionary = {}




	var presente: Dictionary = presentes if not presentes.is_empty() else elegibles
	var sep_gesto: float = sep * CARGA_CONTACTO_K
	for i in points.size():
		if not presente.has(i):
			continue
		for j in range(i + 1, points.size()):
			if not presente.has(j):
				continue

			if bandos[i] == bandos[j]:
				continue
			var a: Vector2 = points[i]
			var b: Vector2 = points[j]
			var d: Vector2 = b - a
			var dist: float = d.length()
			if dist <= 0.0001:
				continue
			var dir: Vector2 = d / dist
			var pi: float = float(pesos[i]) if i < pesos.size() else 0.5
			var pj: float = float(pesos[j]) if j < pesos.size() else 0.5
			if dist < sep_gesto:
				contacto[i] = true
				contacto[j] = true













				var ti: float = float(forcejeo.get(i, 0.0))
				var tj: float = float(forcejeo.get(j, 0.0))
				if pi - pj >= CARGA_DPESO_CAE and tj >= CARGA_FORCEJEO_CAE:
					caen[j] = dir
				elif pj - pi >= CARGA_DPESO_CAE and ti >= CARGA_FORCEJEO_CAE:
					caen[i] = - dir
			if dist >= sep:
				continue
			if not elegibles.has(i) or not elegibles.has(j):
				continue




			var vi: Vector2 = vels[i] if i < vels.size() else Vector2.ZERO
			var vj: Vector2 = vels[j] if j < vels.size() else Vector2.ZERO
			var cierre: float =(vi - vj).dot(dir)
			if cierre < CARGA_CIERRE_MIN:
				continue
			var suma: float = maxf(pi + pj, 0.0001)




			var total: float = CARGA_IMPULSO \
					* clampf(cierre / CARGA_CIERRE_PLENO, 1.0, CARGA_LANZADO_MAX)
			impulso[i] = - dir *(total *(pj / suma))
			impulso[j] = dir *(total *(pi / suma))







			cede[i] = minf(2.0 * pj / suma, 1.0)
			cede[j] = minf(2.0 * pi / suma, 1.0)








			if absf(pi - pj) >= CARGA_DPESO_CAE:
				pulso[i] = true
				pulso[j] = true
			carga[i] = true
			carga[j] = true
	return {"impulso": impulso, "carga": carga, "caen": caen, "contacto": contacto,
		"cede": cede, "pulso": pulso}














const BLOQUEO_GANA_K: float = 0.42
const BLOQUEO_GANA_MIN: float = 0.1


static func bloqueo_gana_p(peso_bloq: float, peso_rival: float) -> float:
	return clampf(0.5 + BLOQUEO_GANA_K *(peso_bloq - peso_rival),
		BLOQUEO_GANA_MIN, 1.0 - BLOQUEO_GANA_MIN)
