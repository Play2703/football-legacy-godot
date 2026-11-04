class_name MatchResultView
extends Control











































































signal repeticion(rid: int)
signal continuar



const FILA_H: float = 56.0




const MIN_W: float = 5.0 * CareerTheme.T_DIM



const MARCA_LADO: float = 620.0





const FOV: float = 40.0




const LLENA: float = 0.86






const ANCHO_1A: float = 10.4
const ESCALA_MIN: float = 0.72







const AIRE_TABLERO: float = 36.0

const HUECO_FILAS: float = 24.0




const LADO: float = 1.6



const ENTRADA: float = 1.6
const ENTRADA_LEJOS: float = 1.45
const ENTRADA_BAJA: float = 6.0
const ENTRADA_LADO: float = 9.0



const DERIVA: float = 24.0






const ALZA: float = -12.0






const LIBRE_ARCO: float = 3.0


const ALZA_TOPE: float = -3.0

const ENTRADA_SUELO: float = 1.0

const OJO_SUELO: float = 1.2




const SIN_TABLERO_OJO: Vector3 = Vector3(5.5, 3.4, 16.0)
const SIN_TABLERO_MIRA: Vector3 = Vector3(0.0, 6.0, -14.0)

var _tw: Tween
var _tw_cam: Tween

var boton_continuar: Button = null

var botones_gol: Dictionary = {}



var filas: Array[Array] = [[], []]


var pantalla: ScoreboardFinal = null
var camara: Camera3D = null

var en_estadio: bool = false


var _tinte: Array[Color] = [UiKit.CYAN, UiKit.KIT_NEUTRAL]

var _acento: Color = UiKit.GOLD
var _marca_a: float = 0.2


var _gen: int = 0


var _animados: Array[Control] = []


var _marca: CompLogo = null
var _tarjeta: Control = null
var _abajo: Control = null
var _tablero_2d: Control = null
var _orden: Array[Control] = []


var _col: VBoxContainer = null
var _cuerpo: VBoxContainer = null
var _velo_tr: TextureRect = null
var _marco: Dictionary = {}



var _estadio: Stadium = null
var _cam_previa: Camera3D = null



var _centro: Vector3 = Vector3.ZERO
var _eje: Vector3 = Vector3.BACK
var _lat: Vector3 = Vector3.RIGHT
var _dist: float = 27.0
var _alto: float = 0.0
var _baja: float = 7.0

var alza: float = ALZA

var alza_usada: float = ALZA

var _tapada: bool = false

var _fila_px: float = 0.0


var _pie_tablero: float = 0.0





var _tope_llena: float = INF


func _init() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP


	add_to_group(Entrada.CAPA_GROUP)


	add_to_group(CareerUi.ATRAS_CAPA_GROUP)



	visibility_changed.connect(_al_cambiar_visibilidad)


