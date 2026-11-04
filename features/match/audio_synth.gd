class_name AudioSynth
extends RefCounted





const RATE: int = 22050

static var _cache: Dictionary = {}


static func get_stream(id: String) -> AudioStreamWAV:
	if not _cache.has(id):
		_cache[id] = _generate(id)
	return _cache[id]


static func _generate(id: String) -> AudioStreamWAV:
	match id:
		"crowd_loop":
			return _crowd_loop()
		"crowd_loop_small":

			return _crowd_loop(0.62, 0.55)
		"crowd_loop_big":

			return _crowd_loop(1.25, 1.35)



		"crowd_loop_d1":
			return _crowd_loop(1.3, 1.3)
		"crowd_loop_d2":
			return _crowd_loop(0.85, 0.9)
		"crowd_loop_d3":
			return _crowd_loop(0.4, 0.45)

		"locker_murmur":
			return _locker_murmur()
		"locker_far_crowd":
			return _locker_far_crowd()
		"studs_tick":
			return _studs_tick()
		"locker_shower":
			return _locker_shower()
		"shower_off":
			return _shower_off()




		"door_clack":
			return _door_clack()


		"bottles_kick":
			return _bottles_kick()


		"rain_roof":
			return _rain_roof()
		"ceiling_stomp":
			return _ceiling_stomp()
		"door_slam":
			return _door_slam()
		"power_cut":
			return _power_cut()
		"power_back":
			return _power_back()
		"coach_talk_a":
			return _coach_syllable(0)
		"coach_talk_b":
			return _coach_syllable(1)
		"coach_talk_c":
			return _coach_syllable(2)
		"lone_shout":
			return _lone_shout()
		"lone_drum":
			return _lone_drum()
		"crowd_boo":
			return _crowd_boo()
		"crowd_whistles":
			return _crowd_whistles()
		"crowd_roar":
			return _crowd_roar()
		"crowd_ooh":
			return _crowd_ooh()
		"kick":
			return _kick()
		"whistle":
			return _whistle(0.35)
		"whistle_long":
			return _whistle(0.85)
		"net_swish":
			return _net_swish()
		"post_hit":
			return _post_hit()
		"glass_crack":
			return _glass_crack()
		"glass_break":
			return _glass_break()
		"keeper_save":
			return _keeper_save()
		"keeper_catch":
			return _keeper_catch()
		"splash":
			return _splash()




		"thunder_near":
			return _thunder(true)
		"thunder_far":
			return _thunder(false)
		"cannon_pop":
			return _cannon_pop()
		"chant_loop":
			return _chant_loop()
		"away_drums":
			return _away_drums()



		"claxon":
			return _claxon()
		"engine_loop":
			return _engine_loop()
		"parade_drum":
			return _parade_drum()



		"ventanilla":
			return _ventanilla()
		"rotulador_loop":
			return _rotulador_loop()

		"ui_click":
			return _ui_click()
		"ui_back":
			return _ui_back()
		"ui_confirm":
			return _ui_confirm()
		"ui_deny":
			return _ui_deny()
		"ui_toggle":
			return _ui_toggle()
		"ui_coin":
			return _ui_coin()
		"ui_whoosh":
			return _ui_whoosh()
		"ui_pop":
			return _ui_pop()
		"fanfare":
			return _fanfare()
		"stinger_bad":
			return _stinger_bad()

		"sting_liga":
			return _sting_liga()
		"sting_copa":
			return _sting_copa()
		"sting_champions":
			return _sting_champions()
		"sting_europa":
			return _sting_europa()
		"sting_mundial":
			return _sting_mundial()

		"anthem_champions":
			return _anthem_champions()
		"anthem_europa":
			return _anthem_europa()
		"anthem_conference":
			return _anthem_conference()
		"anthem_mundial":
			return _anthem_mundial()

		"intro_grillos":
			return _intro_grillos()
		"intro_pajaros":
			return _intro_pajaros()
		"intro_bote":
			return _intro_bote()
		"intro_fugaz":
			return _intro_fugaz()


		"dron_zumbido":
			return _dron_zumbido()
		"dron_golpe":
			return _dron_golpe()
		"dron_choque":
			return _dron_choque()


		"playa_golpe":
			return _playa_golpe()
		"playa_bote":
			return _playa_bote()


		"botella_cae":
			return _botella_cae()


		"trueno_bombo":
			return _trueno_bombo()
		"trueno_huh":
			return _trueno_huh()
		"trueno_suelto":
			return _trueno_suelto()


		"himno_nacional":
			return _himno_nacional()
		"himno_risa":
			return _himno_risa()
		"himno_equivocado":
			return _himno_equivocado()


		"obturador":
			return _obturador()



		"reflex_enfoque":
			return _reflex_enfoque()
		"reflex_disparo":
			return _reflex_disparo()
		"flash_carga":
			return _flash_carga()
		"fotografo_a", "fotografo_e", "fotografo_i", "fotografo_o", "fotografo_u":
			return _fotografo_silaba("aeiou".find(id.right(1)), false)
		"fotografo_cuenta":
			return _fotografo_silaba(3, true)


		"flashback_pitido":
			return _flashback_pitido()
	return null







static func hornea(id: String) -> AudioStreamWAV:
	return _generate(id)





static func adopta(id: String, stream: AudioStreamWAV) -> void:
	if stream != null and not _cache.has(id):
		_cache[id] = stream


static func _make_stream(samples: PackedFloat32Array, looped: bool) -> AudioStreamWAV:
	var bucle: bool = looped and not samples.is_empty()
	var data: PackedByteArray = PackedByteArray()
	data.resize((samples.size() +(1 if bucle else 0)) * 2)
	for i in samples.size():
		data.encode_s16(i * 2, int(clampf(samples[i], -1.0, 1.0) * 32767.0))







	if bucle:
		data.encode_s16(samples.size() * 2, data.decode_s16(0))
	var stream: AudioStreamWAV = AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = RATE
	stream.stereo = false
	stream.data = data
	if bucle:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
		stream.loop_begin = 0
		stream.loop_end = samples.size()
	return stream







static func _make_stream_st(left: PackedFloat32Array, right: PackedFloat32Array,
		looped: bool) -> AudioStreamWAV:
	var n: int = mini(left.size(), right.size())
	var bucle: bool = looped and n > 0
	var data: PackedByteArray = PackedByteArray()
	data.resize((n +(1 if bucle else 0)) * 4)
	for i in n:
		data.encode_s16(i * 4, int(clampf(left[i], -1.0, 1.0) * 32767.0))
		data.encode_s16(i * 4 + 2, int(clampf(right[i], -1.0, 1.0) * 32767.0))


	if bucle:
		data.encode_s16(n * 4, data.decode_s16(0))
		data.encode_s16(n * 4 + 2, data.decode_s16(2))
	var stream: AudioStreamWAV = AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = RATE
	stream.stereo = true
	stream.data = data
	if bucle:
		stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
		stream.loop_begin = 0
		stream.loop_end = n
	return stream



























const CROWD_TRIM: float = 0.735

static func _crowd_loop(mass: float = 1.0, breath: float = 1.0) -> AudioStreamWAV:
	var n: int = RATE * 8
	var left: PackedFloat32Array = PackedFloat32Array()
	var right: PackedFloat32Array = PackedFloat32Array()
	left.resize(n)
	right.resize(n)
	var rl: RandomNumberGenerator = RandomNumberGenerator.new()
	rl.seed = 7
	var rr: RandomNumberGenerator = RandomNumberGenerator.new()
	rr.seed = 7717
	var rm: RandomNumberGenerator = RandomNumberGenerator.new()
	rm.seed = 104729
	var l1: float = 0.0
	var l2: float = 0.0
	var l3: float = 0.0
	var l4: float = 0.0
	var r1: float = 0.0
	var r2: float = 0.0
	var r3: float = 0.0
	var r4: float = 0.0
	var sub: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var swell: float = 1.0 +(0.3 * sin(TAU * t * 0.125)
			+ 0.18 * sin(TAU * t * 0.375 + 1.7)) * breath
		var swell_r: float = 1.0 +(0.3 * sin(TAU * t * 0.125 + 0.55)
			+ 0.18 * sin(TAU * t * 0.375 + 2.4)) * breath

		var ws: float = rm.randf_range(-1.0, 1.0)
		sub += 0.012 *(ws - sub)
		var rumble: float = sub * 2.4 * mass

		var wl: float = rl.randf_range(-1.0, 1.0)
		l1 += 0.1 *(wl - l1)
		l2 += 0.035 *(wl - l2)
		l3 += 0.3 *(wl - l3)
		l4 += 0.08 *(wl - l4)
		left[i] =(((l1 * 0.5 + l2 * 1.1) +(l3 - l4) * 0.35) * swell * 0.55 * mass
			+ rumble * 0.5) * CROWD_TRIM

		var wr: float = rr.randf_range(-1.0, 1.0)
		r1 += 0.1 *(wr - r1)
		r2 += 0.035 *(wr - r2)
		r3 += 0.3 *(wr - r3)
		r4 += 0.08 *(wr - r4)
		right[i] =(((r1 * 0.5 + r2 * 1.1) +(r3 - r4) * 0.35) * swell_r * 0.55 * mass
			+ rumble * 0.5) * CROWD_TRIM
	return _make_stream_st(left, right, true)




















static func _locker_murmur() -> AudioStreamWAV:
	var n: int = RATE * 6
	var left: PackedFloat32Array = PackedFloat32Array()
	var right: PackedFloat32Array = PackedFloat32Array()
	left.resize(n)
	right.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 20260822
	var rb: RandomNumberGenerator = RandomNumberGenerator.new()
	rb.seed = 991



	var lo: float = 0.0
	var hi: float = 0.0
	var lo_r: float = 0.0
	var hi_r: float = 0.0



	var bump: float = 0.0
	var bump_next: float = 0.35
	var bump_amp: float = 0.0
	var bump_t: float = 0.0
	var bump_dur: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		if t >= bump_next:
			bump_dur = rb.randf_range(0.28, 0.62)
			bump_amp = rb.randf_range(0.35, 0.95)
			bump_t = t
			bump_next = t + rb.randf_range(0.3, 0.85)
		var k: float = clampf((t - bump_t) / maxf(bump_dur, 0.001), 0.0, 1.0)


		bump = bump_amp * sin(PI * k) if k < 1.0 else 0.0
		var env: float = 0.55 + 0.45 * bump
		var w: float = rn.randf_range(-1.0, 1.0)
		lo += 0.22 *(w - lo)
		hi += 0.03 *(w - hi)
		var voz: float =(lo - hi) * env


		lo_r += 0.19 *(w - lo_r)
		hi_r += 0.034 *(w - hi_r)
		var voz_r: float =(lo_r - hi_r) * env

		var sala: float = sin(TAU * t * 100.0) * 0.006
		left[i] = voz * 0.62 + sala
		right[i] = voz_r * 0.62 + sala
	return _make_stream_st(left, right, true)


















