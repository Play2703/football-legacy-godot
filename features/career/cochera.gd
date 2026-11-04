extends RefCounted


const TAM := Vector2(14, 18)
const MUROS: Array[Rect2] = [Rect2(6.8, -9, 0.2, 8), Rect2(6.8, 1, 0.2, 8),
	Rect2(-7, -9, 0.2, 18), Rect2(-6.8, 8.8, 13.6, 0.2),
	Rect2(-6.8, -9, 5.05, 0.2), Rect2(1.75, -9, 5.05, 0.2)]
static var _cache: Dictionary = {}

static func a_mundo(p: Vector2, prop: Dictionary) -> Vector2:
	var ang: float = float(int(prop.get("face", 0))&3) * PI * 0.5
	return (prop["rect"] as Rect2).get_center() + Vector2(
		cos(ang) * p.x + sin(ang) * p.y, - sin(ang) * p.x + cos(ang) * p.y)

static func rect_mundo(r: Rect2, prop: Dictionary) -> Rect2:
	var a: Vector2 = a_mundo(r.position, prop)
	var b: Vector2 = a_mundo(r.end, prop)
	return Rect2(Vector2(minf(a.x, b.x), minf(a.y, b.y)),(b - a).abs())

static func solidos(prop: Dictionary) -> Array:
	var key: String = str(prop["rect"]) + str(prop.get("face", 0))
	if _cache.has(key):
		return _cache[key]
	var out: Array = []
	for r in MUROS:
		out.append(rect_mundo(r, prop))

	if _cache.size() > 64:
		_cache.clear()
	_cache[key] = out
	return out

static func choca(a: Dictionary, b: Dictionary) -> bool:
	if a.get("kind") == "cochera" and b.get("kind") == "cochera":
		return true
	var garaje: Dictionary = a if a.get("kind") == "cochera" else b
	var otro: Dictionary = b if a.get("kind") == "cochera" else a
	if House.prop_span(otro).y > 2.15:
		return true
	for pared in solidos(garaje):
		if (pared as Rect2).intersects(otro["rect"]):
			return true
	return false

static func plazas(prop: Dictionary) -> Array:
	var out: Array = []
	for i in 8:
		out.append(rect_mundo(plaza_local(i), prop))
	return out

static func plaza_local(i: int) -> Rect2:
	return Rect2(-6.5 +(i % 2) * 8.0, -8 + floori(i / 2.0) * 4.5, 5, 2.5)

static func huella(tier: int) -> Rect2:
	return Rect2(Vector2(- House.lado_of(tier) * 0.5 - TAM.x - 1, - TAM.y * 0.5), TAM)



static func limites_solar(pl: Dictionary) -> Rect2:
	var suelo: Dictionary = pl.duplicate()
	suelo["rooms"] =(pl["rooms"] as Array).filter(func(r): return not r.get("acceso_calle", false))
	return House.plan_bounds(suelo)

static func calle_z(pl: Dictionary) -> float:
	return snappedf(limites_solar(pl).position.y - 2.5, House.CELDA) - 3.2

static func entrada_calle(pl: Dictionary, tier: int) -> Rect2:
	var solar: Dictionary = pl.duplicate()
	solar["rooms"] =(pl["rooms"] as Array).duplicate()
	solar["rooms"].append({"rect": huella(tier).grow(0.5)})
	var inicio: float = calle_z(solar) + 0.1
	return Rect2(huella(tier).get_center().x - 1.75, inicio, 3.5, huella(tier).position.y - inicio)



static func paso_casa(tier: int) -> Rect2:
	var borde: float = - House.lado_of(tier) * 0.5
	var fin: float = borde
	var pintura: Dictionary = Career.floor_paint_of()
	while fin < 0 and House.floor_finish_at(Vector2(fin + 0.25, 0), pintura,
		House.ACABADO_BASE["floor"]) == House.PISO_PASTO:
		fin += House.CELDA
	return Rect2(borde - 1.5, -1, fin - borde + 2, 2)

