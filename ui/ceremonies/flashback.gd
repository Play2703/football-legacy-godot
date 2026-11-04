extends Ceremony






























const DURA: float = 9.0


const BLANCO_IN: float = 0.7
const BLANCO_OUT: float = 0.8

const T_ROTULO: float = 0.6

const GOLPE_S: float = 0.18

const LOST_FPS: float = 12.0
const FALL_FPS: float = 12.0







const FALL_CUADROS: int = 4
const CLAP_FPS: float = 10.0



const SU_T_CIFRA: float = 4.4
const SU_T_FIRMA: float = 6.8




const SU_ANCLA_M: float = 22.0


const SU_T_RODILLAS: float = 1.6
const RODILLAS_S: float = 0.75
const RODILLAS_FPS: float = 8.0
const CESPED_FPS: float = 5.0




const NP_P: Vector3 = Vector3(2.5, 0.0, 9.0)
const NP_YAW: float = 164.5
const NP_T_CONTACTO: float = 3.0
const NP_T_PITIDO: float = 3.5
const NP_T_PENAL: float = 3.7
const NP_T_INCREDULO: float = 4.6
const NP_T_SELLO: float = 5.5
const NP_T_FIRMA: float = 7.0

const NP_DESLIZA_M: float = 1.0
const NP_DESLIZA_S: float = 0.45

const BALON_M: float = 0.42
const BALON_PAD_PX: float = 3.0
const BALON_Y: float = 0.21

var _id: String = ""
var _m: Dictionary = {}
var _hecho: Dictionary = {}
var _mat: ShaderMaterial = null
var _blanco: ColorRect = null
var _capa: Control = null
var _rotulo: VBoxContainer = null
var _cifra: Label = null
var _sello: PanelContainer = null
var _firma: Label = null
var _t_cifra: float = 0.0
var _t_firma: float = 0.0
var _t_sello: float = -1.0


var _caidos: Array[AnimatedSprite3D] = []
var _aplauden: Array[AnimatedSprite3D] = []
var _rodillas: AnimatedSprite3D = null
var _rod_de: Vector3 = Vector3.ZERO
var _rod_a: Vector3 = Vector3.ZERO
var _corre: AnimatedSprite3D = null
var _corre_de: Vector3 = Vector3.ZERO
var _corre_a: Vector3 = Vector3.ZERO
var _eje: Vector3 = Vector3(0.0, 0.0, 1.0)


var _cae: AnimatedSprite3D = null
var _defensa: AnimatedSprite3D = null
var _arbitro: AnimatedSprite3D = null
var _balon: AnimatedSprite3D = null
var _cae_de: Vector3 = Vector3.ZERO
var _def_de: Vector3 = Vector3.ZERO
var _def_a: Vector3 = Vector3.ZERO
var _arb_de: Vector3 = Vector3.ZERO
var _arb_a: Vector3 = Vector3.ZERO
var _np_eje: Vector3 = Vector3(0.0, 0.0, 1.0)


func _accent_for() -> Color:

	return CareerTheme.DANGER


func _cues_del_acto() -> PackedStringArray:
	return PackedStringArray(["flashback_pitido", "whistle", "crowd_boo", "crowd_ooh",
		"crowd_roar", "stinger_bad", "kick", "net_swish", "post_hit"])





func _consume() -> Dictionary:
	var fx: Dictionary = GameState.current_fixture()
	var id: String = Flashback.sale(String(fx.get("comp", "")) == "nat", Career.nationality,
		String(fx.get("opp", "")), Career.flashbacks_vistos, GameState.player_team_id)
	if id.is_empty():
		return {}
	return {
		"kind": Ceremonies.FLASHBACK,
		"momento": id,
		"nation": Career.nationality,
		"opp": String(fx.get("opp", "")),
		"club": GameState.player_team_id,
		"season": GameState.season_num,
		"div": 1,
	}





func _ready() -> void:
	await super._ready()
	if data.is_empty() and not _leaving:
		SceneFade.to_scene(_destino())
		return
	if not data.is_empty() and not _leaving and not standalone and not replay:
		SceneFade.calienta_partido_en_acto()




func _estadio_previo() -> Dictionary:
	return _cfg_estadio()


func _cfg_estadio() -> Dictionary:
	var m: Dictionary = Flashback.de(String(data.get("momento", "")))
	return {
		"div": 1,
		"attendance": 1.0,
		"party": false,
		"home_only": true,
		"weather": String(m.get("weather", "day")),
		"kit": m.get("kit_a", {}),
		"board": board_fit(Flashback.tablero(m)),
	}


func _build() -> void:

	card_at = 0.0
	_id = String(data.get("momento", ""))
	_m = Flashback.de(_id)
	if _m.is_empty():
		call_deferred("_leave")
		return


	_sella()
	make_stadium(_cfg_estadio())
	match _id:
		Flashback.SIETE_UNO:
			_monta_siete_uno()
		Flashback.NO_ERA_PENAL:
			_monta_no_era_penal()
		Flashback.LA_MANO:
			_monta_la_mano()
		Flashback.GOL_FANTASMA:
			_monta_gol_fantasma()
		Flashback.MANO_EN_LA_LINEA:
			_monta_mano_en_la_linea()
		Flashback.PENAL_AL_CIELO:
			_monta_penal_al_cielo()
		Flashback.MINUTO_116:
			_monta_minuto_116()
		Flashback.RESBALON:
			_monta_resbalon()
		Flashback.ESTAMBUL:
			_monta_estambul()
		Flashback.REMONTADA:
			_monta_remontada()
		Flashback.NOVENTA_Y_DOS:
			_monta_noventa_y_dos()
		Flashback.CORNER_RAPIDO:
			_monta_corner_rapido()
		Flashback.FINAL_EN_SU_CASA:
			_monta_final_en_su_casa()
		Flashback.NOCHE_DE_LONDRES:
			_monta_noche_de_londres()
		Flashback.PORTERO_CABECEA:
			_monta_portero_cabecea()
		Flashback.FINAL_EN_MADRID:
			_monta_final_en_madrid()
		_:

			_monta_guion()
	make_audio(0.4, false)
	_filtro()
	_monta_textos()
	sting("flashback_pitido", -4.0)









func _build_skip() -> void:
	pass


func _sella() -> void:
	if not replay and not standalone:
		Career.marca_flashback(String(data.get("momento", "")))








const FILTRO: String = "\nshader_type canvas_item;\nuniform float fuerza = 1.0;\nuniform vec3 tono = vec3(1.0, 0.84, 0.6);\nfloat azar(vec2 p) { return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453); }\nvoid fragment() {\n\tvec2 uv = UV;\n\tuv.x += sin(uv.y * 18.0 + TIME * 2.3) * 0.0025 * fuerza;\n\tvec4 c = texture(TEXTURE, uv);\n\tfloat l = dot(c.rgb, vec3(0.299, 0.587, 0.114));\n\tvec3 col = mix(c.rgb, vec3(l) * tono, 0.88 * fuerza);\n\tvec2 celda = floor(UV / max(TEXTURE_PIXEL_SIZE, vec2(0.0001)) * 0.5);\n\tcol += (azar(celda + fract(TIME * 7.0)) - 0.5) * 0.10 * fuerza;\n\tfloat v = smoothstep(0.82, 0.30, length((UV - 0.5) * vec2(1.0, 1.15)));\n\tcol *= mix(1.0, 0.35 + 0.65 * v, fuerza);\n\tCOLOR = vec4(col, 1.0);\n}\n"



















func _filtro() -> void:
	var sh: Shader = Shader.new()
	sh.code = FILTRO
	_mat = ShaderMaterial.new()
	_mat.shader = sh
	viewport_box.material = _mat









func _kit_de(quien: String, aquel: Dictionary) -> Dictionary:
	var base: Dictionary = {}
	var equipo: Dictionary = Teams.by_id(quien) if Flashback.es_de_club(_m) \
			else Nations.as_team(Nations.canon_id(quien))
	if not equipo.is_empty():
		base = GameState.kit_variant(equipo, 0).duplicate()
	for k in ["pattern", "kit_b", "kit2_b", "short_pat", "pat_ink", "fab_ink", "retro",
			"kit_slot", "local_trim", "pat_w"]:
		base.erase(k)
	base.merge(aquel, true)
	return base



func _actor(semilla: String, kit: Dictionary, en: Vector3) -> AnimatedSprite3D:
	var cfg: Dictionary = KitRecolor.appearance_for(semilla, kit)
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = player_frames(cfg, "south")
	_planta(spr, PLAYER_HEIGHT_M, en)
	add_idle_views(spr, cfg)
	spr.set_meta("flash_cfg", cfg)
	return spr


func _cara(spr: AnimatedSprite3D, cual: String) -> void:
	var c: CaraViva = CaraViva.pon(spr)
	if c != null:
		c.anima(cual)


func _coloca(spr: AnimatedSprite3D, en: Vector3) -> void:
	spr.position = Vector3(en.x, spr.position.y, en.z)



func _una_vez(clave: String, cuando: float) -> bool:
	if t < cuando or _hecho.has(clave):
		return false
	_hecho[clave] = true
	return true















func _monta_siete_uno() -> void:
	var marco: Dictionary = stadium.scoreboard_frame()
	var c: Vector3 = marco.get("center", Vector3(0.0, 12.0, -18.0))
	var n: Vector3 = marco.get("normal", Vector3(0.0, 0.0, 1.0))
	var yaw: float = rad_to_deg(atan2(n.x, - n.z))
	_eje = Vector3(sin(deg_to_rad(yaw)), 0.0, - cos(deg_to_rad(yaw)))

	var lat: Vector3 = Vector3(_eje.z, 0.0, - _eje.x)
	var gol: Vector3 = Vector3(c.x, 0.0, 0.0 if _eje.z > 0.0 else Stadium.FIELD_DEPTH)
	var a: Vector3 = gol + _eje * SU_ANCLA_M
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))




	var llora: AnimatedSprite3D = _actor("flash_bra_0", kit_a, a)
	_cara(llora, "llorar")
	_caidos.append(llora)
	var agachado: AnimatedSprite3D = _actor("flash_bra_1", kit_a, a - _eje * 1.4 - lat * 1.5)
	agachado.set_meta("pose", "cesped")
	_caidos.append(agachado)
	var tendido: AnimatedSprite3D = _actor("flash_bra_2", kit_a, a - _eje * 2.2 + lat * 1.6)
	add_gesto(tendido, "fall", FALL_CUADROS, FALL_FPS, tendido.get_meta("flash_cfg"))
	tendido.set_meta("pose", "fall")
	_caidos.append(tendido)
	var mira: AnimatedSprite3D = _actor("flash_bra_3", kit_a, a - _eje * 4.0 - lat * 3.0)
	mira.set_meta("pose", "espaldas")
	_caidos.append(mira)
	_gesto_suelto(agachado, "cesped", 4, CESPED_FPS, true)



	_rod_de = a - _eje * 15.0 + lat * 1.3
	_rod_a = a - _eje * 8.5 + lat * 1.3
	_rodillas = _actor("flash_ger_rodillas", kit_b, _rod_de)
	add_run(_rodillas, _rodillas.get_meta("flash_cfg"))
	_gesto_suelto(_rodillas, "rodillas", 6, RODILLAS_FPS, false)
	_cara(_rodillas, "reir")
	for i in 2:
		var en: Vector3 = a - _eje *(9.5 + i) + lat *(-2.6 if i == 0 else 2.8)
		var s: AnimatedSprite3D = _actor("flash_ger_%d" % i, kit_b, en)
		add_gesto(s, "clap", 4, CLAP_FPS, s.get_meta("flash_cfg"))
		_cara(s, "reir")
		_aplauden.append(s)
	_corre_de = a - _eje * 13.0 - lat * 9.0
	_corre_a = a - _eje * 13.0 + lat * 9.0
	_corre = _actor("flash_ger_corre", kit_b, _corre_de)
	add_run(_corre, _corre.get_meta("flash_cfg"))
	_cara(_corre, "reir")



	var fin: Vector3 = a - _eje * 6.0
	var dist_fin: float = 15.0
	var h_fin: float = 2.0
	var fov_fin: float = 42.0
	var cam_fin: Vector3 = fin + _eje * dist_fin
	var th_b: float = atan2(c.y - h_fin, maxf((cam_fin - c).dot(_eje), 1.0))
	var th_g: float = atan2(- h_fin, maxf((cam_fin -(a - _eje * 10.5)).dot(_eje), 1.0))
	var fov_r: float = deg_to_rad(fov_fin)
	var th_a: float = th_b - 0.3 * fov_r
	if th_g < th_a - 0.42 * fov_r:
		th_a =(th_b + th_g) * 0.5
	focus = a
	make_camera([
		{"t": 0.0, "dist": 3.6, "h": 1.45, "yaw": yaw - 12.0, "aim_y": 1.3, "fov": 38.0,
			"focus_x": a.x, "focus_z": a.z},
		{"t": 2.4, "dist": 4.6, "h": 1.5, "yaw": yaw - 8.0, "aim_y": 1.3, "fov": 38.0,
			"focus_x": a.x, "focus_z": a.z},


		{"t": 6.4, "dist": dist_fin, "h": h_fin, "yaw": yaw - 3.0,
			"aim_y": h_fin + tan(th_a) * dist_fin, "fov": fov_fin,
			"focus_x": fin.x, "focus_z": fin.z},
	], 38.0)
	orbit_speed = 0.5
	stadium.crowd_excite(0.9)
	_t_cifra = SU_T_CIFRA
	_t_firma = SU_T_FIRMA


func _tick_siete_uno() -> void:
	for s in _caidos:
		match String(s.get_meta("pose", "")):
			"cesped":
				if _una_vez("cesped", 0.0):
					s.play("cesped_south")
			"fall":


				if _una_vez("tendido", 0.05):
					gesto_play(s, "fall", Vector3(_eje.z, 0.0, - _eje.x))
			"espaldas":
				idle_play(s, - _eje)

	if _rodillas != null:
		var desliza: Vector3 = _rod_a - _eje * 2.0
		if t < SU_T_RODILLAS:
			var k: float = clampf((t - 0.2) /(SU_T_RODILLAS - 0.2), 0.0, 1.0)
			_coloca(_rodillas, _rod_de.lerp(desliza, k))
			if k > 0.0:
				run_play(_rodillas, _eje)
		else:
			if _una_vez("rodillas", SU_T_RODILLAS):
				_rodillas.play("rodillas_south")
			var d: float = clampf((t - SU_T_RODILLAS) / RODILLAS_S, 0.0, 1.0)
			_coloca(_rodillas, desliza.lerp(_rod_a, 1.0 - pow(1.0 - d, 2.0)))

	for s in _aplauden:
		if t > 0.15 and not en_gesto(s):
			gesto_play(s, "clap", _eje)
	if _corre != null:
		var k: float = clampf((t - 0.8) / 4.6, 0.0, 1.0)
		_coloca(_corre, _corre_de.lerp(_corre_a, k))
		if k > 0.0 and k < 1.0:
			run_play(_corre, _corre_a - _corre_de)
		elif k >= 1.0 and _una_vez("corre_para", 0.0):
			run_play(_corre, Vector3.ZERO)
	if _una_vez("ooh", SU_T_CIFRA):
		sting("crowd_ooh", -8.0)
		sting("stinger_bad", -6.0)
		shake(0.05, 0.35)
	if _una_vez("abucheo", SU_T_FIRMA - 0.4):
		sting("crowd_boo", -12.0)






