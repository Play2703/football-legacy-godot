extends "res://ui/decision_scene.gd"




























const CENA: String = "cita_cena"
const COPA: String = "cita_copa"
const ARTE: String = "cita_arte"
const DINERO: String = "pareja_dinero"
const PRENUP: String = "pareja_prenup"

const ESCRITURAS: String = "pareja_escrituras"



const ESCRITURAS_HOLD_SECS: float = 1.5
const DIVORCIO: String = "pareja_divorcio"
const RUPTURA: String = "ruptura"
const ANIV: String = "pareja_aniversario"




const CENA_TOQUES: int = 3
const CENA_VIDA: float = 4.2



const CENA_PREMIO_OTRO: float = 3.0
const CENA_CASTIGO: float = -7.0


const CENA_LIMPIO: float = 13.0



const COPA_ACIERTO: float = 7.0
const COPA_FALLO: float = -5.0


const ARTE_RONDAS: int = 3
const ARTE_ACIERTO: float = 8.0
const ARTE_FALLO: float = -4.0

























const ARTE_ZONA: Array[float] = [0.26, 0.21, 0.17]
const ARTE_VEL: Array[float] = [0.9, 1.05, 1.25]



const PAUSA_ECO: float = 0.75











const DINERO_OFERTAS: Array[float] = [0.0, 0.5, 0.8, 1.0]


const DINERO_ETIQUETAS: Array[String] = [
	"NO OFRECERLE NADA", "OFRECERLE LA MITAD", "OFRECERLE CASI TODO",
	"DARLE LO QUE PIDE",
]

const DINERO_RONDAS: int = 3






const DIV_REGATEOS: int = 2
const DIV_JUICIO_BIEN: float = -0.14
const DIV_JUICIO_MAL: float = 0.18


const DIV_JUICIO_P: float = 0.42



const JUGABLES: Array[String] = [
	CENA, COPA, ARTE, DINERO, PRENUP, ESCRITURAS, DIVORCIO, RUPTURA, ANIV,
]


var _juego: VBoxContainer
var _titulo: Label
var _pie: Label


var _puntos: int = 0
var _delta: float = 0.0
var _ronda: int = 0
var _acabado: bool = false


var _toque: Button

var _guardar: Button

var _cuenta: Dictionary = {}
var _oidos: Array = []
var _toque_left: float = 0.0
var _toques_hechos: int = 0
var _toques_libres: int = 0


var _barra: ColorRect
var _zona: ColorRect
var _carro: ColorRect
var _t: float = 0.0
var _dir: float = 1.0
var _corriendo: bool = false

var _copa_ops: Array = []
var _copa_eco: bool = false


var _oferta: int = 0
var _pide: float = 0.0
var _insistidos: int = 0




func _que() -> String:
	return String(data.get("id", Career.week_event))





func _build_panel() -> void:








	if not JUGABLES.has(_que()):
		super()
		return



	var plate: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate_tinted(accent)
	sb.bg_color = Color(CareerTheme.BG_DEEP.r, CareerTheme.BG_DEEP.g,
		CareerTheme.BG_DEEP.b, 0.97)
	plate.add_theme_stylebox_override("panel", sb)
	plate.anchor_left = 0.0
	plate.anchor_right = 1.0
	plate.anchor_top = 1.0
	plate.anchor_bottom = 1.0
	plate.grow_horizontal = Control.GROW_DIRECTION_BOTH
	plate.grow_vertical = Control.GROW_DIRECTION_BEGIN
	add_child(plate)
	plate_ref = plate
	if UiKit.es_horizontal():
		_panel_horizontal(plate)
	var pad: MarginContainer = MarginContainer.new()
	for side in ["left", "right"]:
		pad.add_theme_constant_override("margin_" + side, 26)
	pad.add_theme_constant_override("margin_top", 18)
	pad.add_theme_constant_override("margin_bottom", 18)
	CareerUi.apply_safe_area(pad, get_viewport())
	plate.add_child(pad)
	_juego = VBoxContainer.new()
	_juego.add_theme_constant_override("separation", 12)
	pad.add_child(_juego)
	_titulo = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
	_titulo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_titulo.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART


	_juego.add_child(_titulo)
	_pie = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	_pie.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_pie.clip_text = true
	_juego.add_child(_pie)
	match _que():
		COPA:
			_copa_ronda()
		ARTE:
			_arte_ronda()
		DINERO:
			_dinero_ronda()
		PRENUP, ESCRITURAS:
			_boda_ronda()
		DIVORCIO:
			_div_ronda()
		RUPTURA:
			_rup_ronda()
		ANIV:
			_aniv_ronda()
		_:
			_cena_arranca()



	ficha_puesta = true


func _process(delta: float) -> void:
	super(delta)
	if _acabado:
		return
	match _que():
		CENA:
			_cena_tick(delta)
		ARTE:
			_arte_tick(delta)








































const CENA_QUIEN: Array = [
	{"rel": "agente", "txt": "TU AGENTE · «llámame, es importante»"},
	{"rel": "tecnico", "txt": "EL MÍSTER · vídeo del rival, para hoy"},






	{"rel": "prensa", "txt": "TU MARCA · quieren una foto mañana"},
]


