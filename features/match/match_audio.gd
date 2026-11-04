class_name MatchAudio
extends Node





const CROWD_BASE_DB: float = -16.0

const HUSH_DB: float = -27.0













const DIV_CROWD: Dictionary = {
	1: {"bed": "crowd_loop_d1", "db": -15.0, "sparse": false,
		"room": 0.88, "wet": 0.26},
	2: {"bed": "crowd_loop_d2", "db": -17.0, "sparse": false,
		"room": 0.74, "wet": 0.19},
	3: {"bed": "crowd_loop_d3", "db": -21.0, "sparse": true,
		"room": 0.52, "wet": 0.1},
}



const SPARSE_EVERY: Vector2 = Vector2(3.5, 8.0)



var div: int = 1
var attendance: float = 1.0


var away_fill: float = 0.92

var venue_acoustics: Vector2 = Vector2(-1.0, -1.0)







var aforo: int = 0
var _sparse_next: float = 0.0







const ANGRY_DB: float = -21.0
const HAPPY_DB: float = -19.0











const MOOD_DIP_DB: float = 0.0



const BOO_EVERY: Vector2 = Vector2(9.0, 16.0)

var _crowd: AudioStreamPlayer
var _crowd_tween: Tween
var _chant: AudioStreamPlayer
var _chant_tween: Tween
var _clap: AudioStreamPlayer
var _clap_tween: Tween
var _angry: AudioStreamPlayer
var _angry_tween: Tween
var _angry_on: bool = false
var _happy: AudioStreamPlayer
var _happy_tween: Tween
var _happy_on: bool = false

var _fiesta: AudioStreamPlayer
var _fiesta_tween: Tween
var _fiesta_on: bool = false

var _gol_breve_tween: Tween
var _hushed: bool = false
var _aim_focus: bool = false

var _danger: float = 0.0






var _event_players: Dictionary = {}











const VOICES: Dictionary = {"post_hit": 3, "kick": 2, "net_swish": 2, "net_hiss": 2,
	"splash": 3, "toque": 3}


var _voice_turn: Dictionary = {}
var _mood: int = 0











var hostile: bool = false
var _is_home: bool = true


var _neutral: bool = false
var _boo_next: float = 0.0
var _boo_alt: bool = false


func _ready() -> void:








	var _fx: Dictionary = GameState.current_fixture()
	_neutral = Competitions.is_neutral(_fx)
	_is_home = bool(_fx.get("home", true)) and not _neutral




	var local: String = String(_fx.get("rival", "")) if not bool(_fx.get("home", true)) \
			else String(GameState.player_team_id)
	if not local.is_empty():
		aforo = Stadiums.capacity_of(local)
	var loop_id: String = String(_crowd_cfg()["bed"])


	var room: Vector2 = venue_acoustics if venue_acoustics.x >= 0.0 else Vector2(float(_crowd_cfg()["room"]), float(_crowd_cfg()["wet"]))
	UiAudio.set_stadium_room(room.x, room.y)
	_crowd = AudioStreamPlayer.new()
	_crowd.stream = AudioBank.stream(loop_id)




	_crowd.volume_db = -60.0



	_crowd.bus = "SFX"
	add_child(_crowd)
	_fade_in(_crowd, _base_db(), 1.8)

	_chant = AudioStreamPlayer.new()
	_chant.stream = AudioBank.stream("chant_loop")
	_chant.volume_db = -12.0
	_chant.bus = "SFX"
	add_child(_chant)




	_clap = AudioStreamPlayer.new()
	_clap.stream = AudioBank.stream("applause_loop")
	_clap.volume_db = -12.0
	_clap.bus = "SFX"
	add_child(_clap)





	_angry = AudioStreamPlayer.new()
	_angry.stream = AudioBank.stream("crowd_angry")
	_angry.volume_db = -60.0
	_angry.bus = "SFX"
	add_child(_angry)
	_happy = AudioStreamPlayer.new()
	_happy.stream = AudioBank.stream("crowd_happy")
	_happy.volume_db = -60.0
	_happy.bus = "SFX"
	add_child(_happy)






	_fiesta = AudioStreamPlayer.new()
	_fiesta.stream = AudioBank.stream("crowd_happy")
	_fiesta.volume_db = -60.0
	_fiesta.bus = "SFX"
	add_child(_fiesta)


	_dolor = AudioStreamPlayer.new()
	_dolor.bus = "Stadium"
	add_child(_dolor)
	for fam in DOLOR_TOMAS:
		var tomas: Array[AudioStream] = []
		for k in int(DOLOR_TOMAS[fam]):
			var s: AudioStream = AudioBank.stream("dolor_%s_%d" % [fam, k + 1])
			if s != null:
				tomas.append(s)
		_tomas[fam] = tomas

	for _v in BARRIDA_VOCES:
		var bv: AudioStreamPlayer = AudioStreamPlayer.new()
		bv.bus = "Stadium"
		add_child(bv)
		_barrida_voces.append(bv)
	var bt: Array[AudioStream] = []
	for k in BARRIDA_TOMAS:
		var s: AudioStream = AudioBank.stream("barrida_%d" %(k + 1))
		if s != null:
			bt.append(s)
	_tomas["barrida"] = bt


	for _v in VOZ_VOCES:
		var vv: AudioStreamPlayer = AudioStreamPlayer.new()
		vv.bus = "Stadium"
		add_child(vv)
		_voz_voces.append(vv)
	for fam in VOZ_TOMAS:
		var vt: Array[AudioStream] = []
		for k in int(VOZ_TOMAS[fam]):
			var s2: AudioStream = AudioBank.stream("voz_%s_%d" % [fam, k + 1])
			if s2 != null:
				vt.append(s2)
		_tomas["voz_%s" % fam] = vt
	var ids: Array[String] = ["crowd_roar", "goal_roar", "crowd_ooh", "kick", "whistle",
		"whistle_long", "net_swish", "net_hiss", "away_drums", "crowd_boo", "crowd_whistles",
		"post_hit", "keeper_save", "keeper_catch", "lone_shout", "lone_drum",
		"splash", "crowd_ovation", "crowd_ole"]



	ids.append("sting_%s" % String(Competitions.style_of(
		GameState.current_fixture()).get("sting", "liga")))






	var himno: String = anthem_cue(GameState.current_fixture())
	if not himno.is_empty():
		ids.append(himno)



	ids.append("toque")
	for id in ids:




		var stream: AudioStream = AudioSynth.get_stream("net_swish") if id == "net_hiss" \
				else AudioBank.stream("kick" if id == "toque" else id)
		var voices: Array[AudioStreamPlayer] = []
		for _v in int(VOICES.get(id, 1)):
			var p: AudioStreamPlayer = AudioStreamPlayer.new()
			p.stream = stream
			p.bus = "Stadium"
			add_child(p)
			voices.append(p)
		_event_players[id] = voices