static func paso_despejado(pl: Dictionary, paso: Rect2) -> bool:
	for p in pl.get("props", []):
		if p.get("guardado", false) or p.get("fijo", false) or House.COCHES.has(p.get("kind")):
			continue
		if (p["rect"] as Rect2).intersects(paso.grow(- 0.02)):
			return false



	var interior := Rect2(paso.position + Vector2(0, 0.25), paso.size - Vector2(0, 0.5))
	for t in pl.get("tabiques", []):
		if not House.tabique_rect(t[0], t[1]).intersects(interior):
			continue
		if absf(t[0].y - t[1].y) < 0.01:
			return false
		if not House.is_pass(t) and not (absf(t[0].x - t[1].x) < 0.01
				and minf(t[0].y, t[1].y) <= -1 and maxf(t[0].y, t[1].y) >= 1):
			return false
	return true



static func conectar(pl: Dictionary) -> void:
	for room in pl["rooms"]:
		if not room.get("paso_cochera", false):
			continue
		var paso: Rect2 = room["rect"]
		if not paso_despejado(pl, paso):
			return
		var tabs: Array = []
		for t in pl.get("tabiques", []):
			var a: Vector2 = t[0]
			var b: Vector2 = t[1]
			if not House.is_pass(t) and absf(a.x - b.x) < 0.01 \
					and a.x > paso.position.x and a.x < paso.end.x \
					and minf(a.y, b.y) <= -1 and maxf(a.y, b.y) >= 1:
				tabs.append_array(House.split_wall(t, Vector2(a.x, -1), "corrediza", 2.0))
			else:
				tabs.append(t)
		pl["tabiques"] = tabs




static func instalacion_libre(pl: Dictionary, tier: int) -> bool:
	var nueva: Rect2 = huella(tier).grow(0.5)
	var entrada: Rect2 = entrada_calle(pl, tier)
	if not paso_despejado(pl, paso_casa(tier)):
		return false
	for cuarto in pl.get("rooms", []):
		if nueva.intersects(cuarto["rect"]) or entrada.intersects(cuarto["rect"]):
			return false
	for p in pl.get("props", []):
		if not p.get("guardado", false) and (nueva.intersects(p["rect"]) or entrada.intersects(p["rect"])):
			return false
	for muro in pl.get("tabiques", []):
		if nueva.intersects(House.tabique_rect(muro[0], muro[1])) or entrada.intersects(House.tabique_rect(muro[0], muro[1])):
			return false
	return true




static func integrar(base: Dictionary) -> void:
	if not Career.house_extras.has("cochera"):
		return

	var r: Rect2 = huella(Career.land_tier)
	base["rooms"] =(base["rooms"] as Array).duplicate()
	base["rooms"].append({"id": "jardin", "label": "COCHERA DE COLECCIÓN",
		"rect": r.grow(0.5), "anexo_cochera": true})
	base["rooms"].append({"id": "jardin", "label": "", "anexo_cochera": true,
		"rect": paso_casa(Career.land_tier), "paso_cochera": true, "pavimento_cochera": true})
	base["rooms"].append({"id": "jardin", "label": "", "anexo_cochera": true,
		"rect": entrada_calle(base, Career.land_tier), "acceso_calle": true, "pavimento_cochera": true})
	var garaje: Dictionary = {"id": "cochera_fija", "kind": "cochera", "rect": r,
		"pass": true, "face": 0, "face_fab": 0, "guardado": false, "fijo": true}
	var nuevos: Array = []
	for p in base["props"]:
		if p.get("kind") == "cochera":
			garaje["id"] = p["id"]
			continue
		var i: int = House.COCHES.find(String(p.get("kind", "")))
		if i >= 0:
			p = p.duplicate(true)
			p["rect"] = plazas(garaje)[i]
			p["face"] =(i % 2) * 2
			p["face_fab"] = 0
			p["guardado"] = false
			p["fijo"] = true
		nuevos.append(p)
	nuevos.append(garaje)
	base["props"] = nuevos
