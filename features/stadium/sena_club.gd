extends RefCounted


























const _DETALLE = preload("res://features/stadium/exterior_detail.gd")
const PERIMETRO_POOL: Dictionary = {
	1: ["ras", "metacrilato", "reja", "foso"],
	2: ["ras", "reja", "reja", "foso", "metacrilato"],
}
const DIBUJO_POOL: Array = ["franjas", "ano", "escudo"]

const MURO_H: float = 2.2
const REJA_H: float = 2.4
const REJA_FOSO_H: float = 3.0
const META_H: float = 1.3
const FOSO_W: float = 1.1
const LEYENDA_MIN_LEN: float = 40.0



const ESTATUA_H: float = 3.6
const PEANA_H: float = 2.4
const PEANA_W: float = 1.6


static func perimetro_de(est) -> String:
	if est.has_meta("sena_perimetro"):
		return String(est.get_meta("sena_perimetro"))
	var pool: Array = PERIMETRO_POOL.get(int(est.div), [])
	if pool.is_empty():
		return "ras"
	return String(pool[posmod(hash(est._pitch_seed_club() + "/perimetro"), pool.size())])


static func dibujo_de(est) -> String:
	if est.has_meta("sena_dibujo"):
		return String(est.get_meta("sena_dibujo"))
	return String(DIBUJO_POOL[posmod(hash(est._pitch_seed_club() + "/dibujo"), DIBUJO_POOL.size())])





static func fundacion_de(est) -> int:
	return 1885 + posmod(hash(est._pitch_seed_club() + "/fundado"), 76)





static func leyenda_de(est) -> String:
	var nombre: String = Squad.person_name(String(est._country),
		hash(est._pitch_seed_club() + "/leyenda"))
	var partes: PackedStringArray = nombre.split(" ", false)
	var apellido: String = partes[partes.size() - 1] if partes.size() > 0 else ""
	return est._pixel_safe(apellido).strip_edges().left(12)













const RED_MALLAS: Array = ["cuadrada", "hexagonal"]
const RED_TINTES: Array = ["blanca", "club"]
const RED_AIRE: float = 0.65


static func red_de(est) -> Dictionary:
	var semilla: String = est._pitch_seed_club()



	var hs: int = hash(semilla + "/red")
	var malla: String = String(RED_MALLAS[(hs>>7)&1])
	var tinte: String = String(RED_TINTES[(hs>>13)&1])
	if int(est.div) > 2:
		malla = "cuadrada"
		tinte = "blanca"
	if est.has_meta("sena_red_malla"):
		malla = String(est.get_meta("sena_red_malla"))
	if est.has_meta("sena_red_tinte"):
		tinte = String(est.get_meta("sena_red_tinte"))
	return {"malla": malla, "tinte": tinte}





static func tinte_red(est) -> Color:
	var mejor: Color = Color.WHITE
	var sat: float = 0.3
	for c in [est._club_a, est._club_b]:
		var col: Color = c
		if col.s * col.v > sat:
			sat = col.s * col.v
			mejor = col
	return Color.WHITE.lerp(mejor, RED_AIRE) if mejor != Color.WHITE else Color.WHITE








