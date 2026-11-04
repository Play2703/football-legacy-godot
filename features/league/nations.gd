class_name Nations
extends RefCounted



















const POOL: Array = [

	{"id": "España", "name": "España", "strength": 86, "confed": "UEFA"},
	{"id": "Inglaterra", "name": "Inglaterra", "strength": 85, "confed": "UEFA"},
	{"id": "Italia", "name": "Italia", "strength": 83, "confed": "UEFA"},
	{"id": "Alemania", "name": "Alemania", "strength": 84, "confed": "UEFA"},
	{"id": "Portugal", "name": "Portugal", "strength": 82, "confed": "UEFA"},
	{"id": "México", "name": "México", "strength": 78, "confed": "CONCACAF"},

	{"id": "FRA", "name": "Francia", "strength": 88, "confed": "UEFA"},
	{"id": "ned", "name": "Países Bajos", "strength": 83, "confed": "UEFA"},
	{"id": "bel", "name": "Bélgica", "strength": 82, "confed": "UEFA"},
	{"id": "cro", "name": "Croacia", "strength": 80, "confed": "UEFA"},
	{"id": "sui", "name": "Suiza", "strength": 78, "confed": "UEFA"},
	{"id": "din", "name": "Dinamarca", "strength": 78, "confed": "UEFA"},
	{"id": "pol", "name": "Polonia", "strength": 76, "confed": "UEFA"},
	{"id": "srb", "name": "Serbia", "strength": 76, "confed": "UEFA"},
	{"id": "aut", "name": "Austria", "strength": 75, "confed": "UEFA"},
	{"id": "tur", "name": "Turquía", "strength": 75, "confed": "UEFA"},










	{"id": "arg", "name": "Argentina", "strength": 89, "confed": "CONMEBOL"},
	{"id": "BRA", "name": "Brasil", "strength": 88, "confed": "CONMEBOL"},
	{"id": "uru", "name": "Uruguay", "strength": 80, "confed": "CONMEBOL"},
	{"id": "col", "name": "Colombia", "strength": 83, "confed": "CONMEBOL"},
	{"id": "ecu", "name": "Ecuador", "strength": 77, "confed": "CONMEBOL"},
	{"id": "per", "name": "Perú", "strength": 72, "confed": "CONMEBOL"},

	{"id": "usa", "name": "Estados Unidos", "strength": 75, "confed": "CONCACAF"},
	{"id": "can", "name": "Canadá", "strength": 74, "confed": "CONCACAF"},
	{"id": "crc", "name": "Costa Rica", "strength": 72, "confed": "CONCACAF"},
	{"id": "pan", "name": "Panamá", "strength": 70, "confed": "CONCACAF"},
	{"id": "hon", "name": "Honduras", "strength": 68, "confed": "CONCACAF"},
	{"id": "jam", "name": "Jamaica", "strength": 68, "confed": "CONCACAF"},

	{"id": "MAR", "name": "Marruecos", "strength": 79, "confed": "CAF"},
	{"id": "sen", "name": "Senegal", "strength": 77, "confed": "CAF"},
	{"id": "jpn", "name": "Japón", "strength": 76, "confed": "AFC"},
	{"id": "kor", "name": "Corea del Sur", "strength": 74, "confed": "AFC"},
	{"id": "nga", "name": "Nigeria", "strength": 75, "confed": "CAF"},
	{"id": "aus", "name": "Australia", "strength": 72, "confed": "AFC"},
	{"id": "egy", "name": "Egipto", "strength": 73, "confed": "CAF"},
	{"id": "gha", "name": "Ghana", "strength": 72, "confed": "CAF"},



	{"id": "sco", "name": "Escocia", "strength": 74, "confed": "UEFA"},
	{"id": "wal", "name": "Gales", "strength": 73, "confed": "UEFA"},
	{"id": "swe", "name": "Suecia", "strength": 76, "confed": "UEFA"},
	{"id": "NOR", "name": "Noruega", "strength": 77, "confed": "UEFA"},
	{"id": "gre", "name": "Grecia", "strength": 73, "confed": "UEFA"},
	{"id": "cze", "name": "Chequia", "strength": 74, "confed": "UEFA"},
	{"id": "ukr", "name": "Ucrania", "strength": 74, "confed": "UEFA"},
	{"id": "hun", "name": "Hungría", "strength": 72, "confed": "UEFA"},
	{"id": "chi", "name": "Chile", "strength": 73, "confed": "CONMEBOL"},
	{"id": "PAR", "name": "Paraguay", "strength": 76, "confed": "CONMEBOL"},
	{"id": "VEN", "name": "Venezuela", "strength": 72, "confed": "CONMEBOL"},
	{"id": "ksa", "name": "Arabia Saudí", "strength": 71, "confed": "AFC"},
	{"id": "irn", "name": "Irán", "strength": 74, "confed": "AFC"},
	{"id": "civ", "name": "Costa de Marfil", "strength": 74, "confed": "CAF"},
	{"id": "cmr", "name": "Camerún", "strength": 73, "confed": "CAF"},
	{"id": "alg", "name": "Argelia", "strength": 75, "confed": "CAF"},

	{"id": "rou", "name": "Rumanía", "strength": 76, "confed": "UEFA"},
	{"id": "rus", "name": "Rusia", "strength": 77, "confed": "UEFA"},
	{"id": "bul", "name": "Bulgaria", "strength": 71, "confed": "UEFA"},
	{"id": "svk", "name": "Eslovaquia", "strength": 72, "confed": "UEFA"},
	{"id": "svn", "name": "Eslovenia", "strength": 72, "confed": "UEFA"},
	{"id": "irl", "name": "Irlanda", "strength": 73, "confed": "UEFA"},
	{"id": "isl", "name": "Islandia", "strength": 71, "confed": "UEFA"},
	{"id": "fin", "name": "Finlandia", "strength": 71, "confed": "UEFA"},
	{"id": "alba", "name": "Albania", "strength": 71, "confed": "UEFA"},
	{"id": "mkd", "name": "Macedonia del Norte", "strength": 69, "confed": "UEFA"},
	{"id": "isr", "name": "Israel", "strength": 70, "confed": "UEFA"},
	{"id": "bih", "name": "Bosnia y Herzegovina", "strength": 73, "confed": "UEFA"},
	{"id": "geo", "name": "Georgia", "strength": 70, "confed": "UEFA"},
	{"id": "mne", "name": "Montenegro", "strength": 68, "confed": "UEFA"},
	{"id": "nir", "name": "Irlanda del Norte", "strength": 68, "confed": "UEFA"},
	{"id": "bov", "name": "Bolivia", "strength": 68, "confed": "CONMEBOL"},
	{"id": "slv", "name": "El Salvador", "strength": 66, "confed": "CONCACAF"},
	{"id": "gtm", "name": "Guatemala", "strength": 66, "confed": "CONCACAF"},
	{"id": "tto", "name": "Trinidad y Tobago", "strength": 67, "confed": "CONCACAF"},
	{"id": "hai", "name": "Haití", "strength": 66, "confed": "CONCACAF"},
	{"id": "tun", "name": "Túnez", "strength": 74, "confed": "CAF"},
	{"id": "rsa", "name": "Sudáfrica", "strength": 73, "confed": "CAF"},
	{"id": "mli", "name": "Malí", "strength": 70, "confed": "CAF"},
	{"id": "bfa", "name": "Burkina Faso", "strength": 69, "confed": "CAF"},
	{"id": "cod", "name": "RD Congo", "strength": 71, "confed": "CAF"},
	{"id": "gin", "name": "Guinea", "strength": 69, "confed": "CAF"},
	{"id": "zam", "name": "Zambia", "strength": 68, "confed": "CAF"},
	{"id": "agl", "name": "Angola", "strength": 68, "confed": "CAF"},
	{"id": "qat", "name": "Catar", "strength": 73, "confed": "AFC"},
	{"id": "uae", "name": "Emiratos Árabes", "strength": 71, "confed": "AFC"},
	{"id": "irq", "name": "Irak", "strength": 70, "confed": "AFC"},
	{"id": "uzb", "name": "Uzbekistán", "strength": 70, "confed": "AFC"},
	{"id": "chn", "name": "China", "strength": 71, "confed": "AFC"},
	{"id": "jor", "name": "Jordania", "strength": 69, "confed": "AFC"},
	{"id": "syr", "name": "Siria", "strength": 69, "confed": "AFC"},
	{"id": "vie", "name": "Vietnam", "strength": 69, "confed": "AFC"},
	{"id": "tha", "name": "Tailandia", "strength": 69, "confed": "AFC"},
	{"id": "idi", "name": "India", "strength": 68, "confed": "AFC"},
	{"id": "idn", "name": "Indonesia", "strength": 67, "confed": "AFC"},

	{"id": "blr", "name": "Bielorrusia", "strength": 66, "confed": "UEFA"},
	{"id": "ltu", "name": "Lituania", "strength": 60, "confed": "UEFA"},
	{"id": "lva", "name": "Letonia", "strength": 59, "confed": "UEFA"},
	{"id": "esto", "name": "Estonia", "strength": 61, "confed": "UEFA"},
	{"id": "mda", "name": "Moldova", "strength": 58, "confed": "UEFA"},
	{"id": "arm", "name": "Armenia", "strength": 64, "confed": "UEFA"},
	{"id": "aze", "name": "Azerbaiyán", "strength": 62, "confed": "UEFA"},
	{"id": "kaz", "name": "Kazajistán", "strength": 63, "confed": "UEFA"},
	{"id": "kos", "name": "Kosovo", "strength": 63, "confed": "UEFA"},
	{"id": "cyp", "name": "Chipre", "strength": 60, "confed": "UEFA"},
	{"id": "omn", "name": "Omán", "strength": 66, "confed": "AFC"},
	{"id": "bhr", "name": "Baréin", "strength": 62, "confed": "AFC"},
	{"id": "kuw", "name": "Kuwait", "strength": 62, "confed": "AFC"},
	{"id": "lbn", "name": "Líbano", "strength": 61, "confed": "AFC"},
	{"id": "pse", "name": "Palestina", "strength": 58, "confed": "AFC"},
	{"id": "yem", "name": "Yemen", "strength": 55, "confed": "AFC"},
	{"id": "prk", "name": "Corea del Norte", "strength": 63, "confed": "AFC"},
	{"id": "mas", "name": "Malasia", "strength": 60, "confed": "AFC"},
	{"id": "fil", "name": "Filipinas", "strength": 58, "confed": "AFC"},
	{"id": "kgz", "name": "Kirguistán", "strength": 60, "confed": "AFC"},
	{"id": "cpv", "name": "Cabo Verde", "strength": 66, "confed": "CAF"},
	{"id": "gab", "name": "Gabón", "strength": 66, "confed": "CAF"},
	{"id": "cog", "name": "Congo", "strength": 63, "confed": "CAF"},
	{"id": "uga", "name": "Uganda", "strength": 62, "confed": "CAF"},
	{"id": "ken", "name": "Kenia", "strength": 61, "confed": "CAF"},
	{"id": "zim", "name": "Zimbabue", "strength": 62, "confed": "CAF"},
	{"id": "moz", "name": "Mozambique", "strength": 60, "confed": "CAF"},
	{"id": "bni", "name": "Benín", "strength": 63, "confed": "CAF"},
	{"id": "tog", "name": "Togo", "strength": 62, "confed": "CAF"},
	{"id": "lby", "name": "Libia", "strength": 62, "confed": "CAF"},
	{"id": "sdn", "name": "Sudán", "strength": 58, "confed": "CAF"},
	{"id": "mad", "name": "Madagascar", "strength": 60, "confed": "CAF"},

	{"id": "andr", "name": "Andorra", "strength": 53, "confed": "UEFA"},
	{"id": "gib", "name": "Gibraltar", "strength": 51, "confed": "UEFA"},
	{"id": "fro", "name": "Islas Feroe", "strength": 57, "confed": "UEFA"},
	{"id": "liec", "name": "Liechtenstein", "strength": 50, "confed": "UEFA"},
	{"id": "lux", "name": "Luxemburgo", "strength": 61, "confed": "UEFA"},
	{"id": "mlt", "name": "Malta", "strength": 54, "confed": "UEFA"},
	{"id": "smr", "name": "San Marino", "strength": 48, "confed": "UEFA"},
	{"id": "nzl", "name": "Nueva Zelanda", "strength": 66, "confed": "OFC"},
	{"id": "ncal", "name": "Nueva Caledonia", "strength": 58, "confed": "OFC"},
	{"id": "sol", "name": "Islas Salomón", "strength": 57, "confed": "OFC"},
	{"id": "fij", "name": "Fiyi", "strength": 56, "confed": "OFC"},
	{"id": "tah", "name": "Tahití", "strength": 55, "confed": "OFC"},
	{"id": "van", "name": "Vanuatu", "strength": 54, "confed": "OFC"},
	{"id": "png", "name": "Papúa Nueva Guinea", "strength": 53, "confed": "OFC"},
	{"id": "samo", "name": "Samoa", "strength": 51, "confed": "OFC"},
	{"id": "tga", "name": "Tonga", "strength": 50, "confed": "OFC"},
	{"id": "cok", "name": "Islas Cook", "strength": 49, "confed": "OFC"},
	{"id": "asa", "name": "Samoa Americana", "strength": 48, "confed": "OFC"},
	{"id": "cuw", "name": "Curazao", "strength": 66, "confed": "CONCACAF"},
	{"id": "sur", "name": "Surinam", "strength": 63, "confed": "CONCACAF"},
	{"id": "dom", "name": "República Dominicana", "strength": 60, "confed": "CONCACAF"},
	{"id": "nca", "name": "Nicaragua", "strength": 59, "confed": "CONCACAF"},
	{"id": "atg", "name": "Antigua y Barbuda", "strength": 58, "confed": "CONCACAF"},
	{"id": "skn", "name": "San Cristóbal y Nieves", "strength": 57, "confed": "CONCACAF"},
	{"id": "guy", "name": "Guyana", "strength": 56, "confed": "CONCACAF"},
	{"id": "ber", "name": "Bermudas", "strength": 55, "confed": "CONCACAF"},
	{"id": "grn", "name": "Granada", "strength": 54, "confed": "CONCACAF"},
	{"id": "brb", "name": "Barbados", "strength": 53, "confed": "CONCACAF"},
	{"id": "cub", "name": "Cuba", "strength": 52, "confed": "CONCACAF"},
	{"id": "blz", "name": "Belice", "strength": 51, "confed": "CONCACAF"},
	{"id": "pur", "name": "Puerto Rico", "strength": 56, "confed": "CONCACAF"},
	{"id": "vin", "name": "San Vicente y las Granadinas", "strength": 54, "confed": "CONCACAF"},
	{"id": "lca", "name": "Santa Lucía", "strength": 53, "confed": "CONCACAF"},
	{"id": "dma", "name": "Dominica", "strength": 52, "confed": "CONCACAF"},
	{"id": "msr", "name": "Montserrat", "strength": 51, "confed": "CONCACAF"},
	{"id": "cay", "name": "Islas Caimán", "strength": 51, "confed": "CONCACAF"},
	{"id": "aru", "name": "Aruba", "strength": 50, "confed": "CONCACAF"},
	{"id": "bhs", "name": "Bahamas", "strength": 50, "confed": "CONCACAF"},
	{"id": "tca", "name": "Islas Turcas y Caicos", "strength": 49, "confed": "CONCACAF"},
	{"id": "vgb", "name": "Islas Vírgenes Británicas", "strength": 49, "confed": "CONCACAF"},
	{"id": "aia", "name": "Anguila", "strength": 48, "confed": "CONCACAF"},
	{"id": "vir", "name": "Islas Vírgenes de EE.UU.", "strength": 48, "confed": "CONCACAF"},
	{"id": "tjk", "name": "Tayikistán", "strength": 61, "confed": "AFC"},
	{"id": "tkm", "name": "Turkmenistán", "strength": 57, "confed": "AFC"},
	{"id": "hkg", "name": "Hong Kong", "strength": 56, "confed": "AFC"},
	{"id": "sgp", "name": "Singapur", "strength": 55, "confed": "AFC"},
	{"id": "mya", "name": "Myanmar", "strength": 54, "confed": "AFC"},
	{"id": "mdv", "name": "Maldivas", "strength": 53, "confed": "AFC"},
	{"id": "nep", "name": "Nepal", "strength": 52, "confed": "AFC"},
	{"id": "camb", "name": "Camboya", "strength": 51, "confed": "AFC"},
	{"id": "bang", "name": "Bangladés", "strength": 50, "confed": "AFC"},
	{"id": "lao", "name": "Laos", "strength": 49, "confed": "AFC"},
	{"id": "sri", "name": "Sri Lanka", "strength": 48, "confed": "AFC"},
	{"id": "afg", "name": "Afganistán", "strength": 56, "confed": "AFC"},
	{"id": "tpe", "name": "China Taipéi", "strength": 55, "confed": "AFC"},
	{"id": "mng", "name": "Mongolia", "strength": 54, "confed": "AFC"},
	{"id": "bhu", "name": "Bután", "strength": 54, "confed": "AFC"},
	{"id": "bru", "name": "Brunéi", "strength": 53, "confed": "AFC"},
	{"id": "mac", "name": "Macao", "strength": 52, "confed": "AFC"},
	{"id": "tls", "name": "Timor Oriental", "strength": 51, "confed": "AFC"},
	{"id": "pak", "name": "Pakistán", "strength": 50, "confed": "AFC"},
	{"id": "gum", "name": "Guam", "strength": 49, "confed": "AFC"},
	{"id": "nmi", "name": "Islas Marianas del Norte", "strength": 48, "confed": "AFC"},
	{"id": "eqg", "name": "Guinea Ecuatorial", "strength": 65, "confed": "CAF"},
	{"id": "gam", "name": "Gambia", "strength": 62, "confed": "CAF"},
	{"id": "tan", "name": "Tanzania", "strength": 61, "confed": "CAF"},
	{"id": "nam", "name": "Namibia", "strength": 60, "confed": "CAF"},
	{"id": "nig", "name": "Níger", "strength": 59, "confed": "CAF"},
	{"id": "cta", "name": "República Centroafricana", "strength": 58, "confed": "CAF"},
	{"id": "sle", "name": "Sierra Leona", "strength": 57, "confed": "CAF"},
	{"id": "rwa", "name": "Ruanda", "strength": 56, "confed": "CAF"},
	{"id": "bdi", "name": "Burundi", "strength": 55, "confed": "CAF"},
	{"id": "bots", "name": "Botsuana", "strength": 54, "confed": "CAF"},
	{"id": "eth", "name": "Etiopía", "strength": 53, "confed": "CAF"},
	{"id": "lbr", "name": "Liberia", "strength": 52, "confed": "CAF"},
	{"id": "chad", "name": "Chad", "strength": 49, "confed": "CAF"},
	{"id": "mtn", "name": "Mauritania", "strength": 61, "confed": "CAF"},
	{"id": "comr", "name": "Comoras", "strength": 60, "confed": "CAF"},
	{"id": "mwi", "name": "Malaui", "strength": 59, "confed": "CAF"},
	{"id": "gnb", "name": "Guinea-Bisáu", "strength": 58, "confed": "CAF"},
	{"id": "les", "name": "Lesoto", "strength": 55, "confed": "CAF"},
	{"id": "swz", "name": "Esuatini", "strength": 54, "confed": "CAF"},
	{"id": "ssd", "name": "Sudán del Sur", "strength": 53, "confed": "CAF"},
	{"id": "mri", "name": "Mauricio", "strength": 52, "confed": "CAF"},
	{"id": "stp", "name": "Santo Tomé y Príncipe", "strength": 51, "confed": "CAF"},
	{"id": "dji", "name": "Yibuti", "strength": 50, "confed": "CAF"},
	{"id": "som", "name": "Somalia", "strength": 49, "confed": "CAF"},
	{"id": "sey", "name": "Seychelles", "strength": 49, "confed": "CAF"},
	{"id": "eri", "name": "Eritrea", "strength": 48, "confed": "CAF"},

]