var ended: bool = false





func _process(delta: float) -> void:

	_voz_reloj += delta





	_retune_humor()


	if _ooh_pendiente and Time.get_ticks_msec() - _save_ms >= OOH_TRAS_PARADA_MS:
		ooh()
	if _danger_diferido and not _retenido():
		_danger_diferido = false
		if not _hushed:
			_retune_crowd()
	if ended:
		return


	if _tramo_hora >= 0 and not _hushed:
		_tramo_pita_next -= delta
		if _tramo_pita_next <= 0.0:
			if _desenlace_en_el_aire():
				_tramo_pita_next = PROTESTA_APLAZA_S
			else:
				_tramo_pita_next = randf_range(TRAMO_PITA_CADA.x, TRAMO_PITA_CADA.y)
				if not is_playing("crowd_whistles"):
					_play("crowd_whistles", TRAMO_PITA_DB + _div_gain()
						-(0.0 if _de_casa(_tramo_hora) else TRAMO_FUERA_DB))


	if _bad_mood() or _protesta_personal():
		_boo_next -= delta
		if _boo_next <= 0.0:


			if _desenlace_en_el_aire():
				_boo_next = PROTESTA_APLAZA_S
			else:
				_boo_next = randf_range(BOO_EVERY.x, BOO_EVERY.y)
				_boo_alt = not _boo_alt
				var cue: String = "crowd_boo" if _boo_alt else "crowd_whistles"


				if not is_playing(cue):
					_play(cue, -6.0 + _div_gain())
		return










	if not bool(_crowd_cfg()["sparse"]) or _hushed:
		return
	_sparse_next -= delta
	if _sparse_next > 0.0:
		return
	_sparse_next = randf_range(SPARSE_EVERY.x, SPARSE_EVERY.y)
	if randi() % 2 == 0:
		_play("lone_shout", -15.0)
	else:
		_play("lone_drum", -16.0)







func set_mood(diff: int) -> void:
	var was_bad: bool = _bad_mood()
	var antes_db: float = _base_db()
	_mood = diff
	set_chant(_porra())
	if _bad_mood() and not was_bad:

		_boo_next = randf_range(2.0, 4.0)
	_retune_humor()







	if not _hushed and not is_equal_approx(_base_db(), antes_db):
		_retune_crowd()

























func _retune_humor() -> void:
	var vivo: bool = not ended and not _hushed
	_capa_humor(_angry, vivo and (_bad_mood() or _protesta_personal()),
		ANGRY_DB, "_angry_on", "_angry_tween")
	_capa_humor(_happy, vivo and _mood >= 2 and _is_home,
		HAPPY_DB, "_happy_on", "_happy_tween")





func _capa_humor(p: AudioStreamPlayer, on: bool, db: float,
		flag: String, tween: String) -> void:
	if p == null or not is_instance_valid(p) or on == bool(get(flag)):
		return
	set(flag, on)
	var tw: Tween = get(tween) as Tween
	if tw and tw.is_valid():
		tw.kill()
	if on:
		if not p.playing:
			p.volume_db = -60.0
			p.play()
		tw = create_tween()
		tw.tween_property(p, "volume_db", db + _div_gain(), 2.5)
	else:
		tw = create_tween()
		tw.tween_property(p, "volume_db", -60.0, 2.5)
		tw.tween_callback(p.stop)
	set(tween, tw)


