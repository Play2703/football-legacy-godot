extends RefCounted






















const SenaDeClub = preload("res://features/stadium/sena_club.gd")

const DESGASTE: float = 0.18
const POSTE_BANDAS: int = 6
const POSTE_BANDA_H: float = 0.5
const BOCINA_BAJO: float = 1.3
const BOCINA_LARGO: float = 0.6
const BOCINA_BOCA: float = 0.32
const TUBO_R: float = 0.045
const TUBO_BAJO_Y: float = 1.05
const TUBO_PASO: float = 1.5
const CARTELA_H: float = 1.0
const CANTINA: Vector3 = Vector3(4.2, 2.5, 2.8)
const CANTINA_R: float = 4.6
const CANTINA_ATRAS: float = 4.6
const CANTINA_ESQUINA: float = 6.5




static func activo(est) -> bool:
	return int(est.div) >= 3 and not Teams.by_id(est._pitch_seed_club()).is_empty()


static func _pintura(c: Color) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = c.lerp(Color(0.55, 0.55, 0.55), DESGASTE)
	m.roughness = 0.9
	return m









static func poste(est, pole: MeshInstance3D, alto: float) -> void:
	if not activo(est):
		return
	var cols: Array[Color] = SenaDeClub.par(est)
	var mats: Array[StandardMaterial3D] = [_pintura(cols[0]), _pintura(cols[1])]
	var cyl: CylinderMesh = pole.mesh
	for k in POSTE_BANDAS:
		var y: float = - alto * 0.5 +(float(k) + 0.5) * POSTE_BANDA_H


		var r: float = lerpf(cyl.bottom_radius, cyl.top_radius,
			(y + alto * 0.5) / alto) + 0.012
		var banda: MeshInstance3D = MeshInstance3D.new()
		var bm: CylinderMesh = CylinderMesh.new()
		bm.top_radius = r
		bm.bottom_radius = r + 0.004
		bm.height = POSTE_BANDA_H
		bm.radial_segments = 10
		bm.rings = 1
		banda.mesh = bm
		banda.material_override = mats[k % 2]
		banda.position = Vector3(0.0, y, 0.0)
		banda.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		pole.add_child(banda)
	_bocinas(est, pole, alto)


static func _bocinas(est, pole: MeshInstance3D, alto: float) -> void:
	var gris: StandardMaterial3D = StandardMaterial3D.new()
	gris.albedo_color = Color("d4d3cb")
	gris.roughness = 0.7
	var y: float = alto * 0.5 - BOCINA_BAJO
	var cuenco: Node3D = pole.get_parent()
	var pie: Vector3 = pole.position - Vector3(0.0, alto * 0.5, 0.0)


	var al_campo: Vector3 = Vector3(- pie.x, 0.0, est.HALF_LINE - pie.z).normalized()
	var fuera: Vector3 =(- al_campo).rotated(Vector3.UP, deg_to_rad(60.0))
	for i in 2:
		var dir: Vector3 = al_campo if i == 0 else fuera
		var pivote: Node3D = Node3D.new()
		pivote.position = Vector3(0.0, y - 0.25 * float(i), 0.0) + dir * 0.28
		pole.add_child(pivote)
		pivote.name = "Bocina%d" % i

		var objetivo: Vector3 = pole.position + pivote.position + dir * 10.0 + Vector3(0.0, -2.5, 0.0)
		pivote.look_at(cuenco.to_global(objetivo))
		var bocina: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = 0.07
		cm.bottom_radius = BOCINA_BOCA
		cm.height = BOCINA_LARGO
		cm.radial_segments = 10
		cm.rings = 1
		bocina.mesh = cm
		bocina.material_override = gris



		bocina.rotation_degrees = Vector3(90.0, 0.0, 0.0)
		bocina.position = Vector3(0.0, 0.0, - BOCINA_LARGO * 0.5)
		bocina.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		pivote.add_child(bocina)






static func color_postes(est, de_serie: Color) -> Color:
	if not activo(est):
		return de_serie
	return SenaDeClub.par(est)[0].lerp(Color(0.55, 0.55, 0.55), DESGASTE)