func populate(data: Dictionary) -> void:
	_suelta()
	for c in get_children():
		c.queue_free()
	botones_gol.clear()
	filas = [[], []]
	_animados.clear()
	_orden.clear()
	_marca = null
	_tarjeta = null
	_abajo = null
	_tablero_2d = null
	_col = null
	_cuerpo = null
	_velo_tr = null
	_tope_llena = INF
	pantalla = null
	camara = null
	en_estadio = false
	if _tw != null:
		_tw.kill()
	if _tw_cam != null:
		_tw_cam.kill()
	_gen += 1



	var fx_v: Variant = data.get("fx", {})
	var fx: Dictionary = fx_v if fx_v is Dictionary else {}
	_acento = Competitions.accent_of(fx)
	_marca_a = float(Competitions.style_of(fx).get("mark", 0.2))
	var you: Dictionary = data.get("you", {}) as Dictionary
	var rival: Dictionary = data.get("rival", {}) as Dictionary
	_tinte = tintes(you, rival, _acento)
	var est_v: Variant = data.get("estadio", null)
	_estadio = est_v as Stadium if est_v is Stadium and is_instance_valid(est_v) else null




	var host_tu: bool = _estadio == null or _estadio.you_are_host()
	var marco: Dictionary = _estadio.scoreboard_frame() if _estadio != null else {}
	_marco = marco
	var score: Array = data.get("score", [0, 0]) as Array
	var mios: Array = []
	var suyos: Array = []
	for g in data.get("goles", []) as Array:
		var gol: Dictionary = g as Dictionary
		(suyos if int(gol.get("lado", 0)) == 1 else mios).append(gol)
	var n_tu: int = int(score[0]) if score.size() > 0 else 0
	var n_su: int = int(score[1]) if score.size() > 1 else 0
	pantalla = ScoreboardFinal.new()
	add_child(pantalla)
	var lienzo: Dictionary = {
		"fx": fx,
		"clubes": [you, rival] if host_tu else [rival, you],
		"goles": [n_tu, n_su] if host_tu else [n_su, n_tu],
		"goleadores": [mios, suyos] if host_tu else [suyos, mios],
		"nota": String(data.get("nota", "")),
	}


	for llave in ["bg", "ink", "manual"]:
		if marco.has(llave):
			lienzo[llave] = marco[llave]
	pantalla.pinta(lienzo)

	var vp: Viewport = get_viewport()
	var tam: Vector2 = SceneFade.rect_visible(self).size


	var arriba: float = UiKit.top_safe_inset(vp) + AIRE_TABLERO
	en_estadio = not marco.is_empty() and _estadio.set_scoreboard_texture(pantalla.get_texture())





	if en_estadio:
		_encuadra(marco, tam, arriba)
		en_estadio = not _tapada
	if _estadio != null:
		_cam_previa = SceneFade.camara_de(self)
		camara = Camera3D.new()
		camara.fov = FOV
		add_child(camara)




		if en_estadio and _cam_previa != null:
			camara.global_transform = _cam_previa.global_transform
			camara.fov = _cam_previa.fov
		camara.current = true


	if _estadio != null:
		var gana_casa: int = signi((n_tu - n_su) *(1 if host_tu else -1))
		_estadio.crowd_final("home" if gana_casa > 0 else ("away" if gana_casa < 0 else ""))
	if en_estadio:


		_encuadra(marco, tam, arriba)
	else:
		_a_2d(arriba, fx)


	_abajo = Control.new()
	_abajo.set_anchors_preset(Control.PRESET_FULL_RECT)
	_abajo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_abajo)
	_velo_tr = _velo(tam)
	_abajo.add_child(_velo_tr)
	var col: VBoxContainer = VBoxContainer.new()
	_col = col
	col.set_anchors_preset(Control.PRESET_FULL_RECT)
	col.offset_left = 24.0 + UiKit.side_safe_inset(vp)
	col.offset_right = -24.0 - UiKit.side_safe_inset(vp)
	col.offset_top = _pie_tablero + HUECO_FILAS
	col.offset_bottom = -(30.0 + UiKit.bottom_safe_inset(vp))
	col.add_theme_constant_override("separation", 16)
	_abajo.add_child(col)






	var scroll: ScrollContainer = DragScroll.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var cuerpo: VBoxContainer = VBoxContainer.new()
	_cuerpo = cuerpo
	cuerpo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cuerpo.size_flags_vertical = Control.SIZE_EXPAND_FILL
	cuerpo.alignment = BoxContainer.ALIGNMENT_END
	cuerpo.add_theme_constant_override("separation", 16)
	if UiKit.es_horizontal():
		scroll.free()
		col.add_child(cuerpo)
	else:
		col.add_child(scroll)
		scroll.add_child(cuerpo)
	if UiKit.es_horizontal():


		var cuerpo_fila: HBoxContainer = HBoxContainer.new()
		cuerpo_fila.name = "Abajo"
		cuerpo.add_child(cuerpo_fila)
		ResultadoTira.build(self, cuerpo_fila, data, alto_libre(),
			tam.x + col.offset_right - col.offset_left)
	else:
		var goles_placa: Control = _placa_goles(data.get("goles", []) as Array)
		goles_placa.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		cuerpo.add_child(goles_placa)
		var figura: Dictionary = data.get("figura", {}) as Dictionary
		if not figura.is_empty():
			_tarjeta = _figura(figura, data)
			cuerpo.add_child(_tarjeta)
		boton_continuar = CareerUi.primary_cta(I18n.t("CONTINUAR"), _on_continuar)
		boton_continuar.set_meta(Entrada.PRIMERO_META, true)
		col.add_child(boton_continuar)







	_abajo.modulate.a = 0.0
	if _tablero_2d != null:
		_tablero_2d.modulate.a = 0.0


	SceneFade.arbol().process_frame.connect(_mide_y_entra.bind(_gen), CONNECT_ONE_SHOT)


func _mide_y_entra(gen: int) -> void:
	if gen != _gen or not is_inside_tree():
		return
	_centra()
	_entra(gen)














func _centra() -> void:
	var vp: Viewport = get_viewport()
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var techo: float = UiKit.top_safe_inset(vp)
	_tope_llena = INF
	var alto_px: float = _alto_px(_marco, tam) if en_estadio \
			else float(ScoreboardFinal.H) + 20.0
	var abajo_h: float = _cuerpo.get_combined_minimum_size().y

	if boton_continuar.get_parent() == _col:
		abajo_h += float(_col.get_theme_constant("separation")) \
				+ boton_continuar.get_combined_minimum_size().y
	var primera_fila: float = tam.y + _col.offset_bottom - abajo_h





	if en_estadio and UiKit.es_horizontal():
		var cabe: float = primera_fila - techo - AIRE_TABLERO - HUECO_FILAS
		var suelo: float = alto_px * float(Lienzo.RETRATO.x) / maxf(tam.x, 1.0)
		var quiere: float = maxf(cabe, suelo)
		if alto_px > quiere:
			_tope_llena = _llena(float(_marco.get("width", 10.4))) * quiere / alto_px
			alto_px = _alto_px(_marco, tam)



	var arriba: float = maxf(techo + AIRE_TABLERO,
		techo +(primera_fila - techo - alto_px) * 0.5)
	if en_estadio:
		camara.fov = FOV
		_encuadra(_marco, tam, arriba, primera_fila)



		if _tapada:
			_a_2d(arriba, {})
			_tablero_2d.modulate.a = 0.0
			_centra()
			return
		_pon(_pose_entrada(0.0 if not Settings.reduce_motion else 1.0))
	else:
		_pie_tablero = arriba + alto_px
		if _tablero_2d != null:
			_tablero_2d.offset_top = arriba
			_tablero_2d.offset_bottom = _pie_tablero
	_col.offset_top = _pie_tablero + HUECO_FILAS
	_velo_tr.offset_top = - maxf(tam.y - _pie_tablero - 60.0, 0.0)