static func _locker_shower() -> AudioStreamWAV:
	var n: int = RATE * 6
	var left: PackedFloat32Array = PackedFloat32Array()
	var right: PackedFloat32Array = PackedFloat32Array()
	left.resize(n)
	right.resize(n)
	var rl: RandomNumberGenerator = RandomNumberGenerator.new()
	rl.seed = 8181
	var rr: RandomNumberGenerator = RandomNumberGenerator.new()
	rr.seed = 424242
	var rw: RandomNumberGenerator = RandomNumberGenerator.new()
	rw.seed = 31337


	var c: float = 2.0 * sin(PI * 1400.0 / float(RATE))
	var q: float = 0.62
	var lo_l: float = 0.0
	var lo_r: float = 0.0
	var ml: float = 0.0
	var bl: float = 0.0
	var mr: float = 0.0
	var br: float = 0.0
	var wob: float = 0.0
	for i in n:
		var wl: float = rl.randf_range(-1.0, 1.0)
		var wr: float = rr.randf_range(-1.0, 1.0)


		wob += 0.00022 *(rw.randf_range(-1.0, 1.0) - wob)
		var env: float = 1.0 + clampf(wob * 3.2, -0.45, 0.45)
		lo_l += 0.55 *(wl - lo_l)
		lo_r += 0.55 *(wr - lo_r)
		var h_l: float = wl - ml - q * bl
		bl += c * h_l
		ml += c * bl
		var h_r: float = wr - mr - q * br
		br += c * h_r
		mr += c * br
		left[i] =((wl - lo_l) * 0.5 + bl * 0.3) * env * 0.32
		right[i] =((wr - lo_r) * 0.5 + br * 0.3) * env * 0.32
	return _make_stream_st(left, right, true)

















const SHOWER_OFF_TAIL: float = 0.45


static func _shower_off() -> AudioStreamWAV:
	var n: int = int(RATE * 1.6)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 606
	var lo: float = 0.0
	var m: float = 0.0
	var b: float = 0.0

	var gotas: Array = [[0.72, 1900.0, 0.55], [1.02, 1650.0, 0.38],
		[1.41, 2150.0, 0.24]]
	for i in n:
		var t: float = float(i) / float(RATE)
		var v: float = 0.0

		if t < 0.3:
			var k: float = t / 0.3


			var f: float = lerpf(920.0, 480.0, k) *(1.0 + 0.06 * sin(TAU * t * 34.0))
			var c: float = 2.0 * sin(PI * f / float(RATE))
			var w: float = rn.randf_range(-1.0, 1.0)
			var h: float = w - m - 0.09 * b
			b += c * h
			m += c * b

			v += b * sin(PI * k) * 0.55

		if t < SHOWER_OFF_TAIL:
			var w2: float = rn.randf_range(-1.0, 1.0)
			lo += 0.55 *(w2 - lo)
			v +=(w2 - lo) * 0.34 * exp(- t * 7.5)

		for g in gotas:
			var t0: float = float(g[0])
			if t < t0:
				continue
			var dt: float = t - t0
			if dt > 0.18:
				continue
			v += sin(TAU * dt * float(g[1])) * exp(- dt * 46.0) * float(g[2]) * 0.5
		out[i] = clampf(v, -1.0, 1.0)
	return _make_stream(out, false)






static func _locker_far_crowd() -> AudioStreamWAV:
	var n: int = RATE * 8
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 5150


	var a: float = 0.0
	var b: float = 0.0
	var c: float = 0.0
	var sub: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var swell: float = 1.0 + 0.42 * sin(TAU * t * 0.125) \
				+ 0.24 * sin(TAU * t * 0.31 + 1.1)
		var w: float = rn.randf_range(-1.0, 1.0)
		a += 0.055 *(w - a)
		b += 0.055 *(a - b)
		c += 0.055 *(b - c)
		sub += 0.01 *(w - sub)






		out[i] =(c * 3.2 + sub * 1.6) * swell * 0.28
	return _make_stream(out, true)






static func _studs_tick() -> AudioStreamWAV:
	var n: int = int(RATE * 0.16)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 3341
	var hp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)
		hp += 0.55 *(w - hp)
		var chasq: float =(w - hp) * exp(- t * 190.0)
		var tin: float = sin(TAU * t * 2600.0) * exp(- t * 110.0) * 0.35
		out[i] =(chasq * 0.9 + tin) * 0.5
	return _make_stream(out, false)






static func _door_clack() -> AudioStreamWAV:
	var n: int = int(RATE * 0.3)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 8181
	var hp: float = 0.0
	var lo: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)

		hp += 0.6 *(w - hp)
		var clic: float =(w - hp) * exp(- t * 240.0) * 0.55


		var td: float = maxf(t - 0.04, 0.0)
		lo += 0.09 *(w - lo)
		var golpe: float = lo * exp(- td * 26.0) * 1.9

		var cuerpo: float = sin(TAU * td * 96.0) * exp(- td * 21.0) * 0.3
		out[i] = clic +(golpe + cuerpo) *(0.0 if t < 0.04 else 1.0)
	return _make_stream(out, false)








static func _rain_roof() -> AudioStreamWAV:
	var n: int = RATE * 6
	var left: PackedFloat32Array = PackedFloat32Array()
	var right: PackedFloat32Array = PackedFloat32Array()
	left.resize(n)
	right.resize(n)
	var rl: RandomNumberGenerator = RandomNumberGenerator.new()
	rl.seed = 5151
	var rr: RandomNumberGenerator = RandomNumberGenerator.new()
	rr.seed = 6262
	var rw: RandomNumberGenerator = RandomNumberGenerator.new()
	rw.seed = 7373
	var a1_l: float = 0.0
	var a2_l: float = 0.0
	var a1_r: float = 0.0
	var a2_r: float = 0.0
	var wob: float = 0.0
	for i in n:
		var wl: float = rl.randf_range(-1.0, 1.0)
		var wr: float = rr.randf_range(-1.0, 1.0)
		a1_l += 0.26 *(wl - a1_l)
		a2_l += 0.26 *(a1_l - a2_l)
		a1_r += 0.26 *(wr - a1_r)
		a2_r += 0.26 *(a1_r - a2_r)
		wob += 0.00018 *(rw.randf_range(-1.0, 1.0) - wob)
		var env: float = 1.0 + clampf(wob * 3.0, -0.35, 0.35)
		left[i] = a2_l * env * 0.55
		right[i] = a2_r * env * 0.55


	var t_gota: float = 0.05
	while t_gota < 5.9:
		var i0: int = int(t_gota * RATE)
		var f: float = rw.randf_range(620.0, 1100.0)
		var amp: float = rw.randf_range(0.1, 0.26)
		var lado: float = rw.randf()
		for k in int(RATE * 0.09):
			if i0 + k >= n:
				break
			var tk: float = float(k) / float(RATE)
			var v: float =(sin(TAU * f * tk) + 0.5 * sin(TAU * f * 1.62 * tk)) \
					* exp(- tk * 55.0) * amp
			left[i0 + k] += v *(1.0 - lado)
			right[i0 + k] += v * lado
		t_gota += rw.randf_range(0.12, 0.55)
	return _make_stream_st(left, right, true)








static func _ceiling_stomp() -> AudioStreamWAV:
	var n: int = int(RATE * 0.9)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 4477
	var lp1: float = 0.0
	var lp2: float = 0.0
	var hp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)
		var fase: float = TAU *(lerpf(58.0, 34.0, minf(t / 0.18, 1.0)) * t)
		var bombo: float = sin(fase) * exp(- t * 7.5) * 0.85
		lp1 += 0.018 *(w - lp1)
		lp2 += 0.018 *(lp1 - lp2)

		var masa: float = lp2 * minf(t / 0.03, 1.0) * exp(- t * 9.0) * 9.0
		var tr: float = maxf(t - 0.02, 0.0)
		hp += 0.35 *(w - hp)
		var traqueteo: float =(w - hp) *(0.55 + 0.45 * sin(TAU * 31.0 * tr)) \
				* exp(- tr * 13.0) * 0.16 *(0.0 if t < 0.02 else 1.0)
		out[i] = bombo + masa + traqueteo
	_normalize(out, 0.92)
	return _make_stream(out, false)







static func _door_slam() -> AudioStreamWAV:
	var n: int = int(RATE * 1.2)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 9393
	var lo: float = 0.0
	var lo2: float = 0.0
	var hp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)
		hp += 0.55 *(w - hp)
		var pestillo: float =(w - hp) * exp(- t * 180.0) * 0.8
		lo += 0.11 *(w - lo)
		lo2 += 0.11 *(lo - lo2)
		var golpe: float = lo2 * exp(- t * 16.0) * 4.2
		var madera: float = sin(TAU * 78.0 * t) * exp(- t * 11.0) * 0.55
		var pared: float = sin(TAU * 44.0 * t) * minf(t / 0.012, 1.0) * exp(- t * 3.6) * 0.45
		var tm: float = maxf(t - 0.06, 0.0)
		var marco: float =(w - hp) *(0.5 + 0.5 * sin(TAU * 23.0 * tm)) \
				* exp(- tm * 9.0) * 0.1 *(0.0 if t < 0.06 else 1.0)
		out[i] = pestillo + golpe + madera + pared + marco
	_normalize(out, 0.95)
	return _make_stream(out, false)







static func _power_cut() -> AudioStreamWAV:
	var n: int = int(RATE * 0.9)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 2020
	var hp: float = 0.0
	var fase: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)
		hp += 0.4 *(w - hp)
		var clac: float =(w - hp) * exp(- t * 120.0) * 0.9 \
				+ sin(TAU * 150.0 * t) * exp(- t * 40.0) * 0.45
		var f: float = lerpf(100.0, 62.0, minf(t / 0.35, 1.0))
		fase += TAU * f / float(RATE)
		var zumbido: float =(sin(fase) + 0.45 * sin(3.0 * fase) + 0.22 * sin(5.0 * fase)) \
				* exp(- t * 9.0) * 0.3
		out[i] = clac + zumbido
	_normalize(out, 0.9)
	return _make_stream(out, false)







static func _power_back() -> AudioStreamWAV:
	var n: int = int(RATE * 1.3)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 3131
	var tramos: Array = [[0.0, 0.07], [0.22, 0.29], [0.5, 1.3]]
	var hp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rn.randf_range(-1.0, 1.0)
		hp += 0.45 *(w - hp)
		var v: float = 0.0
		for tr in tramos:
			var t0: float = float(tr[0])
			if t < t0:
				continue
			var d: float = t - t0
			v +=(w - hp) * exp(- d * 260.0) * 0.8
			if t < float(tr[1]):

				var cola: float = 1.0 if t0 < 0.5 else (0.35 + 0.65 * exp(- d * 5.0))
				v +=(sin(TAU * 100.0 * t) + 0.4 * sin(TAU * 300.0 * t)) * 0.22 * cola \
						* minf(d / 0.01, 1.0) *(exp(-(t - 1.0) * 8.0) if t > 1.0 else 1.0)
		out[i] = v
	_normalize(out, 0.85)
	return _make_stream(out, false)












static func _bottles_kick() -> AudioStreamWAV:
	var n: int = int(RATE * 1.4)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4471
	var lo: float = 0.0
	var hp: float = 0.0
	var bp: float = 0.0
	for i in int(RATE * 0.3):
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)

		lo += 0.07 *(w - lo)
		var golpe: float = lo * exp(- t * 32.0) * 2.4 \
				+ sin(TAU * t *(140.0 - 60.0 * t)) * exp(- t * 28.0) * 0.55

		hp += 0.45 *(w - hp)
		bp += 0.35 *((w - hp) - bp)
		var tc: float = maxf(t - 0.012, 0.0)
		var crujido: float = bp * exp(- tc * 22.0) * 0.9 *(0.0 if t < 0.012 else 1.0)
		out[i] += golpe + crujido
	for _b in 6:
		var t0: float = rng.randf_range(0.16, 0.38)
		var gap: float = rng.randf_range(0.17, 0.26)
		var amp: float = rng.randf_range(0.3, 0.46)
		var f0: float = rng.randf_range(520.0, 980.0)
		for _k in rng.randi_range(3, 4):
			if t0 >= 1.3:
				break
			_bottle_tok(out, t0, f0 * rng.randf_range(0.96, 1.04), amp, rng)
			t0 += gap
			gap *= 0.62
			amp *= 0.55
	_normalize(out, 0.9)
	return _make_stream(out, false)





