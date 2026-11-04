extends "res://ui/ceremonies/derby_room.gd"























































































const HT_KEYS: Array = [
	{"t": 0.0, "dist": 6.0, "h": 1.72, "yaw": 121.0, "aim_y": 1.2, "fov": 74.0,
		"focus_x": 0.0, "focus_z": 2.0},
]















const PATADA_KEYS: Array = [
	{"t": 0.0, "dist": 7.5, "h": 2.3, "yaw": 145.0, "aim_y": 1.0, "fov": 76.0,
		"focus_x": 0.4, "focus_z": 1.6},
]











const EXTRAS_SENTADOS: Array[float] = [-1.8, -0.72]
const EXTRAS_DE_PIE: Array[Vector2] = [Vector2(2.9, 3.0), Vector2(-0.1, 4.5)]

const COACH_HT_X: float = 0.4
const COACH_HT_Z: float = 2.6

const T_CHYRON_HT: float = 0.6
const T_CARD_HT: float = 3.0



const T_WHISTLE_HT: float = 2.4




const APAGADA_A: float = 0.62




const ROUT: int = 2





const FAR_DB: Dictionary = {1: -22.0, 2: -27.0, 3: -33.0}




const PASO_LLENA: Vector2 = Vector2(0.45, 1.3)
const PASO_VACIA: Vector2 = Vector2(1.6, 3.4)







func _cues_del_acto() -> PackedStringArray:
	var ids: PackedStringArray = PackedStringArray(["shower_off", "door_clack",
		"studs_tick", "coach_talk_a", "coach_talk_b", "coach_talk_c"])


	var tn: Dictionary = tono(data)
	if bool(tn.get("patada", false)):
		ids.append("bottles_kick")

	ids.append_array(DescansoEscenas.cues(tn))
	return ids





const SILABA: Vector2 = Vector2(0.14, 0.22)
const FRASE_SILABAS: Vector2i = Vector2i(3, 6)
const FRASE_PAUSA: Vector2 = Vector2(0.45, 1.0)


const T_HABLA: float = 0.55






















const T_PUERTA_CIERRA: float = 0.95
const T_LLEGADA: float = 1.25
const PASO_LLEGADA: Vector2 = Vector2(0.09, 0.2)
const FAR_ABIERTA: float = 7.0
const MURMULLO_ENTRA: float = -9.0
const MURMULLO_SUBE: float = 1.7





const T_DUCHA_OFF: float = 1.55





















const PASEO_X_HT: Vector2 = Vector2(-0.65, 1.45)
const PASEO_MS_HT: float = 0.8
const PASEO_PAUSA_HT: Vector2 = Vector2(0.8, 1.7)
const PASEO_ESPERA_HT: float = 0.55

























const PATADA_DIF: int = 3
const T_PATADA: float = 0.7
const PATADA_FPS: float = 12.0

const PATADA_CONTACTO: int = 4
const PATADA_LAMINA: String = "res://assets/sprites/anim/coach_patada_south_"
const PATADA_CUADROS: int = 8




const PACK_DERECHA: float = 0.55
const PACK_FONDO: float = 0.06


const BOTELLA_R: float = 0.042
const BOTELLA_CUERPO: float = 0.17
const BOTELLA_HOMBRO: float = 0.05
const BOTELLA_TAPON: float = 0.022



const VUELO_ABRE: float = 34.0
const VUELO_VH: Vector2 = Vector2(2.0, 3.6)
const VUELO_VV: Vector2 = Vector2(1.6, 3.0)
const VUELO_GIRO: Vector2 = Vector2(9.0, 17.0)


const BOTE_REST: float = 0.34
const BOTE_ROCE: float = 0.62
const BOTE_MIN: float = 0.45
const RUEDA_FRENO: float = 3.2













const SUSTO_ALTO: Vector2 = Vector2(0.035, 0.1)
const SUSTO_RADIO: float = 3.0
const SUSTO_DUR: float = 0.24
const SUSTO_ONDA: float = 14.0

const SUSTO_SENTADO: float = 0.6
const ATRAS_RADIO: float = 1.8
const ATRAS_PASO: float = 0.16
const ATRAS_DUR: float = 0.32
const ABATIDO_T: Vector2 = Vector2(0.45, 1.0)
const ABATIDO_FPS: float = 9.0
const ABATIDO_CUADROS: int = 5
const ABATIDO_LAMINA: String = "res://assets/sprites/anim/lost_player_%s_%02d.png"





var _sala_vacia: bool = false

var _paso_next: float = 0.0

var _llegada: bool = true
var _puerta_cerrada: bool = false


var _ducha_off_at: float = T_DUCHA_OFF
var _ducha_cerrada: bool = false

var _voz_next: float = T_HABLA
var _voz_left: int = 0

var _voz_pico: float = 0.0


var _mi_peto: Color = Color.TRANSPARENT



var _murmullo: bool = true


var _energy_lbl: Label = null
var _energy_fill: ColorRect = null



var _energy_tw: Tween = null

var _drink_btn: Button = null
var _drank: bool = false

var _drink_hint: Label = null



var _note_lbl: Label = null


























const FILO_MIN: int = 5


const PALIZA_PORTERO: int = 3


const CALLADA_BRIGHT: float = 0.8
const CALLADA_SAT: float = 0.68


const FIESTA_DB: float = 4.0


const PRORROGA_MURMULLO_DB: float = -6.0
const PRORROGA_FAR_DB: float = 6.0

const FINAL_FAR_DB: float = 8.0


const PARED_DB: float = -34.0



signal postura_tomada(stake: Dictionary)


signal trivia_respondida(stake: Dictionary)


var _tono: Dictionary = {}

var _senalado: String = ""


var _trivia: Dictionary = {}


var _far_base: float = -26.0


var _murmullo_db: float = MURMUR_DB
var _bajon: bool = false


var _patada: int = 0

var _botellas: Array[Dictionary] = []

var _vuelo_dir: Vector3 = Vector3.RIGHT




var _fila_patada: Array[Dictionary] = []
var _t_golpe: float = -1.0


var _escenas: DescansoEscenas = null

var _t_silbato: float = T_WHISTLE_HT