static func textura_hex(hilo: Color, grosor: float) -> Image:
	const TILE: int = 96
	const LADO: float = 16.0
	var per_x: float = LADO * 3.0
	var per_y: float = float(TILE) / 3.0
	var esc_y: float =(LADO * sqrt(3.0)) / per_y
	var apotema: float = LADO * sqrt(3.0) * 0.5
	var img: Image = Image.create(TILE, TILE, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	for py in TILE:
		for px in TILE:
			var x: float = float(px) + 0.5
			var y: float =(float(py) + 0.5) * esc_y
			var ry: float = per_y * esc_y


			var h_min: float = INF
			for sub in 2:
				var ox: float = 0.0 if sub == 0 else per_x * 0.5
				var oy: float = 0.0 if sub == 0 else ry * 0.5
				var cx: float = ox + roundf((x - ox) / per_x) * per_x
				var cy: float = oy + roundf((y - oy) / ry) * ry
				var dx: float = absf(x - cx)
				var dy: float = absf(y - cy)
				var h: float = maxf(dy, dx * sqrt(3.0) * 0.5 + dy * 0.5)
				h_min = minf(h_min, h)
			var borde: float = apotema - h_min
			if borde < grosor:

				img.set_pixel(px, py, hilo.darkened(0.18) if borde < grosor * 0.5 else hilo)
	return img


static func monta(est) -> void:
	if int(est.div) > 2:
		return
	var roots: Array = []
	for r in est._stand_roots:
		if r != null and is_instance_valid(r) and r.has_meta("celu_largo"):
			roots.append(r)
	if roots.is_empty():
		return
	var estilo: String = perimetro_de(est)
	if estilo != "ras":
		for r in roots:
			_perimetro(est, r, estilo)
	var lado_dibujo: Node3D = _elige(est, roots, 1.0)
	if lado_dibujo != null:
		_dibujo(est, lado_dibujo)
	var principal: Node3D = _elige(est, roots, -1.0)
	var leyenda: String = leyenda_de(est)
	if principal != null and leyenda.length() >= 3:
		_nombre_tribuna(est, principal, leyenda)
	if leyenda.length() >= 3:
		_estatua(est, roots, leyenda)
	if gallardetes_de(est):
		for r in roots:
			_gallardetes(est, r)





static func _elige(est, roots: Array, signo: float) -> Node3D:
	var mejor: Node3D = null
	for r in roots:
		var x: float = r.position.x * signo
		if x < 20.0:
			continue
		if float(r.get_meta("celu_largo")) < LEYENDA_MIN_LEN:
			continue
		if r.has_meta("obra") or est._away_whole_stand(r.position):
			continue
		if r.get_node_or_null("SiglaButacas") != null \
				or r.get_node_or_null("ApellidoButacas") != null:
			continue
		if mejor == null or r.position.y > mejor.position.y + 0.5 \
				or (absf(r.position.y - mejor.position.y) <= 0.5
					and float(r.get_meta("celu_largo")) > float(mejor.get_meta("celu_largo"))):
			mejor = r
	return mejor








static func _perimetro(est, root: Node3D, estilo: String) -> void:
	if int(root.get_meta("recinto_piso", 0)) != 0 or root.position.y > 0.5:
		return
	if root.has_meta("obra") or root.has_meta("palco_pista"):
		return
	var largo: float = float(root.get_meta("celu_largo"))


	var tramos: Array = [[- largo * 0.5, largo * 0.5]]
	if absf(root.position.x) > 20.0:
		var hl: float = float(est.HALF_LINE)
		var c: Vector3 = root.transform.affine_inverse() * Vector3(root.position.x, 0.0, hl)
		var g: float = est._fence_gap_z()
		if absf(c.x) < largo * 0.5:
			tramos = [[- largo * 0.5, c.x - g], [c.x + g, largo * 0.5]]
	var base: Node3D = Node3D.new()
	base.name = "Perimetro_" + estilo
	root.add_child(base)
	for t in tramos:
		var a: float = float(t[0])
		var b: float = float(t[1])
		if b - a < 2.0:
			continue
		match estilo:
			"reja":
				_reja(est, base, a, b, MURO_H, REJA_H, 0.92)
			"foso":
				_foso(base, a, b)
				_reja(est, base, a, b, MURO_H, REJA_FOSO_H, 0.92)
			"metacrilato":
				_metacrilato(base, a, b)





static func _reja(est, base: Node3D, a: float, b: float, y0: float, h: float, z: float) -> void:
	var largo: float = b - a
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = est._cordon_texture()
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.roughness = 1.0
	mat.uv1_scale = Vector3(largo / 1.2, h / 1.2, 1.0)
	var pano: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(largo, h)
	pano.mesh = q
	pano.material_override = mat
	pano.position = Vector3((a + b) * 0.5, y0 + h * 0.5, z)
	pano.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	pano.name = "Reja"
	base.add_child(pano)

	var poste_mat: StandardMaterial3D = StandardMaterial3D.new()
	poste_mat.albedo_color = Color("4d565e")
	poste_mat.roughness = 0.6
	var n: int = maxi(1, int(largo / 4.0))
	for i in n + 1:
		var px: float = lerpf(a, b, float(i) / float(n))
		_caja(base, Vector3(0.08, h, 0.08), poste_mat, Vector3(px, y0 + h * 0.5, z))
	_caja(base, Vector3(largo, 0.07, 0.07), poste_mat, Vector3((a + b) * 0.5, y0 + h, z))





static func _foso(base: Node3D, a: float, b: float) -> void:
	var fondo: StandardMaterial3D = StandardMaterial3D.new()
	fondo.albedo_color = Color("23272b")
	fondo.roughness = 1.0
	var piso: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(b - a, FOSO_W)
	piso.mesh = q
	piso.material_override = fondo
	piso.rotation_degrees = Vector3(-90.0, 0.0, 0.0)
	piso.position = Vector3((a + b) * 0.5, 0.025, 1.0 + FOSO_W * 0.5)
	piso.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	piso.name = "Foso"
	base.add_child(piso)
	var bordillo: StandardMaterial3D = StandardMaterial3D.new()
	bordillo.albedo_color = Color("b9b4a8")
	bordillo.roughness = 1.0
	_caja(base, Vector3(b - a, 0.18, 0.16), bordillo,
		Vector3((a + b) * 0.5, 0.09, 1.0 + FOSO_W))




static func _metacrilato(base: Node3D, a: float, b: float) -> void:
	var vidrio: StandardMaterial3D = StandardMaterial3D.new()
	vidrio.albedo_color = Color(0.78, 0.88, 0.94, 0.26)
	vidrio.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	vidrio.cull_mode = BaseMaterial3D.CULL_DISABLED
	vidrio.roughness = 0.08
	vidrio.metallic_specular = 0.9
	var panel: MeshInstance3D = MeshInstance3D.new()
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(b - a, META_H)
	panel.mesh = q
	panel.material_override = vidrio
	panel.position = Vector3((a + b) * 0.5, MURO_H + META_H * 0.5, 0.9)
	panel.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	panel.name = "Metacrilato"
	base.add_child(panel)
	var alu: StandardMaterial3D = StandardMaterial3D.new()
	alu.albedo_color = Color("c9ced3")
	alu.metallic = 0.6
	alu.roughness = 0.35
	_caja(base, Vector3(b - a, 0.06, 0.08), alu, Vector3((a + b) * 0.5, MURO_H + META_H, 0.9))
	var n: int = maxi(1, int((b - a) / 2.0))
	for i in n + 1:
		var px: float = lerpf(a, b, float(i) / float(n))
		_caja(base, Vector3(0.05, META_H, 0.07), alu, Vector3(px, MURO_H + META_H * 0.5, 0.9))




















const ALERO_H: float = 1.1
const ESCUDO_ALERO_M: float = 3.7
const FRONTON_FONDO: float = 1.2
const FRONTON_W: float = 12.0
const FRONTON_CUERPO_H: float = 6.0
const FRONTON_REMATE_H: float = 2.4
const ARCO_R: float = 3.4
const MEDALLON_R: float = 2.2
const MEDALLON_Z: float = 0.5
const FRONTON_REMATES: Array = ["triangulo", "arco"]
const MASTIL_H: float = 12.5
const LETRA_ALERO_M: float = 0.85
const PANO_M: float = 4.5


static func _dibujo(est, root: Node3D) -> void:
	var tipo: String = dibujo_de(est)
	var alero: Dictionary = _alero(est, root)
	var largo: float = float(alero["largo"])
	var cara: float = float(alero["z"]) + 0.02
	var y: float = float(alero["y"])
	var pieza: MeshInstance3D
	match tipo:
		"escudo":
			pieza = _escudo_real(est, root, ESCUDO_ALERO_M)
			if pieza == null:
				pieza = _letras(root, est._pixel_safe(I18n.t("DESDE {0}").format(
					[str(fundacion_de(est))])), _color_letra(est, alero["color"]), LETRA_ALERO_M, largo * 0.6)
				tipo = "ano"
			else:
				y = _fronton(est, root, alero, cara)


				cara += MEDALLON_Z + 0.35
		"ano":
			pieza = _letras(root, est._pixel_safe(I18n.t("DESDE {0}").format(
				[str(fundacion_de(est))])), _color_letra(est, alero["color"]), LETRA_ALERO_M, largo * 0.6)
		_:
			pieza = _alero_pintado(est, root, largo)
	pieza.position = Vector3(0.0, y, cara + 0.01)
	pieza.name = "DibujoButacas_" + tipo
	pieza.set_meta("alero", alero["tipo"])

















static func _fronton(est, root: Node3D, alero: Dictionary, cara: float) -> float:
	var base: float = float(alero["base"])
	var mat: Material = alero["mat"]
	var club: Color = _club_vivo(est)
	var mclub: StandardMaterial3D = StandardMaterial3D.new()
	mclub.albedo_color = club
	mclub.roughness = 0.7
	var remate: String = FRONTON_REMATES[(hash(est._pitch_seed_club() + "/fronton")>>9)&1]
	if est.has_meta("sena_fronton"):
		remate = String(est.get_meta("sena_fronton"))
	var ancho: float = FRONTON_W
	var zc: float = cara - FRONTON_FONDO * 0.5
	var cuerpo: MeshInstance3D = _caja(root, Vector3(ancho, FRONTON_CUERPO_H, FRONTON_FONDO), mat,
		Vector3(0.0, base + FRONTON_CUERPO_H * 0.5, zc))
	cuerpo.name = "FrontonEscudo"
	cuerpo.set_meta("remate", remate)
	var y_top: float = base + FRONTON_CUERPO_H
	var tope: float
	if remate == "arco":
		var r: float = ARCO_R
		_disco(root, r + 0.35, FRONTON_FONDO - 0.3, mclub, Vector3(0.0, y_top, zc - 0.15)).name = "Moldura"
		_disco(root, r, FRONTON_FONDO, mat, Vector3(0.0, y_top, zc)).name = "Remate"
		tope = y_top + r
	else:
		_prisma(root, Vector3(ancho + 0.7, FRONTON_REMATE_H + 0.35, FRONTON_FONDO - 0.3), mclub,
			Vector3(0.0, y_top +(FRONTON_REMATE_H + 0.35) * 0.5, zc - 0.15)).name = "Moldura"
		_prisma(root, Vector3(ancho, FRONTON_REMATE_H, FRONTON_FONDO), mat,
			Vector3(0.0, y_top + FRONTON_REMATE_H * 0.5, zc)).name = "Remate"
		tope = y_top + FRONTON_REMATE_H

	_caja(root, Vector3(ancho + 0.9, 0.4, FRONTON_FONDO + 0.4), mclub,
		Vector3(0.0, y_top, zc + 0.2)).name = "Cornisa"
	_caja(root, Vector3(ancho + 0.3, 0.22, FRONTON_FONDO + 0.2), mclub,
		Vector3(0.0, base + ALERO_H + 0.11, zc + 0.1)).name = "CornisaBaja"


	var tramo: float = minf(ancho + 18.0, float(alero["largo"]))
	var banda: MeshInstance3D = _plano(root, Vector2(tramo, ALERO_H - 0.1), mclub)
	banda.position = Vector3(0.0, base + ALERO_H * 0.5, cara + 0.02)
	banda.name = "BandaClub"
	var sigla: String = est._pixel_safe(String(est._club_abbrev))
	if sigla.length() >= 2:
		var tinta: Color = Color(0.96, 0.95, 0.9) if club.get_luminance() < 0.6 \
				else Color(0.12, 0.13, 0.16)
		var letras: MeshInstance3D = _letras(root, sigla, tinta, LETRA_ALERO_M, ancho * 0.8)
		letras.position = Vector3(0.0, base + ALERO_H * 0.5, cara + 0.05)
		letras.name = "SiglaFronton"


	var y_med: float = base + ALERO_H + 0.3 + MEDALLON_R
	_disco(root, MEDALLON_R, 0.25, mclub, Vector3(0.0, y_med, cara + MEDALLON_Z)).name = "Medallon"
	var fondo_m: StandardMaterial3D = StandardMaterial3D.new()
	fondo_m.albedo_color = Color(0.95, 0.94, 0.9)
	_disco(root, MEDALLON_R - 0.3, 0.12, fondo_m, Vector3(0.0, y_med, cara + MEDALLON_Z + 0.15))

	for s in [-1.0, 1.0]:
		_mastil(est, root, Vector3(s *(ancho * 0.5 + 1.8), base, zc), s, tope)
	_luces_noche(est, root, base, y_med, cara)
	return y_med



static func _disco(padre: Node3D, r: float, fondo: float, mat: Material, pos: Vector3) -> MeshInstance3D:
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = r
	c.bottom_radius = r
	c.height = fondo
	c.radial_segments = 32
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = c
	m.material_override = mat
	m.position = pos
	m.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m



static func _prisma(padre: Node3D, tam: Vector3, mat: Material, pos: Vector3) -> MeshInstance3D:
	var pm: PrismMesh = PrismMesh.new()
	pm.size = tam
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = pm
	m.material_override = mat
	m.position = pos
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m


static func _plano(padre: Node3D, tam: Vector2, mat: Material) -> MeshInstance3D:
	var q: QuadMesh = QuadMesh.new()
	q.size = tam
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = q
	m.material_override = mat
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m






static func _mastil(est, root: Node3D, pie: Vector3, s: float, tope: float) -> void:
	var alto: float = maxf(MASTIL_H, tope - pie.y + 2.5)
	var pmat: StandardMaterial3D = StandardMaterial3D.new()
	pmat.albedo_color = Color(0.78, 0.8, 0.83)
	pmat.metallic = 0.6
	pmat.roughness = 0.4
	var c: CylinderMesh = CylinderMesh.new()
	c.top_radius = 0.06
	c.bottom_radius = 0.09
	c.height = alto
	c.radial_segments = 8
	var palo: MeshInstance3D = MeshInstance3D.new()
	palo.mesh = c
	palo.material_override = pmat
	palo.position = pie + Vector3(0.0, alto * 0.5, 0.0)
	palo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF

	palo.name = "MastilFronton_" +("I" if s < 0.0 else "D")
	root.add_child(palo)
	var tela: Vector2 = Vector2(2.7, 1.8)
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.use_custom_data = true
	var q: QuadMesh = QuadMesh.new()
	q.size = tela
	q.subdivide_width = 10
	q.subdivide_depth = 4
	mm.mesh = q
	mm.instance_count = 1
	var b: Basis = Basis()
	if s < 0.0:
		b = b.scaled(Vector3(-1.0, 1.0, 1.0))
	mm.set_instance_transform(0, Transform3D(b,
		Vector3(s * tela.x * 0.5, alto * 0.5 - tela.y * 0.5 - 0.15, 0.0)))
	mm.set_instance_custom_data(0, Color(0.23 if s < 0.0 else 0.64, 0.8, 1.0, 0.0))
	var mat: ShaderMaterial = ShaderMaterial.new()
	mat.shader = est._flag_make_shader()
	mat.set_shader_parameter("cloth", est._flag_texture())
	mat.set_shader_parameter("ancho", tela.x)
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.material_override = mat
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mmi.extra_cull_margin = 2.0
	mmi.name = "BanderaFronton"
	palo.add_child(mmi)


	var telas: Array = est.get_meta("sena_telas", [])
	telas.append(mat)
	est.set_meta("sena_telas", telas)
	viento(est)






static func _luces_noche(est, root: Node3D, base: float, y_med: float, cara: float) -> void:
	var luces: Array = est.get_meta("sena_luces", [])
	var carcasa: StandardMaterial3D = StandardMaterial3D.new()
	carcasa.albedo_color = Color(0.16, 0.17, 0.19)
	var calida: Color = Color(1.0, 0.86, 0.62)
	var y_foco: float = base + ALERO_H + 0.45
	var halo: MeshInstance3D = _plano(root, Vector2.ONE * MEDALLON_R * 3.4, _aditivo(_radial(), calida, 0.9))
	halo.position = Vector3(0.0, y_med, cara + 0.08)
	halo.name = "LuzFrontonHalo"
	luces.append(halo)
	for s in [-1.0, 1.0]:
		var x: float = s *(MEDALLON_R + 0.4)
		var lado: String = "I" if s < 0.0 else "D"
		_caja(root, Vector3(0.45, 0.32, 0.45), carcasa, Vector3(x, y_foco, cara + 0.3),
			Vector3(-35.0, 0.0, 0.0)).name = "FocoFronton_" + lado
		var lente: MeshInstance3D = _plano(root, Vector2(0.36, 0.24), _aditivo(null, calida, 2.0))
		lente.position = Vector3(x, y_foco + 0.16, cara + 0.45)
		lente.rotation_degrees = Vector3(-55.0, 0.0, 0.0)
		lente.name = "LuzFrontonLente_" + lado
		luces.append(lente)


		var haz_h: float = y_med + MEDALLON_R * 0.6 - y_foco
		var haz: MeshInstance3D = _plano(root, Vector2(MEDALLON_R * 1.3, haz_h),
			_aditivo(_degradado(), calida, 0.45))
		haz.position = Vector3(x * 0.55, y_foco + haz_h * 0.5, cara + 0.35)
		haz.name = "LuzFrontonHaz_" + lado
		luces.append(haz)
	est.set_meta("sena_luces", luces)
	clima(est)




static func clima(est) -> void:
	var noche: bool = String(est._weather_id) == "night"
	for n in est.get_meta("sena_luces", []):
		if is_instance_valid(n):
			(n as Node3D).visible = noche


static func _aditivo(tex: Texture2D, color: Color, energia: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.albedo_color = Color(color.r * energia, color.g * energia, color.b * energia, 1.0)
	if tex != null:
		m.albedo_texture = tex
	return m



static func _radial() -> ImageTexture:
	var n: int = 64
	var img: Image = Image.create(n, n, false, Image.FORMAT_RGBA8)
	for y in n:
		for x in n:
			var d: float = Vector2(x - n * 0.5 + 0.5, y - n * 0.5 + 0.5).length() /(n * 0.5)
			var a: float = clampf(1.0 - d, 0.0, 1.0)
			img.set_pixel(x, y, Color(a * a, a * a, a * a, 1.0))
	return ImageTexture.create_from_image(img)



static func _degradado() -> ImageTexture:
	var w: int = 16
	var h: int = 64
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for y in h:
		for x in w:
			var v: float = float(y) / float(h - 1)
			var lado: float = 1.0 - absf(float(x) -(w - 1) * 0.5) /((w - 1) * 0.5)
			var a: float = v * v * lado
			img.set_pixel(x, y, Color(a, a, a, 1.0))
	return ImageTexture.create_from_image(img)



static func _club_vivo(est) -> Color:
	return est._club_a if est._club_a.s * est._club_a.v >= est._club_b.s * est._club_b.v \
			else est._club_b





static func _alero(est, root: Node3D) -> Dictionary:
	for n in root.get_children():
		if n is MeshInstance3D and (n as MeshInstance3D).mesh is BoxMesh:
			var bm: BoxMesh =(n as MeshInstance3D).mesh
			if is_equal_approx(bm.size.y, ALERO_H) and is_equal_approx(bm.size.z, 0.5):
				var p: Vector3 =(n as Node3D).position
				var mf: Material =(n as MeshInstance3D).material_override
				var cf: Color =(mf as StandardMaterial3D).albedo_color \
						if mf is StandardMaterial3D else Color(0.84, 0.87, 0.91)


				return {"y": p.y - 0.12, "z": p.z + 0.25, "largo": bm.size.x, "tipo": "techo",
					"color": cf, "mat": mf, "base": p.y - ALERO_H * 0.5}
	var ante: Node3D = root.get_node_or_null("AntepechoSena")
	var largo: float = float(root.get_meta("celu_largo"))
	var top: Vector2 = est._slope_top(float(root.get_meta("recinto_escala", 1.0)))
	var y: float = top.x + ALERO_H * 0.5
	if ante == null:
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = est.front_wall_color()
		mat.roughness = 1.0
		ante = _caja(root, Vector3(largo, ALERO_H, 0.3), mat, Vector3(0.0, y, top.y - 0.15))
		ante.name = "AntepechoSena"
	return {"y": y, "z": top.y, "largo": largo, "tipo": "antepecho",
		"color": est.front_wall_color(), "mat":(ante as MeshInstance3D).material_override,
		"base": top.x}





static func _alero_pintado(est, root: Node3D, largo: float) -> MeshInstance3D:
	var cols: Array[Color] = par(est)
	var a: Color = cols[0]
	var b: Color = cols[1]
	var panos: int = maxi(3, int(round(largo / PANO_M)))
	if panos % 2 == 0:
		panos += 1
	var img: Image = Image.create(panos, 1, false, Image.FORMAT_RGBA8)
	for k in panos:
		img.set_pixel(k, 0, a if k % 2 == 0 else b)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.8
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(largo, ALERO_H)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)
	return mi





static func _escudo_real(est, root: Node3D, metros: float) -> MeshInstance3D:
	var team: Dictionary = Teams.by_id(est._pitch_seed_club())
	if team.is_empty():
		return null
	var px: int = int(est.CREST_PX)
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(px, px)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	est.add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(px, px)
	crest.set_team(team)
	vp.add_child(crest)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = vp.get_texture()
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(metros, metros)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)
	return mi