static func _bottle_tok(out: PackedFloat32Array, t0: float, f0: float, amp: float,
		rng: RandomNumberGenerator) -> void:
	var f1: float = f0 * rng.randf_range(1.47, 1.63)
	var dur: int = int(0.07 * float(RATE))
	var start: int = int(t0 * float(RATE))
	var p0: float = 0.0
	var p1: float = 0.0
	for i in dur:
		var idx: int = start + i
		if idx >= out.size():
			return
		var t: float = float(i) / float(RATE)
		p0 += TAU * f0 / float(RATE)
		p1 += TAU * f1 / float(RATE)
		var env: float = exp(- t * 85.0) * minf(t / 0.0006, 1.0)
		var clic: float = rng.randf_range(-1.0, 1.0) * exp(- t * 420.0) * 0.6
		out[idx] +=(sin(p0) + sin(p1) * 0.55 + clic) * amp * env













static func _botella_cae() -> AudioStreamWAV:
	var n: int = int(RATE * 0.62)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 6113
	var f0: float = 360.0
	var f1: float = f0 * 1.52
	var p0: float = 0.0
	var p1: float = 0.0
	var lp: float = 0.0
	for i in int(RATE * 0.16):
		var t: float = float(i) / float(RATE)
		p0 += TAU * f0 / float(RATE)
		p1 += TAU * f1 / float(RATE)
		lp += 0.18 *(rng.randf_range(-1.0, 1.0) - lp)
		var env: float = exp(- t * 38.0) * minf(t / 0.0008, 1.0)
		var clic: float = rng.randf_range(-1.0, 1.0) * exp(- t * 300.0) * 0.5
		out[i] +=(sin(p0) + sin(p1) * 0.5 + lp * 1.6 + clic) * env
	var t0: float = 0.11
	var gap: float = 0.085
	var amp: float = 0.42
	for _k in 4:
		_bottle_tok(out, t0, rng.randf_range(640.0, 760.0), amp, rng)
		t0 += gap
		gap *= 0.66
		amp *= 0.6
	_normalize(out, 0.85)
	return _make_stream(out, false)






















const COACH_F0: float = 118.0


const COACH_SYL: Array = [
	{"dur": 0.2, "f": [520.0, 1180.0], "det": 1.0},
	{"dur": 0.15, "f": [360.0, 2100.0], "det": 1.06},
	{"dur": 0.24, "f": [450.0, 880.0], "det": 0.94},
]


static func _coach_syllable(variant: int) -> AudioStreamWAV:
	var cfg: Dictionary = COACH_SYL[variant % COACH_SYL.size()]
	var dur: float = float(cfg["dur"])
	var n: int = int(RATE * dur)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 700 + variant
	var fr: Array = cfg["f"]


	var c1: float = 2.0 * sin(PI * float(fr[0]) / float(RATE))
	var c2: float = 2.0 * sin(PI * float(fr[1]) / float(RATE))
	var q: float = 0.1
	var l1: float = 0.0
	var b1: float = 0.0
	var l2: float = 0.0
	var b2: float = 0.0
	var phase: float = 0.0
	var pico: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var k: float = t / dur
		var f0: float = COACH_F0 * float(cfg["det"]) \
				*(1.0 + 0.1 * sin(PI * k) - 0.14 * k)
		phase += f0 / float(RATE)
		if phase >= 1.0:
			phase -= 1.0


		var src: float =(1.0 - phase) * 2.0 - 1.0 + rn.randf_range(-1.0, 1.0) * 0.05
		var h1: float = src - l1 - q * b1
		b1 += c1 * h1
		l1 += c1 * b1
		var h2: float = src - l2 - q * b2
		b2 += c2 * h2
		l2 += c2 * b2


		var env: float = sin(PI * pow(k, 0.72))
		out[i] =(b1 * 0.85 + b2 * 0.32) * env
		pico = maxf(pico, absf(out[i]))



	if pico > 0.0001:
		var g: float = 0.72 / pico
		for i in n:
			out[i] *= g
	return _make_stream(out, false)



static func _crowd_roar() -> AudioStreamWAV:
	var n: int = int(RATE * 2.6)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 11
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.18 *(w - lp)
		var env: float = minf(t / 0.18, 1.0) * exp(- maxf(t - 0.9, 0.0) * 2.2)
		out[i] = lp * env * 1.5
	return _make_stream(out, false)




static func _crowd_ooh() -> AudioStreamWAV:
	var n: int = int(RATE * 1.4)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 13
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		var a: float = lerpf(0.16, 0.03, clampf(t, 0.0, 1.0))
		lp += a *(w - lp)
		var env: float = minf(t / 0.15, 1.0) * exp(- maxf(t - 0.45, 0.0) * 3.0)
		out[i] = lp * env * 1.4
	return _make_stream(out, false)










static func _kick() -> AudioStreamWAV:
	var n: int = int(RATE * 0.26)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 17
	var ph: float = 0.0
	var lp: float = 0.0
	var lp2: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)

		var f: float = lerpf(185.0, 52.0, sqrt(minf(t / 0.06, 1.0)))
		ph += TAU * f / float(RATE)
		var body: float = sin(ph) * exp(- t * 22.0)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.5 *(w - lp)
		lp2 += 0.07 *(lp - lp2)
		var thwack: float =(lp - lp2) * exp(- t * 95.0) * 0.7
		var click: float = w * exp(- t * 380.0) * 0.45
		out[i] =(body * 1.1 + thwack + click) * 0.9
	return _make_stream(out, false)




static func _whistle(dur: float) -> AudioStreamWAV:
	var n: int = int(RATE *(dur + 0.05))
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = 2350.0 + 40.0 * sin(TAU * t * 5.0)
		ph += TAU * f / float(RATE)
		var pea: float = 0.62 + 0.38 * sin(TAU * t * 38.0)
		var env: float = minf(t / 0.012, 1.0) * clampf((dur - t) / 0.06, 0.0, 1.0)
		out[i] = sin(ph) * pea * env * 0.5
	return _make_stream(out, false)




static func _chant_loop() -> AudioStreamWAV:
	var n: int = RATE * 4
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 23

	var beats: Array = [0.0, 0.4, 0.8, 1.2, 1.6, 2.6, 2.95, 3.3]
	for b in beats:

		for hand in 6:
			var t0: float = float(b) + rng.randf_range(-0.02, 0.02)
			var start: int = int(t0 * RATE)
			var lp: float = 0.0
			for i in int(RATE * 0.07):
				var idx: int = start + i
				if idx < 0 or idx >= n:
					continue
				var t: float = float(i) / float(RATE)
				var w: float = rng.randf_range(-1.0, 1.0)
				lp += 0.45 *(w - lp)
				out[idx] +=(w - lp) * exp(- t * 70.0) * 0.16
	return _make_stream(out, true)



static func _away_drums() -> AudioStreamWAV:
	var n: int = int(RATE * 2.1)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var beats: Array = [0.0, 0.28, 0.56, 1.05, 1.33, 1.61]
	for b in beats:
		var start: int = int(float(b) * RATE)
		var ph: float = 0.0
		for i in int(RATE * 0.3):
			var idx: int = start + i
			if idx >= n:
				break
			var t: float = float(i) / float(RATE)
			var f: float = lerpf(85.0, 48.0, minf(t / 0.3, 1.0))
			ph += TAU * f / float(RATE)
			out[idx] += sin(ph) * exp(- t * 14.0) * 0.85
	return _make_stream(out, false)






static func _lone_shout() -> AudioStreamWAV:
	var n: int = int(RATE * 0.45)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 271
	var bp: float = 0.0
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)

		var vib: float = 1.0 + 0.03 * sin(TAU * t * 5.5)
		var formants: float =(
			sin(TAU * 350.0 * vib * t) * 0.6
			+ sin(TAU * 700.0 * vib * t) * 0.35
			+ sin(TAU * 1100.0 * vib * t) * 0.2)

		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.25 *(w - lp)
		bp = lp - bp * 0.5
		var env: float = minf(t / 0.05, 1.0) * exp(- maxf(t - 0.12, 0.0) * 6.0)
		out[i] =(formants * 0.5 + bp * 0.25) * env * 0.6
	return _make_stream(out, false)




static func _lone_drum() -> AudioStreamWAV:
	var n: int = int(RATE * 0.4)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(85.0, 48.0, minf(t / 0.3, 1.0))
		ph += TAU * f / float(RATE)
		out[i] = sin(ph) * exp(- t * 14.0) * 0.85
	return _make_stream(out, false)






static func _claxon() -> AudioStreamWAV:
	var n: int = int(RATE * 0.55)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)

	var f1: float = 440.0
	var f2: float = 349.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var v: float = 0.0

		for h in range(1, 6):
			var a: float = 1.0 / float(h)
			v += sin(TAU * f1 * float(h) * t) * a
			v += sin(TAU * f2 * float(h) * t) * a


		var env: float = minf(t / 0.008, 1.0) * minf((0.55 - t) / 0.03, 1.0)
		out[i] = clampf(v * 0.14, -1.0, 1.0) * maxf(env, 0.0)
	return _make_stream(out, false)







static func _engine_loop() -> AudioStreamWAV:
	var dur: float = 0.857
	var n: int = int(RATE * dur)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 5150
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)

		var body: float =(
			sin(TAU * 48.0 * t) * 0.6
			+ sin(TAU * 96.0 * t) * 0.28
			+ sin(TAU * 144.0 * t) * 0.14)


		var fire: float = 0.55 + 0.45 * absf(sin(PI * 10.5 * t / dur))

		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.04 *(w - lp)
		out[i] =(body * fire + lp * 0.5) * 0.5
	return _make_stream(out, true)







static func _parade_drum() -> AudioStreamWAV:
	var dur: float = 1.714
	var n: int = int(RATE * dur)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)

	var golpes: Array = [
		[0.0, 1.0], [0.428, 0.55], [0.643, 0.5],
		[0.857, 0.8], [1.285, 0.55], [1.5, 0.5],
	]
	for g in golpes:
		var start: int = int(float(g[0]) * RATE)
		var amp: float = float(g[1])
		var ph: float = 0.0
		for i in int(RATE * 0.34):
			var idx: int = start + i
			if idx >= n:
				break
			var t: float = float(i) / float(RATE)
			var f: float = lerpf(92.0, 46.0, minf(t / 0.28, 1.0))
			ph += TAU * f / float(RATE)
			out[idx] += sin(ph) * exp(- t * 12.0) * 0.9 * amp
	return _make_stream(out, true)