func _bad_mood() -> bool:


	return _mood <= -2 and _is_home and _tramo_empuja != 1





func _protesta_personal() -> bool:
	return hostile and _is_home



func _crowd_cfg() -> Dictionary:
	return DIV_CROWD.get(clampi(div, 1, 3), DIV_CROWD[3])






func _base_db() -> float:
	var floor_db: float = float(_crowd_cfg()["db"])




	var fill: float = lerpf(-6.0, 0.0, clampf((attendance - 0.35) / 0.65, 0.0, 1.0))




	return floor_db + fill +(MOOD_DIP_DB if _bad_mood() else 0.0) \
			+ _danger * DANGER_DB














func _fade_in(p: AudioStreamPlayer, db: float, dur: float = 0.9) -> void:
	if p == null or not is_instance_valid(p):
		return
	p.volume_db = -60.0
	if not p.playing:
		p.play()
	var tw: Tween = p.create_tween()
	tw.tween_property(p, "volume_db", db, maxf(dur, 0.05))







const CROWD_UP_S: float = 0.35
const CROWD_DOWN_S: float = 1.2

func _retune_crowd() -> void:
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	var destino: float = _base_db() +(AIM_FOCUS_DB if _aim_focus else 0.0)
	var dur: float = CROWD_UP_S if destino > _crowd.volume_db else CROWD_DOWN_S
	_crowd_tween = create_tween()
	_crowd_tween.tween_property(_crowd, "volume_db", destino, dur)










func gente() -> float:
	return float(aforo) * clampf(attendance, 0.0, 1.0)

















const REF_GENTE: float = 55000.0
const GENTE_SUELO_DB: float = -13.0

func _gente_gain() -> float:
	return gente_gain(gente())






static func gente_gain(n: float) -> float:
	if n < 1.0:
		return 0.0
	return clampf(10.0 *(log(n / REF_GENTE) / log(10.0)), GENTE_SUELO_DB, 2.0)


func _div_gain() -> float:



	if aforo > 0:
		return _gente_gain()
	var by_div: float = {1: 2.0, 2: 0.0, 3: -3.5}.get(clampi(div, 1, 3), -3.5)

	var by_fill: float = lerpf(-3.0, 0.0, clampf((attendance - 0.35) / 0.65, 0.0, 1.0))
	return by_div + by_fill


func kick() -> void:
	_play("kick", -4.0)


func whistle() -> void:



	var voces: Array = _event_players.get("whistle", [])
	if not voces.is_empty():
		(voces[0] as AudioStreamPlayer).pitch_scale = 1.0
	_play("whistle", -8.0)

































const CARD_PITCH: Vector2 = Vector2(1.32, 1.12)
const CARD_DB: float = -15.0

func card_whistle(roja: bool = false) -> void:
	if ended:
		return
	var voces: Array = _event_players.get("whistle", [])
	if voces.is_empty():
		return
	var p: AudioStreamPlayer = voces[0]
	p.pitch_scale = CARD_PITCH.y if roja else CARD_PITCH.x
	p.volume_db = CARD_DB
	p.play()


func whistle_end() -> void:
	_play("whistle", -8.0)
	SceneFade.timer(0.45, false).timeout.connect(_whistle_eco)
	SceneFade.timer(0.9, false).timeout.connect(_whistle_largo)


func _whistle_eco() -> void:
	_play("whistle", -8.0)


func _whistle_largo() -> void:
	_play("whistle_long", -8.0)























func net() -> void:
	_play("net_swish", 3.0)
	_play("net_hiss", -7.0)




func post(graze: bool = false, punch: float = 1.0) -> void:






	_play("post_hit", -14.0 if graze else clampf(-2.0 +(punch - 1.0) * 10.0, -9.0, 0.0))












func vidrio(anicos: bool) -> void:
	var id: String = "glass_break" if anicos else "glass_crack"
	if not _event_players.has(id):
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.stream = AudioBank.stream(id)


		p.bus = "Stadium"
		add_child(p)
		_event_players[id] = [p]


	_play(id, -1.0 if anicos else -5.0)





func dron_golpe() -> void:
	_perezoso("dron_golpe")

	_play("dron_golpe", -2.0)







func ocarina() -> void:
	_perezoso("ocarina")
	_play("ocarina", -4.0)


func dron_choque() -> void:
	_perezoso("dron_choque")

	_play("dron_choque", -5.0)




func playa_golpe() -> void:
	_perezoso("playa_golpe")


	_play("playa_golpe", -4.0)





func playa_bote(fuerza: float) -> void:
	_perezoso("playa_bote")
	_play("playa_bote", lerpf(-26.0, -9.0, clampf(fuerza / 7.0, 0.0, 1.0)))




func _perezoso(id: String) -> void:
	if _event_players.has(id):
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = AudioBank.stream(id)
	p.bus = "Stadium"
	add_child(p)
	_event_players[id] = [p]










