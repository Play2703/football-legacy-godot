extends RefCounted

















const Arte = preload("res://features/stadium/stadium_finish.gd")
const Azteca = preload("res://features/stadium/azteca_detail.gd")
const Bombonera = preload("res://features/stadium/bombonera_detail.gd")
const GRANA := Color("9c2550")
const AZUL := Color("1f4ea6")
const GRANA_ALTO := Color("a02e58")
const AMARILLO := Color("edbb00")

const CINTA := Color("141c38")
const ACERO := Color("1d2430")







const PISOS: Array = ["low", "low"]

const ULTIMO: int = 1



const VUELO: float = 3.0
const HUECO: float = 3.0


const CURVA: float = 26.0


const CORONA_ALTO: float = 7.0
const CORONA_VUELO: float = 7.0
const PANZA_ESPESOR: float = 0.3
const PANZA_FONDO: float = -3.4


static func tribuna(root: Node3D, largo: float, top: Vector2, piso: int,
		muro: StandardMaterial3D, butacas_mat: StandardMaterial3D) -> Array[StandardMaterial3D]:
	var materiales: Array[StandardMaterial3D] = []
	var p: int = clampi(piso, 0, ULTIMO)
	butacas_mat.albedo_color = [GRANA, AZUL, GRANA_ALTO][p]
	muro.albedo_color = CINTA
	var ancho: float = maxf(0.4, largo)
	var obra: SurfaceTool = Arte._inicio()
	if p >= 1:
		_panza(obra, ancho)
		_cinta(obra, ancho)
	else:

		Arte._caja(obra, Vector3(0,(top.x + 0.6) * 0.5, top.y - 0.35),
			Vector3(ancho + 0.1, top.x + 0.6, 0.5), CINTA.lightened(0.08))
	if p == ULTIMO:
		_fachada(obra, ancho, top, root.position.y)
	var hormigon: StandardMaterial3D = Azteca._material(0.95)
	Arte._fin(root, obra, "ObraCampNou", hormigon)
	materiales.append(hormigon)
	if p >= 1:
		materiales.append(_led(root, ancho, p))
	if p == ULTIMO:
		materiales.append_array(_corona(root, ancho, top))
		materiales.append(_barandillas(root, ancho, top))
	return materiales



static func _panza(lote: SurfaceTool, ancho: float) -> void:
	var fondo: float = 1.0 - PANZA_FONDO
	Arte._caja(lote, Vector3(0, - PANZA_ESPESOR * 0.5, 1.0 - fondo * 0.5),
		Vector3(ancho + 0.2, PANZA_ESPESOR, fondo), CINTA)
	Arte._caja(lote, Vector3(0, - HUECO * 0.5, PANZA_FONDO + 0.1),
		Vector3(ancho + 0.2, HUECO, 0.2), CINTA.darkened(0.2))




static func _cinta(lote: SurfaceTool, ancho: float) -> void:
	var alto: float = HUECO * 0.55 + 1.2
	Arte._caja(lote, Vector3(0, 1.2 - alto * 0.5, 1.05), Vector3(ancho + 0.1, alto, 0.3), CINTA)




static func _led(root: Node3D, ancho: float, piso: int) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var tramos: int = maxi(1, int(round(ancho / 12.0)))
	var paso: float = ancho / float(tramos)
	for i in tramos:
		var x: float = - ancho * 0.5 +(float(i) + 0.5) * paso
		var color: Color = AZUL.lightened(0.15) if (i + piso) % 2 == 0 else GRANA.lightened(0.15)
		Arte._caja(lote, Vector3(x, -0.15, 1.22), Vector3(paso - 0.3, 0.8, 0.05), color)
	var mat: StandardMaterial3D = Bombonera._luz(Color.WHITE, Color("8fb0ff") * 0.6)
	mat.vertex_color_use_as_albedo = true
	Arte._fin(root, lote, "CintaLedCampNou", mat)
	return mat




