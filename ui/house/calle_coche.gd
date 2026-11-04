extends Control

const Carrera := preload("res://features/career/simulador.gd")
const Juego := preload("res://ui/house/simulador_game.gd")



const PUNTA_MIN: float = 12.0
const PUNTA_MAX: float = 18.0

const ESCALA: float = 0.55

const V_CHOQUE: float = 3.0


const REBOTE_S: float = 0.45
const V_ATRAS: float = 3.0
const CERCA: float = 9.0


const ROCE: float = 4.0



const ESPERA_ATRAS: float = 0.25

const PIE_ACELERA: int = 2
const PIE_FRENO: int = 3



const GIRO: float = 2.0
const RADIO: float = 3.2



const EJE: float = 0.22



const DIR_TOPE: float = 0.42
const DIR_VEL: float = 3.5


const CAM_ATRAS: Vector2 = Vector2(7.5, 11.0)
const CAM_ALTO: Vector2 = Vector2(3.0, 4.2)
const CAM_MIRA: float = 14.0
const CAM_LERP: float = 5.0
const CAM_GIRO: float = 4.0


const CAM_CERCA: float = 2.0
const CAM_SUBE: float = 0.35




const ESQUINA: Vector2 = Vector2(560, 320)
const FRENO_ALTO: float = 112.0
const HOLGURA: float = 40.0
const SEP: float = 12.0
const BORDE: float = 16.0
const PLACA_BORDE: float = 24.0
const PLACA_ALTO: float = 88.0
const LEYENDA_ALTO: float = 76.0

var calle: Ceremony = null


var calzada: Rect2 = Rect2()

var naces: Vector2 = Vector2.ZERO


var cielo: Rect2 = Rect2()

var mira: Vector3 = Vector3.ZERO
var parcela: Dictionary = {}
var mi: MeshInstance3D = null

var id: String = ""
var pos: Vector2 = Vector2.ZERO

var rumbo: float = 0.0

var v: float = 0.0
var volante: float = 0.0
var punta: float = PUNTA_MIN
var chocado: bool = false



var rodado: float = 0.0



var direccion_ruedas: float = 0.0
var radio_rueda: float = 0.4

var ruedas: Array[Node3D] = []
var _delanteras: Array[bool] = []

var _malla_entera: Mesh = null

var _cfg: Array = []
var _xf: Transform3D = Transform3D.IDENTITY
var _caja: AABB = AABB()
var _rect: Rect2 = Rect2()

var _huella: Array[Rect2] = []



var _idx: int = -1
var _atras: float = 0.0


var _cerca: Array[Rect2] = []
var _rumbo_cam: float = 0.0
var _dedos: Dictionary = {}

var _baja_dedo: int = -1
var _pulsa_izq: bool = false
var _pulsa_der: bool = false

var _acelera: bool = false
var _freno: bool = false

var _quieto: float = 0.0
var _lado: int = 0
var _rampa: float = 0.0
var _izq: Juego.BotonVolante = null
var _der: Juego.BotonVolante = null
var _acel: Pedal = null
var _fren: Pedal = null
var _placa: PanelContainer = null

var _rev: PanelContainer = null
var _kmh: Label = null
var _leyenda: PanelContainer = null





func arranca(c: Ceremony, p: Dictionary, nodo: MeshInstance3D, life: String, zona: Rect2,
		naces_en: Vector2, cam_zona: Rect2 = Rect2()) -> void:
	calle = c
	calzada = zona
	naces = naces_en
	cielo = cam_zona
	parcela = p
	mi = nodo
	id = life
	_cfg = Carrera.PERFILES.get(life, Carrera.PERFILES["coche"])
	punta = punta_de(life)
	_xf = mi.transform
	_caja = mi.mesh.get_aabb()
	rumbo = mi.rotation.y


	_rumbo_cam = PI * 0.5
	pos = Vector2(mi.position.x, mi.position.z)


	var est: Array = parcela.get("estorbos", []) as Array
	var hu: Array = parcela.get("huellas", []) as Array
	_idx = mi.get_index()
	if _idx >= est.size():
		_idx = -1
	_rect = est[_idx] if _idx >= 0 else _estorbo_mio()
	_huella.assign(hu[_idx] if _idx >= 0 and _idx < hu.size() else [_rect])
	var bloq: Array = calle.get("_bloqueos") as Array
	for r in _huella:
		bloq.erase(r)
	if _idx >= 0:
		est.remove_at(_idx)
		if _idx < hu.size():
			hu.remove_at(_idx)
	_filtra()
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_monta_hud()





