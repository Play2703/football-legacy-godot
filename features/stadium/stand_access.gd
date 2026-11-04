extends RefCounted



const TIFO_MAX_COVERAGE: float = 0.94
const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
static var _box_cache: Dictionary = {}

static func _box_arrays(size: Vector3) -> Dictionary:
	var key := "%s|%s|%s" % [str(size.x), str(size.y), str(size.z)]
	if _box_cache.has(key): return _box_cache[key]
	var mesh := BoxMesh.new()
	mesh.size = size


	var data: Array = _DETALLE.arrays_de(mesh)
	var cached := {"v": data[Mesh.ARRAY_VERTEX], "n": data[Mesh.ARRAY_NORMAL], "i": data[Mesh.ARRAY_INDEX]}
	_box_cache[key] = cached
	return cached

static func plan(length: float, height: float, aisles: Array[float],
		blocked: Array[Rect2], works_from: float = INF) -> Array[Rect2]:
	var out: Array[Rect2] = []
	if height < 9.0 or length < 32.0:
		return out
	for ax in aisles:

		if absf(ax) < length * 0.2:
			continue
		if ax + 1.6 >= works_from:
			continue


		for cy in [height * 0.23, height * -0.1, height * 0.35,
				height * -0.28, height * 0.5 - 2.75]:
			var rect: Rect2 = Rect2(ax - 1.35, float(cy) - 1.75, 2.7, 3.5)
			if rect.position.y < - height * 0.5 + 1.0 or rect.end.y > height * 0.5 - 1.0:
				continue
			var free: bool = true
			for obstacle in blocked:
				if obstacle.grow(0.65).intersects(rect):
					free = false
					break
			if free:
				out.append(rect)
				break
		if out.size() >= 4:
			break
	return out






static func surface(size: Vector2, cuts: Array[Rect2], copia: bool = false) -> ArrayMesh:
	var xs: Array[float] = [- size.x * 0.5, size.x * 0.5]
	var ys: Array[float] = [- size.y * 0.5, size.y * 0.5]
	var area: Rect2 = Rect2(- size * 0.5, size)
	for rect in cuts:
		if not rect.intersects(area):
			continue
		for x in [rect.position.x, rect.end.x]:
			xs.append(clampf(x, area.position.x, area.end.x))
		for y in [rect.position.y, rect.end.y]:
			ys.append(clampf(y, area.position.y, area.end.y))
	xs.sort()
	ys.sort()
	var mesh: SurfaceTool = SurfaceTool.new()
	mesh.begin(Mesh.PRIMITIVE_TRIANGLES)
	for ix in xs.size() - 1:
		for iy in ys.size() - 1:
			var cell: Rect2 = Rect2(xs[ix], ys[iy], xs[ix + 1] - xs[ix], ys[iy + 1] - ys[iy])
			if cell.size.x < 0.001 or cell.size.y < 0.001 or contains(cuts, cell.get_center()):
				continue
			var a: Vector2 = cell.position
			var b: Vector2 = Vector2(cell.position.x, cell.end.y)
			var c: Vector2 = cell.end
			var d: Vector2 = Vector2(cell.end.x, cell.position.y)
			for p in [a, b, c, a, c, d]:
				mesh.set_normal(Vector3.BACK)
				mesh.set_uv(Vector2(p.x / size.x + 0.5, 0.5 - p.y / size.y))
				mesh.add_vertex(Vector3(p.x, p.y, 0))
	return _DETALLE.cometer(mesh, copia)


static func contains(rects: Array[Rect2], point: Vector2, pad: float = 0.0) -> bool:
	for rect in rects:
		if rect.grow(pad).has_point(point):
			return true
	return false