static func _letras(root: Node3D, texto: String, color: Color, alto_m: float,
		max_ancho: float) -> MeshInstance3D:
	var px: int = 4
	var canto: int = px / 2
	var w: int = PixelText.text_width(texto, px) + canto
	var h: int = PixelText.GLYPH_H * px + canto
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	PixelText.draw_text(img, canto, canto, texto, color.darkened(0.6), px)
	PixelText.draw_text(img, 0, 0, texto, color, px)
	var alto: float = alto_m * float(h) / float(PixelText.GLYPH_H * px)
	var ancho: float = alto * float(w) / float(h)
	if ancho > max_ancho:
		ancho = max_ancho
		alto = ancho * float(h) / float(w)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var q: QuadMesh = QuadMesh.new()
	q.size = Vector2(ancho, alto)
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = q
	mi.material_override = mat
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(mi)
	return mi





static func _color_letra(est, fondo: Color) -> Color:
	var c: Color = _club_vivo(est)
	if c.s >= 0.35 and absf(c.get_luminance() - fondo.get_luminance()) >= 0.3:
		return c
	return Color(0.12, 0.13, 0.16) if fondo.get_luminance() > 0.5 else Color(0.96, 0.95, 0.9)







static func _nombre_tribuna(est, root: Node3D, leyenda: String) -> void:
	var texto: String = est._pixel_safe(I18n.t("TRIBUNA {0}").format([leyenda]))
	if texto.length() < 4:
		return
	var alero: Dictionary = _alero(est, root)
	var letras: MeshInstance3D = _letras(root, texto, _color_letra(est, alero["color"]), LETRA_ALERO_M,
		float(alero["largo"]) * 0.7)
	letras.position = Vector3(0.0, float(alero["y"]), float(alero["z"]) + 0.03)
	letras.name = "NombreTribuna"
	letras.set_meta("texto", texto)
