static func _ventanilla() -> AudioStreamWAV:
	const DUR: float = 1.15
	const FIN: float = 0.98
	var n: int = int(RATE * DUR)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 7707
	var ph: float = 0.0
	var ph_e: float = 0.0
	var lp: float = 0.0
	var lp2: float = 0.0
	var lo: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		if t < FIN:
			var carga: float = smoothstep(FIN - 0.12, FIN, t)
			var f: float = lerpf(92.0, 126.0, minf(t / 0.1, 1.0)) - 24.0 * carga
			ph += TAU * f / float(RATE)
			ph_e += TAU * f * 8.3 / float(RATE)
			var rotor: float = sin(ph) + sin(3.0 * ph) / 3.0 + sin(5.0 * ph) / 5.0

			var pulso: float = 0.85 + 0.15 * sin(TAU * 17.0 * t)
			lp += 0.45 *(w - lp)
			lp2 += 0.05 *(lp - lp2)
			var roce: float =(lp - lp2) * 0.3
			var env: float = minf(t / 0.04, 1.0) * minf((FIN - t) / 0.015, 1.0)
			out[i] =(rotor * 0.3 * pulso + sin(ph_e) * 0.1 + roce) * env
		else:

			var td: float = t - FIN
			lo += 0.12 *(w - lo)
			out[i] = lo * exp(- td * 34.0) * 1.1 + sin(TAU * 78.0 * td) * exp(- td * 26.0) * 0.4
	_normalize(out, 0.7)
	return _make_stream(out, false)











static func _rotulador_loop() -> AudioStreamWAV:
	const DUR: float = 0.5
	var n: int = int(RATE * DUR)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4242
	var lp: float = 0.0
	var lp2: float = 0.0
	var grano: float = 0.7
	var obj: float = 0.7
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.8 *(w - lp)
		lp2 += 0.25 *(w - lp2)

		if i % 90 == 0:
			obj = rng.randf_range(0.35, 1.0)
		grano += 0.02 *(obj - grano)
		var f: float = 2150.0 + 240.0 * sin(TAU * 3.0 * t / DUR)
		ph += TAU * f / float(RATE)
		var chirrido: float = sin(ph) * 0.1 *(0.6 + 0.4 * sin(TAU * 8.0 * t / DUR))
		out[i] =(lp - lp2) * grano + chirrido
	_normalize(out, 0.6)
	return _make_stream(out, true)



static func _ui_click() -> AudioStreamWAV:
	var n: int = int(RATE * 0.07)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(1150.0, 820.0, t / 0.07)
		ph += TAU * f / float(RATE)
		var sq: float = 1.0 if sin(ph) >= 0.0 else -1.0
		var env: float = minf(t / 0.004, 1.0) * exp(- t * 55.0)
		out[i] = sq * env * 0.35
	return _make_stream(out, false)



















static func _pulse_note(out: PackedFloat32Array, t0: float, dur: float,
		freq: float, duty: float, amp: float, decay: float) -> void:
	var start: int = int(t0 * RATE)
	var count: int = int(dur * RATE)
	var n: int = out.size()
	var ph: float = 0.0
	var lp: float = 0.0
	for i in count:
		var idx: int = start + i
		if idx < 0 or idx >= n:
			continue
		var t: float = float(i) / float(RATE)
		ph += freq / float(RATE)
		if ph >= 1.0:
			ph -= 1.0
		var sq: float = 1.0 if ph < duty else -1.0

		lp += 0.5 *(sq - lp)
		var env: float = minf(t / 0.005, 1.0) * exp(- t * decay) \
				* clampf((dur - t) / 0.02, 0.0, 1.0)
		out[idx] += lp * env * amp




static func _ui_back() -> AudioStreamWAV:
	var n: int = int(RATE * 0.09)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(880.0, 500.0, minf(t / 0.07, 1.0))
		ph += TAU * f / float(RATE)
		var sq: float = 1.0 if sin(ph) >= 0.0 else -1.0
		var env: float = minf(t / 0.004, 1.0) * exp(- t * 42.0)
		out[i] = sq * env * 0.32
	return _make_stream(out, false)




static func _ui_confirm() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.24))
	_pulse_note(out, 0.0, 0.07, 784.0, 0.5, 0.34, 18.0)
	_pulse_note(out, 0.06, 0.17, 1175.0, 0.5, 0.34, 14.0)
	return _make_stream(out, false)





static func _ui_deny() -> AudioStreamWAV:
	var n: int = int(RATE * 0.24)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(205.0, 138.0, minf(t / 0.18, 1.0))
		ph += TAU * f / float(RATE)
		var sq: float = 1.0 if sin(ph) >= 0.0 else -1.0
		var buzz: float = 0.6 + 0.4 * sin(TAU * t * 28.0)
		var env: float = minf(t / 0.006, 1.0) * clampf((0.24 - t) / 0.06, 0.0, 1.0)
		out[i] = sq * buzz * env * 0.3
	return _make_stream(out, false)




static func _ui_toggle() -> AudioStreamWAV:
	var n: int = int(RATE * 0.04)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 61
	var lp: float = 0.0
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.55 *(w - lp)
		ph += TAU * 2100.0 / float(RATE)
		var env: float = exp(- t * 190.0)
		out[i] =((w - lp) * 0.8 + sin(ph) * 0.35) * env * 0.5
	return _make_stream(out, false)




static func _ui_coin() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.38))
	_pulse_note(out, 0.0, 0.07, 988.0, 0.5, 0.3, 12.0)
	_pulse_note(out, 0.06, 0.3, 1319.0, 0.5, 0.3, 7.0)
	return _make_stream(out, false)





static func _ui_whoosh() -> AudioStreamWAV:
	var n: int = int(RATE * 0.38)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 83
	var lp: float = 0.0
	var lp2: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var k: float = t / 0.38
		var w: float = rng.randf_range(-1.0, 1.0)

		var a: float = lerpf(0.05, 0.55, sin(PI * k))
		lp += a *(w - lp)
		lp2 += 0.03 *(lp - lp2)
		var env: float = sin(PI * k)
		out[i] =(lp - lp2) * env * env * 0.55
	return _make_stream(out, false)




static func _ui_pop() -> AudioStreamWAV:
	var n: int = int(RATE * 0.09)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(360.0, 790.0, minf(t / 0.05, 1.0))
		ph += TAU * f / float(RATE)
		var env: float = minf(t / 0.003, 1.0) * exp(- t * 38.0)
		out[i] = sin(ph) * env * 0.42
	return _make_stream(out, false)















static func _intro_grillos() -> AudioStreamWAV:
	const DUR: float = 3.0
	var n: int = int(RATE * DUR)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)

	var voces: Array = [[4300.0, 0.75, 0.05, 3, 0.55], [4750.0, 1.0, 0.42, 4, 0.38],
		[3950.0, 0.6, 0.23, 3, 0.3]]
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 211
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var s: float = 0.0
		for v in voces:
			var ciclo: float = fmod(t - float(v[2]) + DUR, float(v[1]))
			var pulso: float = ciclo * 30.0
			if pulso < float(v[3]):


				var dentro: float = fmod(pulso, 1.0)
				if dentro < 0.6:
					s += sin(TAU * float(v[0]) * t) * sin(PI * dentro / 0.6) * float(v[4])
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.02 *(w - lp)
		out[i] = s * 0.45 + lp *(0.55 + 0.45 * sin(TAU * t / DUR)) * 1.6
	_normalize(out, 0.42)
	return _make_stream(out, true)








static func _intro_pajaros() -> AudioStreamWAV:
	const DUR: float = 4.0
	var n: int = int(RATE * DUR)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)

	var cantos: Array = [
		[0.2, 3, 3200.0, 4300.0, 0.07, 0.05, 0.55],
		[0.95, 2, 4100.0, 2900.0, 0.11, 0.06, 0.4],
		[1.7, 5, 3600.0, 4800.0, 0.045, 0.035, 0.35],
		[2.6, 3, 3000.0, 3900.0, 0.08, 0.06, 0.5],
		[3.35, 2, 4500.0, 3300.0, 0.09, 0.05, 0.3],
	]
	for c in cantos:
		for k in int(c[1]):
			var t0: float = float(c[0]) + float(k) *(float(c[4]) + float(c[5]))
			var i0: int = int(t0 * RATE)
			var m: int = int(float(c[4]) * RATE)
			var ph: float = 0.0
			for j in m:
				var i: int = i0 + j
				if i >= n:
					break
				var x: float = float(j) / float(m)
				var f: float = lerpf(float(c[2]), float(c[3]), x) \
						+ 180.0 * sin(TAU * 38.0 * x * float(c[4]))
				ph += TAU * f / float(RATE)
				out[i] += sin(ph) * sin(PI * x) * float(c[6])
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 223
	var lp: float = 0.0
	var lp2: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.03 *(w - lp)
		lp2 += 0.004 *(lp - lp2)
		out[i] = out[i] * 0.5 +(lp - lp2) *(0.6 + 0.4 * sin(TAU * t / DUR)) * 2.2
	_normalize(out, 0.4)
	return _make_stream(out, true)






static func _intro_bote() -> AudioStreamWAV:
	var n: int = int(RATE * 0.16)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 227
	var ph: float = 0.0
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(140.0, 62.0, sqrt(minf(t / 0.05, 1.0)))
		ph += TAU * f / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.25 *(w - lp)
		out[i] = sin(ph) * exp(- t * 30.0) + lp * exp(- t * 70.0) * 0.35
	_normalize(out, 0.7)
	return _make_stream(out, false)






static func _intro_fugaz() -> AudioStreamWAV:
	const DUR: float = 0.7
	var n: int = int(RATE * DUR)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph1: float = 0.0
	var ph2: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var x: float = t / DUR
		var f: float = lerpf(2900.0, 1700.0, x)
		ph1 += TAU * f / float(RATE)
		ph2 += TAU * f * 1.5 / float(RATE)
		var env: float = minf(x / 0.08, 1.0) *(1.0 - x) *(1.0 - x)
		out[i] =(sin(ph1) + 0.45 * sin(ph2)) *(0.6 + 0.4 * sin(TAU * 22.0 * t)) * env
	_normalize(out, 0.3)
	return _make_stream(out, false)





static func _fanfare() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.95))
	var notes: Array[float] = [523.25, 659.25, 783.99, 1046.5]
	var times: Array[float] = [0.0, 0.095, 0.19, 0.3]
	for k in 4:
		var last: bool = k == 3
		var dur: float = 0.62 if last else 0.16
		_pulse_note(out, times[k], dur, notes[k], 0.25, 0.3, 2.0 if last else 8.0)

		_pulse_note(out, times[k], dur, notes[k] * 0.5, 0.5, 0.16, 2.5 if last else 9.0)
	return _make_stream(out, false)




static func _stinger_bad() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 1.1))
	_pulse_note(out, 0.0, 0.24, 329.63, 0.5, 0.26, 5.0)
	_pulse_note(out, 0.2, 0.24, 261.63, 0.5, 0.26, 5.0)
	_pulse_note(out, 0.4, 0.62, 220.0, 0.5, 0.28, 2.2)
	_pulse_note(out, 0.4, 0.62, 110.0, 0.5, 0.16, 2.2)
	return _make_stream(out, false)





