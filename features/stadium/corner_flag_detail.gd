extends RefCounted




const LIENZO: float = 48.0
const COLUMNA_MASTIL: float = 17.0
const FILA_CIMA: float = 4.0


const TELA: Rect2 = Rect2(18, 6, 20, 14)


static func montar(pivot: Node3D, sprite: AnimatedSprite3D, ps: float,
		centro_y: float) -> Dictionary:
	var raiz: Node3D = Node3D.new()
	raiz.name = "DetalleBanderin"
	pivot.add_child(raiz)
	var blanco: StandardMaterial3D = _material(Color("fdfaf5"), 0.63)
	var casquillo_mat: StandardMaterial3D = _material(Color("747c76"), 0.78)


	var cima: float = centro_y +(LIENZO * 0.5 - FILA_CIMA) * ps
	var radio: float = ps
	var base: MeshInstance3D = _cilindro(raiz, Vector3(0, 0.012, 0),
		0.075, 0.075, 0.024, casquillo_mat)
	base.name = "BaseEnSuelo"
	var casquillo: MeshInstance3D = _cilindro(raiz, Vector3(0, 0.047, 0),
		0.042, 0.052, 0.07, casquillo_mat)
	casquillo.name = "Casquillo"
	var inferior: MeshInstance3D = _cilindro(raiz, Vector3(0, centro_y * 0.5, 0),
		radio, radio, centro_y, blanco)
	inferior.name = "MastilInferior"


	var superior: Node3D = Node3D.new()
	superior.name = "MitadSuperior"
	superior.position.y = centro_y
	raiz.add_child(superior)
	var alto_superior: float = cima - centro_y
	var tubo: MeshInstance3D = _cilindro(superior, Vector3(0, alto_superior * 0.5, 0),
		radio, radio, alto_superior, blanco)
	tubo.name = "MastilSuperior"
	var tela_mat: StandardMaterial3D = StandardMaterial3D.new()
	tela_mat.albedo_color = Color.WHITE
	tela_mat.roughness = 1.0
	tela_mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	tela_mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	tela_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	tela_mat.alpha_scissor_threshold = 0.5
	var tela: MeshInstance3D = MeshInstance3D.new()
	tela.name = "TelaPlegada"
	tela.mesh = _malla_tela(ps)
	tela.mesh.surface_set_material(0, tela_mat)
	superior.add_child(tela)
	var actualizar: Callable = _actualizar_frame.bind(sprite, tela_mat)
	sprite.frame_changed.connect(actualizar)
	_actualizar_frame(sprite, tela_mat)


	sprite.visible = false
	return {"root": raiz, "base": base, "casquillo": casquillo,
		"tubo_inferior": inferior, "superior": superior, "tubo_superior": tubo,
		"tela": tela, "material": tela_mat, "reloj": sprite,
		"actualizar": actualizar, "ps": ps, "centro_y": centro_y, "roto": false}


static func romper(detalle: Dictionary, fall_dir: float) -> void:
	if bool(detalle.get("roto", false)):
		return
	detalle["roto"] = true
	var sprite: AnimatedSprite3D = detalle["reloj"]
	var mat: StandardMaterial3D = detalle["material"]


	_actualizar_frame(sprite, mat)
	var actualizar: Callable = detalle["actualizar"]
	if sprite.frame_changed.is_connected(actualizar):
		sprite.frame_changed.disconnect(actualizar)
	sprite.visible = false
	var superior: Node3D = detalle["superior"]
	superior.position = Vector3(0, 0.06, fall_dir * 0.45)
	superior.rotation.x = deg_to_rad(fall_dir * 90.0)


static func _actualizar_frame(sprite: AnimatedSprite3D,
		material: StandardMaterial3D) -> void:
	if not is_instance_valid(sprite) or sprite.sprite_frames == null:
		return
	material.albedo_texture = sprite.sprite_frames.get_frame_texture(sprite.animation, sprite.frame)


static func _material(col: Color, rugosidad: float) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = rugosidad
	return mat


static func _cilindro(padre: Node3D, at: Vector3, arriba: float, abajo: float,
		alto: float, material: StandardMaterial3D) -> MeshInstance3D:
	var cilindro: CylinderMesh = CylinderMesh.new()
	cilindro.top_radius = arriba
	cilindro.bottom_radius = abajo
	cilindro.height = alto
	cilindro.radial_segments = 10
	cilindro.rings = 0
	cilindro.material = material
	var pieza: MeshInstance3D = MeshInstance3D.new()
	pieza.mesh = cilindro
	pieza.position = at
	padre.add_child(pieza)
	return pieza


static func _malla_tela(ps: float) -> ArrayMesh:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)


	for x in 8:
		for y in 3:
			for paso in [Vector2i(0, 0), Vector2i(1, 0), Vector2i(1, 1),
					Vector2i(0, 0), Vector2i(1, 1), Vector2i(0, 1)]:
				var t: float = float(x + paso.x) / 8.0
				var v: float = float(y + paso.y) / 3.0
				var pixel: Vector2 = TELA.position + Vector2(t, v) * TELA.size
				var pliegue: float = sin(t * PI * 1.65) * 0.035 *(0.3 + 0.7 * t)
				pliegue += sin(v * PI) * 0.009 * t


				st.set_uv(pixel / LIENZO)
				st.add_vertex(Vector3((pixel.x - COLUMNA_MASTIL) * ps,
					(LIENZO * 0.5 - pixel.y) * ps, pliegue))
	st.generate_normals()
	st.index()
	return st.commit()
