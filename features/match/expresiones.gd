class_name Expresiones





















const ANCLAS_PATH: String = "res://assets/sprites/modular/caras_anclas.json"

const BOCA_OSCURA: Color = Color("6e2323")
const BOCA_DENTRO: Color = Color("c84646")
const DIENTES: Color = Color("faf8f0")
const CONTORNO: Color = Color("1e140f")
const LAGRIMA: Color = Color("5aaaf0")
const PARPADO: Color = Color("3c2319")



const CEJAS_FRENTE: Dictionary = {
	"plana": [[-2, -2], [-1, -2], [0, -2], [4, -2], [5, -2], [6, -2]],
	"alegre": [[-2, -3], [-1, -3], [0, -3], [4, -3], [5, -3], [6, -3]],
	"concentra": [[-2, -1], [-1, -1], [0, -1], [4, -1], [5, -1], [6, -1]],
	"rabia": [[-2, -2], [-1, -2], [0, -1], [6, -2], [5, -2], [4, -1]],
	"triste": [[-2, -1], [-1, -1], [0, -2], [6, -1], [5, -1], [4, -2]],
	"sorpresa": [[-2, -2], [-1, -3], [0, -3], [4, -3], [5, -3], [6, -2]],
	"dolor": [[-1, -3], [0, -3], [4, -3], [5, -3]],
}
const CEJAS_PERFIL: Dictionary = {
	"plana": [[-1, -2], [0, -2], [1, -2]],
	"alegre": [[-1, -3], [0, -3], [1, -3]],
	"concentra": [[-1, -1], [0, -1], [1, -1]],
	"rabia": [[-1, -3], [0, -2], [1, -1]],
	"triste": [[-1, -2], [0, -2], [1, -3]],
	"sorpresa": [[-1, -2], [0, -3], [1, -3]],
	"dolor": [[0, -3], [1, -3]],
}


const BOCAS_FRENTE: Dictionary = {
	"cerrada": {"m": [[1, 5], [2, 5], [3, 5]]},
	"media": {"m": [[1, 5], [2, 5], [3, 5], [2, 6]]},
	"abierta": {"m": [[1, 5], [2, 5], [3, 5], [1, 6], [3, 6], [2, 7]], "r": [[2, 6]]},
	"grito": {"m": [[0, 5], [4, 5], [0, 6], [4, 6], [1, 7], [2, 7], [3, 7]],
		"w": [[1, 5], [2, 5], [3, 5]], "r": [[1, 6], [2, 6], [3, 6]]},
	"sonrisa": {"m": [[0, 5], [4, 5], [1, 6], [2, 6], [3, 6]], "w": [[1, 5], [2, 5], [3, 5]]},
	"risa": {"m": [[0, 5], [4, 5], [1, 7], [2, 7], [3, 7]],
		"w": [[1, 5], [2, 5], [3, 5]], "r": [[1, 6], [2, 6], [3, 6]]},
	"puchero": {"m": [[1, 5], [2, 5], [3, 5], [1, 6], [3, 6]]},
	"puchero2": {"m": [[2, 5], [1, 6], [3, 6]]},
	"o": {"m": [[2, 4], [1, 5], [3, 5], [2, 6]], "r": [[2, 5]]},
	"muerde": {"w": [[1, 5], [2, 5], [3, 5]], "m": [[1, 6], [2, 6], [3, 6]]},
	"aprieta": {"m": [[0, 5], [1, 5], [2, 5], [3, 5], [4, 5], [0, 7], [1, 7], [2, 7], [3, 7],
		[4, 7], [0, 6], [4, 6]], "w": [[1, 6], [2, 6], [3, 6]]},
}
const BOCAS_PERFIL: Dictionary = {
	"cerrada": {"m": [[-1, 5], [0, 5]]},
	"media": {"m": [[-1, 5], [0, 5], [0, 6]]},
	"abierta": {"m": [[-1, 5], [-1, 6], [0, 5]], "r": [[0, 6]]},
	"grito": {"m": [[-2, 5], [-2, 6], [-1, 7], [0, 7]], "w": [[-1, 5], [0, 5]],
		"r": [[-1, 6], [0, 6]]},
	"risa": {"m": [[-2, 5], [-2, 6], [-1, 7], [0, 7]], "w": [[-1, 5], [0, 5]],
		"r": [[-1, 6], [0, 6]]},
	"sonrisa": {"m": [[-2, 4], [-1, 6], [0, 6]], "w": [[-1, 5], [0, 5]]},
	"puchero": {"m": [[-2, 6], [-1, 5], [0, 5]]},
	"puchero2": {"m": [[-2, 6], [-1, 6], [0, 5]]},
	"o": {"m": [[-1, 5], [0, 4], [0, 6]], "r": [[0, 5]]},
	"muerde": {"m": [[-1, 6], [0, 6]], "w": [[-1, 5], [0, 5]]},
	"aprieta": {"m": [[-2, 5], [-2, 6], [-1, 6], [0, 6]], "w": [[-1, 5], [0, 5]]},
}
const BOCA_FABRICA_FRENTE: Array = [[1, 5], [2, 5], [3, 5]]
const BOCA_FABRICA_PERFIL: Array = [[0, 5]]



