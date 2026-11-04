extends RefCounted
























const ACERA_Y: float = 0.1
const BORDILLO_Y: float = 0.13
const BORDILLO: float = 0.2
const CUNETA: float = 0.35


enum {LISO, ASFALTO, LOSA, CESPED, HIERBA, HOJA, LUZ}
enum {SUELO, COSAS, FONDO}

const METROS: Dictionary = {ASFALTO: 2.0, LOSA: 2.0, CESPED: 2.0, HIERBA: 4.0, HOJA: 1.0}
const PIXELES: Dictionary = {ASFALTO: 64, LOSA: 128, CESPED: 64, HIERBA: 64, HOJA: 32}

const C_ASFALTO: Color = Color("4a4950")
const C_CUNETA: Color = Color("6d6a66")
const C_BORDILLO: Color = Color("8f8b83")
const C_CANTO: Color = Color("b3aea3")
const C_ACERA: Color = Color("a39d92")
const C_PINTURA: Color = Color("e2dccb")
const C_TAPA: Color = Color("4a4b4f")
const C_REJILLA: Color = Color("2a2a2d")
const C_PRADO: Color = Color("6f8a4c")
const C_CESPED: Color = Color("6e9a4a")
const C_SETO: Color = Color("3d6a37")
const C_HOJA: Color = Color("4f8a43")
const C_PINO: Color = Color("33604a")
const C_TRONCO: Color = Color("5e4632")
const C_TIERRA: Color = Color("5a4634")
const C_HIERRO: Color = Color("2e3532")
const C_MADERA: Color = Color("a0703f")
const C_PAPELERA: Color = Color("3f6150")
const C_ROJO: Color = Color("c03c2e")
const C_LUZ: Color = Color("fff1c8")
const C_LOMA: Color = Color("5f7d55")
const C_VENTANA: Color = Color("3c4a58")
const PAREDES: Array[Color] = [Color("e6dccb"), Color("d9c4a6"), Color("c9d3d6"), Color("e8e2d6"),
	Color("cdb79a"), Color("dfd0bb")]
const TEJAS: Array[Color] = [Color("a4553b"), Color("8d4a35"), Color("5b6168"), Color("6e4a3a"),
	Color("b36a48")]



var bloqueos: Array[Rect2] = []

var focos: Array[Vector3] = []





static var nevado: bool = false
static var mojado: bool = false

const MOJADO: float = 0.3
const C_NIEVE: Color = Color("e3e8ed")






const C_NIEVE_COSAS: Color = Color("dfe4e8")
const C_NIEVE_HOJA: Color = Color("f6faff")


var xf: Transform3D = Transform3D.IDENTITY
var grupo: int = COSAS
var _lotes: Dictionary = {}
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()

static var _mats: Dictionary = {}
static var _texs: Dictionary = {}
static var _icos: Dictionary = {}


class Lote:
	var v: PackedVector3Array = PackedVector3Array()
	var n: PackedVector3Array = PackedVector3Array()
	var c: PackedColorArray = PackedColorArray()








func monta(padre: Node3D, cfg: Dictionary) -> Array[Rect2]:
	_rng.seed = 20261016
	grupo = SUELO
	_calzada(cfg)
	grupo = COSAS
	_aceras(cfg)
	grupo = FONDO
	_fondo(cfg)
	cierra(padre, bool(cfg.get("sombra", false)))
	return bloqueos




func parcela(nodo: Node3D, sol: Vector2, sombra: bool) -> void:
	grupo = SUELO
	plano(CESPED, - sol.x * 0.5, sol.x * 0.5, - sol.y, 0.0, 0.0, verde(C_CESPED))
	grupo = COSAS
	var a: float = 0.28
	seto(Vector3(- sol.x * 0.5 - a, 0.0, - sol.y - a), Vector3(sol.x * 0.5 + a, 0.95, - sol.y + a))
	for s in [-1.0, 1.0]:
		seto(Vector3(s * sol.x * 0.5 - a, 0.0, - sol.y + a), Vector3(s * sol.x * 0.5 + a, 0.95,
			-0.15))
	cierra(nodo, sombra)