func para() -> void:
	var xf: Transform3D = mi.transform if mi != null and is_instance_valid(mi) else _xf
	_quita_ruedas()
	var w: AABB = xf * _caja
	_rect = Rect2(w.position.x, w.position.z, w.size.x, w.size.z)
	_huella = huella(xf, _caja)
	(calle.get("_bloqueos") as Array).append_array(_huella)
	var est: Array = parcela.get("estorbos", []) as Array
	var i: int = clampi(_idx, 0, est.size()) if _idx >= 0 else est.size()
	est.insert(i, _rect)
	if not parcela.has("huellas"):
		parcela.huellas = []
	var hu: Array = parcela.huellas
	hu.insert(mini(i, hu.size()), _huella.duplicate())
	queue_free()








func pon_ruedas(despiece: Dictionary) -> void:
	if mi == null or despiece.is_empty() or not ruedas.is_empty():
		return
	_malla_entera = mi.mesh
	mi.mesh = despiece.caja
	radio_rueda = float(despiece.radio)
	for r: Dictionary in despiece.ruedas:
		var mangueta: Node3D = Node3D.new()
		mangueta.name = "Mangueta"
		mangueta.position = r.centro
		var rueda: MeshInstance3D = MeshInstance3D.new()
		rueda.name = "Rueda"
		rueda.mesh = r.malla
		rueda.cast_shadow = mi.cast_shadow
		mangueta.add_child(rueda)
		mi.add_child(mangueta)
		ruedas.append(mangueta)
		_delanteras.append(bool(r.delantera))
	_pinta_ruedas()



func _quita_ruedas() -> void:
	for m in ruedas:
		if is_instance_valid(m):
			m.free()
	ruedas.clear()
	_delanteras.clear()
	if _malla_entera != null and mi != null and is_instance_valid(mi):
		mi.mesh = _malla_entera
	_malla_entera = null





func _pinta_ruedas() -> void:
	var giro: float = - fmod(rodado / radio_rueda, TAU)
	for k in ruedas.size():
		ruedas[k].rotation = Vector3(0.0, direccion_ruedas if _delanteras[k] else 0.0, 0.0)
		(ruedas[k].get_child(0) as Node3D).rotation = Vector3(0.0, 0.0, giro)







static func huella(xf: Transform3D, caja: AABB) -> Array[Rect2]:
	var r: float = xf.basis.get_euler().y
	var w: AABB = xf * caja
	if absf(sin(2.0 * r)) < sin(deg_to_rad(2.0)):
		return [Rect2(w.position.x, w.position.z, w.size.x, w.size.z)]
	var out: Array[Rect2] = []
	var n: int = maxi(2, ceili(caja.size.x /(caja.size.z * 0.5)))
	for k in n:
		var trozo: AABB = AABB(caja.position + Vector3(caja.size.x * float(k) / float(n), 0.0, 0.0),
			Vector3(caja.size.x / float(n), caja.size.y, caja.size.z))
		var t: AABB = xf * trozo
		out.append(Rect2(t.position.x, t.position.z, t.size.x, t.size.z))
	return out





static func cabe_en(xf: Transform3D, caja: AABB, zona: Rect2, rects: Array) -> bool:
	var r: float = xf.basis.get_euler().y
	return _cabe(Vector2(xf.origin.x, xf.origin.z), r, caja, zona, rects)



