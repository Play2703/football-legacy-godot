extends "res://ui/house/casa_lote_props.gd"


const MEDIDAS_P: Dictionary = {"sofa_penthouse": Vector2(3, 1.5),
	"comedor_penthouse": Vector2(3, 2), "cama_penthouse": Vector2(3, 2.5),
	"robot_aspirador": Vector2(0.5, 0.5), "espejo_inteligente": Vector2(1, 0.5),
	"mesa_holografica": Vector2(2, 1.5)}
const NOGAL: Color = Color("49372e")
const PIEL: Color = Color("dbcfb6")
const LATON: Color = Color("b79c62")
const NEGRO: Color = Color("222a31")
const LUZ: Color = Color("79dae8")

static func pintar_penthouse(escena: Object, kind: String, r: Rect2, _col: Color, prop: Dictionary = {}) -> void:
	var p = load("res://ui/house/penthouse_props.gd").new()
	p._escena = escena
	p._centro = Vector3(r.get_center().x, 0, r.get_center().y)
	var tam: Vector2 = MEDIDAS_P[kind]

	if r.size.x < r.size.y:
		p._giro = Basis(Vector3.UP, PI * 0.5)
		p._escala = Vector3(r.size.y / tam.x, 1, r.size.x / tam.y)
	else: p._escala = Vector3(r.size.x / tam.x, 1, r.size.y / tam.y)
	p._fundir = true
	match kind:
		"sofa_penthouse": p._sofa()
		"comedor_penthouse": p._comedor()
		"cama_penthouse": p._cama()
		"robot_aspirador": p._robot(prop)
		"espejo_inteligente": p._espejo()
		"mesa_holografica": p._mesa()
	p._registrar_redondos()

func _brilla(m: MeshInstance3D, color: Color) -> void:
	var mat: StandardMaterial3D = m.mesh.material
	mat.emission_enabled = true
	mat.emission = color
	mat.emission_energy_multiplier = 0.65

func _sofa() -> void:


	var medida: Vector3 =(_giro *(Vector3(3, 0, 1.5) * _escala)).abs()
	var tam: Vector2 = Vector2(medida.x, medida.z)
	var r: Rect2 = Rect2(Vector2(_centro.x, _centro.z) - tam * 0.5, tam)
	preload("res://ui/house/descanso_pulido.gd").pintar(_escena,
		"sofa_penthouse", r, PIEL, House.prop_alto("sofa_penthouse"))

func _comedor() -> void:
	for x in [- 0.72, 0.72]:
		_caja(Vector3(x, 0.35, 0), Vector3(0.11, 0.7, 0.72), LATON)
	_caja(Vector3(0, 0.76, 0), Vector3(2.72, 0.12, 0.93), NEGRO)

	for x in [- 0.9, - 0.15, 0.67]:
		_barra(Vector3(x - 0.16, 0.826, - 0.43), Vector3(x + 0.12, 0.826, 0.43), 0.009, Color("76807e"))
	for lado in [-1, 1]:
		for x in [- 0.9, 0, 0.9]:
			var z: float = lado * 0.73
			for dx in [- 0.15, 0.15]:
				for dz in [- 0.13, 0.13]: _cilindro(Vector3(x + dx, 0.22, z + dz), 0.02, 0.02, 0.44, LATON)
			_caja(Vector3(x, 0.46, z), Vector3(0.46, 0.1, 0.4), PIEL)
			_caja(Vector3(x, 0.75, z + lado * 0.18), Vector3(0.46, 0.49, 0.075), PIEL)
	_cilindro(Vector3(0, 0.89, 0), 0.06, 0.09, 0.13, LATON)
	_ovalo(Vector3(0, 0.99, 0), Vector3(0.18, 0.12, 0.18), PIEL)

