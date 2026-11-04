extends "res://ui/shop_car.gd"












var ventanilla: MeshInstance3D = null
var ruedas: Array[Node3D] = []
var _tipo: String = ""


var _hueco: Dictionary = {}
var _u0: float = 0.09
var _u1: float = 0.91
var _baja_dir := Vector3.DOWN
var _baja_max: float = 0.0





const U1: float = 0.91
const MONTANTE_DELANTE: float = 0.065
const V0: float = 0.2
const V1: float = 0.86


const PILAR_B: float = - 0.2


func montar(parent: Node3D, tipo: String = "deportivo", giro: float = -8.0) -> Node3D:

	_tipo = tipo
	var r: Node3D = super.montar(parent, tipo, giro)
	_interior()
	return r


func _panel(p: Array, mat: Material, normal: Vector3, nombre: String) -> void:
	if normal.z < 0.0 and nombre in ["Pilar", "CristalLateral"] and _es_puerta(p):
		if nombre == "Pilar":
			_puerta(p, normal)
		else:
			_cristal(normal)
		return
	super._panel(p, mat, normal, nombre)




func _es_puerta(p: Array) -> bool:
	var c: Array = _p["cabina"]
	var mx: float =((p[0] as Vector3).x +(p[1] as Vector3).x) * 0.5
	return mx >(c[1] as Vector4).x + 0.01 and mx <(c[2] as Vector4).x - 0.01


func _en(u: float, v: float) -> Vector3:
	return _en_panel(_hueco["a0"], _hueco["b0"], _hueco["bt"], _hueco["at"], u, v)


func _tira(u0: float, u1: float, v0: float, v1: float, mat: Material, normal: Vector3, nombre: String) -> void:
	super._panel([_en(u0, v0), _en(u1, v0), _en(u1, v1), _en(u0, v1)], mat, normal, nombre)


func _puerta(p: Array, normal: Vector3) -> void:
	_hueco = {"a0": p[0], "b0": p[1], "bt": p[2], "at": p[3]}
	var a0: Vector3 = p[0]
	var b0: Vector3 = p[1]
	_u0 = 0.09
	if _tipo in ["sedan", "familiar"]:
		_u0 =(PILAR_B + 0.02 - a0.x) /(b0.x - a0.x)
	_u1 = maxf(U1, 1.0 - MONTANTE_DELANTE /(b0.x - a0.x))

	_tira(0.0, 1.0, 0.0, V0, _paint, normal, "Pilar")
	_tira(0.0, 1.0, V1, 1.0, _paint, normal, "Pilar")
	_tira(0.0, _u0, V0, V1, _paint, normal, "Pilar")
	_tira(_u1, 1.0, V0, V1, _paint, normal, "Pilar")


func _cristal(normal: Vector3) -> void:
	var lado: float = signf(normal.z)
	var a0: Vector3 = _hueco["a0"]
	var b0: Vector3 = _hueco["b0"]
	if _tipo in ["sedan", "familiar"]:

		var fuera := Vector3(0, 0.012, lado * 0.015)
		var u_fin: float =(PILAR_B - 0.02 - a0.x) /(b0.x - a0.x)
		super._panel([_en(0.09, V0) + fuera, _en(u_fin, V0) + fuera,
			_en(u_fin, V1) + fuera, _en(0.09, V1) + fuera], _glass, normal, "CristalTrasero")


	var dentro := Vector3(0, 0, - lado * 0.02)
	var q: Array = [_en(_u0 - 0.02, V0 - 0.05) + dentro, _en(_u1 + 0.02, V0 - 0.05) + dentro,
		_en(_u1 + 0.02, V1 + 0.02) + dentro, _en(_u0 - 0.02, V1 + 0.02) + dentro]
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	_quad(st, q[0], q[1], q[2], q[3], normal)
	ventanilla = _mesh(st.commit(), _glass, "Ventanilla")


	var at: Vector3 = _hueco["at"]
	_baja_dir =(a0 - at).normalized()
	_baja_max =(V1 - V0 + 0.08) * a0.distance_to(at)



func bajar(k: float) -> void:
	if ventanilla != null:
		ventanilla.position = _baja_dir * _baja_max * clampf(k, 0.0, 1.0)


func _rueda(x: float, lado: float, tipo: String) -> void:
	var antes: int = _root.get_child_count()
	super._rueda(x, lado, tipo)
	var nuevas: Array[Node] = _root.get_children().slice(antes)
	var eje := Node3D.new()
	eje.name = "Eje"
	eje.position = Vector3(x, 0.51,(_seccion(x).x - 0.035) * lado)
	_root.add_child(eje)
	for n in nuevas:
		var pieza: Node3D = n
		_root.remove_child(pieza)
		eje.add_child(pieza)
		pieza.position -= eje.position
	ruedas.append(eje)



func rodar(dist: float) -> void:
	var r: float = float(_p["rueda"])
	for eje in ruedas:
		eje.rotation.z = - dist / r


func radio_rueda() -> float:
	return float(_p["rueda"])


func _interior() -> void:
	var c: Array = _p["cabina"]
	var c1: Vector4 = c[1]
	var c2: Vector4 = c[2]
	var negro := StandardMaterial3D.new()
	negro.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	negro.albedo_color = Color("0b0d11")

	negro.cull_mode = BaseMaterial3D.CULL_FRONT


	var suelo: float =(_hueco["a0"] as Vector3).y + 0.03 if not _hueco.is_empty() else 0.95
	var techo: float = minf(c1.y, c2.y) - 0.06
	var medio: float = minf(c1.z, c2.z) - 0.04
	_box(Vector3(c2.x - c1.x - 0.04, techo - suelo, medio * 2.0),
		Vector3((c1.x + c2.x) * 0.5,(techo + suelo) * 0.5, 0), negro, "Habitaculo")
	var tapiz := StandardMaterial3D.new()
	tapiz.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	tapiz.albedo_color = Color("24272c")
	var hx: float = hueco_x()


	var cabeza: float = minf(0.17,(techo - suelo) * 0.3)
	var tope: float = techo - 0.04
	var respaldo: float = maxf(0.1, tope - cabeza - 0.03 - suelo)
	_box(Vector3(0.1, respaldo, 0.42), Vector3(hx - 0.3, suelo + respaldo * 0.5, - 0.36), tapiz, "Respaldo")
	_box(Vector3(0.08, cabeza, 0.24), Vector3(hx - 0.32, tope - cabeza * 0.5, - 0.36), tapiz, "Reposacabezas")



func hueco_x() -> float:
	if _hueco.is_empty():
		return 0.0
	return _en((_u0 + _u1) * 0.5, 0.5).x


func hueco_arriba() -> float:
	return _en((_u0 + _u1) * 0.5, V1).y if not _hueco.is_empty() else 1.4


func hueco_abajo() -> float:
	return _en((_u0 + _u1) * 0.5, V0).y if not _hueco.is_empty() else 1.0



func hueco_z() -> float:
	return _en((_u0 + _u1) * 0.5,(V0 + V1) * 0.5).z if not _hueco.is_empty() else - 0.7
