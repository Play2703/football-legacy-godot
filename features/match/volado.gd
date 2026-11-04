class_name Volado
extends RefCounted



















const CARA: String = "cara"
const SOL: String = "sol"












const BONO: float = 0.08









static func gana(eleccion: String, salio: String) -> bool:
	return eleccion == salio








static func bono(gane: bool, mio: bool) -> float:
	if not gane:
		return 0.0
	return BONO if mio else - BONO





















static func sitios(depth: float) -> Dictionary:
	var z0: float = depth * 0.5
	return {
		"yo": Vector2(-0.85, z0),
		"rival": Vector2(0.85, z0),
		"central": Vector2(0.0, z0 - 1.3),
		"asis_izq": Vector2(-1.75, z0 - 2.15),
		"asis_der": Vector2(1.75, z0 - 2.15),
	}





const FOV_CORRO: float = 45.0






const FOV_MANO: float = 45.0
const FOV_VUELO: float = 52.0
const FOV_SUELO: float = 38.0









static func camara_corro(depth: float, atras: float = 0.0) -> Dictionary:
	var z0: float = depth * 0.5
	var look: Vector3 = Vector3(0.0, 1.32, z0 - 0.55)
	var eye: Vector3 = Vector3(0.3, 1.98, z0 + 7.6)
	if atras > 0.0:
		eye +=(eye - look).normalized() * atras
	return {"eye": eye, "look": look}
















static func camara_mano(central: Vector2) -> Dictionary:
	var look: Vector3 = Vector3(central.x + MANO_DX * 0.5, MANO_Y + 0.1,
		central.y)
	var eye: Vector3 = Vector3(central.x + MANO_DX * 0.5, MANO_Y + 0.26,
		central.y + 3.3)
	return {"eye": eye, "look": look}












const MANO_DX: float = 0.45
const MANO_Y: float = 1.25






static func punto_mano(central: Vector2) -> Vector3:
	return Vector3(central.x + MANO_DX, MANO_Y, central.y + 0.22)















static func camara_vuelo(depth: float, central: Vector2) -> Dictionary:
	var look: Vector3 = Vector3(central.x + MANO_DX * 0.6, 1.95, central.y)
	var eye: Vector3 = Vector3(central.x + 0.2, 1.75, central.y + 4.3)
	return {"eye": eye, "look": look}












static func camara_suelo(punto: Vector3) -> Dictionary:
	var look: Vector3 = Vector3(punto.x, 0.02, punto.z)
	var eye: Vector3 = Vector3(punto.x - 0.06, 0.85, punto.z + 0.8)
	return {"eye": eye, "look": look}







static func punto_caida(central: Vector2) -> Vector3:
	return Vector3(central.x + MANO_DX * 0.8, 0.012, central.y + 2.45)














static func camara_grada(gane: bool, away: Vector3) -> Dictionary:


	var lado: float = -1.0 if gane else 1.0
	var look: Vector3 = Vector3(lado * absf(away.x) * 0.82, 7.4, away.z - 9.5)
	var eye: Vector3 = Vector3(lado * 7.0, 3.1, 26.0)
	return {"eye": eye, "look": look}
