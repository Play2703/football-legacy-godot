extends RefCounted


static var _box_cache: Dictionary = {}


static var _luz: Vector3 = Vector3(-0.48, 0.72, 0.5).normalized()
static var _sombra: Color = Color("7e929d")
static var _claro: Color = Color("fff7e8")



























static var _caja_unidad: Array = []
static var _arrays_cache: Dictionary = {}
const ARRAYS_CACHE_MAX: int = 512
const _FORMA: Dictionary = {
	"BoxMesh": ["size", "subdivide_width", "subdivide_height", "subdivide_depth"],
	"PrismMesh": ["left_to_right", "size", "subdivide_width", "subdivide_height", "subdivide_depth"],
	"SphereMesh": ["radius", "height", "radial_segments", "rings", "is_hemisphere"],
	"CylinderMesh": ["top_radius", "bottom_radius", "height", "radial_segments", "rings",
		"cap_top", "cap_bottom"],
	"TorusMesh": ["inner_radius", "outer_radius", "rings", "ring_segments"],




	"PlaneMesh": ["size", "subdivide_width", "subdivide_depth", "center_offset", "orientation"],
	"QuadMesh": ["size", "subdivide_width", "subdivide_depth", "center_offset", "orientation"],
}


static func arrays_de(mesh: Mesh, s: int = 0) -> Array:
	if mesh == null:
		return []
	var prim: PrimitiveMesh = mesh as PrimitiveMesh
	if prim == null:
		return _leer_de_la_gpu(mesh, s)
	if s != 0 or not _FORMA.has(prim.get_class()) or prim.add_uv2:
		return []
	var caja: BoxMesh = mesh as BoxMesh
	if caja != null and caja.subdivide_width == 0 and caja.subdivide_height == 0 \
			and caja.subdivide_depth == 0 and not caja.flip_faces:
		if _caja_unidad.is_empty():
			_caja_unidad = _caja_a_mano(Vector3.ONE, 0, 0, 0)
		var escalada: Array = _caja_unidad.duplicate()
		escalada[Mesh.ARRAY_VERTEX] = Transform3D(Basis.from_scale(caja.size), Vector3.ZERO) \
				*(_caja_unidad[Mesh.ARRAY_VERTEX] as PackedVector3Array)
		return escalada
	var firma: Array = [prim.get_class(), prim.flip_faces, prim.add_uv2, prim.uv2_padding]
	for propiedad in _FORMA[prim.get_class()]:
		firma.append(prim.get(propiedad))
	if _arrays_cache.has(firma):
		return _arrays_cache[firma]
	if _arrays_cache.size() >= ARRAYS_CACHE_MAX:
		_arrays_cache.clear()
	var arrays: Array = _a_mano(prim)
	if not arrays.is_empty():
		_arrays_cache[firma] = arrays
	return arrays











const META_ARRAYS: StringName = &"arrays_cpu"


static var lecturas_gpu: int = 0


static var ignorar_copias: bool = false








static func _leer_de_la_gpu(mesh: Mesh, s: int) -> Array:
	if s < 0 or s >= mesh.get_surface_count():
		return []
	var copia: Variant = mesh.get_meta(META_ARRAYS) if mesh.has_meta(META_ARRAYS) \
			and not ignorar_copias else null
	if copia is Array and s <(copia as Array).size():
		var guardados: Variant =(copia as Array)[s]
		if guardados is Array and arrays_completos(guardados):
			return guardados
	lecturas_gpu += 1
	if RenderingServer.get_current_rendering_method() == "gl_compatibility":
		return []
	var arrays: Array = mesh.surface_get_arrays(s)
	return arrays if arrays_completos(arrays) else []







static func cometer(st: SurfaceTool, copia: bool) -> ArrayMesh:
	if not copia:
		return st.commit()
	var arrays: Array = st.commit_to_arrays()
	var malla: ArrayMesh = st.commit()
	if malla != null and malla.get_surface_count() == 1:
		malla.set_meta(META_ARRAYS, [arrays])
	return malla





static func se_corta(n: Node) -> bool:
	while n != null:
		if not (n.get_meta(&"recinto_cortes", []) as Array).is_empty():
			return true
		n = n.get_parent()
	return false