static func punta_de(life: String) -> float:
	var cfg: Array = Carrera.PERFILES.get(life, Carrera.PERFILES["coche"])
	var lento: float = INF
	var rapido: float = 0.0
	for k in Carrera.PERFILES:
		lento = minf(lento, float(Carrera.PERFILES[k][0]))
		rapido = maxf(rapido, float(Carrera.PERFILES[k][0]))
	return lerpf(PUNTA_MIN, PUNTA_MAX, inverse_lerp(lento, rapido, float(cfg[0])))




func _estorbo_mio() -> Rect2:
	var w: AABB = mi.transform * _caja
	var r: Rect2 = Rect2(w.position.x, w.position.z, w.size.x, w.size.z)
	var mejor: Rect2 = r
	var dmin: float = 0.5
	for e in parcela.get("estorbos", []):
		var d: float =(e as Rect2).get_center().distance_to(r.get_center())
		if d < dmin:
			dmin = d
			mejor = e
	return mejor


func _morro(r: float) -> Vector2:
	return Vector2(cos(r), - sin(r))






func tick(delta: float) -> void:
	var m: Dictionary = mandos(delta)
	_filtra()
	var restante: float = minf(delta, 0.1)
	while restante > 1e-05:
		var paso: float = minf(restante, 1.0 / 120.0)
		restante -= paso
		avanza(paso, float(m.direccion), bool(m.acelera), bool(m.freno))
	mi.position = Vector3(pos.x, _xf.origin.y, pos.y)
	mi.rotation = Vector3(0.0, rumbo, 0.0)
	_pinta_ruedas()
	_pinta()


func _filtra() -> void:
	_cerca.clear()
	var zona: Rect2 = Rect2(pos - Vector2(CERCA, CERCA), Vector2(CERCA, CERCA) * 2.0)
	for b in calle.get("_bloqueos"):
		if zona.intersects(b):
			_cerca.append(b)








func avanza(dt: float, direccion: float, acelera: bool, frenar: bool) -> void:
	var eje0: Vector2 = pos + _al_eje(rumbo)
	var r0: float = rumbo
	_mueve(dt, direccion, acelera, frenar)
	rodado +=(pos + _al_eje(rumbo) - eje0).dot(_morro(r0 + angle_difference(r0, rumbo) * 0.5))




	var sentido: float = -1.0 if v < 0.0 else 1.0
	direccion_ruedas = move_toward(direccion_ruedas, - volante * DIR_TOPE * sentido, DIR_VEL * dt)



func _mueve(dt: float, direccion: float, acelera: bool, frenar: bool) -> void:
	var objetivo: float = 0.0
	var cambio: float = ROCE * ESCALA
	if not frenar or v > 0.0:
		_quieto = 0.0
	if _atras > 0.0:
		_atras -= dt
		objetivo = - V_ATRAS
		cambio = float(_cfg[1]) * ESCALA
	elif frenar:
		if v > 0.0:
			cambio = float(_cfg[4]) * ESCALA
		else:
			_quieto += dt
			if v < 0.0 or _quieto >= ESPERA_ATRAS:
				objetivo = - V_ATRAS
				cambio = float(_cfg[1]) * ESCALA
	elif acelera:
		objetivo = punta
		cambio = float(_cfg[4] if v < 0.0 else _cfg[1]) * ESCALA
	v = move_toward(v, objetivo, cambio * dt)
	volante = lerpf(volante, clampf(direccion, -1.0, 1.0), 1.0 - exp(- Carrera.RESPUESTA * dt))
	var giro: float = - volante * giro_max(absf(v)) * dt
	var nuevo: float = rumbo + giro

	var quiere: Vector2 = pos + _al_eje(rumbo) + _morro(rumbo + giro * 0.5) * v * dt - _al_eje(nuevo)
	chocado = false
	if libre_en(quiere, nuevo):
		pos = quiere
		rumbo = nuevo
		return
	chocado = true



	var minimo: float = absf(v) * dt * 0.25
	for prueba in [[Vector2(quiere.x, pos.y), nuevo], [Vector2(pos.x, quiere.y), nuevo],
			[Vector2(quiere.x, pos.y), rumbo], [Vector2(pos.x, quiere.y), rumbo]]:
		if (prueba[0] as Vector2).distance_to(pos) >= minimo and libre_en(prueba[0], prueba[1]):
			pos = prueba[0]
			rumbo = prueba[1]
			v = clampf(v, - V_CHOQUE, V_CHOQUE)
			return


	if v > 0.0:
		v = 0.0
		_atras = REBOTE_S
	else:
		v = 0.0
		_atras = 0.0



