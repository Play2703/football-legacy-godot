class_name UefaSombra
extends RefCounted





















const PREFIJO: String = "us_"
const CLUBES: int = 10



const CIERRE_BASE: int = 2026




const BASE: float = 63.0
const PENDIENTE: float = 8.0


const DIFERENCIA: Array = [0.0, -1.5, -3.0, -4.0, -5.0, -6.0, -7.0, -8.0, -9.0, -10.0]


const RUIDO_LIGA: float = 3.0
const RUIDO_COPA: float = 6.0



const CIUDADES: Dictionary = {
	"Polonia": ["pol", ["Wroclaw", "Poznan", "Gdansk", "Lodz", "Krakow", "Lublin", "Szczecin", "Bialystok", "Katowice", "Rzeszow"]],
	"Chipre": ["cyp", ["Nicosia", "Limassol", "Larnaca", "Paphos", "Famagusta", "Paralimni", "Aradippou", "Achna", "Deryneia", "Polis"]],
	"Israel": ["isr", ["Haifa", "Tel Aviv", "Jerusalem", "Beer Sheva", "Netanya", "Ashdod", "Petah Tikva", "Tiberias", "Sakhnin", "Kiryat Shmona"]],
	"Hungría": ["hun", ["Budapest", "Debrecen", "Gyor", "Szeged", "Pecs", "Kecskemet", "Paks", "Zalaegerszeg", "Nyiregyhaza", "Kisvarda"]],
	"Eslovenia": ["svn", ["Ljubljana", "Maribor", "Celje", "Koper", "Domzale", "Murska Sobota", "Nova Gorica", "Kranj", "Velenje", "Ptuj"]],
	"Azerbaiyán": ["aze", ["Baku", "Ganja", "Sumgait", "Lankaran", "Shamakhi", "Gabala", "Zira", "Sabail", "Mingachevir", "Shusha"]],
	"Eslovaquia": ["svk", ["Bratislava", "Trnava", "Zilina", "Kosice", "Banska Bystrica", "Ruzomberok", "Dunajska Streda", "Trencin", "Michalovce", "Podbrezova"]],
	"Bulgaria": ["bul", ["Sofia", "Plovdiv", "Razgrad", "Varna", "Burgas", "Stara Zagora", "Lovech", "Ruse", "Pleven", "Vratsa"]],
	"Irlanda": ["irl", ["Dublin", "Cork", "Dundalk", "Sligo", "Galway", "Drogheda", "Waterford", "Derry", "Bray", "Limerick"]],
	"Islandia": ["isl", ["Reykjavik", "Akureyri", "Kopavogur", "Hafnarfjordur", "Gardabaer", "Keflavik", "Akranes", "Vestmannaeyjar", "Selfoss", "Grindavik"]],
	"Armenia": ["arm", ["Yerevan", "Gyumri", "Vanadzor", "Abovyan", "Ararat", "Gavar", "Ijevan", "Kapan", "Artashat", "Sevan"]],
	"Moldova": ["mda", ["Chisinau", "Tiraspol", "Balti", "Orhei", "Cahul", "Ungheni", "Soroca", "Comrat", "Hincesti", "Bender"]],
	"Finlandia": ["fin", ["Helsinki", "Tampere", "Turku", "Oulu", "Kuopio", "Seinajoki", "Lahti", "Vaasa", "Jyvaskyla", "Mariehamn"]],
	"Kosovo": ["kos", ["Pristina", "Prizren", "Peja", "Gjilan", "Ferizaj", "Mitrovica", "Gjakova", "Drenas", "Suhareka", "Malisheva"]],
	"Kazajistán": ["kaz", ["Astana", "Almaty", "Shymkent", "Karaganda", "Aktobe", "Pavlodar", "Kostanay", "Atyrau", "Taraz", "Oskemen"]],
	"Letonia": ["lva", ["Riga", "Liepaja", "Daugavpils", "Jelgava", "Ventspils", "Valmiera", "Jurmala", "Rezekne", "Ogre", "Tukums"]],
	"Islas Feroe": ["fro", ["Torshavn", "Klaksvik", "Runavik", "Tvoroyri", "Vagur", "Sorvagur", "Fuglafjordur", "Toftir", "Sandur", "Gota"]],
	"Malta": ["mlt", ["Valletta", "Birkirkara", "Sliema", "Hamrun", "Marsaxlokk", "Mosta", "Qormi", "Zebbug", "Rabat", "Gzira"]],
	"Liechtenstein": ["lie", ["Vaduz", "Balzers", "Eschen", "Schaan", "Triesen", "Ruggell"]],
	"Estonia": ["est", ["Tallinn", "Tartu", "Narva", "Parnu", "Viljandi", "Rakvere", "Kuressaare", "Paide", "Johvi", "Haapsalu"]],
	"Albania": ["alb", ["Tirana", "Durres", "Shkoder", "Elbasan", "Vlore", "Korce", "Fier", "Berat", "Lushnje", "Kukes"]],
	"Macedonia del Norte": ["mkd", ["Skopje", "Bitola", "Kumanovo", "Tetovo", "Ohrid", "Strumica", "Shtip", "Prilep", "Gostivar", "Kavadarci"]],
	"Lituania": ["ltu", ["Vilnius", "Kaunas", "Klaipeda", "Siauliai", "Panevezys", "Marijampole", "Alytus", "Utena", "Jonava", "Telsiai"]],
	"Irlanda del Norte": ["nir", ["Belfast", "Larne", "Coleraine", "Ballymena", "Lurgan", "Portadown", "Dungannon", "Newry", "Carrick", "Enniskillen"]],
	"Gibraltar": ["gib", ["Westside", "Catalan Bay", "Europa Point", "Sandpits", "Upper Town", "South District", "Glacis", "Laguna", "Varyl Begg", "Moorish Castle"]],
	"Andorra": ["and", ["Andorra la Vella", "Escaldes", "Encamp", "Sant Julia", "La Massana", "Ordino", "Canillo", "Santa Coloma", "Pas de la Casa", "Soldeu"]],
	"Bielorrusia": ["blr", ["Minsk", "Borisov", "Brest", "Gomel", "Grodno", "Vitebsk", "Mogilev", "Soligorsk", "Slutsk", "Zhodino"]],
	"Luxemburgo": ["lux", ["Luxembourg", "Esch", "Differdange", "Dudelange", "Petange", "Ettelbruck", "Hesperange", "Wiltz", "Mondorf", "Strassen"]],
	"Montenegro": ["mne", ["Podgorica", "Niksic", "Budva", "Bar", "Herceg Novi", "Cetinje", "Pljevlja", "Berane", "Kotor", "Ulcinj"]],
	"Georgia": ["geo", ["Tbilisi", "Batumi", "Kutaisi", "Rustavi", "Zugdidi", "Gori", "Telavi", "Poti", "Samtredia", "Zestafoni"]],
	"Gales": ["wal", ["Bala", "Newtown", "Connahs Quay", "Bangor", "Aberystwyth", "Llanelli", "Caernarfon", "Barry", "Haverfordwest", "Rhyl"]],
	"San Marino": ["smr", ["Serravalle", "Borgo Maggiore", "Domagnano", "Fiorentino", "Acquaviva", "Faetano", "Chiesanuova", "Montegiardino", "Murata", "Dogana"]],
}