static func _estatua(est, roots: Array, leyenda: String) -> void:
	var rz: float = -4.0 - est._ring_pad_z()
	var sitio: Vector3 = Vector3.INF
	for x in [-24.0, -28.0, -21.5, -32.0]:
		var libres: Array = []
		var z: float = rz - 1.8
		while z > rz - 24.0:
			if _libre(est, roots, Vector3(x, 0.0, z)):
				libres.append(z)
			elif not libres.is_empty():
				break
			z -= 0.5
		if libres.size() >= 6:
			sitio = Vector3(x, 0.0,(float(libres[0]) + float(libres[libres.size() - 1])) * 0.5)
			break
	if not is_finite(sitio.x):
		return
	var bronce: StandardMaterial3D = StandardMaterial3D.new()
	bronce.albedo_color = Color("a47b45")
	bronce.metallic = 0.65
	bronce.roughness = 0.42
	var piedra: StandardMaterial3D = StandardMaterial3D.new()
	piedra.albedo_color = Color("9d978b")
	piedra.roughness = 0.95
	var raiz: Node3D = Node3D.new()
	raiz.name = "EstatuaLeyenda"
	raiz.position = sitio


	var al_centro: Vector3 = Vector3(0.0, 0.0, est.HALF_LINE) - sitio
	raiz.rotation.y = atan2(al_centro.x, al_centro.z)
	raiz.set_meta("leyenda", leyenda)
	est._bowl_root().add_child(raiz)
	_caja(raiz, Vector3(PEANA_W, PEANA_H, PEANA_W), piedra, Vector3(0, PEANA_H * 0.5, 0))
	_caja(raiz, Vector3(PEANA_W + 0.3, 0.25, PEANA_W + 0.3), piedra, Vector3(0, 0.125, 0))
	_placa(raiz, leyenda, Vector3(0, PEANA_H * 0.62, PEANA_W * 0.5 + 0.01))


	var s: float = ESTATUA_H / 1.8
	var y0: float = PEANA_H
	var fig: Node3D = Node3D.new()
	fig.position = Vector3(0, y0, 0)
	raiz.add_child(fig)
	_caja(fig, Vector3(0.17, 0.85, 0.2) * s, bronce, Vector3(-0.13, 0.43, 0.02) * s,
		Vector3(0, 0, -6))
	_caja(fig, Vector3(0.17, 0.85, 0.2) * s, bronce, Vector3(0.13, 0.43, -0.04) * s,
		Vector3(0, 0, 6))
	_caja(fig, Vector3(0.44, 0.6, 0.24) * s, bronce, Vector3(0, 1.13, 0) * s)
	var cabeza: MeshInstance3D = MeshInstance3D.new()
	var esf: SphereMesh = SphereMesh.new()
	esf.radius = 0.12 * s
	esf.height = 0.26 * s
	cabeza.mesh = esf
	cabeza.material_override = bronce
	cabeza.position = Vector3(0, 1.58, 0) * s
	fig.add_child(cabeza)
	_caja(fig, Vector3(0.12, 0.62, 0.12) * s, bronce, Vector3(0.3, 1.66, 0) * s,
		Vector3(0, 0, -14))
	_caja(fig, Vector3(0.12, 0.58, 0.12) * s, bronce, Vector3(-0.36, 1.12, 0) * s,
		Vector3(0, 0, -38))
	var balon: MeshInstance3D = MeshInstance3D.new()
	var bm: SphereMesh = SphereMesh.new()
	bm.radius = 0.11 * s
	bm.height = 0.22 * s
	balon.mesh = bm
	balon.material_override = bronce
	balon.position = Vector3(-0.2, 0.11, 0.22) * s
	fig.add_child(balon)





