extends "res://ui/ceremonies/banca_juego.gd"




















































































const BALON_M: float = 0.42
const BALON_PAD_PX: float = 3.0


const DELANTE: float = 0.3








const TOQUES: Dictionary = {
	"derecha": {"gesto": "kick", "cuadros": 4, "golpe": 3, "lado": 0.24,
		"giro": ["rollfwd", 0.5]},
	"izquierda": {"gesto": "despeje", "cuadros": 5, "golpe": 3, "lado": -0.18,
		"giro": ["rollfwd", 0.45]},
	"muslo": {"gesto": "empeine", "cuadros": 5, "golpe": 4, "lado": 0.06,
		"giro": ["rollfwd", 0.2]},
	"pecho": {"gesto": "chest", "cuadros": 6, "golpe": 4, "lado": 0.0,
		"giro": ["rollfwd", 0.08]},
	"cabeza": {"gesto": "header", "cuadros": 4, "golpe": 3, "lado": 0.0, "delante": 0.08,
		"giro": ["rollfwd", -0.35]},
	"exterior": {"gesto": "control", "cuadros": 6, "golpe": 4, "lado": 0.5,
		"giro": ["rollside", 0.6]},
	"volea": {"gesto": "volea", "cuadros": 5, "golpe": 4, "lado": 0.6,
		"giro": ["rollside", -0.8]},
}



const GIRO_AIRE: float = 0.5
const VUELTAS_VARA: float = 2.5








const COSTADO_Z: float = 1.5
const COSTADO_X: float = 0.9


const LIBRE: float = 0.8



const FOCO_BANCO: float = 0.55



const TOQUE_FPS: float = 12.0
const SUELO_Y: float = BALON_M * 0.5




const ARO_R: int = 17
const ARO_TRAZO: int = 2
const ARO_LEJOS: float = 3.0
const ARO_DETRAS: float = 0.04


const ARO_ENTRA: float = 0.08
const ARO_ECO: float = 0.24





const ARO_CASI: float = 0.4


const LISTOS: float = 0.9
const PAUSA: float = 1.4



const GRADA_VIDA: Array[float] = [0.5, 0.6, 0.72, 0.84, 0.94, 1.0]
const GRADA_PIE: Array[float] = [0.0, 0.15, 0.35, 0.6, 0.85, 1.0]



const AUTO_TOQUES: Array[int] = [22, 3, 12]




const MIRADA_EN: int = 100
const MIRADA_CORTE: float = 0.35
const MIRADA_GIRA: float = 1.25
const MIRADA_VUELVE: float = 3.2
const MIRADA_YAW: float = 20.0

var _toca_b: Button
var _cuenta_yo: Label

var _record_l: Label
var _corona: MenuIcon
var _hacia: Vector3 = Vector3(1.0, 0.0, 0.0)


var _derecha: Vector3 = Vector3(0.0, 0.0, -1.0)





var _l: Dictionary = {}



var _aro_meta: Sprite3D
var _aro_cierra: Sprite3D
var _aro_eco: Sprite3D
var _aros: Dictionary = {}
var _aro_tw: Tween
var _ronda: int = -1
var _fase: String = ""
var _t: float = 0.0

var _record0: int = 0
var _mejor: int = 0

var _escalon: int = 0
var _cantado: bool = false




var _mirada_libre: bool = false
var _mirada_t: float = -1.0
var _mirada_hecha: bool = false
var _mirada_dt: AnimatedSprite3D
var _mirada_cam: Dictionary = {}
var _mirada_orbita: float = 0.0
var _desde: int = 0


func _kind() -> String:
	return Ceremonies.BANCA_DOMINADAS


func _titulo() -> String:
	return "DOMINADAS"



func _bolitas() -> int:
	return BancaJuego.DOM_INTENTOS


func _contra() -> bool:
	return false




func _gestos() -> Array:
	return []





func _sienta_pareja() -> void:
	var sentados: Array[Dictionary] = stadium.dugout_sentados(true)
	super._sienta_pareja()
	var look: Dictionary = GameState.player_look()
	look["bib"] = Stadium.BIB_COLORS[0]
	_y0.erase(yo)


	var fr: SpriteFrames = null if sentados.is_empty() else stadium.sentado_frames(
		KitRecolor.appearance_for("banca_dominadas_1", look))
	if fr == null:
		yo.visible = false
	else:
		yo.sprite_frames = fr
		yo.play("idle")
	var base: Vector3 = _costado(sentados)
	yo = _de_pie(look, base)
	focus = Vector3(base.x, 0.0, base.z + FOCO_BANCO)



