extends RefCounted



static func superficies(pl: Dictionary, pintura: Dictionary, base: String) -> Array:
	var celdas: Dictionary = {}
	var limites := Rect2()
	var primera := true
	for cuarto in pl["rooms"]:
		if cuarto.get("anexo_cochera", false) or cuarto.get("id", "") in ["patio", "jardin", "alberca", "terraza"]:
			continue
		var r: Rect2 = cuarto["rect"]
		limites = r if primera else limites.merge(r)
		primera = false
		for z in range(floori(r.position.y / House.CELDA), ceili(r.end.y / House.CELDA)):
			for x in range(floori(r.position.x / House.CELDA), ceili(r.end.x / House.CELDA)):
				var p := Vector2(x + 0.5, z + 0.5) * House.CELDA
				if r.has_point(p) and House.floor_finish_at(p, pintura, base) != House.PISO_PASTO:
					celdas[House.celda_clave(p)] = "cubierta"

	return House.floor_patches(limites, celdas, "") if not primera else []

static func actualizar(host: Object, en_cochera: bool) -> void:
	var techo: Node3D = host.get("_cubierta_casa")
	var mostrar: bool = en_cochera and not bool(host.get("_grid_on")) and not bool(host.get("museo"))


	if mostrar and (not is_instance_valid(techo) or bool(host.get("_cubierta_casa_sucia"))):
		if is_instance_valid(techo):
			techo.visible = false
			host.call("_purge_walls", techo)
			techo.queue_free()
		techo = Node3D.new()
		techo.name = "CubiertaCasa"
		(host.get("viewport") as Node).add_child(techo)
		host.set("_cubierta_casa", techo)
		var antes: Node3D = host.get("_box_parent")
		host.set("_box_parent", techo)
		var base: String = String(Career.house_finish.get("floor", House.ACABADO_BASE["floor"]))
		for parche in superficies(host.call("_plano"), Career.floor_paint_of(), base):
			var r: Rect2 = parche["rect"]
			var c: Vector2 = r.get_center()
			var pieza: MeshInstance3D = host.call("_add_box", Vector3(c.x, 2.4, c.y),
				Vector3(r.size.x, 0.16, r.size.y), Color("59636c"), 2)
			(pieza.mesh.material as StandardMaterial3D).roughness = 0.8
		host.set("_box_parent", antes)
		host.set("_cubierta_casa_sucia", false)
	if is_instance_valid(techo):
		techo.visible = mostrar
