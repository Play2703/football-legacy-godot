extends RefCounted


var escena: Object
var centro: Vector3
var medidas_reales := false
const ESCALA := Vector3(14.0 / 12.0, 1, 18.0 / 14.0)









static func pavimento(host: Object, r: Rect2, lateral: bool, calle: Callable = Callable(),
		corte: float = - INF) -> void:
	var c: Vector2 = r.get_center()
	var col := Color("b2aea2") if lateral else Color("727b83")

	if lateral:
		var piso: MeshInstance3D = host.call("_add_box", Vector3(c.x, - 0.025, c.y),
			Vector3(r.size.x, 0.086, r.size.y), col, 2)
		piso.name = "PasoCasaCochera"
		for z in [r.position.y + 0.055, r.end.y - 0.055]:
			host.call("_add_box", Vector3(c.x, 0.024, z), Vector3(r.size.x, 0.012, 0.08), Color("dedbd1"), 2)
		var x: float = r.position.x + 0.5
		while x < r.end.x:
			host.call("_add_box", Vector3(x, 0.02, c.y), Vector3(0.015, 0.003, r.size.y - 0.18), Color("85877f"), 2)
			x += 0.5
		return
	var luz: Callable = calle
	if not luz.is_valid():
		luz = func(k: Color) -> Color: return k
	var cz: float = clampf(corte, r.position.y, r.end.y) if calle.is_valid() else r.position.y
	var tramos: Array[Rect2] = []
	if cz > r.position.y + 0.001:
		tramos.append(Rect2(r.position.x, r.position.y, r.size.x, cz - r.position.y))
	if cz < r.end.y - 0.001:
		tramos.append(Rect2(r.position.x, cz, r.size.x, r.end.y - cz))
	for t in tramos:
		var de_calle: bool = t.position.y < cz
		var tc: Vector2 = t.get_center()
		var piso: MeshInstance3D = host.call("_add_box", Vector3(tc.x, - 0.025, tc.y),
			Vector3(t.size.x, 0.086, t.size.y), luz.call(col) if de_calle else col, 2)
		piso.name = "EntradaCocheraCalle" if t.position.y <= r.position.y + 0.001 else "EntradaCocheraCasa"
		var borde := Color("dedbd1")
		for x in [r.position.x + 0.055, r.end.x - 0.055]:
			host.call("_add_box", Vector3(x, 0.024, tc.y), Vector3(0.08, 0.012, t.size.y),
				luz.call(borde) if de_calle else borde, 2)
	var junta := Color("515b62")
	var partida: bool = cz > r.position.y + 0.001 and cz < r.end.y - 0.001
	if partida:
		host.call("_add_box", Vector3(c.x, 0.02, cz), Vector3(r.size.x - 0.18, 0.003, 0.018), junta, 2)
	var z: float = r.position.y + 1.0
	while z < r.end.y:

		if not (partida and absf(z - cz) < 0.4):
			host.call("_add_box", Vector3(c.x, 0.02, z), Vector3(r.size.x - 0.18, 0.003, 0.018),
				luz.call(junta) if z < cz else junta, 2)
		z += 1.5

static func pintar(host: Object, r: Rect2) -> void:
	var arte = load("res://ui/house/cochera_props.gd").new()
	arte.escena = host
	arte.centro = Vector3(r.get_center().x, 0, r.get_center().y)
	arte.construir(r)

func caja(p: Vector3, tam: Vector3, col: Color, bloque: int = 0) -> MeshInstance3D:


	if not medidas_reales:
		p *= ESCALA
		tam *= ESCALA
	return escena.call("_add_box", centro + p, tam, col, bloque)


func acabado(p: Vector3, tam: Vector3, col: Color, metal: float = 0.0,
		brillo: bool = false, bloque: int = 1) -> MeshInstance3D:
	var pieza := caja(p, tam, col, bloque)
	var mat: StandardMaterial3D = pieza.mesh.material
	mat.roughness = 0.32 if metal > 0 else 0.72
	mat.metallic = metal
	if brillo:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = 0.65
		pieza.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	return pieza