static func tono(d: Dictionary) -> Dictionary:
	var extra: bool = bool(d.get("extra", false))
	var ko: String = String(d.get("ko", ""))
	var dia: int = maxi(int(d.get("you", 0)), 0) - maxi(int(d.get("them", 0)), 0)
	var stake: Variant = d.get("stake", {})
	var sala: String = "normal"
	if extra:
		sala = "prorroga"
	elif not ko.is_empty() and String(d.get("round", "")) == "Final":
		sala = "final"
	elif not ko.is_empty():
		sala = "ko"
	elif bool(d.get("derby", false)):
		sala = "derbi"
	elif stake is Dictionary and not (stake as Dictionary).is_empty():
		sala = "tabla"




	var club: bool = not bool(d.get("nat", false))
	var roja_mia: String = String(d.get("red_mine", ""))
	var ultimo: int = int(d.get("last_goal_min", -1))
	var mio: bool = bool(d.get("last_goal_mine", false))
	var filo: bool = ultimo >= 0 and ultimo >=(105 if extra else 45) - FILO_MIN
	var momento: String = ""
	if not extra and club and not roja_mia.is_empty():
		momento = "senalado_roja"
	elif not extra and club and dia <= - PALIZA_PORTERO \
			and not String(d.get("keeper", "")).is_empty():
		momento = "senalado_portero"
	elif not String(d.get("absent", "")).is_empty():
		momento = "uno_menos"
	elif not extra and dia <= - ROUT:
		momento = "paliza"
	elif filo and not mio:
		momento = "filo_contra"
	elif not extra and int(d.get("max_deficit", 0)) >= 1 and dia >= 0 and mio:
		momento = "remontada"
	elif not extra and int(d.get("max_lead", 0)) >= 1 and dia <= 0 and not mio:
		momento = "regalo"
	elif filo:
		momento = "filo_favor"
	elif not roja_mia.is_empty():
		momento = "roja_mia"
	elif bool(d.get("red_rival", false)):
		momento = "roja_suya"





	var aplauso: bool = not extra and dia >= 0 \
			and not momento.begins_with("senalado") and momento != "uno_menos" \
			and (momento == "remontada" or int(d.get("goals", 0)) >= 2)


	var patada: bool = not extra and dia <= - PATADA_DIF
	var tn: Dictionary = {"sala": sala, "momento": momento, "aplauso": aplauso,
		"patada": patada}


	tn.merge(DescansoEscenas.capas(d, dia, extra, patada, momento))
	return tn


func _extra() -> bool:
	return bool(data.get("extra", false))








func _accent_for() -> Color:
	return CareerTheme.DANGER if _diff_global() < 0 else CareerTheme.accent_of(team())


func _build() -> void:


	_tono = tono(data)
	match String(_tono["momento"]):
		"senalado_roja":
			_senalado = String(data.get("red_mine", ""))
		"senalado_portero":
			_senalado = String(data.get("keeper", ""))




	if _senalado.is_empty() and not replay and Trivia.cabe(data, String(_tono["momento"])):
		var club_id: String = String(data.get("club", GameState.player_team_id))
		var rival_id: String = String(data.get("rival", ""))
		_trivia = Trivia.armar(club_id, rival_id, GameState.season_num,
			hash("%d|%d|%s|%s" % [GameState.season_num, GameState.season_day,
				club_id, rival_id]))
	_build_sala()
	var rival: Dictionary = _rival()


	make_chyron(I18n.t(_rotulo()), CareerTheme.caps(Nations.team_label(rival, "?")),
		rival, T_CHYRON_HT)


	var ficha: float = DescansoEscenas.ficha_at(_tono, T_CARD_HT)
	_t_silbato = T_WHISTLE_HT +(ficha - T_CARD_HT)
	make_card(ficha)




	card_title("%d - %d" % [_you_goals(), _them_goals()], 46)



	var sub: Label = card_sub(_subtitulo())
	sub.clip_text = true
	sub.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS





	var cifras: HBoxContainer = card_stats(_stats())
	if cifras.get_child_count() > 1:
		_energy_lbl = cifras.get_child(1).get_child(0) as Label
	_build_energia()
	_note_lbl = card_note(_coach_text())
	_build_drink()

	if not _senalado.is_empty():
		_build_senalado()
		return

	if not _trivia.is_empty():
		_build_trivia()
		return

	card_cta(I18n.t("SEGUNDO TIEMPO EXTRA") if _extra() else I18n.t("SEGUNDA PARTE"))



func _rotulo() -> String:
	match String(_tono.get("sala", "normal")):
		"prorroga":
			return "PRÓRROGA"
		"final":
			return "DESCANSO · FINAL"
	if bool(data.get("derby", false)):
		return "DESCANSO · DERBI"
	return "DESCANSO"





func _estado_ko() -> String:
	var ko: String = String(data.get("ko", ""))
	if not ko.is_empty():
		return ko
	var g: int = _diff_global()
	return "pasas" if g > 0 else ("fuera" if g < 0 else "igualada")






func _subtitulo() -> String:
	var s: String = I18n.t(_verdict())
	var estado: String = _estado_ko()
	match String(_tono.get("sala", "normal")):
		"prorroga":
			s = I18n.t(String({"igualada": "SI NADIE MARCA, PENALTIS",
				"pasas": "QUINCE MINUTOS PARA AGUANTAR",
				"fuera": "QUINCE MINUTOS PARA REMONTAR"}.get(estado, "")))
		"final":
			s = I18n.t(String({"igualada": "SI ACABA ASÍ: PRÓRROGA",
				"pasas": "SI ACABA ASÍ: CAMPEONES",
				"fuera": "SI ACABA ASÍ: SUBCAMPEONES"}.get(estado, "")))
		"ko":
			var ida: Array = _ida()
			if ida.size() == 2:
				s = I18n.tf(String({"igualada": "GLOBAL {0}-{1} · PRÓRROGA",
					"pasas": "GLOBAL {0}-{1} · PASÁIS",
					"fuera": "GLOBAL {0}-{1} · FUERA"}.get(estado, "")),
					[_you_goals() + int(ida[0]), _them_goals() + int(ida[1])])
			else:



				var empate: String = "SI ACABA ASÍ: PENALTIS" \
						if String(data.get("ko_regla", "")) == "penales" \
						else "SI ACABA ASÍ: PRÓRROGA"
				s = I18n.t(String({"igualada": empate,
					"pasas": "SI ACABA ASÍ: PASÁIS",
					"fuera": "SI ACABA ASÍ: FUERA",
					"otra": "SI ACABA ASÍ: OTRA NOCHE"}.get(estado, "")))
		"tabla":
			s = _linea_tabla()
	if s.is_empty():
		s = I18n.t(_verdict())
	if not String(data.get("red_mine", "")).is_empty():
		s += " · " + I18n.t("10 CONTRA 11")
	elif bool(data.get("red_rival", false)):
		s += " · " + I18n.t("11 CONTRA 10")
	return s




