class_name BrandTiers
extends RefCounted


































const ELITE: int = 1
const MEDIA: int = 2
const MODESTA: int = 3






const LOCAL: int = 9












const RATING_ELITE: int = 82
const RATING_MEDIA: int = 75













const MARCAS_DEPORTIVAS: Dictionary = {
	"nike": ELITE, "adidas": ELITE, "puma": ELITE, "jordan": ELITE,
	"adidas_trebol": ELITE,




	"nike_1978": ELITE, "adidas_letras": ELITE, "puma_letras": ELITE,
	"umbro_letras": MEDIA, "hummel_letras": MEDIA, "castore_letras": MEDIA,
	"kelme_letras": MEDIA, "mizuno_letras": MEDIA, "newbalance_letras": MEDIA,
	"errea_letras": MODESTA,

	"newbalance": MEDIA, "umbro": MEDIA, "castore": MEDIA,
	"kappa": MEDIA, "hummel": MEDIA, "macron": MEDIA,
	"mizuno": MEDIA, "kelme": MEDIA,

	"joma": MODESTA, "errea": MODESTA, "jako": MODESTA,
	"uhlsport": MODESTA, "lecoq": MODESTA,
	"legea": MODESTA, "acerbis": MODESTA, "givova": MODESTA,
	"zeus": MODESTA, "saller": MODESTA,




	"reebok": MEDIA, "reebok_letras": MEDIA,
	"underarmour": MEDIA, "underarmour_letras": MEDIA, "diadora": MEDIA,
	"capelli": MODESTA, "select": MODESTA, "select_letras": MODESTA,
	"admiral": MODESTA, "patrick": MODESTA,
	"charly": LOCAL, "charly_letras": LOCAL, "pirma": LOCAL, "prospecs": LOCAL,


	"robey": LOCAL, "robey_letras": LOCAL, "volt": LOCAL, "craft": MODESTA,
	"keuka": LOCAL, "mgr": LOCAL, "mgr_letras": LOCAL, "stanno": LOCAL,
	"offside": LOCAL, "skillano": LOCAL, "skillano_letras": LOCAL,
	"sevensports": LOCAL, "sevensports_letras": LOCAL,




	"marathon": MEDIA, "lotto": MODESTA, "boman": MODESTA,
	"walon": LOCAL, "kyrios": LOCAL,
}














