extends Resource






















const _SOLO_GPU := {
	&"collision_mode": 0, &"collision_friction": 0.0, &"collision_bounce": 0.0,
	&"collision_use_scale": false,
	&"turbulence_enabled": false, &"turbulence_noise_strength": 1.0,
	&"turbulence_noise_scale": 9.0, &"turbulence_noise_speed": Vector3.ZERO,
	&"turbulence_noise_speed_random": 0.2, &"turbulence_influence_min": 0.1,
	&"turbulence_influence_max": 0.1, &"turbulence_initial_displacement_min": 0.0,
	&"turbulence_initial_displacement_max": 0.0,
	&"sub_emitter_mode": 0, &"sub_emitter_frequency": 4.0, &"sub_emitter_amount_at_end": 1,
	&"sub_emitter_amount_at_collision": 1, &"sub_emitter_amount_at_start": 1,
	&"sub_emitter_keep_velocity": false,
}
const _RENOMBRE := {&"scale_min": &"scale_amount_min", &"scale_max": &"scale_amount_max"}
const _HORNEO := 16


const _RAMPA = preload("res://features/match/rampa_cpu.gd")




static var desconocidas: Dictionary = {}
static var _comunes_cache: Dictionary = {}



@export_storage var color_ramp: Texture2D:
	set(v):
		_cambia_textura(color_ramp, v)
		color_ramp = v
		_manda_texturas()
@export_storage var color_initial_ramp: Texture2D:
	set(v):
		_cambia_textura(color_initial_ramp, v)
		color_initial_ramp = v
		_manda_texturas()
@export_storage var alpha_curve: Texture2D:
	set(v):
		_cambia_textura(alpha_curve, v)
		alpha_curve = v
		_manda_texturas()
@export_storage var scale_curve: Texture2D:
	set(v):
		_cambia_textura(scale_curve, v)
		scale_curve = v
		_manda_texturas()



@export_storage var _valores: Dictionary = {}:
	set(v):
		_valores = v.duplicate()
		for x: Variant in _valores.values():
			_cambia_textura(null, x)

var _nodos: Array[WeakRef] = []


func _set(prop: StringName, valor: Variant) -> bool:
	if _comunes().has(prop) or _RENOMBRE.has(prop):
		_cambia_textura(_valores.get(prop), valor)
		_valores[prop] = valor
		for n: CPUParticles3D in _vivos():
			_aplica(n, prop)
		return true
	if _SOLO_GPU.has(prop):
		_valores[prop] = valor
		return true
	if prop == &"script" or String(prop).begins_with("resource_") or String(prop).contains("/"):
		return false
	desconocidas[prop] = true
	_valores[prop] = valor
	return true


func _get(prop: StringName) -> Variant:
	if _valores.has(prop):
		return _valores[prop]
	var comunes: Dictionary = _comunes()
	if _RENOMBRE.has(prop):
		return comunes.get(_RENOMBRE[prop])
	if comunes.has(prop):
		return comunes[prop]
	return _SOLO_GPU.get(prop)




static func _comunes() -> Dictionary:
	if _comunes_cache.is_empty():
		var cpu: Dictionary = {}
		for p: Dictionary in ClassDB.class_get_property_list(&"CPUParticles3D"):
			cpu[StringName(p["name"])] = true
		for p: Dictionary in ClassDB.class_get_property_list(&"ParticleProcessMaterial", true):
			var nombre := StringName(p["name"])
			if cpu.has(nombre) and p["usage"]&PROPERTY_USAGE_STORAGE:
				_comunes_cache[nombre] = ClassDB.class_get_property_default_value(&"CPUParticles3D", nombre)
		for nombre: StringName in _RENOMBRE.values():
			_comunes_cache[nombre] = ClassDB.class_get_property_default_value(&"CPUParticles3D", nombre)
	return _comunes_cache





func vincula(nodo: CPUParticles3D) -> void:
	if not _vivos().has(nodo):
		_nodos.append(weakref(nodo))
	for prop: StringName in _valores:
		_aplica(nodo, prop)
	_aplica_texturas(nodo)