func _costado(sentados: Array[Dictionary]) -> Vector3:
	if sentados.is_empty():
		return stadium.dugout_wait_spot(true)
	var primero: Vector3 = sentados[0]["pos"]
	var p: Vector3 = Vector3(primero.x + COSTADO_X, 0.0, primero.z - COSTADO_Z)
	for _vez in 3:
		if not _ocupado(p):
			break
		p.z -= COSTADO_Z
	return p


func _ocupado(p: Vector3) -> bool:
	var i: int = 0
	while true:
		var inf: Dictionary = stadium.dugout_person_info(i)
		if inf.is_empty():
			return false
		i += 1
		var q: Vector3 = inf["pos"]
		if bool(inf["yours"]) and Vector2(q.x - p.x, q.z - p.z).length() < LIBRE:
			return true
	return false


func _de_pie(cfg: Dictionary, at: Vector3) -> AnimatedSprite3D:
	var s: AnimatedSprite3D = AnimatedSprite3D.new()
	s.pixel_size = PLAYER_HEIGHT_M / PLAYER_METRICS.x
	s.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	s.sprite_frames = player_frames(cfg)
	viewport.add_child(s)
	s.position = Vector3(at.x, feet_offset(s.pixel_size) - PLAYER_SINK, at.z)
	s.play("idle")
	for tipo: String in TOQUES:
		var e: Dictionary = TOQUES[tipo]
		add_gesto(s, e["gesto"], int(e["cuadros"]), TOQUE_FPS, cfg)
	CaraViva.pon(s)
	s.animation_finished.connect(_al_reposo.bind(s))
	_y0[s] = s.position.y
	return s







func _juego_keys() -> Array:
	return [
		{"t": 0.0, "dist": 9.6, "h": 2.8, "yaw": 72.0, "aim_y": 1.05, "fov": 38.0},
		{"t": 2.6, "dist": 8.2, "h": 2.3, "yaw": 80.0, "aim_y": 0.98, "fov": 36.0},
	]


func _build() -> void:
	super._build()
	_record0 = Career.dom_record
	_desde = maxi(int(data.get("dom_desde", 0)), 0)
	_mirada_libre = bool(data.get("dom_mirada",
		not Achievements.is_unlocked(Achievements.ID_DOMINADAS)))
	var frames: SpriteFrames = BallDeco.frames_for({"comp": "league"})
	var b: AnimatedSprite3D = AnimatedSprite3D.new()
	b.sprite_frames = frames
	b.pixel_size = BALON_M / 32.0
	b.offset = Vector2(0.0, - BALON_PAD_PX)


	b.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	b.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	b.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD





	b.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	viewport.add_child(b)
	if frames != null:
		b.play("idle")
	_l = {"nodo": yo, "balon": b, "n": 0, "t": 0.0, "vivo": false,
		"suelto": false, "v": Vector3.ZERO, "cogido": true,
		"tipo": "derecha", "seguidos": 0, "desde": Vector3.ZERO, "hasta": Vector3.ZERO}
	_hacia_camara()
	_al_pie(_l)
	_pinta_cuentas()
	_pinta_bolitas()
	_aro_meta = _aro_sprite()
	_aro_cierra = _aro_sprite()
	_aro_eco = _aro_sprite()




func _hacia_camara() -> void:
	if cam != null and is_instance_valid(cam):
		var h: Vector3 = cam.global_position - focus
		h.y = 0.0
		if h.length() > 0.01:
			_hacia = h.normalized()

	_derecha =(- _hacia).cross(Vector3.UP).normalized()



func _punto(l: Dictionary, tipo: String) -> Vector3:
	var e: Dictionary = TOQUES[tipo]
	var p: Vector3 =(l["nodo"] as Node3D).global_position
	var h: float = BancaJuego.DOM_ESTILOS[tipo]["h"]
	return Vector3(p.x, h, p.z) + _hacia * float(e.get("delante", DELANTE)) \
			+ _derecha * float(e["lado"])





func _en_suelo(l: Dictionary) -> Vector3:
	var p: Vector3 = _punto(l, "derecha")
	return Vector3(p.x, SUELO_Y, p.z)