static func arrays_completos(arrays: Array) -> bool:
	if arrays.size() != Mesh.ARRAY_MAX or not arrays[Mesh.ARRAY_VERTEX] is PackedVector3Array:
		return false
	var n: int =(arrays[Mesh.ARRAY_VERTEX] as PackedVector3Array).size()
	if n == 0:
		return false
	for canal in [Mesh.ARRAY_NORMAL, Mesh.ARRAY_COLOR, Mesh.ARRAY_TEX_UV, Mesh.ARRAY_TEX_UV2]:
		var datos: Variant = arrays[canal]
		if datos != null and datos.size() != n:
			return false
	var tangentes: Variant = arrays[Mesh.ARRAY_TANGENT]
	if tangentes != null and tangentes.size() != n * 4:
		return false
	return true














static func anexar(st: SurfaceTool, malla: Mesh, xf: Transform3D, desde: int = -1) -> int:
	var datos: Array = arrays_de(malla)
	if datos.is_empty():
		return 0
	if desde < 0:
		desde = int(st.get_meta(&"vertices_anexados", 0))
	var puntos: PackedVector3Array = xf *(datos[Mesh.ARRAY_VERTEX] as PackedVector3Array)
	var normales: PackedVector3Array = datos[Mesh.ARRAY_NORMAL]
	var tangentes: PackedFloat32Array = datos[Mesh.ARRAY_TANGENT]
	var uvs: PackedVector2Array = datos[Mesh.ARRAY_TEX_UV]
	var base: Basis = xf.basis
	var signo: float = -1.0 if base.determinant() < 0.0 else 1.0
	for i in puntos.size():
		st.set_normal(base * normales[i])
		st.set_tangent(Plane(base * Vector3(tangentes[i * 4], tangentes[i * 4 + 1],
			tangentes[i * 4 + 2]), tangentes[i * 4 + 3] * signo))
		st.set_uv(uvs[i])
		st.add_vertex(puntos[i])
	var indices: PackedInt32Array = datos[Mesh.ARRAY_INDEX]
	for indice in indices:
		st.add_index(desde + indice)
	st.set_uv(Vector2.ZERO)
	st.set_tangent(Plane())
	st.set_meta(&"vertices_anexados", desde + puntos.size())
	return puntos.size()





static func _a_mano(prim: PrimitiveMesh) -> Array:
	var a: Array = []
	if prim is BoxMesh:
		var b: BoxMesh = prim
		a = _caja_a_mano(b.size, b.subdivide_width, b.subdivide_height, b.subdivide_depth)
	elif prim is PrismMesh:
		var p: PrismMesh = prim
		a = _prisma_a_mano(p.size, p.left_to_right, p.subdivide_width, p.subdivide_height,
			p.subdivide_depth)
	elif prim is SphereMesh:
		var e: SphereMesh = prim
		a = _esfera_a_mano(e.radius, e.height, e.radial_segments, e.rings, e.is_hemisphere)
	elif prim is CylinderMesh:
		var c: CylinderMesh = prim
		a = _cilindro_a_mano(c.top_radius, c.bottom_radius, c.height, c.radial_segments,
			c.rings, c.cap_top, c.cap_bottom)
	elif prim is TorusMesh:
		var t: TorusMesh = prim
		a = _toro_a_mano(t.inner_radius, t.outer_radius, t.rings, t.ring_segments)
	elif prim is PlaneMesh:
		var pl: PlaneMesh = prim
		a = _plano_a_mano(pl.size, pl.subdivide_width, pl.subdivide_depth, pl.center_offset,
			pl.orientation)
	if a.is_empty() or not prim.flip_faces:
		return a
	var normales: PackedVector3Array = a[Mesh.ARRAY_NORMAL]
	var indices: PackedInt32Array = a[Mesh.ARRAY_INDEX]
	if normales.is_empty() or indices.is_empty():
		return a
	for i in normales.size():
		normales[i] = - normales[i]
	for i in range(0, indices.size() - 2, 3):
		var primero: int = indices[i]
		indices[i] = indices[i + 1]
		indices[i + 1] = primero
	a[Mesh.ARRAY_NORMAL] = normales
	a[Mesh.ARRAY_INDEX] = indices
	return a



