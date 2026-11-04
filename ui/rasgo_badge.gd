class_name RasgoBadge
extends Control

























const SPRITE_PX: float = 40.0


const ARO: float = 6.0
const DIAM: float = SPRITE_PX + ARO * 2.0


const MUESTRAS: int = 48
const FPS_REPINTADO: float = 20.0




const PREFIJO_PAREJA: String = "pareja_"

var _id: String = ""
var _col: Color = CareerTheme.TEXT_DIM
var _bueno: bool = true
var _p: Dictionary = {}
var _t: float = 0.0
var _fase: float = 0.0
var _acum: float = 0.0


var _recortes: Array[Control] = []
var _recortes_ok: bool = false
var _glifo: TextureRect = null
var _tw_resalte: Tween = null

var _velada: bool = false
var _velo: Label = null







func _ready() -> void:
	_fase = randf() * TAU


	_acum = randf() / FPS_REPINTADO
	set_process(OvrBadge.ANIMADA)


func _notification(what: int) -> void:
	if what == NOTIFICATION_ENTER_TREE:
		_recortes_ok = false


func _process(delta: float) -> void:
	if not is_visible_in_tree():
		return
	_t += delta
	_acum += delta
	if _acum < 1.0 / FPS_REPINTADO:
		return
	_acum = 0.0


	if not _recortes_ok:
		_recortes = OvrBadge.recortes_de(self)
		_recortes_ok = true
	if not OvrBadge.a_la_vista(self, _recortes):
		return
	queue_redraw()


func setup(id: String, d: float = DIAM, velada: bool = false) -> void:
	_id = id
	_velada = velada



	if id.begins_with(PREFIJO_PAREJA):
		_bueno = Pareja.es_buena(id.substr(PREFIJO_PAREJA.length()))
	else:
		_bueno = bool(Coach.rasgo_of(id).get("bueno", true))
	_col = CareerTheme.TEXT_DIM if velada else CareerTheme.RASGO.get(id, CareerTheme.TEXT_DIM)


	_p = {"amp": 0.0 if velada else (0.92 if _bueno else 0.72)}


	custom_minimum_size = Vector2(d, d)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	if _glifo == null:
		_glifo = TextureRect.new()
		_glifo.name = "Glifo"
		_glifo.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		_glifo.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		_glifo.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
		_glifo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_glifo.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(_glifo)
	_glifo.texture = load("res://assets/sprites/ui/rasgo_%s.png" % id)
	_glifo.modulate = _col
	_glifo.visible = not velada
	if velada and _velo == null:
		_velo = CareerUi.plain(maxi(12, int(roundf(d * 0.42))), CareerTheme.TEXT_DIM)
		_velo.text = "?"
		_velo.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		_velo.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
		_velo.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_velo.set_anchors_preset(Control.PRESET_FULL_RECT)
		add_child(_velo)
	if _velo != null:
		_velo.visible = velada


	var inset: float = d * ARO / DIAM
	_glifo.offset_left = inset
	_glifo.offset_top = inset
	_glifo.offset_right = - inset
	_glifo.offset_bottom = - inset
	queue_redraw()


func rasgo() -> String:
	return _id


func _circulo(c: Vector2, r: float, n: int) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n:
		var th: float = - PI * 0.5 + TAU * float(i) / float(n)
		pts.append(c + Vector2(cos(th), sin(th)) * r)
	return pts




static func _foco(th: float, centro: float, ancho: float) -> float:
	var d: float = angle_difference(th, centro)
	return exp(-(d * d) /(2.0 * ancho * ancho))




static func _ruido(n: float) -> float:
	return fmod(absf(sin(n * 12.9898 + 78.233) * 43758.5453), 1.0)