func _al_pie(l: Dictionary) -> void:
	var b: AnimatedSprite3D = l["balon"]
	b.position = _en_suelo(l)
	_quieto(b)
	l["cogido"] = true
	l["vivo"] = false
	l["suelto"] = false


func _monta_juego(caja: VBoxContainer) -> void:



	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)

	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	caja.add_child(fila)
	_cuenta_yo = _cuenta(CareerTheme.NAV_YO)

	_cuenta_yo.custom_minimum_size.x = 172
	fila.add_child(_cuenta_yo)
	_toca_b = CareerUi.primary_cta(I18n.t("¡TOCA!"))
	_toca_b.custom_minimum_size.y = 128
	_toca_b.focus_mode = Control.FOCUS_NONE



	UiKit.set_cue(_toca_b, "")
	_toca_b.button_down.connect(_toca)
	_toca_b.disabled = true


	_toca_b.set_meta(Entrada.PRIMERO_META, true)
	fila.add_child(_toca_b)
	var rec: VBoxContainer = VBoxContainer.new()
	rec.alignment = BoxContainer.ALIGNMENT_CENTER
	rec.add_theme_constant_override("separation", 0)
	rec.custom_minimum_size.x = 120
	rec.mouse_filter = Control.MOUSE_FILTER_IGNORE
	fila.add_child(rec)
	_corona = MenuIcon.new()
	_corona.custom_minimum_size = Vector2(40, 40)
	_corona.size_flags_horizontal = Control.SIZE_SHRINK_CENTER
	_corona.mouse_filter = Control.MOUSE_FILTER_IGNORE
	rec.add_child(_corona)
	_corona.setup("corona", CareerTheme.NAV_LEGADO)
	_record_l = _cuenta(CareerTheme.NAV_LEGADO, CareerTheme.T_TITLE_MODAL)
	_record_l.custom_minimum_size = Vector2(120, 0)
	rec.add_child(_record_l)


func _cuenta(col: Color, tam: int = CareerTheme.T_SCORE) -> Label:
	var l: Label = CareerUi.plain(tam, col)
	l.text = "0"
	l.custom_minimum_size.x = 120
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.clip_text = true
	return l


func _juega(delta: float) -> void:
	if _mirada_t >= 0.0:
		_mirada_tick(delta)
		return
	_t += delta
	_mueve(delta)
	if _ronda < 0:
		_nueva_ronda()
	else:
		_juega_fase()
	_pinta_aro()


func _juega_fase() -> void:
	match _fase:
		"listos":
			if _t >= LISTOS:
				_suelta()
		"ronda":
			_ronda_tick()
		"pausa":
			if _t >= PAUSA:
				if _ronda + 1 >= BancaJuego.DOM_INTENTOS:
					termina(1 if _mejor > _record0 else 0)
				else:
					_nueva_ronda()


func _nueva_ronda() -> void:
	_ronda += 1
	_fase = "listos"
	_t = 0.0
	_l["n"] = _desde if _ronda == 0 else 0
	_l["levanto"] = -1
	_al_pie(_l)
	_pinta_cuentas()
	_toca_b.disabled = true
	di(I18n.t("¡TOCA!") if _ronda == 0 else I18n.t("¡OTRA!"))





func _suelta() -> void:
	_fase = "ronda"
	_t = 0.0
	_l["t"] = 0.0
	_l["vivo"] = true
	_l["cogido"] = false
	_l["desde"] =(_l["balon"] as Node3D).position
	_l["tipo"] = BancaJuego.dom_estilo(azar, "", 0, 0, SUELO_Y)
	_l["seguidos"] = 1
	_l["hasta"] = _punto(_l, _l["tipo"])
	_sube_pie(yo)
	_gira(_l["balon"], GIRO_AIRE)
	_toca_b.disabled = false


	foco_juego(_toca_b)

	cara_fondo(yo, "concentra")



func _quieto(b: AnimatedSprite3D) -> void:
	if b.sprite_frames != null:
		b.play("idle")
		b.speed_scale = 1.0





func _gira(b: AnimatedSprite3D, escala: float, eje: String = "rollfwd") -> void:
	var fr: SpriteFrames = b.sprite_frames
	if fr == null:
		return
	var anim: String = eje if fr.has_animation(eje) else "roll"
	if not fr.has_animation(anim):
		return
	if b.animation != anim or not b.is_playing():
		b.play(anim)
	b.speed_scale = escala





