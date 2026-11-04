class_name Stadiums
extends RefCounted
































const CLUBS: Dictionary = {

	"rma": "Santiago Bernabéu", "bar": "Camp Nou", "atm": "Metropolitano",
	"gir": "Montilivi", "ath": "San Mamés", "rso": "Anoeta",
	"bet": "Benito Villamarín", "vil": "La Cerámica", "sev": "Ramón Sánchez-Pizjuán",
	"val": "Mestalla", "osa": "El Sadar", "cel": "Balaídos", "get": "Coliseum",
	"ray": "Vallecas", "mll": "Son Moix", "alv": "Mendizorroza",
	"lpa": "Gran Canaria", "esp": "Cornellà-El Prat", "ovi": "Carlos Tartiere",
	"vad": "José Zorrilla",

	"mci": "Etihad Stadium", "liv": "Anfield", "ars": "Emirates Stadium",
	"che": "Stamford Bridge", "mun": "Old Trafford", "tot": "Tottenham Hotspur Stadium",
	"new": "St James' Park", "avl": "Villa Park", "bhi": "Falmer Stadium",
	"whu": "London Stadium", "wol": "Molineux", "cry": "Selhurst Park",
	"eve": "Goodison Park", "ful": "Craven Cottage", "bre": "Gtech Community Stadium",
	"nfo": "City Ground", "bou": "Vitality Stadium", "lce": "King Power Stadium",
	"lee": "Elland Road", "sun": "Stadium of Light",

	"int": "San Siro", "juv": "Allianz Stadium", "mil": "San Siro",
	"nap": "Diego Armando Maradona", "ata": "Gewiss Stadium", "rom": "Olimpico de Roma",
	"laz": "Olimpico de Roma", "fio": "Artemio Franchi", "bol": "Renato Dall'Ara",
	"tor": "Olimpico Grande Torino", "udi": "Bluenergy Stadium", "mnz": "U-Power Stadium",
	"gen": "Luigi Ferraris", "cag": "Unipol Domus", "lec": "Via del Mare",
	"vrn": "Marcantonio Bentegodi", "emp": "Carlo Castellani", "sas": "Mapei Stadium",
	"par": "Ennio Tardini", "cre": "Giovanni Zini",

	"bay": "Allianz Arena", "lev": "BayArena", "dor": "Signal Iduna Park",
	"lei": "Red Bull Arena", "stu": "MHPArena", "fra": "Deutsche Bank Park",
	"wob": "Volkswagen Arena", "fbg": "Europa-Park Stadion", "hof": "PreZero Arena",
	"bmg": "Borussia-Park", "fcu": "An der Alten Försterei", "svw": "Weserstadion",
	"m05": "Mewa Arena", "fca": "WWK Arena", "boc": "Ruhrstadion",
	"koe": "RheinEnergieStadion", "bsc": "Olympiastadion de Berlín", "s04": "Veltins-Arena",

	"pari": "Parque de los Príncipes", "mars": "Vélodrome", "mon": "Louis II",
	"lyo": "Groupama Stadium", "lil": "Pierre-Mauroy", "niz": "Allianz Riviera",
	"ren": "Roazhon Park", "len": "Bollaert-Delelis", "estr": "La Meinau",
	"nan": "La Beaujoire", "mont": "La Mosson", "tou": "Stadium de Toulouse",
	"bres": "Francis-Le Blé", "rei": "Auguste-Delaune", "leh": "Stade Océane",
	"aux": "Abbé-Deschamps", "ang": "Raymond-Kopa", "sai": "Geoffroy-Guichard",

	"ame": "Estadio Azteca", "mty": "Estadio BBVA", "tig": "El Volcán",
	"caz": "Ciudad de los Deportes", "gdl": "Estadio Akron", "tol": "Nemesio Díez",
	"pac": "Estadio Hidalgo", "leo": "Estadio León", "san": "Estadio Corona",
	"pum": "Olímpico Universitario", "atl": "Estadio Jalisco", "tij": "Estadio Caliente",
	"nec": "Estadio Victoria", "pue": "Cuauhtémoc", "que": "La Corregidora",
	"maz": "El Encanto", "jua": "Olímpico Benito Juárez", "asl": "Alfonso Lastras",

	"ben": "Estádio da Luz", "por": "Do Dragão", "spo": "José Alvalade",
	"bra": "Municipal de Braga", "vit": "D. Afonso Henriques", "mar": "Dos Barreiros",
	"riv": "Arcos", "fam": "Municipal de Famalicão", "gil": "Cidade de Barcelos",
	"ptm": "Municipal de Portimão", "est": "António Coimbra da Mota",
	"aro": "Municipal de Arouca", "cha": "Municipal de Chaves", "cpa": "Pina Manique",
	"viz": "Municipal de Vizela", "mre": "Comendador Joaquim Freitas",
	"stc": "São Miguel", "boa": "Do Bessa",

	"ajax": "Johan Cruyff Arena", "psv": "Philips Stadion", "fey": "De Kuip",
	"aza": "AFAS Stadion", "twe": "De Grolsch Veste", "utr": "Galgenwaard",
	"vite": "GelreDome", "hee": "Abe Lenstra Stadion", "gro": "Euroborg",
	"necn": "De Goffert", "spa": "Het Kasteel", "goa": "De Adelaarshorst",
	"for": "Fortuna Sittard Stadion", "her": "Erve Asito", "pec": "Oosterenk",
	"wil": "Koning Willem II Stadion", "rkc": "Mandemakers Stadion", "alm": "Yanmar Stadion",

	"fla": "Maracanã", "palm": "Allianz Parque", "cori": "Neo Química Arena",
	"sao": "Morumbi", "flu": "Maracanã", "bot": "Nilton Santos",
	"grem": "Arena do Grêmio", "inte": "Beira-Rio", "atle": "Arena MRV",
	"cru": "Mineirão", "vas": "São Januário", "sant": "Vila Belmiro",
	"bah": "Arena Fonte Nova", "fort": "Castelão", "athl": "Ligga Arena",
	"brag": "Nabi Abi Chedid", "vito": "Barradão", "juve": "Alfredo Jaconi",

	"boca": "La Bombonera", "rive": "Monumental", "raci": "El Cilindro",
	"ind": "Libertadores de América", "sanl": "Nuevo Gasómetro",
	"estu": "Jorge Luis Hirschi", "vel": "José Amalfitani",
	"tal": "Mario Alberto Kempes", "ros": "Gigante de Arroyito",
	"newe": "Coloso Marcelo Bielsa", "arge": "Diego Armando Maradona",
	"lan": "La Fortaleza", "def": "Norberto Tomaghello", "hur": "Tomás Adolfo Ducó",
	"ban": "Florencio Sola", "god": "Malvinas Argentinas",
	"gim": "Juan Carmelo Zerillo", "ins": "Monumental de Alta Córdoba",

	"arg_ald": "José María Minella", "arg_atu": "Monumental José Fierro", "arg_bar": "Claudio Chiqui Tapia",
	"arg_bel": "Julio César Villagra", "arg_ccb": "Alfredo Terrera", "arg_rie": "Guillermo Laza",
	"arg_ivr": "Bautista Gargantini", "arg_pla": "Ciudad de Vicente López", "arg_sar": "Eva Perón",
	"arg_tig": "José Dellagiovanna", "arg_uni": "15 de Abril",









	"nzl_akc": "Kiwitea Street", "nzl_afr": "Kiwitea Street", "nzl_wpr": "Fraser Park",
	"nzl_bir": "Shepherds Park", "nzl_eas": "Madills Farm", "nzl_aku": "Keith Hay Park",
	"nzl_npr": "Bluewater Stadium", "nzl_wol": "Wakefield Park",
	"nzl_mir": "David Farrington Park", "nzl_cas": "Garrick Memorial Park",
	"nzl_fer": "Ferrymead Park", "nzl_wsp": "Seddon Fields", "nzl_cos": "Tāne Norton Park",
	"nzl_chu": "United Sports Centre", "nzl_wsu": "Endeavour Park", "nzl_ecb": "Bay City Park",
	"nzl_fen": "Riverhills Park", "nzl_bay": "Olympic Park",

	"nzl_tau": "Links Avenue Reserve", "nzl_mel": "Gower Park", "nzl_mku": "Centre Park",
	"nzl_uhc": "Maidstone Park", "nzl_iby": "Wakefield Park", "nzl_wka": "Karori Park",
	"nzl_pet": "Memorial Park", "nzl_fcw": "Lynmouth Park", "nzl_nom": "Tulett Park",
	"nzl_nel": "Saxton Field", "nzl_nor": "Caledonian Ground", "nzl_dcr": "Logan Park",
	"nzl_wan": "Wānaka Recreation Centre", "nzl_sel": "Foster Park",
	"nzl_wcr": "Fred Taylor Park", "nzl_man": "Mountfort Park", "nzl_ham": "Porritt Stadium",
	"nzl_nsu": "Allen Hill Stadium",

	"nzl_cam": "John Kerkhof Park", "nzl_ell": "Michaels Avenue", "nzl_hib": "Stanmore Bay Park",
	"nzl_map": "Anderson Park", "nzl_nro": "McFetridge Park", "nzl_omu": "Māngere Domain",
	"nzl_tak": "Taharoto Park", "nzl_tpo": "Crown Park", "nzl_nwe": "Alex Moore Park",
	"nzl_lhc": "Fraser Park", "nzl_wun": "Newtown Park", "nzl_sto": "Hutt Park",
	"nzl_hnw": "Guthrie Park", "nzl_wai": "Memorial Park", "nzl_uca": "Ilam Fields",
	"nzl_hal": "Halswell Domain", "nzl_mos": "Memorial Gardens", "nzl_gri": "Sunnyvale Park",
}




















const ALL_FOOTPRINTS: Array = ["bowl_closed", "rect_open", "horseshoe", "main_L",
	"two_side", "athletics", "bowl_round", "coliseo", "octagono", "catedral",
	"velas", "ucl_anillos", "mundial_membrana", "eul_principal", "conf_caldera",
	"principal_doble", "cubierta_membrana", "fondo_kop", "fondo_bloques",
	"sin_fondo_arboles", "dos_aguas", "campo_hundido", "pantallon", "fondo_arco",
	"terraplen", "gradas_tubo", "muro_de_pie", "tres_anillos", "fondo_banderas",
	"tribuna_postes", "torre_reloj", "campo_coches", "fondo_chimeneas",

	"piel_envolvente", "lateral_plano", "anillo_colgado", "techo_dientes",
	"columnata", "cubierta_flotante", "torres_rampa", "calabaza",
	"puerta_monumental", "ola_vidrio", "cu_olimpico", "azteca_coloso",

	"bombonera", "monumental_river",

	"camp_nou"]




















const CAPACITIES: Dictionary = {
	"rma": 78297, "bar": 105000, "atm": 70460, "gir": 14624, "ath": 53289, "rso": 39500,
	"bet": 60721, "vil": 23500, "sev": 43883, "val": 49430, "osa": 23576, "cel": 24870,
	"get": 17393, "ray": 14708, "mll": 23142, "alv": 19840, "lpa": 32400, "esp": 40000,
	"ovi": 30500, "vad": 27618, "mci": 53400, "liv": 61276, "ars": 60704, "che": 40173,
	"mun": 74310, "tot": 62850, "new": 52305, "avl": 42918, "bhi": 31800, "whu": 62500,
	"wol": 31750, "cry": 25486, "eve": 39414, "ful": 29589, "bre": 17250, "nfo": 30404,
	"bou": 11307, "lce": 32262, "lee": 37645, "sun": 49000, "int": 75923, "juv": 41507,
	"mil": 75923, "nap": 54726, "ata": 24950, "rom": 70634, "laz": 70634, "fio": 43147,
	"bol": 36462, "tor": 27994, "udi": 25144, "mnz": 15039, "gen": 33205, "cag": 16416,
	"lec": 31533, "vrn": 39211, "emp": 16284, "sas": 21584, "par": 22885, "cre": 20641,
	"bay": 75024, "lev": 30210, "dor": 81365, "lei": 47069, "stu": 60449, "fra": 58000,
	"wob": 28917, "fbg": 34700, "hof": 30150, "bmg": 54042, "fcu": 22012, "svw": 42100,
	"m05": 33305, "fca": 30660, "boc": 26000, "koe": 50000, "bsc": 74475, "s04": 62271,
	"pari": 47929, "mars": 67394, "mon": 18523, "lyo": 59186, "lil": 50186, "niz": 35624,
	"ren": 29778, "len": 38058, "estr": 26109, "nan": 37473, "mont": 32900, "tou": 33150,
	"bres": 15931, "rei": 21684, "leh": 25178, "aux": 18541, "ang": 18752, "sai": 41965,
	"ame": 87523, "mty": 53500, "tig": 42000, "caz": 33042, "gdl": 49850, "tol": 30000,
	"pac": 30000, "leo": 31297, "san": 29000, "pum": 68954, "atl": 55020, "tij": 27333,
	"nec": 25000, "pue": 51726, "que": 33162, "maz": 20195, "jua": 19703, "asl": 25709,
	"ben": 64642, "por": 50033, "spo": 50095, "bra": 30286, "vit": 30029, "mar": 5000,
	"riv": 5000, "fam": 5307, "gil": 12504, "ptm": 9544, "est": 9288, "aro": 5000,
	"cha": 8000, "cpa": 5000, "viz": 6000, "mre": 6153, "stc": 12500, "boa": 28263,
	"ajax": 55865, "psv": 35000, "fey": 51117, "aza": 19478, "twe": 30205, "utr": 23750,
	"vite": 21248, "hee": 27224, "gro": 22550, "necn": 12500, "spa": 11026, "goa": 10400,
	"for": 12500, "her": 13050, "pec": 14000, "wil": 14700, "rkc": 7508, "alm": 4501,
	"fla": 78838, "palm": 43713, "cori": 49205, "sao": 66795, "flu": 78838, "bot": 44661,
	"grem": 55225, "inte": 50128, "atle": 46000, "cru": 61846, "vas": 21880, "sant": 16068,
	"bah": 47907, "fort": 63903, "athl": 42372, "brag": 15010, "vito": 30618, "juve": 19924,
	"boca": 57200, "rive": 85018, "raci": 51389, "ind": 48069, "sanl": 47964, "estu": 30018,
	"vel": 49540, "tal": 57000, "ros": 41654, "newe": 42000, "arge": 24800, "lan": 47027,
	"def": 18000, "hur": 48314, "ban": 34901, "god": 40268, "gim": 33000, "ins": 27000,
	"arg_ald": 35354, "arg_atu": 32700, "arg_bar": 4400, "arg_bel": 28000, "arg_ccb": 16000, "arg_rie": 3000,
	"arg_ivr": 24000, "arg_pla": 28530, "arg_sar": 22000, "arg_tig": 26282, "arg_uni": 22852,




	"nzl_akc": 3500, "nzl_afr": 2000, "nzl_wpr": 2000, "nzl_bir": 1500, "nzl_eas": 2000,
	"nzl_aku": 1500, "nzl_npr": 5000, "nzl_wol": 2000, "nzl_mir": 2500, "nzl_cas": 2000,
	"nzl_fer": 1000, "nzl_wsp": 1500, "nzl_cos": 1000, "nzl_chu": 2500, "nzl_wsu": 2000,
	"nzl_ecb": 1500, "nzl_fen": 1000, "nzl_bay": 1500,
	"nzl_tau": 2000, "nzl_mel": 1500, "nzl_mku": 1000, "nzl_uhc": 1500, "nzl_iby": 1000,
	"nzl_wka": 1500, "nzl_pet": 2000, "nzl_fcw": 1000, "nzl_nom": 1000, "nzl_nel": 2000,
	"nzl_nor": 3000, "nzl_dcr": 1000, "nzl_wan": 1000, "nzl_sel": 1000, "nzl_wcr": 1500,
	"nzl_man": 1500, "nzl_ham": 3000, "nzl_nsu": 2000,
	"nzl_cam": 1000, "nzl_ell": 1000, "nzl_hib": 1000, "nzl_map": 1000, "nzl_nro": 1000,
	"nzl_omu": 1000, "nzl_tak": 1000, "nzl_tpo": 1000, "nzl_nwe": 1000, "nzl_lhc": 1500,
	"nzl_wun": 2000, "nzl_sto": 1000, "nzl_hnw": 1000, "nzl_wai": 1500, "nzl_uca": 1000,
	"nzl_hal": 1000, "nzl_mos": 1000, "nzl_gri": 1000,
}




