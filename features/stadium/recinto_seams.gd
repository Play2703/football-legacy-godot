extends RefCounted



const Exterior = preload("res://features/stadium/exterior_detail.gd")
const EPS: float = 5e-05




static func cortes(anillo: Array) -> Array:
	if anillo.size() < 3:
		return anillo
	var centro := Vector2.ZERO
	for d in anillo:
		var p: Vector3 = d["pos"]
		centro += Vector2(p.x, p.z)
	centro /= float(anillo.size())
	var orden: Array = []
	for i in anillo.size():
		var p: Vector3 = anillo[i]["pos"]
		orden.append({"i": i, "angulo": atan2(p.z - centro.y, p.x - centro.x)})
	orden.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["angulo"]) < float(b["angulo"]))
	for k in orden.size():
		var i: int = int(orden[k]["i"])
		var d: Dictionary = anillo[i]
		var p: Vector3 = d["pos"]
		var giro: Basis = Basis(Vector3.UP, deg_to_rad(float(d["face"])))
		var limites: Array[Vector3] = []
		var prominencias: Array[String] = []
		for vecino in [int(orden[posmod(k - 1, orden.size())]["i"]),
				int(orden[(k + 1) % orden.size()]["i"])]:
			var otro: Dictionary = anillo[vecino]
			var q: Vector3 = otro["pos"]
			var ni: Vector2 = _normal(float(d["face"]))
			var nj: Vector2 = _normal(float(otro["face"]))
			var normal: Vector2 = ni - nj
			var termino: float = ni.dot(Vector2(p.x, p.z)) - nj.dot(Vector2(q.x, q.z))


			if normal.length_squared() < EPS * EPS:
				normal = Vector2(q.x - p.x, q.z - p.z).normalized()
				termino = normal.dot(Vector2(p.x + q.x, p.z + q.z) * 0.5)
			if normal.length_squared() < EPS * EPS:
				continue
			var longitud: float = normal.length()
			normal /= longitud
			termino /= longitud
			if normal.dot(Vector2(p.x, p.z)) > termino:
				normal = - normal
				termino = - termino
			var local: Vector3 = giro.inverse() * Vector3(normal.x, 0, normal.y)
			limites.append(Vector3(local.x, local.z,
				termino - normal.dot(Vector2(p.x, p.z))))
			prominencias.append(String(otro.get("prom", "full")))
		d["cortes"] = limites
		d["vecinos"] = prominencias
	return anillo


static func _normal(face: float) -> Vector2:
	var a: float = deg_to_rad(face)
	return Vector2(sin(a), cos(a))




static func contiene(root: Node3D, p: Vector3, margen: float = 0.0) -> bool:
	for plano in root.get_meta("recinto_cortes", []):
		if _distancia(plano, p) < margen - EPS:
			return false
	return true




static func limites(root: Node3D, z: float, margen: float = 0.0) -> Vector2:
	var intervalo := Vector2(- INF, INF)
	for plano in root.get_meta("recinto_cortes", []):
		var normal_x: float = float(plano.x)
		var termino: float = float(plano.z) - float(plano.y) * z - margen
		if absf(normal_x) < EPS:
			if termino < - EPS: return Vector2(INF, - INF)
		elif normal_x > 0.0:
			intervalo.y = minf(intervalo.y, termino / normal_x)
		else:
			intervalo.x = maxf(intervalo.x, termino / normal_x)
	return intervalo


static func _distancia(plano: Vector3, p: Vector3) -> float:
	return plano.z - plano.x * p.x - plano.y * p.z








static func recortar(root: Node3D) -> void:
	var planos: Array = root.get_meta("recinto_cortes", [])
	if planos.is_empty():
		return
	_recorrer(root, Transform3D.IDENTITY, planos)
	_soltar_copias(root)




static func _soltar_copias(nodo: Node) -> void:
	if nodo is MeshInstance3D:
		var m: Mesh =(nodo as MeshInstance3D).mesh
		if m != null and m.has_meta(Exterior.META_ARRAYS):
			m.remove_meta(Exterior.META_ARRAYS)
	for hijo in nodo.get_children():
		_soltar_copias(hijo)


static func _recorrer(nodo: Node, pose: Transform3D, planos: Array) -> void:
	if nodo is MeshInstance3D:
		_recortar_malla(nodo as MeshInstance3D, pose, planos)
	for hijo in nodo.get_children():
		var siguiente: Transform3D = pose
		if hijo is Node3D:
			siguiente *=(hijo as Node3D).transform
		_recorrer(hijo, siguiente, planos)




static func _estado_caja(caja: AABB, pose: Transform3D, planos: Array) -> int:
	var entera: bool = true
	for plano in planos:
		var minimo: float = INF
		var maximo: float = - INF
		for i in 8:
			var p: Vector3 = pose * caja.get_endpoint(i)
			var distancia: float = _distancia(plano, p)
			minimo = minf(minimo, distancia)
			maximo = maxf(maximo, distancia)
		if maximo < - EPS:
			return -1
		if minimo < - EPS:
			entera = false
	return 1 if entera else 0


