extends RefCounted



const Arte = preload("res://features/stadium/stadium_finish.gd")
const Costura = preload("res://features/stadium/recinto_seams.gd")




static func losa(largo: float, top: Vector2) -> Dictionary:
	var dorso := Vector2(top.x + 2.85, top.y - 1.15)
	var frente := Vector2(top.x + 2.3, -2.0)
	var centro: Vector2 =(dorso + frente) * 0.5
	return {
		"pos": Vector3(0.0, centro.x, centro.y),
		"size": Vector3(largo + 1.0, 0.18,(frente - dorso).length()),
		"pitch": atan2(dorso.x - frente.x, frente.y - dorso.y),
		"low": frente.x - 0.1,
	}


static func tribuna(root: Node3D, largo: float, top: Vector2, piso: int,
		escala: float) -> Array[StandardMaterial3D]:
	var materiales: Array[StandardMaterial3D] = []
	var hormigon: SurfaceTool = Arte._inicio()
	var alto: float = maxf(3.0, top.x)
	var dorso: float = top.y - 1.1
	var ancho: float = maxf(0.4, largo)
	var n: int = maxi(1, ceili(ancho / 7.6))
	var paso: float = ancho / float(n)
	var claro := Color("b5b2a9")
	var sombra := Color("827f78")


	for i in n + 1:
		var x: float = - ancho * 0.5 + float(i) * paso
		Arte._caja(hormigon, Vector3(x, alto * 0.5, dorso - 0.32),
			Vector3(0.64, alto, 0.92), claro)
		_barra(hormigon, Vector3(x, 0.2, dorso - 1.62),
			Vector3(x, alto - 0.22, dorso - 0.16), 0.5, sombra)
		Arte._caja(hormigon, Vector3(x, alto - 0.06, dorso - 0.12),
			Vector3(1.12, 0.38, 1.58), claro.lightened(0.04))
	for fraccion in [0.23, 0.61, 0.985]:
		Arte._caja(hormigon, Vector3(0.0, alto * fraccion, dorso - 0.26),
			Vector3(ancho + 0.12, 0.35, 0.94), claro.darkened(0.1))

	for i in n:
		var centro: float = - ancho * 0.5 +(float(i) + 0.5) * paso
		var y: float = alto * 0.43
		for lado in [-1.0, 1.0]:
			_barra(hormigon, Vector3(centro + lado * paso * 0.35, y - 0.8, dorso - 0.84),
				Vector3(centro, y + 0.76, dorso - 0.84), 0.26, sombra)
	var metal: SurfaceTool = null
	if piso == 1:
		metal = Arte._inicio()
		_palcos(root, hormigon, metal, ancho, materiales)
	elif piso == 2:
		metal = Arte._inicio()
		_cubierta(root, hormigon, metal, ancho, top, escala, materiales)
	var concreto: StandardMaterial3D = _material(0.96)
	Arte._fin(root, hormigon, "HormigonAzteca", concreto)
	materiales.append(concreto)
	if metal != null:
		var hierro: StandardMaterial3D = _material(0.73, 0.22)
		Arte._fin(root, metal, "CerchasAzteca" if piso == 2 else "BastidoresPalcosAzteca", hierro)
		materiales.append(hierro)
	return materiales




