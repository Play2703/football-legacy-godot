extends RefCounted












const Arte = preload("res://features/stadium/stadium_finish.gd")
const Azteca = preload("res://features/stadium/azteca_detail.gd")
const Bombonera = preload("res://features/stadium/bombonera_detail.gd")
const ROJO := Color("d0102a")
const BLANCO := Color("e8e9ec")
const PLATEA := Color("1f232d")
const MEDIO := Color("2e333d")
const PIZARRA := Color("4a5468")


const PASILLO: float = 3.0
const PASILLO_ALTO: float = 1.0

const PALCOS_ALTO: float = 4.5


static func tribuna(root: Node3D, largo: float, top: Vector2, piso: int,
		muro: StandardMaterial3D, butacas_mat: StandardMaterial3D) -> Array[StandardMaterial3D]:
	var materiales: Array[StandardMaterial3D] = []
	var p: int = clampi(piso, 0, 2)
	var singular: String = String(root.get_meta("recinto_singular", ""))
	var cabecera: bool = singular in ["rotulo", "ovalo"]
	butacas_mat.albedo_color = [BLANCO if cabecera else PLATEA, MEDIO, PIZARRA][p]
	muro.albedo_color = [BLANCO, PLATEA, BLANCO][p]
	var ancho: float = maxf(0.4, largo)
	var obra: SurfaceTool = Arte._inicio()
	var gris := Color("8d9098")
	match p:
		0:

			var fondo: float = PASILLO + 1.2
			Arte._caja(obra, Vector3(0, top.x + PASILLO_ALTO - 0.5, top.y - fondo * 0.5 + 0.1),
				Vector3(ancho + 0.2, 1.0, fondo), Color("3a3e47"))
			Arte._caja(obra, Vector3(0, top.x * 0.5, top.y - 0.3),
				Vector3(ancho + 0.1, top.x, 0.5), gris.darkened(0.3))
		1:
			_palcos(root, obra, ancho, top, materiales)
		2:

			var base: float = - root.position.y
			var alto: float = top.x + 1.1 - base
			Arte._caja(obra, Vector3(0, base + alto * 0.5, top.y - 0.6),
				Vector3(ancho + 0.1, alto, 0.5), Color("c9c6bf"))
			Arte._caja(obra, Vector3(0, top.x + 0.55, top.y - 0.15),
				Vector3(ancho + 0.1, 1.1, 0.4), BLANCO)
	var hormigon: StandardMaterial3D = Azteca._material(0.95)
	Arte._fin(root, obra, "ObraMonumental", hormigon)
	materiales.append(hormigon)
	if p == 1:
		materiales.append(_anillo_led(root, ancho))
	if p == 2:
		materiales.append(_troneras(root, ancho, top))
		materiales.append_array(_aro(root, ancho, top))
	if singular == "rotulo":
		materiales.append(_rotulo(root, top))
	elif singular == "ovalo":
		materiales.append(_ovalo(root, top))
	return materiales



static func _palcos(root: Node3D, obra: SurfaceTool, ancho: float, top: Vector2,
		materiales: Array[StandardMaterial3D]) -> void:
	var vidrio: SurfaceTool = Arte._inicio()
	var z: float = top.y - 0.6
	Arte._caja(obra, Vector3(0, top.x + 0.15, top.y - 1.6), Vector3(ancho + 0.2, 0.3, 3.4), Color("5b5f68"))
	Arte._caja(obra, Vector3(0, top.x + PALCOS_ALTO - 0.2, top.y - 1.6), Vector3(ancho + 0.2, 0.4, 3.4), Color("6a6e77"))
	Arte._caja(vidrio, Vector3(0, top.x + PALCOS_ALTO * 0.5, z), Vector3(ancho + 0.1, PALCOS_ALTO - 0.6, 0.1), Color("33404f"))
	var n: int = maxi(1, int(ancho / 3.2))
	for i in n + 1:
		var x: float = - ancho * 0.5 + float(i) * ancho / float(n)
		Arte._caja(obra, Vector3(x, top.x + PALCOS_ALTO * 0.5, z + 0.08),
			Vector3(0.14, PALCOS_ALTO - 0.6, 0.12), Color("5b6168"))
	var mat: StandardMaterial3D = Bombonera._luz(Color("33404f"), Color("ffd9a0") * 0.3)
	mat.roughness = 0.2
	mat.metallic = 0.35
	Arte._fin(root, vidrio, "PalcosMonumental", mat)
	materiales.append(mat)



static func _anillo_led(root: Node3D, ancho: float) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	Arte._caja(lote, Vector3(0, 1.15, 1.02), Vector3(ancho + 0.05, 0.9, 0.05), ROJO)
	var mat: StandardMaterial3D = Bombonera._luz(ROJO, Color("ff1a33"))
	Arte._fin(root, lote, "AnilloLedMonumental", mat)
	return mat