static func _recortar_malla(pieza: MeshInstance3D, pose: Transform3D,
		planos: Array) -> void:
	var original: Mesh = pieza.mesh
	if original == null:
		return
	var estado: int = _estado_caja(original.get_aabb(), pose, planos)
	if estado == 1:
		return
	if estado == -1:
		pieza.visible = false
		return


	if original is ArrayMesh and (original as ArrayMesh).get_blend_shape_count() > 0:
		return





	var leidos: Array = []
	for s in original.get_surface_count():
		var a: Array = Exterior.arrays_de(original, s)
		if a.is_empty():
			return
		leidos.append(a)
	var salida := ArrayMesh.new()
	salida.lightmap_size_hint = original.lightmap_size_hint
	var reemplazos: Array[Material] = []
	for s in original.get_surface_count():
		var arrays: Array = leidos[s]
		var primitiva: int =(original as ArrayMesh).surface_get_primitive_type(s) \
				if original is ArrayMesh else Mesh.PRIMITIVE_TRIANGLES
		var formato: int =(original as ArrayMesh).surface_get_format(s) if original is ArrayMesh else 0
		var nuevos: Array = _superficie(arrays, primitiva, formato, pose, planos)
		if nuevos.is_empty():
			continue
		var indice: int = salida.get_surface_count()


		var flags: int = formato&~((1<<Mesh.ARRAY_MAX) - 1)
		var tipo: int = Mesh.PRIMITIVE_TRIANGLES if primitiva == Mesh.PRIMITIVE_TRIANGLE_STRIP else primitiva
		salida.add_surface_from_arrays(tipo, nuevos, [], {}, flags)
		salida.surface_set_material(indice, original.surface_get_material(s))
		if original is ArrayMesh:
			salida.surface_set_name(indice,(original as ArrayMesh).surface_get_name(s))
		reemplazos.append(pieza.get_surface_override_material(s))
	if salida.get_surface_count() == 0:
		pieza.visible = false
		return
	pieza.mesh = salida


	for s in reemplazos.size():
		pieza.set_surface_override_material(s, reemplazos[s])


static func _superficie(arrays: Array, primitiva: int, formato: int,
		pose: Transform3D, planos: Array) -> Array:
	if arrays.is_empty() or arrays[Mesh.ARRAY_VERTEX] == null:
		return []
	if primitiva not in [Mesh.PRIMITIVE_TRIANGLES, Mesh.PRIMITIVE_TRIANGLE_STRIP]:
		return arrays
	var vertices: PackedVector3Array = arrays[Mesh.ARRAY_VERTEX]
	if vertices.is_empty():
		return []
	var esquema: Array = _esquema(arrays, vertices.size(), formato)
	var salida: Array = []
	salida.resize(Mesh.ARRAY_MAX)
	for canal in esquema:
		var slot: int = int(canal["slot"])
		var vacio = arrays[slot].duplicate()
		vacio.resize(0)
		salida[slot] = vacio
	var indices: PackedInt32Array = arrays[Mesh.ARRAY_INDEX] if arrays[Mesh.ARRAY_INDEX] != null else PackedInt32Array()
	if indices.is_empty():
		indices.resize(vertices.size())
		for i in indices.size(): indices[i] = i
	var triangulos: int = indices.size() / 3 if primitiva == Mesh.PRIMITIVE_TRIANGLES else maxi(0, indices.size() - 2)
	for t in triangulos:
		var base: int = t * 3 if primitiva == Mesh.PRIMITIVE_TRIANGLES else t
		var ids: Array[int] = [indices[base], indices[base + 1], indices[base + 2]]
		if primitiva == Mesh.PRIMITIVE_TRIANGLE_STRIP and t % 2 == 1:
			ids = [ids[1], ids[0], ids[2]]
		var poligono: Array = []
		for id in ids:
			poligono.append(_leer(arrays, id, esquema))
		for plano in planos:
			poligono = _cortar_poligono(poligono, plano, pose, esquema)
			if poligono.size() < 3: break
		for i in range(1, poligono.size() - 1):
			var a: Vector3 = poligono[0][Mesh.ARRAY_VERTEX]
			var b: Vector3 = poligono[i][Mesh.ARRAY_VERTEX]
			var c: Vector3 = poligono[i + 1][Mesh.ARRAY_VERTEX]
			if (b - a).cross(c - a).length_squared() < 1e-12:
				continue
			for vertice in [poligono[0], poligono[i], poligono[i + 1]]:
				_anadir(salida, vertice, esquema)
	if (salida[Mesh.ARRAY_VERTEX] as PackedVector3Array).is_empty():
		return []
	return salida