func splash(power: float) -> void:
	_play("splash", lerpf(-20.0, -6.0, clampf((power - 2.0) / 26.0, 0.0, 1.0)))








const THUNDER_DB: Vector2 = Vector2(-24.0, -6.0)


const THUNDER_NEAR: float = 0.55










func arm_thunder() -> void:
	if _event_players.has("thunder_near"):
		return
	for id in ["thunder_near", "thunder_far"]:
		var voices: Array[AudioStreamPlayer] = []
		var p: AudioStreamPlayer = AudioStreamPlayer.new()
		p.stream = AudioBank.stream(id)
		p.bus = "Stadium"
		add_child(p)
		voices.append(p)
		_event_players[id] = voices



func arm_cannons() -> void:
	if _event_players.has("cannon_pop"):
		return
	var p: AudioStreamPlayer = AudioStreamPlayer.new()
	p.stream = AudioBank.stream("cannon_pop")
	p.bus = "Stadium"

	p.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(p)
	var voices: Array[AudioStreamPlayer] = [p]
	_event_players["cannon_pop"] = voices



const CANNON_DB: Vector2 = Vector2(-22.0, -9.0)


func cannon(fuerza: float) -> void:
	_play("cannon_pop", lerpf(CANNON_DB.x, CANNON_DB.y, clampf(fuerza, 0.0, 1.0)))








const OLA_DB: float = -10.0
const OLA_SUELTA_S: float = 0.8

var _ola: AudioStreamPlayer
var _ola_tween: Tween




func arm_ola() -> void:
	if _ola != null:
		return
	_ola = AudioStreamPlayer.new()
	_ola.stream = AudioBank.stream("ola_rugido")
	_ola.volume_db = -60.0
	_ola.bus = "SFX"
	add_child(_ola)


func ola(nivel: float) -> void:
	if _ola == null or not is_instance_valid(_ola) or _ola.stream == null:
		return


	if nivel <= 0.01 or ended or _hushed:
		if _ola.playing and not (_ola_tween and _ola_tween.is_valid()):
			_ola_tween = create_tween()
			_ola_tween.tween_property(_ola, "volume_db", -60.0, OLA_SUELTA_S)
			_ola_tween.tween_callback(_ola.stop)
		return
	if _ola_tween and _ola_tween.is_valid():
		_ola_tween.kill()
	if not _ola.playing:


		_ola.pitch_scale = randf_range(0.97, 1.03)
		_ola.play(randf() * maxf(_ola.stream.get_length() - 0.1, 0.0))
	_ola.volume_db = OLA_DB + linear_to_db(clampf(nivel, 0.001, 1.5)) + _div_gain() \
			+(AIM_FOCUS_DB if _aim_focus else 0.0)










func thunder(fuerza: float) -> void:
	var f: float = clampf(fuerza, 0.0, 1.0)
	_play("thunder_near" if f >= THUNDER_NEAR else "thunder_far",
		lerpf(THUNDER_DB.x, THUNDER_DB.y, f * f))
















const TOQUE_DB: Vector2 = Vector2(-24.0, -17.0)
const TOQUE_PITCH: Vector2 = Vector2(1.85, 1.45)

func toque(fuerza: float = 0.5) -> void:
	var f: float = clampf(fuerza, 0.0, 1.0)
	var voces: Array = _event_players.get("toque", [])
	if voces.is_empty():
		return
	var p: AudioStreamPlayer = null
	for v in voces:
		if not (v as AudioStreamPlayer).playing:
			p = v
			break
	if p == null:
		var turn: int = int(_voice_turn.get("toque", 0))
		p = voces[turn]
		_voice_turn["toque"] =(turn + 1) % voces.size()
	p.pitch_scale = lerpf(TOQUE_PITCH.x, TOQUE_PITCH.y, f)
	p.volume_db = lerpf(TOQUE_DB.x, TOQUE_DB.y, f)
	p.play()




















const SAVE_DB: float = 0.0
const SAVE_CATCH_DB: float = 2.0
const SAVE_DUCK_DB: float = -6.0
const SAVE_DUCK_S: float = 0.35
const OOH_TRAS_PARADA_MS: int = 300
var _save_ms: int = -100000
var _ooh_pendiente: bool = false
var _danger_diferido: bool = false
var _retener_hasta_ms: int = -100000

func save(caught: bool = false) -> void:
	_play("keeper_catch" if caught else "keeper_save",
		SAVE_CATCH_DB if caught else SAVE_DB)
	_save_ms = Time.get_ticks_msec()
	_retener_hasta_ms = maxi(_retener_hasta_ms, _save_ms + int(SAVE_DUCK_S * 1000.0))
	if _crowd == null or _hushed:
		return
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	var destino: float = _base_db() +(AIM_FOCUS_DB if _aim_focus else 0.0)
	_crowd.volume_db = destino + SAVE_DUCK_DB
	_crowd_tween = create_tween()
	_crowd_tween.set_ignore_time_scale(true)
	_crowd_tween.tween_interval(SAVE_DUCK_S * 0.35)
	_crowd_tween.tween_property(_crowd, "volume_db", destino, SAVE_DUCK_S * 0.65)