static func valla(est, root: Node3D, centro: Vector3, largo: float, lateral: bool) -> void:
	if not activo(est):
		return
	var cols: Array[Color] = SenaDeClub.par(est)
	var panos: int = maxi(1, int(round(largo / TUBO_PASO)))
	var img: Image = Image.create(1, panos, false, Image.FORMAT_RGBA8)
	for k in panos:
		img.set_pixel(0, k, cols[k % 2].lerp(Color(0.55, 0.55, 0.55), DESGASTE))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.8
	for y in [est.FENCE_H, TUBO_BAJO_Y]:
		var tubo: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = TUBO_R
		cm.bottom_radius = TUBO_R
		cm.height = largo
		cm.radial_segments = 6
		cm.rings = 1
		tubo.mesh = cm


		tubo.material_override = mat
		tubo.rotation_degrees = Vector3(90.0, 0.0, 0.0) if lateral else Vector3(0.0, 0.0, 90.0)
		tubo.position = Vector3(centro.x, y, centro.z)
		tubo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		root.add_child(tubo)
		tubo.name = "TuboValla"








static func marcador(est, root: Node3D, s: float) -> void:
	if not activo(est):
		return
	var cols: Array[Color] = SenaDeClub.par(est)
	var ancho: float = 10.4 * s
	var cartela: Node3D = Node3D.new()
	root.add_child(cartela)
	cartela.name = "CartelaClub"
	cartela.position = Vector3(0.0, 1.7 * s + CARTELA_H * 0.5 + 0.05, 0.0)
	var fondo: StandardMaterial3D = _pintura(cols[0])
	SenaDeClub._caja(cartela, Vector3(ancho, CARTELA_H, 0.14), fondo, Vector3.ZERO)
	SenaDeClub._caja(cartela, Vector3(ancho * 0.34, CARTELA_H - 0.16, 0.02),
		_pintura(cols[1]), Vector3(0.0, 0.0, 0.08))
	var escudo: MeshInstance3D = SenaDeClub._escudo_real(est, cartela, CARTELA_H * 1.25)
	if escudo != null:
		escudo.position = Vector3(0.0, 0.08, 0.1)
		escudo.name = "EscudoMarcador"








static func monta(est) -> void:
	if not activo(est):
		return
	var roots: Array = []
	for r in est._stand_roots:
		if r != null and is_instance_valid(r) and r.has_meta("celu_largo"):
			roots.append(r)
	var sitio: Array = _sitio(est, roots)
	if not sitio.is_empty():
		cantina(est, sitio[0], sitio[1])










static func _sitio(est, roots: Array) -> Array:
	var z: float = - est.FENCE_END_OUT - est._ring_pad_z() - CANTINA_ATRAS
	var relleno: String = est._end_fill()
	var y: float = 0.0
	if relleno == "cars":


		z = -12.3 - 3.5 - CANTINA.z * 0.5 - 1.8
	elif relleno == "bank":


		var rad: float = deg_to_rad(est.BANK_DEG)
		y = cos(rad) * est.BANK_LEN
		z = est.BANK_FOOT_Z - sin(rad) * est.BANK_LEN - CANTINA.z * 0.5 - 1.2
	var xs: Array = [11.0, -25.0]
	if est._obra_sitio:
		xs = [-25.0]
	for x in xs:
		var p: Vector3 = Vector3(x, y, z)
		if _libre(roots, p):
			return [p, 0.0]
	var fx: float = est._fence_x() + CANTINA_ESQUINA
	for lado in [1.0, -1.0]:
		var p: Vector3 = Vector3(lado * fx, 0.0, - est.FENCE_END_OUT * 0.5)
		if lado > 0.0 and est._obra_sitio:
			continue
		if _libre(roots, p):
			return [p, - lado * PI * 0.5]
	return []


static func _libre(roots: Array, p: Vector3) -> bool:
	for root in roots:
		var largo: float = float(root.get_meta("celu_largo"))
		var l: Vector3 = root.transform.affine_inverse() * p
		if absf(l.x) < largo * 0.5 + CANTINA_R and l.z < 1.0 + CANTINA_R and l.z > -40.0:
			return false
	return true


