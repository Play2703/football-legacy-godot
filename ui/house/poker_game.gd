class_name PokerGame
extends Control















const FICHA: int = 1000


const CIEGA: int = 10






const CARTA_PAPEL: Color = Color("f2efe6")
const CARTA_ROJA: Color = Color("b23a3a")
const CARTA_NEGRA: Color = Color("1c1c20")

signal cerrada(saldo: int)

var _mesa: PokerMesa = null
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _fichas_inicio: int = 0

var _invitados: Array = []
var _card: PanelContainer = null
var _col: VBoxContainer = null


func abrir(invitados: Array, fichas: int) -> void:
	_invitados = invitados
	_fichas_inicio = fichas
	_rng.randomize()
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	var velo: ColorRect = ColorRect.new()
	velo.set_anchors_preset(Control.PRESET_FULL_RECT)
	velo.color = CareerTheme.SCRIM
	add_child(velo)
	_card = PanelContainer.new()
	_card.add_theme_stylebox_override("panel", CareerTheme.plate())
	_card.set_anchors_preset(Control.PRESET_FULL_RECT)
	_card.add_theme_constant_override("margin_left", 24)
	add_child(_card)
	_col = VBoxContainer.new()
	_col.add_theme_constant_override("separation", 14)
	_card.add_child(_col)
	_nueva_mano()





func _nueva_mano() -> void:
	var gente: Array = []
	if _mesa == null:
		gente.append({"nombre": CareerUi.you_name(), "fichas": _fichas_inicio,
			"caracter": "normal"})
		for g in _invitados:
			gente.append({"nombre": String(g.get("nombre", "?")),
				"fichas": int(g.get("fichas", _fichas_inicio)),
				"caracter": String(g.get("caracter", "normal"))})
	else:
		for j in _mesa.jugadores:
			if int(j["fichas"]) > 0:
				gente.append({"nombre": String(j["nombre"]),
					"fichas": int(j["fichas"]),
					"caracter": String(j["caracter"])})
	if gente.size() < 2 or int(gente[0]["fichas"]) <= 0:
		_terminar()
		return
	var reparte: int = 0 if _mesa == null \
			else (_mesa.repartidor + 1) % gente.size()
	_mesa = PokerMesa.new()
	_mesa.iniciar(gente, CIEGA, _rng, reparte)
	_mesa.correr_ia()
	_pintar()


func _pintar() -> void:
	for c in _col.get_children():
		c.queue_free()
	var tit: Label = CareerUi.plain(30, CareerTheme.TEXT)
	tit.text = I18n.t("MESA DE PÓQUER")
	tit.clip_text = true
	_col.add_child(tit)

	var bote: Label = CareerUi.plain(24, CareerTheme.MONEY)
	bote.text = I18n.tf("BOTE: {0}", [str(_mesa.bote * FICHA)])
	_col.add_child(bote)

	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 8)
	_col.add_child(fila)
	for c in _mesa.comunitarias:
		fila.add_child(_carta(int(c)))
	if _mesa.comunitarias.is_empty():
		var esperando: Label = CareerUi.plain(20, CareerTheme.TEXT_DIM)
		esperando.text = I18n.t("Aún no hay cartas en la mesa.")
		fila.add_child(esperando)

	var mias: HBoxContainer = HBoxContainer.new()
	mias.add_theme_constant_override("separation", 8)
	_col.add_child(mias)
	var yo: Dictionary = _mesa.jugadores[0]
	for c in (yo["mano"] as Array):
		mias.add_child(_carta(int(c), true))
	var mio: Label = CareerUi.plain(22, CareerTheme.TEXT)
	mio.text = I18n.tf("TUS FICHAS: {0}", [str(int(yo["fichas"]) * FICHA)])
	_col.add_child(mio)

	for i in range(1, _mesa.jugadores.size()):
		var j: Dictionary = _mesa.jugadores[i]


		var apagado: Color = CareerTheme.TEXT_DIM
		apagado.a = 0.35
		var l: Label = CareerUi.plain(18, CareerTheme.TEXT if bool(j["activo"]) \
				else apagado)
		l.text = "%s · %d%s" % [String(j["nombre"]), int(j["fichas"]) * FICHA,
			"" if bool(j["activo"]) else "  (" + I18n.t("SE RETIRÓ") + ")"]
		l.clip_text = true
		_col.add_child(l)

	var ult: Label = CareerUi.plain(18, CareerTheme.TEXT_DIM)
	ult.text = " · ".join(_mesa.relato.slice(maxi(0, _mesa.relato.size() - 3)))
	ult.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_col.add_child(ult)
	if _mesa.terminada:
		_botones_fin()
	else:
		_botones_turno()