func _retenido() -> bool:
	return Time.get_ticks_msec() < _retener_hasta_ms



const PROTESTA_APLAZA_S: float = 2.5









func _desenlace_en_el_aire() -> bool:
	return _hushed or _retenido() or _fiesta_on \
			or is_playing("goal_roar") or is_playing("crowd_roar")










func _soltar_peligro() -> float:
	var db: float = _danger * DANGER_DB
	_danger = 0.0
	_danger_diferido = false
	return db











func roar(db_offset: float = 0.0, excite: float = 1.0) -> void:
	_play("crowd_roar", -2.0 + db_offset + _div_gain())
	_excite((6.0 + clampf(_div_gain(), -3.0, 2.0)) * excite, lerpf(1.0, 2.2, excite))
























func gol(db_offset: float = 0.0) -> void:


	if _gol_breve_tween and _gol_breve_tween.is_valid():
		_gol_breve_tween.kill()
	_play("goal_roar", db_offset + _div_gain())



	_excite((6.0 + clampf(_div_gain(), -3.0, 2.0)) * 1.3 + _soltar_peligro(),
		lerpf(1.0, 2.2, 1.3))



























const FIESTA_DB: float = -3.0
const FIESTA_ENTRA_S: float = 2.0
const FIESTA_SUBE_S: float = 3.0
const FIESTA_SUELTA_S: float = 1.4

func fiesta_hold(on: bool, db_offset: float = 0.0) -> void:
	if _fiesta == null or not is_instance_valid(_fiesta) or on == _fiesta_on:
		return
	if on and ended:
		return
	_fiesta_on = on
	if _fiesta_tween and _fiesta_tween.is_valid():
		_fiesta_tween.kill()
	_fiesta_tween = create_tween()
	if on:


		if not _fiesta.playing:
			_fiesta.volume_db = -60.0
			_fiesta.play()
		_fiesta_tween.tween_interval(FIESTA_ENTRA_S)
		_fiesta_tween.tween_property(_fiesta, "volume_db",
			FIESTA_DB + db_offset + _div_gain(), FIESTA_SUBE_S)
	else:
		_fiesta_tween.tween_property(_fiesta, "volume_db", -60.0, FIESTA_SUELTA_S)
		_fiesta_tween.tween_callback(_fiesta.stop)














func sigue_bajo_pausa(on: bool) -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS if on else Node.PROCESS_MODE_INHERIT













const GOL_BREVE_S: float = 2.4
const GOL_BREVE_FADE: float = 1.2

func gol_breve(db_offset: float = 0.0) -> void:
	_play("goal_roar", db_offset + _div_gain())
	var voces: Array = _event_players.get("goal_roar", [])
	if voces.is_empty():
		return
	var p: AudioStreamPlayer = voces[0]
	if _gol_breve_tween and _gol_breve_tween.is_valid():
		_gol_breve_tween.kill()
	_gol_breve_tween = create_tween()
	_gol_breve_tween.tween_interval(GOL_BREVE_S)
	_gol_breve_tween.tween_property(p, "volume_db", -60.0, GOL_BREVE_FADE)
	_gol_breve_tween.tween_callback(p.stop)



















const OVACION_RELEVO_S: float = 8.5
const OVACION_MESETA_S: float = 1.5

func ovation(db_offset: float = 0.0) -> void:
	var db: float = -4.0 + db_offset + _div_gain()
	var voces: Array = _event_players.get("crowd_ovation", [])
	if not voces.is_empty():
		var p: AudioStreamPlayer = voces[0]
		if p.playing and p.get_playback_position() < OVACION_RELEVO_S:
			if db > p.volume_db:
				p.create_tween().tween_property(p, "volume_db", db, 0.4)
		else:
			p.volume_db = db
			p.play(OVACION_MESETA_S if p.playing else 0.0)
	_excite(6.0 + clampf(_div_gain(), -3.0, 2.0), 6.0)



















const SHOT_DB: Vector2 = Vector2(1.6, 4.5)
const SHOT_DUR: float = 1.1

func shot(potencia: float = 1.0) -> void:
	if ended:
		return
	var p: float = clampf(potencia, 0.0, 1.0)
	_excite(lerpf(SHOT_DB.x, SHOT_DB.y, p) + clampf(_div_gain(), -3.0, 1.5),
		SHOT_DUR)




















const AWAY_GOAL_DB: float = -34.0
const AWAY_DRUMS_DB: float = -3.0
const AWAY_GOAL_HOLD: float = 4.2
func away_goal() -> void:
	_hushed = false


	_soltar_peligro()











	_play("away_drums", AWAY_DRUMS_DB + _drums_viaje_db())
	_play("crowd_roar", -16.0)
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd_tween = create_tween()



	_crowd_tween.tween_property(_crowd, "volume_db", AWAY_GOAL_DB, 0.35)
	_crowd_tween.tween_interval(AWAY_GOAL_HOLD)
	_crowd_tween.tween_property(_crowd, "volume_db", _base_db(), 2.6)












	SceneFade.timer(0.35 + AWAY_GOAL_HOLD, false).timeout.connect(_away_boo)







