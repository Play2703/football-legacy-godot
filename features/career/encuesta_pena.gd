class_name EncuestaPena
extends RefCounted





















const VERSION: int = 1


const MIN: int = 3

const AFICION: float = 3.0















const NO_VOTABLES: Array[String] = ["s_camara"]







static func candidatas(vistas: Array) -> Array:
	var out: Array = []
	for v in vistas:
		if not v is String:
			continue
		var id: String = String(v)
		if out.has(id) or not votable(id):
			continue
		out.append(id)
	if out.size() < MIN:
		return []
	out.sort()
	return out



static func votable(id: String) -> bool:
	return not Celebs.by_id(id).is_empty() and not Celebs.atado(id) \
			and not Celebs.solo_visita(id) and not NO_VOTABLES.has(id)






static func elige(cands: Array, semilla: int) -> Dictionary:
	if cands.size() < MIN:
		return {}
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	var bolsa: Array = cands.duplicate()
	var ops: Array = []
	while ops.size() < MIN:
		var i: int = rng.randi_range(0, bolsa.size() - 1)
		ops.append(bolsa[i])
		bolsa.remove_at(i)
	return {"opciones": ops, "ganadora": ops[rng.randi_range(0, MIN - 1)]}




static func semilla(season: int, mes: int, club: String) -> int:
	return hash("%d|%d|%s" % [season, mes, club])&2147483647









static func clave(season: int, mes: int, day: int) -> int:
	return season * 100 + mes_semilla(mes, day)








static func mes_semilla(mes: int, day: int) -> int:
	return mes if mes > 0 else 50 + maxi(day, 0) / 4





static func reparto(semilla_enc: int, ganadora: int) -> Array:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla_enc
	var g: int = rng.randi_range(40, 60)
	var resto: int = 100 - g

	var hi: int = mini(g - 1, resto - 1)
	var lo: int = int(ceilf(float(resto) / 2.0)) +(1 if resto % 2 == 0 else 0)
	var b: int = rng.randi_range(mini(lo, hi), hi)
	var c: int = resto - b
	var otras: Array = [b, c]
	var out: Array = []
	for i in MIN:
		if i == ganadora:
			out.append(g)
		else:
			out.append(otras.pop_front())
	return out




static func votos(semilla_enc: int) -> int:
	return 600 +(semilla_enc % 1801)







static func cumple(enc: Dictionary, festejos: Array, club: String) -> bool:
	if enc.is_empty() or bool(enc.get("cobrada", false)) or club.is_empty() \
			or String(enc.get("club", "")) != club:
		return false
	var gana: String = String(enc.get("ganadora", ""))
	if gana.is_empty():
		return false
	for f in festejos:
		if not f is Dictionary or not bool((f as Dictionary).get("casa", false)):
			continue
		if String(f.get("id", "")) == gana or String(f.get("sitio", "")) == gana:
			return true
	return false



static func nueva(clave_mes: int, season: int, club: String, sorteo: Dictionary, dia: int) -> Dictionary:
	return {
		"v": VERSION, "clave": clave_mes, "temporada": season, "club": club,
		"opciones":(sorteo.get("opciones", []) as Array).duplicate(),
		"ganadora": String(sorteo.get("ganadora", "")),
		"respuesta": "", "cobrada": false, "dia": dia,
	}




static func sanea(v: Variant) -> Dictionary:
	if not v is Dictionary:
		return {}
	var d: Dictionary = v
	if int(d.get("v", 0)) != VERSION:
		return {}
	var ops_v: Variant = d.get("opciones", [])
	if not ops_v is Array or (ops_v as Array).size() != MIN:
		return {}
	var ops: Array = []
	for o in (ops_v as Array):
		if not o is String or Celebs.by_id(String(o)).is_empty() or ops.has(String(o)):
			return {}
		ops.append(String(o))
	var gana: Variant = d.get("ganadora", "")
	if not gana is String or not ops.has(String(gana)):
		return {}
	var r: Variant = d.get("respuesta", "")
	if not r is String or not ["", "bombo", "ignorar"].has(String(r)):
		return {}
	var club: Variant = d.get("club", "")
	if not club is String or String(club).is_empty():
		return {}
	return {
		"v": VERSION, "clave": int(d.get("clave", 0)), "temporada": int(d.get("temporada", 0)),
		"club": String(club), "opciones": ops, "ganadora": String(gana),
		"respuesta": String(r), "cobrada": bool(d.get("cobrada", false)),
		"dia": int(d.get("dia", 0)),
	}