static func _esquema(arrays: Array, cantidad: int, formato: int) -> Array:
	var resultado: Array = []
	for slot in Mesh.ARRAY_INDEX:
		var datos = arrays[slot]
		if datos == null or datos.size() == 0: continue
		var agrupado: bool = typeof(datos) in [TYPE_PACKED_FLOAT32_ARRAY, TYPE_PACKED_FLOAT64_ARRAY,
			TYPE_PACKED_INT32_ARRAY, TYPE_PACKED_INT64_ARRAY, TYPE_PACKED_BYTE_ARRAY]
		var paso: int = datos.size() / cantidad if agrupado else 1
		var custom: int = -1
		if slot >= Mesh.ARRAY_CUSTOM0 and slot <= Mesh.ARRAY_CUSTOM3:
			custom =(formato>>(Mesh.ARRAY_FORMAT_CUSTOM0_SHIFT +(slot - Mesh.ARRAY_CUSTOM0) * Mesh.ARRAY_FORMAT_CUSTOM_BITS))&Mesh.ARRAY_FORMAT_CUSTOM_MASK
		resultado.append({"slot": slot, "paso": paso, "agrupado": agrupado,
			"bytes": typeof(datos) == TYPE_PACKED_BYTE_ARRAY, "custom": custom})
	return resultado


static func _leer(arrays: Array, indice: int, esquema: Array) -> Array:
	var resultado: Array = []
	resultado.resize(Mesh.ARRAY_MAX)
	for canal in esquema:
		var slot: int = int(canal["slot"])
		if not bool(canal["agrupado"]):
			resultado[slot] = arrays[slot][indice]
			continue
		var valores: Array = []
		var paso: int = int(canal["paso"])
		var mitad: bool = bool(canal["bytes"]) and int(canal["custom"]) in [Mesh.ARRAY_CUSTOM_RG_HALF, Mesh.ARRAY_CUSTOM_RGBA_HALF]
		var salto: int = 2 if mitad else 1
		for k in range(0, paso, salto):
			if mitad:
				valores.append((arrays[slot] as PackedByteArray).decode_half(indice * paso + k))
			elif bool(canal["bytes"]) and int(canal["custom"]) == Mesh.ARRAY_CUSTOM_RGBA8_SNORM:
				valores.append((arrays[slot] as PackedByteArray).decode_s8(indice * paso + k))
			else:
				valores.append(arrays[slot][indice * paso + k])
		resultado[slot] = valores
	return resultado


static func _cortar_poligono(vertices: Array, plano: Vector3,
		pose: Transform3D, esquema: Array) -> Array:
	if vertices.is_empty(): return []
	var salida: Array = []
	var previo: Array = vertices[-1]
	var dp: float = _distancia(plano, pose *(previo[Mesh.ARRAY_VERTEX] as Vector3))
	for actual in vertices:
		var da: float = _distancia(plano, pose *(actual[Mesh.ARRAY_VERTEX] as Vector3))
		var previo_dentro: bool = dp >= - EPS
		var actual_dentro: bool = da >= - EPS
		if previo_dentro != actual_dentro:
			var f: float = clampf(dp /(dp - da), 0.0, 1.0)
			salida.append(_interpolar(previo, actual, f, esquema))
		if actual_dentro: salida.append(actual)
		previo = actual
		dp = da
	return salida


static func _interpolar(a: Array, b: Array, f: float, esquema: Array) -> Array:
	var resultado: Array = []
	resultado.resize(Mesh.ARRAY_MAX)
	for canal in esquema:
		var slot: int = int(canal["slot"])
		if bool(canal["agrupado"]):


			if slot in [Mesh.ARRAY_BONES, Mesh.ARRAY_WEIGHTS]:
				resultado[slot] = a[slot] if f < 0.5 else b[slot]
				continue
			var valores: Array = []
			for k in (a[slot] as Array).size():
				valores.append(lerpf(float(a[slot][k]), float(b[slot][k]), f))
			if slot == Mesh.ARRAY_TANGENT:
				var eje: Vector3 = Vector3(valores[0], valores[1], valores[2]).normalized()
				valores = [eje.x, eje.y, eje.z, a[slot][3] if f < 0.5 else b[slot][3]]
			resultado[slot] = valores
		else:
			resultado[slot] = a[slot].lerp(b[slot], f)
			if slot == Mesh.ARRAY_NORMAL:
				resultado[slot] =(resultado[slot] as Vector3).normalized()
	return resultado


static func _anadir(arrays: Array, vertice: Array, esquema: Array) -> void:
	for canal in esquema:
		var slot: int = int(canal["slot"])
		if not bool(canal["agrupado"]):
			arrays[slot].append(vertice[slot])
			continue
		if bool(canal["bytes"]):
			var bloque := PackedByteArray()
			bloque.resize(int(canal["paso"]))
			var custom: int = int(canal["custom"])
			for k in (vertice[slot] as Array).size():
				var valor: float = float(vertice[slot][k])
				if custom in [Mesh.ARRAY_CUSTOM_RG_HALF, Mesh.ARRAY_CUSTOM_RGBA_HALF]:
					bloque.encode_half(k * 2, valor)
				elif custom == Mesh.ARRAY_CUSTOM_RGBA8_SNORM:
					bloque.encode_s8(k, clampi(roundi(valor), -128, 127))
				else:
					bloque[k] = clampi(roundi(valor), 0, 255)
			arrays[slot].append_array(bloque)
		else:
			for valor in vertice[slot]: arrays[slot].append(valor)
