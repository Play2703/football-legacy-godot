extends Node







































const SRC_BUS: String = "MusicSrc"

const MusicHilo := preload("res://features/audio/music_hilo.gd")



signal tema_cambiado(id: String)



const PLAY_DB: float = -2.0
const OFF_DB: float = -60.0








const CORTE_DB: float = -40.0








const BUFFER_S: float = 0.6
const BUFFER_S_ANDROID: float = 2.0

const RAMPA_SALTO_DB: float = -30.0
const RAMPA_SALTO_S: float = 0.15




const MAX_FILL: int = 3072
































const PRIME: int = 11025
const FILL_BUDGET_US: int = 6000



const FILL_MIN: int = 1024

var _players: Array[AudioStreamPlayer] = []
var _playbacks: Array = [null, null]
var _synths: Array = [null, null]
var _active: int = -1
var _cur_id: String = ""
var _fade_tweens: Array = [null, null]



var _saliendo: Array[bool] = [false, false]

var _skips: Array[int] = [0, 0]

var _simula_android: bool = false
var _duck_tween: Tween
var _buf: PackedVector2Array = PackedVector2Array()





var _us_por_cuadro: float = 1.45


var _enabled: bool = false



var _hilo: MusicHilo = null

var _usa_hilo: bool = not OS.has_feature("nothreads")


var _en_hilo: Array[bool] = [false, false]

var _app_pausada: bool = false




var _familia: String = ""
var _lista: Array[String] = []



var _ultimo_de: Dictionary = {}
var _animo_de: Dictionary = {}


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_enabled = DisplayServer.get_name() != "headless"
	if not _enabled:
		return
	_monta_huecos()




func _exit_tree() -> void:
	_usa_hilo = false
	if _hilo != null:
		_hilo.para()
		_hilo = null
	_en_hilo = [false, false]





func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_PAUSED:
		_app_pausada = true
		_avisa_activo()
	elif what == NOTIFICATION_APPLICATION_RESUMED:
		_app_pausada = false
		_avisa_activo()




func _sintetiza() -> bool:
	return Settings.music_volume > 0.001 and not _app_pausada


func _avisa_activo() -> void:
	if _hilo != null:
		_hilo.activa(_sintetiza())





func _entrega(i: int) -> void:
	if not _usa_hilo or _synths[i] == null or _playbacks[i] == null:
		return
	if _hilo == null:
		_hilo = MusicHilo.new()
		if not _hilo.arranca(_sintetiza()):
			_hilo = null
			_usa_hilo = false
			return
	_hilo.pon(i, _synths[i], _playbacks[i])
	_en_hilo[i] = true



func _suelta_synth(i: int) -> void:
	if _en_hilo[i]:
		_en_hilo[i] = false
		if _hilo != null:
			_hilo.suelta(i)
	_synths[i] = null



func _vueltas(i: int) -> int:
	if _en_hilo[i] and _hilo != null:
		return _hilo.vueltas(i)
	var s: MusicSynth = _synths[i]
	return s.vueltas() if s != null else 0




func _monta_huecos() -> void:
	for i in 2:
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		var gen: AudioStreamGenerator = AudioStreamGenerator.new()
		gen.mix_rate = float(MusicSynth.RATE)
		gen.buffer_length = _buffer_s()
		p.stream = gen
		p.bus = SRC_BUS
		p.volume_db = OFF_DB
		add_child(p)
		_players.append(p)



func _buffer_s() -> float:
	return BUFFER_S_ANDROID if (OS.has_feature("android") or _simula_android) else BUFFER_S









func play(id: String, fade: float = 1.6, animo: String = "", himnos: Array = []) -> void:
	if not _enabled:
		return
	if MusicLists.es_familia(id):
		_play_lista(id, animo, himnos, fade)
		return


	_familia = ""
	_pon(id, fade)






func _play_lista(familia: String, animo: String, himnos: Array, fade: float) -> void:
	var l: Array[String] = MusicLists.lista(familia, animo, himnos)
	var nuevo_animo: bool = not _animo_de.has(familia) or String(_animo_de[familia]) != animo
	_familia = familia
	_lista = l
	_animo_de[familia] = animo
	if l.has(_cur_id):
		_ultimo_de[familia] = _cur_id
		return
	var id: String = l[0]
	if not nuevo_animo and _ultimo_de.has(familia):
		id = _proximo(l, String(_ultimo_de[familia]))
	_pon(id, fade)




func siguiente(fade: float = 1.2) -> void:
	if not _enabled or _familia.is_empty() or _lista.size() < 2:
		return
	_pon(_proximo(_lista, _cur_id), fade)





func _proximo(l: Array, actual: String) -> String:
	if Settings.radio_azar:
		return MusicLists.al_azar(l, actual)
	return MusicLists.siguiente(l, actual)



func en_lista() -> bool:
	return not _familia.is_empty()



func nombre_actual() -> String:
	return MusicLists.nombre(_cur_id)