const APODOS: Dictionary = {
	"Polonia": ["Orly", "Gornicy", "Kolejarze", "Portowcy"],
	"Chipre": ["Thrylos", "Galazoi", "Kitrinoi", "Asproi"],
	"Israel": ["Yarok", "Adom", "Tzahov", "Kachol"],
	"Hungría": ["Zoldek", "Lilak", "Pirosak", "Kekek"],
	"Eslovenia": ["Zmaji", "Vijolicni", "Rumeni", "Modri"],
	"Azerbaiyán": ["Atlar", "Qartallar", "Shirler", "Ulduzlar"],
	"Eslovaquia": ["Belasi", "Andeli", "Sokoli", "Medvede"],
	"Bulgaria": ["Orli", "Chervenite", "Sinite", "Lavove"],
	"Irlanda": ["Harps", "Celts", "Wolves", "Swifts"],
	"Islandia": ["Ulfar", "Ernir", "Hrafnar", "Selir"],
	"Armenia": ["Artsivner", "Aryutsner", "Karmir", "Kapuyt"],
	"Moldova": ["Lupii", "Vulturii", "Galbenii", "Albastrii"],
	"Finlandia": ["Karhut", "Sudet", "Kotkat", "Joutsenet"],
	"Kosovo": ["Shqiponjat", "Ujqit", "Kuqezinjte", "Kaltrit"],
	"Kazajistán": ["Barystar", "Burkitter", "Kasqyrlar", "Sunqarlar"],
	"Letonia": ["Vilki", "Ernas", "Lauvas", "Zibens"],
	"Islas Feroe": ["Vikingar", "Ravnar", "Ornar", "Selir"],
	"Malta": ["Lions", "Falcons", "Sharks", "Knights"],
	"Liechtenstein": ["Adler", "Falken", "Steinbock", "Loewen"],
	"Estonia": ["Kotkad", "Hundid", "Karud", "Ilvesed"],
	"Albania": ["Shqiponjat", "Kuqezinjte", "Bardheblu", "Ujqit"],
	"Macedonia del Norte": ["Orli", "Volci", "Lavovi", "Sokoli"],
	"Lituania": ["Vilkai", "Ereliai", "Lokiai", "Sakalai"],
	"Irlanda del Norte": ["Reds", "Blues", "Ironmen", "Mariners"],
	"Gibraltar": ["Rock", "Tigers", "Pirates", "Straits"],
	"Andorra": ["Isards", "Ossos", "Aguiles", "Llops"],
	"Bielorrusia": ["Zubry", "Arly", "Vauki", "Myadzvedzi"],
	"Luxemburgo": ["Leiwen", "Falken", "Wellef", "Staeren"],
	"Montenegro": ["Orlovi", "Vukovi", "Sokolovi", "Lavovi"],
	"Georgia": ["Arwivebi", "Mglebi", "Lomebi", "Kurdghlebi"],
	"Gales": ["Dreigiau", "Barcudiaid", "Bleiddiaid", "Eryrod"],
	"San Marino": ["Titani", "Falchi", "Lupi", "Aquile"],
}