static func cantina(est, sitio: Vector3, giro: float = 0.0) -> Node3D:
	var cols: Array[Color] = SenaDeClub.par(est)
	var raiz: Node3D = Node3D.new()
	raiz.position = sitio
	raiz.rotation = Vector3(0.0, giro, 0.0)
	est._bowl_root().add_child(raiz)
	raiz.name = "CantinaClub"

	var cal: StandardMaterial3D = StandardMaterial3D.new()
	cal.albedo_color = Color("e6e0d0")
	cal.roughness = 1.0
	var w: float = CANTINA.x
	var h: float = CANTINA.y
	var d: float = CANTINA.z
	SenaDeClub._caja(raiz, Vector3(w, h, d), cal, Vector3(0.0, h * 0.5, 0.0))

	SenaDeClub._caja(raiz, Vector3(w + 0.02, 0.55, d + 0.02), _pintura(cols[0]),
		Vector3(0.0, 0.275, 0.0))
	SenaDeClub._caja(raiz, Vector3(w + 0.02, 0.3, d + 0.02), _pintura(cols[1]),
		Vector3(0.0, h - 0.15, 0.0))

	var hueco: StandardMaterial3D = StandardMaterial3D.new()
	hueco.albedo_color = Color("2a2622")
	hueco.roughness = 1.0
	SenaDeClub._caja(raiz, Vector3(w * 0.62, 0.95, 0.04), hueco,
		Vector3(0.0, 1.55, d * 0.5 + 0.01))
	var madera: StandardMaterial3D = StandardMaterial3D.new()
	madera.albedo_color = Color("7a5a3a")
	madera.roughness = 1.0
	SenaDeClub._caja(raiz, Vector3(w * 0.7, 0.08, 0.5), madera,
		Vector3(0.0, 1.06, d * 0.5 + 0.25))

	var escudo: MeshInstance3D = SenaDeClub._escudo_real(est, raiz, 0.85)
	if escudo != null:
		escudo.position = Vector3(w * 0.5 - 0.45, 2.05, d * 0.5 + 0.03)
		escudo.name = "EscudoCantina"
	_tejadillo(raiz, cols, w, h, d)
	_mesas(raiz, d)
	_barbacoa(raiz, w, d)
	_gente(est, raiz, d)


	est._register_occluder(raiz)
	return raiz




static func _tejadillo(raiz: Node3D, cols: Array[Color], w: float, h: float, d: float) -> void:
	var vuelo: float = 1.6
	var fondo: float = d + vuelo + 0.3
	var panos: int = 7
	var img: Image = Image.create(panos, 1, false, Image.FORMAT_RGBA8)
	for k in panos:
		img.set_pixel(k, 0, cols[k % 2].lerp(Color(0.55, 0.55, 0.55), DESGASTE))
	var chapa: StandardMaterial3D = StandardMaterial3D.new()
	chapa.albedo_texture = ImageTexture.create_from_image(img)
	chapa.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	chapa.roughness = 0.7
	var caida: float = 0.45
	var teja: MeshInstance3D = MeshInstance3D.new()
	var bm: BoxMesh = BoxMesh.new()
	bm.size = Vector3(w + 0.6, 0.08, fondo)
	teja.mesh = bm
	teja.material_override = chapa
	teja.position = Vector3(0.0, h + 0.15 - caida * 0.5,(vuelo - 0.3) * 0.5)
	teja.rotation = Vector3(atan2(caida, fondo), 0.0, 0.0)
	teja.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(teja)
	var hierro: StandardMaterial3D = StandardMaterial3D.new()
	hierro.albedo_color = Color("4d5257")
	var alto: float = h + 0.15 - caida
	for sx in [-1.0, 1.0]:
		SenaDeClub._caja(raiz, Vector3(0.08, alto, 0.08), hierro,
			Vector3(sx *(w * 0.5 + 0.1), alto * 0.5, d * 0.5 + vuelo - 0.1))



static func _mesas(raiz: Node3D, d: float) -> void:
	var plastico: StandardMaterial3D = StandardMaterial3D.new()
	plastico.albedo_color = Color("eeeee6")
	plastico.roughness = 0.6
	for m in [Vector3(-1.2, 0.0, d * 0.5 + 2.6), Vector3(1.0, 0.0, d * 0.5 + 3.3)]:
		var tablero: MeshInstance3D = MeshInstance3D.new()
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = 0.42
		cm.bottom_radius = 0.42
		cm.height = 0.04
		cm.radial_segments = 12
		cm.rings = 1
		tablero.mesh = cm
		tablero.material_override = plastico
		tablero.position = m + Vector3(0.0, 0.72, 0.0)
		tablero.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		raiz.add_child(tablero)
		SenaDeClub._caja(raiz, Vector3(0.06, 0.7, 0.06), plastico, m + Vector3(0.0, 0.36, 0.0))
		for k in 3:
			var a: float = TAU * float(k) / 3.0 + 0.4
			var p: Vector3 = m + Vector3(sin(a), 0.0, cos(a)) * 0.75
			var silla: Node3D = Node3D.new()
			silla.position = p
			raiz.add_child(silla)
			silla.rotation = Vector3(0.0, a + PI, 0.0)
			SenaDeClub._caja(silla, Vector3(0.44, 0.05, 0.42), plastico, Vector3(0.0, 0.44, 0.0))
			SenaDeClub._caja(silla, Vector3(0.44, 0.44, 0.05), plastico, Vector3(0.0, 0.68, 0.2))
			for lx in [-0.19, 0.19]:
				for lz in [-0.18, 0.18]:
					SenaDeClub._caja(silla, Vector3(0.04, 0.42, 0.04), plastico,
						Vector3(lx, 0.21, lz))