func _alto_px(marco: Dictionary, tam: Vector2) -> float:
	var ancho: float = float(marco.get("width", 10.4))
	return tam.x * _llena(ancho) * float(marco.get("height", 3.4)) / ancho



func _llena(ancho: float) -> float:
	return minf(LLENA * clampf(ancho / ANCHO_1A, ESCALA_MIN, 1.0), _tope_llena)











func _encuadra(marco: Dictionary, tam: Vector2, arriba: float, fila_px: float = -1.0) -> void:
	var normal: Vector3 = marco.get("normal", Vector3.BACK) as Vector3
	_eje = Vector3(normal.x, 0.0, normal.z)
	_eje = _eje.normalized() if _eje.length() > 0.01 else Vector3.BACK
	_lat = Vector3(_eje.z, 0.0, - _eje.x)

	_centro =(marco.get("center", Vector3.ZERO) as Vector3) + normal * 0.26
	var ancho: float = float(marco.get("width", 10.4))
	var t: float = tan(deg_to_rad(FOV) * 0.5)
	var aspecto: float = tam.x / maxf(tam.y, 1.0)
	var llena: float = _llena(ancho)


	var alto_px: float = _alto_px(marco, tam)
	var centro_px: float = arriba + alto_px * 0.5
	var o: float = 1.0 - centro_px /(tam.y * 0.5)
	var alfa: float = atan(o * t)


	var hd: float =(ancho * 0.5) / maxf(llena * t * aspecto * cos(alfa), 0.001)





	alza_usada = _alza_libre(marco, hd, alfa,
		fila_px if fila_px >= 0.0 else arriba + alto_px + HUECO_FILAS, tam)
	var fi: float = deg_to_rad(alza_usada)
	var h: float = hd * cos(fi)
	_dist = sqrt(maxf(h * h - LADO * LADO, 1.0))
	_alto = hd * sin(fi)
	_baja = - _alto + tan(fi + alfa) * h
	_pie_tablero = arriba + alto_px






func _alza_libre(marco: Dictionary, hd: float, alfa: float, fila_px: float, tam: Vector2) -> float:
	var g: float = alza
	_tapada = false
	if _estadio == null:
		return g
	var t: float = tan(deg_to_rad(FOV) * 0.5)


	_fila_px = fila_px
	var fila: float = atan((1.0 - fila_px / maxf(tam.y * 0.5, 1.0)) * t)

	var suelo: Vector3 = _estadio.global_position
	var a_gol: float =(suelo - _centro).dot(_eje)
	while g < ALZA_TOPE:
		var fi: float = deg_to_rad(g)
		var ojo_y: float = _centro.y + hd * sin(fi)


		if ojo_y - suelo.y >= OJO_SUELO:
			var delante: float = hd * cos(fi) - a_gol
			if delante <= 0.0:
				break

			var y: float = ojo_y + tan(fila -(fi + alfa)) * delante
			if y >= suelo.y + LIBRE_ARCO:
				break
		g += 1.0


	_tapada = _tapa(marco, hd, g)
	while _tapada and _centro.y + hd * sin(deg_to_rad(g)) - suelo.y > OJO_SUELO:
		g -= 1.0
		_tapada = _tapa(marco, hd, g)
	return g



func _tapa(marco: Dictionary, hd: float, g: float) -> bool:
	var fi: float = deg_to_rad(g)
	var h: float = hd * cos(fi)
	var ojo: Vector3 = _centro + _eje * sqrt(maxf(h * h - LADO * LADO, 1.0)) + _lat * LADO \
			+ Vector3(0.0, hd * sin(fi), 0.0)
	return Ceremony.cubierta_tapa_en(_estadio, ojo, marco)







func _pose_entrada(k: float) -> Dictionary:
	var suelo: float =(_estadio.global_position.y if _estadio != null else 0.0) \
			+ ENTRADA_SUELO - _centro.y
	return {
		"dist": lerpf(_dist * ENTRADA_LEJOS, _dist, k),
		"alto": lerpf(maxf(_alto - ENTRADA_BAJA, minf(_alto, suelo)), _alto, k),
		"lado": lerpf(ENTRADA_LADO, LADO, k),
		"baja": lerpf(_baja * 0.25, _baja, k),
	}


func _pon(p: Dictionary) -> void:
	if camara == null or not camara.is_inside_tree():
		return
	var ojo: Vector3 = _centro + _eje * float(p["dist"]) + _lat * float(p["lado"]) \
			+ Vector3(0.0, float(p["alto"]), 0.0)
	camara.look_at_from_position(ojo, _centro - Vector3(0.0, float(p["baja"]), 0.0))


func _grua(k: float) -> void:
	_pon(_pose_entrada(k))


func _deriva(lado: float) -> void:
	_pon({"dist": _dist, "alto": _alto, "lado": lado, "baja": _baja})









