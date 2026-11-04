extends RefCounted


var bufandas: Array[Dictionary] = []
var suplentes: Array[Dictionary] = []
var chicos: Array[Node3D] = []
var devolucion: Dictionary = {}
var reloj: float = 0.0
var descanso: float = 0.0
var _textiles: Dictionary = {}
var _cupo_local: int = 0
var _cupo_visitante: int = 0
var _halo: ImageTexture

func halo_prensa() -> ImageTexture:
	if _halo != null:
		return _halo
	var img := Image.create(32, 32, false, Image.FORMAT_RGBA8)
	for y in 32:
		for x in 32:
			var r: float = Vector2(x - 15.5, y - 15.5).length() / 15.5
			var a: float = pow(maxf(0.0, 1.0 - r), 2.0)
			img.set_pixel(x, y, Color(1, 1, 1, a))
	_halo = ImageTexture.create_from_image(img)
	return _halo

func sector(b: Dictionary, transforms: Array, a: Color, c: Color) -> void:


	if int(b["pose"]) != 0 or float(b["seat"]) > 0.38 or transforms.size() < 8:
		return
	if bool(b["local"]):
		if _cupo_local >= 16:
			return
		_cupo_local += 1
	else:
		if _cupo_visitante >= 8:
			return
		_cupo_visitante += 1
	var key: String = a.to_html() + c.to_html()
	if not _textiles.has(key):
		var img := Image.create(48, 20, false, Image.FORMAT_RGBA8)
		img.fill(Color.TRANSPARENT)
		for y in 20:
			for x in 48:


				if y < 6 or x < 4 or x > 43:
					img.set_pixel(x, y, c if y < 2 or x % 12 < 3 else a)
		_textiles[key] = ImageTexture.create_from_image(img)
	var mat := StandardMaterial3D.new()
	mat.albedo_texture = _textiles[key]
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.billboard_keep_scale = true
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	var quad := QuadMesh.new()
	quad.size = Vector2(1.1, 0.44)
	quad.material = mat
	var mm := MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = quad
	mm.instance_count = mini(8, transforms.size())


	var src := PackedInt32Array()
	for i in mm.instance_count:
		src.append(i * transforms.size() / mm.instance_count)
		var at: Transform3D = transforms[src[i]]
		at.origin.z += 0.08
		mm.set_instance_transform(i, at)
	var nodo := MultiMeshInstance3D.new()
	nodo.name = "BufandasAlzadas"
	nodo.multimesh = mm
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	nodo.set_meta("occ_gente", true)

	(b["mmi"] as Node3D).add_child(nodo)
	nodo.visible = false
	bufandas.append({"nodo": nodo, "sector": b, "src": src})






	b["bufandas"] = {"nodo": nodo, "src": src}








func recorta(dato: Dictionary, vivos: int) -> void:
	var mm: MultiMesh =(dato["nodo"] as MultiMeshInstance3D).multimesh
	var n: int =(dato["src"] as PackedInt32Array).bsearch(vivos)
	if n != mm.visible_instance_count:
		mm.visible_instance_count = n

func suplente(node: AnimatedSprite3D, estado: Dictionary) -> void:
	suplentes.append({"node": node, "estado": estado, "pos": node.position,
		"fase": float(suplentes.size()) * 2.3})

func devolver(destino: Vector3) -> bool:
	if not devolucion.is_empty() or descanso > 0.0 or not destino.is_finite():
		return false
	var mejor: Node3D = null
	var distancia: float = 25.0
	for chico in chicos:
		if not chico.visible or bool(chico.get_meta("down", false)):
			continue
		var d: float = chico.global_position.distance_to(destino)
		if d < distancia:
			distancia = d
			mejor = chico
	if mejor == null:
		return false
	var balon: Node3D = mejor.get_meta("ball")


	var borde := Vector3(clampf(destino.x, -35.2, 35.2), 0.12, clampf(destino.z, -1.2, 106.2))
	devolucion = {"chico": mejor, "ball": balon, "inicio": balon.position,
		"destino": mejor.global_transform.affine_inverse() * borde, "t": 0.0,
		"man": mejor.get_meta("man")}
	return true

func tick(delta: float, reaccion: bool, canta: bool, anim_home: String,
		anim_away: String, foco: Vector3, fotografos: Array) -> void:
	reloj += delta
	descanso = maxf(0.0, descanso - delta)
	for dato in bufandas:
		var b: Dictionary = dato["sector"]
		var nodo: MultiMeshInstance3D = dato["nodo"]
		var anim: String = anim_home if bool(b["home"]) else anim_away
		var alzar: bool =(reaccion and anim == "cheer" and int(b["cur"]) >= 0) \
				or (not reaccion and canta and bool(b["local"]) and bool(b["pogo"]))


		alzar = alzar and not bool(b.get("ola", false))
		nodo.visible = alzar
		if alzar:


			var cuadro: int = maxi(0, int(b["cur"])) % 4
			nodo.position.y = [-0.19, 0.09, 0.47, 0.33][cuadro] + 0.14
	for dato in suplentes:
		var node: AnimatedSprite3D = dato["node"]
		var estado: Dictionary = dato["estado"]


		if bool(estado["down"]) or not node.visible or Settings.reduce_motion:
			continue
		var base: Vector3 = dato["pos"]
		if reaccion:
			node.position = base
			node.rotation.z = 0.0
			continue


		var fase: float = fposmod(reloj + float(dato["fase"]), 14.0)
		var activo: bool = fase < 5.5
		node.position.y = base.y +(absf(sin(fase * 2.4)) * 0.065 if activo else 0.0)
		node.rotation.z = sin(fase * 1.2) * 0.045 if activo else 0.0
	if foco.is_finite():
		for fotografo: Node3D in fotografos:
			if bool(fotografo.get_meta("down", false)):
				continue
			var hacia: Vector3 = foco - fotografo.global_position
			var angulo: float = atan2(hacia.x, hacia.z)
			fotografo.global_rotation.y = lerp_angle(fotografo.global_rotation.y, angulo, minf(1.0, delta * 2.5))
	if devolucion.is_empty():
		return
	var chico: Node3D = devolucion["chico"]
	var ball: Node3D = devolucion["ball"]
	devolucion["t"] = float(devolucion["t"]) + delta
	var t: float = float(devolucion["t"])
	if bool(chico.get_meta("down", false)):
		ball.position = devolucion["inicio"]
		ball.visible = false
		devolucion.clear()
		descanso = 8.0
		return
	var inicio: Vector3 = devolucion["inicio"]
	var man: Node3D = devolucion["man"]

	man.rotation.z = sin(minf(t / 0.65, 1.0) * PI) * -0.16
	if t < 0.5:
		ball.position = inicio.lerp(inicio + Vector3(0, 0.65, 0), t * 2.0)
	elif t < 2.0:
		var u: float =(t - 0.5) / 1.5
		ball.position =(inicio + Vector3(0, 0.65, 0)).lerp(devolucion["destino"], u)
		ball.position.y += sin(u * PI) * 0.6
	elif t < 3.5:
		ball.visible = false
	else:
		ball.position = inicio
		ball.visible = true
		devolucion.clear()
		descanso = 8.0