func _calzada(cfg: Dictionary) -> void:
	var fin: float = float(cfg.fin)
	var media: float = float(cfg.media)
	var desde: float = float(cfg.entrada) + 40.0
	var carril: float = media - CUNETA

	plano(HIERBA, -260.0, 260.0, fin - 320.0, desde + 60.0, -0.02, verde(C_PRADO))

	var tope: float = fin + 1.6 + CUNETA
	var asfalto: Color = C_ASFALTO.darkened(MOJADO) if mojado else C_ASFALTO
	plano(ASFALTO, - carril, carril, tope, desde, 0.0, asfalto)
	for s in [-1.0, 1.0]:
		plano(LISO, minf(s * carril, s * media), maxf(s * carril, s * media), fin + 1.6, desde,
			0.0, C_CUNETA)
	plano(LISO, - carril, carril, fin + 1.6, tope, 0.0, C_CUNETA)


	var y: float = 0.006
	for s in [-1.0, 1.0]:
		var x: float = s *(carril - 0.14)
		plano(LISO, x - 0.05, x + 0.05, tope + 0.3, desde, y, C_PINTURA)
	var cebra: Vector2 = cfg.get("cebra", Vector2(fin + 3.4, fin + 6.2))
	var z: float = desde
	while z - 1.8 > tope + 0.6:
		if z - 1.8 > cebra.y + 0.6 or z < cebra.x - 0.6:
			plano(LISO, -0.06, 0.06, z - 1.8, z, y, C_PINTURA)
		z -= 4.5


	var bandas: int = int((2.0 *(carril - 0.3) - 0.45) / 0.9) + 1
	var x0: float = - float(bandas - 1) * 0.45 - 0.225
	for b in bandas:
		plano(LISO, x0, x0 + 0.45, cebra.x, cebra.y, y, C_PINTURA)
		x0 += 0.9

	var franjas: Array = cfg.franjas
	for f in franjas.size():
		var zc: float = float(franjas[f])
		var lado: float = -1.0 if f % 2 == 0 else 1.0
		tapa(Vector3(lado * carril * 0.5, 0.0, zc + 2.0))
		for s in [-1.0, 1.0]:
			rejilla(Vector3(s *(media - CUNETA * 0.5), 0.0, zc - s * 8.6))
		for i in 2:
			var px: float = _rng.randf_range(- carril + 0.6, carril - 1.8)
			var pz: float = zc + _rng.randf_range(-8.0, 8.0)
			var tono: Color = asfalto.darkened(_rng.randf_range(0.04, 0.08)) if i == 0 \
					else asfalto.lightened(_rng.randf_range(0.03, 0.05))
			plano(ASFALTO, px, px + _rng.randf_range(0.7, 1.8), pz,
				pz + _rng.randf_range(0.6, 2.2), 0.003, tono)




static func verde(c: Color) -> Color:
	return C_NIEVE.lerp(c, 0.08) if nevado else c














static func _nevada(c: Color, ny: float) -> Color:
	var k: float = clampf((ny + 0.45) / 0.15, 0.0, 1.0) * 0.5 + clampf((ny + 0.3) / 0.4, 0.0, 1.0) * 0.5
	return c.lerp(C_NIEVE_HOJA, k * 0.92)



func _aceras(cfg: Dictionary) -> void:
	var fin: float = float(cfg.fin)
	var media: float = float(cfg.media)
	var linde: float = float(cfg.linde)
	var desde: float = float(cfg.entrada) + 40.0
	var borde: float = media + BORDILLO

	var g: int = grupo
	grupo = SUELO
	for s in [-1.0, 1.0]:
		caja(LISO, Vector3(minf(s * media, s * borde), -0.05, fin + 1.4),
			Vector3(maxf(s * media, s * borde), BORDILLO_Y, desde), C_BORDILLO, C_CANTO)
		caja(LOSA, Vector3(minf(s * borde, s * linde), -0.05, fin),
			Vector3(maxf(s * borde, s * linde), ACERA_Y, desde), C_ACERA)
	caja(LISO, Vector3(- media, -0.05, fin + 1.4), Vector3(media, BORDILLO_Y, fin + 1.6),
		C_BORDILLO, C_CANTO)
	caja(LOSA, Vector3(- borde, -0.05, fin), Vector3(borde, ACERA_Y, fin + 1.4), C_ACERA)
	grupo = g



	var franjas: Array = cfg.franjas
	var cerca: float = borde + 0.3
	for f in franjas.size():
		var zc: float = float(franjas[f])
		farol(Vector3(- cerca, ACERA_Y, zc + 7.0), 1.0)
		farol(Vector3(cerca, ACERA_Y, zc - 7.0), -1.0)
		var s: float = -1.0 if f % 2 == 0 else 1.0
		var x: float = s *(linde - 0.42)
		banco(Vector3(x, ACERA_Y, zc - s * 7.0), - s)
		papelera(Vector3(x + s * 0.05, ACERA_Y, zc - s * 8.6))
		boca_riego(Vector3(- s *(borde + 0.32), ACERA_Y, zc - s * 6.4))

	var huecos: Array = cfg.huecos
	for h in huecos.size():
		var z: float = float(huecos[h])
		for s in [-1.0, 1.0]:
			alcorque(Vector3(s *(borde + 0.72), ACERA_Y, z), 4.4 + _rng.randf_range(-0.3, 0.5),
				h * 2 +(0 if s < 0 else 1))
			if z > fin + 2.0:
				cipres(Vector3(s *(linde + 1.15), 0.0, z), 3.4 + _rng.randf_range(-0.4, 0.6),
					900 + h * 2 +(0 if s < 0 else 1))