static func _crowd_boo() -> AudioStreamWAV:
	var n: int = int(RATE * 2.4)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 29






	const N_VOICES: int = 7
	var ph: PackedFloat32Array = PackedFloat32Array()
	var inc: PackedFloat32Array = PackedFloat32Array()
	ph.resize(N_VOICES)
	inc.resize(N_VOICES)
	for v in N_VOICES:


		inc[v] = TAU * rng.randf_range(180.0, 260.0) / float(RATE)
		ph[v] = rng.randf_range(0.0, TAU)
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.05 *(w - lp)


		var wob: float = 1.0 + 0.01 * sin(TAU * t * 4.3)
		var chorus: float = 0.0
		for v in N_VOICES:
			ph[v] += inc[v] * wob
			chorus += sin(ph[v])

		var env: float = minf(t / 0.5, 1.0) * clampf((2.4 - t) / 0.7, 0.0, 1.0)
		out[i] =(chorus / 7.0 * 0.8 + lp * 1.0) * env * 0.9
	return _make_stream(out, false)




static func _crowd_whistles() -> AudioStreamWAV:
	var n: int = int(RATE * 1.9)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 31
	for wgroup in 14:
		var t0: float = rng.randf_range(0.0, 1.2)
		var dur: float = rng.randf_range(0.35, 0.7)
		var f0: float = rng.randf_range(1900.0, 3100.0)
		var start: int = int(t0 * RATE)
		var ph: float = 0.0
		for i in int(dur * RATE):
			var idx: int = start + i
			if idx >= n:
				break
			var t: float = float(i) / float(RATE)
			var f: float = f0 + 90.0 * sin(TAU * t * rng.randf_range(4.0, 7.0))
			ph += TAU * f / float(RATE)
			var env: float = minf(t / 0.03, 1.0) * clampf((dur - t) / 0.1, 0.0, 1.0)
			out[idx] += sin(ph) * env * 0.1
	return _make_stream(out, false)






















const GLASS_PARTIALS: Array = [
	Vector3(2870.0, 0.42, 34.0),
	Vector3(4310.0, 0.3, 46.0),
	Vector3(6190.0, 0.2, 62.0),
	Vector3(8730.0, 0.11, 90.0),
]




static func _glass_snap(out: PackedFloat32Array, t0: float, ancho: float,
		caida: float, rng: RandomNumberGenerator) -> void:
	var n0: int = int(t0 * float(RATE))
	var dur: int = int(0.22 * float(RATE))
	var ph: PackedFloat32Array = PackedFloat32Array()
	ph.resize(GLASS_PARTIALS.size())
	var hp: float = 0.0
	var last: float = 0.0
	for i in dur:
		var k: int = n0 + i
		if k >= out.size():
			return
		var t: float = float(i) / float(RATE)
		var ring: float = 0.0
		for j in GLASS_PARTIALS.size():
			var pr: Vector3 = GLASS_PARTIALS[j]
			ph[j] += TAU * pr.x / float(RATE)
			ring += sin(ph[j]) * pr.y * exp(- t * pr.z * caida)



		var w: float = rng.randf_range(-1.0, 1.0)
		hp += 0.55 *(w - hp)
		var crash: float =(w - hp) * exp(- t *(70.0 / ancho)) * 0.55 * ancho

		var atk: float = minf(t / 0.0003, 1.0)
		last =(ring * ancho + crash) * atk
		out[k] += last


















static func _dron_zumbido() -> AudioStreamWAV:
	var n: int = RATE
	var funde: int = int(RATE * 0.06)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	const L: int = 1024
	var tabla: PackedFloat32Array = PackedFloat32Array()
	tabla.resize(L)
	for j in L:
		var x: float = TAU * float(j) / float(L)

		tabla[j] = sin(x) + sin(2.0 * x) * 0.42 + sin(3.0 * x) * 0.25 + sin(4.0 * x) * 0.18
	var motores: Array[float] = [176.0, 183.0, 191.0, 198.0]


	var fases: Array[float] = [0.0, 0.31, 0.57, 0.83]
	for i in n:
		var s: float = 0.0
		for m in 4:
			s += tabla[int(fases[m] * float(L)) % L]
			fases[m] = fmod(fases[m] + motores[m] / float(RATE), 1.0)
		var vaiven: float = 0.85 + 0.15 * sin(TAU * 3.0 * float(i) / float(RATE))
		out[i] = s * 0.2 * vaiven
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 8086
	var aire: PackedFloat32Array = PackedFloat32Array()
	aire.resize(n + funde)
	var lp: float = 0.0
	for i in n + funde:
		lp += 0.05 *(rng.randf_range(-1.0, 1.0) - lp)
		aire[i] = lp * 0.9
	for i in n:
		var a: float = aire[i]
		if i < funde:
			var u: float = float(i) / float(funde)
			a = aire[i] * u + aire[n + i] *(1.0 - u)
		out[i] += a
	_normalize(out, 0.8)
	return _make_stream(out, true)







static func _dron_golpe() -> AudioStreamWAV:
	var n: int = int(RATE * 0.5)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 6502
	var hp: float = 0.0
	var fase: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		hp += 0.55 *(w - hp)
		var chasquido: float =(w - hp) * exp(- t * 70.0) * 1.3
		var astilla: float =(sin(TAU * 1830.0 * t) + sin(TAU * 2970.0 * t) * 0.7) \
				* exp(- t * 38.0) * 0.45

		var f: float = lerpf(190.0, 105.0, minf(t / 0.4, 1.0))
		fase += TAU * f / float(RATE)
		var corte: float = 1.0 if fmod(t * 23.0, 1.0) < 0.62 else 0.25
		var motor: float =(sin(fase) + sin(fase * 2.0) * 0.5 + sin(fase * 3.0) * 0.25) \
				* corte * exp(- t * 5.0) * 0.35 * minf(t / 0.01, 1.0)
		out[i] = chasquido + astilla + motor
	_normalize(out, 0.92)
	return _make_stream(out, false)







static func _dron_choque() -> AudioStreamWAV:
	var n: int = int(RATE * 0.9)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 1337
	var lo: float = 0.0
	var hp: float = 0.0
	var bp: float = 0.0
	for i in int(RATE * 0.35):
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lo += 0.06 *(w - lo)
		var golpe: float = lo * exp(- t * 26.0) * 2.6 \
				+ sin(TAU * t *(95.0 - 50.0 * t)) * exp(- t * 20.0) * 0.6
		hp += 0.45 *(w - hp)
		bp += 0.3 *((w - hp) - bp)
		var tc: float = maxf(t - 0.008, 0.0)
		var crujido: float = bp * exp(- tc * 16.0) * 1.1 *(0.0 if t < 0.008 else 1.0)
		out[i] += golpe + crujido
	for _p in 4:
		var t0: float = rng.randf_range(0.1, 0.26)
		var gap: float = rng.randf_range(0.12, 0.18)
		var amp: float = rng.randf_range(0.22, 0.34)
		var f0: float = rng.randf_range(900.0, 1500.0)
		for _k in rng.randi_range(2, 3):
			if t0 >= 0.82:
				break
			_bottle_tok(out, t0, f0 * rng.randf_range(0.97, 1.03), amp, rng)
			t0 += gap
			gap *= 0.6
			amp *= 0.5
	_normalize(out, 0.88)
	return _make_stream(out, false)








static func _playa_golpe() -> AudioStreamWAV:
	var n: int = int(RATE * 0.4)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 2009
	var lp: float = 0.0
	var fase: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.35 *(w - lp)
		var palmetazo: float = lp * exp(- t * 95.0) * 1.1

		var f: float = 150.0 + 90.0 * exp(- t * 18.0)
		fase += TAU * f / float(RATE)
		var hueco: float =(sin(fase) * exp(- t * 9.0)
			+ sin(fase * 2.63) * exp(- t * 22.0) * 0.32) * 0.9

		out[i] =(palmetazo + hueco) * minf(t / 0.002, 1.0)
	_normalize(out, 0.86)
	return _make_stream(out, false)






static func _playa_bote() -> AudioStreamWAV:
	var n: int = int(RATE * 0.22)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 1017
	var lp: float = 0.0
	var fase: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		lp += 0.12 *(rng.randf_range(-1.0, 1.0) - lp)
		var f: float = 115.0 + 60.0 * exp(- t * 30.0)
		fase += TAU * f / float(RATE)
		var pof: float = sin(fase) * exp(- t * 20.0) + lp * exp(- t * 60.0) * 1.4
		out[i] = pof * minf(t / 0.003, 1.0)
	_normalize(out, 0.72)
	return _make_stream(out, false)








static func _normalize(out: PackedFloat32Array, objetivo: float) -> void:
	var pico: float = 0.0
	for v in out:
		pico = maxf(pico, absf(v))
	if pico <= 0.0001:
		return
	var g: float = objetivo / pico
	for i in out.size():
		out[i] *= g



static func _glass_crack() -> AudioStreamWAV:
	var n: int = int(RATE * 0.3)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 613
	_glass_snap(out, 0.0, 0.72, 1.35, rng)

	_normalize(out, 0.62)
	return _make_stream(out, false)



static func _glass_break() -> AudioStreamWAV:
	var n: int = int(RATE * 1.15)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 617
	_glass_snap(out, 0.0, 1.0, 1.0, rng)




	for _k in 44:
		var t0: float = 0.05 + pow(rng.randf(), 2.0) * 0.95
		var f0: float = rng.randf_range(3200.0, 11500.0)
		var f1: float = f0 * rng.randf_range(1.31, 1.79)
		var amp: float = rng.randf_range(0.04, 0.12) *(1.0 - t0 * 0.55)
		var dec: float = rng.randf_range(70.0, 170.0)
		var dur: int = int(0.09 * float(RATE))
		var p0: float = 0.0
		var p1: float = 0.0
		for i in dur:
			var idx: int = int(t0 * float(RATE)) + i
			if idx >= n:
				break
			var t: float = float(i) / float(RATE)
			p0 += TAU * f0 / float(RATE)
			p1 += TAU * f1 / float(RATE)
			var env: float = exp(- t * dec) * minf(t / 0.0002, 1.0)
			out[idx] +=(sin(p0) + sin(p1) * 0.7) * amp * env
	_normalize(out, 0.92)
	return _make_stream(out, false)








static func _post_hit() -> AudioStreamWAV:
	var n: int = int(RATE * 0.75)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 23

	var partials: Array[Vector3] = [
		Vector3(196.0, 0.55, 3.4),
		Vector3(541.0, 0.4, 6.5),
		Vector3(1058.0, 0.22, 13.0),
		Vector3(1930.0, 0.12, 26.0),
	]
	var ph: PackedFloat32Array = PackedFloat32Array()
	ph.resize(partials.size())
	var thump_ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var ring: float = 0.0
		for k in partials.size():
			var p: Vector3 = partials[k]
			ph[k] += TAU * p.x / float(RATE)
			ring += sin(ph[k]) * p.y * exp(- t * p.z)

		thump_ph += TAU * lerpf(150.0, 70.0, minf(t / 0.08, 1.0)) / float(RATE)
		var thump: float = sin(thump_ph) * exp(- t * 40.0) * 0.6
		var click: float = rng.randf_range(-1.0, 1.0) * exp(- t * 420.0) * 0.45

		var atk: float = minf(t / 0.0005, 1.0)
		out[i] =(ring + thump + click) * atk * 0.95
	return _make_stream(out, false)





static func _keeper_save() -> AudioStreamWAV:
	var n: int = int(RATE * 0.28)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 29
	var lp: float = 0.0
	var lp2: float = 0.0
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)


		lp += 0.45 *(w - lp)
		lp2 += 0.06 *(lp - lp2)
		var slap: float =(lp - lp2) * exp(- t * 34.0)
		ph += TAU * lerpf(190.0, 90.0, minf(t / 0.06, 1.0)) / float(RATE)
		var body: float = sin(ph) * exp(- t * 45.0) * 0.5
		out[i] =(slap * 1.3 + body) * minf(t / 0.0008, 1.0) * 0.9
	return _make_stream(out, false)