const NATION_CAPACITIES: Dictionary = {
	"Alemania": 74475, "Arabia Saudí": 58798, "Argentina": 85018,
	"Austria": 50865, "Brasil": 78838, "Bélgica": 50093,
	"Chequia": 19370, "Chile": 48665, "Colombia": 36343,
	"Corea del Sur": 66704, "Croacia": 24851, "Dinamarca": 38065,
	"Egipto": 75000, "Escocia": 51866, "España": 57619, "Sudáfrica": 94736,
	"Estados Unidos": 88565, "Francia": 80698, "Gales": 73931,
	"Grecia": 69618, "Hungría": 67215, "Inglaterra": 90000,
	"Irlanda": 51700, "Italia": 70634, "Japón": 68000,
	"México": 87523, "Noruega": 27200, "Países Bajos": 55865,
	"Perú": 40272, "Polonia": 58274, "Portugal": 64642,
	"Rusia": 81000, "Serbia": 51755, "Suecia": 50000,
	"Suiza": 31783, "Turquía": 76092, "Ucrania": 70050,
	"Uruguay": 60235,


	"Paraguay": 34451, "Ecuador": 41575, "Bolivia": 41143, "Venezuela": 51796,



	"Marruecos": 69500, "Túnez": 65000,




	"Nueva Zelanda": 50000, "Fiyi": 15000, "Tahití": 11700, "Nueva Caledonia": 10000,



	"Rumanía": 55634,



	"Bosnia y Herzegovina": 15292,
}




static func capacity_of(team_id: String) -> int:
	return int(CAPACITIES.get(team_id, 0))



static func nation_capacity(nation_name: String) -> int:
	return int(NATION_CAPACITIES.get(nation_name, 0))



































