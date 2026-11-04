extends RefCounted










const DetalleExterior = preload("res://features/stadium/exterior_detail.gd")


const VOLANTE_CENTRO: Vector3 = Vector3(0, 1.02, 0.12)
const VOLANTE_INCLINACION: float = -70.0


const VOLANTE_TOPE: float = PI * 0.5

var _escena: Object
var _centro: Vector3
var _grupos: Dictionary = {}


static func pintar(escena: Object, r: Rect2) -> void:
	var p = load("res://ui/house/simulador_prop.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0.0, r.get_center().y)
	p._construir()
	p._publicar()


func _grupo(id: String, color: Color, rug: float = 0.8,
		metal: float = 0.0, emision: float = 0.0) -> void:
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_grupos[id] = {"st": st, "col": color, "rug": rug, "metal": metal,
		"emision": emision, "vertices": 0}


func _anadir(malla: PrimitiveMesh, at: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var st: SurfaceTool = _grupos[grupo]["st"]


	var desde: int = int(_grupos[grupo]["vertices"])
	_grupos[grupo]["vertices"] = desde + DetalleExterior.anexar(st, malla,
		Transform3D(base, at), desde)


func _caja(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla := BoxMesh.new()
	malla.size = tam
	_anadir(malla, at, grupo, base)


func _ovalo(at: Vector3, tam: Vector3, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla := SphereMesh.new()
	malla.radius = 0.5
	malla.height = 1.0
	malla.radial_segments = 16
	malla.rings = 8
	_anadir(malla, at, grupo, base.scaled_local(tam))


func _cilindro(at: Vector3, radio: float, alto: float, grupo: String,
		base: Basis = Basis.IDENTITY) -> void:
	var malla := CylinderMesh.new()
	malla.top_radius = radio
	malla.bottom_radius = radio
	malla.height = alto
	malla.radial_segments = 16
	malla.rings = 0
	_anadir(malla, at, grupo, base)


func _barra(a: Vector3, b: Vector3, radio: float, grupo: String) -> void:
	_cilindro((a + b) * 0.5, radio, a.distance_to(b), grupo,
		Basis(Quaternion(Vector3.UP,(b - a).normalized())))


func _triangulo(a: Vector3, b: Vector3, c: Vector3, fuera: Vector3,
		grupo: String) -> void:
	var normal: Vector3 =(b - a).cross(c - a)
	if normal.length_squared() < 1e-12:
		return
	var segundo: Vector3 = b
	var tercero: Vector3 = c
	if normal.dot(fuera) < 0.0:
		segundo = c
		tercero = b
		normal = - normal
	var st: SurfaceTool = _grupos[grupo]["st"]
	st.set_normal(normal.normalized())
	st.add_vertex(a)
	st.add_vertex(tercero)
	st.add_vertex(segundo)
	var inicio: int = int(_grupos[grupo]["vertices"])
	for i in 3:
		st.add_index(inicio + i)
	_grupos[grupo]["vertices"] = inicio + 3


func _perfil(contorno: PackedVector2Array, fondo: float, at: Vector3,
		grupo: String, base: Basis = Basis.IDENTITY) -> void:


	var indices: PackedInt32Array = Geometry2D.triangulate_polygon(contorno)
	for lado in [-1.0, 1.0]:
		for i in range(0, indices.size(), 3):
			var puntos: Array[Vector3] = []
			for j in 3:
				var q: Vector2 = contorno[indices[i + j]]
				puntos.append(at + base * Vector3(q.x, q.y, lado * fondo * 0.5))
			_triangulo(puntos[0], puntos[1], puntos[2], base * Vector3(0, 0, lado), grupo)
	for i in contorno.size():
		var a: Vector2 = contorno[i]
		var b: Vector2 = contorno[(i + 1) % contorno.size()]
		var p0: Vector3 = at + base * Vector3(a.x, a.y, - fondo * 0.5)
		var p1: Vector3 = at + base * Vector3(b.x, b.y, - fondo * 0.5)
		var p2: Vector3 = at + base * Vector3(b.x, b.y, fondo * 0.5)
		var p3: Vector3 = at + base * Vector3(a.x, a.y, fondo * 0.5)
		var fuera: Vector3 = base * Vector3(b.y - a.y, a.x - b.x, 0)
		_triangulo(p0, p1, p2, fuera, grupo)
		_triangulo(p0, p2, p3, fuera, grupo)


func _construir() -> void:
	_grupo("Bastidor", Color("25303c"), 0.65, 0.4)
	_grupo("Goma", Color("151b24"), 0.94)
	_grupo("Metal", Color("8799a7"), 0.38, 0.7)
	_grupo("Tapizado", Color("923a49"), 0.9)
	_grupo("Costuras", Color("c87c7b"), 0.9)
	_grupo("Luz", Color("57c7b8"), 0.5, 0.0, 0.35)
	_grupo("Cielo", Color("668b9f"), 0.8, 0.0, 0.25)
	_grupo("Campo", Color("4e7868"), 0.9, 0.0, 0.2)
	_grupo("Asfalto", Color("343e4c"), 0.9, 0.0, 0.2)
	_grupo("Marcas", Color("e2dbbd"), 0.9, 0.0, 0.2)
	for id in ["Goma", "Metal", "Tapizado"]:
		var g: Dictionary = _grupos[id]
		_grupo("Volante" + id, g["col"], g["rug"], g["metal"], g["emision"])


	_caja(Vector3(0, 0.06, 0), Vector3(2.36, 0.12, 1.86), "Bastidor")
	for lado in [-1.0, 1.0]:
		_caja(Vector3(lado * 0.43, 0.18, - 0.05), Vector3(0.07, 0.12, 1.52), "Metal")
		_caja(Vector3(lado * 0.85, 0.126, 0), Vector3(0.025, 0.012, 1.6), "Luz")
		_barra(Vector3(lado * 0.43, 0.22, 0.32), Vector3(lado * 0.43, 0.92, 0.29), 0.028, "Bastidor")
		_barra(Vector3(lado * 0.43, 0.22, - 0.05), Vector3(lado * 0.43, 0.72, 0.29), 0.021, "Metal")
	_caja(Vector3(0, 0.91, 0.3), Vector3(0.95, 0.07, 0.21), "Bastidor")
	_caja(Vector3(0, 0.19, 0.76), Vector3(2.02, 0.075, 0.075), "Metal")
	for x in [- 0.72, 0, 0.72]:
		_caja(Vector3(x, 0.145, 0.76), Vector3(0.24, 0.05, 0.16), "Bastidor")
		_caja(Vector3(x, 0.74, 0.76), Vector3(0.045, 1.09, 0.045), "Bastidor")



	var inclinacion := Basis(Vector3.RIGHT, deg_to_rad(-14))
	var espalda := Vector3(0, 0.79, - 0.62)
	_perfil(PackedVector2Array([Vector2(- 0.28, - 0.34), Vector2(0.28, - 0.34),
		Vector2(0.32, 0.16), Vector2(0.36, 0.27), Vector2(0.27, 0.33),
		Vector2(- 0.27, 0.33), Vector2(- 0.36, 0.27), Vector2(- 0.32, 0.16)]), 0.08, espalda, "Goma", inclinacion)
	_perfil(PackedVector2Array([Vector2(- 0.2, - 0.3), Vector2(0.2, - 0.3),
		Vector2(0.22, 0.18), Vector2(- 0.22, 0.18)]), 0.055,
		espalda + inclinacion * Vector3(0, 0, 0.055), "Tapizado", inclinacion)
	for lado in [-1.0, 1.0]:
		_ovalo(espalda + inclinacion * Vector3(lado * 0.273, - 0.04, 0.07),
			Vector3(0.13, 0.57, 0.16), "Tapizado", inclinacion)
		_caja(espalda + inclinacion * Vector3(lado * 0.27, 0.37, 0),
			Vector3(0.075, 0.13, 0.085), "Goma", inclinacion)
		_caja(espalda + inclinacion * Vector3(lado * 0.035, 0.37, 0),
			Vector3(0.03, 0.13, 0.085), "Goma", inclinacion)
		_barra(Vector3(lado * 0.18, 0.46, - 0.65), Vector3(lado * 0.18, 0.46, - 0.14), 0.004, "Costuras")
	_caja(espalda + inclinacion * Vector3(0, 0.45, 0), Vector3(0.59, 0.07, 0.085), "Goma", inclinacion)
	_ovalo(espalda + inclinacion * Vector3(0, 0.447, 0.055), Vector3(0.53, 0.06, 0.065), "Tapizado", inclinacion)
	_caja(Vector3(0, 0.285, - 0.4), Vector3(0.5, 0.09, 0.55), "Bastidor")
	_ovalo(Vector3(0, 0.385, - 0.38), Vector3(0.59, 0.14, 0.61), "Tapizado")
	for lado in [-1.0, 1.0]:
		_ovalo(Vector3(lado * 0.3, 0.44, - 0.38), Vector3(0.12, 0.18, 0.6), "Tapizado")

	_caja(Vector3(0, 0.15, 0.55), Vector3(0.54, 0.06, 0.36), "Bastidor")
	var pedal := Basis(Vector3.RIGHT, deg_to_rad(-32))
	for lado in [-1.0, 1.0]:
		_barra(Vector3(lado * 0.12, 0.18, 0.57), Vector3(lado * 0.12, 0.26, 0.56), 0.014, "Metal")
		_caja(Vector3(lado * 0.12, 0.26, 0.53), Vector3(0.12, 0.025, 0.21), "Metal", pedal)
		for fila in 3:
			_caja(Vector3(lado * 0.12, 0.26, 0.53) + pedal * Vector3(0, 0.014, - 0.064 + fila * 0.064),
				Vector3(0.085, 0.007, 0.012), "Goma", pedal)





	_barra(Vector3(0, 0.92, 0.32), VOLANTE_CENTRO, 0.035, "Metal")
	var aro := TorusMesh.new()
	aro.inner_radius = 0.185
	aro.outer_radius = 0.217
	aro.rings = 32
	aro.ring_segments = 8
	_anadir(aro, Vector3.ZERO, "VolanteGoma")
	_cilindro(Vector3.ZERO, 0.046, 0.06, "VolanteTapizado")
	for i in 3:
		var a: float = TAU * i / 3 + PI * 0.5
		_barra(Vector3(cos(a) * 0.043, 0, sin(a) * 0.043),
			Vector3(cos(a) * 0.19, 0, sin(a) * 0.19), 0.012, "VolanteMetal")
	_caja(Vector3(0.48, 0.57, - 0.06), Vector3(0.13, 0.07, 0.24), "Bastidor")
	_barra(Vector3(0.48, 0.24, - 0.06), Vector3(0.48, 0.57, - 0.06), 0.022, "Metal")
	_barra(Vector3(0.48, 0.59, - 0.06), Vector3(0.48, 0.76, - 0.09), 0.014, "Metal")
	_ovalo(Vector3(0.48, 0.78, - 0.09), Vector3(0.068, 0.065, 0.07), "Tapizado")
	for i in [-1, 0, 1]:
		_monitor(i)



static func marco_monitor(i: int) -> Dictionary:
	return {"centro": Vector3(i * 0.72, 1.29, 0.72 - abs(i) * 0.035),
		"base": Basis(Vector3.UP, deg_to_rad(20 * i)),
		"size": Vector2(0.648, 0.448), "frente": - 0.055}


func _monitor(i: int) -> void:


	var marco: Dictionary = marco_monitor(i)
	var base: Basis = marco["base"]
	var centro: Vector3 = marco["centro"]
	_barra(Vector3(i * 0.72, 1.27, 0.76), centro + base * Vector3(0, - 0.02, 0.0325), 0.019, "Metal")
	_caja(centro, Vector3(0.7, 0.5, 0.065), "Goma", base)
	_caja(centro + base * Vector3(0, 0, - 0.037), Vector3(0.648, 0.448, 0.01), "Cielo", base)
	_caja(centro + base * Vector3(0, - 0.1, - 0.044), Vector3(0.644, 0.242, 0.004), "Campo", base)
	_perfil(PackedVector2Array([Vector2(- 0.26, - 0.22), Vector2(0.26, - 0.22),
		Vector2(0.026, 0.025), Vector2(- 0.026, 0.025)]), 0.003,
		centro + base * Vector3(0, 0, - 0.048), "Asfalto", base)
	for paso in 3:
		var y: float = - 0.184 + paso * 0.072
		var ancho: float = 0.018 - paso * 0.004
		_caja(centro + base * Vector3(0, y, - 0.051), Vector3(ancho, 0.043 - paso * 0.009, 0.002), "Marcas", base)
	_cilindro(centro + base * Vector3(0.283, - 0.232, - 0.039), 0.006, 0.009, "Luz",
		base * Basis(Vector3.RIGHT, PI * 0.5))


func _publicar() -> void:
	var padre: Node = _escena.get("_box_parent")
	if padre == null:
		padre = _escena.get("viewport")
	var muros: Array = _escena.get("_walls")


	var volante_malla := ArrayMesh.new()
	var volante_mats: Array[StandardMaterial3D] = []
	for id: String in _grupos:
		var grupo: Dictionary = _grupos[id]
		var material := StandardMaterial3D.new()
		material.albedo_color = grupo["col"]
		material.roughness = float(grupo["rug"])
		material.metallic = float(grupo["metal"])
		if float(grupo["emision"]) > 0:
			material.emission_enabled = true
			material.emission = material.albedo_color
			material.emission_energy_multiplier = float(grupo["emision"])
		if id.begins_with("Volante"):
			(grupo["st"] as SurfaceTool).commit(volante_malla)
			volante_malla.surface_set_material(volante_malla.get_surface_count() - 1, material)
			volante_mats.append(material)
			continue
		var malla: ArrayMesh =(grupo["st"] as SurfaceTool).commit()
		malla.surface_set_material(0, material)
		var pieza := MeshInstance3D.new()
		pieza.name = "Simulador" + id
		pieza.mesh = malla
		pieza.position = _centro
		padre.add_child(pieza)
		var caja: AABB = pieza.transform * pieza.get_aabb()
		muros.append({"mat": material, "root": padre, "aabb": caja,
			"base": material.albedo_color.a, "a": material.albedo_color.a})
	var volante := MeshInstance3D.new()
	volante.name = "SimuladorVolante"
	volante.mesh = volante_malla
	volante.transform = Transform3D(Basis(Vector3.RIGHT, deg_to_rad(VOLANTE_INCLINACION)),
		_centro + VOLANTE_CENTRO)
	padre.add_child(volante)
	var caja_volante: AABB = volante.transform * volante.get_aabb()
	for material in volante_mats:
		muros.append({"mat": material, "root": padre, "aabb": caja_volante,
			"base": material.albedo_color.a, "a": material.albedo_color.a})






static func girar_volante(volante: Node3D, giro: float) -> void:
	volante.basis = Basis(Vector3.RIGHT, deg_to_rad(VOLANTE_INCLINACION)) \
			* Basis(Vector3.UP, - clampf(giro, -1.0, 1.0) * VOLANTE_TOPE)
