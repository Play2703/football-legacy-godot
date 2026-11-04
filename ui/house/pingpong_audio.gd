extends Node


var _sonidos: Dictionary = {}
var _voces: Array[AudioStreamPlayer] = []
var _siguiente: int = 0


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	for tipo: String in ["pala", "mesa", "red"]:
		_sonidos[tipo] = _crear(tipo)
	for i in 3:
		var voz := AudioStreamPlayer.new()
		voz.bus = UiAudio.SFX_BUS
		voz.volume_db = -9
		add_child(voz)
		_voces.append(voz)


func sonar(tipo: String, fuerte: bool = false) -> void:
	if not _sonidos.has(tipo) or _voces.is_empty():
		return
	var voz: AudioStreamPlayer = _voces[_siguiente]
	_siguiente =(_siguiente + 1) % _voces.size()
	voz.stream = _sonidos[tipo]
	voz.pitch_scale = 1.12 if fuerte else 1.0
	voz.volume_db = -6 if fuerte else -9
	voz.play()


func _crear(tipo: String) -> AudioStreamWAV:
	var rng := RandomNumberGenerator.new()
	rng.seed = 2718
	var frecuencia: float = 1080 if tipo == "pala" else 1480
	var duracion: float = 0.055 if tipo == "red" else 0.045
	var n: int = int(22050 * duracion)
	var pcm := PackedByteArray()
	pcm.resize(n * 2)
	var ruido_anterior: float = 0
	for i in n:
		var t: float = float(i) / 22050
		var envolvente: float = exp(- t *(90 if tipo == "pala" else 110))
		var ruido: float = rng.randf_range(-1, 1)
		var onda: float = sin(TAU * frecuencia * t) * 0.5 + sin(TAU * frecuencia * 2.3 * t) * 0.18
		if tipo == "red":
			ruido_anterior = lerpf(ruido_anterior, ruido, 0.2)
			onda = ruido_anterior * 0.55
		else:
			onda += ruido * 0.13
		pcm.encode_s16(i * 2, int(onda * envolvente * 22000))
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = 22050
	stream.data = pcm
	return stream
