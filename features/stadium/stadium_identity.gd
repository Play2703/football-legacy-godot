extends RefCounted


static func acustica(cerramiento: float, cubierta: float, asistencia: float) -> Vector2:
	var recinto: float = clampf(cerramiento, 0.0, 1.0)
	var techo: float = clampf(cubierta, 0.0, 1.0)

	return Vector2(lerpf(0.38, 0.94, recinto),
		clampf(0.045 + recinto * 0.16 + techo * 0.085 - clampf(asistencia, 0.0, 1.0) * 0.045, 0.025, 0.3))

static func fachada(root: Node3D, largo: float, top: Vector2, division: int,
		color: Color, identidad: String) -> void:
	if division >= 3 or largo < 40.0:
		return
	var lote: SurfaceTool = preload("res://features/stadium/stadium_finish.gd")._inicio()
	var h: float = maxf(top.x, 3.0)
	var z: float = top.y - 0.45
	var familia: int = posmod(hash(identidad), 3)
	var metal: Color = Color("69747d")
	var pintura: Color = color.lerp(Color("717984"), 0.65)

	var arte = preload("res://features/stadium/stadium_finish.gd")
	arte._caja(lote, Vector3(0, h * 0.5, z + 0.18),
		Vector3(largo, h, 0.16), Color("858b88").lerp(pintura, 0.22))
	for i in maxi(1, int(largo / 8.0)):
		var bx: float = - largo * 0.5 + 4.0 + i * 8.0
		arte._caja(lote, Vector3(bx, 1.45, z + 0.07),
			Vector3(2.4, 2.9, 0.08), Color("35454d"))
		arte._caja(lote, Vector3(bx, h * 0.57, z + 0.07),
			Vector3(5.2, 1.1, 0.08), Color("536773"))
	var paso: float = 10.0 if familia == 0 else 14.0
	var n: int = maxi(2, int(largo / paso))
	for i in n + 1:
		var x: float = lerpf(- largo * 0.49, largo * 0.49, float(i) / float(n))

		preload("res://features/stadium/stadium_finish.gd")._caja(lote,
			Vector3(x, h * 0.5, z), Vector3(0.4 if familia == 0 else 0.75, h, 0.65), pintura)
		if familia == 2 and i % 3 == 0:
			preload("res://features/stadium/stadium_finish.gd")._caja(lote,
				Vector3(x, h + 0.3, z), Vector3(1.2, 0.6, 1.0), metal)
	for y in [h * 0.36, h * 0.74]:
		preload("res://features/stadium/stadium_finish.gd")._caja(lote,
			Vector3(0, y, z - 0.2), Vector3(largo, 0.18, 0.18), metal)
	preload("res://features/stadium/stadium_finish.gd")._fin(root, lote, "FachadaRecinto")

static func tablero(root: Node3D, escala: float, manual: bool, division: int) -> void:


	preload("res://features/stadium/scoreboard_detail.gd").pintar(root, escala, manual, division)