func _fondo(cfg: Dictionary) -> void:
	var fin: float = float(cfg.fin)
	var desde: float = float(cfg.entrada) + 40.0
	var tras: float = float(cfg.get("tras", 26.0))


	var aparte: float = float(cfg.get("linde", 4.6)) - 4.6
	var semilla: int = 3000
	for s in [-1.0, 1.0]:
		var z: float = desde
		while z > fin - 26.0:
			semilla += 1
			var x: float = s *(aparte + 31.0 + _rng.randf_range(0.0, 8.0))
			if _rng.randf() < 0.35:
				pino(Vector3(x, 0.0, z), _rng.randf_range(6.0, 9.0), _rng.randf_range(1.6, 2.2),
					semilla)
			else:
				arbol(Vector3(x, 0.0, z), _rng.randf_range(5.5, 8.0), _rng.randf_range(2.0, 2.9),
					semilla, 1)
			var x2: float = s *(aparte + 42.0 + _rng.randf_range(0.0, 9.0))
			arbol(Vector3(x2, 0.0, z + 2.5), _rng.randf_range(6.0, 9.0),
				_rng.randf_range(2.4, 3.2), semilla + 500, 0)
			z -= _rng.randf_range(4.5, 7.0)
		z = desde - 4.0
		while z > fin - 20.0:
			semilla += 1
			var ancho: float = _rng.randf_range(7.0, 10.0)
			casa_lejos(Vector3(s *(aparte + _rng.randf_range(56.0, 64.0)), 0.0, z), ancho,
				_rng.randf_range(7.0, 9.0), _rng.randf_range(3.0, 6.2), - s * PI * 0.5, semilla)
			z -= ancho + _rng.randf_range(5.0, 9.0)

	var x: float = -64.0
	while x < 64.0:
		semilla += 1
		var fila: float = fin - tras - 2.0 - _rng.randf_range(0.0, 3.0)
		if _rng.randf() < 0.3:
			pino(Vector3(x, 0.0, fila), _rng.randf_range(7.0, 10.0), _rng.randf_range(1.8, 2.4),
				semilla)
		else:
			arbol(Vector3(x, 0.0, fila), _rng.randf_range(6.0, 9.0), _rng.randf_range(2.4, 3.2),
				semilla, 1)
		arbol(Vector3(x + 2.2, 0.0, fila - 6.0 - _rng.randf_range(0.0, 3.0)),
			_rng.randf_range(7.0, 10.0), _rng.randf_range(2.6, 3.4), semilla + 700, 0)
		x += _rng.randf_range(3.6, 5.4)
	x = -90.0
	while x < 90.0:
		semilla += 1
		var ancho: float = _rng.randf_range(7.0, 11.0)
		casa_lejos(Vector3(x, 0.0, fin - tras - _rng.randf_range(24.0, 42.0)), ancho,
			_rng.randf_range(7.0, 9.0), _rng.randf_range(3.0, 7.5), 0.0, semilla)
		x += ancho + _rng.randf_range(4.0, 10.0)

	var lomas: Array = [[-150.0, 170.0, 70.0, 16.0, 40.0], [-40.0, 210.0, 90.0, 22.0, 50.0],
		[70.0, 180.0, 80.0, 14.0, 40.0], [170.0, 230.0, 90.0, 26.0, 50.0],
		[-220.0, 240.0, 80.0, 24.0, 50.0], [20.0, 290.0, 120.0, 34.0, 60.0],
		[-120.0, 120.0, 40.0, 9.0, 30.0], [130.0, 110.0, 40.0, 8.0, 28.0]]
	for l in lomas:
		semilla += 1
		bola(HIERBA, Vector3(float(l[0]), - float(l[3]) * 0.2, fin - float(l[1])),
			Vector3(float(l[2]), float(l[3]), float(l[4])), 1,
			verde(C_LOMA.lerp(C_PRADO, _rng.randf_range(0.0, 0.4))), 0.12, semilla, 0.03)
	for s in [-1.0, 1.0]:
		var z: float = desde + 20.0
		while z > fin - 100.0:
			semilla += 1
			bola(HIERBA, Vector3(s * _rng.randf_range(150.0, 190.0), -3.0, z),
				Vector3(_rng.randf_range(40.0, 60.0), _rng.randf_range(12.0, 22.0),
				_rng.randf_range(35.0, 50.0)), 1, verde(C_LOMA), 0.12, semilla, 0.03)
			z -= _rng.randf_range(55.0, 75.0)




