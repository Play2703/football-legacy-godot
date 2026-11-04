class_name KitDeals
extends RefCounted



































const SPONSOR_MIN: int = 3
const SPONSOR_MAX: int = 5




const BRAND_YEARS: int = 7






const NAT_BRAND_YEARS: int = 10
















static var _cache: Dictionary = {}
static var _sello: String = ""



static func sponsor_of(team_id: String) -> String:


	var pagado: String = Anuncios.patrocinador_de(team_id)
	if not pagado.is_empty():
		return pagado
	return _vigente(team_id, "sponsor", SponsorLogos.marcas())



static func brand_of(team_id: String) -> String:






	var pagada: String = Anuncios.marca_de(team_id)
	if not pagada.is_empty():
		return pagada
	var bolsa: Array = KitBrands.bases()












	if Teams.by_id(team_id).is_empty() and not Nations.by_id(team_id).is_empty():
		return _seleccion(team_id, bolsa)
	return _vigente(team_id, "brand", bolsa)




static func sponsor_years(team_id: String) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("kdlen|%d|%s" % [WorldAging.world_seed(), team_id])
	return rng.randi_range(SPONSOR_MIN, SPONSOR_MAX)






static func next_renewal(team_id: String, llave: String = "sponsor") -> int:
	var dur: int = sponsor_years(team_id) if llave == "sponsor" else BRAND_YEARS
	var fase: int = _fase(team_id, llave, dur)



	var cal: int = maxi(WorldAging.season(), 1)
	var desfase: int = cal - Teams.drift_season(Teams.by_id(team_id), cal)
	var ciclo: int =(cal - desfase - 1 + fase) / dur
	return (ciclo + 1) * dur - fase + 1 + desfase


static func invalidate() -> void:
	_cache = {}
	_sello = ""
	BrandTiers.invalidate()






static func _vigente(team_id: String, llave: String, bolsa: Array) -> String:
	var club: Dictionary = Teams.by_id(team_id)
	var base: String = String(club.get(llave, ""))



























	var almacen_base: bool = KitBrands.de_fabrica() if llave == "brand" \
			else SponsorLogos.de_fabrica()
	var tiene: bool = KitBrands.has(base) if llave == "brand" \
			else SponsorLogos.has(base)
	var sin_dibujo: bool = not base.is_empty() and almacen_base and not tiene
	if sin_dibujo and llave == "sponsor" and not club.is_empty():
		base = _fabrica(team_id, bolsa, "sponsor")




	if base.is_empty() and llave == "sponsor" and not club.is_empty() \
			and Teams.base_div(team_id) >= 2:
		base = _fabrica(team_id, bolsa, "sponsor")
	if (base.is_empty() or sin_dibujo) and llave == "brand" \
			and not club.is_empty():
		base = _fabrica(team_id, bolsa, "brand")


	if base.is_empty() or bolsa.size() < 2:
		return base






	if not WorldAging.is_enabled():
		return base
	_refresca_sello()



	var banda: int = BrandTiers.de_club(team_id)




	var ck: String = "%s|%s|%s|%d|%d" % [llave, team_id, base, banda,
		int(club.get(TeamEdits.SEASON_KEY, 0))]
	if _cache.has(ck):
		return _cache[ck]





	var t: int = Teams.drift_season(club, maxi(WorldAging.season(), 1))
	var dur: int = sponsor_years(team_id) if llave == "sponsor" else BRAND_YEARS
	var fase: int = _fase(team_id, llave, dur)




	var ciclo: int =(t - 1 + fase) / dur


























	var mio: bool = ciclo == 0 and int(club.get(TeamEdits.SEASON_KEY, 0)) >= 1 \
			and TeamEdits.tiene(team_id, llave)
	if banda != BrandTiers.de_club_base(team_id) and not mio:
		ciclo += 1
	var elegida: String = base
	if ciclo > 0:
		elegida = _cadena(team_id, llave, ciclo,
			BrandTiers.bolsa(llave, banda, bolsa), base)
	_cache[ck] = elegida
	return elegida








static func _refresca_sello() -> void:
	var sello: String = "%d|%d|%d|%d" % [maxi(WorldAging.season(), 1),
		WorldAging.world_seed(), SponsorLogos.version, KitBrands.version]
	if sello != _sello:
		_cache = {}
		_sello = sello
















static func _seleccion(nat_id: String, bolsa: Array) -> String:
	var banda: int = BrandTiers.de_seleccion(nat_id)
	var cand: Array = BrandTiers.bolsa("brand", banda, bolsa)
	if cand.is_empty():
		return ""
	_refresca_sello()



	var ck: String = "natbrand|%s|%d" % [nat_id, banda]
	if _cache.has(ck):
		return _cache[ck]




	var base: String = _sorteo(nat_id, "natbrand", 0, cand, "")
	var elegida: String = base



	if WorldAging.is_enabled():
		var fase: int = _fase(nat_id, "natbrand", NAT_BRAND_YEARS)
		var ciclo: int =(maxi(WorldAging.season(), 1) - 1 + fase) / NAT_BRAND_YEARS
		if ciclo > 0:
			elegida = _cadena(nat_id, "natbrand", ciclo, cand, base)
	_cache[ck] = elegida
	return elegida







static func _fabrica(team_id: String, bolsa: Array, llave: String = "brand") -> String:
	var cand: Array = BrandTiers.bolsa(llave,
		BrandTiers.de_club_base(team_id), bolsa)
	if cand.is_empty():
		return ""
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()



	rng.seed = hash("kdfab|%d|%s|%s" % [WorldAging.world_seed(), team_id, llave])
	return String(cand[rng.randi_range(0, cand.size() - 1)])




static func _fase(team_id: String, llave: String, dur: int) -> int:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("kdfase|%d|%s|%s" % [WorldAging.world_seed(), team_id, llave])
	return rng.randi_range(0, maxi(dur - 1, 0))









static func _cadena(team_id: String, llave: String, ciclo: int, bolsa: Array,
		base: String) -> String:
	var previa: String = base
	for c in range(1, ciclo + 1):
		previa = _sorteo(team_id, llave, c, bolsa, previa)
	return previa













static func _sorteo(team_id: String, llave: String, ciclo: int, bolsa: Array,
		previa: String) -> String:
	var mejor: String = ""
	var segunda: String = ""
	var p_mejor: int = -1
	var p_segunda: int = -1
	for m in bolsa:
		var cand: String = String(m)
		var p: int = hash("kdbombo|%d|%s|%s|%d|%s"
			% [WorldAging.world_seed(), team_id, llave, ciclo, cand])&2147483647
		if p > p_mejor:
			segunda = mejor
			p_segunda = p_mejor
			mejor = cand
			p_mejor = p
		elif p > p_segunda:
			segunda = cand
			p_segunda = p


	return segunda if mejor == previa and not segunda.is_empty() else mejor
