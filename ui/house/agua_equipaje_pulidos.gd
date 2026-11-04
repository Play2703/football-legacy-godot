extends RefCounted










const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")

var _escena: Object
var _kind: String
var _centro: Vector3
var _base: Basis
var _ancho: float
var _fondo: float
var _alto: float
var _grupos: Dictionary = {}


static func pintar(escena: Object, kind: String, r: Rect2, col: Color,
		alto: float, prop: Dictionary = {}) -> void:
	if kind not in ["estanque", "maletas"]:
		return
	var p = load("res://ui/house/agua_equipaje_pulidos.gd").new()
	p._escena = escena
	p._kind = kind
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	p._ancho = maxf(r.size.x, r.size.y)
	p._fondo = minf(r.size.x, r.size.y)
	p._alto = alto


	p._base = Basis(Vector3.RIGHT, Vector3.UP, Vector3.FORWARD) \
			if r.size.x >= r.size.y else Basis(Vector3.BACK, Vector3.UP, Vector3.LEFT)
	if kind == "estanque":
		p._estanque(col)
	else:
		p._maletas(col, prop)
	p._publicar()


func _grupo(nombre: String, col: Color, rug: float = 0.95,
		metal: float = 0.0, emision: float = 0.0) -> String:
	var id: String = nombre + col.to_html(true)
	if not _grupos.has(id):
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_grupos[id] = {"st": st, "nombre": nombre, "col": col, "rug": rug,
			"metal": metal, "emision": emision, "vertices": 0}
	return id


func _triangulo(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		fuera: Vector3) -> void:
	var aa: Vector3 = _base * a
	var bb: Vector3 = _base * b
	var cc: Vector3 = _base * c
	var normal: Vector3 =(bb - aa).cross(cc - aa)
	if normal.length_squared() < 1e-12:
		return
	if normal.dot(_base * fuera) < 0.0:
		var anterior: Vector3 = bb
		bb = cc
		cc = anterior
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"]
	st.set_normal(normal.normalized())

	st.add_vertex(aa)
	st.add_vertex(cc)
	st.add_vertex(bb)
	_grupos[grupo]["vertices"] += 3


func _cara(grupo: String, a: Vector3, b: Vector3, c: Vector3,
		d: Vector3, fuera: Vector3) -> void:
	_triangulo(grupo, a, b, c, fuera)
	_triangulo(grupo, a, c, d, fuera)


func _primitiva(malla: PrimitiveMesh, at: Vector3, grupo: String,
		giro: Basis = Basis.IDENTITY) -> void:
	var datos: Array = DetalleExterior.arrays_de(malla)
	var vertices: PackedVector3Array = datos[Mesh.ARRAY_VERTEX]
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	var total: int = vertices.size() if indices.is_empty() else indices.size()
	var normal_base: Basis = giro.inverse().transposed()
	var st: SurfaceTool = _grupos[grupo]["st"]
	for i in range(0, total, 3):
		var ids: Array[int] = [i, i + 1, i + 2]
		if not indices.is_empty():
			ids = [indices[i], indices[i + 1], indices[i + 2]]
		var puntos: Array[Vector3] = []
		var normas: Array[Vector3] = []
		for j in ids:
			puntos.append(_base *(at + giro * vertices[j]))
			normas.append((_base *(normal_base * normales[j])).normalized())
		var orden: Array[int] = [0, 1, 2]
		if (puntos[1] - puntos[0]).cross(puntos[2] - puntos[0]).dot(normas[0] + normas[1] + normas[2]) > 0.0:
			orden = [0, 2, 1]
		for j in orden:
			st.set_normal(normas[j])
			st.add_vertex(puntos[j])
	_grupos[grupo]["vertices"] += total


func _caja(at: Vector3, tam: Vector3, grupo: String,
		giro: Basis = Basis.IDENTITY) -> void:
	var caja: BoxMesh = BoxMesh.new()
	caja.size = tam
	_primitiva(caja, at, grupo, giro)


func _ovalo(at: Vector3, tam: Vector3, grupo: String,
		giro: Basis = Basis.IDENTITY) -> void:
	var esfera: SphereMesh = SphereMesh.new()
	esfera.radius = 0.5
	esfera.height = 1.0
	esfera.radial_segments = 10
	esfera.rings = 4
	_primitiva(esfera, at, grupo, giro.scaled_local(tam))