static func _libre(est, roots: Array, p: Vector3) -> bool:
	var r: float = PEANA_W * 0.9
	for root in roots:
		var largo: float = float(root.get_meta("celu_largo"))
		var l: Vector3 = root.transform.affine_inverse() * p
		if absf(l.x) < largo * 0.5 + r and l.z < 1.0 + r and l.z > -40.0:
			return false
	return true




static func _placa(raiz: Node3D, leyenda: String, pos: Vector3) -> void:
	var px: int = 3
	var w: int = PixelText.text_width(leyenda, px) + px * 4
	var h: int = PixelText.GLYPH_H * px + px * 4
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(Color("5a4120"))
	PixelText.draw_text(img, px * 2, px * 2, leyenda, Color("e3c27a"), px)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.roughness = 0.5
	var q: QuadMesh = QuadMesh.new()
	var ancho: float = minf(PEANA_W * 0.9, 0.3 * float(w) / float(h))
	q.size = Vector2(ancho, ancho * float(h) / float(w))
	var placa: MeshInstance3D = MeshInstance3D.new()
	placa.mesh = q
	placa.material_override = mat
	placa.position = pos
	placa.name = "PlacaLeyenda"
	raiz.add_child(placa)


static func _caja(padre: Node3D, tam: Vector3, mat: Material, pos: Vector3,
		rot: Vector3 = Vector3.ZERO) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = tam
	m.mesh = b
	m.material_override = mat
	m.position = pos
	m.rotation_degrees = rot
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	padre.add_child(m)
	return m






