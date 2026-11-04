extends RefCounted


const Arte = preload("res://features/stadium/stadium_finish.gd")
var superficies: Array[Dictionary] = []
var agua: Array[MeshInstance3D] = []

static func perfil(club: String, origen: int, construida: int, cercana: bool) -> Dictionary:
	return {"familia": posmod(hash(club + "_tribuna"), 3),
		"ampliada": origen > 0 and construida > 0 and construida < origen and cercana}

func material(mat: StandardMaterial3D) -> void:
	superficies.append({"mat": mat, "color": mat.albedo_color, "rough": mat.roughness})

func tribuna(root: Node3D, largo: float, top: Vector2, division: int,
		club: String, origen: int, color: Color, especial: bool,
		muro: StandardMaterial3D, butacas: StandardMaterial3D) -> void:
	var cercana: bool = root.position.z < 0.0 and absf(root.position.x) < 20.0
	var p: Dictionary = perfil(club, origen, division, cercana)
	root.set_meta("caracter_recinto", p)


	if bool(p["ampliada"]) and not bool(root.get_meta("obra", false)) and not especial:
		muro.albedo_color = muro.albedo_color.lightened(0.22)
		butacas.albedo_color = Color("e5eef4")
		var junta: SurfaceTool = Arte._inicio()
		for x in [- largo * 0.5 + 0.18, largo * 0.5 - 0.18]:
			Arte._caja(junta, Vector3(x, 1.08, 1.008), Vector3(0.16, 2.14, 0.03), Color("56616a"))
		Arte._fin(root, junta, "JuntasAmpliacion")
	elif not especial:

		var edad: float = 0.055 if cercana else 0.12
		muro.albedo_color = muro.albedo_color.lerp(Color("959084"), edad)
		butacas.albedo_color = Color.WHITE.darkened(edad * 0.65)
	material(muro)


	if not cercana or largo < 40.0 or especial or bool(root.get_meta("obra", false)):
		return
	var lote: SurfaceTool = Arte._inicio()
	var tinta: Color = color.lerp(Color("a8aaa0"), 0.42)
	var base: float = top.x - 0.04
	var z: float = top.y - 0.62
	var familia: int = int(p["familia"])
	if familia == 0:

		for i in 5:
			var h: float = 1.25 +(2 - absi(i - 2)) * 0.38
			Arte._caja(lote, Vector3((i - 2) * 3.6, base + h * 0.5, z),
				Vector3(3.6, h, 0.5), tinta)
	elif familia == 1:

		for i in 9:
			Arte._caja(lote, Vector3((i - 4) * 3.1, base + 0.93, z),
				Vector3(1.7, 1.86 if i % 2 == 0 else 1.25, 0.5), tinta)
	else:

		for lado in [-1.0, 1.0]:
			Arte._caja(lote, Vector3(lado * largo * 0.33, base + 1.0, z),
				Vector3(2.1, 2.0, 0.65), tinta)
		Arte._caja(lote, Vector3(0, base + 0.65, z), Vector3(largo * 0.65, 1.3, 0.45), tinta)
	var pieza: MeshInstance3D = Arte._fin(root, lote, "RemateHistorico")
	material(pieza.material_override)

func coronacion(root: Node3D, largo: float, front: Vector2, club: String,
		color: Color, especial: bool) -> void:


	if especial or largo < 40.0 or root.position.z >= 0.0 \
			or absf(root.position.x) >= 20.0 or bool(root.get_meta("obra", false)):
		return
	var lote: SurfaceTool = Arte._inicio()
	var familia: int = int(perfil(club, 1, 1, true)["familia"])
	var tinta: Color = color.lerp(Color("aab1b7"), 0.3)
	for i in 7:
		var alto: float = 0.35
		if familia == 0:
			alto += float(3 - absi(i - 3)) * 0.28
		elif familia == 1:
			alto += 0.65 if i % 2 == 0 else 0.0
		else:
			alto += 0.8 if i == 0 or i == 6 else 0.15
		Arte._caja(lote, Vector3((i - 3) * 3.0, front.x + 0.22 + alto * 0.5, front.y - 0.15),
			Vector3(3.0, alto, 0.32), tinta)
	var pieza: MeshInstance3D = Arte._fin(root, lote, "FirmaTribuna")
	material(pieza.material_override)

func cubierta(root: Node3D, largo: float, back: Vector2, front: Vector2) -> void:


	var lote: SurfaceTool = Arte._inicio()
	for lado in [-1.0, 1.0]:
		var x: float = lado * maxf(0.5, largo * 0.5 - 0.64)
		var centro := Vector3(x, 0.035, back.y - 1.45)
		for i in 12:
			var a: float = TAU * float(i) / 12.0
			var b: float = TAU * float(i + 1) / 12.0
			lote.set_normal(Vector3.UP)
			lote.add_vertex(centro)
			lote.set_normal(Vector3.UP)
			lote.add_vertex(centro + Vector3(cos(b) *(1.4 + 0.12 * sin(b * 3)), 0, sin(b) * 0.8))
			lote.set_normal(Vector3.UP)
			lote.add_vertex(centro + Vector3(cos(a) *(1.4 + 0.12 * sin(a * 3)), 0, sin(a) * 0.8))
	var mat := StandardMaterial3D.new()
	mat.albedo_color = Color("53656c")
	mat.roughness = 0.22
	mat.metallic = 0.0
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = Color("354650")
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	var charcos: MeshInstance3D = Arte._fin(root, lote, "CharcosBajantes", mat)
	charcos.visible = false
	agua.append(charcos)


	var goteo: SurfaceTool = Arte._inicio()
	for i in 12:
		var x: float = lerpf(- largo * 0.47, largo * 0.47, float(i) / 11.0)
		Arte._caja(goteo, Vector3(x, front.x - 0.14, front.y + 0.38),
			Vector3(0.055, 0.34 + float(i % 3) * 0.12, 0.025), Color.WHITE)
	var gm := ShaderMaterial.new()
	gm.shader = preload("res://features/stadium/roof_runoff.gdshader")
	var gotas: MeshInstance3D = Arte._fin(root, goteo, "EscurrimientoCubierta")
	gotas.material_override = gm
	gotas.visible = false
	agua.append(gotas)

func clima(lluvia: bool, nivel: int) -> void:
	var intensidad: float = [0.28, 0.44, 0.58][clampi(nivel, 0, 2)] if lluvia else 0.0
	for s in superficies:
		var mat: StandardMaterial3D = s["mat"]
		var tono: Color =(s["color"] as Color).darkened(intensidad)
		tono.a = mat.albedo_color.a
		mat.albedo_color = tono
		mat.roughness = lerpf(float(s["rough"]), 0.48, intensidad)
	for pieza in agua:
		pieza.visible = lluvia
