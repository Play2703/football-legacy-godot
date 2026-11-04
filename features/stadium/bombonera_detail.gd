extends RefCounted













const Arte = preload("res://features/stadium/stadium_finish.gd")
const Azteca = preload("res://features/stadium/azteca_detail.gd")


const PIE := Vector2(0.99, -1.5)
const AZUL := Color("1b3a93")
const AMARILLO := Color("f2c230")
const AZUL_ALTO := Color("22409e")


const PANZA := Color("1a2440")



const PANZA_ESPESOR: float = 0.3


const PANZA_FONDO: float = -3.4


const VUELO: float = 3.0
const HUECO: float = 2.5


const CIFRAS: Dictionary = {
	"0": ["###", "#.#", "#.#", "#.#", "###"],
	"1": [".#.", "##.", ".#.", ".#.", "###"],
	"2": ["###", "..#", "###", "#..", "###"],
	"9": ["###", "#.#", "###", "..#", "###"],
}
static var _butacas: ImageTexture




static func butacas() -> ImageTexture:
	if _butacas != null:
		return _butacas
	var img: Image = Image.create(64, 64, false, Image.FORMAT_RGB8)
	for y in 64:
		for x in 64:
			var v: float = 0.86 + float(posmod(x * 13 + y * 7, 5)) * 0.01
			if y % 4 == 3:
				v = 0.56
			elif y % 4 == 0:
				v = 0.97
			if x % 16 == 15:
				v -= 0.12
			img.set_pixel(x, y, Color(v, v, v))
	_butacas = ImageTexture.create_from_image(img)
	return _butacas


static func tribuna(root: Node3D, largo: float, top: Vector2, piso: int,
		muro: StandardMaterial3D, butacas_mat: StandardMaterial3D) -> Array[StandardMaterial3D]:
	var materiales: Array[StandardMaterial3D] = []
	var p: int = clampi(piso, 0, 2)


	butacas_mat.albedo_color = [AZUL, AMARILLO, AZUL_ALTO][p]
	muro.albedo_color = [AMARILLO, AZUL, AMARILLO][p]
	var ancho: float = maxf(0.4, largo)
	var obra: SurfaceTool = Arte._inicio()
	if p >= 1:
		_panza(obra, ancho)
	else:


		Arte._caja(obra, Vector3(0,(top.x + 0.6) * 0.5, top.y - 0.35),
			Vector3(ancho + 0.1, top.x + 0.6, 0.5), PANZA.lightened(0.1))
	if p == 2:
		_fachada(obra, ancho, top, root.position.y)
	var hormigon: StandardMaterial3D = Azteca._material(0.95)
	Arte._fin(root, obra, "ObraBombonera", hormigon)
	materiales.append(hormigon)
	if String(root.get_meta("recinto_singular", "")) == "doce":
		materiales.append(_doce(root, top))
	if p == 2:
		materiales.append_array(_parrillas(root, ancho, top))
	return materiales



static func _panza(lote: SurfaceTool, ancho: float) -> void:
	var fondo: float = 1.0 - PANZA_FONDO
	Arte._caja(lote, Vector3(0, - PANZA_ESPESOR * 0.5, 1.0 - fondo * 0.5),
		Vector3(ancho + 0.2, PANZA_ESPESOR, fondo), PANZA)

	Arte._caja(lote, Vector3(0, -1.25, PANZA_FONDO + 0.1),
		Vector3(ancho + 0.2, 2.5, 0.2), PANZA.darkened(0.15))




static func _fachada(lote: SurfaceTool, ancho: float, top: Vector2, cota: float) -> void:
	var base: float = - cota
	var alto: float = top.x + 0.8 - base
	var z: float = top.y - 0.6
	Arte._caja(lote, Vector3(0, base + alto * 0.5, z), Vector3(ancho + 0.1, alto, 0.5), AZUL)
	for f in [0.33, 0.66]:
		Arte._caja(lote, Vector3(0, base + alto * f, z - 0.3),
			Vector3(ancho + 0.1, 0.5, 0.16), AZUL.lightened(0.12))
	var tramos: int = maxi(1, ceili(ancho / 9.0))
	var paso: float = ancho / float(tramos)
	for i in tramos:
		var x0: float = - ancho * 0.5 + float(i) * paso
		var sube: bool = i % 2 == 0
		Azteca._barra(lote, Vector3(x0 + 0.4, base + 1.0 if sube else top.x, z - 0.42),
			Vector3(x0 + paso - 0.4, top.x if sube else base + 1.0, z - 0.42), 0.45, AMARILLO)



