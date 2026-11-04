extends Ceremony



























const ATT: float = 1.0



const BANDA_X: float = 35.6
const Z_SALE: float = Stadium.HALF_LINE - 5.5


const FILA_DZ: float = 1.25
const FILA_DX: float = -0.22



const FILA_N: int = 6
const PORTADORES: int = 4


const V: float = 1.0
const T_ANDA0: float = 0.5


const TRAMOS: Array[float] = [2.0, 1.5, 1.5]


const PASE: float = 0.5
const SOSTIENE: float = 0.4
const BAJA: float = 0.35
const T_CHYRON: float = 1.0

const CARD_TRAS: float = 1.5

const DRIFT: float = -0.5

var _award: String = ""
var _cfg: Dictionary = {}
var _vet: Dictionary = {}

var _fila: Array[AnimatedSprite3D] = []
var _llevadas: Array[CopaLlevada] = []

var _palmas_reposo: Dictionary = {}


var _pases: Array[float] = []
var _andas: Array = []
var _t_final: float = 0.0

var _alzadas: Dictionary = {}
var _cierre: bool = false

var _destino: Dictionary = {}



func _accent_for() -> Color:
	_cfg = Ceremonies.trophy_cfg(String(data.get("award", "Campeón de Liga")))
	var comp: String = String(_cfg.get("comp", "liga"))
	if comp == "liga":
		return CareerTheme.accent_of(team())
	return Competitions.COMP_ACCENT.get(comp, CareerTheme.MONEY)


func _alza_dur() -> float:
	return float(CopaLlevada._const().get("ALZA_DUR", 0.45))


func _build() -> void:
	_award = String(data.get("award", "Campeón de Liga"))
	_cfg = Ceremonies.trophy_cfg(_award)
	var vv: Variant = data.get("veterano", {})
	_vet = vv if vv is Dictionary and not String((vv as Dictionary).get("name", "")).is_empty() \
			else {}
	var club: Dictionary = team()
	var kit: Dictionary = GameState.kit_variant(club, 0)


	make_stadium({
		"div": div(),
		"attendance": ATT,
		"party": true,
		"weather": String(_cfg.get("weather", "sunset")),
		"kit": kit,
		"banner": I18n.t("CAMPEONES"),
		"board": board_fit(I18n.t("CAMPEONES")),
	})
	_monta_fila(club, kit)
	_plan(_llevadas.size())
	focus = _foco(0.0)
	make_camera(_keys(), 44.0)
	orbit_speed = DRIFT
	make_audio(ATT, true)
	stadium.crowd_excite(0.8)
	applause(true, -11.0)
	flash_pool = stand_flash_pool(CENTER_Z, 30.0)
	flash_rate = 9.0
	flash_burst_at = _t_final
	flash_burst_dur = 1.8
	flash_burst_mult = 5.0

	var sub: String = ""
	if not _vet.is_empty():

		sub = I18n.tf("LA ÚLTIMA DE {0}",
			[CareerUi.surname(CareerUi.display_name(String(_vet["name"]))).to_upper()])
	make_chyron(I18n.t("VUELTA DE HONOR"), String(club.get("name", "?")).to_upper(), club,
		T_CHYRON, "", sub)
	make_card(_t_final + _alza_dur() + CARD_TRAS)
	card_title(Competitions.demarca(I18n.t(JuegosOlimpicos.pinta(_award))).to_upper(), 40)
	card_sub(I18n.t("LA VUELTA DE HONOR")).add_theme_color_override("font_color", accent)
	card_club(club)
	if not _vet.is_empty():
		card_note(I18n.tf("{0} cuelga las botas este verano. La última vuelta fue suya.",
			[CareerUi.display_name(String(_vet["name"]))]))
	card_cta(I18n.t("SEGUIR"))