func suelta(nodo: CPUParticles3D) -> void:
	for i in range(_nodos.size() - 1, -1, -1):
		var n: Object = _nodos[i].get_ref()
		if n == null or n == nodo:
			_nodos.remove_at(i)
	if not is_instance_valid(nodo):
		return
	for prop: StringName in _valores:
		if _comunes().has(prop) or _RENOMBRE.has(prop):
			nodo.set(_RENOMBRE.get(prop, prop), _comunes_cache[_RENOMBRE.get(prop, prop)])
	nodo.color_ramp = null
	nodo.color_initial_ramp = null
	nodo.scale_amount_curve = null
	nodo.split_scale = false


func _vivos() -> Array[CPUParticles3D]:
	var out: Array[CPUParticles3D] = []
	for i in range(_nodos.size() - 1, -1, -1):
		var n: Object = _nodos[i].get_ref()
		if n == null:
			_nodos.remove_at(i)
		else:
			out.append(n as CPUParticles3D)
	return out


func _aplica(nodo: CPUParticles3D, prop: StringName) -> void:
	if not (_comunes().has(prop) or _RENOMBRE.has(prop)):
		return
	var valor: Variant = _valores.get(prop)
	if valor is Texture2D:
		valor = _curva(valor, prop)
	nodo.set(_RENOMBRE.get(prop, prop), valor)


func _aplica_texturas(nodo: CPUParticles3D) -> void:
	nodo.color_ramp = _rampa()
	nodo.color_initial_ramp = _degradado(color_initial_ramp, &"color_initial_ramp")
	if scale_curve is CurveXYZTexture:
		var xyz := scale_curve as CurveXYZTexture
		nodo.split_scale = true
		nodo.scale_curve_x = xyz.curve_x
		nodo.scale_curve_y = xyz.curve_y
		nodo.scale_curve_z = xyz.curve_z
	else:
		nodo.split_scale = false
		nodo.scale_amount_curve = _curva(scale_curve, &"scale_curve")


func _manda_texturas() -> void:
	for n: CPUParticles3D in _vivos():
		_aplica_texturas(n)





func _cambia_textura(vieja: Variant, nueva: Variant) -> void:
	var al_cambiar := Callable(self, &"_al_cambiar_textura")
	if vieja is Resource and vieja != nueva and (vieja as Resource).changed.is_connected(al_cambiar):
		(vieja as Resource).changed.disconnect(al_cambiar)
	if nueva is Resource and not (nueva as Resource).changed.is_connected(al_cambiar):
		(nueva as Resource).changed.connect(al_cambiar)


func _al_cambiar_textura() -> void:
	for n: CPUParticles3D in _vivos():
		_aplica_texturas(n)
		for prop: StringName in _valores:
			if _valores[prop] is Texture2D:
				_aplica(n, prop)


func _degradado(tex: Texture2D, prop: StringName) -> Gradient:
	if tex == null:
		return null
	if tex is GradientTexture1D:
		return (tex as GradientTexture1D).gradient
	if tex is _RAMPA:
		return tex.get(&"gradient") as Gradient
	desconocidas[StringName("%s:%s" % [prop, tex.get_class()])] = true
	return null


func _curva(tex: Texture2D, prop: StringName) -> Curve:
	if tex == null:
		return null
	if tex is CurveTexture:
		return (tex as CurveTexture).curve
	if tex is _RAMPA:
		return tex.get(&"curve") as Curve
	desconocidas[StringName("%s:%s" % [prop, tex.get_class()])] = true
	return null





func _rampa() -> Gradient:
	var base: Gradient = _degradado(color_ramp, &"color_ramp")
	var curva: Curve = _curva(alpha_curve, &"alpha_curve")
	if curva == null:
		return base
	var ancho: float = maxf(curva.max_domain - curva.min_domain, 0.0001)
	var marcas: Dictionary = {}
	for i in _HORNEO + 1:
		marcas[float(i) / _HORNEO] = true
	for i in curva.point_count:
		marcas[clampf((curva.get_point_position(i).x - curva.min_domain) / ancho, 0.0, 1.0)] = true
	if base != null:
		for o: float in base.offsets:
			marcas[clampf(o, 0.0, 1.0)] = true
	var ts: Array = marcas.keys()
	ts.sort()
	var offsets := PackedFloat32Array()
	var colores := PackedColorArray()
	for t: float in ts:
		var c: Color = base.sample(t) if base != null else Color.WHITE
		c.a *= clampf(curva.sample_baked(curva.min_domain + t * ancho), 0.0, 1.0)
		offsets.append(t)
		colores.append(c)
	var g := Gradient.new()
	g.offsets = offsets
	g.colors = colores
	return g