func _linea_tabla() -> String:
	var st: Dictionary = data.get("stake", {}) if data.get("stake", {}) is Dictionary \
			else {}
	var tipo: String = String(st.get("tipo", ""))
	var pts: int = int(st.get("pts", 0))
	var raya: String = ""
	if bool(st.get("dentro", false)):
		raya = I18n.t(String({"titulo": "LÍDER", "ascenso": "EN ASCENSO",
			"descenso": "EN DESCENSO", "liguilla": "EN LIGUILLA"}.get(tipo, "")))
	elif pts <= 0:
		raya = I18n.t(String({"titulo": "IGUALADO CON EL LÍDER",
			"ascenso": "IGUALADO CON EL ASCENSO",
			"descenso": "IGUALADO CON EL DESCENSO",
			"liguilla": "IGUALADO CON LA LIGUILLA"}.get(tipo, "")))
	else:
		raya = I18n.tf(String({"titulo": "A {0} PTS DEL LÍDER",
			"ascenso": "A {0} PTS DEL ASCENSO",
			"descenso": "A {0} PTS DEL DESCENSO",
			"liguilla": "A {0} PTS DE LA LIGUILLA"}.get(tipo, "")), [pts])
	if raya.is_empty():
		return ""
	var quedan: int = int(st.get("quedan", 0))
	return raya + " · " +(I18n.t("ÚLTIMA JORNADA") if quedan <= 0
		else I18n.tf("QUEDAN {0}", [quedan]))














func _build_senalado() -> void:




	card_decision("momento_senalado", "%d - %d · %s" % [_you_goals(), _them_goals(),
		CareerTheme.caps(CareerUi.surname(_senalado))], {
		"desc": I18n.tf("El míster se ha ido a por {0} delante de todo el vestuario. Nadie levanta la vista del suelo. Tú estás sentado a su lado.",
			[CareerTheme.caps(_senalado)]),
	})
	_decision_resolve = _resolve_senalado


func _resolve_senalado(eleccion: String) -> String:
	postura_tomada.emit({"name": _senalado, "choice": eleccion})
	var quien: String = CareerUi.surname(_senalado)
	if eleccion == "a":
		return I18n.tf("Lo has dicho delante de todos. El míster no lo olvidará, y {0} tampoco.",
			[quien])
	return I18n.tf("Te has callado. {0} se ha dado cuenta.", [quien])















func _build_trivia() -> void:
	var opciones: Array = _trivia.get("opciones", [])
	var nombre: String = String(_trivia.get("name", ""))
	var patch: Dictionary = {
		"desc": I18n.tf("¿De dónde llegó {0} a {1}?", [CareerTheme.caps(nombre),
			TransferBook.nombre_de_etapa({"club": String(_trivia.get("team_id", ""))})]),
	}
	for i in mini(opciones.size(), Trivia.LETRAS.size()):
		patch[Trivia.LETRAS[i]] = {"label": TransferBook.nombre_de_etapa(
			{"club": String(opciones[i])}), "fx": {}}

	card_decision("momento_trivia", "%d - %d · %s" % [_you_goals(), _them_goals(),
		CareerTheme.caps(CareerUi.surname(nombre))], patch)
	_decision_resolve = _resolve_trivia


func _resolve_trivia(eleccion: String) -> String:
	var acierto: bool = eleccion == String(_trivia.get("correcta", ""))
	trivia_respondida.emit({"acierto": acierto, "name": String(_trivia.get("name", ""))})
	var buena: String = TransferBook.nombre_de_etapa(
		{"club": String(_trivia.get("respuesta", ""))})
	if acierto:
		return I18n.tf("¡Exacto! Llegó de {0}. +{1} de energía al pitido.",
			[buena, int(Career.TRIVIA_ENERGY)])
	return I18n.tf("No. Llegó de {0}.", [buena])










func _decision_extra() -> Control:
	if _senalado.is_empty() and _trivia.is_empty():
		return null
	var caja: VBoxContainer = VBoxContainer.new()
	caja.add_theme_constant_override("separation", 10)


	var ficha: Dictionary = _ficha_de(_senalado) if _trivia.is_empty() \
			else Dictionary(_trivia.get("ficha", {}))
	if not ficha.is_empty():
		caja.add_child(CareerUi.ovr_poss_row(ficha,
			SquadMeta.ovr_of(ficha, String(ficha.get("pos", "MC"))), 20))


	if not _trivia.is_empty():
		var premio: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
		premio.text = I18n.tf("ACIERTA Y SUMAS +{0} DE ENERGÍA AL PITIDO",
			[int(Career.TRIVIA_ENERGY)])
		premio.clip_text = true
		premio.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		premio.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		caja.add_child(premio)
	_pulso_energia(false)
	_energy_lbl = null
	_note_lbl = null
	_drink_hint = null
	_drink_btn = null
	_build_energia(caja)
	if not _drank:
		_build_drink(caja)
	return caja



func _ficha_de(nombre: String) -> Dictionary:
	var club: String = String(data.get("club", GameState.player_team_id))
	for p in Squad.of(club):
		if String((p as Dictionary).get("name", "")) == nombre:
			return p
	return {}