class _Malla:
	var p: PackedVector3Array = PackedVector3Array()
	var n: PackedVector3Array = PackedVector3Array()
	var t: PackedFloat32Array = PackedFloat32Array()
	var uv: PackedVector2Array = PackedVector2Array()
	var ix: PackedInt32Array = PackedInt32Array()

	func punto(pos: Vector3, normal: Vector3, tangente: Vector3, u: float, v: float) -> void:
		p.append(pos)
		n.append(normal)
		t.append(tangente.x)
		t.append(tangente.y)
		t.append(tangente.z)
		t.append(1.0)
		uv.append(Vector2(u, v))

	func tri(a: int, b: int, c: int) -> void:
		ix.append(a)
		ix.append(b)
		ix.append(c)


	func par(previa: int, esta: int, i2: int) -> void:
		tri(previa + i2 - 2, previa + i2, esta + i2 - 2)
		tri(previa + i2, esta + i2, esta + i2 - 2)
		tri(previa + i2 - 1, previa + i2 + 1, esta + i2 - 1)
		tri(previa + i2 + 1, esta + i2 + 1, esta + i2 - 1)

	func arrays() -> Array:
		var a: Array = []
		a.resize(Mesh.ARRAY_MAX)
		a[Mesh.ARRAY_VERTEX] = p
		a[Mesh.ARRAY_NORMAL] = n
		a[Mesh.ARRAY_TANGENT] = t
		a[Mesh.ARRAY_TEX_UV] = uv
		a[Mesh.ARRAY_INDEX] = ix
		return a





static func _plano_a_mano(size: Vector2, sw: int, sd: int, centro: Vector3,
		orientacion: int) -> Array:
	var m: _Malla = _Malla.new()
	var inicio: Vector2 = size * -0.5
	var normal: Vector3 = Vector3(0, 1, 0)
	var tangente: Vector3 = Vector3(1, 0, 0)
	if orientacion == PlaneMesh.FACE_X:
		normal = Vector3(1, 0, 0)
		tangente = Vector3(0, 0, -1)
	elif orientacion == PlaneMesh.FACE_Z:
		normal = Vector3(0, 0, 1)
	var z: float = inicio.y
	var esta: int = 0
	var previa: int = 0
	for j in sd + 2:
		var x: float = inicio.x
		for i in sw + 2:
			var u: float = float(i) /(sw + 1.0)
			var v: float = float(j) /(sd + 1.0)
			var pos: Vector3 = Vector3(- x, z, 0.0)
			if orientacion == PlaneMesh.FACE_X:
				pos = Vector3(0.0, z, x)
			elif orientacion == PlaneMesh.FACE_Y:
				pos = Vector3(- x, 0.0, - z)
			m.punto(pos + centro, normal, tangente, 1.0 - u, 1.0 - v)
			if i > 0 and j > 0:
				m.tri(previa + i - 1, previa + i, esta + i - 1)
				m.tri(previa + i, esta + i, esta + i - 1)
			x += size.x /(sw + 1.0)
		z += size.y /(sd + 1.0)
		previa = esta
		esta = m.p.size()
	return m.arrays()


static func _caja_a_mano(size: Vector3, sw: int, sh: int, sd: int) -> Array:
	var m: _Malla = _Malla.new()
	var tercio: float = 1.0 / 3.0
	var dos_tercios: float = 2.0 / 3.0
	var inicio: Vector3 = size * -0.5

	var y: float = inicio.y
	var esta: int = 0
	var previa: int = 0
	for j in sh + 2:
		var v: float = float(j) /(2.0 *(sh + 1.0))
		var x: float = inicio.x
		for i in sw + 2:
			var u: float = float(i) /(3.0 *(sw + 1.0))
			m.punto(Vector3(x, - y, - inicio.z), Vector3(0, 0, 1), Vector3(1, 0, 0), u, v)
			m.punto(Vector3(- x, - y, inicio.z), Vector3(0, 0, -1), Vector3(-1, 0, 0), dos_tercios + u, v)
			if i > 0 and j > 0:
				m.par(previa, esta, i * 2)
			x += size.x /(sw + 1.0)
		y += size.y /(sh + 1.0)
		previa = esta
		esta = m.p.size()

	y = inicio.y
	previa = 0
	for j in sh + 2:
		var v: float = float(j) /(2.0 *(sh + 1.0))
		var z: float = inicio.z
		for i in sd + 2:
			var u: float = float(i) /(3.0 *(sd + 1.0))
			m.punto(Vector3(- inicio.x, - y, - z), Vector3(1, 0, 0), Vector3(0, 0, -1), tercio + u, v)
			m.punto(Vector3(inicio.x, - y, z), Vector3(-1, 0, 0), Vector3(0, 0, 1), u, 0.5 + v)
			if i > 0 and j > 0:
				m.par(previa, esta, i * 2)
			z += size.z /(sd + 1.0)
		y += size.y /(sh + 1.0)
		previa = esta
		esta = m.p.size()

	var zz: float = inicio.z
	previa = 0
	for j in sd + 2:
		var v: float = float(j) /(2.0 *(sd + 1.0))
		var x: float = inicio.x
		for i in sw + 2:
			var u: float = float(i) /(3.0 *(sw + 1.0))
			m.punto(Vector3(- x, - inicio.y, - zz), Vector3(0, 1, 0), Vector3(-1, 0, 0), tercio + u, 0.5 + v)
			m.punto(Vector3(x, inicio.y, - zz), Vector3(0, -1, 0), Vector3(1, 0, 0), dos_tercios + u, 0.5 + v)
			if i > 0 and j > 0:
				m.par(previa, esta, i * 2)
			x += size.x /(sw + 1.0)
		zz += size.z /(sd + 1.0)
		previa = esta
		esta = m.p.size()
	return m.arrays()