const OJOS_ZONA_FRENTE: Array = [-3, 7]
const OJOS_FRENTE: Dictionary = {
	"cerrados": [[-1, 1], [0, 1], [4, 1], [5, 1]],
	"guiño": [[4, 1], [5, 1]],
	"felices": [[-2, 1], [-1, 0], [0, 1], [4, 1], [5, 0], [6, 1]],
	"aprieta": [[-1, -1], [0, 0], [-1, 1], [5, -1], [4, 0], [5, 1]],
}
const OJOS_PERFIL: Dictionary = {
	"cerrados": [[0, 1], [1, 1]],
	"guiño": [[0, 1], [1, 1]],
	"felices": [[-1, 1], [0, 0], [1, 1]],
	"aprieta": [[-1, 0], [0, 1], [1, 1]],
}
const LAGRIMA_FRENTE: Array = [[-2, 2], [6, 2]]
const LAGRIMA_PERFIL: Array = [[-2, 2]]




const PASO_S: float = 0.14


const BUCLE_S: float = 16 * PASO_S
const ANIMACIONES: Dictionary = {
	"grito": [["sorpresa:grito:-:-1:0", 2], ["sorpresa:abierta:-:-1:0", 2]],
	"protesta": [["rabia:abierta:-:-1:0", 2], ["rabia:cerrada:-:-1:0", 1], ["rabia:media:-:-1:0", 2],
		["rabia:abierta:-:-1:0", 2], ["rabia:cerrada:-:-1:0", 3], ["rabia:abierta:-:-1:0", 2],
		["rabia:media:-:-1:0", 2], ["rabia:cerrada:-:-1:0", 2]],
	"lamento": [["triste:puchero:-:-1:0", 8], ["triste:puchero:cerrados:-1:0", 5],
		["triste:puchero:-:-1:0", 3]],
	"resoplar": [["-:cerrada:-:-1:1", 6], ["-:o:-:-1:0", 4], ["", 6]],
	"muerde": [["concentra:muerde:-:-1:0", 6], ["concentra:-:-:-1:0", 3], ["concentra:muerde:-:-1:0", 7]],
	"llorar": [["triste:puchero:-:0:0", 2], ["triste:puchero2:-:1:0", 2], ["triste:puchero:-:2:0", 2],
		["triste:puchero2:-:3:0", 2], ["triste:puchero:cerrados:-1:0", 2], ["triste:puchero2:-:-1:0", 2],
		["triste:puchero:-:-1:0", 4]],
	"llorar_alegria": [["alegre:sonrisa:-:0:0", 3], ["alegre:sonrisa:-:1:0", 3], ["alegre:sonrisa:-:2:0", 3],
		["alegre:sonrisa:-:3:0", 3], ["alegre:sonrisa:-:-1:0", 4]],
	"reir": [["alegre:risa:felices:-1:0", 2], ["alegre:sonrisa:felices:-1:0", 2]],
	"guino": [["-:sonrisa:-:-1:0", 8], ["-:sonrisa:guiño:-1:0", 4], ["-:sonrisa:-:-1:0", 4]],
	"dolor": [["dolor:aprieta:aprieta:-1:0", 10], ["dolor:abierta:aprieta:-1:0", 3],
		["dolor:aprieta:aprieta:-1:0", 3]],
}

