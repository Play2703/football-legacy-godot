class_name FlightPath
extends RefCounted



































const LEN: int = 9




const STEP: float = 0.05


























const REALCE_GAIN: float = 2.2




const REALCE_MAX_M: float = 4.4





const REALCE_MAX_FRAC: float = 0.3





static func from_traj(traj: Array, desde: int, hasta: int) -> Array:
	if traj.size() < 3:
		return []
	var a: int = clampi(desde, 0, traj.size() - 1)
	var b: int = clampi(hasta, 0, traj.size() - 1)
	if b - a < 2:
		return []



	var m: int = a +(b - a) / 2
	var p0: Vector3 = traj[a]
	var pm: Vector3 = traj[m]
	var p1: Vector3 = traj[b]
	return [
		snappedf(p0.x, STEP), snappedf(p0.y, STEP), snappedf(p0.z, STEP),
		snappedf(pm.x, STEP), snappedf(pm.y, STEP), snappedf(pm.z, STEP),
		snappedf(p1.x, STEP), snappedf(p1.y, STEP), snappedf(p1.z, STEP),
	]




static func valid(t: Variant) -> bool:
	return t is Array and (t as Array).size() == LEN





static func points(t: Variant, n: int = 12, realce: bool = false) -> Array:
	if not valid(t):
		return []
	var a: Array = t as Array
	var p0: Vector3 = Vector3(a[0], a[1], a[2])
	var p1: Vector3 = Vector3(a[6], a[7], a[8])
	var c: Vector3 = _control(a, realce)
	var pts: Array = []
	var pasos: int = maxi(n, 2)
	for i in pasos:
		var s: float = float(i) / float(pasos - 1)
		var inv: float = 1.0 - s
		pts.append(p0 *(inv * inv) + c *(2.0 * inv * s) + p1 *(s * s))
	return pts











static func _control(a: Array, realce: bool) -> Vector3:
	var p0: Vector3 = Vector3(a[0], a[1], a[2])
	var pm: Vector3 = Vector3(a[3], a[4], a[5])
	var p1: Vector3 = Vector3(a[6], a[7], a[8])
	var c: Vector3 = pm * 2.0 -(p0 + p1) * 0.5
	if not realce:
		return c


	var cuerda: Vector2 = Vector2(p1.x - p0.x, p1.z - p0.z)
	var largo: float = cuerda.length()
	if largo < 0.5:
		return c
	var normal: Vector2 = Vector2(- cuerda.y, cuerda.x) / largo
	var medio: Vector2 = Vector2(p0.x + p1.x, p0.z + p1.z) * 0.5

	var d: float =(Vector2(c.x, c.z) - medio).dot(normal)
	var tope: float = minf(REALCE_MAX_M, largo * REALCE_MAX_FRAC)
	var extra: float = clampf(d * REALCE_GAIN, - tope, tope) - d
	return Vector3(c.x + normal.x * extra, c.y, c.z + normal.y * extra)





static func start_of(t: Variant) -> Vector3:
	if not valid(t):
		return Vector3.ZERO
	return Vector3((t as Array)[0],(t as Array)[1],(t as Array)[2])


static func end_of(t: Variant) -> Vector3:
	if not valid(t):
		return Vector3.ZERO
	return Vector3((t as Array)[6],(t as Array)[7],(t as Array)[8])





static func at(t: Variant, s: float, realce: bool = false) -> Vector3:
	if not valid(t):
		return Vector3.ZERO
	var a: Array = t as Array
	var p0: Vector3 = Vector3(a[0], a[1], a[2])
	var p1: Vector3 = Vector3(a[6], a[7], a[8])
	var c: Vector3 = _control(a, realce)
	var k: float = clampf(s, 0.0, 1.0)
	var inv: float = 1.0 - k
	return p0 *(inv * inv) + c *(2.0 * inv * k) + p1 *(k * k)











static func arc(desde: Vector2, hasta: Vector2, pico: float,
		alto_fin: float = 0.0) -> Array:
	var m: Vector2 =(desde + hasta) * 0.5
	return [
		snappedf(desde.x, STEP), 0.0, snappedf(desde.y, STEP),
		snappedf(m.x, STEP), snappedf(pico, STEP), snappedf(m.y, STEP),
		snappedf(hasta.x, STEP), snappedf(alto_fin, STEP), snappedf(hasta.y, STEP),
	]




static func apex(t: Variant) -> float:
	if not valid(t):
		return 0.0
	var alto: float = 0.0
	for p in points(t, 9):
		alto = maxf(alto,(p as Vector3).y)
	return alto
