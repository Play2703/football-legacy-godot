extends "res://ui/ceremonies/banca_juego.gd"





















const VUELO: float = 0.78
const ALTO: float = 0.62


const VUELCA: float = 0.24
const ASIENTA: float = 0.14
const PAUSA: float = 1.15


const MANO_Y: float = 0.82
const DELANTE: float = 0.32





const FILA: float = 0.1
const CARRIL: float = 0.19
const ABRE: float = 0.04




const AGUA_H: float = 0.2
const AGUA_R: float = 0.86
const AGUA_TUMBADA_H: float = 0.5
const AGUA_TUMBADA_R: float = 0.55
const PLASTICO: Color = Color(0.86, 0.93, 0.98, 0.34)
const AGUA: Color = Color(0.25, 0.58, 0.9, 1.0)

const RADIO: float = 0.045



const AUTO_DESVIO: Array[float] = [0.0, 0.23, 0.0]

const AUTO_DAB: Array[float] = [0.0, 0.0, 0.0]

var _barra: Panel
var _franja: ColorRect
var _lleno: ColorRect
var _aguja: ColorRect
var _lanza: Button
var _bot: Node3D
var _agua: MeshInstance3D
var _mat_agua: StandardMaterial3D
var _centro: float = -1.0
var _lat: Vector3 = Vector3.ZERO
var _turno: int = -1
var _fase: String = ""
var _t: float = 0.0
var _tb: float = 0.0
var _f: float = 0.0
var _f_el: float = 0.0
var _f_prev: float = 0.0
var _desde: Vector3
var _hasta: Vector3
var _eje: Vector3 = Vector3.BACK
var _ang: float = 0.0
var _ang_fin: float = 0.0
var _sobra: float = 0.0
var _mios: Array = []
var _suyos: Array = []


func _kind() -> String:
	return Ceremonies.BANCA_BOTELLA


func _titulo() -> String:
	return "BOTELLA DE PIE"


func _bolitas() -> int:
	return BancaJuego.BOT_INTENTOS


func _gestos() -> Array:
	return ["lanza", "gana", "pierde"]


func _build() -> void:
	super._build()
	_mat_agua = StandardMaterial3D.new()
	_mat_agua.albedo_color = AGUA
	_mat_agua.roughness = 0.2
	_nueva_botella()








func _nueva_botella() -> void:
	_bot = Node3D.new()
	viewport.add_child(_bot)
	var b: Node3D = stadium.make_bottle(PLASTICO, Stadium.BOTTLE_WATER_CAP)
	b.position = Vector3(0.0, - _medio(), 0.0)
	_bot.add_child(b)
	var cil: CylinderMesh = CylinderMesh.new()
	cil.top_radius = 1.0
	cil.bottom_radius = 1.0
	cil.height = 1.0
	cil.radial_segments = 12
	cil.rings = 1
	_agua = MeshInstance3D.new()
	_agua.mesh = cil
	_agua.material_override = _mat_agua
	_agua.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	b.add_child(_agua)
	_pon_agua(0.0)
	_bot.visible = false







func _pon_agua(s: float) -> void:
	var r: float = Stadium.BOTTLE_R * lerpf(AGUA_R, AGUA_TUMBADA_R, s)
	var h: float = Stadium.BOTTLE_H * lerpf(AGUA_H, AGUA_TUMBADA_H, s)

	var y: float = Stadium.BOTTLE_H * lerpf(0.02, 0.06, s) + h * 0.5


	var abajo: Vector3 = _bot.basis.inverse() * Vector3.DOWN
	abajo.y = 0.0
	var lado: Vector3 = abajo.normalized() if abajo.length() > 0.001 else Vector3.ZERO
	_agua.scale = Vector3(r, h, r)
	_agua.position = Vector3(0.0, y, 0.0) + lado *(Stadium.BOTTLE_R * AGUA_R - r)


func _medio() -> float:
	return Stadium.BOTTLE_H * 1.19 * 0.5







func _apoyo(ang: float) -> float:
	return _suelo() + _medio() * absf(cos(ang)) + RADIO * absf(sin(ang))



func _suelo() -> float:
	return _hasta.y - _medio()