func _pon(id: String, fade: float) -> void:
	if id == _cur_id:
		return
	_cur_id = id
	if not _familia.is_empty():
		_ultimo_de[_familia] = id



	var next: int = 0
	if _active >= 0:
		next = 1 - _active
	elif _synths[1] == null and _synths[0] != null:
		next = 1

	_kill_fade(next)
	_saliendo[next] = false


	_suelta_synth(next)
	var synth: MusicSynth = MusicSynth.new(id)


	synth.set_intensity(0.4)
	_synths[next] = synth
	var p: AudioStreamPlayer = _players[next]
	p.volume_db = OFF_DB
	p.play()
	_playbacks[next] = p.get_stream_playback()


	var pb0: AudioStreamGeneratorPlayback = _playbacks[next]
	_skips[next] = pb0.get_skips() if pb0 != null else 0























	if _active < 0:
		_fill(next, PRIME)
		_entrega(next)
	else:
		_entrega(next)
		_fill(next, _cap_presupuesto())



	_kill_fade(next)
	p.volume_db = OFF_DB
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(p, "volume_db", PLAY_DB, fade)
	_fade_tweens[next] = tw
	if _active >= 0:
		_fade_out(_active, fade)
	_active = next
	tema_cambiado.emit(id)



func stop(fade: float = 0.9) -> void:
	if not _enabled or _active < 0:
		return
	_cur_id = ""
	_familia = ""
	_fade_out(_active, fade)
	_active = -1



func set_intensity(value: float) -> void:
	if _active < 0:
		return

	if _en_hilo[_active] and _hilo != null:
		_hilo.intensidad(_active, value)
		return
	var s: MusicSynth = _synths[_active]
	if s != null:
		s.set_intensity(value)




func duck(db: float = -8.0, hold: float = 0.45, back: float = 1.1) -> void:
	if not _enabled:
		return
	var idx: int = AudioServer.get_bus_index(SRC_BUS)
	if idx < 0:
		return
	if _duck_tween and _duck_tween.is_valid():
		_duck_tween.kill()
	AudioServer.set_bus_volume_db(idx, db)
	_duck_tween = create_tween()
	_duck_tween.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_duck_tween.set_ignore_time_scale(true)
	_duck_tween.tween_interval(hold)
	_duck_tween.tween_method(func(v: float) -> void:
		AudioServer.set_bus_volume_db(idx, v), db, 0.0, back)



func current() -> String:
	return _cur_id


func _process(_delta: float) -> void:
	if not _enabled:
		return





	if _hilo != null:
		_hilo.activa(_sintetiza())
	if Settings.music_volume <= 0.001:
		return
	var cap: int = _cap_presupuesto()
	for i in 2:
		_fill(i, cap)





	if _hilo != null:
		_hilo.latido()







	if not _familia.is_empty() and _active >= 0:
		if _synths[_active] != null and _vueltas(_active) >= MusicLists.VUELTAS_POR_TEMA:
			siguiente(3.0)






func _fill(i: int, cap: int = MAX_FILL) -> void:
	var synth: MusicSynth = _synths[i]
	if synth == null:
		return


	if _saliendo[i] and _players[i].volume_db < CORTE_DB:
		_suelta(i)
		return
	var pb: AudioStreamGeneratorPlayback = _playbacks[i]
	if pb == null or not _players[i].playing:
		return
	if _mira_saltos(i, pb.get_skips()):
		return
	if _en_hilo[i]:
		return
	var avail: int = mini(pb.get_frames_available(), cap)
	if avail <= 0:
		return
	if _buf.size() != avail:
		_buf.resize(avail)
	var t0: int = Time.get_ticks_usec()
	synth.render(_buf)
	pb.push_buffer(_buf)



	if avail >= FILL_MIN:
		var medido: float = float(Time.get_ticks_usec() - t0) / float(avail)
		_us_por_cuadro = lerpf(_us_por_cuadro, medido, 0.25)




func _cap_presupuesto() -> int:
	return clampi(int(float(FILL_BUDGET_US) / maxf(_us_por_cuadro, 0.05)),
		FILL_MIN, MAX_FILL)
















func _mira_saltos(i: int, skips: int) -> bool:
	if skips == _skips[i]:
		return false
	_skips[i] = skips
	if _saliendo[i]:
		_suelta(i)
		return true
	var tw: Tween = _fade_tweens[i]
	if tw != null and tw.is_valid() and tw.is_running():
		return false
	var p: AudioStreamPlayer = _players[i]
	p.volume_db = RAMPA_SALTO_DB
	var rampa: Tween = create_tween()
	rampa.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	rampa.set_ignore_time_scale(true)
	rampa.tween_property(p, "volume_db", PLAY_DB, RAMPA_SALTO_S)


	_fade_tweens[i] = rampa
	return false




func _suelta(i: int) -> void:
	_kill_fade(i)
	_saliendo[i] = false
	_players[i].stop()
	_players[i].volume_db = OFF_DB
	_playbacks[i] = null
	_suelta_synth(i)






func _fade_out(i: int, fade: float) -> void:
	_kill_fade(i)
	_saliendo[i] = true
	var p: AudioStreamPlayer = _players[i]
	var tw: Tween = create_tween()
	tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	tw.set_ignore_time_scale(true)
	tw.tween_property(p, "volume_db", OFF_DB, fade)
	tw.tween_callback(func() -> void:
		p.stop()
		_saliendo[i] = false
		_playbacks[i] = null
		_suelta_synth(i))
	_fade_tweens[i] = tw


func _kill_fade(i: int) -> void:
	var tw: Tween = _fade_tweens[i]
	if tw != null and tw.is_valid():
		tw.kill()
	_fade_tweens[i] = null