func _cena_arranca() -> void:


	_titulo.text = I18n.t("Va a vibrar tres veces. Guarda el teléfono y escucha lo que te cuenta.")


	_cuenta = Pareja.cuenta_de(String(Career.pareja.get("id", "")),
		Career.world_seed)
	_oidos = []
	_toque_left = 1.6
	_cena_marcador()




func _cena_cuenta_algo() -> void:
	var i: int = _oidos.size()
	if i >= Pareja.TEMAS.size():
		return
	var tema: String = String(Pareja.TEMAS[i])
	_oidos.append(tema)
	_titulo.text = I18n.t(String(
		(Pareja.DATOS[tema] as Array)[int(_cuenta.get(tema, 0))]))





func _cena_barra() -> void:
	if _barra != null and is_instance_valid(_barra):
		_barra.queue_free()
	var caja: Control = Control.new()
	caja.custom_minimum_size = Vector2(0, 10)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_juego.add_child(caja)
	_barra = ColorRect.new()
	_barra.color = CareerTheme.BG_DEEP
	_barra.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.add_child(_barra)
	_zona = ColorRect.new()
	_zona.color = CareerTheme.DANGER
	_zona.anchor_top = 0.0
	_zona.anchor_bottom = 1.0
	_zona.anchor_left = 0.0
	_zona.anchor_right = 1.0
	_barra.add_child(_zona)


func _cena_marcador() -> void:
	_pie.text = I18n.tf("Aguantados sin mirar: {0} de {1}",
		[_toques_libres, CENA_TOQUES])


func _cena_tick(delta: float) -> void:
	_toque_left -= delta
	if _toque_left > 0.0:


		if _toque != null and is_instance_valid(_toque) \
				and _zona != null and is_instance_valid(_zona):
			_zona.anchor_right = clampf(_toque_left / CENA_VIDA, 0.0, 1.0)
		return
	if _toque != null and is_instance_valid(_toque):

		_toque.queue_free()
		_toque = null
		_cena_limpia()
		_toques_libres += 1
		_delta += 2.0

		_cena_cuenta_algo()
		_cena_marcador()
		_toque_left = randf_range(1.4, 2.6)
		if _toques_hechos >= CENA_TOQUES:
			_cena_final()
		return
	if _toques_hechos >= CENA_TOQUES:
		_cena_final()
		return
	_cena_aviso()


func _cena_aviso() -> void:
	var quien: Dictionary = CENA_QUIEN[_toques_hechos % CENA_QUIEN.size()]
	_toques_hechos += 1
	_toque = Button.new()
	_toque.text = "%s  ·  %s" % [I18n.t(String(quien["txt"])), I18n.t("CONTESTAR")]



	CareerTheme.apply_button(_toque, CareerTheme.Kind.WARN, CareerTheme.T_CAPTION)
	_toque.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	_toque.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_toque.clip_text = true
	_toque.pressed.connect(_cena_contesta.bind(String(quien["rel"])))
	_juego.add_child(_toque)
	_cena_barra()

	_guardar = CareerUi.primary_cta(I18n.t("GUARDAR EL TELÉFONO"), _cena_guarda)
	_juego.add_child(_guardar)
	_toque_left = CENA_VIDA





func _cena_guarda() -> void:
	if _toque == null or not is_instance_valid(_toque):
		return
	_toque_left = 0.001



func _cena_limpia() -> void:
	if _guardar != null and is_instance_valid(_guardar):
		_guardar.get_parent().remove_child(_guardar)
		_guardar.queue_free()
		_guardar = null
	if _barra != null and is_instance_valid(_barra):
		var caja: Node = _barra.get_parent()
		_barra = null
		_zona = null
		if caja != null and is_instance_valid(caja):
			caja.get_parent().remove_child(caja)
			caja.queue_free()


func _cena_contesta(rel_key: String) -> void:
	if _toque != null and is_instance_valid(_toque):
		_toque.queue_free()
		_toque = null
		_cena_limpia()




	if not Career.rel_derivada(rel_key):
		Career.rel[rel_key] = clampi(
			int(Career.rel.get(rel_key, 50)) + int(CENA_PREMIO_OTRO), 0, 100)
	_delta += CENA_CASTIGO


	_titulo.text = I18n.t("Ella se calla y espera a que termines. Se le fue lo que iba a decir.")
	_toque_left = randf_range(1.2, 2.2)
	_cena_marcador()
	if _toques_hechos >= CENA_TOQUES:
		_cena_final()


func _cena_final() -> void:
	if _acabado:
		return
	if _toques_libres >= CENA_TOQUES:
		_delta += CENA_LIMPIO
		_titulo.text = I18n.t("No miraste el teléfono ni una vez. Ella lo notó.")
	elif _toques_libres > 0:
		_titulo.text = I18n.t("Contestaste alguna. La noche se salvó a medias.")
	else:
		_titulo.text = I18n.t("Contestaste todas. Pidió la cuenta antes del postre.")




	var cuenta: Dictionary = _cuenta.duplicate()
	cuenta[Pareja.CITAS_OIDOS] = _oidos.duplicate()
	Career.citas_cuenta = cuenta





	_limpia_opciones()
	if _oidos.is_empty():
		_pie.text = I18n.t("No te contó nada. Estabas en otra cosa.")
	else:
		_pie.text = I18n.t("En la próxima cita te lo preguntará:")
		for t in _oidos:
			var l: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT)
			l.text = "· " + I18n.t(String((Pareja.DATOS[t] as Array)[int(_cuenta[t])]))
			l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			_juego.add_child(l)
	_terminar(_toques_libres)







