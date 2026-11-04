class_name ReplayAudio
extends Node

























const BUS: StringName = &"Master"


const RING_S: float = 10.0


const COLA_S: float = 6.0


const MARGEN_S: float = 0.25



const CAPTURA_S: float = 0.5


const DESFASE_MAX_S: float = 0.12


const FUNDIDO: int = 128

var _fx: AudioEffectCapture = null
var _rate: int = 44100


var _chunks: Array[PackedVector2Array] = []
var _first: int = 0
var _total: int = 0

var _last_us: int = 0
var _descartados: int = 0

var _colas: Array[Dictionary] = []



static func instala(padre: Node) -> ReplayAudio:
	var a: ReplayAudio = ReplayAudio.new()
	a.name = "ReplayAudio"
	padre.add_child(a)
	return a


func _enter_tree() -> void:


	process_mode = Node.PROCESS_MODE_ALWAYS
	_rate = int(AudioServer.get_mix_rate())
	var bus: int = AudioServer.get_bus_index(BUS)
	if bus < 0:
		return
	_fx = AudioEffectCapture.new()
	_fx.buffer_length = CAPTURA_S
	AudioServer.add_bus_effect(bus, _fx)
	_last_us = Time.get_ticks_usec()


func _exit_tree() -> void:
	var bus: int = AudioServer.get_bus_index(BUS)
	if _fx != null and bus >= 0:


		for i in range(AudioServer.get_bus_effect_count(bus) - 1, -1, -1):
			if AudioServer.get_bus_effect(bus, i) == _fx:
				AudioServer.remove_bus_effect(bus, i)
				break
	_fx = null
	_chunks.clear()
	_colas.clear()


func _process(_delta: float) -> void:
	vacia()




func vacia() -> void:
	if _fx == null:
		return
	var n: int = _fx.get_frames_available()
	if n > 0:
		mete(_fx.get_buffer(n))



	var d: int = _fx.get_discarded_frames()
	if d > _descartados:
		var hueco: PackedVector2Array = PackedVector2Array()
		hueco.resize(d - _descartados)
		mete(hueco)
	_descartados = d



func mete(trozo: PackedVector2Array) -> void:
	_last_us = Time.get_ticks_usec()
	if trozo.is_empty():
		return
	_chunks.append(trozo)
	_total += trozo.size()

	var tope: int = int(RING_S * _rate)
	while _chunks.size() > 1 and _total -(_first + _chunks[0].size()) >= tope:
		_first += _chunks[0].size()
		_chunks.pop_front()
	_alimenta_colas()



func cuadro_en(us: int) -> int:
	return _total - int(round(float(_last_us - us) * float(_rate) / 1000000.0))



func trozo(a: int, b: int) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	if b <= a:
		return out
	if a < _first:
		var hueco: PackedVector2Array = PackedVector2Array()
		hueco.resize(mini(_first, b) - a)
		out.append_array(hueco)
	var pos: int = _first
	for c in _chunks:
		var c0: int = pos
		var c1: int = pos + c.size()
		pos = c1
		if c1 <= a or c0 >= b:
			continue
		out.append_array(c.slice(maxi(a, c0) - c0, mini(b, c1) - c0))
	if out.size() < b - a:
		out.resize(b - a)
	return out





func engancha(clip: ReplayRec.Clip) -> void:
	if clip == null or clip.walls.is_empty() or _total <= 0:
		return
	var a: int = cuadro_en(clip.walls[0] - int(MARGEN_S * 1000000.0))
	clip.audio = trozo(a, _total)
	clip.audio_rate = _rate
	clip.audio_us0 = _last_us - int(round(float(_total - a) * 1000000.0 / float(_rate)))
	_colas.append({"ref": weakref(clip), "fin": _total,
		"hasta": _total + int(COLA_S * _rate)})





func cola_pendiente(clip: ReplayRec.Clip) -> bool:
	for c in _colas:
		if c["ref"].get_ref() == clip:
			return true
	return false