static func _palcos(root: Node3D, hormigon: SurfaceTool, metal: SurfaceTool,
		largo: float, materiales: Array[StandardMaterial3D]) -> void:
	var cristales: SurfaceTool = Arte._inicio()
	var cantidad: int = maxi(1, ceili(largo / 4.6))
	var paso: float = largo / float(cantidad)
	var concreto := Color("bbb8ad")
	var marco := Color("596169")


	Arte._caja(hormigon, Vector3(0, -2.72, -2.65),
		Vector3(largo + 0.14, 4.8, 0.16), Color("6f706c"))
	for fila in 4:
		var y: float = -5.15 + float(fila) * 1.6
		Arte._caja(hormigon, Vector3(0, y, -0.97),
			Vector3(largo + 0.22, 0.2, 3.5), concreto)
		Arte._caja(hormigon, Vector3(0, y + 0.09, 0.73),
			Vector3(largo + 0.22, 0.24, 0.24), concreto.lightened(0.07))
	for fila in 3:
		var base: float = -5.15 + float(fila) * 1.6
		Arte._caja(hormigon, Vector3(0, base + 0.38, 0.71),
			Vector3(largo + 0.1, 0.57, 0.18), concreto.darkened(0.1))
		Arte._caja(metal, Vector3(0, base + 0.77, 0.78),
			Vector3(largo + 0.12, 0.065, 0.07), marco)
		Arte._caja(metal, Vector3(0, base + 1.47, 0.12),
			Vector3(largo + 0.04, 0.065, 0.13), marco)
		for i in cantidad:
			var x: float = - largo * 0.5 +(float(i) + 0.5) * paso
			var tinta := Color("53616b") if (i + fila) % 3 == 0 else Color("374751")
			Arte._caja(cristales, Vector3(x, base + 0.87, 0.07),
				Vector3(paso - 0.12, 1.12, 0.07), tinta)

			Arte._caja(cristales, Vector3(x, base + 1.3, 0.112),
				Vector3(paso - 0.19, 0.105, 0.014), tinta.lightened(0.13))
			for dx in [- paso * 0.5 + 0.06, 0.0]:
				Arte._caja(metal, Vector3(x + dx, base + 0.87, 0.13),
					Vector3(0.055, 1.17, 0.075), marco)
			Arte._caja(metal, Vector3(x - paso * 0.5 + 0.06, base + 0.69, 0.78),
				Vector3(0.045, 0.25, 0.06), marco)
	var vidrio: StandardMaterial3D = _material(0.28, 0.3)
	Arte._fin(root, cristales, "PalcosAzteca", vidrio)
	materiales.append(vidrio)