func _copa_ronda() -> void:
	_limpia_opciones()
	var temas: Array = Career.citas_cuenta.get(Pareja.CITAS_OIDOS, [])
	if temas.is_empty():


		temas = Pareja.TEMAS
	if _ronda >= temas.size():
		_copa_final()
		return
	var tema: String = String(temas[_ronda])



	var cierto: int = int(Career.citas_cuenta.get(tema,
		Pareja.cuenta_de(String(Career.pareja.get("id", "")),
			Career.world_seed).get(tema, 0)))
	var q: Dictionary = Pareja.opciones_de(String(Career.pareja.get("id", "")),
		tema, cierto, Career.world_seed)
	_titulo.text = I18n.t(COPA_PREGUNTA.get(tema, "¿Te acuerdas?"))


	_pie.text = I18n.tf("Lo que te contó en la cena · {0} de {1}",
		[_ronda + 1, temas.size()])
	_copa_ops = []
	for i in (q["ops"] as Array).size():
		var b: Button = Button.new()
		b.text = I18n.t(String((q["ops"] as Array)[i]))
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL,
			CareerTheme.T_CAPTION)
		b.pressed.connect(_copa_elige.bind(i == int(q["buena"]), i))
		b.set_meta("buena", i == int(q["buena"]))
		_copa_ops.append(b)
		_juego.add_child(b)





const COPA_PREGUNTA: Dictionary = {
	"lugar": "¿De dónde te dijo que era?",
	"odia": "¿Qué te dijo que no soporta?",
	"pidio": "¿Qué pidió aquella noche?",
}




func _copa_elige(bien: bool, cual: int = -1) -> void:
	if _copa_eco:
		return
	if bien:
		_puntos += 1
		_delta += COPA_ACIERTO
	else:
		_delta += COPA_FALLO
	_ronda += 1
	if cual < 0:
		_copa_ronda()
		return




	_copa_eco = true
	for i in _copa_ops.size():
		var b: Button = _copa_ops[i]
		if not is_instance_valid(b):
			continue


		b.mouse_filter = Control.MOUSE_FILTER_IGNORE
		if bool(b.get_meta("buena", false)):
			CareerTheme.apply_button(b, CareerTheme.Kind.PRIMARY,
				CareerTheme.T_CAPTION)
		elif i == cual:
			CareerTheme.apply_button(b, CareerTheme.Kind.WARN,
				CareerTheme.T_CAPTION)
	_tras_eco(func() -> void:
		_copa_eco = false
		_copa_ronda())


func _copa_final() -> void:
	_limpia_opciones()
	Career.citas_aciertos = _puntos
	if _puntos >= 3:
		_titulo.text = I18n.t("Te acordabas de todo. No se lo esperaba.")
	elif _puntos == 2:
		_titulo.text = I18n.t("Casi todo. Se rió del que fallaste.")
	elif _puntos == 1:
		_titulo.text = I18n.t("Uno de tres. «¿Me estabas escuchando?»")
	else:
		_titulo.text = I18n.t("Ni uno. Esa noche no la escuchaste.")
	var total: int =(Career.citas_cuenta.get(Pareja.CITAS_OIDOS, []) as Array).size()
	if total <= 0:
		total = Pareja.TEMAS.size()
	_pie.text = I18n.tf("Aciertos: {0} de {1}", [_puntos, total])
	_terminar(_puntos)











func _arte_ronda() -> void:
	_limpia_opciones()
	if _ronda >= ARTE_RONDAS:
		_arte_final()
		return
	_titulo.text = I18n.t(ARTE_FRASES[_ronda])



	_pie.text = I18n.tf("Pulsa con la línea dentro de la franja · {0} de {1}",
		[_ronda + 1, ARTE_RONDAS])
	var caja: Control = Control.new()
	caja.custom_minimum_size = Vector2(0, 64)
	caja.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_juego.add_child(caja)







	_barra = ColorRect.new()
	_barra.color = CareerTheme.SURFACE_HI
	_barra.set_anchors_preset(Control.PRESET_FULL_RECT)
	caja.add_child(_barra)


	_zona = ColorRect.new()
	_zona.color = CareerTheme.accent_of(team())
	_zona.anchor_top = 0.0
	_zona.anchor_bottom = 1.0
	var z: float = ARTE_ZONA[_ronda]
	_zona.anchor_left = 0.5 - z * 0.5
	_zona.anchor_right = 0.5 + z * 0.5
	_barra.add_child(_zona)
	_carro = ColorRect.new()
	_carro.color = CareerTheme.TEXT
	_carro.anchor_top = 0.0
	_carro.anchor_bottom = 1.0
	_barra.add_child(_carro)
	_t = 0.0
	_dir = 1.0
	_corriendo = true
	var b: Button = CareerUi.primary_cta(I18n.t("DECIRLO AHORA"), _arte_suelta)




	b.action_mode = BaseButton.ACTION_MODE_BUTTON_PRESS
	_juego.add_child(b)