func _al_eje(r: float) -> Vector2:
	var cl: Vector3 = _caja.get_center()
	var x: float = cl.x - _caja.size.x *(0.5 - EJE)
	return _morro(r) * x + Vector2(sin(r), cos(r)) * cl.z



func giro_max(s: float) -> float:
	var tope: float = GIRO * float(_cfg[2]) / 6.6 / float(_cfg[5])
	return minf(s /(RADIO * 6.6 / float(_cfg[2])), tope)




func libre_en(p: Vector2, r: float) -> bool:
	return _cabe(p, r, _caja, calzada, _cerca)



static func _cabe(p: Vector2, r: float, caja: AABB, zona: Rect2, rects: Array) -> bool:
	var u: Vector2 = Vector2(cos(r), - sin(r))
	var n: Vector2 = Vector2(sin(r), cos(r))
	var centro_local: Vector3 = caja.get_center()
	var c: Vector2 = p + u * centro_local.x + n * centro_local.z
	var h: Vector2 = Vector2(caja.size.x, caja.size.z) * 0.5
	var ex: float = absf(u.x) * h.x + absf(n.x) * h.y
	var ez: float = absf(u.y) * h.x + absf(n.y) * h.y
	if c.x - ex < zona.position.x or c.x + ex > zona.end.x \
			or c.y - ez < zona.position.y or c.y + ez > zona.end.y:
		return false
	for b in rects:
		var rc: Vector2 =(b as Rect2).get_center()
		var rh: Vector2 =(b as Rect2).size * 0.5
		var d: Vector2 = rc - c
		if absf(d.x) > ex + rh.x or absf(d.y) > ez + rh.y:
			continue
		if absf(d.dot(u)) > h.x + absf(u.x) * rh.x + absf(u.y) * rh.y:
			continue
		if absf(d.dot(n)) > h.y + absf(n.x) * rh.x + absf(n.y) * rh.y:
			continue
		return false
	return true



func esquinas() -> PackedVector2Array:
	var u: Vector2 = _morro(rumbo)
	var n: Vector2 = Vector2(sin(rumbo), cos(rumbo))
	var cl: Vector3 = _caja.get_center()
	var c: Vector2 = pos + u * cl.x + n * cl.z
	var h: Vector2 = Vector2(_caja.size.x, _caja.size.z) * 0.5
	return PackedVector2Array([c + u * h.x + n * h.y, c + u * h.x - n * h.y,
		c - u * h.x - n * h.y, c - u * h.x + n * h.y])





func donde_bajas() -> Vector2:
	var u: Vector2 = _morro(rumbo)
	var n: Vector2 = Vector2(sin(rumbo), cos(rumbo))
	var h: Vector2 = Vector2(_caja.size.x, _caja.size.z) * 0.5
	var cl: Vector3 = _caja.get_center()
	var c: Vector2 = pos + u * cl.x + n * cl.z
	for d in [- n *(h.y + 0.7), n *(h.y + 0.7), - u *(h.x + 0.7), u *(h.x + 0.7)]:
		var q: Vector2 = c + d
		if bool(calle.call("libre", q)):
			return q



	for ring in range(1, 10):
		var o: float = 0.1 + 0.4 * float(ring)
		for k in 16:
			var a: float = TAU * float(k) / 16.0
			var ca: float = cos(a)
			var sa: float = sin(a)
			var s: float = minf(h.x / maxf(absf(ca), 0.001), h.y / maxf(absf(sa), 0.001))
			var q: Vector2 = c +(u * ca + n * sa) *(s + o)
			if bool(calle.call("libre", q)):
				return q


	var t: float = 0.0
	while t < c.distance_to(naces):
		t += 0.5
		var q: Vector2 = c.move_toward(naces, t)
		if bool(calle.call("libre", q)):
			return q
	return naces