func seto(a: Vector3, b: Vector3) -> void:
	caja(HOJA, a, b, C_SETO, C_SETO.lightened(0.08))

	caja(HOJA, Vector3(a.x + 0.07, b.y, a.z + 0.07), Vector3(b.x - 0.07, b.y + 0.08, b.z - 0.07),
		C_SETO.lightened(0.06), C_SETO.lightened(0.14))




func farol(pie: Vector3, hacia: float) -> void:
	cil(LISO, pie, 0.15, 0.12, 0.34, 8, C_HIERRO)
	cil(LISO, pie + Vector3(0.0, 0.34, 0.0), 0.085, 0.07, 0.12, 8, C_HIERRO.lightened(0.06))
	cil(LISO, pie + Vector3(0.0, 0.46, 0.0), 0.055, 0.045, 3.3, 8, C_HIERRO)
	var y: float = 3.76
	cil(LISO, pie + Vector3(0.0, y, 0.0), 0.07, 0.0, 0.16, 6, C_HIERRO)
	caja(LISO, pie + Vector3(minf(0.0, hacia * 0.66), y - 0.07, -0.03),
		pie + Vector3(maxf(0.0, hacia * 0.66), y - 0.01, 0.03), C_HIERRO)
	var c: Vector3 = pie + Vector3(hacia * 0.62, 0.0, 0.0)
	cil(LISO, c + Vector3(0.0, y - 0.2, 0.0), 0.025, 0.025, 0.14, 6, C_HIERRO)
	cil(LISO, c + Vector3(0.0, y - 0.36, 0.0), 0.24, 0.05, 0.16, 4, C_HIERRO.lightened(0.04))
	caja(LUZ, c + Vector3(-0.12, y - 0.66, -0.12), c + Vector3(0.12, y - 0.36, 0.12), C_LUZ)
	focos.append(xf *(c + Vector3(0.0, y - 0.51, 0.0)))
	caja(LISO, c + Vector3(-0.1, y - 0.72, -0.1), c + Vector3(0.1, y - 0.66, 0.1), C_HIERRO)
	_bloquea(pie, 0.22)



func banco(pie: Vector3, mira: float) -> void:
	var antes: Transform3D = xf
	xf = antes * Transform3D(Basis(Vector3.UP, 0.0 if mira > 0.0 else PI), pie)
	for z in [-0.72, 0.72]:
		caja(LISO, Vector3(-0.24, 0.0, z - 0.03), Vector3(0.22, 0.42, z + 0.03), C_HIERRO)
		caja(LISO, Vector3(-0.27, 0.42, z - 0.03), Vector3(-0.21, 0.9, z + 0.03), C_HIERRO)
	for i in 3:
		var x: float = -0.17 + float(i) * 0.13
		caja(LISO, Vector3(x - 0.055, 0.42, -0.88), Vector3(x + 0.055, 0.47, 0.88),
			C_MADERA.darkened(float(i) * 0.05), C_MADERA.lightened(0.08))
	for i in 2:
		var yy: float = 0.58 + float(i) * 0.17
		caja(LISO, Vector3(-0.255, yy, -0.88), Vector3(-0.21, yy + 0.11, 0.88), C_MADERA,
			C_MADERA.lightened(0.08))
	xf = antes
	bloqueos.append(Rect2(pie.x - 0.3, pie.z - 0.92, 0.6, 1.84))


func papelera(pie: Vector3) -> void:
	cil(LISO, pie, 0.19, 0.22, 0.72, 10, C_PAPELERA, Color("1d2320"))
	cil(LISO, pie + Vector3(0.0, 0.72, 0.0), 0.24, 0.24, 0.05, 10, C_PAPELERA.darkened(0.25),
		Color("1d2320"))
	_bloquea(pie, 0.26)


func boca_riego(pie: Vector3) -> void:
	cil(LISO, pie, 0.16, 0.16, 0.05, 8, C_ROJO.darkened(0.25))
	cil(LISO, pie + Vector3(0.0, 0.05, 0.0), 0.11, 0.1, 0.45, 8, C_ROJO)
	cil(LISO, pie + Vector3(0.0, 0.5, 0.0), 0.14, 0.14, 0.05, 8, C_ROJO.darkened(0.12))
	cil(LISO, pie + Vector3(0.0, 0.55, 0.0), 0.1, 0.03, 0.12, 8, C_ROJO)
	caja(LISO, pie + Vector3(-0.06, 0.28, -0.17), pie + Vector3(0.06, 0.38, 0.17), Color("cfcac0"))
	_bloquea(pie, 0.2)