static func _prisma_a_mano(size: Vector3, ltr: float, sw: int, sh: int, sd: int) -> Array:
	var m: _Malla = _Malla.new()
	var tercio: float = 1.0 / 3.0
	var dos_tercios: float = 2.0 / 3.0
	var inicio: Vector3 = size * -0.5

	var y: float = inicio.y
	var esta: int = 0
	var previa: int = 0
	for j in sh + 2:
		var escala: float = j /(sh + 1.0)
		var ancho: float = size.x * escala
		var inicio_x: float = inicio.x +(1.0 - escala) * size.x * ltr
		var mueve_delante: float =(1.0 - escala) * tercio * ltr
		var mueve_detras: float =(1.0 - escala) * tercio *(1.0 - ltr)
		var v: float = float(j) /(2.0 *(sh + 1.0))
		var x: float = 0.0
		for i in sw + 2:
			var u: float = float(i) /(3.0 *(sw + 1.0)) * escala
			m.punto(Vector3(inicio_x + x, - y, - inicio.z), Vector3(0, 0, 1), Vector3(1, 0, 0),
				mueve_delante + u, v)
			m.punto(Vector3(inicio_x + ancho - x, - y, inicio.z), Vector3(0, 0, -1), Vector3(-1, 0, 0),
				dos_tercios + mueve_detras + u, v)
			if i > 0 and j == 1:
				var i2: int = i * 2
				m.tri(previa + i2, esta + i2, esta + i2 - 2)
				m.tri(previa + i2 + 1, esta + i2 + 1, esta + i2 - 1)
			elif i > 0 and j > 0:
				m.par(previa, esta, i * 2)
			x += escala * size.x /(sw + 1.0)
		y += size.y /(sh + 1.0)
		previa = esta
		esta = m.p.size()

	var normal_izq: Vector3 = Vector3(- size.y, size.x * ltr, 0.0).normalized()
	var normal_der: Vector3 = Vector3(size.y, size.x *(1.0 - ltr), 0.0).normalized()
	y = inicio.y
	previa = 0
	for j in sh + 2:
		var escala: float = j /(sh + 1.0)
		var izq: float = inicio.x +(size.x *(1.0 - escala) * ltr)
		var der: float = izq +(size.x * escala)
		var v: float = float(j) /(2.0 *(sh + 1.0))
		var z: float = inicio.z
		for i in sd + 2:
			var u: float = float(i) /(3.0 *(sd + 1.0))
			m.punto(Vector3(der, - y, - z), normal_der, Vector3(0, 0, -1), tercio + u, v)
			m.punto(Vector3(izq, - y, z), normal_izq, Vector3(0, 0, 1), u, 0.5 + v)
			if i > 0 and j > 0:
				m.par(previa, esta, i * 2)
			z += size.z /(sd + 1.0)
		y += size.y /(sh + 1.0)
		previa = esta
		esta = m.p.size()

	var zz: float = inicio.z
	previa = 0
	for j in sd + 2:
		var v: float = float(j) /(2.0 *(sd + 1.0))
		var x: float = inicio.x
		for i in sw + 2:
			var u: float = float(i) /(3.0 *(sw + 1.0))
			m.punto(Vector3(x, inicio.y, - zz), Vector3(0, -1, 0), Vector3(1, 0, 0), dos_tercios + u, 0.5 + v)
			if i > 0 and j > 0:
				m.tri(previa + i - 1, previa + i, esta + i - 1)
				m.tri(previa + i, esta + i, esta + i - 1)
			x += size.x /(sw + 1.0)
		zz += size.z /(sd + 1.0)
		previa = esta
		esta = m.p.size()
	return m.arrays()