const ARTE_FRASES: Array[String] = [
	"Ella habla con gente que no conoces. Espera el hueco.",


	"Alguien te pregunta a qué te dedicas. Contesta sin presumir.",
	"Se gira hacia ti. Ahora sí.",
]


func _arte_tick(delta: float) -> void:
	if not _corriendo or _carro == null or not is_instance_valid(_carro):
		return
	_t += delta * ARTE_VEL[mini(_ronda, ARTE_VEL.size() - 1)] * _dir
	if _t >= 1.0:
		_t = 1.0
		_dir = -1.0
	elif _t <= 0.0:
		_t = 0.0
		_dir = 1.0
	_arte_pinta_carro()


func _arte_pinta_carro() -> void:
	if _carro == null or not is_instance_valid(_carro):
		return
	_carro.anchor_left = _t
	_carro.anchor_right = _t
	_carro.offset_left = -3.0
	_carro.offset_right = 3.0


func _arte_suelta() -> void:
	if not _corriendo:
		return
	_corriendo = false

	_arte_pinta_carro()
	var z: float = ARTE_ZONA[mini(_ronda, ARTE_ZONA.size() - 1)]
	var bien: bool = absf(_t - 0.5) <= z * 0.5
	if bien:
		_puntos += 1
		_delta += ARTE_ACIERTO
	else:
		_delta += ARTE_FALLO
	_ronda += 1



	if _zona != null and is_instance_valid(_zona):
		_zona.color = CareerTheme.accent_of(team()).lightened(0.35) if bien \
				else CareerTheme.DANGER
	_pie.text = I18n.tf("Aciertos: {0} de {1}", [_puntos, ARTE_RONDAS])
	_tras_eco(_arte_ronda)





func _tras_eco(sigue: Callable) -> void:
	var tw: Tween = create_tween()
	tw.tween_interval(PAUSA_ECO)
	tw.tween_callback(sigue)


func _arte_final() -> void:
	_limpia_opciones()
	if _puntos >= ARTE_RONDAS:
		_titulo.text = I18n.t("Dijiste lo justo y cuando tocaba. Te presentó a los suyos.")
	elif _puntos > 0:
		_titulo.text = I18n.t("Alguna la acertaste. Al salir te tomó del brazo.")
	else:
		_titulo.text = I18n.t("Hablaste siempre a destiempo. Salisteis pronto.")
	_pie.text = I18n.tf("Aciertos: {0} de {1}", [_puntos, ARTE_RONDAS])
	_terminar(_puntos)









func _dinero_ronda() -> void:
	_limpia_opciones()
	var id: String = String(Career.pareja.get("id", ""))
	if _pide <= 0.0:
		_pide = Pareja.pide_de(id)



	if _insistidos >= DINERO_RONDAS:
		_dinero_final(false)
		return
	_titulo.text = I18n.tf(
		"Quiere el {0} de tu sueldo, todos los meses.", ["%d%%" % roundi(_pide * 100.0)])
	_pie.text = I18n.tf("Serían ${0} por partido.",
		[CareerUi.money(int(round(float(Career.contract.get("wage", 0)) * _pide)))])
	for i in DINERO_OFERTAS.size():



		var pct: float = roundf(_pide * DINERO_OFERTAS[i] * 100.0) / 100.0


		var b: Button = CareerUi.accion("moneda", "%s · %s" % [I18n.t(DINERO_ETIQUETAS[i]),
			"%d%%" % roundi(pct * 100.0)], CareerTheme.MONEY)
		b.size_flags_horizontal = Control.SIZE_FILL
		b.pressed.connect(_dinero_ofrece.bind(pct))
		_juego.add_child(b)


func _dinero_ofrece(pct: float) -> void:
	_oferta = int(round(pct * 100.0))
	if pct >= _pide - 0.001:
		_dinero_final(true, pct)
		return
	_insistidos += 1
	if _insistidos >= DINERO_RONDAS:
		_dinero_final(false)
		return


	_pide = maxf(pct + 0.01, _pide -(_pide - pct) / 3.0)
	_pide = roundf(_pide * 100.0) / 100.0
	_delta += -4.0
	_dinero_ronda()
	_titulo.text = I18n.tf("«¿{0}? No me hagas esto.» Baja al {1}.",
		["%d%%" % _oferta, "%d%%" % roundi(_pide * 100.0)])


func _dinero_final(pactado: bool, pct: float = 0.0) -> void:
	_limpia_opciones()
	if pactado:
		Career.pareja_pago = pct
		_delta += 14.0
		_titulo.text = I18n.tf("Trato hecho: el {0} de tu sueldo, cada partido.",
			["%d%%" % roundi(pct * 100.0)])
		_pie.text = I18n.tf("Sube tu mantenimiento en ${0} por partido.",
			[CareerUi.money(int(round(float(Career.contract.get("wage", 0)) * pct)))])
	else:




		_delta += -22.0
		_titulo.text = I18n.t("Se levantó de la mesa sin acabar la frase.")
		_pie.text = I18n.t("Esto no queda así.")
	_terminar(1 if pactado else 0)











