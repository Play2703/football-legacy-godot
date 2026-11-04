class_name ClubForm
extends RefCounted



































































const DIV_STEP: float = 2.5





const FORM_MAX: float = 5.0









const AGE_FULL: int = 22
const AGE_NONE: int = 32
const AGE_FLOOR: float = 0.25




const DEV_MAX: float = 6.0




const DEV_PIVOT: float = 6.5
const DEV_BAND: float = 1.5





const DEV_MIN_GP: int = 12



const PERF_MAX: int = 1



static var _pyramid: Dictionary = {}





static var _perf: Dictionary = {}



static var _dev: Dictionary = {}

static var _enabled: bool = true






static func age_weight(age: int, mejora: bool) -> float:
	var t: float = clampf(float(age - AGE_FULL) / float(AGE_NONE - AGE_FULL),
		0.0, 1.0)


	return lerpf(1.0, AGE_FLOOR, t) if mejora else lerpf(AGE_FLOOR, 1.0, t)




static func points_of(team_id: String) -> float:
	return clampf(float(_pyramid.get(team_id, 0)) * DIV_STEP, - FORM_MAX, FORM_MAX)







static func quality_bonus(team_id: String, age: int) -> int:
	if not _enabled:
		return 0
	var pts: float = points_of(team_id)
	if is_zero_approx(pts):
		return 0
	return int(round(pts * age_weight(age, pts > 0.0)))




















static func perf_bonus(team_id: String) -> int:
	if not _enabled:
		return 0
	return clampi(int(round(float(_perf.get(team_id, 0.0)))), - PERF_MAX, PERF_MAX)













static func rating_delta(team_id: String) -> int:
	if not _enabled:
		return 0
	return int(round(points_of(team_id)))










static func season_step(avg: float, gp: int, age: int) -> float:
	var paso: float = clampf((avg - DEV_PIVOT) / DEV_BAND, -1.0, 1.0)
	if gp < DEV_MIN_GP:


		paso = minf(paso, -0.25)
	return paso * age_weight(age, paso > 0.0)













static func accrue_season(pm: Dictionary, avg: float, gp: int,
		owner: String = "") -> void:
	var previo: float = float(pm.get("dev", 0.0))
	if String(pm.get("dev_of", owner)) != owner:
		previo = 0.0
	pm["dev_of"] = owner
	pm["dev"] = clampf(previo + season_step(avg, gp, int(pm.get("age", 26))),
		- DEV_MAX, DEV_MAX)



static func seat_dev(team_id: String, idx: int) -> int:
	if not _enabled:
		return 0
	var arr: Variant = _dev.get(team_id, null)
	if not (arr is Array) or idx < 0 or idx >=(arr as Array).size():
		return 0
	return int(round(clampf(float((arr as Array)[idx]), - DEV_MAX, DEV_MAX)))








static func set_pyramid(por_club: Dictionary) -> void:
	var limpio: Dictionary = {}
	for k in por_club:
		var n: int = int(por_club[k])
		if n != 0:
			limpio[String(k)] = n
	if limpio == _pyramid:
		return
	var cambiados: Array = _cambiados(_pyramid, limpio)
	_pyramid = limpio
	Squad.invalidate_clubs(cambiados)





static func set_perf(por_club: Dictionary) -> void:
	var limpio: Dictionary = {}
	for k in por_club:
		var n: int = clampi(int(por_club[k]), - PERF_MAX, PERF_MAX)
		if n != 0:
			limpio[String(k)] = n
	if limpio == _perf:
		return
	var cambiados: Array = _cambiados(_perf, limpio)
	_perf = limpio
	Squad.invalidate_clubs(cambiados)












static func set_seat_dev(por_club: Dictionary) -> void:
	var limpio: Dictionary = {}
	for k in por_club:
		var arr: Variant = por_club[k]
		if not (arr is Array):
			continue
		for v in (arr as Array):
			if not is_zero_approx(float(v)):
				limpio[String(k)] =(arr as Array).duplicate()
				break
	if limpio == _dev:
		return
	var cambiados: Array = _cambiados(_dev, limpio)
	_dev = limpio
	Squad.invalidate_clubs(cambiados)











static func _cambiados(viejo: Dictionary, nuevo: Dictionary) -> Array:
	var out: Array = []
	for k in nuevo:
		if not viejo.has(k) or viejo[k] != nuevo[k]:
			out.append(String(k))
	for k2 in viejo:
		if not nuevo.has(k2):
			out.append(String(k2))
	return out


static func pyramid_of(team_id: String) -> int:
	return int(_pyramid.get(team_id, 0))


static func to_dict() -> Dictionary:
	return {"pyramid": _pyramid.duplicate(true), "dev": _dev.duplicate(true),
		"perf": _perf.duplicate(true)}


static func clear() -> void:
	if _pyramid.is_empty() and _dev.is_empty() and _perf.is_empty():
		return
	_pyramid.clear()
	_dev.clear()
	_perf.clear()
	Squad.invalidate()







static func suspend() -> void:
	if not _enabled:
		return
	_enabled = false
	Squad.invalidate()


static func resume() -> void:
	if _enabled:
		return
	_enabled = true
	Squad.invalidate()


static func is_enabled() -> bool:
	return _enabled
