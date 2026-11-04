class_name OnceIdeal
extends RefCounted




















const FORMACION: Array = [["POR", 1], ["DEF", 4], ["MED", 3], ["DEL", 3]]
const FORMACION_NOMBRE: String = "4-3-3"






static func linea(pos: String) -> String:
	if not Squad.POS_LINE.has(pos):
		return ""
	return Squad.line_of(pos)







static func elige(cands: Array, apps_min: int = 0) -> Dictionary:
	var validos: Array = []
	for c in cands:
		if not (c is Dictionary):
			continue
		var d: Dictionary = c
		if int(d.get("apps", 0)) < apps_min:
			continue
		if linea(str(d.get("pos", ""))).is_empty():
			continue
		validos.append(d)


	validos.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return _mejor(a, b))
	var vistos: Dictionary = {}
	var por_linea: Dictionary = {}
	for d in validos:
		var clave: String = "%s|%s" % [str(d.get("name", "")), str(d.get("team", ""))]
		if vistos.has(clave):
			continue
		vistos[clave] = true
		var ln: String = linea(str(d.get("pos", "")))
		if not por_linea.has(ln):
			por_linea[ln] = []
		(por_linea[ln] as Array).append(d)
	var xi: Array = []
	var you_in: bool = false
	for f in FORMACION:
		var ln2: String = str(f[0])
		var lista: Array = por_linea.get(ln2, [])
		for d2 in lista.slice(0, int(f[1])):
			var you: bool = bool((d2 as Dictionary).get("you", false))
			you_in = you_in or you
			xi.append({
				"name": str(d2.get("name", "?")),
				"team": str(d2.get("team", "")),
				"pos": str(d2.get("pos", "")),
				"line": ln2,
				"avg": float(d2.get("avg", 0.0)),
				"you": you,
			})
	return {"formation": FORMACION_NOMBRE, "xi": xi, "you_in": you_in}




static func _mejor(a: Dictionary, b: Dictionary) -> bool:
	var va: float = float(a.get("avg", 0.0))
	var vb: float = float(b.get("avg", 0.0))
	if not is_equal_approx(va, vb):
		return va > vb
	var pa: int = int(a.get("goals", 0)) + int(a.get("assists", 0))
	var pb: int = int(b.get("goals", 0)) + int(b.get("assists", 0))
	if pa != pb:
		return pa > pb
	var na: String = str(a.get("name", ""))
	var nb: String = str(b.get("name", ""))
	if na != nb:
		return na < nb
	var ta: String = str(a.get("team", ""))
	var tb: String = str(b.get("team", ""))
	if ta != tb:
		return ta < tb
	return str(a.get("pos", "")) < str(b.get("pos", ""))