func _monta_fila(club: Dictionary, kit: Dictionary) -> void:
	var club_id: String = String(club.get("id", ""))
	var mine: bool = club_id == String(vivo_de("club", GameState.player_team_id))

	var yo_capi: bool = not mine or bool(data.get("yo_capi", Career.is_captain))
	var vet_nm: String = String(_vet.get("name", ""))
	var gente: Array = squad_people(club_id, FILA_N + 6, mine, vet_nm)
	var capi: AnimatedSprite3D = null
	var nm: String = Squad.captain_name(club_id)


	if not vet_nm.is_empty() and nm == vet_nm:
		yo_capi = true
	if not yo_capi and not gente.is_empty():
		var capi_p: Dictionary = gente[0]
		for p in gente:
			if not nm.is_empty() and String((p as Dictionary).get("name", "")) == nm:
				capi_p = p
				break
		gente.erase(capi_p)
		capi = _actor(people_frames_pool([capi_p], kit)[0], kit)
	if capi == null:
		yo_capi = true

	var huecos: int = PORTADORES - 1 -(0 if yo_capi else 1) -(0 if _vet.is_empty() else 1)
	var mano: Array[AnimatedSprite3D] = []
	for f in people_frames_pool(gente.slice(0, huecos), kit):
		mano.append(_actor(f, kit))
	var vet_spr: AnimatedSprite3D = null
	if not _vet.is_empty():
		vet_spr = _actor(people_frames_pool([_vet], kit)[0], kit)

	var cola: Array[AnimatedSprite3D] = []
	for f in people_frames_pool(gente.slice(huecos, huecos + FILA_N - PORTADORES), kit,
			"south", CLAP_SHEET):
		var s: AnimatedSprite3D = _actor(f, kit, CLAP_SHEET)
		_palmas_reposo[s] = true
		cola.append(s)
	var look: Dictionary = GameState.team_custom.duplicate()
	look.merge(kit, true)
	look["number"] = shirt()
	make_player(look, "south")
	add_walk(player, look)
	_palmas(player)

	if yo_capi:
		_fila.append(player)
	else:
		_fila.append(capi)
		_fila.append(player)
	_fila.append_array(mano)
	if vet_spr != null:
		_fila.append(vet_spr)
	var tipo: String = String((Ceremonies.TROPHIES.get(_award, {}) as Dictionary).get("icon", "liga"))
	for i in mini(PORTADORES, _fila.size()):
		var ll: CopaLlevada = CopaLlevada.monta(self, _fila[i], tipo)
		if ll == null:
			break
		_llevadas.append(ll)
	_fila.append_array(cola)
	_coloca(0.0)


func _actor(frames: SpriteFrames, kit: Dictionary, hoja: String = "") -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.sprite_frames = frames
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	var y: float = feet_offset(s.pixel_size, hoja + "00.png") if not hoja.is_empty() \
			else feet_offset(s.pixel_size)
	s.position = Vector3(BANDA_X, y - PLAYER_SINK, Z_SALE)
	viewport.add_child(s)
	s.play("idle")
	s.speed_scale = rng.randf_range(0.9, 1.15)



	add_walk(s, frames.get_meta("look_cfg", kit), 2, true)
	if hoja.is_empty():
		_palmas(s)
	return s







func _palmas(spr: AnimatedSprite3D) -> void:
	var frames: SpriteFrames = spr.sprite_frames
	if frames.has_animation("clap") or not frames.has_meta("look_cfg"):
		return
	var cfg: Dictionary = frames.get_meta("look_cfg", {})
	frames.add_animation("clap")
	frames.set_animation_loop("clap", true)
	frames.set_animation_speed("clap", 4.5)
	var rutas: Array = []
	for i in 4:
		var path: String = "%s%02d.png" % [CLAP_SHEET, i]
		if ResourceLoader.exists(path):
			frames.add_frame("clap", KitRecolor.apply(load(path), cfg))
			rutas.append(path)
	if frames.get_frame_count("clap") == 0:
		frames.remove_animation("clap")
		return
	espalda_registra(spr, "clap", CLAP_SHEET, 0)
	if frames.has_meta("cara_fuentes"):
		var fuentes: Dictionary =(frames.get_meta("cara_fuentes") as Dictionary).duplicate()
		fuentes["clap"] = rutas
		frames.set_meta("cara_fuentes", fuentes)




func _plan(k: int) -> void:
	_pases = [-1.0]
	_andas = []
	var tt: float = T_ANDA0
	for j in maxi(k, 1):
		if j > 0:
			_pases.append(tt)
			if j == k - 1:
				break
			tt += PASE + _alza_dur() + SOSTIENE + BAJA
		var tramo: float = TRAMOS[mini(j, TRAMOS.size() - 1)]
		_andas.append([tt, tt + tramo])
		tt += tramo
	_t_final = _pases[k - 1] + PASE if k > 1 else tt




func _t_alza(j: int) -> float:
	return _pases[j] + PASE


func _t_baja(j: int) -> float:
	return _t_alza(j) + _alza_dur() + SOSTIENE


func _t_anda(j: int) -> float:
	return _t_baja(j) + BAJA



func _andado(tt: float) -> float:
	var s: float = 0.0
	for a in _andas:
		s += clampf(tt - float(a[0]), 0.0, float(a[1]) - float(a[0]))
	return s


func _andando(tt: float) -> bool:
	for a in _andas:
		if tt >= float(a[0]) and tt < float(a[1]):
			return true
	return false




func _portador(tt: float) -> int:
	var j: int = 0
	for i in range(1, _llevadas.size()):
		if tt >= _t_alza(i):
			j = i
	return j