static func _keeper_catch() -> AudioStreamWAV:
	var n: int = int(RATE * 0.24)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 31
	var lp: float = 0.0
	var lp2: float = 0.0
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.3 *(w - lp)
		lp2 += 0.1 *(lp - lp2)
		var slap: float =(lp - lp2) * exp(- t * 60.0)
		ph += TAU * lerpf(140.0, 62.0, minf(t / 0.05, 1.0)) / float(RATE)
		var body: float = sin(ph) * exp(- t * 30.0) * 0.85
		out[i] =(slap * 0.7 + body) * minf(t / 0.0008, 1.0) * 0.9
	return _make_stream(out, false)











static func _splash() -> AudioStreamWAV:
	var n: int = int(RATE * 0.42)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 37
	var lp: float = 0.0
	var lp2: float = 0.0
	var ph: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)


		lp += 0.62 *(w - lp)
		lp2 += 0.1 *(lp - lp2)
		var spray: float =(lp - lp2) * exp(- t * 21.0)
		ph += TAU * lerpf(170.0, 430.0, minf(t / 0.09, 1.0)) / float(RATE)
		var bloop: float = sin(ph) * exp(- t * 17.0) * 0.5
		var drips: float =(lp - lp2) * exp(- t * 5.0) * 0.16
		out[i] =(spray + bloop + drips) * minf(t / 0.0006, 1.0) * 0.55
	return _make_stream(out, false)




















static func _thunder(cerca: bool) -> AudioStreamWAV:
	var dur: float = 3.2 if cerca else 3.9
	var n: int = int(RATE * dur)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()



	rng.seed = 911 if cerca else 913

	var a: float = 0.052 if cerca else 0.03
	var lp1: float = 0.0
	var lp2: float = 0.0
	var lp3: float = 0.0
	var hp: float = 0.0


	var caida: float = 1.15 if cerca else 0.82


	var ataque: float = 0.02 if cerca else 0.4
	var pico: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp1 += a *(w - lp1)
		lp2 += a *(lp1 - lp2)
		lp3 += a *(lp2 - lp3)


		var rodar: float = 0.62 \
				+ 0.26 * sin(TAU *(0.9 if cerca else 0.55) * t) \
				+ 0.16 * sin(TAU *(2.7 if cerca else 1.7) * t + 1.9)
		var env: float = minf(t / ataque, 1.0) * exp(- t * caida) * rodar
		var v: float = lp3 * env
		if cerca:



			hp += 0.55 *(w - hp)
			v +=(w - hp) * exp(- t * 26.0) * 0.42


			v += sin(TAU * lerpf(90.0, 38.0, minf(t / 0.1, 1.0)) * t) \
					* exp(- t * 8.0) * 0.3
		out[i] = v
		pico = maxf(pico, absf(v))
	if pico > 0.0001:
		var g: float = 0.92 / pico
		for i in n:
			out[i] *= g
	return _make_stream(out, false)



static func _net_swish() -> AudioStreamWAV:
	var n: int = int(RATE * 0.3)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 19
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.25 *(w - lp)
		var env: float = minf(t / 0.01, 1.0) * exp(- t * 16.0)
		out[i] =(w - lp) * env * 0.8
	return _make_stream(out, false)





static func _cannon_pop() -> AudioStreamWAV:
	var n: int = int(RATE * 0.7)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 41
	var lp: float = 0.0
	var fase: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)

		fase += TAU * lerpf(120.0, 45.0, minf(t / 0.12, 1.0)) / float(RATE)
		var golpe: float = sin(fase) * exp(- t * 22.0)

		var w: float = rng.randf_range(-1.0, 1.0)
		lp += 0.35 *(w - lp)
		var siseo: float =(w - lp) * minf(t / 0.005, 1.0) * exp(- t * 6.5)
		out[i] = golpe * 0.75 + siseo * 0.45
	return _make_stream(out, false)















static func _sting_liga() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.55))
	_pulse_note(out, 0.0, 0.14, 587.33, 0.5, 0.22, 7.0)
	_pulse_note(out, 0.1, 0.36, 880.0, 0.5, 0.24, 3.4)
	_pulse_note(out, 0.1, 0.36, 440.0, 0.5, 0.14, 3.4)
	return _make_stream(out, false)





static func _sting_copa() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.5))
	_pulse_note(out, 0.0, 0.2, 146.83, 0.5, 0.3, 6.0)
	_pulse_note(out, 0.0, 0.2, 220.0, 0.5, 0.2, 6.0)
	_pulse_note(out, 0.13, 0.3, 293.66, 0.35, 0.22, 5.0)
	return _make_stream(out, false)





static func _sting_champions() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 1.0))
	var notes: Array[float] = [392.0, 493.88, 587.33]
	for k in 3:
		_pulse_note(out, float(k) * 0.11, 0.18, notes[k], 0.5, 0.2, 6.0)

	for f: float in notes:
		_pulse_note(out, 0.33, 0.62, f, 0.5, 0.17, 1.9)
	_pulse_note(out, 0.33, 0.62, 196.0, 0.5, 0.16, 1.9)
	return _make_stream(out, false)





static func _sting_europa() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.7))
	var notes: Array[float] = [523.25, 659.25, 784.0]
	for k in 3:
		_pulse_note(out, float(k) * 0.08, 0.14, notes[k], 0.5, 0.2, 7.0)
	_pulse_note(out, 0.24, 0.4, 1046.5, 0.5, 0.2, 3.6)
	_pulse_note(out, 0.24, 0.4, 261.63, 0.5, 0.12, 3.6)
	return _make_stream(out, false)





static func _sting_mundial() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 1.0))
	var notes: Array[float] = [349.23, 440.0, 523.25, 698.46]
	var times: Array[float] = [0.0, 0.08, 0.16, 0.26]
	for k in 4:
		var last: bool = k == 3
		var dur: float = 0.6 if last else 0.14
		_pulse_note(out, times[k], dur, notes[k], 0.5, 0.2, 2.2 if last else 8.0)
		_pulse_note(out, times[k], dur, notes[k] * 0.5, 0.5, 0.13, 2.6 if last else 9.0)
	return _make_stream(out, false)






























static func _pad_note(out: PackedFloat32Array, t0: float, dur: float,
		freq: float, amp: float, attack: float = 0.16) -> void:
	var start: int = int(t0 * RATE)
	var count: int = int(dur * RATE)
	var n: int = out.size()
	var ph: float = 0.0
	var lp: float = 0.0
	var rel: float = maxf(dur * 0.35, 0.12)
	for i in count:
		var idx: int = start + i
		if idx < 0 or idx >= n:
			continue
		var t: float = float(i) / float(RATE)
		ph += freq / float(RATE)
		if ph >= 1.0:
			ph -= 1.0
		var sq: float = 1.0 if ph < 0.5 else -1.0
		lp += 0.22 *(sq - lp)
		var env: float = minf(t / attack, 1.0) * clampf((dur - t) / rel, 0.0, 1.0)
		out[idx] += lp * env * amp







static func _anthem(chords: Array, melody: Array, total: float,
		chord_amp: float = 0.11, lead_amp: float = 0.19) -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * total))
	for c: Array in chords:
		for f: float in c[2]:
			_pad_note(out, c[0], c[1], f, chord_amp, 0.2)
	for m: Array in melody:
		_pad_note(out, m[0], m[1], m[2], lead_amp, 0.09)
	return _make_stream(out, false)
















static func _string_note(out: PackedFloat32Array, t0: float, dur: float,
		freq: float, amp: float, attack: float = 0.2, bright: float = 0.16,
		rel_floor: float = 0.18) -> void:
	var start: int = int(t0 * RATE)
	var count: int = int(dur * RATE)
	var n: int = out.size()


	var detune: Array[float] = [1.0, 1.004, 0.996]
	var ph: Array[float] = [0.0, 0.33, 0.66]
	var lp: float = 0.0
	var rel: float = maxf(dur * 0.3, rel_floor)
	for i in count:
		var idx: int = start + i
		if idx < 0 or idx >= n:
			continue
		var t: float = float(i) / float(RATE)


		var vib: float = 1.0 + 0.006 * minf(t / 0.35, 1.0) * sin(TAU * 5.5 * t)
		var saw: float = 0.0
		for v in 3:
			ph[v] += freq * detune[v] * vib / float(RATE)
			if ph[v] >= 1.0:
				ph[v] -= 1.0
			saw += 2.0 * ph[v] - 1.0
		saw /= 3.0

		var k: float = lerpf(bright * 0.5, bright, minf(t / attack, 1.0))
		lp += k *(saw - lp)
		var env: float = minf(t / attack, 1.0) * clampf((dur - t) / rel, 0.0, 1.0)
		out[idx] += lp * env * amp





















static func _anthem_strings(chords: Array, melody: Array, total: float,
		chord_amp: float = 0.16, lead_amp: float = 0.34,
		pulse: Array = [], pulse_amp: float = 0.14,
		sub: Array = [], sub_amp: float = 0.18,
		shimmer: Array = [], shimmer_amp: float = 0.07) -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * total))
	for s: Array in sub:
		var sws: float = lerpf(0.85, 1.1, clampf(float(s[0]) / total, 0.0, 1.0))
		_string_note(out, s[0], s[1], s[2], sub_amp * sws, 0.2, 0.1, 0.2)
	for c: Array in chords:
		var swell: float = lerpf(0.85, 1.1, clampf(float(c[0]) / total, 0.0, 1.0))
		for f: float in c[2]:
			_string_note(out, c[0], c[1], f, chord_amp * swell, 0.16, 0.24)
	for p: Array in pulse:
		var swp: float = lerpf(0.85, 1.1, clampf(float(p[0]) / total, 0.0, 1.0))
		_string_note(out, p[0], p[1], p[2], pulse_amp * swp, 0.02, 0.34, 0.05)
	for sh: Array in shimmer:
		var swh: float = lerpf(0.9, 1.15, clampf(float(sh[0]) / total, 0.0, 1.0))
		_string_note(out, sh[0], sh[1], sh[2], shimmer_amp * swh, 0.05, 0.55, 0.12)
	for m: Array in melody:
		var swell2: float = lerpf(0.9, 1.12, clampf(float(m[0]) / total, 0.0, 1.0))
		_string_note(out, m[0], m[1], m[2], lead_amp * swell2, 0.045, 0.44, 0.08)
	return _make_stream(out, false)