func alcorque(c: Vector3, alto: float, semilla: int) -> void:
	var g: int = grupo
	grupo = SUELO
	plano(LISO, c.x - 0.5, c.x + 0.5, c.z - 0.5, c.z + 0.5, c.y + 0.004, C_TIERRA)
	for s in [-1.0, 1.0]:
		caja(LISO, Vector3(c.x - 0.5, c.y, c.z + s * 0.5 - 0.035),
			Vector3(c.x + 0.5, c.y + 0.012, c.z + s * 0.5 + 0.035), C_HIERRO.lightened(0.15))
		caja(LISO, Vector3(c.x + s * 0.5 - 0.035, c.y, c.z - 0.465),
			Vector3(c.x + s * 0.5 + 0.035, c.y + 0.012, c.z + 0.465), C_HIERRO.lightened(0.15))
	grupo = g
	arbol(c, alto, 1.35, semilla, 1)
	_bloquea(c, 0.2)


func tapa(c: Vector3) -> void:
	cil(LISO, c, 0.37, 0.37, 0.01, 12, C_TAPA.lightened(0.1))
	cil(LISO, c + Vector3(0.0, 0.01, 0.0), 0.3, 0.3, 0.004, 12, C_TAPA)


func rejilla(c: Vector3) -> void:
	caja(LISO, c + Vector3(-0.16, 0.0, -0.38), c + Vector3(0.16, 0.006, 0.38), C_REJILLA)
	for i in 5:
		var z: float = -0.3 + float(i) * 0.15
		caja(LISO, c + Vector3(-0.13, 0.006, z - 0.02), c + Vector3(0.13, 0.01, z + 0.02),
			C_CUNETA.darkened(0.1))




func arbol(base: Vector3, alto: float, ancho: float, semilla: int, sub: int) -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla
	var t: float = 0.07 + alto * 0.018
	cil(LISO, base, t * 1.25, t, alto * 0.5, 6, C_TRONCO)
	var tono: Color = C_HOJA.lerp(C_PINO, r.randf_range(0.0, 0.35)).lightened(r.randf_range(-0.04,
		0.06))
	var copa: Vector3 = base + Vector3(0.0, alto * 0.6, 0.0)
	bola(HOJA, copa, Vector3(ancho, alto * 0.3, ancho * 0.94), sub, tono, 0.16, semilla)
	var d: Vector3 = Vector3(r.randf_range(-0.35, 0.35) * ancho, alto * 0.22,
		r.randf_range(-0.35, 0.35) * ancho)
	bola(HOJA, copa + d, Vector3(ancho * 0.66, alto * 0.22, ancho * 0.64), sub,
		tono.lightened(0.08), 0.18, semilla + 1)
	if sub > 0:
		bola(HOJA, copa + Vector3(- d.x, - alto * 0.04, - d.z) * 1.1, Vector3(ancho * 0.6, alto * 0.2,
			ancho * 0.6), sub, tono.darkened(0.04), 0.18, semilla + 2)


func pino(base: Vector3, alto: float, ancho: float, semilla: int) -> void:
	cil(LISO, base, 0.16, 0.12, alto * 0.25, 6, C_TRONCO)
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla
	var tono: Color = C_PINO.lightened(r.randf_range(-0.04, 0.06))
	for i in 3:
		var y: float = alto *(0.18 + 0.22 * float(i))
		var w: float = ancho *(1.0 - 0.24 * float(i))
		cil(HOJA, base + Vector3(0.0, y, 0.0), w, 0.0, alto *(0.42 - 0.06 * float(i)), 7,
			tono.lightened(0.05 * float(i)))



func cipres(base: Vector3, alto: float, semilla: int) -> void:
	cil(LISO, base, 0.08, 0.07, 0.4, 6, C_TRONCO)
	bola(HOJA, base + Vector3(0.0, 0.3 + alto * 0.45, 0.0), Vector3(0.62, alto * 0.5, 0.62), 1,
		C_PINO.lightened(0.04), 0.1, semilla)