func mandos(dt: float = 0.0) -> Dictionary:
	_pulsa_izq = Input.is_physical_key_pressed(KEY_LEFT) or Input.is_physical_key_pressed(KEY_A) \
			or _dedos.values().has(-1)
	_pulsa_der = Input.is_physical_key_pressed(KEY_RIGHT) or Input.is_physical_key_pressed(KEY_D) \
			or _dedos.values().has(1)
	_acelera = Input.is_physical_key_pressed(KEY_UP) or Input.is_physical_key_pressed(KEY_W) \
			or _dedos.values().has(PIE_ACELERA)
	_freno = Input.is_physical_key_pressed(KEY_DOWN) or Input.is_physical_key_pressed(KEY_S) \
			or _dedos.values().has(PIE_FRENO)
	if Entrada.hay_mando():
		var ex: float = Entrada.eje(true).x
		_pulsa_izq = _pulsa_izq or ex < - Juego.ZONA_VOLANTE or Input.is_action_pressed("ui_left")
		_pulsa_der = _pulsa_der or ex > Juego.ZONA_VOLANTE or Input.is_action_pressed("ui_right")
		_acelera = _acelera or Input.is_action_pressed("fl_avanza") \
				or Input.get_joy_axis(Entrada.dispositivo, JOY_AXIS_TRIGGER_RIGHT) > Juego.ZONA_GATILLO
		_freno = _freno or Input.is_action_pressed("fl_toque") \
				or Input.get_joy_axis(Entrada.dispositivo, JOY_AXIS_TRIGGER_LEFT) > Juego.ZONA_GATILLO
	var ambos: bool = _pulsa_izq and _pulsa_der
	var lado: int = _lado if ambos else (-1 if _pulsa_izq else (1 if _pulsa_der else 0))
	if lado != _lado:
		_lado = lado
		_rampa = Juego.RAMPA_BASE if lado != 0 else 0.0
	elif lado != 0:
		_rampa = minf(1.0, _rampa + Juego.RAMPA_SUBE * dt)
	return {"direccion": float(_lado) * _rampa, "acelera": _acelera and not _freno, "freno": _freno}





func _input(ev: InputEvent) -> void:
	if ev is InputEventJoypadButton and (ev.is_action("fl_avanza") or ev.is_action("fl_toque")):
		get_viewport().set_input_as_handled()
		return
	if ev is InputEventScreenTouch:
		if ev.pressed:
			var lado: int = boton_de(ev.position)
			if lado == 0:



				if not _dedos.is_empty() and _en_bajar(ev.position):
					_baja_dedo = ev.index
					get_viewport().set_input_as_handled()
				return
			_dedos[ev.index] = lado
		elif ev.index == _baja_dedo:
			_baja_dedo = -1
			if _en_bajar(ev.position):
				(calle.get("_bajar_btn") as Object).emit_signal.call_deferred("pressed")
			get_viewport().set_input_as_handled()
			return
		elif _dedos.has(ev.index):
			_dedos.erase(ev.index)
		else:
			return
		get_viewport().set_input_as_handled()
	elif ev is InputEventScreenDrag and _dedos.has(ev.index):


		var lado: int = boton_de(ev.position)
		if lado != 0 and (absi(lado) == 1) ==(absi(int(_dedos[ev.index])) == 1):
			_dedos[ev.index] = lado
		get_viewport().set_input_as_handled()


func _en_bajar(en: Vector2) -> bool:
	var b: Control = calle.get("_bajar_btn") as Control
	return b != null and b.is_visible_in_tree() and b.get_global_rect().has_point(en)





