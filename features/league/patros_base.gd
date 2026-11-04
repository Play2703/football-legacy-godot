class_name PatrosBase
extends RefCounted










































const BANDAS: Dictionary = {
	"altavia": 1, "numera": 1, "telix": 1, "zafra": 1,
	"norvia": 2, "mutuo": 2, "castel": 2, "vialta": 2,
	"tejas": 3, "agrisol": 3, "ferrete": 3, "marisma": 3,




	"grupohesa": 2, "ibercor": 2, "novabank": 2, "ruteria": 2,
	"talleresroca": 3, "panvalle": 3, "clinicasur": 3, "gruasomar": 3,
	"casamateo": 3, "riegosdelsur": 3, "hielosnorte": 3, "muebleslara": 3,
}







const COLORES: Dictionary = {
	"altavia": "d9d9d9", "numera": "3f6fa8", "telix": "8c5bd9", "zafra": "d9482f",
	"norvia": "e0973a", "mutuo": "3a8f7a", "castel": "c9a23a", "vialta": "5b6f8c",
	"tejas": "b5623a", "agrisol": "7f9e4c", "ferrete": "8a8f99", "marisma": "3a8fa8",
	"grupohesa": "6f7a8c", "ibercor": "b5453f", "novabank": "3f6f9e",
	"ruteria": "c98b45", "talleresroca": "7f8a99", "panvalle": "c9a05a",
	"clinicasur": "4c9e9e", "gruasomar": "d98f2b", "casamateo": "a8563a",
	"riegosdelsur": "5b9e6a", "hielosnorte": "6fa8c9", "muebleslara": "9e7a4c",
}





const NOMBRES: Dictionary = {
	"altavia": "ALTAVIA AIR", "numera": "BANCA NUMERA",
	"telix": "TELIX", "zafra": "ZAFRA COLA",
	"norvia": "SUPER NORVIA", "mutuo": "MUTUO SEGUROS",
	"castel": "CEREALES CASTELO", "vialta": "VIALTA LOGÍSTICA",
	"tejas": "TEJAS DEL VALLE", "agrisol": "AGRISOL",
	"ferrete": "FERRETERÍA FERRETE", "marisma": "CONSERVAS MARISMA",
	"grupohesa": "GRUPO HESA", "ibercor": "IBERCOR",
	"novabank": "NOVABANK", "ruteria": "LA RUTERIA",
	"talleresroca": "TALLERES ROCA", "panvalle": "PAN DEL VALLE",
	"clinicasur": "CLINICA SUR", "gruasomar": "GRUAS OMAR",
	"casamateo": "CASA MATEO", "riegosdelsur": "RIEGOS DEL SUR",
	"hielosnorte": "HIELOS NORTE", "muebleslara": "MUEBLES LARA",
}