static func _cubierta(root: Node3D, hormigon: SurfaceTool, metal: SurfaceTool,
		largo: float, top: Vector2, escala: float,
		materiales: Array[StandardMaterial3D]) -> void:
	var datos: Dictionary = losa(largo, top)
	var tam: Vector3 = datos["size"]
	var chapa: SurfaceTool = Arte._inicio()
	var gris := Color("adb2b3")
	Arte._caja(chapa, Vector3.ZERO, tam, gris)
	var paneles: int = maxi(1, ceili(largo / 2.6))
	var paso: float = tam.x / float(paneles)
	for i in paneles:
		var x: float = - tam.x * 0.5 +(float(i) + 0.5) * paso
		var tono: Color = gris.lightened(0.04) if i % 3 == 0 else gris.darkened(0.025)
		Arte._caja(chapa, Vector3(x, 0.101, 0),
			Vector3(paso - 0.026, 0.022, tam.z - 0.03), tono)
		Arte._caja(chapa, Vector3(x - paso * 0.5 + 0.012, 0.12, 0),
			Vector3(0.034, 0.04, tam.z - 0.03), gris.lightened(0.1))
	var cubierta: StandardMaterial3D = _material(0.78, 0.16)
	var techo: MeshInstance3D = Arte._fin(root, chapa, "CubiertaAzteca", cubierta)
	techo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	techo.position = datos["pos"]
	techo.rotation.x = float(datos["pitch"])
	materiales.append(cubierta)
	root.set_meta("acabado_cubierta", true)
	var dorso := Vector3(0, top.x + 2.85, top.y - 1.15)
	var frente := Vector3(0, top.x + 2.3, -2.0)
	var cerchas: int = maxi(1, ceili(largo / 7.6))
	var hierro := Color("767e80")
	var espesor: float = 0.15 + clampf(escala, 0.42, 1.3) * 0.05


	var limites_dorso: Vector2 = Costura.limites(root, dorso.z, 0.24)
	var limites_frente: Vector2 = Costura.limites(root, frente.z, 0.24)
	limites_dorso = Vector2(maxf(limites_dorso.x, -(largo + 1.0) * 0.5),
		minf(limites_dorso.y,(largo + 1.0) * 0.5))
	limites_frente = Vector2(maxf(limites_frente.x, - largo * 0.5),
		minf(limites_frente.y, largo * 0.5))
	for i in cerchas + 1:
		var t: float = float(i) / float(cerchas)
		var x_dorso: float = lerpf(limites_dorso.x, limites_dorso.y, t)
		var x_frente: float = lerpf(limites_frente.x, limites_frente.y, t)
		var x: float = x_dorso
		var a: Vector3 = dorso + Vector3(x_dorso, 0.23, 0)
		var b: Vector3 = frente + Vector3(x_frente, 0.23, 0)
		var punta: Vector3 = a.lerp(b, 0.18) + Vector3(0, 1.4, 0)
		_barra(metal, a, b, espesor, hierro)
		_barra(metal, a, punta, espesor, hierro)
		_barra(metal, punta, b, espesor * 0.85, hierro)
		for f in [0.32, 0.57, 0.8]:
			var superior: Vector3 = punta.lerp(b, float(f))
			var inferior: Vector3 = a.lerp(b, 0.18 + float(f) * 0.82)
			_barra(metal, inferior, superior, espesor * 0.56, hierro.lightened(0.08))

		Arte._caja(hormigon, Vector3(x,(top.x + 2.78) * 0.5, top.y - 1.7),
			Vector3(0.52, top.x + 2.78, 0.62), Color("afada5"))
	_barra(metal, dorso + Vector3(limites_dorso.x, 0.22, 0),
		dorso + Vector3(limites_dorso.y, 0.22, 0), 0.2, hierro)
	_barra(metal, frente + Vector3(limites_frente.x, 0.22, 0),
		frente + Vector3(limites_frente.y, 0.22, 0), 0.16, hierro)


	var luminarias: SurfaceTool = Arte._inicio()
	var cantidad: int = maxi(1, ceili(largo / 13.0))
	for i in cantidad:
		var x: float = lerpf(limites_frente.x, limites_frente.y,
			(float(i) + 0.5) / float(cantidad))
		Arte._caja(metal, Vector3(x, frente.y - 0.17, frente.z + 0.1),
			Vector3(1.32, 0.25, 0.62), Color("454d52"))
		Arte._caja(luminarias, Vector3(x, frente.y - 0.2, frente.z + 0.421),
			Vector3(1.12, 0.16, 0.022), Color.WHITE)
	var luz: StandardMaterial3D = _material(0.5)
	luz.albedo_color = Color("c7c7bb")
	luz.emission_enabled = true
	luz.emission = Color("fff0d6")
	luz.emission_energy_multiplier = 0.0
	luz.set_meta("luces_azteca", true)
	Arte._fin(root, luminarias, "ReflectoresAzteca", luz)
	materiales.append(luz)


static func _material(rugosidad: float, metalico: float = 0.0) -> StandardMaterial3D:
	var mat := StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = rugosidad
	mat.metallic = metalico
	return mat



static func _barra(lote: SurfaceTool, inicio: Vector3, fin: Vector3,
		ancho: float, color: Color) -> void:
	var eje: Vector3 = fin - inicio
	if eje.length_squared() < 1e-05:
		return
	var giro: Basis = Basis(Quaternion(Vector3.UP, eje.normalized()))
	var datos: Dictionary = Arte._box_arrays(Vector3(ancho, eje.length(), ancho))
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	var centro: Vector3 =(inicio + fin) * 0.5
	for i in datos["i"]:
		lote.set_normal(giro * normales[i])
		lote.set_color(color)
		lote.add_vertex(centro + giro * vertices[i])