static func _fachada(lote: SurfaceTool, ancho: float, top: Vector2, cota: float) -> void:
	var base: float = - cota
	var alto: float = top.x + 1.0 - base
	var z: float = top.y - 0.6
	Arte._caja(lote, Vector3(0, base + alto * 0.5, z), Vector3(ancho + 0.1, alto, 0.5), Color("a9aaa8"))
	for y in _terrazas(base, top.x):
		Arte._caja(lote, Vector3(0, y, z - 1.5), Vector3(ancho + 0.3, 0.45, 3.0), Color("d2d1cc"))



static func _terrazas(base: float, corona: float) -> Array:
	var out: Array = []
	var y: float = base + 7.0
	while y < corona - 1.0:
		out.append(y)
		y += 7.0
	return out




static func _barandillas(root: Node3D, ancho: float, top: Vector2) -> StandardMaterial3D:
	var lote: SurfaceTool = Arte._inicio()
	var z: float = top.y - 0.6 - 3.0
	for y in _terrazas(- root.position.y, top.x):
		Arte._caja(lote, Vector3(0, float(y) + 0.75, z), Vector3(ancho + 0.3, 1.1, 0.08), Color("3f9ad0"))
	var mat: StandardMaterial3D = Azteca._material(0.25, 0.3)
	Arte._fin(root, lote, "BarandillasCampNou", mat)
	return mat





static func _corona(root: Node3D, ancho: float, top: Vector2) -> Array[StandardMaterial3D]:
	var tubo: SurfaceTool = Arte._inicio()
	var focos: SurfaceTool = Arte._inicio()
	var atras: float = top.y - 0.6
	var punta: float = top.y + CORONA_VUELO
	var y_base: float = top.x + 0.6
	var y_alto: float = top.x + CORONA_ALTO
	var y_punta: float = top.x + CORONA_ALTO - 1.6
	var mitad: float = ancho * 0.5 + 0.3
	Azteca._barra(tubo, Vector3(- mitad, y_alto, atras), Vector3(mitad, y_alto, atras), 0.4, ACERO)
	Azteca._barra(tubo, Vector3(- mitad, y_base, atras), Vector3(mitad, y_base, atras), 0.4, ACERO)
	Azteca._barra(tubo, Vector3(- mitad, y_punta, punta), Vector3(mitad, y_punta, punta), 0.35, ACERO)
	var n: int = maxi(1, int(round(ancho / 8.0)))
	for i in n + 1:
		var x: float = - ancho * 0.5 + float(i) * ancho / float(n)
		Azteca._barra(tubo, Vector3(x, y_base, atras), Vector3(x, y_alto, atras), 0.45, ACERO)
		Azteca._barra(tubo, Vector3(x, y_alto, atras), Vector3(x, y_punta, punta), 0.4, ACERO)
		Azteca._barra(tubo, Vector3(x, y_base, atras), Vector3(x, y_punta, punta), 0.3, ACERO)
		Azteca._barra(tubo, Vector3(x, y_base, atras), Vector3(x, y_alto, atras - 3.0), 0.3, ACERO)
	if absf(sin(root.rotation.y)) > 0.7:
		var cantidad: int = maxi(1, int(round(ancho / 4.0)))
		for i in cantidad:
			var x: float = - ancho * 0.5 +(float(i) + 0.5) * ancho / float(cantidad)
			Arte._caja(tubo, Vector3(x, y_punta - 0.5, punta + 0.1), Vector3(1.6, 0.7, 0.5), Color("4b5058"))
			Arte._caja(focos, Vector3(x, y_punta - 0.5, punta + 0.37), Vector3(1.4, 0.5, 0.03), Color.WHITE)
	var hierro: StandardMaterial3D = Azteca._material(0.55, 0.35)
	Arte._fin(root, tubo, "CoronaCampNou", hierro)
	var luz: StandardMaterial3D = Bombonera._luz(Color("c9c9c0"), Color("fff0d6"))
	Arte._fin(root, focos, "FocosCampNou", luz)
	return [hierro, luz]