func _a_2d(arriba: float, fx: Dictionary) -> void:
	en_estadio = false
	if camara != null:
		camara.look_at_from_position(SIN_TABLERO_OJO, SIN_TABLERO_MIRA)
	else:
		_fondo(fx)
	_tablero_2d = _en_2d(arriba)
	add_child(_tablero_2d)
	if _abajo != null:
		move_child(_tablero_2d, _abajo.get_index())
	_pie_tablero = arriba + float(ScoreboardFinal.H) + 20.0


func _en_2d(arriba: float) -> Control:
	var caja: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SimScreen.SUP_ELEVADO
	sb.set_corner_radius_all(8)
	sb.set_border_width_all(2)
	sb.border_color = SimScreen.SUP_FILO
	sb.set_content_margin_all(8)
	sb.shadow_color = UiKit.SHADE
	sb.shadow_size = 18
	caja.add_theme_stylebox_override("panel", sb)
	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var tex: TextureRect = TextureRect.new()
	tex.texture = pantalla.get_texture()
	tex.custom_minimum_size = Vector2(ScoreboardFinal.W, ScoreboardFinal.H)
	tex.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tex.mouse_filter = Control.MOUSE_FILTER_IGNORE
	caja.add_child(tex)
	var medio: float = float(ScoreboardFinal.W) * 0.5 + 10.0
	caja.set_anchors_preset(Control.PRESET_CENTER_TOP)
	caja.offset_left = - medio
	caja.offset_right = medio
	caja.offset_top = arriba
	caja.offset_bottom = arriba + float(ScoreboardFinal.H) + 20.0
	return caja







func _velo(tam: Vector2) -> TextureRect:
	var g: Gradient = Gradient.new()
	g.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
	g.colors = PackedColorArray([Color(SimScreen.SUP_FONDO, 0.0),
		Color(SimScreen.SUP_FONDO, 0.55), Color(SimScreen.SUP_FONDO, 0.9)])
	var tr: TextureRect = _full_tex(_grad_tex(g, false))
	tr.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	tr.offset_top = - maxf(tam.y - _pie_tablero - 60.0, 0.0)
	return tr





func _suelta() -> void:
	if _estadio != null and is_instance_valid(_estadio):
		_estadio.set_scoreboard_texture(null)
	if camara != null and is_instance_valid(camara) and camara.current \
			and _cam_previa != null and is_instance_valid(_cam_previa) \
			and _cam_previa.is_inside_tree():
		_cam_previa.current = true




func _engancha() -> void:
	if not is_inside_tree() or not is_visible_in_tree():
		return
	if en_estadio and _estadio != null and is_instance_valid(_estadio) and pantalla != null:
		_estadio.set_scoreboard_texture(pantalla.get_texture())
	if camara != null and is_instance_valid(camara) and camara.is_inside_tree():
		camara.current = true
	if pantalla != null:
		pantalla.asienta()


func _enter_tree() -> void:
	if pantalla != null:
		_engancha.call_deferred()


func _exit_tree() -> void:
	if _tw_cam != null:
		_tw_cam.kill()
	_suelta()





func _process(_delta: float) -> void:
	if camara != null and not camara.current and camara.is_inside_tree() \
			and is_visible_in_tree():
		camara.current = true












static func tintes(you: Dictionary, rival: Dictionary, acento: Color) -> Array[Color]:
	var tu: Color = tinte_lado(you, UiKit.CYAN)
	var su: Color = _primero_libre([
		tinte_lado(rival, acento), _vivo(acento), UiKit.KIT_NEUTRAL,
		CareerTheme.NAV_MUNDO, CareerTheme.NAV_PAPEL, CareerTheme.NAV_PLANTILLA], [tu])
	var out: Array[Color] = [tu, su]
	return out




static func _primero_libre(candidatos: Array, contra: Array) -> Color:
	for c in candidatos:
		var libre: bool = true
		for o in contra:
			if Teams.kits_clash(c as Color, o as Color):
				libre = false
				break
		if libre:
			return c as Color
	return candidatos[candidatos.size() - 1] as Color





static func tinte_lado(team: Dictionary, reserva: Color) -> Color:
	var kit: Color = _kit(team, "kit", reserva)
	if kit.s < 0.15:
		var kit2: Color = _kit(team, "kit2", reserva)
		kit = kit2 if kit2.s >= 0.15 else reserva
	return _vivo(kit)





static func _vivo(c: Color) -> Color:
	if c.s < 0.15:
		return UiKit.KIT_NEUTRAL
	return Color.from_hsv(c.h, clampf(c.s, 0.5, 0.95), clampf(c.v, 0.66, 1.0))




static func _kit(team: Dictionary, llave: String, reserva: Color) -> Color:
	var v: Variant = team.get(llave, reserva)
	return v if v is Color else reserva




static func _claro(c: Color) -> Color:
	return Color.from_hsv(c.h, minf(c.s, 0.45), 1.0)




static func color_nota(v: float) -> Color:
	if v < 5.5:
		return UiKit.DANGER
	if v >= 7.0:
		return UiKit.GOLD
	return UiKit.RATING_NEUTRAL