static func _esfera_a_mano(radio: float, alto: float, lados: int, anillos: int,
		hemisferio: bool) -> Array:
	var m: _Malla = _Malla.new()
	var escala: float = alto / radio *(1.0 if hemisferio else 0.5)
	var esta: int = 0
	var previa: int = 0
	for j in anillos + 2:
		var v: float = float(j) /(anillos + 1)
		var w: float = 0.0
		var y: float = -1.0
		if j != anillos + 1:
			w = sin(PI * v)
			y = cos(PI * v)
		for i in lados + 1:
			var u: float = float(i) / lados
			var x: float = 0.0 if i == lados else sin(u * TAU)
			var z: float = 1.0 if i == lados else cos(u * TAU)
			if hemisferio and y < 0.0:
				m.punto(Vector3(x * radio * w, 0.0, z * radio * w), Vector3(0, -1, 0),
					Vector3(z, 0.0, - x), u, v)
			else:
				m.punto(Vector3(x * w, y * escala, z * w) * radio,
					Vector3(x * w * escala, y, z * w * escala).normalized(), Vector3(z, 0.0, - x), u, v)
			if i > 0 and j > 0:
				m.tri(previa + i - 1, previa + i, esta + i - 1)
				m.tri(previa + i, esta + i, esta + i - 1)
		previa = esta
		esta = m.p.size()
	return m.arrays()


static func _cilindro_a_mano(arriba: float, abajo: float, alto: float, lados: int,
		anillos: int, tapa_arriba: bool, tapa_abajo: bool) -> Array:
	var m: _Malla = _Malla.new()
	var esta: int = 0
	var previa: int = 0
	var normal_y: float =(abajo - arriba) / alto
	for j in anillos + 2:
		var v: float = float(j) /(anillos + 1)
		var radio: float = arriba +((abajo - arriba) * v)
		var y: float =(alto * 0.5) - alto * v
		for i in lados + 1:
			var u: float = float(i) / lados
			var x: float = 0.0 if i == lados else sin(u * TAU)
			var z: float = 1.0 if i == lados else cos(u * TAU)
			m.punto(Vector3(x * radio, y, z * radio), Vector3(x, normal_y, z).normalized(),
				Vector3(z, 0.0, - x), u, v * 0.5)
			if i > 0 and j > 0:
				m.tri(previa + i - 1, previa + i, esta + i - 1)
				m.tri(previa + i, esta + i, esta + i - 1)
		previa = esta
		esta = m.p.size()
	for tapa in [1.0, -1.0]:
		var r: float = arriba if tapa > 0.0 else abajo
		if not (tapa_arriba if tapa > 0.0 else tapa_abajo) or r <= 0.0:
			continue
		var y: float = alto * 0.5 * tapa
		var centro: int = m.p.size()
		m.punto(Vector3(0.0, y, 0.0), Vector3(0.0, tapa, 0.0), Vector3(1, 0, 0),
			0.25 if tapa > 0.0 else 0.75, 0.75)
		for i in lados + 1:
			var q: float = float(i) / lados
			var x: float = 0.0 if i == lados else sin(q * TAU)
			var z: float = 1.0 if i == lados else cos(q * TAU)
			var u: float =((x + 1.0) * 0.25) if tapa > 0.0 else 0.5 +((x + 1.0) * 0.25)
			var v: float = 0.5 +((z + 1.0) * 0.25) if tapa > 0.0 else 1.0 -((z + 1.0) * 0.25)
			m.punto(Vector3(x * r, y, z * r), Vector3(0.0, tapa, 0.0), Vector3(1, 0, 0), u, v)
			var ultimo: int = m.p.size() - 1
			if i > 0 and tapa > 0.0:
				m.tri(centro, ultimo, ultimo - 1)
			elif i > 0:
				m.tri(centro, ultimo - 1, ultimo)
	return m.arrays()