const GALLARDETE: Vector2 = Vector2(0.62, 0.95)
const GALLARDETE_PASO: float = 0.85
const GALLARDETE_VANO: float = 9.0
const GALLARDETE_FLECHA: float = 0.75
const FOCO_TECHO_PASO: float = 3.6
const FOCO_TECHO_TAM: Vector3 = Vector3(2.2, 0.55, 0.3)

static var _banderin_cache: Dictionary = {}





static func par(est) -> Array[Color]:
	var a: Color = est._club_a
	var b: Color = est._club_b
	if Vector3(a.r - b.r, a.g - b.g, a.b - b.b).length() < 0.35:
		b = Color(0.94, 0.94, 0.92) if a.v < 0.75 else Color(0.12, 0.13, 0.16)
	return [a, b]





static func gallardetes_de(est) -> bool:
	if est.has_meta("sena_gallardetes"):
		return String(est.get_meta("sena_gallardetes")) == "si"
	return ((hash(String(est._pitch_seed_club()) + "/gallardetes")>>9)&1) == 1




static func _fascia(root: Node3D) -> MeshInstance3D:
	for n in root.get_children():
		if n is MeshInstance3D and (n as MeshInstance3D).mesh is BoxMesh:
			var bm: BoxMesh =(n as MeshInstance3D).mesh
			if is_equal_approx(bm.size.y, ALERO_H) and is_equal_approx(bm.size.z, 0.5):
				return n
	return null







