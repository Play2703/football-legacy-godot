class_name RutasMercado
extends RefCounted




























const RUTA_CLUB_MIN: int = 1


const RUTA_PAIS_MIN: int = 2


static var _inyectado: Dictionary = {}


static var _paises_cache: Dictionary = {}



static func inyecta(clubes: Dictionary, paises: Dictionary) -> void:
	_inyectado = {"clubes": clubes, "paises": paises}
	_paises_cache.clear()



static func limpia() -> void:
	_inyectado = {}
	_paises_cache.clear()


static func _clubes() -> Dictionary:
	if not _inyectado.is_empty():
		return _inyectado["clubes"]
	if _clubes_reales.is_empty():
		calienta()
	return _clubes_reales


static func _paises() -> Dictionary:
	if not _inyectado.is_empty():
		return _inyectado["paises"]
	if _clubes_reales.is_empty():
		calienta()
	return _paises_reales








static var _clubes_reales: Dictionary = {}
static var _paises_reales: Dictionary = {}




static func calienta() -> void:
	if not _clubes_reales.is_empty():
		return
	var rutas: Variant = load("res://features/league/mundo_rutas.gd")
	_paises_reales = rutas.PAISES
	_clubes_reales = rutas.CLUBES



static func vendedores(comprador: String) -> Dictionary:
	return (_clubes().get(comprador, {}) as Dictionary).duplicate()





static func paises_de(comprador: String) -> Dictionary:
	return _paises_de_ref(comprador).duplicate()











static func _pais_canon(pais: String) -> String:
	if pais.is_empty():
		return pais
	var n: Dictionary = Nations.by_id(pais)
	return String(n.get("name", pais)) if not n.is_empty() else pais



static func _paises_de_ref(comprador: String) -> Dictionary:
	if _paises_cache.has(comprador):
		return _paises_cache[comprador]
	var out: Dictionary = {}
	var fuera: Dictionary = _paises().get(comprador, {})
	for p in fuera:
		var pf: String = _pais_canon(String(p))
		out[pf] = int(out.get(pf, 0)) + int(fuera[p])
	var vend: Dictionary = _clubes().get(comprador, {})
	for v in vend:
		var pais: String = _pais_canon(Teams.country_of(String(v)))
		if pais.is_empty():
			continue
		out[pais] = int(out.get(pais, 0)) + int(vend[v])
	_paises_cache[comprador] = out
	return out





static func lazo(comprador: String, vendedor: String) -> Dictionary:
	if comprador.is_empty() or vendedor.is_empty() or comprador == vendedor:
		return {"tipo": "", "n": 0}
	var n_club: int = int((_clubes().get(comprador, {}) as Dictionary).get(vendedor, 0))
	if n_club >= RUTA_CLUB_MIN:
		return {"tipo": "club", "n": n_club}
	var pais: String = _pais_canon(Teams.country_of(vendedor))
	if not pais.is_empty():
		var n_pais: int = int(_paises_de_ref(comprador).get(pais, 0))
		if n_pais >= RUTA_PAIS_MIN:
			return {"tipo": "pais", "n": n_pais}
	return {"tipo": "", "n": 0}





static func proveedores(comprador: String, limite: int) -> Array:
	var vend: Dictionary = _clubes().get(comprador, {})
	var ids: Array = []
	for v in vend:
		ids.append(String(v))
	ids.sort_custom(func(a: String, b: String) -> bool:
		var na: int = int(vend[a])
		var nb: int = int(vend[b])
		return na > nb if na != nb else a < b)
	return ids.slice(0, maxi(limite, 0))