func _rueda(b: AnimatedSprite3D, v: Vector3) -> void:
	var plano: Vector3 = Vector3(v.x, 0.0, v.z)
	var rap: float = plano.length()
	var fr: SpriteFrames = b.sprite_frames
	if fr == null or rap < 0.02:
		_quieto(b)
		return
	var escala: float = rap /(PI * BALON_M) / VUELTAS_VARA
	var hacia: float = plano.dot(_hacia) / rap
	if absf(hacia) < 0.7071 and fr.has_animation("rollside"):
		if b.animation != "rollside" or not b.is_playing():
			b.play("rollside")
		b.speed_scale = escala * signf(plano.dot(_derecha))
		return

	_gira(b, - escala if hacia > 0.0 else escala)





func _ronda_tick() -> void:
	if _l["vivo"]:
		var n: int = int(_l["n"])
		var per: float = BancaJuego.dom_periodo(n)
		var tope: int = MIRADA_EN if _desde > 0 and _ronda == 0 \
				else AUTO_TOQUES[mini(_ronda, AUTO_TOQUES.size() - 1)]
		if auto and n < tope and float(_l["t"]) >= per:
			_toque()
			return
		if BancaJuego.dom_cayo(float(_l["t"]), n):
			_se_cae()
	if not _l["vivo"]:
		_cierra()




func _mueve(delta: float) -> void:
	var l: Dictionary = _l
	var b: AnimatedSprite3D = l["balon"]
	if l["cogido"]:
		return
	if l["suelto"]:
		var v: Vector3 = l["v"]
		v.y -= BancaJuego.DOM_G * delta
		var p: Vector3 = b.position + v * delta
		if p.y < SUELO_Y:
			p.y = SUELO_Y
			if v.y < -0.6:

				sting("intro_bote", -8.0)
				v.y = - v.y * 0.42
				v.x *= 0.7
				v.z *= 0.7
			else:
				v = Vector3.ZERO
			_rueda(b, v)
		l["v"] = v
		b.position = p
		return
	if not l["vivo"]:
		return
	l["t"] = float(l["t"]) + delta
	var t: float = l["t"]
	var per: float = BancaJuego.dom_periodo(int(l["n"]))




	var p: float = clampf(t / per, 0.0, 1.0)
	var desde: Vector3 = l["desde"]
	b.position = desde.lerp(l["hasta"], p) \
			+ Vector3.UP *(BancaJuego.dom_vuelo(per) * BancaJuego.dom_altura(p * per, per))


	if int(l.get("levanto", -1)) != int(l["n"]) and t >= per - _adelanto(l["tipo"]):
		l["levanto"] = int(l["n"])
		_gesto_toque(l["nodo"], l["tipo"])




func _adelanto(tipo: String) -> float:
	return (float(TOQUES[tipo]["golpe"]) - 0.5) / TOQUE_FPS


func _gesto_toque(n: AnimatedSprite3D, tipo: String) -> void:
	if not gesto_play(n, TOQUES[tipo]["gesto"], _hacia):
		bota(n, float(BOTE_DE["toque"]))




func _sube_pie(n: AnimatedSprite3D) -> void:
	if not gesto_play(n, "kick", _hacia):
		bota(n, float(BOTE_DE["toque"]))


func _toca() -> void:
	if _fase != "ronda" or acabado or auto:
		return
	var l: Dictionary = _l
	if not l["vivo"]:
		return
	match BancaJuego.dom_toque(float(l["t"]), int(l["n"])):
		BancaJuego.BIEN_TOQUE:
			_toque()
		BancaJuego.PRONTO:

			if int(l.get("levanto", -1)) != int(l["n"]):
				l["levanto"] = int(l["n"])
				_gesto_toque(yo, l["tipo"])
			_se_cae()