func boton_de(en: Vector2) -> int:
	if _izq == null or not _izq.is_visible_in_tree():
		return 0
	var mejor: int = 0
	var dmin: float = HOLGURA + 0.01
	for par in [[_izq, -1], [_der, 1], [_acel, PIE_ACELERA], [_fren, PIE_FRENO]]:
		var r: Rect2 =(par[0] as Control).get_global_rect()
		var d: float = en.distance_to(en.clamp(r.position, r.end))
		if d < dmin:
			dmin = d
			mejor = int(par[1])
	return mejor






func camara(cam: Camera3D, delta: float, de_golpe: bool = false) -> void:
	var tumbado: bool = UiKit.es_horizontal()
	var atras: float = CAM_ATRAS.x if tumbado else CAM_ATRAS.y
	var alto: float = CAM_ALTO.x if tumbado else CAM_ALTO.y
	var k: float = 1.0 if de_golpe else 1.0 - exp(- CAM_LERP * delta)
	_rumbo_cam = rumbo if de_golpe else lerp_angle(_rumbo_cam, rumbo,
		1.0 - exp(- CAM_GIRO * delta))
	var u: Vector2 = _morro(_rumbo_cam)



	var a: float = atras
	if cielo.has_area():
		if u.y > 0.01:
			a = minf(a,(pos.y - cielo.position.y) / u.y)
		elif u.y < -0.01:
			a = minf(a,(cielo.end.y - pos.y) / - u.y)
		if u.x > 0.01:
			a = minf(a,(pos.x - cielo.position.x) / u.x)
		elif u.x < -0.01:
			a = minf(a,(cielo.end.x - pos.x) / - u.x)
		a = maxf(a, CAM_CERCA)
	var meta: Vector3 = Vector3(pos.x - u.x * a, alto +(atras - a) * CAM_SUBE, pos.y - u.y * a)
	if cielo.has_area():
		meta.x = clampf(meta.x, cielo.position.x, cielo.end.x)
		meta.z = clampf(meta.z, cielo.position.y, cielo.end.y)
	cam.position = meta if de_golpe else cam.position.lerp(meta, k)
	mira = Vector3(pos.x + u.x * CAM_MIRA, 0.8, pos.y + u.y * CAM_MIRA)
	cam.look_at(mira)




func _monta_hud() -> void:
	_izq = Juego.BotonVolante.new()
	_izq.lado = -1
	_der = Juego.BotonVolante.new()
	_acel = Pedal.new()
	_acel.texto = I18n.t("ACELERA")
	_fren = Pedal.new()
	_fren.texto = I18n.t("FRENO")
	_fren.freno = true
	for pieza in [_izq, _der, _fren, _acel]:
		(pieza as Control).mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(pieza)

	_placa = _placa_de(PLACA_BORDE)
	var fila: HBoxContainer = _placa.get_child(0) as HBoxContainer
	fila.add_theme_constant_override("separation", 12)
	fila.add_child(_icono("velocidad", CareerTheme.TEXT_DIM))
	_rev = PanelContainer.new()
	var sb_r: StyleBoxFlat = CareerTheme.plate()
	sb_r.bg_color = CareerTheme.accent()
	sb_r.set_border_width_all(0)
	sb_r.set_corner_radius_all(3)
	sb_r.set_content_margin_all(8)
	_rev.add_theme_stylebox_override("panel", sb_r)
	_rev.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_rev.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	_rev.visible = false
	_rev.add_child(_rotulo(I18n.t("R"), 24, CareerTheme.INK_LIGHT))
	fila.add_child(_rev)
	_kmh = CareerUi.plain(CareerTheme.T_HUD_ROTULO, CareerTheme.TEXT)
	_kmh.text = "0"
	_kmh.clip_text = true
	_kmh.custom_minimum_size.x = 60
	_kmh.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	fila.add_child(_kmh)
	fila.add_child(_rotulo(I18n.t("KM/H"), CareerTheme.T_DIM, CareerTheme.TEXT_DIM))
	_placa.custom_minimum_size.y = PLACA_ALTO

	_leyenda = _placa_de(28.0)
	var ley: HBoxContainer = _leyenda.get_child(0) as HBoxContainer
	ley.add_theme_constant_override("separation", 14)
	ley.add_child(_icono("stick", CareerTheme.TEXT))
	ley.add_child(_rotulo(I18n.t("GIRAR"), CareerTheme.T_BODY, CareerTheme.TEXT))
	for par in [["rt", "ACELERA"], ["lt", "FRENO"]]:
		var aire: Control = Control.new()
		aire.custom_minimum_size.x = 14
		aire.mouse_filter = Control.MOUSE_FILTER_IGNORE
		ley.add_child(aire)
		var gat: Glifos = Glifos.chip(par[0], "", 40)
		gat.mouse_filter = Control.MOUSE_FILTER_IGNORE
		gat.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ley.add_child(gat)
		ley.add_child(_rotulo(I18n.t(par[1]), CareerTheme.T_BODY, CareerTheme.TEXT))
	_leyenda.custom_minimum_size.y = LEYENDA_ALTO
	CareerUi.normalize_caps(self)
	get_viewport().size_changed.connect(_maqueta)
	Entrada.modo_cambiado.connect(_al_cambiar_modo)
	_maqueta()