func casa_lejos(c: Vector3, w: float, d: float, h: float, giro: float, semilla: int) -> void:
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = semilla
	var pared: Color = PAREDES[r.randi() % PAREDES.size()]
	var teja: Color = TEJAS[r.randi() % TEJAS.size()]


	if nevado:
		teja = C_NIEVE_COSAS.lerp(teja, 0.06)
	var antes: Transform3D = xf
	xf = antes * Transform3D(Basis(Vector3.UP, giro), c)
	var hw: float = w * 0.5
	var hd: float = d * 0.5
	caja(LISO, Vector3(- hw, 0.0, - hd), Vector3(hw, h, hd), pared)
	var hr: float = d * 0.36
	var o: float = 0.35
	var ye: float = h - hr * o / hd
	var cum_a: Vector3 = Vector3(- hw - o, h + hr, 0.0)
	var cum_b: Vector3 = Vector3(hw + o, h + hr, 0.0)
	quad(LISO, Vector3(- hw - o, ye, - hd - o), Vector3(hw + o, ye, - hd - o), cum_b, cum_a,
		teja.darkened(0.08), Vector3(0.0, 1.0, -1.0))
	quad(LISO, Vector3(- hw - o, ye, hd + o), Vector3(hw + o, ye, hd + o), cum_b, cum_a, teja,
		Vector3(0.0, 1.0, 1.0))
	for s in [-1.0, 1.0]:
		tri(LISO, Vector3(s * hw, h, - hd), Vector3(s * hw, h, hd), Vector3(s * hw, h + hr, 0.0),
			pared, Vector3(s, 0.0, 0.0))
	if r.randf() < 0.5:
		var cx: float = r.randf_range(- hw * 0.6, hw * 0.6)
		caja(LISO, Vector3(cx - 0.3, h, - hd * 0.4), Vector3(cx + 0.3, h + hr + 0.6, - hd * 0.4 + 0.6),
			pared.darkened(0.15), C_NIEVE_COSAS if nevado else Color(0, 0, 0, 0))
	var pisos: int = maxi(1, int(h / 2.8))
	var cols: int = maxi(2, int(w / 2.3))
	for p in pisos:
		var y0: float = 0.9 + float(p) * 2.8
		for k in cols:
			var x: float = - hw +(float(k) + 0.5) * w / float(cols)
			if p == 0 and k == cols>>1:
				plano_z(LISO, x - 0.5, x + 0.5, 0.0, 2.1, hd + 0.01, Color("5a4231"))
				continue
			plano_z(LISO, x - 0.45, x + 0.45, y0, y0 + 1.15, hd + 0.01, C_VENTANA)
	xf = antes


func _bloquea(c: Vector3, r: float) -> void:
	bloqueos.append(Rect2(c.x - r, c.z - r, r * 2.0, r * 2.0))




func _lote(m: int) -> Lote:
	var k: int = grupo * 16 + m
	if not _lotes.has(k):
		_lotes[k] = Lote.new()
	return _lotes[k]




func tri(m: int, a: Vector3, b: Vector3, c: Vector3, col: Color, fuera: Vector3) -> void:
	a = xf * a
	b = xf * b
	c = xf * c
	var n: Vector3 =(c - a).cross(b - a)
	if n.length_squared() < 1e-12:
		return
	if n.dot(xf.basis * fuera) < 0.0:
		var t: Vector3 = b
		b = c
		c = t
		n = - n
	n = n.normalized()
	if nevado and m == HOJA:
		col = _nevada(col, n.y)
	var l: Lote = _lote(m)
	l.v.append(a)
	l.v.append(b)
	l.v.append(c)
	for i in 3:
		l.n.append(n)
		l.c.append(col)


func quad(m: int, a: Vector3, b: Vector3, c: Vector3, d: Vector3, col: Color,
		fuera: Vector3) -> void:
	tri(m, a, b, c, col, fuera)
	tri(m, a, c, d, col, fuera)



func plano(m: int, x0: float, x1: float, z0: float, z1: float, y: float, col: Color) -> void:
	quad(m, Vector3(x0, y, z0), Vector3(x1, y, z0), Vector3(x1, y, z1), Vector3(x0, y, z1), col,
		Vector3.UP)



func plano_z(m: int, x0: float, x1: float, y0: float, y1: float, z: float, col: Color) -> void:
	quad(m, Vector3(x0, y0, z), Vector3(x1, y0, z), Vector3(x1, y1, z), Vector3(x0, y1, z), col,
		Vector3.BACK)




func caja(m: int, a: Vector3, b: Vector3, col: Color, arriba: Color = Color(0, 0, 0, 0)) -> void:
	var top: Color = col if arriba.a == 0.0 else arriba
	var x0: float = minf(a.x, b.x)
	var x1: float = maxf(a.x, b.x)
	var y0: float = minf(a.y, b.y)
	var y1: float = maxf(a.y, b.y)
	var z0: float = minf(a.z, b.z)
	var z1: float = maxf(a.z, b.z)
	quad(m, Vector3(x0, y1, z0), Vector3(x1, y1, z0), Vector3(x1, y1, z1), Vector3(x0, y1, z1),
		top, Vector3.UP)
	quad(m, Vector3(x1, y0, z0), Vector3(x1, y1, z0), Vector3(x1, y1, z1), Vector3(x1, y0, z1),
		col, Vector3.RIGHT)
	quad(m, Vector3(x0, y0, z0), Vector3(x0, y1, z0), Vector3(x0, y1, z1), Vector3(x0, y0, z1),
		col, Vector3.LEFT)
	quad(m, Vector3(x0, y0, z1), Vector3(x1, y0, z1), Vector3(x1, y1, z1), Vector3(x0, y1, z1),
		col, Vector3.BACK)
	quad(m, Vector3(x0, y0, z0), Vector3(x1, y0, z0), Vector3(x1, y1, z0), Vector3(x0, y1, z0),
		col, Vector3.FORWARD)



