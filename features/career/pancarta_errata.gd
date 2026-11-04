class_name PancartaErrata
extends RefCounted


























const TIPOS: Array[String] = ["cambiada", "traspuesta", "doblada", "falta"]





const SWAP: Dictionary = {
	"B": "V", "V": "B", "S": "Z", "Z": "S", "C": "K", "K": "C", "I": "Y", "Y": "I",
	"N": "M", "M": "N", "G": "J", "J": "G", "O": "U", "U": "O", "E": "A", "A": "E",
	"R": "L", "L": "R",
}








const MALAS: Array[String] = [

	"PUTA", "PUTO", "CULO", "PEDO", "MIERDA", "POLLA", "CONO", "CAGA", "VERGA",
	"PICHA", "PENE", "TETA", "MAMON",

	"FUCK", "SHIT", "CUNT", "DICK", "COCK", "PISS", "TWAT", "SLUT", "NAZI", "PORN",

	"MERDE", "PUTE", "CONNARD", "BITE", "CHIER", "SALOPE",

	"CAZZO", "MERDA", "FICA", "TROIA", "STRONZO", "MINCHIA",

	"PORRA", "CARALHO", "FODA", "BUCETA", "PICA",

	"SCHEISSE", "FICK", "ARSCH", "HURE", "FOTZE", "KACKE", "PIMMEL",
]



const MIN_LETRAS: int = 4


const MAX_LETRAS: int = 10




const INTENTOS: int = 12







static func apellido_de(nombre: String) -> String:
	var parts: PackedStringArray = nombre.strip_edges().split(" ", false)
	var s: String = parts[parts.size() - 1] if parts.size() > 0 else nombre
	return PixelText.normalize(s.to_upper()).substr(0, MAX_LETRAS)





static func apta(ape: String) -> bool:
	if ape.length() < MIN_LETRAS:
		return false
	for ch in ape:
		if ch < "A" or ch > "Z":
			return false
	return true



static func limpia(original: String, nuevo: String) -> bool:
	for w in MALAS:
		if nuevo.contains(w) and not original.contains(w):
			return false
	return true











static func errata(apellido: String, semilla: int) -> Dictionary:
	var ape: String = PixelText.normalize(apellido.to_upper()).substr(0, MAX_LETRAS)
	if not apta(ape):
		return {}
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	for _k in INTENTOS:
		var c: Dictionary = _candidato(ape, rng)
		if c.is_empty():
			continue
		if not limpia(ape, String(c["texto"])):
			continue
		c["ape"] = ape
		return c
	return {}




static func _candidato(ape: String, rng: RandomNumberGenerator) -> Dictionary:
	var tipo: String = TIPOS[rng.randi_range(0, TIPOS.size() - 1)]
	var i: int = rng.randi_range(1, ape.length() - 1)
	match tipo:
		"cambiada":
			var ch: String = ape[i]
			if not SWAP.has(ch):
				return {}
			var t: String = ape.substr(0, i) + String(SWAP[ch]) + ape.substr(i + 1)
			return {"texto": t, "tipo": tipo, "idx": i, "n": 1, "buena": ch}
		"traspuesta":

			if i + 1 >= ape.length() or ape[i] == ape[i + 1]:
				return {}
			var t2: String = ape.substr(0, i) + ape[i + 1] + ape[i] + ape.substr(i + 2)
			return {"texto": t2, "tipo": tipo, "idx": i, "n": 2,
				"buena": ape.substr(i, 2)}
		"doblada":

			var t3: String = ape.substr(0, i + 1) + ape[i] + ape.substr(i + 1)
			return {"texto": t3, "tipo": tipo, "idx": i + 1, "n": 1, "buena": ""}
		"falta":


			if i >= ape.length() - 1:
				return {}
			var t4: String = ape.substr(0, i) + ape.substr(i + 1)
			return {"texto": t4, "tipo": tipo, "idx": i, "n": 1, "buena": ape[i]}
	return {}