func _gesto_suelto(spr: AnimatedSprite3D, familia: String, cuadros: int, fps: float,
		bucle: bool) -> bool:
	return _hoja(spr, familia + "_south", familia + "_south_%02d", 1, cuadros, fps, bucle)














func _monta_no_era_penal() -> void:
	_np_eje = Vector3(sin(deg_to_rad(NP_YAW)), 0.0, - cos(deg_to_rad(NP_YAW)))
	var lat: Vector3 = Vector3(_np_eje.z, 0.0, - _np_eje.x)
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	_cae_de = NP_P - lat * 5.0 - _np_eje * 1.0
	_cae = _actor("flash_ned_cae", kit_b, _cae_de)
	add_run(_cae, _cae.get_meta("flash_cfg"))
	add_gesto(_cae, "fall", FALL_CUADROS, FALL_FPS, _cae.get_meta("flash_cfg"))
	_def_de = NP_P + lat * 5.0 + _np_eje * 0.8
	_def_a = NP_P + lat * 1.2 - _np_eje * 0.9
	_defensa = _actor("flash_mex_defensa", kit_a, _def_de)
	add_run(_defensa, _defensa.get_meta("flash_cfg"))
	add_gesto(_defensa, "lost", 5, LOST_FPS, _defensa.get_meta("flash_cfg"))
	_cara(_defensa, "protesta")

	_arb_de = NP_P - _np_eje * 7.5 - lat * 3.5
	_arb_a = NP_P - _np_eje * 4.0
	_arbitro = _arbitro_en(_arb_de, [kit_a, kit_b])
	_monta_balon()



	var ini: Vector3 = NP_P - lat * 1.5


	var fin: Vector3 = NP_P - _np_eje * 1.0 + lat * 0.8
	focus = NP_P
	make_camera([
		{"t": 0.0, "dist": 12.0, "h": 2.3, "yaw": NP_YAW - 5.0, "aim_y": 1.2, "fov": 40.0,
			"focus_x": ini.x, "focus_z": ini.z},
		{"t": NP_T_CONTACTO, "dist": 9.5, "h": 1.9, "yaw": NP_YAW - 1.0, "aim_y": 1.2,
			"fov": 38.0, "focus_x": NP_P.x, "focus_z": NP_P.z},
		{"t": NP_T_SELLO, "dist": 10.5, "h": 1.6, "yaw": NP_YAW + 2.0, "aim_y": 1.45,
			"fov": 38.0, "focus_x": fin.x, "focus_z": fin.z},
	], 40.0)
	orbit_speed = 0.6
	stadium.crowd_excite(0.6)
	_t_cifra = NP_T_PENAL
	_t_firma = NP_T_FIRMA
	_t_sello = NP_T_SELLO


func _monta_balon() -> void:
	var frames: SpriteFrames = BallDeco.frames_for(GameState.current_fixture())
	_balon = AnimatedSprite3D.new()
	_balon.sprite_frames = frames
	_balon.pixel_size = BALON_M / 32.0
	_balon.offset = Vector2(0.0, - BALON_PAD_PX)
	_balon.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	_balon.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	_balon.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	_balon.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	viewport.add_child(_balon)
	if frames != null:
		_balon.play("idle")




func _cae_en(s: float) -> Vector3:
	var dir: Vector3 =(NP_P - _cae_de).normalized()
	if s <= NP_T_CONTACTO:
		var k: float = clampf((s - 0.6) /(NP_T_CONTACTO - 0.6), 0.0, 1.0)
		return _cae_de.lerp(NP_P, k)
	var d: float = clampf((s - NP_T_CONTACTO) / NP_DESLIZA_S, 0.0, 1.0)
	return NP_P + dir * NP_DESLIZA_M *(1.0 - pow(1.0 - d, 2.0))


func _tick_no_era_penal() -> void:
	var dir: Vector3 =(NP_P - _cae_de).normalized()
	_coloca(_cae, _cae_en(t))
	if t < NP_T_CONTACTO:
		if t > 0.6:
			run_play(_cae, dir)
	elif _una_vez("cae", NP_T_CONTACTO):
		gesto_play(_cae, "fall", dir)
		shake(0.04, 0.3)

	if _balon != null:
		var b: Vector3
		if t <= NP_T_CONTACTO:
			b = _cae_en(t) + dir * 0.6
		else:
			var d: float = clampf((t - NP_T_CONTACTO) / 1.3, 0.0, 1.0)
			b = NP_P + dir *(0.6 + 2.4 *(1.0 - pow(1.0 - d, 2.0)))
		_balon.position = Vector3(b.x, BALON_Y, b.z)


	var kd: float = clampf((t - 0.3) / 2.6, 0.0, 1.0)
	_coloca(_defensa, _def_de.lerp(_def_a, kd))
	if kd > 0.0 and kd < 1.0:
		run_play(_defensa, _def_a - _def_de)
	elif kd >= 1.0:
		if _una_vez("def_para", 0.0):
			run_play(_defensa, Vector3.ZERO)
		if _una_vez("def_incredulo", NP_T_INCREDULO):
			gesto_play(_defensa, "lost", _np_eje)
		elif not _hecho.has("def_incredulo"):
			idle_play(_defensa, _cae.position - _defensa.position)

	var ka: float = clampf((t - 0.5) / 2.8, 0.0, 1.0)
	_coloca(_arbitro, _arb_de.lerp(_arb_a, ka))
	if ka > 0.0 and ka < 1.0:
		run_play(_arbitro, _arb_a - _arb_de)
	elif ka >= 1.0:
		if _una_vez("arb_para", 0.0):
			run_play(_arbitro, Vector3.ZERO)
		idle_play(_arbitro, NP_P - _arbitro.position)
	if _una_vez("pitido", NP_T_PITIDO):
		sting("whistle", -4.0)
	if _una_vez("rugido", NP_T_PENAL):
		sting("crowd_roar", -10.0)
	if _una_vez("sello", NP_T_SELLO):
		sting("crowd_boo", -8.0)
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)









const PORTERO_H: float = 1.9





const DIVE_FPS: float = 12.0
const JUMP_CATCH_FPS: float = 14.0
const KICK_FPS: float = 12.0
const VOLEA_FPS: float = 12.0
const EMPEINE_FPS: float = 12.0
const CONTROL_FPS: float = 8.0
const SLIDE_FPS: float = 12.0
const PERDON_FPS: float = 6.0
const CELEB_FPS: float = 9.0
const CIELO_FPS: float = 7.0
const SHIRTOFF_FPS: float = 9.0
const ANGRY_FPS: float = 8.0
const HEADER_FPS: float = 12.0

const CORTE_S: float = 0.25

var _r: Dictionary = {}
var _cortes: Array[float] = []
var _bola_ya: Vector3 = Vector3.ZERO





func _portero(semilla: String, campo: Dictionary, en: Vector3) -> AnimatedSprite3D:
	var look: Dictionary = KitRecolor.appearance_for(semilla,
		KitRecolor.keeper_con_pecho(_gk(_m.get("portero", Color("3a3f45"))), campo))
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = keeper_idle_frames(look)
	_planta(spr, PORTERO_H, en)
	spr.set_meta("flash_cfg", look)
	_hoja(spr, "dive", "dive_%02d", 1, 6, DIVE_FPS, false)
	_hoja(spr, "jump_catch", "jump_catch_%02d", 1, 7, JUMP_CATCH_FPS, false)
	return spr



func _gk(c: Color) -> Dictionary:
	return {"kit": c, "keeper_base": true, "pattern": "solid",
		"kit_b": c.lightened(0.42) if c.v < 0.5 else c.darkened(0.38),
		"gloves": KitRecolor.KEEPER_GLOVE}




func _arbitro_en(en: Vector3, kits: Array) -> AnimatedSprite3D:
	var en_cancha: Array = []
	for kit in kits:
		if (kit as Dictionary).get("kit") is Color:
			en_cancha.append((kit as Dictionary)["kit"])
	var cfg: Dictionary = KitRecolor.appearance_for("flash_arbitro", RefKit.cfg(en_cancha))
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.sprite_frames = player_frames(cfg, "south")
	_planta(spr, PLAYER_HEIGHT_M, en)
	spr.set_meta("flash_cfg", cfg)
	add_idle_views(spr, cfg)
	add_run(spr, cfg)
	return spr




func _planta(spr: AnimatedSprite3D, alto: float, en: Vector3) -> void:
	spr.pixel_size = alto / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.position = Vector3(en.x, feet_offset(spr.pixel_size) - PLAYER_SINK, en.z)
	spr.set_meta("y0", spr.position.y)
	viewport.add_child(spr)
	spr.play("idle")





func _hoja(spr: AnimatedSprite3D, anim: String, patron: String, desde: int, hasta: int,
		fps: float, bucle: bool) -> bool:
	var cfg: Dictionary = spr.get_meta("flash_cfg", {})
	var f: SpriteFrames = spr.sprite_frames
	for i in range(desde, hasta + 1):
		var path: String = "res://assets/sprites/anim/" +(patron % i) + ".png"
		if not ResourceLoader.exists(path):
			break
		if not f.has_animation(anim):
			f.add_animation(anim)
			f.set_animation_loop(anim, bucle)
			f.set_animation_speed(anim, fps)
		f.add_frame(anim, KitRecolor.apply(load(path), cfg))
	return f.has_animation(anim)



func _lanza(quien: String, anim: String, cuando: float) -> void:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr != null and _una_vez(quien + ":" + anim, cuando) \
			and spr.sprite_frames.has_animation(anim):
		spr.play(anim)


		spr.set_meta("sostiene", not spr.sprite_frames.get_animation_loop(anim))




func _gesto(quien: String, familia: String, dir: Vector3, cuando: float,
		sostiene: bool = false) -> void:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr != null and _una_vez(quien + ":" + familia, cuando):
		gesto_play(spr, familia, dir)
		spr.set_meta("sostiene", sostiene)



func _carrera(quien: String, de: Vector3, a: Vector3, t0: float, t1: float) -> bool:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr == null:
		return true
	var k: float = _tramo(t0, t1)
	_coloca(spr, de.lerp(a, k))
	if k <= 0.0:
		return false
	if k < 1.0:
		run_play(spr, a - de)
		spr.set_meta("sostiene", false)
		return false


	if _una_vez("%s:para:%s" % [quien, a], 0.0):
		run_play(spr, Vector3.ZERO)
		spr.set_meta("sostiene", false)
	return true



func _mira(quien: String, dir: Vector3) -> void:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr != null and not bool(spr.get_meta("sostiene", false)):
		idle_play(spr, dir)


func _tramo(t0: float, t1: float) -> float:
	return clampf((t - t0) / maxf(t1 - t0, 0.001), 0.0, 1.0)



func _salto(t0: float, dura: float, alto: float) -> float:
	var k: float = _tramo(t0, t0 + dura)
	return alto * sin(PI * k) if k > 0.0 and k < 1.0 else 0.0


func _alza(quien: String, h: float) -> void:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr != null:
		spr.position.y = float(spr.get_meta("y0", spr.position.y)) + h



func _vuela(de: Vector3, a: Vector3, alto: float, k: float) -> Vector3:
	return de.lerp(a, k) + Vector3.UP *(4.0 * alto * k *(1.0 - k))




func _bola(tramos: Array) -> void:
	if _balon == null or tramos.is_empty():
		return
	var p: Vector3 =(tramos[0] as Array)[2]
	for tr: Array in tramos:
		if t >= float(tr[0]):
			p = _vuela(tr[2], tr[3], float(tr[4]), _tramo(float(tr[0]), float(tr[1])))
	_bola_ya = p
	_balon.position = p




func _estirada(quien: String, de: Vector3, a: Vector3, cuando: float, izquierda: bool) -> void:
	var spr: AnimatedSprite3D = _r.get(quien)
	if spr == null:
		return
	if _una_vez(quien + ":estira", cuando):
		spr.flip_h = izquierda
		spr.play("dive")
		spr.set_meta("sostiene", true)
	var k: float = _tramo(cuando, cuando + 0.35)
	_coloca(spr, de.lerp(a, 1.0 - pow(1.0 - k, 2.0)))



func _de_campo(quien: String, semilla: String, kit: Dictionary, en: Vector3) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = _actor(semilla, kit, en)
	add_run(spr, spr.get_meta("flash_cfg"))
	_r[quien] = spr
	return spr















const LM_T_DESPEJE: float = 0.8
const LM_T_SALTO: float = 2.3
const LM_T_MANO: float = 2.55
const LM_T_RED: float = 3.1
const LM_T_SALE: float = 3.3
const LM_T_FESTEJA: float = 4.3
const LM_T_PROTESTA: float = 3.6
const LM_T_SELLO: float = 5.0
const LM_T_FIRMA: float = 6.8
const LM_C: Vector3 = Vector3(0.5, 2.35, 2.2)
const LM_ATT_DE: Vector3 = Vector3(2.4, 0.0, 6.6)
const LM_ATT_SALTA: Vector3 = Vector3(0.75, 0.0, 2.5)
const LM_ATT_FIN: Vector3 = Vector3(2.6, 0.0, 4.4)
const LM_PORTERO: Vector3 = Vector3(0.1, 0.0, 1.7)



const LM_E1_DE: Vector3 = Vector3(-2.4, 0.0, 6.4)
const LM_E1_A: Vector3 = Vector3(-0.2, 0.0, 2.9)
const LM_E2_DE: Vector3 = Vector3(2.9, 0.0, 0.15)
const LM_E2_A: Vector3 = Vector3(1.3, 0.0, 1.5)
const LM_E3: Vector3 = Vector3(-1.5, 0.0, 7.6)