static func _toro_a_mano(interior: float, exterior: float, anillos: int, segmentos: int) -> Array:

	if interior == exterior:
		return []
	var m: _Malla = _Malla.new()
	var minimo: float = minf(interior, exterior)
	var maximo: float = maxf(interior, exterior)
	var radio: float =(maximo - minimo) * 0.5
	for i in anillos + 1:
		var previa: int =(i - 1) *(segmentos + 1)
		var esta: int = i *(segmentos + 1)
		var inci: float = float(i) / anillos
		var angi: float = inci * TAU
		var ni: Vector2 = Vector2(0.0, -1.0) if i == anillos else Vector2(- sin(angi), - cos(angi))
		for j in segmentos + 1:
			var incj: float = float(j) / segmentos
			var angj: float = incj * TAU
			var nj: Vector2 = Vector2(-1.0, 0.0) if j == segmentos else Vector2(- cos(angj), sin(angj))
			var nk: Vector2 = nj * radio + Vector2(minimo + radio, 0.0)
			m.punto(Vector3(ni.x * nk.x, nk.y, ni.y * nk.x), Vector3(ni.x * nj.x, nj.y, ni.y * nj.x),
				Vector3(ni.y, 0.0, - ni.x), inci, incj)
			if i > 0 and j > 0:
				m.tri(esta + j - 1, previa + j, previa + j - 1)
				m.tri(esta + j - 1, esta + j, previa + j)
	return m.arrays()





static func sombrear(mesh: Mesh, giro: float = 0.0, variacion: float = 1.0) -> Mesh:
	var salida: ArrayMesh = ArrayMesh.new()
	var orientacion: Basis = Basis(Vector3.UP, deg_to_rad(giro))
	for s in mesh.get_surface_count():
		var leidos: Array = arrays_de(mesh, s)
		if leidos.is_empty():
			return mesh
		var arrays: Array = leidos.duplicate(true)
		var puntos: PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
		var normales: PackedVector3Array = arrays[Mesh.ARRAY_NORMAL] if arrays[Mesh.ARRAY_NORMAL] != null else PackedVector3Array()
		var colores: PackedColorArray = arrays[Mesh.ARRAY_COLOR] if arrays[Mesh.ARRAY_COLOR] != null else PackedColorArray()
		if colores.size() != puntos.size():
			colores.resize(puntos.size())
			colores.fill(Color.WHITE)
		for i in puntos.size():
			var normal: Vector3 = orientacion * normales[i] if normales.size() == puntos.size() else Vector3.UP
			colores[i] *= _tono(normal) * variacion
		arrays[Mesh.ARRAY_COLOR] = colores
		var primitiva: int = mesh.surface_get_primitive_type(s) if mesh is ArrayMesh else Mesh.PRIMITIVE_TRIANGLES
		salida.add_surface_from_arrays(primitiva, arrays)
	return salida


static func _tono(normal: Vector3) -> Color:
	return _sombra.lerp(_claro, maxf(0.0, normal.dot(_luz)))


static func _caja(size: Vector3) -> BoxMesh:
	var key := "%s|%s|%s" % [str(size.x), str(size.y), str(size.z)]
	if _box_cache.has(key):
		return _box_cache[key]
	var m: BoxMesh = BoxMesh.new()
	m.size = size
	_box_cache[key] = m
	return m


static func _pieza(m: Mesh, pos: Vector3, color: Color, giro: Basis = Basis.IDENTITY) -> Dictionary:
	return {"malla": m, "pose": Transform3D(giro, pos), "color": color}




static func _pieza_arrays(arrays: Array, color: Color) -> Dictionary:
	return {"arrays": arrays, "pose": Transform3D.IDENTITY, "color": color}





