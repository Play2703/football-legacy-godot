class_name RetroKits
extends RefCounted








































const TOP_POR_LIGA: int = 5






static var _top: Dictionary = {}








static func elegido(team_id: String) -> bool:
	if team_id.is_empty():
		return false
	var pais: String = Teams.country_of(team_id)
	if pais.is_empty():
		return false
	_ensure_top()
	return (_top.get(pais, []) as Array).has(team_id)




static func top_de(pais: String) -> Array:
	_ensure_top()
	return (_top.get(pais, []) as Array).duplicate()


static func _ensure_top() -> void:




	if not _top.is_empty():
		return
	var por_pais: Dictionary = {}
	for t in Teams.all():
		var pais: String = String(t.get("country", ""))
		if pais.is_empty():
			continue
		if not por_pais.has(pais):
			por_pais[pais] = []
		(por_pais[pais] as Array).append(t)
	for pais in por_pais:
		var lista: Array = por_pais[pais]



		lista.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
			var ra: int = int(a.get("rating", 62))
			var rb: int = int(b.get("rating", 62))
			if ra != rb:
				return ra > rb
			return String(a.get("id", "")) < String(b.get("id", "")))
		var ids: Array = []
		for i in mini(TOP_POR_LIGA, lista.size()):
			ids.append(String(lista[i].get("id", "")))
		_top[pais] = ids












static func aniversario(team_id: String, jornadas: int) -> int:
	if jornadas <= 1:
		return -1
	return 1 + absi(hash("retroaniv|" + team_id)) %(jornadas - 1)







static func toca(team_id: String, fx: Dictionary, jornadas: int) -> bool:
	if team_id.is_empty() or jornadas <= 1:
		return false
	if String(fx.get("comp", "")) != "league":
		return false
	if int(fx.get("round_idx", -1)) != aniversario(team_id, jornadas):
		return false
	return elegido(team_id)






const SLOT: int = 3

















static func la_llevas(disponible: bool, slot: int, elegido_ya: bool) -> bool:
	if not disponible:
		return false
	return slot == SLOT if elegido_ya else true
















const SPONSOR_HISTORICO: Dictionary = {

	"mun": "sharp",
	"liv": "carlsberg",
	"ars": "jvc",
	"mci": "brother",
	"che": "samsung",

	"rma": "teka",
	"bar": "unicef",
	"atm": "marbella",

	"mil": "opel",
	"int": "pirelli",
	"juv": "danone",
	"nap": "mars",

	"bay": "commodore",
	"dor": "opel",

	"ajax": "tdk",
	"psv": "philips",

	"fla": "petrobras",
	"palm": "parmalat",
	"boca": "parmalat",
	"rive": "quilmes",

	"mars": "opel",
	"por": "revigres",
}









const MARCA_HISTORICA: Dictionary = {
	"mun": "umbro", "liv": "adidas_trebol", "ars": "adidas_trebol",
	"mci": "umbro", "che": "umbro",
	"rma": "hummel", "bar": "kappa", "atm": "kelme", "ath": "kappa",
	"mil": "kappa", "int": "umbro", "juv": "kappa", "nap": "kappa",
	"bay": "adidas_trebol", "dor": "kappa",
	"ajax": "umbro", "psv": "adidas_trebol",
	"fla": "adidas_trebol", "palm": "adidas_trebol",
	"boca": "adidas_trebol", "rive": "adidas_trebol",
	"mars": "adidas_trebol", "ben": "umbro", "por": "kappa",
	"sco_cel": "umbro", "sco_ran": "umbro",
}






const _POOL_SPONSOR: Array[String] = [
	"sharp", "opel", "carlsberg", "jvc", "pirelli", "sega", "mars", "danone",
	"o2", "commodore", "tdk", "teka", "aig", "candy", "crownpaints", "tim",
	"qatarfoundation", "philips", "siemens", "panasonic", "unicef", "samsung",
	"brother", "parmalat", "holsten", "quilmes", "northernrock", "thomascook",
	"petrobras", "vodafone", "abnamro",
]




const _POOL_MARCA: Array[String] = [
	"adidas_trebol", "umbro", "kappa", "hummel", "mizuno", "kelme", "errea",
]









static func sponsor_of(team_id: String) -> String:
	return _de_epoca(team_id, "sponsor", SPONSOR_HISTORICO, _POOL_SPONSOR,
		SponsorLogos.marcas(), KitDeals.sponsor_of(team_id))



static func brand_of(team_id: String) -> String:
	return _de_epoca(team_id, "brand", MARCA_HISTORICA, _POOL_MARCA,
		KitBrands.marcas(), KitDeals.brand_of(team_id))


static func _de_epoca(team_id: String, llave: String, tabla: Dictionary,
		pool: Array[String], importadas: Array, vigente: String) -> String:
	var hist: String = String(tabla.get(team_id, ""))
	if not hist.is_empty() and importadas.has(hist):
		return hist



	var bolsa: Array[String] = []
	for m in pool:
		if importadas.has(m) and m != vigente:
			bolsa.append(m)
	if bolsa.is_empty():
		return vigente



	return bolsa[absi(hash("retro|%s|%s" % [llave, team_id])) % bolsa.size()]


static func invalidate() -> void:
	_top = {}