func _carta_estilo() -> StyleBoxFlat:
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CARTA_PAPEL
	sb.border_color = CARTA_PAPEL.darkened(0.35)
	sb.set_corner_radius_all(8)
	sb.set_border_width_all(2)
	sb.set_content_margin_all(4.0)
	return sb




func _carta(c: int, grande: bool = false) -> Control:
	var p: PanelContainer = PanelContainer.new()
	p.custom_minimum_size = Vector2(84 if grande else 68, 116 if grande else 94)
	p.add_theme_stylebox_override("panel", _carta_estilo())
	var l: Label = CareerUi.plain(30 if grande else 24,
		CARTA_ROJA if Poker.palo_de(c) in [1, 2] else CARTA_NEGRA)
	l.text = Poker.carta_nombre(c)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	p.add_child(l)
	return p


func _botones_turno() -> void:
	var acciones: Array[int] = _mesa.acciones()
	if _mesa.turno != 0 or acciones.is_empty():


		var seguir: Button = Button.new()
		seguir.custom_minimum_size = Vector2(0, 96)
		seguir.text = I18n.t("SEGUIR")
		CareerTheme.apply_button(seguir, CareerTheme.Kind.PRIMARY, 24)
		seguir.pressed.connect(func() -> void:
			_mesa.correr_ia()
			_pintar())
		_col.add_child(seguir)
		return
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	_col.add_child(fila)
	for a in acciones:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 96)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.clip_text = true
		match a:
			PokerMesa.RETIRARSE: b.text = I18n.t("RETIRARSE")
			PokerMesa.PASAR: b.text = I18n.t("PASAR")
			PokerMesa.IGUALAR: b.text = I18n.t("IGUALAR")
			PokerMesa.SUBIR: b.text = I18n.tf("SUBIR A {0}",
				[str(_mesa.subida_minima() * FICHA)])
		CareerTheme.apply_button(b,
			CareerTheme.Kind.PRIMARY if a == PokerMesa.SUBIR \
					else CareerTheme.Kind.NEUTRAL, 20)
		b.pressed.connect(func() -> void:
			UiAudio.click()
			_mesa.actuar(a, _mesa.subida_minima())
			_mesa.correr_ia()
			_pintar())
		fila.add_child(b)


func _botones_fin() -> void:
	var otra: Button = Button.new()
	otra.custom_minimum_size = Vector2(0, 96)
	otra.text = I18n.t("OTRA MANO")
	CareerTheme.apply_button(otra, CareerTheme.Kind.PRIMARY, 24)
	otra.pressed.connect(func() -> void: _nueva_mano())
	_col.add_child(otra)
	var salir: Button = Button.new()
	salir.custom_minimum_size = Vector2(0, 88)
	salir.text = I18n.t("LEVANTARSE DE LA MESA")
	CareerTheme.apply_button(salir, CareerTheme.Kind.GHOST, 22)
	salir.pressed.connect(func() -> void: _terminar())
	_col.add_child(salir)




func _terminar() -> void:
	var final: int = 0
	if _mesa != null and not _mesa.jugadores.is_empty():
		final = int(_mesa.jugadores[0]["fichas"])
	var saldo: int =(final - _fichas_inicio) * FICHA
	cerrada.emit(saldo)
	queue_free()