static func luz_rasgo(id: String, th: float, t: float, fase: float) -> float:
	var arriba: float = - PI * 0.5
	match id:
		"balon_parado":


			var c: float = fmod(t * 0.7 + fase / TAU, 1.0)
			var avance: float = 0.0 if c < 0.62 else pow((c - 0.62) / 0.38, 0.6)
			return _foco(th, arriba + avance * TAU, 0.45) *(0.75 + 0.25 *(1.0 - avance))
		"corners":


			var ang: float = arriba + PI * 0.25 + sin(t * 2.2 + fase) * PI * 0.22
			return _foco(th, ang, 0.35)
		"contras":


			var d: float = cos(th -(t * 3.2 + fase))
			return pow(maxf(d, 0.0), 3.0) + 0.2 * pow(maxf(- d, 0.0), 4.0)
		"centros":


			var ang: float = arriba + sin(t * 1.6 + fase) * PI * 0.55
			return _foco(th, ang, 0.4)
		"mano_a_mano":


			var a: float = _foco(th, t * 1.4 + fase, 0.4)
			var b: float = _foco(th, -(t * 1.4 + fase) + PI, 0.4)
			return minf(a + b, 1.0)
		"tiro_lejano":


			var c: float = fmod(t * 0.9 + fase / TAU, 1.0)
			if c < 0.55:
				var ang: float = PI * 0.5 -(c / 0.55) * PI
				return _foco(th, ang, 0.3)
			var fog: float = pow(1.0 -(c - 0.55) / 0.45, 2.0)
			return fog * _foco(th, arriba, 1.1)
		"cerrojo":


			var c: float = fmod(t * 0.55 + fase / TAU, 1.0)
			var lleno: float = minf(c / 0.8, 1.0) * TAU
			var pos: float = fposmod(th - arriba, TAU)
			var borde: float = clampf((lleno - pos) / 0.5, 0.0, 1.0)
			return borde *(0.55 + 0.45 * _foco(th, arriba + lleno, 0.35)) *(1.0 if c < 0.9 else 0.0)
		"fergie":


			return _foco(th, arriba + t * 1.05 + fase, 0.28) + 0.12
		"loco":


			var v: float = 0.5 + 0.5 * sin(t * 7.1 + fase) * sin(t * 3.7 + fase * 0.5) * sin(t * 11.3)
			return pow(v, 1.4) *(0.6 + 0.4 * maxf(sin(th), 0.0))
		"calienta_banquillos":

			return pow(0.5 + 0.5 * sin(t * 0.55 + fase), 2.2) * 0.75
		"griton":

			var c: float = fmod(t * 1.3 + fase / TAU, 1.0)
			var fog: float = 0.0
			if c < 0.08 or (c > 0.16 and c < 0.24):
				fog = 1.0
			return fog *(0.7 + 0.3 * maxf(- sin(th), 0.0))
		"carrusel":

			return pow(absf(cos(th -(t * 2.6 + fase))), 6.0)
		"avaro":


			var n: float = floor(t * 1.4 + fase)
			var edad: float = fmod(t * 1.4 + fase, 1.0)
			var ang: float = _ruido(n) * TAU
			return _foco(th, ang, 0.22) * maxf(1.0 - edad * 2.5, 0.0)
		"supersticioso":



			return 0.35 * _foco(th, t * 0.5 + fase, 0.6)
		"penales":



			var c: float = fmod(t * 0.8 + fase / TAU, 1.0)
			var s: float = pow(minf(c / 0.7, 1.0), 2.2)
			return _foco(th, PI * 0.5 + s * PI, 0.3) *(1.0 if c < 0.92 else 0.0)
		"cantera":


			var c: float = fmod(t * 0.6 + fase / TAU, 1.0)
			var altura: float = minf(c / 0.75, 1.0) * PI
			var desde_abajo: float = absf(angle_difference(th, PI * 0.5))
			var borde: float = clampf((altura - desde_abajo) / 0.45, 0.0, 1.0)
			return borde *(0.5 + 0.5 * _foco(desde_abajo, altura, 0.35)) *(1.0 if c < 0.9 else 0.0)
		"posesion":


			return 0.5 + 0.5 * cos(th -(t * 0.9 + fase))
		"tarjetero":


			var c: float = fmod(t * 0.8 + fase / TAU, 1.0)
			return (1.0 if c < 0.07 else 0.0) + 0.06
		"visitante_flojo":


			var c: float = fmod(t * 0.5 + fase / TAU, 1.0)
			var ancho: float = lerpf(0.9, 0.12, c)
			return _foco(th, PI * 0.5, ancho) * 0.8
		"favoritismo":


			return _foco(th, arriba + PI * 0.3, 0.32) *(0.55 + 0.45 * sin(t * 2.4 + fase))
		"arranque":


			var c: float = fmod(t * 0.7 + fase / TAU, 1.0)
			var vueltas: float = minf(c / 0.3, 1.0) * TAU * 2.0
			return _foco(th, arriba + vueltas, 0.35) *(1.0 if c < 0.3 else 0.6)
		"claras":


			var c: float = fmod(t * 0.6 + fase / TAU, 1.0)
			var ancho: float = lerpf(0.9, 0.12, pow(c, 0.7))
			var tiro: float = 1.0 if c > 0.9 else 0.0
			return _foco(th, arriba, ancho) *(0.7 + 0.3 * tiro) + tiro * 0.3
		"derbis":


			var s: float = 0.5 + 0.5 * sin(t * 2.0 + fase)
			var a: float = _foco(th, arriba - PI * 0.5 *(1.0 - s), 0.32)
			var b: float = _foco(th, arriba + PI * 0.5 *(1.0 - s), 0.32)
			return minf(a + b, 1.0) *(0.7 + 0.3 * pow(s, 6.0))
		"fisio":


			var c: float = fmod(t * 0.9 + fase / TAU, 1.0)
			var lub: float = pow(maxf(1.0 - absf(c - 0.1) / 0.09, 0.0), 1.5)
			var dub: float = pow(maxf(1.0 - absf(c - 0.28) / 0.09, 0.0), 1.5) * 0.7
			return (lub + dub) *(0.7 + 0.3 * maxf(sin(th), 0.0)) + 0.1
		"ida_y_vuelta":



			return _foco(th, arriba + sin(t * 2.2 + fase) * PI, 0.4)
		"se_despierta_tarde":



			var c: float = fmod(t * 0.45 + fase / TAU, 1.0)
			if c < 0.5:
				return 0.04
			return pow((c - 0.5) / 0.5, 1.6) *(0.75 + 0.25 * maxf(- sin(th), 0.0))
		"once_de_hierro":


			return 0.5 + 0.06 * sin(t * 0.35 + fase)
		"rol_capitan":


			return _foco(th, arriba + t * 0.9 + fase, 0.6)
		"rol_penal":


			var c: float = fmod(t * 0.6 + fase / TAU, 1.0)
			var golpe: float = 1.0 if c > 0.92 else 0.0
			return _foco(th, arriba, 0.35) *(0.6 + 0.4 * sin(t * 2.0)) + golpe * 0.5
		"rol_parado":


			var c: float = fmod(t * 0.5 + fase / TAU, 1.0)
			var vuelo: float = minf(c / 0.6, 1.0)
			var ang: float = lerpf(PI * 0.75, - PI * 0.25, vuelo)
			return _foco(th, ang, 0.3) *(1.0 if c < 0.7 else 0.35)
		"culpa_tuya":


			var c: float = fmod(t * 1.1 + fase / TAU, 1.0)
			var donde: float = arriba if c < 0.5 else PI * 0.5
			var edad: float = fmod(c, 0.5) / 0.5
			return _foco(th, donde, 0.3) * maxf(1.0 - edad * 1.6, 0.0)



		"pareja_casera":


			return 0.3 + 0.55 * _foco(th, PI * 0.5, 0.95) *(0.8 + 0.2 * sin(t * 0.9 + fase))
		"pareja_companera":


			var a: float = arriba + t * 1.25 + fase
			return minf(_foco(th, a, 0.3) + _foco(th, a + 0.95, 0.3), 1.0)
		"pareja_independiente":


			var ang: float = fase + sin(t * 0.63) * 2.2 + sin(t * 0.29 + 1.3) * 2.9
			return _foco(th, ang, 0.42)
		"pareja_hincha":


			var c: float = fmod(t * 0.55 + fase / TAU, 1.0)
			if c > 0.55:
				return 0.1
			return 0.1 + 0.9 * _foco(th, arriba +(c / 0.55) * TAU, 0.55)
		"pareja_reservada":


			var c: float = fmod(t * 0.4 + fase / TAU, 1.0)
			if c < 0.55:
				return 0.06
			return 0.06 + 0.9 * pow(sin(PI *(c - 0.55) / 0.45), 2.0)
		"pareja_millonaria":



			var v: float = 0.22
			for k in 6:
				var ang: float = arriba + TAU * float(k) / 6.0
				v += _foco(th, ang, 0.16) * pow(maxf(sin(t * 2.3 + fase + float(k) * 1.7), 0.0), 8.0)
			return minf(v, 1.0)
		"pareja_celosa":


			var n: float = floor(t * 0.8 + fase)
			var edad: float = fmod(t * 0.8 + fase, 1.0)
			var ang: float = lerp_angle(_ruido(n - 1.0) * TAU, _ruido(n) * TAU,
				minf(edad / 0.12, 1.0))
			return _foco(th, ang, 0.3) *(0.75 + 0.25 * sin(t * 5.0))
		"pareja_fiestera":


			var v: float = maxf(_foco(th, t * 3.1 + fase, 0.3),
				maxf(_foco(th, - t * 2.3 + fase + 2.0, 0.3), _foco(th, t * 4.7 + 4.0, 0.25)))
			return v *(1.0 if fmod(t * 6.0, 1.0) < 0.7 else 0.35)
		"pareja_ambiciosa":


			var c: float = fmod(t * 0.6 + fase / TAU, 1.0)
			var peldano: float = minf(floor(c * 6.0), 4.0) / 4.0
			var ang: float = PI * 0.5 - peldano * PI
			var cima: float = 0.25 * sin(t * 6.0) if peldano >= 1.0 else 0.0
			return _foco(th, ang, 0.3) *(0.75 + cima)
		"pareja_cazafortunas":


			return 0.7 *(1.0 - _foco(th, arriba + t * 1.6 + fase, 0.5))
		_:
			return 0.5 + 0.5 * sin(t + fase)