func _build_sala() -> void:


	focus = Vector3(0.0, 0.0, 2.0)
	room = LockerRoom.new()
	room.host_viewport = viewport





	var nat: bool = bool(data.get("nat", false))
	room.force_club = not nat
	room.force_nation = nat


	room.show_captain = false
	room.mouse_filter = Control.MOUSE_FILTER_IGNORE



	room.face_x = COACH_HT_X




	var yaw: float = deg_to_rad(float(_keys_sala()[0]["yaw"]))
	room.face_z = COACH_HT_Z
	room.face_derecha = Vector3(- cos(yaw), 0.0, - sin(yaw))



	room.empty_mates = _sala_vacia

	room.me_bib = _mi_peto





	if String(_tono.get("momento", "")) == "uno_menos":
		room.absent_name = String(data.get("absent", ""))
		room.focus_name = room.absent_name
	elif not _senalado.is_empty():
		room.focus_name = _senalado




	if bool(_tono.get("aplauso", false)) or bool(data.get("aplauso", false)):
		room.celebrate = true

	room.suelo_mojado = int(_tono.get("lluvia", -1)) >= 0
	add_child(room)



	if _callada():
		_apaga_sala()
	make_camera(_keys_sala(), 74.0)
	orbit_speed = DRIFT



	paseo_x = PASEO_X_HT
	paseo_ms = PASEO_MS_HT
	paseo_pausa = PASEO_PAUSA_HT
	paseo_espera = PASEO_ESPERA_HT
	_build_coach(COACH_HT_X, COACH_HT_Z)
	if bool(_tono.get("patada", false)):
		_build_patada()


























	_far_base = FAR_DB.get(div(), -26.0)
	_murmullo_db = MURMUR_DB
	var momento: String = String(_tono.get("momento", ""))
	var sala: String = String(_tono.get("sala", ""))
	if _callada():
		_murmullo = false
	if sala == "prorroga":
		_murmullo_db += PRORROGA_MURMULLO_DB
		_far_base += PRORROGA_FAR_DB
	elif sala == "final":
		_far_base += FINAL_FAR_DB
	var derbi: bool = bool(data.get("derby", false)) and not _tono.is_empty()
	if momento in ["filo_favor", "remontada"] or (derbi and _diff() > 0):
		_murmullo_db += FIESTA_DB
	_bajon = momento in ["filo_contra", "regalo"]
	make_locker_audio(_murmullo, _far_base)


	if derbi and _diff() < 0 and locker_audio != null \
			and not bool(_tono.get("hostil", false)):
		_loop_player(locker_audio, "chant_loop", PARED_DB)


	if _llegada:
		room.door_open(true, 0.001)
		locker_far_to(_far_base + FAR_ABIERTA, 0.0)
		if _murmullo:
			locker_murmur_to(MURMUR_DB + MURMULLO_ENTRA, 0.0)
			if not _bajon:
				locker_murmur_to(_murmullo_db, MURMULLO_SUBE)


	if not _tono.is_empty():
		_escenas = DescansoEscenas.new()
		add_child(_escenas)
		_escenas.monta(self, room, _tono, _far_base, _murmullo_db, _murmullo)


		if _patada == 0:
			_escenas.tras_patada(DescansoEscenas.PORTAZO_SIN_PATADA)





func _callada() -> bool:
	return not _tono.is_empty() and not _extra() and _diff() <= - ROUT






func _apaga_sala() -> void:
	for n in viewport.get_children():
		if n is WorldEnvironment and n.environment != null:
			var env: Environment = n.environment
			env.adjustment_enabled = true
			env.adjustment_brightness = CALLADA_BRIGHT
			env.adjustment_saturation = CALLADA_SAT
			return





func _build_patada() -> void:
	if paseo_dt == null or not is_instance_valid(paseo_dt):
		return
	var rutas: Array[String] = []
	for i in range(1, PATADA_CUADROS + 1):
		var ruta: String = "%s%02d.png" % [PATADA_LAMINA, i]
		if not ResourceLoader.exists(ruta):
			return
		rutas.append(ruta)
	var frames: SpriteFrames = paseo_dt.sprite_frames
	if not frames.has_animation("patada"):
		frames.add_animation("patada")
		frames.set_animation_loop("patada", false)
		frames.set_animation_speed("patada", PATADA_FPS)


		for ruta in rutas:
			frames.add_frame("patada", KitRecolor.apply(load(ruta), Career.coach_look()))
	_patada = 1

	_voz_next = T_PATADA + float(PATADA_CUADROS) / PATADA_FPS + 0.15



	var k: Dictionary = _keys_sala()[0]
	var yaw: float = deg_to_rad(float(k["yaw"]))
	var derecha: Vector3 = Vector3(- cos(yaw), 0.0, - sin(yaw))
	var cam_pos: Vector3 = Vector3(float(k["focus_x"]), 0.0, float(k["focus_z"])) \
			+ Vector3(sin(yaw), 0.0, - cos(yaw)) * float(k["dist"])
	var pie: Vector3 = Vector3(paseo_dt.position.x, 0.0, paseo_dt.position.z)
	var a_cam: Vector3 =(cam_pos - pie).normalized()
	var centro: Vector3 = pie + derecha * PACK_DERECHA - a_cam * PACK_FONDO
	_vuelo_dir =(derecha * 0.75 + a_cam * 0.65).normalized()


	var paso: float = BOTELLA_R * 2.0 + 0.004
	var alto: float = BOTELLA_CUERPO + BOTELLA_HOMBRO + BOTELLA_TAPON
	for fila in 2:
		for col in 3:
			var b: Node3D = _botella()
			b.position = centro + derecha *(float(col) - 1.0) * paso \
					+ a_cam *(float(fila) - 0.5) * paso + Vector3(0.0, alto * 0.5, 0.0)
			viewport.add_child(b)
			_botellas.append({"n": b, "v": Vector3.ZERO, "eje": Vector3.RIGHT,
				"giro": 0.0, "suelo": false})
	_planta_extras()
	_monta_fila(centro)



func _keys_sala() -> Array:
	return PATADA_KEYS if bool(_tono.get("patada", false)) else HT_KEYS






func _planta_extras() -> void:
	if room == null:
		return
	var quienes: Array = room.sin_hueco(EXTRAS_SENTADOS.size() + EXTRAS_DE_PIE.size())
	var i: int = 0


	var z_banca: float = LockerRoom.BENCH_Z + LockerRoom.BENCH_D * 0.5 + 0.03
	for x in EXTRAS_SENTADOS:
		if i >= quienes.size():
			return
		room.planta_extra(quienes[i], Vector3(x, 0.0, z_banca), "south", true)
		i += 1
	for p in EXTRAS_DE_PIE:
		if i >= quienes.size():
			return
		var pie: Vector3 = Vector3(p.x, 0.0, p.y)
		room.planta_extra(quienes[i], pie, room.vista_hacia(pie))
		i += 1