static func build(root: Node3D, center: Vector2, angle: float,
		rects: Array[Rect2], color: Color) -> void:
	if rects.is_empty():
		return



	var concrete: Color = color.lerp(Color("adb5bf"), 0.6)
	var dark: Color = Color("0d141b")
	var stone: Color = Color("414a55")
	var piezas: SurfaceTool = SurfaceTool.new()
	piezas.begin(Mesh.PRIMITIVE_TRIANGLES)
	var numeros: SurfaceTool = SurfaceTool.new()
	numeros.begin(Mesh.PRIMITIVE_TRIANGLES)
	var celda: int = 32
	var atlas: Image = Image.create(celda * rects.size(), celda, false, Image.FORMAT_RGBA8)
	atlas.fill(Color.TRANSPARENT)
	var basis: Basis = Basis(Vector3.RIGHT, angle)
	for i in rects.size():
		var rect: Rect2 = rects[i]
		var floor_at: Vector3 = Vector3(0, center.x, center.y) + basis * Vector3(rect.get_center().x, rect.position.y, 0)
		var height: float = rect.size.y * cos(angle)
		var depth: float = rect.size.y * absf(sin(angle)) + 0.35
		var entry: Node3D = Node3D.new()
		entry.name = "AccesoGrada%d" % i
		entry.position = floor_at
		entry.set_meta("acceso_grada", rect)
		root.add_child(entry)


		_box(piezas, Vector3(rect.size.x, height, 0.16), floor_at + Vector3(0, height * 0.5, - depth), dark)
		_box(piezas, Vector3(rect.size.x, 0.2, depth + 0.2), floor_at + Vector3(0, -0.04, - depth * 0.5), stone)

		_box(piezas, Vector3(rect.size.x - 0.4, 0.018, 0.09), floor_at + Vector3(0, 0.072, 0.06), Color("c9c5af"))
		for paso in 3:
			_box(piezas, Vector3(rect.size.x - 0.45, 0.012, 0.055), floor_at + Vector3(0, 0.071, -0.2 - paso * 0.23), dark)
		for side in [-1.0, 1.0]:
			_box(piezas, Vector3(0.2, height, depth + 0.2), floor_at + Vector3(side *(rect.size.x * 0.5 - 0.1), height * 0.5, - depth * 0.5), concrete)
		_box(piezas, Vector3(rect.size.x + 0.18, 0.3, depth + 0.35), floor_at + Vector3(0, height + 0.04, - depth * 0.5), concrete)

		_box(piezas, Vector3(1.1, 0.46, 0.12), floor_at + Vector3(0, height + 0.04, 0.28), color.lightened(0.16))
		var texto: String = "%02d" %(i + 1)
		var ancho: int = PixelText.text_width(texto, 3)
		PixelText.draw_text(atlas, i * celda +(celda - ancho) / 2,
			(celda - PixelText.GLYPH_H * 3) / 2, texto, Color.WHITE, 3)
		_number(numeros, floor_at + Vector3(0, height + 0.04, 0.36), i, rects.size())
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.roughness = 1.0
	_mesh(root, piezas, mat, "MarcosAccesos")
	var letras: StandardMaterial3D = StandardMaterial3D.new()
	letras.albedo_texture = ImageTexture.create_from_image(atlas)
	letras.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	letras.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	letras.alpha_scissor_threshold = 0.5
	letras.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_mesh(root, numeros, letras, "NumerosAccesos")


static func _box(lote: SurfaceTool, size: Vector3, pos: Vector3, color: Color) -> void:
	var datos: Dictionary = _box_arrays(size)
	var vertices: PackedVector3Array = datos["v"]
	var normales: PackedVector3Array = datos["n"]
	for i in datos["i"]:
		lote.set_color(color)
		lote.set_normal(normales[i])
		lote.add_vertex(pos + vertices[i])


static func _number(lote: SurfaceTool, pos: Vector3, columna: int, total: int) -> void:



	for uv in [Vector2(0, 1), Vector2.ZERO, Vector2(1, 0),
			Vector2(0, 1), Vector2(1, 0), Vector2.ONE]:
		lote.set_normal(Vector3.BACK)
		lote.set_uv(Vector2((float(columna) + uv.x) / float(total), uv.y))
		lote.add_vertex(pos + Vector3((uv.x - 0.5) * 0.5,(0.5 - uv.y) * 0.5, 0))


static func _mesh(root: Node3D, lote: SurfaceTool, mat: Material, nombre: String) -> void:
	var nodo: MeshInstance3D = MeshInstance3D.new()
	nodo.name = nombre
	nodo.mesh = _DETALLE.cometer(lote, _DETALLE.se_corta(root))
	nodo.material_override = mat
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(nodo)
