extends Node3D


const Rincon := preload("res://ui/house/rincon.gd")
const RADIO: float = 0.17
var casa: Node
var plano: Dictionary = {}
var companeros: Array = []
var rumbo: Vector2 = Vector2(0, -1)
var recorrido: float = 0
var giro: int = 0
var _tramo: float = 0

func dibujar() -> void:
	for d in [[0.15, 0.105, 0.065, Color("303841")], [0.14, 0.02, 0.125, Color("c8c4ba")],
		[0.038, 0.035, 0.153, Color("303841")]]:
		var m := MeshInstance3D.new()
		var disco := CylinderMesh.new()
		disco.top_radius = d[0]
		disco.bottom_radius = d[0]
		disco.height = d[1]
		disco.radial_segments = 24
		m.mesh = disco
		m.material_override = Rincon.mat(d[3])
		m.position.y = d[2]
		add_child(m)
	Rincon.caja(self, Vector3(0, 0.141, - 0.065), Vector3(0.04, 0.012, 0.015), Color("79dae8"))
	for x in [- 0.08, 0.08]:
		Rincon.caja(self, Vector3(x, 0.03, 0.03), Vector3(0.035, 0.045, 0.11), Color("171b20"))
	for i in 3:
		var cepillo: MeshInstance3D = Rincon.caja(self, Vector3(0.1, 0.015, - 0.08), Vector3(0.09, 0.01, 0.008), Color("171b20"))
		cepillo.rotation.y = i * TAU / 3

static func activar_casa(escena: Node) -> void:
	var muebles: Node = escena.get("_muebles")
	if not is_instance_valid(muebles) or bool(escena.get("museo")): return
	var robots: Array = []
	for n in muebles.find_children("*", "Node3D", true, false):
		if n.get_script() == load("res://ui/house/robot_casa.gd"): robots.append(n)
	for robot in robots:
		robot.casa = escena
		robot.companeros = robots
		var fuente: Dictionary = escena.call("_plano")
		robot.plano = fuente.duplicate()
		var props: Array = []
		for p: Dictionary in fuente.get("props", []):
			if String(p.get("id", "")) != String(robot.get_meta("prop_id")): props.append(p)

		var base: Vector3 = robot.global_position + robot.global_basis * Vector3(0, 0, 0.26)
		var tam: Vector3 =(robot.global_basis * Vector3(0.4, 0, 0.08)).abs()
		props.append({"id": "base_robot", "kind": "base_robot", "rect": Rect2(Vector2(base.x - tam.x * 0.5, base.z - tam.z * 0.5), Vector2(tam.x, tam.z))})
		robot.plano["props"] = props
		var frente: Vector3 = robot.global_basis * Vector3.FORWARD
		robot.rumbo = Vector2(frente.x, frente.z)

func _process(dt: float) -> void:
	if not is_instance_valid(casa) or bool(casa.get("_grid_on")): return
	var muebles: Node = casa.get("_muebles")
	if not is_instance_valid(muebles) or not muebles.is_ancestor_of(self): return
	avanzar(dt)

func avanzar(dt: float) -> void:
	if plano.is_empty() or not is_finite(dt) or dt <= 0: return
	var antes := Vector2(global_position.x, global_position.z)
	var paso: Vector2 = rumbo * minf(dt, 0.08) * 0.38
	var siguiente: Vector2 = House.plan_move(plano, antes, paso, RADIO, Career.house_extras)
	var obstaculo: bool = siguiente.distance_to(antes + paso) > 0.001
	if is_instance_valid(casa):
		obstaculo = obstaculo or siguiente.distance_to(casa.get("_pos")) < RADIO + House.BODY_R + 0.08
		for pet: Dictionary in casa.get("_pets"):
			if siguiente.distance_to(pet["pos"]) < 0.37: obstaculo = true
	for otro in companeros:
		if otro != self and is_instance_valid(otro):
			var at: Vector2 = Vector2(otro.global_position.x, otro.global_position.z)


			if siguiente.distance_to(at) < 0.38 and siguiente.distance_to(at) <= antes.distance_to(at):
				obstaculo = true
	if obstaculo or _tramo > 6:
		giro += 1
		rumbo = rumbo.rotated(PI * 0.5 if giro % 3 else PI * 0.73)
		_tramo = 0
		return
	global_position = Vector3(siguiente.x, 0, siguiente.y)
	global_rotation.y = atan2(- rumbo.x, - rumbo.y)
	var distancia: float = siguiente.distance_to(antes)
	recorrido += distancia
	_tramo += distancia