func _toque() -> void:
	var l: Dictionary = _l
	var n: int = int(l["n"])
	var b: AnimatedSprite3D = l["balon"]
	var previo: String = l["tipo"]
	var sitio: Vector3 =(l["hasta"] as Vector3) - _hacia * ARO_DETRAS
	var tipo: String = BancaJuego.dom_estilo(azar, previo, int(l["seguidos"]), n + 1,
		float(BancaJuego.DOM_ESTILOS[previo]["h"]))
	l["seguidos"] = int(l["seguidos"]) + 1 if tipo == previo else 1
	l["tipo"] = tipo
	l["desde"] = b.position
	l["hasta"] = _punto(l, tipo)
	l["n"] = n + 1
	l["t"] = 0.0
	var giro: Array = TOQUES[previo]["giro"]
	_gira(b, float(giro[1]), giro[0])
	_aro_suelta(sitio, CareerTheme.NAV_YO, 1.7)
	sting("intro_bote", -6.0)
	UiAudio.haptic(8)
	_pinta_cuentas()
	UiKit.punch(_cuenta_yo)
	var e: int = BancaJuego.dom_escalon(n + 1)
	if e > _escalon:
		_escalon = e
		_grada(e)


	if not _cantado and _record0 > 0 and n + 1 > _record0:
		_cantado = true
		di(I18n.t("NUEVO RÉCORD"), CareerTheme.NAV_LEGADO)
		UiKit.punch(_record_l)
		UiKit.punch(_corona)
		sting("ui_confirm", -10.0)


	if n + 1 == MIRADA_EN:
		Achievements.ingest_dominadas(MIRADA_EN)
		if _mirada_libre:
			_fase = "mirada"
			_mirada_t = 0.0
			_toca_b.disabled = true







func _grada(e: int) -> void:
	stadium.crowd_react("home", "close" if e <= 1 else "save")
	stadium.crowd_excite(GRADA_VIDA[e])
	stadium.crowd_mood(GRADA_PIE[e])
	if e >= 4:
		stadium.crowd_flashes("goal")
	bota(el, 0.05 + 0.02 * e, 0.28)


	cara_momento(el, "sorpresa" if e <= 1 else ("reir" if e == 2 else "grito"), CARA_MOMENTO_S)
	if e >= 3:
		cara_fondo(yo, "muerde")
	if audio == null:
		return
	match e:
		1:
			audio.set_applause(true, -18.0)
		2:
			audio.set_applause(true, -13.0)
			audio.roar(-14.0, 0.3)
		3:
			audio.set_applause(true, -10.0)
			audio.roar(-9.0, 0.55)
		4:
			audio.ovation(-6.0)
		_:
			audio.ovation(-2.0)
			audio.roar(-4.0, 1.0)





func _mirada_tick(delta: float) -> void:
	var antes: float = _mirada_t
	_mirada_t += delta
	_pinta_aro()
	if _mirada_t < MIRADA_CORTE:
		_mueve(delta)
		return
	if antes < MIRADA_CORTE:
		_mirada_corta()
	if antes < MIRADA_GIRA and _mirada_t >= MIRADA_GIRA:
		_mirada_gira()
	if _mirada_t >= MIRADA_VUELVE:
		_mirada_vuelve()






func _mirada_corta() -> void:
	var ultima: Dictionary =(cam_keys.back() as Dictionary).duplicate() \
			if not cam_keys.is_empty() else (_juego_keys()[1] as Dictionary).duplicate()
	ultima["yaw"] = float(ultima["yaw"]) \
			+ maxf(t - float(ultima["t"]), 0.0) * orbit_speed
	_mirada_cam = ultima
	_mirada_orbita = orbit_speed
	_l["vivo"] = false
	stadium.crowd_excite(GRADA_VIDA[0])
	stadium.crowd_mood(GRADA_PIE[0])
	if audio != null:
		audio.set_applause(false)
	_mirada_dt = stadium.coach_node(true)
	if _mirada_dt == null:

		_mirada_t = MIRADA_VUELVE
		return
	orbit_speed = 0.0
	var c: Vector3 = _mirada_dt.global_position
	var p: Vector3 = yo.global_position
	var d: Vector3 = Vector3(p.x - c.x, 0.0, p.z - c.z)
	d = d.normalized() if d.length() > 0.01 else Vector3(1.0, 0.0, 0.0)
	var a: Vector3 = d.rotated(Vector3.UP, deg_to_rad(MIRADA_YAW))
	var b: Vector3 = d.rotated(Vector3.UP, deg_to_rad(- MIRADA_YAW))
	var v: Vector3 = a if a.x >= b.x else b

	var yaw: float = rad_to_deg(atan2(v.x, - v.z))
	var dura: float = MIRADA_VUELVE - MIRADA_CORTE



	cam_keys.assign([
		{"t": t, "dist": 7.5, "h": 1.5, "yaw": yaw, "aim_y": 1.0, "fov": 32.0,
			"focus_x": c.x, "focus_z": c.z},
		{"t": t + dura, "dist": 5.0, "h": 1.55, "yaw": yaw, "aim_y": 1.35, "fov": 26.0,
			"focus_x": c.x, "focus_z": c.z},
	])


	var perfil: String = "idle_east" if v.z >= 0.0 else "idle_west"
	if _mirada_dt.sprite_frames != null and _mirada_dt.sprite_frames.has_animation(perfil):
		_mirada_dt.play(perfil)