func _boda_ronda() -> void:
	_limpia_opciones()


	var coste: int = Career.boda_coste()
	var bruto: int = Career.boda_coste_bruto()







	var escrituras: bool = _que() == ESCRITURAS
	_titulo.text = "%s %s" % [
		I18n.t("Tu agente pone las escrituras sobre la mesa y pregunta sin mirarte: «¿a nombre de quién?».")
			if escrituras
			else I18n.t("Tu agente lo dice sin mirarte: «firma la separación de bienes»."),
		_prenup_aviso()]




	_pie.text = I18n.tf("La boda cuesta ${0}.", [CareerUi.money(coste)]) if coste > 0 \
			else I18n.tf("La boda la paga ella: ${0}.", [CareerUi.money(bruto)])









	if escrituras:
		_escrituras_botones()
		return

	var pares: Array = [[I18n.t("FIRMAR EL PRENUPCIAL"), true, ""],
			[I18n.t("CASARSE SIN PAPELES"), false, ""]]
	for par in pares:
		var b: Button = CareerUi.accion("contrato_firma" if bool(par[1]) else "pareja",
			String(par[0]), CareerTheme.NAV_GENTE)
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
		b.pressed.connect(_boda_elige.bind(bool(par[1]), String(par[2])))
		_juego.add_child(b)


















func _escrituras_botones() -> void:


	var pares: Array = [
		[I18n.t("MANTÉN · A NOMBRE DE MI MADRE"), Pareja.TITULAR_MADRE, CareerTheme.DANGER],
		[I18n.t("MANTÉN · A SU NOMBRE"), Pareja.TITULAR_ELLA, CareerTheme.GOOD]]
	for par in pares:
		var b: Button = CareerUi.hold_button(_juego, String(par[0]), ESCRITURAS_HOLD_SECS,
			_boda_elige.bind(false, String(par[1])), CareerTheme.T_BODY, Color(par[2]))


		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL



		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART





func _prenup_aviso() -> String:
	var i: float = Pareja.interes_de(String(Career.pareja.get("id", "")))
	if i >= Pareja.INTERES_PIDE:
		return I18n.t("Con ella este papel es una acusación.")
	if i >= 0.3:
		return I18n.t("Le va a doler más de lo que va a decir.")
	return I18n.t("A ella el dinero le da igual.")


func _boda_elige(prenup: bool, titular: String = "") -> void:


	if Career.pareja_casada():
		return
	_limpia_opciones()




	var golpe: float = Pareja.prenup_golpe(String(Career.pareja.get("id", "")))
	var bruto: int = Career.boda_coste_bruto()
	var pago0: float = Career.pareja_pago
	var coste: int = Career.casarse(prenup, titular)
	if titular == Pareja.TITULAR_MADRE:


		_delta += - golpe
		_titulo.text = I18n.t("Tu madre firmó sin gafas y sin preguntar. Al salir te dijo: «Yo no entiendo de papeles, hijo. Pero de esa casa no me saca nadie».")
		if Career.pareja_pago > pago0:
			_titulo.text += " " + I18n.tf("Ella se enteró esa noche y pidió más asignación: el {0} de tu sueldo.",
				["%d%%" % roundi(Career.pareja_pago * 100.0)])
	elif titular == Pareja.TITULAR_ELLA:
		_delta += golpe
		_titulo.text = I18n.t("Leyó su nombre dos veces y sonrió. Esa noche no habló de la asignación.")
	elif prenup:


		_delta += - golpe
		_titulo.text = I18n.t("Firmó sin leerlo y no volvió a mencionarlo en toda la noche.")
	else:
		_delta += golpe
		_titulo.text = I18n.t("Rompiste el papel delante de ella. Ese gesto lo va a recordar.")
	_pie.text = I18n.tf("Boda pagada: ${0}.", [CareerUi.money(coste)]) if coste > 0 \
			else I18n.tf("Boda pagada por ella: ${0}.", [CareerUi.money(bruto)])
	_terminar(1)



















func _div_ruina() -> void:
	_limpia_opciones()





	var c: Dictionary = Career.divorcio_ruina_cuenta()




	var titular: String = String(c.get("titular", ""))
	var opciones: Array = []
	if titular == Pareja.TITULAR_MADRE:


		_titulo.text = I18n.t("Lo pediste tú, y las escrituras están a nombre de tu madre: no hay nada que repartir.") \
				if bool(Career.pareja.get("la_dejas", false)) \
				else I18n.t("Su abogado pidió la casa. Las escrituras dicen otra cosa.")
		_pie.text = I18n.t("La casa está a nombre de tu madre.")
		opciones.append([I18n.t("FIRMAR Y QUE SE VAYA"), true])
	elif titular == Pareja.TITULAR_ELLA and int(c["mitad"]) <= 0:


		_titulo.text = I18n.t("Su abogado trae las escrituras con su nombre, pero tu cuenta está a cero: no hay mitad que llevarse.")
		_pie.text = I18n.t("La casa y tu ficha se quedan.")
		opciones.append([I18n.t("FIRMAR Y QUE SE VAYA"), false])
	elif titular == Pareja.TITULAR_ELLA:
		_titulo.text = I18n.t("Su abogado trae las escrituras con su nombre. El tuyo consigue cambiarlas por la mitad de tu cuenta.")
		_pie.text = I18n.t("La casa y tu ficha se quedan.")
		opciones.append([I18n.tf("LA MITAD DE TU DINERO · ${0}",
			[CareerUi.short_money(int(c["mitad"]))]), false])
	else:
		opciones = _div_ruina_papeles(c)
	for par in opciones:
		var b: Button = Button.new()
		b.text = String(par[0])
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_CTA_H)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL




		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART




		CareerTheme.apply_button(b, CareerTheme.Kind.WARN, CareerTheme.T_BODY)
		b.pressed.connect(_div_ruina_elige.bind(bool(par[1])))
		_juego.add_child(b)