func _placa_de(borde: float) -> PanelContainer:
	var placa: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = CareerTheme.plate()
	sb.content_margin_left = borde
	sb.content_margin_right = borde
	sb.content_margin_top = 0
	sb.content_margin_bottom = 0
	placa.add_theme_stylebox_override("panel", sb)
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var fila: HBoxContainer = HBoxContainer.new()
	fila.alignment = BoxContainer.ALIGNMENT_CENTER
	fila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_child(fila)
	add_child(placa)
	return placa


func _icono(tipo: String, color: Color) -> MenuIcon:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(34, 34)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, color)
	return ic


func _rotulo(texto: String, tam: int, color: Color) -> Label:
	var l: Label = CareerUi.plain(tam, color)
	l.text = texto
	l.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l


func _al_cambiar_modo(_modo: int) -> void:
	_dedos.clear()
	_maqueta()



func _maqueta() -> void:
	if not is_inside_tree():
		return
	var vp: Vector2 = get_viewport_rect().size
	var lado: float = UiKit.side_safe_inset(get_viewport())
	var pie: float = BORDE + UiKit.bottom_safe_inset(get_viewport())
	var arriba: float = UiKit.top_safe_inset(get_viewport())
	var con_mando: bool = Entrada.hay_mando()
	for pieza in [_izq, _der, _fren, _acel]:
		(pieza as Control).visible = not con_mando
	_leyenda.visible = con_mando
	var tumbado: bool = UiKit.es_horizontal()
	for p in [_acel, _fren]:
		(p as Pedal).letra = 30 if tumbado else 24
		(p as Pedal).dibujo = 64.0 if tumbado else 48.0
	if tumbado:

		var y: float = vp.y - pie - ESQUINA.y
		var mitad: float = floorf((ESQUINA.x - SEP) * 0.5)
		_izq.position = Vector2(BORDE + lado, y)
		_der.position = Vector2(BORDE + lado + ESQUINA.x - mitad, y)
		_izq.size = Vector2(mitad, ESQUINA.y)
		_der.size = Vector2(mitad, ESQUINA.y)
		var x: float = vp.x - BORDE - lado - ESQUINA.x
		_acel.position = Vector2(x, y)
		_acel.size = Vector2(ESQUINA.x, ESQUINA.y - SEP - FRENO_ALTO)
		_fren.position = Vector2(x, vp.y - pie - FRENO_ALTO)
		_fren.size = Vector2(ESQUINA.x, FRENO_ALTO)
	else:
		var alto: float = Juego.ALTO_MANDO
		var w: float = floorf((vp.x - 2.0 *(BORDE + lado) - 3.0 * SEP) * 0.25)
		var y: float = vp.y - pie - alto
		var k: int = 0
		for pieza in [_izq, _der, _fren, _acel]:
			(pieza as Control).position = Vector2(BORDE + lado + float(k) *(w + SEP), y)
			(pieza as Control).size = Vector2(w, alto)
			k += 1
	for p in [_acel, _fren]:
		(p as Pedal).queue_redraw()
	_placa.size = _placa.get_combined_minimum_size()
	_placa.position = Vector2(vp.x - PLACA_BORDE - lado - _placa.size.x, PLACA_BORDE + arriba)
	_leyenda.size = _leyenda.get_combined_minimum_size()
	_leyenda.position = Vector2((vp.x - _leyenda.size.x) * 0.5, vp.y - pie - _leyenda.size.y)