const DRUMS_VIAJE_RALO_DB: float = -6.0
func _drums_viaje_db() -> float:
	return lerpf(DRUMS_VIAJE_RALO_DB, 0.0, clampf((away_fill - 0.32) / 0.64, 0.0, 1.0))













const RIVAL_GOAL_DIP_DB: float = 12.0
const RIVAL_GOAL_HOLD: float = 2.5
func rival_goal(en_casa: bool) -> void:
	if not en_casa:
		gol(-2.0)
		return
	_hushed = false

	_soltar_peligro()
	drums()
	_play("crowd_roar", -16.0)
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd_tween = create_tween()
	_crowd_tween.tween_property(_crowd, "volume_db", _base_db() - RIVAL_GOAL_DIP_DB, 0.35)
	_crowd_tween.tween_interval(RIVAL_GOAL_HOLD)
	_crowd_tween.tween_property(_crowd, "volume_db", _base_db(), 2.6)








func _away_boo() -> void:
	if ended:
		return
	if _crowd.volume_db < _base_db() - 10.0 \
			and _crowd_tween != null and _crowd_tween.is_valid() and _crowd_tween.is_running():
		_boo_alt = not _boo_alt
		_play("crowd_boo" if _boo_alt else "crowd_whistles", -6.0 + _div_gain())
		return
	boo(2.4)






func goal_sting(fixture: Dictionary) -> void:
	var id: String = "sting_%s" % String(Competitions.style_of(fixture).get("sting", "liga"))
	if _event_players.has(id):
		_play(id, -9.0 + _div_gain() * 0.5)




static func anthem_cue(fixture: Dictionary) -> String:
	var is_nat: bool = String(fixture.get("comp", "")) == "nat"
	var id: String = Competitions.id_of(fixture)
	if not Ceremonies.protocol_previa(is_nat, "" if is_nat else id,
			id if is_nat else ""):
		return ""


	return "anthem_%s" %("mundial" if is_nat else id)





func anthem(fixture: Dictionary) -> void:
	var id: String = anthem_cue(fixture)
	if not id.is_empty() and _event_players.has(id):
		_play(id, -4.0)

















const HECKLE_DB: float = -20.0
func heckle() -> void:
	_play("crowd_boo", HECKLE_DB + _div_gain())
















func boo(dur: float = 2.4) -> void:
	_boo_alt = not _boo_alt
	_play("crowd_boo" if _boo_alt else "crowd_whistles", -6.0 + _div_gain())
	_excite(3.5 + clampf(_div_gain(), -2.0, 1.5), dur)

















func greet(calor: float, dur: float = 2.6) -> void:





	if not is_inside_tree():
		return
	if calor <= Stadium.GREET_COLD:
		boo(dur)
		return
	if calor < Stadium.GREET_WARM:




		_excite(2.5 + clampf(_div_gain(), -1.5, 1.0), dur * 0.7)
		set_applause(true, -19.0 + _div_gain())
		SceneFade.timer(maxf(dur * 0.7, 1.2), false) \
				.timeout.connect(_greet_clap_off)
		return





	roar(-9.0, 0.5)
	set_applause(true, -9.0 + _div_gain())
	SceneFade.timer(maxf(dur, Stadium.CHANT_SPONT), false) \
			.timeout.connect(_greet_clap_off)
	set_chant(true)






	SceneFade.timer(maxf(dur, Stadium.CHANT_SPONT), false) \
			.timeout.connect(_greet_chant_off)


func _greet_chant_off() -> void:
	set_chant(_porra())






func cantico(dur: float, viaja: bool = false) -> void:
	set_chant(true, CHANT_DB -(TRAMO_FUERA_DB if viaja else 0.0))
	SceneFade.timer(dur, false).timeout.connect(_greet_chant_off)






func _greet_clap_off() -> void:
	set_applause(false)

















const OOH_DUR: float = 1.6

func ooh() -> void:

	if Time.get_ticks_msec() - _save_ms < OOH_TRAS_PARADA_MS:
		_ooh_pendiente = true
		return
	_ooh_pendiente = false
	_play("crowd_ooh", -4.0 + _div_gain())
	_excite(4.5 + clampf(_div_gain(), -2.0, 1.5), OOH_DUR)

	_retener_hasta_ms = maxi(_retener_hasta_ms,
		Time.get_ticks_msec() + int(OOH_DUR * 0.4 * 1000.0))










const OLE_DUR: float = 4.5

func ole() -> void:
	_play("crowd_ole", 0.0 + _div_gain())
	_play("crowd_ovation", -5.0 + _div_gain())
	_excite(6.5 + clampf(_div_gain(), -2.0, 1.5), OLE_DUR)
	_retener_hasta_ms = maxi(_retener_hasta_ms,
		Time.get_ticks_msec() + int(OLE_DUR * 0.4 * 1000.0))