func _monta_fila(centro: Vector3) -> void:
	if room == null:
		return
	for f in room.figuras():
		var spr: AnimatedSprite3D = f["spr"]
		var frames: SpriteFrames = spr.sprite_frames
		var gesto: bool = false


		var sentado: bool = bool(f.get("sentado", false))
		if frames != null and not sentado and not frames.has_animation("abatido"):
			var bases: PackedStringArray = PackedStringArray()
			for i in range(1, ABATIDO_CUADROS + 1):
				var ruta: String = ABATIDO_LAMINA % [String(f["dir"]), i]
				if not ResourceLoader.exists(ruta):
					break
				if bases.is_empty():
					frames.add_animation("abatido")
					frames.set_animation_loop("abatido", false)
					frames.set_animation_speed("abatido", ABATIDO_FPS)
				frames.add_frame("abatido", KitRecolor.apply(load(ruta), f["cfg"]))
				bases.append(ruta.get_file().get_basename())
			if not bases.is_empty():
				PechoRig.apunta(frames, bases, "abatido")
				gesto = true
		var suelo: Vector3 = Vector3(spr.position.x, 0.0, spr.position.z)
		var lejos: Vector3 = suelo - centro
		var d: float = lejos.length()
		var atras: Vector3 = Vector3.ZERO
		if d < ATRAS_RADIO and d > 0.01:
			atras = lejos / d * ATRAS_PASO
		_fila_patada.append({"spr": spr, "base": spr.position,
			"retardo": d / SUSTO_ONDA + rng.randf_range(0.0, 0.04),
			"alto": lerpf(SUSTO_ALTO.y, SUSTO_ALTO.x, clampf(d / SUSTO_RADIO, 0.0, 1.0)) \
					*(SUSTO_SENTADO if sentado else 1.0),
			"atras": atras, "abatido_at": rng.randf_range(ABATIDO_T.x, ABATIDO_T.y),
			"gesto": gesto, "abatido": false})






func _botella() -> Node3D:
	var raiz: Node3D = Node3D.new()
	var alto: float = BOTELLA_CUERPO + BOTELLA_HOMBRO + BOTELLA_TAPON
	var base: float = - alto * 0.5
	var plastico: StandardMaterial3D = _mat_botella(Color(0.74, 0.87, 0.96), 0.22)
	var cuerpo: CylinderMesh = CylinderMesh.new()
	cuerpo.top_radius = BOTELLA_R
	cuerpo.bottom_radius = BOTELLA_R
	cuerpo.height = BOTELLA_CUERPO
	cuerpo.radial_segments = 10
	cuerpo.rings = 1
	_pieza(raiz, cuerpo, plastico, base + BOTELLA_CUERPO * 0.5)


	var etiqueta: CylinderMesh = CylinderMesh.new()
	etiqueta.top_radius = BOTELLA_R + 0.0015
	etiqueta.bottom_radius = BOTELLA_R + 0.0015
	etiqueta.height = BOTELLA_CUERPO * 0.38
	etiqueta.radial_segments = 10
	etiqueta.rings = 1
	_pieza(raiz, etiqueta, _mat_botella(Color(0.13, 0.33, 0.7), 0.6),
		base + BOTELLA_CUERPO * 0.52)
	var hombro: CylinderMesh = CylinderMesh.new()
	hombro.top_radius = BOTELLA_R * 0.4
	hombro.bottom_radius = BOTELLA_R
	hombro.height = BOTELLA_HOMBRO
	hombro.radial_segments = 10
	hombro.rings = 1
	_pieza(raiz, hombro, plastico, base + BOTELLA_CUERPO + BOTELLA_HOMBRO * 0.5)
	var tapon: CylinderMesh = CylinderMesh.new()
	tapon.top_radius = BOTELLA_R * 0.44
	tapon.bottom_radius = BOTELLA_R * 0.44
	tapon.height = BOTELLA_TAPON
	tapon.radial_segments = 8
	tapon.rings = 1
	_pieza(raiz, tapon, _mat_botella(Color(0.18, 0.44, 0.86), 0.5),
		base + BOTELLA_CUERPO + BOTELLA_HOMBRO + BOTELLA_TAPON * 0.5)
	return raiz