func _monta_juego(caja: VBoxContainer) -> void:
	_barra = Panel.new()
	_barra.custom_minimum_size = Vector2(0, 60)
	_barra.clip_contents = true
	_barra.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = CareerTheme.SURFACE_HI
	sb.border_color = CareerTheme.SURFACE_LINE
	sb.set_border_width_all(2)
	sb.set_corner_radius_all(16)
	_barra.add_theme_stylebox_override("panel", sb)
	caja.add_child(_barra)


	_lleno = _rect(CareerTheme.TEXT, 0.14)
	_franja = _rect(CareerTheme.NAV_YO, 0.6)

	_aguja = _rect(CareerTheme.TEXT, 1.0)
	_aguja.offset_left = -5.0
	_aguja.offset_right = 5.0
	_pon_aguja(0.0)
	_lanza = CareerUi.primary_cta(I18n.t("¡LANZA!"), _lanzar_yo)
	_lanza.custom_minimum_size.y = 112
	_lanza.disabled = true

	_lanza.set_meta(Entrada.PRIMERO_META, true)
	caja.add_child(_lanza)


func _rect(col: Color, alfa: float) -> ColorRect:
	var r: ColorRect = ColorRect.new()
	r.color = col
	r.modulate.a = alfa
	r.mouse_filter = Control.MOUSE_FILTER_IGNORE
	r.anchor_top = 0.0
	r.anchor_bottom = 1.0
	_barra.add_child(r)
	return r


func _pon_aguja(f: float) -> void:
	_aguja.anchor_left = f
	_aguja.anchor_right = f
	_lleno.anchor_right = f


func _mio() -> bool:
	return _turno % 2 == 0


func _juega(delta: float) -> void:
	_t += delta
	if _turno < 0:
		_sigue()
		return
	match _fase:
		"apunta":
			_tb += delta
			var f: float = BancaJuego.fuerza_en(_tb)
			_pon_aguja(f)
			if _mio():
				var tabla: Array[float] = AUTO_DAB if bool(data.get("auto_dab", false)) else AUTO_DESVIO
				var desvio: float = tabla[clampi(_turno>>1, 0, tabla.size() - 1)]
				var meta: float = _centro + desvio if _centro + desvio <= 0.97 else _centro - desvio
				if auto and _tb > 0.5 and absf(f - meta) < 0.025:
					_lanzar(f)


			elif _tb > 0.9 and (_f_prev - _f_el) *(f - _f_el) <= 0.0:
				_pon_aguja(_f_el)
				_lanzar(_f_el)
			_f_prev = f
		"vuela":
			var p: float = clampf(_t / VUELO, 0.0, 1.0)
			_bot.position = _desde.lerp(_hasta, p) + Vector3.UP *(4.0 * p *(1.0 - p) * ALTO)
			_ang = _ang_fin * p
			_bot.basis = Basis(_eje, _ang)


			_bot.position.y = maxf(_bot.position.y, _apoyo(_ang))
			if p >= 1.0:
				_aterriza()
		"asienta":
			var a: float = clampf(_t / ASIENTA, 0.0, 1.0)
			var giro: float = lerpf(_ang, _ang_fin, 1.0 -(1.0 - a) *(1.0 - a))
			_bot.basis = Basis(_eje, giro)
			_bot.position.y = _apoyo(giro) + _sobra *(1.0 - a) *(1.0 - a)
			if a >= 1.0:
				_fase = "pausa"
				_t = 0.0
		"cae":
			var q: float = clampf(_t / VUELCA, 0.0, 1.0)
			var e: float = q * q
			var giro: float = lerpf(_ang, _ang_fin, e)
			_bot.basis = Basis(_eje, giro)
			_bot.position.y = _apoyo(giro) + _sobra *(1.0 - q) *(1.0 - q)
			_pon_agua(sin(giro) * sin(giro))
			if q >= 1.0:
				_fase = "pausa"
				_t = 0.0

				sting("botella_cae", -3.0)
		"pausa":
			if _t >= PAUSA:
				_sigue()