const EMOCIONES: Dictionary = {
	"alegria": "alegre:sonrisa:-:-1:0", "rabia": "rabia:aprieta:-:-1:0",
	"tristeza": "triste:puchero:-:-1:0", "sorpresa": "sorpresa:o:-:-1:0",
	"concentra": "concentra:-:-:-1:0",
}






const BOLSAS: Dictionary = {
	"buena": ["alegria", "reir", "guino", "alegria", "", "reir"],
	"normal": ["", "", "concentra", "", "resoplar", "alegria"],
	"mala": ["tristeza", "lamento", "resoplar", "muerde", "", "tristeza"],



	"titulo": ["reir", "llorar_alegria", "alegria", "reir", "llorar_alegria", "guino"],
}


static func de_bolsa(animo: String, rng: RandomNumberGenerator) -> String:
	var bolsa: Array = BOLSAS.get(animo, BOLSAS["normal"])
	return String(bolsa[rng.randi() % bolsa.size()])



static func estado_en(nombre: String, t: float) -> String:
	var tramos: Array = ANIMACIONES.get(nombre, [])
	if tramos.is_empty():
		return String(EMOCIONES.get(nombre, ""))
	var total: int = 0
	for tr in tramos:
		total += int(tr[1])
	var c: int = int(t / PASO_S) % total
	for tr in tramos:
		c -= int(tr[1])
		if c < 0:
			return String(tr[0])
	return ""


static var _anclas: Dictionary = {}
static var _anclas_cargadas: bool = false


static func _carga() -> void:
	if _anclas_cargadas:
		return
	_anclas_cargadas = true
	var f := FileAccess.open(ANCLAS_PATH, FileAccess.READ)
	if f == null:
		return
	var datos: Variant = JSON.parse_string(f.get_as_text())
	if datos is Dictionary:
		_anclas = datos



static func tiene_cara(base_path: String) -> bool:
	_carga()
	return _anclas.has(base_path)



static func partes(expresion: String) -> Dictionary:
	var p: PackedStringArray = expresion.split(":")
	var parte := func(i: int) -> String: return p[i] if p.size() > i else "-"
	var lagrima: String = parte.call(3)
	return {
		"ceja": parte.call(0), "boca": parte.call(1), "ojos": parte.call(2),
		"lagrima": int(lagrima) if lagrima.is_valid_int() else -1,
		"mejilla": parte.call(4) == "1",
	}



static func quita_cejas(cfg: Dictionary) -> bool:
	if not cfg.has("expresion"):
		return false
	return partes(String(cfg["expresion"]))["ceja"] != "-"








static func deforma_cejas(cejas: Image, cfg: Dictionary, base_path: String) -> Image:
	_carga()
	var ancla: Dictionary = _anclas.get(base_path, {})
	var r: Rect2i = cejas.get_used_rect()
	if ancla.is_empty() or r.size.x <= 0:
		return cejas
	var ceja: String = partes(String(cfg.get("expresion", "")))["ceja"]
	var dir: String = String(ancla["dir"])
	var frente: bool = dir == "south"
	var fina: bool = r.size.y <= 1
	if not fina:
		fina = true
		for x in range(r.position.x, r.end.x):
			var alto: int = 0
			for y in range(r.position.y, r.end.y):
				if cejas.get_pixel(x, y).a > 0.0:
					alto += 1
			if alto > 1:
				fina = false
				break
	var out := Image.create(cejas.get_width(), cejas.get_height(), false, cejas.get_format())
	var x0: float = r.position.x
	var x1: float = r.end.x - 1
	for x in range(r.position.x, r.end.x):
		var d: float
		if frente:
			d = absf(x -(x0 + x1) * 0.5) / maxf((x1 - x0) * 0.5, 1.0)
		else:

			var hacia: float =(x - x0) / maxf(x1 - x0, 1.0)
			d = hacia if dir == "west" else 1.0 - hacia
		var k: int = _desplaza_ceja(ceja, d, fina)
		for y in range(r.position.y, r.end.y):
			var c: Color = cejas.get_pixel(x, y)
			if c.a > 0.0 and y + k >= 0 and y + k < out.get_height():
				out.set_pixel(x, y + k, c)
	return out



