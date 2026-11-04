class_name RinconCasa



























const ALTO_MURO: float = House.WALL_HEIGHT



const ZOCALO_H: float = 0.11
const ZOCALO_T: float = 0.03



const MURO_T: float = 0.12





const ALTO_PERSONA: float = 1.78
const PX_ALTO: float = 65.0
const PX_PIES: float = 38.0





static func paleta() -> Dictionary:
	return House.palette_for(Career.house_level, Career.house_extras,
		CareerTheme.accent(), Career.house_finish, Career.house_finishes)


static func mat(c: Color, rug: float = 1.0) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = c
	m.roughness = rug
	m.metallic = 0.0
	return m




static func caja(padre: Node, at: Vector3, size: Vector3,
		col: Color) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = size
	b.material = mat(col)
	m.mesh = b
	m.position = at
	padre.add_child(m)
	return m











static func montar(mundo: Node3D, ancho: float, fondo: float) -> Dictionary:
	var pal: Dictionary = paleta()
	var c_suelo: Color = pal.get("floor", Color("b3a188"))
	var c_muro: Color = pal.get("wall", Color("8d8578"))
	var c_trim: Color = pal.get("trim", Color("6f5a44"))
	var z_fondo: float = fondo * 0.5





	var we: WorldEnvironment = WorldEnvironment.new()
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = c_muro.darkened(0.62)
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


















	var luma: float = clampf(c_muro.get_luminance(), 0.0, 1.0)
	env.ambient_light_color = Color("d9d5cd")
	env.ambient_light_energy = lerpf(0.8, 0.42, luma)
	we.environment = env
	mundo.add_child(we)




	var luz: OmniLight3D = OmniLight3D.new()




	luz.position = Vector3(0.0, ALTO_MURO - 0.55, z_fondo * 0.5)
	luz.omni_range = maxf(ancho, fondo) * 1.6



	luz.light_energy = lerpf(2.4, 0.95, luma)
	luz.light_color = Color("ffeacb")
	luz.shadow_enabled = false
	mundo.add_child(luz)

	var suelo: MeshInstance3D = MeshInstance3D.new()
	var pm: PlaneMesh = PlaneMesh.new()
	pm.size = Vector2(ancho, fondo)
	suelo.mesh = pm
	suelo.material_override = mat(c_suelo)
	mundo.add_child(suelo)









	var muros: Dictionary = {"fondo": [], "izq": [], "der": []}
	(muros["fondo"] as Array).append(
		caja(mundo, Vector3(0.0, ALTO_MURO * 0.5, z_fondo + MURO_T * 0.5),
			Vector3(ancho + MURO_T * 2.0, ALTO_MURO, MURO_T), c_muro))
	(muros["izq"] as Array).append(
		caja(mundo, Vector3(-(ancho * 0.5 + MURO_T * 0.5), ALTO_MURO * 0.5, 0.0),
			Vector3(MURO_T, ALTO_MURO, fondo), c_muro.darkened(0.13)))
	(muros["der"] as Array).append(
		caja(mundo, Vector3(ancho * 0.5 + MURO_T * 0.5, ALTO_MURO * 0.5, 0.0),
			Vector3(MURO_T, ALTO_MURO, fondo), c_muro.darkened(0.13)))

	(muros["fondo"] as Array).append(
		caja(mundo, Vector3(0.0, ZOCALO_H * 0.5, z_fondo - ZOCALO_T * 0.5),
			Vector3(ancho, ZOCALO_H, ZOCALO_T), c_trim))
	(muros["izq"] as Array).append(
		caja(mundo, Vector3(-(ancho * 0.5 - ZOCALO_T * 0.5), ZOCALO_H * 0.5, 0.0),
			Vector3(ZOCALO_T, ZOCALO_H, fondo), c_trim.darkened(0.1)))
	(muros["der"] as Array).append(
		caja(mundo, Vector3(ancho * 0.5 - ZOCALO_T * 0.5, ZOCALO_H * 0.5, 0.0),
			Vector3(ZOCALO_T, ZOCALO_H, fondo), c_trim.darkened(0.1)))






	var techo: MeshInstance3D = MeshInstance3D.new()
	var tm: PlaneMesh = PlaneMesh.new()
	tm.size = Vector2(ancho + MURO_T * 2.0, fondo + MURO_T * 2.0)

	tm.orientation = PlaneMesh.FACE_Y
	techo.mesh = tm
	techo.position = Vector3(0.0, ALTO_MURO, 0.0)
	techo.rotation.z = PI





	techo.material_override = mat(c_muro.darkened(0.1))
	mundo.add_child(techo)

	return {"pal": pal, "z_fondo": z_fondo, "ancho": ancho, "fondo": fondo,
		"muros": muros}






static func alfombra(mundo: Node3D, at: Vector2, tam: Vector2,
		pal: Dictionary) -> void:
	caja(mundo, Vector3(at.x, 0.006, at.y), Vector3(tam.x, 0.012, tam.y),
		pal.get("rug", Color("7a4040")))








static func lampara(mundo: Node3D, at: Vector2, pal: Dictionary) -> void:
	var metal: Color = pal.get("metal", Color("8a8a86"))
	caja(mundo, Vector3(at.x, 0.02, at.y), Vector3(0.34, 0.04, 0.34),
		metal.darkened(0.25))
	caja(mundo, Vector3(at.x, 0.72, at.y), Vector3(0.05, 1.4, 0.05), metal)
	var pantalla: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = 0.16
	cm.bottom_radius = 0.22
	cm.height = 0.26
	cm.radial_segments = 12
	cm.rings = 0
	var m: StandardMaterial3D = mat(Color("f2e3c0"))
	m.emission_enabled = true
	m.emission = Color("ffe6b8")
	m.emission_energy_multiplier = 0.9
	cm.material = m
	pantalla.mesh = cm
	pantalla.position = Vector3(at.x, 1.52, at.y)
	mundo.add_child(pantalla)



















static func jugador(facing: String = "north", aspecto: Dictionary = {}) -> AnimatedSprite3D:


	var cfg: Dictionary = KitRecolor.casual_of(GameState.team_custom if aspecto.is_empty() else aspecto)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	var prefijo: String = "res://assets/sprites/anim/idle_%s_" % facing
	for i in 4:
		var path: String = "%s%02d.png" % [prefijo, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("idle") == 0:


		var base: String = "res://assets/sprites/players/player_south.png"
		if ResourceLoader.exists(base):
			frames.add_frame("idle", KitRecolor.apply(load(base), cfg))
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = frames
	spr.pixel_size = ALTO_PERSONA / PX_ALTO



	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.play("idle")
	return spr
















static func aparta_muros(cuarto: Dictionary, ojo: Vector3) -> void:
	var muros: Dictionary = cuarto.get("muros", {})
	if muros.is_empty():
		return
	var z_fondo: float = float(cuarto["z_fondo"])
	var medio: float = float(cuarto["ancho"]) * 0.5
	var margen: float = 0.55
	for n in muros.get("fondo", []):
		(n as Node3D).visible = ojo.z < z_fondo - margen
	for n2 in muros.get("izq", []):
		(n2 as Node3D).visible = ojo.x > - medio + margen
	for n3 in muros.get("der", []):
		(n3 as Node3D).visible = ojo.x < medio - margen









static func rotula(l: Label) -> void:
	l.add_theme_constant_override("outline_size", 8)
	l.add_theme_color_override("font_outline_color", Color(0, 0, 0, 0.75))



static func altura_pies(pixel_size: float) -> float:
	return PX_PIES * pixel_size