func construir(r: Rect2) -> void:
	var marfil := Color("dedbd1")
	var grafito := Color("26303a")
	var metal := Color("647584")
	var luz := Color("e5f3fb")
	var oro := Color("c3aa6b")
	var frentes: Array = []
	caja(Vector3(0, - 0.025, 0), Vector3(12, 0.07, 14), Color("9aa2a5"), 2)


	caja(Vector3(0, 0.0155, 0), Vector3(2.3, 0.006, 13.6), Color("c1c2b9"), 2)

	for z in [-5.25, -3.5, -1.75, 0, 1.75, 3.5, 5.25]:
		caja(Vector3(0, 0.018, z), Vector3(11.6, 0.004, 0.018), metal, 2)
	for x in [-1.2, 1.2]:
		caja(Vector3(x, 0.026, 0), Vector3(0.025, 0.009, 13.6), oro, 2)
	medidas_reales = true
	for rect in preload("res://features/career/cochera.gd").MUROS:
		var c: Vector2 = rect.get_center()
		var frontal: bool = rect.position.y < -8.9 and rect.size.x > 1


		var retranqueo: float = 0.03 if frontal else 0.0
		var piezas: Array = [
			caja(Vector3(c.x, 1.1, c.y + retranqueo), Vector3(rect.size.x, 2.2, rect.size.y - retranqueo * 2), marfil, 1),
			caja(Vector3(c.x, 0.16, c.y), Vector3(rect.size.x, 0.28, rect.size.y), grafito, 1),
			caja(Vector3(c.x, 2.17, c.y), Vector3(rect.size.x, 0.06, rect.size.y), metal, 1)]
		if frontal:
			frentes.append_array(piezas)
	medidas_reales = false
	_detalle_perimetro(frentes)
	medidas_reales = true
	for i in 8:
		var plaza: Rect2 = preload("res://features/career/cochera.gd").plaza_local(i)
		var c: Vector2 = plaza.get_center()
		acabado(Vector3(c.x, 0.023, c.y), Vector3(5.5, 0.01, 3.0), Color("343e49"), 0.12, false, 2)
		for z in [-1.5, 1.5]:
			caja(Vector3(c.x, 0.034, c.y + z), Vector3(5.5, 0.008, 0.035), oro, 2)


		for x in [-2.73, 2.73]:
			caja(Vector3(c.x + x, 0.034, c.y), Vector3(0.025, 0.008, 3), oro, 2)
			for z in [-1.42, 1.42]:
				acabado(Vector3(c.x + x * 0.93, 0.043, c.y + z), Vector3(0.34, 0.009, 0.055), luz, 0, true, 2)
		var placa := Label3D.new()
		placa.text = "%02d" %(i + 1)
		placa.font_size = 64
		placa.pixel_size = 0.007
		placa.modulate = oro
		placa.outline_size = 0
		placa.rotation_degrees = Vector3(-90, 180, 0)
		placa.position = centro + Vector3(c.x, 0.046, c.y - 1.43)
		(escena.get("_box_parent") as Node).add_child(placa)
		var lado: float = -6.67 if i % 2 == 0 else 6.67
		if lado > 0 and absf(c.y) < 3:
			continue
		caja(Vector3(lado, 1.36, c.y), Vector3(0.06, 0.55, 2.9), grafito, 1)
		acabado(Vector3(lado, 2.02, c.y), Vector3(0.08, 0.05, 2.7), luz, 0, true)



	for z in [-1.04, 1.04]:
		caja(Vector3(6.87, 1.04, z), Vector3(0.24, 2.08, 0.08), grafito, 1)
	var dintel := caja(Vector3(6.87, 2.12, 0), Vector3(0.24, 0.16, 2.16), grafito, 1)
	dintel.name = "PuertaLateralCochera"
	caja(Vector3(6.74, 1.02, 2.04), Vector3(0.05, 2.04, 1.96), metal, 1)
	caja(Vector3(6.7, 1.25, 2.04), Vector3(0.025, 1.2, 1.72), Color("88a9b5"), 1)
	caja(Vector3(6.67, 1.03, 1.23), Vector3(0.05, 0.28, 0.04), grafito, 1)
	caja(Vector3(6.87, 2.22, 1.02), Vector3(0.16, 0.06, 4.2), metal, 1)

	caja(Vector3(6.67, 1.12, -1.22), Vector3(0.06, 0.25, 0.15), grafito, 1)
	acabado(Vector3(6.632, 1.17, -1.22), Vector3(0.012, 0.055, 0.07), luz, 0, true)
	acabado(Vector3(6.88, 0.025, 0), Vector3(0.24, 0.015, 1.98), metal, 0.65, false, 2)
	medidas_reales = false

	for x in [-3.0, 3.0]:
		caja(Vector3(x, 1.4, 6.65), Vector3(3, 0.62, 0.16), grafito, 1)
		caja(Vector3(x, 1.76, 6.55), Vector3(3, 0.04, 0.05), oro, 1)
		for dx in [- 0.8, 0, 0.8]:
			caja(Vector3(x + dx, 1.4, 6.55), Vector3(0.035, 0.36, 0.03), metal, 1)
	_detalle_fondo()
	for x in [-1.54, 1.54]:
		caja(Vector3(x, 1.03, -6.86), Vector3(0.08, 2.06, 0.12), grafito, 1)
	var antes: Node3D = escena.get("_box_parent")
	var padre: Node = antes if antes != null else escena.get("viewport")
	var techo := Node3D.new()
	techo.name = "CubiertaCochera"
	padre.add_child(techo)
	escena.set("_box_parent", techo)
	_cubierta()
	escena.set("_box_parent", antes)


	var porton := Node3D.new()
	porton.name = "PortonAutomaticoCochera"
	padre.add_child(porton)
	porton.position = centro + Vector3(0, 2.12, -8.92)
	escena.set("_box_parent", porton)
	var centro_guardado: Vector3 = centro
	centro = Vector3.ZERO
	medidas_reales = true
	for i in 12:
		acabado(Vector3(0, - 0.1 - i * 0.172, 0), Vector3(3.44, 0.164, 0.075), metal, 0.55, false, 2)
	acabado(Vector3(0, -2.045, - 0.015), Vector3(3.44, 0.055, 0.09), grafito, 0.2, false, 2)
	centro = centro_guardado
	escena.set("_box_parent", antes)
	(escena.get("_cocheras") as Array).append({"techo": techo, "padre": antes, "rect": r,
		"frentes": frentes, "porton": porton, "apertura": 0.0, "abrir": false})