const FOOTPRINTS: Dictionary = {

	"rma": "piel_envolvente", "bar": "camp_nou", "atm": "piel_envolvente", "gir": "rect_open",
	"ath": "piel_envolvente", "rso": "bowl_closed", "bet": "fondo_kop", "vil": "rect_open",
	"sev": "fondo_kop", "val": "tres_anillos", "osa": "bowl_closed", "cel": "rect_open",
	"get": "rect_open", "ray": "horseshoe", "mll": "bowl_closed", "alv": "rect_open",
	"lpa": "athletics", "esp": "bowl_closed", "ovi": "rect_open", "vad": "bowl_closed",

	"zar": "bowl_closed", "spg": "bowl_closed", "lvt": "horseshoe", "leg": "horseshoe",
	"hue": "fondo_banderas", "eib": "eul_principal", "car": "eul_principal", "rac": "fondo_banderas",
	"mir": "eul_principal", "elc": "horseshoe", "almu": "dos_aguas", "gra": "fondo_bloques",
	"albc": "campo_hundido", "burg": "fondo_chimeneas", "cas": "dos_aguas", "cba": "torre_reloj",
	"mag": "fondo_bloques", "dpc": "dos_aguas", "cad": "bowl_closed",

	"alc": "rect_open", "ponf": "rect_open", "nast": "rect_open", "alge": "main_L",
	"sab": "gradas_tubo", "lug": "main_L", "nns": "gradas_tubo", "real": "main_L",
	"bara": "gradas_tubo", "teru": "rect_open", "ibi": "rect_open", "cul": "rect_open",
	"zmo": "rect_open", "mer": "athletics", "our": "terraplen", "are": "main_L",
	"avi": "fondo_chimeneas", "agu": "rect_open",

	"mci": "bowl_round", "liv": "fondo_kop", "ars": "bowl_closed", "che": "rect_open",
	"mun": "bowl_closed", "tot": "muro_de_pie", "new": "eul_principal", "avl": "fondo_kop",
	"bhi": "ola_vidrio", "whu": "athletics", "wol": "rect_open", "cry": "rect_open",
	"eve": "tribuna_postes", "ful": "dos_aguas", "bre": "rect_open", "nfo": "rect_open",
	"bou": "gradas_tubo", "bnl": "pantallon", "lee": "fondo_kop", "sun": "bowl_closed",

	"lce": "bowl_closed", "ips": "dos_aguas", "shw": "fondo_bloques", "der": "fondo_bloques",
	"blb": "torre_reloj", "oxf": "gradas_tubo", "sou": "eul_principal", "shu": "dos_aguas",
	"nor": "horseshoe", "wat": "bowl_closed", "mlw": "horseshoe", "wba": "torre_reloj",
	"mid": "rect_open", "covc": "fondo_bloques", "stk": "torre_reloj", "hul": "fondo_chimeneas",
	"swa": "campo_hundido", "pne": "fondo_bloques", "brc": "fondo_bloques", "qpr": "athletics",
	"bir": "fondo_bloques", "pmo": "gradas_tubo",

	"ply": "main_L", "bfd": "terraplen", "lut": "rect_open", "rot": "rect_open",
	"brn": "main_L", "wre": "rect_open", "bolt": "rect_open", "barn": "main_L",
	"read": "main_L", "ch": "gradas_tubo", "bla": "rect_open", "pet": "main_L",
	"ste": "rect_open", "lin": "rect_open", "wig": "terraplen", "cdf": "gradas_tubo",
	"hud": "main_L", "wyc": "main_L", "lor": "fondo_chimeneas", "exe": "rect_open",
	"cbu": "sin_fondo_arboles", "bta": "campo_coches",

	"int": "torres_rampa", "juv": "bowl_closed", "mil": "torres_rampa", "nap": "athletics",
	"ata": "rect_open", "rom": "athletics", "laz": "athletics", "fio": "torre_reloj",
	"bol": "athletics", "tor": "bowl_closed", "udi": "cubierta_membrana", "mnz": "rect_open",
	"gen": "torre_reloj", "cag": "gradas_tubo", "lec": "athletics", "vrn": "athletics",
	"emp": "rect_open", "sas": "rect_open", "par": "dos_aguas", "cre": "dos_aguas",

	"smp": "torre_reloj", "pal": "campo_hundido", "bri": "torre_reloj", "ven": "fondo_bloques",
	"com": "campo_hundido", "ter": "fondo_chimeneas", "cse": "dos_aguas", "prd": "campo_hundido",
	"mnt": "campo_hundido", "brsc": "fondo_chimeneas", "spe": "athletics", "frs": "athletics",
	"saln": "athletics", "pis": "athletics", "cit": "athletics", "mod": "gradas_tubo",
	"ctz": "athletics", "sud": "athletics",

	"tern": "main_L", "peru": "fondo_chimeneas", "cat": "fondo_chimeneas", "fog": "terraplen",
	"ave": "fondo_chimeneas", "vic": "terraplen", "pado": "athletics", "pes": "terraplen",
	"trie": "fondo_chimeneas", "crot": "two_side", "bnv": "sin_fondo_arboles", "jst": "sin_fondo_arboles",
	"cst": "terraplen", "tar": "two_side", "spal": "campo_coches", "nov": "two_side",
	"rim": "campo_coches", "arz": "sin_fondo_arboles",

	"bay": "piel_envolvente", "lev": "cubierta_membrana", "dor": "muro_de_pie", "lei": "bowl_round",
	"stu": "cubierta_flotante", "fra": "cubierta_membrana", "wob": "rect_open", "fbg": "rect_open",
	"hof": "rect_open", "bmg": "bowl_closed", "fcu": "muro_de_pie", "svw": "bowl_round",
	"m05": "rect_open", "fca": "rect_open", "boc": "rect_open", "koe": "bowl_closed",
	"bsc": "puerta_monumental", "s04": "cubierta_membrana",

	"hsv": "eul_principal", "f95": "horseshoe", "fcn": "eul_principal", "fck": "horseshoe",
	"h96": "bowl_closed", "ksc": "tribuna_postes", "pad": "tribuna_postes", "snd": "tribuna_postes",
	"aue": "eul_principal", "vrl": "horseshoe", "stpl": "dos_aguas", "sgf": "fondo_bloques",
	"bts": "dos_aguas", "fcm": "dos_aguas", "sv98": "campo_hundido", "ksv": "fondo_chimeneas",
	"elv": "dos_aguas",

	"dyn": "gradas_tubo", "rotw": "rect_open", "186": "main_L", "saa": "main_L",
	"ing": "gradas_tubo", "erzg": "main_L", "wald": "gradas_tubo", "osn": "rect_open",
	"ver": "main_L", "sand": "main_L", "bie": "rect_open", "hro": "terraplen",
	"msv": "athletics", "aac": "athletics", "swh": "main_L", "uha": "main_L",
	"sku": "athletics", "hfc": "terraplen",

	"ame": "azteca_coloso", "mty": "cubierta_membrana", "tig": "fondo_kop", "caz": "campo_hundido",
	"gdl": "cubierta_membrana", "tol": "rect_open", "pac": "bowl_closed", "leo": "bowl_closed",
	"san": "bowl_closed", "pum": "cu_olimpico", "atl": "bowl_round", "tij": "rect_open",
	"nec": "bowl_closed", "pue": "bowl_round", "que": "bowl_closed", "maz": "rect_open",
	"jua": "athletics", "asl": "rect_open",

	"mor": "fondo_banderas", "atn": "dos_aguas", "cya": "bowl_closed", "drd": "fondo_banderas",
	"tam": "fondo_banderas", "cor": "eul_principal", "lnn": "bowl_closed", "vnd": "tribuna_postes",
	"tep": "fondo_chimeneas", "cun": "campo_hundido", "at": "eul_principal", "dora": "dos_aguas",
	"tmp": "fondo_bloques", "cim": "fondo_chimeneas", "vena": "dos_aguas", "leon": "fondo_bloques",
	"tepa": "fondo_chimeneas", "tlt": "dos_aguas",

	"cela": "rect_open", "canc": "gradas_tubo", "chih": "main_L", "ipc": "rect_open",
	"yal": "rect_open", "hzp": "rect_open", "gvm": "gradas_tubo", "cma": "gradas_tubo",
	"rvz": "main_L", "lpd": "main_L", "zmr": "main_L", "uup": "athletics",
	"cli": "fondo_chimeneas", "czh": "athletics", "acp": "terraplen", "calo": "rect_open",
	"tec": "terraplen", "cor2": "fondo_chimeneas",

	"ben": "cubierta_membrana", "por": "rect_open", "spo": "bowl_closed", "bra": "two_side",
	"vit": "rect_open", "mar": "athletics", "riv": "rect_open", "fam": "main_L",
	"gil": "rect_open", "ptm": "athletics", "est": "main_L", "aro": "main_L",
	"cha": "rect_open", "cpa": "athletics", "viz": "main_L", "mre": "main_L",
	"stc": "rect_open", "boa": "rect_open",

	"ncl": "bowl_closed", "tnd": "dos_aguas", "far": "eul_principal", "aca": "horseshoe",
	"fei": "horseshoe", "lix": "horseshoe", "maf": "tribuna_postes", "cov": "eul_principal",
	"pen": "horseshoe", "tro": "dos_aguas", "vav": "dos_aguas", "avs": "campo_hundido",
	"uma": "torre_reloj", "via": "campo_hundido", "pao": "rect_open", "bln": "campo_hundido",
	"alvp": "dos_aguas", "tir": "campo_hundido",

	"torr": "rect_open", "leca": "gradas_tubo", "faf": "main_L", "ana": "rect_open",
	"sanj": "main_L", "cal": "main_L", "amo": "rect_open", "oli": "gradas_tubo",
	"vila": "main_L", "cane": "gradas_tubo", "var": "rect_open", "slg": "athletics",
	"atcp": "fondo_chimeneas", "lus": "fondo_chimeneas", "sjv": "rect_open", "fel": "rect_open",
	"pev": "main_L", "brgz": "fondo_chimeneas",

	"pari": "bowl_closed", "mars": "cubierta_membrana", "mon": "athletics", "lyo": "bowl_closed",
	"lil": "cubierta_membrana", "niz": "cubierta_membrana", "ren": "rect_open", "len": "techo_dientes",
	"estr": "rect_open", "nan": "bowl_closed", "mont": "athletics", "tou": "athletics",
	"bres": "rect_open", "rei": "rect_open", "leh": "bowl_closed", "aux": "rect_open",
	"ang": "dos_aguas", "sai": "techo_dientes",

	"met": "horseshoe", "bur": "eul_principal", "gui": "eul_principal", "cae": "tribuna_postes",
	"gren": "dos_aguas", "ami": "dos_aguas", "aja": "tribuna_postes", "bas": "tribuna_postes",
	"pau": "eul_principal", "rod": "bowl_closed", "tro2": "fondo_chimeneas", "clf": "dos_aguas",
	"lor2": "campo_hundido", "lav": "torre_reloj", "ann": "torre_reloj", "mtg": "fondo_chimeneas",
	"pfc": "fondo_chimeneas", "dij": "fondo_bloques",

	"red": "gradas_tubo", "nanc": "rect_open", "soc": "main_L", "chat": "rect_open",
	"orl": "gradas_tubo", "dun": "main_L", "lem": "main_L", "vill": "rect_open",
	"con": "main_L", "nim": "main_L", "bou2": "main_L", "vsl": "athletics",
	"cho": "main_L", "rue": "main_L", "avr": "main_L", "bbp": "athletics",
	"mgn": "main_L", "fle": "fondo_chimeneas",

	"ajax": "cubierta_membrana", "psv": "anillo_colgado", "fey": "anillo_colgado", "aza": "rect_open",
	"twe": "rect_open", "utr": "rect_open", "vite": "cubierta_membrana", "hee": "rect_open",
	"gro": "rect_open", "necn": "athletics", "spa": "torre_reloj", "goa": "main_L",
	"for": "rect_open", "her": "rect_open", "pec": "rect_open", "wil": "rect_open",
	"rkc": "rect_open", "alm": "rect_open",

	"vol": "dos_aguas", "roda": "bowl_closed", "deg": "bowl_closed", "cam": "dos_aguas",
	"den": "horseshoe", "fce": "dos_aguas", "dord": "tribuna_postes", "vvv": "eul_principal",
	"hel": "bowl_closed", "emm": "bowl_closed", "jaj": "torre_reloj", "jps": "fondo_chimeneas",
	"jaz": "dos_aguas", "jut": "rect_open", "exr": "campo_hundido", "dtr": "fondo_bloques",
	"ijs": "torre_reloj", "koz": "rect_open",

	"top": "main_L", "tel": "gradas_tubo", "mvv": "gradas_tubo", "ado": "main_L",
	"kat": "main_L", "qui": "rect_open", "spak": "rect_open", "rij": "rect_open",
	"exc": "rect_open", "sch": "rect_open", "asw": "gradas_tubo", "noo": "rect_open",
	"bad": "terraplen", "hhc": "terraplen", "vvs": "terraplen", "snk": "main_L",
	"dvs": "rect_open", "ex31": "main_L",

	"fla": "bowl_round", "palm": "rect_open", "cori": "pantallon", "sao": "bowl_round",
	"flu": "bowl_round", "bot": "athletics", "grem": "bowl_closed", "inte": "cubierta_membrana",
	"atle": "bowl_closed", "cru": "columnata", "vas": "dos_aguas", "sant": "rect_open",
	"bah": "horseshoe", "fort": "columnata", "athl": "cubierta_membrana", "brag": "main_L",
	"vito": "rect_open", "juve": "rect_open",

	"spor": "tribuna_postes", "cea": "fondo_banderas", "goi": "horseshoe", "crt": "fondo_banderas",
	"pon": "fondo_banderas", "gua": "eul_principal", "nau": "fondo_banderas", "amer": "horseshoe",
	"chap": "fondo_banderas", "ava": "eul_principal", "vno": "rect_open", "ope": "campo_hundido",
	"nvz": "campo_hundido", "mir2": "fondo_bloques", "amz": "torre_reloj", "bruq": "campo_hundido",
	"cri": "dos_aguas", "prg2": "fondo_chimeneas",

	"pay": "gradas_tubo", "rem": "main_L", "abc": "rect_open", "crb": "main_L",
	"csa": "rect_open", "bota": "gradas_tubo", "fig": "main_L", "lon": "gradas_tubo",
	"sam": "main_L", "itu": "main_L", "vre": "gradas_tubo", "sjo2": "fondo_chimeneas",
	"atc": "main_L", "fer2": "athletics", "cnf": "athletics", "apa": "athletics",
	"flo": "rect_open", "cax": "fondo_chimeneas",

	"boca": "bombonera", "rive": "monumental_river", "raci": "bowl_round", "ind": "fondo_banderas",
	"sanl": "fondo_banderas", "estu": "rect_open", "vel": "rect_open", "tal": "athletics",
	"ros": "fondo_banderas", "newe": "fondo_banderas", "arge": "rect_open", "lan": "fondo_banderas",
	"def": "rect_open", "hur": "dos_aguas", "ban": "rect_open", "god": "athletics",
	"gim": "sin_fondo_arboles", "ins": "rect_open",
	"arg_ald": "athletics", "arg_atu": "fondo_banderas", "arg_bar": "two_side", "arg_bel": "fondo_banderas",
	"arg_ccb": "rect_open", "arg_rie": "two_side", "arg_ivr": "rect_open", "arg_pla": "horseshoe",
	"arg_sar": "rect_open", "arg_tig": "fondo_kop", "arg_uni": "fondo_banderas",

	"colo": "tribuna_postes", "chac": "horseshoe", "sanm": "fondo_banderas", "atla": "bowl_closed",
	"fer": "fondo_banderas", "nue": "fondo_banderas", "quil": "dos_aguas", "dep": "fondo_banderas",
	"almi": "fondo_banderas", "gimn": "tribuna_postes", "alb2": "fondo_chimeneas", "dbe": "fondo_bloques",
	"smi": "fondo_bloques", "erc": "fondo_chimeneas", "alv3": "fondo_chimeneas", "agr": "fondo_bloques",
	"gue": "fondo_chimeneas", "rcb": "fondo_chimeneas",

	"tem": "rect_open", "los": "rect_open", "tri": "rect_open", "comu": "gradas_tubo",
	"sac": "main_L", "vll": "gradas_tubo", "snt": "rect_open", "flan": "main_L",
	"depo": "rect_open", "acas": "rect_open", "clg": "gradas_tubo", "aqu": "fondo_chimeneas",
	"cnu": "terraplen", "fnx": "fondo_chimeneas", "tre": "rect_open", "exc2": "main_L",
	"itz": "terraplen", "uai": "terraplen",

	"ntr": "tres_anillos", "lag": "pantallon", "losa": "cubierta_membrana", "sea": "velas",
	"tln": "cubierta_membrana", "port": "bowl_closed", "newy": "cubierta_membrana", "nwy": "fondo_kop",
	"colu": "pantallon", "phi": "pantallon", "fcc": "pantallon", "nas": "pantallon",
	"aust": "cubierta_membrana", "spr": "cubierta_membrana", "rea": "cubierta_membrana", "clr": "bowl_round",
	"min": "horseshoe", "orla": "bowl_round",
	"usa_clt": "bowl_closed", "usa_chi": "pantallon", "usa_dcu": "pantallon", "usa_dal": "pantallon",
	"usa_hou": "pantallon", "usa_mtl": "rect_open", "usa_nwe": "bowl_closed", "usa_sdg": "bowl_round",
	"usa_sje": "pantallon", "usa_stl": "cubierta_membrana", "usa_tor": "pantallon", "usa_van": "cubierta_membrana",

	"sacr": "tribuna_postes", "sana": "tribuna_postes", "lou": "horseshoe", "tamp": "tribuna_postes",
	"indy": "dos_aguas", "pho": "fondo_banderas", "elp": "campo_hundido", "det": "fondo_bloques",
	"mem": "torre_reloj", "newm": "dos_aguas", "cos": "dos_aguas", "bhl": "fondo_chimeneas",
	"hfd": "rect_open", "rif": "dos_aguas", "mby": "torre_reloj", "ocs": "rect_open",
	"oak": "gradas_tubo", "pgh": "athletics",

	"cht": "rect_open", "char": "rect_open", "gree": "gradas_tubo", "uni": "rect_open",
	"ric": "main_L", "one": "rect_open", "forw": "main_L", "nort": "rect_open",
	"sout": "rect_open", "spok": "athletics", "lex": "rect_open", "txm": "main_L",
	"phm": "rect_open", "wch": "main_L", "avl2": "rect_open", "crw": "main_L",
	"nap2": "campo_coches", "dsm": "campo_coches",

	"alh": "tres_anillos", "aln": "muro_de_pie", "ali": "pantallon", "ala": "bowl_round",
	"als": "bowl_round", "ale": "velas", "alt": "cubierta_membrana", "alf": "bowl_closed",
	"alfa": "pantallon", "alr": "bowl_closed", "alk": "fondo_arco", "alw": "fondo_banderas",
	"alra": "pantallon", "dam": "bowl_round", "alo": "pantallon", "alha": "pantallon",
	"alq": "velas", "alor": "velas",

	"alkh": "horseshoe", "alb": "dos_aguas", "alna": "fondo_banderas", "neo": "fondo_banderas",
	"alj": "tribuna_postes", "oho": "fondo_banderas", "alan": "horseshoe", "lfs": "tribuna_postes",
	"jed": "tribuna_postes", "haj": "tribuna_postes", "jnd": "fondo_bloques", "saf": "campo_hundido",
	"ain": "fondo_chimeneas", "shl": "rect_open", "raw": "fondo_chimeneas", "bkr": "rect_open",
	"jbl": "campo_hundido", "thq": "dos_aguas",

	"lnh": "gradas_tubo", "alad": "main_L", "alz": "gradas_tubo", "albu": "gradas_tubo",
	"alar": "gradas_tubo", "alta": "main_L", "alwa": "main_L", "alju": "gradas_tubo",
	"alsh": "rect_open", "ent": "gradas_tubo", "ghra": "athletics", "amj": "rect_open",
	"hej": "terraplen", "kwk": "fondo_chimeneas", "lew": "athletics", "qai": "main_L",
	"nay": "fondo_chimeneas",

	"gal": "tres_anillos", "fen": "fondo_banderas", "bes": "muro_de_pie", "tra": "tres_anillos",
	"basa": "fondo_banderas", "ada": "cubierta_membrana", "kon": "cubierta_membrana", "kay": "muro_de_pie",
	"ant": "tres_anillos", "lny": "pantallon", "siv": "catedral", "kas": "catedral",
	"gaz": "cubierta_membrana", "riz": "bowl_closed", "sams": "pantallon", "hat": "bowl_round",
	"ank": "cubierta_membrana", "bod": "pantallon",

	"eyu": "bowl_closed", "goz": "fondo_banderas", "band": "fondo_banderas", "koc": "eul_principal",
	"bolu": "bowl_closed", "erz": "eul_principal", "sak": "bowl_closed", "man": "fondo_banderas",
	"snl": "fondo_banderas", "coru": "dos_aguas", "gnc": "dos_aguas", "amd": "rect_open",
	"igd": "torre_reloj", "pnd": "torre_reloj", "ese": "torre_reloj", "srk": "fondo_chimeneas",
	"erb": "dos_aguas", "krs": "campo_hundido",

	"umr": "gradas_tubo", "kec": "gradas_tubo", "lty": "gradas_tubo", "adan": "gradas_tubo",
	"deni": "gradas_tubo", "burs": "rect_open", "kar": "main_L", "bal": "rect_open",
	"men": "main_L", "isp": "rect_open", "krk": "rect_open", "nzs": "fondo_chimeneas",
	"sry": "rect_open", "byo": "main_L", "znk": "rect_open", "vns": "fondo_chimeneas",
	"kah": "athletics", "sms": "main_L",

	"clu": "tres_anillos", "and": "muro_de_pie", "genk": "tres_anillos", "amb": "muro_de_pie",
	"gan": "fondo_arco", "sta": "tres_anillos", "unio": "fondo_banderas", "cer": "cubierta_membrana",
	"chr": "pantallon", "mal": "cubierta_membrana", "sin": "velas", "ohl": "bowl_closed",
	"wes": "catedral", "kort": "bowl_round", "dend": "bowl_closed", "bee": "velas",
	"eup": "bowl_round", "zul": "bowl_closed",

	"rwd": "tribuna_postes", "lom": "horseshoe", "lie": "eul_principal", "dei": "fondo_banderas",
	"skb": "eul_principal", "pat": "dos_aguas", "jon": "dos_aguas", "club": "horseshoe",
	"rsc": "fondo_banderas", "ser": "fondo_banderas", "lkt": "dos_aguas", "rfl": "campo_hundido",
	"vrt": "fondo_chimeneas", "hei": "campo_hundido", "dsl": "rect_open", "hoo": "campo_hundido",
	"tub": "dos_aguas", "unm": "fondo_bloques",

	"lal": "main_L", "fran": "rect_open", "tie": "gradas_tubo", "kno": "main_L",
	"mand": "main_L", "rup": "rect_open", "nin": "gradas_tubo", "oly": "rect_open",
	"win": "gradas_tubo", "the": "gradas_tubo", "geel": "gradas_tubo", "rme": "athletics",
	"spm": "terraplen", "aal": "fondo_chimeneas", "bch": "main_L", "reb": "fondo_chimeneas",
	"onh": "main_L", "ham": "rect_open",

	"sco_cel": "tres_anillos", "sco_ran": "bowl_closed", "sco_hea": "velas", "sco_hib": "bowl_closed",
	"sco_abe": "cubierta_membrana", "sco_dut": "bowl_round", "sco_mot": "pantallon", "sco_kil": "velas",
	"sco_stm": "catedral", "sco_dun": "cubierta_membrana", "sco_fal": "horseshoe", "sco_liv": "campo_hundido",
	"sco_ros": "campo_hundido", "sco_stj": "campo_hundido", "sco_par": "bowl_round", "sco_rai": "bowl_round",
	"sco_dfl": "bowl_round", "sco_ayr": "horseshoe",

	"sco_mtn": "fondo_bloques", "sco_air": "rect_open", "sco_qpk": "torre_reloj", "sco_ham": "fondo_chimeneas",
	"sco_ict": "torre_reloj", "sco_arb": "torre_reloj", "sco_all": "rect_open", "sco_cov": "rect_open",
	"sco_mon": "campo_hundido", "sco_qos": "campo_hundido", "sco_stn": "athletics", "sco_edc": "fondo_bloques",
	"sco_bon": "gradas_tubo", "sco_spt": "gradas_tubo", "sco_alb": "athletics", "sco_brc": "fondo_bloques",
	"sco_cow": "gradas_tubo", "sco_esh": "athletics",

	"sco_dbn": "rect_open", "sco_sti": "fondo_chimeneas", "sco_pth": "terraplen", "sco_elg": "terraplen",
	"sco_frf": "main_L", "sco_ste": "fondo_chimeneas", "sco_efi": "rect_open", "sco_ann": "fondo_chimeneas",
	"sco_cly": "rect_open", "sco_kel": "two_side", "sco_css": "sin_fondo_arboles", "sco_trn": "two_side",
	"sco_bwk": "terraplen", "sco_buc": "terraplen", "sco_fra": "terraplen", "sco_bro": "terraplen",
	"sco_cbr": "two_side", "sco_lin": "terraplen",

	"gre_oly": "muro_de_pie", "gre_paok": "fondo_banderas", "gre_aek": "fondo_arco", "gre_pan": "catedral",
	"gre_ari": "bowl_round", "gre_ofi": "bowl_round", "gre_vol": "catedral", "gre_atr": "cubierta_membrana",
	"gre_ast": "cubierta_membrana", "gre_pnt": "catedral", "gre_lam": "bowl_round", "gre_lev": "bowl_round",
	"gre_kif": "coliseo", "gre_pas": "horseshoe", "gre_psr": "campo_hundido", "gre_ael": "bowl_round",
	"gre_klm": "horseshoe", "gre_klt": "bowl_round",

	"gre_ira": "campo_hundido", "gre_xan": "fondo_chimeneas", "gre_pio": "campo_hundido", "gre_aps": "fondo_bloques",
	"gre_ion": "rect_open", "gre_cha": "dos_aguas", "gre_nkv": "campo_hundido", "gre_erg": "fondo_chimeneas",
	"gre_mak": "fondo_bloques", "gre_ega": "torre_reloj", "gre_aio": "fondo_bloques", "gre_mrk": "athletics",
	"gre_ovo": "athletics", "gre_ilp": "athletics", "gre_rod": "athletics", "gre_kis": "athletics",
	"gre_eth": "athletics", "gre_pel": "athletics",

	"gre_ver": "athletics", "gre_pch": "terraplen", "gre_kav": "athletics", "gre_dox": "terraplen",
	"gre_app": "rect_open", "gre_tri": "rect_open", "gre_dia": "fondo_chimeneas", "gre_ank": "athletics",
	"gre_pgl": "athletics", "gre_pro": "campo_coches", "gre_arp": "terraplen", "gre_the": "sin_fondo_arboles",
	"gre_pie": "campo_coches", "gre_alp": "two_side", "gre_kam": "campo_coches", "gre_nes": "terraplen",
	"gre_epa": "two_side", "gre_zak": "campo_coches",

	"ukr_shk": "pantallon", "ukr_dyn": "bowl_round", "ukr_pol": "velas", "ukr_lnz": "catedral",
	"ukr_kry": "bowl_closed", "ukr_olk": "catedral", "ukr_zor": "velas", "ukr_m25": "catedral",
	"ukr_kol": "cubierta_membrana", "ukr_kar": "cubierta_membrana", "ukr_vor": "velas", "ukr_ver": "velas",
	"ukr_ruk": "catedral", "ukr_cho": "horseshoe", "ukr_obo": "bowl_round", "ukr_epi": "horseshoe",
	"ukr_kud": "bowl_round", "ukr_scp": "horseshoe",

	"ukr_lbk": "fondo_bloques", "ukr_inh": "fondo_bloques", "ukr_mtk": "torre_reloj", "ukr_buk": "torre_reloj",
	"ukr_ahr": "fondo_chimeneas", "ukr_pry": "campo_hundido", "ukr_nyt": "fondo_bloques", "ukr_pod": "campo_hundido",
	"ukr_vik": "torre_reloj", "ukr_mtz": "fondo_bloques", "ukr_kre": "gradas_tubo", "ukr_nby": "athletics",
	"ukr_vpk": "gradas_tubo", "ukr_yar": "fondo_bloques", "ukr_lis": "athletics", "ukr_per": "fondo_bloques",
	"ukr_chk": "gradas_tubo", "ukr_agt": "gradas_tubo",

	"ukr_che": "rect_open", "ukr_fmr": "rect_open", "ukr_zir": "athletics", "ukr_uzh": "terraplen",
	"ukr_nyv": "main_L", "ukr_hir": "fondo_chimeneas", "ukr_lok": "athletics", "ukr_rph": "main_L",
	"ukr_dnz": "athletics", "ukr_ska": "sin_fondo_arboles", "ukr_krs": "terraplen", "ukr_blk": "campo_coches",
	"ukr_tav": "sin_fondo_arboles", "ukr_khl": "sin_fondo_arboles", "ukr_kpl": "sin_fondo_arboles", "ukr_trs": "campo_coches",
	"ukr_dch": "sin_fondo_arboles", "ukr_yed": "two_side",

	"aut_sal": "fondo_kop", "aut_stu": "fondo_banderas", "aut_rap": "pantallon", "aut_auw": "bowl_round",
	"aut_las": "bowl_closed", "aut_wac": "velas", "aut_har": "velas", "aut_alt": "bowl_round",
	"aut_akl": "cubierta_membrana", "aut_bwl": "velas", "aut_wsg": "pantallon", "aut_rie": "catedral",
	"aut_gak": "bowl_round", "aut_skn": "bowl_round", "aut_lus": "bowl_round", "aut_vie": "bowl_round",
	"aut_adm": "horseshoe", "aut_kap": "bowl_round",

	"aut_lie": "tribuna_postes", "aut_fac": "dos_aguas", "aut_leo": "dos_aguas", "aut_laf": "fondo_chimeneas",
	"aut_ams": "campo_hundido", "aut_hor": "fondo_chimeneas", "aut_voi": "dos_aguas", "aut_bre": "fondo_bloques",
	"aut_wel": "dos_aguas", "aut_dor": "fondo_chimeneas", "aut_yov": "rect_open", "aut_rp2": "torre_reloj",
	"aut_st2": "gradas_tubo", "aut_voe": "gradas_tubo", "aut_alh": "gradas_tubo", "aut_deu": "fondo_bloques",
	"aut_trb": "gradas_tubo", "aut_wei": "fondo_bloques",

	"aut_inn": "rect_open", "aut_wsc": "gradas_tubo", "aut_aus": "athletics", "aut_ste": "athletics",
	"aut_kre": "rect_open", "aut_mat": "main_L", "aut_wne": "fondo_chimeneas", "aut_str": "fondo_chimeneas",
	"aut_gur": "fondo_chimeneas", "aut_wor": "main_L", "aut_san": "rect_open", "aut_lbd": "two_side",
	"aut_tra": "sin_fondo_arboles", "aut_bgl": "campo_coches", "aut_kal": "terraplen", "aut_kre2": "terraplen",
	"aut_ebr": "campo_coches", "aut_prn": "terraplen",

	"sui_ybb": "cubierta_membrana", "sui_bas": "fondo_banderas", "sui_ser": "pantallon", "sui_lug": "bowl_round",
	"sui_stg": "bowl_round", "sui_zur": "bowl_closed", "sui_luz": "cubierta_membrana", "sui_lau": "pantallon",
	"sui_gra": "bowl_round", "sui_sio": "bowl_closed", "sui_thu": "bowl_closed", "sui_win": "coliseo",
	"sui_yve": "campo_hundido", "sui_aar": "campo_hundido", "sui_vad": "horseshoe", "sui_xam": "coliseo",
	"sui_bel": "horseshoe", "sui_wil": "campo_hundido",

	"sui_slo": "campo_hundido", "sui_sch": "fondo_chimeneas", "sui_car": "campo_hundido", "sui_rap": "torre_reloj",
	"sui_nyo": "campo_hundido", "sui_bad": "torre_reloj", "sui_cham": "rect_open", "sui_bru": "rect_open",
	"sui_bre": "dos_aguas", "sui_kon": "fondo_chimeneas", "sui_sco": "athletics", "sui_zug": "gradas_tubo",
	"sui_bsc": "athletics", "sui_si2": "fondo_bloques", "sui_yb2": "fondo_bloques", "sui_bs2": "fondo_bloques",
	"sui_lg2": "fondo_bloques", "sui_zh2": "fondo_bloques",

	"sui_cdf": "athletics", "sui_bie": "athletics", "sui_chi": "athletics", "sui_loc": "terraplen",
	"sui_kri": "rect_open", "sui_bul": "fondo_chimeneas", "sui_del": "fondo_chimeneas", "sui_woh": "athletics",
	"sui_gre": "rect_open", "sui_obb": "two_side", "sui_sv2": "two_side", "sui_lu2": "two_side",
	"sui_mns": "campo_coches", "sui_buo": "campo_coches", "sui_slt": "two_side", "sui_hon": "terraplen",
	"sui_tug": "sin_fondo_arboles", "sui_bav": "terraplen",

	"cze_slv": "pantallon", "cze_spa": "cubierta_membrana", "cze_plz": "catedral", "cze_ost": "catedral",
	"cze_olo": "cubierta_membrana", "cze_lib": "bowl_round", "cze_jab": "bowl_round", "cze_bol": "velas",
	"cze_slc": "cubierta_membrana", "cze_hrk": "bowl_round", "cze_boh": "bowl_round", "cze_tep": "pantallon",
	"cze_duk": "bowl_round", "cze_kar": "horseshoe", "cze_par": "campo_hundido", "cze_zln": "bowl_round",
	"cze_brn": "horseshoe", "cze_cbu": "horseshoe",

	"cze_opa": "bowl_closed", "cze_jih": "horseshoe", "cze_ziz": "fondo_bloques", "cze_pri": "fondo_chimeneas",
	"cze_tri": "fondo_chimeneas", "cze_vla": "campo_hundido", "cze_chr": "fondo_chimeneas", "cze_tab": "fondo_bloques",
	"cze_pro": "fondo_chimeneas", "cze_ust": "torre_reloj", "cze_dkl": "fondo_chimeneas", "cze_lsn": "fondo_bloques",
	"cze_sp2": "gradas_tubo", "cze_sl2": "gradas_tubo", "cze_vme": "gradas_tubo", "cze_krm": "athletics",
	"cze_bo2": "gradas_tubo", "cze_zbr": "fondo_bloques",

	"cze_vit": "rect_open", "cze_kla": "main_L", "cze_sok": "main_L", "cze_var": "terraplen",
	"cze_vys": "main_L", "cze_kdv": "athletics", "cze_pis": "rect_open", "cze_frm": "fondo_chimeneas",
	"cze_zno": "fondo_chimeneas", "cze_mot": "main_L", "cze_uno": "fondo_chimeneas", "cze_hlu": "campo_coches",
	"cze_ubr": "campo_coches", "cze_bla": "sin_fondo_arboles", "cze_ros": "terraplen", "cze_zbu": "campo_coches",
	"cze_ben": "campo_coches", "cze_dom": "terraplen",

	"cro_din": "fondo_kop", "cro_haj": "pantallon", "cro_rij": "pantallon", "cro_osi": "velas",
	"cro_lok": "catedral", "cro_var": "velas", "cro_sla": "bowl_closed", "cro_gor": "cubierta_membrana",
	"cro_ist": "catedral", "cro_sib": "catedral", "cro_vuk": "catedral", "cro_cib": "bowl_round",
	"cro_zag": "bowl_round", "cro_rud": "coliseo", "cro_hdr": "bowl_round", "cro_zad": "coliseo",
	"cro_dug": "horseshoe", "cro_ori": "bowl_round",

	"cro_dub": "fondo_bloques", "cro_kar": "dos_aguas", "cro_med": "rect_open", "cro_ses": "campo_hundido",
	"cro_zmi": "dos_aguas", "cro_sol": "dos_aguas", "cro_bsk": "torre_reloj", "cro_jar": "fondo_chimeneas",
	"cro_opa": "rect_open", "cro_bje": "fondo_bloques", "cro_dja": "athletics", "cro_os2": "gradas_tubo",
	"cro_ri2": "gradas_tubo", "cro_hj2": "gradas_tubo", "cro_dz2": "gradas_tubo", "cro_zdr": "fondo_bloques",
	"cro_zup": "athletics", "cro_bed": "athletics",

	"cro_mar": "terraplen", "cro_seg": "terraplen", "cro_kus": "main_L", "cro_bel": "fondo_chimeneas",
	"cro_vin": "rect_open", "cro_spo": "rect_open", "cro_jun": "athletics", "cro_pom": "athletics",
	"cro_ner": "rect_open", "cro_zri": "sin_fondo_arboles", "cro_ned": "campo_coches", "cro_iva": "two_side",
	"cro_trn": "two_side", "cro_spb": "sin_fondo_arboles", "cro_rkr": "campo_coches", "cro_zel": "campo_coches",
	"cro_usk": "campo_coches", "cro_bis": "terraplen",

	"srb_czv": "pantallon", "srb_par": "bowl_closed", "srb_voj": "catedral", "srb_cuk": "cubierta_membrana",
	"srb_tsc": "pantallon", "srb_rkg": "bowl_round", "srb_rni": "bowl_closed", "srb_spa": "bowl_round",
	"srb_nap": "catedral", "srb_ofk": "velas", "srb_jav": "catedral", "srb_mla": "bowl_round",
	"srb_imt": "campo_hundido", "srb_npz": "coliseo", "srb_rsu": "campo_hundido", "srb_zpa": "bowl_round",
	"srb_jub": "horseshoe", "srb_met": "campo_hundido",

	"srb_rad": "tribuna_postes", "srb_voz": "dos_aguas", "srb_bor": "bowl_closed", "srb_gra": "horseshoe",
	"srb_mac": "rect_open", "srb_ind": "torre_reloj", "srb_kol": "campo_hundido", "srb_zem": "fondo_bloques",
	"srb_slu": "campo_hundido", "srb_dub": "dos_aguas", "srb_loz": "dos_aguas", "srb_try": "torre_reloj",
	"srb_sme": "dos_aguas", "srb_slp": "torre_reloj", "srb_rsm": "gradas_tubo", "srb_zla": "gradas_tubo",
	"srb_hak": "fondo_bloques", "srb_bbp": "gradas_tubo",

	"srb_pro": "main_L", "srb_tek": "gradas_tubo", "srb_slk": "gradas_tubo", "srb_jag": "rect_open",
	"srb_bez": "fondo_chimeneas", "srb_sin": "terraplen", "srb_zbg": "terraplen", "srb_tim": "main_L",
	"srb_bud": "main_L", "srb_rpi": "fondo_chimeneas", "srb_dvr": "main_L", "srb_mvh": "athletics",
	"srb_kab": "fondo_chimeneas", "srb_slr": "main_L", "srb_rzr": "sin_fondo_arboles", "srb_mns": "sin_fondo_arboles",
	"srb_spt": "terraplen", "srb_pol": "terraplen",

	"den_fck": "fondo_arco", "den_fcm": "pantallon", "den_bif": "catedral", "den_agf": "bowl_round",
	"den_fcn": "bowl_closed", "den_sif": "bowl_round", "den_rfc": "catedral", "den_vff": "bowl_round",
	"den_ob": "catedral", "den_aab": "pantallon", "den_lyn": "bowl_closed", "den_vbk": "bowl_round",
	"den_sje": "campo_hundido", "den_fcf": "bowl_round", "den_hvi": "bowl_round", "den_efb": "horseshoe",
	"den_hbk": "horseshoe", "den_hik": "coliseo",

	"den_ven": "bowl_closed", "den_hor": "tribuna_postes", "den_fam": "fondo_chimeneas", "den_kif": "fondo_bloques",
	"den_hil": "torre_reloj", "den_nyk": "campo_hundido", "den_nas": "fondo_chimeneas", "den_aaf": "fondo_bloques",
	"den_bra": "dos_aguas", "den_mid": "fondo_chimeneas", "den_ros": "fondo_chimeneas", "den_frm": "dos_aguas",
	"den_hel": "gradas_tubo", "den_bsh": "athletics", "den_dal": "gradas_tubo", "den_mrl": "gradas_tubo",
	"den_ish": "athletics", "den_hor3": "fondo_bloques",

	"den_kb": "rect_open", "den_ab": "rect_open", "den_frem": "rect_open", "den_b93": "rect_open",
	"den_van": "terraplen", "den_hol": "athletics", "den_ski": "main_L", "den_thi": "main_L",
	"den_jam": "rect_open", "den_ava": "rect_open", "den_vrd": "rect_open", "den_vej": "two_side",
	"den_rin": "two_side", "den_odd": "terraplen", "den_tar": "terraplen", "den_lys": "campo_coches",
	"den_syd": "campo_coches", "den_kje": "sin_fondo_arboles",

	"nor_gli": "fondo_kop", "nor_vik": "pantallon", "nor_rbk": "bowl_closed", "nor_mol": "bowl_round",
	"nor_bra": "cubierta_membrana", "nor_lsk": "pantallon", "nor_val": "catedral", "nor_ffk": "bowl_closed",
	"nor_til": "catedral", "nor_srp": "cubierta_membrana", "nor_kbk": "pantallon", "nor_sif": "bowl_round",
	"nor_aaf": "bowl_round", "nor_sta": "coliseo", "nor_sfj": "bowl_round", "nor_fkh": "horseshoe",
	"nor_ham": "campo_hundido", "nor_kfu": "campo_hundido",

	"nor_odd": "dos_aguas", "nor_stb": "bowl_closed", "nor_lyn": "bowl_closed", "nor_sog": "dos_aguas",
	"nor_bry": "dos_aguas", "nor_sul": "fondo_bloques", "nor_ran": "rect_open", "nor_rau": "fondo_bloques",
	"nor_asa": "dos_aguas", "nor_kil": "fondo_bloques", "nor_tmd": "dos_aguas", "nor_kv2": "rect_open",
	"nor_ho2": "rect_open", "nor_gru": "fondo_bloques", "nor_kvh": "athletics", "nor_flo": "gradas_tubo",
	"nor_brt": "athletics", "nor_fol": "gradas_tubo",

	"nor_mos": "gradas_tubo", "nor_hod": "gradas_tubo", "nor_eik": "main_L", "nor_skd": "gradas_tubo",
	"nor_mif": "rect_open", "nor_str": "terraplen", "nor_jer": "athletics", "nor_uki": "fondo_chimeneas",
	"nor_not": "fondo_chimeneas", "nor_lev": "rect_open", "nor_ork": "rect_open", "nor_elv": "athletics",
	"nor_stb2": "fondo_chimeneas", "nor_vrd": "fondo_chimeneas", "nor_frl": "campo_coches", "nor_are": "campo_coches",
	"nor_alt": "two_side", "nor_nrd": "campo_coches",

	"jpn_vis": "tres_anillos", "jpn_kas": "bowl_round", "jpn_kaw": "fondo_kop", "jpn_ura": "tres_anillos",
	"jpn_yfm": "fondo_kop", "jpn_san": "velas", "jpn_gam": "pantallon", "jpn_fct": "bowl_round",
	"jpn_mac": "catedral", "jpn_cer": "bowl_closed", "jpn_nag": "cubierta_membrana", "jpn_rey": "cubierta_membrana",
	"jpn_kyo": "cubierta_membrana", "jpn_avi": "bowl_round", "jpn_ver": "pantallon", "jpn_spu": "cubierta_membrana",
	"jpn_alb": "bowl_round", "jpn_sho": "coliseo",
	"jpn_oka": "athletics",

	"jpn_sag": "fondo_banderas", "jpn_yfc": "horseshoe", "jpn_con": "fondo_banderas", "jpn_jub": "eul_principal",
	"jpn_jef": "eul_principal", "jpn_vva": "horseshoe", "jpn_veg": "fondo_bloques", "jpn_ven": "campo_hundido",
	"jpn_mon": "rect_open", "jpn_omi": "rect_open", "jpn_ehi": "fondo_chimeneas", "jpn_toy": "fondo_chimeneas",
	"jpn_iwa": "campo_hundido", "jpn_tok": "fondo_bloques", "jpn_ren": "rect_open", "jpn_thes": "fondo_chimeneas",
	"jpn_oit": "gradas_tubo", "jpn_mit": "athletics",

	"jpn_mya": "main_L", "jpn_tochi": "gradas_tubo", "jpn_ryu": "gradas_tubo", "jpn_zwe": "rect_open",
	"jpn_nap": "gradas_tubo", "jpn_kag": "rect_open", "jpn_gif": "gradas_tubo", "jpn_gir": "athletics",
	"jpn_gai": "rect_open", "jpn_kam": "athletics", "jpn_ima": "athletics", "jpn_nar": "terraplen",
	"jpn_tot": "athletics", "jpn_yso": "main_L", "jpn_tky": "athletics", "jpn_azu": "rect_open",
	"jpn_tsu": "terraplen", "jpn_fuk": "terraplen",

	"kor_uls": "muro_de_pie", "kor_jbk": "fondo_kop", "kor_poh": "bowl_round", "kor_sel": "cubierta_membrana",
	"kor_suw": "bowl_round", "kor_inc": "cubierta_membrana", "kor_dae": "catedral", "kor_gan": "catedral",
	"kor_gwj": "bowl_closed", "kor_jej": "pantallon", "kor_swf": "cubierta_membrana", "kor_djn": "catedral",
	"kor_gim": "pantallon", "kor_any": "horseshoe", "kor_seg": "coliseo", "kor_bus": "bowl_round",
	"kor_jnd": "horseshoe", "kor_buc": "bowl_round",

	"kor_gyn": "tribuna_postes", "kor_asa": "campo_hundido", "kor_ans": "rect_open", "kor_chn": "fondo_bloques",
	"kor_eld": "fondo_banderas", "kor_gpo": "dos_aguas", "kor_cju": "dos_aguas", "kor_hwa": "rect_open",
	"kor_ghe": "torre_reloj", "kor_sih": "torre_reloj", "kor_jec": "dos_aguas", "kor_yng": "rect_open",
	"kor_dgk": "gradas_tubo", "kor_hwc": "fondo_bloques", "kor_gum": "athletics", "kor_yeo": "fondo_bloques",
	"kor_jin": "gradas_tubo", "kor_dan": "gradas_tubo",

	"kor_gju": "gradas_tubo", "kor_gng": "main_L", "kor_dkr": "fondo_chimeneas", "kor_ulc": "main_L",
	"kor_mok": "main_L", "kor_paj": "fondo_chimeneas", "kor_yap": "athletics", "kor_poc": "fondo_chimeneas",
	"kor_chw": "athletics", "kor_btc": "rect_open", "kor_ich": "main_L", "kor_jnr": "terraplen",
	"kor_ptk": "campo_coches", "kor_chu": "two_side", "kor_goy": "campo_coches", "kor_now": "two_side",
	"kor_ygj": "terraplen", "kor_cjf": "campo_coches",

	"col_nac": "cubierta_membrana", "col_mil": "tres_anillos", "col_ame": "bowl_round", "col_jun": "bowl_round",
	"col_dim": "bowl_closed", "col_sfe": "catedral", "col_tol": "velas", "col_cali": "pantallon",
	"col_buc": "cubierta_membrana", "col_onc": "cubierta_membrana", "col_agu": "velas", "col_per": "velas",
	"col_ali": "cubierta_membrana", "col_for": "campo_hundido", "col_pas": "bowl_round", "col_equ": "campo_hundido",
	"col_env": "coliseo", "col_uma": "campo_hundido",

	"col_lla": "fondo_banderas", "col_chi": "dos_aguas", "col_cuc": "fondo_chimeneas", "col_hui": "dos_aguas",
	"col_pat": "fondo_bloques", "col_jag": "rect_open", "col_car": "dos_aguas", "col_qui": "fondo_chimeneas",
	"col_cun": "torre_reloj", "col_leo": "dos_aguas", "col_bmg": "rect_open", "col_tgb": "gradas_tubo",
	"col_dpb": "gradas_tubo", "col_rsn": "gradas_tubo", "col_umg": "athletics", "col_clb": "gradas_tubo",
	"col_amb": "gradas_tubo",

	"col_cor": "gradas_tubo", "col_bqa": "main_L", "col_bog": "terraplen", "col_ors": "main_L",
	"col_val": "main_L", "col_tig": "athletics", "col_atf": "terraplen", "col_int": "main_L",
	"col_pop": "terraplen", "col_ant": "rect_open", "col_mib": "rect_open", "col_sog": "campo_coches",
	"col_gdt": "sin_fondo_arboles", "col_ipi": "two_side", "col_fbl": "terraplen", "col_psb": "campo_coches",
	"col_mtr": "sin_fondo_arboles", "col_zip": "sin_fondo_arboles",

	"chi_col": "pantallon", "chi_uch": "muro_de_pie", "chi_uca": "pantallon", "chi_pal": "velas",
	"chi_coq": "bowl_round", "chi_hua": "bowl_closed", "chi_ohg": "bowl_closed", "chi_aud": "bowl_closed",
	"chi_ues": "pantallon", "chi_nub": "bowl_round", "chi_cbs": "bowl_closed", "chi_eve": "catedral",
	"chi_iqq": "bowl_round", "chi_cal": "cubierta_membrana", "chi_ser": "bowl_round", "chi_cbl": "campo_hundido",
	"chi_lmc": "horseshoe", "chi_mag": "campo_hundido",

	"chi_swa": "fondo_banderas", "chi_tem": "bowl_closed", "chi_anf": "fondo_chimeneas", "chi_rgt": "fondo_bloques",
	"chi_cpo": "dos_aguas", "chi_cur": "dos_aguas", "chi_udc": "dos_aguas", "chi_ari": "dos_aguas",
	"chi_dco": "dos_aguas", "chi_smo": "fondo_chimeneas", "chi_usf": "dos_aguas", "chi_sct": "torre_reloj",
	"chi_tra": "athletics", "chi_vll": "fondo_bloques", "chi_lnr": "fondo_bloques", "chi_ova": "athletics",
	"chi_mun": "gradas_tubo", "chi_rsj": "athletics",

	"chi_pmo": "gradas_tubo", "chi_slq": "rect_open", "chi_mel": "terraplen", "chi_bnc": "athletics",
	"chi_rec": "rect_open", "chi_fvl": "main_L", "chi_oso": "main_L", "chi_ibe": "main_L",
	"chi_val": "athletics", "chi_gve": "terraplen", "chi_clc": "fondo_chimeneas", "chi_lbu": "campo_coches",
	"chi_rng": "campo_coches", "chi_cln": "sin_fondo_arboles", "chi_qli": "terraplen", "chi_ccn": "two_side",
	"chi_brj": "terraplen", "chi_pvr": "two_side",

	"uru_pen": "fondo_banderas", "uru_nac": "cubierta_membrana", "uru_def": "velas", "uru_liv": "pantallon",
	"uru_dan": "bowl_round", "uru_wan": "catedral", "uru_tor": "velas", "uru_riv": "pantallon",
	"uru_cla": "bowl_closed", "uru_bos": "horseshoe", "uru_rac": "bowl_round", "uru_pla": "campo_hundido",
	"uru_pro": "campo_hundido", "uru_juv": "campo_hundido", "uru_mir": "horseshoe", "uru_cer": "bowl_round",
	"uru_fen": "campo_hundido", "uru_ram": "horseshoe",

	"uru_alb": "fondo_bloques", "uru_ren": "fondo_bloques", "uru_dma": "rect_open", "uru_cen": "torre_reloj",
	"uru_sud": "rect_open", "uru_ves": "rect_open", "uru_cto": "dos_aguas", "uru_tac": "dos_aguas",
	"uru_luz": "fondo_bloques", "uru_ate": "torre_reloj", "uru_pcn": "gradas_tubo", "uru_hrf": "fondo_bloques",
	"uru_pey": "athletics", "uru_ncb": "gradas_tubo", "uru_dfb": "gradas_tubo", "uru_lvb": "gradas_tubo",
	"uru_wnb": "gradas_tubo", "uru_dnb": "gradas_tubo",

	"uru_bel": "athletics", "uru_hbu": "main_L", "uru_umo": "fondo_chimeneas", "uru_bas": "athletics",
	"uru_col": "main_L", "uru_roc": "athletics", "uru_ori": "fondo_chimeneas", "uru_sal": "terraplen",
	"uru_vte": "fondo_chimeneas", "uru_alp": "sin_fondo_arboles", "uru_cnd": "sin_fondo_arboles", "uru_ppl": "two_side",
	"uru_ltl": "two_side", "uru_psl": "campo_coches", "uru_crb": "campo_coches", "uru_pyp": "sin_fondo_arboles",
	"uru_frr": "terraplen", "uru_uds": "two_side",

	"egy_ahl": "fondo_arco", "egy_zam": "muro_de_pie", "egy_pyr": "catedral", "egy_msr": "bowl_round",
	"egy_cer": "bowl_round", "egy_ism": "cubierta_membrana", "egy_enp": "cubierta_membrana", "egy_itt": "bowl_closed",
	"egy_nbe": "bowl_closed", "egy_smo": "catedral", "egy_pha": "cubierta_membrana", "egy_zed": "horseshoe",
	"egy_gsh": "coliseo", "egy_mod": "campo_hundido", "egy_bld": "coliseo", "egy_ptj": "coliseo",
	"egy_gou": "horseshoe",

	"egy_mok": "bowl_closed", "egy_gzl": "tribuna_postes", "egy_hrs": "dos_aguas", "egy_dkh": "rect_open",
	"egy_asw": "rect_open", "egy_tnt": "campo_hundido", "egy_nsr": "torre_reloj", "egy_skk": "rect_open",
	"egy_pta": "dos_aguas", "egy_mkk": "rect_open", "egy_bmh": "rect_open", "egy_abo": "fondo_bloques",
	"egy_mkb": "athletics", "egy_ban": "athletics", "egy_mnf": "gradas_tubo", "egy_kim": "fondo_bloques",
	"egy_bnk": "athletics", "egy_tlc": "gradas_tubo",

	"egy_trs": "gradas_tubo", "egy_oly": "gradas_tubo", "egy_khr": "fondo_chimeneas", "egy_asm": "terraplen",
	"egy_dmn": "terraplen", "egy_hrb": "athletics", "egy_shg": "main_L", "egy_qna": "fondo_chimeneas",
	"egy_pfd": "fondo_chimeneas", "egy_gmh": "rect_open", "egy_bel": "rect_open", "egy_ras": "campo_coches",
	"egy_sam": "terraplen", "egy_dae": "campo_coches", "egy_mal": "campo_coches", "egy_bhr": "sin_fondo_arboles",
	"egy_sud": "sin_fondo_arboles", "egy_fay": "sin_fondo_arboles",



	"rsa_amz": "bowl_round", "rsa_arr": "coliseo", "rsa_bar": "campo_hundido", "rsa_cal": "athletics",
	"rsa_cas": "fondo_bloques", "rsa_chi": "bowl_round", "rsa_cpt": "campo_hundido", "rsa_dur": "campo_hundido",
	"rsa_fss": "gradas_tubo", "rsa_hig": "gradas_tubo", "rsa_hun": "fondo_chimeneas", "rsa_jdr": "rect_open",
	"rsa_jom": "torre_reloj", "rsa_kai": "pantallon", "rsa_lep": "gradas_tubo", "rsa_ler": "campo_hundido",
	"rsa_mac": "athletics", "rsa_mag": "coliseo", "rsa_mar": "bowl_round", "rsa_mil": "rect_open",
	"rsa_orb": "fondo_bloques", "rsa_orl": "pantallon", "rsa_pcr": "athletics", "rsa_pol": "campo_hundido",
	"rsa_ram": "bowl_round", "rsa_ric": "horseshoe", "rsa_sek": "velas", "rsa_siw": "campo_hundido",
	"rsa_spu": "rect_open", "rsa_ste": "cubierta_membrana", "rsa_sun": "cubierta_membrana", "rsa_sup": "catedral",
	"rsa_tsg": "horseshoe", "rsa_tut": "fondo_bloques", "rsa_upi": "rect_open", "rsa_ven": "fondo_chimeneas",
	"qat_ahl": "coliseo", "qat_ara": "cubierta_membrana", "qat_bid": "fondo_chimeneas", "qat_daa": "fondo_bloques",
	"qat_dha": "fondo_bloques", "qat_duh": "pantallon", "qat_esl": "gradas_tubo", "qat_gha": "cubierta_membrana",
	"qat_itt": "campo_hundido", "qat_jai": "torre_reloj", "qat_jum": "fondo_bloques", "qat_kha": "bowl_round",
	"qat_kho": "horseshoe", "qat_lus": "dos_aguas", "qat_mar": "bowl_round", "qat_mes": "coliseo",
	"qat_mua": "campo_hundido", "qat_nas": "dos_aguas", "qat_oru": "torre_reloj", "qat_qsc": "campo_hundido",
	"qat_ray": "cubierta_membrana", "qat_ruw": "athletics", "qat_sad": "cubierta_membrana", "qat_sai": "coliseo",
	"qat_sha": "bowl_round", "qat_shn": "coliseo", "qat_shq": "athletics", "qat_shr": "fondo_bloques",
	"qat_taa": "dos_aguas", "qat_tad": "fondo_bloques", "qat_ums": "coliseo", "qat_waa": "coliseo",
	"qat_wak": "pantallon", "qat_weh": "athletics", "qat_wuk": "athletics", "qat_wus": "fondo_chimeneas",
	"irn_alu": "coliseo", "irn_ari": "athletics", "irn_ast": "fondo_bloques", "irn_bad": "gradas_tubo",
	"irn_cha": "campo_hundido", "irn_dam": "gradas_tubo", "irn_ekh": "fondo_chimeneas", "irn_est": "velas",
	"irn_faj": "bowl_round", "irn_foo": "pantallon", "irn_gol": "pantallon", "irn_hav": "horseshoe",
	"irn_khe": "campo_hundido", "irn_khs": "gradas_tubo", "irn_mac": "rect_open", "irn_mal": "coliseo",
	"irn_mke": "dos_aguas", "irn_mno": "athletics", "irn_mrf": "bowl_round", "irn_nas": "coliseo",
	"irn_niz": "dos_aguas", "irn_nms": "fondo_bloques", "irn_pay": "coliseo", "irn_per": "bowl_closed",
	"irn_pjj": "fondo_bloques", "irn_pnb": "fondo_chimeneas", "irn_rah": "dos_aguas", "irn_sab": "fondo_chimeneas",
	"irn_sep": "bowl_round", "irn_sha": "campo_hundido", "irn_shb": "dos_aguas", "irn_sij": "fondo_bloques",
	"irn_snf": "horseshoe", "irn_tra": "catedral", "irn_van": "fondo_bloques", "irn_zob": "horseshoe",
	"uzb_agm": "bowl_closed", "uzb_and": "horseshoe", "uzb_bes": "athletics", "uzb_buk": "coliseo",
	"uzb_bun": "catedral", "uzb_chi": "fondo_chimeneas", "uzb_dsa": "campo_hundido", "uzb_gul": "fondo_bloques",
	"uzb_jiz": "torre_reloj", "uzb_kim": "rect_open", "uzb_kok": "bowl_round", "uzb_loc": "coliseo",
	"uzb_mas": "bowl_round", "uzb_met": "coliseo", "uzb_nam": "athletics", "uzb_nas": "pantallon",
	"uzb_nav": "bowl_closed", "uzb_nef": "bowl_round", "uzb_nur": "dos_aguas", "uzb_olm": "campo_hundido",
	"uzb_pak": "bowl_round", "uzb_qar": "fondo_bloques", "uzb_qiz": "campo_hundido", "uzb_qur": "fondo_chimeneas",
	"uzb_sam": "athletics", "uzb_shh": "torre_reloj", "uzb_shu": "fondo_chimeneas", "uzb_sog": "bowl_round",
	"uzb_sur": "coliseo", "uzb_ter": "dos_aguas", "uzb_tra": "rect_open", "uzb_tur": "horseshoe",
	"uzb_urg": "campo_hundido", "uzb_xor": "dos_aguas", "uzb_yan": "gradas_tubo", "uzb_zar": "dos_aguas",
	"jor_ahl": "horseshoe", "jor_ajl": "athletics", "jor_aqa": "bowl_round", "jor_arb": "horseshoe",
	"jor_baq": "coliseo", "jor_fai": "pantallon", "jor_hsn": "dos_aguas", "jor_hus": "bowl_round",
	"jor_jal": "rect_open", "jor_jaz": "horseshoe", "jor_jrs": "torre_reloj", "jor_kar": "campo_hundido",
	"jor_kra": "gradas_tubo", "jor_kuf": "campo_hundido", "jor_maa": "bowl_round", "jor_mad": "gradas_tubo",
	"jor_mfr": "athletics", "jor_mog": "bowl_round", "jor_nas": "fondo_bloques", "jor_ord": "torre_reloj",
	"jor_qad": "fondo_bloques", "jor_ram": "bowl_round", "jor_ruw": "fondo_bloques", "jor_sah": "coliseo",
	"jor_sal": "coliseo", "jor_sar": "campo_hundido", "jor_sha": "fondo_bloques", "jor_sho": "pantallon",
	"jor_shu": "athletics", "jor_taf": "athletics", "jor_tha": "horseshoe", "jor_tur": "athletics",
	"jor_wad": "gradas_tubo", "jor_weh": "velas", "jor_yar": "coliseo", "jor_zar": "rect_open",





	"par_oli": "bowl_round", "par_cer": "bowl_round", "par_lib": "bowl_closed", "par_nac": "bowl_round",
	"par_gua": "cubierta_membrana", "par_tri": "catedral", "par_ame": "bowl_closed", "par_dmy": "velas",
	"par_rec": "campo_hundido", "par_luq": "campo_hundido", "par_rub": "horseshoe", "par_slo": "campo_hundido",
	"par_gcm": "bowl_round", "par_san": "campo_hundido", "par_djv": "coliseo", "par_bea": "coliseo",
	"par_sol": "campo_hundido", "par_car": "campo_hundido",

	"par_tem": "fondo_chimeneas", "par_ind": "dos_aguas", "par_res": "fondo_chimeneas", "par_pgi": "fondo_bloques",
	"par_fdm": "dos_aguas", "par_cap": "fondo_chimeneas", "par_tno": "torre_reloj", "par_gue": "rect_open",
	"par_tac": "gradas_tubo", "par_enc": "gradas_tubo", "par_riv": "fondo_bloques", "par_doi": "gradas_tubo",
	"par_atl": "gradas_tubo", "par_tfe": "athletics", "par_col": "gradas_tubo", "par_rit": "athletics",
	"par_pas": "fondo_bloques", "par_gfr": "gradas_tubo",

	"par_vse": "fondo_chimeneas", "par_mle": "terraplen", "par_vps": "fondo_chimeneas", "par_oit": "athletics",
	"par_gzc": "rect_open", "par_pma": "rect_open", "par_pha": "rect_open", "par_gdz": "main_L",
	"par_tfb": "campo_coches", "par_dsd": "terraplen", "par_cco": "two_side", "par_cgl": "sin_fondo_arboles",
	"par_ite": "sin_fondo_arboles", "par_spe": "campo_coches", "par_fye": "campo_coches", "par_cho": "sin_fondo_arboles",
	"par_lim": "sin_fondo_arboles", "par_pat": "two_side",

	"ecu_ldu": "catedral", "ecu_idv": "cubierta_membrana", "ecu_bsc": "bowl_round", "ecu_cat": "pantallon",
	"ecu_eme": "bowl_closed", "ecu_auc": "catedral", "ecu_mac": "catedral", "ecu_lib": "bowl_closed",
	"ecu_cue": "bowl_closed", "ecu_gyc": "horseshoe", "ecu_ore": "coliseo", "ecu_mus": "bowl_round",
	"ecu_leo": "campo_hundido", "ecu_tec": "campo_hundido", "ecu_del": "bowl_round", "ecu_man": "campo_hundido",
	"ecu_vin": "bowl_round", "ecu_atl": "bowl_round",

	"ecu_ind": "dos_aguas", "ecu_oct": "campo_hundido", "ecu_cjr": "torre_reloj", "ecu_san": "campo_hundido",
	"ecu_ldp": "fondo_chimeneas", "ecu_std": "dos_aguas", "ecu_nac": "fondo_bloques", "ecu_gua": "dos_aguas",
	"ecu_cum": "dos_aguas", "ecu_jul": "gradas_tubo", "ecu_pat": "athletics", "ecu_sdq": "athletics",
	"ecu_ins": "fondo_bloques", "ecu_ast": "athletics", "ecu_imb": "athletics", "ecu_buh": "athletics",
	"ecu_ali": "gradas_tubo", "ecu_min": "athletics",

	"ecu_avi": "athletics", "ecu_ldc": "two_side", "ecu_esp": "main_L", "ecu_ame": "main_L",
	"ecu_pel": "terraplen", "ecu_bcf": "two_side", "ecu_gre": "campo_coches", "ecu_juv": "terraplen",
	"ecu_olm": "athletics", "ecu_lun": "two_side", "ecu_nor": "two_side", "ecu_utc": "sin_fondo_arboles",
	"ecu_eve": "rect_open", "ecu_pan": "two_side", "ecu_aud": "campo_coches", "ecu_que": "rect_open",
	"ecu_dun": "two_side", "ecu_tra": "two_side",

	"per_uni": "bowl_round", "per_ali": "bowl_round", "per_cri": "bowl_round", "per_cus": "cubierta_membrana",
	"per_mel": "bowl_round", "per_gar": "campo_hundido", "per_cie": "horseshoe", "per_aat": "campo_hundido",
	"per_cha": "coliseo", "per_hua": "campo_hundido", "per_adt": "horseshoe", "per_gra": "campo_hundido",
	"per_spb": "horseshoe", "per_cun": "campo_hundido", "per_jpc": "horseshoe", "per_caj": "campo_hundido",
	"per_utc": "coliseo", "per_moq": "horseshoe",

	"per_uco": "torre_reloj", "per_man": "campo_hundido", "per_aya": "dos_aguas", "per_auh": "campo_hundido",
	"per_cfc": "fondo_bloques", "per_lla": "dos_aguas", "per_ben": "rect_open", "per_umi": "torre_reloj",
	"per_pir": "torre_reloj", "per_ucv": "fondo_chimeneas", "per_usm": "fondo_bloques", "per_ada": "fondo_bloques",
	"per_bin": "athletics", "per_san": "athletics", "per_cni": "gradas_tubo", "per_can": "athletics",
	"per_usd": "fondo_bloques", "per_sma": "fondo_bloques",

	"per_aur": "athletics", "per_cau": "terraplen", "per_spc": "rect_open", "per_pac": "athletics",
	"per_nac": "rect_open", "per_vsa": "terraplen", "per_eco": "main_L", "per_ucr": "terraplen",
	"per_anb": "two_side", "per_vol": "two_side", "per_hrl": "sin_fondo_arboles", "per_mun": "campo_coches",
	"per_jhu": "terraplen", "per_par": "terraplen", "per_jsd": "two_side", "per_pan": "terraplen",
	"per_uda": "sin_fondo_arboles", "per_lut": "two_side",

	"bol_bol": "cubierta_membrana", "bol_str": "cubierta_membrana", "bol_alw": "campo_hundido", "bol_blo": "bowl_round",
	"bol_ori": "coliseo", "bol_aur": "campo_hundido", "bol_wil": "campo_hundido", "bol_nap": "horseshoe",
	"bol_rpo": "bowl_round", "bol_gvs": "campo_hundido", "bol_rto": "bowl_round", "bol_gua": "bowl_round",
	"bol_ipe": "coliseo", "bol_tom": "campo_hundido", "bol_sab": "coliseo", "bol_uvi": "campo_hundido",
	"bol_abb": "bowl_round", "bol_sjn": "horseshoe",

	"bol_usf": "fondo_chimeneas", "bol_hua": "campo_hundido", "bol_vir": "dos_aguas", "bol_ain": "fondo_bloques",
	"bol_feb": "torre_reloj", "bol_tiq": "fondo_bloques", "bol_cnu": "fondo_chimeneas", "bol_pmy": "campo_hundido",
	"bol_uta": "campo_hundido", "bol_fat": "torre_reloj", "bol_min": "gradas_tubo", "bol_dnw": "gradas_tubo",
	"bol_tig": "athletics", "bol_chf": "fondo_bloques", "bol_asu": "fondo_bloques", "bol_smy": "athletics",
	"bol_his": "athletics", "bol_ing": "athletics",

	"bol_rpa": "fondo_chimeneas", "bol_rsc": "main_L", "bol_oro": "terraplen", "bol_chp": "main_L",
	"bol_gag": "athletics", "bol_utj": "terraplen", "bol_upa": "athletics", "bol_fla": "two_side",
	"bol_fan": "terraplen", "bol_ube": "sin_fondo_arboles", "bol_lfp": "campo_coches", "bol_gdl": "two_side",
	"bol_inf": "terraplen", "bol_hpl": "sin_fondo_arboles", "bol_aju": "sin_fondo_arboles", "bol_kiv": "campo_coches",
	"bol_oly": "sin_fondo_arboles", "bol_lqu": "campo_coches",

	"ven_tac": "velas", "ven_car": "coliseo", "ven_ucv": "coliseo", "ven_met": "coliseo",
	"ven_dlg": "horseshoe", "ven_cbo": "campo_hundido", "ven_apc": "campo_hundido", "ven_por": "bowl_round",
	"ven_esm": "bowl_round", "ven_mon": "coliseo", "ven_zam": "campo_hundido", "ven_ray": "campo_hundido",
	"ven_tru": "horseshoe", "ven_anz": "bowl_round", "ven_lar": "horseshoe", "ven_bqs": "coliseo",
	"ven_ure": "campo_hundido", "ven_dmi": "coliseo",

	"ven_yar": "fondo_chimeneas", "ven_ara": "campo_hundido", "ven_mob": "fondo_bloques", "ven_zmb": "torre_reloj",
	"ven_bol": "dos_aguas", "ven_aba": "campo_hundido", "ven_apb": "torre_reloj", "ven_dyp": "rect_open",
	"ven_rfr": "fondo_bloques", "ven_mdg": "athletics", "ven_mlg": "athletics", "ven_pcl": "fondo_bloques",
	"ven_aev": "athletics", "ven_gua": "athletics", "ven_mnv": "athletics", "ven_cat": "gradas_tubo",
	"ven_ula": "athletics", "ven_uam": "athletics",

	"ven_ufc": "fondo_chimeneas", "ven_eme": "rect_open", "ven_chv": "terraplen", "ven_mnt": "rect_open",
	"ven_rey": "athletics", "ven_yfc": "main_L", "ven_gmo": "athletics", "ven_jye": "sin_fondo_arboles",
	"ven_jgd": "terraplen", "ven_aeo": "terraplen", "ven_dza": "two_side", "ven_tdp": "sin_fondo_arboles",
	"ven_mrr": "terraplen", "ven_opt": "two_side", "ven_ane": "sin_fondo_arboles", "ven_aji": "sin_fondo_arboles",
	"ven_vbr": "campo_coches", "ven_ccv": "sin_fondo_arboles",













	"mar_rsb": "pantallon",
	"mar_far": "cubierta_membrana",
	"mar_rca": "bowl_round", "mar_wac": "bowl_round",
	"mar_mas": "athletics", "mar_kcm": "athletics", "mar_usy": "athletics",
	"mar_irt": "tres_anillos",
	"mar_hus": "bowl_closed", "mar_odc": "bowl_closed",
	"mar_fus": "velas", "mar_uts": "catedral",
	"mar_dhj": "campo_hundido", "mar_rcz": "campo_hundido", "mar_wst": "campo_hundido",
	"mar_cod": "coliseo", "mar_mat": "coliseo",
	"mar_ocs": "horseshoe",

	"mar_cak": "athletics", "mar_mco": "athletics", "mar_ock": "athletics",
	"mar_waf": "tribuna_postes", "mar_rac": "tribuna_postes",
	"mar_scc": "horseshoe", "mar_ken": "torre_reloj",
	"mar_tiz": "fondo_bloques", "mar_rbm": "fondo_bloques",
	"mar_stm": "dos_aguas", "mar_izk": "dos_aguas", "mar_jsm": "rect_open",
	"mar_usm": "fondo_chimeneas", "mar_roz": "fondo_chimeneas",
	"mar_jss": "gradas_tubo", "mar_cjb": "gradas_tubo", "mar_usb": "gradas_tubo", "mar_asm": "gradas_tubo",

	"tun_est": "athletics", "tun_caf": "athletics",
	"tun_usm": "cubierta_membrana",
	"tun_ess": "bowl_round", "tun_cab": "bowl_round", "tun_asg": "bowl_round",
	"tun_css": "catedral", "tun_stu": "bowl_closed",
	"tun_jso": "coliseo", "tun_ubg": "coliseo",
	"tun_esz": "horseshoe", "tun_obj": "horseshoe", "tun_jsk": "horseshoe", "tun_ehs": "horseshoe",
	"tun_esm": "campo_hundido", "tun_asm": "campo_hundido", "tun_sol": "campo_hundido", "tun_pss": "campo_hundido",

	"tun_stg": "athletics", "tun_ask": "athletics",
	"tun_csh": "torre_reloj",
	"tun_ari": "rect_open", "tun_meg": "rect_open", "tun_srs": "dos_aguas",
	"tun_ust": "fondo_bloques", "tun_scb": "fondo_bloques", "tun_bou": "fondo_bloques", "tun_kse": "fondo_bloques",
	"tun_gaf": "fondo_chimeneas", "tun_msk": "fondo_chimeneas",
	"tun_jen": "gradas_tubo", "tun_kor": "gradas_tubo", "tun_ock": "gradas_tubo", "tun_csc": "gradas_tubo",
	"tun_bsb": "gradas_tubo", "tun_red": "gradas_tubo",








	"mar_cay": "gradas_tubo", "mar_crb": "athletics", "mar_mol": "terraplen", "mar_wse": "terraplen",
	"mar_cch": "terraplen", "mar_oly": "fondo_chimeneas", "mar_frn": "main_L", "mar_olm": "terraplen",
	"mar_cww": "terraplen", "mar_tas": "two_side", "mar_sal": "two_side", "mar_ust": "two_side",
	"mar_ejs": "terraplen", "mar_crh": "sin_fondo_arboles", "mar_han": "main_L", "mar_jsk": "two_side",
	"mar_usk": "campo_coches", "mar_irf": "sin_fondo_arboles",

	"tun_mah": "rect_open", "tun_aga": "athletics", "tun_kal": "fondo_chimeneas", "tun_mok": "rect_open",
	"tun_kef": "main_L", "tun_med": "athletics", "tun_bkh": "fondo_chimeneas", "tun_sso": "rect_open",
	"tun_ubs": "sin_fondo_arboles", "tun_smb": "sin_fondo_arboles", "tun_cot": "sin_fondo_arboles", "tun_jil": "terraplen",
	"tun_nab": "two_side", "tun_jer": "two_side", "tun_oel": "campo_coches", "tun_rad": "terraplen",
	"tun_sbz": "terraplen", "tun_rog": "campo_coches",



















	"nzl_akc": "main_L", "nzl_afr": "main_L",
	"nzl_wpr": "two_side",
	"nzl_bir": "terraplen", "nzl_eas": "sin_fondo_arboles", "nzl_aku": "rect_open",
	"nzl_npr": "horseshoe",
	"nzl_wol": "tribuna_postes",
	"nzl_mir": "terraplen", "nzl_cas": "campo_coches", "nzl_fer": "sin_fondo_arboles",
	"nzl_wsp": "two_side", "nzl_cos": "terraplen", "nzl_chu": "gradas_tubo",
	"nzl_wsu": "rect_open", "nzl_ecb": "campo_coches", "nzl_fen": "sin_fondo_arboles",
	"nzl_bay": "main_L",

	"nzl_tau": "terraplen", "nzl_mel": "two_side", "nzl_mku": "campo_coches",
	"nzl_uhc": "tribuna_postes", "nzl_iby": "tribuna_postes", "nzl_wka": "sin_fondo_arboles",
	"nzl_pet": "dos_aguas", "nzl_fcw": "rect_open", "nzl_nom": "terraplen",
	"nzl_nel": "athletics", "nzl_nor": "athletics", "nzl_dcr": "rect_open",
	"nzl_wan": "sin_fondo_arboles", "nzl_sel": "campo_coches", "nzl_wcr": "two_side",
	"nzl_man": "main_L", "nzl_ham": "athletics", "nzl_nsu": "gradas_tubo",

	"nzl_cam": "terraplen", "nzl_ell": "two_side", "nzl_hib": "sin_fondo_arboles",
	"nzl_map": "campo_coches", "nzl_nro": "main_L", "nzl_omu": "terraplen",
	"nzl_tak": "rect_open", "nzl_tpo": "sin_fondo_arboles", "nzl_nwe": "two_side",
	"nzl_lhc": "two_side", "nzl_wun": "athletics", "nzl_sto": "campo_coches",
	"nzl_hnw": "terraplen", "nzl_wai": "main_L", "nzl_uca": "sin_fondo_arboles",
	"nzl_hal": "terraplen", "nzl_mos": "two_side", "nzl_gri": "campo_coches",

	"fij_baf": "rect_open",
	"fij_rew": "main_L",
	"fij_lau": "bowl_round", "fij_nad": "horseshoe",
	"fij_suv": "athletics",
	"fij_lab": "campo_hundido", "fij_ndr": "terraplen",
	"fij_nav": "two_side", "fij_tav": "sin_fondo_arboles", "fij_nas": "campo_coches",

	"tah_pir": "athletics", "tah_ajt": "athletics",
	"tah_cen": "two_side", "tah_dra": "two_side",
	"tah_tef": "main_L", "tah_ven": "sin_fondo_arboles", "tah_tpu": "terraplen",
	"tah_mir": "sin_fondo_arboles", "tah_pue": "campo_coches", "tah_tai": "terraplen",

	"ncl_mag": "athletics", "ncl_tig": "athletics",
	"ncl_los": "rect_open", "ncl_gai": "rect_open", "ncl_ned": "rect_open",
	"ncl_hie": "main_L", "ncl_mdo": "two_side", "ncl_csl": "terraplen",
	"ncl_kun": "sin_fondo_arboles", "ncl_pat": "campo_coches",













	"swe_aik": "cubierta_membrana",
	"swe_dif": "cubierta_membrana", "swe_ham": "cubierta_membrana",
	"swe_gbg": "bowl_closed", "swe_gai": "bowl_closed", "swe_org": "bowl_closed",
	"swe_mff": "fondo_kop",
	"swe_elf": "rect_open",
	"swe_hac": "pantallon",
	"swe_sir": "pantallon",
	"swe_kal": "catedral",
	"swe_vas": "dos_aguas",
	"swe_hal": "horseshoe",
	"swe_deg": "tribuna_postes",
	"swe_mja": "two_side",
	"swe_bro": "main_L",

	"swe_hel": "coliseo",
	"swe_nkp": "bowl_closed",
	"swe_nby": "rect_open",
	"swe_ore": "fondo_bloques", "swe_gif": "fondo_bloques", "swe_ofk": "fondo_bloques",
	"swe_ost": "rect_open", "swe_fal": "rect_open",
	"swe_odd": "athletics", "swe_san": "athletics",
	"swe_lan": "tribuna_postes",
	"swe_var": "dos_aguas", "swe_vbo": "dos_aguas",
	"swe_bra": "gradas_tubo", "swe_nun": "gradas_tubo",
	"swe_lju": "terraplen",

	"swe_jso": "tribuna_postes", "swe_kst": "athletics", "swe_afc": "athletics",
	"swe_gef": "fondo_bloques", "swe_sko": "fondo_chimeneas", "swe_ass": "rect_open",
	"swe_vsl": "main_L", "swe_ari": "main_L", "swe_ang": "main_L",
	"swe_enk": "terraplen", "swe_tro": "terraplen", "swe_esk": "terraplen",
	"swe_sol": "sin_fondo_arboles", "swe_sto": "sin_fondo_arboles",
	"swe_has": "two_side", "swe_lbk": "two_side", "swe_ros": "two_side",
	"swe_kar": "campo_coches", "swe_oly": "campo_coches",
	"swe_ume": "athletics",
	"swe_tff": "dos_aguas", "swe_uts": "gradas_tubo",
	"swe_atv": "tribuna_postes",
	"swe_pit": "fondo_bloques",
	"swe_sti": "athletics",
	"swe_htf": "two_side", "swe_jar": "campo_coches", "swe_arl": "sin_fondo_arboles",
	"swe_fbk": "terraplen", "swe_kri": "two_side", "swe_lah": "terraplen", "swe_tva": "sin_fondo_arboles",

	"rou_fcs": "cubierta_membrana", "rou_din": "cubierta_membrana",
	"rou_rap": "bowl_closed",
	"rou_cfr": "bowl_closed",
	"rou_ucj": "athletics",
	"rou_ucv": "piel_envolvente",
	"rou_arg": "pantallon", "rou_uta": "pantallon", "rou_her": "pantallon",
	"rou_pet": "catedral",
	"rou_ote": "coliseo",
	"rou_far": "rect_open",
	"rou_bot": "campo_hundido", "rou_met": "campo_hundido",
	"rou_csi": "dos_aguas", "rou_uns": "dos_aguas",

	"rou_ste": "bowl_closed",
	"rou_sep": "pantallon",
	"rou_cea": "coliseo", "rou_pol": "coliseo",
	"rou_asa": "athletics", "rou_sla": "athletics", "rou_bac": "athletics",
	"rou_cor": "fondo_chimeneas", "rou_res": "fondo_chimeneas",
	"rou_oli": "tribuna_postes", "rou_bih": "tribuna_postes",
	"rou_glb": "horseshoe",
	"rou_chi": "rect_open", "rou_vol": "rect_open",
	"rou_con": "fondo_bloques", "rou_mbz": "fondo_bloques",
	"rou_cam": "dos_aguas",
	"rou_sel": "gradas_tubo", "rou_dum": "gradas_tubo",
	"rou_tun": "two_side", "rou_afu": "campo_coches", "rou_csd": "campo_coches",

	"rou_pti": "athletics",
	"rou_dac": "athletics", "rou_vlc": "athletics",
	"rou_lup": "fondo_chimeneas", "rou_jiu": "fondo_chimeneas",
	"rou_min": "tribuna_postes", "rou_cug": "gradas_tubo",
	"rou_alb": "main_L", "rou_suc": "main_L",
	"rou_dej": "terraplen", "rou_tam": "terraplen", "rou_pec": "terraplen",
	"rou_spa": "two_side",
	"rou_san": "sin_fondo_arboles", "rou_mog": "sin_fondo_arboles",
	"rou_via": "campo_coches", "rou_fun": "campo_coches",










	"bih_cel": "bowl_closed",
	"bih_sar": "athletics",
	"bih_zel": "coliseo",
	"bih_bor": "athletics",
	"bih_zri": "rect_open",
	"bih_vel": "two_side",
	"bih_sir": "pantallon",
	"bih_rad": "athletics",
	"bih_slo": "main_L", "bih_bsk": "tribuna_postes",

	"bih_slb": "coliseo",
	"bih_rud": "athletics", "bih_jed": "athletics",
	"bih_pos": "rect_open",
	"bih_bud": "fondo_chimeneas",
	"bih_lak": "dos_aguas", "bih_leo": "tribuna_postes", "bih_tra": "tribuna_postes",
	"bih_koz": "fondo_bloques", "bih_tos": "fondo_bloques",
	"bih_sla": "gradas_tubo", "bih_dri": "two_side", "bih_zvi": "main_L",
	"bih_stu": "sin_fondo_arboles", "bih_igm": "sin_fondo_arboles",
	"bih_rha": "terraplen",
	"bih_gos": "campo_coches", "bih_tom": "campo_coches",

	"bih_tuz": "coliseo",
	"bih_rka": "fondo_chimeneas", "bih_oma": "fondo_chimeneas",
	"bih_sut": "sin_fondo_arboles", "bih_rom": "sin_fondo_arboles",
	"bih_bra": "tribuna_postes", "bih_zgr": "fondo_bloques", "bih_kra": "rect_open",
	"bih_vit": "main_L", "bih_bos": "main_L",
	"bih_vne": "terraplen", "bih_maj": "terraplen",
	"bih_fam": "two_side", "bih_bro": "two_side",
	"bih_lju": "gradas_tubo", "bih_tro": "dos_aguas",
	"bih_cap": "campo_coches", "bih_pot": "campo_coches",
}