const TELAS: Array = ["c8102e", "1d4ed8", "15803d", "f5f5f5", "111827", "facc15", "7c3aed",
	"ea580c", "0ea5e9", "991b1b", "065f46", "1e3a8a"]

static var _cache: Dictionary = {}
static var _asoc_de_codigo: Dictionary = {}




static func asociaciones() -> Array:
	return CIUDADES.keys()


static func es_sombra(id: String) -> bool:
	return id.begins_with(PREFIJO)



static func tiene_liga(asoc: String) -> bool:
	return CIUDADES.has(asoc) and not AccesoUefa.SIN_LIGA.has(asoc)



static func clubes(asoc: String) -> Array:
	var fila: Array = CIUDADES.get(asoc, [])
	if fila.is_empty():
		return []
	var out: Array = []
	for i in (fila[1] as Array).size():
		out.append("%s%s_%d" % [PREFIJO, String(fila[0]), i + 1])
	return out



static func asoc_de(id: String) -> String:
	if not es_sombra(id):
		return ""
	if _asoc_de_codigo.is_empty():
		for a in CIUDADES:
			_asoc_de_codigo[String(CIUDADES[a][0])] = String(a)
	var partes: PackedStringArray = id.substr(PREFIJO.length()).split("_")
	return String(_asoc_de_codigo.get(partes[0] if partes.size() == 2 else "", ""))





