extends RefCounted














const DENTRO: float = 0.15



const ABRE_DZ: float = 4.0





const ACOMP_DZ: Array[float] = [-1.15, 1.15, -2.0, 2.0]
const ACOMP_ATRAS: float = 0.2











const CABINA_FRENTE: float = 39.6
const CABINA_FONDO: float = 2.3
const CABINA_SUELO: float = 2.4
const CABINA_ANCHO: float = 6.4
const CABINA_ALTO: float = 2.7
const CABINA_ANTEPECHO: float = 1.0




static func cabina_pie(lado_x: float, centro_z: float) -> Vector3:
	return Vector3(lado_x *(CABINA_FRENTE + CABINA_FONDO * 0.4), CABINA_SUELO, centro_z)



static func cabina(cer: Ceremony, lado_x: float, centro_z: float, acento: Color) -> Node3D:
	var claro: Color = Color(0.58, 0.59, 0.61)
	var gris: Color = Color(0.3, 0.31, 0.33)
	var oscuro: Color = Color(0.11, 0.12, 0.13)
	var raiz: Node3D = Node3D.new()
	raiz.name = "PalcoHonor"
	cer.viewport.add_child(raiz)

	var d: float = lado_x
	var frente: float = lado_x * CABINA_FRENTE
	var cx: float = frente + d * CABINA_FONDO * 0.5
	var y: float = CABINA_SUELO
	var a: float = CABINA_ANCHO
	_caja(raiz, Vector3(CABINA_FONDO, y, a), Vector3(cx, y * 0.5, centro_z), gris)
	_caja(raiz, Vector3(0.14, CABINA_ANTEPECHO, a), Vector3(frente + d * 0.07,
		y + CABINA_ANTEPECHO * 0.5, centro_z), claro)
	_caja(raiz, Vector3(0.02, 0.16, a + 0.02), Vector3(frente - d * 0.01,
		y + CABINA_ANTEPECHO - 0.22, centro_z), acento)
	_caja(raiz, Vector3(0.2, CABINA_ALTO, a), Vector3(frente + d *(CABINA_FONDO - 0.1),
		y + CABINA_ALTO * 0.5, centro_z), oscuro)
	for lado in [-1.0, 1.0]:
		_caja(raiz, Vector3(CABINA_FONDO, CABINA_ALTO, 0.16), Vector3(cx,
			y + CABINA_ALTO * 0.5, centro_z + lado *(a * 0.5 - 0.08)), gris)

	_caja(raiz, Vector3(CABINA_FONDO + 0.5, 0.2, a + 0.3), Vector3(cx - d * 0.25,
		y + CABINA_ALTO + 0.1, centro_z), gris)
	_caja(raiz, Vector3(0.04, 0.24, a + 0.3), Vector3(frente - d * 0.52,
		y + CABINA_ALTO + 0.1, centro_z), acento)
	return raiz


static func _caja(raiz: Node3D, tam: Vector3, pos: Vector3, color: Color) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var b: BoxMesh = BoxMesh.new()
	b.size = tam
	m.mesh = b
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.9
	m.material_override = mat

	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	m.position = pos
	raiz.add_child(m)







static func mide(stadium: Stadium, lado_x: float, centro_z: float) -> Dictionary:
	if stadium == null:
		return {}
	for v in stadium._box_vols:
		var xf: Transform3D =(v["inv"] as Transform3D).affine_inverse()
		var nrm: Vector3 = xf.basis.z.normalized()
		if nrm.x * - lado_x < 0.9:
			continue
		var half: Vector3 = v["half"]
		var cristal_x: float = xf.origin.x + nrm.x *(half.z - 0.03)
		return {"cristal_x": cristal_x,
			"suelo": Vector3(cristal_x + lado_x * DENTRO, xf.origin.y - half.y + 0.45, centro_z)}
	return {}




static func abre(stadium: Stadium, cristal_x: float, suelo_y: float, centro_z: float,
		lado_x: float) -> void:
	for pane in stadium._box_panes:



		var nodo: Node3D = SceneFade.vivo(pane.get("nodo")) as Node3D
		if nodo == null or not nodo.is_inside_tree():
			continue
		var gp: Vector3 = nodo.global_position
		if absf(gp.x - cristal_x) < 0.6 and absf(gp.z - centro_z) < ABRE_DZ:
			nodo.visible = false
	abre_alero(stadium, cristal_x, suelo_y, centro_z, lado_x)











static func abre_alero(stadium: Stadium, cristal_x: float, suelo_y: float, centro_z: float,
		lado_x: float) -> void:
	var cabeza: Vector3 = Vector3(cristal_x, suelo_y + 1.75, centro_z)
	for n in stadium.find_children("*", "MeshInstance3D", true, false):
		var m: MeshInstance3D = n
		if not m.is_visible_in_tree() or not (m.mesh is QuadMesh or m.mesh is BoxMesh):
			continue
		var bb: AABB = m.global_transform * m.get_aabb()
		if bb.size.z < 20.0 or bb.size.y > 3.0 or bb.position.z > centro_z - ABRE_DZ \
				or bb.end.z < centro_z + ABRE_DZ:
			continue


		var pasa: bool = false
		for dy in [-0.25, 0.0, 0.3]:
			pasa = pasa or bb.intersects_segment(cabeza,
				cabeza + Vector3(- lado_x * 7.0, dy, 0.0))
		if not pasa:
			continue
		m.visible = false
		for tramo in [Vector2(bb.position.z, centro_z - ABRE_DZ),
				Vector2(centro_z + ABRE_DZ, bb.end.z)]:
			var largo: float = tramo.y - tramo.x
			var copia: MeshInstance3D = m.duplicate() as MeshInstance3D
			copia.name = "AleroTramo"
			copia.visible = true
			copia.mesh = m.mesh.duplicate()


			if copia.mesh is QuadMesh:
				var q: QuadMesh = copia.mesh
				if absf(q.size.x - bb.size.z) < absf(q.size.y - bb.size.z):
					q.size.x = largo
				else:
					q.size.y = largo
			else:
				var b: BoxMesh = copia.mesh
				if absf(b.size.x - bb.size.z) < 0.5:
					b.size.x = largo
				elif absf(b.size.y - bb.size.z) < 0.5:
					b.size.y = largo
				else:
					b.size.z = largo
			m.get_parent().add_child(copia)
			copia.global_transform = m.global_transform
			copia.global_position.z =(tramo.x + tramo.y) * 0.5







static func acompanantes(cer: Ceremony, el: Vector3, pixel_size: float, club: String,
		lado_x: float) -> Array[AnimatedSprite3D]:
	var out: Array[AnimatedSprite3D] = []
	for i in ACOMP_DZ.size():
		var cfg: Dictionary = KitRecolor.appearance_for("palco|%s|%d" % [club, i], {})
		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.name = "PalcoAcomp%d" % i
		spr.pixel_size = pixel_size
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var frames: SpriteFrames = cer.player_frames(cfg, "south", Ceremony.ESMOQUIN_SHEET, true)
		if frames == null:
			continue
		cer.esmoquin_clap(frames, cfg)
		spr.sprite_frames = frames
		spr.position = Vector3(el.x + lado_x * ACOMP_ATRAS, el.y, el.z + ACOMP_DZ[i])
		var anim: String = "clap" if frames.has_animation("clap") else "idle"
		spr.play(anim)
		spr.frame = i % maxi(1, frames.get_frame_count(anim))
		cer.viewport.add_child(spr)
		CaraViva.pon(spr)
		out.append(spr)
	return out