static func _desplaza_ceja(ceja: String, d: float, fina: bool) -> int:
	match ceja:
		"alegre":
			return -1
		"concentra":
			return 1
		"sorpresa":
			return -1 if d < 0.8 else 0
		"rabia":
			if fina and d < 0.25:
				return 2
			return 1 if d < 0.5 else 0
		"triste":
			if fina and d < 0.25:
				return -2
			return -1 if d < 0.5 else 0
		"dolor":
			return -1 if d < 0.65 else 0
	return 0




static func capa(cfg: Dictionary, base_path: String, base: Image, ceja_color: Color,
		con_ceja: bool = true) -> Image:
	if not cfg.has("expresion"):
		return null
	_carga()
	var ancla: Dictionary = _anclas.get(base_path, {})
	if ancla.is_empty():
		return null
	var e: Dictionary = partes(String(cfg["expresion"]))
	var dir: String = String(ancla["dir"])
	var o := Vector2i(int(ancla["ojo"][0]), int(ancla["ojo"][1]))
	var frente: bool = dir == "south"
	var sx: int = -1 if dir == "west" else 1
	var size: Vector2i = base.get_size()
	var out := Image.create(size.x, size.y, false, Image.FORMAT_RGBA8)

	var piel: Color = base.get_pixelv(o +(Vector2i(2, 0) if frente else Vector2i(-2 * sx, 2)))
	var pon := func(rel: Array, color: Color) -> void:
		var p := o + Vector2i(int(rel[0]) * sx, int(rel[1]))
		if p.x >= 0 and p.y >= 0 and p.x < size.x and p.y < size.y:
			out.set_pixelv(p, color)
	var pinta := func(lista: Array, color: Color) -> void:
		for rel in lista:
			pon.call(rel, color)

	var ojos: String = e["ojos"]
	var tabla_ojos: Dictionary = OJOS_FRENTE if frente else OJOS_PERFIL
	if tabla_ojos.has(ojos):
		var desde: int = OJOS_ZONA_FRENTE[0] if frente else -1
		var hasta: int = OJOS_ZONA_FRENTE[1] if frente else 1
		if frente and ojos == "guiño":
			desde = 3
		for y in [0, 1]:
			for x in range(desde, hasta + 1):
				pon.call([x, y], piel)
		pinta.call(tabla_ojos[ojos], PARPADO)

	var tabla_cejas: Dictionary = CEJAS_FRENTE if frente else CEJAS_PERFIL
	if con_ceja and tabla_cejas.has(e["ceja"]):
		pinta.call(tabla_cejas[e["ceja"]], ceja_color)

	var tabla_bocas: Dictionary = BOCAS_FRENTE if frente else BOCAS_PERFIL
	if tabla_bocas.has(e["boca"]):
		pinta.call(BOCA_FABRICA_FRENTE if frente else BOCA_FABRICA_PERFIL, piel)
		var b: Dictionary = tabla_bocas[e["boca"]]
		pinta.call(b.get("m", []), BOCA_OSCURA)
		pinta.call(b.get("r", []), BOCA_DENTRO)
		pinta.call(b.get("w", []), DIENTES)

	if e["mejilla"]:
		for y in [3, 4]:
			if frente:
				pon.call([-4, y], CONTORNO);pon.call([-3, y], piel)
				pon.call([8, y], CONTORNO);pon.call([7, y], piel)
			else:
				pon.call([2, y + 3], CONTORNO);pon.call([1, y + 3], piel)

	var t: int = e["lagrima"]
	if t >= 0:
		for rel in (LAGRIMA_FRENTE if frente else LAGRIMA_PERFIL):
			pon.call([rel[0], int(rel[1]) + t], LAGRIMA)
	return out
