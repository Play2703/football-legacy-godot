extends CPUParticles3D
















const _SOLO_GPU := {
	&"interpolate": true, &"trail_enabled": false, &"trail_lifetime": 0.3,
	&"transform_align": 0, &"collision_base_size": 0.01, &"draw_passes": 1,
	&"interp_to_end": 0.0, &"draw_pass_2": null, &"draw_pass_3": null,
	&"draw_pass_4": null, &"draw_skin": null,
}




static var desconocidas: Dictionary = {}
static var _nativas: Dictionary = {}




@export_storage var process_material: Resource:
	set(v):
		if v == process_material:
			return
		if process_material != null and process_material.has_method(&"suelta"):
			process_material.suelta(self)
		process_material = v
		if v != null:
			if v.has_method(&"vincula"):
				v.vincula(self)
			else:
				desconocidas[&"process_material:" + v.get_class()] = true


var draw_pass_1: Mesh:
	get:
		return get_mesh()
	set(v):
		set_mesh(v)




@export_storage var amount_ratio: float = 1.0:
	set(v):
		amount_ratio = clampf(v, 0.0, 1.0)
		_aplica_cantidad()



@export_storage var sub_emitter: NodePath

var _cantidad: int = 8
var _fps: int = 30
var _solo_gpu: Dictionary = {}
var _reinicio_pendiente: bool = false
var _conserva_semilla: bool = false
var _encender_al_entrar: bool = false


func _set(prop: StringName, valor: Variant) -> bool:
	match prop:
		&"amount":
			_cantidad = maxi(1, int(valor))
			_aplica_cantidad()
			return true
		&"emitting":
			return _pide_emitir(bool(valor))
		&"fixed_fps":



			_fps = int(valor)
			return true
	if _SOLO_GPU.has(prop):
		_solo_gpu[prop] = valor
		return true
	if not _es_nativa(prop):
		desconocidas[prop] = true
		return true
	return false


func _get(prop: StringName) -> Variant:
	match prop:
		&"amount":
			return _cantidad
		&"emitting":
			if _reinicio_pendiente or _encender_al_entrar:
				return true
			return null
		&"fixed_fps":
			return _fps
	if _SOLO_GPU.has(prop):
		return _solo_gpu.get(prop, _SOLO_GPU[prop])
	return null



static func _es_nativa(prop: StringName) -> bool:
	if _nativas.is_empty():
		for p: Dictionary in ClassDB.class_get_property_list(&"CPUParticles3D"):
			_nativas[StringName(p["name"])] = true
	return _nativas.has(prop) or prop == &"script" or String(prop).contains("/")


func _aplica_cantidad() -> void:
	var n: int = maxi(1, roundi(_cantidad * amount_ratio))
	if n != get_amount():
		set_amount(n)







@warning_ignore("native_method_override")
func restart(keep_seed: bool = false) -> void:
	_conserva_semilla = keep_seed
	if not _reinicio_pendiente:
		_reinicio_pendiente = true
		_reinicia_ahora.call_deferred()


func _reinicia_ahora() -> void:

	if not _reinicio_pendiente or not is_inside_tree():
		return
	_reinicio_pendiente = false
	super.restart(_conserva_semilla)


func _pide_emitir(si: bool) -> bool:
	if _reinicio_pendiente:
		if not si:

			_reinicio_pendiente = false
			set_amount(get_amount())
			set_emitting(false)
		return true
	if si and not is_emitting() and not is_inside_tree():

		_encender_al_entrar = true
		return true
	_encender_al_entrar = false
	return false


func _notification(what: int) -> void:
	if what != NOTIFICATION_ENTER_TREE:
		return
	if _reinicio_pendiente:
		_reinicia_ahora.call_deferred()
	elif _encender_al_entrar:
		_encender_al_entrar = false
		set_emitting(true)
