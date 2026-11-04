extends Ceremony


























const CAM_DIST: float = 7.8
const CAM_Y: float = 1.3
const CAM_AIM: float = 1.05
const CAM_FOV: float = 40.0

const CAPA: int = 45

const TRAGA_S: float = 0.4

const ATT: float = 0.85

enum Fase{PITIDO, PULSO, DESENLACE, FIN}

var _fase: int = Fase.PITIDO
var _t: float = 0.0
var _rival: Dictionary = {}
var _estado: Dictionary = {}
var _ver: int = 0
var _caracter: String = "neutral"
var _capa: CanvasLayer
var _barra: ApretonBarra


func _accent_for() -> Color:
	return CareerTheme.accent_of(team())




func _estadio_previo() -> Dictionary:
	return {
		"div": div(),
		"attendance": ATT,
		"party": false,
		"home_club": String(team().get("id", "")),
		"home_only": false,
		"rival_club": String(data.get("opp", "")),
		"weather": String(data.get("weather", "day")),
		"kit": GameState.kit_variant(team(), 0),
	}



func _build_skip() -> void:
	pass




func _build() -> void:
	make_stadium(_estadio_previo())
	var opp: String = String(data.get("opp", ""))
	var nivel: int = Apreton.nivel_rival(opp, "league")
	var semilla: int = Apreton.semilla_de(int(data.get("season", 0)), int(data.get("n", 0)), opp)
	_rival = Apreton.rival_de(nivel, 0, semilla)
	_caracter = String(data.get("caracter", "neutral"))
	var anchor: Vector3 = stadium.coach_handshake(true)
	stadium.coach_placas(true)
	make_camera([], CAM_FOV)
	cam.position = Vector3(anchor.x + CAM_DIST, CAM_Y, anchor.z)
	cam.look_at(Vector3(anchor.x, CAM_AIM, anchor.z))
	stadium.keep_view_clear(cam.global_position, PackedVector3Array(), cam)
	stadium.rain_follow(cam.global_position)
	make_audio(ATT, false)
	_capa = CanvasLayer.new()
	_capa.layer = CAPA
	add_child(_capa)
	_barra = ApretonBarra.new()
	_barra.set_colores(team(), Teams.by_id(opp))
	_capa.add_child(_barra)



func salta_con_atras() -> bool:
	_leave()
	return true


func _tick(delta: float) -> void:
	match _fase:
		Fase.PITIDO:
			_t += delta
			stadium.coach_handshake_llegan(_t / Apreton.DUR_PITIDO)
			if _t >= Apreton.DUR_PITIDO:
				_fase = Fase.PULSO
				_estado = Apreton.nuevo(_rival)
				_barra.t0_ms = Time.get_ticks_msec()
				_barra.abierta = true
		Fase.PULSO:
			_pulso(delta)
		Fase.DESENLACE:
			_t += delta
			stadium.coach_handshake_suelta(_ver, _t / Apreton.DUR_DESENLACE)
			if _t >= Apreton.DUR_DESENLACE + TRAGA_S:
				_termina()




func _pulso(delta: float) -> void:
	var toques: Array = _barra.toques.duplicate()
	_barra.toques.clear()
	_estado = Apreton.paso(_estado, delta, toques)
	if not bool(_estado["armado"]):
		_barra.t0_ms = Time.get_ticks_msec()
	_barra.pinta(_estado)
	stadium.coach_handshake_pose(float(_estado["barra"]) / Apreton.BARRA_MAX,
		float(_estado["tension"]), bool(_estado["aviso"]), int(_estado["tiron"]) >= 0,
		float(_estado["t"]))
	if not bool(_estado["fin"]):
		return
	_barra.abierta = false
	_ver = Apreton.veredicto(float(_estado["barra"]))

	if not replay:
		Achievements.ingest_apreton(_ver == Apreton.GANAS)
	if _ver == Apreton.GANAS:
		ovation(2.0)
		stadium.crowd_react("home", "goal")
		UiAudio.haptic(40)
	elif audio != null:
		audio.ooh()
	_fase = Fase.DESENLACE
	_t = 0.0



func _termina() -> void:
	_fase = Fase.FIN
	stadium.coach_placas(false)
	stadium.coach_handshake_end()
	if is_instance_valid(_capa):
		_capa.queue_free()
	make_card(0.0)
	card_title(I18n.t("EL APRETON"), 34)
	card_sub(I18n.t(Apreton.rotulo(_caracter, _ver)),
		CareerTheme.NAV_YO if _ver == Apreton.GANAS else CareerTheme.DANGER)
	card_cta(I18n.t("SEGUIR"))


func _skipped() -> void:
	pass