static func _gallardetes(est, root: Node3D) -> void:
	var f: MeshInstance3D = _fascia(root)
	if f == null or root.has_meta("sena_focos_fila"):
		return
	var largo: float =(f.mesh as BoxMesh).size.x * 0.94
	var y0: float = f.position.y - ALERO_H * 0.5 - 0.05
	var z: float = f.position.z + 0.2
	var vanos: int = maxi(1, int(round(largo / GALLARDETE_VANO)))
	var vano: float = largo / float(vanos)
	var n: int = int(floor(largo / GALLARDETE_PASO))
	var cols: Array[Color] = par(est)
	var por_color: Array = [[], []]
	var cordel: PackedVector3Array = PackedVector3Array()
	var prev: Vector3 = Vector3.ZERO
	for i in n + 1:
		var x: float = - largo * 0.5 + largo * float(i) / float(n)
		var t: float = fposmod(x + largo * 0.5, vano) / vano
		var y: float = y0 - GALLARDETE_FLECHA * 4.0 * t *(1.0 - t)
		var p: Vector3 = Vector3(x, y, z)
		if i > 0:
			cordel.append(prev)
			cordel.append(p)
		prev = p
		if i < n:
			por_color[i % 2].append(p)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(String(est._pitch_seed_club()) + "/" + String(root.name))
	var telas: Array = est.get_meta("sena_telas", [])
	for k in 2:
		var picos: Array = por_color[k]
		if picos.is_empty():
			continue
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.use_custom_data = true
		var q: QuadMesh = QuadMesh.new()


		q.size = Vector2(GALLARDETE.y, GALLARDETE.x)
		q.subdivide_width = 4
		mm.mesh = q
		mm.instance_count = picos.size()
		var giro: Basis = Basis(Vector3.BACK, - PI * 0.5)
		for j in picos.size():
			var p: Vector3 = picos[j]
			mm.set_instance_transform(j, Transform3D(giro, p + Vector3(0.0, - GALLARDETE.y * 0.5, 0.0)))
			mm.set_instance_custom_data(j, Color(rng.randf(), rng.randf_range(0.8, 1.25), 1.0, 0.0))
		var mat: ShaderMaterial = ShaderMaterial.new()
		mat.shader = est._flag_make_shader()
		mat.set_shader_parameter("cloth", _pico_textura(cols[k]))
		mat.set_shader_parameter("ancho", GALLARDETE.y)
		var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mmi.multimesh = mm
		mmi.material_override = mat
		mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		mmi.extra_cull_margin = 1.0
		root.add_child(mmi)
		mmi.name = "Gallardetes_" +("A" if k == 0 else "B")
		telas.append(mat)
	var am: ArrayMesh = ArrayMesh.new()
	var arr: Array = []
	arr.resize(Mesh.ARRAY_MAX)
	arr[Mesh.ARRAY_VERTEX] = cordel
	am.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, arr)


	if _DETALLE.se_corta(root):
		am.set_meta(_DETALLE.META_ARRAYS, [arr])
	var cm: StandardMaterial3D = StandardMaterial3D.new()
	cm.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	cm.albedo_color = Color(0.14, 0.14, 0.15)
	var linea: MeshInstance3D = MeshInstance3D.new()
	linea.mesh = am



	linea.set_meta(&"cordel", cordel)
	linea.material_override = cm
	linea.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(linea)
	linea.name = "GallardetesCordel"
	est.set_meta("sena_telas", telas)
	viento(est)



static func _pico_textura(c: Color) -> ImageTexture:
	var w: int = 24
	var h: int = 16
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	for x in w:
		var media: float = float(h) * 0.5 *(1.0 - float(x) / float(w))
		for y in h:
			var dentro: bool = absf(float(y) + 0.5 - float(h) * 0.5) <= media

			var col: Color = c.darkened(0.25) if x < 2 else c
			img.set_pixel(x, y, col if dentro else Color(0, 0, 0, 0))
	return ImageTexture.create_from_image(img)





static func viento(est) -> void:
	var telas: Array = est.get_meta("sena_telas", [])
	if telas.is_empty():
		return
	var w: float = est._tifo_wind()
	var quieto: bool = Settings.reduce_motion
	for mat in telas:
		var m: ShaderMaterial = mat
		m.set_shader_parameter("amp", 0.0 if quieto else 0.22 + w * 0.5)
		m.set_shader_parameter("speed", lerpf(0.55, 0.95, w))
		m.set_shader_parameter("sweep", 0.0)






static func banderin(est, frames: SpriteFrames) -> SpriteFrames:
	if frames == null or int(est.div) > 2 or bool(est._roof):
		return frames
	var cols: Array[Color] = par(est)
	var clave: String = cols[0].to_html() + "/" + cols[1].to_html()
	if _banderin_cache.has(clave):
		return _banderin_cache[clave]
	var nuevo: SpriteFrames = SpriteFrames.new()
	nuevo.add_animation("wave")
	nuevo.set_animation_loop("wave", frames.get_animation_loop("wave"))
	nuevo.set_animation_speed("wave", frames.get_animation_speed("wave"))
	for i in frames.get_frame_count("wave"):


		var img: Image = SceneFade.imagen_copia(frames.get_frame_texture("wave", i))
		if img == null:
			return frames
		if img.is_compressed():
			img.decompress()
		img.convert(Image.FORMAT_RGBA8)
		for y in img.get_height():
			for x in img.get_width():
				var p: Color = img.get_pixel(x, y)
				if p.a < 0.5 or p.s < 0.3:
					continue


				var rojo: bool = p.h < 0.06 or p.h > 0.94
				var amarillo: bool = p.h > 0.09 and p.h < 0.2
				if not rojo and not amarillo:
					continue
				var ref: Color = Color8(235, 39, 46) if rojo else Color8(248, 221, 13)
				var c: Color = cols[0] if rojo else cols[1]
				var claro: float = clampf(1.0 - p.s / ref.s, 0.0, 1.0) * 0.6
				var luz: float = clampf(p.v / ref.v, 0.5, 1.15)
				var o: Color = c.lerp(Color.WHITE, claro)
				img.set_pixel(x, y, Color(o.r * luz, o.g * luz, o.b * luz, p.a))
		nuevo.add_frame("wave", ImageTexture.create_from_image(img))
	_banderin_cache[clave] = nuevo
	return nuevo






static func focos_en_techo(est) -> bool:
	if est.has_meta("sena_focos"):
		return String(est.get_meta("sena_focos")) == "techo"
	if int(est.div) != 1 or bool(est._track):
		return false
	return ((hash(String(est._pitch_seed_club()) + "/focos")>>11)&1) == 1