static func chispa_rasgo(id: String, t: float, fase: float) -> float:
	match id:
		"fergie":
			return pow(maxf(sin(t * TAU), 0.0), 24.0) * 0.6
		"supersticioso":
			var n: float = floor(t * 0.8 + fase)
			var edad: float = fmod(t * 0.8 + fase, 1.0)
			if _ruido(n + 3.0) < 0.55:
				return 0.0
			return pow(maxf(1.0 - edad * 4.0, 0.0), 2.0)
		"pareja_millonaria":


			var c: float = fmod(t * 0.4 + fase / TAU, 1.0)
			return pow(maxf(1.0 - c * 10.0, 0.0), 2.0) * 0.7
		_:
			return 0.0


func _draw() -> void:
	if _id == "":
		return
	var c: Vector2 = size * 0.5
	var r: float = minf(size.x, size.y) * 0.5 - 1.5
	if r <= 0.0:
		return
	var amp: float = float(_p["amp"]) if OvrBadge.ANIMADA else 0.0
	var chispa: float = chispa_rasgo(_id, _t, _fase) if OvrBadge.ANIMADA else 0.0



	var base: Color = CareerTheme.SURFACE.lerp(_col, 0.3)
	var alto: Color = CareerTheme.SURFACE.lerp(_col, 0.72 + chispa * 0.28)
	var pts: PackedVector2Array = _circulo(c, r, MUESTRAS)
	var cols: PackedColorArray = PackedColorArray()
	var media_luz: float = 0.0
	for i in MUESTRAS:
		var th: float = - PI * 0.5 + TAU * float(i) / float(MUESTRAS)
		var luz: float = luz_rasgo(_id, th, _t, _fase)
		media_luz += luz / float(MUESTRAS)
		cols.append(base.lerp(alto, clampf(luz * amp + chispa * 0.4, 0.0, 1.0)))
	draw_polygon(pts, cols)



	var r_nucleo: float = r *(SPRITE_PX * 0.5 + 1.0) /(DIAM * 0.5)
	draw_circle(c, r_nucleo, CareerTheme.SURFACE.lerp(_col, 0.1 + media_luz * amp * 0.12))


	var borde: PackedVector2Array = PackedVector2Array()
	var bcols: PackedColorArray = PackedColorArray()
	for i in MUESTRAS:
		var th: float = - PI * 0.5 + TAU * float(i) / float(MUESTRAS)
		borde.append(pts[i])
		bcols.append(_col.lerp(Color(1, 1, 1),
			clampf(luz_rasgo(_id, th, _t, _fase) * amp * 0.75 + chispa * 0.6, 0.0, 1.0)))
	borde.append(pts[0])
	bcols.append(bcols[0])
	draw_polyline_colors(borde, bcols, 2.5, true)




	if _glifo != null and (_tw_resalte == null or not _tw_resalte.is_valid()):
		_glifo.modulate = _col.lerp(Color(1, 1, 1), clampf(media_luz * amp * 0.35 + chispa * 0.5, 0.0, 1.0))








func resalta() -> void:
	if _tw_resalte != null and _tw_resalte.is_valid():
		_tw_resalte.kill()
	pivot_offset = custom_minimum_size.max(size) * 0.5
	scale = Vector2.ONE
	_tw_resalte = create_tween().set_parallel(true)
	_tw_resalte.tween_property(self, "scale", Vector2(1.18, 1.18), 0.12) \
			.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	_tw_resalte.tween_property(self, "scale", Vector2.ONE, 0.32).set_delay(0.12) \
			.set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	if _glifo != null:
		_tw_resalte.tween_property(_glifo, "modulate", CareerTheme.TEXT, 0.1)
		_tw_resalte.tween_property(_glifo, "modulate", _col, 0.35).set_delay(0.1) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)



func late() -> void:
	CareerUi.pulse_scale(self, 1.06)