static func fuerza(id: String) -> float:
	var c: Dictionary = club(id)
	return float(c.get("fuerza", 0.0))




static func club(id: String) -> Dictionary:
	if _cache.has(id):
		return _cache[id]
	var asoc: String = asoc_de(id)
	if asoc.is_empty():
		return {}
	var n: int = int(id.get_slice("_", 2))
	var ciudades: Array = CIUDADES[asoc][1]
	if n < 1 or n > ciudades.size():
		return {}
	var ciudad: String = String(ciudades[n - 1])
	var apodos: Array = APODOS[asoc]
	var campeon: float = BASE + PENDIENTE * log(1.0 + CoefUefa.coef_asoc(asoc, CIERRE_BASE))
	var h: int = hash("sombra|club|" + id)
	var f: float = campeon + float(DIFERENCIA[n - 1]) +(float(posmod(h, 121)) - 60.0) / 100.0
	var t1: int = posmod(h>>8, TELAS.size())
	var t2: int = posmod((h>>16) + 1 + t1, TELAS.size())
	if t2 == t1:
		t2 =(t1 + 3) % TELAS.size()
	var e: Dictionary = {
		"id": id,
		"name": "%s %s" % [ciudad, String(apodos[(n - 1) % apodos.size()])],
		"abbrev": _siglas(asoc, n),
		"country": asoc, "league": asoc, "div": 1,
		"rating": clampi(roundi(f), 57, 99),
		"kit": Color(String(TELAS[t1])), "kit2": Color(String(TELAS[t2])),
		"shape": "round" if posmod(h>>4, 2) == 0 else "shield",
		"crest_pattern": ["solid", "vstripes", "halved"][posmod(h>>12, 3)],
		"emblem": "letters", "emblem_tone": "gold", "rim": "gold",
		"fuerza": f, "sombra": true,
	}
	_cache[id] = e
	return e





static func _siglas(asoc: String, n: int) -> String:
	var usadas: Dictionary = {}
	var out: String = ""
	for i in n:
		var ciudad: String = String(CIUDADES[asoc][1][i])
		var junta: String = ciudad.replace(" ", "").replace("-", "")
		var cands: Array = [junta.substr(0, 3)]
		var palabras: PackedStringArray = ciudad.split(" ", false)
		if palabras.size() > 1:
			cands.append(palabras[0].substr(0, 1) + palabras[1].substr(0, 2))
		cands.append(junta.substr(0, 2) + junta.right(1))
		cands.append(junta.substr(0, 1) + junta.substr(2, 2))
		out = String(cands[0]).to_upper()
		for c in cands:
			if not usadas.has(String(c).to_upper()):
				out = String(c).to_upper()
				break
		usadas[out] = true
	return out





static func tabla(asoc: String, season: int) -> Array:
	if not tiene_liga(asoc):
		return []
	return _orden(clubes(asoc), "sombra|%s|%d" % [asoc, season], RUIDO_LIGA)



static func copa(asoc: String, season: int) -> String:
	var ids: Array = clubes(asoc)
	if ids.is_empty():
		return ""
	return String(_orden(ids, "sombra|copa|%s|%d" % [asoc, season], RUIDO_COPA)[0])


static func _orden(ids: Array, sal: String, ruido: float) -> Array:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(sal)
	var nota: Dictionary = {}
	for id in ids:
		nota[id] = fuerza(String(id)) + rng.randfn(0.0, ruido)
	var out: Array = ids.duplicate()

	out.sort_custom(func(a: String, b: String) -> bool:
		if not is_equal_approx(float(nota[a]), float(nota[b])):
			return float(nota[a]) > float(nota[b])
		return a < b)
	return out