func _barra(desde: Vector3, hasta: Vector3, radio: float,
		grupo: String, lados: int = 6) -> void:
	var tramo: Vector3 = hasta - desde
	if tramo.length_squared() < 1e-08:
		return
	var cilindro: CylinderMesh = CylinderMesh.new()
	cilindro.top_radius = radio
	cilindro.bottom_radius = radio
	cilindro.height = tramo.length()
	cilindro.radial_segments = lados
	cilindro.rings = 0
	_primitiva(cilindro,(desde + hasta) * 0.5, grupo,
		Basis(Quaternion(Vector3.UP, tramo.normalized())))


func _contorno(ancho: float, fondo: float, radio: float,
		pasos: int = 4) -> Array[Vector2]:
	var puntos: Array[Vector2] = []
	var rx: float = ancho * 0.5 - radio
	var rz: float = fondo * 0.5 - radio
	for esquina in 4:
		var signo_x: float = 1.0 if esquina in [0, 3] else -1.0
		var signo_z: float = 1.0 if esquina in [0, 1] else -1.0
		for j in range(pasos + 1):
			var a: float = PI * 0.5 *(float(esquina) + float(j) / float(pasos))
			puntos.append(Vector2(signo_x * rx + cos(a) * radio,
				signo_z * rz + sin(a) * radio))
	return puntos


func _redondeada(at: Vector3, tam: Vector3, radio: float,
		grupo: String, giro: Basis = Basis.IDENTITY) -> void:


	radio = minf(radio, minf(tam.x, tam.z) * 0.49)
	var bisel: float = minf(radio * 0.42, tam.y * 0.16)
	var perfiles: Array = [
		_contorno(tam.x - bisel * 2.0, tam.z - bisel * 2.0, radio - bisel),
		_contorno(tam.x, tam.z, radio),
		_contorno(tam.x, tam.z, radio),
		_contorno(tam.x - bisel * 2.0, tam.z - bisel * 2.0, radio - bisel)]
	var alturas: Array[float] = [- tam.y * 0.5, - tam.y * 0.5 + bisel,
		tam.y * 0.5 - bisel, tam.y * 0.5]
	for nivel in 3:
		for i in (perfiles[nivel] as Array).size():
			var j: int =(i + 1) %(perfiles[nivel] as Array).size()
			var pa: Vector2 = perfiles[nivel][i]
			var pb: Vector2 = perfiles[nivel][j]
			var pc: Vector2 = perfiles[nivel + 1][j]
			var pd: Vector2 = perfiles[nivel + 1][i]
			var normal: Vector3 = giro * Vector3((pa.x + pb.x) * 0.5,
				-0.5 if nivel == 0 else (0.5 if nivel == 2 else 0.0),
				(pa.y + pb.y) * 0.5)
			_cara(grupo, at + giro * Vector3(pa.x, alturas[nivel], pa.y),
				at + giro * Vector3(pb.x, alturas[nivel], pb.y),
				at + giro * Vector3(pc.x, alturas[nivel + 1], pc.y),
				at + giro * Vector3(pd.x, alturas[nivel + 1], pd.y), normal)
	for nivel in [0, 3]:
		var perfil: Array = perfiles[nivel]
		var fuera: Vector3 = giro *(Vector3.DOWN if nivel == 0 else Vector3.UP)
		for i in perfil.size():
			var j: int =(i + 1) % perfil.size()
			_triangulo(grupo, at + giro * Vector3(0, alturas[nivel], 0),
				at + giro * Vector3(perfil[i].x, alturas[nivel], perfil[i].y),
				at + giro * Vector3(perfil[j].x, alturas[nivel], perfil[j].y), fuera)


