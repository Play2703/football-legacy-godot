extends "res://ui/ceremonies/banca_juego.gd"













const COMPAS: float = 0.46
const T_VEREDICTO: float = COMPAS * 2.0 + 0.85
const T_SIGUE: float = T_VEREDICTO + 1.15

const AUTO_ELIGE: float = 0.9

var _botones: Array[Button] = []
var _bocadillo_yo: PanelContainer
var _bocadillo_el: PanelContainer
var _mano_yo: TextureRect
var _mano_el: TextureRect
var _mania: int = 0
var _fase: String = "elige"
var _reloj: float = 0.0
var _compas: int = -1
var _mia: int = 0
var _suya: int = 0
var _mios: Array = []
var _suyos: Array = []


func _kind() -> String:
	return Ceremonies.BANCA_CHINCHANPU


func _titulo() -> String:
	return "CHIN CHAN PU"


func _bolitas() -> int:
	return BancaJuego.CHIN_GANA_A


func _gestos() -> Array:
	return ["chinchan", "gana", "pierde"]


func _monta_juego(caja: VBoxContainer) -> void:
	_mania = BancaJuego.mania(llave_el if not llave_el.is_empty() else nombre_el)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 12)
	caja.add_child(fila)
	for cual in 3:
		var b: Button = Button.new()
		b.custom_minimum_size = Vector2(0, 128)
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.focus_mode = Control.FOCUS_NONE

		CareerTheme.apply_button_tinted(b, CareerTheme.NAV_YO)
		var m: TextureRect = mano(cual, piel_yo, 96)
		m.set_anchors_preset(Control.PRESET_FULL_RECT)
		m.offset_bottom = - float(CareerTheme.SINK)
		b.add_child(m)
		b.pressed.connect(_elige.bind(cual))

		if cual == 1:
			b.set_meta(Entrada.PRIMERO_META, true)
		fila.add_child(b)
		_botones.append(b)
	_bocadillo_yo = burbuja(yo)
	_mano_yo = mano(BancaJuego.PIEDRA, piel_yo, 84)
	_bocadillo_yo.add_child(_mano_yo)
	_bocadillo_el = burbuja(el)
	_mano_el = mano(BancaJuego.PIEDRA, piel_el, 84)
	_bocadillo_el.add_child(_mano_el)
	_activa(false)


func _activa(si: bool) -> void:
	for b in _botones:
		b.disabled = not si


	if si and _botones.size() == 3:
		foco_juego(_botones[1], _botones)


func _juega(delta: float) -> void:
	_reloj += delta
	if _fase == "elige":
		if _compas < 0:
			_compas = 0
			_activa(true)
			_bocadillo_yo.visible = false
			_bocadillo_el.visible = false
			di(I18n.t("¡ELIGE!"))


			cara_fondo(yo, "concentra")
			cara_fondo(el, "concentra")
		if auto and _reloj >= AUTO_ELIGE:
			_elige(azar.randi() % 3)
		return

	if _compas == 0 and _reloj >= 0.0:
		_compas = 1
		_bocadillo_yo.visible = true
		_bocadillo_el.visible = true
		_puño()
		di(I18n.t("CHIN"))
	elif _compas == 1 and _reloj >= COMPAS:
		_compas = 2
		_puño()
		di(I18n.t("CHAN"))
	elif _compas == 2 and _reloj >= COMPAS * 2.0:
		_compas = 3
		_mano_yo.texture = load(MANOS_PNG[_mia])
		_mano_el.texture = load(MANOS_PNG[_suya])
		UiKit.punch(_bocadillo_yo)
		UiKit.punch(_bocadillo_el)
		di(I18n.t("¡PU!"))
		sting("ui_pop", -6.0)

		cara_momento(yo, "grito", T_VEREDICTO - COMPAS * 2.0)
		cara_momento(el, "grito", T_VEREDICTO - COMPAS * 2.0)
	elif _compas == 3 and _reloj >= T_VEREDICTO:
		_compas = 4
		var g: int = BancaJuego.gana(_mia, _suya)


		if g > 0:
			_mios.append(BIEN)
			di(I18n.t("¡TUYA!"), CareerTheme.NAV_YO)
			gesto(yo, "gana")
			gesto(el, "pierde")
			cara_momento(yo, "reir", CARA_MOMENTO_S)
			cara_momento(el, "protesta", CARA_MOMENTO_S)
		elif g < 0:
			_suyos.append(BIEN)
			di(I18n.t("¡SUYA!"), CareerTheme.NAV_GENTE)
			gesto(el, "gana")
			gesto(yo, "pierde")
			cara_momento(el, "reir", CARA_MOMENTO_S)
			cara_momento(yo, "protesta", CARA_MOMENTO_S)
		else:
			di(I18n.t("¡OTRA!"))
			cara_momento(yo, "sorpresa", CARA_MOMENTO_S * 0.7)
			cara_momento(el, "sorpresa", CARA_MOMENTO_S * 0.7)
		pinta_marcador(_mios, _suyos)
		UiAudio.haptic(20 if g > 0 else 10)
	elif _compas == 4 and _reloj >= T_SIGUE:
		if _mios.size() >= BancaJuego.CHIN_GANA_A:
			termina(1, _chin_premio())
		elif _suyos.size() >= BancaJuego.CHIN_GANA_A:
			termina(-1)
		else:
			_fase = "elige"
			_compas = -1
			_reloj = 0.0






func _chin_premio() -> String:
	if not BancaJuego.chin_blanqueada(_mios.size(), _suyos.size()):
		return ""
	if Settings.celeb_desbloqueado(BancaJuego.CHIN_CELEB):
		return ""
	var van: int = Settings.suma_chin_blanqueada()
	if van < BancaJuego.CHIN_BLANQUEADAS:
		return I18n.tf("2-0: {0} de {1} para festejar tus goles con CHIN CHAN PU.",
			[van, BancaJuego.CHIN_BLANQUEADAS])
	Settings.desbloquea_celeb(BancaJuego.CHIN_CELEB)
	return I18n.t("¡CHIN CHAN PU DESBLOQUEADO! Ya sale en tus goles.")


func _puño() -> void:
	_mano_yo.texture = load(MANOS_PNG[BancaJuego.PIEDRA])
	_mano_el.texture = load(MANOS_PNG[BancaJuego.PIEDRA])
	gesto(yo, "chinchan")
	gesto(el, "chinchan")
	sting("ui_click", -10.0)


func _elige(cual: int) -> void:
	if _fase != "elige" or acabado:
		return
	_mia = cual
	_suya = BancaJuego.saca(azar, _mania)
	_activa(false)
	_fase = "canto"
	_compas = 0
	_reloj = 0.0