func _fondo(fx: Dictionary) -> void:
	var capa: Control = Control.new()
	capa.set_anchors_preset(Control.PRESET_FULL_RECT)
	capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(capa)


	var base: Gradient = Gradient.new()
	base.offsets = PackedFloat32Array([0.0, 0.35, 1.0])
	base.colors = PackedColorArray([SimScreen.SUP_FONDO.lerp(_acento, 0.18),
		SimScreen.SUP_FONDO, SimScreen.SUP_FONDO])
	capa.add_child(_full_tex(_grad_tex(base, false)))


	capa.add_child(_resplandor(_tinte[1], true))
	capa.add_child(_resplandor(_tinte[0], false))



	var motivo: Control = Control.new()
	motivo.set_anchors_preset(Control.PRESET_FULL_RECT)
	motivo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var linea: Color = Color(_acento, 0.06)
	motivo.draw.connect(func() -> void:
		var w: float = motivo.size.x
		var h: float = motivo.size.y
		var cy: float = h * 0.56
		motivo.draw_line(Vector2(0.0, cy), Vector2(w, cy), linea, 4.0)
		motivo.draw_arc(Vector2(w * 0.5, cy), 240.0, 0.0, TAU, 96, linea, 4.0, true)
		motivo.draw_arc(Vector2(w * 0.5, h * 1.02), 300.0, PI, TAU, 64, linea, 4.0, true))
	capa.add_child(motivo)



	_marca = CompLogo.new()
	_marca.sin_placa = true
	_marca.custom_minimum_size = Vector2(MARCA_LADO, MARCA_LADO)
	_marca.set_anchors_preset(Control.PRESET_CENTER)
	_marca.offset_left = - MARCA_LADO * 0.5
	_marca.offset_right = MARCA_LADO * 0.5
	_marca.offset_top = - MARCA_LADO * 0.5
	_marca.offset_bottom = MARCA_LADO * 0.5
	_marca.mouse_filter = Control.MOUSE_FILTER_IGNORE
	capa.add_child(_marca)
	_marca.setup(Competitions.logo_type_of(fx), _acento)
	_marca.modulate.a = _marca_a


	var vineta: Gradient = Gradient.new()
	vineta.offsets = PackedFloat32Array([0.55, 1.0])
	vineta.colors = PackedColorArray([UiKit.CLEAR, UiKit.SHADE])
	capa.add_child(_full_tex(_grad_tex(vineta, true)))



func _resplandor(c: Color, arriba: bool) -> TextureRect:
	var g: Gradient = Gradient.new()
	g.offsets = PackedFloat32Array([0.0, 1.0])
	var lleno: Color = Color(c, 0.9)
	var nada: Color = Color(c, 0.0)
	g.colors = PackedColorArray([lleno, nada] if arriba else [nada, lleno])
	var tr: TextureRect = _full_tex(_grad_tex(g, false))
	if arriba:
		tr.set_anchors_preset(Control.PRESET_TOP_WIDE)
		tr.offset_bottom = 760.0
	else:
		tr.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
		tr.offset_top = -760.0
	tr.modulate.a = 0.3
	return tr




static func _grad_tex(g: Gradient, radial: bool) -> GradientTexture2D:
	var t: GradientTexture2D = GradientTexture2D.new()
	t.gradient = g
	t.width = 128
	t.height = 256
	if radial:
		t.fill = GradientTexture2D.FILL_RADIAL
		t.fill_from = Vector2(0.5, 0.5)
		t.fill_to = Vector2(1.0, 0.5)
	else:
		t.fill_from = Vector2(0.0, 0.0)
		t.fill_to = Vector2(0.0, 1.0)
	return t



static func _full_tex(tex: Texture2D) -> TextureRect:
	var tr: TextureRect = TextureRect.new()
	tr.texture = tex
	tr.stretch_mode = TextureRect.STRETCH_SCALE
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.set_anchors_preset(Control.PRESET_FULL_RECT)
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return tr








func _placa_goles(goles: Array) -> Control:
	var placa: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SimScreen.SUP_PANEL
	sb.set_border_width_all(2)
	sb.border_color = SimScreen.SUP_FILO
	sb.set_corner_radius_all(20)
	sb.set_content_margin_all(18)
	placa.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 10)
	placa.add_child(col)
	if goles.is_empty():

		var nadie: HBoxContainer = HBoxContainer.new()
		nadie.alignment = BoxContainer.ALIGNMENT_CENTER
		nadie.add_theme_constant_override("separation", 12)
		nadie.custom_minimum_size = Vector2(0, FILA_H)
		nadie.add_child(_icono("gol", UiKit.INK_DIM, 30.0))
		var l: Label = _texto(CareerTheme.T_BODY, UiKit.INK_DIM, I18n.t("SIN GOLES"))
		l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		nadie.add_child(l)
		col.add_child(nadie)
		return placa
	col.add_child(_titulo(_icono("gol", UiKit.INK_DIM, 26.0), I18n.t("GOLES")))
	for g in goles:
		var gol: Dictionary = g as Dictionary
		var lado: int = clampi(int(gol.get("lado", 0)), 0, 1)
		var fila: Control = _gol(gol, lado)
		col.add_child(fila)
		filas[lado].append(fila)
		_orden.append(fila)
	return placa




func _titulo(icono: Control, texto: String) -> Control:
	var h: HBoxContainer = HBoxContainer.new()
	h.add_theme_constant_override("separation", 10)
	h.add_child(icono)
	var l: Label = _texto(CareerTheme.T_CAPTION, UiKit.INK_DIM, texto)
	l.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	h.add_child(l)
	return h