func _div_ruina_papeles(c: Dictionary) -> Array:
	var prenup: bool = bool(c["prenup"])





	_titulo.text = I18n.t("Su abogado no negocia. Pone dos papeles sobre la mesa y te dice que firmes uno.")
	_pie.text = I18n.t("La separación de bienes que firmasteis recorta las dos.") \
			if prenup else I18n.t("No hay tercera opción.")




	var opciones: Array = []
	if prenup:
		opciones.append([I18n.tf("PAGAR Y QUEDÁRTELA · ${0}",
			[CareerUi.short_money(int(c["casa_dinero"]))]), true])
	else:
		opciones.append([I18n.tf("LA CASA · ${0}",
			[CareerUi.short_money(Career.patrimonio_casa())]), true])







	opciones.append([I18n.tf("{0} DE TU FICHA · ${1} POR PARTIDO · {2} TEMPORADAS",
		["%d%%" % int(round(float(c["pension_frac"]) * 100.0)),
		CareerUi.money(int(c["pension_cuota"])), int(c["temporadas"])]), false])
	return opciones


func _div_ruina_elige(casa: bool) -> void:



	if not Career.pareja_casada():
		return
	var r: Dictionary = Career.divorcio_ruina(casa)
	_limpia_opciones()
	var prenup: bool = bool(r.get("prenup", false))
	var titular: String = String(r.get("titular", ""))
	if titular == Pareja.TITULAR_MADRE:
		_titulo.text = I18n.t("Se fue con dos maletas, las mismas con las que llegó.")
		_pie.text = I18n.t("La casa sigue a nombre de tu madre.")
	elif titular == Pareja.TITULAR_ELLA and int(r.get("dinero", 0)) <= 0:
		_titulo.text = I18n.t("Se fue con dos maletas, las mismas con las que llegó.")
		_pie.text = I18n.t("La casa y tu ficha se quedan.")
	elif titular == Pareja.TITULAR_ELLA:
		_titulo.text = I18n.t("Firmaste. La casa vuelve a ser tuya; la cuenta, la mitad.")
		_pie.text = I18n.tf("${0}, y las llaves siguen siendo tuyas.",
			[CareerUi.money(int(r.get("dinero", 0)))])
	elif casa and prenup:
		_titulo.text = I18n.t("Pagaste por tu propia casa. El papel valió justo eso.")
		_pie.text = I18n.tf("${0}, y las llaves siguen siendo tuyas.",
			[CareerUi.money(int(r.get("dinero", 0)))])
	elif casa:
		_titulo.text = I18n.t("Recogiste en dos cajas. La vitrina se quedó donde estaba.")
		_pie.text = I18n.t("La casa es suya, y todo lo que le metiste dentro.")
	else:
		_titulo.text = I18n.t("Firmaste el otro. Cinco años pagando lo que ya no está en tu cuenta.") \
				if prenup else I18n.t("Firmaste el otro. Cinco años de que cada partido rinda la mitad.")
		_pie.text = I18n.tf("${0} por partido, y sube si tú subes.",
			[CareerUi.money(int(r.get("cuota", 0)))])
	_delta = 0.0
	_terminar(0)


func _div_ronda() -> void:
	_limpia_opciones()

	if Pareja.arruina(String(Career.pareja.get("id", ""))):
		_div_ruina()
		return
	var cuenta: Dictionary = Career.divorcio_cuenta(_delta_div())
	_titulo.text = I18n.tf("Piden ${0}: ${1} de tu dinero y ${2} de lo que tienes puesto.", [
		CareerUi.money(int(cuenta["total"])), CareerUi.money(int(cuenta["dinero"])),
		CareerUi.money(int(cuenta["patrimonio"]))])
	_pie.text = I18n.t("Con separación de bienes firmada") if Career.pareja_prenup \
			else I18n.t("Sin separación de bienes: entra todo")
	var firmar: Button = CareerUi.primary_cta(I18n.t("FIRMAR Y ACABAR"),
		_div_acepta)
	if UiKit.es_horizontal():


		firmar.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_juego.add_child(firmar)
	if _insistidos < DIV_REGATEOS:

		var pelear: Button = CareerUi.accion("moneda", I18n.t("PELEAR LA CIFRA"),
			CareerTheme.MONEY)
		pelear.size_flags_horizontal = Control.SIZE_FILL
		pelear.pressed.connect(_div_pelea)
		_juego.add_child(pelear)
	var juicio: Button = Button.new()
	juicio.text = I18n.t("IR A JUICIO")
	juicio.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
	juicio.clip_text = true
	CareerTheme.apply_button(juicio, CareerTheme.Kind.WARN, CareerTheme.T_CAPTION)
	juicio.pressed.connect(_div_juicio)
	_juego.add_child(juicio)




func _delta_div() -> float:
	return float(_puntos) / 100.0