func _puesto(i: int, tt: float) -> Vector3:
	return Vector3(BANDA_X + FILA_DX * float(i), 0.0,
		Z_SALE + V * _andado(tt) - FILA_DZ * float(i))


func _coloca(tt: float) -> void:
	for i in _fila.size():
		var s: AnimatedSprite3D = _fila[i]
		var p: Vector3 = _puesto(i, tt)
		s.position.x = p.x
		s.position.z = p.z




func _foco(tt: float) -> Vector3:
	var jf: float = 0.0
	for j in range(1, _llevadas.size()):
		jf += smoothstep(_pases[j], _t_alza(j) + 0.5, tt)
	return Vector3(BANDA_X + FILA_DX * jf, 0.0, Z_SALE + V * _andado(tt) - FILA_DZ * jf)






func _keys() -> Array:
	return [
		{"t": 0.0, "dist": 24.0, "h": 6.0, "yaw": 242.0, "aim_y": 3.8, "fov": 44.0},
		{"t": 2.4, "dist": 10.0, "h": 2.4, "yaw": 248.0, "aim_y": 1.5, "fov": 40.0},
		{"t": maxf(_t_final - 0.6, 2.5), "dist": 9.5, "h": 2.2, "yaw": 251.0,
			"aim_y": 1.55, "fov": 40.0},
		{"t": maxf(_t_final + 0.5, 2.6), "dist": 8.5, "h": 1.8, "yaw": 256.0,
			"aim_y": 1.7, "fov": 38.0},
	]


func _tick(_delta: float) -> void:
	_coloca(t)
	focus = _foco(t)
	var anda: bool = _andando(t)
	var cur: int = _portador(t)
	for j in _llevadas.size():
		_copa_de(j, cur, anda)


	var alzando: bool = t >= _t_final or (cur > 0 and t >= _t_alza(cur) and t < _t_anda(cur))
	for i in _fila.size():
		if i < _llevadas.size() and i >= cur:
			continue
		var s: AnimatedSprite3D = _fila[i]
		if anda:
			walk_play(s, Vector3.BACK)
		elif _palmas_reposo.has(s) or not alzando \
				or not s.sprite_frames.has_animation("clap"):
			walk_play(s, Vector3.ZERO)
		elif s.animation != &"clap":
			s.play("clap")
	for j in range(cur + 1, _llevadas.size()):
		_espera(j, anda)
	_efectos(cur)



func _copa_de(j: int, cur: int, anda: bool) -> void:
	var ll: CopaLlevada = _llevadas[j]
	if j != cur:
		if ll.copa != null:
			ll.copa.visible = false
		if ll.manos != null:
			ll.manos.visible = false


		if j > cur and ll._vistas < CopaLlevada.MEDIR_TRAS:
			ll._lista()
		return
	var sig: int = j + 1
	if sig < _llevadas.size() and t >= _pases[sig]:

		var dest: Vector3 = _pecho_de(j, sig)
		ll.deja(dest, _llevadas[sig].escala_mano(),(t - _pases[sig]) / PASE)
		return
	if j > 0 and t < _t_baja(j) or j == _llevadas.size() - 1 and t >= _t_final:
		var desde: float = _t_final if j == _llevadas.size() - 1 and j == 0 else _t_alza(j)
		if _destino.has(j):
			ll._mano = _destino[j]
		ll.alza((t - desde) / _alza_dur())
	elif j > 0 and t < _t_anda(j):
		ll.baja((t - _t_baja(j)) / BAJA)
	else:
		ll.lleva(Vector3.BACK if anda else Vector3.ZERO)





func _pecho_de(j: int, sig: int) -> Vector3:
	if _destino.has(sig):
		return _destino[sig]
	var ll: CopaLlevada = _llevadas[j]



	ll.lleva(Vector3.ZERO)
	var desde: Vector3 = ll._mano if ll._mano != null else ll.spr.global_position
	var dest: Vector3 = _llevadas[sig].spr.global_position +(desde - ll.spr.global_position)
	_destino[sig] = dest
	return dest



func _espera(j: int, anda: bool) -> void:
	walk_play(_llevadas[j].spr, Vector3.BACK if anda else Vector3.ZERO)



func _efectos(cur: int) -> void:
	if cur > 0 and t >= _t_alza(cur) and not _alzadas.has(cur) and cur < _llevadas.size() - 1:
		_alzadas[cur] = true
		stadium.crowd_excite(0.95)
		punch_fov(1.2, 0.3)
	if t >= _t_final and not _cierre:
		_cerrar()



func _cerrar() -> void:
	_cierre = true
	stadium.crowd_react("home", "goal")
	stadium.crowd_excite(1.0)
	ovation(0.0)
	punch_fov(2.0, 0.4)
	set_confetti(true)


func _skipped() -> void:
	_tick(0.0)
	if not _cierre:
		_cerrar()
