extends RefCounted



const Arte = preload("res://features/stadium/stadium_finish.gd")


static func boca(parent: Node, frente: float, fondo: float, centro: float,
		medio_ancho: float, altura: float, jamba: float, banda: Color,
		division: int) -> Node3D:
	var root: Node3D = Node3D.new()
	root.name = "EstructuraBocaTunel"
	parent.add_child(root)
	var metal: SurfaceTool = Arte._inicio()
	var juntas: SurfaceTool = Arte._inicio()
	var luz: SurfaceTool = Arte._inicio()
	var claro: Color = Color("a3acae") if division == 1 else Color("8b9592")
	var oscuro: Color = Color("303b41")
	var cara: float = frente + 0.264


	for lado in [-1.0, 1.0]:
		var z: float = centro + lado *(medio_ancho + jamba * 0.5)
		Arte._caja(metal, Vector3(cara, altura * 0.53, z),
			Vector3(0.025, altura * 0.92, jamba * 0.9), claro)
		Arte._caja(juntas, Vector3(cara + 0.014, altura * 0.53, z + lado * jamba * 0.26),
			Vector3(0.01, altura * 0.92 - 0.08, 0.018), oscuro)
		Arte._caja(metal, Vector3(frente + 0.16, altura * 0.53,
			centro + lado *(medio_ancho + jamba * 0.94)),
			Vector3(0.22, altura * 0.92, 0.025), claro.darkened(0.15))
		for y in [0.36, altura * 0.5, altura - 0.15]:
			for dz in [-0.1, 0.1]:
				Arte._caja(juntas, Vector3(cara + 0.02, y, z + dz),
					Vector3(0.008, 0.027, 0.027), claro.darkened(0.42))

		Arte._caja(metal, Vector3(frente + 0.264, 0.22, z),
			Vector3(0.029, 0.29, jamba * 0.98), claro.darkened(0.18))

	Arte._caja(metal, Vector3(cara, altura + jamba * 0.41, centro),
		Vector3(0.028, 0.13,(medio_ancho + jamba * 0.46) * 2.0), claro)
	Arte._caja(juntas, Vector3(cara + 0.017, altura + jamba * 0.19, centro),
		Vector3(0.01, 0.018,(medio_ancho + jamba * 0.46) * 2.0), oscuro)
	Arte._caja(luz, Vector3(frente + 0.19, altura - 0.051, centro),
		Vector3(0.065, 0.012, medio_ancho * 1.76), Color("d1cbb2"))

	var largo: float = absf(frente - fondo)
	var medio: float =(frente + fondo) * 0.5
	for lado in [-1.0, 1.0]:
		Arte._caja(metal, Vector3(medio, altura + jamba + 0.103,
			centro + lado *(medio_ancho + jamba + 0.065)),
			Vector3(largo - 0.12, 0.012, 0.044), claro.darkened(0.15))
	for i in 3:
		var x: float = lerpf(fondo + 0.4, frente - 0.4, float(i) / 2.0)
		Arte._caja(juntas, Vector3(x, altura + jamba + 0.108, centro),
			Vector3(0.016, 0.009,(medio_ancho + jamba) * 2.0), oscuro.lightened(0.12))

	for i in 17:
		var z: float = centro + lerpf(- medio_ancho * 0.9, medio_ancho * 0.9, float(i) / 16.0)
		Arte._caja(juntas, Vector3(frente + 0.22, 0.055, z),
			Vector3(0.055, 0.009, 0.1), oscuro)

	for lado in [-1.0, 1.0]:
		Arte._caja(juntas, Vector3(cara + 0.018, altura * 0.69,
			centro + lado *(medio_ancho + jamba * 0.5)),
			Vector3(0.01, 0.08, jamba * 0.66), banda.lightened(0.08))
	_publicar(root, metal, "PerfilPortal", false)
	_publicar(root, juntas, "JuntasPortal", false)
	_publicar(root, luz, "LuzDintel", true, true)
	return root


static func pasillo(parent: Node, inicio: float, fin: float, centro: float,
		medio_ancho: float, altura: float, division: int) -> Node3D:
	var root: Node3D = Node3D.new()
	root.name = "EstructuraPasilloTunel"
	parent.add_child(root)
	var estructura: SurfaceTool = Arte._inicio()
	var difusores: SurfaceTool = Arte._inicio()
	var luz: SurfaceTool = Arte._inicio()
	var largo: float = absf(fin - inicio)
	var medio: float =(inicio + fin) * 0.5
	var metal: Color = Color("76848b") if division == 1 else Color("636e70")
	var oscuro: Color = Color("283238")


	var modulos: int = maxi(2, int(largo / 1.45))
	var paso: float = largo / float(modulos)
	for lado in [-1.0, 1.0]:
		var z: float = centro + lado * medio_ancho * 0.65
		Arte._caja(estructura, Vector3(medio, altura - 0.078, z),
			Vector3(largo - 0.16, 0.035, 0.17), oscuro)
		for i in modulos:
			var x: float = minf(inicio, fin) + paso *(float(i) + 0.5)
			var longitud: float = paso * 0.66
			Arte._caja(difusores, Vector3(x, altura - 0.104, z),
				Vector3(longitud + 0.055, 0.022, 0.155), metal)
			Arte._caja(luz, Vector3(x, altura - 0.12, z),
				Vector3(longitud, 0.009, 0.08), Color("c4d0c9"))
			for extremo in [-1.0, 1.0]:
				Arte._caja(estructura, Vector3(x + extremo * longitud * 0.44,
					altura - 0.132, z), Vector3(0.017, 0.008, 0.095), oscuro)


	for i in modulos + 1:
		var x: float = minf(inicio, fin) + 0.06 +(largo - 0.12) * float(i) / float(modulos)
		for lado in [-1.0, 1.0]:
			var z: float = centro + lado *(medio_ancho - 0.062)
			Arte._caja(difusores, Vector3(x, altura - 0.46, z),
				Vector3(0.018, 0.53, 0.021), metal.darkened(0.16))
			Arte._caja(estructura, Vector3(x, altura - 0.19,
				centro + lado *(medio_ancho - 0.2)),
				Vector3(0.042, 0.045, 0.28), oscuro)
	_publicar(root, estructura, "CarcasasPasillo", true)
	_publicar(root, difusores, "MarcosPasillo", true)
	_publicar(root, luz, "LuminariasPasillo", true, true)
	return root


static func _publicar(root: Node3D, lote: SurfaceTool, nombre: String,
		sin_sombra: bool, emision: bool = false) -> void:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = 0.76
	if sin_sombra:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if emision:
		mat.emission_enabled = true
		mat.emission = Color("c2c2a5")
		mat.emission_energy_multiplier = 0.12
	Arte._fin(root, lote, nombre, mat)