const NATIONS: Dictionary = {
	"España": "La Cartuja", "Inglaterra": "Wembley", "Francia": "Stade de France",
	"Alemania": "Olympiastadion de Berlín", "Italia": "Olimpico de Roma",
	"Portugal": "Estádio da Luz", "Países Bajos": "Johan Cruyff Arena",
	"México": "Estadio Azteca", "Brasil": "Maracanã", "Argentina": "Monumental",
	"Escocia": "Hampden Park", "Gales": "Millennium Stadium",
	"Uruguay": "Centenario", "Chile": "Estadio Nacional de Chile",
	"Colombia": "El Campín", "Perú": "Estadio Nacional de Lima",
	"Bélgica": "Rey Balduino", "Suiza": "Wankdorf", "Austria": "Ernst Happel",
	"Croacia": "Maksimir", "Serbia": "Rajko Mitić", "Ucrania": "Olímpico de Kiev",
	"Grecia": "Olímpico de Atenas", "Turquía": "Atatürk", "Dinamarca": "Parken",
	"Noruega": "Ullevaal", "Suecia": "Friends Arena", "Polonia": "Nacional de Varsovia",
	"Rusia": "Luzhnikí", "Hungría": "Puskás Arena", "Chequia": "Eden Arena",
	"Japón": "Nacional de Tokio", "Corea del Sur": "Mundialista de Seúl",
	"Arabia Saudí": "King Fahd", "Egipto": "Internacional de El Cairo",
	"Sudáfrica": "Soccer City",
	"Estados Unidos": "Rose Bowl", "Irlanda": "Aviva Stadium",



	"Paraguay": "Defensores del Chaco", "Ecuador": "Rodrigo Paz Delgado",
	"Bolivia": "Hernando Siles", "Venezuela": "Monumental de Maturín",



	"Marruecos": "Moulay Abdellah", "Túnez": "Hammadi Agrebi",




	"Nueva Zelanda": "Eden Park", "Fiyi": "HFC Bank Stadium",
	"Tahití": "Stade Pater", "Nueva Caledonia": "Numa-Daly",



	"Rumanía": "Arena Nationala",


	"Bosnia y Herzegovina": "Bilino Polje",
}






