const SVG: Dictionary = {

	"altavia": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M44 6h12L34 58H22l6-22H16l-6 10H2l6-16-6-16h8l6 10h12z\"/></svg>",
	"numera": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{D}\" d=\"M32 16v34c8-3 14-9 14-16V20z\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 4l24 8v22c0 13-10 22-24 26C18 56 8 47 8 34V12zm0 12v34c8-3 14-9 14-16V20z\"/></svg>",
	"telix": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><circle cx=\"32\" cy=\"32\" r=\"27\" fill=\"{D}\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 4a28 28 0 1 0 0 56 28 28 0 1 0 0-56zm0 10c5 0 9 8 9 18s-4 18-9 18-9-8-9-18 4-18 9-18zM6 26h52v12H6z\"/></svg>",
	"zafra": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{D}\" d=\"M32 23c5 8 7 13 7 16a7 7 0 0 1-14 0c0-3 2-8 7-16z\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 3C20 21 14 32 14 39a18 18 0 0 0 36 0c0-7-6-18-18-36zm0 20c5 8 7 13 7 16a7 7 0 0 1-14 0c0-3 2-8 7-16z\"/></svg>",


	"norvia": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M20 18a12 12 0 0 1 24 0h14l-6 40H12L6 18zm8 0h8a4 4 0 0 0-8 0zm-4 12h6v16h-6zm14 0h6v16h-6z\"/></svg>",
	"mutuo": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M28 4h8v6h-2c14 1 24 11 26 24H2C4 21 14 11 28 10zm0 30h8v14a8 8 0 0 1-16 0h8z\"/></svg>",
	"castel": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M30 2c4 6 4 10 0 14 4 2 4 8 0 12 4 2 4 8 0 12 4 2 4 8 0 12v10h-6V52c-8 0-14-6-14-12h14v-8c-8 0-14-6-14-12h14v-8c-8 0-14-6-14-12h14c0-4 2-6 6-8zm12 0h12c0 8-4 12-12 12zm0 20h12c0 8-4 12-12 12z\"/></svg>",
	"vialta": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M22 4h20l14 56H8zm6 10l-2 12h12l-2-12zm-4 22l-2 14h20l-2-14z\"/></svg>",


	"tejas": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M4 20L32 6l28 14-8 4-20-10-20 10zm0 14l28-14 28 14-8 4-20-10-20 10zm0 14l28-14 28 14-28 14z\"/></svg>",
	"agrisol": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M56 6C26 6 10 18 10 38c0 6 2 12 6 18h10c-4-6-6-12-6-18 0-8 6-14 18-16-10 6-14 12-14 20 22 0 32-14 32-36zM4 46h14v12H4z\"/></svg>",
	"ferrete": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M42 4a18 18 0 0 0-14 28L6 54l6 6 22-22a18 18 0 0 0 24-22l-10 10-10-4-2-10zm-8 40l10 10 8-8-10-10z\"/></svg>",
	"marisma": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M6 32C16 16 30 10 42 14l10-8v18c6 4 8 8 8 8s-2 4-8 8v18l-10-8C30 54 16 48 6 32zm30-10a4 4 0 1 0 0 8 4 4 0 1 0 0-8z\"/></svg>",
}




























const ROTULOS: Dictionary = {
	"grupohesa": ["GRUPO HESA", "gruesa"],
	"ibercor": ["IBERCOR", "gruesa"],
	"novabank": ["NOVABANK", "barra"],
	"ruteria": ["LA RUTERIA", "cursiva"],
	"talleresroca": ["TALLERES ROCA", "plano"],
	"panvalle": ["PAN DEL VALLE", "apretada"],
	"clinicasur": ["CLINICA SUR", "plano"],
	"gruasomar": ["GRUAS OMAR", "gruesa"],
	"casamateo": ["CASA MATEO", "plano"],
	"riegosdelsur": ["RIEGOS DEL SUR", "apretada"],
	"hielosnorte": ["HIELOS NORTE", "gruesa"],
	"muebleslara": ["MUEBLES LARA", "apretada"],
}



static func has(marca: String) -> bool:
	return SVG.has(marca) or ROTULOS.has(marca)



static func rotulo(marca: String) -> String:
	var v: Variant = ROTULOS.get(marca)
	return String((v as Array)[0]) if v is Array else ""



static func estilo(marca: String) -> String:
	var v: Variant = ROTULOS.get(marca)
	return String((v as Array)[1]) if v is Array else "plano"



static func color(marca: String) -> Color:
	var hex: String = String(COLORES.get(marca, ""))
	return Color(hex) if not hex.is_empty() else Color("f4f1ec")




static func ids() -> Array:
	var out: Array = SVG.keys() + ROTULOS.keys()
	out.sort()
	return out



static func svg(marca: String) -> String:
	return String(SVG.get(marca, ""))



static func banda(marca: String) -> int:
	return int(BANDAS.get(marca, 0))



static func nombre(marca: String) -> String:
	return String(NOMBRES.get(marca, ""))