static func _troneras(root: Node3D, ancho: float, top: Vector2) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var largo: float =(top - Bombonera.PIE).length()
	var n: int = maxi(1, int(round(ancho / 12.0)))
	for i in n:
		var x: float = - ancho * 0.5 +(float(i) + 0.5) * ancho / float(n)
		var v: float = - largo * 0.08
		Arte._caja(lote, Vector3(x, v, 0.06), Vector3(3.4, 2.6, 0.08), BLANCO)
		Arte._caja(lote, Vector3(x, v + 1.5, 0.07), Vector3(2.4, 0.4, 0.08), BLANCO)
		Arte._caja(lote, Vector3(x, v - 0.1, 0.11), Vector3(2.2, 2.0, 0.04), Color("15181e"))
	var mat: StandardMaterial3D = Azteca._material(0.9)
	Bombonera.talud(root, lote, top, "TronerasMonumental", mat)
	return mat



static func _aro(root: Node3D, ancho: float, top: Vector2) -> Array[StandardMaterial3D]:
	var tubo: SurfaceTool = Arte._inicio()
	var focos: SurfaceTool = Arte._inicio()
	var blanco := Color("eceeef")
	var y0: float = top.x + 3.2
	var y1: float = top.x + 5.0
	var atras: float = top.y - 0.3
	var delante: float = top.y + 2.2
	var mitad: float = ancho * 0.5 + 0.3
	for y in [y0, y1]:
		Azteca._barra(tubo, Vector3(- mitad, y, atras), Vector3(mitad, y, atras), 0.24, blanco)
		Azteca._barra(tubo, Vector3(- mitad, y, delante), Vector3(mitad, y, delante), 0.24, blanco)
	var n: int = maxi(1, int(round(ancho / 5.0)))
	var paso: float = ancho / float(n)
	for i in n + 1:
		var x: float = - ancho * 0.5 + float(i) * paso
		Azteca._barra(tubo, Vector3(x, y0, atras), Vector3(x, y1, delante), 0.14, blanco)
		Azteca._barra(tubo, Vector3(x, y0, delante), Vector3(x, y1, delante), 0.14, blanco)
		Azteca._barra(tubo, Vector3(x, y1, atras), Vector3(x, y1, delante), 0.14, blanco)
		if i % 2 == 0:
			Azteca._barra(tubo, Vector3(x, top.x + 0.5, atras), Vector3(x, y1, atras), 0.3, blanco)


	if absf(sin(root.rotation.y)) > 0.7:
		var cantidad: int = maxi(1, int(round(ancho / 4.0)))
		for i in cantidad:
			var x: float = - ancho * 0.5 +(float(i) + 0.5) * ancho / float(cantidad)
			Arte._caja(tubo, Vector3(x, y0 - 0.45, delante + 0.1), Vector3(1.6, 0.7, 0.5), Color("4b5058"))
			Arte._caja(focos, Vector3(x, y0 - 0.45, delante + 0.37), Vector3(1.4, 0.5, 0.03), Color.WHITE)
	var hierro: StandardMaterial3D = Azteca._material(0.55, 0.2)
	Arte._fin(root, tubo, "AroLucesMonumental", hierro)
	var luz: StandardMaterial3D = Bombonera._luz(Color("c9c9c0"), Color("fff0d6"))
	Arte._fin(root, focos, "LuminariasMonumental", luz)
	return [hierro, luz]



static func _rotulo(root: Node3D, top: Vector2) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var largo: float =(top - Bombonera.PIE).length()
	var fila: float = largo * 0.62 / 5.0
	Bombonera.cifras(lote, "1901", - root.position.x, largo * 0.06, fila * 1.15, fila, ROJO)
	Arte._caja(lote, Vector3(0, - largo * 0.5 + 0.55, 0.05), Vector3(400.0, 0.7, 0.06), ROJO)
	var mat: StandardMaterial3D = Azteca._material(0.9)
	Bombonera.talud(root, lote, top, "Rotulo1901", mat)
	return mat



static func _ovalo(root: Node3D, top: Vector2) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var largo: float =(top - Bombonera.PIE).length()
	var cx: float = - root.position.x
	var radio := Vector2(13.0, largo * 0.36)
	var puntos: int = 44
	for i in puntos:
		var a: float = TAU * float(i) / float(puntos)
		var b: float = TAU * float(i + 1) / float(puntos)
		var p0 := Vector3(cx + cos(a) * radio.x, sin(a) * radio.y, 0.05)
		var p1 := Vector3(cx + cos(b) * radio.x, sin(b) * radio.y, 0.05)
		Azteca._barra(lote, p0, p1, 0.55, ROJO)
	for f in [-0.45, 0.0, 0.45]:
		var v: float = radio.y * float(f)
		var medio: float = radio.x * sqrt(1.0 - float(f) * float(f)) - 0.6
		Arte._caja(lote, Vector3(cx, v, 0.05), Vector3(medio * 2.0, 0.55, 0.06), ROJO)
	var mat: StandardMaterial3D = Azteca._material(0.9)
	Bombonera.talud(root, lote, top, "OvaloCentenario", mat)
	return mat