const NATION_FOOTPRINTS: Dictionary = {

	"España": "athletics",
	"Inglaterra": "fondo_arco",
	"Francia": "cubierta_flotante",
	"Alemania": "puerta_monumental",
	"Italia": "athletics",
	"Portugal": "cubierta_membrana",
	"Países Bajos": "cubierta_membrana",
	"Escocia": "bowl_closed",
	"Gales": "cubierta_membrana",
	"Bélgica": "athletics",
	"Suiza": "rect_open",
	"Austria": "athletics",
	"Croacia": "athletics",
	"Serbia": "athletics",
	"Ucrania": "athletics",
	"Grecia": "fondo_arco",
	"Turquía": "athletics",
	"Dinamarca": "bowl_closed",
	"Noruega": "rect_open",
	"Suecia": "cubierta_membrana",
	"Polonia": "piel_envolvente",
	"Rusia": "columnata",
	"Hungría": "piel_envolvente",
	"Chequia": "rect_open",
	"Irlanda": "ola_vidrio",

	"México": "azteca_coloso",
	"Brasil": "bowl_round",
	"Argentina": "monumental_river",
	"Uruguay": "torre_reloj",
	"Chile": "athletics",
	"Colombia": "athletics",
	"Perú": "athletics",
	"Paraguay": "rect_open",
	"Ecuador": "bowl_closed",
	"Bolivia": "athletics",
	"Venezuela": "bowl_round",
	"Estados Unidos": "bowl_round",

	"Japón": "athletics",
	"Corea del Sur": "cubierta_membrana",
	"Arabia Saudí": "velas",
	"Egipto": "athletics",
	"Sudáfrica": "calabaza",
	"Marruecos": "cubierta_membrana",
	"Túnez": "athletics",

	"Nueva Zelanda": "bowl_round",
	"Fiyi": "athletics",
	"Tahití": "athletics",
	"Nueva Caledonia": "athletics",

	"Rumanía": "cubierta_membrana",
	"Bosnia y Herzegovina": "bowl_closed",
}