static func unir(piezas: Array) -> ArrayMesh:
	var puntos: PackedVector3Array = PackedVector3Array()
	var normales: PackedVector3Array = PackedVector3Array()
	var colores: PackedColorArray = PackedColorArray()
	var indices: PackedInt32Array = PackedInt32Array()
	for p in piezas:
		var pose: Transform3D = p["pose"]
		var giro: Basis = pose.basis
		var tinte: Color = Color(p["color"])
		var superficies: Array = []
		if p.has("arrays"):
			superficies.append(p["arrays"])
		else:
			var mesh: Mesh = p["malla"]
			for s in mesh.get_surface_count():
				superficies.append(arrays_de(mesh, s))
		for arrays in superficies:


			if arrays.is_empty():
				continue
			var vertices: PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
			var ns: PackedVector3Array = arrays[Mesh.ARRAY_NORMAL] if arrays[Mesh.ARRAY_NORMAL] != null else PackedVector3Array()
			var offset: int = puntos.size()
			var n: int = vertices.size()
			puntos.append_array(pose * vertices)
			if ns.size() == n:
				var previa: Vector3 = Vector3.INF
				var normal: Vector3 = Vector3.UP
				var color: Color = Color.WHITE
				for i in n:
					var cruda: Vector3 = ns[i]
					if cruda != previa:
						previa = cruda
						normal =(giro * cruda).normalized()
						color = tinte * _tono(normal)
					normales.append(normal)
					colores.append(color)
			else:
				var arriba: PackedVector3Array = PackedVector3Array()
				arriba.resize(n)
				arriba.fill(Vector3.UP)
				normales.append_array(arriba)
				var tono: PackedColorArray = PackedColorArray()
				tono.resize(n)
				tono.fill(tinte * _tono(Vector3.UP))
				colores.append_array(tono)
			var ix: PackedInt32Array = arrays[Mesh.ARRAY_INDEX] if arrays[Mesh.ARRAY_INDEX] != null else PackedInt32Array()
			if ix.is_empty():
				for i in n:
					indices.append(offset + i)
			elif offset == 0:
				indices.append_array(ix)
			else:
				for i in ix:
					indices.append(offset + i)
	var out: Array = []
	out.resize(Mesh.ARRAY_MAX)
	out[Mesh.ARRAY_VERTEX] = puntos
	out[Mesh.ARRAY_NORMAL] = normales
	out[Mesh.ARRAY_COLOR] = colores
	out[Mesh.ARRAY_INDEX] = indices
	var resultado: ArrayMesh = ArrayMesh.new()
	resultado.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, out)
	return resultado




static func especie(pais: String, indice: int) -> String:




	if pais in ["México", "Brasil", "Colombia", "Egipto", "Arabia Saudí",
			"Venezuela", "Ecuador", "Paraguay", "Marruecos", "Túnez"] and indice % 4 == 0:
		return "palmera"





	if pais == "Nueva Zelanda" and indice % 5 == 2:
		return "palmera"
	if pais in ["España", "Italia", "Portugal", "Grecia", "Turquía", "México"] and indice % 3 == 1:
		return "cipres"








	if pais in ["Suecia", "Bosnia y Herzegovina"] and indice % 3 == 1:
		return "cipres"
	if pais in ["México", "Egipto", "Arabia Saudí", "Chile", "Perú", "Bolivia",
			"Marruecos", "Túnez"] and indice % 7 == 5:
		return "seco"
	return "redondo"


static func _rama(a: Vector3, b: Vector3, ancho: float) -> Dictionary:
	var direccion: Vector3 =(b - a).normalized()
	var eje_x: Vector3 = Vector3.FORWARD.cross(direccion).normalized()
	var eje_z: Vector3 = eje_x.cross(direccion).normalized()
	return _pieza(_caja(Vector3(ancho, a.distance_to(b), ancho)),(a + b) * 0.5,
		Color("705b44"), Basis(eje_x, direccion, eje_z))


static func arbol(tipo: String, alto: float, ancho: float, hoja: Color, semilla: int) -> ArrayMesh:
	var piezas: Array = []
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	piezas.append(_rama(Vector3.ZERO, Vector3(alto * 0.055, alto * 0.77, 0.0), 0.5))
	if tipo == "palmera":
		var cima: Vector3 = Vector3(alto * 0.055, alto * 0.77, 0.0)
		for i in 7:
			var a: float = float(i) * TAU / 7.0 + rng.randf_range(-0.12, 0.12)
			var rumbo: Vector3 = Vector3(cos(a), 0.0, sin(a))
			var lado: Vector3 = Vector3(- sin(a), 0.0, cos(a)) * ancho * 0.1
			var codo: Vector3 = cima + rumbo * ancho * 0.38 + Vector3.UP * alto * 0.1
			var punta: Vector3 = cima + rumbo * ancho * 0.82 - Vector3.UP * alto * 0.08
			var arrays: Array = []
			arrays.resize(Mesh.ARRAY_MAX)
			arrays[Mesh.ARRAY_VERTEX] = PackedVector3Array([cima, codo - lado, codo + lado, punta])
			arrays[Mesh.ARRAY_INDEX] = PackedInt32Array([0, 1, 2, 1, 3, 2, 2, 1, 0, 2, 3, 1])
			piezas.append(_pieza_arrays(arrays, hoja.lightened(0.07) if i % 2 else hoja))
	elif tipo == "cipres":
		for i in 2:
			var copa: SphereMesh = SphereMesh.new()
			copa.radius = ancho *(0.22 if i == 0 else 0.14)
			copa.height = alto *(0.7 if i == 0 else 0.46)
			copa.radial_segments = 7
			copa.rings = 3
			piezas.append(_pieza(copa, Vector3(0.0, alto *(0.56 if i == 0 else 0.82), 0.0), hoja.darkened(0.12)))
	else:
		for i in 5:
			var inicio: Vector3 = Vector3(0.0, alto *(0.38 + float(i) * 0.075), 0.0)
			var fin: Vector3 = inicio + Vector3((-1.0 if i % 2 else 1.0) * ancho * 0.4,
				alto * rng.randf_range(0.12, 0.26), rng.randf_range(- ancho * 0.2, ancho * 0.2))
			piezas.append(_rama(inicio, fin, 0.3))
			piezas.append(_rama(fin, fin + Vector3(ancho * 0.13, alto * 0.13, 0.0), 0.18))
	return unir(piezas)