func _gol(gol: Dictionary, lado: int) -> Control:
	var fondo: PanelContainer = PanelContainer.new()

	fondo.custom_minimum_size = Vector2(0, FILA_H)
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SimScreen.SUP_PANEL.lerp(_tinte[lado], 0.32)
	sb.set_corner_radius_all(4)


	sb.content_margin_left = 10.0
	sb.content_margin_right = 6.0
	sb.content_margin_top = 6.0
	sb.content_margin_bottom = 6.0
	fondo.add_theme_stylebox_override("panel", sb)
	fondo.set_meta("lado", lado)
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 14)
	fondo.add_child(fila)

	var minuto: Label = _texto(CareerTheme.T_DIM, UiKit.INK_FAINT, _minuto(gol))
	minuto.custom_minimum_size = Vector2(MIN_W, 0)
	minuto.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	fila.add_child(minuto)
	fila.add_child(_icono("balon", UiKit.GOLD if lado == 0 else UiKit.DANGER,
		SimScreen.PILA_ICONO))

	var textos: VBoxContainer = VBoxContainer.new()
	textos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	textos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	textos.add_theme_constant_override("separation", 4)
	fila.add_child(textos)
	var nom: String = String(gol.get("name", "")).strip_edges()
	var nombre: Label = _texto(CareerTheme.T_BODY,
		UiKit.INK_HI if not nom.is_empty() else UiKit.INK_DIM,
		CareerTheme.caps(nom) if not nom.is_empty() else I18n.t("GOL"))
	_parte(nombre, CareerTheme.T_BODY)
	textos.add_child(nombre)
	var asist: String = String(gol.get("asist", "")).strip_edges()
	if not asist.is_empty() and CareerTheme.caps(asist) != CareerTheme.caps(nom):
		var fa: HBoxContainer = HBoxContainer.new()
		fa.add_theme_constant_override("separation", 10)

		var clave: Label = _texto(CareerTheme.T_CAPTION, UiKit.INK_DIM, I18n.t("ASIST."))
		clave.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
		fa.add_child(clave)
		var al: Label = _texto(CareerTheme.T_CAPTION, UiKit.INK_BODY, CareerTheme.caps(asist))
		_parte(al, CareerTheme.T_CAPTION)
		fa.add_child(al)
		textos.add_child(fa)




	var rid: int = int(gol.get("rid", -1))
	if rid > 0:
		var ver: Button = Button.new()
		ver.text = I18n.t("▸ GOL")
		ver.custom_minimum_size = Vector2(0, FILA_H)
		UiKit.apply_button(ver, UiKit.BTN_GRAY, CareerTheme.T_DIM)
		SimScreen.boton_de_fila(ver)
		ver.add_theme_color_override("font_color", UiKit.GOLD)
		ver.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		ver.pressed.connect(func() -> void: repeticion.emit(rid))
		botones_gol[rid] = ver
		fila.add_child(ver)
	return fondo






func _parte(l: Label, cuerpo: int) -> void:
	l.clip_text = false
	l.text_overrun_behavior = TextServer.OVERRUN_NO_TRIMMING
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.custom_minimum_size = Vector2(6.0 * cuerpo, 0)
	l.size_flags_horizontal = Control.SIZE_EXPAND_FILL


	l.add_theme_constant_override("line_spacing", int(cuerpo / 4))



static func _minuto(gol: Dictionary) -> String:
	return ScoreboardFinal.minuto(gol)









