extends RefCounted




static func sanitizar(valor: Variant) -> Array:
	var out: Array = []
	var vistos: Dictionary = {}
	if not valor is Array:
		return out
	for bruto: Variant in valor:
		if not bruto is Dictionary:
			continue
		var d: Dictionary = bruto
		var tipo: String = String(d.get("tipo", ""))
		var equipo: String = String(d.get("equipo", ""))
		var temporada: int = int(d.get("temporada", 0))
		if tipo not in ["club", "seleccion"] or equipo.is_empty() or temporada <= 0:
			continue
		var clave: String = "%s|%s|%d" % [tipo, equipo, temporada]
		if vistos.has(clave):
			continue
		vistos[clave] = true
		out.append({"tipo": tipo, "equipo": equipo, "temporada": temporada,
			"recuperado": bool(d.get("recuperado", false))})
	return out


static func agregar(actual: Array, tipo: String, equipo: String,
		temporada: int, recuperado: bool = false) -> Array:
	var out: Array = sanitizar(actual)
	var nuevo: Array = sanitizar([{"tipo": tipo, "equipo": equipo,
		"temporada": temporada, "recuperado": recuperado}])
	if nuevo.is_empty():
		return out
	for d: Dictionary in out:
		if d["tipo"] == tipo and d["equipo"] == equipo:


			if recuperado or int(d["temporada"]) == temporada:
				return out
	out.append(nuevo[0])
	return out


static func snapshot(carrera: Variant = null) -> Array:
	var c: Variant = Career if carrera == null else carrera
	return sanitizar(c.get("captain_bands"))


static func nombre(d: Dictionary) -> String:
	var id: String = String(d.get("equipo", ""))
	if d.get("tipo") == "seleccion":
		return Nations.display_name(id)
	return Competitions.demarca(String(Teams.by_id(id).get("name", id)))