func _pinta() -> void:
	_izq.pulsado = _pulsa_izq
	_der.pulsado = _pulsa_der
	_izq.llenado = clampf(- volante, 0.0, 1.0)
	_der.llenado = clampf(volante, 0.0, 1.0)
	_acel.pulsado = _acelera
	_fren.pulsado = _freno
	for b in [_izq, _der, _acel, _fren]:
		(b as Control).queue_redraw()
	var kmh: String = str(roundi(absf(v) * 3.6))
	var atras: bool = v < -0.05
	if _kmh.text != kmh or _rev.visible != atras:
		_kmh.text = kmh
		_rev.visible = atras
		_placa.size = _placa.get_combined_minimum_size()
		_placa.position.x = get_viewport_rect().size.x - PLACA_BORDE \
				- UiKit.side_safe_inset(get_viewport()) - _placa.size.x







class Pedal extends Control:
	var texto: String = ""
	var freno: bool = false
	var pulsado: bool = false
	var letra: int = 30
	var dibujo: float = 64.0
	func _draw() -> void:
		var color: Color = CareerTheme.DANGER if freno else CareerTheme.accent()
		var placa: StyleBoxFlat = CareerTheme.plate()
		placa.set_corner_radius_all(18)
		if pulsado:
			placa.border_color = color
			placa.set_border_width_all(4)
		draw_style_box(placa, Rect2(Vector2.ZERO, size))
		if pulsado:
			var tinte: Color = color
			tinte.a = 0.3
			draw_rect(Rect2(Vector2(6.0, 6.0), size - Vector2(12.0, 12.0)), tinte)
		var tinta: Color = CareerTheme.INK_LIGHT if pulsado else CareerTheme.TEXT_DIM
		var fuente: Font = get_theme_font("font", "Label")
		var k: float = dibujo / 56.0
		var ancho_dibujo: float = 40.0 * k + 18.0
		var hueco: float = size.x - 32.0
		var cuerpo: int = letra
		var ancho: float = fuente.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x
		while cuerpo > 14 and ancho_dibujo + ancho > hueco:
			cuerpo -= 2
			ancho = fuente.get_string_size(texto, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x
		var con_dibujo: bool = ancho_dibujo + ancho <= hueco
		var x: float =(size.x - ancho -(ancho_dibujo if con_dibujo else 0.0)) * 0.5
		if con_dibujo:
			var o: Vector2 = Vector2(x,(size.y - dibujo) * 0.5)
			var pedal: StyleBoxFlat = CareerTheme.plate()
			pedal.draw_center = false
			pedal.border_color = tinta
			pedal.set_border_width_all(roundi(5.0 * k))
			pedal.set_corner_radius_all(roundi(9.5 * k))
			pedal.shadow_size = 0
			draw_style_box(pedal, Rect2(o + Vector2(0.5, 0.5) * k, Vector2(39.0, 55.0) * k))
			for y in [18.0, 28.0, 38.0]:
				draw_line(o + Vector2(11.0, y) * k, o + Vector2(29.0, y) * k, tinta, 4.0 * k)
			x += ancho_dibujo
		var base: float =(size.y + fuente.get_ascent(cuerpo) - fuente.get_descent(cuerpo)) * 0.5
		draw_string(fuente, Vector2(x, base), texto, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo, tinta)