func _mirada_gira() -> void:
	if _mirada_dt == null or not is_instance_valid(_mirada_dt):
		return
	_mirada_dt.play("idle")
	stadium.coach_cara(_mirada_dt, "rabia", MIRADA_VUELVE - MIRADA_GIRA + 0.3)

	cara_momento(el, "sorpresa", MIRADA_VUELVE - MIRADA_GIRA + 0.3)
	punch_fov(3.0, 0.5)
	shake(0.03, 0.3)
	sting("stinger_bad", -6.0)
	UiAudio.haptic(40)




func _mirada_vuelve() -> void:
	_mirada_t = -1.0
	_mirada_hecha = true
	orbit_speed = _mirada_orbita
	var k: Dictionary = _mirada_cam.duplicate()
	k["t"] = t
	cam_keys.assign([k])
	_al_pie(_l)
	idle_play(yo, _hacia)
	_cierra()
	termina(1 if _mejor > _record0 else 0)




func _grada_cae() -> void:
	stadium.crowd_excite(GRADA_VIDA[0])
	stadium.crowd_mood(GRADA_PIE[0])
	if audio != null:
		audio.set_applause(false)
		if _escalon >= 3:
			audio.ooh()
	_escalon = 0




func _se_cae() -> void:
	var l: Dictionary = _l
	if not l["vivo"]:
		return
	l["vivo"] = false
	l["suelto"] = true
	var per: float = BancaJuego.dom_periodo(int(l["n"]))
	var p: float = minf(float(l["t"]) / per, 1.0)


	var recta: Vector3 =((l["hasta"] as Vector3) -(l["desde"] as Vector3)) / per
	var vy: float = BancaJuego.dom_vuelo(per) * 4.0 *(1.0 - 2.0 * p) / per
	if float(l["t"]) > per:
		recta.y = 0.0
		vy = 0.0
	l["v"] = recta + Vector3(0.0, vy, 0.0) + _hacia * 0.35
	_aro_suelta((l["hasta"] as Vector3) - _hacia * ARO_DETRAS, CareerTheme.DANGER, 1.25)
	_toca_b.disabled = true
	_grada_cae()

	cara_fondo(yo, "")
	cara_momento(yo, "lamento", CARA_MOMENTO_S)
	cara_momento(el, "resoplar", CARA_MOMENTO_S)

	if not (_cantado and int(l["n"]) > _record0):
		di(I18n.t("¡SE CAE!"), CareerTheme.NAV_GENTE)





func _cierra() -> void:
	_fase = "pausa"
	_t = 0.0
	_toca_b.disabled = true
	var n: int = int(_l["n"])
	_mejor = maxi(_mejor, n)


	if _mejor > Career.dom_record and not GameState.practica_en_curso:
		Career.dom_record = _mejor
		Career._save()

	Achievements.ingest_dominadas(n)
	_pinta_bolitas()
	_pinta_cuentas()




func _pinta_bolitas() -> void:
	var quedan: int = BancaJuego.DOM_INTENTOS -(_ronda +(1 if _fase == "pausa" else 0))
	var est: Array = []
	for k in BancaJuego.DOM_INTENTOS:
		est.append(BIEN if k < quedan else PEND)
	pinta_marcador(est, [])




func _pinta_cuentas() -> void:
	var n: int = int(_l.get("n", 0))
	_cuenta_yo.text = str(n)
	_record_l.text = str(maxi(_record0, maxi(_mejor, n)))