const NATION_FALLBACK: Array = ["athletics", "bowl_closed", "bowl_round",
	"horseshoe", "rect_open"]





static func nation_footprint(nation_name: String) -> String:
	if nation_name.is_empty():
		return ""
	var puesta: String = VenueEdits.footprint_of(nation_name)
	if not puesta.is_empty():
		return puesta
	if NATION_FOOTPRINTS.has(nation_name):
		return String(NATION_FOOTPRINTS[nation_name])
	return String(NATION_FALLBACK[posmod(nation_name.hash(),
		NATION_FALLBACK.size())])





const FINALS: Dictionary = {
	"champions": ["Wembley", "San Siro", "Atatürk", "Allianz Arena",
		"Stade de France", "Metropolitano", "Puskás Arena", "Estádio da Luz"],
	"europa": ["San Mamés", "Aviva Stadium", "Friends Arena",
		"Volksparkstadion", "Nacional de Varsovia", "Vélodrome"],
	"conference": ["Arena Kombëtare", "Eden Arena", "Agia Sophia",
		"Tarczyński Arena", "Olímpico de Atenas"],
	"mundialito": ["MetLife Stadium", "Lusail", "Rose Bowl", "Estadio Azteca"],
	"mundial": ["Lusail", "Maracanã", "Estadio Azteca", "Wembley",
		"Luzhnikí", "MetLife Stadium"],





	"libertadores": ["Centenario", "Monumental de Lima", "Maracanã",
		"Monumental de Núñez", "Defensores del Chaco", "Kempes"],
	"sudamericana": ["Metropolitano de Barranquilla", "La Nueva Olla", "Centenario",
		"Kempes", "Mané Garrincha", "Domingo Burgueño"],



	"oriente": ["King Abdullah Sports City", "Rey Fahd", "Saitama Stadium",
		"Mundialista de Seúl", "Khalifa International", "Azadi"],



	"atlas": ["Internacional de El Cairo", "Borg El Arab", "Soccer City",
		"Mohammed V", "Moulay Abdellah", "Japoma"],



	"coral": ["North Harbour Stadium", "Churchill Park", "Stade Pater Te Hono Nui",
		"Stade Numa-Daly"],
}


