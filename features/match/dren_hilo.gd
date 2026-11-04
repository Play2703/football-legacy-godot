extends RefCounted





































var unidades: Array = []

var cancela: bool = false

var us: int = 0
var lecturas_gpu: int = 0
var _texs: Array = []
var _m: Mutex = Mutex.new()
var _hilo: Thread = null


func arranca() -> bool:
	if unidades.is_empty() or _hilo != null:
		return false
	_hilo = Thread.new()


	if _hilo.start(_cuerpo, Thread.PRIORITY_NORMAL) != OK:
		_hilo = null
		return false
	return true



func listos() -> int:
	_m.lock()
	var n: int = _texs.size()
	_m.unlock()
	return n


func tex(i: int) -> Texture2D:
	_m.lock()
	var t: Texture2D = _texs[i] if i < _texs.size() else null
	_m.unlock()
	return t


func vivo() -> bool:
	return _hilo != null and _hilo.is_alive()






func espera(cortar: bool) -> void:
	if _hilo == null:
		return
	if cortar:
		cancela = true
	while _hilo.is_alive():
		RenderingServer.force_sync()
		OS.delay_usec(100)
	_hilo.wait_to_finish()
	_hilo = null


func _cuerpo() -> void:
	var t0: int = Time.get_ticks_usec()
	var gpu0: int = KitRecolor.lecturas_gpu_en_hilo
	for u in unidades:

		while not cancela and Time.get_ticks_usec() < KitRecolor.principal_pide_hasta_us:
			OS.delay_usec(200)
		if cancela:
			break



		var t: Texture2D = null
		var fuente: Texture2D = _textura_de(u)
		if fuente != null:
			KitRecolor.pon_imagen_en_meta(bool(u[2]))
			t = KitRecolor.apply(fuente, u[1])
			KitRecolor.pon_imagen_en_meta(false)
		_m.lock()
		_texs.append(t)
		_m.unlock()
	us = int(Time.get_ticks_usec() - t0)
	lecturas_gpu = KitRecolor.lecturas_gpu_en_hilo - gpu0














static func _textura_de(u: Variant) -> Texture2D:
	if not (u is Array) or (u as Array).size() < 3:
		return null
	var a: Array = u
	if typeof(a[0]) != TYPE_STRING or not (a[1] is Dictionary) or typeof(a[2]) != TYPE_BOOL:
		return null
	var ruta: String = a[0]
	if ruta.is_empty() or not ResourceLoader.exists(ruta):
		return null
	return load(ruta) as Texture2D