const PATROCINADORES: Dictionary = {

	"emirates": ELITE, "etihad": ELITE, "qatarairways": ELITE, "riyadhair": ELITE,
	"standardchartered": ELITE, "spotify": ELITE, "snapdragon": ELITE, "aia": ELITE,
	"redbull": ELITE, "jeep": ELITE, "telekom": ELITE, "volkswagen": ELITE,
	"samsung": ELITE, "vodafone": ELITE, "chevrolet": ELITE, "rakuten": ELITE,
	"siemens": ELITE, "panasonic": ELITE, "philips": ELITE, "sap": ELITE,
	"unicef": ELITE, "msc": ELITE, "cmacgm": ELITE, "royalcaribbean": ELITE,
	"ineos": ELITE, "carrefour": ELITE, "uber": ELITE, "amex": ELITE,
	"bet365": ELITE, "stake": ELITE, "betano": ELITE, "evonik": ELITE,
	"midea": ELITE, "gree": ELITE, "suzuki": ELITE, "petrobras": ELITE,
	"robinhood": ELITE, "polymarket": ELITE, "herbalife": ELITE,

	"sharp": ELITE, "opel": ELITE, "carlsberg": ELITE, "jvc": ELITE,
	"pirelli": ELITE, "sega": ELITE, "mars": ELITE, "danone": ELITE,
	"o2": ELITE, "commodore": ELITE, "tdk": ELITE,
	"teka": ELITE, "aig": ELITE, "candy": ELITE, "crownpaints": ELITE,
	"tim": ELITE, "qatarfoundation": ELITE,


	"estrellagalicia": MEDIA, "betway": MEDIA, "betsson": MEDIA, "bwin": MEDIA,
	"unibet": MEDIA, "winamax": MEDIA, "superbet": MEDIA, "boylesports": MEDIA,
	"eurobet": MEDIA, "hollywoodbets": MEDIA, "sbotop": MEDIA, "ballys": MEDIA,
	"midnite": MEDIA, "copybet": MEDIA, "mrq": MEDIA, "w88": MEDIA,
	"net88": MEDIA, "bj88": MEDIA, "debet": MEDIA,
	"indeed": MEDIA, "rewe": MEDIA, "veltins": MEDIA, "ziggo": MEDIA,
	"crefisa": MEDIA, "brother": MEDIA, "abnamro": MEDIA, "parmalat": MEDIA,
	"quilmes": MEDIA, "holsten": MEDIA, "northernrock": MEDIA, "thomascook": MEDIA,
	"yokohama": MEDIA, "sela": MEDIA, "mediacom": MEDIA, "barmenia": MEDIA,
	"mewa": MEDIA, "wwk": MEDIA, "autodoc": MEDIA, "boulanger": MEDIA,
	"samsic": MEDIA, "europarcs": MEDIA, "brb": MEDIA, "kutxabank": MEDIA,
	"digi": MEDIA, "ifs": MEDIA, "saputo": MEDIA, "mapei": MEDIA,
	"prometeon": MEDIA, "coop": MEDIA, "hansemerkur": MEDIA, "targobank": MEDIA,
	"vonovia": MEDIA, "congstar": MEDIA, "heise": MEDIA, "kerakoll": MEDIA,
	"pulsee": MEDIA, "aircash": MEDIA, "lete": MEDIA, "cynar": MEDIA,
	"sicilybycar": MEDIA, "monzo": MEDIA, "corendon": MEDIA, "fever": MEDIA,
	"blakely": MEDIA, "oneandone": MEDIA, "pamesa": MEDIA, "jobrad": MEDIA,
	"kommerling": MEDIA, "reuter": MEDIA, "raisin": MEDIA, "lbbw": MEDIA,
	"apmmonaco": MEDIA, "auchan": MEDIA, "eds": MEDIA, "synergie": MEDIA,
	"intersport": MEDIA, "novoline": MEDIA, "sweg": MEDIA, "humanas": MEDIA,
	"famila": MEDIA, "hylo": MEDIA, "bahrainvic": MEDIA, "pocruises": MEDIA,
	"plenitude": MEDIA, "haix": MEDIA, "checkcars24": MEDIA, "idealheating": MEDIA,
	"globalcaja": MEDIA, "siroko": MEDIA, "megliobanca": MEDIA, "ifis": MEDIA,
	"bluenergy": MEDIA, "sudtirol": MEDIA, "layerzero": MEDIA, "schwarzwaldmilch": MEDIA,


	"baghdadi": MODESTA, "tmgrupo": MODESTA, "kosner": MODESTA, "tecnocasa": MODESTA,
	"mktiyu": MODESTA, "dani": MODESTA, "marcosauto": MODESTA, "vegafibra": MODESTA,
	"agel": MODESTA, "sardegna": MODESTA, "deghi": MODESTA, "iltainox": MODESTA,
	"fvg": MODESTA, "matthai": MODESTA, "queguiner": MODESTA, "x1": MODESTA,
	"ecolenb": MODESTA, "caravan": MODESTA, "ontime": MODESTA, "aramon": MODESTA,
	"smartlog": MODESTA, "mirandaemp": MODESTA, "kudu": MODESTA,
	"camaragranada": MODESTA, "sabormalaga": MODESTA, "wiggett": MODESTA,
	"reviva": MODESTA, "spudbros": MODESTA, "sinergy": MODESTA, "spigas": MODESTA,
	"cetilar": MODESTA, "toolcraft": MODESTA, "four20": MODESTA,
	"sunminimeal": MODESTA, "hofmann": MODESTA, "brawo": MODESTA,
	"caravenue": MODESTA, "celtigel": MODESTA, "oscaropower": MODESTA,
	"bullux": MODESTA, "maxoutil": MODESTA, "lcr": MODESTA, "jeanflochh": MODESTA,
	"mayenne": MODESTA, "mediaco": MODESTA, "kelyps": MODESTA,








	"kia": ELITE, "isuzu": ELITE, "1xbet": ELITE,
	"tigo": MEDIA, "yango": MEDIA, "aldeassos": MEDIA,
	"noroda": LOCAL, "slotsdelsol": LOCAL, "zerograu": LOCAL, "ueno": LOCAL,
	"virgenrosario": LOCAL, "lacteostrebol": LOCAL, "ochsi": LOCAL,
	"bancopichincha": LOCAL, "pilsener": LOCAL, "solca": LOCAL, "grandaviation": LOCAL,
	"ecuabet": LOCAL, "bancomachala": LOCAL, "mushucruna": LOCAL, "atunisabel": LOCAL,
	"panolini": LOCAL, "draxbet": LOCAL, "opticalosandes": LOCAL, "ohanacar": LOCAL,
	"22dejulio": LOCAL, "bancoguayaquil": LOCAL, "crisfe": LOCAL,
	"coacsanfrancisco": LOCAL, "bancodelaustro": LOCAL, "apuestatotal": LOCAL,
	"cajapiura": LOCAL, "cajacusco": LOCAL, "cajahuancayo": LOCAL, "cajaica": LOCAL,
	"salkantay": LOCAL, "tecnograss": LOCAL, "bitel": LOCAL, "pieers": LOCAL,
	"fimo": LOCAL, "upao": LOCAL, "udh": LOCAL, "grupobeher": LOCAL,
	"llacuabamba": LOCAL, "radiouno": LOCAL, "gchm": LOCAL, "ajani": LOCAL,
	"eso": LOCAL, "belizario": LOCAL, "ecoplaza": LOCAL, "afe": LOCAL,
	"famhora": LOCAL, "manuelugarte": LOCAL, "ucv": LOCAL, "solucredit": LOCAL,
	"tecnoacero": LOCAL, "bancoeconomico": LOCAL, "entel": LOCAL, "4lifegrains": LOCAL,
	"celina": LOCAL, "altavida": LOCAL, "utb": LOCAL, "triunfobet": LOCAL,
	"pdvsa": LOCAL, "estelar": LOCAL, "traki": LOCAL, "frigilux": LOCAL,
	"clxsamsung": LOCAL, "daka": LOCAL, "banplus": LOCAL, "thundernet": LOCAL,
	"campestre": LOCAL, "fospuca": LOCAL, "apuestasroyal": LOCAL,
}




