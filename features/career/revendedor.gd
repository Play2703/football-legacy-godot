class_name Revendedor
extends RefCounted















const PROB: float = 1.0 / 3.0
const PRIMERO_MAX: int = 4
const HUECO: int = 3
const PIEZA_LADO: float = 0.07







static func plan(semilla: String, tipos: Array, n_firmas: int, forzado: bool = false) -> Dictionary:
	var dado := RandomNumberGenerator.new()
	dado.seed = hash("revendedor|" + semilla)
	var hay: bool = dado.randf() < PROB
	if not hay and not forzado:
		return {}
	var hombres: Array[int] = []
	for k in range(1, mini(PRIMERO_MAX + 1, n_firmas)):
		if k < tipos.size() and String(tipos[k]) == "el":
			hombres.append(k)
	if hombres.is_empty():
		return {}
	return {"k": hombres[dado.randi() % hombres.size()], "vueltas": 1 if dado.randf() < 0.5 else 2}




static func vuelta_en(i: int, n_firmas: int) -> int:
	var j: int = i + HUECO
	return j if j < n_firmas else -1





static func disfraz(ropa: Dictionary, vuelta: int) -> Dictionary:
	var out: Dictionary = ropa.duplicate()
	out.erase("casual_print")
	out.erase("casual_shirt2")
	var camisas: Array[Color] = KitRecolor.CASUAL_SHIRTS
	var antes: Color = ropa.get("casual_shirt", camisas[0])
	var i0: int = maxi(camisas.find(antes), 0)
	for paso in camisas.size():
		var col: Color = camisas[(i0 + vuelta * 3 + paso) % camisas.size()]
		if not col.is_equal_approx(antes):
			out["casual_shirt"] = col
			break
	return out





static func desenlace(pillado: bool, firmadas: int, visitas: int) -> String:
	if pillado:
		return "pillado"
	if visitas >= 2 and firmadas == visitas:
		return "reventa"
	return ""