const CANO_BRONCA_DUR: float = 3.2

func cano_bronca() -> void:
	_play("crowd_boo", -2.0 + _div_gain())
	_play("crowd_whistles", -5.0 + _div_gain())
	_excite(5.0 + clampf(_div_gain(), -2.0, 1.5), CANO_BRONCA_DUR)



func hush() -> void:
	_hushed = true
	_retune_humor()
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd_tween = create_tween()
	_crowd_tween.tween_property(_crowd, "volume_db", HUSH_DB, 0.7)












const AIM_FOCUS_DB: float = -9.0


func aim_focus(on: bool) -> void:
	if _aim_focus == on:
		return
	_aim_focus = on
	if _hushed:
		return
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd_tween = create_tween()



	_crowd_tween.tween_property(_crowd, "volume_db",
		_base_db() +(AIM_FOCUS_DB if on else 0.0), 0.22 if on else 0.4)




























const DANGER_DB: float = 9.0
const DANGER_STEPS: float = 8.0
const DANGER_TENSE_K: float = 0.55


func danger(level: float) -> void:
	var v: float = clampf(level, -1.0, 1.0)





	var contra: bool =(v < 0.0) if _is_home else (v > 0.0)
	var mag: float = absf(v) *(DANGER_TENSE_K if contra and not _neutral else 1.0)
	var step: float = roundf(mag * DANGER_STEPS) / DANGER_STEPS
	if is_equal_approx(step, _danger):
		return
	_danger = step
	if _retenido():
		_danger_diferido = true
		return




	if _hushed:
		return
	_retune_crowd()



func unhush() -> void:
	if not _hushed:
		return
	_hushed = false
	_retune_humor()
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd_tween = create_tween()


	_crowd_tween.tween_property(_crowd, "volume_db",
		_base_db() +(AIM_FOCUS_DB if _aim_focus else 0.0), 0.5)




func set_chant(on: bool, db: float = CHANT_DB) -> void:
	if _chant_tween and _chant_tween.is_valid():
		_chant_tween.kill()
	if on and not _chant.playing:



		_fade_in(_chant, db + _div_gain(), 1.2)
	elif not on and _chant.playing:
		_chant_tween = create_tween()
		_chant_tween.tween_property(_chant, "volume_db", -40.0, 0.8)
		_chant_tween.tween_callback(_chant.stop)









func set_applause(on: bool, db: float = -11.0) -> void:
	if _clap == null or not is_instance_valid(_clap):
		return
	if _clap_tween and _clap_tween.is_valid():
		_clap_tween.kill()
	if on:
		if _clap.playing:
			_clap.volume_db = db
		else:


			_fade_in(_clap, db, 0.5)
	elif _clap.playing:
		_clap_tween = create_tween()
		_clap_tween.tween_property(_clap, "volume_db", -40.0, 0.8)
		_clap_tween.tween_callback(_clap.stop)

















const CHANT_DB: float = -12.0
const TRAMO_PITA_CADA: Vector2 = Vector2(3.0, 6.0)
const TRAMO_PITA_DB: float = -9.0
const TRAMO_FUERA_DB: float = 6.0

var _tramo_hora: int = -1
var _tramo_empuja: int = -1
var _tramo_pita_next: float = 0.0



func tramo_final(tuya: String, rival: String) -> void:
	var hora: int = 1 if tuya == "hora" else (0 if rival == "hora" else -1)
	var empuja: int = 1 if tuya == "empuja" else (0 if rival == "empuja" else -1)
	if hora >= 0 and _tramo_hora < 0:
		_tramo_pita_next = randf_range(0.4, 1.2)
	_tramo_hora = hora
	if empuja == _tramo_empuja:
		return
	_tramo_empuja = empuja


	set_chant(_porra(), CHANT_DB -(TRAMO_FUERA_DB if empuja >= 0 and not _de_casa(empuja)
		else 0.0))
	if not _hushed:
		_retune_crowd()




func _porra() -> bool:
	return (_mood >= 2 and _is_home) or _tramo_empuja >= 0



func _de_casa(bando: int) -> bool:
	return (bando == 1) == _is_home




func drums() -> void:
	_play("away_drums", -4.0 + _div_gain())
























const DOLOR_TOMAS: Dictionary = {"queja": 6, "grito": 7}
const DOLOR_QUEJA_DB: float = -4.0
const DOLOR_GRITO_DB: float = -1.0
const DOLOR_PITCH: Vector2 = Vector2(0.95, 1.05)
var _dolor: AudioStreamPlayer


var _tomas: Dictionary = {}
var _bolsa: Dictionary = {}
var _ultima_i: Dictionary = {}
var dolor_ultima_toma: String = ""