func _costura(at: Vector3, ancho: float, fondo: float, radio: float,
		grupo: String, giro: Basis = Basis.IDENTITY) -> void:
	var puntos: Array[Vector2] = _contorno(ancho, fondo, radio, 3)
	for i in puntos.size():
		var j: int =(i + 1) % puntos.size()
		_barra(at + giro * Vector3(puntos[i].x, 0, puntos[i].y),
			at + giro * Vector3(puntos[j].x, 0, puntos[j].y), 0.0018, grupo)


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	for id in _grupos:
		var datos: Dictionary = _grupos[id]
		if int(datos["vertices"]) == 0:
			continue
		var st: SurfaceTool = datos["st"]
		var malla: ArrayMesh = st.commit()
		if malla.get_surface_count() == 0:
			continue
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = datos["col"]
		mat.roughness = float(datos["rug"])
		mat.metallic = float(datos["metal"])
		if float(datos["emision"]) > 0.0:
			mat.emission_enabled = true
			mat.emission = datos["col"]
			mat.emission_energy_multiplier = float(datos["emision"])
		malla.surface_set_material(0, mat)
		var pieza: MeshInstance3D = MeshInstance3D.new()
		pieza.name = _kind.capitalize() + str(id)
		pieza.mesh = malla
		pieza.position = _centro
		if float(datos["emision"]) > 0.0:
			pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		padre.add_child(pieza)





func _estanque(piedra: Color) -> void:
	var vaso: String = _grupo("Vaso", Color("1d3128"))
	var agua: String = _grupo("Agua", Color("4a86b0"), 0.28, 0.0, 0.35)
	var salto: String = _grupo("Cascada", Color("8fc4dc"), 0.26, 0.0, 0.5)
	var rocas: Array[String] = []
	for tono in 3:
		rocas.append(_grupo("Rocas", piedra.darkened(0.05 * float(tono))))
	var verde: String = _grupo("Nenufares", Color("3f6033"), 0.8)
	var nervios: String = _grupo("Nervios", Color("567640"), 0.9)
	var flor: String = _grupo("Petalos", Color("eee1d9"), 0.78)
	var centro_flor: String = _grupo("Flores", Color("d7b657"), 0.9)

	var exterior: Array[Vector2] = _contorno(_ancho - 0.1, _fondo - 0.1, 0.26)
	var interior: Array[Vector2] = _contorno(_ancho - 0.46, _fondo - 0.46, 0.18)
	var bajo: float = 0.0
	var suelo: float = 0.04
	var labio: float = _alto * 0.89
	for i in exterior.size():
		var j: int =(i + 1) % exterior.size()
		var a: Vector2 = exterior[i]
		var b: Vector2 = exterior[j]
		var aa: Vector2 = interior[i]
		var bb: Vector2 = interior[j]
		_cara(vaso, Vector3(a.x, bajo, a.y), Vector3(b.x, bajo, b.y),
			Vector3(b.x, labio, b.y), Vector3(a.x, labio, a.y),
			Vector3(a.x + b.x, 0, a.y + b.y))
		_cara(vaso, Vector3(aa.x, suelo, aa.y), Vector3(bb.x, suelo, bb.y),
			Vector3(bb.x, labio, bb.y), Vector3(aa.x, labio, aa.y),
			- Vector3(aa.x + bb.x, 0, aa.y + bb.y))
		_cara(vaso, Vector3(a.x, labio, a.y), Vector3(b.x, labio, b.y),
			Vector3(bb.x, labio, bb.y), Vector3(aa.x, labio, aa.y), Vector3.UP)
		_triangulo(vaso, Vector3(0, suelo, 0), Vector3(a.x, suelo, a.y),
			Vector3(b.x, suelo, b.y), Vector3.UP)
		_triangulo(vaso, Vector3(0, bajo, 0), Vector3(a.x, bajo, a.y),
			Vector3(b.x, bajo, b.y), Vector3.DOWN)


	_redondeada(Vector3(0, _alto - 0.05, 0),
		Vector3(_ancho - 0.5, 0.07, _fondo - 0.5), 0.15, agua)

	var ribera: Array[Vector2] = _contorno(_ancho - 0.36, _fondo - 0.34, 0.28)
	for i in ribera.size():
		var punto: Vector2 = ribera[i]
		var tam: Vector3 = Vector3(0.27 + 0.03 * float(i % 3),
			_alto *(0.48 + 0.05 * float(i % 2)), 0.25 + 0.025 * float(i % 3))
		_roca(Vector3(punto.x, _alto * 0.78, punto.y), tam, i, rocas[i % 3])


	var rinc: float = - _ancho * 0.32
	var fondo: float = - _fondo * 0.27
	_roca(Vector3(rinc, _alto * 0.62, fondo + 0.09),
		Vector3(0.6, _alto * 1.2, 0.55), 23, rocas[1])
	for i in 3:
		_roca(Vector3(rinc, _alto + 0.12 + 0.18 * float(i),
			fondo + 0.09 * float(2 - i)),
			Vector3(0.54 - 0.09 * float(i), 0.18, 0.47 - 0.06 * float(i)),
			31 + i, rocas[i % 3])
	var cauce: Array[Vector3] = [
		Vector3(rinc + 0.055, _alto + 0.553, fondo + 0.105),
		Vector3(rinc + 0.055, _alto + 0.395, fondo + 0.185),
		Vector3(rinc + 0.055, _alto + 0.391, fondo + 0.28),
		Vector3(rinc + 0.055, _alto + 0.215, fondo + 0.3),
		Vector3(rinc + 0.055, _alto + 0.211, fondo + 0.39),
		Vector3(rinc + 0.055, _alto - 0.015, fondo + 0.49)]
	_cascada(cauce, salto)
	for signo in [-1.0, 1.0]:
		var at: Vector3 = Vector3(signo * _ancho * 0.22,
			_alto - 0.01, - signo * _fondo * 0.2)
		_hoja(at, 0.17, 0.015, verde, signo)
		for i in 3:
			var a: float = 0.85 + float(i) * 1.75
			_barra(at + Vector3(0, 0.017, 0),
				at + Vector3(cos(a) * 0.13, 0.017, sin(a) * 0.13), 0.0016, nervios)
		var flor_at: Vector3 = at + Vector3(-0.04 * signo, 0.038, 0.018)
		for i in 6:
			var a: float = TAU * float(i) / 6.0
			_ovalo(flor_at + Vector3(cos(a) * 0.04, 0, sin(a) * 0.04),
				Vector3(0.092, 0.033, 0.037), flor, Basis(Vector3.UP, - a))
		_ovalo(flor_at + Vector3(0, 0.019, 0), Vector3(0.045, 0.03, 0.045), centro_flor)


