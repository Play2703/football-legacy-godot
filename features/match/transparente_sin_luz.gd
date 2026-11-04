extends RefCounted














































static var _sin_luz: Dictionary = {}
static var _arbol: SceneTree = null
static var _re_alpha: RegEx = null



static func gpu_sin_luz(nombre: String) -> bool:
	return nombre.to_lower().contains("powervr")



static func instala(arbol: SceneTree) -> void:
	if _arbol != null:
		return
	_arbol = arbol
	arbol.node_added.connect(_al_entrar)
	barre(arbol.root)



static func desinstala() -> void:
	if _arbol != null and _arbol.node_added.is_connected(_al_entrar):
		_arbol.node_added.disconnect(_al_entrar)
	_arbol = null


static func instalado() -> bool:
	return _arbol != null


static func _al_entrar(n: Node) -> void:
	if n is GeometryInstance3D:
		_diferido.call_deferred(n)


static func _diferido(n: Node) -> void:
	if is_instance_valid(n) and n.is_inside_tree():
		apaga(n)



static func barre(n: Node) -> int:
	var hechos: int = 0
	if n is GeometryInstance3D:
		hechos += apaga(n)
	for c in n.get_children():
		hechos += barre(c)
	return hechos



static func apaga(n: Node) -> int:
	var hechos: int = 0
	if n is SpriteBase3D:
		var s: SpriteBase3D = n
		if s.shaded and s.alpha_cut != SpriteBase3D.ALPHA_CUT_DISCARD:
			s.shaded = false
			hechos += 1
	elif n is Label3D:
		var l: Label3D = n
		if l.shaded and l.alpha_cut != Label3D.ALPHA_CUT_DISCARD:
			l.shaded = false
			hechos += 1
	var gi: GeometryInstance3D = n as GeometryInstance3D
	if gi == null:
		return hechos
	hechos += _material(gi.material_override)
	hechos += _material(gi.material_overlay)
	if gi is MeshInstance3D:
		var mi: MeshInstance3D = gi
		if mi.mesh != null:
			for i in mi.mesh.get_surface_count():
				var m: Material = mi.get_surface_override_material(i)
				if m != null:
					hechos += _material(m)
				hechos += _material(mi.mesh.surface_get_material(i))
	elif gi is CPUParticles3D:
		hechos += _malla((gi as CPUParticles3D).mesh)
	elif gi is MultiMeshInstance3D:
		var mm: MultiMesh =(gi as MultiMeshInstance3D).multimesh
		if mm != null:
			hechos += _malla(mm.mesh)
	return hechos


static func _malla(malla: Mesh) -> int:
	if malla == null:
		return 0
	var hechos: int = 0
	for i in malla.get_surface_count():
		hechos += _material(malla.surface_get_material(i))
	return hechos


static func _material(m: Material) -> int:
	var hechos: int = 0
	var vistos: int = 0
	while m != null and vistos < 8:
		vistos += 1
		if m is BaseMaterial3D:
			var b: BaseMaterial3D = m
			if b.shading_mode != BaseMaterial3D.SHADING_MODE_UNSHADED and es_transparente_std(b):
				b.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
				hechos += 1
		elif m is ShaderMaterial:
			var sm: ShaderMaterial = m
			var clon: Shader = sin_luz(sm.shader)
			if clon != sm.shader:
				sm.shader = clon
				hechos += 1
		m = m.next_pass
	return hechos



static func es_transparente_std(b: BaseMaterial3D) -> bool:
	return b.transparency == BaseMaterial3D.TRANSPARENCY_ALPHA \
			or b.transparency == BaseMaterial3D.TRANSPARENCY_ALPHA_DEPTH_PRE_PASS \
			or b.blend_mode != BaseMaterial3D.BLEND_MODE_MIX \
			or b.refraction_enabled or b.proximity_fade_enabled




static func es_transparente_con_luz(sh: Shader) -> bool:
	if sh == null:
		return false
	var code: String = _sin_comentarios(sh.code)
	if not code.contains("shader_type spatial"):
		return false
	var modo: String = _render_mode(code)
	if modo.contains("unshaded"):
		return false
	if modo.contains("blend_add") or modo.contains("blend_sub") or modo.contains("blend_mul") \
			or modo.contains("blend_premul_alpha"):
		return true
	if code.contains("hint_screen_texture") or code.contains("hint_depth_texture"):
		return true
	if code.contains("ALPHA_SCISSOR_THRESHOLD") or code.contains("ALPHA_HASH_SCALE"):
		return false
	if _re_alpha == null:
		_re_alpha = RegEx.new()
		_re_alpha.compile("\\bALPHA\\s*[-+*/]?=(?!=)")
	return _re_alpha.search(code) != null




static func sin_luz(sh: Shader) -> Shader:
	if not es_transparente_con_luz(sh):
		return sh
	if _sin_luz.has(sh):
		return _sin_luz[sh]
	var clon: Shader = Shader.new()
	clon.code = con_unshaded(sh.code)
	_sin_luz[sh] = clon
	_sin_luz[clon] = clon
	return clon



static func con_unshaded(code: String) -> String:
	var re: RegEx = RegEx.new()
	re.compile("(?m)^\\s*render_mode\\s+")
	var m: RegExMatch = re.search(code)
	if m != null:
		return code.substr(0, m.get_end()) + "unshaded, " + code.substr(m.get_end())
	re.compile("shader_type\\s+spatial\\s*;")
	m = re.search(code)
	if m == null:
		return code
	return code.substr(0, m.get_end()) + "\nrender_mode unshaded;" + code.substr(m.get_end())


static func _render_mode(code: String) -> String:
	var re: RegEx = RegEx.new()
	re.compile("render_mode([^;]*);")
	var m: RegExMatch = re.search(code)
	return m.get_string(1) if m != null else ""


static func _sin_comentarios(code: String) -> String:
	var re: RegEx = RegEx.new()
	re.compile("(?s)/\\*.*?\\*/|//[^\\n]*")
	return re.sub(code, "", true)