func _div_pelea() -> void:
	_insistidos += 1


	_puntos -= 2 if _insistidos == 1 else 1
	_div_ronda()
	_titulo.text = I18n.t("Su abogado tarda dos días en contestar. Baja un poco, y poco.") \
			+ "\n" + _titulo.text


func _div_juicio() -> void:
	var bien: bool = randf() < DIV_JUICIO_P






	var frac_antes: float = _delta_div()
	_puntos += int(round((DIV_JUICIO_BIEN if bien else DIV_JUICIO_MAL) * 100.0))
	var ahorro: int = Career.divorcio_ahorro(frac_antes, _delta_div()) if bien else 0
	var cuenta: Dictionary = Career.divorciarse(_delta_div())
	_limpia_opciones()
	if bien and ahorro > 0:
		_titulo.text = I18n.tf("El juez no le dio todo lo que pedía. Te llevas ${0} menos.",
			[CareerUi.money(ahorro)])
	elif bien:


		_titulo.text = I18n.t("El juez no le dio lo que pedía. Tampoco había mucho que repartir.")
	else:
		_titulo.text = I18n.t("Salió peor que el acuerdo. Los abogados también se cobran.")
	_div_cierra(cuenta)


func _div_acepta() -> void:
	var cuenta: Dictionary = Career.divorciarse(_delta_div())
	_limpia_opciones()
	_titulo.text = I18n.t("Firmaste sin leerlo entero. Se acabó.")
	_div_cierra(cuenta)


func _div_cierra(cuenta: Dictionary) -> void:
	_pie.text = I18n.tf("Se lleva ${0}. Te quedan ${1}.", [
		CareerUi.money(int(cuenta["total"])), CareerUi.money(Career.money)])


	_delta = 0.0
	_terminar(0)


















const RUP_RONDAS: int = 3


const RUP_SALVA: float = 26.0























const RUP_REPLICAS: Array = [
	[

		{"txt": "«Me quedo. Los viajes que pueda perdonar, los pierdo.»",
			"rasgos": ["casera", "companera", "celosa", "reservada"]},


		{"txt": "«No te voy a pedir que esperes. Te pido que elijas tú.»",
			"rasgos": ["independiente", "ambiciosa", "fiestera", "hincha",
				"cazafortunas", "millonaria"]},
		{"txt": "«Esto se arregla con tiempo. Dame la temporada.»", "rasgos": []},
	],
	[


		{"txt": "«Dime qué necesitas y lo hago mañana.»",
			"rasgos": ["ambiciosa", "fiestera", "hincha", "celosa", "cazafortunas"]},

		{"txt": "«No hace falta que digas nada. Me siento y te escucho.»",
			"rasgos": ["reservada", "casera", "companera", "independiente",
				"millonaria"]},
		{"txt": "«Piensa en todo lo que hemos hecho.»", "rasgos": []},
	],
	[

		{"txt": "«Si te vas lo entiendo. Pero prefiero que te quedes.»",
			"rasgos": ["independiente", "celosa", "reservada", "casera",
				"companera"]},

		{"txt": "«Mañana no hay entrenamiento. Vámonos donde quieras.»",
			"rasgos": ["fiestera", "hincha", "ambiciosa", "cazafortunas",
				"millonaria"]},
		{"txt": "«Ya está, ¿no? Pues ya está.»", "rasgos": []},
	],
]




func _rup_margen() -> int:
	var m: int = 0

	if Career.citas_aciertos >= 3:
		m += 1

	if Career.pareja_pago > 0.0 or Career.pareja_casada():
		m += 1
	return m


func _rup_ronda() -> void:
	_limpia_opciones()
	if _ronda >= RUP_RONDAS:
		_rup_final()
		return
	var margen: int = _rup_margen()
	var fallos: int = _ronda - _puntos
	_titulo.text = I18n.t(RUP_PIE[_ronda])
	_pie.text = I18n.tf("Le queda una noche. Aciertos: {0} de {1}",
		[_puntos, RUP_RONDAS]) if _ronda > 0 \
				else I18n.t("Lo que digas ahora depende de quién es ella.")

	if fallos > margen:
		_rup_final()
		return
	var rasgo: String = String(Pareja.by_id(
		String(Career.pareja.get("id", ""))).get("rasgo", ""))
	_fila_ella()
	for r in (RUP_REPLICAS[_ronda] as Array):
		var op: Dictionary = r
		var b: Button = Button.new()
		b.text = I18n.t(String(op["txt"]))
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL,
			CareerTheme.T_CAPTION)
		b.pressed.connect(_rup_elige.bind(
			(op["rasgos"] as Array).has(rasgo)))
		_juego.add_child(b)




const RUP_PIE: Array[String] = [
	"Se sienta en el brazo del sofá, sin quitarse el abrigo.",
	"No ha dicho que no. Sigue ahí.",
	"Mira las maletas y luego te mira a ti.",
]


func _rup_elige(bien: bool) -> void:
	if bien:
		_puntos += 1
	_ronda += 1
	_rup_ronda()