func _figura(figura: Dictionary, data: Dictionary) -> Control:
	var caja: PanelContainer = PanelContainer.new()
	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = SimScreen.SUP_PANEL
	sb.set_border_width_all(2)
	sb.border_color = SimScreen.SUP_FILO
	sb.set_corner_radius_all(16)
	sb.set_content_margin_all(14)
	caja.add_theme_stylebox_override("panel", sb)
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)
	caja.add_child(col)



	var copa: TrophyIcon = TrophyIcon.new()
	copa.custom_minimum_size = Vector2(32, 32)
	copa.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	copa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	col.add_child(_titulo(copa, I18n.t("JUGADOR DEL PARTIDO")))
	copa.set_type(TrophyIcon.partido_de(String(data.get("comp", "league"))))

	var mia: bool = bool(figura.get("mia", false))
	var lado: int = clampi(int(figura.get("lado", 0)), 0, 1)
	var equipo: Dictionary = data.get("you" if lado == 0 else "rival", {}) as Dictionary
	var nom: String = Career.player_name if mia else String(figura.get("name", ""))
	var cuerpo: HBoxContainer = HBoxContainer.new()
	cuerpo.add_theme_constant_override("separation", 18)
	col.add_child(cuerpo)
	cuerpo.add_child(_cara(nom, equipo, mia, bool(figura.get("portero", false)), lado))

	var datos: VBoxContainer = VBoxContainer.new()
	datos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	datos.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	datos.add_theme_constant_override("separation", 10)
	cuerpo.add_child(datos)

	var nombre: Label = _texto(CareerTheme.T_HEAD, UiKit.INK, CareerTheme.caps(nom))
	_parte(nombre, CareerTheme.T_HEAD)
	datos.add_child(nombre)
	var club: HBoxContainer = HBoxContainer.new()
	club.add_theme_constant_override("separation", 10)
	var mini: CrestView = CrestView.new()
	mini.custom_minimum_size = Vector2(40, 40)
	mini.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	mini.mouse_filter = Control.MOUSE_FILTER_IGNORE
	club.add_child(mini)
	mini.set_team(equipo)
	var club_nom: Label = _texto(CareerTheme.T_DIM, UiKit.INK_DIM,
		CareerTheme.caps(Competitions.demarca(String(equipo.get("name", "")))))
	_parte(club_nom, CareerTheme.T_DIM)
	club_nom.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	club.add_child(club_nom)
	datos.add_child(club)





	var nota_propia: bool = mia and figura.has("rating")
	var chips: HFlowContainer = HFlowContainer.new()
	chips.add_theme_constant_override("h_separation", 22)
	chips.add_theme_constant_override("v_separation", 6)
	for parte in partes_figura(figura):
		var pd: Dictionary = parte as Dictionary
		if String(pd["rol"]) == "nota":
			continue
		var chip: HBoxContainer = HBoxContainer.new()
		chip.add_theme_constant_override("separation", 8)
		chip.add_child(_icono(String(pd["icono"]), UiKit.GOLD if lado == 0 else UiKit.DANGER,
			26.0))
		var cl: Label = _texto(CareerTheme.T_DIM, UiKit.INK_HI, String(pd["texto"]))
		cl.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		chip.add_child(cl)
		chips.add_child(chip)
	if chips.get_child_count() > 0:
		datos.add_child(chips)




	if nota_propia:
		var nc: VBoxContainer = VBoxContainer.new()
		nc.add_theme_constant_override("separation", 4)
		nc.size_flags_vertical = Control.SIZE_SHRINK_CENTER
		var cap: Label = _texto(CareerTheme.T_CAPTION, UiKit.INK_DIM, I18n.t("NOTA"))
		cap.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nc.add_child(cap)
		var r: float = float(figura["rating"])
		var cifra: Label = _texto(CareerTheme.T_TITLE_MODAL, color_nota(r), "%.1f" % r)
		cifra.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		nc.add_child(cifra)
		cuerpo.add_child(nc)
	return caja






static func partes_figura(figura: Dictionary) -> Array:
	var partes: Array = []
	if bool(figura.get("mia", false)) and figura.has("rating"):
		partes.append({"icono": "media", "rol": "nota",
			"texto": "%s %.1f" % [I18n.t("NOTA"), float(figura["rating"])]})
	var g: int = int(figura.get("goals", 0))
	var a: int = int(figura.get("assists", 0))
	var p: int = int(figura.get("paradas", 0))
	if g > 0:
		partes.append({"icono": "gol", "rol": "goles",
			"texto": "%d %s" % [g, I18n.plural(g, "GOL", "GOLES")]})
	if a > 0:
		partes.append({"icono": "asist", "rol": "asist",
			"texto": "%d %s" % [a, I18n.t("ASIST.")]})
	if p > 0:
		partes.append({"icono": "guante", "rol": "paradas",
			"texto": "%d %s" % [p, I18n.plural(p, "PARADA", "PARADAS")]})
	return partes



static func linea_figura(figura: Dictionary) -> String:
	var textos: PackedStringArray = []
	for parte in partes_figura(figura):
		textos.append(String((parte as Dictionary)["texto"]))
	return " · ".join(textos)






func _cara(nom: String, equipo: Dictionary, mia: bool, portero: bool, lado: int) -> Control:
	var t: Color = _tinte[lado]
	var marco: PanelContainer = PanelContainer.new()
	var msb: StyleBoxFlat = StyleBoxFlat.new()
	msb.bg_color = Color(t, 0.22)
	msb.set_corner_radius_all(8)
	msb.set_border_width_all(2)
	msb.border_color = Color(t, 0.9)
	msb.set_content_margin_all(2)
	marco.add_theme_stylebox_override("panel", msb)
	marco.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	marco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var av: PlayerAvatar = PlayerAvatar.new()
	av.chrome = false
	av.bust = PlayerAvatar.BUST_CLOSE
	av.custom_minimum_size = Vector2(138, 180)
	av.mouse_filter = Control.MOUSE_FILTER_IGNORE
	av.club = equipo
	marco.add_child(av)
	if mia:
		av.set_look(GameState.player_look())
		return marco
	var num: int = 0
	var up: String = nom.to_upper()
	for q in Squad.of(String(equipo.get("id", ""))):
		var ficha: Dictionary = q as Dictionary
		if String(ficha.get("name", "")).to_upper() == up:
			num = int(ficha.get("number", 0))
			portero = portero or String(ficha.get("pos", "")) == "POR"
			break
	var base: Dictionary = GameState.kit_variant(equipo, 0)
	if portero:

		base = KitRecolor.keeper_con_pecho(KitRecolor.keeper_cfg(
			String(equipo.get("id", "")), -1, String(base.get("pattern", "solid"))), base)
	base["number"] = num
	av.set_look(KitRecolor.appearance_for(nom, base),
		PlayerCard.KEEPER_TEX if portero else null)
	return marco