const FAKE_FINALS: Array = ["Gran Coliseo del Norte", "Arena de la Ribera",
	"Estadio del Lago", "Gran Parque del Sur", "Coliseo de la Bahía",
	"Arena del Puerto", "Estadio de las Luces", "Gran Domo Central"]





const STYLE_OF_COUNTRY: Dictionary = {
	"España": "es", "México": "es", "Argentina": "es", "Colombia": "es",
	"Chile": "es", "Uruguay": "es",
	"Paraguay": "es", "Ecuador": "es", "Perú": "es", "Bolivia": "es", "Venezuela": "es",
	"Inglaterra": "en", "Escocia": "en", "Estados Unidos": "en",
	"Italia": "it", "Alemania": "de", "Austria": "de", "Suiza": "de",
	"Francia": "fr", "Bélgica": "fr", "Portugal": "pt", "Brasil": "pt",
	"Países Bajos": "nl", "Turquía": "tr", "Grecia": "gr",
	"Ucrania": "slav", "Chequia": "slav", "Croacia": "slav", "Serbia": "slav",
	"Dinamarca": "nord", "Noruega": "nord",
	"Japón": "asia", "Corea del Sur": "asia",
	"Arabia Saudí": "arab", "Egipto": "arab", "Sudáfrica": "en",


	"Marruecos": "fr", "Túnez": "fr",



	"Nueva Zelanda": "en", "Fiyi": "en", "Tahití": "fr", "Nueva Caledonia": "fr",



	"Suecia": "nord", "Rumanía": "ro",


	"Bosnia y Herzegovina": "slav",
}
const PATTERNS: Dictionary = {
	"es": ["Estadio %s", "Estadio Municipal de %s", "Nuevo Estadio de %s",
		"Estadio Ciudad de %s"],
	"en": ["%s Park", "%s Road", "%s Lane", "The %s Ground"],
	"it": ["Stadio Comunale %s", "Stadio %s", "Arena %s"],
	"de": ["%s-Stadion", "%s-Arena", "Stadion am %s"],
	"fr": ["Stade de %s", "Stade Municipal de %s", "Parc de %s"],
	"pt": ["Estádio %s", "Estádio Municipal de %s", "Arena %s"],
	"nl": ["%s Stadion", "De %s Arena"],
	"tr": ["%s Stadyumu", "%s Arena"],
	"gr": ["Stadio %s", "%s Arena"],
	"slav": ["Stadion %s", "%s Arena"],
	"nord": ["%s Stadion", "%s Arena", "%s Park"],
	"asia": ["%s Stadium", "%s Arena"],
	"arab": ["Estadio %s", "%s Arena"],



	"ro": ["Stadionul %s", "Stadionul Municipal %s", "Arena %s"],
}


