class_name MarcasBase
extends RefCounted













































const HUECO: String = "{C}"





const BANDAS: Dictionary = {
	"orbe": 1, "flecha": 1, "astro": 1,
	"pilar": 2, "lince": 2, "nodo": 2,
	"sierra": 3, "roble": 3, "faro": 3,




	"velatex": 2, "atlas": 2, "corsa": 3, "dural": 3,
	"kobra": 3, "vantor": 3, "primaline": 3, "ferro": 3,
}











const COLORES: Dictionary = {
	"orbe": "e8e8e6", "flecha": "d94f2b", "astro": "f2c318",
	"pilar": "3aa6a0", "lince": "c8442f", "nodo": "5b8ad9",
	"sierra": "6f9e4c", "roble": "b5793a", "faro": "d95f8c",
	"velatex": "8c6fd9", "atlas": "2f7fa8", "corsa": "e05a2b",
	"dural": "9aa8bb", "kobra": "4cae6a", "vantor": "c94f6d",
	"primaline": "e0a83a", "ferro": "7f8a99",
}








const SVG: Dictionary = {

	"orbe": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><circle cx=\"32\" cy=\"32\" r=\"19\" fill=\"{D}\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 5a27 27 0 1 0 0 54 27 27 0 1 0 0-54zm0 14a13 13 0 1 1 0 26 13 13 0 1 1 0-26z\"/></svg>",
	"flecha": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M6 20h14l14 12-14 12H6l14-12zm22 0h14l14 12-14 12H28l14-12z\"/></svg>",
	"astro": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M32 4l8 20 20 8-20 8-8 20-8-20-20-8 20-8z\"/></svg>",


	"pilar": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M8 40h12v18H8zm18-14h12v32H26zm18-14h12v46H44z\"/></svg>",
	"lince": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 6l26 46H6zm0 24l-12 16h24z\"/></svg>",
	"nodo": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{D}\" d=\"M32 20l12 7v14l-12 7-12-7V27z\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 4l24 14v28L32 60 8 46V18zm0 16l-12 7v14l12 7 12-7V27z\"/></svg>",







	"sierra": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" d=\"M6 56L20 16h8l6 16 6-16h8l14 40z\"/></svg>",
	"roble": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M32 6l22 26-22 26-22-26zm0 14L20 32l12 12 12-12z\"/></svg>",
	"faro": "<svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 64 64\" width=\"64\" height=\"64\"><path fill=\"{D}\" d=\"M25 30h14l1 10H24z\"/><path fill=\"{C}\" fill-rule=\"evenodd\" d=\"M18 58L26 8h12l8 50zm7-28h14l1 10H24z\"/></svg>",
}



























const ROTULOS: Dictionary = {
	"velatex": ["VELATEX", "cursiva"],
	"atlas": ["ATLAS", "gruesa"],
	"corsa": ["CORSA SPORT", "cursiva"],
	"dural": ["DURAL", "barra"],
	"kobra": ["KOBRA", "apretada"],
	"vantor": ["VANTOR ATHLETIC", "apretada"],
	"primaline": ["PRIMALINE", "apretada"],
	"ferro": ["FERRO", "plano"],
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