func _roca(at: Vector3, tam: Vector3, semilla: int, grupo: String) -> void:
	var niveles: Array[float] = [-0.5, -0.19, 0.28, 0.5]
	var radios: Array[float] = [0.66, 1.0, 0.87, 0.45]
	var perfiles: Array = []
	for n in niveles.size():
		var perfil: Array[Vector3] = []
		for i in 7:
			var a: float = TAU * float(i) / 7.0 + 0.13 * float(semilla % 4)
			var corte: float = 0.86 + 0.045 * float((i * 3 + semilla) % 4)
			perfil.append(at + Vector3(cos(a) * tam.x * 0.5 * radios[n] * corte,
				niveles[n] * tam.y, sin(a) * tam.z * 0.5 * radios[n] * corte))
		perfiles.append(perfil)
	for n in 3:
		for i in 7:
			var j: int =(i + 1) % 7
			var fuera: Vector3 =((perfiles[n][i] as Vector3) +(perfiles[n][j] as Vector3)) * 0.5 - at
			fuera.y = - tam.y if n == 0 else (tam.y if n == 2 else 0.0)
			_cara(grupo, perfiles[n][i], perfiles[n][j], perfiles[n + 1][j], perfiles[n + 1][i], fuera)
	for n in [0, 3]:
		for i in 7:
			_triangulo(grupo, at + Vector3(0, niveles[n] * tam.y, 0),
				perfiles[n][i], perfiles[n][(i + 1) % 7], Vector3.DOWN if n == 0 else Vector3.UP)


func _cascada(puntos: Array[Vector3], grupo: String) -> void:
	for i in puntos.size() - 1:
		var a: Vector3 = puntos[i]
		var b: Vector3 = puntos[i + 1]
		var fuera: Vector3 = Vector3(0, b.z - a.z, a.y - b.y).normalized()
		var espesor: Vector3 = fuera * 0.006
		var izq: Vector3 = Vector3(-0.073, 0, 0)
		var der: Vector3 = - izq
		_cara(grupo, a + izq, a + der, b + der, b + izq, fuera)
		_cara(grupo, a + izq - espesor, a + der - espesor,
			b + der - espesor, b + izq - espesor, - fuera)
		_cara(grupo, a + izq, b + izq, b + izq - espesor,
			a + izq - espesor, Vector3.LEFT)
		_cara(grupo, a + der, b + der, b + der - espesor,
			a + der - espesor, Vector3.RIGHT)