func termina(res: int, _premio: String = "") -> void:
	if acabado:
		return
	acabado = true
	_cuenta_yo.text = str(_mejor)
	_record_l.text = str(maxi(_record0, _mejor))
	_toca_b.visible = false
	_al_campo.visible = false
	if _mirada_hecha:


		di(I18n.t("La Mirada del Míster"), CareerTheme.NAV_LEGADO)
		UiKit.punch(_corona)

		cara_fondo(yo, "")
		cara_momento(yo, "resoplar", CARA_FINAL_S)
	elif res > 0:
		di(I18n.t("NUEVO RÉCORD"), CareerTheme.NAV_LEGADO)
		UiKit.punch(_corona)
		gesto(yo, "gana")
		cara_fondo(yo, "alegria")
		cara_momento(yo, "grito", CARA_FINAL_S)
		cara_momento(el, "reir", CARA_FINAL_S)
		stadium.crowd_react("home", "save")
		if audio != null:
			audio.ovation(-6.0)
	else:
		di(I18n.t("HOY"))
		cara_fondo(yo, "")
	card_cta(I18n.t("AL CAMPO"))
	sting("ui_confirm", -4.0)
	UiAudio.haptic(30 if res > 0 else 15)
	var tw: Tween = create_tween()
	tw.tween_interval(FIN_AUTO)
	tw.tween_callback(_leave)






func _pinta_aro() -> void:
	if _aro_meta == null:
		return
	var l: Dictionary = _l
	var n: int = int(l["n"])
	var per: float = BancaJuego.dom_periodo(n)
	var t: float = l["t"]
	if _fase != "ronda" or not l["vivo"] or t < per * 0.5:
		_aro_meta.visible = false
		_aro_cierra.visible = false
		return
	var v: Vector2 = BancaJuego.dom_ventana(n)
	var sitio: Vector3 =(l["hasta"] as Vector3) - _hacia * ARO_DETRAS
	var entra: float = clampf((t - per * 0.5) / ARO_ENTRA, 0.0, 1.0)
	var cuenta: bool = t >= per - v.x
	var col: Color = _aro_color(t, per, v.x)
	_aro_meta.visible = true
	_aro_meta.position = sitio
	_aro_meta.texture = _aro_tex(ARO_R, ARO_TRAZO + 1 if cuenta else ARO_TRAZO)
	_aro_meta.modulate = col
	_aro_meta.modulate.a = 1.0 if cuenta else 0.45 * entra

	var k: float = clampf((per - t) /(per * 0.5), 0.0, 1.0)
	_aro_cierra.visible = k > 0.0
	_aro_cierra.position = sitio
	_aro_cierra.texture = _aro_tex(ARO_R + roundi(ARO_R *(ARO_LEJOS - 1.0) * k), ARO_TRAZO)
	_aro_cierra.modulate = col
	_aro_cierra.modulate.a = entra




func _aro_color(t: float, per: float, antes: float) -> Color:
	var abre: float = per - antes
	if t >= abre:
		return CareerTheme.NAV_YO
	if t >= abre -(abre - per * 0.5) * ARO_CASI:
		return CareerTheme.CAUTION
	return CareerTheme.DANGER




func _aro_suelta(pos: Vector3, col: Color, crece: float) -> void:
	if _aro_eco == null:
		return
	if _aro_tw != null and _aro_tw.is_valid():
		_aro_tw.kill()
	_aro_eco.position = pos
	_aro_eco.texture = _aro_tex(ARO_R, ARO_TRAZO + 1)
	_aro_eco.modulate = col
	_aro_eco.scale = Vector3.ONE
	_aro_eco.visible = true
	_aro_tw = create_tween().set_parallel()
	_aro_tw.tween_property(_aro_eco, "scale", Vector3.ONE * crece, ARO_ECO) \
			.set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)
	_aro_tw.tween_property(_aro_eco, "modulate:a", 0.0, ARO_ECO)
	_aro_tw.chain().tween_callback(_aro_eco.hide)




func _aro_sprite() -> Sprite3D:
	var s: Sprite3D = Sprite3D.new()
	s.pixel_size = BALON_M / 32.0
	s.offset = Vector2(0.0, - BALON_PAD_PX)
	s.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	s.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	s.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	s.visible = false
	viewport.add_child(s)
	return s





func _aro_tex(r: int, trazo: int) -> ImageTexture:
	var clave: int = r * 8 + trazo
	if _aros.has(clave):
		return _aros[clave]
	var lado: int = 2 * r + 3
	var img: Image = Image.create_empty(lado, lado, false, Image.FORMAT_RGBA8)
	var c: float =(lado - 1) * 0.5
	for y in lado:
		for x in lado:
			var d: float = Vector2(x - c, y - c).length()
			if d <= r + 0.5 and d > r + 0.5 - trazo:
				img.set_pixel(x, y, Color.WHITE)
	var tex: ImageTexture = ImageTexture.create_from_image(img)
	_aros[clave] = tex
	return tex