static func edificio(ancho: float, alto: float, fondo: float, giro: float, tipo: String, semilla: int) -> ArrayMesh:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = semilla
	var nave: bool = tipo != "casa"
	var pared: Color = Color("9e9b89") if nave else Color("baa88c")
	pared = pared.darkened(rng.randf_range(0.0, 0.1))
	var cubierta: Color = Color("778082") if nave else Color("85674e")
	var piezas: Array = []
	piezas.append(_pieza(_caja(Vector3(ancho, alto, fondo)), Vector3(0.0, alto * 0.5, 0.0), pared))
	var tejado: PrismMesh = PrismMesh.new()
	var pico: float = ancho *(0.17 if nave else 0.3)
	tejado.size = Vector3(ancho + 1.0, pico, fondo + 1.0)
	piezas.append(_pieza(tejado, Vector3(0.0, alto + pico * 0.5, 0.0), cubierta))




	var ventanas: Color = Color("4d6469").lerp(Color("9b7958"), rng.randf_range(0.0, 0.22))
	for i in (3 if nave else 2):
		var x: float =(float(i) -(1.0 if nave else 0.5)) * ancho * 0.27
		piezas.append(_pieza(_caja(Vector3(ancho * 0.15, 1.8, 0.12)), Vector3(x, alto - 2.8, fondo * 0.5 + 0.08), ventanas))
	piezas.append(_pieza(_caja(Vector3(0.12, 2.1, fondo * 0.23)), Vector3(ancho * 0.5 + 0.08, alto - 3.1, 0.0), ventanas))
	piezas.append(_pieza(_caja(Vector3(ancho *(0.25 if nave else 0.12), alto * 0.48, 0.14)),
		Vector3(ancho * 0.24, alto * 0.24, fondo * 0.5 + 0.09), Color("655b4a")))

	piezas.append(_pieza(_caja(Vector3(ancho * 0.075, alto * 0.22, 0.1)),
		Vector3(- ancho * 0.34, alto * 0.77, fondo * 0.5 + 0.065), Color("887459") if nave else pared.darkened(0.16)))
	var parche: Array = []
	parche.resize(Mesh.ARRAY_MAX)
	var verts: PackedVector3Array = PackedVector3Array()
	for v in [Vector2(0.14, -0.24), Vector2(0.31, -0.24), Vector2(0.14, 0.08), Vector2(0.31, 0.08)]:
		var x: float = v.x *(ancho + 1.0)
		verts.append(Vector3(x, alto + pico *(1.0 - 2.0 * x /(ancho + 1.0)) + 0.035, v.y * fondo))
	parche[Mesh.ARRAY_VERTEX] = verts
	parche[Mesh.ARRAY_INDEX] = PackedInt32Array([0, 1, 2, 1, 3, 2, 2, 1, 0, 2, 3, 1])
	piezas.append(_pieza_arrays(parche, cubierta.lightened(0.16)))
	var rotacion: Basis = Basis(Vector3.UP, deg_to_rad(giro))
	for p in piezas:
		p["pose"] = Transform3D(rotacion, Vector3.ZERO) * Transform3D(p["pose"])
	return unir(piezas)