static func _anthem_champions() -> AudioStreamWAV:

	var prog: Array = [
		[0.0, 0.7, 98.0, [196.0, 246.94, 293.66]],
		[0.7, 0.7, 146.83, [220.0, 293.66, 369.99]],
		[1.4, 0.7, 82.41, [164.81, 246.94, 329.63]],
		[2.1, 0.7, 130.81, [196.0, 261.63, 329.63]],
		[2.8, 0.7, 98.0, [196.0, 246.94, 293.66]],
		[3.5, 0.7, 146.83, [220.0, 293.66, 369.99]],
		[4.2, 0.35, 130.81, [196.0, 261.63, 329.63]],
		[4.55, 0.35, 146.83, [220.0, 293.66, 369.99]],
		[4.9, 0.7, 98.0, [196.0, 293.66, 392.0, 493.88]],
	]
	var chords: Array = []
	for r: Array in prog:
		chords.append([r[0], r[1], r[3]])


	var sub: Array = []
	for r: Array in prog:
		sub.append([r[0], float(r[1]) + 0.06, float(r[2]) * 0.5])


	var pulse: Array = []
	var t: float = 0.0
	while t < 4.88:
		var bass: float = 98.0
		for r: Array in prog:
			if t >= float(r[0]) - 0.001:
				bass = r[2]
		pulse.append([t, 0.16, bass])
		t += 0.3
	pulse.append([4.9, 0.32, 98.0])

	var melody: Array = [
		[0.1, 0.28, 587.33],
		[0.45, 0.22, 587.33],
		[0.7, 0.34, 659.25],
		[1.1, 0.26, 587.33],
		[1.4, 0.34, 493.88],
		[1.78, 0.28, 659.25],
		[2.1, 0.4, 783.99],
		[2.55, 0.22, 659.25],
		[2.8, 0.34, 587.33],
		[3.18, 0.28, 493.88],
		[3.5, 0.4, 587.33],
		[3.95, 0.22, 739.99],
		[4.2, 0.3, 783.99],
		[4.55, 0.3, 880.0],
		[4.9, 0.7, 987.77],
	]


	var shimmer: Array = [
		[0.7, 0.34, 1318.51],
		[2.1, 0.4, 1567.98],
		[3.5, 0.4, 1174.66],
		[4.9, 0.7, 1975.53],
	]
	return _anthem_strings(chords, melody, 5.6, 0.185, 0.4, pulse, 0.19,
		sub, 0.2, shimmer, 0.07)





static func _anthem_europa() -> AudioStreamWAV:
	return _anthem([
		[0.0, 1.2, [261.63, 329.63, 392.0]],
		[1.15, 1.2, [349.23, 440.0, 523.25]],
		[2.3, 1.0, [392.0, 493.88, 587.33]],
		[3.25, 1.35, [261.63, 392.0, 523.25]],
	], [
		[0.15, 0.48, 523.25],
		[0.68, 0.45, 659.25],
		[1.2, 1.0, 783.99],
		[2.35, 0.42, 880.0],
		[2.8, 0.42, 783.99],
		[3.3, 1.25, 1046.5],
	], 4.7)






static func _anthem_conference() -> AudioStreamWAV:
	return _anthem([
		[0.0, 1.2, [220.0, 261.63, 329.63]],
		[1.15, 1.2, [174.61, 220.0, 261.63]],
		[2.3, 1.1, [196.0, 246.94, 293.66]],
		[3.35, 1.3, [220.0, 261.63, 440.0]],
	], [
		[0.18, 0.5, 440.0],
		[0.72, 0.42, 523.25],
		[1.2, 0.95, 440.0],
		[2.35, 0.45, 493.88],
		[2.85, 0.45, 587.33],
		[3.4, 1.2, 523.25],
	], 4.8)






static func _anthem_mundial() -> AudioStreamWAV:
	return _anthem([
		[0.0, 1.5, [174.61, 220.0, 261.63]],
		[1.45, 1.45, [233.08, 293.66, 349.23]],
		[2.85, 1.2, [261.63, 329.63, 392.0]],
		[4.0, 1.7, [174.61, 261.63, 349.23]],
	], [
		[0.2, 0.55, 349.23],
		[0.8, 0.55, 440.0],
		[1.5, 1.15, 523.25],
		[2.9, 0.5, 523.25],
		[3.42, 0.5, 587.33],
		[4.05, 1.6, 698.46],
	], 5.8, 0.12, 0.2)











static func _trueno_bombo() -> AudioStreamWAV:
	var n: int = int(RATE * 0.75)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4401
	var ph: float = 0.0
	var lp: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var f: float = lerpf(78.0, 44.0, minf(t / 0.22, 1.0))
		ph += TAU * f / float(RATE)
		var cuerpo: float = sin(ph) * exp(- t * 5.5)


		var parche: float = sin(ph * 1.58) * exp(- t * 18.0) * 0.35
		lp += 0.35 *(rng.randf_range(-1.0, 1.0) - lp)
		var maza: float = lp * exp(- t * 90.0) * 0.9
		out[i] =(cuerpo + parche) * 0.9 + maza
	_normalize(out, 0.85)
	return _make_stream(out, false)





static func _palma(out: PackedFloat32Array, t0: float, amp: float,
		rng: RandomNumberGenerator, brillo: float = 0.55) -> void:
	var start: int = int(t0 * RATE)
	var count: int = int(0.03 * RATE)
	var lp: float = 0.0
	var prev: float = 0.0
	for i in count:
		var idx: int = start + i
		if idx < 0 or idx >= out.size():
			continue
		var t: float = float(i) / float(RATE)
		lp += brillo *(rng.randf_range(-1.0, 1.0) - lp)
		var banda: float = lp - prev
		prev = lp
		out[idx] += banda * exp(- t * 160.0) * amp










static func _trueno_huh() -> AudioStreamWAV:
	var n: int = int(RATE * 1.0)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4402
	for _k in 160:
		_palma(out, rng.randf_range(0.0, 0.035), rng.randf_range(0.4, 1.0) * 0.05, rng)
	var t_huh: float = 0.045
	var src: PackedFloat32Array = PackedFloat32Array()
	src.resize(n)
	for _v in 24:
		var f0: float = rng.randf_range(95.0, 170.0)
		var start: int = int((t_huh + rng.randf_range(0.0, 0.04)) * RATE)
		var ph: float = rng.randf()
		for i in range(start, mini(n, start + int(0.55 * RATE))):
			var t: float = float(i - start) / float(RATE)
			ph += f0 *(1.0 - 0.12 * minf(t / 0.4, 1.0)) / float(RATE)
			if ph >= 1.0:
				ph -= 1.0
			var env: float = minf(t / 0.025, 1.0) * exp(- maxf(t - 0.08, 0.0) * 7.0)
			src[i] +=((1.0 - ph) * 2.0 - 1.0) * env


	var c1: float = 2.0 * sin(PI * 640.0 / float(RATE))
	var c2: float = 2.0 * sin(PI * 1190.0 / float(RATE))
	var q: float = 0.12
	var l1: float = 0.0
	var b1: float = 0.0
	var l2: float = 0.0
	var b2: float = 0.0
	var ph_sub: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)
		var aire: float = 0.0
		if t >= t_huh:
			var th: float = t - t_huh
			aire = rng.randf_range(-1.0, 1.0) * minf(th / 0.02, 1.0) \
					* exp(- maxf(th - 0.06, 0.0) * 8.0) * 2.2
		var x: float = src[i] + aire
		var h1: float = x - l1 - q * b1
		b1 += c1 * h1
		l1 += c1 * b1
		var h2: float = x - l2 - q * b2
		b2 += c2 * h2
		l2 += c2 * b2
		out[i] +=(b1 * 0.03 + b2 * 0.012)
		if t >= t_huh:
			var ts: float = t - t_huh
			ph_sub += TAU * lerpf(56.0, 40.0, minf(ts / 0.25, 1.0)) / float(RATE)
			out[i] += sin(ph_sub) * exp(- ts * 7.0) * 0.45
	_normalize(out, 0.9)
	return _make_stream(out, false)






static func _trueno_suelto() -> AudioStreamWAV:
	var n: int = int(RATE * 0.8)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4403
	for _k in 46:

		var t0: float = pow(rng.randf(), 1.6) * 0.55
		_palma(out, t0, rng.randf_range(0.3, 1.0) * 0.06, rng, rng.randf_range(0.4, 0.7))
	_normalize(out, 0.55)
	return _make_stream(out, false)








static func _himno_nacional() -> AudioStreamWAV:
	var b: float = 0.625

	var acordes: Array = [
		[0, 2, [233.08, 293.66, 349.23], 116.54],
		[2, 2, [293.66, 349.23, 466.16], 116.54],
		[4, 2, [196.0, 233.08, 293.66], 98.0],
		[6, 2, [174.61, 220.0, 261.63], 87.31],
		[8, 2, [233.08, 293.66, 349.23], 116.54],
		[10, 2, [293.66, 349.23, 440.0], 146.83],
		[12, 2, [311.13, 392.0, 466.16], 77.78],
		[14, 2, [349.23, 440.0, 523.25], 87.31],
		[16, 2, [233.08, 293.66, 349.23], 116.54],
		[18, 2, [174.61, 233.08, 293.66], 87.31],
		[20, 2, [311.13, 392.0, 466.16], 77.78],
		[22, 2, [261.63, 311.13, 392.0], 130.81],
		[24, 2, [174.61, 220.0, 261.63], 87.31],
		[26, 2, [174.61, 220.0, 311.13], 87.31],
		[28, 4, [233.08, 293.66, 349.23, 466.16], 58.27],
	]

	var tema: Array = [
		[0, 1, 349.23], [1, 1.5, 466.16], [2.5, 0.5, 523.25], [3, 1, 587.33],
		[4, 1.5, 587.33], [5.5, 0.5, 523.25], [6, 1, 466.16], [7, 1, 523.25],
		[8, 2, 587.33], [10, 2, 349.23],
		[12, 1, 392.0], [13, 1, 440.0], [14, 1, 466.16], [15, 1, 523.25],
		[16, 1.5, 587.33], [17.5, 0.5, 622.25], [18, 2, 698.46],
		[20, 1, 622.25], [21, 1, 587.33], [22, 1, 523.25], [23, 1, 466.16],
		[24, 1.5, 523.25], [25.5, 0.5, 587.33], [26, 1, 523.25], [27, 1, 349.23],
		[28, 3.6, 466.16],
	]
	var total: float = 32.0 * b + 0.6
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * total))
	for a: Array in acordes:
		var t0: float = float(a[0]) * b
		var dur: float = float(a[1]) * b + 0.05
		for f: float in a[2]:
			_pad_note(out, t0, dur, f, 0.1, 0.2)
		_pad_note(out, t0, dur, float(a[3]), 0.13, 0.12)
	for m: Array in tema:
		_pad_note(out, float(m[0]) * b, float(m[1]) * b, float(m[2]), 0.19, 0.06)
	_normalize(out, 0.6)
	return _make_stream(out, false)





static func _himno_risa() -> AudioStreamWAV:
	var n: int = int(RATE * 0.85)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4404

	var c: float = 2.0 * sin(PI * 300.0 / float(RATE))
	var l: float = 0.0
	var bp: float = 0.0
	for i in int(0.13 * RATE):
		var t: float = float(i) / float(RATE)
		var x: float = rng.randf_range(-1.0, 1.0)
		var h: float = x - l - 0.25 * bp
		bp += c * h
		l += c * bp
		out[i] += bp * minf(t / 0.01, 1.0) * exp(- t * 22.0) * 0.5
	for k in 3:
		_ja(out, 0.17 + 0.16 * k, 0.12, 290.0 - 32.0 * k, rng)
	_normalize(out, 0.7)
	return _make_stream(out, false)