static func _doce(root: Node3D, top: Vector2) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var largo: float =(top - PIE).length()
	var fila: float = largo * 0.78 / 5.0


	cifras(lote, "12", - root.position.x, 0.0, fila * 1.05, fila, AZUL)
	var mat: StandardMaterial3D = Azteca._material(0.9)
	talud(root, lote, top, "DoceBombonera", mat)
	return mat



static func _parrillas(root: Node3D, ancho: float, top: Vector2) -> Array[StandardMaterial3D]:
	var metal: SurfaceTool = Arte._inicio()
	var focos: SurfaceTool = Arte._inicio()
	var cantidad: int = maxi(1, int(round(ancho / 14.0)))
	var gris := Color("4b5058")
	for i in cantidad:
		var x: float = - ancho * 0.5 +(float(i) + 0.5) * ancho / float(cantidad)
		Azteca._barra(metal, Vector3(x, top.x + 0.6, top.y - 0.3),
			Vector3(x, top.x + 3.2, top.y + 0.3), 0.22, gris)
		Arte._caja(metal, Vector3(x, top.x + 3.6, top.y + 0.45), Vector3(3.4, 1.5, 0.3), gris)
		Arte._caja(focos, Vector3(x, top.x + 3.6, top.y + 0.62), Vector3(3.0, 1.15, 0.03), Color.WHITE)
	var hierro: StandardMaterial3D = Azteca._material(0.6, 0.3)
	Arte._fin(root, metal, "ParrillasBombonera", hierro)
	var luz: StandardMaterial3D = _luz(Color("c9c9c0"), Color("fff0d6"))
	Arte._fin(root, focos, "FocosBombonera", luz)
	return [hierro, luz]