const PLAYABLE: Array[String] = [
	"España", "Inglaterra", "Italia", "Alemania", "Portugal", "México",
	"Francia", "Países Bajos", "Brasil", "Argentina", "Estados Unidos",
	"Arabia Saudí", "Turquía", "Bélgica",

	"Escocia", "Grecia", "Ucrania", "Austria", "Suiza", "Chequia", "Croacia", "Serbia",
	"Dinamarca", "Noruega", "Japón", "Corea del Sur", "Colombia", "Chile", "Uruguay", "Egipto",





	"Paraguay", "Ecuador", "Perú", "Bolivia", "Venezuela",








	"Marruecos", "Túnez",






	"Nueva Zelanda",










	"Suecia", "Rumanía",










	"Bosnia y Herzegovina",

]






const LOOK: Dictionary = {
	"España": {"abbrev": "ESP", "kit": Color("c8102e"), "kit2": Color("13284b"), "crest": "star", "pattern": "solid"},
	"Inglaterra": {"abbrev": "ENG", "kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "shield", "pattern": "solid"},
	"Italia": {"abbrev": "ITA", "kit": Color("1b4fd8"), "kit2": Color("f5f5f5"), "crest": "shield", "pattern": "solid"},
	"Alemania": {"abbrev": "GER", "kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner", "pattern": "solid"},
	"Portugal": {"abbrev": "POR", "kit": Color("c8102e"), "kit2": Color("0b7c3c"), "crest": "halved", "pattern": "solid"},
	"México": {"abbrev": "MEX", "kit": Color("0b7c3c"), "kit2": Color("c8102e"), "crest": "star", "pattern": "solid"},
	"FRA": {"abbrev": "FRA", "kit": Color("1a2b6b"), "kit2": Color("f5f5f5"), "crest": "diamond", "pattern": "solid"},
	"ned": {"abbrev": "NED", "kit": Color("ff7f18"), "kit2": Color("f5f5f5"), "crest": "banner", "pattern": "solid"},
	"bel": {"abbrev": "BEL", "kit": Color("c8102e"), "kit2": Color("f6d417"), "crest": "halved", "pattern": "solid"},
	"cro": {"abbrev": "CRO", "kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond",
		"pattern": "checkers", "kit_b": Color("f5f5f5")},
	"sui": {"abbrev": "SUI", "kit": Color("d52b1e"), "kit2": Color("f5f5f5"), "crest": "round"},
	"din": {"abbrev": "DEN", "kit": Color("c60c30"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"pol": {"abbrev": "POL", "kit": Color("f5f5f5"), "kit2": Color("d4213d"), "crest": "halved"},
	"srb": {"abbrev": "SRB", "kit": Color("c6363c"), "kit2": Color("13284b"), "crest": "shield"},
	"aut": {"abbrev": "AUT", "kit": Color("ed2939"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"tur": {"abbrev": "TUR", "kit": Color("e30a17"), "kit2": Color("f5f5f5"), "crest": "star"},
	"arg": {"abbrev": "ARG", "kit": Color("75aadb"), "kit2": Color("f5f5f5"), "crest": "banner",
		"pattern": "stripes", "kit_b": Color("f5f5f5")},
	"BRA": {"abbrev": "BRA", "kit": Color("ffdf00"), "kit2": Color("0b7c3c"), "crest": "star", "pattern": "solid"},
	"uru": {"abbrev": "URU", "kit": Color("5b9bd5"), "kit2": Color("13284b"), "crest": "shield", "pattern": "solid"},
	"col": {"abbrev": "COL", "kit": Color("ffd100"), "kit2": Color("003893"), "crest": "halved", "pattern": "solid"},
	"ecu": {"abbrev": "ECU", "kit": Color("ffd100"), "kit2": Color("c8102e"), "crest": "banner"},
	"per": {"abbrev": "PER", "kit": Color("f5f5f5"), "kit2": Color("d91023"), "crest": "diamond",
		"pattern": "sash", "kit_b": Color("d91023")},
	"usa": {"abbrev": "USA", "kit": Color("f5f5f5"), "kit2": Color("13284b"), "crest": "star"},
	"can": {"abbrev": "CAN", "kit": Color("d52b1e"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"crc": {"abbrev": "CRC", "kit": Color("c8102e"), "kit2": Color("002b7f"), "crest": "halved"},
	"pan": {"abbrev": "PAN", "kit": Color("da121a"), "kit2": Color("005293"), "crest": "shield"},
	"hon": {"abbrev": "HON", "kit": Color("f5f5f5"), "kit2": Color("0073cf"), "crest": "round"},
	"jam": {"abbrev": "JAM", "kit": Color("fcd116"), "kit2": Color("009b3a"), "crest": "diamond"},
	"MAR": {"abbrev": "MAR", "kit": Color("c1272d"), "kit2": Color("006233"), "crest": "halved"},
	"sen": {"abbrev": "SEN", "kit": Color("00853f"), "kit2": Color("e31b23"), "crest": "star"},
	"jpn": {"abbrev": "JPN", "kit": Color("0b1560"), "kit2": Color("f5f5f5"), "crest": "round"},
	"kor": {"abbrev": "KOR", "kit": Color("cd2e3a"), "kit2": Color("13284b"), "crest": "halved"},
	"nga": {"abbrev": "NGA", "kit": Color("008751"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"aus": {"abbrev": "AUS", "kit": Color("ffcd00"), "kit2": Color("00843d"), "crest": "diamond"},
	"egy": {"abbrev": "EGY", "kit": Color("ce1126"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"gha": {"abbrev": "GHA", "kit": Color("f5f5f5"), "kit2": Color("ce1126"), "crest": "star"},
	"sco": {"abbrev": "SCO", "kit": Color("13284b"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"wal": {"abbrev": "WAL", "kit": Color("c8102e"), "kit2": Color("0b7c3c"), "crest": "banner"},
	"swe": {"abbrev": "SWE", "kit": Color("1a63b0"), "kit2": Color("ffd100"), "crest": "banner"},
	"NOR": {"abbrev": "NOR", "kit": Color("c8102e"), "kit2": Color("13284b"), "crest": "banner"},
	"gre": {"abbrev": "GRE", "kit": Color("1a63b0"), "kit2": Color("f5f5f5"), "crest": "cross"},
	"cze": {"abbrev": "CZE", "kit": Color("c8102e"), "kit2": Color("13284b"), "crest": "shield"},
	"ukr": {"abbrev": "UKR", "kit": Color("1a63b0"), "kit2": Color("ffd100"), "crest": "halved"},
	"hun": {"abbrev": "HUN", "kit": Color("c8102e"), "kit2": Color("0b7c3c"), "crest": "banner"},
	"chi": {"abbrev": "CHI", "kit": Color("c8102e"), "kit2": Color("13284b"), "crest": "star"},

	"PAR": {"abbrev": "PAR", "kit": Color("c8102e"), "kit2": Color("13284b"), "crest": "shield",
		"pattern": "stripes", "kit_b": Color("f5f5f5")},
	"VEN": {"abbrev": "VEN", "kit": Color("8a1a12"), "kit2": Color("ffd100"), "crest": "banner"},
	"ksa": {"abbrev": "KSA", "kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"irn": {"abbrev": "IRN", "kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "shield"},
	"civ": {"abbrev": "CIV", "kit": Color("ff7f18"), "kit2": Color("0b7c3c"), "crest": "banner"},
	"cmr": {"abbrev": "CMR", "kit": Color("0b7c3c"), "kit2": Color("c8102e"), "crest": "star"},
	"alg": {"abbrev": "ALG", "kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "halved"},
	"rou": {"abbrev": "ROU", "kit": Color("0a3ea0"), "kit2": Color("fcd116"), "crest": "banner"},
	"rus": {"abbrev": "RUS", "kit": Color("0a3ea0"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"bul": {"abbrev": "BUL", "kit": Color("009b74"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"svk": {"abbrev": "SVK", "kit": Color("0b4ea2"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"svn": {"abbrev": "SVN", "kit": Color("0b4ea2"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"irl": {"abbrev": "IRL", "kit": Color("0a8a4b"), "kit2": Color("ff8830"), "crest": "banner"},
	"isl": {"abbrev": "ISL", "kit": Color("16305f"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"fin": {"abbrev": "FIN", "kit": Color("2247a0"), "kit2": Color("f5f5f5"), "crest": "cross"},
	"alba": {"abbrev": "ALB", "kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield"},
	"mkd": {"abbrev": "MKD", "kit": Color("d21034"), "kit2": Color("f3c518"), "crest": "star"},
	"isr": {"abbrev": "ISR", "kit": Color("0038b8"), "kit2": Color("f5f5f5"), "crest": "star"},

	"bih": {"abbrev": "BIH", "kit": Color("002395"), "kit2": Color("f3c518"), "crest": "diamond",
		"pattern": "diagonal", "kit_b": Color("f3c518")},
	"geo": {"abbrev": "GEO", "kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "cross"},
	"mne": {"abbrev": "MNE", "kit": Color("c40308"), "kit2": Color("c8a24a"), "crest": "shield"},
	"nir": {"abbrev": "NIR", "kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "cross"},
	"bov": {"abbrev": "BOL", "kit": Color("d52b1e"), "kit2": Color("f9e300"), "crest": "banner"},
	"slv": {"abbrev": "SLV", "kit": Color("0f47af"), "kit2": Color("f5f5f5"), "crest": "star"},
	"gtm": {"abbrev": "GUA", "kit": Color("4997d0"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"tto": {"abbrev": "TRI", "kit": Color("da1a35"), "kit2": Color("14161a"), "crest": "diamond"},
	"hai": {"abbrev": "HAI", "kit": Color("00209f"), "kit2": Color("d21034"), "crest": "banner"},
	"tun": {"abbrev": "TUN", "kit": Color("e70013"), "kit2": Color("f5f5f5"), "crest": "star"},
	"rsa": {"abbrev": "RSA", "kit": Color("007a4d"), "kit2": Color("fcb514"), "crest": "banner"},
	"mli": {"abbrev": "MLI", "kit": Color("0aa54b"), "kit2": Color("f9e300"), "crest": "banner"},
	"bfa": {"abbrev": "BFA", "kit": Color("009e49"), "kit2": Color("ef2b2d"), "crest": "star"},
	"cod": {"abbrev": "COD", "kit": Color("007fff"), "kit2": Color("f7d618"), "crest": "star"},
	"gin": {"abbrev": "GUI", "kit": Color("ce1126"), "kit2": Color("009460"), "crest": "banner"},
	"zam": {"abbrev": "ZAM", "kit": Color("198a00"), "kit2": Color("ef7d00"), "crest": "banner"},
	"agl": {"abbrev": "ANG", "kit": Color("cc092f"), "kit2": Color("14161a"), "crest": "star"},
	"qat": {"abbrev": "QAT", "kit": Color("8d1b3d"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"uae": {"abbrev": "UAE", "kit": Color("00843d"), "kit2": Color("c8102e"), "crest": "banner"},
	"irq": {"abbrev": "IRQ", "kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "star"},
	"uzb": {"abbrev": "UZB", "kit": Color("0099b5"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"chn": {"abbrev": "CHN", "kit": Color("de2910"), "kit2": Color("f9e300"), "crest": "star"},
	"jor": {"abbrev": "JOR", "kit": Color("007a3d"), "kit2": Color("c8102e"), "crest": "star"},
	"syr": {"abbrev": "SYR", "kit": Color("ce1126"), "kit2": Color("14161a"), "crest": "star"},
	"vie": {"abbrev": "VIE", "kit": Color("da251d"), "kit2": Color("f9e300"), "crest": "star"},
	"tha": {"abbrev": "THA", "kit": Color("a51931"), "kit2": Color("2d2a4a"), "crest": "banner"},
	"idi": {"abbrev": "IND", "kit": Color("ff9933"), "kit2": Color("138808"), "crest": "round"},
	"idn": {"abbrev": "IDN", "kit": Color("ce1126"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"blr": {"abbrev": "BLR", "kit": Color("c8102e"), "kit2": Color("009b3a"), "crest": "banner"},
	"ltu": {"abbrev": "LTU", "kit": Color("f9e300"), "kit2": Color("006a44"), "crest": "banner"},
	"lva": {"abbrev": "LVA", "kit": Color("7d0a1a"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"esto": {"abbrev": "EST", "kit": Color("0072ce"), "kit2": Color("14161a"), "crest": "banner"},
	"mda": {"abbrev": "MDA", "kit": Color("0046ae"), "kit2": Color("f9e300"), "crest": "shield"},
	"arm": {"abbrev": "ARM", "kit": Color("d90012"), "kit2": Color("f2a800"), "crest": "banner"},
	"aze": {"abbrev": "AZE", "kit": Color("00b5e2"), "kit2": Color("ef3340"), "crest": "star"},
	"kaz": {"abbrev": "KAZ", "kit": Color("00afca"), "kit2": Color("f9e300"), "crest": "star"},
	"kos": {"abbrev": "KOS", "kit": Color("244aa5"), "kit2": Color("f9e300"), "crest": "star"},
	"cyp": {"abbrev": "CYP", "kit": Color("f5f5f5"), "kit2": Color("d47600"), "crest": "shield"},
	"omn": {"abbrev": "OMA", "kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"bhr": {"abbrev": "BHR", "kit": Color("da1a35"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"kuw": {"abbrev": "KUW", "kit": Color("007a3d"), "kit2": Color("c8102e"), "crest": "banner"},
	"lbn": {"abbrev": "LIB", "kit": Color("c8102e"), "kit2": Color("009b3a"), "crest": "star"},
	"pse": {"abbrev": "PLE", "kit": Color("007a3d"), "kit2": Color("14161a"), "crest": "banner"},
	"yem": {"abbrev": "YEM", "kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner"},
	"prk": {"abbrev": "PRK", "kit": Color("024fa2"), "kit2": Color("c8102e"), "crest": "star"},
	"mas": {"abbrev": "MAS", "kit": Color("c8102e"), "kit2": Color("0032a0"), "crest": "star"},
	"fil": {"abbrev": "PHI", "kit": Color("0038a8"), "kit2": Color("ce1126"), "crest": "star"},
	"kgz": {"abbrev": "KGZ", "kit": Color("e8112d"), "kit2": Color("f9e300"), "crest": "star"},
	"cpv": {"abbrev": "CPV", "kit": Color("003893"), "kit2": Color("c8102e"), "crest": "star"},
	"gab": {"abbrev": "GAB", "kit": Color("009e60"), "kit2": Color("3a75c4"), "crest": "banner"},
	"cog": {"abbrev": "CGO", "kit": Color("009543"), "kit2": Color("f9e300"), "crest": "banner"},
	"uga": {"abbrev": "UGA", "kit": Color("14161a"), "kit2": Color("f9e300"), "crest": "banner"},
	"ken": {"abbrev": "KEN", "kit": Color("006600"), "kit2": Color("c8102e"), "crest": "shield"},
	"zim": {"abbrev": "ZIM", "kit": Color("009e49"), "kit2": Color("f9e300"), "crest": "banner"},
	"moz": {"abbrev": "MOZ", "kit": Color("009e49"), "kit2": Color("14161a"), "crest": "star"},
	"bni": {"abbrev": "BEN", "kit": Color("008751"), "kit2": Color("f9e300"), "crest": "banner"},
	"tog": {"abbrev": "TOG", "kit": Color("006a4e"), "kit2": Color("f9e300"), "crest": "star"},
	"lby": {"abbrev": "LBY", "kit": Color("239e46"), "kit2": Color("14161a"), "crest": "star"},
	"sdn": {"abbrev": "SDN", "kit": Color("c8102e"), "kit2": Color("007229"), "crest": "banner"},
	"mad": {"abbrev": "MAD", "kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "banner"},

	"andr": {"abbrev": "AND", "kit": Color("e01e2c"), "kit2": Color("0f3d91"), "crest": "shield"},
	"gib": {"abbrev": "GIB", "kit": Color("c8102e"), "kit2": Color("ffffff"), "crest": "round"},
	"fro": {"abbrev": "FRO", "kit": Color("ffffff"), "kit2": Color("0065bd"), "crest": "banner"},
	"liec": {"abbrev": "LIE", "kit": Color("0033a0"), "kit2": Color("cf0921"), "crest": "diamond"},
	"lux": {"abbrev": "LUX", "kit": Color("ef3340"), "kit2": Color("ffffff"), "crest": "halved"},
	"mlt": {"abbrev": "MLT", "kit": Color("cf142b"), "kit2": Color("f5f5f5"), "crest": "star"},
	"smr": {"abbrev": "SMR", "kit": Color("6cace4"), "kit2": Color("ffffff"), "crest": "shield"},
	"nzl": {"abbrev": "NZL", "kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner"},
	"ncal": {"abbrev": "NCL", "kit": Color("1f4fa0"), "kit2": Color("f2f4f6"), "crest": "diamond"},
	"sol": {"abbrev": "SOL", "kit": Color("1e8f4e"), "kit2": Color("f6d33c"), "crest": "star"},
	"fij": {"abbrev": "FIJ", "kit": Color("f2f4f6"), "kit2": Color("3f8fd0"), "crest": "shield"},
	"tah": {"abbrev": "TAH", "kit": Color("d6342c"), "kit2": Color("f2f4f6"), "crest": "round"},
	"van": {"abbrev": "VAN", "kit": Color("f2c31c"), "kit2": Color("0f7a3d"), "crest": "halved"},
	"png": {"abbrev": "PNG", "kit": Color("c8302c"), "kit2": Color("1a1a1a"), "crest": "shield"},
	"samo": {"abbrev": "SAM", "kit": Color("1b4fa0"), "kit2": Color("f2f4f6"), "crest": "round"},
	"tga": {"abbrev": "TGA", "kit": Color("c8102e"), "kit2": Color("f2f4f6"), "crest": "halved"},
	"cok": {"abbrev": "COK", "kit": Color("0f7d4a"), "kit2": Color("f2f4f6"), "crest": "star"},
	"asa": {"abbrev": "ASA", "kit": Color("15275e"), "kit2": Color("c1272d"), "crest": "banner"},
	"cuw": {"abbrev": "CUW", "kit": Color("002b7f"), "kit2": Color("f9e814"), "crest": "shield"},
	"sur": {"abbrev": "SUR", "kit": Color("ffffff"), "kit2": Color("377e3f"), "crest": "banner"},
	"dom": {"abbrev": "DOM", "kit": Color("002d62"), "kit2": Color("ce1126"), "crest": "halved"},
	"nca": {"abbrev": "NCA", "kit": Color("3a7dd8"), "kit2": Color("ffffff"), "crest": "round"},
	"atg": {"abbrev": "ATG", "kit": Color("ce1126"), "kit2": Color("0f0f14"), "crest": "banner"},
	"skn": {"abbrev": "SKN", "kit": Color("009e49"), "kit2": Color("ce1126"), "crest": "halved"},
	"guy": {"abbrev": "GUY", "kit": Color("009e49"), "kit2": Color("fcd116"), "crest": "diamond"},
	"ber": {"abbrev": "BER", "kit": Color("1f4e9c"), "kit2": Color("cf142b"), "crest": "shield"},
	"grn": {"abbrev": "GRN", "kit": Color("ce1126"), "kit2": Color("007a5e"), "crest": "star"},
	"brb": {"abbrev": "BRB", "kit": Color("00267f"), "kit2": Color("ffc726"), "crest": "diamond"},
	"cub": {"abbrev": "CUB", "kit": Color("d21034"), "kit2": Color("002a8f"), "crest": "star"},
	"blz": {"abbrev": "BLZ", "kit": Color("ce1126"), "kit2": Color("003f87"), "crest": "round"},
	"pur": {"abbrev": "PUR", "kit": Color("e4002b"), "kit2": Color("0d3b8c"), "crest": "star"},
	"vin": {"abbrev": "VIN", "kit": Color("ffd100"), "kit2": Color("0072ce"), "crest": "diamond"},
	"lca": {"abbrev": "LCA", "kit": Color("0099cc"), "kit2": Color("ffce00"), "crest": "diamond"},
	"dma": {"abbrev": "DMA", "kit": Color("007a33"), "kit2": Color("ffd100"), "crest": "round"},
	"msr": {"abbrev": "MSR", "kit": Color("007a33"), "kit2": Color("ffffff"), "crest": "shield"},
	"cay": {"abbrev": "CAY", "kit": Color("c8102e"), "kit2": Color("ffffff"), "crest": "shield"},
	"aru": {"abbrev": "ARU", "kit": Color("ffd100"), "kit2": Color("418fde"), "crest": "star"},
	"bhs": {"abbrev": "BAH", "kit": Color("ffc72c"), "kit2": Color("00778b"), "crest": "banner"},
	"tca": {"abbrev": "TCA", "kit": Color("0a3e8c"), "kit2": Color("ffd100"), "crest": "banner"},
	"vgb": {"abbrev": "VGB", "kit": Color("0a3e8c"), "kit2": Color("ffffff"), "crest": "halved"},
	"aia": {"abbrev": "AIA", "kit": Color("1a4fa0"), "kit2": Color("ff7f00"), "crest": "round"},
	"vir": {"abbrev": "VIR", "kit": Color("ffffff"), "kit2": Color("1f4fa0"), "crest": "halved"},
	"tjk": {"abbrev": "TJK", "kit": Color("e8112d"), "kit2": Color("ffffff"), "crest": "star"},
	"tkm": {"abbrev": "TKM", "kit": Color("1c9e4f"), "kit2": Color("ffffff"), "crest": "diamond"},
	"hkg": {"abbrev": "HKG", "kit": Color("d0021b"), "kit2": Color("ffffff"), "crest": "round"},
	"sgp": {"abbrev": "SGP", "kit": Color("ed2939"), "kit2": Color("ffffff"), "crest": "shield"},
	"mya": {"abbrev": "MYA", "kit": Color("c8102e"), "kit2": Color("fecb00"), "crest": "star"},
	"mdv": {"abbrev": "MDV", "kit": Color("d21034"), "kit2": Color("007e3a"), "crest": "banner"},
	"nep": {"abbrev": "NEP", "kit": Color("dc143c"), "kit2": Color("003893"), "crest": "diamond"},
	"camb": {"abbrev": "CAM", "kit": Color("032ea1"), "kit2": Color("e4002b"), "crest": "banner"},
	"bang": {"abbrev": "BAN", "kit": Color("006a4e"), "kit2": Color("f42a41"), "crest": "round"},
	"lao": {"abbrev": "LAO", "kit": Color("ce1126"), "kit2": Color("002868"), "crest": "halved"},
	"sri": {"abbrev": "SRI", "kit": Color("8d153a"), "kit2": Color("ffb700"), "crest": "shield"},
	"afg": {"abbrev": "AFG", "kit": Color("d21034"), "kit2": Color("1a1a1a"), "crest": "shield"},
	"tpe": {"abbrev": "TPE", "kit": Color("0b318f"), "kit2": Color("f5f5f5"), "crest": "halved"},
	"mng": {"abbrev": "MNG", "kit": Color("c4272f"), "kit2": Color("015197"), "crest": "round"},
	"bhu": {"abbrev": "BHU", "kit": Color("f57c00"), "kit2": Color("ffd400"), "crest": "diamond"},
	"bru": {"abbrev": "BRU", "kit": Color("f7e017"), "kit2": Color("111111"), "crest": "diamond"},
	"mac": {"abbrev": "MAC", "kit": Color("00785e"), "kit2": Color("f5f5f5"), "crest": "round"},
	"tls": {"abbrev": "TLS", "kit": Color("d52b1e"), "kit2": Color("111111"), "crest": "star"},
	"pak": {"abbrev": "PAK", "kit": Color("046a38"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"gum": {"abbrev": "GUM", "kit": Color("003087"), "kit2": Color("bf0a30"), "crest": "banner"},
	"nmi": {"abbrev": "NMI", "kit": Color("0057b8"), "kit2": Color("f5f5f5"), "crest": "banner"},
	"eqg": {"abbrev": "EQG", "kit": Color("d21034"), "kit2": Color("0f7a34"), "crest": "banner"},
	"gam": {"abbrev": "GAM", "kit": Color("ce1126"), "kit2": Color("f5f5f5"), "crest": "shield"},
	"tan": {"abbrev": "TAN", "kit": Color("1f7fd4"), "kit2": Color("0f8f45"), "crest": "shield"},
	"nam": {"abbrev": "NAM", "kit": Color("c8102e"), "kit2": Color("003580"), "crest": "diamond"},
	"nig": {"abbrev": "NIG", "kit": Color("f07b1f"), "kit2": Color("0f8a3f"), "crest": "shield"},
	"cta": {"abbrev": "CTA", "kit": Color("1560bd"), "kit2": Color("f5f5f5"), "crest": "round"},
	"sle": {"abbrev": "SLE", "kit": Color("1eb53a"), "kit2": Color("0072c6"), "crest": "diamond"},
	"rwa": {"abbrev": "RWA", "kit": Color("0a9bd6"), "kit2": Color("f4d100"), "crest": "banner"},
	"bdi": {"abbrev": "BDI", "kit": Color("c8102e"), "kit2": Color("1a7f3c"), "crest": "halved"},
	"bots": {"abbrev": "BOT", "kit": Color("4aa9e0"), "kit2": Color("111318"), "crest": "round"},
	"eth": {"abbrev": "ETH", "kit": Color("0f7a3d"), "kit2": Color("f7d417"), "crest": "star"},
	"lbr": {"abbrev": "LBR", "kit": Color("12326b"), "kit2": Color("f5f5f5"), "crest": "halved"},
	"chad": {"abbrev": "CHA", "kit": Color("002664"), "kit2": Color("fecb00"), "crest": "star"},
	"mtn": {"abbrev": "MTN", "kit": Color("046a38"), "kit2": Color("ffc72c"), "crest": "round"},
	"comr": {"abbrev": "COM", "kit": Color("0d7a3f"), "kit2": Color("ffffff"), "crest": "shield"},
	"mwi": {"abbrev": "MWI", "kit": Color("d21034"), "kit2": Color("111111"), "crest": "star"},
	"gnb": {"abbrev": "GNB", "kit": Color("007a5e"), "kit2": Color("d21034"), "crest": "star"},
	"les": {"abbrev": "LES", "kit": Color("00209f"), "kit2": Color("009543"), "crest": "banner"},
	"swz": {"abbrev": "SWZ", "kit": Color("b10c0c"), "kit2": Color("3e5eb9"), "crest": "round"},
	"ssd": {"abbrev": "SSD", "kit": Color("0b0b0b"), "kit2": Color("da121a"), "crest": "halved"},
	"mri": {"abbrev": "MRI", "kit": Color("ea2839"), "kit2": Color("1a206d"), "crest": "shield"},
	"stp": {"abbrev": "STP", "kit": Color("12ad2b"), "kit2": Color("ffce00"), "crest": "diamond"},
	"dji": {"abbrev": "DJI", "kit": Color("6ab2e7"), "kit2": Color("12ad2b"), "crest": "banner"},
	"som": {"abbrev": "SOM", "kit": Color("4189dd"), "kit2": Color("ffffff"), "crest": "diamond"},
	"sey": {"abbrev": "SEY", "kit": Color("d62828"), "kit2": Color("003d88"), "crest": "halved"},
	"eri": {"abbrev": "ERI", "kit": Color("1e9d4b"), "kit2": Color("0f47af"), "crest": "shield"},

}







static func as_team(id: String) -> Dictionary:
	var n: Dictionary = by_id(id)
	if n.is_empty():
		return {}


	var nid: String = String(n["id"])
	var look: Dictionary = LOOK.get(nid, {"abbrev": nid.substr(0, 3).to_upper(),
		"kit": Color("8a8f98"), "kit2": Color("f5f5f5"), "crest": "shield"})
	var out: Dictionary = {"id": nid, "name": String(n["name"]), "abbrev": String(look["abbrev"]),
		"country": String(n["name"]), "league": String(n["name"]), "div": 1,
		"kit": look["kit"], "kit2": look["kit2"], "crest": String(look["crest"]),


		"rating": strength(nid), "is_nation": true,
		"surnames": String(SURNAME_POOL.get(nid, String(n["name"])))}




	var dibujo: String = String(look.get("pattern", patron_de(nid)))
	if not dibujo.is_empty() and dibujo != "solid":
		out["pattern"] = dibujo
		out["kit_b"] = look.get("kit_b", _segundo_color(out["kit"], out["kit2"]))





	NationEdits.apply(out)
	return out















const PATRON_BOLSA: Array[String] = [
	"solid", "solid", "solid", "solid", "solid", "solid",
	"stripes", "stripes", "hoops", "sash", "half", "diagonal", "chevron",
	"pinstripes", "sleeves", "band_h", "yoke", "raglan",





	"aspa", "aspa", "half_h", "galon_doble", "cintura", "rayas_diag",
	"aros_fino",




	"lineas_pares", "aros_pares",
]








static func patron_de(nat_id: String) -> String:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("natkit|%s" % nat_id)
	return PATRON_BOLSA[rng.randi_range(0, PATRON_BOLSA.size() - 1)]










static func _segundo_color(a: Color, b: Color) -> Color:
	var dh: float = absf(a.h - b.h)
	dh = minf(dh, 1.0 - dh)
	if dh >= 0.06 or absf(a.get_luminance() - b.get_luminance()) >= 0.1:
		return b
	return Color("f5f5f5") if a.get_luminance() < 0.5 else Color("14161a")



static var _index: Dictionary = {}








const LEGACY_IDS: Dictionary = {
	"fra": "FRA", "bra": "BRA", "nor": "NOR",
	"par": "PAR", "ven": "VEN", "mar": "MAR",
}















const ALIAS_IDS: Dictionary = {
	"esp": "España", "eng": "Inglaterra", "ita": "Italia",
	"ger": "Alemania", "deu": "Alemania", "prt": "Portugal",
	"por": "Portugal", "mex": "México",
}








static func canon_id(id: String) -> String:
	if _index.is_empty():
		_build_index()
	if _index.has(id):
		return id
	if LEGACY_IDS.has(id):
		return String(LEGACY_IDS[id])
	var low: String = id.to_lower()





	if ALIAS_IDS.has(low) and (low != "por" or id == "por"):
		return String(ALIAS_IDS[low])
	return String(_by_lower.get(low, id))





static var _by_lower: Dictionary = {}


static func _build_index() -> void:
	for n in POOL:
		var nid: String = String(n["id"])
		_index[nid] = n
		_by_lower[nid.to_lower()] = nid
		_by_lower[String(n["name"]).to_lower()] = nid





























const SURNAME_POOL: Dictionary = {

	"cro": "Croacia", "srb": "Serbia", "svn": "Balcanes", "svk": "Balcanes",
	"bih": "Bosnia y Herzegovina", "mkd": "Balcanes", "mne": "Balcanes", "kos": "Balcanes",
	"bul": "Balcanes", "pol": "Polonia", "cze": "Chequia", "ukr": "Ucrania",
	"rus": "Rusia", "blr": "Rusia", "alba": "Balcanes", "gre": "Grecia",
	"geo": "Georgia", "arm": "Armenia", "mda": "Rumanía", "ltu": "Balcanes",
	"lva": "Balcanes", "cyp": "Grecia", "hun": "Hungría",
	"sui": "Suiza", "aut": "Austria", "din": "Dinamarca", "swe": "Suecia",
	"NOR": "Noruega", "isl": "Alemania", "fin": "Finlandia", "esto": "Finlandia",
	"rou": "Rumanía", "isr": "Israel",
	"sco": "Escocia", "wal": "Gales", "irl": "Irlanda", "nir": "Irlanda",
	"aze": "Turquía", "kaz": "Turquía",

	"BRA": "Brasil",
	"uru": "Uruguay", "col": "Colombia", "chi": "Chile", "per": "Perú",
	"ecu": "Ecuador", "VEN": "Venezuela", "PAR": "Paraguay", "bov": "Bolivia",

	"can": "Inglaterra", "jam": "Inglaterra", "tto": "Inglaterra",
	"crc": "México", "pan": "México", "hon": "México", "slv": "México", "gtm": "México",
	"hai": "Francia",

	"sen": "Senegal", "civ": "Costa de Marfil", "cmr": "Camerún", "mli": "Francia",
	"bfa": "Francia", "gin": "Francia", "cod": "Francia", "gab": "Francia",
	"cog": "Francia", "bni": "Francia", "tog": "Francia", "mad": "Francia",
	"nga": "Nigeria", "gha": "Ghana", "rsa": "Sudáfrica", "zam": "Inglaterra",
	"ken": "Inglaterra", "zim": "Inglaterra", "uga": "Inglaterra", "sdn": "Inglaterra",
	"agl": "Portugal", "moz": "Portugal", "cpv": "Portugal",
	"MAR": "Marruecos", "egy": "Egipto", "alg": "Marruecos",
	"tun": "Túnez", "lby": "Marruecos",

	"jpn": "Japón", "kor": "Corea del Sur", "prk": "Corea", "chn": "China",
	"vie": "Vietnam", "tha": "Tailandia",
	"aus": "Inglaterra", "idi": "Inglaterra", "fil": "España",
	"irn": "Irán", "qat": "Catar", "uae": "Emiratos",









	"irq": "Arabia Saudí", "syr": "Arabia Saudí", "jor": "Jordania",
	"omn": "Arabia Saudí", "bhr": "Arabia Saudí", "kuw": "Arabia Saudí",
	"lbn": "Arabia Saudí", "pse": "Arabia Saudí", "yem": "Arabia Saudí",
	"idn": "Indonesia", "mas": "Indonesia", "uzb": "Uzbekistán", "kgz": "Turquía",

	"andr": "España", "gib": "Inglaterra", "fro": "Dinamarca", "liec": "Alemania",
	"lux": "Alemania", "mlt": "Italia", "smr": "Italia", "nzl": "Nueva Zelanda", "ncal": "Nueva Caledonia",
	"sol": "Inglaterra", "fij": "Fiyi", "tah": "Tahití", "van": "Inglaterra",
	"png": "Inglaterra", "samo": "Inglaterra", "tga": "Inglaterra", "cok": "Inglaterra",
	"asa": "Inglaterra", "cuw": "Países Bajos", "sur": "Países Bajos", "dom": "México",
	"nca": "México", "atg": "Inglaterra", "skn": "Inglaterra", "guy": "Inglaterra",
	"ber": "Inglaterra", "grn": "Inglaterra", "brb": "Inglaterra", "cub": "México",
	"blz": "Inglaterra", "pur": "México", "vin": "Inglaterra", "lca": "Inglaterra",
	"dma": "Inglaterra", "msr": "Inglaterra", "cay": "Inglaterra", "aru": "Países Bajos",
	"bhs": "Inglaterra", "tca": "Inglaterra", "vgb": "Inglaterra", "aia": "Inglaterra",
	"vir": "Estados Unidos", "tjk": "Turquía", "tkm": "Turquía", "hkg": "China", "sgp": "China",
	"mya": "China", "mdv": "Arabia Saudí", "nep": "China", "camb": "China", "bang": "Arabia Saudí",
	"lao": "China", "sri": "Portugal", "afg": "Turquía", "tpe": "China", "mng": "Turquía",
	"bhu": "China", "bru": "Arabia Saudí", "mac": "China", "tls": "Portugal",
	"pak": "Arabia Saudí", "gum": "Estados Unidos", "nmi": "Estados Unidos", "eqg": "España",
	"gam": "Inglaterra", "tan": "Inglaterra", "nam": "Inglaterra", "nig": "Francia",
	"cta": "Francia", "sle": "Inglaterra", "rwa": "Francia", "bdi": "Francia",
	"bots": "Inglaterra", "eth": "Inglaterra", "lbr": "Inglaterra", "chad": "Francia",
	"mtn": "Francia", "comr": "Francia", "mwi": "Inglaterra", "gnb": "Portugal",
	"les": "Inglaterra", "swz": "Inglaterra", "ssd": "Inglaterra", "mri": "Francia",
	"stp": "Portugal", "dji": "Francia", "som": "Egipto", "sey": "Francia", "eri": "Inglaterra",

}





static func by_id(id: String) -> Dictionary:
	if _index.is_empty():
		_build_index()
	return _index.get(canon_id(id), {})





static func id_for_country(country: String) -> String:
	return canon_id(country)








static func surname_key(id: String) -> String:
	var nid: String = canon_id(id)
	return String(SURNAME_POOL.get(nid, name_of(nid)))











static func display_name(id: String) -> String:
	return I18n.t(name_of(id))












static func team_label(t: Dictionary, vacio: String = "") -> String:
	var out: String
	if bool(t.get("is_nation", false)):
		out = display_name(String(t.get("id", t.get("name", ""))))
	else:
		out = Competitions.demarca(String(t.get("name", "")))
	return out if not out.is_empty() else vacio




static func name_of(id: String) -> String:
	var n: Dictionary = by_id(id)
	return String(n["name"]) if not n.is_empty() else id








static func strength(id: String) -> int:
	return roundi(strength_f(id))






static func strength_f(id: String) -> float:
	return clampf(
		Teams.heritage_scale(float(by_id(id).get("strength", 70))) + coef_of(id) + ciclo_of(id),
		1.0, 99.0)

























static func coef_of(id: String) -> float:
	return float(GameState.nat_coef.get(String(LEGACY_IDS.get(id, id)), 0.0))



































const CICLO_AMP: float = 5.0
const CICLO_PERIODO_MIN: int = 14
const CICLO_PERIODO_MAX: int = 22



static var ciclo_amp: float = CICLO_AMP




static var _ciclo_memo: Dictionary = {}
static var _ciclo_memo_de: Array = []



static func ciclo_of(id: String) -> float:
	var s: int = GameState.season_num
	if ciclo_amp == 0.0 or s <= 1:
		return 0.0
	var de: Array = [WorldAging.world_seed(), s, ciclo_amp]
	if _ciclo_memo_de != de:
		_ciclo_memo_de = de
		_ciclo_memo = {}
	var key: String = String(LEGACY_IDS.get(id, id))
	if _ciclo_memo.has(key):
		return float(_ciclo_memo[key])
	var c: float = ciclo_en(key, s, WorldAging.world_seed(), ciclo_amp)
	_ciclo_memo[key] = c
	return c





static func ciclo_en(key: String, s: int, semilla: int, amp: float) -> float:
	if s <= 1:
		return 0.0




	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash("%d-%s-generacion" % [semilla, key])
	var periodo: float = float(rng.randi_range(CICLO_PERIODO_MIN, CICLO_PERIODO_MAX))
	var fase: float = rng.randf() * TAU
	return amp *(sin(TAU * float(s - 1) / periodo + fase) - sin(fase))



static func confed_of(id: String) -> String:
	return String(by_id(id).get("confed", "OTROS"))
























static func _ordena_por_fuerza(out: Array) -> Array:
	var f: Dictionary = {}
	for n in out:
		f[String(n["id"])] = strength_f(String(n["id"]))
	out.sort_custom(func(a, b):
		var fa: float = float(f[String(a["id"])])
		var fb: float = float(f[String(b["id"])])
		if not is_equal_approx(fa, fb):
			return fa > fb
		return String(a["id"]) < String(b["id"]))
	return out




static func of_confed(confed: String, exclude_id: String = "") -> Array:
	return _ordena_por_fuerza(POOL.filter(func(n: Dictionary) -> bool:
		return String(n["confed"]) == confed and String(n["id"]) != exclude_id))




static func top(count: int, exclude_id: String = "") -> Array:
	return _ordena_por_fuerza(POOL.filter(func(n: Dictionary) -> bool:
		return String(n["id"]) != exclude_id)).slice(0, count)



const CONTINENTAL: Dictionary = {
	"UEFA": "EUROCOPA",
	"CONMEBOL": "COPA AMÉRICA",
	"CONCACAF": "COPA ORO",
	"AFC": "COPA DE ASIA",
	"CAF": "COPA AFRICANA",

	"OFC": "COPA DE OCEANÍA",

}







const FAKE_CONTINENTAL: Dictionary = {
	"UEFA": "TORNEO EUROPEO",
	"CONMEBOL": "TORNEO SUDAMERICANO",
	"CONCACAF": "TORNEO NORTEAMERICANO",
	"AFC": "TORNEO ASIÁTICO",
	"CAF": "TORNEO AFRICANO",
	"OFC": "TORNEO DE OCEANÍA",
}




















const CONTINENTAL_REGION: Dictionary = {
	"UEFA": "EUROPA",
	"CONMEBOL": "SUDAMÉRICA",
	"CONCACAF": "NORTEAMÉRICA",
	"AFC": "ASIA",
	"CAF": "ÁFRICA",
	"OFC": "OCEANÍA",
}



static func continental_region(confed: String) -> String:
	return String(CONTINENTAL_REGION.get(confed, "CONTINENTAL"))



static func continental_region_of(nation_id: String) -> String:
	return continental_region(confed_of(nation_id))







static func continental_name(confed: String) -> String:
	if Teams.fake_names_on():
		return String(FAKE_CONTINENTAL.get(confed, "TORNEO CONTINENTAL"))
	return String(CONTINENTAL.get(confed, "COPA CONTINENTAL"))


static func continental_name_of(nation_id: String) -> String:
	return continental_name(confed_of(nation_id))