func _detalle_perimetro(frentes: Array) -> void:
	var grafito := Color("26303a")
	var metal := Color("647584")
	var madera := Color("aa8158")
	var calida := Color("ffe5b5")

	for x in [-5.76, 5.76]:
		for z in [-6.7, -3.5, 3.5, 6.6]:
			acabado(Vector3(x, 1.1, z), Vector3(0.06, 2.16, 0.14), grafito, 0.35)
			acabado(Vector3(x - signf(x) * 0.045, 1.84, z), Vector3(0.026, 0.35, 0.055), calida, 0, true)


	for x in [-3.7, 3.7]:
		frentes.append(caja(Vector3(x, 1.13, -6.965), Vector3(4.1, 1.96, 0.05), grafito, 1))
		for i in 9:
			frentes.append(caja(Vector3(x - 1.8 + i * 0.45, 1.16, -6.995), Vector3(0.12, 1.8, 0.01), madera, 1))
		frentes.append(acabado(Vector3(x, 2.05, -6.99), Vector3(3.8, 0.045, 0.015), calida, 0, true))
	for x in [-1.64, 1.64]:
		frentes.append(acabado(Vector3(x, 1.08, -6.87), Vector3(0.16, 2.16, 0.22), metal, 0.5))
		frentes.append(acabado(Vector3(x, 1.72, -6.995), Vector3(0.055, 0.44, 0.01), calida, 0, true))
	frentes.append(acabado(Vector3(0, 2.11, -6.88), Vector3(3.42, 0.18, 0.22), grafito, 0.45))

	caja(Vector3(0, 0.022, -6.82), Vector3(2.96, 0.01, 0.18), grafito, 2)
	for i in 15:
		caja(Vector3(-1.4 + i * 0.2, 0.031, -6.82), Vector3(0.018, 0.009, 0.16), metal, 2)

	for x in [-5.92, 5.92]:
		acabado(Vector3(x, 2.22, 0), Vector3(0.16, 0.16, 14), grafito, 0.4)
	acabado(Vector3(0, 2.22, 6.92), Vector3(11.68, 0.16, 0.16), grafito, 0.4)
	frentes.append(acabado(Vector3(0, 2.22, -6.92), Vector3(11.68, 0.16, 0.16), grafito, 0.4))

