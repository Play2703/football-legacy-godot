extends Node

































func _init() -> void:
	CacheGuard.t_autoloads = Time.get_ticks_msec()


func _enter_tree() -> void:
	var herramienta: String = herramienta_en(OS.get_cmdline_args())
	if herramienta.is_empty():
		return


	get_tree().node_added.connect(_al_entrar)
	print("FOTO_NITIDA: %s — sus SubViewport heredan el filtro de la raíz" % herramienta)





static func herramienta_en(args: PackedStringArray) -> String:
	for a in args:
		var ruta: String = a.trim_prefix("res://")
		if not ruta.begins_with("tools/"):
			continue
		if not (ruta.ends_with(".tscn") or ruta.ends_with(".scn") or ruta.ends_with(".gd")):
			continue
		if ruta.get_file().begins_with("test_"):
			return ""
		return ruta
	return ""


func _al_entrar(n: Node) -> void:
	if n is SubViewport and es_de_herramienta(n):
		hereda_de_la_raiz(n as SubViewport, get_tree().root)






static func es_de_herramienta(n: Node) -> bool:
	var p: Node = n
	while p != null:
		var sc: Script = p.get_script() as Script
		if sc != null:
			return sc.resource_path.begins_with("res://tools/")
		p = p.get_parent()
	return true




static func hereda_de_la_raiz(vp: SubViewport, raiz: Viewport) -> void:
	vp.canvas_item_default_texture_filter = raiz.canvas_item_default_texture_filter
	vp.canvas_item_default_texture_repeat = raiz.canvas_item_default_texture_repeat
	vp.snap_2d_transforms_to_pixel = raiz.snap_2d_transforms_to_pixel