static func palcos(root: Node3D, x0: float, alto: float, fondo: float,
		z_torre: float, alto_torre: float, mitad: float) -> Array[StandardMaterial3D]:
	var obra: SurfaceTool = Arte._inicio()
	var vidrio: SurfaceTool = Arte._inicio()
	var pantallas: SurfaceTool = Arte._inicio()
	var focos: SurfaceTool = Arte._inicio()
	var rojo: SurfaceTool = Arte._inicio()

	var z0: float = -14.0
	var z1: float = mitad * 2.0 + 14.0
	var largo: float = z1 - z0
	var zc: float =(z0 + z1) * 0.5
	var blanco := Color("e6e4dd")
	var hormigon := Color("c2bdb2")
	Arte._caja(obra, Vector3(x0 + fondo * 0.5, alto * 0.5, zc), Vector3(fondo, alto, largo), hormigon)

	for banda in 4:
		var y: float = 8.6 + float(banda) * 4.3
		Arte._caja(obra, Vector3(x0 - 0.35, y - 0.75, zc), Vector3(0.7, 0.5, largo), blanco)
		Arte._caja(vidrio, Vector3(x0 - 0.12, y + 1.25, zc), Vector3(0.12, 3.3, largo - 1.0), Color("3a4656"))
		var n: int = int(largo / 3.6)
		for i in n + 1:
			var z: float = z0 + 0.5 + float(i) *(largo - 1.0) / float(n)
			Arte._caja(obra, Vector3(x0 - 0.2, y + 1.25, z), Vector3(0.2, 3.3, 0.14), Color("5b6168"))

	Arte._caja(obra, Vector3(x0 + fondo * 0.5 - 1.2, alto + 0.3, zc),
		Vector3(fondo + 2.4, 0.6, largo + 0.6), blanco)
	var reflectores: int = int(largo / 9.0)
	for i in reflectores:
		var z: float = z0 +(float(i) + 0.5) * largo / float(reflectores)
		Arte._caja(obra, Vector3(x0 - 2.0, alto - 0.2, z), Vector3(0.6, 0.9, 3.2), Color("4b5058"))
		Arte._caja(focos, Vector3(x0 - 2.32, alto - 0.2, z), Vector3(0.03, 0.7, 2.9), Color.WHITE)

	for sur in [false, true]:
		var a: float = z_torre if not sur else mitad * 2.0 - z_torre
		var b: float = z0 if not sur else z1
		var zt: float =(a + b) * 0.5
		var lt: float = absf(b - a)
		Arte._caja(obra, Vector3(x0 + 5.0, alto_torre * 0.5, zt), Vector3(10.0, alto_torre, lt), hormigon.darkened(0.06))
		for y in [10.0, 15.0, 20.0, 25.0]:
			Arte._caja(vidrio, Vector3(x0 - 0.06, float(y), zt), Vector3(0.12, 2.6, lt - 2.0), Color("33404f"))
		Arte._caja(obra, Vector3(x0 - 0.2, alto_torre - 3.3, zt), Vector3(0.4, 5.6, lt - 0.6), Color("23272d"))
		Arte._caja(pantallas, Vector3(x0 - 0.42, alto_torre - 3.3, zt), Vector3(0.04, 4.8, lt - 1.6), Color("2a3a6a"))

	var base := Vector3(x0 + 13.0, 0.0, z_torre + 4.0)
	var mastil: float = alto_torre + 12.0
	for sx in [-0.6, 0.6]:
		for sz in [-0.6, 0.6]:
			Azteca._barra(obra, base + Vector3(sx, 0, sz), base + Vector3(sx * 0.4, mastil, sz * 0.4), 0.16, Color("9aa0a6"))
	var tramos: int = int(mastil / 3.0)
	for i in tramos:
		var y0: float = float(i) * 3.0
		var k: float = lerpf(0.6, 0.24, y0 / mastil)
		Azteca._barra(obra, base + Vector3(- k, y0, - k), base + Vector3(k, y0 + 3.0, k), 0.08, Color("9aa0a6"))
	Arte._caja(rojo, base + Vector3(0, mastil + 0.3, 0), Vector3(0.6, 0.6, 0.6), Color("c01020"))
	var materiales: Array[StandardMaterial3D] = []
	var mat_obra: StandardMaterial3D = Azteca._material(0.92)
	Arte._fin(root, obra, "EdificioPalcosBombonera", mat_obra)
	materiales.append(mat_obra)

	var mat_vidrio: StandardMaterial3D = _luz(Color("3a4656"), Color("ffd9a0") * 0.3)
	mat_vidrio.roughness = 0.2
	mat_vidrio.metallic = 0.35
	Arte._fin(root, vidrio, "VidrioPalcosBombonera", mat_vidrio)
	materiales.append(mat_vidrio)
	var mat_pantalla: StandardMaterial3D = _luz(Color("2a3a6a"), Color("4f7dff") * 0.5)
	Arte._fin(root, pantallas, "PantallasBombonera", mat_pantalla)
	materiales.append(mat_pantalla)
	var mat_focos: StandardMaterial3D = _luz(Color("c9c9c0"), Color("fff0d6"))
	Arte._fin(root, focos, "CornisaBombonera", mat_focos)
	materiales.append(mat_focos)
	var mat_rojo: StandardMaterial3D = _luz(Color("c01020"), Color("ff2030"))
	Arte._fin(root, rojo, "BalizaBombonera", mat_rojo)
	materiales.append(mat_rojo)
	return materiales



static func cifras(lote: SurfaceTool, texto: String, centro_x: float, centro_v: float,
		px_x: float, px_v: float, color: Color) -> void:
	var columnas: int = texto.length() * 4 - 1
	var x0: float = centro_x - float(columnas) * px_x * 0.5
	for k in texto.length():
		var rejilla: Array = CIFRAS.get(texto[k], [])
		for fila in rejilla.size():
			var renglon: String = rejilla[fila]
			for col in renglon.length():
				if renglon[col] != "#":
					continue
				Arte._caja(lote, Vector3(x0 +(float(k * 4 + col) + 0.5) * px_x,
					centro_v +(2.0 - float(fila)) * px_v, 0.05),
					Vector3(px_x - 0.05, px_v - 0.05, 0.06), color)




static func talud(root: Node3D, lote: SurfaceTool, top: Vector2, nombre: String,
		mat: StandardMaterial3D) -> MeshInstance3D:
	var pieza: MeshInstance3D = Arte._fin(root, lote, nombre, mat)
	var centro: Vector2 =(PIE + top) * 0.5
	pieza.position = Vector3(0, centro.x, centro.y)
	pieza.rotation.x = - atan2(PIE.y - top.y, top.x - PIE.x)
	return pieza




static func _luz(color: Color, brillo: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = Azteca._material(0.5)
	mat.albedo_color = color
	mat.vertex_color_use_as_albedo = false
	mat.emission_enabled = true
	mat.emission = brillo
	mat.emission_energy_multiplier = 0.0
	mat.set_meta("luces_azteca", true)
	return mat