func _monta_la_mano() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var att: AnimatedSprite3D = _de_campo("att", "flash_arg_mano", kit_a, LM_ATT_DE)
	_hoja(att, "perdon", "perdon_south_%02d", 1, 4, PERDON_FPS, true)
	_hoja(att, "celebration", "celebration_south_%02d", 1, 6, CELEB_FPS, true)
	_r["por"] = _portero("flash_eng_portero", kit_b, LM_PORTERO)
	var e1: AnimatedSprite3D = _de_campo("e1", "flash_eng_1", kit_b, LM_E1_DE)
	_hoja(e1, "angry", "angry_player_south_%02d", 0, 2, ANGRY_FPS, true)
	_cara(e1, "protesta")
	var e2: AnimatedSprite3D = _de_campo("e2", "flash_eng_2", kit_b, LM_E2_DE)
	_hoja(e2, "perdon", "perdon_south_%02d", 1, 4, PERDON_FPS, true)
	_cara(e2, "protesta")
	var e3: AnimatedSprite3D = _de_campo("e3", "flash_eng_3", kit_b, LM_E3)
	add_gesto(e3, "kick", 4, KICK_FPS, e3.get_meta("flash_cfg"))
	_monta_balon()
	focus = LM_C
	make_camera([
		{"t": 0.0, "dist": 12.5, "h": 1.9, "yaw": 104.0, "aim_y": 2.2, "fov": 42.0,
			"focus_x": 0.2, "focus_z": 4.6},

		{"t": LM_T_DESPEJE + 0.5, "dist": 12.5, "h": 1.9, "yaw": 104.0, "aim_y": 2.2,
			"fov": 42.0, "focus_x": 0.2, "focus_z": 4.6},
		{"t": LM_T_MANO, "dist": 10.0, "h": 1.7, "yaw": 100.0, "aim_y": 1.5, "fov": 40.0,
			"focus_x": 0.6, "focus_z": 1.6},
		{"t": LM_T_SELLO + 0.6, "dist": 10.5, "h": 1.8, "yaw": 106.0, "aim_y": 1.3,
			"fov": 40.0, "focus_x": 1.2, "focus_z": 2.9},
	], 42.0)
	orbit_speed = 0.5
	stadium.crowd_excite(0.7)
	_t_cifra = LM_T_RED + 0.05
	_t_sello = LM_T_SELLO
	_t_firma = LM_T_FIRMA


func _tick_la_mano() -> void:
	var red: Vector3 = Vector3(-0.3, 0.55, -0.9)
	_bola([
		[LM_T_DESPEJE, LM_T_MANO, Vector3(-1.35, BALON_Y, 7.2), LM_C, 4.2],
		[LM_T_MANO, LM_T_RED, LM_C, red, 0.35],
		[LM_T_RED, LM_T_RED + 0.45, red, Vector3(-0.4, BALON_Y, -1.3), 0.1],
	])

	_mira("e3", Vector3(0.0, 0.0, -1.0))
	_gesto("e3", "kick", Vector3(0.1, 0.0, -1.0), LM_T_DESPEJE - 0.15)

	if t < LM_T_SALTO:
		_carrera("att", LM_ATT_DE, LM_ATT_SALTA, 0.9, LM_T_SALTO)
	elif t < LM_T_SALE:
		_lanza("att", "perdon", LM_T_SALTO)
		_alza("att", _salto(LM_T_SALTO, 0.55, 0.55))
	elif t < LM_T_FESTEJA:
		_alza("att", 0.0)
		_carrera("att", LM_ATT_SALTA, LM_ATT_FIN, LM_T_SALE, LM_T_FESTEJA)
	else:
		_lanza("att", "celebration", LM_T_FESTEJA)
		if _una_vez("att:risa", LM_T_FESTEJA):
			_cara(_r["att"], "reir")



	_mira("por", Vector3(0.0, 0.0, 1.0))
	_lanza("por", "jump_catch", LM_T_MANO - 0.4)
	var por: AnimatedSprite3D = _r["por"]
	if por.animation == "jump_catch" and por.frame >= 3:
		por.pause()
	_alza("por", _salto(LM_T_MANO - 0.3, 0.6, 0.3))
	if _una_vez("por:baja", LM_T_RED + 0.4):
		por.play("idle")
		por.set_meta("sostiene", false)

	if _carrera("e1", LM_E1_DE, LM_E1_A, LM_T_RED - 0.2, LM_T_PROTESTA):
		if t >= LM_T_PROTESTA:
			_lanza("e1", "angry", LM_T_PROTESTA)
		else:
			_mira("e1", LM_C - LM_E1_A)
	if _carrera("e2", LM_E2_DE, LM_E2_A, LM_T_RED, LM_T_PROTESTA + 0.3):
		if t >= LM_T_PROTESTA + 0.3:
			_lanza("e2", "perdon", LM_T_PROTESTA + 0.3)
		else:
			_mira("e2", LM_C - LM_E2_A)
	if _una_vez("despeje", LM_T_DESPEJE):
		sting("kick", -10.0)
	if _una_vez("red", LM_T_RED):
		sting("net_swish", -6.0)
		sting("crowd_roar", -8.0)
	if _una_vez("sello", LM_T_SELLO):
		sting("crowd_boo", -8.0)
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)













const GF_T_TIRO: float = 0.95
const GF_T_CORTE: float = 1.6
const GF_T_LARGUERO: float = 2.0
const GF_T_BOTE: float = 2.28
const GF_T_ATRAPA: float = 2.75
const GF_T_GRITO: float = 2.35
const GF_T_NO: float = 4.3
const GF_T_SELLO: float = 4.6
const GF_T_FIRMA: float = 6.8
const GF_TIRA_DE: Vector3 = Vector3(-1.6, 0.0, 18.6)
const GF_TIRA: Vector3 = Vector3(-1.2, 0.0, 17.1)
const GF_DEF: Vector3 = Vector3(-0.4, 0.0, 13.8)
const GF_PORTERO: Vector3 = Vector3(-0.3, 0.0, 0.8)
const GF_COMP_DE: Vector3 = Vector3(3.4, 0.0, 6.5)


const GF_COMP: Vector3 = Vector3(3.0, 0.0, 2.6)
const GF_LARGUERO: Vector3 = Vector3(0.3, 2.36, 0.08)
const GF_BOTE: Vector3 = Vector3(0.25, 0.21, -0.9)
const GF_MANOS: Vector3 = Vector3(-0.2, 1.45, 1.0)


func _monta_gol_fantasma() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var tira: AnimatedSprite3D = _de_campo("tira", "flash_eng_tira", kit_b, GF_TIRA_DE)
	add_gesto(tira, "empeine", 5, EMPEINE_FPS, tira.get_meta("flash_cfg"))
	_de_campo("def", "flash_ger_def", kit_a, GF_DEF)
	_r["por"] = _portero("flash_ger_portero", kit_a, GF_PORTERO)
	var comp: AnimatedSprite3D = _de_campo("comp", "flash_eng_comp", kit_b, GF_COMP_DE)
	_hoja(comp, "cielo", "cielo_south_%02d", 1, 4, CIELO_FPS, true)
	add_gesto(comp, "lost", 5, LOST_FPS, comp.get_meta("flash_cfg"))
	_monta_balon()
	focus = GF_TIRA
	var c: float = GF_T_CORTE
	make_camera([
		{"t": 0.0, "dist": 10.0, "h": 2.4, "yaw": 178.0, "aim_y": 0.9, "fov": 40.0,
			"focus_x": -1.2, "focus_z": 12.0},
		{"t": c - 0.01, "dist": 10.4, "h": 2.4, "yaw": 178.0, "aim_y": 1.0, "fov": 40.0,
			"focus_x": -1.1, "focus_z": 11.8},
		{"t": c, "dist": 9.5, "h": 3.0, "yaw": 128.0, "aim_y": 1.35, "fov": 40.0,
			"focus_x": 0.6, "focus_z": 1.0},
		{"t": GF_T_SELLO + 1.0, "dist": 10.5, "h": 2.6, "yaw": 134.0, "aim_y": 1.3,
			"fov": 40.0, "focus_x": 0.9, "focus_z": 1.4},
	], 40.0)
	orbit_speed = 0.5
	_cortes = [c]
	stadium.crowd_excite(0.7)
	_t_cifra = GF_T_GRITO
	_t_sello = GF_T_SELLO
	_t_firma = GF_T_FIRMA


func _tick_gol_fantasma() -> void:
	var pie: Vector3 = Vector3(-1.0, BALON_Y, 16.6)
	_bola([
		[GF_T_TIRO, GF_T_LARGUERO, pie, GF_LARGUERO, 1.3],
		[GF_T_LARGUERO, GF_T_BOTE, GF_LARGUERO, GF_BOTE, 0.0],
		[GF_T_BOTE, GF_T_ATRAPA, GF_BOTE, GF_MANOS, 0.45],
	])
	if _balon != null:
		_balon.visible = t < GF_T_ATRAPA

	if _carrera("tira", GF_TIRA_DE, GF_TIRA, 0.2, GF_T_TIRO - 0.1):
		_gesto("tira", "empeine", Vector3(0.1, 0.0, -1.0), GF_T_TIRO - 0.1)
	_mira("def", GF_TIRA - GF_DEF if t < GF_T_TIRO else Vector3(0.0, 0.0, -1.0))

	_mira("por", Vector3(0.0, 0.0, 1.0))
	_lanza("por", "jump_catch", GF_T_ATRAPA - 0.3)
	_alza("por", _salto(GF_T_ATRAPA - 0.25, 0.5, 0.25))

	if _carrera("comp", GF_COMP_DE, GF_COMP, GF_T_CORTE, GF_T_GRITO - 0.05):
		if t < GF_T_NO:
			_lanza("comp", "cielo", GF_T_GRITO)
			if _una_vez("comp:risa", GF_T_GRITO):
				_cara(_r["comp"], "reir")
		else:
			if _una_vez("comp:cara", GF_T_NO):
				_cara(_r["comp"], "protesta")
			_gesto("comp", "lost", Vector3(0.6, 0.0, 1.0), GF_T_NO, true)
	if _una_vez("tiro", GF_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("larguero", GF_T_LARGUERO):
		sting("post_hit", -4.0)
		shake(0.04, 0.25)
	if _una_vez("grito", GF_T_GRITO):
		sting("crowd_roar", -8.0)
	if _una_vez("sello", GF_T_SELLO):
		sting("crowd_boo", -8.0)
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)









const PEN_PUNTO: Vector3 = Vector3(0.0, BALON_Y, 11.0)
const PEN_TIRA_DE: Vector3 = Vector3(-0.5, 0.0, 12.6)
const PEN_TIRA: Vector3 = Vector3(-0.3, 0.0, 11.35)
const PEN_PORTERO: Vector3 = Vector3(0.0, 0.0, 0.3)
const PEN_T_CORTE: float = 3.9


const ML_T_CORRE: float = 1.7
const ML_T_TIRO: float = 2.5
const ML_T_LARGUERO: float = 2.95
const ML_T_SELLO: float = 3.3
const ML_T_GRITO: float = 0.9
const ML_LARGUERO: Vector3 = Vector3(0.35, 2.4, 0.05)

const PC_T_CORRE: float = 1.6
const PC_T_TIRO: float = 2.4
const PC_T_ENCIMA: float = 2.9
const PC_T_SELLO: float = 3.45
const PC_ENCIMA: Vector3 = Vector3(0.5, 3.9, 0.0)


const PC_CIELO: Vector3 = Vector3(1.0, 22.0, -7.0)


const PC_R0_DE: Vector3 = Vector3(0.5, 0.0, 30.0)
const PC_R0: Vector3 = Vector3(0.6, 0.0, 16.6)
const PC_R1_DE: Vector3 = Vector3(2.4, 0.0, 32.0)
const PC_R1: Vector3 = Vector3(1.6, 0.0, 20.5)

const PEN_T_FIRMA: float = 6.8






func _monta_penalti(semilla: String, tira_a: bool = false) -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var tira: AnimatedSprite3D = _de_campo("tira", semilla + "_tira",
		kit_a if tira_a else kit_b, PEN_TIRA_DE)
	add_gesto(tira, "kick", 4, KICK_FPS, tira.get_meta("flash_cfg"))
	add_gesto(tira, "lost", 5, LOST_FPS, tira.get_meta("flash_cfg"))
	_r["por"] = _portero(semilla + "_portero", kit_b if tira_a else kit_a, PEN_PORTERO)
	_monta_balon()
	_balon.position = PEN_PUNTO





func _tick_tirador(t_corre: float, t_tiro: float, t_pena: float,
		festeja: bool = false) -> void:
	if _carrera("tira", PEN_TIRA_DE, PEN_TIRA, t_corre, t_tiro - 0.08):
		_gesto("tira", "kick", Vector3(0.0, 0.0, -1.0), t_tiro - 0.08)
	elif t < t_corre:
		_mira("tira", Vector3(0.0, 0.0, -1.0))
	if t >= PEN_T_CORTE:
		if t < t_pena:
			_mira("tira", Vector3(0.0, 0.0, -1.0))
		else:
			if _una_vez("tira:cara", t_pena):
				_cara(_r["tira"], "reir" if festeja else "llorar")
			if festeja:
				_lanza("tira", "celebration", t_pena)
			else:
				_gesto("tira", "lost", Vector3(0.0, 0.0, -1.0), t_pena, true)


func _monta_mano_en_la_linea() -> void:
	_monta_penalti("flash_gha")
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	for i in 2:
		var u: AnimatedSprite3D = _de_campo("u%d" % i, "flash_uru_%d" % i, kit_a,
			[Vector3(1.6, 0.0, 22.5), Vector3(0.4, 0.0, 24.0)][i])
		_hoja(u, "celebration", "celebration_south_%02d", 1, 6, CELEB_FPS, true)
		_cara(u, "reir")
	_camara_penalti(false)
	stadium.crowd_excite(0.8)
	_t_cifra = ML_T_GRITO
	_t_sello = ML_T_SELLO
	_t_firma = PEN_T_FIRMA