static func _barbacoa(raiz: Node3D, w: float, d: float) -> void:
	var p: Vector3 = Vector3(w * 0.5 + 1.3, 0.0, d * 0.5 + 0.8)
	var hierro: StandardMaterial3D = StandardMaterial3D.new()
	hierro.albedo_color = Color("2b2b2d")
	hierro.roughness = 0.8
	SenaDeClub._caja(raiz, Vector3(1.1, 0.4, 0.55), hierro, p + Vector3(0.0, 0.85, 0.0))
	for lx in [-0.45, 0.45]:
		SenaDeClub._caja(raiz, Vector3(0.05, 0.65, 0.05), hierro, p + Vector3(lx, 0.33, 0.0))
	var brasa: StandardMaterial3D = StandardMaterial3D.new()
	brasa.albedo_color = Color("ff7a2a")
	brasa.emission_enabled = true
	brasa.emission = Color("ff5a1a")
	brasa.emission_energy_multiplier = 1.6
	SenaDeClub._caja(raiz, Vector3(0.95, 0.03, 0.42), brasa, p + Vector3(0.0, 1.06, 0.0))
	var humo: CPUParticles3D = CPUParticles3D.new()
	humo.amount = 12
	humo.lifetime = 4.0
	humo.preprocess = 4.0
	humo.local_coords = false
	humo.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	humo.emission_box_extents = Vector3(0.4, 0.05, 0.15)
	humo.direction = Vector3(0.0, 1.0, 0.0)
	humo.spread = 12.0
	humo.initial_velocity_min = 0.6
	humo.initial_velocity_max = 0.9
	humo.gravity = Vector3(0.35, 0.15, 0.1)
	var curva: Curve = Curve.new()
	curva.add_point(Vector2(0.0, 0.5))
	curva.add_point(Vector2(1.0, 2.2))
	humo.scale_amount_curve = curva
	var rampa: Gradient = Gradient.new()
	rampa.set_color(0, Color(0.82, 0.82, 0.8, 0.55))
	rampa.set_color(1, Color(0.9, 0.9, 0.9, 0.0))
	humo.color_ramp = rampa
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(0.7, 0.7)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.vertex_color_use_as_albedo = true
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	mat.albedo_texture = SenaDeClub._radial()
	q.material = mat
	humo.mesh = q
	humo.position = p + Vector3(0.0, 1.15, 0.0)
	humo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	humo.set_meta("occ_fuera", true)
	raiz.add_child(humo)
	humo.name = "HumoBarbacoa"





static func _gente(est, raiz: Node3D, d: float) -> void:
	var att: float = est._attendance() if est._att < 0.0 else est._att
	var n: int = 2 + int(round(clampf(att, 0.0, 1.0) * 3.0))
	var sitios: Array = [Vector3(-0.6, 0.75, d * 0.5 + 0.75), Vector3(0.7, 0.75, d * 0.5 + 0.8),
		Vector3(CANTINA.x * 0.5 + 1.3, 0.75, d * 0.5 + 1.5), Vector3(-1.9, 0.75, d * 0.5 + 1.6),
		Vector3(1.6, 0.75, d * 0.5 + 2.2)]
	var por_pose: Array = [[], [], []]
	for i in mini(n, sitios.size()):
		por_pose[i % 3].append(Transform3D(Basis.IDENTITY, sitios[i]))
	for pose in 3:
		if not por_pose[pose].is_empty():
			est._add_static_fans(raiz, por_pose[pose], true, est._host_stand_is_yours(),
				pose, 0, 1.0, 1.0)