func cil(m: int, base: Vector3, r0: float, r1: float, h: float, lados: int, col: Color,
		tapa_col: Color = Color(0, 0, 0, 0)) -> void:
	var tc: Color = col if tapa_col.a == 0.0 else tapa_col
	var paso: float = TAU / float(lados)
	var a0: float = paso * 0.5
	var arriba: Vector3 = base + Vector3(0.0, h, 0.0)
	for i in lados:
		var a: float = a0 + paso * float(i)
		var b: float = a + paso
		var da: Vector3 = Vector3(cos(a), 0.0, sin(a))
		var db: Vector3 = Vector3(cos(b), 0.0, sin(b))
		var fuera: Vector3 =(da + db).normalized()
		if r1 <= 0.0:
			tri(m, base + da * r0, base + db * r0, arriba, col, fuera)
			continue
		quad(m, base + da * r0, base + db * r0, arriba + db * r1, arriba + da * r1, col, fuera)
		tri(m, arriba, arriba + da * r1, arriba + db * r1, tc, Vector3.UP)





func bola(m: int, centro: Vector3, radio: Vector3, sub: int, col: Color, sacude: float,
		semilla: int, variar: float = 0.05) -> void:
	for t in _ico(sub):
		var p: Array[Vector3] = []
		for u in t:
			var j: float = 1.0 + sacude * _hash(u, semilla)
			p.append(centro + Vector3(u.x * radio.x, u.y * radio.y, u.z * radio.z) * j)
		var mid: Vector3 =((t[0] as Vector3) +(t[1] as Vector3) +(t[2] as Vector3)) / 3.0
		var k: float = variar * _hash(mid, semilla + 7)
		var tono: Color = col.lightened(k) if k > 0.0 else col.darkened(- k)
		if mid.y < -0.2:
			tono = tono.darkened(0.08)
		tri(m, p[0], p[1], p[2], tono, mid)



static func _hash(u: Vector3, semilla: int) -> float:
	var h: float = sin(u.x * 127.1 + u.y * 311.7 + u.z * 74.7 + float(semilla) * 13.13) * 43758.5453
	return (h - floorf(h)) * 2.0 - 1.0


static func _ico(sub: int) -> Array:
	if _icos.has(sub):
		return _icos[sub]
	var g: float =(1.0 + sqrt(5.0)) * 0.5
	var v: Array[Vector3] = [Vector3(-1, g, 0), Vector3(1, g, 0), Vector3(-1, - g, 0),
		Vector3(1, - g, 0), Vector3(0, -1, g), Vector3(0, 1, g), Vector3(0, -1, - g),
		Vector3(0, 1, - g), Vector3(g, 0, -1), Vector3(g, 0, 1), Vector3(- g, 0, -1),
		Vector3(- g, 0, 1)]
	for i in v.size():
		v[i] = v[i].normalized()
	var f: Array = [[0, 11, 5], [0, 5, 1], [0, 1, 7], [0, 7, 10], [0, 10, 11], [1, 5, 9],
		[5, 11, 4], [11, 10, 2], [10, 7, 6], [7, 1, 8], [3, 9, 4], [3, 4, 2], [3, 2, 6], [3, 6, 8],
		[3, 8, 9], [4, 9, 5], [2, 4, 11], [6, 2, 10], [8, 6, 7], [9, 8, 1]]
	for s in sub:
		var medios: Dictionary = {}
		var nf: Array = []
		for t in f:
			var ab: int = _medio(v, medios, t[0], t[1])
			var bc: int = _medio(v, medios, t[1], t[2])
			var ca: int = _medio(v, medios, t[2], t[0])
			nf.append([t[0], ab, ca])
			nf.append([t[1], bc, ab])
			nf.append([t[2], ca, bc])
			nf.append([ab, bc, ca])
		f = nf
	var out: Array = []
	for t in f:
		out.append([v[t[0]], v[t[1]], v[t[2]]])
	_icos[sub] = out
	return out


static func _medio(v: Array[Vector3], medios: Dictionary, a: int, b: int) -> int:
	var k: Vector2i = Vector2i(mini(a, b), maxi(a, b))
	if medios.has(k):
		return medios[k]
	v.append(((v[a] + v[b]) * 0.5).normalized())
	medios[k] = v.size() - 1
	return v.size() - 1