func _hoja(at: Vector3, radio: float, canto: float,
		grupo: String, signo: float) -> void:


	var pasos: int = 22
	for i in pasos:
		var a: float = 0.2 +(TAU - 0.4) * float(i) / float(pasos)
		var b: float = 0.2 +(TAU - 0.4) * float(i + 1) / float(pasos)
		var va: Vector3 = Vector3(cos(a) * radio * signo, 0, sin(a) * radio)
		var vb: Vector3 = Vector3(cos(b) * radio * signo, 0, sin(b) * radio)
		_triangulo(grupo, at + Vector3.UP * canto, at + va + Vector3.UP * canto,
			at + vb + Vector3.UP * canto, Vector3.UP)
		_triangulo(grupo, at - Vector3.UP * canto, at + va - Vector3.UP * canto,
			at + vb - Vector3.UP * canto, Vector3.DOWN)
		_cara(grupo, at + va - Vector3.UP * canto, at + vb - Vector3.UP * canto,
			at + vb + Vector3.UP * canto, at + va + Vector3.UP * canto, va + vb)
	for a in [0.2, TAU - 0.2]:
		var borde: Vector3 = Vector3(cos(a) * radio * signo, 0, sin(a) * radio)
		_cara(grupo, at - Vector3.UP * canto, at + borde - Vector3.UP * canto,
			at + borde + Vector3.UP * canto, at + Vector3.UP * canto,
			Vector3(signo, 0, -1.0 if a < PI else 1.0))