func dolor(fuerte: bool = false) -> void:
	var fam: String = "grito" if fuerte else "queja"
	var tomas: Array = _tomas.get(fam, [])
	if _dolor == null or tomas.is_empty():
		return
	var i: int = _toma_siguiente(fam, tomas.size())
	_dolor.stream = tomas[i]
	_dolor.pitch_scale = randf_range(DOLOR_PITCH.x, DOLOR_PITCH.y)
	_dolor.volume_db = DOLOR_GRITO_DB if fuerte else DOLOR_QUEJA_DB
	_dolor.play()
	dolor_ultima_toma = "%s_%d" % [fam, i + 1]





func _toma_siguiente(fam: String, n: int) -> int:
	var bolsa: Array = _bolsa.get(fam, [])
	if bolsa.is_empty():
		for k in n:
			bolsa.append(k)
		bolsa.shuffle()
		if n > 1 and int(bolsa[n - 1]) == int(_ultima_i.get(fam, -1)):
			bolsa[n - 1] = bolsa[0]
			bolsa[0] = int(_ultima_i[fam])
	var i: int = int(bolsa.pop_back())
	_bolsa[fam] = bolsa
	_ultima_i[fam] = i
	return i




















const BARRIDA_TOMAS: int = 5
const BARRIDA_DB: float = -6.0
const BARRIDA_PITCH: Vector2 = Vector2(0.94, 1.06)
const BARRIDA_VOCES: int = 2
var _barrida_voces: Array[AudioStreamPlayer] = []
var _barrida_turno: int = 0
var barrida_ultima_toma: int = 0

func barrida() -> void:
	var tomas: Array = _tomas.get("barrida", [])
	if _barrida_voces.is_empty() or tomas.is_empty():
		return
	var p: AudioStreamPlayer = null
	for v in _barrida_voces:
		if not v.playing:
			p = v
			break
	if p == null:
		p = _barrida_voces[_barrida_turno % _barrida_voces.size()]
		_barrida_turno += 1
	var i: int = _toma_siguiente("barrida", tomas.size())
	p.stream = tomas[i]
	p.pitch_scale = randf_range(BARRIDA_PITCH.x, BARRIDA_PITCH.y)
	p.volume_db = BARRIDA_DB
	p.play()
	barrida_ultima_toma = i + 1
































const VOZ_TOMAS: Dictionary = {"pide": 4, "cele": 4, "protesta": 3, "animo": 3}






const VOZ_DB: Dictionary = {"pide": -16.0, "cele": -12.0, "protesta": -13.0, "animo": -15.0}



const VOZ_MIN_S: Dictionary = {"pide": 7.0, "cele": 2.5, "protesta": 3.0, "animo": 4.0}
const VOZ_PITCH: Vector2 = Vector2(0.94, 1.06)
const VOZ_VOCES: int = 2
var _voz_voces: Array[AudioStreamPlayer] = []
var _voz_turno: int = 0
var _voz_ultima_t: Dictionary = {}
var _voz_reloj: float = 0.0
var voz_ultima_toma: String = ""

func voz(fam: String) -> void:
	var tomas: Array = _tomas.get("voz_%s" % fam, [])
	if _voz_voces.is_empty() or tomas.is_empty():
		return






	var ahora: float = _voz_reloj
	if ahora - float(_voz_ultima_t.get(fam, -999.0)) < float(VOZ_MIN_S.get(fam, 5.0)):
		return
	_voz_ultima_t[fam] = ahora
	var p: AudioStreamPlayer = null
	for v in _voz_voces:
		if not v.playing:
			p = v
			break
	if p == null:
		p = _voz_voces[_voz_turno % _voz_voces.size()]
		_voz_turno += 1
	var i: int = _toma_siguiente("voz_%s" % fam, tomas.size())
	p.stream = tomas[i]
	p.pitch_scale = randf_range(VOZ_PITCH.x, VOZ_PITCH.y)
	p.volume_db = float(VOZ_DB.get(fam, -10.0))
	p.play()
	voz_ultima_toma = "%s_%d" % [fam, i + 1]





func voz_tras(fam: String, espera: float) -> void:
	var t: Tween = create_tween()
	t.tween_interval(espera)
	t.tween_callback(voz.bind(fam))




func _play(id: String, db: float) -> void:
	var voices: Array = _event_players.get(id, [])
	if voices.is_empty():
		return
	var p: AudioStreamPlayer = voices[0]
	if voices.size() > 1:
		p = null
		for v in voices:
			if not (v as AudioStreamPlayer).playing:
				p = v
				break
		if p == null:
			var turn: int = int(_voice_turn.get(id, 0))
			p = voices[turn]
			_voice_turn[id] =(turn + 1) % voices.size()
	p.volume_db = db
	p.play()




func is_playing(id: String) -> bool:
	for v in _event_players.get(id, []):
		if (v as AudioStreamPlayer).playing:
			return true
	return false


func _excite(db_up: float, dur: float) -> void:
	_hushed = false
	if _crowd_tween and _crowd_tween.is_valid():
		_crowd_tween.kill()
	_crowd.volume_db = _base_db() + db_up
	_crowd_tween = create_tween()
	_crowd_tween.tween_interval(dur * 0.4)
	_crowd_tween.tween_property(_crowd, "volume_db", _base_db(), dur * 0.6)