func cierra(padre: Node3D, sombra: bool) -> void:
	for k in _lotes:
		var l: Lote = _lotes[k]
		if l.v.is_empty():
			continue
		var arr: Array = []
		arr.resize(Mesh.ARRAY_MAX)
		arr[Mesh.ARRAY_VERTEX] = l.v
		arr[Mesh.ARRAY_NORMAL] = l.n
		arr[Mesh.ARRAY_COLOR] = l.c
		var am: ArrayMesh = ArrayMesh.new()
		am.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arr)
		am.surface_set_material(0, _mat(int(k)&15))
		var mi: MeshInstance3D = MeshInstance3D.new()
		mi.mesh = am
		mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON \
				if sombra and int(k)>>4 == COSAS else GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		padre.add_child(mi)
	_lotes.clear()




static func _mat(m: int) -> StandardMaterial3D:
	if _mats.has(m):
		return _mats[m]
	var x: StandardMaterial3D = StandardMaterial3D.new()
	x.vertex_color_use_as_albedo = true
	x.vertex_color_is_srgb = true
	x.roughness = 1.0
	if m == LUZ:
		x.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	elif METROS.has(m):
		x.albedo_texture = _tex(m)
		x.uv1_triplanar = true
		x.uv1_world_triplanar = true
		x.uv1_triplanar_sharpness = 8.0
		x.uv1_scale = Vector3.ONE / float(METROS[m])
		x.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS_ANISOTROPIC
	_mats[m] = x
	return x



static func _tex(m: int) -> ImageTexture:
	if _texs.has(m):
		return _texs[m]
	var r: RandomNumberGenerator = RandomNumberGenerator.new()
	r.seed = 7331 + m
	var n: int = int(PIXELES[m])
	var img: Image = Image.create_empty(n, n, false, Image.FORMAT_RGB8)
	var manchas: PackedFloat32Array = _manchas(n, 4, r)
	var tonos: PackedFloat32Array = PackedFloat32Array()
	for i in 16:
		tonos.append(r.randf_range(-0.035, 0.035))
	for y in n:
		for x in n:
			var b: float = manchas[y * n + x] - 0.5
			var v: float = 0.0
			var tibio: float = 0.0
			match m:
				ASFALTO:
					v = 0.93 + b * 0.07 + r.randf_range(-0.045, 0.045)
					var q: float = r.randf()
					if q < 0.05:
						v = 1.0
					elif q < 0.08:
						v = 0.8
				LOSA:


					var tx: int = x % 32
					var ty: int = y % 32
					v = 0.95 + tonos[(y>>5) * 4 +(x>>5)] + b * 0.03 + r.randf_range(-0.025, 0.025)
					if tx == 0 or ty == 0:
						v = 0.68
					elif tx == 1 or ty == 1:
						v += 0.035
					elif tx == 31 or ty == 31:
						v -= 0.06
				CESPED:

					v =(0.99 if x <(n>>1) else 0.89) + b * 0.06 + r.randf_range(-0.05, 0.03)
					if r.randf() < 0.07:
						v -= 0.12
					tibio = b * 0.08
				HIERBA:
					v = 0.88 + b * 0.16 + r.randf_range(-0.05, 0.05)
					if r.randf() < 0.05:
						v += 0.08
					tibio = b * 0.14
				HOJA:
					v = 0.86 + b * 0.1 + r.randf_range(-0.07, 0.07)
					var q: float = r.randf()
					if q < 0.1:
						v = 1.0
					elif q < 0.18:
						v = 0.68
			v = clampf(v, 0.0, 1.0)
			img.set_pixel(x, y, Color(clampf(v *(1.0 + tibio), 0.0, 1.0), v,
				clampf(v *(1.0 - tibio), 0.0, 1.0)))
	img.generate_mipmaps()
	var t: ImageTexture = ImageTexture.create_from_image(img)
	_texs[m] = t
	return t




static func _manchas(n: int, celdas: int, r: RandomNumberGenerator) -> PackedFloat32Array:
	var g: PackedFloat32Array = PackedFloat32Array()
	for i in celdas * celdas:
		g.append(r.randf())
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n * n)
	for y in n:
		var fy: float = float(y) * celdas / n
		var y0: int = int(fy)
		var ty: float = smoothstep(0.0, 1.0, fy - y0)
		var y1: int =(y0 + 1) % celdas
		for x in n:
			var fx: float = float(x) * celdas / n
			var x0: int = int(fx)
			var tx: float = smoothstep(0.0, 1.0, fx - x0)
			var x1: int =(x0 + 1) % celdas
			out[y * n + x] = lerpf(lerpf(g[y0 * celdas + x0], g[y0 * celdas + x1], tx),
				lerpf(g[y1 * celdas + x0], g[y1 * celdas + x1], tx), ty)
	return out
