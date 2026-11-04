extends RefCounted



const IDS: Array[String] = ["helicoptero", "video", "asador", "cine", "spa"]

static func prop(id: String) -> Dictionary:
	if not IDS.has(id):
		return {}
	return {"kind": "tele", "rect": Rect2(-2, -2, 4, 4), "face": 0,
		"retrato_extra": id}

static func pieza(escena: Node, kind: String, rect: Rect2, datos: Dictionary = {}) -> void:
	var p: Dictionary = {"kind": kind, "rect": rect, "face": 0, "guardado": false}
	p.merge(datos, true)
	escena.call("_add_prop", p)

static func pintar(escena: Node, id: String) -> void:
	match id:
		"helicoptero":
			pieza(escena, "helipuerto", Rect2(-2.5, -2.5, 5, 5),
				{"retrato_helicoptero": true})
		"video":
			pieza(escena, "tele", Rect2(-1, 0.5, 2, 0.5))
			pieza(escena, "pizarra_tactica", Rect2(1.15, 0.45, 1.5, 0.5))
		"cine":
			pieza(escena, "tele", Rect2(-1.6, 1.0, 3.2, 0.5))
			for x in [-1.25, 0.3]:
				pieza(escena, "sillon", Rect2(x, -1.3, 1.0, 1.0),
					{"col": HouseScape.BUTACA_CINE, "face": 2})
		"spa":
			pieza(escena, "camilla_fisio", Rect2(-1.0, -1.3, 2, 1))
			pieza(escena, "jacuzzi", Rect2(-1.2, 0.4, 2.4, 2.4))
		"asador":

			preload("res://ui/house/asador_pulido.gd").pintar(escena,
				[HouseScape.ASADOR_CUERPO, HouseScape.ASADOR_PARRILLA,
				HouseScape.ASADOR_HIERRO, HouseScape.ASADOR_BRASA, HouseScape.ASADOR_REJILLA])

static func caja(escena: Node, pos: Vector3, tam: Vector3, color: Color) -> void:
	escena.call("_add_box", pos, tam, color)