const STOP_WORDS: Array = ["fc", "cf", "cd", "ac", "sc", "as", "sk", "fk", "bk",
	"if", "ff", "afc", "real", "club", "deportivo", "atlético", "atletico",
	"sporting", "racing", "unión", "union", "united", "city", "town", "old",
	"boys", "de", "del", "la", "el", "los", "las", "do", "da", "y", "i", "1",
	"04", "05", "96", "05"]





static func of(team: Dictionary) -> String:






	var puesto: String = String(team.get("estadio", "")).strip_edges()
	if not puesto.is_empty():
		return puesto
	if bool(team.get("is_nation", false)):
		return nation_venue(String(team.get("name", "")))
	var id: String = String(team.get("id", ""))
	var country: String = String(team.get("country", team.get("league", "")))
	if Teams.fake_names_on():







		if TeamEdits.tiene(id, "name"):
			return _generate(id, country, _toponym(String(team.get("name", ""))))
		var fake: Dictionary = FakeTeams.NAMES.get(id, {})
		var city: String = _city_of(String(fake.get("name", team.get("name", ""))))
		return _generate(id, country, city)
	if CLUBS.has(id):
		return String(CLUBS[id])
	return _generate(id, country, _toponym(String(team.get("name", ""))))



static func of_id(id: String) -> String:
	return of(Teams.by_id(id))












static func footprint_of(team_id: String) -> String:
	if team_id.is_empty():
		return ""
	var edit: String = String(Teams.by_id(team_id).get("planta", ""))
	if not edit.is_empty():
		return edit
	return String(FOOTPRINTS.get(team_id, ""))





static func nation_venue(nation_name: String) -> String:





	var puesto: String = VenueEdits.venue_of(nation_name).strip_edges()
	if not puesto.is_empty():
		return puesto
	if not Teams.fake_names_on() and NATIONS.has(nation_name):
		return String(NATIONS[nation_name])
	return "Estadio Nacional de %s" % nation_name





static func final_venue(comp: String, season: int) -> String:
	if Teams.fake_names_on():
		return String(FAKE_FINALS[(comp.hash() + season) % FAKE_FINALS.size()])
	var pool: Array = FINALS.get(comp, FINALS["champions"])
	return String(pool[(comp.hash() + season) % pool.size()])








static func mundial_venue(season: int, key: String) -> String:
	var semilla: int =("mundial|%d|%s" % [season, key]).hash()
	if Teams.fake_names_on():
		return String(FAKE_FINALS[posmod(semilla, FAKE_FINALS.size())])
	var pool: Array = FINALS["mundial"]
	return String(pool[posmod(semilla, pool.size())])




static func cup_final_venue(country: String) -> String:
	return nation_venue(country)







static func _generate(id: String, country: String, place: String) -> String:
	var style: String = String(STYLE_OF_COUNTRY.get(country, "es"))
	var pool: Array = PATTERNS[style]
	var pattern: String = String(pool[id.hash() % pool.size()])
	return pattern % place





static func _toponym(name: String) -> String:
	var best: String = ""
	for w in name.split(" ", false):
		var word: String = String(w)
		if STOP_WORDS.has(word.to_lower()):
			continue
		if word.length() > best.length():
			best = word
	return best if not best.is_empty() else name




static func _city_of(fake_name: String) -> String:
	var parts: PackedStringArray = fake_name.split(" ", false)
	if parts.size() <= 1:
		return fake_name
	parts.remove_at(parts.size() - 1)
	return " ".join(parts)
