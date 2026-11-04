extends RefCounted


const Arte = preload("res://features/stadium/stadium_finish.gd")
static var _concreto: ImageTexture

static func graderio() -> ImageTexture:
	if _concreto != null:
		return _concreto
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGB8)
	for y in 64:
		for x in 64:
			var gris: float = 0.62 + float(posmod(x * 17 + y * 31, 9)) * 0.004
			if y % 6 == 0: gris -= 0.16
			if y % 6 == 1: gris += 0.1
			if x % 32 > 28: gris -= 0.1
			img.set_pixel(x, y, Color(gris, gris * 0.98, gris * 0.93))
	_concreto = ImageTexture.create_from_image(img)
	return _concreto

static func _cara(lote: SurfaceTool, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, color: Color) -> void:
	var normal: Vector3 =(b - a).cross(c - a).normalized()
	for p in [a, b, c, a, c, d]:
		lote.set_normal(normal)
		lote.set_color(color)
		lote.add_vertex(p)

static func tribuna(root: Node3D, largo: float, top: Vector2, piso: int) -> Array:
	var materiales: Array = []
	var piedra: SurfaceTool = Arte._inicio()


	var inferior: float = - root.position.y + 0.04
	var fondo_piedra: float = 13.0 + root.position.y * 0.55
	var base_z: float = top.y - fondo_piedra



	var ancho: float = largo + 2.0 * fondo_piedra * tan(PI / 12.0)
	var columnas: int = maxi(3, int(ancho / 2.2))
	for j in 7:
		var t0: float = float(j) / 7.0
		var t1: float = float(j + 1) / 7.0
		for i in columnas:
			var x0: float = - ancho * 0.5 + ancho * float(i) / float(columnas)
			var x1: float = - ancho * 0.5 + ancho * float(i + 1) / float(columnas)
			var variacion: float = float(posmod(i * 7 + j * 19, 11)) * 0.009
			_cara(piedra,
				Vector3(x0, lerpf(top.x, inferior, t0), lerpf(top.y - 0.5, base_z, t0)),
				Vector3(x0, lerpf(top.x, inferior, t1), lerpf(top.y - 0.5, base_z, t1)),
				Vector3(x1, lerpf(top.x, inferior, t1), lerpf(top.y - 0.5, base_z, t1)),
				Vector3(x1, lerpf(top.x, inferior, t0), lerpf(top.y - 0.5, base_z, t0)),
				Color(0.22 + variacion, 0.23 + variacion, 0.22 + variacion))
	var roca: MeshInstance3D = Arte._fin(root, piedra, "RocaVolcanica")
	roca.material_override.cull_mode = BaseMaterial3D.CULL_DISABLED
	materiales.append(roca.material_override)


	var perfiles: SurfaceTool = Arte._inicio()
	var cortes: Array = root.get_meta("recinto_cortes", [])
	var vecinos: Array = root.get_meta("recinto_vecinos", [])
	var escala: float = float(root.get_meta("recinto_escala", 1.0))
	var cierres: int = 0
	for i in mini(cortes.size(), vecinos.size()):
		var vecina: float = 0.8 if String(vecinos[i]) == "cu_media" else (0.6 if String(vecinos[i]) == "low" else 1.0)
		if vecina >= escala - 0.001: continue
		var corte: Vector3 = cortes[i]
		if absf(corte.x) < 0.0001: continue
		var pie: float =(corte.z + corte.y * 1.5) / corte.x - signf(corte.x) * 0.015
		var corona: float =(corte.z - corte.y * top.y) / corte.x - signf(corte.x) * 0.015
		_cara(perfiles, Vector3(pie, 0.99, -1.5), Vector3(corona, top.x, top.y),
			Vector3(corona, 0.04, top.y), Vector3(pie, 0.04, -1.5), Color("898b84"))
		cierres += 1
	if cierres > 0:
		var costado: MeshInstance3D = Arte._fin(root, perfiles, "PerfilesGradaCU")
		costado.material_override.cull_mode = BaseMaterial3D.CULL_DISABLED
		materiales.append(costado.material_override)
	if piso == 0:
		return materiales
	var singular: String = String(root.get_meta("recinto_singular", ""))
	if singular == "palomar":
		var palomar: SurfaceTool = Arte._inicio()
		var z: float = top.y - 1.2


		Arte._caja(palomar, Vector3(0, top.x + 2.1, z), Vector3(43, 4.2, 7.0), Color("c7c5b8"))
		Arte._caja(palomar, Vector3(0, top.x + 2.2, z + 3.54), Vector3(41, 1.8, 0.08), Color("34464d"))
		for tramo in 10:
			var x: float = -22.5 + float(tramo) * 5.0
			var curva: float = pow(x / 25.0, 2.0) * 1.25
			Arte._caja(palomar, Vector3(x, top.x + 4.6, z + 2.0 - curva), Vector3(5.04, 0.45, 12), Color("e0ddd0"))
		for i in 15:
			Arte._caja(palomar, Vector3((i - 7) * 2.8, top.x + 2.2, z + 3.62), Vector3(0.11, 2.0, 0.12), Color("aaa99e"))
		var pieza: MeshInstance3D = Arte._fin(root, palomar, "Palomar")
		pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
		materiales.append(pieza.material_override)
	elif singular == "pebetero":
		var pebetero: SurfaceTool = Arte._inicio()
		var z: float = top.y - 2.4
		for lado in [-1.0, 1.0]:

			var a: Vector3 = Vector3(lado * 3.2, top.x - 0.8, z)
			var b: Vector3 = Vector3(lado * 1.5, top.x + 10.8, z)
			preload("res://features/stadium/azteca_detail.gd")._barra(pebetero, a, b, 1.25, Color("d2d0c1"))
		Arte._caja(pebetero, Vector3(0, top.x + 10.7, z), Vector3(8.0, 0.6, 4.3), Color("d9d6c7"))
		for lado in [-1.0, 1.0]:
			Arte._caja(pebetero, Vector3(lado * 3.9, top.x + 11.3, z), Vector3(0.22, 1.0, 4.3), Color("afa997"))
		Arte._caja(pebetero, Vector3(0, top.x + 11.3, z - 2.05), Vector3(8.0, 1.0, 0.22), Color("afa997"))
		var pieza: MeshInstance3D = Arte._fin(root, pebetero, "Pebetero")
		materiales.append(pieza.material_override)


		var mural: SurfaceTool = Arte._inicio()
		var tonos: Array[Color] = [Color("b99550"), Color("a55735"), Color("d0be8e"), Color("575c50")]
		Arte._caja(mural, Vector3(0, top.x * 0.48, top.y - 7.2), Vector3(30, 8.0, 0.3), Color("403e34"))
		for y in 13:
			for x in 43:
				var dx: float = float(x - 21)
				var dy: float = float(y - 6)
				var ala: bool = absf(dy + absf(dx) * 0.28) < 1.8 and absf(dx) < 20
				var centro: bool = absf(dx) < 3.2 and absf(dy) < 5.4
				if not ala and not centro: continue
				Arte._caja(mural, Vector3(dx * 0.65, top.x * 0.48 + dy * 0.52, top.y - 7.39),
					Vector3(0.61, 0.48, 0.14), tonos[posmod(x + y * 3, tonos.size())])
		var relieve: MeshInstance3D = Arte._fin(root, mural, "MuralUniversitario")
		materiales.append(relieve.material_override)
	return materiales
