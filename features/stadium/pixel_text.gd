class_name PixelText
extends RefCounted




const GLYPH_W: int = 3
const GLYPH_H: int = 5

const FONT: Dictionary = {
	"A": [2, 5, 7, 5, 5],
	"B": [6, 5, 6, 5, 6],
	"C": [3, 4, 4, 4, 3],
	"D": [6, 5, 5, 5, 6],
	"E": [7, 4, 6, 4, 7],
	"F": [7, 4, 6, 4, 4],
	"G": [3, 4, 5, 5, 3],
	"H": [5, 5, 7, 5, 5],
	"I": [7, 2, 2, 2, 7],
	"J": [3, 1, 1, 5, 2],
	"K": [5, 6, 4, 6, 5],
	"L": [4, 4, 4, 4, 7],
	"M": [5, 7, 7, 5, 5],
	"N": [6, 5, 5, 5, 5],
	"O": [2, 5, 5, 5, 2],
	"P": [6, 5, 6, 4, 4],
	"Q": [2, 5, 5, 6, 3],
	"R": [6, 5, 6, 5, 5],
	"S": [3, 4, 2, 1, 6],
	"T": [7, 2, 2, 2, 2],
	"U": [5, 5, 5, 5, 7],
	"V": [5, 5, 5, 5, 2],
	"W": [5, 5, 7, 7, 5],
	"X": [5, 5, 2, 5, 5],
	"Y": [5, 5, 2, 2, 2],
	"Z": [7, 1, 2, 4, 7],
	"0": [7, 5, 5, 5, 7],
	"1": [2, 6, 2, 2, 7],
	"2": [7, 1, 7, 4, 7],
	"3": [7, 1, 3, 1, 7],
	"4": [5, 5, 7, 1, 1],
	"5": [7, 4, 7, 1, 7],
	"6": [7, 4, 7, 5, 7],
	"7": [7, 1, 1, 2, 2],
	"8": [7, 5, 7, 5, 7],
	"9": [7, 5, 7, 1, 7],
	" ": [0, 0, 0, 0, 0],
	"-": [0, 0, 7, 0, 0],
	".": [0, 0, 0, 0, 2],
	"!": [2, 2, 2, 0, 2],
	"/": [1, 1, 2, 4, 4],
	":": [0, 2, 0, 2, 0],



	"+": [0, 2, 7, 2, 0],



	"?": [7, 1, 2, 0, 2],



	"%": [5, 1, 2, 4, 5],
}


static func draw_text(img: Image, x: int, y: int, text: String, color: Color, px: int = 1) -> void:
	var cx: int = x
	for ch in _normalize(text):
		var glyph: Array = FONT.get(ch, [])
		if glyph.is_empty():
			cx +=(GLYPH_W + 1) * px
			continue
		for row in GLYPH_H:
			var bits: int = glyph[row]
			for col in GLYPH_W:
				if bits&(4>>col):
					_fill_px(img, cx + col * px, y + row * px, px, color)
		cx +=(GLYPH_W + 1) * px


static func text_width(text: String, px: int = 1) -> int:
	var n: int = _normalize(text).length()
	if n == 0:
		return 0
	return n *(GLYPH_W + 1) * px - px





static func normalize(text: String) -> String:
	return _normalize(text)




const DIGRAPHS: Dictionary = {
	"Æ": "AE", "Œ": "OE", "ß": "SS", "Þ": "TH",
}


static func _normalize(text: String) -> String:
	var up: String = text.to_upper()
	for k in DIGRAPHS:
		up = up.replace(String(k), String(DIGRAPHS[k]))








	var from: String = "ÁÉÍÓÚÑÜÖÄËÏÀÈÌÒÙÂÊÎÔÛÃÕÅÇŞĞİÍØÐĐÝŽŠČĆŘĚŮĄĘŁŃŻŹŐŰ¡¿"
	var to: String = "AEIOUNUOAEIAEIOUAEIOUAOACSGIIODDYZSCCREUAELNZZOU! "
	var out: String = ""
	for ch in up:
		var i: int = from.find(ch)
		out += to[i] if i >= 0 else ch
	return out


static func _fill_px(img: Image, x: int, y: int, px: int, color: Color) -> void:
	for dy in px:
		for dx in px:
			var tx: int = x + dx
			var ty: int = y + dy
			if tx >= 0 and ty >= 0 and tx < img.get_width() and ty < img.get_height():
				img.set_pixel(tx, ty, color)