func _tick_mano_en_la_linea() -> void:
	_bola([
		[ML_T_TIRO + 0.08, ML_T_LARGUERO, PEN_PUNTO, ML_LARGUERO, 0.4],
		[ML_T_LARGUERO, PEN_T_CORTE, ML_LARGUERO, Vector3(0.7, 6.0, -9.0), 3.0],
	])
	if _balon != null:
		_balon.visible = t < PEN_T_CORTE
	_tick_tirador(ML_T_CORRE, ML_T_TIRO, PEN_T_CORTE + 0.3)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", PEN_PORTERO, PEN_PORTERO + Vector3(-1.3, 0.0, 0.0), ML_T_TIRO + 0.12, true)

	for i in 2:
		var de: Vector3 = [Vector3(1.6, 0.0, 22.5), Vector3(0.4, 0.0, 24.0)][i]
		var a: Vector3 = [Vector3(1.6, 0.0, 19.5), Vector3(0.6, 0.0, 21.0)][i]
		if _carrera("u%d" % i, de, a, ML_T_LARGUERO + 0.2, PEN_T_CORTE + 0.4 + 0.3 * i):
			_lanza("u%d" % i, "celebration", PEN_T_CORTE + 0.4 + 0.3 * i)
	if _una_vez("grito", ML_T_GRITO):
		sting("whistle", -6.0)
		sting("crowd_roar", -10.0)
	if _una_vez("tiro", ML_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("larguero", ML_T_LARGUERO):
		sting("post_hit", -2.0)
		sting("crowd_ooh", -6.0)
		shake(0.07, 0.35)
	if _una_vez("sello", ML_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.05, 0.3)


func _monta_penal_al_cielo() -> void:
	_monta_penalti("flash_ita")
	_monta_llegan(_kit_de(String(_m["a"]), _m.get("kit_a", {})), "flash_bra_cielo")
	_camara_penalti(true)
	stadium.crowd_excite(0.9)
	_t_sello = PC_T_SELLO
	_t_firma = PEN_T_FIRMA


func _tick_penal_al_cielo() -> void:
	_bola([
		[PC_T_TIRO + 0.08, PC_T_ENCIMA, PEN_PUNTO, PC_ENCIMA, 0.6],
		[PC_T_ENCIMA, PEN_T_CORTE + 0.1, PC_ENCIMA, PC_CIELO, 1.0],
	])
	if _balon != null:
		_balon.visible = t < PEN_T_CORTE
	_tick_tirador(PC_T_CORRE, PC_T_TIRO, PEN_T_CORTE + 0.25)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", PEN_PORTERO, PEN_PORTERO + Vector3(1.3, 0.0, 0.0), PC_T_TIRO + 0.1, false)
	_tick_llegan()
	if _una_vez("tiro", PC_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("encima", PC_T_ENCIMA):
		sting("crowd_roar", -6.0)
	if _una_vez("sello", PC_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.05, 0.3)





func _monta_llegan(kit: Dictionary, semilla: String) -> void:
	var r0: AnimatedSprite3D = _de_campo("r0", semilla + "_0", kit, PC_R0_DE)
	_gesto_suelto(r0, "rodillas", 6, RODILLAS_FPS, false)
	_cara(r0, "reir")
	var r1: AnimatedSprite3D = _de_campo("r1", semilla + "_1", kit, PC_R1_DE)
	_hoja(r1, "cielo", "cielo_south_%02d", 1, 4, CIELO_FPS, true)
	_cara(r1, "reir")


func _tick_llegan() -> void:
	if _carrera("r0", PC_R0_DE, PC_R0, PEN_T_CORTE, 5.5):
		_lanza("r0", "rodillas_south", 5.5)
		_coloca(_r["r0"], PC_R0.lerp(PC_R0 + Vector3(0.1, 0.0, -1.1),
			1.0 - pow(1.0 - _tramo(5.5, 5.5 + RODILLAS_S), 2.0)))
	if _carrera("r1", PC_R1_DE, PC_R1, PEN_T_CORTE, 5.7):
		_lanza("r1", "cielo", 5.7)




func _camara_penalti(al_cielo: bool) -> void:
	var c: float = PEN_T_CORTE
	var keys: Array = []
	if al_cielo:
		keys = [
			{"t": 0.0, "dist": 12.0, "h": 1.4, "yaw": 177.0, "aim_y": 1.4, "fov": 40.0,
				"focus_x": 0.1, "focus_z": 8.0},
			{"t": PC_T_ENCIMA - 0.1, "dist": 12.0, "h": 1.4, "yaw": 177.0, "aim_y": 1.5,
				"fov": 40.0, "focus_x": 0.1, "focus_z": 8.0},
			{"t": PC_T_SELLO + 0.2, "dist": 12.0, "h": 1.4, "yaw": 177.0, "aim_y": 5.5,
				"fov": 42.0, "focus_x": 0.1, "focus_z": 8.0},
			{"t": c - 0.01, "dist": 12.0, "h": 1.4, "yaw": 177.0, "aim_y": 6.5,
				"fov": 42.0, "focus_x": 0.1, "focus_z": 8.0},
		]
	else:
		keys = [
			{"t": 0.0, "dist": 12.0, "h": 2.0, "yaw": 177.0, "aim_y": 1.2, "fov": 40.0,
				"focus_x": 0.1, "focus_z": 8.0},
			{"t": c - 0.01, "dist": 12.6, "h": 2.0, "yaw": 177.5, "aim_y": 1.3, "fov": 40.0,
				"focus_x": 0.1, "focus_z": 7.8},
		]
	keys.append({"t": c, "dist": 7.5, "h": 1.5, "yaw": 6.0, "aim_y": 1.25, "fov": 40.0,
		"focus_x": 0.0, "focus_z": 13.6})
	keys.append({"t": DURA, "dist": 7.2, "h": 1.5, "yaw": 4.0, "aim_y": 1.1, "fov": 40.0,
		"focus_x": -0.1, "focus_z": 13.4})
	focus = PEN_TIRA
	make_camera(keys, 40.0)
	orbit_speed = 0.0
	_cortes = [c]









const MI_T_PASE: float = 0.2
const MI_T_CONTROL: float = 1.3
const MI_T_VOLEA: float = 2.08
const MI_T_RED: float = 2.55
const MI_T_CIFRA: float = 2.75
const MI_T_SE_VA: float = 2.9
const MI_T_CAMISETA: float = 4.0
const MI_T_SUELO: float = 3.3
const MI_T_FIRMA: float = 6.8
const MI_ATT_DE: Vector3 = Vector3(2.4, 0.0, 11.5)
const MI_ATT: Vector3 = Vector3(1.6, 0.0, 9.5)
const MI_ATT_FIN: Vector3 = Vector3(3.4, 0.0, 11.0)
const MI_PORTERO: Vector3 = Vector3(0.4, 0.0, 0.9)


const MI_D1_DE: Vector3 = Vector3(3.4, 0.0, 8.4)
const MI_D1: Vector3 = Vector3(2.6, 0.0, 8.6)
const MI_D2_DE: Vector3 = Vector3(3.8, 0.0, 4.8)
const MI_D2: Vector3 = Vector3(2.8, 0.0, 3.2)


func _monta_minuto_116() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var att: AnimatedSprite3D = _de_campo("att", "flash_esp_116", kit_b, MI_ATT_DE)
	add_gesto(att, "control", 6, CONTROL_FPS, att.get_meta("flash_cfg"))
	add_gesto(att, "volea", 5, VOLEA_FPS, att.get_meta("flash_cfg"))
	_hoja(att, "shirtoff", "shirtoff_south_%02d", 1, 6, SHIRTOFF_FPS, true)
	_r["por"] = _portero("flash_ned_portero", kit_a, MI_PORTERO)
	var d1: AnimatedSprite3D = _de_campo("d1", "flash_ned_1", kit_a, MI_D1_DE)
	add_gesto(d1, "slide", 5, SLIDE_FPS, d1.get_meta("flash_cfg"))
	var d2: AnimatedSprite3D = _de_campo("d2", "flash_ned_2", kit_a, MI_D2_DE)
	_gesto_suelto(d2, "cesped", 4, CESPED_FPS, true)
	_monta_balon()
	focus = MI_ATT
	make_camera([
		{"t": 0.0, "dist": 5.5, "h": 1.6, "yaw": 168.0, "aim_y": 1.2, "fov": 40.0,
			"focus_x": 1.2, "focus_z": 10.0},
		{"t": MI_T_VOLEA + 0.1, "dist": 11.5, "h": 2.2, "yaw": 172.0, "aim_y": 1.3,
			"fov": 40.0, "focus_x": 0.3, "focus_z": 6.5},
		{"t": 4.8, "dist": 8.5, "h": 1.6, "yaw": 186.0, "aim_y": 1.35, "fov": 40.0,
			"focus_x": 2.9, "focus_z": 9.8},
	], 40.0)
	orbit_speed = 0.5
	stadium.crowd_excite(0.8)
	_t_cifra = MI_T_CIFRA
	_t_firma = MI_T_FIRMA


func _tick_minuto_116() -> void:
	var pie: Vector3 = Vector3(1.45, BALON_Y, 9.3)
	var volea: Vector3 = Vector3(1.3, 0.45, 9.0)
	var red: Vector3 = Vector3(-2.0, 0.65, -0.3)
	_bola([
		[MI_T_PASE, MI_T_CONTROL, Vector3(-3.6, BALON_Y, 12.4), pie, 0.5],
		[MI_T_CONTROL + 0.1, MI_T_VOLEA, pie, volea, 0.6],
		[MI_T_VOLEA + 0.06, MI_T_RED, volea, red, 0.25],
		[MI_T_RED, MI_T_RED + 0.4, red, Vector3(-2.15, BALON_Y, -0.9), 0.05],
	])

	if t < MI_T_SE_VA:
		if _carrera("att", MI_ATT_DE, MI_ATT, 0.2, MI_T_CONTROL - 0.05):
			_gesto("att", "control", Vector3(-1.0, 0.0, 0.3), MI_T_CONTROL - 0.05)
			_gesto("att", "volea", Vector3(-0.35, 0.0, -1.0), MI_T_VOLEA - 0.08)
	elif t < MI_T_CAMISETA:
		_carrera("att", MI_ATT, MI_ATT_FIN, MI_T_SE_VA, MI_T_CAMISETA)
	else:
		_lanza("att", "shirtoff", MI_T_CAMISETA)
		if _una_vez("att:risa", MI_T_CAMISETA):
			_cara(_r["att"], "reir")

	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", MI_PORTERO, MI_PORTERO + Vector3(-1.3, 0.0, -0.2), MI_T_VOLEA + 0.15, true)

	if _carrera("d1", MI_D1_DE, MI_D1, 0.6, MI_T_VOLEA - 0.3):
		_gesto("d1", "slide", Vector3(-1.0, 0.0, 0.0), MI_T_VOLEA - 0.3, true)
		var k: float = _tramo(MI_T_VOLEA - 0.3, MI_T_VOLEA + 0.1)
		_coloca(_r["d1"], MI_D1.lerp(MI_D1 + Vector3(-0.7, 0.0, 0.1), 1.0 - pow(1.0 - k, 2.0)))
	if _carrera("d2", MI_D2_DE, MI_D2, 0.8, 2.0):
		if t >= MI_T_SUELO:
			_lanza("d2", "cesped_south", MI_T_SUELO)
		else:
			_mira("d2", _bola_ya - MI_D2)
	if _una_vez("volea", MI_T_VOLEA):
		sting("kick", -4.0)
	if _una_vez("red", MI_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -6.0)
	if _una_vez("cifra", MI_T_CIFRA):
		sting("stinger_bad", -6.0)
		shake(0.05, 0.35)



















const RS_T_PASE: float = 0.3
const RS_T_CONTROL: float = 1.15
const RS_T_RESBALA: float = 1.55
const RS_T_ROBA: float = 2.2
const RS_T_CORTE: float = 3.0
const RS_T_TIRO: float = 3.85
const RS_T_RED: float = 4.3
const RS_T_GRITO: float = 4.45
const RS_T_VUELVE: float = 4.9
const RS_T_MANOS: float = 5.15
const RS_T_SELLO: float = 5.3
const RS_T_FIRMA: float = 6.8
const RS_CAE: Vector3 = Vector3(0.0, 0.0, 32.5)
const RS_PIE: Vector3 = Vector3(-0.6, BALON_Y, 32.4)


const RS_ROJO_DE: Vector3 = Vector3(-3.5, 0.0, 27.0)
const RS_ROJO: Vector3 = Vector3(-2.0, 0.0, 30.6)
const RS_AZUL_DE: Vector3 = Vector3(3.5, 0.0, 35.0)
const RS_AZUL_ROBA: Vector3 = Vector3(0.6, 0.0, 29.5)
const RS_AZUL_SE_VA: Vector3 = Vector3(0.5, 0.0, 25.5)

const RS_AZUL_AREA: Vector3 = Vector3(1.3, 0.0, 16.2)
const RS_AZUL_TIRA: Vector3 = Vector3(1.1, 0.0, 13.6)

const RS_LLEVA: Vector3 = Vector3(-0.05, 0.0, -0.6)
const RS_PORTERO: Vector3 = Vector3(0.0, 0.0, 0.6)
const RS_RED: Vector3 = Vector3(-2.2, 0.5, -0.3)


func _monta_resbalon() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var cae: AnimatedSprite3D = _de_campo("cae", "flash_liv_resbala", kit_a, RS_CAE)
	add_gesto(cae, "control", 6, CONTROL_FPS, cae.get_meta("flash_cfg"))
	add_gesto(cae, "fall", FALL_CUADROS, FALL_FPS, cae.get_meta("flash_cfg"))
	var rojo: AnimatedSprite3D = _de_campo("rojo", "flash_liv_rojo", kit_a, RS_ROJO_DE)
	add_gesto(rojo, "lost", 5, LOST_FPS, rojo.get_meta("flash_cfg"))
	var azul: AnimatedSprite3D = _de_campo("azul", "flash_che_azul", kit_b, RS_AZUL_DE)
	add_gesto(azul, "empeine", 5, EMPEINE_FPS, azul.get_meta("flash_cfg"))
	_r["por"] = _portero("flash_liv_portero", kit_a, RS_PORTERO)
	_monta_balon()
	focus = RS_CAE
	var c1: float = RS_T_CORTE
	var c2: float = RS_T_VUELVE
	make_camera([
		{"t": 0.0, "dist": 10.0, "h": 2.4, "yaw": 158.0, "aim_y": 1.0, "fov": 40.0,
			"focus_x": -0.5, "focus_z": 32.5},
		{"t": c1 - 0.01, "dist": 11.0, "h": 2.6, "yaw": 162.0, "aim_y": 1.0, "fov": 40.0,
			"focus_x": 0.0, "focus_z": 29.5},
		{"t": c1, "dist": 10.0, "h": 2.4, "yaw": 178.0, "aim_y": 0.9, "fov": 40.0,
			"focus_x": 0.1, "focus_z": 10.5},
		{"t": c2 - 0.01, "dist": 10.4, "h": 2.4, "yaw": 178.0, "aim_y": 1.0, "fov": 40.0,
			"focus_x": -0.2, "focus_z": 10.0},
		{"t": c2, "dist": 7.5, "h": 1.7, "yaw": 160.0, "aim_y": 0.6, "fov": 40.0,
			"focus_x": -0.5, "focus_z": 32.0},
		{"t": DURA, "dist": 7.0, "h": 1.6, "yaw": 166.0, "aim_y": 0.7, "fov": 40.0,
			"focus_x": -0.5, "focus_z": 32.0},
	], 40.0)
	orbit_speed = 0.4
	_cortes = [c1, c2]
	stadium.crowd_excite(0.6)
	_t_cifra = RS_T_GRITO
	_t_sello = RS_T_SELLO
	_t_firma = RS_T_FIRMA


func _tick_resbalon() -> void:


	var suelta: Vector3 = RS_AZUL_ROBA + RS_LLEVA + Vector3(0.0, BALON_Y, 0.0)
	if t < RS_T_ROBA:
		_bola([
			[RS_T_PASE, RS_T_CONTROL, Vector3(-9.5, BALON_Y, 33.4), RS_PIE, 0.15],
			[RS_T_RESBALA, RS_T_ROBA, RS_PIE, suelta, 0.0],
		])
	elif t < RS_T_TIRO:
		if _balon != null:
			var a: Vector3 =(_r["azul"] as AnimatedSprite3D).position
			_balon.position = Vector3(a.x, BALON_Y, a.z) + RS_LLEVA
			_bola_ya = _balon.position
	else:
		var pie: Vector3 = RS_AZUL_TIRA + RS_LLEVA + Vector3(0.0, BALON_Y, 0.0)
		_bola([
			[RS_T_TIRO, RS_T_RED, pie, RS_RED, 0.3],
			[RS_T_RED, RS_T_RED + 0.35, RS_RED, Vector3(-2.4, BALON_Y, -1.0), 0.05],
		])


	if t < RS_T_CONTROL - 0.1:
		_mira("cae", Vector3(-1.0, 0.0, 0.2))
	_gesto("cae", "control", Vector3(-1.0, 0.0, 0.2), RS_T_CONTROL - 0.1)
	_gesto("cae", "fall", Vector3(-1.0, 0.0, -0.3), RS_T_RESBALA, true)
	var k: float = _tramo(RS_T_RESBALA, RS_T_RESBALA + NP_DESLIZA_S)
	_coloca(_r["cae"], RS_CAE.lerp(RS_CAE + Vector3(-0.6, 0.0, -0.2), 1.0 - pow(1.0 - k, 2.0)))


	if t < RS_T_CORTE:
		_mira("rojo", _bola_ya - RS_ROJO_DE)
	elif _carrera("rojo", RS_ROJO_DE, RS_ROJO, RS_T_CORTE, 4.7):
		if t < RS_T_MANOS:
			_mira("rojo", RS_CAE - RS_ROJO)
		else:
			if _una_vez("rojo:cara", RS_T_MANOS):
				_cara(_r["rojo"], "llorar")
			_gesto("rojo", "lost", Vector3(0.3, 0.0, 1.0), RS_T_MANOS, true)


	if t < RS_T_ROBA:
		if not _carrera("azul", RS_AZUL_DE, RS_AZUL_ROBA, 0.9, RS_T_ROBA) and t < 0.9:
			_mira("azul", _bola_ya - RS_AZUL_DE)
	elif t < RS_T_CORTE:
		_carrera("azul", RS_AZUL_ROBA, RS_AZUL_SE_VA, RS_T_ROBA, RS_T_CORTE)
	elif _carrera("azul", RS_AZUL_AREA, RS_AZUL_TIRA, RS_T_CORTE, RS_T_TIRO - 0.1):
		_gesto("azul", "empeine", Vector3(-0.15, 0.0, -1.0), RS_T_TIRO - 0.1)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", RS_PORTERO, RS_PORTERO + Vector3(-1.3, 0.0, -0.2), RS_T_TIRO + 0.1, true)
	if _una_vez("pase", RS_T_PASE):
		sting("kick", -10.0)
	if _una_vez("resbala", RS_T_RESBALA):
		sting("crowd_ooh", -6.0)
		shake(0.04, 0.3)
	if _una_vez("tiro", RS_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("red", RS_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -12.0)
	if _una_vez("sello", RS_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)









const EB_T_BAILA: float = 0.5
const EB_T_BAILA_FIN: float = 2.3
const EB_T_CORRE: float = 1.7
const EB_T_TIRO: float = 2.4
const EB_T_ESTIRA: float = 2.48
const EB_T_PARADA: float = 2.72
const EB_T_SALE: float = 3.25
const EB_T_PENA: float = 4.15
const EB_T_SELLO: float = 4.4

const EB_BAILE_M: float = 0.45
const EB_PARADA: Vector3 = Vector3(0.55, 0.65, 0.55)
const EB_REBOTE: Vector3 = Vector3(2.6, BALON_Y, 4.8)


func _monta_estambul() -> void:
	_monta_penalti("flash_mil", true)
	_monta_llegan(_kit_de(String(_m["b"]), _m.get("kit_b", {})), "flash_liv_estambul")
	_camara_penalti(false)
	stadium.crowd_excite(0.9)
	_t_sello = EB_T_SELLO
	_t_firma = PEN_T_FIRMA


func _tick_estambul() -> void:
	_bola([
		[EB_T_TIRO + 0.08, EB_T_PARADA, PEN_PUNTO, EB_PARADA, 0.15],
		[EB_T_PARADA, EB_T_SALE, EB_PARADA, EB_REBOTE, 0.7],
	])
	if _balon != null:
		_balon.visible = t < PEN_T_CORTE
	_tick_tirador(EB_T_CORRE, EB_T_TIRO, EB_T_PENA)


	if t < EB_T_ESTIRA:
		var s: float = sin(TAU * 2.0 * _tramo(EB_T_BAILA, EB_T_BAILA_FIN))
		_coloca(_r["por"], PEN_PORTERO + Vector3(EB_BAILE_M * s, 0.0, 0.0))
		_alza("por", 0.12 * absf(s))
		_mira("por", Vector3(0.0, 0.0, 1.0))
	else:
		_alza("por", 0.0)
		_estirada("por", PEN_PORTERO, PEN_PORTERO + Vector3(0.75, 0.0, 0.15), EB_T_ESTIRA, false)
	_tick_llegan()
	if _una_vez("tiro", EB_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("parada", EB_T_PARADA):
		sting("crowd_roar", -4.0)
		shake(0.07, 0.35)
	if _una_vez("sello", EB_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.05, 0.3)









const RM_T_PASE: float = 0.5
const RM_T_LLEGA: float = 1.75
const RM_T_VOLEA: float = 1.77
const RM_T_ESTIRA: float = 1.95
const RM_T_RED: float = 2.2
const RM_T_CIFRA: float = 2.45
const RM_T_SE_VA: float = 2.5
const RM_T_LOST: float = 2.6
const RM_T_SUELO: float = 2.9
const RM_T_RODILLAS: float = 3.6
const RM_T_FESTEJA: float = 4.3
const RM_T_FIRMA: float = 6.8
const RM_ATT_DE: Vector3 = Vector3(2.6, 0.0, 12.5)
const RM_ATT: Vector3 = Vector3(1.0, 0.0, 7.1)
const RM_ATT_FIN: Vector3 = Vector3(5.4, 0.0, 9.4)


const RM_DESLIZA: Vector3 = Vector3(0.15, 0.0, 1.1)
const RM_PORTERO: Vector3 = Vector3(-0.6, 0.0, 1.4)
const RM_D1_DE: Vector3 = Vector3(3.4, 0.0, 10.4)
const RM_D1: Vector3 = Vector3(2.2, 0.0, 7.6)
const RM_D2_DE: Vector3 = Vector3(-2.8, 0.0, 7.0)
const RM_D2: Vector3 = Vector3(-1.9, 0.0, 4.6)
const RM_COMP_DE: Vector3 = Vector3(-3.0, 0.0, 13.0)
const RM_COMP: Vector3 = Vector3(4.3, 0.0, 10.2)
const RM_CONTACTO: Vector3 = Vector3(0.8, 0.5, 6.6)
const RM_RED: Vector3 = Vector3(-1.8, 0.45, -0.3)


func _monta_remontada() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var att: AnimatedSprite3D = _de_campo("att", "flash_bar_remonta", kit_a, RM_ATT_DE)
	add_gesto(att, "volea", 5, VOLEA_FPS, att.get_meta("flash_cfg"))
	_gesto_suelto(att, "rodillas", 6, RODILLAS_FPS, false)
	_r["por"] = _portero("flash_pari_portero", kit_b, RM_PORTERO)
	var d1: AnimatedSprite3D = _de_campo("d1", "flash_pari_1", kit_b, RM_D1_DE)
	add_gesto(d1, "lost", 5, LOST_FPS, d1.get_meta("flash_cfg"))
	var d2: AnimatedSprite3D = _de_campo("d2", "flash_pari_2", kit_b, RM_D2_DE)
	_gesto_suelto(d2, "cesped", 4, CESPED_FPS, true)
	var comp: AnimatedSprite3D = _de_campo("comp", "flash_bar_comp", kit_a, RM_COMP_DE)
	_hoja(comp, "celebration", "celebration_south_%02d", 1, 6, CELEB_FPS, true)
	_monta_balon()
	focus = RM_ATT
	make_camera([
		{"t": 0.0, "dist": 7.5, "h": 1.8, "yaw": 172.0, "aim_y": 1.3, "fov": 40.0,
			"focus_x": 1.6, "focus_z": 9.5},
		{"t": RM_T_ESTIRA, "dist": 11.5, "h": 2.2, "yaw": 172.0, "aim_y": 1.3, "fov": 40.0,
			"focus_x": 0.3, "focus_z": 6.0},
		{"t": 4.8, "dist": 8.5, "h": 1.6, "yaw": 188.0, "aim_y": 1.1, "fov": 40.0,
			"focus_x": 4.8, "focus_z": 9.4},
	], 40.0)
	orbit_speed = 0.5
	stadium.crowd_excite(0.9)
	_t_cifra = RM_T_CIFRA
	_t_firma = RM_T_FIRMA


func _tick_remontada() -> void:
	_bola([
		[RM_T_PASE, RM_T_VOLEA + 0.08, Vector3(-6.0, BALON_Y, 19.0), RM_CONTACTO, 3.2],
		[RM_T_VOLEA + 0.13, RM_T_RED, RM_CONTACTO, RM_RED, 0.1],
		[RM_T_RED, RM_T_RED + 0.4, RM_RED, Vector3(-1.9, BALON_Y, -1.0), 0.05],
	])

	if t < RM_T_SE_VA:
		if _carrera("att", RM_ATT_DE, RM_ATT, 0.4, RM_T_LLEGA):
			_gesto("att", "volea", Vector3(-0.25, 0.0, -1.0), RM_T_VOLEA)
	elif t < RM_T_RODILLAS:
		_carrera("att", RM_ATT, RM_ATT_FIN, RM_T_SE_VA, RM_T_RODILLAS)
	else:
		_lanza("att", "rodillas_south", RM_T_RODILLAS)
		if _una_vez("att:risa", RM_T_RODILLAS):
			_cara(_r["att"], "reir")
		var k: float = _tramo(RM_T_RODILLAS, RM_T_RODILLAS + RODILLAS_S)
		_coloca(_r["att"], RM_ATT_FIN.lerp(RM_ATT_FIN + RM_DESLIZA, 1.0 - pow(1.0 - k, 2.0)))
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", RM_PORTERO, Vector3(-1.7, 0.0, 1.2), RM_T_ESTIRA, true)


	if _carrera("d1", RM_D1_DE, RM_D1, RM_T_PASE, 1.7):
		if t < RM_T_LOST:
			_mira("d1", _bola_ya - RM_D1)
		else:
			if _una_vez("d1:cara", RM_T_LOST):
				_cara(_r["d1"], "llorar")
			_gesto("d1", "lost", Vector3(0.0, 0.0, 1.0), RM_T_LOST, true)
	if _carrera("d2", RM_D2_DE, RM_D2, RM_T_PASE, 1.7):
		if t < RM_T_SUELO:
			_mira("d2", _bola_ya - RM_D2)
		else:
			_lanza("d2", "cesped_south", RM_T_SUELO)
	if _carrera("comp", RM_COMP_DE, RM_COMP, RM_T_SE_VA, RM_T_FESTEJA):
		_lanza("comp", "celebration", RM_T_FESTEJA)
		if _una_vez("comp:risa", RM_T_FESTEJA):
			_cara(_r["comp"], "reir")
	if _una_vez("volea", RM_T_VOLEA + 0.08):
		sting("kick", -4.0)
	if _una_vez("red", RM_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -2.0)
	if _una_vez("cifra", RM_T_CIFRA):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)









const NV_T_CORNER: float = 0.4
const NV_T_SALTA: float = 1.75
const NV_T_CABEZA: float = 2.0
const NV_T_ESTIRA: float = 2.15
const NV_T_RED: float = 2.4
const NV_T_CIFRA: float = 2.6
const NV_T_SE_VA: float = 2.7
const NV_T_SUELO: float = 3.0
const NV_T_FESTEJA: float = 3.8
const NV_T_FIRMA: float = 6.8
const NV_ATT_DE: Vector3 = Vector3(2.6, 0.0, 10.8)
const NV_ATT: Vector3 = Vector3(0.45, 0.0, 6.3)
const NV_ATT_FIN: Vector3 = Vector3(4.6, 0.0, 4.4)
const NV_CORNER: Vector3 = Vector3(33.4, BALON_Y, 0.6)
const NV_C: Vector3 = Vector3(0.3, 2.3, 6.0)
const NV_RED: Vector3 = Vector3(-2.4, 0.4, -0.3)
const NV_D1: Vector3 = Vector3(-0.4, 0.0, 5.6)
const NV_D2: Vector3 = Vector3(-2.6, 0.0, 1.0)
const NV_PORTERO: Vector3 = Vector3(0.6, 0.0, 1.1)


func _monta_noventa_y_dos() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var att: AnimatedSprite3D = _de_campo("att", "flash_rma_cabeza", kit_a, NV_ATT_DE)
	add_gesto(att, "header", 6, HEADER_FPS, att.get_meta("flash_cfg"))
	_hoja(att, "celebration", "celebration_south_%02d", 1, 6, CELEB_FPS, true)
	var d1: AnimatedSprite3D = _de_campo("d1", "flash_atm_1", kit_b, NV_D1)
	add_gesto(d1, "header", 6, HEADER_FPS, d1.get_meta("flash_cfg"))
	add_gesto(d1, "lost", 5, LOST_FPS, d1.get_meta("flash_cfg"))
	var d2: AnimatedSprite3D = _de_campo("d2", "flash_atm_2", kit_b, NV_D2)
	_gesto_suelto(d2, "cesped", 4, CESPED_FPS, true)
	_r["por"] = _portero("flash_atm_portero", kit_b, NV_PORTERO)
	_monta_balon()
	focus = NV_ATT
	make_camera([
		{"t": 0.0, "dist": 11.5, "h": 2.4, "yaw": 162.0, "aim_y": 2.0, "fov": 42.0,
			"focus_x": 1.2, "focus_z": 5.5},
		{"t": NV_T_CABEZA, "dist": 10.5, "h": 2.2, "yaw": 168.0, "aim_y": 1.6, "fov": 40.0,
			"focus_x": 0.2, "focus_z": 4.5},
		{"t": 4.8, "dist": 8.5, "h": 1.6, "yaw": 192.0, "aim_y": 1.25, "fov": 40.0,
			"focus_x": 4.0, "focus_z": 5.0},
	], 42.0)
	orbit_speed = 0.5
	stadium.crowd_excite(0.9)
	_t_cifra = NV_T_CIFRA
	_t_firma = NV_T_FIRMA


func _tick_noventa_y_dos() -> void:
	_bola([
		[NV_T_CORNER, NV_T_CABEZA, NV_CORNER, NV_C, 5.0],
		[NV_T_CABEZA, NV_T_RED, NV_C, NV_RED, 0.0],
		[NV_T_RED, NV_T_RED + 0.35, NV_RED, Vector3(-2.5, BALON_Y, -1.0), 0.05],
	])

	if t < NV_T_SALTA:
		_carrera("att", NV_ATT_DE, NV_ATT, 0.5, NV_T_SALTA)
	elif t < NV_T_SE_VA:
		_gesto("att", "header", Vector3(-0.4, 0.0, -1.0), NV_T_SALTA + 0.1)
		_alza("att", _salto(NV_T_SALTA, 0.55, 0.5))
	elif t < NV_T_FESTEJA:
		_alza("att", 0.0)
		_carrera("att", NV_ATT, NV_ATT_FIN, NV_T_SE_VA, NV_T_FESTEJA)
	else:
		_lanza("att", "celebration", NV_T_FESTEJA)
		if _una_vez("att:risa", NV_T_FESTEJA):
			_cara(_r["att"], "reir")

	if t < NV_T_SE_VA:
		_mira("d1", _bola_ya - NV_D1)
		_gesto("d1", "header", Vector3(1.0, 0.0, 0.3), NV_T_SALTA + 0.07)
		_alza("d1", _salto(NV_T_SALTA + 0.02, 0.5, 0.3))
	else:
		_alza("d1", 0.0)
		if _una_vez("d1:cara", NV_T_SE_VA):
			_cara(_r["d1"], "llorar")
		_gesto("d1", "lost", Vector3(0.0, 0.0, 1.0), NV_T_SE_VA, true)
	if t < NV_T_SUELO:
		_mira("d2", _bola_ya - NV_D2)
	else:
		_lanza("d2", "cesped_south", NV_T_SUELO)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", NV_PORTERO, Vector3(-0.7, 0.0, 0.9), NV_T_ESTIRA, true)
	if _una_vez("corner", NV_T_CORNER):
		sting("kick", -10.0)
	if _una_vez("cabeza", NV_T_CABEZA):
		sting("kick", -8.0)
	if _una_vez("red", NV_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -2.0)
	if _una_vez("cifra", NV_T_CIFRA):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)










const CR_T_SE_VA: float = 0.3
const CR_T_VUELVE: float = 0.95
const CR_T_SAQUE: float = 1.3
const CR_T_CORTE: float = 1.6
const CR_T_REMATE: float = 2.5
const CR_T_ESTIRA: float = 2.62
const CR_T_RED: float = 2.8
const CR_T_GRITO: float = 2.9
const CR_T_CIELO: float = 3.0
const CR_T_GIRAN: float = 3.1
const CR_T_SELLO: float = 3.6
const CR_T_FIRMA: float = 6.8
const CR_BALON: Vector3 = Vector3(33.4, BALON_Y, 0.5)
const CR_SACA: Vector3 = Vector3(33.85, 0.0, 0.25)
const CR_SE_VA: Vector3 = Vector3(32.9, 0.0, 2.4)
const CR_REMATA: Vector3 = Vector3(1.6, 0.0, 6.4)
const CR_PIE: Vector3 = Vector3(1.75, 0.45, 6.0)
const CR_RED: Vector3 = Vector3(1.9, 1.9, -0.3)




const CR_YAW_1: float = 300.0
const CR_DEF: Array[Vector3] = [Vector3(2.4, 0.0, 3.0), Vector3(0.5, 0.0, 6.0)]

const CR_PORTERO: Vector3 = Vector3(-1.5, 0.0, 1.0)


func _monta_corner_rapido() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var saca: AnimatedSprite3D = _de_campo("saca", "flash_liv_saca", kit_a, CR_SACA)
	add_walk(saca, saca.get_meta("flash_cfg"))
	add_gesto(saca, "kick", 4, KICK_FPS, saca.get_meta("flash_cfg"))
	var remata: AnimatedSprite3D = _de_campo("remata", "flash_liv_remata", kit_a, CR_REMATA)
	add_gesto(remata, "kick", 4, KICK_FPS, remata.get_meta("flash_cfg"))
	_hoja(remata, "cielo", "cielo_south_%02d", 1, 4, CIELO_FPS, true)
	for i in CR_DEF.size():
		var d: AnimatedSprite3D = _de_campo("d%d" % i, "flash_bar_%d" % i, kit_b, CR_DEF[i])
		add_gesto(d, "lost", 5, LOST_FPS, d.get_meta("flash_cfg"))
	_r["por"] = _portero("flash_bar_portero", kit_b, CR_PORTERO)
	_monta_balon()
	_balon.position = CR_BALON
	focus = CR_BALON
	var c: float = CR_T_CORTE
	make_camera([
		{"t": 0.0, "dist": 8.0, "h": 2.0, "yaw": CR_YAW_1, "aim_y": 0.9, "fov": 40.0,
			"focus_x": 33.3, "focus_z": 1.2},
		{"t": c - 0.01, "dist": 8.0, "h": 2.0, "yaw": CR_YAW_1 - 4.0, "aim_y": 0.9,
			"fov": 40.0, "focus_x": 33.5, "focus_z": 0.8},
		{"t": c, "dist": 10.0, "h": 1.9, "yaw": 170.0, "aim_y": 1.2, "fov": 40.0,
			"focus_x": 0.8, "focus_z": 4.0},
		{"t": DURA, "dist": 10.5, "h": 1.9, "yaw": 173.0, "aim_y": 1.25, "fov": 40.0,
			"focus_x": 1.0, "focus_z": 4.0},
	], 40.0)
	orbit_speed = 0.3
	_cortes = [c]
	stadium.crowd_excite(0.8)
	_t_cifra = CR_T_GRITO
	_t_sello = CR_T_SELLO
	_t_firma = CR_T_FIRMA


func _tick_corner_rapido() -> void:
	_bola([
		[CR_T_SAQUE + 0.02, CR_T_REMATE, CR_BALON, CR_PIE, 1.0],
		[CR_T_REMATE + 0.05, CR_T_RED, CR_PIE, CR_RED, 0.2],
		[CR_T_RED, CR_T_RED + 0.3, CR_RED, Vector3(1.6, BALON_Y, -1.0), 0.05],
	])


	var saca: AnimatedSprite3D = _r["saca"]
	if t < CR_T_SE_VA:
		_mira("saca", Vector3(-1.0, 0.0, 0.2))
	elif t < CR_T_VUELVE:
		_coloca(saca, CR_SACA.lerp(CR_SE_VA, _tramo(CR_T_SE_VA, CR_T_VUELVE)))
		walk_play(saca, CR_SE_VA - CR_SACA)
	elif t < CR_T_SAQUE - 0.06:
		if _una_vez("saca:para", CR_T_VUELVE):
			walk_play(saca, Vector3.ZERO)
		_carrera("saca", CR_SE_VA, CR_SACA, CR_T_VUELVE, CR_T_SAQUE - 0.06)
	else:
		_gesto("saca", "kick", Vector3(-1.0, 0.0, 0.17), CR_T_SAQUE - 0.06)

	if t < CR_T_CIELO:
		_mira("remata", Vector3(1.0, 0.0, -0.2))
		_gesto("remata", "kick", Vector3(0.05, 0.0, -1.0), CR_T_REMATE - 0.08)
	else:
		_lanza("remata", "cielo", CR_T_CIELO)
		if _una_vez("remata:risa", CR_T_CIELO):
			_cara(_r["remata"], "reir")

	for i in CR_DEF.size():
		var q: String = "d%d" % i
		if t < CR_T_GIRAN:
			_mira(q, Vector3(-1.0, 0.0, 0.3))
		else:
			if _una_vez(q + ":cara", CR_T_GIRAN):
				_cara(_r[q], "protesta")
			_gesto(q, "lost", Vector3(0.2, 0.0, 1.0), CR_T_GIRAN + 0.15 * i, true)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", CR_PORTERO, CR_PORTERO + Vector3(1.2, 0.0, -0.2), CR_T_ESTIRA, false)
	if _una_vez("saque", CR_T_SAQUE):
		sting("kick", -8.0)
	if _una_vez("remate", CR_T_REMATE):
		sting("kick", -4.0)
	if _una_vez("red", CR_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -2.0)
	if _una_vez("sello", CR_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)







const FC_T_CORRE: float = 1.6
const FC_T_TIRO: float = 2.4
const FC_T_ESTIRA: float = 2.46
const FC_T_RED: float = 2.8
const FC_T_PENA: float = 4.2
const FC_T_SELLO: float = 4.6
const FC_RED: Vector3 = Vector3(2.6, 0.3, -0.3)


func _monta_final_en_su_casa() -> void:
	_monta_penalti("flash_che")
	_hoja(_r["tira"], "celebration", "celebration_south_%02d", 1, 6, CELEB_FPS, true)
	_monta_llegan(_kit_de(String(_m["b"]), _m.get("kit_b", {})), "flash_che_casa")
	_camara_penalti(false)
	stadium.crowd_excite(0.9)
	_t_sello = FC_T_SELLO
	_t_firma = PEN_T_FIRMA


func _tick_final_en_su_casa() -> void:
	_bola([
		[FC_T_TIRO + 0.08, FC_T_RED, PEN_PUNTO, FC_RED, 0.05],
		[FC_T_RED, FC_T_RED + 0.35, FC_RED, Vector3(2.7, BALON_Y, -1.0), 0.05],
	])
	if _balon != null:
		_balon.visible = t < PEN_T_CORTE
	_tick_tirador(FC_T_CORRE, FC_T_TIRO, FC_T_PENA, true)

	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", PEN_PORTERO, PEN_PORTERO + Vector3(-1.3, 0.0, 0.0), FC_T_ESTIRA, true)
	_tick_llegan()
	if _una_vez("tiro", FC_T_TIRO):
		sting("kick", -6.0)
	if _una_vez("red", FC_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_ooh", -4.0)
	if _una_vez("sello", FC_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.05, 0.3)













const NL_T_TIRO: float = 1.2
const NL_T_RED: float = 1.75
const NL_T_SE_VA: float = 1.85
const NL_T_GRITO: float = 1.9
const NL_T_MANOS: float = 2.0
const NL_T_CAMISETA: float = 2.35
const NL_T_CORTE: float = 2.6
const NL_T_PROTESTA: float = 2.75
const NL_T_SELLO: float = 4.2
const NL_T_FIRMA: float = 6.8
const NL_TIRA_DE: Vector3 = Vector3(-1.6, 0.0, 18.6)
const NL_TIRA: Vector3 = Vector3(-1.2, 0.0, 17.1)

const NL_FIESTA: Vector3 = Vector3(-1.8, 0.0, 14.6)
const NL_PIE: Vector3 = Vector3(-1.0, BALON_Y, 16.6)
const NL_RED: Vector3 = Vector3(2.9, 2.2, -0.2)


const NL_DEF: Vector3 = Vector3(0.8, 0.0, 13.4)
const NL_PORTERO: Vector3 = Vector3(-0.3, 0.0, 0.8)
const NL_ARBITRO: Vector3 = Vector3(6.0, 0.0, 14.0)
const NL_P1: Vector3 = Vector3(5.0, 0.0, 14.7)
const NL_P2: Vector3 = Vector3(6.5, 0.0, 15.2)
const NL_YAW_2: float = 200.0


func _monta_noche_de_londres() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var tira: AnimatedSprite3D = _de_campo("tira", "flash_bar_londres", kit_b, NL_TIRA_DE)
	add_gesto(tira, "empeine", 5, EMPEINE_FPS, tira.get_meta("flash_cfg"))
	_hoja(tira, "shirtoff", "shirtoff_south_%02d", 1, 6, SHIRTOFF_FPS, true)
	var def: AnimatedSprite3D = _de_campo("def", "flash_che_def", kit_a, NL_DEF)
	add_gesto(def, "lost", 5, LOST_FPS, def.get_meta("flash_cfg"))
	_r["por"] = _portero("flash_che_portero", kit_a, NL_PORTERO)
	_r["arb"] = _arbitro_en(NL_ARBITRO, [kit_a, kit_b])
	var p1: AnimatedSprite3D = _de_campo("p1", "flash_che_p1", kit_a, NL_P1)
	_hoja(p1, "angry", "angry_player_south_%02d", 0, 2, ANGRY_FPS, true)
	_cara(p1, "protesta")
	var p2: AnimatedSprite3D = _de_campo("p2", "flash_che_p2", kit_a, NL_P2)
	_hoja(p2, "perdon", "perdon_south_%02d", 1, 4, PERDON_FPS, true)
	_cara(p2, "protesta")
	_monta_balon()
	focus = NL_TIRA
	var c: float = NL_T_CORTE
	make_camera([
		{"t": 0.0, "dist": 12.5, "h": 2.8, "yaw": 178.0, "aim_y": 0.9, "fov": 40.0,
			"focus_x": -1.0, "focus_z": 12.0},
		{"t": NL_T_RED, "dist": 12.5, "h": 2.8, "yaw": 178.0, "aim_y": 1.0, "fov": 40.0,
			"focus_x": -0.8, "focus_z": 11.8},
		{"t": c - 0.01, "dist": 12.0, "h": 2.6, "yaw": 178.0, "aim_y": 1.1, "fov": 40.0,
			"focus_x": -0.6, "focus_z": 12.6},
		{"t": c, "dist": 7.0, "h": 1.7, "yaw": NL_YAW_2, "aim_y": 1.3, "fov": 40.0,
			"focus_x": NL_ARBITRO.x, "focus_z": NL_ARBITRO.z},
		{"t": DURA, "dist": 7.4, "h": 1.7, "yaw": NL_YAW_2 + 4.0, "aim_y": 1.3, "fov": 40.0,
			"focus_x": NL_ARBITRO.x, "focus_z": NL_ARBITRO.z + 0.2},
	], 40.0)
	orbit_speed = 0.4
	_cortes = [c]
	stadium.crowd_excite(0.7)
	_t_cifra = NL_T_GRITO
	_t_sello = NL_T_SELLO
	_t_firma = NL_T_FIRMA


func _tick_noche_de_londres() -> void:
	_bola([
		[NL_T_TIRO, NL_T_RED, NL_PIE, NL_RED, 1.0],
		[NL_T_RED, NL_T_RED + 0.45, NL_RED, Vector3(2.7, BALON_Y, -1.0), 0.05],
	])

	if t < NL_T_SE_VA:
		if _carrera("tira", NL_TIRA_DE, NL_TIRA, 0.4, NL_T_TIRO - 0.1):
			_gesto("tira", "empeine", Vector3(0.23, 0.0, -1.0), NL_T_TIRO - 0.1)
	elif t < NL_T_CAMISETA:
		_carrera("tira", NL_TIRA, NL_FIESTA, NL_T_SE_VA, NL_T_CAMISETA)
	else:
		_lanza("tira", "shirtoff", NL_T_CAMISETA)
		if _una_vez("tira:risa", NL_T_CAMISETA):
			_cara(_r["tira"], "reir")
	if t < NL_T_MANOS:
		_mira("def", NL_TIRA - NL_DEF if t < NL_T_TIRO else Vector3(0.0, 0.0, -1.0))
	else:
		if _una_vez("def:cara", NL_T_MANOS):
			_cara(_r["def"], "llorar")
		_gesto("def", "lost", Vector3(0.2, 0.0, 1.0), NL_T_MANOS, true)
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", NL_PORTERO, NL_PORTERO + Vector3(1.4, 0.0, -0.1), NL_T_TIRO + 0.25, false)

	var a_cam: Vector3 = Vector3(sin(deg_to_rad(NL_YAW_2)), 0.0, - cos(deg_to_rad(NL_YAW_2)))
	_mira("arb", a_cam)
	if t < NL_T_PROTESTA:
		_mira("p1", NL_ARBITRO - NL_P1)
		_mira("p2", NL_ARBITRO - NL_P2)
	else:
		_lanza("p1", "angry", NL_T_PROTESTA)
		_lanza("p2", "perdon", NL_T_PROTESTA + 0.15)
	if _una_vez("tiro", NL_T_TIRO):
		sting("kick", -4.0)
	if _una_vez("red", NL_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_ooh", -4.0)
	if _una_vez("protesta", NL_T_PROTESTA):
		sting("crowd_boo", -6.0)
	if _una_vez("sello", NL_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)













const PK_T_CORNER: float = 0.9
const PK_T_CORTE: float = 1.3
const PK_T_SALTA: float = 1.75
const PK_T_CABEZA: float = 2.0
const PK_T_ESTIRA: float = 2.12
const PK_T_RED: float = 2.35
const PK_T_GRITO: float = 2.5
const PK_T_LOST: float = 2.9
const PK_T_CIELO: float = 3.2
const PK_T_SELLO: float = 3.6
const PK_T_FIRMA: float = 6.8
const PK_SUBE_DE: Vector3 = Vector3(2.6, 0.0, 31.0)
const PK_SUBE_MEDIO: Vector3 = Vector3(1.7, 0.0, 19.5)
const PK_SUBE_AREA: Vector3 = Vector3(1.6, 0.0, 9.4)
const PK_SUBE: Vector3 = Vector3(0.45, 0.0, 5.3)
const PK_FIN: Vector3 = Vector3(3.0, 0.0, 8.0)
const PK_CORNER: Vector3 = Vector3(-33.4, BALON_Y, 0.5)
const PK_C: Vector3 = Vector3(0.35, 2.25, 5.1)
const PK_RED: Vector3 = Vector3(-2.0, 0.6, -0.3)
const PK_DEF: Vector3 = Vector3(-0.4, 0.0, 4.9)
const PK_PORTERO: Vector3 = Vector3(0.6, 0.0, 1.1)


func _monta_portero_cabecea() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var gk_a: Dictionary = KitRecolor.keeper_field_cfg(KitRecolor.keeper_con_pecho(
		_gk(_m.get("portero_a", Color("3c8d4a"))), kit_a))
	var sube: AnimatedSprite3D = _de_campo("sube", "flash_ame_portero", gk_a, PK_SUBE_DE)
	add_gesto(sube, "header", 6, HEADER_FPS, sube.get_meta("flash_cfg"))
	_hoja(sube, "cielo", "cielo_south_%02d", 1, 4, CIELO_FPS, true)
	var def: AnimatedSprite3D = _de_campo("def", "flash_caz_def", kit_b, PK_DEF)
	add_gesto(def, "header", 6, HEADER_FPS, def.get_meta("flash_cfg"))
	add_gesto(def, "lost", 5, LOST_FPS, def.get_meta("flash_cfg"))
	_r["por"] = _portero("flash_caz_portero", kit_b, PK_PORTERO)
	_monta_balon()
	focus = PK_SUBE_DE
	var c: float = PK_T_CORTE
	make_camera([
		{"t": 0.0, "dist": 8.0, "h": 2.0, "yaw": 172.0, "aim_y": 1.2, "fov": 40.0,
			"focus_x": 2.4, "focus_z": 27.5},
		{"t": c - 0.01, "dist": 8.5, "h": 2.1, "yaw": 174.0, "aim_y": 1.2, "fov": 40.0,
			"focus_x": 1.9, "focus_z": 20.5},
		{"t": c, "dist": 10.5, "h": 2.2, "yaw": 168.0, "aim_y": 1.6, "fov": 40.0,
			"focus_x": 0.2, "focus_z": 4.3},
		{"t": 2.4, "dist": 10.6, "h": 2.2, "yaw": 169.0, "aim_y": 1.6, "fov": 40.0,
			"focus_x": 0.2, "focus_z": 4.3},
		{"t": 4.2, "dist": 8.5, "h": 1.6, "yaw": 188.0, "aim_y": 1.3, "fov": 40.0,
			"focus_x": 2.6, "focus_z": 7.6},
	], 40.0)
	orbit_speed = 0.5
	_cortes = [c]
	stadium.crowd_excite(0.9)
	_t_cifra = PK_T_GRITO
	_t_sello = PK_T_SELLO
	_t_firma = PK_T_FIRMA


func _tick_portero_cabecea() -> void:
	_bola([
		[PK_T_CORNER, PK_T_CABEZA, PK_CORNER, PK_C, 5.0],
		[PK_T_CABEZA, PK_T_RED, PK_C, PK_RED, 0.0],
		[PK_T_RED, PK_T_RED + 0.35, PK_RED, Vector3(-2.1, BALON_Y, -1.0), 0.05],
	])

	if t < PK_T_CORTE:
		_carrera("sube", PK_SUBE_DE, PK_SUBE_MEDIO, 0.0, PK_T_CORTE)
	elif t < PK_T_SALTA:
		_carrera("sube", PK_SUBE_AREA, PK_SUBE, PK_T_CORTE, PK_T_SALTA)
	elif t < PK_T_GRITO:
		_gesto("sube", "header", Vector3(-0.4, 0.0, -1.0), PK_T_SALTA + 0.1)
		_alza("sube", _salto(PK_T_SALTA, 0.55, 0.5))
	elif t < PK_T_CIELO:
		_alza("sube", 0.0)
		_carrera("sube", PK_SUBE, PK_FIN, PK_T_GRITO, PK_T_CIELO)
	else:
		_lanza("sube", "cielo", PK_T_CIELO)
		if _una_vez("sube:risa", PK_T_CIELO):
			_cara(_r["sube"], "reir")

	if t < PK_T_GRITO:
		_mira("def", _bola_ya - PK_DEF)
		_gesto("def", "header", Vector3(-1.0, 0.0, 0.2), PK_T_SALTA + 0.08)
		_alza("def", _salto(PK_T_SALTA + 0.03, 0.5, 0.3))
	else:
		_alza("def", 0.0)
		if t >= PK_T_LOST:
			if _una_vez("def:cara", PK_T_LOST):
				_cara(_r["def"], "llorar")
			_gesto("def", "lost", Vector3(0.0, 0.0, 1.0), PK_T_LOST, true)
		else:
			_mira("def", Vector3(0.0, 0.0, -1.0))
	_mira("por", Vector3(0.0, 0.0, 1.0))
	_estirada("por", PK_PORTERO, PK_PORTERO + Vector3(-1.3, 0.0, -0.2), PK_T_ESTIRA, true)
	if _una_vez("corner", PK_T_CORNER):
		sting("kick", -12.0)
	if _una_vez("cabeza", PK_T_CABEZA):
		sting("kick", -8.0)
	if _una_vez("red", PK_T_RED):
		sting("net_swish", -4.0)
		sting("crowd_roar", -2.0)
	if _una_vez("sello", PK_T_SELLO):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)










const FM_T_ARRANCA: float = 0.3
const FM_T_TIRO: float = 2.5
const FM_T_PEGA: float = 2.6
const FM_T_SE_VA: float = 2.9
const FM_T_ATRAPA: float = 3.3
const FM_T_ENTRA: float = 3.4
const FM_T_CIFRA: float = 3.45
const FM_T_RODILLAS: float = 4.3
const FM_T_FIRMA: float = 6.8
const FM_CORRE_DE: Vector3 = Vector3(-2.0, 0.0, 28.0)
const FM_CORRE: Vector3 = Vector3(0.3, 0.0, 8.0)
const FM_FIN: Vector3 = Vector3(1.8, 0.0, 5.2)
const FM_DESLIZA: Vector3 = Vector3(0.1, 0.0, 1.1)

const FM_SIGUE_DE: Vector3 = Vector3(-3.2, 0.0, 29.5)
const FM_SIGUE: Vector3 = Vector3(-0.9, 0.0, 9.5)


const FM_SIGUE_FIN: Vector3 = Vector3(0.2, 0.0, 8.3)
const FM_LLEVA_M: float = 0.8
const FM_GOL: Vector3 = Vector3(0.2, BALON_Y, -0.6)


func _monta_final_en_madrid() -> void:
	var kit_a: Dictionary = _kit_de(String(_m["a"]), _m.get("kit_a", {}))
	var kit_b: Dictionary = _kit_de(String(_m["b"]), _m.get("kit_b", {}))
	var corre: AnimatedSprite3D = _de_campo("corre", "flash_rive_corre", kit_a, FM_CORRE_DE)
	add_gesto(corre, "empeine", 5, EMPEINE_FPS, corre.get_meta("flash_cfg"))
	_gesto_suelto(corre, "rodillas", 6, RODILLAS_FPS, false)
	var sigue: AnimatedSprite3D = _de_campo("sigue", "flash_boca_sigue", kit_b, FM_SIGUE_DE)
	add_gesto(sigue, "lost", 5, LOST_FPS, sigue.get_meta("flash_cfg"))
	_monta_balon()
	focus = FM_CORRE_DE
	var keys: Array = []
	for s in [0.0, FM_T_ARRANCA, 1.2, 2.0]:
		var p: Vector3 = FM_CORRE_DE.lerp(FM_CORRE, _tramo_en(s, FM_T_ARRANCA, FM_T_TIRO))
		keys.append({"t": s, "dist": 14.0, "h": 2.6, "yaw": 165.0 + float(s), "aim_y": 1.0,
			"fov": 40.0, "focus_x": p.x + 0.3, "focus_z": p.z - 2.0})
	keys.append({"t": FM_T_PEGA, "dist": 14.0, "h": 2.6, "yaw": 167.0, "aim_y": 1.0,
		"fov": 40.0, "focus_x": 0.2, "focus_z": 6.0})
	keys.append({"t": 4.6, "dist": 9.0, "h": 1.7, "yaw": 188.0, "aim_y": 1.0, "fov": 40.0,
		"focus_x": 1.2, "focus_z": 5.8})
	make_camera(keys, 40.0)
	orbit_speed = 0.4
	stadium.crowd_excite(0.9)
	_t_cifra = FM_T_CIFRA
	_t_firma = FM_T_FIRMA



func _tramo_en(s: float, t0: float, t1: float) -> float:
	return clampf((s - t0) / maxf(t1 - t0, 0.001), 0.0, 1.0)


func _tick_final_en_madrid() -> void:

	if t < FM_T_SE_VA:
		if _carrera("corre", FM_CORRE_DE, FM_CORRE, FM_T_ARRANCA, FM_T_TIRO):
			_gesto("corre", "empeine", Vector3(-0.05, 0.0, -1.0), FM_T_TIRO)
	elif t < FM_T_RODILLAS:
		_carrera("corre", FM_CORRE, FM_FIN, FM_T_SE_VA, FM_T_RODILLAS)
	else:
		_lanza("corre", "rodillas_south", FM_T_RODILLAS)
		if _una_vez("corre:risa", FM_T_RODILLAS):
			_cara(_r["corre"], "reir")
		var k: float = _tramo(FM_T_RODILLAS, FM_T_RODILLAS + RODILLAS_S)
		_coloca(_r["corre"], FM_FIN.lerp(FM_FIN + FM_DESLIZA, 1.0 - pow(1.0 - k, 2.0)))

	if t < FM_T_PEGA:
		if _balon != null:
			var c: Vector3 =(_r["corre"] as AnimatedSprite3D).position
			_balon.position = Vector3(c.x, BALON_Y, c.z - FM_LLEVA_M)
			_bola_ya = _balon.position
	else:
		var pie: Vector3 = Vector3(FM_CORRE.x, BALON_Y, FM_CORRE.z - FM_LLEVA_M)
		_bola([[FM_T_PEGA, FM_T_ENTRA, pie, FM_GOL, 0.0]])

	if t < FM_T_PEGA:
		_carrera("sigue", FM_SIGUE_DE, FM_SIGUE, FM_T_ARRANCA, FM_T_PEGA)
	elif t < FM_T_ATRAPA:
		_carrera("sigue", FM_SIGUE, FM_SIGUE_FIN, FM_T_PEGA, FM_T_ATRAPA)
	else:
		if _una_vez("sigue:cara", FM_T_ATRAPA):
			_cara(_r["sigue"], "llorar")
		_gesto("sigue", "lost", Vector3(0.3, 0.0, 1.0), FM_T_ATRAPA, true)
	if _una_vez("tiro", FM_T_PEGA):
		sting("kick", -4.0)
	if _una_vez("red", FM_T_ENTRA):
		sting("net_swish", -4.0)
		sting("crowd_roar", -2.0)
	if _una_vez("cifra", FM_T_CIFRA):
		sting("stinger_bad", -6.0)
		shake(0.06, 0.4)









func _monta_textos() -> void:
	_capa = Control.new()
	_capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	_capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_capa)
	_rotulo = VBoxContainer.new()
	_rotulo.set_anchors_preset(Control.PRESET_TOP_WIDE)
	_rotulo.offset_top = UiKit.top_safe_inset(get_viewport()) + 56.0
	_rotulo.offset_left = 48.0
	_rotulo.offset_right = -48.0
	_rotulo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rotulo.add_theme_constant_override("separation", 6)
	_capa.add_child(_rotulo)
	var fecha: Label = _texto(String(_m.get("fecha", "")), CareerTheme.T_TITLE, CareerTheme.TEXT)
	_rotulo.add_child(fecha)
	var donde: String = String(_m.get("ciudad", ""))
	if _m.has("minuto"):
		donde += " · " + String(_m["minuto"])
	_rotulo.add_child(_texto(donde, CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT_MID))





	var marcador: String = Flashback.tablero(_m)
	if not marcador.is_empty():
		_rotulo.add_child(_texto(marcador, CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT))


	if _m.has("cifra"):
		_cifra = _texto(String(_m["cifra"]), CareerTheme.T_SCORE * 2, CareerTheme.DANGER)
	elif _m.has("grito"):
		_cifra = _texto(I18n.t(String(_m["grito"])), int(CareerTheme.T_SCORE * 1.5),
			CareerTheme.TEXT)
	if _cifra != null:
		_cifra.set_anchors_preset(Control.PRESET_CENTER)
		_cifra.anchor_top = _alto_golpe()
		_cifra.anchor_bottom = _alto_golpe()
		_cifra.anchor_left = 0.0
		_cifra.anchor_right = 1.0
		_cifra.offset_left = 24.0
		_cifra.offset_right = -24.0
		_cifra.grow_vertical = Control.GROW_DIRECTION_BOTH
		_capa.add_child(_cifra)
	if _m.has("sello") and _t_sello >= 0.0:
		_monta_sello()
	var quien: String = CareerTheme.caps(Flashback.nombre(_m, "herido"))
	_firma = _texto(I18n.tf("{0} NO LO OLVIDA", [quien]), CareerTheme.T_TITLE, CareerTheme.TEXT)
	_firma.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_firma.offset_left = 40.0
	_firma.offset_right = -40.0
	_firma.offset_bottom = -(UiKit.bottom_safe_inset(get_viewport()) + 150.0)
	_firma.grow_vertical = Control.GROW_DIRECTION_BEGIN
	_capa.add_child(_firma)
	for n in [_rotulo, _cifra, _firma]:
		if n != null:
			(n as Control).modulate.a = 0.0

	_blanco = ColorRect.new()
	_blanco.color = CareerTheme.TEXT
	_blanco.set_anchors_preset(Control.PRESET_FULL_RECT)
	_blanco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_blanco)





func _alto_golpe() -> float:
	return float(_m.get("alto", 0.31))


func _texto(s: String, px: int, col: Color, encoge: bool = true) -> Label:
	var l: Label = CareerUi.plain(px, col)
	l.text = s
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.add_theme_constant_override("outline_size", maxi(8, px / 8))
	l.add_theme_color_override("font_outline_color", CareerTheme.SHADOW_HARD)
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE


	if encoge:
		l.clip_text = true
		CareerUi.autoshrink(l, 18)
	return l




func _monta_sello() -> void:
	_sello = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = Color(CareerTheme.DANGER, 0.14)
	sb.border_color = CareerTheme.DANGER
	sb.set_border_width_all(8)
	sb.set_corner_radius_all(6)
	sb.content_margin_left = 28.0
	sb.content_margin_right = 28.0
	sb.content_margin_top = 10.0
	sb.content_margin_bottom = 10.0
	_sello.add_theme_stylebox_override("panel", sb)
	_sello.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_sello.anchor_left = 0.5
	_sello.anchor_right = 0.5
	_sello.anchor_top = _alto_golpe()
	_sello.anchor_bottom = _alto_golpe()
	_sello.grow_horizontal = Control.GROW_DIRECTION_BOTH
	_sello.grow_vertical = Control.GROW_DIRECTION_BOTH
	_sello.rotation = deg_to_rad(-7.0)
	var l: Label = _texto(I18n.t(String(_m.get("sello", ""))), CareerTheme.T_SCORE,
		CareerTheme.DANGER, false)


	var ancho: float = SceneFade.rect_visible(self).size.x * 0.84 - 56.0 - 16.0
	var fuente: Font = l.get_theme_font("font")
	var px: int = CareerTheme.T_SCORE
	while px > 40 and fuente != null \
			and fuente.get_string_size(l.text, HORIZONTAL_ALIGNMENT_LEFT, -1, px).x > ancho:
		px -= 4
	l.add_theme_font_size_override("font_size", px)
	_sello.add_child(l)
	_sello.modulate.a = 0.0
	_capa.add_child(_sello)



func _sube(desde: float, entra: float) -> float:
	return clampf((t - desde) / maxf(entra, 0.001), 0.0, 1.0)



func _golpea(c: Control, desde: float) -> void:
	c.pivot_offset = c.size * 0.5
	var k: float = _sube(desde, GOLPE_S)
	var e: float = lerpf(1.6, 1.0, 1.0 - pow(1.0 - k, 3.0))
	c.scale = Vector2(e, e)
	c.modulate.a = k


func _tick(_delta: float) -> void:
	if _m.is_empty():
		return
	match _id:
		Flashback.SIETE_UNO:
			_tick_siete_uno()
		Flashback.NO_ERA_PENAL:
			_tick_no_era_penal()
		Flashback.LA_MANO:
			_tick_la_mano()
		Flashback.GOL_FANTASMA:
			_tick_gol_fantasma()
		Flashback.MANO_EN_LA_LINEA:
			_tick_mano_en_la_linea()
		Flashback.PENAL_AL_CIELO:
			_tick_penal_al_cielo()
		Flashback.MINUTO_116:
			_tick_minuto_116()
		Flashback.RESBALON:
			_tick_resbalon()
		Flashback.ESTAMBUL:
			_tick_estambul()
		Flashback.REMONTADA:
			_tick_remontada()
		Flashback.NOVENTA_Y_DOS:
			_tick_noventa_y_dos()
		Flashback.CORNER_RAPIDO:
			_tick_corner_rapido()
		Flashback.FINAL_EN_SU_CASA:
			_tick_final_en_su_casa()
		Flashback.NOCHE_DE_LONDRES:
			_tick_noche_de_londres()
		Flashback.PORTERO_CABECEA:
			_tick_portero_cabecea()
		Flashback.FINAL_EN_MADRID:
			_tick_final_en_madrid()
		_:
			_tick_guion()
	if _blanco != null:
		var entra: float = 1.0 - _sube(0.0, BLANCO_IN)
		var sale: float = _sube(DURA - BLANCO_OUT, BLANCO_OUT)

		var chispa: float = 0.0
		for c in _cortes:
			if t >= c - 0.04:
				chispa = maxf(chispa, 0.7 *(1.0 - _sube(c, CORTE_S)))
		_blanco.modulate.a = maxf(maxf(entra, sale), chispa)
	if _rotulo != null:
		_rotulo.modulate.a = _sube(T_ROTULO, 0.5)
	if _cifra != null:
		_golpea(_cifra, _t_cifra)

		if _sello != null and t >= _t_sello:
			_cifra.modulate.a = lerpf(1.0, 0.35, _sube(_t_sello, 0.25))
	if _sello != null:
		_golpea(_sello, _t_sello)
	if _firma != null:
		_firma.modulate.a = _sube(_t_firma, 0.6)
	if t >= DURA:
		_leave()














const FlashbackGuiones: GDScript = preload("res://ui/ceremonies/flashback_guiones.gd")
var _g: Dictionary = {}



const GUION_GESTOS: Dictionary = {
	"header": [6, HEADER_FPS], "volea": [5, VOLEA_FPS], "kick": [4, KICK_FPS],
	"empeine": [5, EMPEINE_FPS], "control": [6, CONTROL_FPS], "lost": [5, LOST_FPS],
	"clap": [4, CLAP_FPS], "fall": [FALL_CUADROS, FALL_FPS],

	"chilena": [8, 12.0],
}
const GUION_HOJAS: Dictionary = {
	"celebration": ["celebration_south_%02d", 1, 6, CELEB_FPS],
	"cielo": ["cielo_south_%02d", 1, 4, CIELO_FPS],
	"perdon": ["perdon_south_%02d", 1, 4, PERDON_FPS],
	"angry": ["angry_player_south_%02d", 0, 2, ANGRY_FPS],
}
const GUION_SUELO: Dictionary = {"rodillas": [6, RODILLAS_FPS, false], "cesped": [4, CESPED_FPS, true]}


func _monta_guion() -> void:
	_g = FlashbackGuiones.de(_id)
	var kits: Dictionary = {
		"a": _kit_de(String(_m["a"]), _m.get("kit_a", {})),
		"b": _kit_de(String(_m["b"]), _m.get("kit_b", {})),
	}
	for act: Dictionary in _g.get("actores", []):
		var quien: String = String(act["id"])
		var kit: Dictionary = kits[String(act.get("bando", "a"))]
		var semilla: String = Legends.cara_de_real(String(act.get("cara", "")))
		if semilla.is_empty():
			semilla = "flash_%s_%s" % [_id, quien]
		var en: Vector3 = act["en"]
		if bool(act.get("portero", false)):
			_r[quien] = _portero(semilla, kit, en)
			continue
		var spr: AnimatedSprite3D = _de_campo(quien, semilla, kit, en)
		var cfg: Dictionary = spr.get_meta("flash_cfg")
		for anim: String in act.get("anims", []):
			if GUION_GESTOS.has(anim):
				add_gesto(spr, anim, int(GUION_GESTOS[anim][0]), float(GUION_GESTOS[anim][1]), cfg)
			elif GUION_HOJAS.has(anim):
				var h: Array = GUION_HOJAS[anim]
				_hoja(spr, anim, String(h[0]), int(h[1]), int(h[2]), float(h[3]), true)
			elif GUION_SUELO.has(anim):
				var g: Array = GUION_SUELO[anim]
				_gesto_suelto(spr, anim, int(g[0]), float(g[1]), bool(g[2]))
	if _g.has("arbitro"):
		_r["arb"] = _arbitro_en(_g["arbitro"], kits.values())
	_monta_balon()
	var tramos: Array = _g.get("bola", [])
	if not tramos.is_empty():
		_balon.position =(tramos[0] as Array)[2]
	focus = _g.get("focus", Vector3.ZERO)
	make_camera(_g.get("camara", []), 40.0)
	orbit_speed = float(_g.get("orbita", 0.4))
	_cortes.assign(_g.get("cortes", []))
	stadium.crowd_excite(float(_g.get("excita", 0.8)))
	_t_cifra = float(_g.get("t_cifra", SU_T_CIFRA))
	_t_firma = float(_g.get("t_firma", SU_T_FIRMA))
	if _m.has("sello"):
		_t_sello = float(_g.get("t_sello", _t_cifra + 0.9))


func _tick_guion() -> void:
	if _g.is_empty():
		return
	_bola(_g.get("bola", []))
	var pasos: Array = _g.get("pasos", [])


	var carrera: Dictionary = {}
	for p: Array in pasos:
		if String(p[0]) == "corre" and t >= float(p[4]):
			carrera[String(p[1])] = p
	var corriendo: Dictionary = {}
	for quien: String in carrera:
		var p: Array = carrera[quien]
		if not _carrera(quien, p[2], p[3], float(p[4]), float(p[5])):
			corriendo[quien] = true

	for i in pasos.size():
		var p: Array = pasos[i]
		match String(p[0]):
			"mira":
				var quien: String = String(p[1])
				if not corriendo.has(quien) and t >= float(p[3]) and t < float(p[4]) \
						and _r.has(quien):
					var dir: Vector3 = _bola_ya -(_r[quien] as Node3D).position \
							if p[2] is String else p[2]
					_mira(quien, Vector3(dir.x, 0.0, dir.z))
			"gesto":
				_gesto(String(p[1]), String(p[2]), p[3], float(p[4]), bool(p[5]))
			"lanza":
				_lanza(String(p[1]), String(p[2]), float(p[3]))
			"cara":
				if _r.has(String(p[1])) and _una_vez("cara%d" % i, float(p[3])):
					_cara(_r[String(p[1])], String(p[2]))
			"estira":
				if t >= float(p[4]):
					_estirada(String(p[1]), p[2], p[3], float(p[4]), bool(p[5]))
			"salta":
				_alza(String(p[1]), _salto(float(p[2]), float(p[3]), float(p[4])))
			"suena":
				if _una_vez("suena%d" % i, float(p[3])):
					sting(String(p[1]), float(p[2]))
			"tiembla":
				if _una_vez("tiembla%d" % i, float(p[3])):
					shake(float(p[1]), float(p[2]))









func _leave() -> void:
	if _leaving:
		return
	if replay or standalone or embedded:
		super._leave()


		if replay:
			replay_hecho = Escenas.id_recuerdo(_id)
		return
	_sella()
	_leaving = true
	Music.play(Competitions.music_of(GameState.current_fixture()), 1.4)
	Music.set_intensity(0.3)
	SceneFade.to_scene(_destino())


func _destino() -> String:
	var to: String = Career.match_scene_target()
	if to.is_empty():
		return Career.acto_o_suelo(HUB_SCENE)
	if to == scene_file_path or to == Ceremonies.scene_of(Ceremonies.FLASHBACK):
		return Career.MATCH_SCENE
	return to
