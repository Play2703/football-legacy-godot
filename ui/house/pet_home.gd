extends RefCounted



const MUEBLE: Dictionary = {"mascota": "cama_perro", "mascota_gato": "rascador_gato",
	"mascota_gallina": "gallinero", "mascota_loro": "posadero_loro"}





const SITIO: Dictionary = {
	"posadero_loro": {"frente": 0.0, "alto": 1.32},
	"cama_perro": {"frente": 0.0, "alto": 0.11},
	"rascador_gato": {"frente": 0.18, "alto": 0.45},
	"gallinero": {"frente": 0.3, "alto": 0.03},
}


static func destinos(escena: Node) -> Array:
	var sitios: Array = []
	var plano: Dictionary = escena.call("_plano")
	for p: Dictionary in plano.get("props", []):
		var kind: String = String(p.get("kind", ""))
		if not MUEBLE.values().has(kind) or not escena.call("_prop_visible", p):
			continue
		var r: Rect2 = p["rect"]
		var fab: int = int(p.get("face_fab", House.base_face(p)))
		var giro: int =(int(p.get("face", fab)) - fab)&3
		var frente: Vector2 = Vector2(0, -1).rotated(float(giro) * PI * 0.5)
		var sitio: Dictionary = SITIO.get(kind, {"frente": 0.0, "alto": 0.0})
		var at: Vector2 = r.get_center() + frente * float(sitio["frente"])
		if not House.plan_can_stand(plano, at, 0.14, Career.house_extras):
			continue
		sitios.append({"id": p["id"], "kind": kind, "rect": r, "giro": giro,
			"pos": at, "frente": frente, "alto": float(sitio["alto"])})
	return sitios


static func _soltar(escena: Node, pet: Dictionary, retirado: bool = false) -> void:
	var sitio: Dictionary = pet.get("home", {})
	var frente: Vector2 = sitio.get("frente", Vector2(0, -1))
	pet.erase("home")
	pet["home_wait"] = randf_range(12.0, 22.0)
	pet["rest"] = 0.0
	pet["target"] = escena.call("_free_near", Vector2(pet["pos"]) + frente * 0.9)
	if retirado:
		pet["home_y"] = 0.0
		escena.call("_place_pet", pet)


static func _camino_libre(escena: Node, desde: Vector2, hasta: Vector2) -> bool:
	var plano: Dictionary = escena.call("_plano")
	var pasos: int = maxi(1, ceili(desde.distance_to(hasta) / 0.12))
	for i in range(1, pasos + 1):
		if not House.plan_can_stand(plano, desde.lerp(hasta, float(i) / pasos),
				0.14, Career.house_extras):
			return false
	return true



static func tick(escena: Node, pet: Dictionary, delta: float, sitios: Array) -> bool:

	var especie: String = House.pet_familia(String(pet.get("id", "")))
	if not MUEBLE.has(especie):
		return false
	var pos: Vector2 = pet["pos"]
	var hogar: Dictionary = pet.get("home", {})
	if not hogar.is_empty() and not sitios.has(hogar):
		_soltar(escena, pet, true)
		return false
	if hogar.is_empty():
		var alto_antes: float = float(pet.get("home_y", 0.0))
		pet["home_y"] = move_toward(float(pet.get("home_y", 0.0)), 0.0, delta * 1.4)


		if not is_equal_approx(alto_antes, float(pet["home_y"])):
			escena.call("_place_pet", pet)
		pet["home_wait"] = float(pet.get("home_wait", 3.0)) - delta
		if float(pet["home_wait"]) > 0.0:
			return false
		pet["home_wait"] = randf_range(8.0, 14.0)
		var mejor: float = 5.0
		for s: Dictionary in sitios:
			var at: Vector2 = s["pos"]
			var dist: float = pos.distance_to(at)
			if String(s["kind"]) != String(MUEBLE[especie]) or dist >= mejor:
				continue
			if escena.call("_pet_blocked", pet, at) or not _camino_libre(escena, pos, at):
				continue
			hogar = s
			mejor = dist
		if hogar.is_empty():
			return false
		pet["home"] = hogar
		pet["home_time"] = 9.0
		pet["home_rest"] = 0.0
		pet["rest"] = 0.0
	var at: Vector2 = hogar["pos"]
	var dist: float = pos.distance_to(at)
	var alto: float = float(hogar["alto"]) *(1.0 if dist < 0.08 else
		clampf(1.0 - dist / 0.5, 0.0, 1.0))
	pet["home_y"] = move_toward(float(pet.get("home_y", 0.0)), alto, delta * 1.4)
	if dist < 0.08:
		if float(pet["home_rest"]) <= 0.0:
			pet["home_rest"] = randf_range(7.0, 12.0)
			pet["home_time"] = float(pet["home_rest"])
			escena.call("_pet_play", pet, Vector2.ZERO)
		pet["home_time"] = float(pet["home_time"]) - delta
		escena.call("_pet_react", pet, delta)
		escena.call("_place_pet", pet)
		if float(pet["home_time"]) <= 0.0:
			_soltar(escena, pet)
		return true
	pet["home_time"] = float(pet["home_time"]) - delta
	var cfg: Dictionary = pet["cfg"]
	var paso: Vector2 =(at - pos).normalized() * minf(dist, float(cfg["speed"]) * delta)
	var plano: Dictionary = escena.call("_plano")
	var siguiente: Vector2 = House.plan_move(plano, pos, paso, 0.14, Career.house_extras)
	if float(pet["home_time"]) <= 0.0 or escena.call("_pet_blocked", pet, siguiente) \
			or siguiente.distance_to(pos) < 0.0001:
		_soltar(escena, pet)
		return false
	pet["pos"] = siguiente
	pet["target"] = at
	pet["hold"] = 0.0
	pet["near"] = false
	escena.call("_pet_play", pet, siguiente - pos)
	escena.call("_place_pet", pet)
	return true