func _texto(size: int, color: Color, txt: String) -> Label:
	var l: Label = CareerUi.plain(size, color)
	l.text = txt
	return l



func _icono(tipo: String, color: Color, lado: float) -> Control:
	var ic: MenuIcon = MenuIcon.new()
	ic.custom_minimum_size = Vector2(lado, lado)
	ic.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	ic.mouse_filter = Control.MOUSE_FILTER_IGNORE
	ic.setup(tipo, color)
	return ic











func _entra(gen: int) -> void:
	if gen != _gen or not is_inside_tree():
		return
	if _tw != null:
		_tw.kill()
	if _tw_cam != null:
		_tw_cam.kill()


	if not is_visible_in_tree() or Settings.reduce_motion:
		_asienta()
		return
	_tw = create_tween()
	_tw.set_parallel(true)
	_tw.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
	_tw.set_ignore_time_scale(true)
	var llega: float = 0.0
	if en_estadio:
		_tw_cam = create_tween()
		_tw_cam.set_pause_mode(Tween.TWEEN_PAUSE_PROCESS)
		_tw_cam.set_ignore_time_scale(true)
		_tw_cam.tween_method(_grua, 0.0, 1.0, ENTRADA) \
				.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
		_tw_cam.tween_method(_deriva, LADO, - LADO, DERIVA) \
				.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

		llega = ENTRADA * 0.55
	elif _tablero_2d != null:
		_tw.tween_property(_tablero_2d, "modulate:a", 1.0, 0.25) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
		llega = 0.2
	pantalla.enciende(llega)

	var abajo: float = llega + 0.45
	_tw.tween_property(_abajo, "modulate:a", 1.0, 0.3).set_delay(abajo) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	if _marca != null:
		_marca.modulate.a = 0.0
		_tw.tween_property(_marca, "modulate:a", _marca_a, 0.55) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)




	for i in _orden.size():
		var r: Control = _orden[i]
		var d: float = abajo + 0.12 + minf(float(i), 8.0) * 0.05
		var lado: int = int(r.get_meta("lado", 0))
		r.pivot_offset = Vector2(0.0 if lado == 0 else r.size.x, r.size.y * 0.5)
		r.modulate.a = 0.0
		r.scale = Vector2(0.92, 1.0)
		_animados.append(r)
		_tw.tween_property(r, "modulate:a", 1.0, 0.22).set_delay(d)
		_tw.tween_property(r, "scale", Vector2.ONE, 0.28).set_delay(d) \
				.set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	_aparece(_tarjeta, Vector2(0.94, 0.94), 0.45,
		abajo + 0.22 + minf(float(_orden.size()), 8.0) * 0.05, Tween.TRANS_BACK)




func _aparece(c: Control, desde: Vector2, dur: float, retraso: float,
		trans: Tween.TransitionType) -> void:
	if c == null or not is_instance_valid(c):
		return
	c.pivot_offset = c.size * 0.5
	c.modulate.a = 0.0
	c.scale = desde
	_animados.append(c)
	_tw.tween_property(c, "modulate:a", 1.0, dur).set_delay(retraso) \
			.set_trans(trans).set_ease(Tween.EASE_OUT)
	if desde != Vector2.ONE:
		_tw.tween_property(c, "scale", Vector2.ONE, dur).set_delay(retraso) \
				.set_trans(trans).set_ease(Tween.EASE_OUT)




func _asienta() -> void:
	if _tw_cam != null:
		_tw_cam.kill()
	if en_estadio:
		_grua(1.0)
	if pantalla != null and is_instance_valid(pantalla):
		pantalla.asienta()
	for c in [_abajo, _tablero_2d]:
		if c != null and is_instance_valid(c):
			(c as Control).modulate.a = 1.0
	for c in _animados:
		if is_instance_valid(c):
			c.modulate.a = 1.0
			c.scale = Vector2.ONE
	if _marca != null and is_instance_valid(_marca):
		_marca.modulate.a = _marca_a






func _al_cambiar_visibilidad() -> void:
	if is_visible_in_tree():
		_engancha()
		return
	if _tw != null and _tw.is_valid() and _tw.is_running():
		_tw.kill()
	_asienta()
	if _estadio != null and is_instance_valid(_estadio):
		_estadio.set_scoreboard_texture(null)


func _on_continuar() -> void:

	if boton_continuar != null:
		if boton_continuar.disabled:
			return
		boton_continuar.disabled = true
	continuar.emit()






func atras() -> bool:
	if CareerUi.modal_open(self):
		CareerUi.close_top_modal(self)
		return true
	if is_visible_in_tree() and boton_continuar != null and not boton_continuar.disabled:
		_on_continuar()
		return true
	return false






func alto_libre() -> float:
	var tam: Vector2 = SceneFade.rect_visible(self).size
	var suelo: float = float(ScoreboardFinal.H) + 20.0
	if en_estadio:
		var tope: float = _tope_llena
		_tope_llena = INF
		suelo = _alto_px(_marco, tam) * float(Lienzo.RETRATO.x) / maxf(tam.x, 1.0)
		_tope_llena = tope
	return tam.y + _col.offset_bottom \
			-(UiKit.top_safe_inset(get_viewport()) + AIRE_TABLERO + suelo + HUECO_FILAS)