static func _himno_equivocado() -> AudioStreamWAV:
	var corte: float = 2.0
	var rayado: float = 0.35
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE *(corte + rayado + 0.1)))


	var notas: Array = [
		[0.0, 0.9, 87.31, 0.3], [0.75, 0.3, 130.81, 0.24],
		[1.0, 0.9, 98.0, 0.3], [1.75, 0.3, 146.83, 0.24],
		[0.0, 0.6, 220.0, 0.08], [0.0, 0.6, 261.63, 0.08], [0.0, 0.6, 329.63, 0.08],
		[0.75, 0.3, 220.0, 0.06], [0.75, 0.3, 261.63, 0.06], [0.75, 0.3, 329.63, 0.06],
		[1.0, 0.6, 233.08, 0.08], [1.0, 0.6, 293.66, 0.08], [1.0, 0.6, 349.23, 0.08],
		[1.5, 0.3, 233.08, 0.06], [1.5, 0.3, 293.66, 0.06], [1.5, 0.3, 349.23, 0.06],
		[0.0, 0.35, 659.25, 0.22], [0.375, 0.15, 587.33, 0.18], [0.5, 0.35, 523.25, 0.22],
		[0.875, 0.15, 440.0, 0.18], [1.0, 0.45, 587.33, 0.22], [1.5, 0.2, 698.46, 0.2],
		[1.75, 0.6, 659.25, 0.22],
	]
	for nt: Array in notas:
		_vibrafono(out, float(nt[0]), float(nt[1]), float(nt[2]), float(nt[3]), corte)

	var a_hp: float = exp(- TAU * 350.0 / float(RATE))
	var a_lp: float = 1.0 - exp(- TAU * 2800.0 / float(RATE))
	var x_ant: float = 0.0
	var hp: float = 0.0
	var lp: float = 0.0
	for i in int(corte * RATE):
		hp = a_hp *(hp + out[i] - x_ant)
		x_ant = out[i]
		lp += a_lp *(hp - lp)
		out[i] = lp

	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 4405
	for p: Array in [[corte, 0.15, 820.0, 160.0], [corte + 0.17, 0.16, 210.0, 980.0]]:
		var s0: int = int(float(p[0]) * RATE)
		var cuenta: int = int(float(p[1]) * RATE)
		var ph: float = 0.0
		var ruido: float = 0.0
		for i in cuenta:
			var idx: int = s0 + i
			if idx >= out.size():
				break
			var k: float = float(i) / float(cuenta)
			ph = fmod(ph + float(p[2]) * pow(float(p[3]) / float(p[2]), k) / float(RATE), 1.0)
			ruido += 0.35 *(rng.randf_range(-1.0, 1.0) - ruido)
			out[idx] +=((ph * 2.0 - 1.0) * 0.55 + ruido * 0.6) * sin(PI * pow(k, 0.7)) * 0.5
	_normalize(out, 0.6)
	return _make_stream(out, false)




static func _vibrafono(out: PackedFloat32Array, t0: float, dur: float, f: float,
		amp: float, corte: float) -> void:
	var s0: int = int(t0 * RATE)
	var fin: int = mini(int(minf(t0 + dur, corte) * RATE), out.size())
	for idx in range(s0, fin):
		var t: float = float(idx - s0) / float(RATE)
		var v: float = sin(TAU * f * t) + 0.25 * sin(TAU * 4.0 * f * t) * exp(- t * 9.0)
		var env: float = minf(t / 0.005, 1.0) * exp(- t * 3.0) *(1.0 + 0.3 * sin(TAU * 5.5 * t))
		out[idx] += v * env * amp





static func _obturador() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.22))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 1812

	for g: Array in [[0.0, 0.05, 3200.0, 1.0, 2400.0], [0.085, 0.04, 5200.0, 0.7, 3100.0]]:
		var s0: int = int(float(g[0]) * RATE)
		var cuenta: int = int(float(g[1]) * RATE)
		var a_lp: float = 1.0 - exp(- TAU * float(g[2]) / float(RATE))
		var lp: float = 0.0
		for i in cuenta:
			var idx: int = s0 + i
			if idx >= out.size():
				break
			var tt: float = float(i) / float(RATE)
			lp += a_lp *(rng.randf_range(-1.0, 1.0) - lp)
			var env: float = minf(tt / 0.002, 1.0) * exp(- tt * 70.0)
			var tic: float = sin(TAU * float(g[4]) * tt) * exp(- tt * 160.0) * 0.5
			out[idx] +=(lp + tic) * env * float(g[3])
	_normalize(out, 0.55)
	return _make_stream(out, false)





static func _reflex_enfoque() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.19))
	for t0: float in [0.0, 0.115]:
		var s0: int = int(t0 * RATE)
		var cuenta: int = int(0.06 * RATE)
		for i in cuenta:
			var idx: int = s0 + i
			if idx >= out.size():
				break
			var tt: float = float(i) / float(RATE)
			var env: float = minf(tt / 0.002, 1.0) * minf((0.06 - tt) / 0.008, 1.0)
			out[idx] +=(sin(TAU * 2850.0 * tt) + 0.3 * sin(TAU * 8550.0 * tt)) * env
	_normalize(out, 0.45)
	return _make_stream(out, false)






static func _reflex_disparo() -> AudioStreamWAV:
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(int(RATE * 0.26))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = 2207

	for g: Array in [[0.0, 140.0, 1500.0, 1.0, 3500.0], [0.075, 185.0, 2600.0, 0.7, 4300.0]]:
		var s0: int = int(float(g[0]) * RATE)
		var a_lp: float = 1.0 - exp(- TAU * float(g[2]) / float(RATE))
		var lp: float = 0.0
		for i in int(0.12 * RATE):
			var idx: int = s0 + i
			if idx >= out.size():
				break
			var tt: float = float(i) / float(RATE)
			lp += a_lp *(rng.randf_range(-1.0, 1.0) - lp)
			var golpe: float = sin(TAU * float(g[1]) * tt) * exp(- tt * 38.0) * 0.8
			var ruido: float = lp * exp(- tt * 55.0) * 1.4
			var tic: float =(sin(TAU * float(g[4]) * tt) * 0.5 + rng.randf_range(-0.5, 0.5)) \
					* exp(- tt * 260.0)
			out[idx] +=(golpe + ruido + tic) * minf(tt / 0.0015, 1.0) * float(g[3])
	_normalize(out, 0.6)
	return _make_stream(out, false)





static func _flash_carga() -> AudioStreamWAV:
	var dura: float = 1.3
	var n: int = int(RATE * dura)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph: float = 0.0
	for i in n:
		var k: float = float(i) / float(n)
		ph += 1500.0 * pow(6500.0 / 1500.0, pow(k, 0.7)) / float(RATE)
		ph -= floorf(ph)
		var env: float = minf(k * dura / 0.05, 1.0) * minf((1.0 - k) * dura / 0.3, 1.0)
		out[i] =(sin(TAU * ph) + 0.15 * sin(TAU * 2.0 * ph)) * env
	_normalize(out, 0.3)
	return _make_stream(out, false)








const FOTOGRAFO_F0: float = 152.0
const FOTOGRAFO_VOCAL: Array = [[800.0, 1250.0], [480.0, 1900.0], [320.0, 2300.0],
	[520.0, 900.0], [340.0, 800.0]]


static func _fotografo_silaba(vocal: int, cuenta: bool) -> AudioStreamWAV:
	var fr: Array = FOTOGRAFO_VOCAL[clampi(vocal, 0, FOTOGRAFO_VOCAL.size() - 1)]
	var dur: float = 0.34 if cuenta else 0.13 + 0.015 * float(vocal % 3)
	var n: int = int(RATE * dur)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var rn: RandomNumberGenerator = RandomNumberGenerator.new()
	rn.seed = 900 + vocal +(50 if cuenta else 0)
	var c1: float = 2.0 * sin(PI * float(fr[0]) / float(RATE))
	var c2: float = 2.0 * sin(PI * float(fr[1]) / float(RATE))
	var c3: float = 2.0 * sin(PI * 2700.0 / float(RATE))
	var q: float = 0.1
	var l1: float = 0.0
	var b1: float = 0.0
	var l2: float = 0.0
	var b2: float = 0.0
	var l3: float = 0.0
	var b3: float = 0.0
	var phase: float = 0.0
	var consonante: int = int(0.006 * RATE)
	for i in n:
		var t: float = float(i) / float(RATE)
		var k: float = t / dur
		var f0: float = FOTOGRAFO_F0 *((1.12 - 0.3 * k) if cuenta else (1.0 + 0.08 * sin(PI * k)))
		phase += f0 / float(RATE)
		if phase >= 1.0:
			phase -= 1.0
		var src: float =(1.0 - phase) * 2.0 - 1.0 + rn.randf_range(-1.0, 1.0) * 0.06
		var h1: float = src - l1 - q * b1
		b1 += c1 * h1
		l1 += c1 * b1
		var h2: float = src - l2 - q * b2
		b2 += c2 * h2
		l2 += c2 * b2
		var h3: float = src - l3 - 0.2 * b3
		b3 += c3 * h3
		l3 += c3 * b3
		var env: float = sin(PI * pow(k, 0.55 if cuenta else 0.72))
		out[i] =(b1 * 0.85 + b2 * 0.35 + b3 * 0.08) * env
		if i < consonante:
			out[i] += rn.randf_range(-1.0, 1.0) * 0.5 *(1.0 - float(i) / float(consonante))
	_normalize(out, 0.72)
	return _make_stream(out, false)




static func _ja(out: PackedFloat32Array, t0: float, dur: float, f0: float,
		rng: RandomNumberGenerator) -> void:
	var start: int = int(t0 * RATE)
	var count: int = int(dur * RATE)
	var c1: float = 2.0 * sin(PI * 800.0 / float(RATE))
	var c2: float = 2.0 * sin(PI * 1250.0 / float(RATE))
	var l1: float = 0.0
	var b1: float = 0.0
	var l2: float = 0.0
	var b2: float = 0.0
	var ph: float = 0.0
	for i in count:
		var idx: int = start + i
		if idx < 0 or idx >= out.size():
			continue
		var k: float = float(i) / float(count)
		ph += f0 *(1.0 - 0.15 * k) / float(RATE)
		if ph >= 1.0:
			ph -= 1.0
		var x: float =((1.0 - ph) * 2.0 - 1.0) * 0.7 + rng.randf_range(-1.0, 1.0) * 0.45
		var h1: float = x - l1 - 0.12 * b1
		b1 += c1 * h1
		l1 += c1 * b1
		var h2: float = x - l2 - 0.12 * b2
		b2 += c2 * h2
		l2 += c2 * b2
		out[idx] +=(b1 * 0.8 + b2 * 0.35) * sin(PI * pow(k, 0.6)) * 0.12







static func _flashback_pitido() -> AudioStreamWAV:
	var dura: float = 4.6
	var n: int = int(RATE * dura)
	var out: PackedFloat32Array = PackedFloat32Array()
	out.resize(n)
	var ph_g: float = 0.0
	var ph_p: float = 0.0
	for i in n:
		var t: float = float(i) / float(RATE)

		var f_g: float = lerpf(70.0, 42.0, minf(t / 0.5, 1.0))
		ph_g += TAU * f_g / float(RATE)
		var golpe: float = sin(ph_g) * minf(t / 0.01, 1.0) * exp(- t * 5.5)

		var f_p: float = 4200.0 + 18.0 * sin(TAU * 5.0 * t)
		ph_p += TAU * f_p / float(RATE)
		var env: float = clampf((t - 0.15) / 0.4, 0.0, 1.0) * clampf((dura - t) / 3.4, 0.0, 1.0)
		out[i] = golpe * 0.9 + sin(ph_p) * env * 0.16
	_normalize(out, 0.7)
	return _make_stream(out, false)