func _sigue() -> void:
	_turno += 1
	if _turno >= BancaJuego.BOT_INTENTOS * 2:
		termina(BancaJuego.botella_resultado(_mios.count(BIEN), _suyos.count(BIEN)),
			_dab())
		return
	_fase = "apunta"
	_t = 0.0
	_tb = 0.0
	_f_prev = 0.0
	var n: AnimatedSprite3D = yo if _mio() else el
	if _turno > 0:
		_nueva_botella()
	_hacia_camara(n)
	_bot.position = _mano(n)
	_bot.basis = Basis()
	_bot.visible = true
	_centro = BancaJuego.centro_botella(azar, _centro)
	_franja.anchor_left = _centro - BancaJuego.BOT_MEDIA
	_franja.anchor_right = _centro + BancaJuego.BOT_MEDIA
	_franja.color = CareerTheme.NAV_YO if _mio() else CareerTheme.NAV_GENTE
	_lanza.disabled = not _mio()

	if _mio():
		foco_juego(_lanza)

	cara_fondo(n, "concentra")
	cara_fondo(el if _mio() else yo, "")
	if _mio():
		di(I18n.t("TU TURNO"), CareerTheme.NAV_YO)
	else:
		_f_el = BancaJuego.fuerza_rival(azar, _centro)
		di(I18n.t("SU TURNO"), CareerTheme.NAV_GENTE)





func _dab() -> String:
	if not BancaJuego.dab_ganado(_mios.count(BIEN)):
		return ""
	if Settings.celeb_desbloqueado(BancaJuego.DAB_CELEB):
		return ""
	Settings.desbloquea_celeb(BancaJuego.DAB_CELEB)
	return I18n.t("¡DAB DESBLOQUEADO! Ya sale en tus goles.")







func _hacia_camara(n: AnimatedSprite3D) -> void:
	if _lat == Vector3.ZERO:
		var hacia: Vector3 = Vector3(1.0, 0.0, 0.0)
		if cam != null and is_instance_valid(cam):
			hacia = cam.global_position - focus
			hacia.y = 0.0
			hacia = hacia.normalized() if hacia.length() > 0.01 else Vector3(1.0, 0.0, 0.0)
		_eje = hacia
		_lat = Vector3.UP.cross(hacia)
	var fila: int = _turno>>1
	var su_lado: float =(n.global_position - focus).dot(_lat)
	var lado: float = 1.0 if su_lado >= 0.0 else -1.0
	_hasta = focus + _eje *(DELANTE + FILA * fila) + _lat * lado *(CARRIL + ABRE * fila) \
			+ Vector3(0.0, _medio(), 0.0)


func _mano(n: AnimatedSprite3D) -> Vector3:
	var p: Vector3 = n.global_position
	return Vector3(p.x, MANO_Y, p.z) + _eje * 0.22


func _lanzar_yo() -> void:
	if _fase == "apunta" and _mio() and not acabado:
		_lanzar(BancaJuego.fuerza_en(_tb))


func _lanzar(f: float) -> void:
	_f = f
	_fase = "vuela"
	_t = 0.0
	_lanza.disabled = true
	var n: AnimatedSprite3D = yo if _mio() else el
	gesto(n, "lanza")

	cara_momento(n, "muerde", VUELO)
	_desde = _mano(n)


	var vueltas: float = BancaJuego.vueltas_botella(f, _centro)
	var lado: float = 1.0 if _mio() else -1.0
	_ang_fin = TAU * vueltas * lado
	sting("ui_click", -8.0)


func _aterriza() -> void:
	var bien: bool = BancaJuego.de_pie(_f, _centro)
	var n: AnimatedSprite3D = yo if _mio() else el
	var col: Color = CareerTheme.NAV_YO if _mio() else CareerTheme.NAV_GENTE
	(_mios if _mio() else _suyos).append(BIEN if bien else MAL)
	pinta_marcador(_mios, _suyos)
	_t = 0.0


	_sobra = maxf(_bot.position.y - _apoyo(_ang_fin), 0.0)
	if bien:


		_ang = _ang_fin
		_ang_fin = roundf(_ang / TAU) * TAU
		_fase = "asienta"
		di(I18n.t("¡DE PIE!"), col)
		gesto(n, "gana")

		cara_momento(n, "grito", CARA_MOMENTO_S)
		cara_momento(el if n == yo else yo, "sorpresa", CARA_MOMENTO_S)
		sting("ui_pop", -4.0)
		UiAudio.haptic(25)
	else:


		_ang = _ang_fin
		_ang_fin = roundf((_ang - PI * 0.5) / PI) * PI + PI * 0.5
		_fase = "cae"
		di(I18n.t("¡SE CAE!"), CareerTheme.TEXT)
		gesto(n, "pierde")


		cara_momento(n, "lamento", VUELCA + CARA_MOMENTO_S * 0.6)
		cara_momento(el if n == yo else yo, "reir", VUELCA + CARA_MOMENTO_S * 0.6)
		UiAudio.haptic(10)