static func focos_techo(est, panel_mat: StandardMaterial3D) -> Array[Vector3]:
	var puntos: Array[Vector3] = []
	var lados: Array = []
	for s in [-1.0, 1.0]:
		var mejor: Node3D = null
		var mejor_f: MeshInstance3D = null
		for r in est._stand_roots:
			if r == null or not is_instance_valid(r) or r.position.x * s < 20.0:
				continue
			var f: MeshInstance3D = _fascia(r)
			if f == null:
				continue
			if mejor == null or (f.mesh as BoxMesh).size.x >(mejor_f.mesh as BoxMesh).size.x:
				mejor = r
				mejor_f = f
		if mejor == null:
			return puntos
		lados.append([mejor, mejor_f])
	var bowl: Node3D = est._bowl_root()
	for par_lado in lados:
		var r: Node3D = par_lado[0]
		var f: MeshInstance3D = par_lado[1]
		var largo: float =(f.mesh as BoxMesh).size.x * 0.9
		var y: float = f.position.y - ALERO_H * 0.5 - FOCO_TECHO_TAM.y * 0.5
		var z: float = f.position.z - 0.05
		var n: int = maxi(4, int(floor(largo / FOCO_TECHO_PASO)))
		var mm: MultiMesh = MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		var bm: BoxMesh = BoxMesh.new()
		bm.size = FOCO_TECHO_TAM
		mm.mesh = bm
		mm.instance_count = n


		var inclina: Basis = Basis(Vector3.RIGHT, deg_to_rad(35.0))
		for i in n:
			var x: float = - largo * 0.5 + largo *(float(i) + 0.5) / float(n)
			mm.set_instance_transform(i, Transform3D(inclina, Vector3(x, y, z)))
		var chapa: StandardMaterial3D = panel_mat.duplicate()
		est._flood_panel_copias.append(chapa)
		var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
		mmi.multimesh = mm
		mmi.material_override = chapa
		mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		r.add_child(mmi)
		mmi.name = "FocosTecho"
		r.set_meta("sena_focos_fila", true)
		for k in [-0.3, 0.3]:
			var g: Vector3 = r.to_global(Vector3(largo / 0.9 * k, y - 0.4, z + 0.4))
			puntos.append(bowl.to_local(g))
	return puntos










static func chapa(est) -> Color:
	if int(est.div) != 2 or est._big_night \
			or Teams.by_id(est._pitch_seed_club()).is_empty():
		return Color(0, 0, 0, 0)
	if est.has_meta("sena_chapa") and String(est.get_meta("sena_chapa")) == "no":
		return Color(0, 0, 0, 0)
	return _club_vivo(est).lerp(Color(0.5, 0.52, 0.54), 0.22)





static func reloj(est, root: Node3D) -> void:
	if Teams.by_id(est._pitch_seed_club()).is_empty():
		return
	var cols: Array[Color] = par(est)
	var aro: MeshInstance3D = MeshInstance3D.new()
	var tm: TorusMesh = TorusMesh.new()
	tm.inner_radius = 1.45
	tm.outer_radius = 1.78
	tm.rings = 24
	tm.ring_segments = 6
	aro.mesh = tm
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = cols[0]
	mat.roughness = 0.6
	aro.material_override = mat

	aro.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	aro.position = Vector3(0.0, 0.0, 0.08)
	aro.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	root.add_child(aro)
	aro.name = "AroReloj"

	var escudo: MeshInstance3D = _escudo_real(est, root, 1.6)
	if escudo != null:
		escudo.position = Vector3(0.0, -0.2, 0.125)
		escudo.name = "EscudoReloj"
	var tapon: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.14
	cm.bottom_radius = 0.14
	cm.height = 0.06
	tapon.mesh = cm
	var mt: StandardMaterial3D = StandardMaterial3D.new()
	mt.albedo_color = cols[1]
	tapon.material_override = mt
	tapon.rotation_degrees = Vector3(90.0, 0.0, 0.0)
	tapon.position = Vector3(0.0, 0.0, 0.22)
	root.add_child(tapon)









static func despeja(est, mueble: Node3D) -> void:
	var caja: AABB = AABB()
	var hay: bool = false
	for n in mueble.find_children("*", "VisualInstance3D", true, false):
		var vi: VisualInstance3D = n as VisualInstance3D
		var ab: AABB = vi.global_transform * vi.get_aabb()
		caja = ab if not hay else caja.merge(ab)
		hay = true
	if not hay:
		return

	caja = caja.grow(0.25)




	caja = AABB(caja.position - Vector3(0.0, 0.0, 15.0), caja.size + Vector3(0.0, 0.0, 30.0))
	for n in est.find_children("Gallardetes_*", "MultiMeshInstance3D", true, false):
		var mmi: MultiMeshInstance3D = n as MultiMeshInstance3D
		var mm: MultiMesh = mmi.multimesh
		var medio: Vector3 = Vector3(GALLARDETE.x * 0.5, GALLARDETE.y * 0.5, 0.05)
		for j in mm.instance_count:
			var t: Transform3D = mm.get_instance_transform(j)
			var p: Vector3 = mmi.global_transform * t.origin
			if caja.intersects(AABB(p - medio, medio * 2.0)):
				mm.set_instance_transform(j, Transform3D(Basis().scaled(Vector3.ZERO), t.origin))
	for n in est.find_children("GallardetesCordel", "MeshInstance3D", true, false):
		var linea: MeshInstance3D = n as MeshInstance3D


		var guardado: Variant = linea.get_meta(&"cordel", null)
		if not guardado is PackedVector3Array:
			continue
		var v: PackedVector3Array = guardado
		var queda: PackedVector3Array = PackedVector3Array()
		for i in range(0, v.size() - 1, 2):
			var a: Vector3 = linea.global_transform * v[i]
			var b: Vector3 = linea.global_transform * v[i + 1]
			if not caja.intersects(AABB(a, Vector3.ZERO).expand(b)):
				queda.append(v[i])
				queda.append(v[i + 1])
		if queda.size() == v.size():
			continue
		var nuevo: ArrayMesh = ArrayMesh.new()
		if not queda.is_empty():
			var arr: Array = []
			arr.resize(Mesh.ARRAY_MAX)
			arr[Mesh.ARRAY_VERTEX] = queda
			nuevo.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, arr)
		linea.mesh = nuevo
		linea.set_meta(&"cordel", queda)
