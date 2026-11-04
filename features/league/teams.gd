class_name Teams
extends RefCounted










































const STARTER_TIER: int = 3










const POOL: Array = [




















	{"id": "rma", "name": "Real Madrid", "abbrev": "RMA", "country": "España", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 99},
	{"id": "bar", "name": "Barcelona", "abbrev": "BAR", "country": "España", "div": 1,
		"kit": Color("133a7c"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("a50044"),
		"shape": "shield", "crest_pattern": "quartered", "emblem": "letters", "rim": "gold", "rating": 97},
	{"id": "atm", "name": "Atlético", "abbrev": "ATM", "country": "España", "div": 1,
		"kit": Color("cb3524"), "kit2": Color("1b2a55"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "tree", "rim": "dark", "rating": 95},
	{"id": "gir", "name": "Girona", "abbrev": "GIR", "country": "España", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 91},
	{"id": "ath", "name": "Athletic", "abbrev": "ATH", "country": "España", "div": 1,
		"kit": Color("d11f2d"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "tree", "rim": "dark", "rating": 91},
	{"id": "rso", "name": "Real Sociedad", "abbrev": "RSO", "country": "España", "div": 1,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 91},
	{"id": "bet", "name": "Betis", "abbrev": "BET", "country": "España", "div": 1,
		"kit": Color("0b8a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "gold", "rating": 90},
	{"id": "vil", "name": "Villarreal", "abbrev": "VIL", "country": "España", "div": 1,
		"kit": Color("ffe667"), "kit2": Color("ffe667"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 90},
	{"id": "sev", "name": "Sevilla", "abbrev": "SEV", "country": "España", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "val", "name": "Valencia", "abbrev": "VAL", "country": "España", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 88},
	{"id": "osa", "name": "Osasuna", "abbrev": "OSA", "country": "España", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "ring", "emblem_tone": "gold", "rim": "gold", "rating": 87},
	{"id": "cel", "name": "Celta", "abbrev": "CEL", "country": "España", "div": 1,
		"kit": Color("8ac6ff"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 86},
	{"id": "get", "name": "Getafe", "abbrev": "GET", "country": "España", "div": 1,
		"kit": Color("0b57a4"), "kit2": Color("0b57a4"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 86},
	{"id": "ray", "name": "Rayo", "abbrev": "RAY", "country": "España", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("e2001a"),
		"shape": "round", "crest_pattern": "sash", "emblem": "bolt", "rim": "dark", "rating": 85},
	{"id": "mll", "name": "Mallorca", "abbrev": "MLL", "country": "España", "div": 1,
		"kit": Color("b1121b"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "alv", "name": "Alavés", "abbrev": "ALV", "country": "España", "div": 1,
		"kit": Color("14449c"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "lpa", "name": "Las Palmas", "abbrev": "LPA", "country": "España", "div": 1,
		"kit": Color("ffdd00"), "kit2": Color("0a4aa0"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 85},
	{"id": "esp", "name": "Espanyol", "abbrev": "ESP", "country": "España", "div": 1,
		"kit": Color("0a63b0"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "crown", "emblem_tone": "gold", "rim": "dark", "rating": 85},

	{"id": "zar", "name": "Zaragoza", "abbrev": "ZAR", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a3f8c"), "crest": "shield", "rating": 80},
	{"id": "ovi", "name": "Oviedo", "abbrev": "OVI", "country": "España", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 82},
	{"id": "spg", "name": "Sporting Gijón", "abbrev": "SPG", "country": "España", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 80},
	{"id": "lvt", "name": "Levante", "abbrev": "LVT", "country": "España", "div": 2,
		"kit": Color("9b1b3a"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "halved", "rating": 79},
	{"id": "leg", "name": "Leganés", "abbrev": "LEG", "country": "España", "div": 2,
		"kit": Color("1a4a9c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 79},
	{"id": "vad", "name": "Valladolid", "abbrev": "VLL", "country": "España", "div": 1,
		"kit": Color("6a2b8a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 84},
	{"id": "hue", "name": "Huesca", "abbrev": "HUE", "country": "España", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 78},
	{"id": "eib", "name": "Eibar", "abbrev": "EIB", "country": "España", "div": 2,
		"kit": Color("0b3b8c"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("9b1b3a"), "crest": "halved", "rating": 78},




	{"id": "car", "name": "Cartagena", "abbrev": "CAR", "country": "España", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 66},
	{"id": "rac", "name": "Racing", "abbrev": "RAC", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner", "rating": 77},
	{"id": "mir", "name": "Mirandés", "abbrev": "MIR", "country": "España", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "round", "rating": 76},
	{"id": "cad", "name": "Cádiz", "abbrev": "CAD", "country": "España", "div": 2,
		"kit": Color("ffd200"), "kit2": Color("1d3f8f"), "crest": "shield", "rating": 77},

	{"id": "mci", "name": "Manchester City", "abbrev": "MCI", "country": "Inglaterra", "div": 1,
		"kit": Color("6cabdd"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "gold", "rating": 99},
	{"id": "liv", "name": "Liverpool", "abbrev": "LIV", "country": "Inglaterra", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 98},
	{"id": "ars", "name": "Arsenal", "abbrev": "ARS", "country": "Inglaterra", "div": 1,
		"kit": Color("ef0107"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "french", "crest_pattern": "solid", "emblem": "cannon", "emblem_tone": "gold", "rim": "gold", "rating": 98},
	{"id": "che", "name": "Chelsea", "abbrev": "CHE", "country": "Inglaterra", "div": 1,
		"kit": Color("034694"), "kit2": Color("034694"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 96},
	{"id": "mun", "name": "Manchester Utd", "abbrev": "MUN", "country": "Inglaterra", "div": 1,
		"kit": Color("da291c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "trident", "emblem_tone": "gold", "rim": "gold", "rating": 96},
	{"id": "tot", "name": "Tottenham", "abbrev": "TOT", "country": "Inglaterra", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("132257"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "rooster", "rim": "dark", "rating": 95},
	{"id": "new", "name": "Newcastle", "abbrev": "NEW", "country": "Inglaterra", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "heater", "crest_pattern": "solid", "emblem": "tower", "rim": "white", "rating": 94},
	{"id": "avl", "name": "Aston Villa", "abbrev": "AVL", "country": "Inglaterra", "div": 1,
		"kit": Color("670e36"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("95bfe5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 94},
	{"id": "bhi", "name": "Brighton", "abbrev": "BHI", "country": "Inglaterra", "div": 1,
		"kit": Color("0057b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 93},
	{"id": "whu", "name": "West Ham", "abbrev": "WHU", "country": "Inglaterra", "div": 1,
		"kit": Color("7a263a"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("1bb1e7"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 92},
	{"id": "wol", "name": "Wolves", "abbrev": "WOL", "country": "Inglaterra", "div": 1,
		"kit": Color("fdb913"), "kit2": Color("14161a"),
		"shape": "hex", "crest_pattern": "solid", "emblem": "wolf", "rim": "dark", "rating": 91},
	{"id": "cry", "name": "Crystal Palace", "abbrev": "CRY", "country": "Inglaterra", "div": 1,
		"kit": Color("1b458f"), "kit2": Color("c4122e"), "pattern": "stripes", "kit_b": Color("c4122e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 90},
	{"id": "eve", "name": "Everton", "abbrev": "EVE", "country": "Inglaterra", "div": 1,
		"kit": Color("003399"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 90},
	{"id": "ful", "name": "Fulham", "abbrev": "FUL", "country": "Inglaterra", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "bre", "name": "Brentford", "abbrev": "BRE", "country": "Inglaterra", "div": 1,
		"kit": Color("e30613"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ball", "rim": "dark", "rating": 89},
	{"id": "nfo", "name": "Nottingham", "abbrev": "NFO", "country": "Inglaterra", "div": 1,
		"kit": Color("dd0000"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 88},
	{"id": "bou", "name": "Bournemouth", "abbrev": "BOU", "country": "Inglaterra", "div": 1,
		"kit": Color("da291c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ball", "rim": "dark", "rating": 88},
	{"id": "lce", "name": "Leicester", "abbrev": "LCE", "country": "Inglaterra", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "fleur", "emblem_tone": "gold", "rim": "gold", "rating": 80},





	{"id": "bnl", "name": "Burnley", "abbrev": "BNL", "country": "Inglaterra", "div": 1,
		"kit": Color("6c1d45"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("99d6ea"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "lion", "rim": "gold", "rating": 85},
	{"id": "ips", "name": "Ipswich", "abbrev": "IPS", "country": "Inglaterra", "div": 2,
		"kit": Color("3a64a3"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "horse", "rim": "dark", "rating": 79},
	{"id": "shw", "name": "Sheffield W.", "abbrev": "SHW", "country": "Inglaterra", "div": 2,
		"kit": Color("1e3fa8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 75},
	{"id": "der", "name": "Derby", "abbrev": "DER", "country": "Inglaterra", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 74},






	{"id": "blb", "name": "Blackburn", "abbrev": "BLB", "country": "Inglaterra", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("1d78d0"), "crest_pattern": "halved",
		"shape": "shield", "emblem": "fleur", "rim": "dark", "rating": 73},
	{"id": "oxf", "name": "Oxford United", "abbrev": "OXF", "country": "Inglaterra", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14224b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 70},
	{"id": "ply", "name": "Plymouth", "abbrev": "PLY", "country": "Inglaterra", "div": 3,
		"kit": Color("007b5f"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 66},
	{"id": "bfd", "name": "Bradford City", "abbrev": "BFD", "country": "Inglaterra", "div": 3,
		"kit": Color("7c2855"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5c518"), "shape": "shield", "emblem": "letters", "rating": 63},
	{"id": "lee", "name": "Leeds", "abbrev": "LEE", "country": "Inglaterra", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 87},
	{"id": "sou", "name": "Southampton", "abbrev": "SOU", "country": "Inglaterra", "div": 2,
		"kit": Color("d71920"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "shape": "shield", "emblem": "tree", "rating": 78},
	{"id": "shu", "name": "Sheffield", "abbrev": "SHU", "country": "Inglaterra", "div": 2,
		"kit": Color("ee2737"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "shape": "shield", "emblem": "swords", "rating": 78},
	{"id": "nor", "name": "Norwich", "abbrev": "NOR", "country": "Inglaterra", "div": 2,
		"kit": Color("fff200"), "kit2": Color("00a650"), "crest": "shield", "rating": 77},
	{"id": "sun", "name": "Sunderland", "abbrev": "SUN", "country": "Inglaterra", "div": 1,
		"kit": Color("eb172b"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 84},
	{"id": "wat", "name": "Watford", "abbrev": "WAT", "country": "Inglaterra", "div": 2,
		"kit": Color("fbee23"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 77},
	{"id": "lut", "name": "Luton", "abbrev": "LUT", "country": "Inglaterra", "div": 3,
		"kit": Color("e8562a"), "kit2": Color("13284b"), "crest": "diamond", "rating": 69},
	{"id": "mlw", "name": "Millwall", "abbrev": "MLW", "country": "Inglaterra", "div": 2,
		"kit": Color("003d8f"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 76},
	{"id": "rot", "name": "Rotherham", "abbrev": "ROT", "country": "Inglaterra", "div": 3,
		"kit": Color("d31b23"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "brn", "name": "Barnsley", "abbrev": "BRN", "country": "Inglaterra", "div": 3,
		"kit": Color("a8151b"), "kit2": Color("f0f0f0"), "crest": "halved", "rating": 68},

	{"id": "int", "name": "Inter", "abbrev": "INT", "country": "Italia", "div": 1,
		"kit": Color("1c2d8c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "gold", "letter": "I", "rating": 97},
	{"id": "juv", "name": "Juventus", "abbrev": "JUV", "country": "Italia", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "scudetto", "crest_pattern": "solid", "emblem": "monogram", "rim": "white", "rating": 94},
	{"id": "mil", "name": "Milan", "abbrev": "MIL", "country": "Italia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "heater", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "nap", "name": "Napoli", "abbrev": "NAP", "country": "Italia", "div": 1,
		"kit": Color("18a2d8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "white", "letter": "N", "rating": 94},
	{"id": "ata", "name": "Atalanta", "abbrev": "ATA", "country": "Italia", "div": 1,
		"kit": Color("1b71b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 92},
	{"id": "rom", "name": "Roma", "abbrev": "ROM", "country": "Italia", "div": 1,
		"kit": Color("8e1111"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "wolf", "emblem_tone": "gold", "rim": "gold", "rating": 91},
	{"id": "laz", "name": "Lazio", "abbrev": "LAZ", "country": "Italia", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 91},
	{"id": "fio", "name": "Fiorentina", "abbrev": "FIO", "country": "Italia", "div": 1,
		"kit": Color("6a3d9a"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "fleur", "rim": "white", "rating": 90},
	{"id": "bol", "name": "Bologna", "abbrev": "BOL", "country": "Italia", "div": 1,
		"kit": Color("9b1b2e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("1c2d8c"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "tor", "name": "Torino", "abbrev": "TOR", "country": "Italia", "div": 1,
		"kit": Color("881e14"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 88},
	{"id": "udi", "name": "Udinese", "abbrev": "UDI", "country": "Italia", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "tower", "rim": "dark", "rating": 87},
	{"id": "mnz", "name": "Monza", "abbrev": "MNZ", "country": "Italia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "gen", "name": "Genoa", "abbrev": "GEN", "country": "Italia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "pattern": "half", "kit_b": Color("0a2340"),
		"shape": "shield", "crest_pattern": "cross", "emblem": "dragon", "rim": "dark", "rating": 86},
	{"id": "cag", "name": "Cagliari", "abbrev": "CAG", "country": "Italia", "div": 1,
		"kit": Color("9b1b30"), "kit2": Color("0a2340"), "pattern": "half", "kit_b": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "lec", "name": "Lecce", "abbrev": "LEC", "country": "Italia", "div": 1,
		"kit": Color("f6d417"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "wolf", "rim": "dark", "rating": 85},
	{"id": "vrn", "name": "Verona", "abbrev": "VRN", "country": "Italia", "div": 1,
		"kit": Color("14318f"), "kit2": Color("0a2340"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "emp", "name": "Empoli", "abbrev": "EMP", "country": "Italia", "div": 1,
		"kit": Color("1b71b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "sas", "name": "Sassuolo", "abbrev": "SAS", "country": "Italia", "div": 1,
		"kit": Color("0b8a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},

	{"id": "par", "name": "Parma", "abbrev": "PAR", "country": "Italia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 83},
	{"id": "smp", "name": "Sampdoria", "abbrev": "SMP", "country": "Italia", "div": 2,
		"kit": Color("1c3a7c"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("f5f5f5"), "shape": "round", "emblem": "anchor", "rating": 75},
	{"id": "pal", "name": "Palermo", "abbrev": "PAL", "country": "Italia", "div": 2,
		"kit": Color("e79fc4"), "kit2": Color("14161a"), "crest": "shield", "rating": 75},
	{"id": "bri", "name": "Bari", "abbrev": "BRI", "country": "Italia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 74},
	{"id": "ven", "name": "Venezia", "abbrev": "VEN", "country": "Italia", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 74},
	{"id": "com", "name": "Como", "abbrev": "COM", "country": "Italia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 73},
	{"id": "cre", "name": "Cremonese", "abbrev": "CRE", "country": "Italia", "div": 1,
		"kit": Color("9c1b26"), "kit2": Color("8a8f98"), "pattern": "stripes", "kit_b": Color("8a8f98"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ter", "name": "Ternana", "abbrev": "TER", "country": "Italia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "halved", "rating": 73},
	{"id": "cse", "name": "Cosenza", "abbrev": "CSE", "country": "Italia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "prd", "name": "Pordenone", "abbrev": "PRD", "country": "Italia", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "diamond", "rating": 72},

	{"id": "bay", "name": "Bayern", "abbrev": "BAY", "country": "Alemania", "div": 1,
		"kit": Color("dc052d"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "lozenge", "emblem": "letters", "rim": "dark", "rating": 99},
	{"id": "lev", "name": "Leverkusen", "abbrev": "LEV", "country": "Alemania", "div": 1,
		"kit": Color("e32219"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 96},
	{"id": "dor", "name": "Dortmund", "abbrev": "DOR", "country": "Alemania", "div": 1,
		"kit": Color("fde100"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "bordure", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "lei", "name": "Leipzig", "abbrev": "LEI", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("dd0741"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 93},
	{"id": "stu", "name": "Stuttgart", "abbrev": "STU", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("e30613"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "V", "rating": 91},
	{"id": "fra", "name": "Frankfurt", "abbrev": "FRA", "country": "Alemania", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "white", "rating": 89},
	{"id": "wob", "name": "Wolfsburg", "abbrev": "WOB", "country": "Alemania", "div": 1,
		"kit": Color("1a7d3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "wolf", "rim": "white", "rating": 88},
	{"id": "fbg", "name": "Freiburg", "abbrev": "FBG", "country": "Alemania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "hof", "name": "Hoffenheim", "abbrev": "HOF", "country": "Alemania", "div": 1,
		"kit": Color("1b70c4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "bmg", "name": "M'gladbach", "abbrev": "BMG", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "diamond", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 87},
	{"id": "fcu", "name": "Union Berlin", "abbrev": "FCU", "country": "Alemania", "div": 1,
		"kit": Color("d4001a"), "kit2": Color("d4001a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "svw", "name": "Werder Bremen", "abbrev": "SVW", "country": "Alemania", "div": 1,
		"kit": Color("1a7d3c"), "kit2": Color("f5f5f5"),
		"shape": "rounded_square", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "W", "rating": 86},
	{"id": "m05", "name": "Mainz", "abbrev": "M05", "country": "Alemania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 85},
	{"id": "fca", "name": "Augsburg", "abbrev": "FCA", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 85},
	{"id": "boc", "name": "Bochum", "abbrev": "BOC", "country": "Alemania", "div": 1,
		"kit": Color("1b70c4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "koe", "name": "Köln", "abbrev": "KOE", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 85},
	{"id": "bsc", "name": "Hertha", "abbrev": "BSC", "country": "Alemania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("13448c"),
		"shape": "banner", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "s04", "name": "Schalke", "abbrev": "S04", "country": "Alemania", "div": 1,
		"kit": Color("0a4aa0"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 85},

	{"id": "hsv", "name": "Hamburg", "abbrev": "HSV", "country": "Alemania", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 80},
	{"id": "f95", "name": "Düsseldorf", "abbrev": "F95", "country": "Alemania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 80},
	{"id": "fcn", "name": "Nürnberg", "abbrev": "FCN", "country": "Alemania", "div": 2,
		"kit": Color("8e1111"), "kit2": Color("14161a"), "crest": "shield", "rating": 79},
	{"id": "fck", "name": "Kaiserslautern", "abbrev": "FCK", "country": "Alemania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 79},
	{"id": "h96", "name": "Hannover", "abbrev": "H96", "country": "Alemania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "halved", "rating": 78},
	{"id": "ksc", "name": "Karlsruhe", "abbrev": "KSC", "country": "Alemania", "div": 2,
		"kit": Color("1b70c4"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 78},
	{"id": "pad", "name": "Paderborn", "abbrev": "PAD", "country": "Alemania", "div": 2,
		"kit": Color("14161a"), "kit2": Color("0b57a4"), "crest": "halved", "rating": 77},
	{"id": "snd", "name": "Sandhausen", "abbrev": "SND", "country": "Alemania", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 77},
	{"id": "aue", "name": "Aue", "abbrev": "AUE", "country": "Alemania", "div": 2,
		"kit": Color("6b2d8c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 76},
	{"id": "vrl", "name": "Verl", "abbrev": "VRL", "country": "Alemania", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 76},

	{"id": "ame", "name": "América", "abbrev": "AME", "country": "México", "div": 1,
		"kit": Color("ffe600"), "kit2": Color("13284b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 91},
	{"id": "mty", "name": "Monterrey", "abbrev": "MTY", "country": "México", "div": 1,
		"kit": Color("13284b"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "mountain", "rim": "dark", "rating": 91},
	{"id": "tig", "name": "Tigres", "abbrev": "TIG", "country": "México", "div": 1,
		"kit": Color("ffb81c"), "kit2": Color("13284b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 90},
	{"id": "caz", "name": "Cruz Azul", "abbrev": "CAZ", "country": "México", "div": 1,
		"kit": Color("003876"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "gdl", "name": "Guadalajara", "abbrev": "GDL", "country": "México", "div": 1,
		"kit": Color("c30f2e"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "monogram", "rim": "dark", "letter": "C", "rating": 88},
	{"id": "tol", "name": "Toluca", "abbrev": "TOL", "country": "México", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "trident", "rim": "dark", "rating": 88},
	{"id": "pac", "name": "Pachuca", "abbrev": "PAC", "country": "México", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 87},
	{"id": "leo", "name": "León", "abbrev": "LEO", "country": "México", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 87},
	{"id": "san", "name": "Santos", "abbrev": "SAN", "country": "México", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "pum", "name": "Pumas", "abbrev": "PUM", "country": "México", "div": 1,
		"kit": Color("14318f"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "atl", "name": "Atlas", "abbrev": "ATL", "country": "México", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "tij", "name": "Tijuana", "abbrev": "TIJ", "country": "México", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "nec", "name": "Necaxa", "abbrev": "NEC", "country": "México", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "bolt", "rim": "dark", "rating": 85},
	{"id": "pue", "name": "Puebla", "abbrev": "PUE", "country": "México", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "sash", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "que", "name": "Querétaro", "abbrev": "QUE", "country": "México", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "rooster", "rim": "dark", "rating": 85},
	{"id": "maz", "name": "Mazatlán", "abbrev": "MAZ", "country": "México", "div": 1,
		"kit": Color("6a1b9a"), "kit2": Color("6a1b9a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "jua", "name": "Juárez", "abbrev": "JUA", "country": "México", "div": 1,
		"kit": Color("7ac143"), "kit2": Color("7ac143"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "asl", "name": "San Luis", "abbrev": "ASL", "country": "México", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("13284b"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 84},

	{"id": "mor", "name": "Morelia", "abbrev": "MOR", "country": "México", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "shield", "rating": 80},
	{"id": "atn", "name": "Atlante", "abbrev": "ATN", "country": "México", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("8b1a2b"), "crest": "shield", "rating": 80},
	{"id": "cya", "name": "Celaya", "abbrev": "CYA", "country": "México", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "chevron", "kit_b": Color("0a52b8"), "crest": "round", "rating": 79},
	{"id": "drd", "name": "Dorados", "abbrev": "DRD", "country": "México", "div": 2,
		"kit": Color("f6a51e"), "kit2": Color("14161a"), "crest": "banner", "rating": 79},
	{"id": "tam", "name": "Tampico", "abbrev": "TAM", "country": "México", "div": 2,
		"kit": Color("1b70c4"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 78},
	{"id": "cor", "name": "Correcaminos", "abbrev": "COR", "country": "México", "div": 2,
		"kit": Color("e8722a"), "kit2": Color("13284b"), "crest": "diamond", "rating": 78},
	{"id": "lnn", "name": "Leones Negros", "abbrev": "LNN", "country": "México", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "halved", "rating": 77},
	{"id": "vnd", "name": "Venados", "abbrev": "VND", "country": "México", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 76},
	{"id": "tep", "name": "Tepatitlán", "abbrev": "TEP", "country": "México", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "halved", "rating": 75},
	{"id": "cun", "name": "Cancún", "abbrev": "CUN", "country": "México", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "banner", "rating": 72},

	{"id": "ben", "name": "Benfica", "abbrev": "BEN", "country": "Portugal", "div": 1,
		"kit": Color("cc0000"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 93},
	{"id": "por", "name": "Porto", "abbrev": "POR", "country": "Portugal", "div": 1,
		"kit": Color("00458e"), "kit2": Color("00458e"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "dragon", "emblem_tone": "gold", "rim": "gold", "rating": 92},
	{"id": "spo", "name": "Sporting", "abbrev": "SPO", "country": "Portugal", "div": 1,
		"kit": Color("1a7d3c"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "quartered", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 92},
	{"id": "bra", "name": "Braga", "abbrev": "BRA", "country": "Portugal", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 88},
	{"id": "vit", "name": "Vitória", "abbrev": "VIT", "country": "Portugal", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 86},
	{"id": "mar", "name": "Marítimo", "abbrev": "MAR", "country": "Portugal", "div": 1,
		"kit": Color("0a7d3c"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "riv", "name": "Rio Ave", "abbrev": "RIV", "country": "Portugal", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 84},
	{"id": "fam", "name": "Famalicão", "abbrev": "FAM", "country": "Portugal", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 84},
	{"id": "gil", "name": "Gil Vicente", "abbrev": "GIL", "country": "Portugal", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14448c"), "crest": "halved", "rating": 83},
	{"id": "ptm", "name": "Portimonense", "abbrev": "PTM", "country": "Portugal", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 83},
	{"id": "est", "name": "Estoril", "abbrev": "EST", "country": "Portugal", "div": 1,
		"kit": Color("f6d417"), "kit2": Color("14448c"), "crest": "diamond", "rating": 83},
	{"id": "aro", "name": "Arouca", "abbrev": "ARO", "country": "Portugal", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "star", "rating": 82},
	{"id": "cha", "name": "Chaves", "abbrev": "CHA", "country": "Portugal", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("8b1a2b"), "crest": "star", "rating": 82},
	{"id": "cpa", "name": "Casa Pia", "abbrev": "CPA", "country": "Portugal", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 82},
	{"id": "viz", "name": "Vizela", "abbrev": "VIZ", "country": "Portugal", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 82},
	{"id": "mre", "name": "Moreirense", "abbrev": "MRE", "country": "Portugal", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "checkers", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 82},
	{"id": "stc", "name": "Santa Clara", "abbrev": "STC", "country": "Portugal", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 82},
	{"id": "boa", "name": "Boavista", "abbrev": "BOA", "country": "Portugal", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "checkers", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "quartered", "emblem": "none", "rim": "dark", "rating": 82},

	{"id": "ncl", "name": "Nacional", "abbrev": "NCL", "country": "Portugal", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 80},
	{"id": "tnd", "name": "Tondela", "abbrev": "TND", "country": "Portugal", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "shield", "rating": 80},
	{"id": "far", "name": "Farense", "abbrev": "FAR", "country": "Portugal", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("14161a"), "crest": "shield", "rating": 79},
	{"id": "aca", "name": "Académica", "abbrev": "ACA", "country": "Portugal", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "banner", "rating": 79},
	{"id": "fei", "name": "Feirense", "abbrev": "FEI", "country": "Portugal", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 78},
	{"id": "lix", "name": "Leixões", "abbrev": "LIX", "country": "Portugal", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 78},
	{"id": "maf", "name": "Mafra", "abbrev": "MAF", "country": "Portugal", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "round", "rating": 77},
	{"id": "cov", "name": "Covilhã", "abbrev": "COV", "country": "Portugal", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 77},
	{"id": "pen", "name": "Penafiel", "abbrev": "PEN", "country": "Portugal", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "round", "rating": 76},
	{"id": "tro", "name": "Trofense", "abbrev": "TRO", "country": "Portugal", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 76},



	{"id": "pari", "name": "Paris Saint-Germain", "abbrev": "PSG", "country": "Francia", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "band_v", "kit_b": Color("c8102e"),





		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 99},
	{"id": "mars", "name": "Marsella", "abbrev": "MAR", "country": "Francia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "M", "rating": 97},
	{"id": "mon", "name": "Mónaco", "abbrev": "MON", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "diagonal", "kit_b": Color("f5f5f5"),
		"shape": "diamond", "crest_pattern": "halved", "emblem": "crown", "emblem_tone": "gold", "rim": "dark", "rating": 96},
	{"id": "lyo", "name": "Lyon", "abbrev": "LYO", "country": "Francia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0b3d91"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 95},
	{"id": "lil", "name": "Lille", "abbrev": "LIL", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "fleur", "rim": "dark", "rating": 94},
	{"id": "niz", "name": "Niza", "abbrev": "NIZ", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 94},
	{"id": "ren", "name": "Rennes", "abbrev": "REN", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "fleur", "rim": "dark", "rating": 93},
	{"id": "len", "name": "Lens", "abbrev": "LEN", "country": "Francia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "sash", "emblem": "rooster", "rim": "dark", "rating": 92},
	{"id": "estr", "name": "Estrasburgo", "abbrev": "EST", "country": "Francia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 91},
	{"id": "nan", "name": "Nantes", "abbrev": "NAN", "country": "Francia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0b7c3c"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 91},
	{"id": "mont", "name": "Montpellier", "abbrev": "MO2", "country": "Francia", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("ee7f00"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 90},
	{"id": "tou", "name": "Toulouse", "abbrev": "TOU", "country": "Francia", "div": 1,
		"kit": Color("6a2b8a"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 89},
	{"id": "bres", "name": "Brest", "abbrev": "BRE", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "rei", "name": "Reims", "abbrev": "REI", "country": "Francia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "leh", "name": "Le Havre", "abbrev": "LEH", "country": "Francia", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"), "pattern": "half", "kit_b": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 87},
	{"id": "aux", "name": "Auxerre", "abbrev": "AUX", "country": "Francia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "ang", "name": "Angers", "abbrev": "ANG", "country": "Francia", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "sai", "name": "Saint-Étienne", "abbrev": "SAE", "country": "Francia", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 85},

	{"id": "met", "name": "Metz", "abbrev": "MET", "country": "Francia", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 80},
	{"id": "bur", "name": "Burdeos", "abbrev": "BUR", "country": "Francia", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "chevron", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 80},
	{"id": "gui", "name": "Guingamp", "abbrev": "GUI", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 79},
	{"id": "cae", "name": "Caen", "abbrev": "CAE", "country": "Francia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "star", "rating": 79},
	{"id": "gren", "name": "Grenoble", "abbrev": "GRE", "country": "Francia", "div": 2,
		"kit": Color("1a63b0"), "kit2": Color("0a2340"), "crest": "banner", "rating": 78},
	{"id": "ami", "name": "Amiens", "abbrev": "AMI", "country": "Francia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 78},
	{"id": "aja", "name": "Ajaccio", "abbrev": "AJA", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 77},
	{"id": "bas", "name": "Bastia", "abbrev": "BAS", "country": "Francia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 77},
	{"id": "pau", "name": "Pau", "abbrev": "PAU", "country": "Francia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 76},
	{"id": "rod", "name": "Rodez", "abbrev": "ROD", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 76},

	{"id": "red", "name": "Red Star", "abbrev": "RES", "country": "Francia", "div": 3,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "nanc", "name": "Nancy", "abbrev": "NA2", "country": "Francia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "soc", "name": "Sochaux", "abbrev": "SOC", "country": "Francia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "shield", "rating": 68},
	{"id": "chat", "name": "Châteauroux", "abbrev": "CHA", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "round", "rating": 68},
	{"id": "orl", "name": "Orléans", "abbrev": "ORL", "country": "Francia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 67},
	{"id": "dun", "name": "Dunkerque", "abbrev": "DUN", "country": "Francia", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 67},
	{"id": "lem", "name": "Le Mans", "abbrev": "LEM", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 67},
	{"id": "vill", "name": "Villefranche", "abbrev": "VIL", "country": "Francia", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 66},
	{"id": "con", "name": "Concarneau", "abbrev": "CON", "country": "Francia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 66},
	{"id": "nim", "name": "Nîmes", "abbrev": "NIM", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 65},

	{"id": "ajax", "name": "Ajax", "abbrev": "AJ2", "country": "Países Bajos", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "pale", "emblem": "swords", "rim": "dark", "rating": 95},
	{"id": "psv", "name": "PSV Eindhoven", "abbrev": "PSE", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "fey", "name": "Feyenoord", "abbrev": "FEY", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "monogram", "rim": "dark", "letter": "F", "rating": 94},
	{"id": "aza", "name": "AZ Alkmaar", "abbrev": "AZA", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 93},
	{"id": "twe", "name": "Twente", "abbrev": "TWE", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 92},
	{"id": "utr", "name": "Utrecht", "abbrev": "UTR", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 91},
	{"id": "vite", "name": "Vitesse", "abbrev": "VIT", "country": "Países Bajos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 91},
	{"id": "hee", "name": "Heerenveen", "abbrev": "HEE", "country": "Países Bajos", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "heart", "rim": "dark", "rating": 90},
	{"id": "gro", "name": "Groningen", "abbrev": "GRO", "country": "Países Bajos", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "necn", "name": "NEC Nijmegen", "abbrev": "NEN", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "band_h", "kit_b": Color("0a7a3c"), "crest": "halved", "rating": 88},
	{"id": "spa", "name": "Sparta Rotterdam", "abbrev": "SPR", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "goa", "name": "Go Ahead Eagles", "abbrev": "GAE", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("f5c518"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 87},
	{"id": "for", "name": "Fortuna Sittard", "abbrev": "FOS", "country": "Países Bajos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 86},
	{"id": "her", "name": "Heracles", "abbrev": "HER", "country": "Países Bajos", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 85},
	{"id": "pec", "name": "PEC Zwolle", "abbrev": "PEZ", "country": "Países Bajos", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 85},
	{"id": "wil", "name": "Willem II", "abbrev": "WII", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 84},
	{"id": "rkc", "name": "RKC Waalwijk", "abbrev": "RKW", "country": "Países Bajos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 83},
	{"id": "alm", "name": "Almere City", "abbrev": "ALC", "country": "Países Bajos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 82},

	{"id": "vol", "name": "Volendam", "abbrev": "VOL", "country": "Países Bajos", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "diamond", "rating": 80},
	{"id": "roda", "name": "Roda JC", "abbrev": "ROJ", "country": "Países Bajos", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "star", "rating": 80},
	{"id": "deg", "name": "De Graafschap", "abbrev": "DEG", "country": "Países Bajos", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 79},
	{"id": "cam", "name": "Cambuur", "abbrev": "CAM", "country": "Países Bajos", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 79},
	{"id": "den", "name": "Den Bosch", "abbrev": "DEB", "country": "Países Bajos", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 78},
	{"id": "fce", "name": "FC Eindhoven", "abbrev": "FCE", "country": "Países Bajos", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 78},
	{"id": "dord", "name": "Dordrecht", "abbrev": "DOR", "country": "Países Bajos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 77},
	{"id": "vvv", "name": "VVV-Venlo", "abbrev": "VVV", "country": "Países Bajos", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "star", "rating": 77},
	{"id": "hel", "name": "Helmond Sport", "abbrev": "HES", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner", "rating": 76},
	{"id": "emm", "name": "Emmen", "abbrev": "EMM", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 76},

	{"id": "top", "name": "TOP Oss", "abbrev": "TOO", "country": "Países Bajos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 69},
	{"id": "tel", "name": "Telstar", "abbrev": "TEL", "country": "Países Bajos", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 69},
	{"id": "mvv", "name": "MVV Maastricht", "abbrev": "MVM", "country": "Países Bajos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 68},
	{"id": "ado", "name": "ADO Den Haag", "abbrev": "ADH", "country": "Países Bajos", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "star", "rating": 68},
	{"id": "kat", "name": "Katwijk", "abbrev": "KAT", "country": "Países Bajos", "div": 3,
		"kit": Color("ff7f18"), "kit2": Color("14161a"), "crest": "banner", "rating": 67},
	{"id": "qui", "name": "Quick Boys", "abbrev": "QUB", "country": "Países Bajos", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 67},
	{"id": "spak", "name": "Spakenburg", "abbrev": "SPA", "country": "Países Bajos", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "rij", "name": "Rijnsburgse Boys", "abbrev": "RIB", "country": "Países Bajos", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 66},
	{"id": "exc", "name": "Excelsior Maassluis", "abbrev": "EXM", "country": "Países Bajos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 66},
	{"id": "sch", "name": "Scheveningen", "abbrev": "SCH", "country": "Países Bajos", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "star", "rating": 65},

	{"id": "fla", "name": "Flamengo", "abbrev": "FLA", "country": "Brasil", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "letters", "rim": "dark", "rating": 97},
	{"id": "palm", "name": "Palmeiras", "abbrev": "PAL", "country": "Brasil", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 97},
	{"id": "cori", "name": "Corinthians", "abbrev": "COR", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 96},
	{"id": "sao", "name": "São Paulo", "abbrev": "SAP", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "fess", "emblem": "letters", "rim": "dark", "rating": 95},
	{"id": "flu", "name": "Fluminense", "abbrev": "FLU", "country": "Brasil", "div": 1,
		"kit": Color("7b1a3a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0b7c3c"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "bot", "name": "Botafogo", "abbrev": "BOT", "country": "Brasil", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 94},
	{"id": "grem", "name": "Grêmio", "abbrev": "GR2", "country": "Brasil", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "letters", "rim": "dark", "rating": 93},
	{"id": "inte", "name": "Internacional", "abbrev": "INT", "country": "Brasil", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 92},
	{"id": "atle", "name": "Atlético Mineiro", "abbrev": "ATM", "country": "Brasil", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "rooster", "rim": "dark", "rating": 91},
	{"id": "cru", "name": "Cruzeiro", "abbrev": "CRU", "country": "Brasil", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "diamond", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 91},
	{"id": "vas", "name": "Vasco da Gama", "abbrev": "VDG", "country": "Brasil", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "letters", "rim": "dark", "rating": 90},
	{"id": "sant", "name": "Santos", "abbrev": "SAN", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "bah", "name": "Bahía", "abbrev": "BAH", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "tri_stripes", "emblem": "ball", "rim": "dark", "rating": 88},
	{"id": "fort", "name": "Fortaleza", "abbrev": "FOR", "country": "Brasil", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "hoops", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 80},
	{"id": "athl", "name": "Athletico Paranaense", "abbrev": "ATP", "country": "Brasil", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "brag", "name": "Bragantino", "abbrev": "BRA", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 86},
	{"id": "vito", "name": "Vitória", "abbrev": "VI2", "country": "Brasil", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "juve", "name": "Juventude", "abbrev": "JUV", "country": "Brasil", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},

	{"id": "spor", "name": "Sport Recife", "abbrev": "SP2", "country": "Brasil", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "banner", "rating": 80},
	{"id": "cea", "name": "Ceará", "abbrev": "CEA", "country": "Brasil", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 80},
	{"id": "goi", "name": "Goiás", "abbrev": "GOI", "country": "Brasil", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 79},
	{"id": "crt", "name": "Coritiba", "abbrev": "CO2", "country": "Brasil", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "band_h", "kit_b": Color("14532d"), "crest": "round", "rating": 82},
	{"id": "pon", "name": "Ponte Preta", "abbrev": "POP", "country": "Brasil", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash_r", "kit_b": Color("14161a"), "crest": "diamond", "rating": 78},
	{"id": "gua", "name": "Guaraní", "abbrev": "GUA", "country": "Brasil", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 78},
	{"id": "nau", "name": "Náutico", "abbrev": "NAU", "country": "Brasil", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 77},
	{"id": "amer", "name": "América Mineiro", "abbrev": "AMM", "country": "Brasil", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "halved", "rating": 77},
	{"id": "chap", "name": "Chapecoense", "abbrev": "CH2", "country": "Brasil", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "shield", "rating": 80},
	{"id": "ava", "name": "Avaí", "abbrev": "AVA", "country": "Brasil", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 76},

	{"id": "pay", "name": "Paysandu", "abbrev": "PAY", "country": "Brasil", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 69},
	{"id": "rem", "name": "Remo", "abbrev": "REM", "country": "Brasil", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 79},
	{"id": "abc", "name": "ABC", "abbrev": "ABC", "country": "Brasil", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner", "rating": 68},
	{"id": "crb", "name": "CRB", "abbrev": "CRB", "country": "Brasil", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "pattern": "band_h", "kit_b": Color("c8102e"), "crest": "halved", "rating": 68},
	{"id": "csa", "name": "CSA", "abbrev": "CSA", "country": "Brasil", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "bota", "name": "Botafogo-SP", "abbrev": "BOS", "country": "Brasil", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("c8102e"), "crest": "round", "rating": 67},
	{"id": "fig", "name": "Figueirense", "abbrev": "FIG", "country": "Brasil", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 67},
	{"id": "lon", "name": "Londrina", "abbrev": "LON", "country": "Brasil", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 66},
	{"id": "sam", "name": "Sampaio Corrêa", "abbrev": "SAC", "country": "Brasil", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "banner", "rating": 66},
	{"id": "itu", "name": "Ituano", "abbrev": "ITU", "country": "Brasil", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "halved", "rating": 65},

	{"id": "boca", "name": "Boca Juniors", "abbrev": "BOJ", "country": "Argentina", "div": 1,
		"kit": Color("0b3d91"), "kit2": Color("0b3d91"), "pattern": "band_h", "kit_b": Color("f5c518"),
		"shape": "shield", "crest_pattern": "fess", "emblem": "star", "emblem_tone": "gold", "rim": "dark", "rating": 96},
	{"id": "rive", "name": "River Plate", "abbrev": "RIP", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "sash", "emblem": "monogram", "rim": "dark", "letter": "R", "rating": 95},
	{"id": "raci", "name": "Racing Club", "abbrev": "RAC", "country": "Argentina", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "ind", "name": "Independiente", "abbrev": "IND", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14318f"),
		"shape": "diamond", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "sanl", "name": "San Lorenzo", "abbrev": "SAL", "country": "Argentina", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 93},
	{"id": "estu", "name": "Estudiantes", "abbrev": "ES2", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 92},
	{"id": "vel", "name": "Vélez Sarsfield", "abbrev": "VES", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "chevron", "kit_b": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "V", "rating": 91},
	{"id": "tal", "name": "Talleres", "abbrev": "TAL", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 91},
	{"id": "ros", "name": "Rosario Central", "abbrev": "ROC", "country": "Argentina", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5c518"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 90},
	{"id": "newe", "name": "Newell's Old Boys", "abbrev": "NSO", "country": "Argentina", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "arge", "name": "Argentinos Juniors", "abbrev": "ARJ", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "lan", "name": "Lanús", "abbrev": "LAN", "country": "Argentina", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "def", "name": "Defensa y Justicia", "abbrev": "DYJ", "country": "Argentina", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "hur", "name": "Huracán", "abbrev": "HUR", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ring", "rim": "dark", "rating": 86},
	{"id": "ban", "name": "Banfield", "abbrev": "BAN", "country": "Argentina", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "god", "name": "Godoy Cruz", "abbrev": "GOC", "country": "Argentina", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 80},
	{"id": "gim", "name": "Gimnasia La Plata", "abbrev": "GLP", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "pattern": "band_h", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "ins", "name": "Instituto", "abbrev": "INS", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},


	{"id": "arg_ald", "name": "Aldosivi", "abbrev": "ALD", "country": "Argentina", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5c518"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "arg_atu", "name": "Atlético Tucumán", "abbrev": "ATU", "country": "Argentina", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "arg_bar", "name": "Barracas Central", "abbrev": "BAC", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "arg_bel", "name": "Belgrano", "abbrev": "BEL", "country": "Argentina", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "arg_ccb", "name": "Central Córdoba", "abbrev": "CCO", "country": "Argentina", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "arg_rie", "name": "Deportivo Riestra", "abbrev": "RIE", "country": "Argentina", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "sash", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "arg_ivr", "name": "Independiente Rivadavia", "abbrev": "IRV", "country": "Argentina", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "arg_pla", "name": "Platense", "abbrev": "PLA", "country": "Argentina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "band_h", "kit_b": Color("5c3317"),
		"shape": "shield", "crest_pattern": "fess", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "arg_sar", "name": "Sarmiento", "abbrev": "SAJ", "country": "Argentina", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "arg_tig", "name": "Tigre", "abbrev": "TIG", "country": "Argentina", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "band_h", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "fess", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "arg_uni", "name": "Unión", "abbrev": "USF", "country": "Argentina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 84},

	{"id": "colo", "name": "Colón", "abbrev": "COL", "country": "Argentina", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("c8102e"), "crest": "shield", "rating": 80},
	{"id": "chac", "name": "Chacarita", "abbrev": "CH3", "country": "Argentina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 80},
	{"id": "sanm", "name": "San Martín de Tucumán", "abbrev": "SMD", "country": "Argentina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 79},
	{"id": "atla", "name": "Atlanta", "abbrev": "ATL", "country": "Argentina", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "star", "rating": 79},
	{"id": "fer", "name": "Ferro Carril Oeste", "abbrev": "FCO", "country": "Argentina", "div": 2,
		"kit": Color("14532d"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 78},
	{"id": "nue", "name": "Nueva Chicago", "abbrev": "NUC", "country": "Argentina", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 78},
	{"id": "quil", "name": "Quilmes", "abbrev": "QUI", "country": "Argentina", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 77},
	{"id": "dep", "name": "Deportivo Morón", "abbrev": "DEM", "country": "Argentina", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("c8102e"), "crest": "round", "rating": 77},
	{"id": "almi", "name": "Almirante Brown", "abbrev": "ALB", "country": "Argentina", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 76},
	{"id": "gimn", "name": "Gimnasia Mendoza", "abbrev": "GIM", "country": "Argentina", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 80},

	{"id": "tem", "name": "Temperley", "abbrev": "TEM", "country": "Argentina", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "banner", "rating": 69},
	{"id": "los", "name": "Los Andes", "abbrev": "LOA", "country": "Argentina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "tri", "name": "Tristán Suárez", "abbrev": "TRS", "country": "Argentina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("0a2340"), "crest": "shield", "rating": 68},
	{"id": "comu", "name": "Comunicaciones", "abbrev": "COM", "country": "Argentina", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "round", "rating": 68},
	{"id": "sac", "name": "Sacachispas", "abbrev": "SA2", "country": "Argentina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("8e6bd0"), "pattern": "stripes", "kit_b": Color("8e6bd0"), "crest": "diamond", "rating": 67},
	{"id": "vll", "name": "Villa Dálmine", "abbrev": "VID", "country": "Argentina", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "star", "rating": 67},
	{"id": "snt", "name": "San Telmo", "abbrev": "SAT", "country": "Argentina", "div": 3,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("00bfff"), "crest": "banner", "rating": 67},
	{"id": "flan", "name": "Flandria", "abbrev": "FL2", "country": "Argentina", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "halved", "rating": 66},
	{"id": "depo", "name": "Deportivo Armenio", "abbrev": "DEA", "country": "Argentina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 66},
	{"id": "acas", "name": "Acassuso", "abbrev": "ACA", "country": "Argentina", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "round", "rating": 65},

	{"id": "ntr", "name": "Inter Miami", "abbrev": "INM", "country": "Estados Unidos", "div": 1,
		"kit": Color("f4b8c8"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 93},
	{"id": "lag", "name": "LA Galaxy", "abbrev": "LAG", "country": "Estados Unidos", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash_r", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ring", "rim": "dark", "rating": 92},
	{"id": "losa", "name": "Los Angeles FC", "abbrev": "LAF", "country": "Estados Unidos", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 91},
	{"id": "sea", "name": "Seattle Sounders", "abbrev": "SES", "country": "Estados Unidos", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 91},
	{"id": "tln", "name": "Atlanta United", "abbrev": "ATU", "country": "Estados Unidos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "A", "rating": 90},
	{"id": "port", "name": "Portland Timbers", "abbrev": "POT", "country": "Estados Unidos", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("14532d"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 89},
	{"id": "newy", "name": "New York City FC", "abbrev": "NYC", "country": "Estados Unidos", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "nwy", "name": "New York Red Bulls", "abbrev": "NYR", "country": "Estados Unidos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 88},
	{"id": "colu", "name": "Columbus Crew", "abbrev": "COC", "country": "Estados Unidos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 87},
	{"id": "phi", "name": "Philadelphia Union", "abbrev": "PHU", "country": "Estados Unidos", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "halved", "rating": 86},
	{"id": "fcc", "name": "FC Cincinnati", "abbrev": "FCC", "country": "Estados Unidos", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "nas", "name": "Nashville SC", "abbrev": "NAS", "country": "Estados Unidos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a2340"), "crest": "round", "rating": 85},
	{"id": "aust", "name": "Austin FC", "abbrev": "AUF", "country": "Estados Unidos", "div": 1,
		"kit": Color("0f9d4a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 84},
	{"id": "spr", "name": "Sporting Kansas City", "abbrev": "SKC", "country": "Estados Unidos", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"), "crest": "star", "rating": 83},
	{"id": "rea", "name": "Real Salt Lake", "abbrev": "RSL", "country": "Estados Unidos", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 82},
	{"id": "clr", "name": "Colorado Rapids", "abbrev": "CO3", "country": "Estados Unidos", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "halved", "rating": 82},
	{"id": "min", "name": "Minnesota United", "abbrev": "MIU", "country": "Estados Unidos", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 81},
	{"id": "orla", "name": "Orlando City", "abbrev": "ORC", "country": "Estados Unidos", "div": 1,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "round", "rating": 80},


	{"id": "usa_clt", "name": "Charlotte FC", "abbrev": "CLT", "country": "Estados Unidos", "div": 1,
		"kit": Color("0085ca"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "crown", "rim": "dark", "rating": 84},
	{"id": "usa_chi", "name": "Chicago Fire", "abbrev": "CHF", "country": "Estados Unidos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "pattern": "band_h", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 83},
	{"id": "usa_dcu", "name": "D.C. United", "abbrev": "DCU", "country": "Estados Unidos", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "band_h", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 81},
	{"id": "usa_dal", "name": "FC Dallas", "abbrev": "DAL", "country": "Estados Unidos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "hoops", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "bull", "rim": "dark", "rating": 83},
	{"id": "usa_hou", "name": "Houston Dynamo", "abbrev": "HOU", "country": "Estados Unidos", "div": 1,
		"kit": Color("f47b20"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bolt", "rim": "dark", "rating": 83},
	{"id": "usa_mtl", "name": "CF Montréal", "abbrev": "MTL", "country": "Estados Unidos", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("1d4ed8"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "fleur", "rim": "dark", "rating": 81},
	{"id": "usa_nwe", "name": "New England Revolution", "abbrev": "NER", "country": "Estados Unidos", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "band_h", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 82},
	{"id": "usa_sdg", "name": "San Diego FC", "abbrev": "SDG", "country": "Estados Unidos", "div": 1,
		"kit": Color("102a5c"), "kit2": Color("102a5c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 86},
	{"id": "usa_sje", "name": "San Jose Earthquakes", "abbrev": "SJE", "country": "Estados Unidos", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bolt", "rim": "dark", "rating": 82},
	{"id": "usa_stl", "name": "St. Louis City", "abbrev": "STL", "country": "Estados Unidos", "div": 1,
		"kit": Color("d22630"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "fleur", "rim": "dark", "rating": 81},
	{"id": "usa_tor", "name": "Toronto FC", "abbrev": "TFC", "country": "Estados Unidos", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 85},
	{"id": "usa_van", "name": "Vancouver Whitecaps", "abbrev": "VAN", "country": "Estados Unidos", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a2340"), "pattern": "band_h", "kit_b": Color("0a2340"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 87},

	{"id": "sacr", "name": "Sacramento Republic", "abbrev": "SAR", "country": "Estados Unidos", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "diamond", "rating": 78},
	{"id": "sana", "name": "San Antonio FC", "abbrev": "SAF", "country": "Estados Unidos", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 78},
	{"id": "lou", "name": "Louisville City", "abbrev": "LOC", "country": "Estados Unidos", "div": 2,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "banner", "rating": 77},
	{"id": "tamp", "name": "Tampa Bay Rowdies", "abbrev": "TBR", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "hoops", "kit_b": Color("f5c518"), "crest": "halved", "rating": 77},
	{"id": "indy", "name": "Indy Eleven", "abbrev": "INE", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "shield", "rating": 76},
	{"id": "pho", "name": "Phoenix Rising", "abbrev": "PHR", "country": "Estados Unidos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 76},
	{"id": "elp", "name": "El Paso Locomotive", "abbrev": "EPL", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "diamond", "rating": 75},
	{"id": "det", "name": "Detroit City", "abbrev": "DEC", "country": "Estados Unidos", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "star", "rating": 75},
	{"id": "mem", "name": "Memphis 901", "abbrev": "ME9", "country": "Estados Unidos", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "banner", "rating": 74},
	{"id": "newm", "name": "New Mexico United", "abbrev": "NMU", "country": "Estados Unidos", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "halved", "rating": 74},

	{"id": "cht", "name": "Chattanooga", "abbrev": "CH4", "country": "Estados Unidos", "div": 3,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "crest": "shield", "rating": 67},
	{"id": "char", "name": "Charlotte Independence", "abbrev": "CHI", "country": "Estados Unidos", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 67},
	{"id": "gree", "name": "Greenville Triumph", "abbrev": "GRT", "country": "Estados Unidos", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 66},
	{"id": "uni", "name": "Union Omaha", "abbrev": "UNO", "country": "Estados Unidos", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 66},
	{"id": "ric", "name": "Richmond Kickers", "abbrev": "RIK", "country": "Estados Unidos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 65},
	{"id": "one", "name": "One Knoxville", "abbrev": "ONK", "country": "Estados Unidos", "div": 3,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "crest": "halved", "rating": 65},
	{"id": "forw", "name": "Forward Madison", "abbrev": "FOM", "country": "Estados Unidos", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"), "pattern": "sash_r", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 65},
	{"id": "nort", "name": "Northern Colorado", "abbrev": "NOC", "country": "Estados Unidos", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("f5c518"), "crest": "round", "rating": 64},
	{"id": "sout", "name": "South Georgia Tormenta", "abbrev": "SGT", "country": "Estados Unidos", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "diamond", "rating": 64},
	{"id": "spok", "name": "Spokane Velocity", "abbrev": "SPV", "country": "Estados Unidos", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 63},

	{"id": "alh", "name": "Al-Hilal", "abbrev": "ALH", "country": "Arabia Saudí", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crescent", "emblem_tone": "gold", "rim": "gold", "rating": 96},
	{"id": "aln", "name": "Al-Nassr", "abbrev": "ALN", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 95},
	{"id": "ali", "name": "Al-Ittihad", "abbrev": "ALI", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "ala", "name": "Al-Ahli", "abbrev": "ALA", "country": "Arabia Saudí", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 94},
	{"id": "als", "name": "Al-Shabab", "abbrev": "ALS", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 93},
	{"id": "ale", "name": "Al-Ettifaq", "abbrev": "ALE", "country": "Arabia Saudí", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 92},
	{"id": "alt", "name": "Al-Taawoun", "abbrev": "ALT", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "banner", "rating": 91},
	{"id": "alf", "name": "Al-Fateh", "abbrev": "ALF", "country": "Arabia Saudí", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "halved", "rating": 91},
	{"id": "alfa", "name": "Al-Fayha", "abbrev": "AL2", "country": "Arabia Saudí", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("14318f"), "crest": "shield", "rating": 90},
	{"id": "alr", "name": "Al-Riyadh", "abbrev": "ALR", "country": "Arabia Saudí", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 89},
	{"id": "alk", "name": "Al-Khaleej", "abbrev": "ALK", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 88},
	{"id": "alw", "name": "Al-Wehda", "abbrev": "ALW", "country": "Arabia Saudí", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 88},
	{"id": "alra", "name": "Al-Raed", "abbrev": "AL3", "country": "Arabia Saudí", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 87},
	{"id": "dam", "name": "Damac", "abbrev": "DAM", "country": "Arabia Saudí", "div": 1,
		"kit": Color("b61819"), "kit2": Color("b61819"), "crest": "halved", "rating": 86},
	{"id": "alo", "name": "Al-Okhdood", "abbrev": "ALO", "country": "Arabia Saudí", "div": 1,
		"kit": Color("86bdf8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 85},
	{"id": "alha", "name": "Al-Hazem", "abbrev": "AL4", "country": "Arabia Saudí", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 85},
	{"id": "alq", "name": "Al-Qadsiah", "abbrev": "ALQ", "country": "Arabia Saudí", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 84},
	{"id": "alor", "name": "Al-Orobah", "abbrev": "AL5", "country": "Arabia Saudí", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5c518"), "crest": "star", "rating": 83},

	{"id": "alkh", "name": "Al-Kholood", "abbrev": "AL6", "country": "Arabia Saudí", "div": 2,
		"kit": Color("f0e4c8"), "kit2": Color("f0e4c8"), "crest": "banner", "rating": 80},
	{"id": "alb", "name": "Al-Batin", "abbrev": "AL7", "country": "Arabia Saudí", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "halved", "rating": 80},
	{"id": "alna", "name": "Al-Najma", "abbrev": "AL8", "country": "Arabia Saudí", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "shield", "rating": 79},
	{"id": "neo", "name": "Neom SC", "abbrev": "NES", "country": "Arabia Saudí", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 79},
	{"id": "alj", "name": "Al-Jabalain", "abbrev": "ALJ", "country": "Arabia Saudí", "div": 2,
		"kit": Color("4d3327"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 78},
	{"id": "oho", "name": "Ohod", "abbrev": "OHO", "country": "Arabia Saudí", "div": 2,
		"kit": Color("4d312c"), "kit2": Color("f5c518"), "crest": "star", "rating": 78},
	{"id": "alan", "name": "Al-Ansar", "abbrev": "AL9", "country": "Arabia Saudí", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "banner", "rating": 77},
	{"id": "lfs", "name": "Al-Faisaly", "abbrev": "ALD", "country": "Arabia Saudí", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "halved", "rating": 77},
	{"id": "jed", "name": "Jeddah", "abbrev": "JED", "country": "Arabia Saudí", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "shield", "rating": 76},
	{"id": "haj", "name": "Hajer", "abbrev": "HAJ", "country": "Arabia Saudí", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "round", "rating": 76},

	{"id": "lnh", "name": "Al-Nahda", "abbrev": "ALG", "country": "Arabia Saudí", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "crest": "diamond", "rating": 69},
	{"id": "alad", "name": "Al-Adalah", "abbrev": "ALL", "country": "Arabia Saudí", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "star", "rating": 69},
	{"id": "alz", "name": "Al-Zulfi", "abbrev": "ALZ", "country": "Arabia Saudí", "div": 3,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 68},
	{"id": "albu", "name": "Al-Bukayriyah", "abbrev": "ALM", "country": "Arabia Saudí", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 68},
	{"id": "alar", "name": "Al-Arabi", "abbrev": "ALP", "country": "Arabia Saudí", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "alta", "name": "Al-Taraji", "abbrev": "ALV", "country": "Arabia Saudí", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "diamond", "rating": 67},
	{"id": "alwa", "name": "Al-Watani", "abbrev": "ALX", "country": "Arabia Saudí", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "star", "rating": 66},
	{"id": "alju", "name": "Al-Jubail", "abbrev": "ALY", "country": "Arabia Saudí", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "banner", "rating": 66},
	{"id": "alsh", "name": "Al-Shoulla", "abbrev": "AAA", "country": "Arabia Saudí", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 65},

	{"id": "gal", "name": "Galatasaray", "abbrev": "GAL", "country": "Turquía", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "half", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "halved", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 94},
	{"id": "fen", "name": "Fenerbahçe", "abbrev": "FEN", "country": "Turquía", "div": 1,
		"kit": Color("0b1f4d"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5c518"),
		"shape": "round", "crest_pattern": "halved", "emblem": "leaf", "rim": "dark", "rating": 94},
	{"id": "bes", "name": "Beşiktaş", "abbrev": "BES", "country": "Turquía", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "white", "rating": 93},
	{"id": "tra", "name": "Trabzonspor", "abbrev": "TRA", "country": "Turquía", "div": 1,
		"kit": Color("7b1a2b"), "kit2": Color("8b1a2b"), "pattern": "stripes", "kit_b": Color("6cb4e4"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 92},
	{"id": "basa", "name": "Başakşehir", "abbrev": "BA2", "country": "Turquía", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crescent", "rim": "dark", "rating": 91},
	{"id": "ada", "name": "Adana Demirspor", "abbrev": "ADD", "country": "Turquía", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("0a2340"), "crest": "halved", "rating": 91},
	{"id": "kon", "name": "Konyaspor", "abbrev": "KON", "country": "Turquía", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 90},
	{"id": "kay", "name": "Kayserispor", "abbrev": "KAY", "country": "Turquía", "div": 1,
		"kit": Color("e21b2c"), "kit2": Color("f5c518"), "crest": "round", "rating": 89},
	{"id": "ant", "name": "Antalyaspor", "abbrev": "ANT", "country": "Turquía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 88},
	{"id": "lny", "name": "Alanyaspor", "abbrev": "AAB", "country": "Turquía", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("0a7a3c"), "crest": "star", "rating": 88},
	{"id": "siv", "name": "Sivasspor", "abbrev": "SIV", "country": "Turquía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 87},
	{"id": "kas", "name": "Kasımpaşa", "abbrev": "KAS", "country": "Turquía", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 86},
	{"id": "gaz", "name": "Gaziantep FK", "abbrev": "GAF", "country": "Turquía", "div": 1,
		"kit": Color("e21b2c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 85},
	{"id": "riz", "name": "Rizespor", "abbrev": "RIZ", "country": "Turquía", "div": 1,
		"kit": Color("14318f"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "round", "rating": 85},
	{"id": "sams", "name": "Samsunspor", "abbrev": "SAM", "country": "Turquía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 84},
	{"id": "hat", "name": "Hatayspor", "abbrev": "HAT", "country": "Turquía", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 83},
	{"id": "ank", "name": "Ankaragücü", "abbrev": "ANK", "country": "Turquía", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "banner", "rating": 82},
	{"id": "bod", "name": "Bodrum FK", "abbrev": "BOF", "country": "Turquía", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 82},

	{"id": "eyu", "name": "Eyüpspor", "abbrev": "EYU", "country": "Turquía", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "shield", "rating": 80},
	{"id": "goz", "name": "Göztepe", "abbrev": "GOZ", "country": "Turquía", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 80},
	{"id": "band", "name": "Bandırmaspor", "abbrev": "BA3", "country": "Turquía", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 79},
	{"id": "koc", "name": "Kocaelispor", "abbrev": "KOC", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 79},
	{"id": "bolu", "name": "Boluspor", "abbrev": "BOL", "country": "Turquía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 78},
	{"id": "erz", "name": "Erzurumspor", "abbrev": "ERZ", "country": "Turquía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 78},
	{"id": "sak", "name": "Sakaryaspor", "abbrev": "SAK", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 77},
	{"id": "man", "name": "Manisa FK", "abbrev": "MAF", "country": "Turquía", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 77},
	{"id": "snl", "name": "Şanlıurfaspor", "abbrev": "SA3", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "diamond", "rating": 76},
	{"id": "coru", "name": "Çorum FK", "abbrev": "COF", "country": "Turquía", "div": 2,
		"kit": Color("e21b2c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 76},

	{"id": "umr", "name": "Ümraniyespor", "abbrev": "UMR", "country": "Turquía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 69},
	{"id": "kec", "name": "Keçiörengücü", "abbrev": "KEC", "country": "Turquía", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "lty", "name": "Altay", "abbrev": "AAC", "country": "Turquía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "adan", "name": "Adanaspor", "abbrev": "ADA", "country": "Turquía", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "deni", "name": "Denizlispor", "abbrev": "DEN", "country": "Turquía", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 67},
	{"id": "burs", "name": "Bursaspor", "abbrev": "BU2", "country": "Turquía", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 67},
	{"id": "kar", "name": "Karagümrük", "abbrev": "KAR", "country": "Turquía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "banner", "rating": 67},
	{"id": "bal", "name": "Balıkesirspor", "abbrev": "BAL", "country": "Turquía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "halved", "rating": 66},
	{"id": "men", "name": "Menemen", "abbrev": "MEN", "country": "Turquía", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "shield", "rating": 66},
	{"id": "isp", "name": "Isparta 32", "abbrev": "IS3", "country": "Turquía", "div": 3,
		"kit": Color("d94f97"), "kit2": Color("0a7a3c"), "crest": "round", "rating": 65},

	{"id": "clu", "name": "Club Brujas", "abbrev": "CLB", "country": "Bélgica", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "B", "rating": 94},
	{"id": "and", "name": "Anderlecht", "abbrev": "AND", "country": "Bélgica", "div": 1,
		"kit": Color("6a2b8a"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "A", "rating": 94},
	{"id": "genk", "name": "Genk", "abbrev": "GEN", "country": "Bélgica", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 93},
	{"id": "amb", "name": "Amberes", "abbrev": "AMB", "country": "Bélgica", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 92},
	{"id": "gan", "name": "Gante", "abbrev": "GAN", "country": "Bélgica", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 91},
	{"id": "sta", "name": "Standard Lieja", "abbrev": "STL", "country": "Bélgica", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 91},
	{"id": "unio", "name": "Union Saint-Gilloise", "abbrev": "USG", "country": "Bélgica", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 90},
	{"id": "cer", "name": "Cercle Brujas", "abbrev": "CEB", "country": "Bélgica", "div": 1,
		"kit": Color("0b7c3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 89},
	{"id": "chr", "name": "Charleroi", "abbrev": "CH5", "country": "Bélgica", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 88},
	{"id": "mal", "name": "Malinas", "abbrev": "MAL", "country": "Bélgica", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "halved", "rating": 88},
	{"id": "sin", "name": "Sint-Truiden", "abbrev": "SIT", "country": "Bélgica", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "shield", "rating": 87},
	{"id": "ohl", "name": "OH Leuven", "abbrev": "OHL", "country": "Bélgica", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 86},
	{"id": "wes", "name": "Westerlo", "abbrev": "WES", "country": "Bélgica", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "diamond", "rating": 85},
	{"id": "kort", "name": "Kortrijk", "abbrev": "KOR", "country": "Bélgica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 80},
	{"id": "dend", "name": "Dender", "abbrev": "DE2", "country": "Bélgica", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "banner", "rating": 84},
	{"id": "bee", "name": "Beerschot", "abbrev": "BEE", "country": "Bélgica", "div": 2,
		"kit": Color("6a2b8a"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 80},
	{"id": "eup", "name": "Eupen", "abbrev": "EUP", "country": "Bélgica", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "shield", "rating": 80},
	{"id": "zul", "name": "Zulte Waregem", "abbrev": "ZUW", "country": "Bélgica", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 82},

	{"id": "rwd", "name": "RWDM", "abbrev": "RWD", "country": "Bélgica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "diamond", "rating": 80},
	{"id": "lom", "name": "Lommel", "abbrev": "LOM", "country": "Bélgica", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 80},
	{"id": "lie", "name": "Lierse", "abbrev": "LIE", "country": "Bélgica", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 79},
	{"id": "dei", "name": "Deinze", "abbrev": "DEI", "country": "Bélgica", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "halved", "rating": 79},
	{"id": "skb", "name": "SK Beveren", "abbrev": "SKB", "country": "Bélgica", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "shield", "rating": 78},
	{"id": "pat", "name": "Patro Eisden", "abbrev": "PAE", "country": "Bélgica", "div": 2,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "round", "rating": 78},
	{"id": "jon", "name": "Jong Genk", "abbrev": "JOG", "country": "Bélgica", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 77},
	{"id": "club", "name": "Club NXT", "abbrev": "CLN", "country": "Bélgica", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 77},
	{"id": "rsc", "name": "RSCA Futures", "abbrev": "RSF", "country": "Bélgica", "div": 2,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "banner", "rating": 76},
	{"id": "ser", "name": "Seraing", "abbrev": "SER", "country": "Bélgica", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("c8102e"), "crest": "halved", "rating": 76},

	{"id": "lal", "name": "La Louvière", "abbrev": "LAL", "country": "Bélgica", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "checkers", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 80},
	{"id": "fran", "name": "Francs Borains", "abbrev": "FRB", "country": "Bélgica", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 69},
	{"id": "tie", "name": "Tienen", "abbrev": "TIE", "country": "Bélgica", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 68},
	{"id": "kno", "name": "Knokke", "abbrev": "KNO", "country": "Bélgica", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 68},
	{"id": "mand", "name": "Mandel United", "abbrev": "MAU", "country": "Bélgica", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner", "rating": 67},
	{"id": "rup", "name": "Rupel Boom", "abbrev": "RUB", "country": "Bélgica", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 67},
	{"id": "nin", "name": "Ninove", "abbrev": "NIN", "country": "Bélgica", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 67},
	{"id": "oly", "name": "Olympic Charleroi", "abbrev": "OLC", "country": "Bélgica", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "round", "rating": 66},
	{"id": "win", "name": "Winkel Sport", "abbrev": "WIS", "country": "Bélgica", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 66},
	{"id": "the", "name": "Thes Sport", "abbrev": "THS", "country": "Bélgica", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("14318f"), "crest": "star", "rating": 65},

	{"id": "alc", "name": "Alcorcón", "abbrev": "AAD", "country": "España", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "banner", "rating": 69},
	{"id": "ponf", "name": "Ponferradina", "abbrev": "PON", "country": "España", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "nast", "name": "Nàstic", "abbrev": "NA3", "country": "España", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "alge", "name": "Algeciras", "abbrev": "AAE", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "sab", "name": "Sabadell", "abbrev": "SAB", "country": "España", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "quarters", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 67},
	{"id": "lug", "name": "Lugo", "abbrev": "LUG", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("6cb4e4"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 67},
	{"id": "nns", "name": "Unionistas", "abbrev": "UNI", "country": "España", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("14161a"), "crest": "banner", "rating": 67},
	{"id": "real", "name": "Real Murcia", "abbrev": "RE2", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 66},
	{"id": "bara", "name": "Barakaldo", "abbrev": "BAR", "country": "España", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 66},
	{"id": "teru", "name": "Teruel", "abbrev": "TER", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "round", "rating": 65},

	{"id": "wre", "name": "Wrexham", "abbrev": "WRE", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 67},
	{"id": "bolt", "name": "Bolton", "abbrev": "BO2", "country": "Inglaterra", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "crest": "star", "rating": 67},
	{"id": "barn", "name": "Bristol Rovers", "abbrev": "BRI", "country": "Inglaterra", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "banner",
		"pattern": "quarters", "kit_b": Color("f5f5f5"), "rating": 66},
	{"id": "read", "name": "Reading", "abbrev": "REA", "country": "Inglaterra", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 66},
	{"id": "ch", "name": "Charlton", "abbrev": "CH6", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 65},
	{"id": "bla", "name": "Blackpool", "abbrev": "BLA", "country": "Inglaterra", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 65},
	{"id": "pet", "name": "Peterborough", "abbrev": "PET", "country": "Inglaterra", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "ste", "name": "Stevenage", "abbrev": "STE", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "lin", "name": "Lincoln City", "abbrev": "LIC", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "wig", "name": "Wigan", "abbrev": "WIG", "country": "Inglaterra", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 63},

	{"id": "tern", "name": "Reggiana", "abbrev": "REG", "country": "Italia", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 64},
	{"id": "peru", "name": "Perugia", "abbrev": "PER", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 64},
	{"id": "cat", "name": "Catania", "abbrev": "CAT", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("18a2d8"), "crest": "diamond", "rating": 63},
	{"id": "fog", "name": "Foggia", "abbrev": "FOG", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 63},
	{"id": "ave", "name": "Avellino", "abbrev": "AVE", "country": "Italia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 62},
	{"id": "vic", "name": "Vicenza", "abbrev": "VIC", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 62},
	{"id": "pado", "name": "Padova", "abbrev": "PAD", "country": "Italia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 62},
	{"id": "pes", "name": "Pescara", "abbrev": "PES", "country": "Italia", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 61},
	{"id": "trie", "name": "Triestina", "abbrev": "TRI", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "crot", "name": "Crotone", "abbrev": "CRO", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("0a2340"), "crest": "star", "rating": 60},

	{"id": "dyn", "name": "Dynamo Dresden", "abbrev": "DYD", "country": "Alemania", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 69},
	{"id": "rotw", "name": "Rot-Weiss Essen", "abbrev": "RWE", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "186", "name": "1860 München", "abbrev": "18M", "country": "Alemania", "div": 3,
		"kit": Color("a0c7e5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "saa", "name": "Saarbrücken", "abbrev": "SAA", "country": "Alemania", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14161a"), "crest": "round", "rating": 68},
	{"id": "ing", "name": "Ingolstadt", "abbrev": "ING", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "diamond", "rating": 67},
	{"id": "erzg", "name": "Viktoria Köln", "abbrev": "VKÖ", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 67},
	{"id": "wald", "name": "Waldhof Mannheim", "abbrev": "WAM", "country": "Alemania", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "banner", "rating": 67},
	{"id": "osn", "name": "Osnabrück", "abbrev": "OSN", "country": "Alemania", "div": 3,
		"kit": Color("5b3fa6"), "kit2": Color("5b3fa6"), "crest": "halved", "rating": 66},
	{"id": "ver", "name": "Energie Cottbus", "abbrev": "COT", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 66},
	{"id": "sand", "name": "Preußen Münster", "abbrev": "PRM", "country": "Alemania", "div": 3,
		"kit": Color("0b7c3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 65},

	{"id": "at", "name": "Alebrijes de Oaxaca", "abbrev": "ALE", "country": "México", "div": 2,
		"kit": Color("14161a"), "kit2": Color("ff7f18"), "crest": "diamond", "rating": 77},
	{"id": "dora", "name": "Tapatío", "abbrev": "TAP", "country": "México", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 76},
	{"id": "tmp", "name": "Tlaxcala", "abbrev": "TLX", "country": "México", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner", "rating": 75},
	{"id": "cim", "name": "Cimarrones", "abbrev": "CIM", "country": "México", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 74},
	{"id": "vena", "name": "Mineros de Zacatecas", "abbrev": "MIN", "country": "México", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "shield", "rating": 74},
	{"id": "leon", "name": "Cafetaleros", "abbrev": "CFT", "country": "México", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 73},
	{"id": "tepa", "name": "Club La Paz", "abbrev": "LPZ", "country": "México", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 73},
	{"id": "tlt", "name": "Irapuato", "abbrev": "IRA", "country": "México", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "star", "rating": 72},
	{"id": "cela", "name": "Durango", "abbrev": "DUR", "country": "México", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("0a7a3c"), "crest": "banner", "rating": 69},
	{"id": "canc", "name": "Zacatepec", "abbrev": "ZAC", "country": "México", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "pattern": "band_h", "kit_b": Color("0a7a3c"), "crest": "halved", "rating": 69},

	{"id": "torr", "name": "Torreense", "abbrev": "TOR", "country": "Portugal", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("0a2340"), "crest": "shield", "rating": 69},
	{"id": "leca", "name": "Leça", "abbrev": "LEC", "country": "Portugal", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 69},
	{"id": "faf", "name": "Fafe", "abbrev": "FAF", "country": "Portugal", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "diamond", "rating": 68},
	{"id": "ana", "name": "Anadia", "abbrev": "ANA", "country": "Portugal", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 68},
	{"id": "sanj", "name": "Sanjoanense", "abbrev": "SA5", "country": "Portugal", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 67},
	{"id": "cal", "name": "Caldas", "abbrev": "CAL", "country": "Portugal", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 67},
	{"id": "amo", "name": "Amora", "abbrev": "AMO", "country": "Portugal", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "oli", "name": "Oliveirense", "abbrev": "OLI", "country": "Portugal", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "crest": "round", "rating": 66},
	{"id": "vila", "name": "Vilaverdense", "abbrev": "VI3", "country": "Portugal", "div": 3,
		"kit": Color("14161a"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 66},
	{"id": "cane", "name": "Canelas", "abbrev": "CAN", "country": "Portugal", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "star", "rating": 65},


	{"id": "sco_cel", "name": "Celtic", "abbrev": "CEL", "country": "Escocia", "div": 1,
		"kit": Color("0b8a3c"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "leaf", "rim": "dark", "rating": 91},
	{"id": "sco_ran", "name": "Rangers", "abbrev": "RAN", "country": "Escocia", "div": 1,
		"kit": Color("1b458f"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "emblem_tone": "gold", "rim": "gold", "rating": 90},
	{"id": "sco_hea", "name": "Hearts", "abbrev": "HEA", "country": "Escocia", "div": 1,
		"kit": Color("8c2332"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "heart", "rim": "dark", "rating": 85},
	{"id": "sco_hib", "name": "Hibernian", "abbrev": "HIB", "country": "Escocia", "div": 1,
		"kit": Color("00693e"), "kit2": Color("ffffff"), "pattern": "sleeves", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 85},
	{"id": "sco_abe", "name": "Aberdeen", "abbrev": "ABE", "country": "Escocia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 85},
	{"id": "sco_dut", "name": "Dundee United", "abbrev": "DUT", "country": "Escocia", "div": 1,
		"kit": Color("ff6b00"), "kit2": Color("000000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "sco_mot", "name": "Motherwell", "abbrev": "MOT", "country": "Escocia", "div": 1,
		"kit": Color("fbb800"), "kit2": Color("782039"), "pattern": "band_h", "kit_b": Color("782039"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "sco_kil", "name": "Kilmarnock", "abbrev": "KIL", "country": "Escocia", "div": 1,
		"kit": Color("0033a0"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 82},
	{"id": "sco_stm", "name": "St Mirren", "abbrev": "STM", "country": "Escocia", "div": 1,
		"kit": Color("000000"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 82},
	{"id": "sco_dun", "name": "Dundee", "abbrev": "DUN", "country": "Escocia", "div": 1,
		"kit": Color("000e54"), "kit2": Color("ffffff"), "crest": "round", "rating": 82},
	{"id": "sco_fal", "name": "Falkirk", "abbrev": "FAL", "country": "Escocia", "div": 1,
		"kit": Color("002d62"), "kit2": Color("ffffff"), "crest": "halved", "rating": 81},
	{"id": "sco_liv", "name": "Livingston", "abbrev": "LIV", "country": "Escocia", "div": 1,
		"kit": Color("ffcc00"), "kit2": Color("000000"), "crest": "diamond", "rating": 81},
	{"id": "sco_ros", "name": "Ross County", "abbrev": "ROS", "country": "Escocia", "div": 2,
		"kit": Color("1c2b5a"), "kit2": Color("ffffff"), "crest": "banner", "rating": 80},
	{"id": "sco_stj", "name": "St Johnstone", "abbrev": "STJ", "country": "Escocia", "div": 2,
		"kit": Color("005cb9"), "kit2": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "sco_par", "name": "Partick Thistle", "abbrev": "PAR", "country": "Escocia", "div": 2,
		"kit": Color("e2231a"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("ffdd00"), "crest": "round", "rating": 79},
	{"id": "sco_rai", "name": "Raith Rovers", "abbrev": "RAI", "country": "Escocia", "div": 2,
		"kit": Color("141e5a"), "kit2": Color("ffffff"), "crest": "halved", "rating": 79},
	{"id": "sco_dfl", "name": "Dunfermline Athletic", "abbrev": "DFL", "country": "Escocia", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 79},
	{"id": "sco_ayr", "name": "Ayr United", "abbrev": "AYR", "country": "Escocia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("000000"), "crest": "banner", "rating": 78},

	{"id": "sco_mtn", "name": "Greenock Morton", "abbrev": "MTN", "country": "Escocia", "div": 2,
		"kit": Color("0a4ea2"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"), "crest": "round", "rating": 75},
	{"id": "sco_air", "name": "Airdrieonians", "abbrev": "AIRD", "country": "Escocia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "chevron", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 74},
	{"id": "sco_qpk", "name": "Queen's Park", "abbrev": "QPK", "country": "Escocia", "div": 2,
		"kit": Color("000000"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"), "crest": "shield", "rating": 75},
	{"id": "sco_ham", "name": "Hamilton Academical", "abbrev": "HAM", "country": "Escocia", "div": 2,
		"kit": Color("e03a3e"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"), "crest": "halved", "rating": 73},
	{"id": "sco_ict", "name": "Inverness Caledonian Thistle", "abbrev": "ICT", "country": "Escocia", "div": 2,
		"kit": Color("1d4f91"), "kit2": Color("e2231a"), "crest": "star", "rating": 73},
	{"id": "sco_arb", "name": "Arbroath", "abbrev": "ARB", "country": "Escocia", "div": 2,
		"kit": Color("6b1f2e"), "kit2": Color("ffffff"), "crest": "banner", "rating": 74},
	{"id": "sco_all", "name": "Alloa Athletic", "abbrev": "ALL", "country": "Escocia", "div": 2,
		"kit": Color("f5b800"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "round", "rating": 72},
	{"id": "sco_cov", "name": "Cove Rangers", "abbrev": "COVE", "country": "Escocia", "div": 2,
		"kit": Color("004b96"), "kit2": Color("ffffff"), "crest": "shield", "rating": 71},
	{"id": "sco_mon", "name": "Montrose", "abbrev": "MON", "country": "Escocia", "div": 2,
		"kit": Color("1e56b0"), "kit2": Color("ffffff"), "crest": "halved", "rating": 72},
	{"id": "sco_qos", "name": "Queen of the South", "abbrev": "QOS", "country": "Escocia", "div": 2,
		"kit": Color("1b62c9"), "kit2": Color("ffffff"), "crest": "shield", "rating": 71},

	{"id": "sco_dbn", "name": "Dumbarton", "abbrev": "DBN", "country": "Escocia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 64},
	{"id": "sco_sti", "name": "Stirling Albion", "abbrev": "STI", "country": "Escocia", "div": 3,
		"kit": Color("d0021b"), "kit2": Color("ffffff"), "crest": "star", "rating": 63},
	{"id": "sco_pth", "name": "Peterhead", "abbrev": "PTH", "country": "Escocia", "div": 3,
		"kit": Color("1f4fa3"), "kit2": Color("ffffff"), "crest": "round", "rating": 64},
	{"id": "sco_elg", "name": "Elgin City", "abbrev": "ELG", "country": "Escocia", "div": 3,
		"kit": Color("111111"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 62},
	{"id": "sco_frf", "name": "Forfar Athletic", "abbrev": "FOR", "country": "Escocia", "div": 3,
		"kit": Color("5aa9e6"), "kit2": Color("1a2a5c"), "crest": "halved", "rating": 62},
	{"id": "sco_ste", "name": "Stenhousemuir", "abbrev": "STE", "country": "Escocia", "div": 3,
		"kit": Color("7a1f2b"), "kit2": Color("ffffff"), "crest": "banner", "rating": 62},
	{"id": "sco_efi", "name": "East Fife", "abbrev": "EFI", "country": "Escocia", "div": 3,
		"kit": Color("f2c200"), "kit2": Color("000000"), "pattern": "stripes", "kit_b": Color("000000"), "crest": "diamond", "rating": 61},
	{"id": "sco_ann", "name": "Annan Athletic", "abbrev": "ANN", "country": "Escocia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "round", "rating": 61},
	{"id": "sco_cly", "name": "Clyde", "abbrev": "CLY", "country": "Escocia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "sco_kel", "name": "Kelty Hearts", "abbrev": "KEL", "country": "Escocia", "div": 3,
		"kit": Color("5c1a2b"), "kit2": Color("ffffff"), "crest": "star", "rating": 60},

	{"id": "gre_oly", "name": "Olympiacos", "abbrev": "OLY", "country": "Grecia", "div": 1,
		"kit": Color("d81e2c"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 90},
	{"id": "gre_paok", "name": "PAOK", "abbrev": "PAOK", "country": "Grecia", "div": 1,
		"kit": Color("1a1a1a"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 88},
	{"id": "gre_aek", "name": "AEK Atenas", "abbrev": "AEK", "country": "Grecia", "div": 1,
		"kit": Color("f2c500"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 88},
	{"id": "gre_pan", "name": "Panathinaikos", "abbrev": "PAN", "country": "Grecia", "div": 1,
		"kit": Color("0a7d3e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 87},
	{"id": "gre_ari", "name": "Aris", "abbrev": "ARI", "country": "Grecia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 85},
	{"id": "gre_ofi", "name": "OFI Creta", "abbrev": "OFI", "country": "Grecia", "div": 1,
		"kit": Color("17171f"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 84},
	{"id": "gre_vol", "name": "Volos", "abbrev": "VOL", "country": "Grecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "half", "kit_b": Color("0a52b8"), "crest": "shield", "rating": 83},
	{"id": "gre_atr", "name": "Atromitos", "abbrev": "ATR", "country": "Grecia", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 83},
	{"id": "gre_ast", "name": "Asteras Tripolis", "abbrev": "AST", "country": "Grecia", "div": 1,
		"kit": Color("ffd400"), "kit2": Color("0b3d91"), "crest": "star", "rating": 82},
	{"id": "gre_pnt", "name": "Panetolikos", "abbrev": "PNT", "country": "Grecia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "round", "rating": 82},
	{"id": "gre_lam", "name": "Lamia", "abbrev": "LAM", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 80},
	{"id": "gre_lev", "name": "Levadiakos", "abbrev": "LEV", "country": "Grecia", "div": 1,
		"kit": Color("12864a"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 81},
	{"id": "gre_kif", "name": "Kifisia", "abbrev": "KIF", "country": "Grecia", "div": 1,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "pinstripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 80},
	{"id": "gre_pas", "name": "PAS Giannina", "abbrev": "PAS", "country": "Grecia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "pattern": "band_v", "kit_b": Color("14318f"), "crest": "halved", "rating": 80},
	{"id": "gre_psr", "name": "Panserraikos", "abbrev": "PSR", "country": "Grecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 79},
	{"id": "gre_ael", "name": "AEL Larissa", "abbrev": "AEL", "country": "Grecia", "div": 1,
		"kit": Color("7b1420"), "kit2": Color("ffffff"), "crest": "shield", "rating": 79},
	{"id": "gre_klm", "name": "Kalamata", "abbrev": "KLM", "country": "Grecia", "div": 2,
		"kit": Color("1b1b1b"), "kit2": Color("ffffff"), "crest": "round", "rating": 79},
	{"id": "gre_klt", "name": "Kallithea", "abbrev": "KLT", "country": "Grecia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "diamond", "rating": 78},

	{"id": "gre_ira", "name": "Iraklis", "abbrev": "IRA", "country": "Grecia", "div": 2,
		"kit": Color("1aa3d8"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 75},
	{"id": "gre_xan", "name": "Xanthi", "abbrev": "XAN", "country": "Grecia", "div": 2,
		"kit": Color("c0111f"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "banner", "rating": 75},
	{"id": "gre_pio", "name": "Panionios", "abbrev": "PIO", "country": "Grecia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 74},
	{"id": "gre_aps", "name": "Apollon Smyrnis", "abbrev": "APS", "country": "Grecia", "div": 2,
		"kit": Color("6cc3e8"), "kit2": Color("ffffff"), "crest": "star", "rating": 74},
	{"id": "gre_ion", "name": "Ionikos", "abbrev": "ION", "country": "Grecia", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "halved", "rating": 73},
	{"id": "gre_cha", "name": "Chania", "abbrev": "CHA", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 73},
	{"id": "gre_nkv", "name": "Niki Volos", "abbrev": "NKV", "country": "Grecia", "div": 2,
		"kit": Color("1b4fa0"), "kit2": Color("1b4fa0"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "gre_erg", "name": "Ergotelis", "abbrev": "ERG", "country": "Grecia", "div": 2,
		"kit": Color("f5b700"), "kit2": Color("141414"), "crest": "diamond", "rating": 72},
	{"id": "gre_mak", "name": "Makedonikos", "abbrev": "MAK", "country": "Grecia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 71},
	{"id": "gre_ega", "name": "Egaleo", "abbrev": "EGA", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 71},

	{"id": "gre_ver", "name": "Veria", "abbrev": "VER", "country": "Grecia", "div": 3,
		"kit": Color("b81f2b"), "kit2": Color("ffffff"), "pattern": "sleeves", "kit_b": Color("ffffff"), "crest": "shield", "rating": 64},
	{"id": "gre_pch", "name": "Panachaiki", "abbrev": "PCH", "country": "Grecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 64},
	{"id": "gre_kav", "name": "Kavala", "abbrev": "KAV", "country": "Grecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 63},
	{"id": "gre_dox", "name": "Doxa Drama", "abbrev": "DOX", "country": "Grecia", "div": 3,
		"kit": Color("1a1a1a"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"), "crest": "halved", "rating": 63},
	{"id": "gre_app", "name": "Apollon Pontou", "abbrev": "APP", "country": "Grecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 62},
	{"id": "gre_tri", "name": "Trikala", "abbrev": "TRI", "country": "Grecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "sleeves", "kit_b": Color("0a52b8"), "crest": "banner", "rating": 62},
	{"id": "gre_dia", "name": "Diagoras", "abbrev": "DIA", "country": "Grecia", "div": 3,
		"kit": Color("14318f"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "star", "rating": 62},
	{"id": "gre_ank", "name": "Anagennisi Karditsa", "abbrev": "ANK", "country": "Grecia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 61},
	{"id": "gre_pgl", "name": "Panegialios", "abbrev": "PGL", "country": "Grecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 61},
	{"id": "gre_pro", "name": "Proodeftiki", "abbrev": "PRO", "country": "Grecia", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 60},

	{"id": "ukr_shk", "name": "Shakhtar Donetsk", "abbrev": "SHK", "country": "Ucrania", "div": 1,
		"kit": Color("f37021"), "kit2": Color("141414"), "pattern": "stripes", "kit_b": Color("141414"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 90},
	{"id": "ukr_dyn", "name": "Dynamo Kyiv", "abbrev": "DYN", "country": "Ucrania", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1b57a5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "D", "rating": 89},
	{"id": "ukr_pol", "name": "Polissya Zhytomyr", "abbrev": "POL", "country": "Ucrania", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "shield", "rating": 86},
	{"id": "ukr_lnz", "name": "LNZ Cherkasy", "abbrev": "LNZ", "country": "Ucrania", "div": 1,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "halved", "rating": 85},
	{"id": "ukr_kry", "name": "Kryvbas", "abbrev": "KRY", "country": "Ucrania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "diamond", "rating": 85},
	{"id": "ukr_olk", "name": "Oleksandriya", "abbrev": "OLK", "country": "Ucrania", "div": 1,
		"kit": Color("f2c200"), "kit2": Color("141414"), "crest": "round", "rating": 85},
	{"id": "ukr_zor", "name": "Zorya Luhansk", "abbrev": "ZOR", "country": "Ucrania", "div": 1,
		"kit": Color("141414"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "star", "rating": 85},
	{"id": "ukr_m25", "name": "Metalist 1925 Kharkiv", "abbrev": "MET", "country": "Ucrania", "div": 1,
		"kit": Color("6a1b2a"), "kit2": Color("f2c400"), "crest": "banner", "rating": 85},
	{"id": "ukr_kol", "name": "Kolos Kovalivka", "abbrev": "KOL", "country": "Ucrania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 84},
	{"id": "ukr_kar", "name": "Karpaty Lviv", "abbrev": "KAR", "country": "Ucrania", "div": 1,
		"kit": Color("0a7a42"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 84},
	{"id": "ukr_vor", "name": "Vorskla Poltava", "abbrev": "VOR", "country": "Ucrania", "div": 2,
		"kit": Color("0c7a3d"), "kit2": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "ukr_ver", "name": "Veres Rivne", "abbrev": "VER", "country": "Ucrania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 82},
	{"id": "ukr_ruk", "name": "Rukh Lviv", "abbrev": "RUK", "country": "Ucrania", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "banner", "rating": 82},
	{"id": "ukr_cho", "name": "Chornomorets Odesa", "abbrev": "CHO", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 80},
	{"id": "ukr_obo", "name": "Obolon Kyiv", "abbrev": "OBO", "country": "Ucrania", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 81},
	{"id": "ukr_epi", "name": "Epicentr", "abbrev": "EPI", "country": "Ucrania", "div": 1,
		"kit": Color("e85d12"), "kit2": Color("1a3a7a"), "crest": "diamond", "rating": 80},
	{"id": "ukr_kud", "name": "Kudrivka", "abbrev": "KUD", "country": "Ucrania", "div": 1,
		"kit": Color("1c4faa"), "kit2": Color("ffde59"), "crest": "shield", "rating": 79},
	{"id": "ukr_scp", "name": "SC Poltava", "abbrev": "SCP", "country": "Ucrania", "div": 1,
		"kit": Color("16233f"), "kit2": Color("ffffff"), "crest": "halved", "rating": 78},

	{"id": "ukr_lbk", "name": "Livyi Bereh Kyiv", "abbrev": "LBK", "country": "Ucrania", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 75},
	{"id": "ukr_inh", "name": "Inhulets Petrove", "abbrev": "INH", "country": "Ucrania", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 75},
	{"id": "ukr_mtk", "name": "Metalist Kharkiv", "abbrev": "MTK", "country": "Ucrania", "div": 2,
		"kit": Color("f2c400"), "kit2": Color("1a3a8f"), "crest": "round", "rating": 74},
	{"id": "ukr_buk", "name": "Bukovyna Chernivtsi", "abbrev": "BUK", "country": "Ucrania", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 74},
	{"id": "ukr_ahr", "name": "Ahrobiznes Volochysk", "abbrev": "AHR", "country": "Ucrania", "div": 2,
		"kit": Color("0f7a4a"), "kit2": Color("ffffff"), "crest": "round", "rating": 73},
	{"id": "ukr_pry", "name": "Prykarpattia", "abbrev": "PRY", "country": "Ucrania", "div": 2,
		"kit": Color("e8c020"), "kit2": Color("15408f"), "crest": "shield", "rating": 73},
	{"id": "ukr_nyt", "name": "Nyva Ternopil", "abbrev": "NYT", "country": "Ucrania", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "halved", "rating": 72},
	{"id": "ukr_pod", "name": "Podillya Khmelnytskyi", "abbrev": "POD", "country": "Ucrania", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 72},
	{"id": "ukr_vik", "name": "Viktoriya Sumy", "abbrev": "VIK", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 71},
	{"id": "ukr_mtz", "name": "Metalurh Zaporizhzhia", "abbrev": "MTZ", "country": "Ucrania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("ffffff"), "crest": "shield", "rating": 71},

	{"id": "ukr_che", "name": "Chernihiv", "abbrev": "CHE", "country": "Ucrania", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 64},
	{"id": "ukr_fmr", "name": "Feniks-Mariupol", "abbrev": "FMR", "country": "Ucrania", "div": 3,
		"kit": Color("0e75c4"), "kit2": Color("ffffff"), "crest": "star", "rating": 64},
	{"id": "ukr_zir", "name": "Zirka Kropyvnytskyi", "abbrev": "ZIR", "country": "Ucrania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 63},
	{"id": "ukr_uzh", "name": "Uzhhorod", "abbrev": "UZH", "country": "Ucrania", "div": 3,
		"kit": Color("1a5fb0"), "kit2": Color("f2d024"), "crest": "banner", "rating": 63},
	{"id": "ukr_nyv", "name": "Nyva Vinnytsia", "abbrev": "NYV", "country": "Ucrania", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 62},
	{"id": "ukr_hir", "name": "Hirnyk-Sport", "abbrev": "HIR", "country": "Ucrania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 62},
	{"id": "ukr_lok", "name": "Lokomotyv Kyiv", "abbrev": "LOK", "country": "Ucrania", "div": 3,
		"kit": Color("1e7a3c"), "kit2": Color("cf2027"), "crest": "round", "rating": 62},
	{"id": "ukr_rph", "name": "Real Pharma Odesa", "abbrev": "RPO", "country": "Ucrania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "halved", "rating": 61},
	{"id": "ukr_dnz", "name": "Dinaz Vyshhorod", "abbrev": "DNZ", "country": "Ucrania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 61},
	{"id": "ukr_ska", "name": "Skala Stryi", "abbrev": "SKA", "country": "Ucrania", "div": 3,
		"kit": Color("1a4fb0"), "kit2": Color("f5d020"), "crest": "shield", "rating": 60},

	{"id": "aut_sal", "name": "Salzburgo", "abbrev": "SAL", "country": "Austria", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 90},
	{"id": "aut_stu", "name": "Sturm Graz", "abbrev": "STU", "country": "Austria", "div": 1,
		"kit": Color("111111"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 88},
	{"id": "aut_rap", "name": "Rapid Viena", "abbrev": "RAP", "country": "Austria", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "aut_auw", "name": "Austria Viena", "abbrev": "AUW", "country": "Austria", "div": 1,
		"kit": Color("5a2a82"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "aut_las", "name": "LASK", "abbrev": "LAS", "country": "Austria", "div": 1,
		"kit": Color("000000"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "aut_wac", "name": "Wolfsberger AC", "abbrev": "WAC", "country": "Austria", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"), "crest": "star", "rating": 85},
	{"id": "aut_har", "name": "Hartberg", "abbrev": "HAR", "country": "Austria", "div": 1,
		"kit": Color("1a3f8f"), "kit2": Color("ffffff"), "crest": "shield", "rating": 84},
	{"id": "aut_alt", "name": "Altach", "abbrev": "ALT", "country": "Austria", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1c1c1c"), "pattern": "sleeves", "kit_b": Color("1c1c1c"), "crest": "diamond", "rating": 83},
	{"id": "aut_akl", "name": "Austria Klagenfurt", "abbrev": "AKL", "country": "Austria", "div": 2,
		"kit": Color("6b2fa0"), "kit2": Color("ffffff"), "crest": "banner", "rating": 80},
	{"id": "aut_bwl", "name": "Blau-Weiß Linz", "abbrev": "BWL", "country": "Austria", "div": 1,
		"kit": Color("1560bd"), "kit2": Color("ffffff"), "crest": "halved", "rating": 82},
	{"id": "aut_wsg", "name": "WSG Tirol", "abbrev": "WSG", "country": "Austria", "div": 1,
		"kit": Color("0f9b4a"), "kit2": Color("ffffff"), "crest": "star", "rating": 82},
	{"id": "aut_rie", "name": "Ried", "abbrev": "RIE", "country": "Austria", "div": 1,
		"kit": Color("046a38"), "kit2": Color("111111"), "crest": "round", "rating": 82},
	{"id": "aut_gak", "name": "Grazer AK", "abbrev": "GAK", "country": "Austria", "div": 1,
		"kit": Color("cc0000"), "kit2": Color("ffffff"), "crest": "round", "rating": 82},
	{"id": "aut_skn", "name": "St. Pölten", "abbrev": "SKN", "country": "Austria", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 80},
	{"id": "aut_lus", "name": "Austria Lustenau", "abbrev": "LUS", "country": "Austria", "div": 2,
		"kit": Color("00733c"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "banner", "rating": 80},
	{"id": "aut_vie", "name": "First Vienna", "abbrev": "VIE", "country": "Austria", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "diamond", "rating": 80},
	{"id": "aut_adm", "name": "Admira Wacker", "abbrev": "ADM", "country": "Austria", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 79},
	{"id": "aut_kap", "name": "Kapfenberger SV", "abbrev": "KAP", "country": "Austria", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 79},

	{"id": "aut_lie", "name": "Liefering", "abbrev": "LIE", "country": "Austria", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "round", "rating": 76},
	{"id": "aut_fac", "name": "Floridsdorfer AC", "abbrev": "FAC", "country": "Austria", "div": 2,
		"kit": Color("0a4d9c"), "kit2": Color("ffffff"), "crest": "shield", "rating": 76},
	{"id": "aut_leo", "name": "DSV Leoben", "abbrev": "LEO", "country": "Austria", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 75},
	{"id": "aut_laf", "name": "Lafnitz", "abbrev": "LAF", "country": "Austria", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "star", "rating": 75},
	{"id": "aut_ams", "name": "Amstetten", "abbrev": "AMS", "country": "Austria", "div": 2,
		"kit": Color("1152a0"), "kit2": Color("f2c200"), "crest": "shield", "rating": 74},
	{"id": "aut_hor", "name": "SV Horn", "abbrev": "HOR", "country": "Austria", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 74},
	{"id": "aut_voi", "name": "Voitsberg", "abbrev": "VOI", "country": "Austria", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 73},
	{"id": "aut_bre", "name": "Bregenz", "abbrev": "BRE", "country": "Austria", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("ffffff"), "crest": "round", "rating": 73},
	{"id": "aut_wel", "name": "Hertha Wels", "abbrev": "WEL", "country": "Austria", "div": 2,
		"kit": Color("004a99"), "kit2": Color("ffffff"), "crest": "banner", "rating": 72},
	{"id": "aut_dor", "name": "Dornbirn", "abbrev": "DOR", "country": "Austria", "div": 2,
		"kit": Color("cf1020"), "kit2": Color("ffffff"), "crest": "star", "rating": 72},

	{"id": "aut_inn", "name": "Wacker Innsbruck", "abbrev": "INN", "country": "Austria", "div": 3,
		"kit": Color("0a6b34"), "kit2": Color("111111"), "crest": "shield", "rating": 65},
	{"id": "aut_wsc", "name": "Wiener Sport-Club", "abbrev": "WSC", "country": "Austria", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 65},
	{"id": "aut_aus", "name": "Austria Salzburg", "abbrev": "AUS", "country": "Austria", "div": 3,
		"kit": Color("6a2d8f"), "kit2": Color("ffffff"), "crest": "round", "rating": 64},
	{"id": "aut_ste", "name": "Vorwärts Steyr", "abbrev": "STE", "country": "Austria", "div": 3,
		"kit": Color("c4161c"), "kit2": Color("ffffff"), "crest": "banner", "rating": 64},
	{"id": "aut_kre", "name": "Kremser SC", "abbrev": "KRE", "country": "Austria", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "halved", "rating": 63},
	{"id": "aut_mat", "name": "Mattersburg", "abbrev": "MAT", "country": "Austria", "div": 3,
		"kit": Color("0e7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 63},
	{"id": "aut_wne", "name": "Wiener Neustadt", "abbrev": "WNE", "country": "Austria", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 63},
	{"id": "aut_str", "name": "Stripfing", "abbrev": "STR", "country": "Austria", "div": 3,
		"kit": Color("1a5fb4"), "kit2": Color("ffffff"), "crest": "banner", "rating": 62},
	{"id": "aut_gur", "name": "Union Gurten", "abbrev": "GUR", "country": "Austria", "div": 3,
		"kit": Color("128a4a"), "kit2": Color("ffffff"), "crest": "star", "rating": 62},
	{"id": "aut_wor", "name": "SV Wörgl", "abbrev": "WOR", "country": "Austria", "div": 3,
		"kit": Color("d21f26"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 61},

	{"id": "sui_ybb", "name": "Young Boys", "abbrev": "YB", "country": "Suiza", "div": 1,
		"kit": Color("ffd400"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "sui_bas", "name": "Basilea", "abbrev": "BAS", "country": "Suiza", "div": 1,
		"kit": Color("e2001a"), "kit2": Color("0b3d91"), "pattern": "half", "kit_b": Color("0b3d91"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "sui_ser", "name": "Servette", "abbrev": "SER", "country": "Suiza", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "sui_lug", "name": "Lugano", "abbrev": "LUG", "country": "Suiza", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 85},
	{"id": "sui_stg", "name": "St. Gallen", "abbrev": "STG", "country": "Suiza", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "sui_zur", "name": "Zúrich", "abbrev": "ZUR", "country": "Suiza", "div": 1,
		"kit": Color("f2f2f2"), "kit2": Color("0b3d91"), "crest": "shield", "rating": 85},
	{"id": "sui_luz", "name": "Lucerna", "abbrev": "LUZ", "country": "Suiza", "div": 1,
		"kit": Color("1a4fa0"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 85},
	{"id": "sui_lau", "name": "Lausanne-Sport", "abbrev": "LAU", "country": "Suiza", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("14318f"), "crest": "round", "rating": 84},
	{"id": "sui_gra", "name": "Grasshopper", "abbrev": "GRA", "country": "Suiza", "div": 1,
		"kit": Color("0a3d91"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 84},
	{"id": "sui_sio", "name": "Sion", "abbrev": "SIO", "country": "Suiza", "div": 1,
		"kit": Color("d81e2c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 83},
	{"id": "sui_thu", "name": "Thun", "abbrev": "THU", "country": "Suiza", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 82},
	{"id": "sui_win", "name": "Winterthur", "abbrev": "WIN", "country": "Suiza", "div": 1,
		"kit": Color("b21f24"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 81},
	{"id": "sui_yve", "name": "Yverdon-Sport", "abbrev": "YVE", "country": "Suiza", "div": 2,
		"kit": Color("0f7b3d"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 80},
	{"id": "sui_aar", "name": "Aarau", "abbrev": "AAR", "country": "Suiza", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sleeves", "kit_b": Color("14161a"), "crest": "diamond", "rating": 80},
	{"id": "sui_vad", "name": "Vaduz", "abbrev": "VAD", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 80},
	{"id": "sui_xam", "name": "Neuchâtel Xamax", "abbrev": "XAM", "country": "Suiza", "div": 2,
		"kit": Color("d0102a"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "round", "rating": 79},
	{"id": "sui_bel", "name": "Bellinzona", "abbrev": "BEL", "country": "Suiza", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 79},
	{"id": "sui_wil", "name": "Wil", "abbrev": "WIL", "country": "Suiza", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 78},

	{"id": "sui_slo", "name": "Stade Lausanne-Ouchy", "abbrev": "SLO", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 75},
	{"id": "sui_sch", "name": "Schaffhausen", "abbrev": "SCH", "country": "Suiza", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "round", "rating": 75},
	{"id": "sui_car", "name": "Etoile Carouge", "abbrev": "CAR", "country": "Suiza", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "star", "rating": 74},
	{"id": "sui_rap", "name": "Rapperswil-Jona", "abbrev": "RAP", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 74},
	{"id": "sui_nyo", "name": "Stade Nyonnais", "abbrev": "NYO", "country": "Suiza", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "halved", "rating": 73},
	{"id": "sui_bad", "name": "Baden", "abbrev": "BAD", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 73},
	{"id": "sui_cham", "name": "Cham", "abbrev": "CHA", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 72},
	{"id": "sui_bru", "name": "Brühl", "abbrev": "BRU", "country": "Suiza", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "sui_bre", "name": "Breitenrain", "abbrev": "BRE", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 71},
	{"id": "sui_kon", "name": "Köniz", "abbrev": "KON", "country": "Suiza", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "banner", "rating": 71},

	{"id": "sui_cdf", "name": "La Chaux-de-Fonds", "abbrev": "CDF", "country": "Suiza", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 64},
	{"id": "sui_bie", "name": "Biel-Bienne", "abbrev": "BIE", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "sui_chi", "name": "Chiasso", "abbrev": "CHI", "country": "Suiza", "div": 3,
		"kit": Color("d0102a"), "kit2": Color("1a3fa0"), "pattern": "stripes", "kit_b": Color("1a3fa0"), "crest": "round", "rating": 62},
	{"id": "sui_loc", "name": "Locarno", "abbrev": "LOC", "country": "Suiza", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 62},
	{"id": "sui_kri", "name": "Kriens", "abbrev": "KRI", "country": "Suiza", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 63},
	{"id": "sui_bul", "name": "Bulle", "abbrev": "BUL", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 63},
	{"id": "sui_del", "name": "Delémont", "abbrev": "DEL", "country": "Suiza", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 62},
	{"id": "sui_woh", "name": "Wohlen", "abbrev": "WOH", "country": "Suiza", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 61},
	{"id": "sui_gre", "name": "Grenchen", "abbrev": "GRE", "country": "Suiza", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 61},
	{"id": "sui_obb", "name": "Old Boys Basel", "abbrev": "OBB", "country": "Suiza", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "star", "rating": 60},

	{"id": "cze_slv", "name": "Slavia Praga", "abbrev": "SLA", "country": "Chequia", "div": 1,
		"kit": Color("d0181c"), "kit2": Color("ffffff"), "pattern": "half", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 88},
	{"id": "cze_spa", "name": "Sparta Praga", "abbrev": "SPT", "country": "Chequia", "div": 1,
		"kit": Color("8b1a2f"), "kit2": Color("f0f0f0"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "S", "rating": 88},
	{"id": "cze_plz", "name": "Viktoria Plzeň", "abbrev": "PLZ", "country": "Chequia", "div": 1,
		"kit": Color("1b3f8f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 86},
	{"id": "cze_ost", "name": "Baník Ostrava", "abbrev": "OST", "country": "Chequia", "div": 1,
		"kit": Color("0b3d91"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 85},
	{"id": "cze_olo", "name": "Sigma Olomouc", "abbrev": "OLO", "country": "Chequia", "div": 1,
		"kit": Color("1a4fa0"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 85},
	{"id": "cze_lib", "name": "Slovan Liberec", "abbrev": "LIB", "country": "Chequia", "div": 1,
		"kit": Color("1560bd"), "kit2": Color("ffffff"), "crest": "banner", "rating": 84},
	{"id": "cze_jab", "name": "Jablonec", "abbrev": "JAB", "country": "Chequia", "div": 1,
		"kit": Color("0f7d3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 84},
	{"id": "cze_bol", "name": "Mladá Boleslav", "abbrev": "MBO", "country": "Chequia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 83},
	{"id": "cze_slc", "name": "Slovácko", "abbrev": "SLC", "country": "Chequia", "div": 1,
		"kit": Color("1e4fa3"), "kit2": Color("ffffff"), "crest": "halved", "rating": 83},
	{"id": "cze_hrk", "name": "Hradec Králové", "abbrev": "HRA", "country": "Chequia", "div": 1,
		"kit": Color("141414"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "banner", "rating": 82},
	{"id": "cze_boh", "name": "Bohemians 1905", "abbrev": "BOH", "country": "Chequia", "div": 1,
		"kit": Color("0e7a35"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 82},
	{"id": "cze_tep", "name": "Teplice", "abbrev": "TEP", "country": "Chequia", "div": 1,
		"kit": Color("f2d600"), "kit2": Color("1b3a8c"), "crest": "shield", "rating": 82},
	{"id": "cze_duk", "name": "Dukla Praga", "abbrev": "DUK", "country": "Chequia", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("f5c518"), "pattern": "sleeves", "kit_b": Color("f5c518"), "crest": "star", "rating": 81},
	{"id": "cze_kar", "name": "Karviná", "abbrev": "KAR", "country": "Chequia", "div": 1,
		"kit": Color("0a6b3d"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 81},
	{"id": "cze_par", "name": "Pardubice", "abbrev": "PAR", "country": "Chequia", "div": 1,
		"kit": Color("d42a2a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "cze_zln", "name": "Zlín", "abbrev": "ZLI", "country": "Chequia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 80},
	{"id": "cze_brn", "name": "Zbrojovka Brno", "abbrev": "BRN", "country": "Chequia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("ffffff"), "crest": "banner", "rating": 79},
	{"id": "cze_cbu", "name": "Dynamo Budějovice", "abbrev": "CBU", "country": "Chequia", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 79},

	{"id": "cze_opa", "name": "Opava", "abbrev": "OPA", "country": "Chequia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 76},
	{"id": "cze_jih", "name": "Vysočina Jihlava", "abbrev": "JIH", "country": "Chequia", "div": 2,
		"kit": Color("143c8c"), "kit2": Color("ffffff"), "crest": "round", "rating": 76},
	{"id": "cze_ziz", "name": "Viktoria Žižkov", "abbrev": "ZIZ", "country": "Chequia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 75},
	{"id": "cze_pri", "name": "Příbram", "abbrev": "PRI", "country": "Chequia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "banner", "rating": 75},
	{"id": "cze_tri", "name": "Třinec", "abbrev": "TRI", "country": "Chequia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 74},
	{"id": "cze_vla", "name": "Vlašim", "abbrev": "VLA", "country": "Chequia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 74},
	{"id": "cze_chr", "name": "Chrudim", "abbrev": "CHR", "country": "Chequia", "div": 2,
		"kit": Color("f2c200"), "kit2": Color("1a1a1a"), "crest": "star", "rating": 73},
	{"id": "cze_tab", "name": "Táborsko", "abbrev": "TAB", "country": "Chequia", "div": 2,
		"kit": Color("1c5aa8"), "kit2": Color("ffffff"), "crest": "round", "rating": 73},
	{"id": "cze_pro", "name": "Prostějov", "abbrev": "PRO", "country": "Chequia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 72},
	{"id": "cze_ust", "name": "Ústí nad Labem", "abbrev": "UST", "country": "Chequia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 72},

	{"id": "cze_vit", "name": "Vítkovice", "abbrev": "VIT", "country": "Chequia", "div": 3,
		"kit": Color("1f4fa8"), "kit2": Color("ffffff"), "crest": "shield", "rating": 65},
	{"id": "cze_kla", "name": "Kladno", "abbrev": "KLA", "country": "Chequia", "div": 3,
		"kit": Color("1b4f9c"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"), "crest": "round", "rating": 65},
	{"id": "cze_sok", "name": "Baník Sokolov", "abbrev": "SOK", "country": "Chequia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 64},
	{"id": "cze_var", "name": "Varnsdorf", "abbrev": "VAR", "country": "Chequia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 64},
	{"id": "cze_vys", "name": "Slavoj Vyšehrad", "abbrev": "VYS", "country": "Chequia", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 63},
	{"id": "cze_kdv", "name": "Králův Dvůr", "abbrev": "KDV", "country": "Chequia", "div": 3,
		"kit": Color("0f5fa8"), "kit2": Color("f2f2f2"), "crest": "halved", "rating": 63},
	{"id": "cze_pis", "name": "Písek", "abbrev": "PIS", "country": "Chequia", "div": 3,
		"kit": Color("c9302c"), "kit2": Color("15315e"), "crest": "shield", "rating": 63},
	{"id": "cze_frm", "name": "Frýdek-Místek", "abbrev": "FRM", "country": "Chequia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "sash_r", "kit_b": Color("0a52b8"), "crest": "round", "rating": 62},
	{"id": "cze_zno", "name": "Znojmo", "abbrev": "ZNO", "country": "Chequia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 62},
	{"id": "cze_mot", "name": "Motorlet Praga", "abbrev": "MOT", "country": "Chequia", "div": 3,
		"kit": Color("2a6fbb"), "kit2": Color("fafafa"), "crest": "diamond", "rating": 61},

	{"id": "cro_din", "name": "Dinamo Zagreb", "abbrev": "DIN", "country": "Croacia", "div": 1,
		"kit": Color("1a4fa3"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "cro_haj", "name": "Hajduk Split", "abbrev": "HAJ", "country": "Croacia", "div": 1,
		"kit": Color("f2f2f2"), "kit2": Color("1e4fa0"),
		"shape": "shield", "crest_pattern": "quartered", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "cro_rij", "name": "Rijeka", "abbrev": "RIJ", "country": "Croacia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("13429b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 86},
	{"id": "cro_osi", "name": "Osijek", "abbrev": "OSI", "country": "Croacia", "div": 1,
		"kit": Color("1d3f94"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "cro_lok", "name": "Lokomotiva Zagreb", "abbrev": "LOK", "country": "Croacia", "div": 1,
		"kit": Color("1b5fbf"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 84},
	{"id": "cro_var", "name": "Varaždin", "abbrev": "VAR", "country": "Croacia", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "shield", "rating": 84},
	{"id": "cro_sla", "name": "Slaven Belupo", "abbrev": "SLB", "country": "Croacia", "div": 1,
		"kit": Color("1552b5"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 83},
	{"id": "cro_gor", "name": "Gorica", "abbrev": "GOR", "country": "Croacia", "div": 1,
		"kit": Color("1b74d0"), "kit2": Color("ffffff"), "crest": "star", "rating": 83},
	{"id": "cro_ist", "name": "Istra 1961", "abbrev": "IST", "country": "Croacia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 82},
	{"id": "cro_sib", "name": "Šibenik", "abbrev": "SIB", "country": "Croacia", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "shield", "rating": 80},
	{"id": "cro_vuk", "name": "Vukovar 1991", "abbrev": "VUK", "country": "Croacia", "div": 1,
		"kit": Color("1747a0"), "kit2": Color("ffffff"), "crest": "banner", "rating": 82},
	{"id": "cro_cib", "name": "Cibalia", "abbrev": "CIB", "country": "Croacia", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 80},
	{"id": "cro_zag", "name": "Zagreb", "abbrev": "ZAG", "country": "Croacia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 80},
	{"id": "cro_rud", "name": "Rudeš", "abbrev": "RUD", "country": "Croacia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 80},
	{"id": "cro_hdr", "name": "Hrvatski Dragovoljac", "abbrev": "HDR", "country": "Croacia", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 80},
	{"id": "cro_zad", "name": "Zadar", "abbrev": "ZAD", "country": "Croacia", "div": 2,
		"kit": Color("1a48a0"), "kit2": Color("14318f"), "crest": "shield", "rating": 79},
	{"id": "cro_dug", "name": "Dugopolje", "abbrev": "DUG", "country": "Croacia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 79},
	{"id": "cro_ori", "name": "Orijent 1919", "abbrev": "ORI", "country": "Croacia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 78},

	{"id": "cro_dub", "name": "Dubrava Zagreb", "abbrev": "DUB", "country": "Croacia", "div": 2,
		"kit": Color("176e34"), "kit2": Color("ffffff"), "crest": "round", "rating": 75},
	{"id": "cro_kar", "name": "Karlovac 1919", "abbrev": "KAR", "country": "Croacia", "div": 2,
		"kit": Color("1f56ab"), "kit2": Color("ffffff"), "crest": "shield", "rating": 75},
	{"id": "cro_med", "name": "Međimurje Čakovec", "abbrev": "MED", "country": "Croacia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 74},
	{"id": "cro_ses", "name": "Sesvete", "abbrev": "SES", "country": "Croacia", "div": 2,
		"kit": Color("a51c2c"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 74},
	{"id": "cro_zmi", "name": "Croatia Zmijavci", "abbrev": "ZMI", "country": "Croacia", "div": 2,
		"kit": Color("d21f2b"), "kit2": Color("f5f5f5"), "pattern": "checkers", "kit_b": Color("ffffff"), "crest": "shield", "rating": 73},
	{"id": "cro_sol", "name": "Solin", "abbrev": "SOL", "country": "Croacia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "band_h", "kit_b": Color("f5c518"), "crest": "banner", "rating": 73},
	{"id": "cro_bsk", "name": "BSK Bijelo Brdo", "abbrev": "BSK", "country": "Croacia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "halved", "rating": 72},
	{"id": "cro_jar", "name": "Jarun", "abbrev": "JAR", "country": "Croacia", "div": 2,
		"kit": Color("1668c4"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "cro_opa", "name": "Opatija", "abbrev": "OPA", "country": "Croacia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 71},
	{"id": "cro_bje", "name": "Bjelovar", "abbrev": "BJE", "country": "Croacia", "div": 2,
		"kit": Color("1d4fa2"), "kit2": Color("f2c200"), "crest": "diamond", "rating": 71},

	{"id": "cro_mar", "name": "Marsonia", "abbrev": "MAR", "country": "Croacia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "banner", "rating": 64},
	{"id": "cro_seg", "name": "Segesta", "abbrev": "SEG", "country": "Croacia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 64},
	{"id": "cro_kus", "name": "Kustošija", "abbrev": "KUS", "country": "Croacia", "div": 3,
		"kit": Color("b0903d"), "kit2": Color("14161a"), "crest": "diamond", "rating": 63},
	{"id": "cro_bel", "name": "Belišće", "abbrev": "BEL", "country": "Croacia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "halved", "rating": 63},
	{"id": "cro_vin", "name": "Vinogradar", "abbrev": "VIN", "country": "Croacia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "cro_spo", "name": "Slavonija Požega", "abbrev": "SPO", "country": "Croacia", "div": 3,
		"kit": Color("1f5aae"), "kit2": Color("ffffff"), "crest": "round", "rating": 62},
	{"id": "cro_jun", "name": "Junak Sinj", "abbrev": "JUN", "country": "Croacia", "div": 3,
		"kit": Color("1d4b9c"), "kit2": Color("ffffff"), "crest": "shield", "rating": 62},
	{"id": "cro_pom", "name": "Pomorac 1921", "abbrev": "POM", "country": "Croacia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "banner", "rating": 61},
	{"id": "cro_ner", "name": "Neretva", "abbrev": "NER", "country": "Croacia", "div": 3,
		"kit": Color("1e7fbd"), "kit2": Color("ffffff"), "crest": "halved", "rating": 61},
	{"id": "cro_zri", "name": "Zrinski Jurjevac", "abbrev": "ZRI", "country": "Croacia", "div": 3,
		"kit": Color("8d1b28"), "kit2": Color("ffffff"), "crest": "shield", "rating": 60},

	{"id": "srb_czv", "name": "Crvena zvezda", "abbrev": "CZV", "country": "Serbia", "div": 1,
		"kit": Color("d20a11"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "halved", "emblem": "star", "rim": "dark", "rating": 88},
	{"id": "srb_par", "name": "Partizan", "abbrev": "PAR", "country": "Serbia", "div": 1,
		"kit": Color("121212"), "kit2": Color("f2f2f2"), "pattern": "stripes", "kit_b": Color("f2f2f2"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "srb_voj", "name": "Vojvodina", "abbrev": "VOJ", "country": "Serbia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "pattern": "band_v", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "srb_cuk", "name": "Čukarički", "abbrev": "CUK", "country": "Serbia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1c1c1c"), "crest": "diamond", "rating": 85},
	{"id": "srb_tsc", "name": "TSC Bačka Topola", "abbrev": "TSC", "country": "Serbia", "div": 1,
		"kit": Color("1a4fa0"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "banner", "rating": 85},
	{"id": "srb_rkg", "name": "Radnički 1923", "abbrev": "RKG", "country": "Serbia", "div": 1,
		"kit": Color("b01e28"), "kit2": Color("ffffff"), "crest": "round", "rating": 84},
	{"id": "srb_rni", "name": "Radnički Niš", "abbrev": "RNI", "country": "Serbia", "div": 1,
		"kit": Color("cc2229"), "kit2": Color("ffffff"), "crest": "shield", "rating": 84},
	{"id": "srb_spa", "name": "Spartak Subotica", "abbrev": "SPA", "country": "Serbia", "div": 1,
		"kit": Color("1b5fbe"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "star", "rating": 83},
	{"id": "srb_nap", "name": "Napredak", "abbrev": "NAP", "country": "Serbia", "div": 1,
		"kit": Color("d02b2b"), "kit2": Color("ffffff"), "crest": "round", "rating": 82},
	{"id": "srb_ofk", "name": "OFK Beograd", "abbrev": "OFK", "country": "Serbia", "div": 1,
		"kit": Color("1e4fa3"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 82},
	{"id": "srb_jav", "name": "Javor", "abbrev": "JAV", "country": "Serbia", "div": 1,
		"kit": Color("1f8a3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 82},
	{"id": "srb_mla", "name": "Mladost Lučani", "abbrev": "MLA", "country": "Serbia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a2340"), "crest": "diamond", "rating": 82},
	{"id": "srb_imt", "name": "IMT", "abbrev": "IMT", "country": "Serbia", "div": 1,
		"kit": Color("c2202a"), "kit2": Color("f0f0f0"), "crest": "banner", "rating": 81},
	{"id": "srb_npz", "name": "Novi Pazar", "abbrev": "NPZ", "country": "Serbia", "div": 1,
		"kit": Color("1b3fa0"), "kit2": Color("ffffff"), "crest": "halved", "rating": 81},
	{"id": "srb_rsu", "name": "Radnik Surdulica", "abbrev": "RSU", "country": "Serbia", "div": 1,
		"kit": Color("b81c22"), "kit2": Color("111111"), "crest": "shield", "rating": 80},
	{"id": "srb_zpa", "name": "Železničar Pančevo", "abbrev": "ZPA", "country": "Serbia", "div": 1,
		"kit": Color("1350a8"), "kit2": Color("ffffff"), "crest": "round", "rating": 80},
	{"id": "srb_jub", "name": "Jedinstvo Ub", "abbrev": "JUB", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 79},
	{"id": "srb_met", "name": "Metalac", "abbrev": "MET", "country": "Serbia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 79},

	{"id": "srb_rad", "name": "Rad", "abbrev": "RAD", "country": "Serbia", "div": 2,
		"kit": Color("1a3f9e"), "kit2": Color("ffffff"), "crest": "shield", "rating": 77},
	{"id": "srb_voz", "name": "Voždovac", "abbrev": "VOZ", "country": "Serbia", "div": 2,
		"kit": Color("c8202a"), "kit2": Color("ffffff"), "crest": "halved", "rating": 77},
	{"id": "srb_bor", "name": "Borac Čačak", "abbrev": "BOR", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 76},
	{"id": "srb_gra", "name": "Grafičar", "abbrev": "GRA", "country": "Serbia", "div": 2,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "banner", "rating": 76},
	{"id": "srb_mac", "name": "Mačva Šabac", "abbrev": "MAC", "country": "Serbia", "div": 2,
		"kit": Color("141414"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 75},
	{"id": "srb_ind", "name": "Inđija", "abbrev": "IND", "country": "Serbia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "halved", "rating": 75},
	{"id": "srb_kol", "name": "Kolubara", "abbrev": "KOL", "country": "Serbia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "round", "rating": 74},
	{"id": "srb_zem", "name": "Zemun", "abbrev": "ZEM", "country": "Serbia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "diamond", "rating": 74},
	{"id": "srb_slu", "name": "Sloboda Užice", "abbrev": "SLU", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 73},
	{"id": "srb_dub", "name": "Dubočica", "abbrev": "DUB", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 73},

	{"id": "srb_pro", "name": "Proleter Novi Sad", "abbrev": "PRO", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 66},
	{"id": "srb_tek", "name": "Tekstilac Odžaci", "abbrev": "TEK", "country": "Serbia", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 66},
	{"id": "srb_slk", "name": "Sloga Kraljevo", "abbrev": "SLK", "country": "Serbia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 65},
	{"id": "srb_jag", "name": "Jagodina", "abbrev": "JAG", "country": "Serbia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 65},
	{"id": "srb_bez", "name": "Bežanija", "abbrev": "BEZ", "country": "Serbia", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "halved", "rating": 64},
	{"id": "srb_sin", "name": "Sinđelić Beograd", "abbrev": "SIN", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 64},
	{"id": "srb_zbg", "name": "Železničar Beograd", "abbrev": "ZBG", "country": "Serbia", "div": 3,
		"kit": Color("1259ad"), "kit2": Color("ffffff"), "crest": "round", "rating": 64},
	{"id": "srb_tim", "name": "Timok", "abbrev": "TIM", "country": "Serbia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 63},
	{"id": "srb_bud", "name": "Budućnost Dobanovci", "abbrev": "BUD", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 63},
	{"id": "srb_rpi", "name": "Radnički Pirot", "abbrev": "RPI", "country": "Serbia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 62},

	{"id": "den_fck", "name": "FC Copenhague", "abbrev": "FCK", "country": "Dinamarca", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("12306e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 88},
	{"id": "den_fcm", "name": "FC Midtjylland", "abbrev": "FCM", "country": "Dinamarca", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "den_bif", "name": "Brøndby", "abbrev": "BIF", "country": "Dinamarca", "div": 1,
		"kit": Color("ffd700"), "kit2": Color("0a2f7a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "den_agf", "name": "AGF Aarhus", "abbrev": "AGF", "country": "Dinamarca", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "den_fcn", "name": "FC Nordsjælland", "abbrev": "FCN", "country": "Dinamarca", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 85},
	{"id": "den_sif", "name": "Silkeborg IF", "abbrev": "SIF", "country": "Dinamarca", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 84},
	{"id": "den_rfc", "name": "Randers FC", "abbrev": "RFC", "country": "Dinamarca", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "shield", "rating": 83},
	{"id": "den_vff", "name": "Viborg FF", "abbrev": "VFF", "country": "Dinamarca", "div": 1,
		"kit": Color("00843d"), "kit2": Color("ffffff"), "crest": "banner", "rating": 83},
	{"id": "den_ob", "name": "Odense Boldklub", "abbrev": "OB", "country": "Dinamarca", "div": 1,
		"kit": Color("1a4fa0"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 82},
	{"id": "den_aab", "name": "AaB Aalborg", "abbrev": "AAB", "country": "Dinamarca", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 80},
	{"id": "den_lyn", "name": "Lyngby", "abbrev": "LBK", "country": "Dinamarca", "div": 2,
		"kit": Color("0d47a1"), "kit2": Color("ffffff"), "crest": "star", "rating": 80},
	{"id": "den_vbk", "name": "Vejle", "abbrev": "VBK", "country": "Dinamarca", "div": 1,
		"kit": Color("cc0000"), "kit2": Color("ffffff"), "crest": "halved", "rating": 81},
	{"id": "den_sje", "name": "Sønderjyske", "abbrev": "SJE", "country": "Dinamarca", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 81},
	{"id": "den_fcf", "name": "FC Fredericia", "abbrev": "FCF", "country": "Dinamarca", "div": 1,
		"kit": Color("c62828"), "kit2": Color("1a1a1a"), "crest": "round", "rating": 80},
	{"id": "den_hvi", "name": "Hvidovre IF", "abbrev": "HVI", "country": "Dinamarca", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 79},
	{"id": "den_efb", "name": "Esbjerg fB", "abbrev": "EFB", "country": "Dinamarca", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 79},
	{"id": "den_hbk", "name": "HB Køge", "abbrev": "HBK", "country": "Dinamarca", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 79},
	{"id": "den_hik", "name": "Hobro IK", "abbrev": "HIK", "country": "Dinamarca", "div": 2,
		"kit": Color("f7c948"), "kit2": Color("17408b"), "crest": "star", "rating": 79},

	{"id": "den_ven", "name": "Vendsyssel FF", "abbrev": "VEN", "country": "Dinamarca", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 76},
	{"id": "den_hor", "name": "AC Horsens", "abbrev": "ACH", "country": "Dinamarca", "div": 2,
		"kit": Color("f2c200"), "kit2": Color("1a1a1a"), "crest": "round", "rating": 76},
	{"id": "den_fam", "name": "Fremad Amager", "abbrev": "FAM", "country": "Dinamarca", "div": 2,
		"kit": Color("1b4f9c"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 75},
	{"id": "den_kif", "name": "Kolding IF", "abbrev": "KIF", "country": "Dinamarca", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 75},
	{"id": "den_hil", "name": "Hillerød Fodbold", "abbrev": "HIF", "country": "Dinamarca", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "banner", "rating": 74},
	{"id": "den_nyk", "name": "Nykøbing FC", "abbrev": "NFC", "country": "Dinamarca", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "star", "rating": 74},
	{"id": "den_nas", "name": "Næstved BK", "abbrev": "NBK", "country": "Dinamarca", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 73},
	{"id": "den_aaf", "name": "Aarhus Fremad", "abbrev": "AAF", "country": "Dinamarca", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "diamond", "rating": 73},
	{"id": "den_bra", "name": "Brabrand IF", "abbrev": "BRA", "country": "Dinamarca", "div": 2,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 72},
	{"id": "den_mid", "name": "Middelfart BK", "abbrev": "MBK", "country": "Dinamarca", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 72},

	{"id": "den_kb", "name": "KB", "abbrev": "KB", "country": "Dinamarca", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "shield", "rating": 65},
	{"id": "den_ab", "name": "Akademisk Boldklub", "abbrev": "AB", "country": "Dinamarca", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 65},
	{"id": "den_frem", "name": "Frem", "abbrev": "FRE", "country": "Dinamarca", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("0a2340"), "crest": "diamond", "rating": 64},
	{"id": "den_b93", "name": "B 93", "abbrev": "BOL", "country": "Dinamarca", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("1b3f94"), "crest": "halved", "rating": 64},
	{"id": "den_van", "name": "Vanløse IF", "abbrev": "VAN", "country": "Dinamarca", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "star", "rating": 63},
	{"id": "den_hol", "name": "Holbæk B&I", "abbrev": "HOL", "country": "Dinamarca", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 63},
	{"id": "den_ski", "name": "Skive IK", "abbrev": "SKI", "country": "Dinamarca", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 63},
	{"id": "den_thi", "name": "Thisted FC", "abbrev": "THI", "country": "Dinamarca", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 62},
	{"id": "den_jam", "name": "Jammerbugt FC", "abbrev": "JAM", "country": "Dinamarca", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "den_ava", "name": "Avarta", "abbrev": "AVA", "country": "Dinamarca", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 61},

	{"id": "nor_gli", "name": "Bodø/Glimt", "abbrev": "GLI", "country": "Noruega", "div": 1,
		"kit": Color("ffd800"), "kit2": Color("1a1a1a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 88},
	{"id": "nor_vik", "name": "Viking", "abbrev": "VIK", "country": "Noruega", "div": 1,
		"kit": Color("00205b"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 87},
	{"id": "nor_rbk", "name": "Rosenborg", "abbrev": "RBK", "country": "Noruega", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 86},
	{"id": "nor_mol", "name": "Molde", "abbrev": "MOL", "country": "Noruega", "div": 1,
		"kit": Color("0a4ea2"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "nor_bra", "name": "Brann", "abbrev": "BRA", "country": "Noruega", "div": 1,
		"kit": Color("d31820"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "nor_lsk", "name": "Lillestrøm", "abbrev": "LSK", "country": "Noruega", "div": 1,
		"kit": Color("f5d400"), "kit2": Color("1a1a1a"), "crest": "shield", "rating": 84},
	{"id": "nor_val", "name": "Vålerenga", "abbrev": "VAL", "country": "Noruega", "div": 1,
		"kit": Color("17408b"), "kit2": Color("ffffff"), "crest": "halved", "rating": 84},
	{"id": "nor_ffk", "name": "Fredrikstad", "abbrev": "FFK", "country": "Noruega", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "star", "rating": 83},
	{"id": "nor_til", "name": "Tromsø", "abbrev": "TIL", "country": "Noruega", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 83},
	{"id": "nor_srp", "name": "Sarpsborg 08", "abbrev": "SRP", "country": "Noruega", "div": 1,
		"kit": Color("003d7c"), "kit2": Color("ffffff"), "crest": "shield", "rating": 82},
	{"id": "nor_kbk", "name": "Kristiansund", "abbrev": "KBK", "country": "Noruega", "div": 1,
		"kit": Color("004c97"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 82},
	{"id": "nor_sif", "name": "Strømsgodset", "abbrev": "SIF", "country": "Noruega", "div": 2,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 80},
	{"id": "nor_aaf", "name": "Aalesund", "abbrev": "AAF", "country": "Noruega", "div": 1,
		"kit": Color("f26522"), "kit2": Color("00348a"), "crest": "star", "rating": 82},
	{"id": "nor_sta", "name": "Start", "abbrev": "STA", "country": "Noruega", "div": 1,
		"kit": Color("ffd200"), "kit2": Color("1a1a1a"), "crest": "shield", "rating": 81},
	{"id": "nor_sfj", "name": "Sandefjord", "abbrev": "SFJ", "country": "Noruega", "div": 1,
		"kit": Color("1f5fbf"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 81},
	{"id": "nor_fkh", "name": "Haugesund", "abbrev": "FKH", "country": "Noruega", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "crest": "banner", "rating": 80},
	{"id": "nor_ham", "name": "HamKam", "abbrev": "HAM", "country": "Noruega", "div": 1,
		"kit": Color("1e7a3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 79},
	{"id": "nor_kfu", "name": "KFUM Oslo", "abbrev": "KFU", "country": "Noruega", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("1a3a6b"), "crest": "diamond", "rating": 79},

	{"id": "nor_odd", "name": "Odd", "abbrev": "ODD", "country": "Noruega", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "halved", "rating": 77},
	{"id": "nor_stb", "name": "Stabæk", "abbrev": "STB", "country": "Noruega", "div": 2,
		"kit": Color("1e5aa8"), "kit2": Color("14318f"), "crest": "round", "rating": 77},
	{"id": "nor_lyn", "name": "Lyn", "abbrev": "LYN", "country": "Noruega", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "band_v", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 76},
	{"id": "nor_sog", "name": "Sogndal", "abbrev": "SOG", "country": "Noruega", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner", "rating": 76},
	{"id": "nor_bry", "name": "Bryne", "abbrev": "BRY", "country": "Noruega", "div": 2,
		"kit": Color("d21f26"), "kit2": Color("ffffff"), "crest": "banner", "rating": 75},
	{"id": "nor_sul", "name": "Sandnes Ulf", "abbrev": "SUL", "country": "Noruega", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 75},
	{"id": "nor_ran", "name": "Ranheim", "abbrev": "RAN", "country": "Noruega", "div": 2,
		"kit": Color("134c9b"), "kit2": Color("ffffff"), "crest": "round", "rating": 74},
	{"id": "nor_rau", "name": "Raufoss", "abbrev": "RAU", "country": "Noruega", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 74},
	{"id": "nor_asa", "name": "Åsane", "abbrev": "ASA", "country": "Noruega", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "star", "rating": 73},
	{"id": "nor_kil", "name": "Kongsvinger", "abbrev": "KIL", "country": "Noruega", "div": 2,
		"kit": Color("d61b1b"), "kit2": Color("ffffff"), "crest": "banner", "rating": 73},

	{"id": "nor_mos", "name": "Moss", "abbrev": "MOS", "country": "Noruega", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "sleeves", "kit_b": Color("14161a"), "crest": "star", "rating": 66},
	{"id": "nor_hod", "name": "Hødd", "abbrev": "HOD", "country": "Noruega", "div": 3,
		"kit": Color("1a4f9c"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 66},
	{"id": "nor_eik", "name": "Egersund", "abbrev": "EIK", "country": "Noruega", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 65},
	{"id": "nor_skd", "name": "Skeid", "abbrev": "SKD", "country": "Noruega", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "shield", "rating": 65},
	{"id": "nor_mif", "name": "Mjøndalen", "abbrev": "MIF", "country": "Noruega", "div": 3,
		"kit": Color("833c12"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "nor_str", "name": "Strømmen", "abbrev": "STR", "country": "Noruega", "div": 3,
		"kit": Color("9a9aa4"), "kit2": Color("c8102e"), "crest": "round", "rating": 64},
	{"id": "nor_jer", "name": "Jerv", "abbrev": "JER", "country": "Noruega", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "halved", "rating": 64},
	{"id": "nor_uki", "name": "Ull/Kisa", "abbrev": "UKI", "country": "Noruega", "div": 3,
		"kit": Color("f2c200"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 63},
	{"id": "nor_not", "name": "Notodden", "abbrev": "NOT", "country": "Noruega", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 63},
	{"id": "nor_lev", "name": "Levanger", "abbrev": "LEV", "country": "Noruega", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 62},

	{"id": "jpn_vis", "name": "Vissel Kobe", "abbrev": "VIS", "country": "Japón", "div": 1,
		"kit": Color("9d1a2f"), "kit2": Color("141414"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 90},
	{"id": "jpn_kas", "name": "Kashima Antlers", "abbrev": "KSM", "country": "Japón", "div": 1,
		"kit": Color("b4131e"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 89},
	{"id": "jpn_kaw", "name": "Kawasaki Frontale", "abbrev": "KAW", "country": "Japón", "div": 1,
		"kit": Color("2ea3e0"), "kit2": Color("0f0f0f"), "pattern": "stripes", "kit_b": Color("0f0f0f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "jpn_ura", "name": "Urawa Red Diamonds", "abbrev": "URA", "country": "Japón", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "jpn_yfm", "name": "Yokohama F. Marinos", "abbrev": "YFM", "country": "Japón", "div": 1,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 88},
	{"id": "jpn_san", "name": "Sanfrecce Hiroshima", "abbrev": "SAN", "country": "Japón", "div": 1,
		"kit": Color("5b2d8e"), "kit2": Color("f2f2f2"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 87},
	{"id": "jpn_gam", "name": "Gamba Osaka", "abbrev": "GAM", "country": "Japón", "div": 1,
		"kit": Color("1d3fa0"), "kit2": Color("0d0d0d"), "pattern": "stripes", "kit_b": Color("0d0d0d"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "jpn_fct", "name": "FC Tokyo", "abbrev": "FCT", "country": "Japón", "div": 1,
		"kit": Color("1a3d8f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "jpn_mac", "name": "Machida Zelvia", "abbrev": "MAC", "country": "Japón", "div": 1,
		"kit": Color("13275e"), "kit2": Color("0a2340"), "crest": "banner", "rating": 85},
	{"id": "jpn_cer", "name": "Cerezo Osaka", "abbrev": "CER", "country": "Japón", "div": 1,
		"kit": Color("e2648f"), "kit2": Color("0f1c3f"), "crest": "round", "rating": 85},
	{"id": "jpn_nag", "name": "Nagoya Grampus", "abbrev": "NAG", "country": "Japón", "div": 1,
		"kit": Color("d0021b"), "kit2": Color("c8102e"), "crest": "banner", "rating": 85},
	{"id": "jpn_rey", "name": "Kashiwa Reysol", "abbrev": "REY", "country": "Japón", "div": 1,
		"kit": Color("f5d000"), "kit2": Color("141414"), "crest": "halved", "rating": 84},
	{"id": "jpn_kyo", "name": "Kyoto Sanga", "abbrev": "KYO", "country": "Japón", "div": 1,
		"kit": Color("4b2a86"), "kit2": Color("e0e0e0"), "crest": "star", "rating": 83},
	{"id": "jpn_avi", "name": "Avispa Fukuoka", "abbrev": "AVI", "country": "Japón", "div": 1,
		"kit": Color("16265e"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("7fb9e8"), "crest": "shield", "rating": 82},
	{"id": "jpn_ver", "name": "Tokyo Verdy", "abbrev": "VER", "country": "Japón", "div": 1,
		"kit": Color("0b7a3b"), "kit2": Color("ffffff"), "crest": "star", "rating": 82},
	{"id": "jpn_spu", "name": "Shimizu S-Pulse", "abbrev": "SPU", "country": "Japón", "div": 1,
		"kit": Color("f47b20"), "kit2": Color("141414"), "crest": "round", "rating": 82},
	{"id": "jpn_alb", "name": "Albirex Niigata", "abbrev": "ALB", "country": "Japón", "div": 2,
		"kit": Color("f26522"), "kit2": Color("1a2a6c"), "pattern": "stripes", "kit_b": Color("1a2a6c"), "crest": "round", "rating": 80},
	{"id": "jpn_sho", "name": "Shonan Bellmare", "abbrev": "SHO", "country": "Japón", "div": 2,
		"kit": Color("16a34a"), "kit2": Color("1b3a8f"), "crest": "diamond", "rating": 80},

	{"id": "jpn_oka", "name": "Fagiano Okayama", "abbrev": "OKA", "country": "Japón", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "rooster", "rim": "dark", "rating": 80},

	{"id": "jpn_sag", "name": "Sagan Tosu", "abbrev": "TOS", "country": "Japón", "div": 2,
		"kit": Color("1ca2d0"), "kit2": Color("1ca2d0"), "crest": "halved", "rating": 78},
	{"id": "jpn_yfc", "name": "Yokohama FC", "abbrev": "YFC", "country": "Japón", "div": 2,
		"kit": Color("1f8fd6"), "kit2": Color("0d1f4a"), "crest": "banner", "rating": 78},
	{"id": "jpn_con", "name": "Consadole Sapporo", "abbrev": "CON", "country": "Japón", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("141414"), "pattern": "stripes", "kit_b": Color("141414"), "crest": "shield", "rating": 77},
	{"id": "jpn_jub", "name": "Jubilo Iwata", "abbrev": "JUB", "country": "Japón", "div": 2,
		"kit": Color("4fb3e8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 77},
	{"id": "jpn_jef", "name": "JEF United Chiba", "abbrev": "JEF", "country": "Japón", "div": 1,
		"kit": Color("f2d022"), "kit2": Color("0f6b3f"), "crest": "halved", "rating": 80},
	{"id": "jpn_vva", "name": "V-Varen Nagasaki", "abbrev": "VVN", "country": "Japón", "div": 1,
		"kit": Color("1b4fa0"), "kit2": Color("f07d1a"), "crest": "diamond", "rating": 80},
	{"id": "jpn_veg", "name": "Vegalta Sendai", "abbrev": "VEG", "country": "Japón", "div": 2,
		"kit": Color("e0a91b"), "kit2": Color("1a3f8c"), "crest": "star", "rating": 75},
	{"id": "jpn_ven", "name": "Ventforet Kofu", "abbrev": "VEN", "country": "Japón", "div": 2,
		"kit": Color("1b3f9c"), "kit2": Color("1b3f9c"), "crest": "round", "rating": 75},
	{"id": "jpn_mon", "name": "Montedio Yamagata", "abbrev": "MON", "country": "Japón", "div": 2,
		"kit": Color("12428f"), "kit2": Color("e8e8e8"), "crest": "diamond", "rating": 74},
	{"id": "jpn_omi", "name": "Omiya Ardija", "abbrev": "OMI", "country": "Japón", "div": 2,
		"kit": Color("f26522"), "kit2": Color("0d2a6b"), "crest": "shield", "rating": 74},

	{"id": "jpn_mya", "name": "Matsumoto Yamaga", "abbrev": "MYA", "country": "Japón", "div": 3,
		"kit": Color("0f6b3a"), "kit2": Color("f2f2f2"), "crest": "round", "rating": 67},
	{"id": "jpn_tochi", "name": "Tochigi SC", "abbrev": "TOC", "country": "Japón", "div": 3,
		"kit": Color("f5c400"), "kit2": Color("0a2a5e"), "crest": "shield", "rating": 67},
	{"id": "jpn_ryu", "name": "FC Ryukyu", "abbrev": "RYU", "country": "Japón", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "halved", "rating": 66},
	{"id": "jpn_zwe", "name": "Zweigen Kanazawa", "abbrev": "ZWE", "country": "Japón", "div": 3,
		"kit": Color("c0182c"), "kit2": Color("141414"), "pattern": "stripes", "kit_b": Color("141414"), "crest": "diamond", "rating": 66},
	{"id": "jpn_nap", "name": "AC Nagano Parceiro", "abbrev": "NAP", "country": "Japón", "div": 3,
		"kit": Color("e8620d"), "kit2": Color("0f2a5e"), "crest": "banner", "rating": 65},
	{"id": "jpn_kag", "name": "Kagoshima United", "abbrev": "KAG", "country": "Japón", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "banner", "rating": 65},
	{"id": "jpn_gif", "name": "FC Gifu", "abbrev": "GIF", "country": "Japón", "div": 3,
		"kit": Color("0f7a3d"), "kit2": Color("ffffff"), "crest": "halved", "rating": 65},
	{"id": "jpn_gir", "name": "Giravanz Kitakyushu", "abbrev": "GIR", "country": "Japón", "div": 3,
		"kit": Color("f5c000"), "kit2": Color("c8102e"), "crest": "shield", "rating": 64},
	{"id": "jpn_gai", "name": "Gainare Tottori", "abbrev": "GAI", "country": "Japón", "div": 3,
		"kit": Color("0d8a4f"), "kit2": Color("141414"), "crest": "star", "rating": 64},
	{"id": "jpn_kam", "name": "Kamatamare Sanuki", "abbrev": "KAM", "country": "Japón", "div": 3,
		"kit": Color("3aaee8"), "kit2": Color("0a2340"), "crest": "star", "rating": 63},

	{"id": "kor_uls", "name": "Ulsan HD", "abbrev": "ULS", "country": "Corea del Sur", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 88},
	{"id": "kor_jbk", "name": "Jeonbuk Hyundai Motors", "abbrev": "JBK", "country": "Corea del Sur", "div": 1,
		"kit": Color("00693e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "kor_poh", "name": "Pohang Steelers", "abbrev": "POH", "country": "Corea del Sur", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 86},
	{"id": "kor_sel", "name": "FC Seoul", "abbrev": "SEL", "country": "Corea del Sur", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("000000"), "pattern": "stripes", "kit_b": Color("000000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "kor_suw", "name": "Suwon Samsung Bluewings", "abbrev": "SUW", "country": "Corea del Sur", "div": 2,
		"kit": Color("1a4fa3"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "kor_inc", "name": "Incheon United", "abbrev": "INC", "country": "Corea del Sur", "div": 1,
		"kit": Color("0b1f3a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("2e6ecb"), "crest": "halved", "rating": 82},
	{"id": "kor_dae", "name": "Daegu FC", "abbrev": "DAE", "country": "Corea del Sur", "div": 2,
		"kit": Color("5bc2e7"), "kit2": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "kor_gan", "name": "Gangwon FC", "abbrev": "GAN", "country": "Corea del Sur", "div": 1,
		"kit": Color("ff6a13"), "kit2": Color("1b1b1b"), "crest": "round", "rating": 85},
	{"id": "kor_gwj", "name": "Gwangju FC", "abbrev": "GWJ", "country": "Corea del Sur", "div": 1,
		"kit": Color("ffd100"), "kit2": Color("8b1a2b"), "crest": "diamond", "rating": 85},
	{"id": "kor_jej", "name": "Jeju United", "abbrev": "JEJ", "country": "Corea del Sur", "div": 1,
		"kit": Color("f36f21"), "kit2": Color("000000"), "crest": "star", "rating": 83},
	{"id": "kor_swf", "name": "Suwon FC", "abbrev": "SWF", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "banner", "rating": 80},
	{"id": "kor_djn", "name": "Daejeon Hana Citizen", "abbrev": "DJN", "country": "Corea del Sur", "div": 1,
		"kit": Color("5f259f"), "kit2": Color("ffffff"), "crest": "halved", "rating": 84},
	{"id": "kor_gim", "name": "Gimcheon Sangmu", "abbrev": "GIM", "country": "Corea del Sur", "div": 1,
		"kit": Color("d81e05"), "kit2": Color("14161a"), "crest": "shield", "rating": 85},
	{"id": "kor_any", "name": "FC Anyang", "abbrev": "ANY", "country": "Corea del Sur", "div": 1,
		"kit": Color("6d2077"), "kit2": Color("14161a"), "crest": "round", "rating": 81},
	{"id": "kor_seg", "name": "Seongnam FC", "abbrev": "SEG", "country": "Corea del Sur", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 80},
	{"id": "kor_bus", "name": "Busan IPark", "abbrev": "BUS", "country": "Corea del Sur", "div": 2,
		"kit": Color("e03c31"), "kit2": Color("ffffff"), "crest": "star", "rating": 80},
	{"id": "kor_jnd", "name": "Jeonnam Dragons", "abbrev": "JND", "country": "Corea del Sur", "div": 2,
		"kit": Color("ffcd00"), "kit2": Color("000000"), "pattern": "stripes", "kit_b": Color("000000"), "crest": "banner", "rating": 79},
	{"id": "kor_buc", "name": "Bucheon FC 1995", "abbrev": "BUC", "country": "Corea del Sur", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "halved", "rating": 79},

	{"id": "kor_gyn", "name": "Gyeongnam FC", "abbrev": "GYN", "country": "Corea del Sur", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 76},
	{"id": "kor_asa", "name": "Chungnam Asan", "abbrev": "ASA", "country": "Corea del Sur", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 75},
	{"id": "kor_ans", "name": "Ansan Greeners", "abbrev": "ANS", "country": "Corea del Sur", "div": 2,
		"kit": Color("1f7a3f"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 74},
	{"id": "kor_chn", "name": "Cheonan City", "abbrev": "CHN", "country": "Corea del Sur", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("14161a"), "crest": "star", "rating": 74},
	{"id": "kor_eld", "name": "Seoul E-Land", "abbrev": "ELD", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "banner", "rating": 76},
	{"id": "kor_gpo", "name": "Gimpo FC", "abbrev": "GPO", "country": "Corea del Sur", "div": 2,
		"kit": Color("e8b100"), "kit2": Color("1b1b1b"), "crest": "halved", "rating": 75},
	{"id": "kor_cju", "name": "Chungbuk Cheongju", "abbrev": "CJU", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "shield", "rating": 73},
	{"id": "kor_hwa", "name": "Hwaseong FC", "abbrev": "HWA", "country": "Corea del Sur", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "round", "rating": 73},
	{"id": "kor_ghe", "name": "Gimhae FC", "abbrev": "GHE", "country": "Corea del Sur", "div": 2,
		"kit": Color("1f9c8f"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 72},
	{"id": "kor_sih", "name": "Siheung Citizen", "abbrev": "SIH", "country": "Corea del Sur", "div": 2,
		"kit": Color("2b6cb0"), "kit2": Color("0a2340"), "crest": "star", "rating": 72},

	{"id": "kor_gju", "name": "Gyeongju KHNP", "abbrev": "GJU", "country": "Corea del Sur", "div": 3,
		"kit": Color("0b6e4f"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 65},
	{"id": "kor_gng", "name": "Gangneung City", "abbrev": "GNG", "country": "Corea del Sur", "div": 3,
		"kit": Color("1d4e89"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 65},
	{"id": "kor_dkr", "name": "Daejeon Korail", "abbrev": "DKR", "country": "Corea del Sur", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 64},
	{"id": "kor_ulc", "name": "Ulsan Citizen", "abbrev": "ULC", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a3b8c"), "kit2": Color("14318f"), "crest": "round", "rating": 64},
	{"id": "kor_mok", "name": "Mokpo City", "abbrev": "MOK", "country": "Corea del Sur", "div": 3,
		"kit": Color("d94f97"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 63},
	{"id": "kor_paj", "name": "Paju Citizen", "abbrev": "PAJ", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "star", "rating": 63},
	{"id": "kor_yap", "name": "Yangpyeong FC", "abbrev": "YAP", "country": "Corea del Sur", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "banner", "rating": 63},
	{"id": "kor_poc", "name": "Pocheon Citizen", "abbrev": "POC", "country": "Corea del Sur", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "halved", "rating": 62},
	{"id": "kor_chw", "name": "Changwon City", "abbrev": "CHW", "country": "Corea del Sur", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 62},
	{"id": "kor_btc", "name": "Busan Transportation", "abbrev": "BTC", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 61},

	{"id": "col_nac", "name": "Atlético Nacional", "abbrev": "NAC", "country": "Colombia", "div": 1,
		"kit": Color("007a33"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 90},
	{"id": "col_mil", "name": "Millonarios", "abbrev": "MIL", "country": "Colombia", "div": 1,
		"kit": Color("0b3d91"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ball", "rim": "dark", "rating": 88},
	{"id": "col_ame", "name": "América de Cali", "abbrev": "AME", "country": "Colombia", "div": 1,
		"kit": Color("d81e1e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "trident", "rim": "dark", "rating": 87},
	{"id": "col_jun", "name": "Junior de Barranquilla", "abbrev": "JUN", "country": "Colombia", "div": 1,
		"kit": Color("d42027"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "col_dim", "name": "Independiente Medellín", "abbrev": "DIM", "country": "Colombia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "col_sfe", "name": "Santa Fe", "abbrev": "SFE", "country": "Colombia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "col_tol", "name": "Deportes Tolima", "abbrev": "TOL", "country": "Colombia", "div": 1,
		"kit": Color("7a1626"), "kit2": Color("f2c230"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "col_cali", "name": "Deportivo Cali", "abbrev": "CAL", "country": "Colombia", "div": 1,
		"kit": Color("00843d"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "col_buc", "name": "Atlético Bucaramanga", "abbrev": "BUC", "country": "Colombia", "div": 1,
		"kit": Color("f2c200"), "kit2": Color("007a33"), "crest": "shield", "rating": 85},
	{"id": "col_onc", "name": "Once Caldas", "abbrev": "ONC", "country": "Colombia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 84},
	{"id": "col_agu", "name": "Águilas Doradas", "abbrev": "AGD", "country": "Colombia", "div": 1,
		"kit": Color("c9992b"), "kit2": Color("14161a"), "crest": "star", "rating": 83},
	{"id": "col_per", "name": "Deportivo Pereira", "abbrev": "PER", "country": "Colombia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "shield", "rating": 83},
	{"id": "col_ali", "name": "Alianza", "abbrev": "ALI", "country": "Colombia", "div": 1,
		"kit": Color("f7d117"), "kit2": Color("111111"), "crest": "halved", "rating": 82},
	{"id": "col_for", "name": "Fortaleza CEIF", "abbrev": "FOR", "country": "Colombia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 81},
	{"id": "col_pas", "name": "Deportivo Pasto", "abbrev": "PAS", "country": "Colombia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "crest": "banner", "rating": 81},
	{"id": "col_equ", "name": "La Equidad", "abbrev": "EQU", "country": "Colombia", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 80},
	{"id": "col_env", "name": "Envigado", "abbrev": "ENV", "country": "Colombia", "div": 2,
		"kit": Color("f26a1b"), "kit2": Color("f26a1b"), "crest": "shield", "rating": 79},
	{"id": "col_uma", "name": "Unión Magdalena", "abbrev": "UMA", "country": "Colombia", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "banner", "rating": 79},

	{"id": "col_lla", "name": "Llaneros", "abbrev": "LLA", "country": "Colombia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 79},
	{"id": "col_chi", "name": "Boyacá Chicó", "abbrev": "CHI", "country": "Colombia", "div": 1,
		"kit": Color("1046a0"), "kit2": Color("ffffff"), "pattern": "checkers", "kit_b": Color("ffffff"), "crest": "halved", "rating": 78},
	{"id": "col_cuc", "name": "Cúcuta Deportivo", "abbrev": "CUC", "country": "Colombia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "shield", "rating": 79},
	{"id": "col_hui", "name": "Atlético Huila", "abbrev": "HUI", "country": "Colombia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 75},
	{"id": "col_pat", "name": "Patriotas Boyacá", "abbrev": "PAT", "country": "Colombia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 74},
	{"id": "col_jag", "name": "Jaguares de Córdoba", "abbrev": "JAG", "country": "Colombia", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "diamond", "rating": 78},
	{"id": "col_car", "name": "Real Cartagena", "abbrev": "CAR", "country": "Colombia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "shield", "rating": 73},
	{"id": "col_qui", "name": "Deportes Quindío", "abbrev": "QUI", "country": "Colombia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "chevron", "kit_b": Color("f5c518"), "crest": "round", "rating": 73},
	{"id": "col_cun", "name": "Real Cundinamarca", "abbrev": "CUN", "country": "Colombia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 72},
	{"id": "col_leo", "name": "Leones", "abbrev": "LEO", "country": "Colombia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "star", "rating": 72},

	{"id": "col_cor", "name": "Cortuluá", "abbrev": "COR", "country": "Colombia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a7a3c"), "crest": "round", "rating": 67},
	{"id": "col_bqa", "name": "Barranquilla FC", "abbrev": "BQA", "country": "Colombia", "div": 3,
		"kit": Color("d42027"), "kit2": Color("ffffff"), "crest": "shield", "rating": 65},
	{"id": "col_bog", "name": "Bogotá FC", "abbrev": "BOG", "country": "Colombia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 64},
	{"id": "col_ors", "name": "Orsomarso", "abbrev": "ORS", "country": "Colombia", "div": 3,
		"kit": Color("3a7fd5"), "kit2": Color("ffffff"), "crest": "round", "rating": 64},
	{"id": "col_val", "name": "Valledupar FC", "abbrev": "VAL", "country": "Colombia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 63},
	{"id": "col_tig", "name": "Tigres FC", "abbrev": "TIG", "country": "Colombia", "div": 3,
		"kit": Color("f0b323"), "kit2": Color("121212"), "pattern": "stripes", "kit_b": Color("121212"), "crest": "star", "rating": 63},
	{"id": "col_atf", "name": "Atlético FC", "abbrev": "ATF", "country": "Colombia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 63},
	{"id": "col_int", "name": "Internacional de Bogotá", "abbrev": "INT", "country": "Colombia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("14161a"), "crest": "halved", "rating": 62},
	{"id": "col_pop", "name": "Universitario de Popayán", "abbrev": "UPO", "country": "Colombia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 62},
	{"id": "col_ant", "name": "Deportivo Antioquia", "abbrev": "ANT", "country": "Colombia", "div": 3,
		"kit": Color("0d7a3a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 61},

	{"id": "chi_col", "name": "Colo-Colo", "abbrev": "COL", "country": "Chile", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "none", "rim": "dark", "rating": 89},
	{"id": "chi_uch", "name": "Universidad de Chile", "abbrev": "UCH", "country": "Chile", "div": 1,
		"kit": Color("0a3d91"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "U", "rating": 88},
	{"id": "chi_uca", "name": "Universidad Católica", "abbrev": "UCA", "country": "Chile", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "band_h", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "cross", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "chi_pal", "name": "Palestino", "abbrev": "PAL", "country": "Chile", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "tri_stripes", "emblem": "none", "rim": "dark", "rating": 85},
	{"id": "chi_coq", "name": "Coquimbo Unido", "abbrev": "COQ", "country": "Chile", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "star", "rating": 85},
	{"id": "chi_hua", "name": "Huachipato", "abbrev": "HUA", "country": "Chile", "div": 1,
		"kit": Color("1a3d7c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "diamond", "rating": 85},
	{"id": "chi_ohg", "name": "O'Higgins", "abbrev": "OHG", "country": "Chile", "div": 1,
		"kit": Color("5aa9e6"), "kit2": Color("111111"), "crest": "round", "rating": 84},
	{"id": "chi_aud", "name": "Audax Italiano", "abbrev": "AUD", "country": "Chile", "div": 1,
		"kit": Color("0a7d3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 84},
	{"id": "chi_ues", "name": "Unión Española", "abbrev": "UES", "country": "Chile", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "chi_nub", "name": "Ñublense", "abbrev": "NUB", "country": "Chile", "div": 1,
		"kit": Color("d0202a"), "kit2": Color("ffffff"), "crest": "round", "rating": 83},
	{"id": "chi_cbs", "name": "Cobresal", "abbrev": "CBS", "country": "Chile", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f36f21"), "crest": "shield", "rating": 82},
	{"id": "chi_eve", "name": "Everton de Viña del Mar", "abbrev": "EVE", "country": "Chile", "div": 1,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "pattern": "band_h", "kit_b": Color("f5c518"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "chi_iqq", "name": "Deportes Iquique", "abbrev": "IQQ", "country": "Chile", "div": 2,
		"kit": Color("4aa8e0"), "kit2": Color("14161a"), "crest": "diamond", "rating": 80},
	{"id": "chi_cal", "name": "Unión La Calera", "abbrev": "CAL", "country": "Chile", "div": 1,
		"kit": Color("d21e2b"), "kit2": Color("d21e2b"), "crest": "halved", "rating": 82},
	{"id": "chi_ser", "name": "Deportes La Serena", "abbrev": "SER", "country": "Chile", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "banner", "rating": 81},
	{"id": "chi_cbl", "name": "Cobreloa", "abbrev": "CBL", "country": "Chile", "div": 2,
		"kit": Color("ff6a13"), "kit2": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "chi_lmc", "name": "Deportes Limache", "abbrev": "LMC", "country": "Chile", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "round", "rating": 79},
	{"id": "chi_mag", "name": "Magallanes", "abbrev": "MAG", "country": "Chile", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 79},

	{"id": "chi_swa", "name": "Santiago Wanderers", "abbrev": "SWA", "country": "Chile", "div": 2,
		"kit": Color("0a7d3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 76},
	{"id": "chi_tem", "name": "Deportes Temuco", "abbrev": "TEM", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("0a7a3c"), "crest": "diamond", "rating": 76},
	{"id": "chi_anf", "name": "Deportes Antofagasta", "abbrev": "ANF", "country": "Chile", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 75},
	{"id": "chi_rgt", "name": "Rangers de Talca", "abbrev": "RGT", "country": "Chile", "div": 2,
		"kit": Color("d0202a"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "shield", "rating": 75},
	{"id": "chi_cpo", "name": "Deportes Copiapó", "abbrev": "CPO", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 74},
	{"id": "chi_cur", "name": "Curicó Unido", "abbrev": "CUR", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sash_r", "kit_b": Color("c8102e"), "crest": "shield", "rating": 74},
	{"id": "chi_udc", "name": "Universidad de Concepción", "abbrev": "UDC", "country": "Chile", "div": 1,
		"kit": Color("f2c200"), "kit2": Color("1b3f8f"), "crest": "banner", "rating": 80},
	{"id": "chi_ari", "name": "San Marcos de Arica", "abbrev": "ARI", "country": "Chile", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("14318f"), "crest": "halved", "rating": 73},
	{"id": "chi_dco", "name": "Deportes Concepción", "abbrev": "DCO", "country": "Chile", "div": 1,
		"kit": Color("6a1b9a"), "kit2": Color("ffffff"), "crest": "round", "rating": 79},
	{"id": "chi_smo", "name": "Santiago Morning", "abbrev": "SMO", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "chevron", "kit_b": Color("14161a"), "crest": "halved", "rating": 72},

	{"id": "chi_pmo", "name": "Deportes Puerto Montt", "abbrev": "PMO", "country": "Chile", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "crest": "round", "rating": 65},
	{"id": "chi_slq", "name": "San Luis de Quillota", "abbrev": "SLQ", "country": "Chile", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 65},
	{"id": "chi_mel", "name": "Deportes Melipilla", "abbrev": "MEL", "country": "Chile", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 64},
	{"id": "chi_bnc", "name": "Barnechea", "abbrev": "BNC", "country": "Chile", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "diamond", "rating": 64},
	{"id": "chi_rec", "name": "Deportes Recoleta", "abbrev": "REC", "country": "Chile", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "crest": "halved", "rating": 63},
	{"id": "chi_fvl", "name": "Fernández Vial", "abbrev": "FVL", "country": "Chile", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "chi_oso", "name": "Provincial Osorno", "abbrev": "OSO", "country": "Chile", "div": 3,
		"kit": Color("15559c"), "kit2": Color("ffffff"), "crest": "banner", "rating": 63},
	{"id": "chi_ibe", "name": "Iberia", "abbrev": "IBE", "country": "Chile", "div": 3,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 62},
	{"id": "chi_val", "name": "Deportes Valdivia", "abbrev": "VAL", "country": "Chile", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "star", "rating": 62},
	{"id": "chi_gve", "name": "General Velásquez", "abbrev": "GVE", "country": "Chile", "div": 3,
		"kit": Color("14532d"), "kit2": Color("14532d"), "crest": "round", "rating": 61},

	{"id": "uru_pen", "name": "Peñarol", "abbrev": "PEN", "country": "Uruguay", "div": 1,
		"kit": Color("ffcc00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 91},
	{"id": "uru_nac", "name": "Nacional de Montevideo", "abbrev": "NAC", "country": "Uruguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1b3a8c"),
		"shape": "round", "crest_pattern": "tri_stripes", "emblem": "monogram", "rim": "dark", "letter": "N", "rating": 91},
	{"id": "uru_def", "name": "Defensor Sporting", "abbrev": "DEF", "country": "Uruguay", "div": 1,
		"kit": Color("5b2d8e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "uru_liv", "name": "Liverpool de Montevideo", "abbrev": "LIV", "country": "Uruguay", "div": 1,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("1f4fa0"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 84},
	{"id": "uru_dan", "name": "Danubio", "abbrev": "DAN", "country": "Uruguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "sash", "kit_b": Color("111111"), "crest": "round", "rating": 83},
	{"id": "uru_wan", "name": "Montevideo Wanderers", "abbrev": "WAN", "country": "Uruguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1a1a1a"), "pattern": "stripes", "kit_b": Color("1a1a1a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 82},
	{"id": "uru_tor", "name": "Montevideo City Torque", "abbrev": "TOR", "country": "Uruguay", "div": 1,
		"kit": Color("6cabdd"), "kit2": Color("12224a"), "crest": "round", "rating": 82},
	{"id": "uru_riv", "name": "River Plate de Montevideo", "abbrev": "RIV", "country": "Uruguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "uru_cla", "name": "Cerro Largo", "abbrev": "CLA", "country": "Uruguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("1b4fa0"), "crest": "star", "rating": 82},
	{"id": "uru_bos", "name": "Boston River", "abbrev": "BOS", "country": "Uruguay", "div": 1,
		"kit": Color("c62828"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("1e7a35"), "crest": "halved", "rating": 81},
	{"id": "uru_rac", "name": "Racing de Montevideo", "abbrev": "RAC", "country": "Uruguay", "div": 1,
		"kit": Color("2e7d32"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 81},
	{"id": "uru_pla", "name": "Plaza Colonia", "abbrev": "PLA", "country": "Uruguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 80},
	{"id": "uru_pro", "name": "Progreso", "abbrev": "PRO", "country": "Uruguay", "div": 1,
		"kit": Color("c62828"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "diamond", "rating": 80},
	{"id": "uru_juv", "name": "Juventud de Las Piedras", "abbrev": "JUV", "country": "Uruguay", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "round", "rating": 79},
	{"id": "uru_mir", "name": "Miramar Misiones", "abbrev": "MIR", "country": "Uruguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("1b1b1b"), "crest": "shield", "rating": 79},
	{"id": "uru_cer", "name": "Cerro", "abbrev": "CER", "country": "Uruguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("6cb4e4"), "pattern": "stripes", "kit_b": Color("6cb4e4"), "crest": "star", "rating": 79},
	{"id": "uru_fen", "name": "Fénix", "abbrev": "FEN", "country": "Uruguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("6a2fa0"), "crest": "halved", "rating": 79},
	{"id": "uru_ram", "name": "Rampla Juniors", "abbrev": "RAM", "country": "Uruguay", "div": 2,
		"kit": Color("c62828"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("1e7a35"), "crest": "banner", "rating": 78},

	{"id": "uru_alb", "name": "Albion", "abbrev": "ALB", "country": "Uruguay", "div": 1,
		"kit": Color("c0392b"), "kit2": Color("1b3f8c"), "pattern": "half", "kit_b": Color("1b3f8c"), "crest": "banner", "rating": 79},
	{"id": "uru_ren", "name": "Rentistas", "abbrev": "REN", "country": "Uruguay", "div": 2,
		"kit": Color("c62828"), "kit2": Color("c62828"), "crest": "shield", "rating": 75},
	{"id": "uru_dma", "name": "Deportivo Maldonado", "abbrev": "DMA", "country": "Uruguay", "div": 1,
		"kit": Color("c62828"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("1e7a35"), "crest": "round", "rating": 79},
	{"id": "uru_cen", "name": "Central Español", "abbrev": "CEN", "country": "Uruguay", "div": 1,
		"kit": Color("c0392b"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 79},
	{"id": "uru_sud", "name": "Sud América", "abbrev": "SUD", "country": "Uruguay", "div": 2,
		"kit": Color("e8701a"), "kit2": Color("111111"), "crest": "diamond", "rating": 73},
	{"id": "uru_ves", "name": "Villa Española", "abbrev": "VES", "country": "Uruguay", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("c62828"), "pattern": "half", "kit_b": Color("c62828"), "crest": "star", "rating": 73},
	{"id": "uru_cto", "name": "Cerrito", "abbrev": "CTO", "country": "Uruguay", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("1e8a3c"), "pattern": "half", "kit_b": Color("1e8a3c"), "crest": "halved", "rating": 72},
	{"id": "uru_tac", "name": "Tacuarembó", "abbrev": "TAC", "country": "Uruguay", "div": 2,
		"kit": Color("b71c1c"), "kit2": Color("ffffff"), "crest": "shield", "rating": 72},
	{"id": "uru_luz", "name": "La Luz", "abbrev": "LUZ", "country": "Uruguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 71},
	{"id": "uru_ate", "name": "Atenas de San Carlos", "abbrev": "ATE", "country": "Uruguay", "div": 2,
		"kit": Color("1b4fa0"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 71},

	{"id": "uru_bel", "name": "Bella Vista", "abbrev": "BEL", "country": "Uruguay", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a2340"), "pattern": "half", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 64},
	{"id": "uru_hbu", "name": "Huracán Buceo", "abbrev": "HUB", "country": "Uruguay", "div": 3,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "band_v", "kit_b": Color("ffffff"), "crest": "diamond", "rating": 64},
	{"id": "uru_umo", "name": "Uruguay Montevideo", "abbrev": "UMO", "country": "Uruguay", "div": 3,
		"kit": Color("4fa3dd"), "kit2": Color("111111"), "crest": "shield", "rating": 63},
	{"id": "uru_bas", "name": "Basáñez", "abbrev": "BAS", "country": "Uruguay", "div": 3,
		"kit": Color("c62828"), "kit2": Color("111111"), "pattern": "half", "kit_b": Color("111111"), "crest": "star", "rating": 63},
	{"id": "uru_col", "name": "Colón de Montevideo", "abbrev": "COL", "country": "Uruguay", "div": 3,
		"kit": Color("c62828"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("1e7a35"), "crest": "halved", "rating": 62},
	{"id": "uru_roc", "name": "Rocha", "abbrev": "ROC", "country": "Uruguay", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("111111"), "crest": "banner", "rating": 62},
	{"id": "uru_ori", "name": "Oriental", "abbrev": "ORI", "country": "Uruguay", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("14161a"), "crest": "shield", "rating": 62},
	{"id": "uru_sal", "name": "Salus", "abbrev": "SAL", "country": "Uruguay", "div": 3,
		"kit": Color("1b3f8c"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("8e1b3a"), "crest": "round", "rating": 61},
	{"id": "uru_vte", "name": "Villa Teresa", "abbrev": "VTE", "country": "Uruguay", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c62828"), "crest": "diamond", "rating": 61},
	{"id": "uru_alp", "name": "Alto Perú", "abbrev": "ALP", "country": "Uruguay", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("c8102e"), "crest": "star", "rating": 60},

	{"id": "egy_ahl", "name": "Al Ahly", "abbrev": "AHL", "country": "Egipto", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 90},
	{"id": "egy_zam", "name": "Zamalek", "abbrev": "ZAM", "country": "Egipto", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "none", "rim": "dark", "rating": 88},
	{"id": "egy_pyr", "name": "Pyramids FC", "abbrev": "PYR", "country": "Egipto", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "pile", "emblem": "none", "rim": "dark", "rating": 87},
	{"id": "egy_msr", "name": "Al Masry", "abbrev": "MSR", "country": "Egipto", "div": 1,
		"kit": Color("0f7a3d"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "egy_cer", "name": "Ceramica Cleopatra", "abbrev": "CER", "country": "Egipto", "div": 1,
		"kit": Color("b01c2e"), "kit2": Color("14161a"), "crest": "star", "rating": 84},
	{"id": "egy_ism", "name": "Ismaily", "abbrev": "ISM", "country": "Egipto", "div": 1,
		"kit": Color("f2c400"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "egy_enp", "name": "ENPPI", "abbrev": "ENP", "country": "Egipto", "div": 1,
		"kit": Color("0d2c6b"), "kit2": Color("ffffff"), "crest": "shield", "rating": 82},
	{"id": "egy_itt", "name": "Al Ittihad Alejandría", "abbrev": "ITT", "country": "Egipto", "div": 1,
		"kit": Color("0b6b34"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "banner", "rating": 82},
	{"id": "egy_nbe", "name": "National Bank", "abbrev": "NBE", "country": "Egipto", "div": 1,
		"kit": Color("1f6f4a"), "kit2": Color("f4d03f"), "crest": "shield", "rating": 82},
	{"id": "egy_smo", "name": "Smouha", "abbrev": "SMO", "country": "Egipto", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14318f"), "crest": "halved", "rating": 82},
	{"id": "egy_pha", "name": "Pharco", "abbrev": "PHA", "country": "Egipto", "div": 1,
		"kit": Color("1b2a5e"), "kit2": Color("6fc2e8"), "crest": "diamond", "rating": 82},
	{"id": "egy_zed", "name": "ZED FC", "abbrev": "ZED", "country": "Egipto", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 81},
	{"id": "egy_gsh", "name": "Talaea El Gaish", "abbrev": "GSH", "country": "Egipto", "div": 1,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "banner", "rating": 81},
	{"id": "egy_mod", "name": "Modern Sport", "abbrev": "MOD", "country": "Egipto", "div": 1,
		"kit": Color("3aa0d8"), "kit2": Color("ffffff"), "crest": "round", "rating": 80},
	{"id": "egy_bld", "name": "Baladiyat El Mahalla", "abbrev": "BLD", "country": "Egipto", "div": 1,
		"kit": Color("b52a2a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 79},
	{"id": "egy_ptj", "name": "Petrojet", "abbrev": "PTJ", "country": "Egipto", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "pattern": "sleeves", "kit_b": Color("0a2340"), "crest": "halved", "rating": 79},
	{"id": "egy_gou", "name": "El Gouna", "abbrev": "GOU", "country": "Egipto", "div": 1,
		"kit": Color("1668b3"), "kit2": Color("f5d020"), "crest": "round", "rating": 79},

	{"id": "egy_mok", "name": "Al Mokawloon Al Arab", "abbrev": "MOK", "country": "Egipto", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 79},
	{"id": "egy_gzl", "name": "Ghazl El Mahalla", "abbrev": "GZL", "country": "Egipto", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("14161a"), "crest": "round", "rating": 79},
	{"id": "egy_hrs", "name": "Haras El Hodoud", "abbrev": "HRS", "country": "Egipto", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 78},
	{"id": "egy_dkh", "name": "El Dakhleya", "abbrev": "DKH", "country": "Egipto", "div": 2,
		"kit": Color("1d4f8f"), "kit2": Color("d9d9d9"), "crest": "shield", "rating": 75},
	{"id": "egy_asw", "name": "Aswan", "abbrev": "ASW", "country": "Egipto", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 74},
	{"id": "egy_tnt", "name": "Tanta", "abbrev": "TNT", "country": "Egipto", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "round", "rating": 74},
	{"id": "egy_nsr", "name": "Al Nasr Lel Taadeen", "abbrev": "NSR", "country": "Egipto", "div": 2,
		"kit": Color("5a3a1e"), "kit2": Color("e8c07a"), "crest": "star", "rating": 73},
	{"id": "egy_skk", "name": "El Sekka El Hadid", "abbrev": "SKK", "country": "Egipto", "div": 2,
		"kit": Color("2f6f3a"), "kit2": Color("f2f2f2"), "crest": "halved", "rating": 72},
	{"id": "egy_pta", "name": "Petrol Asyout", "abbrev": "PTA", "country": "Egipto", "div": 2,
		"kit": Color("0d5c66"), "kit2": Color("ffffff"), "crest": "shield", "rating": 72},
	{"id": "egy_mkk", "name": "Misr Lel Makkasa", "abbrev": "MKK", "country": "Egipto", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14318f"), "crest": "round", "rating": 73},

	{"id": "egy_trs", "name": "Tersana", "abbrev": "TRS", "country": "Egipto", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 67},
	{"id": "egy_oly", "name": "Olympic Club", "abbrev": "OLY", "country": "Egipto", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 65},
	{"id": "egy_khr", "name": "Kahrabaa Ismailia", "abbrev": "KHR", "country": "Egipto", "div": 3,
		"kit": Color("e3a010"), "kit2": Color("1f1f1f"), "crest": "diamond", "rating": 64},
	{"id": "egy_asm", "name": "Asmant Asyout", "abbrev": "ASM", "country": "Egipto", "div": 3,
		"kit": Color("8f8f8f"), "kit2": Color("1c3b6e"), "crest": "shield", "rating": 63},
	{"id": "egy_dmn", "name": "Damanhour", "abbrev": "DMN", "country": "Egipto", "div": 3,
		"kit": Color("1f7a4c"), "kit2": Color("ffffff"), "crest": "round", "rating": 63},
	{"id": "egy_hrb", "name": "El Entag El Harby", "abbrev": "HRB", "country": "Egipto", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 64},
	{"id": "egy_shg", "name": "Sohag", "abbrev": "SHG", "country": "Egipto", "div": 3,
		"kit": Color("2b4a9c"), "kit2": Color("f0c419"), "crest": "halved", "rating": 63},
	{"id": "egy_qna", "name": "Qena", "abbrev": "QNA", "country": "Egipto", "div": 3,
		"kit": Color("c25a1b"), "kit2": Color("1a1a1a"), "crest": "round", "rating": 62},
	{"id": "egy_pfd", "name": "Port Fouad", "abbrev": "PFD", "country": "Egipto", "div": 3,
		"kit": Color("0f6f9c"), "kit2": Color("ffffff"), "crest": "banner", "rating": 62},
	{"id": "egy_gmh", "name": "Gomhoriat Shebin", "abbrev": "GMH", "country": "Egipto", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "pinstripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 61},






	{"id": "rsa_sun", "name": "Mamelodi Sundowns", "abbrev": "SUN", "country": "Sudáfrica", "div": 1,
		"kit": Color("f7d117"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 87},
	{"id": "rsa_orl", "name": "Orlando Pirates", "abbrev": "ORL", "country": "Sudáfrica", "div": 1,
		"kit": Color("101114"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "silver", "rim": "dark", "rating": 85},
	{"id": "rsa_kai", "name": "Kaizer Chiefs", "abbrev": "KAI", "country": "Sudáfrica", "div": 1,
		"kit": Color("d4af1a"), "kit2": Color("000000"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "none", "rim": "gold", "rating": 84},
	{"id": "rsa_ste", "name": "Stellenbosch", "abbrev": "STE", "country": "Sudáfrica", "div": 1,
		"kit": Color("8a1538"), "kit2": Color("8b1a2b"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "none", "rim": "dark", "rating": 83},
	{"id": "rsa_sup", "name": "SuperSport United", "abbrev": "SUP", "country": "Sudáfrica", "div": 2,
		"kit": Color("0a3d91"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "rsa_sek", "name": "Sekhukhune United", "abbrev": "SEK", "country": "Sudáfrica", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 82},
	{"id": "rsa_arr", "name": "Golden Arrows", "abbrev": "ARR", "country": "Sudáfrica", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 81},
	{"id": "rsa_amz", "name": "AmaZulu", "abbrev": "AMZ", "country": "Sudáfrica", "div": 1,
		"kit": Color("0d6b3c"), "kit2": Color("ffffff"), "crest": "round", "rating": 81},
	{"id": "rsa_ric", "name": "Richards Bay", "abbrev": "RIC", "country": "Sudáfrica", "div": 1,
		"kit": Color("1477c0"), "kit2": Color("ffffff"), "crest": "banner", "rating": 80},
	{"id": "rsa_pol", "name": "Polokwane City", "abbrev": "POL", "country": "Sudáfrica", "div": 1,
		"kit": Color("f0a500"), "kit2": Color("1a1a1a"), "crest": "star", "rating": 80},
	{"id": "rsa_chi", "name": "Chippa United", "abbrev": "CHI", "country": "Sudáfrica", "div": 1,
		"kit": Color("0b5ea8"), "kit2": Color("ffffff"), "pattern": "band_h", "kit_b": Color("ffffff"), "crest": "shield", "rating": 80},
	{"id": "rsa_mar", "name": "Marumo Gallants", "abbrev": "MAR", "country": "Sudáfrica", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f2c400"), "crest": "halved", "rating": 80},
	{"id": "rsa_tsg", "name": "TS Galaxy", "abbrev": "TSG", "country": "Sudáfrica", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 80},
	{"id": "rsa_mag", "name": "Magesi FC", "abbrev": "MGS", "country": "Sudáfrica", "div": 1,
		"kit": Color("1f6f4a"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 79},
	{"id": "rsa_ram", "name": "Royal AM", "abbrev": "RAM", "country": "Sudáfrica", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("f5d020"), "crest": "banner", "rating": 79},
	{"id": "rsa_cpt", "name": "Cape Town City", "abbrev": "CPT", "country": "Sudáfrica", "div": 2,
		"kit": Color("1a4fa0"), "kit2": Color("14318f"), "crest": "shield", "rating": 80},
	{"id": "rsa_dur", "name": "Durban City", "abbrev": "DUR", "country": "Sudáfrica", "div": 1,
		"kit": Color("0d8a8a"), "kit2": Color("ffffff"), "crest": "round", "rating": 79},
	{"id": "rsa_siw", "name": "Siwelele FC", "abbrev": "SIW", "country": "Sudáfrica", "div": 1,
		"kit": Color("117a3a"), "kit2": Color("f2f2f2"), "pattern": "stripes", "kit_b": Color("f2f2f2"), "crest": "star", "rating": 79},

	{"id": "rsa_bar", "name": "Baroka FC", "abbrev": "BAR", "country": "Sudáfrica", "div": 2,
		"kit": Color("0f5c2e"), "kit2": Color("f0c419"), "crest": "shield", "rating": 75},
	{"id": "rsa_spu", "name": "Cape Town Spurs", "abbrev": "SPU", "country": "Sudáfrica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 75},
	{"id": "rsa_jom", "name": "Jomo Cosmos", "abbrev": "JOM", "country": "Sudáfrica", "div": 2,
		"kit": Color("f0a500"), "kit2": Color("101114"), "crest": "star", "rating": 74},
	{"id": "rsa_hun", "name": "Hungry Lions", "abbrev": "HUN", "country": "Sudáfrica", "div": 2,
		"kit": Color("c25a1b"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 73},
	{"id": "rsa_mil", "name": "Milford FC", "abbrev": "MIL", "country": "Sudáfrica", "div": 2,
		"kit": Color("1477c0"), "kit2": Color("f2f2f2"), "crest": "banner", "rating": 73},
	{"id": "rsa_cas", "name": "Casric Stars", "abbrev": "CAS", "country": "Sudáfrica", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "star", "rating": 72},
	{"id": "rsa_upi", "name": "Upington City", "abbrev": "UPI", "country": "Sudáfrica", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 72},
	{"id": "rsa_ven", "name": "Venda FC", "abbrev": "VEN", "country": "Sudáfrica", "div": 2,
		"kit": Color("1b3fa0"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "rsa_jdr", "name": "JDR Stars", "abbrev": "JDR", "country": "Sudáfrica", "div": 2,
		"kit": Color("101114"), "kit2": Color("f7d117"), "pattern": "sleeves", "kit_b": Color("f7d117"), "crest": "star", "rating": 71},
	{"id": "rsa_ler", "name": "Leruma United", "abbrev": "LER", "country": "Sudáfrica", "div": 2,
		"kit": Color("2f6f3a"), "kit2": Color("ffffff"), "crest": "halved", "rating": 71},
	{"id": "rsa_mac", "name": "Maccabi FC", "abbrev": "MAC", "country": "Sudáfrica", "div": 2,
		"kit": Color("2b4a9c"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 70},
	{"id": "rsa_orb", "name": "Orbit College", "abbrev": "ORB", "country": "Sudáfrica", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "shield", "rating": 79},
	{"id": "rsa_cal", "name": "Pretoria Callies", "abbrev": "CAL", "country": "Sudáfrica", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("f2f2f2"), "crest": "banner", "rating": 70},
	{"id": "rsa_lep", "name": "Black Leopards", "abbrev": "LEP", "country": "Sudáfrica", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("d4af1a"), "pattern": "stripes", "kit_b": Color("d4af1a"), "crest": "round", "rating": 69},
	{"id": "rsa_fss", "name": "Free State Stars", "abbrev": "FSS", "country": "Sudáfrica", "div": 2,
		"kit": Color("f2c400"), "kit2": Color("0a3d91"), "crest": "star", "rating": 69},
	{"id": "rsa_hig", "name": "Highlands Park", "abbrev": "HIG", "country": "Sudáfrica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 68},
	{"id": "rsa_tut", "name": "University of Pretoria", "abbrev": "TUT", "country": "Sudáfrica", "div": 2,
		"kit": Color("0b6b34"), "kit2": Color("ffffff"), "crest": "shield", "rating": 68},
	{"id": "rsa_pcr", "name": "Platinum City Rovers", "abbrev": "PCR", "country": "Sudáfrica", "div": 2,
		"kit": Color("8f8f8f"), "kit2": Color("1c3b6e"), "crest": "round", "rating": 67},









	{"id": "qat_sad", "name": "Al-Sadd", "abbrev": "SAD", "country": "Catar", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "qat_duh", "name": "Al-Duhail", "abbrev": "DUH", "country": "Catar", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "qat_ray", "name": "Al-Rayyan", "abbrev": "RAY", "country": "Catar", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("101114"), "pattern": "stripes", "kit_b": Color("101114"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "silver", "rim": "dark", "rating": 85},
	{"id": "qat_gha", "name": "Al-Gharafa", "abbrev": "GHA", "country": "Catar", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "none", "rim": "gold", "rating": 84},

	{"id": "qat_ara", "name": "Al-Arabi", "abbrev": "ARB", "country": "Catar", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "silver", "rim": "dark", "rating": 83},
	{"id": "qat_wak", "name": "Al-Wakrah", "abbrev": "WAK", "country": "Catar", "div": 1,
		"kit": Color("77bbff"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "qat_sha", "name": "Al-Shamal", "abbrev": "SHM", "country": "Catar", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "round", "rating": 81},
	{"id": "qat_ums", "name": "Umm Salal", "abbrev": "UMS", "country": "Catar", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "shield", "rating": 81},
	{"id": "qat_qsc", "name": "Qatar SC", "abbrev": "QSC", "country": "Catar", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "banner", "rating": 80},
	{"id": "qat_ahl", "name": "Al-Ahli", "abbrev": "AHD", "country": "Catar", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "star", "rating": 80},
	{"id": "qat_kho", "name": "Al-Khor", "abbrev": "KHO", "country": "Catar", "div": 2,
		"kit": Color("0b5ea8"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 80},
	{"id": "qat_mar", "name": "Al-Markhiya", "abbrev": "MRK", "country": "Catar", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "halved", "rating": 80},
	{"id": "qat_mua", "name": "Muaither", "abbrev": "MUA", "country": "Catar", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "shield", "rating": 79},
	{"id": "qat_sai", "name": "Al-Sailiya", "abbrev": "SAI", "country": "Catar", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "crest": "round", "rating": 79},
	{"id": "qat_shn", "name": "Al-Shahaniya", "abbrev": "SHN", "country": "Catar", "div": 1,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "banner", "rating": 79},
	{"id": "qat_kha", "name": "Al-Kharaitiyat", "abbrev": "KHR", "country": "Catar", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 79},
	{"id": "qat_mes", "name": "Al-Mesaimeer", "abbrev": "MES", "country": "Catar", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "shield", "rating": 79},
	{"id": "qat_waa", "name": "Al-Waab", "abbrev": "WAA", "country": "Catar", "div": 2,
		"kit": Color("00bfff"), "kit2": Color("00bfff"), "crest": "star", "rating": 78},



	{"id": "qat_lus", "name": "Lusail City", "abbrev": "LUS", "country": "Catar", "div": 2,
		"kit": Color("802a2a"), "kit2": Color("802a2a"), "crest": "round", "rating": 75},
	{"id": "qat_bid", "name": "Al-Bidda", "abbrev": "BID", "country": "Catar", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 74},
	{"id": "qat_shr", "name": "Al-Shurta", "abbrev": "SHU", "country": "Catar", "div": 2,
		"kit": Color("101114"), "kit2": Color("3aa0d8"), "pattern": "stripes", "kit_b": Color("3aa0d8"), "crest": "banner", "rating": 74},
	{"id": "qat_oru", "name": "Al-Oruba", "abbrev": "ORU", "country": "Catar", "div": 2,
		"kit": Color("0d6b3c"), "kit2": Color("ffffff"), "crest": "star", "rating": 73},
	{"id": "qat_taa", "name": "Al-Taawoun", "abbrev": "TAA", "country": "Catar", "div": 2,
		"kit": Color("f2c400"), "kit2": Color("101114"), "crest": "diamond", "rating": 73},
	{"id": "qat_nas", "name": "Al-Nasr", "abbrev": "NSR", "country": "Catar", "div": 2,
		"kit": Color("1b3fa0"), "kit2": Color("f5d020"), "crest": "halved", "rating": 72},
	{"id": "qat_itt", "name": "Al-Ittihad", "abbrev": "ITT", "country": "Catar", "div": 2,
		"kit": Color("c25a1b"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "qat_jai", "name": "Al-Jaish", "abbrev": "JAI", "country": "Catar", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "shield", "rating": 71},
	{"id": "qat_wus", "name": "Al-Wusail", "abbrev": "WUS", "country": "Catar", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("ffffff"), "crest": "banner", "rating": 71},
	{"id": "qat_dha", "name": "Al-Dhakira", "abbrev": "DHA", "country": "Catar", "div": 2,
		"kit": Color("0f5c2e"), "kit2": Color("f2f2f2"), "crest": "diamond", "rating": 70},
	{"id": "qat_ruw", "name": "Al-Ruwais", "abbrev": "RUW", "country": "Catar", "div": 2,
		"kit": Color("1477c0"), "kit2": Color("ffffff"), "crest": "round", "rating": 70},
	{"id": "qat_wuk", "name": "Al-Wukair", "abbrev": "WUK", "country": "Catar", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5c518"), "crest": "star", "rating": 70},
	{"id": "qat_daa", "name": "Al-Daayen", "abbrev": "DAA", "country": "Catar", "div": 2,
		"kit": Color("0d2c6b"), "kit2": Color("e3a010"), "crest": "shield", "rating": 69},
	{"id": "qat_jum", "name": "Al-Jumailiya", "abbrev": "JUM", "country": "Catar", "div": 2,
		"kit": Color("f2f2f2"), "kit2": Color("1b2a55"), "pattern": "band_v", "kit_b": Color("1b2a55"), "crest": "halved", "rating": 69},
	{"id": "qat_shq", "name": "Al-Shaqab", "abbrev": "SHQ", "country": "Catar", "div": 2,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "banner", "rating": 69},
	{"id": "qat_tad", "name": "Al-Tadamun", "abbrev": "TAD", "country": "Catar", "div": 2,
		"kit": Color("0d8a8a"), "kit2": Color("101114"), "crest": "round", "rating": 68},
	{"id": "qat_weh", "name": "Al-Wehda", "abbrev": "WEH", "country": "Catar", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("d4af1a"), "pattern": "sash", "kit_b": Color("d4af1a"), "crest": "diamond", "rating": 68},
	{"id": "qat_esl", "name": "Al-Eslah", "abbrev": "ESL", "country": "Catar", "div": 2,
		"kit": Color("2b4a9c"), "kit2": Color("f0a500"), "crest": "shield", "rating": 67},










	{"id": "irn_per", "name": "Persepolis", "abbrev": "PER", "country": "Irán", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f2f2f2"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "irn_est", "name": "Esteghlal", "abbrev": "EST", "country": "Irán", "div": 1,
		"kit": Color("1b4fa0"), "kit2": Color("f2f2f2"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "silver", "rim": "dark", "rating": 85},
	{"id": "irn_sep", "name": "Sepahan", "abbrev": "SEP", "country": "Irán", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 84},
	{"id": "irn_tra", "name": "Tractor", "abbrev": "TRA", "country": "Irán", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "silver", "rim": "dark", "rating": 83},
	{"id": "irn_foo", "name": "Foolad", "abbrev": "FOO", "country": "Irán", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "none", "rim": "dark", "rating": 82},
	{"id": "irn_gol", "name": "Gol Gohar", "abbrev": "GOL", "country": "Irán", "div": 1,
		"kit": Color("0b5ea8"), "kit2": Color("f2c400"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "irn_zob", "name": "Zob Ahan", "abbrev": "ZOB", "country": "Irán", "div": 1,
		"kit": Color("1f6f4a"), "kit2": Color("ffffff"), "crest": "round", "rating": 81},
	{"id": "irn_nas", "name": "Nassaji Mazandaran", "abbrev": "NAS", "country": "Irán", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 80},
	{"id": "irn_mrf", "name": "Mes Rafsanjan", "abbrev": "MRF", "country": "Irán", "div": 1,
		"kit": Color("f0a500"), "kit2": Color("1a1a1a"), "crest": "diamond", "rating": 80},
	{"id": "irn_alu", "name": "Aluminium Arak", "abbrev": "ALU", "country": "Irán", "div": 1,
		"kit": Color("8f8f8f"), "kit2": Color("1c3b6e"), "crest": "banner", "rating": 80},
	{"id": "irn_snf", "name": "Sanat Naft", "abbrev": "SNF", "country": "Irán", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "star", "rating": 80},
	{"id": "irn_mal", "name": "Malavan", "abbrev": "MAL", "country": "Irán", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 79},
	{"id": "irn_cha", "name": "Chadormalou", "abbrev": "CHD", "country": "Irán", "div": 1,
		"kit": Color("2b4a9c"), "kit2": Color("f2f2f2"), "pattern": "band_h", "kit_b": Color("f2f2f2"), "crest": "shield", "rating": 79},
	{"id": "irn_hav", "name": "Havadar", "abbrev": "HAV", "country": "Irán", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("f5d020"), "crest": "diamond", "rating": 79},
	{"id": "irn_khe", "name": "Kheybar Khorramabad", "abbrev": "KHE", "country": "Irán", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 79},
	{"id": "irn_faj", "name": "Fajr Sepasi", "abbrev": "FAJ", "country": "Irán", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 79},
	{"id": "irn_pay", "name": "Paykan", "abbrev": "PAY", "country": "Irán", "div": 1,
		"kit": Color("0d2c6b"), "kit2": Color("e3a010"), "crest": "shield", "rating": 79},
	{"id": "irn_sha", "name": "Shams Azar Qazvin", "abbrev": "SHZ", "country": "Irán", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("14532d"), "crest": "star", "rating": 78},




	{"id": "irn_ekh", "name": "Esteghlal Khuzestan", "abbrev": "EKH", "country": "Irán", "div": 1,
		"kit": Color("1b4fa0"), "kit2": Color("ffffff"), "crest": "round", "rating": 79},
	{"id": "irn_mke", "name": "Mes Kerman", "abbrev": "MKE", "country": "Irán", "div": 2,
		"kit": Color("c25a1b"), "kit2": Color("101114"), "crest": "shield", "rating": 75},
	{"id": "irn_nms", "name": "Naft Masjed Soleyman", "abbrev": "NMS", "country": "Irán", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 74},
	{"id": "irn_shb", "name": "Shahin Bushehr", "abbrev": "SHB", "country": "Irán", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "star", "rating": 74},
	{"id": "irn_mac", "name": "Machine Sazi", "abbrev": "MAC", "country": "Irán", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 73},
	{"id": "irn_rah", "name": "Rah Ahan", "abbrev": "RAH", "country": "Irán", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "round", "rating": 73},
	{"id": "irn_sab", "name": "Saba Qom", "abbrev": "SAB", "country": "Irán", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 72},
	{"id": "irn_pjj", "name": "Pars Jonoubi Jam", "abbrev": "PJJ", "country": "Irán", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "banner", "rating": 72},
	{"id": "irn_sij", "name": "Siah Jamegan", "abbrev": "SIJ", "country": "Irán", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("d4af1a"), "pattern": "sash", "kit_b": Color("d4af1a"), "crest": "diamond", "rating": 72},
	{"id": "irn_pnb", "name": "Palayesh Naft Bandar Abbas", "abbrev": "PNB", "country": "Irán", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "round", "rating": 71},
	{"id": "irn_niz", "name": "Nirooye Zamini", "abbrev": "NIZ", "country": "Irán", "div": 2,
		"kit": Color("2f6f3a"), "kit2": Color("f0c419"), "crest": "star", "rating": 71},
	{"id": "irn_dam", "name": "Damash Gilan", "abbrev": "DAM", "country": "Irán", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 70},
	{"id": "irn_bad", "name": "Badran Tehran", "abbrev": "BAD", "country": "Irán", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("ffffff"), "crest": "banner", "rating": 70},
	{"id": "irn_ari", "name": "Ario Eslamshahr", "abbrev": "ARI", "country": "Irán", "div": 2,
		"kit": Color("1b3fa0"), "kit2": Color("f5d020"), "crest": "diamond", "rating": 70},
	{"id": "irn_mno", "name": "Mes Novin Kerman", "abbrev": "MNO", "country": "Irán", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5c518"), "crest": "round", "rating": 69},
	{"id": "irn_khs", "name": "Khoshe Talaei Saveh", "abbrev": "KHS", "country": "Irán", "div": 2,
		"kit": Color("f2c400"), "kit2": Color("0a3d91"), "crest": "star", "rating": 69},
	{"id": "irn_van", "name": "Van Pars Naqsh Jahan", "abbrev": "VAN", "country": "Irán", "div": 2,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "shield", "rating": 68},
	{"id": "irn_ast", "name": "Shahrdari Astara", "abbrev": "AST", "country": "Irán", "div": 2,
		"kit": Color("1477c0"), "kit2": Color("101114"), "crest": "halved", "rating": 68},











	{"id": "uzb_pak", "name": "Pakhtakor", "abbrev": "PAK", "country": "Uzbekistán", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 84},
	{"id": "uzb_nas", "name": "Nasaf", "abbrev": "NSF", "country": "Uzbekistán", "div": 1,
		"kit": Color("1b4fa0"), "kit2": Color("f2f2f2"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "silver", "rim": "dark", "rating": 83},
	{"id": "uzb_bun", "name": "Bunyodkor", "abbrev": "BUN", "country": "Uzbekistán", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 83},
	{"id": "uzb_agm", "name": "AGMK", "abbrev": "AGM", "country": "Uzbekistán", "div": 1,
		"kit": Color("f5a623"), "kit2": Color("101114"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "silver", "rim": "dark", "rating": 82},
	{"id": "uzb_nav", "name": "Navbahor Namangan", "abbrev": "NAV", "country": "Uzbekistán", "div": 1,
		"kit": Color("0f7a3d"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "none", "rim": "dark", "rating": 82},
	{"id": "uzb_and", "name": "Andijon", "abbrev": "AND", "country": "Uzbekistán", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 81},

	{"id": "uzb_nef", "name": "Neftchi Fergana", "abbrev": "NEF", "country": "Uzbekistán", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 81},
	{"id": "uzb_buk", "name": "Bukhara", "abbrev": "BUK", "country": "Uzbekistán", "div": 1,
		"kit": Color("c25a1b"), "kit2": Color("f2f2f2"), "crest": "shield", "rating": 80},
	{"id": "uzb_dsa", "name": "Dinamo Samarqand", "abbrev": "DSA", "country": "Uzbekistán", "div": 1,
		"kit": Color("1477c0"), "kit2": Color("ffffff"), "crest": "round", "rating": 80},
	{"id": "uzb_sur", "name": "Surkhon Termez", "abbrev": "SUR", "country": "Uzbekistán", "div": 1,
		"kit": Color("8b1a2b"), "kit2": Color("f2f2f2"), "crest": "banner", "rating": 80},
	{"id": "uzb_qiz", "name": "Qizilqum Zarafshon", "abbrev": "QIZ", "country": "Uzbekistán", "div": 1,
		"kit": Color("f0a500"), "kit2": Color("1a1a1a"), "crest": "diamond", "rating": 80},
	{"id": "uzb_sog", "name": "Sogdiana Jizzakh", "abbrev": "SOG", "country": "Uzbekistán", "div": 1,
		"kit": Color("1f6f4a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 79},
	{"id": "uzb_mas", "name": "Mash'al Mubarek", "abbrev": "MAS", "country": "Uzbekistán", "div": 1,
		"kit": Color("2b4a9c"), "kit2": Color("f2f2f2"), "pattern": "band_h", "kit_b": Color("f2f2f2"), "crest": "round", "rating": 79},
	{"id": "uzb_kok", "name": "Kokand 1912", "abbrev": "KOK", "country": "Uzbekistán", "div": 1,
		"kit": Color("6b2d8f"), "kit2": Color("f5d020"), "crest": "banner", "rating": 79},
	{"id": "uzb_olm", "name": "Olimpik Tashkent", "abbrev": "OLM", "country": "Uzbekistán", "div": 2,
		"kit": Color("0d8a8a"), "kit2": Color("ffffff"), "crest": "star", "rating": 79},
	{"id": "uzb_tur", "name": "Turon Yaypan", "abbrev": "TUR", "country": "Uzbekistán", "div": 2,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 79},
	{"id": "uzb_loc", "name": "Lokomotiv Tashkent", "abbrev": "LOC", "country": "Uzbekistán", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 79},
	{"id": "uzb_met", "name": "Metallurg Bekabad", "abbrev": "MET", "country": "Uzbekistán", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "crest": "round", "rating": 78},




	{"id": "uzb_shu", "name": "Shurtan Guzar", "abbrev": "SHG", "country": "Uzbekistán", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 75},
	{"id": "uzb_kim", "name": "Kimyogar Chirchiq", "abbrev": "KIM", "country": "Uzbekistán", "div": 2,
		"kit": Color("1b4fa0"), "kit2": Color("f2c400"), "crest": "shield", "rating": 75},
	{"id": "uzb_tra", "name": "Traktor Tashkent", "abbrev": "TRK", "country": "Uzbekistán", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 74},
	{"id": "uzb_shh", "name": "Shahrixonchi", "abbrev": "SHX", "country": "Uzbekistán", "div": 2,
		"kit": Color("f5a623"), "kit2": Color("101114"), "crest": "star", "rating": 74},
	{"id": "uzb_zar", "name": "Zarafshon Navoiy", "abbrev": "ZAR", "country": "Uzbekistán", "div": 2,
		"kit": Color("0d8a8a"), "kit2": Color("f2f2f2"), "crest": "diamond", "rating": 73},
	{"id": "uzb_xor", "name": "Xorazm Urganch", "abbrev": "XOR", "country": "Uzbekistán", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 79},
	{"id": "uzb_qur", "name": "Qurusoy Olmaliq", "abbrev": "QUR", "country": "Uzbekistán", "div": 2,
		"kit": Color("1f6f4a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 72},
	{"id": "uzb_chi", "name": "Chirchiq", "abbrev": "CHQ", "country": "Uzbekistán", "div": 2,
		"kit": Color("0b5ea8"), "kit2": Color("ffffff"), "crest": "banner", "rating": 72},
	{"id": "uzb_nur", "name": "Nurafshon", "abbrev": "NUR", "country": "Uzbekistán", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("d4af1a"), "pattern": "sash", "kit_b": Color("d4af1a"), "crest": "diamond", "rating": 72},
	{"id": "uzb_jiz", "name": "Jizzakh", "abbrev": "JIZ", "country": "Uzbekistán", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "round", "rating": 71},
	{"id": "uzb_ter", "name": "Termez", "abbrev": "TER", "country": "Uzbekistán", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "star", "rating": 71},
	{"id": "uzb_urg", "name": "Urganch", "abbrev": "URG", "country": "Uzbekistán", "div": 2,
		"kit": Color("c25a1b"), "kit2": Color("101114"), "crest": "shield", "rating": 71},
	{"id": "uzb_nam", "name": "Namangan 1912", "abbrev": "NMG", "country": "Uzbekistán", "div": 2,
		"kit": Color("0f5c2e"), "kit2": Color("f0c419"), "crest": "banner", "rating": 70},
	{"id": "uzb_sam", "name": "Samarqand 1968", "abbrev": "SAM", "country": "Uzbekistán", "div": 2,
		"kit": Color("f2f2f2"), "kit2": Color("1b2a55"), "pattern": "band_v", "kit_b": Color("1b2a55"), "crest": "halved", "rating": 70},
	{"id": "uzb_gul", "name": "Gulistan", "abbrev": "GUL", "country": "Uzbekistán", "div": 2,
		"kit": Color("1477c0"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 70},
	{"id": "uzb_qar", "name": "Qarshi", "abbrev": "QAR", "country": "Uzbekistán", "div": 2,
		"kit": Color("0d2c6b"), "kit2": Color("e3a010"), "crest": "round", "rating": 69},
	{"id": "uzb_yan", "name": "Yangiyer", "abbrev": "YAN", "country": "Uzbekistán", "div": 2,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "shield", "rating": 69},
	{"id": "uzb_bes", "name": "Bekobod", "abbrev": "BEK", "country": "Uzbekistán", "div": 2,
		"kit": Color("8f8f8f"), "kit2": Color("1c3b6e"), "crest": "banner", "rating": 68},











	{"id": "jor_fai", "name": "Al-Faisaly", "abbrev": "FAI", "country": "Jordania", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "jor_weh", "name": "Al-Wehdat", "abbrev": "WEH", "country": "Jordania", "div": 1,
		"kit": Color("0d6b3c"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "jor_hus", "name": "Al-Hussein", "abbrev": "HUS", "country": "Jordania", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "letters", "emblem_tone": "silver", "rim": "dark", "rating": 83},
	{"id": "jor_ram", "name": "Al-Ramtha", "abbrev": "RAM", "country": "Jordania", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "halved", "emblem": "none", "rim": "dark", "rating": 82},
	{"id": "jor_sho", "name": "Shabab Al-Ordon", "abbrev": "SHO", "country": "Jordania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "star", "emblem_tone": "silver", "rim": "dark", "rating": 82},

	{"id": "jor_ahl", "name": "Al-Ahli", "abbrev": "AHJ", "country": "Jordania", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 81},
	{"id": "jor_kar", "name": "Al-Karma", "abbrev": "KAR", "country": "Jordania", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("f5d020"), "crest": "shield", "rating": 80},
	{"id": "jor_jaz", "name": "Al-Jazeera", "abbrev": "JAZ", "country": "Jordania", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 80},
	{"id": "jor_sal", "name": "Al-Salt", "abbrev": "SLT", "country": "Jordania", "div": 1,
		"kit": Color("0b5ea8"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 80},
	{"id": "jor_sah", "name": "Sahab", "abbrev": "SHB", "country": "Jordania", "div": 2,
		"kit": Color("9b1b30"), "kit2": Color("f2f2f2"), "crest": "star", "rating": 80},
	{"id": "jor_sar", "name": "Al-Sareeh", "abbrev": "SAR", "country": "Jordania", "div": 2,
		"kit": Color("0099cc"), "kit2": Color("0099cc"), "crest": "round", "rating": 79},
	{"id": "jor_baq", "name": "Al-Baqa'a", "abbrev": "BAQ", "country": "Jordania", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 79},
	{"id": "jor_aqa", "name": "Shabab Al-Aqaba", "abbrev": "AQA", "country": "Jordania", "div": 2,
		"kit": Color("0d8a8a"), "kit2": Color("ffffff"), "crest": "halved", "rating": 79},
	{"id": "jor_yar", "name": "Al-Yarmouk", "abbrev": "YAR", "country": "Jordania", "div": 2,
		"kit": Color("f0a500"), "kit2": Color("1a1a1a"), "crest": "banner", "rating": 79},
	{"id": "jor_tha", "name": "That Ras", "abbrev": "THR", "country": "Jordania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 79},
	{"id": "jor_mog", "name": "Moghayer Al-Sarhan", "abbrev": "MOG", "country": "Jordania", "div": 1,
		"kit": Color("1477c0"), "kit2": Color("f5c518"), "crest": "round", "rating": 78},
	{"id": "jor_arb", "name": "Al-Arabi Irbid", "abbrev": "ARI", "country": "Jordania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 78},
	{"id": "jor_maa", "name": "Ma'an", "abbrev": "MAA", "country": "Jordania", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "star", "rating": 78},




	{"id": "jor_kuf", "name": "Kufrsoum", "abbrev": "KUF", "country": "Jordania", "div": 2,
		"kit": Color("0a3d91"), "kit2": Color("ffffff"), "crest": "round", "rating": 75},
	{"id": "jor_jal", "name": "Al-Jalil", "abbrev": "JAL", "country": "Jordania", "div": 2,
		"kit": Color("0f5c2e"), "kit2": Color("f2f2f2"), "crest": "shield", "rating": 74},
	{"id": "jor_qad", "name": "Al-Qadisiya", "abbrev": "QAD", "country": "Jordania", "div": 2,
		"kit": Color("9b1b30"), "kit2": Color("f5d020"), "crest": "banner", "rating": 74},
	{"id": "jor_hsn", "name": "Al-Hasan", "abbrev": "HSN", "country": "Jordania", "div": 2,
		"kit": Color("101114"), "kit2": Color("3aa0d8"), "pattern": "stripes", "kit_b": Color("3aa0d8"), "crest": "star", "rating": 73},
	{"id": "jor_jrs", "name": "Jerash", "abbrev": "JRS", "country": "Jordania", "div": 2,
		"kit": Color("f2c400"), "kit2": Color("101114"), "crest": "diamond", "rating": 73},
	{"id": "jor_zar", "name": "Al-Zarqa", "abbrev": "ZAR", "country": "Jordania", "div": 2,
		"kit": Color("1b3fa0"), "kit2": Color("f2f2f2"), "crest": "halved", "rating": 72},
	{"id": "jor_nas", "name": "Al-Nasr Amán", "abbrev": "NSA", "country": "Jordania", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "jor_sha", "name": "Shabab Al-Hussein", "abbrev": "SHH", "country": "Jordania", "div": 2,
		"kit": Color("2f6f3a"), "kit2": Color("f0c419"), "pattern": "sleeves", "kit_b": Color("f0c419"), "crest": "shield", "rating": 71},
	{"id": "jor_ord", "name": "Al-Ordon", "abbrev": "ORD", "country": "Jordania", "div": 2,
		"kit": Color("6b2d8f"), "kit2": Color("ffffff"), "crest": "banner", "rating": 71},
	{"id": "jor_mad", "name": "Madaba", "abbrev": "MAD", "country": "Jordania", "div": 2,
		"kit": Color("0d6b3c"), "kit2": Color("f2f2f2"), "crest": "diamond", "rating": 70},
	{"id": "jor_kra", "name": "Al-Karak", "abbrev": "KRK", "country": "Jordania", "div": 2,
		"kit": Color("1477c0"), "kit2": Color("ffffff"), "crest": "round", "rating": 70},
	{"id": "jor_tur", "name": "Al-Turra", "abbrev": "TUR", "country": "Jordania", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5c518"), "crest": "star", "rating": 70},
	{"id": "jor_shu", "name": "Al-Shoulah", "abbrev": "SHL", "country": "Jordania", "div": 2,
		"kit": Color("0d2c6b"), "kit2": Color("e3a010"), "crest": "shield", "rating": 69},
	{"id": "jor_ajl", "name": "Ajloun", "abbrev": "AJL", "country": "Jordania", "div": 2,
		"kit": Color("f2f2f2"), "kit2": Color("1b2a55"), "pattern": "band_v", "kit_b": Color("1b2a55"), "crest": "halved", "rating": 69},
	{"id": "jor_ruw", "name": "Al-Ruwaished", "abbrev": "RUW", "country": "Jordania", "div": 2,
		"kit": Color("7a1220"), "kit2": Color("ffffff"), "crest": "banner", "rating": 69},
	{"id": "jor_mfr", "name": "Al-Mafraq", "abbrev": "MFR", "country": "Jordania", "div": 2,
		"kit": Color("0d8a8a"), "kit2": Color("101114"), "crest": "round", "rating": 68},
	{"id": "jor_wad", "name": "Wadi Musa", "abbrev": "WAD", "country": "Jordania", "div": 2,
		"kit": Color("1a1a1a"), "kit2": Color("d4af1a"), "pattern": "sash", "kit_b": Color("d4af1a"), "crest": "diamond", "rating": 68},
	{"id": "jor_taf", "name": "Tafileh", "abbrev": "TAF", "country": "Jordania", "div": 2,
		"kit": Color("2b4a9c"), "kit2": Color("f0a500"), "crest": "shield", "rating": 67},









	{"id": "par_oli", "name": "Olimpia", "abbrev": "OLI", "country": "Paraguay", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "fess", "emblem": "monogram", "rim": "dark", "letter": "O", "rating": 87},
	{"id": "par_cer", "name": "Cerro Porteño", "abbrev": "CCP", "country": "Paraguay", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0b2f7a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 87},
	{"id": "par_lib", "name": "Libertad", "abbrev": "LIB", "country": "Paraguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "par_nac", "name": "Nacional", "abbrev": "NAC", "country": "Paraguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("0b2f7a"),
		"shape": "round", "crest_pattern": "tri_stripes", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "par_gua", "name": "Guaraní", "abbrev": "GUA", "country": "Paraguay", "div": 1,
		"kit": Color("ffd200"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "par_tri", "name": "Sportivo Trinidense", "abbrev": "TRI", "country": "Paraguay", "div": 1,
		"kit": Color("002048"), "kit2": Color("002048"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "par_ame", "name": "Sportivo Ameliano", "abbrev": "AME", "country": "Paraguay", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "pattern": "chevron", "kit_b": Color("000099"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "par_dmy", "name": "2 de Mayo", "abbrev": "DMA", "country": "Paraguay", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "par_rec", "name": "Recoleta", "abbrev": "REC", "country": "Paraguay", "div": 1,
		"kit": Color("ffff00"), "kit2": Color("f5c518"), "pattern": "sash", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "par_luq", "name": "Sportivo Luqueño", "abbrev": "LUQ", "country": "Paraguay", "div": 1,
		"kit": Color("ffcd00"), "kit2": Color("00008a"), "pattern": "stripes", "kit_b": Color("00008a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "par_rub", "name": "Rubio Ñu", "abbrev": "RUB", "country": "Paraguay", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "par_slo", "name": "Sportivo San Lorenzo", "abbrev": "SLO", "country": "Paraguay", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "par_gcm", "name": "General Caballero (JLM)", "abbrev": "GCA", "country": "Paraguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "par_san", "name": "Deportivo Santaní", "abbrev": "SAN", "country": "Paraguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "par_djv", "name": "12 de Junio", "abbrev": "DJU", "country": "Paraguay", "div": 2,
		"kit": Color("000080"), "kit2": Color("000080"), "pattern": "band_h", "kit_b": Color("ffcc00"),
		"shape": "round", "crest_pattern": "fess", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "par_bea", "name": "Benjamín Aceval", "abbrev": "BEA", "country": "Paraguay", "div": 2,
		"kit": Color("ff0000"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "par_sol", "name": "Sol de América", "abbrev": "SOL", "country": "Paraguay", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 79},
	{"id": "par_car", "name": "Sportivo Carapeguá", "abbrev": "CAR", "country": "Paraguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0a52b8"), "pattern": "pinstripes", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "horse", "rim": "dark", "rating": 79},





	{"id": "par_tem", "name": "Tembetary", "abbrev": "TEM", "country": "Paraguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "halved", "rating": 74},
	{"id": "par_ind", "name": "Independiente (CG)", "abbrev": "IND", "country": "Paraguay", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 73},
	{"id": "par_res", "name": "Resistencia", "abbrev": "RES", "country": "Paraguay", "div": 2,
		"kit": Color("77bbff"), "kit2": Color("77bbff"), "crest": "diamond", "rating": 73},
	{"id": "par_pgi", "name": "Paraguarí", "abbrev": "PAR", "country": "Paraguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 72},
	{"id": "par_fdm", "name": "Fernando de la Mora", "abbrev": "FDM", "country": "Paraguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "par_cap", "name": "Deportivo Capiatá", "abbrev": "CAP", "country": "Paraguay", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "round", "rating": 72},
	{"id": "par_tno", "name": "3 de Noviembre", "abbrev": "TNO", "country": "Paraguay", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 71},
	{"id": "par_gue", "name": "Guaireña", "abbrev": "GUI", "country": "Paraguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("6cb4e4"), "crest": "round", "rating": 71},
	{"id": "par_tac", "name": "Tacuary", "abbrev": "TAC", "country": "Paraguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("14161a"), "crest": "diamond", "rating": 70},
	{"id": "par_enc", "name": "Encarnación", "abbrev": "ENC", "country": "Paraguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "banner", "rating": 70},
	{"id": "par_riv", "name": "River Plate", "abbrev": "RIV", "country": "Paraguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("c8102e"), "crest": "shield", "rating": 70},
	{"id": "par_doi", "name": "12 de Octubre", "abbrev": "DOC", "country": "Paraguay", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 70},
	{"id": "par_atl", "name": "Atlántida", "abbrev": "ATL", "country": "Paraguay", "div": 2,
		"kit": Color("000080"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "star", "rating": 69},
	{"id": "par_tfe", "name": "3 de Febrero", "abbrev": "TDF", "country": "Paraguay", "div": 2,
		"kit": Color("ff0000"), "kit2": Color("c8102e"), "crest": "shield", "rating": 69},
	{"id": "par_col", "name": "Sport Colombia", "abbrev": "SCO", "country": "Paraguay", "div": 3,
		"kit": Color("ffdf00"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 68},
	{"id": "par_rit", "name": "R.I. 3 Corrales", "abbrev": "RIC", "country": "Paraguay", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 68},
	{"id": "par_pas", "name": "Pastoreo", "abbrev": "PAS", "country": "Paraguay", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "diamond", "rating": 68},
	{"id": "par_gfr", "name": "Guaraní de Fram", "abbrev": "GFR", "country": "Paraguay", "div": 3,
		"kit": Color("ffdf00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "halved", "rating": 67},




	{"id": "par_vse", "name": "29 de Setiembre", "abbrev": "SET", "country": "Paraguay", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("ffd700"), "crest": "shield", "rating": 64},
	{"id": "par_mle", "name": "Martín Ledesma", "abbrev": "MLE", "country": "Paraguay", "div": 3,
		"kit": Color("ffd700"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 63},
	{"id": "par_vps", "name": "24 de Setiembre", "abbrev": "VPU", "country": "Paraguay", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("111111"), "crest": "banner", "rating": 63},
	{"id": "par_oit", "name": "Olimpia de Itá", "abbrev": "OIT", "country": "Paraguay", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("14161a"), "crest": "round", "rating": 62},
	{"id": "par_gzc", "name": "General Caballero (ZC)", "abbrev": "GCZ", "country": "Paraguay", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("ffffff"), "crest": "shield", "rating": 62},


	{"id": "par_pma", "name": "Primero de Marzo", "abbrev": "PMA", "country": "Paraguay", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 61},
	{"id": "par_pha", "name": "Presidente Hayes", "abbrev": "PHA", "country": "Paraguay", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "star", "rating": 61},
	{"id": "par_gdz", "name": "General Díaz", "abbrev": "GDI", "country": "Paraguay", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 61},
	{"id": "par_tfb", "name": "3 de Febrero FBC", "abbrev": "TFB", "country": "Paraguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 60},
	{"id": "par_dsd", "name": "12 de Octubre de Santo Domingo", "abbrev": "OSD", "country": "Paraguay", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 60},
	{"id": "par_cco", "name": "Cristóbal Colón (JAS)", "abbrev": "CCO", "country": "Paraguay", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "round", "rating": 59},
	{"id": "par_cgl", "name": "Atlético Colegiales", "abbrev": "CGL", "country": "Paraguay", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("0000a8"), "crest": "banner", "rating": 59},
	{"id": "par_ite", "name": "Sportivo Iteño", "abbrev": "ITE", "country": "Paraguay", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 59},
	{"id": "par_spe", "name": "Silvio Pettirossi", "abbrev": "SPE", "country": "Paraguay", "div": 3,
		"kit": Color("187b4c"), "kit2": Color("0a7a3c"), "crest": "round", "rating": 58},
	{"id": "par_fye", "name": "Fulgencio Yegros", "abbrev": "FYE", "country": "Paraguay", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "shield", "rating": 58},
	{"id": "par_cho", "name": "Choré Central", "abbrev": "CHO", "country": "Paraguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "star", "rating": 58},
	{"id": "par_lim", "name": "Sportivo Limpeño", "abbrev": "LIM", "country": "Paraguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 57},
	{"id": "par_pat", "name": "Patriotas", "abbrev": "PAT", "country": "Paraguay", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 57},






	{"id": "ecu_ldu", "name": "LDU Quito", "abbrev": "LDU", "country": "Ecuador", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "U", "rating": 87},
	{"id": "ecu_idv", "name": "Independiente del Valle", "abbrev": "IDV", "country": "Ecuador", "div": 1,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0040bf"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 87},
	{"id": "ecu_bsc", "name": "Barcelona SC", "abbrev": "BSC", "country": "Ecuador", "div": 1,
		"kit": Color("fff200"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 86},
	{"id": "ecu_cat", "name": "Universidad Católica", "abbrev": "CAT", "country": "Ecuador", "div": 1,
		"kit": Color("88cfff"), "kit2": Color("000f33"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "ecu_eme", "name": "Emelec", "abbrev": "EME", "country": "Ecuador", "div": 1,
		"kit": Color("1a4fa0"), "kit2": Color("c0c0c0"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bolt", "rim": "dark", "rating": 84},
	{"id": "ecu_auc", "name": "Aucas", "abbrev": "AUC", "country": "Ecuador", "div": 1,
		"kit": Color("f2c200"), "kit2": Color("c62828"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "ecu_mac", "name": "Macará", "abbrev": "MAC", "country": "Ecuador", "div": 1,
		"kit": Color("87cefa"), "kit2": Color("1b3fa0"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "ecu_lib", "name": "Libertad", "abbrev": "LIB", "country": "Ecuador", "div": 1,
		"kit": Color("fb791a"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "ecu_cue", "name": "Deportivo Cuenca", "abbrev": "CUE", "country": "Ecuador", "div": 1,
		"kit": Color("e4001a"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "ecu_gyc", "name": "Guayaquil City", "abbrev": "GYC", "country": "Ecuador", "div": 1,
		"kit": Color("99d4fe"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "ecu_ore", "name": "Orense", "abbrev": "ORE", "country": "Ecuador", "div": 1,
		"kit": Color("053d1c"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 81},
	{"id": "ecu_mus", "name": "Mushuc Runa", "abbrev": "MUS", "country": "Ecuador", "div": 1,
		"kit": Color("590000"), "kit2": Color("00531f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "ecu_leo", "name": "Leones", "abbrev": "LEO", "country": "Ecuador", "div": 1,
		"kit": Color("e10600"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 80},
	{"id": "ecu_tec", "name": "Técnico Universitario", "abbrev": "TEC", "country": "Ecuador", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("c62828"), "pattern": "stripes", "kit_b": Color("c62828"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "ecu_del", "name": "Delfín", "abbrev": "DEL", "country": "Ecuador", "div": 1,
		"kit": Color("0f0fff"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "ecu_man", "name": "Manta FC", "abbrev": "MAN", "country": "Ecuador", "div": 1,
		"kit": Color("66ccff"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 79},
	{"id": "ecu_vin", "name": "Vinotinto Ecuador", "abbrev": "VIN", "country": "Ecuador", "div": 2,
		"kit": Color("800020"), "kit2": Color("faf4e4"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ecu_atl", "name": "Atlético FC", "abbrev": "ATL", "country": "Ecuador", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("c62828"), "pattern": "stripes", "kit_b": Color("c62828"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},





	{"id": "ecu_ind", "name": "Independiente Juniors", "abbrev": "IND", "country": "Ecuador", "div": 2,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0040bf"), "crest": "shield", "rating": 74},
	{"id": "ecu_oct", "name": "9 de Octubre", "abbrev": "OCT", "country": "Ecuador", "div": 2,
		"kit": Color("00ae57"), "kit2": Color("ffff00"), "crest": "shield", "rating": 74},
	{"id": "ecu_cjr", "name": "Cuenca Juniors", "abbrev": "CJR", "country": "Ecuador", "div": 2,
		"kit": Color("001a5c"), "kit2": Color("d5b134"), "crest": "shield", "rating": 73},
	{"id": "ecu_san", "name": "San Antonio", "abbrev": "SAN", "country": "Ecuador", "div": 2,
		"kit": Color("99ccee"), "kit2": Color("000f33"), "crest": "round", "rating": 73},
	{"id": "ecu_ldp", "name": "LDU Portoviejo", "abbrev": "LDP", "country": "Ecuador", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("008000"), "crest": "shield", "rating": 72},
	{"id": "ecu_std", "name": "Santo Domingo", "abbrev": "STD", "country": "Ecuador", "div": 2,
		"kit": Color("ff0000"), "kit2": Color("008100"), "pattern": "stripes", "kit_b": Color("008100"), "crest": "shield", "rating": 72},
	{"id": "ecu_nac", "name": "El Nacional", "abbrev": "NAC", "country": "Ecuador", "div": 2,
		"kit": Color("c62828"), "kit2": Color("0d1b4f"), "crest": "star", "rating": 71},
	{"id": "ecu_gua", "name": "Gualaceo", "abbrev": "GUA", "country": "Ecuador", "div": 2,
		"kit": Color("fff200"), "kit2": Color("0a8a3a"), "crest": "round", "rating": 71},
	{"id": "ecu_cum", "name": "Cumbayá", "abbrev": "CUM", "country": "Ecuador", "div": 2,
		"kit": Color("08e8de"), "kit2": Color("111111"), "crest": "diamond", "rating": 71},
	{"id": "ecu_jul", "name": "22 de Julio", "abbrev": "JUL", "country": "Ecuador", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0000cd"), "crest": "banner", "rating": 70},
	{"id": "ecu_pat", "name": "Patria", "abbrev": "PAT", "country": "Ecuador", "div": 2,
		"kit": Color("9a9aa4"), "kit2": Color("9a9aa4"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 70},
	{"id": "ecu_sdq", "name": "Deportivo Quito", "abbrev": "SDQ", "country": "Ecuador", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "shield", "rating": 70},
	{"id": "ecu_ins", "name": "Insutec", "abbrev": "INS", "country": "Ecuador", "div": 2,
		"kit": Color("ff4c00"), "kit2": Color("250947"), "crest": "diamond", "rating": 69},
	{"id": "ecu_ast", "name": "Astillero", "abbrev": "AST", "country": "Ecuador", "div": 2,
		"kit": Color("ffff00"), "kit2": Color("0000ff"), "crest": "round", "rating": 69},
	{"id": "ecu_imb", "name": "Imbabura", "abbrev": "IMB", "country": "Ecuador", "div": 2,
		"kit": Color("0000ff"), "kit2": Color("c62828"), "crest": "shield", "rating": 69},
	{"id": "ecu_buh", "name": "Búhos ULVR", "abbrev": "BUH", "country": "Ecuador", "div": 2,
		"kit": Color("000080"), "kit2": Color("008000"), "crest": "banner", "rating": 69},
	{"id": "ecu_ali", "name": "Alianza", "abbrev": "ALI", "country": "Ecuador", "div": 3,
		"kit": Color("008000"), "kit2": Color("ffffff"), "crest": "halved", "rating": 68},
	{"id": "ecu_min", "name": "Mineros", "abbrev": "MIN", "country": "Ecuador", "div": 2,
		"kit": Color("ffff00"), "kit2": Color("1b3fa0"), "crest": "diamond", "rating": 68},



	{"id": "ecu_avi", "name": "Aviced", "abbrev": "AVI", "country": "Ecuador", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("000000"), "crest": "shield", "rating": 62},
	{"id": "ecu_ldc", "name": "Liga de Cuenca", "abbrev": "LDC", "country": "Ecuador", "div": 3,
		"kit": Color("0000ff"), "kit2": Color("ffffff"), "crest": "shield", "rating": 60},
	{"id": "ecu_esp", "name": "Espoli", "abbrev": "ESP", "country": "Ecuador", "div": 3,
		"kit": Color("0000ff"), "kit2": Color("cccccc"), "crest": "star", "rating": 61},
	{"id": "ecu_ame", "name": "América de Quito", "abbrev": "AME", "country": "Ecuador", "div": 3,
		"kit": Color("008000"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 61},
	{"id": "ecu_pel", "name": "Pelileo", "abbrev": "PEL", "country": "Ecuador", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("db0d15"), "crest": "shield", "rating": 59},
	{"id": "ecu_bcf", "name": "Baños Ciudad de Fuego", "abbrev": "BCF", "country": "Ecuador", "div": 3,
		"kit": Color("000028"), "kit2": Color("ffff00"), "crest": "round", "rating": 59},
	{"id": "ecu_gre", "name": "Grecia", "abbrev": "GRE", "country": "Ecuador", "div": 3,
		"kit": Color("66ccff"), "kit2": Color("004080"), "crest": "banner", "rating": 58},
	{"id": "ecu_juv", "name": "Juventud Italiana", "abbrev": "JUV", "country": "Ecuador", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("0000ff"), "crest": "shield", "rating": 58},
	{"id": "ecu_olm", "name": "Olmedo", "abbrev": "OLM", "country": "Ecuador", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("c62828"), "crest": "shield", "rating": 62},
	{"id": "ecu_lun", "name": "La Unión", "abbrev": "LUN", "country": "Ecuador", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("66cdaa"), "crest": "round", "rating": 58},
	{"id": "ecu_nor", "name": "Norte América", "abbrev": "NOR", "country": "Ecuador", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "ecu_utc", "name": "UT Cotopaxi", "abbrev": "UTC", "country": "Ecuador", "div": 3,
		"kit": Color("0000ff"), "kit2": Color("c62828"), "crest": "shield", "rating": 59},
	{"id": "ecu_eve", "name": "Everest", "abbrev": "EVE", "country": "Ecuador", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("000fff"), "crest": "diamond", "rating": 61},
	{"id": "ecu_pan", "name": "Panamá SC", "abbrev": "PAN", "country": "Ecuador", "div": 3,
		"kit": Color("fff200"), "kit2": Color("000000"), "crest": "banner", "rating": 59},
	{"id": "ecu_aud", "name": "Audaz Octubrino", "abbrev": "AUD", "country": "Ecuador", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("008000"), "pattern": "sash", "kit_b": Color("008000"), "crest": "shield", "rating": 60},
	{"id": "ecu_que", "name": "Deportivo Quevedo", "abbrev": "QUE", "country": "Ecuador", "div": 3,
		"kit": Color("ff0000"), "kit2": Color("000fff"), "crest": "shield", "rating": 61},
	{"id": "ecu_dun", "name": "Dunamis 04", "abbrev": "DUN", "country": "Ecuador", "div": 3,
		"kit": Color("008000"), "kit2": Color("ffff00"), "crest": "star", "rating": 57},
	{"id": "ecu_tra", "name": "Mayor Pedro Traversari", "abbrev": "TRA", "country": "Ecuador", "div": 3,
		"kit": Color("0cb7f2"), "kit2": Color("0a3f7a"), "crest": "round", "rating": 57},





	{"id": "per_uni", "name": "Universitario", "abbrev": "UNI", "country": "Perú", "div": 1,
		"kit": Color("f0e4c8"), "kit2": Color("f0e4c8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "monogram", "rim": "dark", "letter": "U", "rating": 85},
	{"id": "per_ali", "name": "Alianza Lima", "abbrev": "ALI", "country": "Perú", "div": 1,
		"kit": Color("071241"), "kit2": Color("071241"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "monogram", "rim": "dark", "letter": "A", "rating": 85},
	{"id": "per_cri", "name": "Sporting Cristal", "abbrev": "CRI", "country": "Perú", "div": 1,
		"kit": Color("6bc5fd"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "per_cus", "name": "Cusco FC", "abbrev": "CUS", "country": "Perú", "div": 1,
		"kit": Color("eacf75"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 82},
	{"id": "per_mel", "name": "Melgar", "abbrev": "MEL", "country": "Perú", "div": 1,
		"kit": Color("d50000"), "kit2": Color("111111"), "pattern": "half", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "lion", "rim": "dark", "rating": 82},
	{"id": "per_gar", "name": "Deportivo Garcilaso", "abbrev": "GAR", "country": "Perú", "div": 1,
		"kit": Color("5bc6ff"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "per_cie", "name": "Cienciano", "abbrev": "CIE", "country": "Perú", "div": 1,
		"kit": Color("ed0011"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "gold", "rating": 81},
	{"id": "per_aat", "name": "Alianza Atlético", "abbrev": "AAS", "country": "Perú", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("0033bb"), "pattern": "sash", "kit_b": Color("0033bb"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "per_cha", "name": "Los Chankas", "abbrev": "CHA", "country": "Perú", "div": 1,
		"kit": Color("7b0431"), "kit2": Color("7b0431"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "per_hua", "name": "Sport Huancayo", "abbrev": "SHU", "country": "Perú", "div": 1,
		"kit": Color("e00013"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bull", "rim": "dark", "rating": 79},
	{"id": "per_adt", "name": "ADT", "abbrev": "ADT", "country": "Perú", "div": 1,
		"kit": Color("3bb2ff"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "per_gra", "name": "Atlético Grau", "abbrev": "GRA", "country": "Perú", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f20b16"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "per_spb", "name": "Sport Boys", "abbrev": "SBA", "country": "Perú", "div": 1,
		"kit": Color("ffcadd"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "per_cun", "name": "Comerciantes Unidos", "abbrev": "CUN", "country": "Perú", "div": 1,
		"kit": Color("430277"), "kit2": Color("fff420"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 78},
	{"id": "per_jpc", "name": "Juan Pablo II College", "abbrev": "JPC", "country": "Perú", "div": 1,
		"kit": Color("ffef2f"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "per_caj", "name": "FC Cajamarca", "abbrev": "CAJ", "country": "Perú", "div": 1,
		"kit": Color("ffe600"), "kit2": Color("1014c5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "per_utc", "name": "UTC", "abbrev": "UTC", "country": "Perú", "div": 1,
		"kit": Color("fffaec"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 78},
	{"id": "per_moq", "name": "Deportivo Moquegua", "abbrev": "MOQ", "country": "Perú", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},





	{"id": "per_uco", "name": "Unión Comercio", "abbrev": "UCO", "country": "Perú", "div": 2,
		"kit": Color("ff0013"), "kit2": Color("ffffff"), "crest": "shield", "rating": 74},
	{"id": "per_man", "name": "Carlos A. Mannucci", "abbrev": "MAN", "country": "Perú", "div": 2,
		"kit": Color("003fd0"), "kit2": Color("ffffff"), "crest": "shield", "rating": 74},
	{"id": "per_aya", "name": "Ayacucho FC", "abbrev": "AYA", "country": "Perú", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 73},
	{"id": "per_auh", "name": "Alianza Universidad", "abbrev": "AUH", "country": "Perú", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "halved", "rating": 73},
	{"id": "per_cfc", "name": "Comerciantes FC", "abbrev": "CFC", "country": "Perú", "div": 2,
		"kit": Color("00aa2b"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 72},
	{"id": "per_lla", "name": "Deportivo Llacuabamba", "abbrev": "LLA", "country": "Perú", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("28d3ff"), "crest": "diamond", "rating": 72},
	{"id": "per_ben", "name": "Bentín Tacna Heroica", "abbrev": "BTH", "country": "Perú", "div": 2,
		"kit": Color("0038bb"), "kit2": Color("ffffff"), "crest": "banner", "rating": 72},
	{"id": "per_umi", "name": "Unión Minas", "abbrev": "UMI", "country": "Perú", "div": 2,
		"kit": Color("ffe42b"), "kit2": Color("0052b5"), "crest": "shield", "rating": 71},
	{"id": "per_pir", "name": "Pirata FC", "abbrev": "PIR", "country": "Perú", "div": 2,
		"kit": Color("111111"), "kit2": Color("006f45"), "pattern": "stripes", "kit_b": Color("006f45"), "crest": "banner", "rating": 71},
	{"id": "per_ucv", "name": "Universidad César Vallejo", "abbrev": "UCV", "country": "Perú", "div": 2,
		"kit": Color("ff4d00"), "kit2": Color("001a4c"), "crest": "star", "rating": 71},
	{"id": "per_usm", "name": "Universidad San Martín", "abbrev": "USM", "country": "Perú", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0c1732"), "crest": "shield", "rating": 70},
	{"id": "per_ada", "name": "ADA Jaén", "abbrev": "ADA", "country": "Perú", "div": 2,
		"kit": Color("14532d"), "kit2": Color("14532d"), "crest": "diamond", "rating": 70},
	{"id": "per_bin", "name": "Deportivo Binacional", "abbrev": "BIN", "country": "Perú", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 69},
	{"id": "per_san", "name": "Santos FC", "abbrev": "SAN", "country": "Perú", "div": 2,
		"kit": Color("0040d5"), "kit2": Color("ffffff"), "crest": "star", "rating": 69},
	{"id": "per_cni", "name": "Estudiantil CNI", "abbrev": "CNI", "country": "Perú", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("032da7"), "crest": "banner", "rating": 68},
	{"id": "per_can", "name": "Academia Cantolao", "abbrev": "CAN", "country": "Perú", "div": 2,
		"kit": Color("ffd900"), "kit2": Color("111111"), "crest": "round", "rating": 68},
	{"id": "per_usd", "name": "Unión Santo Domingo", "abbrev": "USD", "country": "Perú", "div": 2,
		"kit": Color("008a29"), "kit2": Color("ffffff"), "crest": "halved", "rating": 67},
	{"id": "per_sma", "name": "San Marcos", "abbrev": "SMA", "country": "Perú", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("007146"), "pattern": "stripes", "kit_b": Color("007146"), "crest": "shield", "rating": 67},




	{"id": "per_aur", "name": "Juan Aurich", "abbrev": "AUR", "country": "Perú", "div": 3,
		"kit": Color("ff001a"), "kit2": Color("ffffff"), "crest": "shield", "rating": 64},
	{"id": "per_cau", "name": "Juventud Cautivo", "abbrev": "CAU", "country": "Perú", "div": 3,
		"kit": Color("ffc515"), "kit2": Color("6a1b9a"), "pattern": "half", "kit_b": Color("6a1b9a"), "crest": "star", "rating": 63},
	{"id": "per_spc", "name": "Sporting Company", "abbrev": "SPC", "country": "Perú", "div": 3,
		"kit": Color("5bb8f0"), "kit2": Color("ffffff"), "crest": "round", "rating": 63},
	{"id": "per_pac", "name": "Pacífico FC", "abbrev": "PAC", "country": "Perú", "div": 3,
		"kit": Color("ffaadf"), "kit2": Color("111111"), "crest": "shield", "rating": 62},
	{"id": "per_nac", "name": "Nacional FBC", "abbrev": "NAC", "country": "Perú", "div": 3,
		"kit": Color("ff000d"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "shield", "rating": 62},
	{"id": "per_vsa", "name": "Valle Sagrado", "abbrev": "VSA", "country": "Perú", "div": 3,
		"kit": Color("015b42"), "kit2": Color("ffffff"), "crest": "diamond", "rating": 61},
	{"id": "per_eco", "name": "Ecosem Pasco", "abbrev": "ECO", "country": "Perú", "div": 3,
		"kit": Color("011f8e"), "kit2": Color("ff0000"), "crest": "halved", "rating": 61},
	{"id": "per_ucr", "name": "Deportivo Ucrania", "abbrev": "UCR", "country": "Perú", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("00261a"), "crest": "shield", "rating": 61},
	{"id": "per_anb", "name": "ANBA Perú", "abbrev": "ANB", "country": "Perú", "div": 3,
		"kit": Color("8323b1"), "kit2": Color("ff009f"), "crest": "banner", "rating": 60},
	{"id": "per_vol", "name": "Cultural Volante", "abbrev": "VOL", "country": "Perú", "div": 3,
		"kit": Color("fffdf6"), "kit2": Color("ca001a"), "crest": "halved", "rating": 60},
	{"id": "per_hrl", "name": "Unión Huaral", "abbrev": "UHU", "country": "Perú", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 60},
	{"id": "per_mun", "name": "Deportivo Municipal", "abbrev": "MUN", "country": "Perú", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("c8102e"), "pattern": "sash", "kit_b": Color("c8102e"), "crest": "round", "rating": 60},
	{"id": "per_jhu", "name": "Juventud Huracán", "abbrev": "JHU", "country": "Perú", "div": 3,
		"kit": Color("fd99d9"), "kit2": Color("ffffff"), "crest": "star", "rating": 59},
	{"id": "per_par", "name": "Centro Social Pariacoto", "abbrev": "CSP", "country": "Perú", "div": 3,
		"kit": Color("30d0ff"), "kit2": Color("ffffff"), "crest": "round", "rating": 58},
	{"id": "per_jsd", "name": "Juventud Santo Domingo", "abbrev": "JSD", "country": "Perú", "div": 3,
		"kit": Color("ff9fcf"), "kit2": Color("111111"), "crest": "banner", "rating": 58},
	{"id": "per_pan", "name": "Deportivo Municipal Pangoa", "abbrev": "PAN", "country": "Perú", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("1b3f8c"), "pattern": "sash", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 58},
	{"id": "per_uda", "name": "UDA", "abbrev": "UDA", "country": "Perú", "div": 3,
		"kit": Color("0033cc"), "kit2": Color("ffd200"), "pattern": "band_h", "kit_b": Color("ffd200"), "crest": "diamond", "rating": 57},
	{"id": "per_lut", "name": "Deportivo Lute", "abbrev": "LUT", "country": "Perú", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("0040aa"), "crest": "star", "rating": 57},






	{"id": "bol_bol", "name": "Bolívar", "abbrev": "BOL", "country": "Bolivia", "div": 1,
		"kit": Color("79c3ff"), "kit2": Color("6cb4e4"),
		"shape": "shield", "crest_pattern": "pale", "emblem": "star", "rim": "gold", "rating": 83},
	{"id": "bol_str", "name": "The Strongest", "abbrev": "STR", "country": "Bolivia", "div": 1,
		"kit": Color("f5c400"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "bol_alw", "name": "Always Ready", "abbrev": "ALW", "country": "Bolivia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("dc052d"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "bol_blo", "name": "Blooming", "abbrev": "BLO", "country": "Bolivia", "div": 1,
		"kit": Color("069fff"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "fess", "emblem": "star", "rim": "white", "rating": 81},
	{"id": "bol_ori", "name": "Oriente Petrolero", "abbrev": "ORI", "country": "Bolivia", "div": 1,
		"kit": Color("00712d"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "tower", "rim": "white", "rating": 80},
	{"id": "bol_aur", "name": "Aurora", "abbrev": "AUR", "country": "Bolivia", "div": 1,
		"kit": Color("95dfff"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "halved", "emblem": "sun", "rim": "white", "rating": 79},
	{"id": "bol_wil", "name": "Jorge Wilstermann", "abbrev": "WIL", "country": "Bolivia", "div": 2,
		"kit": Color("ff0000"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "cross", "emblem": "eagle", "rim": "white", "rating": 79},
	{"id": "bol_nap", "name": "Nacional Potosí", "abbrev": "NAP", "country": "Bolivia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("14161a"), "pattern": "sash", "kit_b": Color("d30b16"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "mountain", "rim": "dark", "rating": 80},
	{"id": "bol_rpo", "name": "Real Potosí", "abbrev": "RPO", "country": "Bolivia", "div": 1,
		"kit": Color("5f32a2"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "bordure", "emblem": "crown", "rim": "gold", "rating": 80},
	{"id": "bol_gvs", "name": "GV San José", "abbrev": "GVS", "country": "Bolivia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("0040bf"), "pattern": "chevron", "kit_b": Color("0040bf"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "star", "rim": "dark", "rating": 78},
	{"id": "bol_rto", "name": "Real Oruro", "abbrev": "TRO", "country": "Bolivia", "div": 1,
		"kit": Color("a20025"), "kit2": Color("ffc600"),
		"shape": "round", "crest_pattern": "quartered", "emblem": "crown", "rim": "gold", "rating": 78},
	{"id": "bol_gua", "name": "Guabirá", "abbrev": "GUA", "country": "Bolivia", "div": 1,
		"kit": Color("ef0000"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "pile", "emblem": "leaf", "rim": "white", "rating": 79},
	{"id": "bol_ipe", "name": "Independiente Petrolero", "abbrev": "IPE", "country": "Bolivia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("ec1523"), "pattern": "stripes", "kit_b": Color("ec1523"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "bol_tom", "name": "Real Tomayapo", "abbrev": "RTO", "country": "Bolivia", "div": 1,
		"kit": Color("006e3f"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "tri_stripes", "emblem": "crown", "rim": "white", "rating": 78},
	{"id": "bol_sab", "name": "San Antonio Bulo Bulo", "abbrev": "SAB", "country": "Bolivia", "div": 1,
		"kit": Color("0099ff"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "lozenge", "emblem": "ball", "rim": "white", "rating": 80},
	{"id": "bol_uvi", "name": "Universitario de Vinto", "abbrev": "UVI", "country": "Bolivia", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("b22234"),
		"shape": "round", "crest_pattern": "fess", "emblem": "tree", "rim": "dark", "rating": 78},
	{"id": "bol_abb", "name": "ABB", "abbrev": "ABB", "country": "Bolivia", "div": 1,
		"kit": Color("ffdf00"), "kit2": Color("0040ff"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "monogram", "rim": "dark", "letter": "A", "rating": 78},
	{"id": "bol_sjn", "name": "San Juan", "abbrev": "SJN", "country": "Bolivia", "div": 2,
		"kit": Color("ff4500"), "kit2": Color("009a00"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "sun", "rim": "dark", "rating": 78},



	{"id": "bol_usf", "name": "Universitario de Sucre", "abbrev": "UNI", "country": "Bolivia", "div": 2,
		"kit": Color("d81818"), "kit2": Color("303078"), "pattern": "band_h", "kit_b": Color("303078"), "crest": "shield", "rating": 74},
	{"id": "bol_hua", "name": "Empresa Minera Huanuni", "abbrev": "HUA", "country": "Bolivia", "div": 2,
		"kit": Color("ffff00"), "kit2": Color("000060"), "crest": "shield", "rating": 73},
	{"id": "bol_vir", "name": "Virginia", "abbrev": "VIR", "country": "Bolivia", "div": 2,
		"kit": Color("007500"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "bol_ain", "name": "Atlético Independiente", "abbrev": "AIN", "country": "Bolivia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("1b3f8c"), "pattern": "half", "kit_b": Color("1b3f8c"), "crest": "shield", "rating": 72},
	{"id": "bol_feb", "name": "26 de Febrero", "abbrev": "FEB", "country": "Bolivia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("1b3f8c"), "pattern": "chevron", "kit_b": Color("1b3f8c"), "crest": "shield", "rating": 72},
	{"id": "bol_tiq", "name": "Tiquipaya", "abbrev": "TIQ", "country": "Bolivia", "div": 2,
		"kit": Color("1e8a3c"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "round", "rating": 71},
	{"id": "bol_cnu", "name": "Ciudad Nueva Santa Cruz Academia", "abbrev": "CNS", "country": "Bolivia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("d4af37"), "crest": "diamond", "rating": 71},
	{"id": "bol_pmy", "name": "Primero de Mayo", "abbrev": "PDM", "country": "Bolivia", "div": 2,
		"kit": Color("0b6238"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"), "crest": "banner", "rating": 71},
	{"id": "bol_uta", "name": "Unión Tarija", "abbrev": "UTA", "country": "Bolivia", "div": 2,
		"kit": Color("008000"), "kit2": Color("ffffff"), "crest": "shield", "rating": 71},
	{"id": "bol_fat", "name": "FATIC", "abbrev": "FAT", "country": "Bolivia", "div": 2,
		"kit": Color("f2b705"), "kit2": Color("1b3f8c"), "crest": "round", "rating": 71},
	{"id": "bol_min", "name": "Mineros Potosí", "abbrev": "MIN", "country": "Bolivia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("555555"), "crest": "shield", "rating": 70},
	{"id": "bol_dnw", "name": "10 de Noviembre Wilstermann Cooperativas", "abbrev": "DNW", "country": "Bolivia", "div": 2,
		"kit": Color("f00000"), "kit2": Color("000078"), "crest": "shield", "rating": 70},
	{"id": "bol_tig", "name": "Deportivo Tigres", "abbrev": "TIG", "country": "Bolivia", "div": 2,
		"kit": Color("ffd700"), "kit2": Color("1b3f8c"), "pattern": "band_v", "kit_b": Color("1b3f8c"), "crest": "round", "rating": 70},
	{"id": "bol_chf", "name": "Chaco FC Pando", "abbrev": "CHA", "country": "Bolivia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "shield", "rating": 70},
	{"id": "bol_asu", "name": "Atlético Sucre", "abbrev": "ASU", "country": "Bolivia", "div": 2,
		"kit": Color("001848"), "kit2": Color("c8102e"), "crest": "banner", "rating": 69},
	{"id": "bol_smy", "name": "Deportivo San Martín", "abbrev": "SMA", "country": "Bolivia", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("555555"), "crest": "round", "rating": 69},
	{"id": "bol_his", "name": "Hiska Nacional", "abbrev": "HIS", "country": "Bolivia", "div": 2,
		"kit": Color("1860a8"), "kit2": Color("ffffff"), "crest": "round", "rating": 68},
	{"id": "bol_ing", "name": "Ingenieros", "abbrev": "ING", "country": "Bolivia", "div": 3,
		"kit": Color("0030f0"), "kit2": Color("ffffff"), "crest": "shield", "rating": 67},




	{"id": "bol_rpa", "name": "Royal Pari", "abbrev": "RPA", "country": "Bolivia", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "shield", "rating": 64},
	{"id": "bol_rsc", "name": "Real Santa Cruz", "abbrev": "RSC", "country": "Bolivia", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("e51d2e"), "crest": "round", "rating": 63},
	{"id": "bol_oro", "name": "Oruro Royal", "abbrev": "ORO", "country": "Bolivia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 62},
	{"id": "bol_chp", "name": "Chaco Petrolero", "abbrev": "CHP", "country": "Bolivia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 62},
	{"id": "bol_gag", "name": "García Agreda", "abbrev": "GAG", "country": "Bolivia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "chevron", "kit_b": Color("0a52b8"), "crest": "shield", "rating": 61},
	{"id": "bol_utj", "name": "Universitario de Tarija", "abbrev": "UTJ", "country": "Bolivia", "div": 3,
		"kit": Color("0048c0"), "kit2": Color("d80000"), "crest": "halved", "rating": 61},
	{"id": "bol_upa", "name": "Universitario de Pando", "abbrev": "UPA", "country": "Bolivia", "div": 3,
		"kit": Color("fff312"), "kit2": Color("009d28"), "crest": "round", "rating": 61},
	{"id": "bol_fla", "name": "Flamengo de Sucre", "abbrev": "FLA", "country": "Bolivia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "star", "rating": 60},
	{"id": "bol_fan", "name": "Fancesa", "abbrev": "FAN", "country": "Bolivia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("000000"), "crest": "shield", "rating": 60},
	{"id": "bol_ube", "name": "Universitario del Beni", "abbrev": "UBE", "country": "Bolivia", "div": 3,
		"kit": Color("e51d2e"), "kit2": Color("1f4fa0"), "crest": "round", "rating": 60},
	{"id": "bol_lfp", "name": "Libertad FC Pando", "abbrev": "LIB", "country": "Bolivia", "div": 3,
		"kit": Color("a9a9a9"), "kit2": Color("00a1df"), "crest": "shield", "rating": 59},
	{"id": "bol_gdl", "name": "Guadalajara", "abbrev": "GDL", "country": "Bolivia", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("555555"), "crest": "shield", "rating": 59},
	{"id": "bol_inf", "name": "Ingenio Fútbol", "abbrev": "INF", "country": "Bolivia", "div": 3,
		"kit": Color("ffd700"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 59},
	{"id": "bol_hpl", "name": "Highland Players", "abbrev": "HPL", "country": "Bolivia", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("0a1f3a"), "crest": "banner", "rating": 59},
	{"id": "bol_aju", "name": "Atlético Juniors", "abbrev": "AJU", "country": "Bolivia", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("555555"), "crest": "round", "rating": 58},
	{"id": "bol_kiv", "name": "Kivón", "abbrev": "KIV", "country": "Bolivia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("111111"), "crest": "halved", "rating": 58},
	{"id": "bol_oly", "name": "Olympic", "abbrev": "OLY", "country": "Bolivia", "div": 3,
		"kit": Color("ff7518"), "kit2": Color("ffffff"), "crest": "star", "rating": 58},
	{"id": "bol_lqu", "name": "Deportivo Libertad", "abbrev": "LQU", "country": "Bolivia", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("1e8a3c"), "crest": "shield", "rating": 57},






	{"id": "ven_tac", "name": "Deportivo Táchira", "abbrev": "TAC", "country": "Venezuela", "div": 1,
		"kit": Color("ffd200"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "ven_car", "name": "Caracas FC", "abbrev": "CAR", "country": "Venezuela", "div": 1,
		"kit": Color("e3000f"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "gold", "rating": 81},
	{"id": "ven_ucv", "name": "Universidad Central", "abbrev": "UCV", "country": "Venezuela", "div": 1,
		"kit": Color("1f3fa0"), "kit2": Color("1f3fa0"), "pattern": "half", "kit_b": Color("ffd200"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "ven_met", "name": "Metropolitanos", "abbrev": "MET", "country": "Venezuela", "div": 1,
		"kit": Color("4b1fa0"), "kit2": Color("4b1fa0"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "ven_dlg", "name": "Deportivo La Guaira", "abbrev": "DLG", "country": "Venezuela", "div": 1,
		"kit": Color("ff7400"), "kit2": Color("ff7400"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "ven_cbo", "name": "Carabobo FC", "abbrev": "CBO", "country": "Venezuela", "div": 1,
		"kit": Color("6b1e2b"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "gold", "rating": 80},
	{"id": "ven_apc", "name": "Academia Puerto Cabello", "abbrev": "APC", "country": "Venezuela", "div": 1,
		"kit": Color("ff6013"), "kit2": Color("0a1f6b"), "pattern": "hoops", "kit_b": Color("0a1f6b"),
		"shape": "shield", "crest_pattern": "hoops", "emblem": "tower", "rim": "dark", "rating": 79},
	{"id": "ven_por", "name": "Portuguesa FC", "abbrev": "POR", "country": "Venezuela", "div": 1,
		"kit": Color("d0021b"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ven_esm", "name": "Estudiantes de Mérida", "abbrev": "ESM", "country": "Venezuela", "div": 1,
		"kit": Color("d0021b"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ven_mon", "name": "Monagas SC", "abbrev": "MON", "country": "Venezuela", "div": 1,
		"kit": Color("0a2a7a"), "kit2": Color("0a2a7a"), "pattern": "stripes", "kit_b": Color("8b1a2b"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ven_zam", "name": "Zamora FC", "abbrev": "ZAM", "country": "Venezuela", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ven_ray", "name": "Rayo Zuliano", "abbrev": "RAY", "country": "Venezuela", "div": 1,
		"kit": Color("0b1d6e"), "kit2": Color("00aeef"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "bolt", "rim": "white", "rating": 78},
	{"id": "ven_tru", "name": "Trujillanos FC", "abbrev": "TRU", "country": "Venezuela", "div": 1,
		"kit": Color("ffd700"), "kit2": Color("ffd700"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "mountain", "rim": "dark", "rating": 78},
	{"id": "ven_anz", "name": "Anzoátegui FC", "abbrev": "ANZ", "country": "Venezuela", "div": 1,
		"kit": Color("ffd200"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ven_lar", "name": "Deportivo Lara", "abbrev": "LAR", "country": "Venezuela", "div": 2,
		"kit": Color("d0021b"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ven_bqs", "name": "Barquisimeto SC", "abbrev": "BAR", "country": "Venezuela", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("1b3f8c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ven_ure", "name": "Ureña SC", "abbrev": "URE", "country": "Venezuela", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("1f7a3a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ven_dmi", "name": "Deportivo Miranda", "abbrev": "DMI", "country": "Venezuela", "div": 2,
		"kit": Color("1d4fb5"), "kit2": Color("d0021b"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 78},





	{"id": "ven_yar", "name": "Yaracuyanos FC", "abbrev": "YAR", "country": "Venezuela", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0033a0"), "crest": "shield", "rating": 74},
	{"id": "ven_ara", "name": "Aragua FC", "abbrev": "ARA", "country": "Venezuela", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("de0d0d"), "pattern": "sleeves", "kit_b": Color("de0d0d"), "crest": "shield", "rating": 72},
	{"id": "ven_mob", "name": "Monagas SC B", "abbrev": "MOB", "country": "Venezuela", "div": 2,
		"kit": Color("0a2a7a"), "kit2": Color("0a2a7a"), "pattern": "stripes", "kit_b": Color("8b1a2b"), "crest": "shield", "rating": 72},
	{"id": "ven_zmb", "name": "Zamora FC B", "abbrev": "ZMB", "country": "Venezuela", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "shield", "rating": 72},
	{"id": "ven_bol", "name": "Bolívar SC", "abbrev": "BOL", "country": "Venezuela", "div": 2,
		"kit": Color("0072a0"), "kit2": Color("ffffff"), "crest": "round", "rating": 72},
	{"id": "ven_aba", "name": "Atlético Barinas", "abbrev": "ABA", "country": "Venezuela", "div": 2,
		"kit": Color("1b3f8c"), "kit2": Color("ffffff"), "crest": "shield", "rating": 71},
	{"id": "ven_apb", "name": "Academia Puerto Cabello B", "abbrev": "APB", "country": "Venezuela", "div": 2,
		"kit": Color("ff6013"), "kit2": Color("0a1f6b"), "pattern": "hoops", "kit_b": Color("0a1f6b"), "crest": "shield", "rating": 71},
	{"id": "ven_dyp", "name": "Dynamo Puerto FC", "abbrev": "DYP", "country": "Venezuela", "div": 2,
		"kit": Color("75aadb"), "kit2": Color("75aadb"), "crest": "round", "rating": 71},
	{"id": "ven_rfr", "name": "Real Frontera SC", "abbrev": "RFR", "country": "Venezuela", "div": 2,
		"kit": Color("1f3f99"), "kit2": Color("9b1b30"), "crest": "shield", "rating": 70},
	{"id": "ven_mdg", "name": "Mineros de Guayana", "abbrev": "MDG", "country": "Venezuela", "div": 2,
		"kit": Color("0033a0"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"), "crest": "shield", "rating": 70},
	{"id": "ven_mlg", "name": "Marítimo de La Guaira", "abbrev": "MLG", "country": "Venezuela", "div": 2,
		"kit": Color("008000"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("d0021b"), "crest": "round", "rating": 70},
	{"id": "ven_pcl", "name": "Parcell FC", "abbrev": "PAR", "country": "Venezuela", "div": 2,
		"kit": Color("1f7a3a"), "kit2": Color("111111"), "crest": "shield", "rating": 70},
	{"id": "ven_aev", "name": "Atlético El Vigía", "abbrev": "AEV", "country": "Venezuela", "div": 2,
		"kit": Color("ffd700"), "kit2": Color("007722"), "crest": "shield", "rating": 69},
	{"id": "ven_gua", "name": "Guárico FC", "abbrev": "GUA", "country": "Venezuela", "div": 2,
		"kit": Color("003399"), "kit2": Color("003399"), "crest": "shield", "rating": 69},
	{"id": "ven_mnv", "name": "Minervén", "abbrev": "MIN", "country": "Venezuela", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0033cc"), "pattern": "sleeves", "kit_b": Color("0033cc"), "crest": "shield", "rating": 69},
	{"id": "ven_cat", "name": "Catia FC", "abbrev": "CAT", "country": "Venezuela", "div": 3,
		"kit": Color("1f7a3a"), "kit2": Color("f2c200"), "crest": "round", "rating": 68},
	{"id": "ven_ula", "name": "Unión Lara SC", "abbrev": "ULA", "country": "Venezuela", "div": 2,
		"kit": Color("d0021b"), "kit2": Color("ffffff"), "crest": "shield", "rating": 68},
	{"id": "ven_uam", "name": "FundaUAM", "abbrev": "UAM", "country": "Venezuela", "div": 3,
		"kit": Color("d0021b"), "kit2": Color("0055ff"), "pattern": "stripes", "kit_b": Color("0055ff"), "crest": "shield", "rating": 67},




	{"id": "ven_ufc", "name": "Ureña FC", "abbrev": "UFC", "country": "Venezuela", "div": 3,
		"kit": Color("1f7a3a"), "kit2": Color("f2c200"), "crest": "shield", "rating": 63},
	{"id": "ven_eme", "name": "Academia Emeritense", "abbrev": "EME", "country": "Venezuela", "div": 3,
		"kit": Color("1a0b52"), "kit2": Color("f2c200"), "crest": "shield", "rating": 62},
	{"id": "ven_chv", "name": "Centro Hispano", "abbrev": "CHV", "country": "Venezuela", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "sleeves", "kit_b": Color("14161a"), "crest": "shield", "rating": 62},
	{"id": "ven_mnt", "name": "Minet FC", "abbrev": "MNT", "country": "Venezuela", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("d0021b"), "crest": "round", "rating": 62},
	{"id": "ven_rey", "name": "Academia Rey", "abbrev": "REY", "country": "Venezuela", "div": 3,
		"kit": Color("1b3f8c"), "kit2": Color("f2c200"), "crest": "shield", "rating": 61},
	{"id": "ven_yfc", "name": "Yaritagua FC", "abbrev": "YFC", "country": "Venezuela", "div": 3,
		"kit": Color("ffd700"), "kit2": Color("ffd700"), "pattern": "sleeves", "kit_b": Color("0a7a3c"), "crest": "round", "rating": 61},
	{"id": "ven_gmo", "name": "El Guamo FC", "abbrev": "GMO", "country": "Venezuela", "div": 3,
		"kit": Color("d0021b"), "kit2": Color("111111"), "crest": "shield", "rating": 61},
	{"id": "ven_jye", "name": "Jesús Yendis FC", "abbrev": "JYE", "country": "Venezuela", "div": 3,
		"kit": Color("1b3f8c"), "kit2": Color("f2c200"), "crest": "round", "rating": 60},
	{"id": "ven_jgd", "name": "JGD FC", "abbrev": "JGD", "country": "Venezuela", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("d0021b"), "pattern": "stripes", "kit_b": Color("d0021b"), "crest": "shield", "rating": 60},
	{"id": "ven_aeo", "name": "Academia Erick Ortega", "abbrev": "AEO", "country": "Venezuela", "div": 3,
		"kit": Color("ffd700"), "kit2": Color("111111"), "crest": "shield", "rating": 60},
	{"id": "ven_dza", "name": "Deportivo Zamora FC", "abbrev": "DZA", "country": "Venezuela", "div": 3,
		"kit": Color("111111"), "kit2": Color("ffffff"), "crest": "shield", "rating": 60},
	{"id": "ven_tdp", "name": "Talentos de Primera", "abbrev": "TDP", "country": "Venezuela", "div": 3,
		"kit": Color("1f7a3a"), "kit2": Color("d0021b"), "crest": "round", "rating": 59},
	{"id": "ven_mrr", "name": "El Morro FC", "abbrev": "MRR", "country": "Venezuela", "div": 3,
		"kit": Color("1b3f8c"), "kit2": Color("111111"), "crest": "shield", "rating": 59},
	{"id": "ven_opt", "name": "Optidelpa FC", "abbrev": "OPT", "country": "Venezuela", "div": 3,
		"kit": Color("1b3f8c"), "kit2": Color("d0021b"), "crest": "shield", "rating": 59},
	{"id": "ven_ane", "name": "Alianza Nueva Esparta", "abbrev": "ANE", "country": "Venezuela", "div": 3,
		"kit": Color("111111"), "kit2": Color("d0021b"), "crest": "shield", "rating": 59},
	{"id": "ven_aji", "name": "Academia Jiménez", "abbrev": "AJI", "country": "Venezuela", "div": 3,
		"kit": Color("1f7a3a"), "kit2": Color("1b3f8c"), "crest": "round", "rating": 58},
	{"id": "ven_vbr", "name": "Villa Bruzual", "abbrev": "VBR", "country": "Venezuela", "div": 3,
		"kit": Color("d0021b"), "kit2": Color("ffffff"), "crest": "round", "rating": 58},
	{"id": "ven_ccv", "name": "Country Club Valera", "abbrev": "CCV", "country": "Venezuela", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("1f7a3a"), "crest": "round", "rating": 57},















	{"id": "mar_rsb", "name": "RS Berkane", "abbrev": "RSB", "country": "Marruecos", "div": 1,
		"kit": Color("ff6c00"), "kit2": Color("101114"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 88},
	{"id": "mar_far", "name": "AS FAR", "abbrev": "FAR", "country": "Marruecos", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "crown", "emblem_tone": "gold", "rim": "gold", "rating": 87},
	{"id": "mar_rca", "name": "Raja CA", "abbrev": "RCA", "country": "Marruecos", "div": 1,
		"kit": Color("0b8a3c"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "eagle", "emblem_tone": "silver", "rim": "white", "rating": 87},
	{"id": "mar_wac", "name": "Wydad AC", "abbrev": "WAC", "country": "Marruecos", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "silver", "rim": "white", "rating": 86},
	{"id": "mar_mas", "name": "Maghreb Fez", "abbrev": "MAS", "country": "Marruecos", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "mar_dhj", "name": "Difaâ El Jadidi", "abbrev": "DHJ", "country": "Marruecos", "div": 1,
		"kit": Color("008a3e"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "mar_irt", "name": "IR Tanger", "abbrev": "IRT", "country": "Marruecos", "div": 1,
		"kit": Color("2f7fd6"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "horse", "rim": "dark", "rating": 83},
	{"id": "mar_fus", "name": "FUS Rabat", "abbrev": "FUS", "country": "Marruecos", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "mar_kcm", "name": "KAC Marrakech", "abbrev": "KAC", "country": "Marruecos", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 82},
	{"id": "mar_cod", "name": "COD Meknès", "abbrev": "COD", "country": "Marruecos", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 82},
	{"id": "mar_hus", "name": "Hassania Agadir", "abbrev": "HUS", "country": "Marruecos", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "mar_rcz", "name": "RCA Zemamra", "abbrev": "RCZ", "country": "Marruecos", "div": 1,
		"kit": Color("1f4fa0"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "mar_ocs", "name": "Olympic Safi", "abbrev": "OCS", "country": "Marruecos", "div": 1,
		"kit": Color("12307a"), "kit2": Color("d71920"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 80},
	{"id": "mar_mat", "name": "MA Tétouan", "abbrev": "MAT", "country": "Marruecos", "div": 2,
		"kit": Color("d71920"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "mar_uts", "name": "UTS Rabat", "abbrev": "UTS", "country": "Marruecos", "div": 1,
		"kit": Color("f0b52a"), "kit2": Color("101114"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "mar_usy", "name": "US Yacoub El Mansour", "abbrev": "USY", "country": "Marruecos", "div": 1,
		"kit": Color("0046ad"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "mar_odc", "name": "Olympique Dcheira", "abbrev": "ODC", "country": "Marruecos", "div": 1,
		"kit": Color("008633"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "mar_wst", "name": "Wydad Témara", "abbrev": "WST", "country": "Marruecos", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("d71920"), "pattern": "stripes", "kit_b": Color("d71920"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},

	{"id": "mar_tiz", "name": "US Amal Tiznit", "abbrev": "UAT", "country": "Marruecos", "div": 2,
		"kit": Color("3a6fe0"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 75},
	{"id": "mar_jsm", "name": "JS Massira", "abbrev": "JSM", "country": "Marruecos", "div": 2,
		"kit": Color("fff000"), "kit2": Color("d71920"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 74},
	{"id": "mar_cak", "name": "Chabab Atlas Khénifra", "abbrev": "CAK", "country": "Marruecos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 73},
	{"id": "mar_jss", "name": "JS Soualem", "abbrev": "JSS", "country": "Marruecos", "div": 2,
		"kit": Color("101114"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "mar_stm", "name": "Stade Marocain", "abbrev": "SMR", "country": "Marruecos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "mar_waf", "name": "Wydad Fès", "abbrev": "WAF", "country": "Marruecos", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "mar_usm", "name": "USM Oujda", "abbrev": "USM", "country": "Marruecos", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "mar_mco", "name": "MC Oujda", "abbrev": "MCO", "country": "Marruecos", "div": 2,
		"kit": Color("007a33"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "crown", "emblem_tone": "gold", "rim": "dark", "rating": 71},
	{"id": "mar_scc", "name": "SCC Mohammédia", "abbrev": "SCC", "country": "Marruecos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "mar_cjb", "name": "CJ Ben Guerir", "abbrev": "CJB", "country": "Marruecos", "div": 2,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "mar_ken", "name": "Kénitra AC", "abbrev": "KEN", "country": "Marruecos", "div": 2,
		"kit": Color("008a3e"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "horse", "rim": "dark", "rating": 70},
	{"id": "mar_usb", "name": "US Boujaâd", "abbrev": "USB", "country": "Marruecos", "div": 2,
		"kit": Color("1f8a3e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "mar_ock", "name": "OC Khouribga", "abbrev": "OCK", "country": "Marruecos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 69},
	{"id": "mar_rbm", "name": "Raja Beni Mellal", "abbrev": "RBM", "country": "Marruecos", "div": 2,
		"kit": Color("007a33"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "mar_izk", "name": "IZ Khemisset", "abbrev": "IZK", "country": "Marruecos", "div": 2,
		"kit": Color("d71920"), "kit2": Color("0b7a3c"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "horse", "rim": "dark", "rating": 68},
	{"id": "mar_rac", "name": "Racing Casablanca", "abbrev": "RAC", "country": "Marruecos", "div": 2,
		"kit": Color("ffffff"), "kit2": Color("0b7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "mar_roz", "name": "RC Oued Zem", "abbrev": "RCO", "country": "Marruecos", "div": 2,
		"kit": Color("1f3fd0"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "mar_asm", "name": "AS Mansouria", "abbrev": "ASM", "country": "Marruecos", "div": 3,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},












	{"id": "mar_cay", "name": "CAY Berrechid", "abbrev": "CAY", "country": "Marruecos", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "mar_crb", "name": "Rachad Bernoussi", "abbrev": "CRB", "country": "Marruecos", "div": 3,
		"kit": Color("12307a"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "mar_mol", "name": "Mouloudia Assa", "abbrev": "MOA", "country": "Marruecos", "div": 3,
		"kit": Color("101114"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "mar_wse", "name": "Wydad Serghini", "abbrev": "WAS", "country": "Marruecos", "div": 3,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "mar_cch", "name": "Chabab Houara", "abbrev": "CCH", "country": "Marruecos", "div": 3,
		"kit": Color("fff000"), "kit2": Color("101114"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "mar_oly", "name": "Olympique Youssoufia", "abbrev": "OLY", "country": "Marruecos", "div": 3,
		"kit": Color("88bbff"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "mar_frn", "name": "Fath de Nador", "abbrev": "FRN", "country": "Marruecos", "div": 3,
		"kit": Color("bf0000"), "kit2": Color("12307a"), "pattern": "stripes", "kit_b": Color("12307a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "mar_olm", "name": "Olympique Marrakech", "abbrev": "OLM", "country": "Marruecos", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("d71920"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "mar_cww", "name": "CWW Casablanca", "abbrev": "CWW", "country": "Marruecos", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "mar_tas", "name": "Tihad AS", "abbrev": "TAS", "country": "Marruecos", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("d71920"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "mar_sal", "name": "AS Salé", "abbrev": "SAL", "country": "Marruecos", "div": 3,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "mar_ust", "name": "US Témara", "abbrev": "UST", "country": "Marruecos", "div": 3,
		"kit": Color("0046ad"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "mar_ejs", "name": "EJS Casablanca", "abbrev": "EJS", "country": "Marruecos", "div": 3,
		"kit": Color("fff000"), "kit2": Color("008000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 59},
	{"id": "mar_crh", "name": "CR Al Hoceima", "abbrev": "CRH", "country": "Marruecos", "div": 3,
		"kit": Color("1f4fa0"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "mar_han", "name": "HA Nador", "abbrev": "HAN", "country": "Marruecos", "div": 3,
		"kit": Color("006600"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "mar_jsk", "name": "JS Kasba Tadla", "abbrev": "JSK", "country": "Marruecos", "div": 3,
		"kit": Color("d71920"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "mar_usk", "name": "US Sidi Kacem", "abbrev": "USK", "country": "Marruecos", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 57},
	{"id": "mar_irf", "name": "IR Fkih Ben Salah", "abbrev": "IRF", "country": "Marruecos", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 57},













	{"id": "tun_est", "name": "Espérance de Tunis", "abbrev": "EST", "country": "Túnez", "div": 1,
		"kit": Color("d71920"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f7d117"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 87},
	{"id": "tun_caf", "name": "Club Africain", "abbrev": "CAF", "country": "Túnez", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "hoops", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "tun_css", "name": "CS Sfaxien", "abbrev": "CSS", "country": "Túnez", "div": 1,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 85},
	{"id": "tun_ess", "name": "Étoile du Sahel", "abbrev": "ESS", "country": "Túnez", "div": 1,
		"kit": Color("e2001a"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "silver", "rim": "white", "rating": 84},
	{"id": "tun_usm", "name": "US Monastir", "abbrev": "USM", "country": "Túnez", "div": 1,
		"kit": Color("0047ab"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "white", "rating": 83},
	{"id": "tun_stu", "name": "Stade Tunisien", "abbrev": "STU", "country": "Túnez", "div": 1,
		"kit": Color("009639"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("e30613"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "crown", "emblem_tone": "gold", "rim": "dark", "rating": 83},
	{"id": "tun_esz", "name": "ES Zarzis", "abbrev": "ESZ", "country": "Túnez", "div": 1,
		"kit": Color("ffd100"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "anchor", "rim": "dark", "rating": 82},
	{"id": "tun_ubg", "name": "US Ben Guerdane", "abbrev": "UBG", "country": "Túnez", "div": 1,
		"kit": Color("ffdd00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "horse", "rim": "dark", "rating": 81},
	{"id": "tun_esm", "name": "ES Métlaoui", "abbrev": "ESM", "country": "Túnez", "div": 1,
		"kit": Color("ffd100"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("e30613"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 81},
	{"id": "tun_cab", "name": "CA Bizertin", "abbrev": "CAB", "country": "Túnez", "div": 1,
		"kit": Color("ffdd00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "ship", "rim": "dark", "rating": 80},
	{"id": "tun_jso", "name": "JS El Omrane", "abbrev": "JSO", "country": "Túnez", "div": 1,
		"kit": Color("1a2a80"), "kit2": Color("ffd300"), "pattern": "band_h", "kit_b": Color("ffd300"),
		"shape": "shield", "crest_pattern": "fess", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "tun_asm", "name": "AS Marsa", "abbrev": "ASM", "country": "Túnez", "div": 1,
		"kit": Color("199844"), "kit2": Color("ffd700"),
		"shape": "round", "crest_pattern": "halved", "emblem": "leaf", "rim": "dark", "rating": 80},
	{"id": "tun_obj", "name": "Olympique Béja", "abbrev": "OLB", "country": "Túnez", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("d71920"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "tun_jsk", "name": "JS Kairouan", "abbrev": "JSK", "country": "Túnez", "div": 1,
		"kit": Color("005e21"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "crescent", "rim": "dark", "rating": 79},
	{"id": "tun_sol", "name": "AS Soliman", "abbrev": "SOL", "country": "Túnez", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("0a8a3a"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "tun_asg", "name": "AS Gabès", "abbrev": "ASG", "country": "Túnez", "div": 1,
		"kit": Color("111111"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("d71920"),
		"shape": "shield", "crest_pattern": "hoops", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "tun_ehs", "name": "ES Hammam-Sousse", "abbrev": "EHS", "country": "Túnez", "div": 2,
		"kit": Color("f3e20c"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "tun_pss", "name": "PS Sakiet Eddaïer", "abbrev": "PSS", "country": "Túnez", "div": 2,
		"kit": Color("2b60de"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 79},

	{"id": "tun_csh", "name": "CS Hammam-Lif", "abbrev": "CSH", "country": "Túnez", "div": 2,
		"kit": Color("00936b"), "kit2": Color("ffffff"), "pattern": "hoops", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 75},
	{"id": "tun_stg", "name": "Stade Gabésien", "abbrev": "STG", "country": "Túnez", "div": 2,
		"kit": Color("0a8a3a"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 74},
	{"id": "tun_ust", "name": "US Tataouine", "abbrev": "UST", "country": "Túnez", "div": 2,
		"kit": Color("0011a8"), "kit2": Color("0011a8"), "pattern": "stripes", "kit_b": Color("d71920"),
		"shape": "round", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 74},
	{"id": "tun_ask", "name": "AS Kasserine", "abbrev": "ASK", "country": "Túnez", "div": 2,
		"kit": Color("198052"), "kit2": Color("198052"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "mountain", "rim": "dark", "rating": 73},
	{"id": "tun_srs", "name": "Sfax Railway Sport", "abbrev": "SRS", "country": "Túnez", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "gear", "rim": "dark", "rating": 72},
	{"id": "tun_jen", "name": "Jendouba Sport", "abbrev": "JEN", "country": "Túnez", "div": 2,
		"kit": Color("ed2024"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "tun_gaf", "name": "EGS Gafsa", "abbrev": "EGS", "country": "Túnez", "div": 2,
		"kit": Color("f7e384"), "kit2": Color("00800a"), "pattern": "stripes", "kit_b": Color("00800a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "sun", "rim": "dark", "rating": 71},
	{"id": "tun_kor", "name": "CS Korba", "abbrev": "CSK", "country": "Túnez", "div": 2,
		"kit": Color("009f3c"), "kit2": Color("f4eb27"), "pattern": "hoops", "kit_b": Color("f4eb27"),
		"shape": "round", "crest_pattern": "hoops", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "tun_scb", "name": "SC Ben Arous", "abbrev": "SCB", "country": "Túnez", "div": 2,
		"kit": Color("141929"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "tun_ock", "name": "OC Kerkennah", "abbrev": "OCK", "country": "Túnez", "div": 2,
		"kit": Color("66ccff"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "trident", "rim": "white", "rating": 70},
	{"id": "tun_csc", "name": "CS Chebba", "abbrev": "CSC", "country": "Túnez", "div": 2,
		"kit": Color("0080ff"), "kit2": Color("1b8f3a"),
		"shape": "round", "crest_pattern": "halved", "emblem": "crescent", "rim": "dark", "rating": 70},
	{"id": "tun_bou", "name": "ES Bouchemma", "abbrev": "ESB", "country": "Túnez", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "tun_msk", "name": "CS M'saken", "abbrev": "CSM", "country": "Túnez", "div": 2,
		"kit": Color("dd2200"), "kit2": Color("c8102e"), "pattern": "band_h", "kit_b": Color("1b8f3a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crescent", "rim": "dark", "rating": 69},
	{"id": "tun_ari", "name": "AS Ariana", "abbrev": "ARI", "country": "Túnez", "div": 2,
		"kit": Color("141929"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "white", "rating": 69},
	{"id": "tun_bsb", "name": "BS Bou Hajla", "abbrev": "BSB", "country": "Túnez", "div": 2,
		"kit": Color("00ad3c"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "tun_kse", "name": "US Ksour Essef", "abbrev": "UKE", "country": "Túnez", "div": 2,
		"kit": Color("00b300"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "tun_meg", "name": "Mégrine Sport", "abbrev": "MEG", "country": "Túnez", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "tun_red", "name": "CS Redeyef", "abbrev": "CSR", "country": "Túnez", "div": 2,
		"kit": Color("2b60de"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "crescent", "rim": "white", "rating": 67},










	{"id": "tun_mah", "name": "EM Mahdia", "abbrev": "EMM", "country": "Túnez", "div": 3,
		"kit": Color("1952cd"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "ship", "rim": "dark", "rating": 64},
	{"id": "tun_aga", "name": "AS Agareb", "abbrev": "ASA", "country": "Túnez", "div": 3,
		"kit": Color("d63232"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "star", "rim": "dark", "rating": 63},
	{"id": "tun_kal", "name": "Kalâa Sport", "abbrev": "KAL", "country": "Túnez", "div": 3,
		"kit": Color("e30613"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "tun_mok", "name": "SC Moknine", "abbrev": "SCM", "country": "Túnez", "div": 3,
		"kit": Color("e30613"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "tun_kef", "name": "Olympique du Kef", "abbrev": "OLK", "country": "Túnez", "div": 3,
		"kit": Color("df0915"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "mountain", "rim": "dark", "rating": 62},
	{"id": "tun_med", "name": "CO Médenine", "abbrev": "COM", "country": "Túnez", "div": 3,
		"kit": Color("ffcc00"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "tun_bkh", "name": "ES Béni Khalled", "abbrev": "EBK", "country": "Túnez", "div": 3,
		"kit": Color("dd0000"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 61},
	{"id": "tun_sso", "name": "Stade Soussien", "abbrev": "SSO", "country": "Túnez", "div": 3,
		"kit": Color("ffffff"), "kit2": Color("0a9948"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "tun_ubs", "name": "US Bousalem", "abbrev": "USB", "country": "Túnez", "div": 3,
		"kit": Color("ec4336"), "kit2": Color("114fa2"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "tun_smb", "name": "SA Menzel Bourguiba", "abbrev": "SMB", "country": "Túnez", "div": 3,
		"kit": Color("0a9948"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 60},
	{"id": "tun_cot", "name": "CO Transports", "abbrev": "COT", "country": "Túnez", "div": 3,
		"kit": Color("1d0f81"), "kit2": Color("111111"), "pattern": "stripes", "kit_b": Color("111111"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "gear", "rim": "dark", "rating": 60},
	{"id": "tun_jil", "name": "AS Jilma", "abbrev": "ASJ", "country": "Túnez", "div": 3,
		"kit": Color("dd0000"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "eagle", "rim": "dark", "rating": 59},
	{"id": "tun_nab", "name": "Stade Nabeulien", "abbrev": "STN", "country": "Túnez", "div": 3,
		"kit": Color("f88017"), "kit2": Color("00800a"), "pattern": "stripes", "kit_b": Color("00800a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "tun_jer", "name": "ES Jerba Midoun", "abbrev": "ESJ", "country": "Túnez", "div": 3,
		"kit": Color("0064d2"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "dark", "rating": 59},
	{"id": "tun_oel", "name": "AS Oued Ellil", "abbrev": "ASO", "country": "Túnez", "div": 3,
		"kit": Color("0000ff"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "tun_rad", "name": "ES Radès", "abbrev": "ESR", "country": "Túnez", "div": 3,
		"kit": Color("0055ff"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 58},
	{"id": "tun_sbz", "name": "EO Sidi Bouzid", "abbrev": "EOS", "country": "Túnez", "div": 3,
		"kit": Color("005e21"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 57},
	{"id": "tun_rog", "name": "ES Rogba", "abbrev": "ERT", "country": "Túnez", "div": 3,
		"kit": Color("1c4cb2"), "kit2": Color("ffffff"), "pattern": "stripes", "kit_b": Color("ffffff"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 57},







	{"id": "elc", "name": "Elche", "abbrev": "ELC", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_h", "kit_b": Color("0b8a3c"), "crest": "shield", "rating": 76},
	{"id": "almu", "name": "Almería", "abbrev": "ALM", "country": "España", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 75},
	{"id": "gra", "name": "Granada", "abbrev": "GRA", "country": "España", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 75},
	{"id": "albc", "name": "Albacete", "abbrev": "ALB", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 74},
	{"id": "burg", "name": "Burgos", "abbrev": "BUR", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "banner", "rating": 74},
	{"id": "cas", "name": "Castellón", "abbrev": "CAS", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 73},
	{"id": "cba", "name": "Córdoba", "abbrev": "CBA", "country": "España", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0a5f3c"), "crest": "shield", "rating": 73},
	{"id": "mag", "name": "Málaga", "abbrev": "MAG", "country": "España", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "dpc", "name": "Deportivo", "abbrev": "DPC", "country": "España", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 72},
	{"id": "ibi", "name": "Ibiza", "abbrev": "IBI", "country": "España", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "diamond", "rating": 65},
	{"id": "cul", "name": "Cultural Leonesa", "abbrev": "CUL", "country": "España", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "zmo", "name": "Zamora", "abbrev": "ZAM", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "mer", "name": "Mérida", "abbrev": "MER", "country": "España", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "our", "name": "Ourense", "abbrev": "OUR", "country": "España", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 63},
	{"id": "are", "name": "Arenteiro", "abbrev": "ARE", "country": "España", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 63},
	{"id": "avi", "name": "Real Avilés", "abbrev": "AVI", "country": "España", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a63b0"), "pattern": "stripes", "kit_b": Color("0a63b0"), "crest": "diamond", "rating": 62},
	{"id": "agu", "name": "Águilas", "abbrev": "AGU", "country": "España", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "wba", "name": "West Bromwich", "abbrev": "WBA", "country": "Inglaterra", "div": 2,
		"kit": Color("0a2c6e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 74},
	{"id": "mid", "name": "Middlesbrough", "abbrev": "MID", "country": "Inglaterra", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 74},
	{"id": "covc", "name": "Coventry", "abbrev": "COV", "country": "Inglaterra", "div": 2,
		"kit": Color("8ac6ff"), "kit2": Color("1b2a55"), "crest": "diamond", "rating": 73},
	{"id": "stk", "name": "Stoke City", "abbrev": "STK", "country": "Inglaterra", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 73},
	{"id": "hul", "name": "Hull City", "abbrev": "HUL", "country": "Inglaterra", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "shape": "shield", "emblem": "lion", "rating": 72},
	{"id": "swa", "name": "Swansea City", "abbrev": "SWA", "country": "Inglaterra", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 72},
	{"id": "cdf", "name": "Cardiff City", "abbrev": "CDF", "country": "Inglaterra", "div": 3,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "emblem": "dragon", "rating": 67},
	{"id": "pne", "name": "Preston North End", "abbrev": "PNE", "country": "Inglaterra", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a2c6e"), "crest": "round", "rating": 71},
	{"id": "brc", "name": "Bristol City", "abbrev": "BRC", "country": "Inglaterra", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "shape": "shield", "emblem": "ship", "rating": 70},
	{"id": "qpr", "name": "Queens Park Rangers", "abbrev": "QPR", "country": "Inglaterra", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("0a3f8c"), "crest": "star", "rating": 70},
	{"id": "hud", "name": "Huddersfield", "abbrev": "HUD", "country": "Inglaterra", "div": 3,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 63},
	{"id": "bir", "name": "Birmingham City", "abbrev": "BIR", "country": "Inglaterra", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 67},
	{"id": "pmo", "name": "Portsmouth", "abbrev": "POR", "country": "Inglaterra", "div": 2,
		"kit": Color("0a63b0"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 67},
	{"id": "wyc", "name": "Wycombe", "abbrev": "WYC", "country": "Inglaterra", "div": 3,
		"kit": Color("0a2c6e"), "kit2": Color("0a2340"), "pattern": "quarters", "kit_b": Color("8ac6ff"), "crest": "halved", "rating": 62},
	{"id": "lor", "name": "Leyton Orient", "abbrev": "LOR", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 61},
	{"id": "exe", "name": "Exeter City", "abbrev": "EXE", "country": "Inglaterra", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 61},
	{"id": "cbu", "name": "Cambridge United", "abbrev": "CBU", "country": "Inglaterra", "div": 3,
		"kit": Color("e8b40a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 60},
	{"id": "bta", "name": "Burton Albion", "abbrev": "BTA", "country": "Inglaterra", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "star", "rating": 60},
	{"id": "mnt", "name": "Mantova", "abbrev": "MNT", "country": "Italia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash_r", "kit_b": Color("c8102e"), "crest": "shield", "rating": 71},
	{"id": "brsc", "name": "Brescia", "abbrev": "BSC", "country": "Italia", "div": 2,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 71},
	{"id": "spe", "name": "Spezia", "abbrev": "SPE", "country": "Italia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "diamond", "rating": 70},
	{"id": "frs", "name": "Frosinone", "abbrev": "FRO", "country": "Italia", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("0a3f8c"), "pattern": "stripes", "kit_b": Color("0a3f8c"), "crest": "star", "rating": 70},
	{"id": "saln", "name": "Salernitana", "abbrev": "SLR", "country": "Italia", "div": 2,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "pis", "name": "Pisa", "abbrev": "PIS", "country": "Italia", "div": 2,
		"kit": Color("14161a"), "kit2": Color("0a3f8c"), "pattern": "stripes", "kit_b": Color("0a3f8c"), "crest": "halved", "rating": 69},
	{"id": "cit", "name": "Cittadella", "abbrev": "CIT", "country": "Italia", "div": 2,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "mod", "name": "Modena", "abbrev": "MOD", "country": "Italia", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("0a52b8"), "crest": "round", "rating": 68},
	{"id": "ctz", "name": "Catanzaro", "abbrev": "CTZ", "country": "Italia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 67},
	{"id": "sud", "name": "Südtirol", "abbrev": "SUD", "country": "Italia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "star", "rating": 67},
	{"id": "bnv", "name": "Benevento", "abbrev": "BNV", "country": "Italia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 60},
	{"id": "jst", "name": "Juve Stabia", "abbrev": "JST", "country": "Italia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("0a2340"), "crest": "star", "rating": 59},
	{"id": "cst", "name": "Casertana", "abbrev": "CST", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "banner", "rating": 59},
	{"id": "tar", "name": "Taranto", "abbrev": "TAR", "country": "Italia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a3f8c"), "pattern": "stripes", "kit_b": Color("0a3f8c"), "crest": "halved", "rating": 59},
	{"id": "spal", "name": "SPAL", "abbrev": "SPL", "country": "Italia", "div": 3,
		"kit": Color("0a63b0"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 58},
	{"id": "nov", "name": "Novara", "abbrev": "NOV", "country": "Italia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 58},
	{"id": "rim", "name": "Rimini", "abbrev": "RIM", "country": "Italia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "pattern": "quarters", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 57},
	{"id": "arz", "name": "Arezzo", "abbrev": "ARZ", "country": "Italia", "div": 3,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 57},
	{"id": "stpl", "name": "St. Pauli", "abbrev": "STP", "country": "Alemania", "div": 2,
		"kit": Color("6b3f22"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 75},
	{"id": "sgf", "name": "Greuther Fürth", "abbrev": "SGF", "country": "Alemania", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 74},
	{"id": "bts", "name": "Eintracht Braunschweig", "abbrev": "BTS", "country": "Alemania", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("0a3f8c"), "crest": "star", "rating": 74},
	{"id": "fcm", "name": "Magdeburg", "abbrev": "FCM", "country": "Alemania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 73},
	{"id": "sv98", "name": "Darmstadt 98", "abbrev": "SVD", "country": "Alemania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 73},
	{"id": "ksv", "name": "Holstein Kiel", "abbrev": "KSV", "country": "Alemania", "div": 2,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 72},
	{"id": "elv", "name": "Elversberg", "abbrev": "ELV", "country": "Alemania", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "bie", "name": "Arminia Bielefeld", "abbrev": "BIE", "country": "Alemania", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "hro", "name": "Hansa Rostock", "abbrev": "HRO", "country": "Alemania", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "msv", "name": "MSV Duisburg", "abbrev": "MSV", "country": "Alemania", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "aac", "name": "Alemannia Aachen", "abbrev": "AAC", "country": "Alemania", "div": 3,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "swh", "name": "Wehen Wiesbaden", "abbrev": "SWH", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "uha", "name": "Unterhaching", "abbrev": "UHA", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"), "crest": "round", "rating": 63},
	{"id": "sku", "name": "Stuttgarter Kickers", "abbrev": "SKU", "country": "Alemania", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "hfc", "name": "Hallescher FC", "abbrev": "HFC", "country": "Alemania", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "chih", "name": "Chihuahua FC", "abbrev": "CHH", "country": "México", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 68},
	{"id": "ipc", "name": "Inter Playa del Carmen", "abbrev": "IPC", "country": "México", "div": 3,
		"kit": Color("0a63b0"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "yal", "name": "Yalmakan", "abbrev": "YAL", "country": "México", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "diamond", "rating": 67},
	{"id": "hzp", "name": "Halcones de Zapopan", "abbrev": "HZP", "country": "México", "div": 3,
		"kit": Color("1b2a55"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 67},
	{"id": "gvm", "name": "Gavilanes de Matamoros", "abbrev": "GVM", "country": "México", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 67},
	{"id": "cma", "name": "Cañoneros Marina", "abbrev": "CMA", "country": "México", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 66},
	{"id": "rvz", "name": "Racing de Veracruz", "abbrev": "RVZ", "country": "México", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("c8102e"), "crest": "shield", "rating": 66},
	{"id": "lpd", "name": "Reboceros de La Piedad", "abbrev": "LPD", "country": "México", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 65},
	{"id": "zmr", "name": "Deportivo Zamora", "abbrev": "ZMR", "country": "México", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "diamond", "rating": 65},
	{"id": "uup", "name": "Aguacateros de Uruapan", "abbrev": "URU", "country": "México", "div": 3,
		"kit": Color("0a5f3c"), "kit2": Color("14161a"), "crest": "star", "rating": 64},
	{"id": "cli", "name": "Colima FC", "abbrev": "CLI", "country": "México", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "czh", "name": "Cruz Azul Hidalgo", "abbrev": "CZH", "country": "México", "div": 3,
		"kit": Color("0a3f8c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "acp", "name": "Atlético Capitalino", "abbrev": "ACP", "country": "México", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "calo", "name": "Club Calor", "abbrev": "CLR", "country": "México", "div": 3,
		"kit": Color("e8770a"), "kit2": Color("14161a"), "crest": "round", "rating": 63},
	{"id": "tec", "name": "Tecos FC", "abbrev": "TEC", "country": "México", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "checkers", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "cor2", "name": "Coras de Nayarit", "abbrev": "CRN", "country": "México", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 62},
	{"id": "vav", "name": "Vila das Aves", "abbrev": "VAV", "country": "Portugal", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 75},
	{"id": "avs", "name": "Académico de Viseu", "abbrev": "AVS", "country": "Portugal", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "round", "rating": 75},
	{"id": "uma", "name": "União de Leiria", "abbrev": "UMA", "country": "Portugal", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 74},
	{"id": "via", "name": "Vianense", "abbrev": "VIA", "country": "Portugal", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "star", "rating": 74},
	{"id": "pao", "name": "Paços de Ferreira", "abbrev": "PAO", "country": "Portugal", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14532d"), "crest": "banner", "rating": 73},
	{"id": "bln", "name": "Belenenses", "abbrev": "BEL", "country": "Portugal", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 73},
	{"id": "alvp", "name": "Alverca", "abbrev": "ALK", "country": "Portugal", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "band_v", "kit_b": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "tir", "name": "Tirsense", "abbrev": "TIR", "country": "Portugal", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "round", "rating": 72},
	{"id": "var", "name": "Varzim", "abbrev": "VAR", "country": "Portugal", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "slg", "name": "Salgueiros", "abbrev": "SLG", "country": "Portugal", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "atcp", "name": "Atlético CP", "abbrev": "ATC", "country": "Portugal", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "banner", "rating": 64},
	{"id": "lus", "name": "Lusitânia de Lourosa", "abbrev": "LUS", "country": "Portugal", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "sjv", "name": "São João de Ver", "abbrev": "SJV", "country": "Portugal", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "fel", "name": "Felgueiras", "abbrev": "FEL", "country": "Portugal", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 63},
	{"id": "pev", "name": "Pevidém", "abbrev": "PEV", "country": "Portugal", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "brgz", "name": "Bragança", "abbrev": "BGZ", "country": "Portugal", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "star", "rating": 62},
	{"id": "tro2", "name": "Troyes", "abbrev": "TRO2", "country": "Francia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 75},
	{"id": "clf", "name": "Clermont", "abbrev": "CLF", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "round", "rating": 75},
	{"id": "lor2", "name": "Lorient", "abbrev": "LOR2", "country": "Francia", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("14161a"), "crest": "diamond", "rating": 74},
	{"id": "lav", "name": "Laval", "abbrev": "LAV", "country": "Francia", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("14161a"), "crest": "star", "rating": 74},
	{"id": "ann", "name": "Annecy", "abbrev": "ANN", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 73},
	{"id": "mtg", "name": "Martigues", "abbrev": "MTG", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "halved", "rating": 73},
	{"id": "pfc", "name": "Paris FC", "abbrev": "PFC", "country": "Francia", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 72},
	{"id": "dij", "name": "Dijon", "abbrev": "DIJ", "country": "Francia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "bou2", "name": "Boulogne", "abbrev": "BOU2", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "diamond", "rating": 65},
	{"id": "vsl", "name": "Versailles", "abbrev": "VSL", "country": "Francia", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a52b8"), "crest": "star", "rating": 64},
	{"id": "cho", "name": "Cholet", "abbrev": "CHO", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "rue", "name": "Rouen", "abbrev": "RUE", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "avr", "name": "Avranches", "abbrev": "AVR", "country": "Francia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 63},
	{"id": "bbp", "name": "Bourg-en-Bresse", "abbrev": "BBP", "country": "Francia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 63},
	{"id": "mgn", "name": "Marignane", "abbrev": "MGN", "country": "Francia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "fle", "name": "Fleury", "abbrev": "FLE", "country": "Francia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "jaj", "name": "Jong Ajax", "abbrev": "JAJ", "country": "Países Bajos", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("c8102e"), "crest": "shield", "rating": 75},
	{"id": "jps", "name": "Jong PSV", "abbrev": "JPS", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 75},
	{"id": "jaz", "name": "Jong AZ", "abbrev": "JAZ", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 74},
	{"id": "jut", "name": "Jong Utrecht", "abbrev": "JUT", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 74},
	{"id": "exr", "name": "Excelsior Rotterdam", "abbrev": "EXR", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner", "rating": 73},
	{"id": "dtr", "name": "De Treffers", "abbrev": "DTR", "country": "Países Bajos", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "half", "kit_b": Color("14161a"), "crest": "halved", "rating": 73},
	{"id": "ijs", "name": "IJsselmeervogels", "abbrev": "IJS", "country": "Países Bajos", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "pattern": "band_v", "kit_b": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "koz", "name": "Kozakken Boys", "abbrev": "KOZ", "country": "Países Bajos", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "round", "rating": 72},
	{"id": "asw", "name": "ASWH", "abbrev": "ASW", "country": "Países Bajos", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "diamond", "rating": 65},
	{"id": "noo", "name": "Noordwijk", "abbrev": "NOO", "country": "Países Bajos", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "star", "rating": 64},
	{"id": "bad", "name": "Barendrecht", "abbrev": "BAD", "country": "Países Bajos", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "banner", "rating": 64},
	{"id": "hhc", "name": "HHC Hardenberg", "abbrev": "HHC", "country": "Países Bajos", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "vvs", "name": "VVSB", "abbrev": "VVS", "country": "Países Bajos", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("f5c518"), "crest": "shield", "rating": 63},
	{"id": "snk", "name": "Sparta Nijkerk", "abbrev": "SNK", "country": "Países Bajos", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "round", "rating": 63},
	{"id": "dvs", "name": "DVS '33", "abbrev": "DVS", "country": "Países Bajos", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 62},
	{"id": "ex31", "name": "Excelsior '31", "abbrev": "EX31", "country": "Países Bajos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "vno", "name": "Vila Nova", "abbrev": "VNO", "country": "Brasil", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 75},
	{"id": "ope", "name": "Operário Ferroviário", "abbrev": "OPE", "country": "Brasil", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 75},
	{"id": "nvz", "name": "Novorizontino", "abbrev": "NVZ", "country": "Brasil", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "diamond", "rating": 74},
	{"id": "mir2", "name": "Mirassol", "abbrev": "MIR2", "country": "Brasil", "div": 1,
		"kit": Color("ffdd00"), "kit2": Color("0a7a3c"), "crest": "star", "rating": 86},
	{"id": "amz", "name": "Amazonas", "abbrev": "AMZ", "country": "Brasil", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "banner", "rating": 73},
	{"id": "bruq", "name": "Brusque", "abbrev": "BRU", "country": "Brasil", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "halved", "rating": 73},
	{"id": "cri", "name": "Criciúma", "abbrev": "CRI", "country": "Brasil", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "shield", "rating": 72},
	{"id": "prg2", "name": "Paraná Clube", "abbrev": "PRG2", "country": "Brasil", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("0a52b8"), "crest": "round", "rating": 72},
	{"id": "vre", "name": "Volta Redonda", "abbrev": "VRE", "country": "Brasil", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 65},
	{"id": "sjo2", "name": "São José", "abbrev": "SJO2", "country": "Brasil", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "atc", "name": "Athletic Club", "abbrev": "ATC2", "country": "Brasil", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "fer2", "name": "Ferroviária", "abbrev": "FER2", "country": "Brasil", "div": 3,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "cnf", "name": "Confiança", "abbrev": "CNF", "country": "Brasil", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 63},
	{"id": "apa", "name": "Aparecidense", "abbrev": "APA", "country": "Brasil", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "round", "rating": 63},
	{"id": "flo", "name": "Floresta", "abbrev": "FLO", "country": "Brasil", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "cax", "name": "Caxias", "abbrev": "CAX", "country": "Brasil", "div": 3,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "alb2", "name": "All Boys", "abbrev": "ALB2", "country": "Argentina", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 75},



	{"id": "dbe", "name": "Defensores de Belgrano", "abbrev": "DBE", "country": "Argentina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"crest": "round", "rating": 75},
	{"id": "smi", "name": "San Miguel", "abbrev": "SMI", "country": "Argentina", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 74},
	{"id": "erc", "name": "Estudiantes de Río Cuarto", "abbrev": "ERC", "country": "Argentina", "div": 1,
		"kit": Color("8ac6ff"), "kit2": Color("6cb4e4"), "crest": "star", "rating": 78},
	{"id": "alv3", "name": "Alvarado", "abbrev": "ALV3", "country": "Argentina", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "banner", "rating": 73},
	{"id": "agr", "name": "Agropecuario", "abbrev": "AGR", "country": "Argentina", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "halved", "rating": 73},
	{"id": "gue", "name": "Güemes", "abbrev": "GUE", "country": "Argentina", "div": 2,
		"kit": Color("14318f"), "kit2": Color("0a2340"), "pattern": "band_h", "kit_b": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "rcb", "name": "Racing de Córdoba", "abbrev": "RCB", "country": "Argentina", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "clg", "name": "Colegiales", "abbrev": "CLG", "country": "Argentina", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "pinstripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 65},
	{"id": "aqu", "name": "Argentino de Quilmes", "abbrev": "AQU", "country": "Argentina", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "cnu", "name": "Cañuelas", "abbrev": "CAN2", "country": "Argentina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "fnx", "name": "Fénix", "abbrev": "FNX", "country": "Argentina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "tre", "name": "Talleres de Remedios", "abbrev": "TRE", "country": "Argentina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 63},
	{"id": "exc2", "name": "Excursionistas", "abbrev": "EXC2", "country": "Argentina", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 63},
	{"id": "itz", "name": "Ituzaingó", "abbrev": "ITZ", "country": "Argentina", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 62},
	{"id": "uai", "name": "UAI Urquiza", "abbrev": "UAI", "country": "Argentina", "div": 3,
		"kit": Color("01bafe"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "cos", "name": "Colorado Springs Switchbacks", "abbrev": "COS", "country": "Estados Unidos", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 73},
	{"id": "bhl", "name": "Birmingham Legion", "abbrev": "BHL", "country": "Estados Unidos", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "round", "rating": 73},
	{"id": "hfd", "name": "Hartford Athletic", "abbrev": "HFD", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 72},
	{"id": "rif", "name": "Rhode Island FC", "abbrev": "RIF", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "star", "rating": 72},
	{"id": "mby", "name": "Monterey Bay", "abbrev": "MBY", "country": "Estados Unidos", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 71},
	{"id": "ocs", "name": "Orange County SC", "abbrev": "OCS", "country": "Estados Unidos", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("14161a"), "crest": "halved", "rating": 71},
	{"id": "oak", "name": "Oakland Roots", "abbrev": "OAK", "country": "Estados Unidos", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "crest": "shield", "rating": 70},
	{"id": "pgh", "name": "Pittsburgh Riverhounds", "abbrev": "PGH", "country": "Estados Unidos", "div": 2,
		"kit": Color("e8b40a"), "kit2": Color("14161a"), "crest": "round", "rating": 70},
	{"id": "lex", "name": "Lexington SC", "abbrev": "LEX", "country": "Estados Unidos", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 63},
	{"id": "txm", "name": "Texoma FC", "abbrev": "TXM", "country": "Estados Unidos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "phm", "name": "Portland Hearts of Pine", "abbrev": "PHM", "country": "Estados Unidos", "div": 3,
		"kit": Color("14532d"), "kit2": Color("0a2340"), "pattern": "hoops", "kit_b": Color("0a2340"), "crest": "banner", "rating": 62},
	{"id": "wch", "name": "Westchester SC", "abbrev": "WCH", "country": "Estados Unidos", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 62},
	{"id": "avl2", "name": "AV Alta", "abbrev": "AVL2", "country": "Estados Unidos", "div": 3,
		"kit": Color("097374"), "kit2": Color("097374"), "crest": "shield", "rating": 61},
	{"id": "crw", "name": "Chattanooga Red Wolves", "abbrev": "CRW", "country": "Estados Unidos", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "round", "rating": 61},
	{"id": "nap2", "name": "Naples United", "abbrev": "NAP2", "country": "Estados Unidos", "div": 3,
		"kit": Color("00cdff"), "kit2": Color("00cdff"), "crest": "diamond", "rating": 60},
	{"id": "dsm", "name": "Des Moines Menace", "abbrev": "DSM", "country": "Estados Unidos", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("c8102e"), "crest": "star", "rating": 60},
	{"id": "jnd", "name": "Al-Jandal", "abbrev": "JND", "country": "Arabia Saudí", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 75},
	{"id": "saf", "name": "Al-Safa", "abbrev": "SAF", "country": "Arabia Saudí", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 75},
	{"id": "ain", "name": "Al-Ain", "abbrev": "AIN2", "country": "Arabia Saudí", "div": 2,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "halved", "rating": 74},
	{"id": "shl", "name": "Al-Sahel", "abbrev": "SHL", "country": "Arabia Saudí", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("ffdd00"), "crest": "shield", "rating": 74},
	{"id": "raw", "name": "Al-Rawdhah", "abbrev": "RAW", "country": "Arabia Saudí", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 73},
	{"id": "bkr", "name": "Al-Bukayriyah Shabab", "abbrev": "BKR", "country": "Arabia Saudí", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 73},
	{"id": "jbl", "name": "Al-Jubail Ahli", "abbrev": "JBL", "country": "Arabia Saudí", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 72},
	{"id": "thq", "name": "Al-Thoqbah", "abbrev": "THQ", "country": "Arabia Saudí", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "banner", "rating": 72},
	{"id": "ent", "name": "Al-Entesar", "abbrev": "ENT", "country": "Arabia Saudí", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "ghra", "name": "Al-Ghara", "abbrev": "GHA", "country": "Arabia Saudí", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "amj", "name": "Al-Amjad", "abbrev": "AMJ", "country": "Arabia Saudí", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"), "crest": "banner", "rating": 64},
	{"id": "hej", "name": "Al-Hejaz", "abbrev": "HEJ", "country": "Arabia Saudí", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "kwk", "name": "Al-Kawkab", "abbrev": "KWK", "country": "Arabia Saudí", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 63},
	{"id": "lew", "name": "Al-Lewaa", "abbrev": "LEW", "country": "Arabia Saudí", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "crest": "round", "rating": 63},
	{"id": "qai", "name": "Al-Qaisumah", "abbrev": "QAI", "country": "Arabia Saudí", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "diamond", "rating": 62},
	{"id": "nay", "name": "Al-Nairyah", "abbrev": "NAY", "country": "Arabia Saudí", "div": 3,
		"kit": Color("e8b40a"), "kit2": Color("14161a"), "crest": "star", "rating": 62},
	{"id": "gnc", "name": "Gençlerbirliği", "abbrev": "GNC", "country": "Turquía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 75},
	{"id": "amd", "name": "Amed Sportif", "abbrev": "AMD", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 75},
	{"id": "igd", "name": "Iğdır FK", "abbrev": "IGD", "country": "Turquía", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("0a7a3c"), "crest": "star", "rating": 74},
	{"id": "pnd", "name": "Pendikspor", "abbrev": "PND", "country": "Turquía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "banner", "rating": 74},
	{"id": "ese", "name": "Esenler Erokspor", "abbrev": "ESE", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "halved", "rating": 73},
	{"id": "srk", "name": "Serik Belediyespor", "abbrev": "SRK", "country": "Turquía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "shield", "rating": 73},
	{"id": "erb", "name": "Erbaaspor", "abbrev": "ERB", "country": "Turquía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "krs", "name": "Karacabey Belediyespor", "abbrev": "KRS", "country": "Turquía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 72},
	{"id": "krk", "name": "Kırklarelispor", "abbrev": "KRK", "country": "Turquía", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "nzs", "name": "Nazilli Belediyespor", "abbrev": "NZS", "country": "Turquía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 64},
	{"id": "sry", "name": "Sarıyer", "abbrev": "SRY", "country": "Turquía", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 64},
	{"id": "byo", "name": "Beyoğlu Yeni Çarşı", "abbrev": "BYO", "country": "Turquía", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 64},
	{"id": "znk", "name": "Zonguldak Kömürspor", "abbrev": "ZNK", "country": "Turquía", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "shield", "rating": 63},
	{"id": "vns", "name": "Van Spor", "abbrev": "VNS", "country": "Turquía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 63},
	{"id": "kah", "name": "Kahramanmaraşspor", "abbrev": "KAH", "country": "Turquía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "sms", "name": "Somaspor", "abbrev": "SMS", "country": "Turquía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 62},
	{"id": "lkt", "name": "Lokeren-Temse", "abbrev": "LKT", "country": "Bélgica", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "shield", "rating": 75},
	{"id": "rfl", "name": "RFC Liège", "abbrev": "RFL", "country": "Bélgica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "round", "rating": 75},
	{"id": "vrt", "name": "Virton", "abbrev": "VRT", "country": "Bélgica", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 74},
	{"id": "hei", "name": "Heist", "abbrev": "HEI", "country": "Bélgica", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14318f"), "crest": "star", "rating": 74},
	{"id": "dsl", "name": "Dessel Sport", "abbrev": "DSL", "country": "Bélgica", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 73},
	{"id": "hoo", "name": "Hoogstraten", "abbrev": "HOO", "country": "Bélgica", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 73},
	{"id": "tub", "name": "Tubize", "abbrev": "TUB", "country": "Bélgica", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 69},
	{"id": "unm", "name": "Union Namur", "abbrev": "UNM", "country": "Bélgica", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "round", "rating": 69},
	{"id": "geel", "name": "Verbroedering Geel", "abbrev": "GEE", "country": "Bélgica", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 65},
	{"id": "rme", "name": "Racing Mechelen", "abbrev": "RME", "country": "Bélgica", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "pattern": "band_v", "kit_b": Color("0a7a3c"), "crest": "star", "rating": 64},
	{"id": "spm", "name": "Sprimont", "abbrev": "SPM", "country": "Bélgica", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 64},
	{"id": "aal", "name": "Eendracht Aalst", "abbrev": "AAL", "country": "Bélgica", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 64},
	{"id": "bch", "name": "Berchem Sport", "abbrev": "BCH", "country": "Bélgica", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "shield", "rating": 63},
	{"id": "reb", "name": "Rebecq", "abbrev": "REB", "country": "Bélgica", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 63},
	{"id": "onh", "name": "Onhaye", "abbrev": "ONH", "country": "Bélgica", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "ham", "name": "Hamme", "abbrev": "HAM2", "country": "Bélgica", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "star", "rating": 62},
	{"id": "sco_stn", "name": "Stranraer", "abbrev": "STN", "country": "Escocia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 70},
	{"id": "sco_edc", "name": "Edinburgh City", "abbrev": "EDC", "country": "Escocia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "round", "rating": 70},
	{"id": "sco_bon", "name": "Bonnyrigg Rose", "abbrev": "BON", "country": "Escocia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 69},
	{"id": "sco_spt", "name": "Spartans", "abbrev": "SPT", "country": "Escocia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "star", "rating": 69},
	{"id": "sco_alb", "name": "Albion Rovers", "abbrev": "ALB3", "country": "Escocia", "div": 3,
		"kit": Color("ffdd00"), "kit2": Color("c8102e"), "crest": "banner", "rating": 68},
	{"id": "sco_brc", "name": "Brechin City", "abbrev": "BRC3", "country": "Escocia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 68},
	{"id": "sco_cow", "name": "Cowdenbeath", "abbrev": "COW", "country": "Escocia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "sco_esh", "name": "East Stirlingshire", "abbrev": "ESH", "country": "Escocia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 67},
	{"id": "sco_css", "name": "Civil Service Strollers", "abbrev": "CSS", "country": "Escocia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 60},
	{"id": "sco_trn", "name": "Tranent", "abbrev": "TRN", "country": "Escocia", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "star", "rating": 59},
	{"id": "sco_bwk", "name": "Berwick Rangers", "abbrev": "BWK", "country": "Escocia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5c518"), "crest": "banner", "rating": 59},
	{"id": "sco_buc", "name": "Buckie Thistle", "abbrev": "BUC", "country": "Escocia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"), "crest": "halved", "rating": 59},
	{"id": "sco_fra", "name": "Fraserburgh", "abbrev": "FRA2", "country": "Escocia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 58},
	{"id": "sco_bro", "name": "Brora Rangers", "abbrev": "BRO", "country": "Escocia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 58},
	{"id": "sco_cbr", "name": "Caledonian Braves", "abbrev": "CBR", "country": "Escocia", "div": 3,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "diamond", "rating": 57},
	{"id": "sco_lin", "name": "Linlithgow Rose", "abbrev": "LIN2", "country": "Escocia", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 57},
	{"id": "gre_aio", "name": "Aiolikos", "abbrev": "AIO", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 70},
	{"id": "gre_mrk", "name": "Marko", "abbrev": "MRK", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 70},
	{"id": "gre_ovo", "name": "Olympiacos Volos", "abbrev": "OVO", "country": "Grecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "diamond", "rating": 69},
	{"id": "gre_ilp", "name": "Ilioupoli", "abbrev": "ILP", "country": "Grecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "star", "rating": 69},
	{"id": "gre_rod", "name": "Rodos", "abbrev": "ROD", "country": "Grecia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 68},
	{"id": "gre_kis", "name": "Kissamikos", "abbrev": "KIS", "country": "Grecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 68},
	{"id": "gre_eth", "name": "Ethnikos Piraeus", "abbrev": "ETH", "country": "Grecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "gre_pel", "name": "Panelefsiniakos", "abbrev": "PEL", "country": "Grecia", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 67},
	{"id": "gre_arp", "name": "Aris Petroupoli", "abbrev": "ARP", "country": "Grecia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "diamond", "rating": 60},
	{"id": "gre_the", "name": "Thesprotos", "abbrev": "THE", "country": "Grecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "star", "rating": 59},
	{"id": "gre_pie", "name": "Pierikos", "abbrev": "PIE", "country": "Grecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 59},
	{"id": "gre_alp", "name": "Almopos Aridaia", "abbrev": "ALP", "country": "Grecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 59},
	{"id": "gre_kam", "name": "Kampaniakos", "abbrev": "KAM", "country": "Grecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 58},
	{"id": "gre_nes", "name": "Nestos Chrysoupoli", "abbrev": "NES", "country": "Grecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 58},
	{"id": "gre_epa", "name": "Anagennisi Epanomi", "abbrev": "EPA", "country": "Grecia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 57},
	{"id": "gre_zak", "name": "Zakynthos", "abbrev": "ZAK", "country": "Grecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("ffdd00"), "crest": "star", "rating": 57},
	{"id": "ukr_kre", "name": "Kremin Kremenchuk", "abbrev": "KRE", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 70},
	{"id": "ukr_nby", "name": "Nyva Buzova", "abbrev": "NBY", "country": "Ucrania", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 70},
	{"id": "ukr_vpk", "name": "VPK-Ahro", "abbrev": "VPK", "country": "Ucrania", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 69},
	{"id": "ukr_yar", "name": "Yarud Mariupol", "abbrev": "YAR", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("ffdd00"), "crest": "star", "rating": 69},
	{"id": "ukr_lis", "name": "Lisne", "abbrev": "LIS", "country": "Ucrania", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 68},
	{"id": "ukr_per", "name": "Peremoha Dnipro", "abbrev": "PER2", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 68},
	{"id": "ukr_chk", "name": "Chaika Petropavlivska", "abbrev": "CHK", "country": "Ucrania", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "ukr_agt", "name": "Ahrotekh Tyshkivka", "abbrev": "AGT", "country": "Ucrania", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("ffdd00"), "crest": "round", "rating": 67},
	{"id": "ukr_krs", "name": "Krystal Kherson", "abbrev": "KRS2", "country": "Ucrania", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14318f"), "crest": "diamond", "rating": 60},
	{"id": "ukr_blk", "name": "Balkany Zorya", "abbrev": "BLK", "country": "Ucrania", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "ukr_tav", "name": "Tavriya Simferopol", "abbrev": "TAV", "country": "Ucrania", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 59},
	{"id": "ukr_khl", "name": "Karpaty Halych", "abbrev": "KHL", "country": "Ucrania", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 59},
	{"id": "ukr_kpl", "name": "Kolos Polonne", "abbrev": "KPL", "country": "Ucrania", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 58},
	{"id": "ukr_trs", "name": "Trostianets", "abbrev": "TRS", "country": "Ucrania", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "round", "rating": 58},
	{"id": "ukr_dch", "name": "Dnipro Cherkasy", "abbrev": "DCH", "country": "Ucrania", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 57},
	{"id": "ukr_yed", "name": "Yednist Plysky", "abbrev": "YED", "country": "Ucrania", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 57},
	{"id": "aut_yov", "name": "Young Violets", "abbrev": "YOV", "country": "Austria", "div": 2,
		"kit": Color("6b2d8a"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 71},
	{"id": "aut_rp2", "name": "Rapid II", "abbrev": "RP2", "country": "Austria", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 71},
	{"id": "aut_st2", "name": "Sturm II", "abbrev": "ST2", "country": "Austria", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 70},
	{"id": "aut_voe", "name": "Union Vöcklamarkt", "abbrev": "VOE", "country": "Austria", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 70},
	{"id": "aut_alh", "name": "SV Allerheiligen", "abbrev": "ALH", "country": "Austria", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "aut_deu", "name": "Deutschlandsberg", "abbrev": "DEU", "country": "Austria", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "aut_trb", "name": "Treibach", "abbrev": "TRB", "country": "Austria", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "aut_wei", "name": "Weiz", "abbrev": "WEI", "country": "Austria", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "aut_san", "name": "St. Anna", "abbrev": "SAN", "country": "Austria", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "aut_lbd", "name": "Leobendorf", "abbrev": "LBD", "country": "Austria", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 60},
	{"id": "aut_tra", "name": "Traiskirchen", "abbrev": "TRA2", "country": "Austria", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "banner", "rating": 60},
	{"id": "aut_bgl", "name": "Bad Gleichenberg", "abbrev": "BGL", "country": "Austria", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 60},
	{"id": "aut_kal", "name": "Kalsdorf", "abbrev": "KAL2", "country": "Austria", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "aut_kre2", "name": "Krems", "abbrev": "KRE2", "country": "Austria", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 59},
	{"id": "aut_ebr", "name": "Ebreichsdorf", "abbrev": "EBR", "country": "Austria", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 58},
	{"id": "aut_prn", "name": "Parndorf", "abbrev": "PRN2", "country": "Austria", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 58},
	{"id": "sui_sco", "name": "Schötz", "abbrev": "SCO", "country": "Suiza", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "shield", "rating": 70},
	{"id": "sui_zug", "name": "Zug 94", "abbrev": "ZUG", "country": "Suiza", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"), "crest": "round", "rating": 70},
	{"id": "sui_bsc", "name": "Bassecourt", "abbrev": "BSQ", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 69},
	{"id": "sui_si2", "name": "Sion II", "abbrev": "SI2", "country": "Suiza", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 69},
	{"id": "sui_yb2", "name": "Young Boys II", "abbrev": "YB2", "country": "Suiza", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "banner", "rating": 68},
	{"id": "sui_bs2", "name": "Basel II", "abbrev": "BS2", "country": "Suiza", "div": 3,
		"kit": Color("e2001a"), "kit2": Color("0b3d91"), "pattern": "half", "kit_b": Color("0b3d91"), "crest": "halved", "rating": 68},
	{"id": "sui_lg2", "name": "Lugano II", "abbrev": "LG2", "country": "Suiza", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "sui_zh2", "name": "Zürich II", "abbrev": "ZH2", "country": "Suiza", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "round", "rating": 67},
	{"id": "sui_sv2", "name": "Servette II", "abbrev": "SV2", "country": "Suiza", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "diamond", "rating": 60},
	{"id": "sui_lu2", "name": "Lucerne II", "abbrev": "LU2", "country": "Suiza", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "sui_mns", "name": "Münsingen", "abbrev": "MNS", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 59},
	{"id": "sui_buo", "name": "Buochs", "abbrev": "BUO", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 59},
	{"id": "sui_slt", "name": "Solothurn", "abbrev": "SLT", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 58},
	{"id": "sui_hon", "name": "Höngg", "abbrev": "HON", "country": "Suiza", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "pattern": "sleeves", "kit_b": Color("6cb4e4"), "crest": "round", "rating": 58},
	{"id": "sui_tug", "name": "Tuggen", "abbrev": "TUG", "country": "Suiza", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 57},
	{"id": "sui_bav", "name": "Bavois", "abbrev": "BAV", "country": "Suiza", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 57},
	{"id": "cze_dkl", "name": "Dukla Praha", "abbrev": "DKL", "country": "Chequia", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("f5c518"), "pattern": "sleeves", "kit_b": Color("f5c518"), "crest": "shield", "rating": 71},
	{"id": "cze_lsn", "name": "Líšeň", "abbrev": "LSN", "country": "Chequia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 71},
	{"id": "cze_sp2", "name": "Sparta B", "abbrev": "SP2", "country": "Chequia", "div": 2,
		"kit": Color("8a1b2c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 70},
	{"id": "cze_sl2", "name": "Slavia B", "abbrev": "SL2", "country": "Chequia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 70},
	{"id": "cze_vme", "name": "Velké Meziříčí", "abbrev": "VME", "country": "Chequia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "cze_krm", "name": "Kroměříž", "abbrev": "KRM", "country": "Chequia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "cze_bo2", "name": "Bohemians B", "abbrev": "BO2", "country": "Chequia", "div": 3,
		"kit": Color("0e7a35"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "cze_zbr", "name": "Zbrojovka", "abbrev": "ZBR", "country": "Chequia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 68},
	{"id": "cze_uno", "name": "Ústí nad Orlicí", "abbrev": "UNO", "country": "Chequia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "cze_hlu", "name": "Hlučín", "abbrev": "HLU", "country": "Chequia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 60},
	{"id": "cze_ubr", "name": "Uherský Brod", "abbrev": "UBR", "country": "Chequia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 60},
	{"id": "cze_bla", "name": "Blansko", "abbrev": "BLA", "country": "Chequia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 60},
	{"id": "cze_ros", "name": "Rosice", "abbrev": "ROS2", "country": "Chequia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "cze_zbu", "name": "Zbuzany", "abbrev": "ZBU", "country": "Chequia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 59},
	{"id": "cze_ben", "name": "Benešov", "abbrev": "BEN2", "country": "Chequia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 58},
	{"id": "cze_dom", "name": "Domažlice", "abbrev": "DOM", "country": "Chequia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 58},
	{"id": "cro_dja", "name": "Croatia Đakovo", "abbrev": "DJA", "country": "Croacia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 70},
	{"id": "cro_os2", "name": "Osijek II", "abbrev": "OS2", "country": "Croacia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 70},
	{"id": "cro_ri2", "name": "Rijeka II", "abbrev": "RI2", "country": "Croacia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 69},
	{"id": "cro_hj2", "name": "Hajduk II", "abbrev": "HJ2", "country": "Croacia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "star", "rating": 69},
	{"id": "cro_dz2", "name": "Dinamo II", "abbrev": "DZ2", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 68},
	{"id": "cro_zdr", "name": "Mladost Ždralovi", "abbrev": "ZDR", "country": "Croacia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "halved", "rating": 68},
	{"id": "cro_zup", "name": "Graničar Županja", "abbrev": "ZUP", "country": "Croacia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 67},
	{"id": "cro_bed", "name": "Bedem Ivankovo", "abbrev": "BED", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 67},
	{"id": "cro_ned", "name": "Nedelišće", "abbrev": "NED", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 60},
	{"id": "cro_iva", "name": "Ivanić", "abbrev": "IVA", "country": "Croacia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "cro_trn", "name": "Trnje Zagreb", "abbrev": "TRN", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "banner", "rating": 59},
	{"id": "cro_spb", "name": "Šparta Bjelovar", "abbrev": "SPB", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 59},
	{"id": "cro_rkr", "name": "Radnik Križevci", "abbrev": "RKR", "country": "Croacia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 58},
	{"id": "cro_zel", "name": "Zelina", "abbrev": "ZEL", "country": "Croacia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "pattern": "hoops", "kit_b": Color("c8102e"), "crest": "round", "rating": 58},
	{"id": "cro_usk", "name": "Uskok Klis", "abbrev": "USK", "country": "Croacia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 57},
	{"id": "cro_bis", "name": "Bistra", "abbrev": "BIS", "country": "Croacia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("ffdd00"), "crest": "star", "rating": 57},
	{"id": "srb_loz", "name": "Loznica", "abbrev": "LOZ", "country": "Serbia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "shield", "rating": 72},
	{"id": "srb_try", "name": "Trayal", "abbrev": "TRY", "country": "Serbia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "round", "rating": 72},
	{"id": "srb_sme", "name": "Smederevo 1924", "abbrev": "SME", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 71},
	{"id": "srb_slp", "name": "Sloga Požega", "abbrev": "SLP", "country": "Serbia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 71},
	{"id": "srb_rsm", "name": "Radnički Sremska Mitrovica", "abbrev": "RSM", "country": "Serbia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 70},
	{"id": "srb_zla", "name": "Zlatibor", "abbrev": "ZLA", "country": "Serbia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 70},
	{"id": "srb_hak", "name": "Hajduk Kula", "abbrev": "HAK", "country": "Serbia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 69},
	{"id": "srb_bbp", "name": "Bačka Bačka Palanka", "abbrev": "BBP2", "country": "Serbia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a2340"), "crest": "round", "rating": 69},
	{"id": "srb_dvr", "name": "Dinamo Vranje", "abbrev": "DVR", "country": "Serbia", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "diamond", "rating": 62},
	{"id": "srb_mvh", "name": "Morava Vladičin Han", "abbrev": "MVH", "country": "Serbia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 61},
	{"id": "srb_kab", "name": "Kabel Novi Sad", "abbrev": "KAB", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "banner", "rating": 61},
	{"id": "srb_slr", "name": "Sloven Ruma", "abbrev": "SLR", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 61},
	{"id": "srb_rzr", "name": "Radnički Zrenjanin", "abbrev": "RZR", "country": "Serbia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 60},
	{"id": "srb_mns", "name": "Mladost Novi Sad", "abbrev": "MNS2", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 60},
	{"id": "srb_spt", "name": "Sloga Petrovac", "abbrev": "SPT2", "country": "Serbia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 59},
	{"id": "srb_pol", "name": "Polet Ljubić", "abbrev": "POL", "country": "Serbia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "star", "rating": 59},
	{"id": "den_ros", "name": "FC Roskilde", "abbrev": "ROS", "country": "Dinamarca", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 71},
	{"id": "den_frm", "name": "BK Frem", "abbrev": "FRM", "country": "Dinamarca", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("0a2340"), "crest": "round", "rating": 71},
	{"id": "den_hel", "name": "Hellerup IK", "abbrev": "HEL", "country": "Dinamarca", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("1e90ff"), "crest": "diamond", "rating": 70},
	{"id": "den_bsh", "name": "Brønshøj BK", "abbrev": "BSH", "country": "Dinamarca", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "star", "rating": 70},
	{"id": "den_dal", "name": "Dalum IF", "abbrev": "DAL", "country": "Dinamarca", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "den_mrl", "name": "Marienlyst", "abbrev": "MRL", "country": "Dinamarca", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"), "crest": "halved", "rating": 69},
	{"id": "den_ish", "name": "Ishøj IF", "abbrev": "ISH", "country": "Dinamarca", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "shield", "rating": 68},
	{"id": "den_hor3", "name": "Hørsholm-Usserød", "abbrev": "HOU", "country": "Dinamarca", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "round", "rating": 68},
	{"id": "den_vrd", "name": "Varde IF", "abbrev": "VRD", "country": "Dinamarca", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "diamond", "rating": 61},
	{"id": "den_vej", "name": "Vejgaard BK", "abbrev": "VEJ", "country": "Dinamarca", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "star", "rating": 60},
	{"id": "den_rin", "name": "Ringkøbing IF", "abbrev": "RIN", "country": "Dinamarca", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 60},
	{"id": "den_odd", "name": "Odder IGF", "abbrev": "ODD2", "country": "Dinamarca", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "halved", "rating": 60},
	{"id": "den_tar", "name": "AB Tårnby", "abbrev": "TAR2", "country": "Dinamarca", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "shield", "rating": 59},
	{"id": "den_lys", "name": "Lyseng IF", "abbrev": "LYS", "country": "Dinamarca", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "round", "rating": 59},
	{"id": "den_syd", "name": "FC Sydvest", "abbrev": "SYD", "country": "Dinamarca", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "diamond", "rating": 58},
	{"id": "den_kje", "name": "Kjellerup IF", "abbrev": "KJE", "country": "Dinamarca", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "star", "rating": 58},
	{"id": "nor_tmd", "name": "Tromsdalen", "abbrev": "TMD", "country": "Noruega", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("c8102e"), "crest": "shield", "rating": 72},
	{"id": "nor_kv2", "name": "Kongsvinger II", "abbrev": "KV2", "country": "Noruega", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 72},
	{"id": "nor_ho2", "name": "Hødd II", "abbrev": "HO2", "country": "Noruega", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 71},
	{"id": "nor_gru", "name": "Grorud", "abbrev": "GRU", "country": "Noruega", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "star", "rating": 71},
	{"id": "nor_kvh", "name": "Kvik Halden", "abbrev": "KVH", "country": "Noruega", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 70},
	{"id": "nor_flo", "name": "Florø", "abbrev": "FLO", "country": "Noruega", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "halved", "rating": 70},
	{"id": "nor_brt", "name": "Brattvåg", "abbrev": "BRT", "country": "Noruega", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 69},
	{"id": "nor_fol", "name": "Follo", "abbrev": "FOL", "country": "Noruega", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 69},
	{"id": "nor_ork", "name": "Orkla", "abbrev": "ORK", "country": "Noruega", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 62},
	{"id": "nor_elv", "name": "Elverum", "abbrev": "ELV2", "country": "Noruega", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "crest": "star", "rating": 61},
	{"id": "nor_stb2", "name": "Stjørdals-Blink", "abbrev": "STB2", "country": "Noruega", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "banner", "rating": 61},
	{"id": "nor_vrd", "name": "Vard Haugesund", "abbrev": "VRD2", "country": "Noruega", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "crest": "halved", "rating": 61},
	{"id": "nor_frl", "name": "Fram Larvik", "abbrev": "FRL", "country": "Noruega", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("14318f"), "crest": "shield", "rating": 60},
	{"id": "nor_are", "name": "Arendal", "abbrev": "ARE3", "country": "Noruega", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 60},
	{"id": "nor_alt", "name": "Alta", "abbrev": "ALT", "country": "Noruega", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 59},
	{"id": "nor_nrd", "name": "Nardo", "abbrev": "NRD", "country": "Noruega", "div": 3,
		"kit": Color("8b1a2b"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "jpn_ehi", "name": "Ehime FC", "abbrev": "EHI", "country": "Japón", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 73},
	{"id": "jpn_toy", "name": "Kataller Toyama", "abbrev": "TOY", "country": "Japón", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 73},
	{"id": "jpn_iwa", "name": "Iwaki FC", "abbrev": "IWA", "country": "Japón", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "diamond", "rating": 72},
	{"id": "jpn_tok", "name": "Tokushima Vortis", "abbrev": "TOK", "country": "Japón", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 72},
	{"id": "jpn_ren", "name": "Renofa Yamaguchi", "abbrev": "REN", "country": "Japón", "div": 2,
		"kit": Color("e8770a"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 71},
	{"id": "jpn_thes", "name": "Thespa Gunma", "abbrev": "THG", "country": "Japón", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("0a2340"), "crest": "halved", "rating": 71},
	{"id": "jpn_oit", "name": "Oita Trinita", "abbrev": "OIT", "country": "Japón", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("ffdd00"), "crest": "shield", "rating": 70},
	{"id": "jpn_mit", "name": "Mito HollyHock", "abbrev": "MIT", "country": "Japón", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 79},
	{"id": "jpn_ima", "name": "FC Imabari", "abbrev": "IMA", "country": "Japón", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 63},
	{"id": "jpn_nar", "name": "Nara Club", "abbrev": "NAR", "country": "Japón", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 62},
	{"id": "jpn_tot", "name": "Fujieda MYFC", "abbrev": "TOT2", "country": "Japón", "div": 3,
		"kit": Color("6a2b8a"), "kit2": Color("6a2b8a"), "crest": "banner", "rating": 62},
	{"id": "jpn_yso", "name": "YSCC Yokohama", "abbrev": "YSO", "country": "Japón", "div": 3,
		"kit": Color("5bd3e5"), "kit2": Color("0a2340"), "crest": "halved", "rating": 62},
	{"id": "jpn_tky", "name": "Tochigi City", "abbrev": "TKY", "country": "Japón", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "crest": "shield", "rating": 61},
	{"id": "jpn_azu", "name": "Azul Claro Numazu", "abbrev": "AZU", "country": "Japón", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "round", "rating": 61},
	{"id": "jpn_tsu", "name": "Tegevajaro Miyazaki", "abbrev": "TSU", "country": "Japón", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 60},
	{"id": "jpn_fuk", "name": "Fukushima United", "abbrev": "FUK", "country": "Japón", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "star", "rating": 60},
	{"id": "kor_jec", "name": "Chungbuk Jecheon", "abbrev": "JEC", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 71},
	{"id": "kor_yng", "name": "Yangju Citizen", "abbrev": "YNG", "country": "Corea del Sur", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("826644"), "crest": "round", "rating": 71},
	{"id": "kor_dgk", "name": "Daegu Korail", "abbrev": "DGK", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 70},
	{"id": "kor_hwc", "name": "Hwacheon KSPO", "abbrev": "HWC", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 70},
	{"id": "kor_gum", "name": "Gumi Citizen", "abbrev": "GUM", "country": "Corea del Sur", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "kor_yeo", "name": "Yeoju FC", "abbrev": "YEO", "country": "Corea del Sur", "div": 2,
		"kit": Color("0a2340"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "kor_jin", "name": "Jinju Citizen", "abbrev": "JIN", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "shield", "rating": 68},
	{"id": "kor_dan", "name": "Dangjin Citizen", "abbrev": "DAN2", "country": "Corea del Sur", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "crest": "round", "rating": 68},
	{"id": "kor_ich", "name": "Icheon Citizen", "abbrev": "ICH", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "diamond", "rating": 61},
	{"id": "kor_jnr", "name": "Jungnang Chorus Mustang", "abbrev": "JNR", "country": "Corea del Sur", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "star", "rating": 60},
	{"id": "kor_ptk", "name": "Pyeongtaek Citizen", "abbrev": "PTK", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 60},
	{"id": "kor_chu", "name": "Chuncheon Citizen", "abbrev": "CHU", "country": "Corea del Sur", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("14161a"), "crest": "halved", "rating": 60},
	{"id": "kor_goy", "name": "Goyang KH", "abbrev": "GOY", "country": "Corea del Sur", "div": 3,
		"kit": Color("e8770a"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "kor_now", "name": "Seoul Nowon United", "abbrev": "NOW", "country": "Corea del Sur", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 59},
	{"id": "kor_ygj", "name": "Yeongju Citizen", "abbrev": "YGJ", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 58},
	{"id": "kor_cjf", "name": "Cheongju FC", "abbrev": "CJF", "country": "Corea del Sur", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 58},
	{"id": "col_bmg", "name": "Bucaramanga B", "abbrev": "BMG", "country": "Colombia", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("0a7a3c"), "crest": "shield", "rating": 71},
	{"id": "col_tgb", "name": "Tigres de Bogotá", "abbrev": "TGB", "country": "Colombia", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "diamond", "rating": 70},
	{"id": "col_dpb", "name": "Pereira B", "abbrev": "DPB", "country": "Colombia", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "star", "rating": 70},
	{"id": "col_rsn", "name": "Real Santander", "abbrev": "RSN", "country": "Colombia", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("0a2340"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "col_umg", "name": "Magdalena FC", "abbrev": "UMG", "country": "Colombia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "col_clb", "name": "Cali B", "abbrev": "CLB", "country": "Colombia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "col_amb", "name": "América B", "abbrev": "AMB", "country": "Colombia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "round", "rating": 68},
	{"id": "col_mib", "name": "Millonarios B", "abbrev": "MIB", "country": "Colombia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "col_sog", "name": "Sogamoso", "abbrev": "SOG", "country": "Colombia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 60},
	{"id": "col_gdt", "name": "Girardot FC", "abbrev": "GDT", "country": "Colombia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a7a3c"), "crest": "banner", "rating": 60},
	{"id": "col_ipi", "name": "Ipiales", "abbrev": "IPI", "country": "Colombia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 60},
	{"id": "col_fbl", "name": "Floridablanca", "abbrev": "FBL", "country": "Colombia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "col_psb", "name": "Pasto B", "abbrev": "PSB", "country": "Colombia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2340"), "crest": "round", "rating": 59},
	{"id": "col_mtr", "name": "Montería FC", "abbrev": "MTR", "country": "Colombia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 58},
	{"id": "col_zip", "name": "Zipaquirá FC", "abbrev": "ZIP", "country": "Colombia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "star", "rating": 58},
	{"id": "chi_usf", "name": "Unión San Felipe", "abbrev": "USF", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 71},
	{"id": "chi_sct", "name": "Deportes Santa Cruz", "abbrev": "SCT", "country": "Chile", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("0a52b8"), "crest": "round", "rating": 71},
	{"id": "chi_tra", "name": "Trasandino", "abbrev": "TRA5", "country": "Chile", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 70},
	{"id": "chi_vll", "name": "Deportes Vallenar", "abbrev": "VLL2", "country": "Chile", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "pattern": "stripes", "kit_b": Color("f5f5f5"), "crest": "star", "rating": 70},
	{"id": "chi_lnr", "name": "Deportes Linares", "abbrev": "LNR", "country": "Chile", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "chi_ova", "name": "Provincial Ovalle", "abbrev": "OVA", "country": "Chile", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "chi_mun", "name": "Municipal Santiago", "abbrev": "MUN", "country": "Chile", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 68},
	{"id": "chi_rsj", "name": "Real San Joaquín", "abbrev": "RSJ", "country": "Chile", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "crest": "round", "rating": 68},
	{"id": "chi_clc", "name": "Colchagua", "abbrev": "CLC", "country": "Chile", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "chi_lbu", "name": "Lautaro de Buin", "abbrev": "LBU", "country": "Chile", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "crest": "star", "rating": 60},
	{"id": "chi_rng", "name": "Deportes Rengo", "abbrev": "RNG", "country": "Chile", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "crest": "banner", "rating": 60},
	{"id": "chi_cln", "name": "Deportes Colina", "abbrev": "CLN", "country": "Chile", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("f5c518"), "crest": "halved", "rating": 60},
	{"id": "chi_qli", "name": "Deportes Quilicura", "abbrev": "QLI", "country": "Chile", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "chi_ccn", "name": "Concón National", "abbrev": "CCN", "country": "Chile", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "round", "rating": 59},
	{"id": "chi_brj", "name": "Brujas de Salamanca", "abbrev": "BRJ", "country": "Chile", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"), "crest": "diamond", "rating": 58},
	{"id": "chi_pvr", "name": "Deportivo Puerto Varas", "abbrev": "PVR", "country": "Chile", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 58},
	{"id": "uru_pcn", "name": "Potencia", "abbrev": "PCN", "country": "Uruguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "hoops", "kit_b": Color("0a7a3c"), "crest": "shield", "rating": 70},
	{"id": "uru_hrf", "name": "Huracán FC", "abbrev": "HRF", "country": "Uruguay", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("c8102e"), "pattern": "half", "kit_b": Color("f5f5f5"), "crest": "round", "rating": 70},
	{"id": "uru_pey", "name": "Peñarol B", "abbrev": "PEY", "country": "Uruguay", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "diamond", "rating": 69},
	{"id": "uru_ncb", "name": "Nacional B", "abbrev": "NCB", "country": "Uruguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "crest": "star", "rating": 69},
	{"id": "uru_dfb", "name": "Defensor B", "abbrev": "DFB", "country": "Uruguay", "div": 2,
		"kit": Color("6b2d8a"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 68},
	{"id": "uru_lvb", "name": "Liverpool B", "abbrev": "LVB", "country": "Uruguay", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a52b8"), "crest": "halved", "rating": 68},
	{"id": "uru_wnb", "name": "Wanderers B", "abbrev": "WNB", "country": "Uruguay", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"), "crest": "shield", "rating": 67},
	{"id": "uru_dnb", "name": "Danubio B", "abbrev": "DNB", "country": "Uruguay", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "sash", "kit_b": Color("14161a"), "crest": "round", "rating": 67},
	{"id": "uru_cnd", "name": "Canadian", "abbrev": "CND", "country": "Uruguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 60},
	{"id": "uru_ppl", "name": "Parque del Plata", "abbrev": "PPL", "country": "Uruguay", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 59},
	{"id": "uru_ltl", "name": "Litoral", "abbrev": "LTL", "country": "Uruguay", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 59},
	{"id": "uru_psl", "name": "Peñarol de Salto", "abbrev": "PSL", "country": "Uruguay", "div": 3,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "halved", "rating": 59},
	{"id": "uru_crb", "name": "Cerro Largo B", "abbrev": "CRB", "country": "Uruguay", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("1b4fa0"), "crest": "shield", "rating": 58},
	{"id": "uru_pyp", "name": "Progreso de Paysandú", "abbrev": "PYP", "country": "Uruguay", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"), "pattern": "stripes", "kit_b": Color("c8102e"), "crest": "round", "rating": 58},
	{"id": "uru_frr", "name": "Frontera Rivera", "abbrev": "FRR", "country": "Uruguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "diamond", "rating": 57},
	{"id": "uru_uds", "name": "Universitario de Salto", "abbrev": "UDS", "country": "Uruguay", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "crest": "star", "rating": 57},
	{"id": "egy_bmh", "name": "Baladiyet El Mahalla", "abbrev": "BMH", "country": "Egipto", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 71},
	{"id": "egy_abo", "name": "Abo Qir Semad", "abbrev": "ABO", "country": "Egipto", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 71},
	{"id": "egy_mkb", "name": "Makkasa B", "abbrev": "MKB", "country": "Egipto", "div": 2,
		"kit": Color("ffdd00"), "kit2": Color("14161a"), "crest": "diamond", "rating": 70},
	{"id": "egy_ban", "name": "Banha", "abbrev": "BAN", "country": "Egipto", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 70},
	{"id": "egy_mnf", "name": "Menouf", "abbrev": "MNF", "country": "Egipto", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 69},
	{"id": "egy_kim", "name": "Kima Aswan", "abbrev": "KIM", "country": "Egipto", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 69},
	{"id": "egy_bnk", "name": "Bank El Ahly", "abbrev": "BNK", "country": "Egipto", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"), "crest": "shield", "rating": 68},
	{"id": "egy_tlc", "name": "Telecom Egypt", "abbrev": "TLC", "country": "Egipto", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"), "crest": "round", "rating": 68},
	{"id": "egy_bel", "name": "Beila", "abbrev": "BEL3", "country": "Egipto", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "diamond", "rating": 61},
	{"id": "egy_ras", "name": "Ras El Barr", "abbrev": "RAS", "country": "Egipto", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "star", "rating": 60},
	{"id": "egy_sam", "name": "Samannoud", "abbrev": "SAM2", "country": "Egipto", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "banner", "rating": 60},
	{"id": "egy_dae", "name": "Dayrout", "abbrev": "DAE", "country": "Egipto", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "crest": "halved", "rating": 60},
	{"id": "egy_mal", "name": "Malaha Port Said", "abbrev": "MAL", "country": "Egipto", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "crest": "shield", "rating": 59},
	{"id": "egy_bhr", "name": "Bahary", "abbrev": "BHR", "country": "Egipto", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "crest": "round", "rating": 59},
	{"id": "egy_sud", "name": "Sohag Sporting", "abbrev": "SUD2", "country": "Egipto", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("13aa83"), "crest": "diamond", "rating": 58},
	{"id": "egy_fay", "name": "Fayoum FC", "abbrev": "FAY", "country": "Egipto", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("ffdd00"), "crest": "star", "rating": 58},




























	{"id": "nzl_akc", "name": "Auckland City", "abbrev": "AKC", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("0057b8"), "kit2": Color("0a2340"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 83},
	{"id": "nzl_afr", "name": "Auckland FC II", "abbrev": "AFC", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "nzl_wpr", "name": "Phoenix II", "abbrev": "WPR", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 81},
	{"id": "nzl_bir", "name": "Birkenhead United", "abbrev": "BIR", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "nzl_eas", "name": "Eastern Suburbs", "abbrev": "ESU", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "nzl_aku", "name": "Auckland United", "abbrev": "AKU", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "nzl_npr", "name": "Napier City Rovers", "abbrev": "NCR", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("1d4ed8"), "kit2": Color("1d4ed8"),
		"shape": "shield", "crest_pattern": "sash", "emblem": "ship", "rim": "gold", "rating": 79},
	{"id": "nzl_wol", "name": "Wellington Olympic", "abbrev": "WOL", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("0033a0"), "kit2": Color("0033a0"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ring", "rim": "white", "rating": 79},
	{"id": "nzl_mir", "name": "Miramar Rangers", "abbrev": "MIR", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "gold", "rating": 79},
	{"id": "nzl_cas", "name": "Cashmere Technical", "abbrev": "CTE", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 79},
	{"id": "nzl_fer", "name": "Ferrymead Bays", "abbrev": "FER", "country": "Nueva Zelanda", "div": 1,
		"kit": Color("1e3a8a"), "kit2": Color("0a2340"),
		"shape": "round", "crest_pattern": "fess", "emblem": "anchor", "rim": "dark", "rating": 78},
	{"id": "nzl_wsp", "name": "Western Springs", "abbrev": "WSP", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "nzl_cos", "name": "Coastal Spirit", "abbrev": "COS", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ship", "rim": "white", "rating": 78},
	{"id": "nzl_chu", "name": "Christchurch United", "abbrev": "CHU", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "nzl_wsu", "name": "Western Suburbs", "abbrev": "WSU", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "nzl_ecb", "name": "East Coast Bays", "abbrev": "ECB", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("00205b"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 78},
	{"id": "nzl_fen", "name": "Fencibles United", "abbrev": "FEN", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14318f"), "pattern": "sleeves", "kit_b": Color("14318f"),
		"shape": "shield", "crest_pattern": "chevron", "emblem": "swords", "rim": "gold", "rating": 78},
	{"id": "nzl_bay", "name": "Bay Olympic", "abbrev": "BAY", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ring", "rim": "dark", "rating": 78},




	{"id": "nzl_tau", "name": "Tauranga City", "abbrev": "TCY", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "nzl_mel", "name": "Melville United", "abbrev": "MEL", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "nzl_mku", "name": "Manukau United", "abbrev": "MKU", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "nzl_uhc", "name": "Upper Hutt City", "abbrev": "UHC", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("ee7f00"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "nzl_iby", "name": "Island Bay United", "abbrev": "IBU", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 69},
	{"id": "nzl_wka", "name": "Waterside Karori", "abbrev": "WKA", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 70},
	{"id": "nzl_pet", "name": "Petone", "abbrev": "PET", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("1e3a8a"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "nzl_fcw", "name": "FC Western", "abbrev": "FCW", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("f5c518"), "kit2": Color("14318f"), "pattern": "pinstripes", "kit_b": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "nzl_nom", "name": "Nomads United", "abbrev": "NOM", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("14318f"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "nzl_nel", "name": "Nelson Suburbs", "abbrev": "NSU", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "nzl_nor", "name": "Northern AFC", "abbrev": "NAF", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "white", "rating": 68},
	{"id": "nzl_dcr", "name": "Dunedin City Royals", "abbrev": "DCR", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("6cb4e4"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "crown", "rim": "gold", "rating": 68},
	{"id": "nzl_wan", "name": "Wānaka", "abbrev": "WAN", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 67},
	{"id": "nzl_sel", "name": "Selwyn United", "abbrev": "SEL", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "pinstripes", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "nzl_wcr", "name": "West Coast Rangers", "abbrev": "WCR", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "pinstripes", "kit_b": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "nzl_man", "name": "Manurewa", "abbrev": "MAN", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("1b4f9c"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "nzl_ham", "name": "Hamilton Wanderers", "abbrev": "HAM", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("002f6c"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "nzl_nsu", "name": "North Shore United", "abbrev": "NSH", "country": "Nueva Zelanda", "div": 2,
		"kit": Color("8b1a2b"), "kit2": Color("8b1a2b"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "gold", "rating": 72},





	{"id": "nzl_cam", "name": "Cambridge", "abbrev": "CAM", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("0057b8"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "nzl_ell", "name": "Ellerslie", "abbrev": "ELL", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "nzl_hib", "name": "Hibiscus Coast", "abbrev": "HIB", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "nzl_map", "name": "Mount Albert-Ponsonby", "abbrev": "MAP", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "nzl_nro", "name": "Northern Rovers", "abbrev": "NRO", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "nzl_omu", "name": "Onehunga Mangere", "abbrev": "OMU", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "nzl_tak", "name": "Takapuna", "abbrev": "TAK", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a52b8"), "pattern": "sleeves", "kit_b": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "nzl_tpo", "name": "Taupo", "abbrev": "TPO", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "nzl_nwe", "name": "North Wellington", "abbrev": "NWE", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("14318f"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "nzl_lhc", "name": "Lower Hutt City", "abbrev": "LHC", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "nzl_wun", "name": "Wellington United", "abbrev": "WUN", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "nzl_sto", "name": "Stop Out", "abbrev": "STO", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "nzl_hnw", "name": "Havelock North Wanderers", "abbrev": "HNW", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("f5c518"), "kit2": Color("14318f"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "nzl_wai", "name": "Wairarapa United", "abbrev": "WAI", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("14532d"), "kit2": Color("f5f5f5"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "nzl_uca", "name": "Univ. of Canterbury", "abbrev": "UCA", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("000000"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "nzl_hal", "name": "Halswell United", "abbrev": "HAL", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("00843d"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "nzl_mos", "name": "Mosgiel", "abbrev": "MOS", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "nzl_gri", "name": "Green Island", "abbrev": "GRI", "country": "Nueva Zelanda", "div": 3,
		"kit": Color("00843d"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 58},



	{"id": "fij_baf", "name": "Ba", "abbrev": "BAF", "country": "Fiyi", "div": 1,
		"kit": Color("111111"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "fij_rew", "name": "Rewa", "abbrev": "REW", "country": "Fiyi", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "fij_lau", "name": "Lautoka", "abbrev": "LAU", "country": "Fiyi", "div": 1,
		"kit": Color("0b3d91"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 79},
	{"id": "fij_nad", "name": "Nadi", "abbrev": "NAD", "country": "Fiyi", "div": 1,
		"kit": Color("d71920"), "kit2": Color("ffd200"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "gold", "rating": 79},
	{"id": "fij_suv", "name": "Suva", "abbrev": "SUV", "country": "Fiyi", "div": 1,
		"kit": Color("ffffff"), "kit2": Color("1c3f94"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "fij_lab", "name": "Labasa", "abbrev": "LAB", "country": "Fiyi", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "fij_ndr", "name": "Nadroga", "abbrev": "NDR", "country": "Fiyi", "div": 1,
		"kit": Color("f58220"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "fij_nav", "name": "Navua", "abbrev": "NAV", "country": "Fiyi", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "fij_tav", "name": "Tavua", "abbrev": "TAV", "country": "Fiyi", "div": 1,
		"kit": Color("006b3f"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "fij_nas", "name": "Nasinu", "abbrev": "NAS", "country": "Fiyi", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("8b1a2b"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},




	{"id": "tah_tef", "name": "Tefana", "abbrev": "TEF", "country": "Tahití", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("f5c518"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "tah_pir", "name": "Pirae", "abbrev": "PIR", "country": "Tahití", "div": 1,
		"kit": Color("d2232a"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "tah_cen", "name": "Central Sport", "abbrev": "CEN", "country": "Tahití", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "gold", "rating": 79},
	{"id": "tah_ven", "name": "Vénus", "abbrev": "VEN", "country": "Tahití", "div": 1,
		"kit": Color("0057b8"), "kit2": Color("ffd100"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 79},
	{"id": "tah_dra", "name": "Dragon", "abbrev": "DRA", "country": "Tahití", "div": 1,
		"kit": Color("009a44"), "kit2": Color("111111"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "dragon", "rim": "dark", "rating": 79},
	{"id": "tah_ajt", "name": "Jeunes Tahitiens", "abbrev": "AJT", "country": "Tahití", "div": 1,
		"kit": Color("f7d117"), "kit2": Color("111111"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "tah_tpu", "name": "Tamarii Punaruu", "abbrev": "TPU", "country": "Tahití", "div": 1,
		"kit": Color("e35205"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "tah_mir", "name": "Mira", "abbrev": "MIR", "country": "Tahití", "div": 1,
		"kit": Color("00a3e0"), "kit2": Color("ffffff"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "tah_pue", "name": "Pueu", "abbrev": "PUE", "country": "Tahití", "div": 1,
		"kit": Color("a6192e"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "tah_tai", "name": "Taiarapu", "abbrev": "TAI", "country": "Tahití", "div": 1,
		"kit": Color("003da5"), "kit2": Color("e4002b"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 78},



	{"id": "ncl_mag", "name": "Magenta", "abbrev": "MAG", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("f5c518"), "kit2": Color("0a2340"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "gold", "rating": 80},
	{"id": "ncl_hie", "name": "Hienghène Sport", "abbrev": "HIE", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("0050a0"), "kit2": Color("ffffff"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 80},
	{"id": "ncl_tig", "name": "Tiga Sport", "abbrev": "TIG", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 80},
	{"id": "ncl_mdo", "name": "Mont-Dore", "abbrev": "MDO", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "mountain", "rim": "dark", "rating": 79},
	{"id": "ncl_csl", "name": "Saint-Louis", "abbrev": "CSL", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("ffd100"), "kit2": Color("0033a0"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ncl_los", "name": "Lössi", "abbrev": "LOS", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ncl_gai", "name": "Gaïca", "abbrev": "GAI", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("0072ce"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "ncl_ned", "name": "Ne Drehu", "abbrev": "NED", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("ee7f00"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "ncl_kun", "name": "Kunié", "abbrev": "KUN", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tree", "rim": "dark", "rating": 78},
	{"id": "ncl_pat", "name": "Horizon Patho", "abbrev": "PAT", "country": "Nueva Caledonia", "div": 1,
		"kit": Color("14318f"), "kit2": Color("14318f"),
		"shape": "round", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 78},


































	{"id": "swe_mff", "name": "Malmö FF", "abbrev": "MFF", "country": "Suecia", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "gold", "rating": 88},
	{"id": "swe_ham", "name": "Hammarby", "abbrev": "HAM", "country": "Suecia", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "white", "rating": 87},
	{"id": "swe_mja", "name": "Mjällby AIF", "abbrev": "MJA", "country": "Suecia", "div": 1,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "gold", "rim": "dark", "rating": 86},
	{"id": "swe_aik", "name": "AIK", "abbrev": "AIK", "country": "Suecia", "div": 1,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "swe_dif", "name": "Djurgården", "abbrev": "DIF", "country": "Suecia", "div": 1,
		"kit": Color("6cb4e4"), "kit2": Color("0a2a5e"), "pattern": "stripes", "kit_b": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "star", "emblem_tone": "gold", "rim": "dark", "rating": 85},
	{"id": "swe_hac", "name": "BK Häcken", "abbrev": "HAC", "country": "Suecia", "div": 1,
		"kit": Color("f5d000"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "swe_elf", "name": "IF Elfsborg", "abbrev": "ELF", "country": "Suecia", "div": 1,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "chief", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "swe_gbg", "name": "IFK Göteborg", "abbrev": "IFK", "country": "Suecia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "star", "rim": "dark", "rating": 83},
	{"id": "swe_gai", "name": "GAIS", "abbrev": "GAI", "country": "Suecia", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "fish", "rim": "dark", "rating": 83},
	{"id": "swe_sir", "name": "IK Sirius", "abbrev": "SIR", "country": "Suecia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "star", "rim": "dark", "rating": 82},
	{"id": "swe_bro", "name": "Brommapojkarna", "abbrev": "BRO", "country": "Suecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "swe_hal", "name": "Halmstads BK", "abbrev": "HBK", "country": "Suecia", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "swe_vas", "name": "Västerås SK", "abbrev": "VSK", "country": "Suecia", "div": 1,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"), "pattern": "hoops", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "swe_deg", "name": "Degerfors IF", "abbrev": "DEG", "country": "Suecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "swe_kal", "name": "Kalmar FF", "abbrev": "KFF", "country": "Suecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 79},
	{"id": "swe_org", "name": "Örgryte IS", "abbrev": "ORG", "country": "Suecia", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},




	{"id": "swe_nkp", "name": "IFK Norrköping", "abbrev": "NOR", "country": "Suecia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 77},
	{"id": "swe_var", "name": "IFK Värnamo", "abbrev": "VAR", "country": "Suecia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 76},
	{"id": "swe_ost", "name": "Östers IF", "abbrev": "OST", "country": "Suecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 76},
	{"id": "swe_hel", "name": "Helsingborgs IF", "abbrev": "HIF", "country": "Suecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 75},
	{"id": "swe_gif", "name": "GIF Sundsvall", "abbrev": "GIF", "country": "Suecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 74},
	{"id": "swe_lan", "name": "Landskrona BoIS", "abbrev": "LAN", "country": "Suecia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 74},
	{"id": "swe_bra", "name": "IK Brage", "abbrev": "BRA", "country": "Suecia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "swe_ofk", "name": "Östersunds FK", "abbrev": "OFK", "country": "Suecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "swe_ore", "name": "Örebro SK", "abbrev": "ORE", "country": "Suecia", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "swe_vbo", "name": "Varbergs BoIS", "abbrev": "VBO", "country": "Suecia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "swe_odd", "name": "IK Oddevold", "abbrev": "ODD", "country": "Suecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "sleeves", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "swe_san", "name": "Sandvikens IF", "abbrev": "SAN", "country": "Suecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 71},
	{"id": "swe_fal", "name": "Falkenbergs FF", "abbrev": "FFF", "country": "Suecia", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "swe_nby", "name": "Norrby IF", "abbrev": "NBY", "country": "Suecia", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "swe_lju", "name": "Ljungskile SK", "abbrev": "LSK", "country": "Suecia", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "swe_nun", "name": "Nordic United", "abbrev": "NUN", "country": "Suecia", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},






	{"id": "swe_jso", "name": "Jönköpings Södra", "abbrev": "JSO", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 66},
	{"id": "swe_tff", "name": "Trelleborgs FF", "abbrev": "TFF", "country": "Suecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 66},
	{"id": "swe_sti", "name": "FC Stockholm Internazionale", "abbrev": "STI", "country": "Suecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 66},
	{"id": "swe_gef", "name": "Gefle IF", "abbrev": "GEF", "country": "Suecia", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 65},
	{"id": "swe_vsl", "name": "Vasalunds IF", "abbrev": "VSL", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "swe_kst", "name": "IF Karlstad", "abbrev": "KST", "country": "Suecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "swe_afc", "name": "AFC Eskilstuna", "abbrev": "AFC", "country": "Suecia", "div": 3,
		"kit": Color("ee7f00"), "kit2": Color("ee7f00"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "swe_htf", "name": "Hammarby TFF", "abbrev": "HTF", "country": "Suecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5d000"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "swe_ass", "name": "Assyriska FF", "abbrev": "ASY", "country": "Suecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "sun", "rim": "dark", "rating": 63},
	{"id": "swe_ume", "name": "Umeå FC", "abbrev": "UME", "country": "Suecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "swe_arl", "name": "FC Arlanda", "abbrev": "ARL", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "swe_sol", "name": "Sollentuna FK", "abbrev": "SOL", "country": "Suecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "swe_sko", "name": "Skövde AIK", "abbrev": "SKO", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "swe_fbk", "name": "FBK Karlstad", "abbrev": "FBK", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "swe_atv", "name": "Åtvidabergs FF", "abbrev": "ATV", "country": "Suecia", "div": 3,
		"kit": Color("303090"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "swe_enk", "name": "Enköpings SK", "abbrev": "ENK", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "swe_kar", "name": "Karlbergs BK", "abbrev": "KAR", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "swe_lbk", "name": "Lunds BK", "abbrev": "LBK", "country": "Suecia", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "swe_sto", "name": "IFK Stocksund", "abbrev": "STO", "country": "Suecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 60},
	{"id": "swe_has", "name": "Hässleholms IF", "abbrev": "HAS", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "swe_tro", "name": "FC Trollhättan", "abbrev": "TRO", "country": "Suecia", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "swe_ang", "name": "Ängelholms FF", "abbrev": "ANG", "country": "Suecia", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("f5d000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "swe_ari", "name": "AFC Malmö", "abbrev": "AFM", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a7a3c"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "swe_oly", "name": "BK Olympic", "abbrev": "OLY", "country": "Suecia", "div": 3,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "ring", "rim": "dark", "rating": 59},
	{"id": "swe_esk", "name": "Eskilsminne IF", "abbrev": "ESK", "country": "Suecia", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("f5d000"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "swe_pit", "name": "Piteå IF", "abbrev": "PIT", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "swe_kri", "name": "Kristianstad FC", "abbrev": "KRI", "country": "Suecia", "div": 3,
		"kit": Color("f68333"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "swe_tva", "name": "Tvååkers IF", "abbrev": "TVA", "country": "Suecia", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "swe_ros", "name": "FC Rosengård 1917", "abbrev": "ROS", "country": "Suecia", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "swe_uts", "name": "Utsiktens BK", "abbrev": "UTS", "country": "Suecia", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "swe_jar", "name": "FC Järfälla", "abbrev": "JAR", "country": "Suecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "swe_lah", "name": "Laholms FK", "abbrev": "LAH", "country": "Suecia", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},









	{"id": "rou_fcs", "name": "FCSB", "abbrev": "FCS", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"), "pattern": "half", "kit_b": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "eagle", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "rou_ucv", "name": "Universitatea Craiova", "abbrev": "UCV", "country": "Rumanía", "div": 1,
		"kit": Color("2f7fd6"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "lion", "emblem_tone": "silver", "rim": "white", "rating": 85},
	{"id": "rou_cfr", "name": "CFR Cluj", "abbrev": "CFR", "country": "Rumanía", "div": 1,
		"kit": Color("7a1b2e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "rou_rap", "name": "Rapid Bucureşti", "abbrev": "RAP", "country": "Rumanía", "div": 1,
		"kit": Color("7a1b2e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 84},
	{"id": "rou_din", "name": "Dinamo Bucureşti", "abbrev": "DIN", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "wolf", "rim": "dark", "rating": 83},
	{"id": "rou_ucj", "name": "Universitatea Cluj", "abbrev": "UCJ", "country": "Rumanía", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 83},
	{"id": "rou_bot", "name": "FC Botoşani", "abbrev": "BOT", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "rou_far", "name": "Farul Constanța", "abbrev": "FAR", "country": "Rumanía", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "tower", "rim": "white", "rating": 81},
	{"id": "rou_arg", "name": "Argeş Piteşti", "abbrev": "ARG", "country": "Rumanía", "div": 1,
		"kit": Color("5b2d8e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "rou_ote", "name": "Oțelul Galați", "abbrev": "OTE", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "band_v", "kit_b": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "tri_stripes", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "rou_uta", "name": "UTA Arad", "abbrev": "UTA", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "rou_pet", "name": "Petrolul Ploieşti", "abbrev": "PET", "country": "Rumanía", "div": 1,
		"kit": Color("f5d000"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "wolf", "rim": "dark", "rating": 79},
	{"id": "rou_her", "name": "Hermannstadt", "abbrev": "HER", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "rou_uns", "name": "Unirea Slobozia", "abbrev": "UNS", "country": "Rumanía", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "rou_csi", "name": "Csíkszereda", "abbrev": "CSI", "country": "Rumanía", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},
	{"id": "rou_met", "name": "Metaloglobus", "abbrev": "MET", "country": "Rumanía", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 78},






	{"id": "rou_pol", "name": "Politehnica Iaşi", "abbrev": "PIA", "country": "Rumanía", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 77},
	{"id": "rou_sep", "name": "Sepsi OSK", "abbrev": "SEP", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 77},
	{"id": "rou_ste", "name": "Steaua Bucureşti", "abbrev": "STE", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "star", "emblem_tone": "gold", "rim": "gold", "rating": 76},
	{"id": "rou_cor", "name": "Corvinul Hunedoara", "abbrev": "COR", "country": "Rumanía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 74},
	{"id": "rou_chi", "name": "Chindia Târgovişte", "abbrev": "CHI", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 73},
	{"id": "rou_vol", "name": "FC Voluntari", "abbrev": "VOL", "country": "Rumanía", "div": 2,
		"kit": Color("6cb4e4"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "rou_con", "name": "Concordia Chiajna", "abbrev": "CON", "country": "Rumanía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "rou_sla", "name": "CSM Slatina", "abbrev": "SLA", "country": "Rumanía", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "rou_bih", "name": "FC Bihor Oradea", "abbrev": "BIH", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"), "pattern": "stripes", "kit_b": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "rou_bac", "name": "FC Bacău", "abbrev": "BAC", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 71},
	{"id": "rou_cea", "name": "Ceahlăul", "abbrev": "CEA", "country": "Rumanía", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 71},
	{"id": "rou_res", "name": "CSM Reşița", "abbrev": "RES", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 71},
	{"id": "rou_asa", "name": "ASA Târgu Mureş", "abbrev": "ASA", "country": "Rumanía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("0a2a5e"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "rou_glb", "name": "Gloria Bistrița", "abbrev": "GLB", "country": "Rumanía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "rou_mbz", "name": "Metalul Buzău", "abbrev": "MBZ", "country": "Rumanía", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 70},
	{"id": "rou_dum", "name": "CSC Dumbrăvița", "abbrev": "DUM", "country": "Rumanía", "div": 2,
		"kit": Color("0a7a3c"), "kit2": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "rou_sel", "name": "1599 Şelimbăr", "abbrev": "SEL", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "rou_oli", "name": "Olimpia Satu Mare", "abbrev": "OLI", "country": "Rumanía", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("0a52b8"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "rou_cam", "name": "Câmpulung Muscel", "abbrev": "CAM", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 68},
	{"id": "rou_tun", "name": "CS Tunari", "abbrev": "TUN", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "rou_afu", "name": "CS Afumați", "abbrev": "AFU", "country": "Rumanía", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("f5d000"), "pattern": "stripes", "kit_b": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "rou_csd", "name": "CS Dinamo Bucureşti", "abbrev": "CSD", "country": "Rumanía", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},




	{"id": "rou_pti", "name": "Politehnica Timişoara", "abbrev": "PTI", "country": "Rumanía", "div": 3,
		"kit": Color("5b2d8e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "rou_min", "name": "Minaur Baia Mare", "abbrev": "MIN", "country": "Rumanía", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("c8102e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 63},
	{"id": "rou_jiu", "name": "Jiul Petroşani", "abbrev": "JIU", "country": "Rumanía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "rou_dac", "name": "Dacia Unirea Brăila", "abbrev": "DAC", "country": "Rumanía", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "anchor", "rim": "dark", "rating": 62},
	{"id": "rou_pec", "name": "Progresul Pecica", "abbrev": "PEC", "country": "Rumanía", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("0a52b8"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "rou_vlc", "name": "CSM Râmnicu Vâlcea", "abbrev": "VLC", "country": "Rumanía", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("0a2a5e"), "pattern": "stripes", "kit_b": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "rou_dej", "name": "Unirea Dej", "abbrev": "DEJ", "country": "Rumanía", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "rou_alb", "name": "Unirea Alba Iulia", "abbrev": "ALB", "country": "Rumanía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"), "pattern": "half", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 61},
	{"id": "rou_mog", "name": "Progresul Mogoşoaia", "abbrev": "MOG", "country": "Rumanía", "div": 3,
		"kit": Color("14161a"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "rou_cug", "name": "Metalurgistul Cugir", "abbrev": "CUG", "country": "Rumanía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 60},
	{"id": "rou_san", "name": "Sănătatea Cluj", "abbrev": "SAN", "country": "Rumanía", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a7a3c"), "pattern": "sash", "kit_b": Color("0a7a3c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "rou_tam", "name": "Kids Tâmpa Braşov", "abbrev": "TAM", "country": "Rumanía", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 60},
	{"id": "rou_spa", "name": "Progresul Spartac", "abbrev": "SPA", "country": "Rumanía", "div": 3,
		"kit": Color("6cb4e4"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "rou_lup", "name": "Minerul Lupeni", "abbrev": "LUP", "country": "Rumanía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("c8102e"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "rou_via", "name": "Viitorul Arad", "abbrev": "VIA", "country": "Rumanía", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "rou_suc", "name": "Cetatea Suceava", "abbrev": "SUC", "country": "Rumanía", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 59},
	{"id": "rou_fun", "name": "Progresul Fundulea", "abbrev": "FUN", "country": "Rumanía", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
















	{"id": "bih_zri", "name": "Zrinjski", "abbrev": "ZRI", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "quartered", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 86},
	{"id": "bih_bor", "name": "Borac", "abbrev": "BOR", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"), "pattern": "half", "kit_b": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "emblem_tone": "gold", "rim": "gold", "rating": 85},
	{"id": "bih_sar", "name": "Sarajevo", "abbrev": "SAR", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("7a1b2e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "white", "rating": 84},
	{"id": "bih_zel", "name": "Željezničar", "abbrev": "ZEL", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "white", "rating": 83},
	{"id": "bih_vel", "name": "Velež", "abbrev": "VEL", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 82},
	{"id": "bih_sir", "name": "Široki Brijeg", "abbrev": "SIR", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 81},
	{"id": "bih_rad", "name": "Radnik Bijeljina", "abbrev": "RAD", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("0a2a5e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 80},
	{"id": "bih_slo", "name": "Sloga Doboj", "abbrev": "SLO", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 79},
	{"id": "bih_cel", "name": "Čelik Zenica", "abbrev": "CEL", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("c8102e"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "gear", "rim": "dark", "rating": 79},
	{"id": "bih_bsk", "name": "BSK Banja Luka", "abbrev": "BSK", "country": "Bosnia y Herzegovina", "div": 1,
		"kit": Color("2f7fd6"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 78},



	{"id": "bih_igm", "name": "Igman Konjic", "abbrev": "IGM", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 74},
	{"id": "bih_pos", "name": "Posušje", "abbrev": "POS", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"), "pattern": "stripes", "kit_b": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 73},
	{"id": "bih_gos", "name": "GOŠK Gabela", "abbrev": "GOS", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a2a5e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "bih_slb", "name": "Sloboda Tuzla", "abbrev": "SLB", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("14161a"), "pattern": "stripes", "kit_b": Color("14161a"),
		"shape": "round", "crest_pattern": "vstripes", "emblem": "letters", "rim": "dark", "rating": 72},
	{"id": "bih_leo", "name": "Leotar", "abbrev": "LEO", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "lion", "rim": "dark", "rating": 71},
	{"id": "bih_rud", "name": "Rudar Prijedor", "abbrev": "RUD", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("14161a"), "kit2": Color("f5d000"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 71},
	{"id": "bih_zvi", "name": "Zvijezda 09", "abbrev": "ZVI", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 70},
	{"id": "bih_lak", "name": "Laktaši", "abbrev": "LAK", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 70},
	{"id": "bih_sla", "name": "Slavija", "abbrev": "SLA", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a2a5e"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "bih_jed", "name": "Jedinstvo Bihać", "abbrev": "JED", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 69},
	{"id": "bih_tos", "name": "TOŠK Tešanj", "abbrev": "TOS", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("f5f5f5"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "bih_tra", "name": "Travnik", "abbrev": "TRA", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a52b8"), "kit2": Color("f5d000"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "tower", "rim": "dark", "rating": 68},
	{"id": "bih_koz", "name": "Kozara", "abbrev": "KOZ", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("1f8a4c"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 68},
	{"id": "bih_dri", "name": "Drina Zvornik", "abbrev": "DRI", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("2f7fd6"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 68},
	{"id": "bih_bud", "name": "Budućnost", "abbrev": "BUD", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("f5d000"), "kit2": Color("14161a"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 67},
	{"id": "bih_stu", "name": "Stupčanica", "abbrev": "STU", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("1f8a4c"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "bih_rha", "name": "Radnik Hadžići", "abbrev": "RHA", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("0a2a5e"), "kit2": Color("f5d000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 67},
	{"id": "bih_tom", "name": "Tomislav", "abbrev": "TOM", "country": "Bosnia y Herzegovina", "div": 2,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "quartered", "emblem": "crown", "rim": "dark", "rating": 67},



	{"id": "bih_tuz", "name": "Tuzla City", "abbrev": "TUZ", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5d000"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 64},
	{"id": "bih_vit", "name": "Vitez", "abbrev": "VIT", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("2f7fd6"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 62},
	{"id": "bih_cap", "name": "Čapljina", "abbrev": "CAP", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "bih_sut", "name": "Sutjeska Foča", "abbrev": "SUT", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 61},
	{"id": "bih_bra", "name": "Bratstvo", "abbrev": "BRA", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "bih_bro", "name": "Brotnjo", "abbrev": "BRO", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "shield", "crest_pattern": "halved", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "bih_bos", "name": "Bosna Visoko", "abbrev": "BOS", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("2f7fd6"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 60},
	{"id": "bih_rka", "name": "Rudar Kakanj", "abbrev": "RKA", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("14161a"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 59},
	{"id": "bih_zgr", "name": "Zvijezda Gradačac", "abbrev": "ZGR", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "star", "rim": "dark", "rating": 59},
	{"id": "bih_lju", "name": "Ljubuški", "abbrev": "LJU", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 59},
	{"id": "bih_tro", "name": "Troglav Livno", "abbrev": "TRO", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("c8102e"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 58},
	{"id": "bih_vne", "name": "Velež Nevesinje", "abbrev": "VNE", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("c8102e"), "kit2": Color("0a2a5e"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "bih_fam", "name": "Famos", "abbrev": "FAM", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a52b8"), "kit2": Color("f5f5f5"),
		"shape": "round", "crest_pattern": "solid", "emblem": "gear", "rim": "dark", "rating": 58},
	{"id": "bih_kra", "name": "Krajina Cazin", "abbrev": "KRA", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("1f8a4c"), "kit2": Color("f5f5f5"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 58},
	{"id": "bih_rom", "name": "Romanija", "abbrev": "ROM", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("1f8a4c"), "kit2": Color("14161a"),
		"shape": "shield", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 57},
	{"id": "bih_maj", "name": "Majevica", "abbrev": "MAJ", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("f5d000"), "kit2": Color("0a52b8"),
		"shape": "round", "crest_pattern": "solid", "emblem": "mountain", "rim": "dark", "rating": 57},
	{"id": "bih_oma", "name": "Omarska", "abbrev": "OMA", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("0a2a5e"), "kit2": Color("f5d000"),
		"shape": "round", "crest_pattern": "solid", "emblem": "letters", "rim": "dark", "rating": 57},
	{"id": "bih_pot", "name": "Potkozarje", "abbrev": "POT", "country": "Bosnia y Herzegovina", "div": 3,
		"kit": Color("f5f5f5"), "kit2": Color("1f8a4c"),
		"shape": "round", "crest_pattern": "solid", "emblem": "leaf", "rim": "dark", "rating": 57},


]



const LEAGUE_ACCENT: Dictionary = {
	"España": Color("e8a020"),
	"Inglaterra": Color("6c2bd9"),
	"Italia": Color("2e7cd6"),
	"Alemania": Color("e23a3a"),
	"México": Color("2fa84f"),
	"Portugal": Color("12b5a5"),
	"Francia": Color("1a3fb0"),
	"Países Bajos": Color("ff7f18"),
	"Brasil": Color("f7d117"),
	"Argentina": Color("6cb4e4"),
	"Estados Unidos": Color("2b5fd0"),
	"Arabia Saudí": Color("0b7c3c"),
	"Turquía": Color("e21b2c"),
	"Bélgica": Color("f2c200"),

	"Escocia": Color("4a76b8"),
	"Grecia": Color("19a5e0"),
	"Ucrania": Color("f5c400"),
	"Austria": Color("d94b3a"),
	"Suiza": Color("b02a37"),
	"Chequia": Color("6d4bb8"),
	"Croacia": Color("c1354a"),
	"Serbia": Color("8f2233"),
	"Dinamarca": Color("e0604f"),
	"Noruega": Color("2b8fb0"),
	"Japón": Color("e0466f"),
	"Corea del Sur": Color("4f7fd8"),
	"Colombia": Color("f2b32e"),
	"Chile": Color("c9433c"),
	"Uruguay": Color("5aa8e0"),
	"Paraguay": Color("0038a8"),
	"Ecuador": Color("034ea2"),
	"Perú": Color("d91023"),
	"Bolivia": Color("f9e300"),
	"Venezuela": Color("f4c300"),
	"Egipto": Color("c9a227"),


	"Marruecos": Color("1f8a4c"),
	"Túnez": Color("e70013"),




	"Nueva Zelanda": Color("b5c7d3"),





	"Suecia": Color("006aa7"),
	"Rumanía": Color("fcd116"),




	"Bosnia y Herzegovina": Color("002395"),

}



static func accent(league: String) -> Color:
	return LEAGUE_ACCENT.get(league, Color("ffd952"))



const LEAGUE_DIFFICULTY: Dictionary = {
	"España": 1.15, "Inglaterra": 1.15, "Italia": 1.1,
	"Alemania": 1.08, "Portugal": 1.0, "México": 0.95,
	"Francia": 1.08, "Países Bajos": 1.02, "Brasil": 1.06, "Argentina": 1.04,
	"Estados Unidos": 0.92, "Arabia Saudí": 0.9, "Turquía": 0.98, "Bélgica": 0.98,

	"Escocia": 0.95, "Grecia": 0.95, "Ucrania": 0.96, "Austria": 0.96, "Suiza": 0.94,
	"Chequia": 0.94, "Croacia": 0.93, "Serbia": 0.93, "Dinamarca": 0.95, "Noruega": 0.93,
	"Japón": 0.96, "Corea del Sur": 0.93, "Colombia": 0.98, "Chile": 0.96, "Uruguay": 0.97,
	"Paraguay": 0.96, "Ecuador": 0.96, "Perú": 0.95, "Bolivia": 0.93, "Venezuela": 0.93,
	"Egipto": 0.92,


	"Marruecos": 0.93, "Túnez": 0.92,






	"Nueva Zelanda": 0.85, "Fiyi": 0.8, "Tahití": 0.8, "Nueva Caledonia": 0.8,


	"Suecia": 0.95, "Rumanía": 0.93,



	"Bosnia y Herzegovina": 0.92,

}



static func difficulty(league: String) -> float:
	return LEAGUE_DIFFICULTY.get(league, 1.0)






























const LEAGUE_CEILING: Dictionary = {
	"España": 99, "Inglaterra": 99, "Italia": 99, "Alemania": 99, "Francia": 99,
	"Países Bajos": 92, "Portugal": 92, "Bélgica": 92, "Turquía": 92,
	"Brasil": 92, "Argentina": 92, "México": 92,
}
const LEAGUE_CEILING_OTHER: int = 88



const LEAGUE_CEILING_BAND: int = 8


static var _country_top: Dictionary = {}



static func league_ceiling(country: String) -> int:
	return int(LEAGUE_CEILING.get(country, LEAGUE_CEILING_OTHER))




static func capped_rating(country: String, raw: int) -> int:
	var cap: int = league_ceiling(country)
	if raw <= cap:
		return raw
	if _country_top.is_empty():
		for t in POOL:
			var c: String = String(t.get("country", t.get("league", "")))
			_country_top[c] = maxi(int(_country_top.get(c, 0)), int(t.get("rating", 62)))
	var hi: int = int(_country_top.get(country, raw))
	var base: int = cap - LEAGUE_CEILING_BAND
	if hi <= base:
		return mini(raw, cap)
	return base + int(round(float(raw - base) * float(cap - base) / float(hi - base)))





static func rating(team_id: String) -> int:
	var t: Dictionary = by_id(team_id)
	return int(t.get("rating", 62))










const HERITAGE_MIN: float = 52.0
const HERITAGE_MAX: float = 89.0
const SCALE_MIN: float = 57.0
const SCALE_MAX: float = 99.0




static func heritage_scale(v: float) -> float:
	return clampf(SCALE_MIN +(v - HERITAGE_MIN)
		*(SCALE_MAX - SCALE_MIN) /(HERITAGE_MAX - HERITAGE_MIN), 1.0, 99.0)



static func country_of(team_id: String) -> String:
	return String(by_id(team_id).get("country", ""))








static func base_div(team_id: String) -> int:
	return int(by_id(team_id).get("div", 2))






static func tier_of(team_id: String) -> int:
	var t: Dictionary = by_id(team_id)
	if t.is_empty():
		return STARTER_TIER
	return int(t.get("div", 2))



static func by_tier(tier: int) -> Array:
	return POOL.filter(func(t: Dictionary) -> bool:
		return tier_of(String(t["id"])) == tier)



static var _max_div: Dictionary = {}




static func max_div(country: String) -> int:
	if _max_div.is_empty():
		for t in POOL:
			var c: String = String(t.get("country", ""))
			_max_div[c] = maxi(int(_max_div.get(c, 1)), int(t.get("div", 1)))
	return int(_max_div.get(country, 2))



static func div_name(div: int) -> String:
	match div:
		1: return "Primera"
		2: return "Segunda"
		3: return "Tercera"
		_: return "%dª división" % div






static func div_short(div: int) -> String:
	return I18n.ordinal_f(div)




























static func teams_in(country: String, div: int) -> Array:
	var out: Array = all().filter(func(t: Dictionary) -> bool:
		return String(t.get("country", "")) == country and int(t.get("div", 2)) == div)
	out.sort_custom(func(a, b): return int(a["rating"]) > int(b["rating"]))
	return out




static func teams_of_country(country: String) -> Array:
	return all().filter(func(t: Dictionary) -> bool:
		return String(t.get("country", "")) == country)






static func is_european(country: String) -> bool:
	return confed_of_country(country) == "UEFA"





static func confed_of_country(country: String) -> String:
	return Nations.confed_of(Nations.id_for_country(country))



static func euro_countries() -> Array:
	return Nations.PLAYABLE.filter(func(c: String) -> bool: return is_european(c))










static func ucl_pool(count: int) -> Array:
	var firsts: Array = POOL.filter(func(t: Dictionary) -> bool:
		return base_div(String(t["id"])) == 1 and is_european(String(t.get("country", ""))))
	firsts.sort_custom(func(a, b): return int(a["rating"]) > int(b["rating"]))
	return firsts.slice(0, count)























static func starter_pool() -> Array:
	return POOL.filter(func(t: Dictionary) -> bool:
		var suelo: int = max_div(String(t.get("country", "")))
		return suelo > 1 and base_div(String(t["id"])) == suelo)




static func random_roster(count: int, exclude_id: String = "", tier: int = 0) -> Array:
	var pool: Array = POOL.filter(func(t: Dictionary) -> bool:
		return String(t["id"]) != exclude_id \
				and (tier <= 0 or tier_of(String(t["id"])) == tier))
	pool.shuffle()
	if pool.size() < count:
		var rest: Array = POOL.filter(func(t: Dictionary) -> bool:
			return String(t["id"]) != exclude_id and not pool.has(t))
		rest.shuffle()
		pool.append_array(rest)
	return pool.slice(0, count)



static var _index: Dictionary = {}



static var _all_cache: Array = []


static var _por_pais: Dictionary = {}






static func fake_names_on() -> bool:
	return false







static func _apply_alias(e: Dictionary) -> void:
	if not fake_names_on():
		return
	var fake: Dictionary = FakeTeams.NAMES.get(String(e.get("id", "")), {})
	if fake.is_empty():
		return
	e["name"] = String(fake.get("name", e.get("name", "")))
	e["abbrev"] = String(fake.get("abbrev", e.get("abbrev", "")))









static func reset_cache() -> void:
	_index.clear()
	_all_cache.clear()
	_por_pais.clear()





	RetroKits.invalidate()






















const FREE_ID: String = "free"








static func free_team() -> Dictionary:
	return {
		"id": FREE_ID,
		"name": I18n.t("SIN CLUB"),
		"abbrev": I18n.t("LIBRE"),
		"kit": Color("6b7280"), "kit2": Color("3f4451"),
		"country": "", "league": "", "rating": 0,
		"shape": "escudo", "crest_pattern": "liso", "crest_tone": "oscuro",
		"emblem": "ninguno", "rim": "liso",
	}





static func is_free(id: String) -> bool:
	return id == FREE_ID or id.is_empty()





static func by_id(id: String) -> Dictionary:

	if id == FREE_ID:
		return free_team()


	if id.begins_with(UefaSombra.PREFIJO):
		return UefaSombra.club(id)
	if _index.is_empty():
		for t in POOL:
			var e: Dictionary = t.duplicate()
			e["league"] = t.get("country", t.get("league", ""))


			e["rating"] = capped_rating(String(e["league"]), int(e.get("rating", 62)))
			_apply_alias(e)
			TeamEdits.apply(e)
			_index[String(t["id"])] = e
	return _index.get(id, {})







static func all() -> Array:
	if _all_cache.is_empty():
		for t in POOL:
			var e: Dictionary = t.duplicate()
			e["league"] = t.get("country", t.get("league", ""))
			e["rating"] = capped_rating(String(e["league"]), int(e.get("rating", 62)))
			_apply_alias(e)
			TeamEdits.apply(e)
			_all_cache.append(e)
	return _all_cache







static func all_of_country(country: String) -> Array:
	var todos: Array = all()
	if _por_pais.is_empty():
		for t in todos:
			var c: String = String((t as Dictionary).get("country", ""))
			if not _por_pais.has(c):
				_por_pais[c] = []
			(_por_pais[c] as Array).append(t)
	return _por_pais.get(country, [])




































const SIGNATURE_PATTERNS: Array[String] = [
	"stripes", "hoops", "checkers", "half", "diagonal", "quarters", "chevron",


	"sash_r",


	"rombos", "chevron_up",


	"rayas_desig", "aros_desig", "rayas_duo", "aros_duo",




	"stripes_yoke", "hoops_sash", "half_stripes", "band_h_stripes",
	"quarters_pin", "rombos_half", "hoops_yoke", "hoops_half", "checkers_half",
	"stripes_sash", "pin_sash_r", "stripes_chevron", "quarters_hoops",
	"stripes_diagonal", "rayas_desig_yoke", "aros_desig_half",





	"aspa", "half_h", "galon_doble", "cintura", "rayas_diag", "band_v",
	"stripes_half_h", "rayas_diag_yoke",
]















const AWAY_PATTERNS: Array[String] = [




	"solid", "sleeves", "pinstripes", "gradient", "gradient_h",
	"yoke", "raglan", "flank",



	"pin_yoke", "gradient_stripes", "gradient_hoops",
	"gradient_h_hoops", "gradient_yoke", "gradient_half", "gradient_pin",
	"gradient_h_half",



	"aros_fino", "gradient_diag", "aros_fino_yoke", "aros_fino_half_h",
	"gradient_diag_half", "gradient_diag_yoke",
	"gradient_cintura", "gradient_galon_doble", "gradient_aspa", "gradient_half_h",


	"waves_v", "lineas_pares", "aros_pares", "lluvia", "espiga_fina",



	"grad_waves_fino", "grad_waves_v", "grad_zigzag", "grad_lineas_pares",
	"grad_aros_pares", "grad_rejilla_diag", "grad_punteado", "grad_contornos",
	"grad_lluvia", "grad_espiga_fina",
	"gradh_waves_v", "gradh_lineas_pares", "gradh_lluvia", "gradh_contornos",

	"waves_v_yoke", "lineas_pares_yoke", "espiga_fina_yoke",
]
const THIRD_PATTERNS: Array[String] = [


	"sash", "band_h",

	"diag_thin", "arrows", "waves", "speckle", "escamas", "trenza",



	"escamas_half", "speckle_half", "trenza_half", "waves_half", "arrows_yoke",

	"gradient_waves", "gradient_sash", "gradient_checkers",




	"waves_fino", "zigzag", "contornos", "rejilla_diag", "punteado",

	"lluvia_half", "zigzag_half", "rejilla_diag_half", "punteado_sash",
	"contornos_cintura", "waves_fino_half_h",
]







const THIRD_COLORS: Array[Color] = [
	Color("17171f"),
	Color("3a4048"),
	Color("b8912f"),
	Color("1f7a72"),
	Color("6d1f38"),
	Color("d8674a"),
	Color("58c2a0"),
	Color("6fa8dc"),
	Color("cbb28a"),
	Color("6a4bab"),
]







const AWAY_HISTORIC: Dictionary = {
	"bar": Color("f4d03f"),
	"rma": Color("5b2c6f"),
	"liv": Color("f6eb61"),
	"ars": Color("f2d024"),
	"mil": Color("f5f5f7"),
	"int": Color("f5f5f7"),
	"fla": Color("f5f5f7"),




	"juv": Color("e4a0c0"),
	"che": Color("f6eb61"),
}




static func _club_seed(team: Dictionary) -> int:
	return absi(hash(String(team.get("id", "x"))))




static func _contrast_accent(shirt: Color) -> Color:
	return Color(0.09, 0.09, 0.12) if shirt.get_luminance() > 0.5 \
			else Color(0.96, 0.96, 0.97)





























static func _pool_minus_local(pool: Array[String], team: Dictionary) -> Array[String]:
	var local_pat: String = String(team.get("pattern", "solid"))
	var libres: Array[String] = []
	for pat in pool:
		if pat != local_pat:
			libres.append(pat)
	return libres if not libres.is_empty() else pool.duplicate()











static func local_accent(team: Dictionary, season: int, base: Color) -> Color:









	match posmod(_club_seed(team) + season, 3):
		1:
			return Color.from_hsv(base.h, base.s, clampf(base.v * 0.82, 0.06, 1.0), base.a)
		2:
			return Color.from_hsv(base.h, base.s, clampf(base.v * 1.18, 0.0, 1.0), base.a)
	return base


























const DORSAL_FONTS: Array[String] = ["bloque", "bloque", "bloque", "estrecha",
	"estrecha", "palo", "serif", "redonda"]


const DORSAL_STYLES: Array[String] = ["auto", "auto", "auto", "auto", "plano",
	"sombra", "club", "relieve"]





const DORSAL_FILLS: Array[String] = ["solido", "solido", "solido",
	"bicolor", "rayado", "degradado", "bicolor"]











static func dorsal_of(team: Dictionary) -> Dictionary:
	var s: int = _club_seed(team)
	var estilos: Array[String] = DORSAL_STYLES.duplicate()
	if String(team.get("pattern", "solid")) != "solid":
		estilos = []
		for e in DORSAL_STYLES:
			if e != "plano" and e != "relieve":
				estilos.append(e)
	return {
		"num_font": DORSAL_FONTS[(s / 7) % DORSAL_FONTS.size()],
		"num_style": estilos[(s / 53) % estilos.size()],
		"num_fill": DORSAL_FILLS[(s / 197) % DORSAL_FILLS.size()],
	}






static func local_pat_w(team: Dictionary) -> int:
	return 2 + _club_seed(team) % 3







const CICLO_DERIVA: int = 2520

















static func drift_season(team: Dictionary, season: int) -> int:
	var t0: int = int(team.get(TeamEdits.SEASON_KEY, 0))
	if t0 < 1:
		return season










	return posmod(season - t0, CICLO_DERIVA) + 1
















const LOCAL_TRIMS: Array[String] = [
	"collar", "cuff", "vneck", "hem", "shoulder", "piping", "none",
]







static func local_trim(team: Dictionary, season: int) -> String:
	if season <= 1:
		return "none"
	return LOCAL_TRIMS[posmod(_club_seed(team) + season, LOCAL_TRIMS.size())]





const SOCK_PATS: Array[String] = ["solid", "vuelta", "franja", "aros", "dos_franjas"]
const SOCK_PAT_ODDS: Array[int] = [45, 25, 15, 10, 5]



const SHORT_PATS: Array[String] = ["solid", "filo", "doble_filo", "ribete", "filo_ribete",
	"panel", "abertura"]
const SHORT_PAT_ODDS: Array[int] = [50, 15, 10, 10, 5, 5, 5]


const TRIM_NEUTROS: Array[Color] = [Color("f2f2f4"), Color("14141a"), Color("d8b24a")]












static func kit_detalles(team: Dictionary, season: int, slot: int, out: Dictionary) -> void:
	if slot < 0 or slot > 2 or not out.has("kit") or not out.has("kit2"):
		return
	if slot == 0 and season <= 1:
		return
	var rng := RandomNumberGenerator.new()
	rng.seed = _club_seed(team)^(season * 7919)^(slot * 104729)
	var kit: Color = out["kit"]
	var kit2: Color = out["kit2"]
	var acc: Color = out.get("kit_b", _contrast_accent(kit))

	var tiro: int = rng.randi() % 100
	var sock: Color = kit if tiro < 40 else (kit2 if tiro < 75 else acc)

	var pat: String = SOCK_PATS[_tirada(SOCK_PAT_ODDS, rng)]
	if not sock.is_equal_approx(kit):
		out["sock"] = sock
	if pat != "solid":


		var sock_b: Color = _contrast_accent(sock)
		for c: Color in [kit, kit2, acc]:
			if not kits_clash(c, sock):
				sock_b = c
				break
		out["sock_pat"] = pat
		out["sock_b"] = sock_b



	if slot != 0:
		out["local_trim"] = LOCAL_TRIMS[posmod(_club_seed(team) + season + slot * 3,
			LOCAL_TRIMS.size())]
		var tercero: Color = TRIM_NEUTROS[0]
		var candidatos: Array = [team.get("kit", kit), team.get("kit2", kit2)]
		candidatos.append_array(TRIM_NEUTROS)
		for c: Color in candidatos:
			if not kits_clash(c, kit) and not kits_clash(c, acc):
				tercero = c
				break
		out["trim_col"] = tercero



	var sp: String = SHORT_PATS[_tirada(SHORT_PAT_ODDS, rng)]
	if sp != "solid":
		out["short_pat"] = sp
		out["kit2_b"] = _acento_que_se_lee(kit2, [kit, acc])




const TRIMS_DE_CUELLO: Array[String] = ["collar", "cuff", "vneck"]














static func detalles_editados(team: Dictionary, slot: int, out: Dictionary,
		temporada: int = 1) -> void:
	if slot < 0 or slot > 2 or not out.has("kit") or not out.has("kit2"):
		return
	var pre: String = ["", "away_", "third_"][slot]
	var kit: Color = out["kit"]
	var kit2: Color = out["kit2"]
	var acc: Color = out.get("kit_b", kit2)
	var sp: String = String(team.get(pre + "short_pat", ""))
	if not sp.is_empty():
		sp = _pinned_pattern(sp, SHORT_PATS, temporada)
	if sp == "solid":
		out.erase("short_pat")
		out.erase("kit2_b")
	elif not sp.is_empty():
		out["short_pat"] = sp
		var sb: Variant = team.get(pre + "short_b")
		out["kit2_b"] = sb if sb is Color and (temporada <= 1 or not kits_clash(sb, kit2)) \
				else _acento_que_se_lee(kit2, [kit, acc])
	var sock: Variant = team.get(pre + "sock")
	if sock is Color:
		out["sock"] = sock
	var media: Color = out.get("sock", kit)
	var kp: String = String(team.get(pre + "sock_pat", ""))
	var kb: Variant = team.get(pre + "sock_b")
	if not kp.is_empty():
		kp = _pinned_pattern(kp, KitRecolor.SOCK_CLUB, temporada)
	if kb is Color and temporada > 1 and kits_clash(kb, media):
		kb = null
	if kp == "solid":
		out.erase("sock_pat")
		out.erase("sock_b")
	elif not kp.is_empty():
		out["sock_pat"] = kp
		out["sock_b"] = kb if kb is Color else _acento_que_se_lee(media, [kit2, kit, acc])
	elif kb is Color and out.has("sock_pat"):
		out["sock_b"] = kb
	var cuello: Variant = team.get(pre + "cuello")
	var puno: Variant = team.get(pre + "puno")
	if cuello is Color:
		out["cuello_col"] = cuello
	if puno is Color:
		out["puno_col"] = puno
	if (cuello is Color or puno is Color) \
			and TRIMS_DE_CUELLO.has(String(out.get("local_trim", ""))):
		out.erase("local_trim")
		out.erase("trim_col")



static func _acento_que_se_lee(tela: Color, opciones: Array) -> Color:
	for c: Color in opciones:
		if not kits_clash(c, tela):
			return c
	return _contrast_accent(tela)



static func _tirada(pesos: Array[int], rng: RandomNumberGenerator) -> int:
	var total: int = 0
	for w in pesos:
		total += w
	var t: int = rng.randi() % maxi(total, 1)
	for i in pesos.size():
		t -= pesos[i]
		if t < 0:
			return i
	return pesos.size() - 1














static func local_shade(team: Dictionary, season: int, base: Color) -> Color:
	if season <= 1 or base.s < 0.1:
		return base
	match posmod(_club_seed(team) + season, 4):
		1:
			return Color.from_hsv(base.h, clampf(base.s * 0.86, 0.0, 1.0),
				clampf(base.v * 0.84, 0.06, 1.0), base.a)
		2:
			return Color.from_hsv(base.h, clampf(base.s * 1.14, 0.0, 1.0),
				clampf(base.v * 1.14, 0.0, 1.0), base.a)
		3:
			return Color.from_hsv(base.h, clampf(base.s * 1.08, 0.0, 1.0),
				clampf(base.v * 0.97, 0.06, 1.0), base.a)
	return base









static func _season_tone(base: Color, seed_i: int, season: int) -> Color:
	if season <= 1 or base.s < 0.1:
		return base
	match posmod(seed_i + season, 3):
		1:
			return Color.from_hsv(base.h, clampf(base.s * 0.92, 0.0, 1.0),
				clampf(base.v * 0.86, 0.06, 1.0), base.a)
		2:
			return Color.from_hsv(base.h, clampf(base.s * 1.08, 0.0, 1.0),
				clampf(base.v * 1.12, 0.0, 1.0), base.a)
	return base






static func retro_kit(team: Dictionary) -> Dictionary:
	var home: Color = team["kit"]
	var shirt: Color = Color.from_hsv(home.h, minf(home.s * 0.9 + 0.05, 1.0),
		clampf(home.v * 0.8, 0.12, 1.0))





	var dibujos: Array[String] = ["yoke", "hoops", "sash"]
	dibujos.erase(String(team.get("pattern", "solid")))
	return {"kit": shirt, "kit2": Color("17171f"), "kit_b": Color("b8912f"),
		"pattern": dibujos[_club_seed(team) % dibujos.size()],



		"num_ink": Color("d9b23c"), "crest_rim": Color("d9b23c"),






		"retro": true}




















static func local_pattern(team: Dictionary, season: int) -> String:
	var pool: Array[String] = SIGNATURE_PATTERNS.duplicate()
	pool.append("solid")
	return _pinned_pattern(String(team.get("pattern", "solid")), pool, season)





static func away_pattern(team: Dictionary, season: int = 0) -> String:
	var libres: Array[String] = _pool_minus_local(AWAY_PATTERNS, team)
	return libres[posmod(_club_seed(team) + season, libres.size())]




static func third_pattern(team: Dictionary, season: int = 0) -> String:
	var libres: Array[String] = _pool_minus_local(THIRD_PATTERNS, team)
	return libres[posmod(_club_seed(team) + season, libres.size())]















const AWAY_LUM_SEP: float = 0.28

static func _away_base(team: Dictionary) -> Color:
	var id: String = String(team.get("id", ""))




	if AWAY_HISTORIC.has(id) and not TeamEdits.edited(id):
		return AWAY_HISTORIC[id]
	var home: Color = team["kit"]
	var second: Color = team["kit2"]
	var lum: float = home.get_luminance()


	if absf(second.get_luminance() - lum) >= AWAY_LUM_SEP \
			and not kits_clash(second, home):
		return second


	if lum <= 0.5:
		return Color("f5f5f7")
	var ref: Color = home if home.s >= second.s else second
	var hue: float = ref.h if ref.s > 0.15 else 0.62
	var hondo: Color = Color.from_hsv(hue, maxf(ref.s, 0.55), 0.3)


	return hondo if absf(hondo.get_luminance() - lum) >= AWAY_LUM_SEP \
			and not kits_clash(hondo, home) else Color("17171f")

















static func _variant_short(shirt: Color, anchor: Color, seed_i: int, season: int) -> Color:
	if season <= 1:
		return anchor
	match posmod(seed_i + season, 3):
		0:
			return shirt
		2:
			return Color.from_hsv(shirt.h, minf(shirt.s + 0.05, 1.0),
				maxf(shirt.v * 0.45, 0.1), shirt.a)
	return anchor


static func away_kit(team: Dictionary, season: int = 0) -> Dictionary:
	var seed_i: int = _club_seed(team)








	var base: Color = _pinned_color(team, "away_kit", _away_base(team))





	var id: String = String(team.get("id", ""))
	if not (AWAY_HISTORIC.has(id) and not TeamEdits.edited(id)):
		base = _season_tone(base, seed_i, season)



	var out: Dictionary = {"kit": base,
		"kit2": _variant_short(base, _pinned_color(team, "away_kit2", team["kit"]),
			seed_i, season)}


	var pin_pat: String = _pinned_text(team, "away_pattern", "")
	out["pattern"] = away_pattern(team, season) if pin_pat.is_empty() \
			else _pinned_pattern(pin_pat, _pool_minus_local(AWAY_PATTERNS, team), season)




	var mark: Color = team["kit"] if not _same_ink(base, team["kit"]) else team["kit2"]
	out["kit_b"] = _pinned_color(team, "away_kit_b",
		mark if not _same_ink(base, mark) else _contrast_accent(base))
	return out




static func _same_ink(a: Color, b: Color) -> bool:
	return kits_clash(a, b)














static func third_kit(team: Dictionary, season: int = 0) -> Dictionary:
	var seed_i: int = _club_seed(team)
	var home: Color = team["kit"]
	var away: Color = _away_base(team)









	var utiles: Array[Color] = []
	for c in THIRD_COLORS:
		if not kits_clash(c, home) and not kits_clash(c, away):
			utiles.append(c)
	if utiles.is_empty():
		utiles = THIRD_COLORS.duplicate()
	var shirt: Color = utiles[posmod(seed_i + season, utiles.size())]






	if team.get("third_kit") is Color:
		shirt = _season_tone(team["third_kit"], seed_i, season)




	var short_anchor: Color = _pinned_color(team, "third_kit2",
		Color.from_hsv(shirt.h, minf(shirt.s + 0.05, 1.0), maxf(shirt.v * 0.28, 0.1)))
	var short: Color = _variant_short(shirt, short_anchor, seed_i, season)
	var pin_pat: String = _pinned_text(team, "third_pattern", "")
	return {"kit": shirt, "kit2": short,
		"kit_b": _pinned_color(team, "third_kit_b", _contrast_accent(shirt)),
		"pattern": third_pattern(team, season) if pin_pat.is_empty() \
				else _pinned_pattern(pin_pat, _pool_minus_local(THIRD_PATTERNS, team), season)}
















static func _pinned_color(team: Dictionary, key: String, fallback: Color) -> Color:
	var v: Variant = team.get(key, null)
	return (v as Color) if v is Color else fallback





static func _pinned_text(team: Dictionary, key: String, fallback: String) -> String:
	var v: Variant = team.get(key, null)
	return String(v) if v != null else fallback
















static func _pinned_pattern(pinned: String, pool: Array[String],
		season: int) -> String:
	var libres: Array[String] = pool.duplicate()
	if not libres.has(pinned):
		libres.append(pinned)
	return libres[posmod(libres.find(pinned) + season - 1, libres.size())]



static func kits_clash(a: Color, b: Color) -> bool:
	var dist: float = absf(a.r - b.r) + absf(a.g - b.g) + absf(a.b - b.b)
	return dist < 0.45




static func media_de(cfg: Dictionary) -> Color:
	var c: Variant = cfg.get("sock", cfg.get("kit", Color.WHITE))
	return c if c is Color else Color.WHITE







static func mezcla_choque(suyo: Dictionary, tuyo: Dictionary, otro: Dictionary) -> Dictionary:
	if not (suyo.get("kit2") is Color and tuyo.get("kit2") is Color):
		return suyo
	var out: Dictionary = suyo
	var corto: Color = tuyo["kit2"]
	if kits_clash(suyo["kit2"], corto):
		var nuevo: Color = _sin_choque([otro.get("kit2"), otro.get("kit")], corto)
		out = out.duplicate()
		out["kit2"] = nuevo
	var media: Color = media_de(tuyo)
	if kits_clash(media_de(out), media):
		if out == suyo:
			out = out.duplicate()
		out["sock"] = _sin_choque([media_de(otro), otro.get("kit2"), otro.get("kit")], media)
		out.erase("sock_pat")
		out.erase("sock_b")
	return out



static func _sin_choque(cands: Array, contra: Color) -> Color:
	for c in cands:
		if c is Color and not kits_clash(c, contra):
			return c
	return _contrast_accent(contra)