func _alimenta_colas() -> void:
	for i in range(_colas.size() - 1, -1, -1):
		var c: Dictionary = _colas[i]
		var clip: ReplayRec.Clip = c["ref"].get_ref()
		if clip == null:
			_colas.remove_at(i)
			continue
		var hasta: int = mini(_total, int(c["hasta"]))
		if hasta > int(c["fin"]):
			clip.audio.append_array(trozo(int(c["fin"]), hasta))
			c["fin"] = hasta
		if hasta >= int(c["hasta"]):
			_colas.remove_at(i)


























static func pcm_video(clip: ReplayRec.Clip, dur: float, total: int,
		fps: int, velocidad: float = 1.0) -> PackedByteArray:
	if clip == null or clip.audio.is_empty() or clip.audio_rate <= 0 \
			or clip.walls.size() != clip.times.size() or clip.times.size() < 2 \
			or total < 2 or velocidad <= 0.0:
		return PackedByteArray()
	var rate: int = clip.audio_rate
	var src: PackedVector2Array = clip.audio
	var out: PackedVector2Array = PackedVector2Array()
	var cortes: Array[int] = []


	var cursor: float = -1.0
	var desfase_max: int = int(DESFASE_MAX_S * velocidad * rate)
	var estirar: bool = velocidad != 1.0
	for i in total:
		var t: float = dur *(float(i) / float(total - 1))
		var objetivo: float = roundf(float(_pared_en(clip, t) - clip.audio_us0)
			* float(rate) / 1000000.0)
		if cursor < 0.0 or absf(cursor - objetivo) > float(desfase_max):
			if cursor >= 0.0:
				cortes.append(out.size())
			cursor = objetivo

		var n: int =(i + 1) * rate / fps - i * rate / fps
		if estirar:
			out.append_array(_estira(src, cursor, n, velocidad))
			cursor += float(n) * velocidad
		else:
			out.append_array(_lee(src, int(cursor), n))
			cursor += float(n)

	var sigue: int = ceili(cursor)
	if sigue < src.size():
		out.append_array(src.slice(maxi(sigue, 0)))
	for k in cortes:
		_funde(out, k)
	var bytes: PackedByteArray = out.to_byte_array()
	if bytes.size() != out.size() * 8:

		var f: PackedFloat32Array = PackedFloat32Array()
		f.resize(out.size() * 2)
		for j in out.size():
			f[j * 2] = out[j].x
			f[j * 2 + 1] = out[j].y
		bytes = f.to_byte_array()
	return bytes




static func _pared_en(clip: ReplayRec.Clip, t: float) -> int:
	var times: PackedFloat32Array = clip.times
	var n: int = times.size()
	if t <= times[0]:
		return clip.walls[0] + int((t - times[0]) * 1000000.0)
	if t >= times[n - 1]:
		return clip.walls[n - 1] + int((t - times[n - 1]) * 1000000.0)
	var lo: int = times.bsearch(t, true) - 1
	lo = clampi(lo, 0, n - 2)
	var span: float = times[lo + 1] - times[lo]
	var k: float =(t - times[lo]) / span if span > 0.0 else 0.0
	return clip.walls[lo] + int(round(float(clip.walls[lo + 1] - clip.walls[lo]) * k))




static func _lee(src: PackedVector2Array, a: int, n: int) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	var b: int = a + n
	if a < 0:
		out.resize(mini(- a, n))
		a = 0
	if a < b and a < src.size():
		out.append_array(src.slice(a, mini(b, src.size())))
	out.resize(n)
	return out










static func _estira(src: PackedVector2Array, a: float, n: int,
		paso: float) -> PackedVector2Array:
	var out: PackedVector2Array = PackedVector2Array()
	out.resize(n)
	var ultimo: int = src.size() - 1
	for k in n:
		var p: float = a + float(k) * paso
		var i: int = floori(p)
		if i < 0 or i > ultimo:
			continue
		if i == ultimo:
			out[k] = src[i]
		else:
			out[k] = src[i].lerp(src[i + 1], p - float(i))
	return out




static func _funde(out: PackedVector2Array, k: int) -> void:
	for j in FUNDIDO:
		var g: float = float(j) / float(FUNDIDO)
		var antes: int = k - 1 - j
		if antes >= 0:
			out[antes] = out[antes] * g
		var despues: int = k + j
		if despues < out.size():
			out[despues] = out[despues] * g