func _mat_botella(col: Color, rugosidad: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = rugosidad
	return m


func _pieza(raiz: Node3D, malla: Mesh, mat: Material, y: float) -> void:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = malla
	mi.material_override = mat
	mi.position = Vector3(0.0, y, 0.0)
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	raiz.add_child(mi)








func _tick_patada(delta: float) -> bool:
	if _patada == 0:
		return false
	if _patada == 1 and t >= T_PATADA:
		_patada = 2
		paseo_dt.flip_h = false
		paseo_dt.play("patada")
	if _patada == 2 and paseo_dt.animation == "patada" \
			and paseo_dt.frame >= PATADA_CONTACTO:
		_patada = 3
		_t_golpe = t
		_lanza_botellas()
		sting("bottles_kick", -3.0)
	_tick_botellas(delta)
	_tick_fila()
	if _patada == 3 and not paseo_dt.is_playing():
		_patada = 4
		if _escenas != null:
			_escenas.tras_patada()
	if _patada < 4:
		paseo_dt.flip_h = false
		return true
	return false





func _lanza_botellas() -> void:
	for i in _botellas.size():
		var b: Dictionary = _botellas[i]
		var dir: Vector3 = _vuelo_dir.rotated(Vector3.UP,
			deg_to_rad(rng.randf_range(- VUELO_ABRE, VUELO_ABRE)))
		var fuerza: float = 1.0 if i < 3 else 0.78
		b["v"] = dir * rng.randf_range(VUELO_VH.x, VUELO_VH.y) * fuerza \
				+ Vector3(0.0, rng.randf_range(VUELO_VV.x, VUELO_VV.y) * fuerza, 0.0)
		b["eje"] = Vector3(rng.randf_range(-1.0, 1.0), rng.randf_range(-0.3, 0.3),
			rng.randf_range(-1.0, 1.0)).normalized()
		b["giro"] = rng.randf_range(VUELO_GIRO.x, VUELO_GIRO.y) \
				*(1.0 if rng.randf() < 0.5 else -1.0)







func _tick_botellas(delta: float) -> void:
	if _patada < 3:
		return
	var alto: float = BOTELLA_CUERPO + BOTELLA_HOMBRO + BOTELLA_TAPON
	for b in _botellas:
		var n: Node3D = b["n"]
		var v: Vector3 = b["v"]
		if not bool(b["suelo"]):
			v.y -= 9.8 * delta
			n.position += v * delta
			n.rotate(b["eje"], float(b["giro"]) * delta)
			var eje_y: float = absf(n.basis.y.normalized().y)
			var bajo: float = eje_y * alto * 0.5 + BOTELLA_R * sqrt(maxf(1.0 - eje_y * eje_y, 0.0))
			if n.position.y < bajo and v.y < 0.0:
				n.position.y = bajo
				v.y = - v.y * BOTE_REST
				v.x *= BOTE_ROCE
				v.z *= BOTE_ROCE
				b["giro"] = float(b["giro"]) * 0.5
				if v.y < BOTE_MIN:
					v.y = 0.0
					b["suelo"] = true
		else:



			var eje: Vector3 = n.basis.y.normalized()
			var plano: Vector3 = Vector3(eje.x, 0.0, eje.z)
			if plano.length() < 0.01:
				plano = Vector3.RIGHT
			var tumbada: Basis = Basis(Quaternion(Vector3.UP, plano.normalized()))
			var q: Quaternion = n.basis.get_rotation_quaternion().slerp(
				tumbada.get_rotation_quaternion(), 1.0 - exp(- delta * 14.0))
			n.basis = Basis(q)
			n.position.y = lerpf(n.position.y, BOTELLA_R, 1.0 - exp(- delta * 14.0))
			var h: Vector3 = Vector3(v.x, 0.0, v.z)
			var rapidez: float = maxf(h.length() - RUEDA_FRENO * delta, 0.0)
			v = h.normalized() * rapidez if h.length() > 0.0 else Vector3.ZERO
			n.position += v * delta
		b["v"] = v






func _tick_fila() -> void:
	if _t_golpe < 0.0:
		return
	var desde: float = t - _t_golpe
	for f in _fila_patada:
		var spr: AnimatedSprite3D = f["spr"]
		if not is_instance_valid(spr):
			continue
		var tau: float = desde - float(f["retardo"])
		if tau < 0.0:
			continue
		var brinco: float = 0.0
		if tau < SUSTO_DUR:
			brinco = sin(PI * pow(tau / SUSTO_DUR, 0.7)) * float(f["alto"])
		var paso: float = smoothstep(0.0, ATRAS_DUR, tau)
		spr.position = f["base"] + f["atras"] * paso + Vector3(0.0, brinco, 0.0)
		if not bool(f["abatido"]) and desde >= float(f["abatido_at"]):
			f["abatido"] = true
			if bool(f["gesto"]):
				spr.play("abatido")


func _you_goals() -> int:
	return maxi(int(data.get("you", 0)), 0)


func _them_goals() -> int:
	return maxi(int(data.get("them", 0)), 0)


func _diff() -> int:
	return _you_goals() - _them_goals()



func _ida() -> Array:
	var ida: Variant = data.get("ida", [])
	return ida if ida is Array and (ida as Array).size() == 2 else []







func animo_extras() -> String:
	var d: int = _diff_global()
	return "buena" if d > 0 else ("mala" if d < 0 else "normal")


func _diff_global() -> int:
	var ida: Array = _ida()
	if ida.is_empty():
		return _diff()
	return _diff() + int(ida[0]) - int(ida[1])







func _verdict() -> String:
	var d: int = _diff_global()
	if d > 0:
		return "VAS POR DELANTE"
	if d < 0:
		return "VAS POR DETRÁS"
	return "TODO IGUAL"







func _stats() -> Array:
	return [
		{"v": "%.1f" % clampf(float(data.get("rating", 6.0)), 0.0, 10.0),
			"k": I18n.t("tu nota")},
		{"v": "%d%%" % int(round(clampf(float(data.get("energy", 100.0)), 0.0, 100.0))),
			"k": I18n.t("energía")},
		{"v": "%d'" % maxi(int(data.get("minutes", 0)), 0),
			"k": I18n.t("tus minutos")},
	]








func _coach_line() -> Dictionary:
	var d: int = _diff()
	var sala: String = String(_tono.get("sala", "normal"))
	var momento: String = String(_tono.get("momento", ""))
	var mins: int = int(data.get("minutes", 0))


	if momento == "senalado_roja":
		return {"key": "{0}, nos has dejado con diez. Hoy no me hables.",
			"args": [CareerUi.surname(_senalado)]}
	if momento == "senalado_portero":
		return {"key": "{0}, {1} goles. ¿Vas a parar alguno en la segunda?",
			"args": [CareerUi.surname(_senalado), _them_goals()]}




	if sala == "prorroga":
		if bool(data.get("on_pitch", true)) and _energy_now() < float(Career.LOW_ENERGY):
			return {"key": "Vas fundido. Piensa bien dónde gastas lo que te queda.",
				"args": []}
		return _linea(PRORROGA_LINEAS.get(_estado_ko(), PRORROGA_LINEAS["igualada"]))


	if d <= - ROUT:
		return _voz("paliza")



	if mins <= 0:
		return {"key": "Desde la banca también se juega. Cuando te toque, no "
			+ "preguntes.", "args": []}




	if float(data.get("rating", 6.0)) < Career.HOOK_RATING_FLOOR:
		return _voz("nota")





	if _energy_now() < float(Career.LOW_ENERGY):
		return {"key": "Vas fundido. Piensa bien dónde gastas lo que te queda.",
			"args": []}



	if momento == "uno_menos":
		return {"key": MOMENTO_LINEAS["uno_menos"],
			"args": [CareerUi.surname(String(data.get("absent", "")))]}
	if MOMENTO_LINEAS.has(momento):
		return _linea(MOMENTO_LINEAS[momento])

	match sala:
		"final":
			return _linea(FINAL_LINEAS.get(_estado_ko(), FINAL_LINEAS["igualada"]))
		"ko":
			if _estado_ko() == "igualada" and String(data.get("ko_regla", "")) == "penales":
				return _linea(KO_PENALES_LINEA)
			return _linea(KO_LINEAS.get(_estado_ko(), KO_LINEAS["igualada"]))
		"derbi":
			return _linea(DERBI_LINEAS[signi(d) + 1])
		"tabla":
			return _linea(TABLA_LINEAS[signi(d) + 1])

	if d < 0:
		return _voz("pierde1")
	if d == 0:
		return _voz("cero" if _you_goals() == 0 else "empate")
	return _voz("gana1" if d == 1 else "gana2")


func _linea(key: String) -> Dictionary:
	return {"key": key, "args": []}









func _voz(situacion: String) -> Dictionary:
	var caracter: String = String(data.get("coach_char", "neutral"))
	var tabla: Dictionary = VOZ.get(situacion, {})
	return _linea(String(tabla.get(caracter, tabla.get("neutral", ""))))





const VOZ: Dictionary = {
	"paliza": {
		"neutral": "Te están pasando por encima. Esto no se arregla solo en la segunda.",
		"padrino": "Esto no es lo que somos. Tú tira del carro y los demás irán detrás.",
		"continuista": "Nos hemos salido del plan. Volved a lo de siempre y el resto llegará.",
		"exigente": "Me dais vergüenza. A todos. Esa camiseta no se regala así.",
		"descarte": "Ya está. Que por lo menos no sea peor.",
	},
	"nota": {
		"neutral": "A ti no te he visto. O apareces en la segunda, o te sientas.",
		"padrino": "Tú no eres éste. Te conozco: sal y demuéstramelo.",
		"continuista": "Haz lo sencillo. Lo que te ha traído hasta aquí, nada más.",
		"exigente": "Así no. Si en diez minutos sigues igual, te cambio.",
		"descarte": "Lo que esperaba de ti. Ni más ni menos.",
	},
	"pierde1": {
		"neutral": "Un gol. Sólo eso os separa, y quedan cuarenta y cinco minutos.",
		"padrino": "Un gol no es nada. Dádsela a él, que sabe qué hacer con ella.",
		"continuista": "Vamos bien aunque no lo parezca. Mismo plan, y el gol llegará.",
		"exigente": "Uno abajo y nadie se ha manchado la camiseta. Quiero verlo en la segunda.",
		"descarte": "Un gol abajo. Haré cambios.",
	},
	"cero": {
		"neutral": "Cero a cero. Esto lo gana el primero que acierte.",
		"padrino": "Cero a cero. La próxima que tengas, adentro. Confío en ti.",
		"continuista": "Cero a cero, como estaba pensado. Paciencia, que el gol viene solo.",
		"exigente": "Cero a cero y nadie ha probado al portero. Eso se acabó.",
		"descarte": "Cero a cero. Seguid así y ya veremos.",
	},
	"empate": {
		"neutral": "Empate. El que se canse primero, pierde.",
		"padrino": "Empate. Marca tú la diferencia, que para eso te traje.",
		"continuista": "Empate. No cambiéis nada: si seguimos así, el partido es nuestro.",
		"exigente": "Un empate no me vale. Quiero más de todos, y de ti el primero.",
		"descarte": "Empate. Algo tocaremos.",
	},
	"gana1": {
		"neutral": "Un gol no es nada. Salid como si fuerais perdiendo.",
		"padrino": "Bien. Seguid buscándole, que el segundo lo lleva en las botas.",
		"continuista": "Ganamos haciendo lo nuestro. Seguid igual.",
		"exigente": "Uno a cero no es nada. No quiero ver ni un paso atrás.",
		"descarte": "Ganamos. No toquéis nada.",
	},
	"gana2": {
		"neutral": "Bien. Ahora lo difícil: no regalar lo que ya es vuestro.",
		"padrino": "Esto es lo que sois. Disfrutadlo, pero sin regalar nada.",
		"continuista": "El plan funciona. Cuarenta y cinco minutos más de lo mismo.",
		"exigente": "Bien. Y ahora no quiero ver a nadie relajándose. A nadie.",
		"descarte": "Está hecho. Aprovecharé para mover el banquillo.",
	},
}


const MOMENTO_LINEAS: Dictionary = {
	"uno_menos": "{0} no vuelve. Los demás, a correr también por él.",
	"filo_contra": "Nos lo han metido en el peor minuto. Olvidadlo ya, o nos come la segunda.",
	"remontada": "Íbamos perdiendo y lo habéis levantado. Eso no os lo regala nadie.",
	"regalo": "Íbamos ganando y lo hemos regalado. Eso no vuelve a pasar.",
	"filo_favor": "El gol en el mejor momento. Ahora están tocados: a por el siguiente.",
	"roja_mia": "Con diez. Cada uno corre por dos, y sin una queja.",
	"roja_suya": "Tienen uno menos. Que lo noten sus piernas, no las nuestras.",
}


const PRORROGA_LINEAS: Dictionary = {
	"igualada": "Si llegamos a los penaltis, quiero once que se tengan en pie.",
	"pasas": "Quince minutos. Aguantadlos como si fueran noventa.",
	"fuera": "Quince minutos para darle la vuelta. Lo que os quede, ahí fuera.",
}
const KO_LINEAS: Dictionary = {
	"igualada": "Así, prórroga. Y nadie quiere prórroga.",
	"pasas": "Ahora mismo pasamos. Que no se os note que lo sabéis.",
	"fuera": "Ahora mismo estamos fuera. Cuarenta y cinco minutos para cambiarlo.",

	"otra": "Así, nos toca otra noche. Que no haga falta.",
}


const KO_PENALES_LINEA: String = "Así, penaltis. Y nadie quiere penaltis."
const FINAL_LINEAS: Dictionary = {
	"igualada": "Una final no se juega: se gana. El que se esconda, al banquillo.",
	"pasas": "Cuarenta y cinco minutos entre vosotros y la copa. Ni uno menos.",
	"fuera": "Nadie se acuerda de los subcampeones. Nadie. Salid a por ella.",
}

const DERBI_LINEAS: Array = [
	"¿Los oís? Pues que sea lo último que cantan hoy.",
	"Esto no es un partido más y lo sabéis. Hoy no se pierde.",
	"Media ciudad está callada ahora mismo. Que siga así.",
]
const TABLA_LINEAS: Array = [
	"Así acabado, la tabla se nos pone cuesta arriba. Hay que darle la vuelta.",
	"Un punto aquí no arregla nada. Quedan pocos partidos y éste es uno.",
	"Si esto acaba así, la tabla se mueve a nuestro favor. No lo tiréis.",
]





















const BARRA_H: float = 18.0


const BARRA_PULSO_A: float = 0.35
const BARRA_PULSO_S: float = 0.55




func _build_energia(parent: Container = null) -> void:
	var e: float = _energy_now()
	_energy_fill = CareerUi.bar(parent if parent != null else card_box,
		_energy_color(e), BARRA_H)
	CareerUi.set_bar(_energy_fill, e / 100.0)
	_pulso_energia(e < float(Career.LOW_ENERGY))





func _energy_now() -> float:
	return clampf(Career.energy, 0.0, 100.0)


func _energy_color(e: float) -> Color:
	return CareerTheme.energy_color(e)





func _pulso_energia(on: bool) -> void:
	if _energy_tw != null and _energy_tw.is_valid():
		_energy_tw.kill()
	_energy_tw = null
	if _energy_fill == null:
		return
	_energy_fill.modulate.a = 1.0
	if not on:
		return
	_energy_tw = create_tween()
	_energy_tw.set_loops()
	_energy_tw.tween_property(_energy_fill, "modulate:a", BARRA_PULSO_A, BARRA_PULSO_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	_energy_tw.tween_property(_energy_fill, "modulate:a", 1.0, BARRA_PULSO_S) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)








































func _build_drink(parent: Container = null) -> void:
	var host: Container = parent if parent != null else card_box
	var st: Dictionary = Career.half_time_drink()
	if st.is_empty():
		return
	var on: bool = bool(st["on"])
	var comprar: bool = bool(st.get("buy", false))

	var valor: String = "$ %s" % CareerUi.money(int(st.get("price", 0))) if comprar \
			else "×%d" % int(st["n"])




	var col: Color = CareerTheme.TEXT_DIM
	if comprar:
		col = CareerTheme.MONEY if on else CareerTheme.DANGER
	else:
		col = text_accent()




	_drink_btn = CareerUi.menu_row(I18n.t("BEBIDA ENERGÉTICA"), valor, col, "lata")


	_drink_btn.custom_minimum_size.y = CareerTheme.BTN_ROW_H
	if on:
		_drink_btn.pressed.connect(_on_drink)



		UiKit.set_cue(_drink_btn, "ui_coin" if comprar else "ui_pop")
	else:
		_drink_btn.disabled = true



		UiKit.deny_tap(_drink_btn)




		_drink_btn.modulate.a = APAGADA_A
	host.add_child(_drink_btn)



	if comprar:
		_drink_hint = card_note(I18n.t("No la tenías: en el túnel cuesta el triple."))
		if host != card_box:
			card_box.remove_child(_drink_hint)
			host.add_child(_drink_hint)








func _on_drink() -> void:
	if _drank or _drink_btn == null:
		return
	var antes: float = Career.energy



	var st: Dictionary = Career.half_time_drink()
	var comprar: bool = bool(st.get("buy", false))
	var hecho: bool = Career.buy_half_drink() if comprar \
			else Career.use_item(Career.HALF_DRINK_ID)
	if not hecho:
		return
	_drank = true
	_drink_btn.disabled = true



	_drink_btn.modulate.a = APAGADA_A
	if _drink_hint != null:
		_drink_hint.visible = false





	var val: Label = SceneFade.meta_vivo(_drink_btn, &"value") as Label
	if val != null:
		val.text = "+%d" % int(round(Career.energy - antes))
		val.add_theme_color_override("font_color", text_accent())




	var tw: Tween = create_tween()
	tw.tween_method(_set_energy_ui, antes, Career.energy, 0.55) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_callback(_refresca_pulso)



	_armar_auto_seguir()




func _set_energy_ui(v: float) -> void:
	_set_energy_text(v)
	if _energy_fill != null:
		CareerUi.set_bar(_energy_fill, clampf(v, 0.0, 100.0) / 100.0)
		_energy_fill.color = _energy_color(v)









func _refresca_pulso() -> void:
	_pulso_energia(_energy_now() < float(Career.LOW_ENERGY))
	if _note_lbl != null:
		_note_lbl.text = _coach_text()






func _coach_text() -> String:
	var linea: Dictionary = _coach_line()
	return I18n.tf(String(linea["key"]), linea.get("args", []))


func _set_energy_text(v: float) -> void:
	if _energy_lbl != null:
		_energy_lbl.text = "%d%%" % int(round(clampf(v, 0.0, 100.0)))













func _tick(delta: float) -> void:

	if _llegada and not _puerta_cerrada and t >= T_PUERTA_CIERRA:
		_puerta_cerrada = true
		if room != null and room.door_open(false):
			locker_door()
		locker_far_to(_far_base, LockerRoom.DOOR_SWING)

	if not _ducha_cerrada and t >= _ducha_off_at:
		_ducha_cerrada = true
		locker_shower_off()


	if t >= _paso_next:


		var quieta: bool = _escenas != null and _escenas.quieta()
		var rango: Vector2 = PASO_VACIA if (_sala_vacia or _bajon or quieta) else PASO_LLENA
		if _llegada and t < T_LLEGADA:
			rango = PASO_LLEGADA
		_paso_next = t + rng.randf_range(rango.x, rango.y)
		locker_step()



	if not _knocked and t >= _voz_next and not (_escenas != null and _escenas.calla()):
		if _voz_left <= 0:
			_voz_left = rng.randi_range(FRASE_SILABAS.x, FRASE_SILABAS.y)
			_voz_next = t + rng.randf_range(FRASE_PAUSA.x, FRASE_PAUSA.y)
		else:
			_voz_left -= 1
			_voz_next = t + rng.randf_range(SILABA.x, SILABA.y)
			coach_talk()




			_voz_pico = 1.0
	_voz_pico = maxf(_voz_pico - delta * 6.0, 0.0)


	if not _tick_patada(delta) and not (_escenas != null and _escenas.manda_tecnico()):
		tick_paseo(delta)
	if _escenas != null:
		_escenas.tick(delta)
	if cam != null:
		cam.fov += sin(t * 0.9) * 0.5
	if not _knocked and t >= _t_silbato:
		_knock()

















func _paseo_gesto(quieto: bool) -> Vector2:
	var x: float = sin(t * 1.7) * 0.012 if quieto else 0.0
	var y: float = sin(t * 3.1) * 0.02 if quieto else 0.0
	return Vector2(x, y - _voz_pico * _voz_pico * 0.022)
