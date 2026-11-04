extends RefCounted



static func pintar(escena: Object, kind: String, r: Rect2) -> void:
	var padre: Node = escena.get("_box_parent")
	if padre == null:
		padre = escena.get("viewport")
	var soporte := Node3D.new()
	padre.add_child(soporte)
	var coche: Node3D = preload("res://ui/shop_car.gd").new().montar(soporte,
		String(Shop.lifestyle_by_id(kind).get("modelo", "deportivo")), 0.0)
	coche.scale = Vector3(r.size.x / 5.0, 1.0, r.size.y / 2.5)
	var perfil: String = String(Shop.lifestyle_by_id(kind).get("modelo", "deportivo"))
	var radio: float = preload("res://ui/shop_car.gd").PERFILES[perfil]["rueda"]
	coche.position = Vector3(r.get_center().x, radio - 0.51, r.get_center().y)

	var materiales: Dictionary = {}
	var barrido := AABB(Vector3(r.position.x, 0, r.position.y),
		Vector3(r.size.x, House.prop_alto(kind), r.size.y))
	for pieza in coche.find_children("*", "MeshInstance3D", true, false):
		var mi: MeshInstance3D = pieza
		var original: StandardMaterial3D = mi.material_override
		if not materiales.has(original):
			var mat: StandardMaterial3D = original.duplicate()
			materiales[original] = mat
			(escena.get("_walls") as Array).append({"mat": mat, "root": coche,
				"aabb": barrido, "base": mat.albedo_color.a, "a": mat.albedo_color.a})
		mi.material_override = materiales[original]