func _rup_final() -> void:
	_limpia_opciones()
	var fallos: int = _ronda - _puntos


	if fallos <= _rup_margen() and _puntos > 0:



		Career.pareja_reconciliar(RUP_SALVA)
		_delta = 0.0
		_titulo.text = I18n.t("Deshizo una maleta. Sólo una, y sin decir nada.")
		_pie.text = I18n.t("Se queda. No es lo de antes, pero se queda.")
	else:






		var fin: Dictionary = Career.terminar_relacion()
		if bool(fin.get("pendiente", false)):
			_titulo.text = I18n.t("Se fue con una maleta y dejó el resto. Su abogado llamará el lunes.")
			_pie.text = I18n.t("Todavía estáis casados. Eso se firma, no se dice.")
		else:
			_titulo.text = I18n.t("Cerró la puerta despacio, que es peor que un portazo.")
			_pie.text = I18n.t("Se acabó.")
		_delta = 0.0
	_terminar(1 if fallos <= _rup_margen() else 0)












const ANIV_OPCIONES: int = 3


func _aniv_ronda() -> void:
	_limpia_opciones()
	var id: String = String(Career.pareja.get("id", ""))
	var rasgo: String = String(Pareja.by_id(id).get("rasgo", ""))
	_titulo.text = I18n.tf("Un año. Lo que le regales dice si la conociste.",
		[]) if Career.pareja_anios() <= 1 else I18n.tf(
		"{0} años. Lo que le regales dice si la conociste.",
		[Career.pareja_anios()])
	_pie.text = I18n.tf("Poso de los años: {0}%",
		[roundi(Career.pareja_poso() * 100.0)])
	_fila_ella()








	var rng := RandomNumberGenerator.new()
	rng.seed = hash("aniv|%s|%d" % [id, Career.pareja_anios()])
	var suyos: Array = []
	var ajenos: Array = []
	var vacio: int = -1
	for i in (Pareja.REGALOS as Array).size():
		var rr: Array = Pareja.REGALOS[i]["rasgos"]
		if rr.is_empty():
			vacio = i
		elif rr.has(rasgo):
			suyos.append(i)
		else:
			ajenos.append(i)



	if suyos.is_empty() or ajenos.is_empty() or vacio < 0:
		_titulo.text = I18n.t("Se te pasó la fecha. Ella no dijo nada.")
		Career.pareja_aniversario(false)
		_terminar(0)
		return
	var elegidos: Array = [suyos[rng.randi() % suyos.size()],
		ajenos[rng.randi() % ajenos.size()], vacio]
	for i in range(elegidos.size() - 1, 0, -1):
		var j2: int = rng.randi() %(i + 1)
		var t2: Variant = elegidos[i]
		elegidos[i] = elegidos[j2]
		elegidos[j2] = t2
	for i in elegidos:
		var g: Dictionary = Pareja.REGALOS[int(i)]
		var b: Button = Button.new()
		b.text = I18n.t(String(g["txt"]))
		b.custom_minimum_size = Vector2(0, CareerTheme.BTN_ROW_H)
		b.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL,
			CareerTheme.T_CAPTION)
		b.pressed.connect(_aniv_elige.bind(
			(g["rasgos"] as Array).has(rasgo)))
		_juego.add_child(b)


func _aniv_elige(bien: bool) -> void:
	_limpia_opciones()
	Career.pareja_aniversario(bien)
	if bien:
		_delta += 15.0
		_titulo.text = I18n.t("Se quedó callada un momento. Era exactamente eso.")
		_pie.text = I18n.tf("Poso de los años: {0}% — las malas rachas pesan menos.",
			[roundi(Career.pareja_poso() * 100.0)])
	else:
		_delta += -6.0
		_titulo.text = I18n.t("Dio las gracias y lo dejó en la mesa del recibidor.")
		_pie.text = I18n.t("Un año más, y sigues sin saber quién es.")
	_terminar(1 if bien else 0)












func _fila_ella() -> void:
	var arq: String = String(Career.pareja.get("id", ""))
	if Pareja.by_id(arq).is_empty():
		return
	var fila: HBoxContainer = HBoxContainer.new()
	fila.name = "FilaElla"
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.add_theme_constant_override("separation", 10)
	_juego.add_child(fila)
	fila.add_child(ParejaFicha.chapa(self, arq, 44.0))
	var album: Array = Pareja.ALBUM.get(arq, [arq, ""])
	var nom: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.RASGO.get(
		RasgoBadge.PREFIJO_PAREJA + arq, CareerTheme.TEXT_DIM))


	nom.text = CareerTheme.caps(I18n.t(String(album[0])))
	fila.add_child(nom)







func _limpia_opciones() -> void:
	for child in _juego.get_children():
		if child == _titulo or child == _pie:
			continue
		_juego.remove_child(child)
		child.queue_free()
	_toque = null






func _terminar(logro: int) -> void:
	if _acabado:
		return
	_acabado = true
	_corriendo = false
	var q: String = _que()
	if q == CENA or q == COPA or q == ARTE:


		if logro > 0 or q == CENA:
			Career.citas_hechas = maxi(Career.citas_hechas, _escalon(q))


	Career.aplica_cita(_delta, q)


	if q == DINERO and logro == 0:
		Career.pareja_regateo_fallido()
	var salir: Button = CareerUi.primary_cta(I18n.t("CONTINUAR"), _leave)
	_juego.add_child(salir)




func _escalon(q: String) -> int:
	match q:
		CENA:
			return 1
		COPA:
			return 2
		ARTE:
			return 3
	return 0
