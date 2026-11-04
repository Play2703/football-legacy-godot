extends RefCounted






















































const TANDA: int = 4096

var _hilo: Thread = null
var _mutex: Mutex = Mutex.new()
var _sem: Semaphore = Semaphore.new()



var _pedidos: Array = []



var _int_pend: PackedFloat64Array = PackedFloat64Array([-1.0, -1.0])


var _gen: PackedInt32Array = PackedInt32Array([0, 0])
var _vueltas: PackedInt32Array = PackedInt32Array([0, 0])
var _activo: bool = false
var _salir: bool = false

var _latido: bool = false

var _durmiendo: bool = false


var _h_synth: Array = [null, null]
var _h_pb: Array = [null, null]
var _h_gen: PackedInt32Array = PackedInt32Array([0, 0])




func arranca(activo: bool) -> bool:
	if _hilo != null:
		return true
	_activo = activo
	_salir = false
	_hilo = Thread.new()
	if _hilo.start(_bucle) != OK:
		_hilo = null
		return false
	return true


func corriendo() -> bool:
	return _hilo != null






func pon(i: int, synth: RefCounted, destino: Object) -> void:
	_mutex.lock()
	_gen[i] += 1
	_vueltas[i] = synth.vueltas()


	_int_pend[i] = -1.0
	_pedidos.append(["pon", i, synth, destino, _gen[i]])







	_latido = true
	_mutex.unlock()
	_sem.post()



func suelta(i: int) -> void:
	_mutex.lock()
	_gen[i] += 1
	_vueltas[i] = 0
	_int_pend[i] = -1.0
	_pedidos.append(["suelta", i])
	_mutex.unlock()
	_sem.post()





func intensidad(i: int, v: float) -> void:
	_mutex.lock()
	_int_pend[i] = v
	_mutex.unlock()




func latido() -> void:
	_mutex.lock()
	_latido = true
	var despierta: bool = _durmiendo
	_durmiendo = false
	_mutex.unlock()
	if despierta:
		_sem.post()




func vuelta(i: int, n: int) -> void:
	_mutex.lock()
	_pedidos.append(["vuelta", i, n])
	_mutex.unlock()
	_sem.post()



func vueltas(i: int) -> int:
	_mutex.lock()
	var v: int = _vueltas[i]
	_mutex.unlock()
	return v



func activa(v: bool) -> void:
	_mutex.lock()
	var cambia: bool = _activo != v
	_activo = v
	_mutex.unlock()
	if cambia and v:
		_sem.post()




func para() -> void:
	if _hilo == null:
		return
	_mutex.lock()
	_salir = true
	_mutex.unlock()
	_sem.post()
	_hilo.wait_to_finish()
	_hilo = null
	_h_synth = [null, null]
	_h_pb = [null, null]
	_mutex.lock()
	_pedidos.clear()
	_mutex.unlock()


func _bucle() -> void:
	var buf: PackedVector2Array = PackedVector2Array()
	var intens: PackedFloat64Array = PackedFloat64Array([-1.0, -1.0])
	while true:
		_mutex.lock()
		var pedidos: Array = _pedidos
		_pedidos = []
		var salir: bool = _salir
		var activo: bool = _activo



		var pasa: bool = activo and _latido
		if pasa:
			_latido = false
		else:
			_durmiendo = true
		intens[0] = _int_pend[0]
		intens[1] = _int_pend[1]
		_int_pend[0] = -1.0
		_int_pend[1] = -1.0
		_mutex.unlock()
		if salir:
			break



		for p: Array in pedidos:
			var i: int = p[1]
			if p[0] == "pon":
				_h_synth[i] = p[2]
				_h_pb[i] = p[3]
				_h_gen[i] = p[4]
			elif p[0] == "vuelta":
				if _h_synth[i] != null:
					_h_synth[i].empieza_en_vuelta(p[2])
			else:
				_h_synth[i] = null
				_h_pb[i] = null
		for i in 2:
			if intens[i] >= 0.0 and _h_synth[i] != null:
				_h_synth[i].set_intensity(intens[i])
		if pasa:
			for i in 2:
				var s: RefCounted = _h_synth[i]
				var pb: Object = _h_pb[i]
				if s == null or pb == null:
					continue
				var n: int = mini(pb.get_frames_available(), TANDA)
				if n > 0:
					if buf.size() != n:
						buf.resize(n)
					s.render(buf)
					pb.push_buffer(buf)
				var v: int = s.vueltas()
				_mutex.lock()
				if _gen[i] == _h_gen[i]:
					_vueltas[i] = v
				_mutex.unlock()
		else:


			_sem.wait()