func _maletas(cuero: Color, prop: Dictionary) -> void:


	var aforo: int = 5
	var mio: String = str(prop.get("id", ""))
	var offset: int = 0
	var plano: Dictionary = _escena.call("_plano")
	for pr in (plano["props"] as Array):
		var otro: Dictionary = pr as Dictionary
		if str(otro.get("kind", "")) != "maletas" or bool(otro.get("guardado", false)):
			continue
		if str(otro.get("id", "")) < mio:
			offset += aforo
	var historial: Array = CasaFoto.clubes()
	var cantidad: int = clampi(historial.size() - offset, 2, aforo)
	var kit: Color = GameState.player_kit().get("kit", Color("2a4bd7"))
	var paleta: Dictionary = _escena.get("_pal")
	var trim: Color = paleta.get("trim", Color("6f5a44"))
	var base: String = _grupo("Baul", cuero.darkened(0.22), 0.87)
	var tapa: String = _grupo("TapaBaul", cuero.darkened(0.06), 0.87)
	var claros: String = _grupo("CueroClaro", cuero.lightened(0.1), 0.79)
	var oscuros: String = _grupo("CueroOscuro", cuero.darkened(0.12), 0.79)
	var costuras: String = _grupo("Costuras", cuero.lightened(0.42), 0.95)
	var correas: String = _grupo("Correas", cuero.darkened(0.34), 0.94)
	var metal: String = _grupo("Herrajes", trim, 0.48, 0.42)
	_redondeada(Vector3(0, 0.12, 0),
		Vector3(_ancho * 0.8, 0.24, _fondo * 0.78), 0.055, base)
	_redondeada(Vector3(0, 0.265, 0),
		Vector3(_ancho * 0.82, 0.07, _fondo * 0.8), 0.045, tapa)
	_costura(Vector3(0, 0.211, 0), _ancho * 0.794, _fondo * 0.774, 0.048, costuras)
	for signo in [-1.0, 1.0]:
		_caja(Vector3(signo * _ancho * 0.23, 0.12, _fondo * 0.39),
			Vector3(_ancho * 0.035, 0.21, 0.013), correas)
		_caja(Vector3(signo * _ancho * 0.23, 0.214, _fondo * 0.397),
			Vector3(0.043, 0.043, 0.018), metal)
	_asa(Vector3(0, 0.151, _fondo * 0.4), _ancho * 0.2, 0.057,
		0.012, correas, metal)
	for i in cantidad:
		var ancho: float = _ancho *(0.72 - 0.05 * float(i))
		var fondo: float = _fondo *(0.7 - 0.03 * float(i))
		var a: float = deg_to_rad(8.0) *(float(i % 3) - 1.0)


		var giro: Basis = Basis(Vector3.UP, a * signf(_base.determinant()))
		var at: Vector3 = Vector3((float(i % 2) * 2.0 - 1.0) * _ancho * 0.04,
			0.35 + 0.115 * float(i), 0)
		var cuerpo: String = claros if i % 2 == 0 else oscuros
		_redondeada(at, Vector3(ancho, 0.13, fondo), 0.035, cuerpo, giro)
		_costura(at + Vector3(0, -0.006, 0), ancho - 0.003,
			fondo - 0.003, 0.034, costuras, giro)

		for signo in [-1.0, 1.0]:
			_caja(at + giro * Vector3(signo * ancho * 0.29, 0.005, fondo * 0.5 - 0.002),
				Vector3(0.027, 0.036, 0.012), metal, giro)
			for lado in [-1.0, 1.0]:
				_caja(at + giro * Vector3(signo *(ancho * 0.5 - 0.03),
					-0.037, lado *(fondo * 0.5 - 0.028)),
					Vector3(0.033, 0.027, 0.03), metal, giro)
		_asa(at + giro * Vector3(0, 0.014, fondo * 0.5 + 0.007),
			ancho * 0.24, 0.036, 0.008, correas, metal, giro)
		if offset + i < historial.size():
			var equipo: Dictionary = Teams.by_id(str(historial[offset + i]))
			var etiqueta: String = _grupo("Etiquetas", equipo.get("kit", kit), 0.87)
			var etiqueta_at: Vector3 = Vector3(- ancho * 0.265, -0.012, fondo * 0.5 + 0.006)


			_redondeada(at + giro * etiqueta_at, Vector3(0.093, 0.016, 0.065),
				0.012, etiqueta, giro * Basis(Vector3.RIGHT, PI * 0.5))
			_ovalo(at + giro *(etiqueta_at + Vector3(0, 0.021, 0.009)),
				Vector3(0.012, 0.012, 0.004), correas, giro)
			_barra(at + giro *(etiqueta_at + Vector3(0, 0.022, 0.01)),
				at + giro * Vector3(- ancho * 0.265, 0.048, fondo * 0.5 + 0.004),
				0.0025, metal)


	var ultima: int = cantidad - 1
	var ultimo_giro: Basis = Basis(Vector3.UP,
		deg_to_rad(8.0) *(float(ultima % 3) - 1.0) * signf(_base.determinant()))
	var ultimo_at: Vector3 = Vector3((float(ultima % 2) * 2.0 - 1.0) * _ancho * 0.04,
		0.35 + 0.115 * float(ultima) + 0.065, 0)
	var asa_ancho: float = _ancho *(0.72 - 0.05 * float(ultima)) * 0.28
	for signo in [-1.0, 1.0]:
		_barra(ultimo_at + ultimo_giro * Vector3(signo * asa_ancho * 0.5, -0.003, 0),
			ultimo_at + ultimo_giro * Vector3(signo * asa_ancho * 0.5, 0.018, 0), 0.007, metal)
	_barra(ultimo_at + ultimo_giro * Vector3(- asa_ancho * 0.5, 0.018, 0),
		ultimo_at + ultimo_giro * Vector3(asa_ancho * 0.5, 0.018, 0), 0.007, metal)


func _asa(at: Vector3, ancho: float, alto: float, salida: float,
		piel: String, metal: String, giro: Basis = Basis.IDENTITY) -> void:

	for signo in [-1.0, 1.0]:
		var apoyo: Vector3 = Vector3(signo * ancho * 0.5, - alto * 0.5, 0)
		var extremo: Vector3 = Vector3(signo * ancho * 0.5, alto * 0.5, salida)
		_barra(at + giro * apoyo, at + giro * extremo, 0.0055, metal)
		_caja(at + giro * apoyo, Vector3(0.018, 0.018, 0.009), metal, giro)
	_barra(at + giro * Vector3(- ancho * 0.5, alto * 0.5, salida),
		at + giro * Vector3(ancho * 0.5, alto * 0.5, salida), 0.007, piel)
