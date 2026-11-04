extends Node

















const POOL_SIZE: int = 6
const MIN_INTERVAL_MS: int = 40

const MUSIC_BUS: String = "Music"
const MUSIC_SRC_BUS: String = "MusicSrc"
const SFX_BUS: String = "SFX"
const STADIUM_BUS: String = "Stadium"

var _players: Array[AudioStreamPlayer] = []
var _next: int = 0
var _last_play: Dictionary = {}


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	_ensure_bus(MUSIC_BUS, "Master")
	_ensure_bus(MUSIC_SRC_BUS, MUSIC_BUS)
	_ensure_bus(SFX_BUS, "Master")
	_ensure_bus(STADIUM_BUS, SFX_BUS)
	_setup_master_limiter()
	_setup_stadium_reverb()
	for i in POOL_SIZE:
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.bus = SFX_BUS
		add_child(p)
		_players.append(p)
	Settings.changed.connect(_apply_volumes)
	_apply_volumes()




func play(cue: String, pitch: float = 1.0, vol_db: float = 0.0,
		bus: String = SFX_BUS) -> void:
	var stream: AudioStream = AudioBank.stream(cue)
	if stream == null:
		return
	var now: int = Time.get_ticks_msec()
	if now - int(_last_play.get(cue, - MIN_INTERVAL_MS)) < MIN_INTERVAL_MS:
		return
	_last_play[cue] = now
	var p: AudioStreamPlayer = _players[_next]
	_next =(_next + 1) % POOL_SIZE
	p.stream = stream
	p.pitch_scale = pitch
	p.volume_db = vol_db
	p.bus = bus
	p.play()








func click(pitch: float = 1.0) -> void:
	play("ui_click", pitch, -5.0)



func back() -> void:
	play("ui_back", 1.0, -6.0)



func confirm() -> void:
	play("ui_confirm", 1.0, -5.0)



func deny() -> void:
	play("ui_deny", 1.0, -7.0)



func toggle(on: bool = true) -> void:
	play("ui_toggle", 1.06 if on else 0.94, -8.0)



func coin() -> void:
	play("ui_coin", 1.0, -6.0)



func whoosh() -> void:
	play("ui_whoosh", 1.0, -13.0)



func pop() -> void:
	play("ui_pop", 1.0, -8.0)




func fanfare(rarity: int = 0) -> void:







	Music.duck(-8.0, 0.5, 1.2)
	play("fanfare", 1.0 + 0.06 * float(clampi(rarity, 0, 3)), -4.0)



func bad_news() -> void:
	play("stinger_bad", 1.0, -5.0)



func haptic(duration_ms: int = 15) -> void:


	if not Settings.haptics_enabled or Entrada.vibra(duration_ms):
		return
	if OS.has_feature("mobile"):
		Input.vibrate_handheld(duration_ms)




func _ensure_bus(bus_name: String, send: String) -> void:
	if AudioServer.get_bus_index(bus_name) != -1:
		return
	AudioServer.add_bus()
	var idx: int = AudioServer.get_bus_count() - 1
	AudioServer.set_bus_name(idx, bus_name)
	AudioServer.set_bus_send(idx, send)




func _setup_master_limiter() -> void:
	if AudioServer.get_bus_effect_count(0) > 0:
		return
	var fx: AudioEffect = null
	if ClassDB.class_exists("AudioEffectHardLimiter"):
		fx = ClassDB.instantiate("AudioEffectHardLimiter")
	elif ClassDB.class_exists("AudioEffectLimiter"):
		fx = ClassDB.instantiate("AudioEffectLimiter")
	if fx != null:
		AudioServer.add_bus_effect(0, fx)




func _setup_stadium_reverb() -> void:
	var idx: int = AudioServer.get_bus_index(STADIUM_BUS)
	if idx < 0 or AudioServer.get_bus_effect_count(idx) > 0:
		return
	var rv: AudioEffectReverb = AudioEffectReverb.new()
	rv.room_size = 0.82
	rv.damping = 0.45
	rv.spread = 0.9
	rv.predelay_msec = 28.0
	rv.hipass = 0.12
	rv.dry = 1.0
	rv.wet = 0.22
	AudioServer.add_bus_effect(idx, rv)




func set_stadium_room(room: float, wet: float) -> void:
	var idx: int = AudioServer.get_bus_index(STADIUM_BUS)
	if idx < 0 or AudioServer.get_bus_effect_count(idx) == 0:
		return
	var rv: AudioEffectReverb = AudioServer.get_bus_effect(idx, 0) as AudioEffectReverb
	if rv == null:
		return
	rv.room_size = clampf(room, 0.05, 0.98)
	rv.wet = clampf(wet, 0.0, 0.6)


func _apply_volumes() -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(MUSIC_BUS),
		linear_to_db(maxf(Settings.music_volume, 0.0001)))
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(SFX_BUS),
		linear_to_db(maxf(Settings.sfx_volume, 0.0001)))