static var _bolsas: Dictionary = {}
static var _sello: String = ""




static func de_club(team_id: String) -> int:
	return _banda(team_id, GameState.div_of(team_id))





static func de_club_base(team_id: String) -> int:
	return _banda(team_id, Teams.base_div(team_id))














static func de_seleccion(nat_id: String) -> int:
	var f: int = Nations.strength(nat_id)
	if f >= RATING_ELITE:
		return ELITE
	if f >= RATING_MEDIA:
		return MEDIA
	return MODESTA




static func de_marca(llave: String, marca: String) -> int:
	var tabla: Dictionary = PATROCINADORES if llave == "sponsor" else MARCAS_DEPORTIVAS
	if llave == "sponsor" and not tabla.has(marca):

		return PatrosBase.banda(marca)
	if llave != "sponsor" and not tabla.has(marca):






		return MarcasBase.banda(marca)
	return int(tabla.get(marca, 0))











static func bolsa(llave: String, banda: int, total: Array) -> Array:
	var sello: String = "%d|%d|%d" % [SponsorLogos.version, KitBrands.version, total.size()]
	if sello != _sello:
		_bolsas = {}
		_sello = sello
	var ck: String = "%s|%d" % [llave, banda]
	if _bolsas.has(ck):
		return _bolsas[ck]
	var out: Array = _de_banda(llave, banda, total)
	if out.size() < 2:
		for vecina in [banda + 1, banda - 1]:
			for m in _de_banda(llave, vecina, total):
				if not out.has(m):
					out.append(m)
			if out.size() >= 2:
				break
	if out.size() < 2:
		out = total.duplicate()
	_bolsas[ck] = out
	return out


static func invalidate() -> void:
	_bolsas = {}
	_sello = ""








static func _banda(team_id: String, div: int) -> int:
	var r: int = Teams.rating(team_id)
	if div <= 1:
		return ELITE if r >= RATING_ELITE else MEDIA
	if div == 2:
		return MEDIA if r >= RATING_MEDIA else MODESTA
	return MODESTA





static func _de_banda(llave: String, banda: int, total: Array) -> Array:
	var out: Array = []
	for m in total:
		var t: int = de_marca(llave, String(m))
		if t == banda or t == 0:
			out.append(String(m))
	return out