func _detalle_fondo() -> void:
	var grafito := Color("26303a")
	var metal := Color("647584")
	var oro := Color("c3aa6b")


	for x in [-3.0, 3.0]:
		caja(Vector3(x, 0.61, 6.68), Vector3(3, 0.85, 0.2), grafito, 1)
		acabado(Vector3(x, 1.06, 6.66), Vector3(3.08, 0.055, 0.24), metal, 0.55)
		for y in [0.36, 0.61, 0.86]:
			caja(Vector3(x, y, 6.568), Vector3(2.87, 0.018, 0.025), metal, 1)
			acabado(Vector3(x, y + 0.09, 6.54), Vector3(0.48, 0.03, 0.03), oro, 0.6)

	caja(Vector3(-5.68, 0.94, 6.48), Vector3(0.15, 0.46, 0.19), Color("b54036"), 1)
	caja(Vector3(-5.68, 1.2, 6.48), Vector3(0.09, 0.065, 0.1), grafito, 1)
	caja(Vector3(-5.68, 1.53, 6.62), Vector3(0.23, 0.25, 0.025), Color("b54036"), 1)

func _cubierta() -> void:
	var grafito := Color("26303a")
	var metal := Color("647584")

	for z in [-5.0, 5.0]:
		caja(Vector3(0, 2.23, z), Vector3(12, 0.08, 4), grafito, 2)
	for tramo in [[-5.25, 1.5], [0.0, 3.0], [5.25, 1.5]]:
		caja(Vector3(tramo[0], 2.23, 0), Vector3(tramo[1], 0.08, 6), grafito, 2)
	for x in [-3.0, 3.0]:
		var cristal := acabado(Vector3(x, 2.245, 0), Vector3(2.96, 0.025, 5.96), Color("779da8"), 0.3, false, 2)
		cristal.name = "LucernarioCochera"
		var vidrio: StandardMaterial3D = cristal.mesh.material
		vidrio.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS
		vidrio.albedo_color.a = 0.72
		for dx in [-1.49, 1.49]:
			acabado(Vector3(x + dx, 2.28, 0), Vector3(0.045, 0.04, 6), metal, 0.65, false, 2)
		for z in [-2.98, -1.0, 1.0, 2.98]:
			acabado(Vector3(x, 2.28, z), Vector3(3, 0.04, 0.04), metal, 0.65, false, 2)
	for x in [-5.4, 0, 5.4]:
		acabado(Vector3(x, 2.28, 0), Vector3(0.04, 0.025, 13.7), metal, 0.45, false, 2)
	for z in [-3.2, 3.2]:
		caja(Vector3(0, 2.15, z), Vector3(11.6, 0.12, 0.1), grafito, 2)
		acabado(Vector3(0, 2.075, z), Vector3(10.8, 0.025, 0.065), Color("e5f3fb"), 0, true, 2)

static func actualizar(host: Object, delta: float = 0.016) -> void:
	var lista: Array = host.get("_cocheras")
	var en_cochera := false
	for i in range(lista.size() - 1, -1, -1):
		var dato: Dictionary = lista[i]
		if not is_instance_valid(dato["techo"]):
			lista.remove_at(i)
			continue
		var pos: Vector2 = host.get("_pos")
		var local := Vector3(pos.x, 0, pos.y)
		if is_instance_valid(dato["padre"]):
			local =(dato["padre"] as Node3D).to_local(local)
		var dentro: bool =(dato["rect"] as Rect2).grow(0.15).has_point(Vector2(local.x, local.z))
		en_cochera = en_cochera or dentro
		var r: Rect2 = dato["rect"]


		var distancia: float = 4.5 if dato.get("abrir", false) else 3.5
		var cerca: bool = absf(local.x - r.get_center().x) < 2.5 and absf(local.z - r.position.y) < distancia
		dato["abrir"] = cerca or bool(host.get("_grid_on"))
		dato["apertura"] = move_toward(float(dato["apertura"]), 1.0 if dato["abrir"] else 0.0,
			delta /(0.45 if dato["abrir"] else 0.75))
		var porton: Node3D = dato["porton"]
		porton.scale.y = lerpf(1.0, 0.035, smoothstep(0.0, 1.0, dato["apertura"]))
		(dato["techo"] as Node3D).visible = not dentro and not bool(host.get("_grid_on"))
		for frente in dato.get("frentes", []):
			if is_instance_valid(frente):
				frente.visible = not dentro and not bool(host.get("_grid_on"))

	if not bool(host.get("solo_retratos")):
		preload("res://ui/house/cubierta_casa.gd").actualizar(host, en_cochera)