func _cama() -> void:
	_caja(Vector3(0, 0.15, 0), Vector3(1.5, 0.3, 1.5), NEGRO)
	_caja(Vector3(0, 0.34, 0), Vector3(2.28, 0.15, 2.2), NOGAL)
	_caja(Vector3(0, 0.48, - 0.04), Vector3(2.2, 0.22, 2.08), PIEL)
	_caja(Vector3(0, 0.605, - 0.3), Vector3(2.18, 0.04, 1.5), PIEL.lightened(0.08))
	_caja(Vector3(0, 0.64, - 0.73), Vector3(2.2, 0.035, 0.55), NOGAL.lightened(0.22))
	_caja(Vector3(0, 0.85, 1.14), Vector3(2.82, 0.85, 0.15), NOGAL)
	for x in [- 0.7, 0, 0.7]: _caja(Vector3(x, 0.94, 1.048), Vector3(0.67, 0.59, 0.06), PIEL)
	_brilla(_caja(Vector3(0, 1.285, 1.08), Vector3(2.76, 0.02, 0.04), LATON), LATON)
	for x in [- 0.55, 0.55]: _ovalo(Vector3(x, 0.66, 0.66), Vector3(0.84, 0.17, 0.43), PIEL.lightened(0.1))
	for x in [-1.32, 1.32]:
		_caja(Vector3(x, 0.35, 0.75), Vector3(0.3, 0.46, 0.55), NOGAL)
		_caja(Vector3(x, 0.59, 0.75), Vector3(0.31, 0.04, 0.55), NEGRO)
		_cilindro(Vector3(x, 0.66, 0.75), 0.07, 0.07, 0.1, LATON)

func _espejo() -> void:
	_caja(Vector3(0, 0.05, 0), Vector3(0.86, 0.1, 0.45), NEGRO)
	_caja(Vector3(0, 1.02, 0.08), Vector3(0.74, 1.82, 0.085), LATON)
	_caja(Vector3(0, 1.04, 0.025), Vector3(0.65, 1.68, 0.025), Color("78919a"))
	for x in [- 0.32, 0.32]: _brilla(_caja(Vector3(x, 1.04, 0.008), Vector3(0.016, 1.65, 0.016), LUZ), LUZ)
	_caja(Vector3(0, 0.65, 0), Vector3(0.51, 0.4, 0.016), NEGRO)
	for i in 3: _brilla(_caja(Vector3(- 0.035, 0.77 - i * 0.1, - 0.012), Vector3(0.33 - i * 0.05, 0.024, 0.01), LUZ), LUZ)
	_cilindro(Vector3(0, 0.13, 0.08), 0.11, 0.11, 0.18, NEGRO)

func _mesa() -> void:
	_caja(Vector3(0, 0.35, 0), Vector3(1.16, 0.7, 0.76), NEGRO)
	for x in [- 0.59, 0.59]: _caja(Vector3(x, 0.4, 0), Vector3(0.025, 0.58, 0.78), LATON)
	_caja(Vector3(0, 0.77, 0), Vector3(1.96, 0.16, 1.42), NOGAL)
	_caja(Vector3(0, 0.865, 0), Vector3(1.79, 0.025, 1.24), NEGRO)
	for x in [- 0.86, 0.86]: _brilla(_caja(Vector3(x, 0.89, 0), Vector3(0.018, 0.014, 1.15), LUZ), LUZ)
	for z in [- 0.57, 0, 0.57]: _brilla(_caja(Vector3(0, 0.89, z), Vector3(1.73, 0.014, 0.018), LUZ), LUZ)
	for at: Vector3 in preload("res://features/career/penthouse.gd").posiciones("4-3-3"):
		var x: float = at.x * 0.46
		var z: float = at.z * 0.19
		_brilla(_cilindro(Vector3(x, 1.0, z), 0.028, 0.04, 0.2, LUZ), LUZ)
		_brilla(_ovalo(Vector3(x, 1.13, z), Vector3(0.09, 0.09, 0.09), LUZ), LUZ)

func _robot(prop: Dictionary) -> void:
	_caja(Vector3(0, 0.12, 0.2), Vector3(0.4, 0.24, 0.08), NEGRO)
	_brilla(_caja(Vector3(0, 0.19, 0.152), Vector3(0.13, 0.016, 0.009), LUZ), LUZ)
	var robot: Node3D = load("res://ui/house/robot_casa.gd").new()
	robot.name = "RobotAspirador"
	robot.set_meta("prop_id", String(prop.get("id", "")))
	var padre: Node = _escena.get("_box_parent")
	if padre == null: padre = _escena.get("viewport")
	padre.add_child(robot)
	robot.position = _punto(Vector3(0, 0, - 0.06))
	robot.basis = _giro
	robot.call("dibujar")
