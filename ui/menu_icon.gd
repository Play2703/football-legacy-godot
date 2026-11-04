class_name MenuIcon
extends Control
















const BALL_INK: Color = Color("1a1a24")

var _type: String = "perfil"
var color: Color = Color("f4f1ec"):
	set(v):
		color = v
		queue_redraw()


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	if custom_minimum_size == Vector2.ZERO:
		custom_minimum_size = Vector2(44, 44)


func set_type(t: String) -> void:
	_type = t
	queue_redraw()



func setup(t: String, col: Color) -> void:
	_type = t
	color = col
	queue_redraw()


func _dim() -> Color:
	return Color(color.r, color.g, color.b, color.a * 0.42)


func _draw() -> void:
	var s: float = minf(size.x, size.y)
	var c: Vector2 = size * 0.5
	match _type:

		"perfil": _person(c, s)
		"mundo": _globe(c, s)
		"contrato": _document(c, s)
		"mercado": _briefcase(c, s)
		"tienda": _boot(c, s)
		"relaciones": _people(c, s)
		"torneos": _cup(c, s)
		"palmares": _league_plate(c, s)
		"leyendas": _medal(c, s)
		"seleccion": _flag(c, s)
		"vitrina": _shelf(c, s)
		"stats": _bars(c, s)
		"buzon": _mail(c, s)
		"botiquin": _medkit(c, s)

		"tecnico": _whistle(c, s)
		"equipo": _shirt(c, s)
		"aficion": _crowd(c, s)
		"prensa": _mic(c, s)
		"agente": _phone(c, s)
		"patrocinador": _tag(c, s)
		"pareja": _heart(c, s)





		"spin": _spin(c, s)
		"target": _target(c, s)
		"mover": _grab(c, s)
		"caja": _crate(c, s)
		"caja_abierta": _crate_open(c, s)
		"otra": _stack_two(c, s)
		"cerrar": _cross(c, s)
		"pared": _wall(c, s)
		"puerta": _door(c, s)


		"ventana": _window_glyph(c, s)
		"material": _swatch(c, s)
		"derribar": _wall_break(c, s)





		"escoba": _broom(c, s)

		"potencia": _bolt(c, s)
		"precision": _target(c, s)
		"efecto": _spin(c, s)
		"vision": _eye(c, s)
		"fisico": _dumbbell(c, s)
		"velocidad": _speed_lines(c, s)
		"aceleracion": _gauge(c, s)
		"regate": _slalom(c, s)
		"penal": _ball_spot(c, s)
		"parado": _freekick(c, s)
		"capitan": _captain(c, s)

		"once": _pitch_eleven(c, s)
		"balon_rol": _ball(c, 0.33 * s)
		"corner": _corner_flag(c, s)
		"tarjeta": _card(c, s)
		"guante": _glove(c, s)


		"flecha_der": _arrow_right(c, s)
		"moneda": _coin(c, s)



		"tarjeta_pago": _pay_card(c, s)
		"moneda_libre": _coin_free(c, s)
		"prestamo": _loan_arrows(c, s)
		"cantera": _sprout(c, s)





		"bota_potencia": _boot_marked(c, s, "bolt")
		"bota_precision": _boot_marked(c, s, "target")
		"bota_efecto": _boot_marked(c, s, "spin")
		"corona": _crown(c, s)
		"lata": _can(c, s)
		"gel": _tube(c, s)
		"capsula": _chamber(c, s)
		"psicologo": _talk_head(c, s)
		"botellin": _sport_bottle(c, s)
		"jeringa": _syringe(c, s)
		"reloj_lujo": _wristwatch(c, s)
		"coche": _car(c, s)
		"piano": _piano(c, s)
		"billar": _billar(c, s)
		"robot_aspirador": _robot_icon(c, s)
		"mesa_holografica": _holo_icon(c, s)
		"alberca_surf": _surf_icon(c, s)
		"canasta_basket": _basket_icon(c, s)
		"reloj_pie": _reloj_pie_icon(c, s)
		"pingpong": _pingpong_icon(c, s)
		"pared_reflejos": _pared_reflejos_icon(c, s)
		"memorama": _memorama_icon(c, s)
		"posadero_loro": _posadero_loro_icon(c, s)
		"dardos": _dardos(c, s)
		"futbolin": _futbolin(c, s)
		"escultura": _escultura(c, s)
		"laurel": _laurel(c, s)
		"acuario": _acuario(c, s)





		"corte_pelo": _haircut(c, s)
		"barba": _beard(c, s)
		"tinte": _dye_bottle(c, s)
		"puntas": _hair_tips(c, s)

		"fisio": _massage(c, s)
		"clinica": _cross_shield(c, s)
		"cruz_medica": _medical_cross(c, s)
		"analista": _clipboard(c, s)
		"contrato_firma": _contrato_firma(c, s)
		"consumible": _flask(c, s)
		"estilo": _gem(c, s)
		"fachada": _fachada(c, s)
		"balon": _ball(c, s * 0.3)
		"reloj": _clock(c, s)

		"controller": _controller(c, s)
		"mando_bt": _mando_bt(c, s)

		"teclado": _teclado(c, s)

		"stick": _stick(c, s)
		"zurdo": _zurdo(c, s)
		"tv": _tv(c, s)
		"party": _party(c, s)
		"plate": _plate(c, s)
		"camera": _camera(c, s)
		"bus": _bus(c, s)
		"dice": _dice(c, s)
		"scissors": _scissors(c, s)
		"smartphone": _smartphone(c, s)
		"magazine": _magazine(c, s)
		"music": _music(c, s)
		"altavoz": _altavoz(c, s)
		"bateria": _bateria(c, s)
		"girar": _girar(c, s)

		"banquillo": _bench(c, s)
		"local": _home(c, s)
		"visita": _plane(c, s)
		"jornada": _calendar(c, s)

		"gol": _goal_net(c, s)
		"asist": _assist(c, s)
		"partido": _pitch(c, s)

		"ritmo_1": _ritmo(c, s, 1)
		"ritmo_2": _ritmo(c, s, 2)
		"ritmo_3": _ritmo(c, s, 3)
		"media": _rating_star(c, s)


		"media_mitad": _rating_star_half(c, s)
		"check": _check(c, s)
		"candado": _lock(c, s)


		"martillo": _martillo(c, s)



		"tapete": _rug_icon(c, s)
		"planta_deco": _plant_icon(c, s)
		"libros": _books_icon(c, s)
		"lampara_pie": _floor_lamp(c, s)
		"asador": _grill(c, s)
		"jacuzzi": _hot_tub(c, s)
		"bano": _bath_icon(c, s)
		"sauna": _sauna_icon(c, s)
		"cama", "cama_penthouse": _bed_icon(c, s)
		"cama_perro": _cama_perro_icon(c, s)
		"rascador_gato": _rascador_gato_icon(c, s)
		"lavanderia": _lavanderia_icon(c, s)
		"recibidor": _recibidor_icon(c, s)
		"vestidor": _vestidor_icon(c, s)
		"telescopio": _telescopio_icon(c, s)



		"cabina_podcast": _cabina_podcast_icon(c, s)
		"tina_hielo": _tina_hielo_icon(c, s)
		"banco_botas": _banco_botas_icon(c, s)
		"toallero": _toallero_icon(c, s)
		"espejo", "espejo_inteligente": _espejo_icon(c, s)
		"mesa_centro": _mesa_centro_icon(c, s)
		"rincon_cafe": _rincon_cafe_icon(c, s)
		"aparador": _aparador_icon(c, s)
		"gallinero": _gallinero_icon(c, s)
		"camilla_fisio", "pizarra_tactica", "bici_estatica", "muro_records", "rincon_lectura", "mesa_recuerdos":
			_hogar_funcional_icon(_type, c, s)
		"colchon_estiramientos", "maquina_respiracion", "vision_board", "vinoteca_saludable", "lampara_sol", "consultorio_nutri":
			_hogar_funcional_icon(_type, c, s)
		"sofa", "sofa_penthouse": _sofa_icon(c, s)
		"mesa", "comedor_penthouse": _table_icon(c, s)
		"cocina": _kitchen_icon(c, s)
		"isla": _isla_icon(c, s)
		"nevera": _nevera_icon(c, s)
		"camiseta": _shirt_icon(c, s)
		"repisa": _shelf_icon(c, s)
		"cine": _cinema(c, s)
		"spa": _spa_hands(c, s)
		"cancha": _training_pitch(c, s)
		"mascota": _dog_icon(c, s)
		"momentos": _frames_icon(c, s)
		"maqueta": _mini_stadium(c, s)
		"arcade": _arcade_icon(c, s)
		"piscina": _pool_icon(c, s)
		"moto": _bike_icon(c, s)





		"cuadro": _cuadro_icon(c, s)
		"banderines": _banderines_icon(c, s)
		"bufanda": _bufanda_icon(c, s)
		"tapiz": _tapiz_icon(c, s)
		"chimenea": _chimenea_icon(c, s)
		"plafon": _plafon_icon(c, s)
		"arana": _arana_icon(c, s)
		"aplique": _aplique_icon(c, s)
		"neon": _neon_icon(c, s)
		"led": _led_icon(c, s)
		"macetero": _macetero_icon(c, s)







		"camastro": _camastro_icon(c, s)
		"sombrilla": _sombrilla_icon(c, s)
		"hamaca": _hamaca_icon(c, s)
		"arbol": _arbol_icon(c, s)
		"farol": _farol_icon(c, s)
		"fogata": _fogata_icon(c, s)
		"columpio": _columpio_icon(c, s)
		"helipuerto": _helipuerto_icon(c, s)
		"carrito": _carrito_icon(c, s)
		"percha": _percha_icon(c, s)
		"maletas": _maletas_icon(c, s)
		"vinoteca": _vinoteca_icon(c, s)
		"tocador": _tocador_icon(c, s)
		"despacho": _despacho_icon(c, s)
		"barbero": _barbero_icon(c, s)
		"balon_urna": _balon_urna_icon(c, s)
		"estatua": _estatua_icon(c, s)
		"vitrina_isla": _vitrina_isla_icon(c, s)





		"ficha": _chip(c, s, true)
		"ficha_vacia": _chip(c, s, false)

		"ajustes": _gear(c, s)
		"menu": _burger(c, s)



		"cono": _cone(c, s)
		"pincel": _brush(c, s)



		"lapiz": _lapiz(c, s)





		"play": _play(c, s)
		"pausa": _pausa(c, s)





		"reiniciar": _spin(c, s)


		"compartir": _share(c, s)



		"viento": _viento(c, s)
		_: _unknown(c, s)




func _person(c: Vector2, s: float) -> void:
	draw_circle(c + Vector2(0.0, -0.2 * s), 0.15 * s, color)

	draw_arc(c + Vector2(0.0, 0.3 * s), 0.28 * s, PI, TAU, 24, color, 0.13 * s)














func _globe(c: Vector2, s: float) -> void:
	var r: float = 0.32 * s
	var lw: float = 0.055 * s
	draw_arc(c, r, 0.0, TAU, 40, color, lw)

	var pts: PackedVector2Array = PackedVector2Array()
	for i in range(25):
		var a: float = TAU * float(i) / 24.0
		pts.append(c + Vector2(cos(a) * r * 0.42, sin(a) * r))
	draw_polyline(pts, _dim(), lw)

	for sy in [-0.42, 0.42]:
		var y: float = c.y + sy * r
		var half: float = sqrt(maxf(r * r -(sy * r) *(sy * r), 0.0))
		draw_line(Vector2(c.x - half, y), Vector2(c.x + half, y), _dim(), lw)



func _mail(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.24 * s
	var r: Rect2 = Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0)
	draw_rect(r, _dim())
	draw_rect(r, color, false, 0.05 * s)
	var lw: float = 0.05 * s
	draw_line(Vector2(c.x - w, c.y - h), Vector2(c.x, c.y + 0.02 * s), color, lw)
	draw_line(Vector2(c.x + w, c.y - h), Vector2(c.x, c.y + 0.02 * s), color, lw)






func _medical_cross(c: Vector2, s: float) -> void:
	var a: float = 0.12 * s
	var b: float = 0.36 * s
	draw_rect(Rect2(c.x - b - 0.04 * s, c.y - b - 0.04 * s,
		(b + 0.04 * s) * 2.0,(b + 0.04 * s) * 2.0), _dim())
	draw_rect(Rect2(c.x - a, c.y - b, a * 2.0, b * 2.0), color)
	draw_rect(Rect2(c.x - b, c.y - a, b * 2.0, a * 2.0), color)



func _medkit(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s
	var h: float = 0.24 * s
	var r: Rect2 = Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0)
	draw_rect(r, _dim())
	draw_rect(r, color, false, 0.05 * s)

	draw_arc(c + Vector2(0.0, - h), 0.1 * s, PI, TAU, 16, color, 0.05 * s)

	var a: float = 0.06 * s
	var b: float = 0.13 * s
	draw_rect(Rect2(c.x - a, c.y - b, a * 2.0, b * 2.0), color)
	draw_rect(Rect2(c.x - b, c.y - a, b * 2.0, a * 2.0), color)


func _document(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s
	var h: float = 0.4 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	for i in 3:
		var y: float = c.y - 0.16 * s + float(i) * 0.16 * s
		draw_line(Vector2(c.x - w * 0.6, y), Vector2(c.x + w * 0.6, y),
			color, 0.05 * s)


func _briefcase(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.24 * s

	draw_arc(c + Vector2(0.0, - h), 0.12 * s, PI, TAU, 16, color, 0.05 * s)
	draw_rect(Rect2(c.x - w, c.y - h * 0.5, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h * 0.5, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_line(Vector2(c.x - w, c.y + h * 0.5), Vector2(c.x + w, c.y + h * 0.5),
		color, 0.05 * s)


func _boot(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.24 * s, c.y - 0.2 * s, 0.18 * s, 0.34 * s), color)
	draw_rect(Rect2(c.x - 0.24 * s, c.y + 0.04 * s, 0.5 * s, 0.14 * s), color)
	draw_circle(c + Vector2(0.26 * s, 0.11 * s), 0.07 * s, color)
	draw_rect(Rect2(c.x - 0.26 * s, c.y + 0.18 * s, 0.56 * s, 0.05 * s), _dim())







func _boot_marked(c: Vector2, s: float, mark: String) -> void:
	_boot(c + Vector2(-0.06 * s, 0.1 * s), s * 0.92)
	var m: Vector2 = c + Vector2(0.27 * s, -0.27 * s)
	var ms: float = s * 0.44
	match mark:
		"bolt": _bolt(m, ms)
		"target": _target(m, ms)
		"spin": _spin(m, ms)




func _crown(c: Vector2, s: float) -> void:
	var top: float = c.y - 0.3 * s
	var mid: float = c.y + 0.06 * s
	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - 0.34 * s, mid), Vector2(c.x - 0.34 * s, top),
		Vector2(c.x - 0.17 * s, mid - 0.14 * s), Vector2(c.x, top - 0.04 * s),
		Vector2(c.x + 0.17 * s, mid - 0.14 * s), Vector2(c.x + 0.34 * s, top),
		Vector2(c.x + 0.34 * s, mid)]), color)
	draw_rect(Rect2(c.x - 0.34 * s, mid, 0.68 * s, 0.16 * s), color)
	for dx in [-0.18, 0.0, 0.18]:
		draw_circle(Vector2(c.x + dx * s, mid + 0.08 * s), 0.04 * s, _dim())



func _can(c: Vector2, s: float) -> void:
	var w: float = 0.24 * s
	var h: float = 0.36 * s



	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, 0.08 * s), color)
	draw_rect(Rect2(c.x - w, c.y + h - 0.07 * s, w * 2.0, 0.07 * s), color)
	_bolt_at(c + Vector2(0.0, 0.03 * s), s * 0.62, color)






func _talk_head(c: Vector2, s: float) -> void:

	draw_circle(c + Vector2(-0.2 * s, 0.16 * s), 0.14 * s, color)
	draw_arc(c + Vector2(-0.2 * s, 0.52 * s), 0.24 * s, PI, TAU, 20, color, 0.11 * s)


	var r: Rect2 = Rect2(c.x - 0.1 * s, c.y - 0.42 * s, 0.52 * s, 0.36 * s)
	draw_rect(r, _dim())
	draw_rect(r, color, false, 0.05 * s)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.1 * s, -0.12 * s), c + Vector2(0.04 * s, -0.06 * s),
		c + Vector2(-0.02 * s, 0.02 * s)]), color)

	draw_rect(Rect2(c.x - 0.02 * s, c.y - 0.33 * s, 0.36 * s, 0.05 * s), color)
	draw_rect(Rect2(c.x - 0.02 * s, c.y - 0.22 * s, 0.24 * s, 0.05 * s), color)






func _sport_bottle(c: Vector2, s: float) -> void:
	var w: float = 0.22 * s
	draw_rect(Rect2(c.x - 0.05 * s, c.y - 0.44 * s, 0.1 * s, 0.09 * s), color)
	draw_rect(Rect2(c.x - 0.09 * s, c.y - 0.35 * s, 0.18 * s, 0.08 * s), color)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.09 * s, -0.27 * s), c + Vector2(0.09 * s, -0.27 * s),
		c + Vector2(w, -0.16 * s), c + Vector2(- w, -0.16 * s)]), color)
	draw_rect(Rect2(c.x - w, c.y - 0.17 * s, w * 2.0, 0.55 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y - 0.17 * s, w * 2.0, 0.55 * s), color, false, 0.05 * s)

	draw_rect(Rect2(c.x - w, c.y + 0.1 * s, w * 2.0, 0.06 * s), color)



func _tube(c: Vector2, s: float) -> void:


	var w: float = 0.15 * s
	draw_rect(Rect2(c.x - 0.07 * s, c.y - 0.4 * s, 0.14 * s, 0.1 * s), color)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.07 * s, -0.3 * s), c + Vector2(0.07 * s, -0.3 * s),
		c + Vector2(w, -0.2 * s), c + Vector2(- w, -0.2 * s)]), color)
	draw_rect(Rect2(c.x - w, c.y - 0.21 * s, w * 2.0, 0.55 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y - 0.21 * s, w * 2.0, 0.55 * s), color, false, 0.05 * s)

	draw_rect(Rect2(c.x - w, c.y + 0.28 * s, w * 2.0, 0.07 * s), color)
	var a: float = 0.04 * s
	var b: float = 0.1 * s
	var cy: float = c.y + 0.02 * s
	draw_rect(Rect2(c.x - a, cy - b, a * 2.0, b * 2.0), color)
	draw_rect(Rect2(c.x - b, cy - a, b * 2.0, a * 2.0), color)





func _syringe(c: Vector2, s: float) -> void:

	var d: Vector2 = Vector2(-0.62, -0.62).normalized()
	var n: Vector2 = Vector2(- d.y, d.x)
	var punta: Vector2 = c + d * 0.42 * s
	var culata: Vector2 = c - d * 0.34 * s
	var w: float = 0.11 * s

	var cuerpo: PackedVector2Array = PackedVector2Array([
		culata + n * w, culata - n * w,
		culata + d * 0.52 * s - n * w, culata + d * 0.52 * s + n * w])
	draw_colored_polygon(cuerpo, _dim())
	draw_polyline(PackedVector2Array([cuerpo[0], cuerpo[1], cuerpo[2], cuerpo[3],
		cuerpo[0]]), color, 0.05 * s)

	draw_line(culata + d * 0.52 * s, punta, color, 0.045 * s)

	draw_line(culata, culata - d * 0.18 * s, color, 0.05 * s)
	draw_line(culata - d * 0.18 * s - n * 0.16 * s,
		culata - d * 0.18 * s + n * 0.16 * s, color, 0.06 * s)

	for k in [0.18, 0.32]:
		var m: Vector2 = culata + d *(k * s)
		draw_line(m + n * w * 0.4, m + n * w, color, 0.035 * s)




func _chamber(c: Vector2, s: float) -> void:
	var w: float = 0.26 * s
	var h: float = 0.22 * s


	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_circle(c + Vector2(- w, 0.0), h, _dim())
	draw_circle(c + Vector2(w, 0.0), h, _dim())
	draw_arc(c + Vector2(- w, 0.0), h, 0.5 * PI, 1.5 * PI, 20, color, 0.05 * s)
	draw_arc(c + Vector2(w, 0.0), h, -0.5 * PI, 0.5 * PI, 20, color, 0.05 * s)
	draw_line(c + Vector2(- w, - h), c + Vector2(w, - h), color, 0.05 * s)
	draw_line(c + Vector2(- w, h), c + Vector2(w, h), color, 0.05 * s)
	draw_circle(c + Vector2(0.04 * s, 0.0), 0.11 * s, color)
	for dx in [-0.16, 0.16]:
		draw_rect(Rect2(c.x + dx * s - 0.035 * s, c.y + h, 0.07 * s, 0.13 * s), color)




func _massage(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.38 * s, c.y + 0.02 * s, 0.76 * s, 0.11 * s), color)
	for dx in [-0.3, 0.3]:
		draw_rect(Rect2(c.x + dx * s - 0.04 * s, c.y + 0.13 * s, 0.08 * s, 0.2 * s), _dim())

	draw_line(c + Vector2(-0.22 * s, -0.06 * s), c + Vector2(0.04 * s, -0.06 * s),
		color, 0.11 * s)
	draw_line(c + Vector2(0.04 * s, -0.06 * s), c + Vector2(0.2 * s, -0.3 * s),
		color, 0.1 * s)
	draw_circle(c + Vector2(0.22 * s, -0.33 * s), 0.07 * s, color)




func _cross_shield(c: Vector2, s: float) -> void:
	var body: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.3 * s, -0.32 * s), c + Vector2(0.3 * s, -0.32 * s),
		c + Vector2(0.3 * s, 0.06 * s), c + Vector2(0.0, 0.36 * s),
		c + Vector2(-0.3 * s, 0.06 * s)])
	draw_colored_polygon(body, _dim())
	var outline: PackedVector2Array = body.duplicate()
	outline.append(body[0])
	draw_polyline(outline, color, 0.05 * s)
	var a: float = 0.055 * s
	var b: float = 0.15 * s
	var cy: float = c.y - 0.04 * s
	draw_rect(Rect2(c.x - a, cy - b, a * 2.0, b * 2.0), color)
	draw_rect(Rect2(c.x - b, cy - a, b * 2.0, a * 2.0), color)



func _clipboard(c: Vector2, s: float) -> void:
	var w: float = 0.28 * s
	var h: float = 0.34 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_rect(Rect2(c.x - 0.11 * s, c.y - h - 0.07 * s, 0.22 * s, 0.1 * s), color)

	draw_circle(c + Vector2(-0.13 * s, 0.12 * s), 0.05 * s, color)
	draw_circle(c + Vector2(0.13 * s, -0.12 * s), 0.05 * s, color)
	draw_line(c + Vector2(-0.1 * s, 0.08 * s), c + Vector2(0.1 * s, -0.08 * s),
		color, 0.04 * s)






func _contrato_firma(c: Vector2, s: float) -> void:
	var w: float = 0.26 * s
	var h: float = 0.34 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)

	for i in 2:
		var y: float = c.y - 0.18 * s + float(i) * 0.13 * s
		draw_line(Vector2(c.x - w * 0.6, y), Vector2(c.x + w * 0.6, y), color, 0.04 * s)

	draw_line(c + Vector2(-0.14 * s, 0.16 * s), c + Vector2(0.1 * s, 0.16 * s),
		color, 0.03 * s)

	draw_line(c + Vector2(0.36 * s, -0.3 * s), c + Vector2(-0.02 * s, 0.14 * s),
		color, 0.08 * s)
	_poly(PackedVector2Array([
		c + Vector2(-0.1 * s, 0.22 * s), c + Vector2(0.02 * s, 0.06 * s),
		c + Vector2(0.06 * s, 0.12 * s)]), color)




func _wristwatch(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.11 * s, c.y - 0.38 * s, 0.22 * s, 0.2 * s), _dim())
	draw_rect(Rect2(c.x - 0.11 * s, c.y + 0.18 * s, 0.22 * s, 0.2 * s), _dim())


	draw_arc(c, 0.24 * s, 0.0, TAU, 32, color, 0.06 * s)
	draw_line(c, c + Vector2(0.0, -0.14 * s), color, 0.05 * s)
	draw_line(c, c + Vector2(0.11 * s, 0.05 * s), color, 0.05 * s)
	draw_circle(c, 0.03 * s, color)




func _car(c: Vector2, s: float) -> void:



	var body: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.4 * s, 0.1 * s), c + Vector2(-0.38 * s, -0.08 * s),
		c + Vector2(-0.16 * s, -0.1 * s), c + Vector2(-0.06 * s, -0.3 * s),
		c + Vector2(0.14 * s, -0.3 * s), c + Vector2(0.24 * s, -0.1 * s),
		c + Vector2(0.4 * s, -0.04 * s), c + Vector2(0.4 * s, 0.1 * s)])
	draw_colored_polygon(body, _dim())
	var outline: PackedVector2Array = body.duplicate()
	outline.append(body[0])
	draw_polyline(outline, color, 0.05 * s)

	draw_line(c + Vector2(-0.16 * s, -0.1 * s), c + Vector2(-0.06 * s, -0.3 * s),
		color, 0.05 * s)
	for dx in [-0.22, 0.22]:
		var p: Vector2 = Vector2(c.x + dx * s, c.y + 0.14 * s)
		draw_circle(p, 0.14 * s, color)
		draw_circle(p, 0.05 * s, Color(color.r, color.g, color.b, color.a * 0.15))































func _haircut(c: Vector2, s: float) -> void:

	var h: Vector2 = c + Vector2(-0.1 * s, 0.06 * s)




	draw_colored_polygon(PackedVector2Array([
		h + Vector2(-0.11 * s, -0.26 * s),
		h + Vector2(-0.17 * s, -0.19 * s),
		h + Vector2(-0.2 * s, -0.1 * s),
		h + Vector2(-0.205 * s, -0.01 * s),
		h + Vector2(-0.245 * s, 0.06 * s),
		h + Vector2(-0.19 * s, 0.1 * s),
		h + Vector2(-0.205 * s, 0.15 * s),
		h + Vector2(-0.17 * s, 0.22 * s),
		h + Vector2(-0.1 * s, 0.28 * s),
		h + Vector2(0.01 * s, 0.3 * s),
		h + Vector2(0.13 * s, 0.26 * s),
		h + Vector2(0.21 * s, 0.16 * s),
		h + Vector2(0.25 * s, 0.02 * s),
		h + Vector2(0.25 * s, -0.1 * s),
		h + Vector2(0.19 * s, -0.22 * s),
		h + Vector2(0.08 * s, -0.28 * s),
		h + Vector2(-0.02 * s, -0.29 * s)]), _dim())
	draw_circle(h + Vector2(-0.13 * s, -0.01 * s), 0.03 * s, color)



	draw_colored_polygon(PackedVector2Array([
		h + Vector2(-0.19 * s, -0.1 * s),
		h + Vector2(-0.25 * s, -0.2 * s),
		h + Vector2(-0.19 * s, -0.34 * s),
		h + Vector2(-0.06 * s, -0.4 * s),
		h + Vector2(0.08 * s, -0.38 * s),
		h + Vector2(0.21 * s, -0.28 * s),
		h + Vector2(0.28 * s, -0.12 * s),
		h + Vector2(0.27 * s, 0.04 * s),

		h + Vector2(0.19 * s, 0.02 * s),
		h + Vector2(0.19 * s, -0.12 * s),
		h + Vector2(0.1 * s, -0.22 * s),
		h + Vector2(-0.02 * s, -0.24 * s),
		h + Vector2(-0.12 * s, -0.19 * s),
		h + Vector2(-0.15 * s, -0.13 * s)]), color)

	_scissors(c + Vector2(0.34 * s, -0.31 * s), s * 0.56)






func _beard(c: Vector2, s: float) -> void:
	var h: Vector2 = c + Vector2(0.0, -0.03 * s)
	_oval(h, 0.25 * s, 0.29 * s, _dim())




	_dome(h + Vector2(0.0, -0.17 * s), 0.255 * s, 0.15 * s, PI, TAU, color)


	draw_circle(h + Vector2(-0.1 * s, -0.05 * s), 0.035 * s, color)
	draw_circle(h + Vector2(0.1 * s, -0.05 * s), 0.035 * s, color)


	draw_colored_polygon(PackedVector2Array([
		h + Vector2(-0.26 * s, -0.03 * s), h + Vector2(-0.29 * s, 0.13 * s),
		h + Vector2(-0.19 * s, 0.34 * s), h + Vector2(0.0, 0.45 * s),
		h + Vector2(0.19 * s, 0.34 * s), h + Vector2(0.29 * s, 0.13 * s),
		h + Vector2(0.26 * s, -0.03 * s),



		h + Vector2(0.21 * s, 0.05 * s), h + Vector2(0.16 * s, 0.11 * s),
		h + Vector2(0.0, 0.14 * s), h + Vector2(-0.16 * s, 0.11 * s),
		h + Vector2(-0.21 * s, 0.05 * s)]), color)

	draw_colored_polygon(PackedVector2Array([
		h + Vector2(-0.15 * s, 0.03 * s), h + Vector2(0.0, -0.005 * s),
		h + Vector2(0.15 * s, 0.03 * s), h + Vector2(0.16 * s, 0.1 * s),
		h + Vector2(0.05 * s, 0.065 * s), h + Vector2(-0.05 * s, 0.065 * s),
		h + Vector2(-0.16 * s, 0.1 * s)]), color)







func _dye_bottle(c: Vector2, s: float) -> void:
	var w: float = 0.2 * s
	var top: float = c.y - 0.06 * s
	var bot: float = c.y + 0.38 * s

	draw_rect(Rect2(c.x - w, top, w * 2.0, bot - top), _dim())


	draw_rect(Rect2(c.x - w + 0.04 * s, c.y + 0.12 * s, w * 2.0 - 0.08 * s,
		bot - c.y - 0.16 * s), color)
	draw_rect(Rect2(c.x - w, top, w * 2.0, bot - top), color, false, 0.05 * s)

	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - w, top), Vector2(c.x + w, top),
		Vector2(c.x + 0.07 * s, c.y - 0.18 * s),
		Vector2(c.x - 0.07 * s, c.y - 0.18 * s)]), color)

	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - 0.07 * s, c.y - 0.18 * s), Vector2(c.x + 0.07 * s, c.y - 0.18 * s),
		Vector2(c.x + 0.025 * s, c.y - 0.4 * s), Vector2(c.x - 0.025 * s, c.y - 0.4 * s)]), color)

	_drop(c + Vector2(0.3 * s, -0.22 * s), 0.1 * s, color)














func _hair_tips(c: Vector2, s: float) -> void:







	var y0: float = -0.28 * s
	_dome(c + Vector2(-0.06 * s, y0), 0.2 * s, 0.13 * s, PI, TAU, _dim())


	_strand(c + Vector2(-0.06 * s, y0), c + Vector2(0.06 * s, 0.42 * s),
		0.105 * s, 0.09 * s, 0.5)
	_strand(c + Vector2(-0.24 * s, y0), c + Vector2(-0.14 * s, 0.3 * s),
		0.065 * s, 0.06 * s, 0.5)
	_strand(c + Vector2(0.12 * s, y0), c + Vector2(0.28 * s, 0.14 * s),
		0.055 * s, 0.07 * s, 0.5)


func _people(c: Vector2, s: float) -> void:
	for dx in [-0.17, 0.17]:
		var p: Vector2 = c + Vector2(dx * s, -0.14 * s)
		draw_circle(p, 0.12 * s, color if dx < 0.0 else _dim())
		draw_arc(p + Vector2(0.0, 0.34 * s), 0.2 * s, PI, TAU, 18,
			color if dx < 0.0 else _dim(), 0.1 * s)


func _cup(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.18 * s, c.y + 0.28 * s, 0.36 * s, 0.07 * s), _dim())
	draw_rect(Rect2(c.x - 0.05 * s, c.y + 0.1 * s, 0.1 * s, 0.2 * s), color)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.22 * s, -0.28 * s), c + Vector2(0.22 * s, -0.28 * s),
		c + Vector2(0.12 * s, 0.1 * s), c + Vector2(-0.12 * s, 0.1 * s)]), color)

	draw_arc(c + Vector2(-0.22 * s, -0.16 * s), 0.12 * s, 0.5 * PI, 1.5 * PI, 16, color, 0.05 * s)
	draw_arc(c + Vector2(0.22 * s, -0.16 * s), 0.12 * s, -0.5 * PI, 0.5 * PI, 16, color, 0.05 * s)















func _league_plate(c: Vector2, s: float) -> void:
	for sx in [-1.0, 1.0]:
		draw_arc(c + Vector2(sx * 0.33 * s, 0.0), 0.11 * s, 0.0, TAU, 20, color,
			maxf(0.05 * s, 2.0))
	_oval(c, 0.3 * s, 0.2 * s, color)
	_oval(c, 0.19 * s, 0.12 * s, _dim())







func _piano(c: Vector2, s: float) -> void:
	_poly(PackedVector2Array([
		c + Vector2(-0.28 * s, -0.3 * s),
		c + Vector2(0.1 * s, -0.3 * s),
		c + Vector2(0.28 * s, -0.02 * s),
		c + Vector2(0.2 * s, 0.16 * s),
		c + Vector2(-0.28 * s, 0.16 * s),
	]), color)
	draw_rect(Rect2(c.x - 0.28 * s, c.y + 0.16 * s, 0.42 * s, 0.14 * s), _dim())
	for i in 6:
		draw_rect(Rect2(c.x - 0.25 * s + 0.075 * s * float(i),
			c.y + 0.16 * s, 0.02 * s, 0.14 * s), color)



func _acuario(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.28 * s, c.y - 0.28 * s, 0.56 * s, 0.34 * s), color)
	draw_rect(Rect2(c.x - 0.23 * s, c.y - 0.23 * s, 0.46 * s, 0.24 * s), _dim())
	draw_circle(Vector2(c.x + 0.02 * s, c.y - 0.11 * s), 0.055 * s, color)
	_poly(PackedVector2Array([
		c + Vector2(-0.03 * s, -0.11 * s), c + Vector2(-0.12 * s, -0.16 * s),
		c + Vector2(-0.12 * s, -0.06 * s)]), color)
	draw_rect(Rect2(c.x - 0.24 * s, c.y + 0.08 * s, 0.48 * s, 0.18 * s), color)



func _billar(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.22 * s, 0.68 * s, 0.44 * s), color)
	draw_rect(Rect2(c.x - 0.28 * s, c.y - 0.16 * s, 0.56 * s, 0.32 * s), _dim())
	for px in [-1.0, 0.0, 1.0]:
		for pz in [-1.0, 1.0]:
			draw_circle(Vector2(c.x + px * 0.28 * s, c.y + pz * 0.18 * s),
				0.05 * s, color)









func _dardos(c: Vector2, s: float) -> void:
	draw_arc(c, 0.32 * s, 0.0, TAU, 28, color, 0.055 * s)
	draw_arc(c, 0.2 * s, 0.0, TAU, 22, _dim(), 0.05 * s)
	draw_circle(c, 0.07 * s, color)


	var punta: Vector2 = c + Vector2(0.13, -0.13) * s
	var cola: Vector2 = c + Vector2(0.42, -0.42) * s
	draw_line(punta, cola, color, 0.05 * s)
	draw_line(cola, cola + Vector2(-0.02, -0.12) * s, color, 0.05 * s)
	draw_line(cola, cola + Vector2(0.12, 0.02) * s, color, 0.05 * s)



func _futbolin(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.32 * s, c.y - 0.22 * s, 0.64 * s, 0.44 * s), color)
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.16 * s, 0.52 * s, 0.32 * s), _dim())
	for bx in [-0.18, -0.06, 0.06, 0.18]:
		draw_rect(Rect2(c.x + bx * s - 0.012 * s, c.y - 0.2 * s,
			0.024 * s, 0.4 * s), color)
		for mz in [-0.08, 0.08]:
			draw_rect(Rect2(c.x + bx * s - 0.03 * s, c.y + mz * s - 0.03 * s,
				0.06 * s, 0.06 * s), color)



func _escultura(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.15 * s, c.y + 0.18 * s, 0.3 * s, 0.12 * s), color)
	draw_rect(Rect2(c.x - 0.09 * s, c.y - 0.06 * s, 0.18 * s, 0.26 * s), color)
	draw_circle(Vector2(c.x, c.y - 0.15 * s), 0.09 * s, color)








func _laurel(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(0.0, 0.03 * s)
	var r: float = 0.31 * s



	var a0: float = PI * 0.5 + 0.14
	var a1: float = - PI * 0.5 + 0.6
	for lado in [-1.0, 1.0]:
		var tallo: PackedVector2Array = PackedVector2Array()
		for i in 13:
			var a: float = lerpf(a0, a1, float(i) / 12.0)
			tallo.append(o + Vector2(cos(a) * lado, sin(a)) * r)
		draw_polyline(tallo, color, maxf(0.045 * s, 1.5))



		for i in 5:
			var a: float = lerpf(a0, a1,(float(i) + 0.75) / 5.4)
			var fuera: Vector2 = Vector2(cos(a), sin(a))
			var sube: Vector2 = Vector2(sin(a), - cos(a))
			var base: Vector2 = fuera * r
			for lado_hoja in [1.0, -1.0]:
				var eje: Vector2 =(sube * cos(0.63) + fuera * sin(0.63) * lado_hoja).normalized()
				var ancho: Vector2 = Vector2(- eje.y, eje.x) * 0.06 * s
				var largo: float =(0.19 if lado_hoja > 0.0 else 0.14) * s
				var hoja: PackedVector2Array = PackedVector2Array([base,
					base + eje * largo * 0.45 + ancho, base + eje * largo,
					base + eje * largo * 0.45 - ancho])
				for k in hoja.size():
					hoja[k] = o + Vector2(hoja[k].x * lado, hoja[k].y)
				draw_colored_polygon(hoja, color)
	_poly(_star(o + Vector2(0.0, -0.02 * s), 0.14 * s, 0.06 * s), color)


func _shelf(c: Vector2, s: float) -> void:
	for y in [-0.02, 0.26]:
		draw_rect(Rect2(c.x - 0.34 * s, c.y + y * s, 0.68 * s, 0.07 * s), color)

	draw_rect(Rect2(c.x - 0.05 * s, c.y - 0.26 * s, 0.1 * s, 0.24 * s), color)
	draw_rect(Rect2(c.x - 0.15 * s, c.y - 0.3 * s, 0.3 * s, 0.07 * s), color)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.25 * s - 0.06 * s, c.y - 0.16 * s,
			0.12 * s, 0.14 * s), _dim())

	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * 0.17 * s - 0.07 * s, c.y + 0.1 * s,
			0.14 * s, 0.16 * s), _dim())






func _check(c: Vector2, s: float) -> void:
	_poly(PackedVector2Array([
		c + Vector2(-0.32 * s, 0.02 * s), c + Vector2(-0.14 * s, -0.14 * s),
		c + Vector2(-0.06 * s, 0.06 * s), c + Vector2(0.24 * s, -0.28 * s),
		c + Vector2(0.34 * s, -0.14 * s), c + Vector2(-0.04 * s, 0.28 * s)]), color)





func _lock(c: Vector2, s: float) -> void:
	draw_arc(c + Vector2(0.0, -0.06 * s), 0.17 * s, PI, TAU, 22, color,
		maxf(0.09 * s, 3.0))
	draw_rect(Rect2(c.x - 0.25 * s, c.y - 0.06 * s, 0.5 * s, 0.36 * s), color)
	draw_circle(c + Vector2(0.0, 0.08 * s), 0.07 * s, _dim())
	draw_rect(Rect2(c.x - 0.026 * s, c.y + 0.08 * s, 0.052 * s, 0.13 * s), _dim())





func _martillo(c: Vector2, s: float) -> void:
	var w: float = maxf(0.09 * s, 3.0)
	var giro: float = deg_to_rad(-35.0)
	var cab: Vector2 = c + Vector2(-0.08 * s, -0.14 * s)
	var eje: Vector2 = Vector2(cos(giro), sin(giro))
	var nor: Vector2 = Vector2(- eje.y, eje.x)

	draw_line(cab, cab + nor * 0.46 * s, color, w)

	var hl: float = 0.22 * s
	var hw: float = 0.1 * s
	_poly(PackedVector2Array([cab - eje * hl - nor * hw, cab + eje * hl - nor * hw,
		cab + eje * hl + nor * hw, cab - eje * hl + nor * hw]), color)
	for k in [-0.55, 0.55]:
		var m: Vector2 = cab + eje * hl * float(k)
		draw_line(m - nor * hw, m + nor * hw, _dim(), maxf(0.04 * s, 2.0))

	draw_rect(Rect2(c.x - 0.4 * s, c.y + 0.24 * s, 0.4 * s, 0.1 * s), color)






func _share(c: Vector2, s: float) -> void:
	var w: float = maxf(0.075 * s, 3.0)
	var top: float = -0.02 * s
	var base: float = 0.34 * s
	var half: float = 0.27 * s
	draw_polyline(PackedVector2Array([
		c + Vector2(-0.1 * s, top), c + Vector2(- half, top),
		c + Vector2(- half, base), c + Vector2(half, base),
		c + Vector2(half, top), c + Vector2(0.1 * s, top)]), color, w)
	draw_line(c + Vector2(0.0, 0.16 * s), c + Vector2(0.0, -0.24 * s), color, w)
	_poly(PackedVector2Array([
		c + Vector2(0.0, -0.4 * s), c + Vector2(0.15 * s, -0.22 * s),
		c + Vector2(-0.15 * s, -0.22 * s)]), color)








func _unknown(c: Vector2, s: float) -> void:
	var w: float = maxf(0.055 * s, 2.0)
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.3 * s, 0.6 * s, w), color)
	draw_rect(Rect2(c.x - 0.3 * s, c.y + 0.3 * s - w, 0.6 * s, w), color)
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.3 * s, w, 0.6 * s), color)
	draw_rect(Rect2(c.x + 0.3 * s - w, c.y - 0.3 * s, w, 0.6 * s), color)
	draw_arc(c + Vector2(0.0, -0.09 * s), 0.1 * s, PI, TAU + 0.35 * PI, 18, color,
		maxf(0.055 * s, 2.0))
	draw_rect(Rect2(c.x - 0.028 * s, c.y - 0.01 * s, 0.056 * s, 0.09 * s), color)
	draw_rect(Rect2(c.x - 0.035 * s, c.y + 0.13 * s, 0.07 * s, 0.06 * s), color)


func _flag(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.2 * s, -0.34 * s), c + Vector2(-0.2 * s, 0.34 * s),
		color, 0.06 * s)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.17 * s, -0.32 * s), c + Vector2(0.3 * s, -0.24 * s),
		c + Vector2(0.3 * s, 0.04 * s), c + Vector2(-0.17 * s, -0.04 * s)]), color)


func _medal(c: Vector2, s: float) -> void:

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.14 * s, -0.34 * s), c + Vector2(-0.02 * s, -0.34 * s),
		c + Vector2(-0.04 * s, 0.02 * s), c + Vector2(-0.16 * s, 0.02 * s)]), _dim())
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.14 * s, -0.34 * s), c + Vector2(0.02 * s, -0.34 * s),
		c + Vector2(0.04 * s, 0.02 * s), c + Vector2(0.16 * s, 0.02 * s)]), _dim())
	var disc: Vector2 = c + Vector2(0.0, 0.14 * s)
	draw_circle(disc, 0.22 * s, color)
	_poly(_star(disc, 0.14 * s, 0.06 * s), _dim())


func _bars(c: Vector2, s: float) -> void:
	var base: float = c.y + 0.3 * s
	var heights: Array[float] = [0.24, 0.4, 0.32, 0.52]
	for i in heights.size():
		var x: float = c.x - 0.3 * s + float(i) * 0.2 * s
		var h: float = heights[i] * s
		draw_rect(Rect2(x, base - h, 0.13 * s, h), color if i % 2 == 0 else _dim())




func _whistle(c: Vector2, s: float) -> void:
	draw_circle(c + Vector2(0.04 * s, 0.06 * s), 0.2 * s, color)
	draw_circle(c + Vector2(0.04 * s, 0.06 * s), 0.07 * s, _dim())
	draw_rect(Rect2(c.x - 0.3 * s, c.y - 0.12 * s, 0.22 * s, 0.14 * s), color)


func _shirt(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.12 * s, -0.3 * s), c + Vector2(0.12 * s, -0.3 * s),
		c + Vector2(0.34 * s, -0.14 * s), c + Vector2(0.24 * s, -0.02 * s),
		c + Vector2(0.16 * s, -0.08 * s), c + Vector2(0.16 * s, 0.32 * s),
		c + Vector2(-0.16 * s, 0.32 * s), c + Vector2(-0.16 * s, -0.08 * s),
		c + Vector2(-0.24 * s, -0.02 * s), c + Vector2(-0.34 * s, -0.14 * s)]), color)

	draw_arc(c + Vector2(0.0, -0.3 * s), 0.12 * s, 0.15 * PI, 0.85 * PI, 14, _dim(), 0.05 * s)


func _crowd(c: Vector2, s: float) -> void:
	var pts: Array = [Vector2(-0.22, -0.02), Vector2(0.0, -0.1), Vector2(0.22, -0.02)]
	for i in pts.size():
		var p: Vector2 = c + pts[i] * s
		draw_circle(p, 0.11 * s, color if i == 1 else _dim())
		draw_arc(p + Vector2(0.0, 0.3 * s), 0.17 * s, PI, TAU, 16,
			color if i == 1 else _dim(), 0.09 * s)


func _mic(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.11 * s, c.y - 0.32 * s, 0.22 * s, 0.34 * s), color)
	draw_circle(c + Vector2(0.0, -0.32 * s), 0.11 * s, color)
	for i in 3:
		var y: float = c.y - 0.24 * s + float(i) * 0.09 * s
		draw_line(Vector2(c.x - 0.08 * s, y), Vector2(c.x + 0.08 * s, y), _dim(), 0.03 * s)
	draw_arc(c + Vector2(0.0, -0.06 * s), 0.2 * s, 0.15 * PI, 0.85 * PI, 18, color, 0.05 * s)
	draw_line(c + Vector2(0.0, 0.14 * s), c + Vector2(0.0, 0.32 * s), color, 0.05 * s)


func _phone(c: Vector2, s: float) -> void:

	draw_arc(c, 0.3 * s, 0.85 * PI, 2.15 * PI, 24, color, 0.1 * s)
	draw_circle(c + Vector2(-0.3 * s, 0.02 * s), 0.1 * s, color)
	draw_circle(c + Vector2(0.3 * s, 0.02 * s), 0.1 * s, color)


func _tag(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.3 * s, -0.28 * s), c + Vector2(0.1 * s, -0.28 * s),
		c + Vector2(0.32 * s, 0.0 * s), c + Vector2(0.1 * s, 0.28 * s),
		c + Vector2(-0.3 * s, 0.28 * s)]), color)
	draw_circle(c + Vector2(-0.18 * s, 0.0), 0.06 * s, _dim())










func _heart(c: Vector2, s: float) -> void:
	var r: float = 0.17 * s
	var top: float = c.y - 0.1 * s
	draw_circle(Vector2(c.x - r * 0.92, top), r, color)
	draw_circle(Vector2(c.x + r * 0.92, top), r, color)
	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - r * 1.84, top), Vector2(c.x + r * 1.84, top),
		Vector2(c.x, c.y + 0.32 * s)]), color)




func _bolt(c: Vector2, s: float) -> void:
	_bolt_at(c, s, color)




func _bolt_at(c: Vector2, s: float, col: Color) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.06 * s, -0.34 * s), c + Vector2(-0.22 * s, 0.06 * s),
		c + Vector2(-0.02 * s, 0.06 * s), c + Vector2(-0.06 * s, 0.34 * s),
		c + Vector2(0.24 * s, -0.08 * s), c + Vector2(0.04 * s, -0.08 * s)]), col)


func _target(c: Vector2, s: float) -> void:
	draw_arc(c, 0.32 * s, 0.0, TAU, 32, color, 0.06 * s)
	draw_arc(c, 0.19 * s, 0.0, TAU, 28, _dim(), 0.06 * s)
	draw_circle(c, 0.07 * s, color)













func _grab(c: Vector2, s: float) -> void:
	var d: float = 0.28 * s
	var l: float = 0.14 * s
	var t: float = 0.075 * s
	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			var p: Vector2 = c + Vector2(d * sx, d * sy)
			draw_line(p, p + Vector2(- l * sx, 0.0), color, t)
			draw_line(p, p + Vector2(0.0, - l * sy), color, t)




func _stack_two(c: Vector2, s: float) -> void:









	var a: float = 0.52 * s
	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.34 * s, a, a), _dim())
	draw_rect(Rect2(c.x - 0.18 * s, c.y - 0.18 * s, a, a), color)






func _crate(c: Vector2, s: float) -> void:
	var w: float = 0.7 * s
	var h: float = 0.54 * s
	var r: Rect2 = Rect2(c.x - w * 0.5, c.y - h * 0.5 + 0.04 * s, w, h)





	draw_rect(r, _dim())
	draw_rect(Rect2(c.x - 0.055 * s, r.position.y, 0.11 * s, h), color)
	draw_rect(Rect2(r.position.x, c.y + 0.04 * s - 0.05 * s, w, 0.1 * s), color)

	draw_rect(Rect2(c.x - w * 0.5 - 0.03 * s, r.position.y - 0.13 * s,
		w + 0.06 * s, 0.13 * s), color)





func _crate_open(c: Vector2, s: float) -> void:
	var w: float = 0.66 * s
	var h: float = 0.44 * s
	draw_rect(Rect2(c.x - w * 0.5, c.y - h * 0.5 + 0.1 * s, w, h), color)

	for sx in [-1.0, 1.0]:
		_poly(PackedVector2Array([
			c + Vector2(sx * w * 0.5, - h * 0.5 + 0.1 * s),
			c + Vector2(sx *(w * 0.5 + 0.16 * s), - h * 0.5 - 0.06 * s),
			c + Vector2(sx *(w * 0.5 + 0.06 * s), - h * 0.5 - 0.16 * s),
			c + Vector2(sx *(w * 0.5 - 0.14 * s), - h * 0.5 + 0.02 * s)]), color)



func _cross(c: Vector2, s: float) -> void:
	var d: float = 0.26 * s
	var t: float = 0.085 * s
	draw_line(c + Vector2(- d, - d), c + Vector2(d, d), color, t)
	draw_line(c + Vector2(- d, d), c + Vector2(d, - d), color, t)





func _fachada(c: Vector2, s: float) -> void:
	var w: float = 0.62 * s
	var h: float = 0.38 * s
	var top: float = c.y - 0.08 * s
	var cuerpo: Rect2 = Rect2(c.x - w * 0.5, top, w, h)
	draw_rect(cuerpo, color)
	var alero: float = 0.08 * s
	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - w * 0.5 - alero, top),
		Vector2(c.x, top - 0.3 * s),
		Vector2(c.x + w * 0.5 + alero, top)]), color)
	var pw: float = 0.16 * s
	draw_rect(Rect2(c.x - pw * 0.5, cuerpo.end.y - 0.22 * s, pw, 0.22 * s), _dim())
	draw_rect(Rect2(c.x - w * 0.5 + 0.08 * s, top + 0.07 * s, 0.12 * s, 0.11 * s), _dim())
	draw_rect(Rect2(c.x + w * 0.5 - 0.2 * s, top + 0.07 * s, 0.12 * s, 0.11 * s), _dim())











func _wall(c: Vector2, s: float) -> void:
	var w: float = 0.66 * s
	var h: float = 0.16 * s
	var g: float = 0.05 * s
	var x0: float = c.x - w * 0.5
	var media: float =(w - g) * 0.5
	for i in 3:
		var y: float = c.y +(-0.25 + 0.25 * float(i)) * s


		if i == 1:
			draw_rect(Rect2(x0, y, media, h), color)
			draw_rect(Rect2(x0 + media + g, y, media, h), color)
		else:
			draw_rect(Rect2(x0, y, w * 0.3, h), color)
			draw_rect(Rect2(x0 + w * 0.3 + g, y, w * 0.7 - g, h), color)





func _door(c: Vector2, s: float) -> void:
	var w: float = 0.46 * s
	var h: float = 0.68 * s
	var r: Rect2 = Rect2(c.x - w * 0.5, c.y - h * 0.5, w, h)



	draw_rect(r, _dim())
	draw_circle(Vector2(r.end.x - 0.11 * s, c.y), 0.075 * s, color)


	draw_rect(r, color, false, 0.07 * s)

	draw_rect(Rect2(c.x - 0.34 * s, r.end.y, 0.68 * s, 0.09 * s), color)




func _swatch(c: Vector2, s: float) -> void:
	var d: float = 0.62 * s
	var r: Rect2 = Rect2(c.x - d * 0.5, c.y - d * 0.5, d, d)

	_poly(PackedVector2Array([r.position, Vector2(r.position.x, r.end.y), r.end]), color)

	draw_rect(r, color, false, 0.085 * s)






func _wall_break(c: Vector2, s: float) -> void:
	var w: float = 0.66 * s
	var h: float = 0.16 * s
	var g: float = 0.05 * s
	var x0: float = c.x - w * 0.5


	var largos: Array[float] = [w * 0.34, w * 0.64, w]
	for i in 3:
		var y: float = c.y +(-0.25 + 0.25 * float(i)) * s
		draw_rect(Rect2(x0, y, largos[i], h), color)

	draw_rect(Rect2(x0 + w * 0.46, c.y - 0.3 * s, 0.1 * s, 0.1 * s), color)
	draw_rect(Rect2(x0 + w * 0.74, c.y - 0.05 * s, 0.09 * s, 0.09 * s), color)


func _spin(c: Vector2, s: float) -> void:
	draw_arc(c, 0.28 * s, -0.4 * PI, 1.25 * PI, 28, color, 0.08 * s)

	var a: float = 1.25 * PI
	var tip: Vector2 = c + Vector2(cos(a), sin(a)) * 0.28 * s
	_poly(PackedVector2Array([tip + Vector2(-0.1 * s, -0.02 * s),
		tip + Vector2(0.06 * s, -0.1 * s), tip + Vector2(0.02 * s, 0.1 * s)]), color)








func _window_glyph(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s
	var h: float = 0.26 * s
	var top: float = c.y - 0.3 * s

	var lw: float = 0.055 * s
	draw_line(Vector2(c.x - w, top), Vector2(c.x + w, top), color, lw)
	draw_line(Vector2(c.x - w, top + h * 2.0), Vector2(c.x + w, top + h * 2.0), color, lw)
	draw_line(Vector2(c.x - w, top), Vector2(c.x - w, top + h * 2.0), color, lw)
	draw_line(Vector2(c.x + w, top), Vector2(c.x + w, top + h * 2.0), color, lw)

	draw_line(Vector2(c.x, top), Vector2(c.x, top + h * 2.0), _dim(), 0.04 * s)
	draw_line(Vector2(c.x - w, top + h), Vector2(c.x + w, top + h), _dim(), 0.04 * s)

	draw_rect(Rect2(c.x - w - 0.06 * s, top + h * 2.0 + 0.02 * s,
		(w + 0.06 * s) * 2.0, 0.06 * s), color)
	draw_rect(Rect2(c.x - w * 0.9, top + h * 2.0 + 0.1 * s,
		w * 1.8, 0.16 * s), _dim())


















func _broom(c: Vector2, s: float) -> void:

	var a: Vector2 = c + Vector2(0.28 * s, -0.34 * s)
	var b: Vector2 = c + Vector2(-0.06 * s, 0.06 * s)
	draw_line(a, b, color, 0.1 * s)


	var perp: Vector2 =(b - a).normalized().orthogonal() * 0.13 * s
	var pie: Vector2 = b +(b - a).normalized() * 0.1 * s
	_poly(PackedVector2Array([b + perp, b - perp, pie - perp, pie + perp]), color)

	var dir: Vector2 =(b - a).normalized()
	var pta: Vector2 = pie + dir * 0.3 * s
	_poly(PackedVector2Array([pie + perp * 0.9, pie - perp * 0.9,
		pta - perp * 1.9, pta + perp * 1.9]),
		Color(color.r, color.g, color.b, color.a * 0.7))


	for k in [-1.0, 0.0, 1.0]:
		var d: Vector2 = pta + perp *(1.6 * k)
		draw_line(d, d + dir * 0.1 * s, color, 0.05 * s)


func _eye(c: Vector2, s: float) -> void:

	draw_arc(c + Vector2(0.0, 0.16 * s), 0.36 * s, 1.15 * PI, 1.85 * PI, 24, color, 0.06 * s)
	draw_arc(c + Vector2(0.0, -0.16 * s), 0.36 * s, 0.15 * PI, 0.85 * PI, 24, color, 0.06 * s)
	draw_circle(c, 0.12 * s, color)
	draw_circle(c, 0.05 * s, _dim())


func _dumbbell(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.1 * s, c.y - 0.06 * s, 0.2 * s, 0.12 * s), color)
	for dx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + dx * 0.28 * s - 0.06 * s, c.y - 0.2 * s, 0.12 * s, 0.4 * s), color)
		draw_rect(Rect2(c.x + dx * 0.16 * s - 0.04 * s, c.y - 0.13 * s, 0.08 * s, 0.26 * s), _dim())





func _speed_lines(c: Vector2, s: float) -> void:
	_ball(c + Vector2(0.2 * s, 0.0), 0.2 * s)


	const TRAIL: Array = [[-0.16, -0.44, 0.06], [0.0, -0.56, 0.07], [0.16, -0.44, 0.06]]
	for t in TRAIL:
		var y: float = c.y + float(t[0]) * s
		var x0: float = c.x + float(t[1]) * s
		var w: float = absf(float(t[1])) * s - 0.16 * s
		draw_rect(Rect2(x0, y - float(t[2]) * 0.5 * s, w, float(t[2]) * s), _dim())





func _gauge(c: Vector2, s: float) -> void:
	var oc: Vector2 = c + Vector2(0.0, 0.14 * s)
	var r: float = 0.34 * s
	draw_arc(oc, r, PI, TAU, 32, color, 0.07 * s)

	for a in [PI, 1.5 * PI, TAU]:
		var dir: Vector2 = Vector2(cos(a), sin(a))
		draw_line(oc + dir * r * 0.82, oc + dir * r, color, 0.05 * s)

	var na: float = 1.78 * PI
	draw_line(oc, oc + Vector2(cos(na), sin(na)) * r * 0.86, color, 0.06 * s)
	draw_circle(oc, 0.06 * s, color)





func _slalom(c: Vector2, s: float) -> void:

	var pts: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.34 * s, 0.22 * s), c + Vector2(-0.12 * s, -0.1 * s),
		c + Vector2(0.1 * s, 0.22 * s), c + Vector2(0.3 * s, -0.14 * s)])
	draw_polyline(pts, _dim(), 0.055 * s)

	_ball(c + Vector2(0.3 * s, -0.14 * s), 0.16 * s)

	_poly(PackedVector2Array([
		c + Vector2(-0.02 * s, 0.34 * s), c + Vector2(0.1 * s, 0.34 * s),
		c + Vector2(0.04 * s, 0.16 * s)]), color)




















func _ball(center: Vector2, r: float) -> void:
	draw_circle(center, r, color)



	var pent: PackedVector2Array = _ngon(center, r * 0.34, 5, - PI * 0.5)
	_poly(pent, BALL_INK)
	var w: float = maxf(r * 0.12, 1.0)
	for p in pent:
		var dir: Vector2 =(p - center).normalized()
		draw_line(center + dir *(r * 0.3), center + dir * r, BALL_INK, w)


func _ball_spot(c: Vector2, s: float) -> void:
	_ball(c + Vector2(0.0, -0.06 * s), 0.22 * s)
	draw_circle(c + Vector2(0.0, 0.3 * s), 0.05 * s, color)





func _captain(c: Vector2, s: float) -> void:

	draw_circle(c, 0.4 * s, _dim())

	draw_arc(c, 0.22 * s, 0.3 * PI, 1.7 * PI, 32, color, 0.16 * s)




















func _pitch_eleven(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s
	var h: float = 0.38 * s
	var caja: Rect2 = Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0)
	draw_rect(caja, _dim())
	draw_rect(caja, color, false, 0.07 * s)
	draw_line(Vector2(c.x - w, c.y), Vector2(c.x + w, c.y), color, 0.07 * s)
	draw_arc(c, 0.14 * s, 0.0, TAU, 18, color, 0.07 * s)




func _corner_flag(c: Vector2, s: float) -> void:
	var top: Vector2 = c + Vector2(-0.12 * s, -0.34 * s)
	var bot: Vector2 = c + Vector2(-0.12 * s, 0.34 * s)
	draw_line(top, bot, color, 0.07 * s)
	draw_colored_polygon(PackedVector2Array([
		top + Vector2(0.02 * s, 0.0),
		top + Vector2(0.36 * s, 0.11 * s),
		top + Vector2(0.02 * s, 0.24 * s)]), color)
	draw_arc(bot, 0.16 * s, -0.5 * PI, 0.0, 14, _dim(), 0.06 * s)


func _freekick(c: Vector2, s: float) -> void:
	_ball(c + Vector2(-0.16 * s, 0.14 * s), 0.16 * s)

	for i in 3:
		var x: float = c.x + 0.04 * s + float(i) * 0.12 * s
		draw_rect(Rect2(x, c.y - 0.26 * s, 0.08 * s, 0.42 * s), _dim())

	draw_arc(c + Vector2(0.06 * s, 0.1 * s), 0.3 * s, 1.2 * PI, 1.9 * PI, 20, color, 0.04 * s)




func _flask(c: Vector2, s: float) -> void:

	draw_rect(Rect2(c.x - 0.07 * s, c.y - 0.32 * s, 0.14 * s, 0.16 * s), color)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.07 * s, -0.18 * s), c + Vector2(0.07 * s, -0.18 * s),
		c + Vector2(0.28 * s, 0.3 * s), c + Vector2(-0.28 * s, 0.3 * s)]), color)

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.16 * s, 0.08 * s), c + Vector2(0.16 * s, 0.08 * s),
		c + Vector2(0.28 * s, 0.3 * s), c + Vector2(-0.28 * s, 0.3 * s)]), _dim())


func _gem(c: Vector2, s: float) -> void:
	var top: float = -0.1 * s
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.3 * s, top), c + Vector2(-0.16 * s, -0.28 * s),
		c + Vector2(0.16 * s, -0.28 * s), c + Vector2(0.3 * s, top),
		c + Vector2(0.0, 0.32 * s)]), color)

	draw_line(c + Vector2(-0.3 * s, top), c + Vector2(0.0, top), _dim(), 0.04 * s)
	draw_line(c + Vector2(0.3 * s, top), c + Vector2(0.0, top), _dim(), 0.04 * s)
	draw_line(c + Vector2(0.0, top), c + Vector2(0.0, 0.32 * s), _dim(), 0.04 * s)














func _glove(c: Vector2, s: float) -> void:




	var w: float = 0.24 * s
	var dedo: float = 0.115 * s
	var palma_h: float = 0.3 * s
	var palma_top: float = c.y - 0.06 * s


	draw_rect(Rect2(c.x - w, palma_top, w * 2.0, palma_h), color)
	draw_circle(Vector2(c.x, palma_top + palma_h), w, color)


	var largos: Array[float] = [0.2, 0.28, 0.25, 0.17]
	for i in 4:
		var x: float = c.x - w + dedo * 0.62 + float(i) *(dedo * 1.18)
		var alto: float = largos[i] * s
		var top: float = palma_top - alto
		draw_rect(Rect2(x - dedo * 0.5, top, dedo, alto + dedo), color)
		draw_circle(Vector2(x, top + dedo * 0.5), dedo * 0.5, color)

	var pl: Vector2 = Vector2(c.x - w - dedo * 0.15, palma_top + palma_h * 0.42)
	draw_circle(pl, dedo * 0.72, color)
	draw_circle(pl + Vector2(- dedo * 0.3, - dedo * 1.15), dedo * 0.64, color)
	draw_circle(pl + Vector2(- dedo * 0.1, - dedo * 0.55), dedo * 0.7, color)


func _card(c: Vector2, s: float) -> void:
	var w: float = 0.22 * s
	var h: float = 0.34 * s
	var pts: PackedVector2Array = PackedVector2Array([
		c + Vector2(- w, - h), c + Vector2(w, - h),
		c + Vector2(w, h), c + Vector2(- w, h)])

	var rot: float = 0.18
	for i in pts.size():
		var d: Vector2 = pts[i] - c
		pts[i] = c + d.rotated(rot)
	draw_colored_polygon(pts, color)










func _chip(c: Vector2, s: float, llena: bool) -> void:
	var r: float = 0.32 * s
	draw_arc(c, r * 0.86, 0.0, TAU, 32, color, 0.1 * s)

	var m: float = 0.075 * s
	for k in 4:
		var a: float = float(k) * TAU / 4.0 + PI * 0.25
		var p: Vector2 = c + Vector2(cos(a), sin(a)) *(r * 0.86)
		draw_rect(Rect2(p.x - m, p.y - m, m * 2.0, m * 2.0), color)
	if llena:
		draw_circle(c, r * 0.44, color)
	else:
		draw_arc(c, r * 0.42, 0.0, TAU, 24, _dim(), 0.055 * s)


func _clock(c: Vector2, s: float) -> void:
	draw_arc(c, 0.3 * s, 0.0, TAU, 32, color, 0.06 * s)
	draw_line(c, c + Vector2(0.0, -0.18 * s), color, 0.05 * s)
	draw_line(c, c + Vector2(0.14 * s, 0.06 * s), color, 0.05 * s)












func _stick(c: Vector2, s: float) -> void:
	draw_circle(c, 0.36 * s, _dim())
	draw_arc(c, 0.36 * s, 0.0, TAU, 32, color, 0.06 * s)
	draw_circle(c + Vector2(0.0, -0.1 * s), 0.16 * s, color)




func _zurdo(c: Vector2, s: float) -> void:
	var b: Vector2 = c + Vector2(0.0, 0.14 * s)
	draw_circle(b, 0.25 * s, _dim())
	draw_arc(b, 0.25 * s, 0.0, TAU, 28, color, 0.05 * s)
	draw_circle(b, 0.11 * s, color)
	var y: float = c.y - 0.3 * s
	var a: float = 0.36 * s
	var g: float = 0.06 * s
	draw_line(Vector2(c.x - a + g * 2.0, y), Vector2(c.x + a - g * 2.0, y), color, g)
	for lado in [-1.0, 1.0]:
		var punta: Vector2 = Vector2(c.x + a * lado, y)
		draw_colored_polygon(PackedVector2Array([punta,
			punta + Vector2(-0.14 * s * lado, -0.1 * s),
			punta + Vector2(-0.14 * s * lado, 0.1 * s)]), color)


func _controller(c: Vector2, s: float) -> void:
	var w: float = 0.24 * s
	var h: float = 0.13 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color)
	draw_circle(c + Vector2(- w, 0.02 * s), h * 1.1, color)
	draw_circle(c + Vector2(w, 0.02 * s), h * 1.1, color)

	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.02 * s, 0.12 * s, 0.04 * s), _dim())
	draw_rect(Rect2(c.x - 0.16 * s, c.y - 0.06 * s, 0.04 * s, 0.12 * s), _dim())
	draw_circle(c + Vector2(0.14 * s, -0.03 * s), 0.03 * s, _dim())
	draw_circle(c + Vector2(0.2 * s, 0.03 * s), 0.03 * s, _dim())





func _mando_bt(c: Vector2, s: float) -> void:
	_controller(c + Vector2(0.0, 0.12 * s), s)
	var o: Vector2 = c + Vector2(0.0, -0.02 * s)
	draw_arc(o, 0.16 * s, - PI * 0.78, - PI * 0.22, 12, color, 0.05 * s)
	draw_arc(o, 0.28 * s, - PI * 0.75, - PI * 0.25, 16, color, 0.05 * s)




func _teclado(c: Vector2, s: float) -> void:
	var k: float = s / 44.0
	draw_rect(Rect2(c.x - 20.0 * k, c.y - 12.0 * k, 40.0 * k, 24.0 * k), color, false, 3.5 * k)
	for fila in [-5.0, 1.0]:
		for x in [-14.0, -6.0, 2.0, 10.0]:
			draw_line(c + Vector2(x * k, fila * k), c + Vector2((x + 4.0) * k, fila * k),
				color, 3.0 * k)
	draw_line(c + Vector2(-9.0 * k, 7.0 * k), c + Vector2(9.0 * k, 7.0 * k), color, 3.0 * k)



func _tv(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s
	var h: float = 0.22 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_line(c + Vector2(-0.12 * s, h), c + Vector2(-0.2 * s, h + 0.1 * s), color, 0.05 * s)
	draw_line(c + Vector2(0.12 * s, h), c + Vector2(0.2 * s, h + 0.1 * s), color, 0.05 * s)



func _party(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.2 * s, -0.28 * s), c + Vector2(0.2 * s, -0.28 * s),
		c + Vector2(0.0, 0.04 * s)]), color)
	draw_line(c + Vector2(0.0, 0.04 * s), c + Vector2(0.0, 0.26 * s), color, 0.05 * s)
	draw_line(c + Vector2(-0.14 * s, 0.28 * s), c + Vector2(0.14 * s, 0.28 * s), color, 0.05 * s)
	draw_circle(c + Vector2(0.22 * s, -0.32 * s), 0.04 * s, _dim())



func _plate(c: Vector2, s: float) -> void:
	draw_arc(c, 0.24 * s, 0.0, TAU, 28, color, 0.05 * s)
	draw_circle(c, 0.09 * s, _dim())
	draw_line(c + Vector2(-0.34 * s, -0.18 * s), c + Vector2(-0.34 * s, 0.2 * s), color, 0.04 * s)
	draw_line(c + Vector2(0.34 * s, -0.18 * s), c + Vector2(0.34 * s, 0.2 * s), color, 0.05 * s)



func _camera(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s
	var h: float = 0.22 * s
	draw_rect(Rect2(c.x - 0.12 * s, c.y - h - 0.08 * s, 0.18 * s, 0.09 * s), color)
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color)
	draw_circle(c, 0.12 * s, _dim())
	draw_circle(c, 0.06 * s, color)
	draw_circle(c + Vector2(0.2 * s, -0.12 * s), 0.03 * s, _dim())



func _bus(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.2 * s
	var bot: float = c.y + 0.18 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, 0.38 * s), color)
	for i in 3:
		var x: float = c.x - 0.24 * s + float(i) * 0.18 * s
		draw_rect(Rect2(x, c.y - 0.13 * s, 0.12 * s, 0.1 * s), _dim())
	draw_circle(Vector2(c.x - 0.18 * s, bot), 0.06 * s, color)
	draw_circle(Vector2(c.x + 0.18 * s, bot), 0.06 * s, color)



func _dice(c: Vector2, s: float) -> void:
	var r: float = 0.28 * s
	draw_rect(Rect2(c.x - r, c.y - r, r * 2.0, r * 2.0), color)



	var punto: Color = CareerTheme.on_color(color)
	punto.a *= color.a
	for p in [Vector2(-0.15, -0.15), Vector2(0.15, -0.15), Vector2(0.0, 0.0),
			Vector2(-0.15, 0.15), Vector2(0.15, 0.15)]:
		draw_circle(c + p * s, 0.035 * s, punto)



func _scissors(c: Vector2, s: float) -> void:
	draw_arc(c + Vector2(-0.14 * s, 0.2 * s), 0.08 * s, 0.0, TAU, 16, color, 0.04 * s)
	draw_arc(c + Vector2(0.14 * s, 0.2 * s), 0.08 * s, 0.0, TAU, 16, color, 0.04 * s)
	draw_line(c + Vector2(-0.1 * s, 0.14 * s), c + Vector2(0.18 * s, -0.26 * s), color, 0.05 * s)
	draw_line(c + Vector2(0.1 * s, 0.14 * s), c + Vector2(-0.18 * s, -0.26 * s), color, 0.05 * s)
	draw_circle(c + Vector2(0.0, 0.02 * s), 0.03 * s, color)




func _smartphone(c: Vector2, s: float) -> void:
	var w: float = 0.18 * s
	var h: float = 0.32 * s


	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.06 * s)
	draw_rect(Rect2(c.x - w * 0.72, c.y - h * 0.72, w * 1.44, h * 1.4), _dim())
	draw_line(c + Vector2(-0.03 * s, - h * 0.86), c + Vector2(0.03 * s, - h * 0.86), color, 0.03 * s)
	draw_circle(c + Vector2(0.0, h * 0.84), 0.028 * s, color)

	var hc: Vector2 = c + Vector2(0.0, -0.03 * s)
	draw_circle(hc + Vector2(-0.045 * s, -0.02 * s), 0.045 * s, color)
	draw_circle(hc + Vector2(0.045 * s, -0.02 * s), 0.045 * s, color)
	draw_colored_polygon(PackedVector2Array([
		hc + Vector2(-0.085 * s, 0.0), hc + Vector2(0.085 * s, 0.0),
		hc + Vector2(0.0, 0.1 * s)]), color)



func _magazine(c: Vector2, s: float) -> void:
	var w: float = 0.26 * s
	var h: float = 0.34 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, 0.12 * s), color)
	draw_rect(Rect2(c.x - 0.12 * s, c.y - 0.08 * s, 0.24 * s, 0.2 * s), color)
	draw_line(c + Vector2(-0.14 * s, 0.22 * s), c + Vector2(0.14 * s, 0.22 * s), color, 0.03 * s)
	draw_line(c + Vector2(-0.14 * s, 0.28 * s), c + Vector2(0.05 * s, 0.28 * s), color, 0.03 * s)



func _music(c: Vector2, s: float) -> void:
	draw_circle(c + Vector2(-0.06 * s, 0.2 * s), 0.1 * s, color)
	draw_line(c + Vector2(0.04 * s, 0.2 * s), c + Vector2(0.04 * s, -0.28 * s), color, 0.05 * s)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.04 * s, -0.28 * s), c + Vector2(0.22 * s, -0.18 * s),
		c + Vector2(0.22 * s, -0.04 * s), c + Vector2(0.04 * s, -0.14 * s)]), color)





func _altavoz(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(-0.08 * s, 0.0)
	draw_rect(Rect2(o.x - 0.22 * s, o.y - 0.1 * s, 0.13 * s, 0.2 * s), color)
	draw_colored_polygon(PackedVector2Array([
		o + Vector2(-0.1 * s, -0.1 * s), o + Vector2(0.08 * s, -0.27 * s),
		o + Vector2(0.08 * s, 0.27 * s), o + Vector2(-0.1 * s, 0.1 * s)]), color)
	draw_arc(o + Vector2(0.1 * s, 0.0), 0.13 * s, - PI * 0.32, PI * 0.32, 10, color, 0.05 * s)
	draw_arc(o + Vector2(0.1 * s, 0.0), 0.25 * s, - PI * 0.32, PI * 0.32, 14, _dim(), 0.05 * s)




func _bateria(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(-0.03 * s, 0.0)
	var w: float = 0.3 * s
	var h: float = 0.17 * s
	var t: float = 0.06 * s
	draw_rect(Rect2(o.x - w, o.y - h, w * 2.0, h * 2.0), color, false, t)
	draw_rect(Rect2(o.x + w + t * 0.5, o.y - 0.07 * s, 0.06 * s, 0.14 * s), color)
	draw_rect(Rect2(o.x - w + t * 1.2, o.y - h + t * 1.2, w - t * 1.2,
		(h - t * 1.2) * 2.0), color)









func _girar(c: Vector2, s: float) -> void:
	var o: Vector2 = c + Vector2(-0.1 * s, 0.15 * s)
	var w: float = 0.34 * s
	var h: float = 0.21 * s
	draw_rect(Rect2(o.x - w, o.y - h, w * 2.0, h * 2.0), color)
	draw_rect(Rect2(o.x - w * 0.8, o.y - h * 0.62, w * 1.6, h * 1.24), _dim())


	var ac: Vector2 = c + Vector2(0.0, 0.08 * s)
	var r: float = 0.38 * s
	var fin_a: float = PI * 1.97
	draw_arc(ac, r, PI * 1.28, fin_a, 16, color, 0.08 * s)
	var fin: Vector2 = ac + Vector2(cos(fin_a), sin(fin_a)) * r
	var tg: Vector2 = Vector2(- sin(fin_a), cos(fin_a))
	var nr: Vector2 = Vector2(cos(fin_a), sin(fin_a))
	draw_colored_polygon(PackedVector2Array([fin + tg * 0.15 * s, fin + nr * 0.11 * s,
		fin - nr * 0.11 * s]), color)





func _bench(c: Vector2, s: float) -> void:

	draw_line(c + Vector2(-0.26 * s, -0.02 * s), c + Vector2(-0.26 * s, 0.28 * s), color, 0.06 * s)
	draw_line(c + Vector2(0.26 * s, -0.02 * s), c + Vector2(0.26 * s, 0.28 * s), color, 0.06 * s)

	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.06 * s, 0.68 * s, 0.1 * s), color)

	draw_rect(Rect2(c.x - 0.34 * s, c.y - 0.26 * s, 0.68 * s, 0.08 * s), color)
	draw_line(c + Vector2(-0.22 * s, -0.06 * s), c + Vector2(-0.22 * s, -0.2 * s), color, 0.05 * s)
	draw_line(c + Vector2(0.22 * s, -0.06 * s), c + Vector2(0.22 * s, -0.2 * s), color, 0.05 * s)



func _home(c: Vector2, s: float) -> void:

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.34 * s, -0.02 * s), c + Vector2(0.0, -0.3 * s),
		c + Vector2(0.34 * s, -0.02 * s)]), color)

	draw_rect(Rect2(c.x - 0.24 * s, c.y - 0.02 * s, 0.48 * s, 0.3 * s), color)

	draw_rect(Rect2(c.x - 0.07 * s, c.y + 0.1 * s, 0.14 * s, 0.18 * s), _dim())



func _plane(c: Vector2, s: float) -> void:

	draw_line(c + Vector2(-0.28 * s, 0.2 * s), c + Vector2(0.3 * s, -0.24 * s), color, 0.1 * s)

	draw_line(c + Vector2(-0.06 * s, -0.02 * s), c + Vector2(-0.24 * s, -0.18 * s), color, 0.06 * s)
	draw_line(c + Vector2(0.04 * s, 0.1 * s), c + Vector2(-0.14 * s, 0.24 * s), color, 0.06 * s)

	draw_line(c + Vector2(-0.26 * s, 0.16 * s), c + Vector2(-0.32 * s, 0.02 * s), color, 0.05 * s)



func _calendar(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s
	var top: float = c.y - 0.24 * s
	var h: float = 0.5 * s
	draw_rect(Rect2(c.x - w, top, w * 2.0, h), _dim())
	draw_rect(Rect2(c.x - w, top, w * 2.0, h), color, false, 0.05 * s)

	draw_rect(Rect2(c.x - w, top, w * 2.0, 0.13 * s), color)

	draw_line(c + Vector2(-0.16 * s, top - c.y - 0.06 * s), c + Vector2(-0.16 * s, top - c.y + 0.05 * s), color, 0.05 * s)
	draw_line(c + Vector2(0.16 * s, top - c.y - 0.06 * s), c + Vector2(0.16 * s, top - c.y + 0.05 * s), color, 0.05 * s)

	for gy in 2:
		for gx in 3:
			var p: Vector2 = Vector2(c.x - 0.15 * s + float(gx) * 0.15 * s,
				c.y + 0.02 * s + float(gy) * 0.14 * s)
			draw_circle(p, 0.03 * s, color)


















func _goal_net(c: Vector2, s: float) -> void:
	var w: float = 0.36 * s
	var top: float = c.y - 0.3 * s
	var h: float = 0.4 * s
	var bot: float = top + h

	draw_line(Vector2(c.x - 0.12 * s, top), Vector2(c.x - 0.12 * s, bot), _dim(), 0.03 * s)
	draw_line(Vector2(c.x + 0.12 * s, top), Vector2(c.x + 0.12 * s, bot), _dim(), 0.03 * s)
	draw_line(Vector2(c.x - w, c.y - 0.1 * s), Vector2(c.x + w, c.y - 0.1 * s),
		_dim(), 0.03 * s)

	draw_line(Vector2(c.x - w, top), Vector2(c.x + w, top), color, 0.075 * s)
	draw_line(Vector2(c.x - w, top), Vector2(c.x - w, bot), color, 0.075 * s)
	draw_line(Vector2(c.x + w, top), Vector2(c.x + w, bot), color, 0.075 * s)

	_ball(Vector2(c.x, bot), 0.16 * s)








func _assist(c: Vector2, s: float) -> void:
	_ball(c + Vector2(-0.26 * s, 0.0), 0.17 * s)
	draw_line(c + Vector2(-0.04 * s, 0.0), c + Vector2(0.2 * s, 0.0), color, 0.09 * s)
	_poly(PackedVector2Array([
		c + Vector2(0.13 * s, -0.2 * s), c + Vector2(0.42 * s, 0.0),
		c + Vector2(0.13 * s, 0.2 * s)]), color)



func _pitch(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.26 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.04 * s)
	draw_line(Vector2(c.x, c.y - h), Vector2(c.x, c.y + h), color, 0.03 * s)
	draw_arc(c, 0.1 * s, 0.0, TAU, 20, color, 0.03 * s)















func _ritmo(c: Vector2, s: float, nivel: int) -> void:
	var base: float = c.y + 0.28 * s
	var alturas: Array[float] = [0.22, 0.38, 0.54]
	for i in alturas.size():
		var x: float = c.x - 0.3 * s + float(i) * 0.22 * s
		var h: float = alturas[i] * s
		draw_rect(Rect2(x, base - h, 0.16 * s, h),
			color if i < nivel else _dim())



func _rating_star(c: Vector2, s: float) -> void:
	_poly(_star(c, 0.32 * s, 0.14 * s), color)









func _rating_star_half(c: Vector2, s: float) -> void:
	var p: PackedVector2Array = _star(c, 0.32 * s, 0.14 * s)
	_poly(PackedVector2Array([p[5], p[6], p[7], p[8], p[9], p[0]]), color)









func _gear(c: Vector2, s: float) -> void:
	var r: float = 0.3 * s
	var tooth: float = 0.13 * s
	for i in 6:
		var a: float = float(i) / 6.0 * TAU
		var dir: Vector2 = Vector2(cos(a), sin(a))
		var perp: Vector2 = Vector2(- dir.y, dir.x) * tooth * 0.5
		var base: Vector2 = c + dir * r * 0.86
		var tip: Vector2 = c + dir *(r + tooth * 0.62)
		_poly(PackedVector2Array([base - perp, base + perp,
			tip + perp * 0.72, tip - perp * 0.72]), color)
	draw_arc(c, r * 0.74, 0.0, TAU, 28, color, 0.11 * s)
	draw_circle(c, r * 0.3, _dim())










func _cone(c: Vector2, s: float) -> void:

	_poly(PackedVector2Array([
		c + Vector2(-0.07 * s, -0.32 * s), c + Vector2(0.07 * s, -0.32 * s),
		c + Vector2(0.15 * s, -0.06 * s), c + Vector2(-0.15 * s, -0.06 * s)]), color)

	_poly(PackedVector2Array([
		c + Vector2(-0.19 * s, 0.06 * s), c + Vector2(0.19 * s, 0.06 * s),
		c + Vector2(0.26 * s, 0.24 * s), c + Vector2(-0.26 * s, 0.24 * s)]), color)

	draw_rect(Rect2(c + Vector2(-0.34 * s, 0.24 * s), Vector2(0.68 * s, 0.09 * s)), color)






func _brush(c: Vector2, s: float) -> void:
	var dir: Vector2 = Vector2(0.7071, -0.7071)
	var per: Vector2 = Vector2(0.7071, 0.7071)
	var punta: Vector2 = c - dir * 0.36 * s
	var cerdas: Vector2 = c - dir * 0.15 * s
	var virola_a: Vector2 = c - dir * 0.1 * s
	var virola_b: Vector2 = c + dir * 0.01 * s
	var cabo: Vector2 = c + dir * 0.36 * s
	_poly(PackedVector2Array([
		punta, cerdas + per * 0.115 * s, cerdas - per * 0.115 * s]), color)
	_poly(PackedVector2Array([
		virola_a + per * 0.1 * s, virola_b + per * 0.1 * s,
		virola_b - per * 0.1 * s, virola_a - per * 0.1 * s]), color)
	_poly(PackedVector2Array([
		virola_b + per * 0.072 * s, cabo + per * 0.042 * s,
		cabo - per * 0.042 * s, virola_b - per * 0.072 * s]), color)




func _lapiz(c: Vector2, s: float) -> void:
	var dir: Vector2 = Vector2(0.7071, -0.7071)
	var per: Vector2 = Vector2(0.7071, 0.7071)
	var w: float = 0.11 * s
	var punta: Vector2 = c - dir * 0.38 * s
	var mina: Vector2 = c - dir * 0.3 * s
	var base_punta: Vector2 = c - dir * 0.17 * s
	var cuerpo_a: Vector2 = c - dir * 0.13 * s
	var cuerpo_b: Vector2 = c + dir * 0.22 * s
	var goma_a: Vector2 = c + dir * 0.26 * s
	var goma_b: Vector2 = c + dir * 0.38 * s
	_poly(PackedVector2Array([punta, mina + per * w * 0.38, mina - per * w * 0.38]), color)
	var m2: Vector2 = mina + dir * 0.03 * s
	_poly(PackedVector2Array([m2 + per * w * 0.48, base_punta + per * w,
		base_punta - per * w, m2 - per * w * 0.48]), color)
	_poly(PackedVector2Array([cuerpo_a + per * w, cuerpo_b + per * w,
		cuerpo_b - per * w, cuerpo_a - per * w]), color)
	_poly(PackedVector2Array([goma_a + per * w, goma_b + per * w,
		goma_b - per * w, goma_a - per * w]), color)

func _pausa(c: Vector2, s: float) -> void:
	for lado: float in [-1.0, 1.0]:
		draw_rect(Rect2(c + Vector2(lado * s * 0.18 - s * 0.065, - s * 0.3), Vector2(s * 0.13, s * 0.6)), color)










func _play(c: Vector2, s: float) -> void:
	var r: float = 0.32 * s
	var o: Vector2 = c + Vector2(0.04 * s, 0.0)
	_poly(PackedVector2Array([
		o + Vector2(r, 0.0),
		o + Vector2(- r * 0.62, - r * 0.92),
		o + Vector2(- r * 0.62, r * 0.92)]), color)


func _burger(c: Vector2, s: float) -> void:
	var half: float = 0.3 * s
	var lw: float = 0.11 * s
	for dy in [-0.19, 0.0, 0.19]:
		var y: float = c.y + dy * s
		draw_line(Vector2(c.x - half, y), Vector2(c.x + half, y), color, lw)


func _poly(points: PackedVector2Array, col: Color) -> void:
	draw_colored_polygon(points, col)


func _ngon(center: Vector2, r: float, n: int, start: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in n:
		var a: float = start + float(i) / float(n) * TAU
		pts.append(center + Vector2(cos(a), sin(a)) * r)
	return pts




func _oval(center: Vector2, rx: float, ry: float, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 28:
		var a: float = float(i) / 28.0 * TAU
		pts.append(center + Vector2(cos(a) * rx, sin(a) * ry))
	draw_colored_polygon(pts, col)





func _dome(center: Vector2, rx: float, ry: float, a0: float, a1: float, col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 17:
		var a: float = a0 +(a1 - a0) * float(i) / 16.0
		pts.append(center + Vector2(cos(a) * rx, sin(a) * ry))
	pts.append(center)
	draw_colored_polygon(pts, col)






func _strand(top: Vector2, tip: Vector2, w0: float, bend: float, cut: float) -> void:
	var n: int = 12
	var ctrl: Vector2 = top.lerp(tip, 0.5) + Vector2(bend, 0.0)
	var izq: PackedVector2Array = PackedVector2Array()
	var der: PackedVector2Array = PackedVector2Array()
	var k: int = int(round(cut * float(n)))
	for i in n + 1:
		var t: float = float(i) / float(n)
		var u: float = 1.0 - t

		var p: Vector2 = top *(u * u) + ctrl *(2.0 * u * t) + tip *(t * t)




		var hw: float = w0 *(0.2 + 0.8 * u)
		izq.append(p + Vector2(- hw, 0.0))
		der.append(p + Vector2(hw, 0.0))
	_ribbon(izq, der, 0, n, _dim())
	_ribbon(izq, der, k, n, color)



func _ribbon(izq: PackedVector2Array, der: PackedVector2Array, desde: int, hasta: int,
		col: Color) -> void:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in range(desde, hasta + 1):
		pts.append(izq[i])
	for i in range(hasta, desde - 1, -1):
		pts.append(der[i])
	draw_colored_polygon(pts, col)



func _drop(p: Vector2, r: float, col: Color) -> void:
	draw_circle(p, r, col)
	draw_colored_polygon(PackedVector2Array([
		p + Vector2(- r * 0.84, - r * 0.54), p + Vector2(0.0, - r * 2.4),
		p + Vector2(r * 0.84, - r * 0.54)]), col)


func _star(center: Vector2, outer: float, inner: float) -> PackedVector2Array:
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 10:
		var rad: float = outer if i % 2 == 0 else inner
		var ang: float = - PI * 0.5 + float(i) * PI / 5.0
		pts.append(center + Vector2(cos(ang), sin(ang)) * rad)
	return pts













func _bed_icon(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.22 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)

	draw_rect(Rect2(c.x - w * 0.8, c.y - h * 0.75, w * 1.6, h * 0.55), color,
		false, 0.04 * s)

	draw_line(Vector2(c.x - w, c.y + h * 0.15), Vector2(c.x + w, c.y + h * 0.15),
		color, 0.05 * s)




func _hogar_funcional_icon(tipo: String, c: Vector2, s: float) -> void:

	var trazo: float = maxf(0.055 * s, 2.0)
	match tipo:
		"camilla_fisio":
			draw_rect(Rect2(c + Vector2(-0.38, -0.06) * s, Vector2(0.76, 0.18) * s), color)
			draw_rect(Rect2(c + Vector2(-0.36, -0.13) * s, Vector2(0.18, 0.08) * s), _dim())
			for x in [-0.28, 0.28]:
				draw_line(c + Vector2(x, 0.08) * s, c + Vector2(x, 0.35) * s, color, trazo)
			draw_line(c + Vector2(0.15, -0.37) * s, c + Vector2(0.15, -0.15) * s, color, trazo)
			draw_line(c + Vector2(0.04, -0.26) * s, c + Vector2(0.26, -0.26) * s, color, trazo)
		"pizarra_tactica":
			draw_rect(Rect2(c + Vector2(-0.38, -0.32) * s, Vector2(0.76, 0.54) * s), _dim())
			draw_rect(Rect2(c + Vector2(-0.38, -0.32) * s, Vector2(0.76, 0.54) * s), color, false, trazo)
			draw_line(c + Vector2(0, -0.27) * s, c + Vector2(0, 0.17) * s, color, trazo * 0.7)
			draw_arc(c + Vector2(0, -0.05) * s, s * 0.075, 0, TAU, 16, color, trazo * 0.7)
			for p in [Vector2(-0.23, -0.16), Vector2(0.23, 0.06)]:
				draw_circle(c + p * s, s * 0.043, color)
			for x in [-0.24, 0.24]:
				draw_line(c + Vector2(x, 0.22) * s, c + Vector2(x, 0.37) * s, color, trazo)
		"bici_estatica":
			var rueda: Vector2 = c + Vector2(0.22, 0.14) * s
			draw_arc(rueda, s * 0.16, 0, TAU, 20, color, trazo)
			draw_polyline(PackedVector2Array([c + Vector2(-0.25, 0.3) * s,
				c + Vector2(-0.16, -0.07) * s, rueda, c + Vector2(0.12, -0.28) * s,
				c + Vector2(0.3, -0.28) * s]), color, trazo)
			draw_line(c + Vector2(-0.3, -0.1) * s, c + Vector2(-0.06, -0.1) * s, color, trazo * 1.5)
			draw_line(c + Vector2(-0.36, 0.34) * s, c + Vector2(0.4, 0.34) * s, color, trazo)
		"muro_records":
			draw_rect(Rect2(c + Vector2(-0.38, -0.32) * s, Vector2(0.76, 0.64) * s), color, false, trazo)
			for i in 3:
				var h: float = 0.16 + float(i) * 0.11
				draw_rect(Rect2(c + Vector2(-0.26 + float(i) * 0.2, 0.22 - h) * s,
					Vector2(0.13, h) * s), color)
		"rincon_lectura":
			for signo in [-1.0, 1.0]:
				var hoja: PackedVector2Array = PackedVector2Array([c + Vector2(0, -0.18) * s,
					c + Vector2(signo * 0.35, -0.3) * s,
					c + Vector2(signo * 0.35, 0.22) * s, c + Vector2(0, 0.34) * s])
				draw_colored_polygon(hoja, _dim())
				hoja.append(hoja[0])
				draw_polyline(hoja, color, trazo)
		"mesa_recuerdos":
			draw_line(c + Vector2(-0.4, 0.15) * s, c + Vector2(0.4, 0.15) * s, color, trazo * 1.3)
			for x in [-0.29, 0.29]:
				draw_line(c + Vector2(x, 0.15) * s, c + Vector2(x, 0.36) * s, color, trazo)
			draw_rect(Rect2(c + Vector2(-0.31, -0.3) * s, Vector2(0.3, 0.42) * s), color, false, trazo)
			draw_circle(c + Vector2(-0.16, -0.16) * s, 0.045 * s, color)
			draw_rect(Rect2(c + Vector2(0.08, -0.1) * s, Vector2(0.26, 0.2) * s), _dim())
			draw_polyline(PackedVector2Array([c + Vector2(0.08, -0.1) * s,
				c + Vector2(0.21, 0.01) * s, c + Vector2(0.34, -0.1) * s]), color, trazo)
		"colchon_estiramientos":
			draw_rect(Rect2(c + Vector2(-0.42, -0.16) * s, Vector2(0.84, 0.42) * s), _dim(), true)
			draw_rect(Rect2(c + Vector2(-0.42, -0.16) * s, Vector2(0.84, 0.42) * s), color, false, trazo)
			draw_line(c + Vector2(-0.32, -0.05) * s, c + Vector2(0.26, -0.05) * s, color, trazo)
			draw_circle(c + Vector2(0.34, -0.05) * s, 0.055 * s, color)
			draw_line(c + Vector2(-0.16, 0.22) * s, c + Vector2(0.18, 0.22) * s, color, trazo)
		"maquina_respiracion":
			draw_rect(Rect2(c + Vector2(-0.24, -0.38) * s, Vector2(0.48, 0.72) * s), color, false, trazo)
			draw_rect(Rect2(c + Vector2(-0.16, -0.24) * s, Vector2(0.32, 0.22) * s), _dim(), true)
			for x in [-0.1, 0.0, 0.1]:
				draw_circle(c + Vector2(x, 0.12) * s, 0.035 * s, color)
			draw_arc(c + Vector2(0, -0.02) * s, 0.28 * s, -0.2, 3.34, 20, color, trazo)
		"vision_board":
			draw_rect(Rect2(c + Vector2(-0.38, -0.3) * s, Vector2(0.76, 0.58) * s), color, false, trazo)
			for i in 4:
				var p: Vector2 = c + Vector2(-0.24 + float(i % 2) * 0.34, -0.16 + float(i / 2) * 0.26) * s
				draw_rect(Rect2(p, Vector2(0.22, 0.15) * s), _dim(), true)
				draw_circle(p + Vector2(0.17, 0.04) * s, 0.025 * s, color)
		"vinoteca_saludable":
			draw_line(c + Vector2(-0.38, 0.24) * s, c + Vector2(0.38, 0.24) * s, color, trazo * 1.2)
			draw_rect(Rect2(c + Vector2(-0.34, -0.04) * s, Vector2(0.68, 0.24) * s), color, false, trazo)
			for x in [-0.22, 0.0, 0.22]:
				draw_line(c + Vector2(x, -0.26) * s, c + Vector2(x, 0.06) * s, color, trazo)
				draw_circle(c + Vector2(x, -0.3) * s, 0.055 * s, _dim())
		"consultorio_nutri":


			draw_rect(Rect2(c + Vector2(0.08, 0.26) * s, Vector2(0.3, 0.08) * s), color, false, trazo)
			draw_line(c + Vector2(0.3, 0.26) * s, c + Vector2(0.3, -0.38) * s, color, trazo)
			draw_line(c + Vector2(0.3, -0.32) * s, c + Vector2(0.12, -0.32) * s, color, trazo)
			draw_line(c + Vector2(0.14, -0.02) * s, c + Vector2(0.4, -0.02) * s, color, trazo)
			draw_circle(c + Vector2(-0.2, 0.04) * s, 0.21 * s, _dim())
			draw_arc(c + Vector2(-0.2, 0.04) * s, 0.21 * s, 0.0, TAU, 24, color, trazo)
			draw_line(c + Vector2(-0.2, -0.17) * s, c + Vector2(-0.2, 0.25) * s, color, trazo * 0.7)
			draw_line(c + Vector2(-0.41, 0.04) * s, c + Vector2(0.01, 0.04) * s, color, trazo * 0.7)
		"lampara_sol":
			draw_line(c + Vector2(0, 0.32) * s, c + Vector2(0, -0.1) * s, color, trazo)
			draw_arc(c + Vector2(0, -0.18) * s, 0.19 * s, PI, TAU, 18, color, trazo)
			draw_line(c + Vector2(-0.22, 0.35) * s, c + Vector2(0.22, 0.35) * s, color, trazo)
			for a in 8:
				var v: Vector2 = Vector2.RIGHT.rotated(TAU * float(a) / 8.0)
				draw_line(c + Vector2(0, -0.18) * s + v * 0.24 * s,
					c + Vector2(0, -0.18) * s + v * 0.34 * s, color, trazo * 0.7)


func _cama_perro_icon(c: Vector2, s: float) -> void:
	var cp_lw: float = maxf(0.055 * s, 2.0)
	var cp_borde: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.36, -0.07) * s, c + Vector2(-0.29, 0.27) * s,
		c + Vector2(0.29, 0.27) * s, c + Vector2(0.36, -0.07) * s])
	draw_colored_polygon(cp_borde, _dim())
	draw_polyline(cp_borde, color, cp_lw)
	draw_line(c + Vector2(-0.36, -0.07) * s, c + Vector2(-0.19, 0.02) * s,
		color, cp_lw)
	draw_line(c + Vector2(0.36, -0.07) * s, c + Vector2(0.19, 0.02) * s,
		color, cp_lw)
	draw_circle(c + Vector2(0.0, -0.02) * s, 0.09 * s, color)
	for cp_dedo in [Vector2(-0.15, -0.15), Vector2(-0.055, -0.24),
		Vector2(0.055, -0.24), Vector2(0.15, -0.15)]:
		draw_circle(c + cp_dedo * s, 0.045 * s, color)



func _rascador_gato_icon(c: Vector2, s: float) -> void:
	var rg_lw: float = maxf(0.055 * s, 2.0)
	draw_line(c + Vector2(-0.34, 0.34) * s, c + Vector2(0.34, 0.34) * s,
		color, rg_lw * 1.4)
	draw_line(c + Vector2(-0.15, 0.3) * s, c + Vector2(-0.15, -0.29) * s,
		color, rg_lw * 1.2)
	draw_line(c + Vector2(0.18, 0.3) * s, c + Vector2(0.18, 0.02) * s,
		color, rg_lw * 1.2)
	draw_line(c + Vector2(-0.34, -0.29) * s, c + Vector2(0.05, -0.29) * s,
		color, rg_lw * 1.4)
	draw_line(c + Vector2(0.02, 0.02) * s, c + Vector2(0.35, 0.02) * s,
		color, rg_lw * 1.4)
	draw_line(c + Vector2(0.03, -0.27) * s, c + Vector2(0.03, -0.13) * s,
		_dim(), maxf(0.025 * s, 1.0))
	draw_circle(c + Vector2(0.03, -0.09) * s, 0.05 * s, color)



func _lavanderia_icon(c: Vector2, s: float) -> void:
	var la_lw: float = maxf(0.055 * s, 2.0)
	var la_cuerpo: Rect2 = Rect2(c + Vector2(-0.29, -0.34) * s,
		Vector2(0.58, 0.68) * s)
	draw_rect(la_cuerpo, _dim())
	draw_rect(la_cuerpo, color, false, la_lw)
	draw_line(c + Vector2(-0.29, -0.17) * s, c + Vector2(0.29, -0.17) * s,
		color, la_lw)
	draw_circle(c + Vector2(0.16, -0.255) * s, 0.04 * s, color)
	draw_line(c + Vector2(-0.19, -0.255) * s, c + Vector2(-0.03, -0.255) * s,
		color, la_lw)
	draw_arc(c + Vector2(0.0, 0.065) * s, 0.17 * s, 0.0, TAU, 24, color, la_lw)
	draw_arc(c + Vector2(0.0, 0.065) * s, 0.1 * s, 0.2, 2.5, 12,
		color, maxf(0.035 * s, 1.5))



func _recibidor_icon(c: Vector2, s: float) -> void:
	var re_lw: float = maxf(0.055 * s, 2.0)
	draw_rect(Rect2(c + Vector2(-0.35, -0.03) * s, Vector2(0.7, 0.1) * s),
		color)
	for re_x in [-0.28, 0.28]:
		draw_line(c + Vector2(re_x, 0.06) * s, c + Vector2(re_x, 0.34) * s,
			color, re_lw)
	draw_line(c + Vector2(-0.28, 0.24) * s, c + Vector2(0.28, 0.24) * s,
		_dim(), re_lw)
	draw_arc(c + Vector2(-0.12, -0.235) * s, 0.09 * s, 0.0, TAU, 20,
		color, re_lw)
	draw_line(c + Vector2(-0.03, -0.235) * s, c + Vector2(0.25, -0.235) * s,
		color, re_lw)
	draw_line(c + Vector2(0.21, -0.235) * s, c + Vector2(0.21, -0.12) * s,
		color, re_lw)



func _vestidor_icon(c: Vector2, s: float) -> void:
	var ve_lw: float = maxf(0.05 * s, 2.0)
	var ve_cuerpo: Rect2 = Rect2(c + Vector2(-0.35, -0.34) * s,
		Vector2(0.7, 0.68) * s)
	draw_rect(ve_cuerpo, _dim())
	draw_rect(ve_cuerpo, color, false, ve_lw)
	draw_line(c + Vector2(0.11, -0.34) * s, c + Vector2(0.11, 0.34) * s,
		color, ve_lw)
	draw_line(c + Vector2(-0.35, 0.2) * s, c + Vector2(0.11, 0.2) * s,
		color, ve_lw)
	draw_arc(c + Vector2(-0.12, -0.2) * s, 0.045 * s, PI, TAU + PI * 0.5,
		14, color, maxf(0.035 * s, 1.5))
	draw_polyline(PackedVector2Array([
		c + Vector2(-0.12, -0.14) * s, c + Vector2(-0.29, 0.03) * s,
		c + Vector2(0.05, 0.03) * s, c + Vector2(-0.12, -0.14) * s]),
		color, ve_lw)
	draw_line(c + Vector2(0.17, -0.04) * s, c + Vector2(0.28, -0.17) * s,
		color, maxf(0.035 * s, 1.5))



func _telescopio_icon(c: Vector2, s: float) -> void:
	var te_lw: float = maxf(0.055 * s, 2.0)
	var te_tubo: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.3, -0.04) * s, c + Vector2(0.24, -0.31) * s,
		c + Vector2(0.33, -0.13) * s, c + Vector2(-0.22, 0.13) * s])
	draw_colored_polygon(te_tubo, _dim())
	te_tubo.append(te_tubo[0])
	draw_polyline(te_tubo, color, te_lw)
	draw_line(c + Vector2(0.24, -0.34) * s, c + Vector2(0.35, -0.12) * s,
		color, te_lw * 1.4)
	draw_line(c + Vector2(-0.28, 0.05) * s, c + Vector2(-0.39, 0.11) * s,
		color, te_lw)
	var te_eje: Vector2 = c + Vector2(0.0, 0.01) * s
	for te_pie in [Vector2(-0.23, 0.35), Vector2(0.03, 0.37), Vector2(0.29, 0.32)]:
		draw_line(te_eje, c + te_pie * s, color, te_lw)




func _cabina_podcast_icon(c: Vector2, s: float) -> void:
	var cp_lw: float = maxf(0.055 * s, 2.0)
	var cp_cap: Rect2 = Rect2(c + Vector2(-0.1, -0.38) * s, Vector2(0.2, 0.34) * s)
	draw_rect(cp_cap, _dim())
	draw_rect(cp_cap, color, false, cp_lw)
	for cp_y in [-0.29, -0.21, -0.13]:
		draw_line(c + Vector2(-0.1, cp_y) * s, c + Vector2(0.1, cp_y) * s,
			color, maxf(0.03 * s, 1.0))
	draw_arc(c + Vector2(0.0, -0.1) * s, 0.17 * s, 0.0, PI, 16, color, cp_lw)
	draw_line(c + Vector2(0.0, 0.07) * s, c + Vector2(0.0, 0.3) * s, color, cp_lw)
	draw_line(c + Vector2(-0.18, 0.32) * s, c + Vector2(0.18, 0.32) * s,
		color, cp_lw * 1.3)
	for cp_i in 2:
		var cp_r: float =(0.27 + 0.09 * cp_i) * s
		var cp_col: Color = color if cp_i == 0 else _dim()
		draw_arc(c + Vector2(0.0, -0.21) * s, cp_r, -0.5, 0.5, 8, cp_col, cp_lw)
		draw_arc(c + Vector2(0.0, -0.21) * s, cp_r, PI - 0.5, PI + 0.5, 8, cp_col, cp_lw)



func _tina_hielo_icon(c: Vector2, s: float) -> void:
	var th_lw: float = maxf(0.055 * s, 2.0)
	var th_cuba: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.36, -0.02) * s, c + Vector2(0.36, -0.02) * s,
		c + Vector2(0.28, 0.33) * s, c + Vector2(-0.28, 0.33) * s])
	draw_colored_polygon(th_cuba, _dim())
	th_cuba.append(th_cuba[0])
	draw_polyline(th_cuba, color, th_lw)
	draw_line(c + Vector2(-0.33, 0.12) * s, c + Vector2(0.33, 0.12) * s,
		_dim(), th_lw)
	for th_x in [-0.24, -0.05, 0.14]:
		draw_rect(Rect2(c + Vector2(th_x, -0.15) * s, Vector2(0.11, 0.11) * s),
			color, false, th_lw * 0.8)
	var th_copo: Vector2 = c + Vector2(0.24, -0.29) * s
	for th_a in [0.0, PI / 3.0, 2.0 * PI / 3.0]:
		var th_d: Vector2 = Vector2(cos(th_a), sin(th_a)) * 0.09 * s
		draw_line(th_copo - th_d, th_copo + th_d, color, maxf(0.035 * s, 1.5))



func _banco_botas_icon(c: Vector2, s: float) -> void:
	var bb_lw: float = maxf(0.055 * s, 2.0)
	draw_line(c + Vector2(-0.38, 0.08) * s, c + Vector2(0.38, 0.08) * s,
		color, bb_lw * 1.5)
	for bb_x in [-0.3, 0.3]:
		draw_line(c + Vector2(bb_x, 0.1) * s, c + Vector2(bb_x, 0.35) * s,
			color, bb_lw)
	draw_line(c + Vector2(-0.3, 0.25) * s, c + Vector2(0.3, 0.25) * s,
		_dim(), bb_lw)
	var bb_bota: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.14, -0.34) * s, c + Vector2(0.04, -0.34) * s,
		c + Vector2(0.04, -0.12) * s, c + Vector2(0.28, -0.07) * s,
		c + Vector2(0.3, 0.02) * s, c + Vector2(-0.14, 0.02) * s])
	draw_colored_polygon(bb_bota, _dim())
	bb_bota.append(bb_bota[0])
	draw_polyline(bb_bota, color, bb_lw)
	for bb_x in [-0.08, 0.08, 0.22]:
		draw_circle(c + Vector2(bb_x, 0.04) * s, 0.025 * s, color)



func _toallero_icon(c: Vector2, s: float) -> void:
	var to_lw: float = maxf(0.055 * s, 2.0)
	draw_line(c + Vector2(-0.38, -0.24) * s, c + Vector2(0.38, -0.24) * s,
		color, to_lw)
	for to_x in [-0.38, 0.38]:
		draw_circle(c + Vector2(to_x, -0.24) * s, 0.05 * s, color)
	var to_tela: Rect2 = Rect2(c + Vector2(-0.2, -0.26) * s, Vector2(0.4, 0.6) * s)
	draw_rect(to_tela, _dim())
	draw_rect(to_tela, color, false, to_lw)
	draw_line(c + Vector2(-0.2, 0.2) * s, c + Vector2(0.2, 0.2) * s, color, to_lw)
	draw_line(c + Vector2(-0.2, -0.1) * s, c + Vector2(0.2, -0.1) * s,
		_dim(), to_lw)



func _espejo_icon(c: Vector2, s: float) -> void:
	var es_lw: float = maxf(0.055 * s, 2.0)
	var es_luna: Rect2 = Rect2(c + Vector2(-0.17, -0.38) * s, Vector2(0.34, 0.66) * s)
	draw_rect(es_luna, _dim())
	draw_rect(es_luna, color, false, es_lw)
	draw_line(c + Vector2(-0.09, -0.08) * s, c + Vector2(0.06, -0.26) * s,
		color, maxf(0.035 * s, 1.5))
	draw_line(c + Vector2(-0.09, 0.04) * s, c + Vector2(0.09, -0.17) * s,
		color, maxf(0.035 * s, 1.5))
	for es_x in [-0.12, 0.12]:
		draw_line(c + Vector2(es_x, 0.28) * s, c + Vector2(es_x * 1.4, 0.38) * s,
			color, es_lw)



func _mesa_centro_icon(c: Vector2, s: float) -> void:
	var mc_lw: float = maxf(0.055 * s, 2.0)
	draw_rect(Rect2(c + Vector2(-0.38, 0.0) * s, Vector2(0.76, 0.08) * s), color)
	for mc_x in [-0.3, 0.3]:
		draw_line(c + Vector2(mc_x, 0.08) * s, c + Vector2(mc_x, 0.32) * s,
			color, mc_lw)
	draw_line(c + Vector2(-0.3, 0.22) * s, c + Vector2(0.3, 0.22) * s,
		_dim(), mc_lw)
	var mc_taza: Rect2 = Rect2(c + Vector2(0.04, -0.17) * s, Vector2(0.14, 0.15) * s)
	draw_rect(mc_taza, _dim())
	draw_rect(mc_taza, color, false, mc_lw)
	draw_arc(c + Vector2(0.2, -0.1) * s, 0.05 * s, - PI * 0.5, PI * 0.5, 8,
		color, maxf(0.035 * s, 1.5))
	draw_rect(Rect2(c + Vector2(-0.3, -0.07) * s, Vector2(0.26, 0.07) * s), _dim())



func _rincon_cafe_icon(c: Vector2, s: float) -> void:
	var rc_lw: float = maxf(0.055 * s, 2.0)
	var rc_cuerpo: Rect2 = Rect2(c + Vector2(-0.3, -0.36) * s, Vector2(0.6, 0.3) * s)
	draw_rect(rc_cuerpo, _dim())
	draw_rect(rc_cuerpo, color, false, rc_lw)
	draw_circle(c + Vector2(0.16, -0.21) * s, 0.06 * s, color)
	draw_line(c + Vector2(-0.12, -0.02) * s, c + Vector2(0.28, -0.02) * s,
		color, rc_lw)
	var rc_taza: PackedVector2Array = PackedVector2Array([
		c + Vector2(-0.12, 0.08) * s, c + Vector2(0.08, 0.08) * s,
		c + Vector2(0.06, 0.25) * s, c + Vector2(-0.1, 0.25) * s])
	draw_colored_polygon(rc_taza, color)
	draw_line(c + Vector2(-0.36, 0.31) * s, c + Vector2(0.36, 0.31) * s,
		color, rc_lw * 1.3)



func _aparador_icon(c: Vector2, s: float) -> void:
	var ap_lw: float = maxf(0.05 * s, 2.0)
	var ap_bajo: Rect2 = Rect2(c + Vector2(-0.36, 0.04) * s, Vector2(0.72, 0.3) * s)
	draw_rect(ap_bajo, _dim())
	draw_rect(ap_bajo, color, false, ap_lw)
	draw_line(c + Vector2(0.0, 0.04) * s, c + Vector2(0.0, 0.34) * s, color, ap_lw)
	for ap_x in [-0.06, 0.06]:
		draw_circle(c + Vector2(ap_x, 0.19) * s, 0.025 * s, color)
	draw_rect(Rect2(c + Vector2(-0.3, -0.38) * s, Vector2(0.6, 0.42) * s),
		color, false, ap_lw)
	draw_line(c + Vector2(-0.3, -0.14) * s, c + Vector2(0.3, -0.14) * s,
		color, ap_lw)
	for ap_x in [-0.15, 0.0, 0.15]:
		draw_arc(c + Vector2(ap_x, -0.25) * s, 0.065 * s, 0.0, TAU, 16,
			color, maxf(0.035 * s, 1.5))
		draw_rect(Rect2(c + Vector2(ap_x - 0.035, -0.09) * s,
			Vector2(0.07, 0.09) * s), _dim())



func _gallinero_icon(c: Vector2, s: float) -> void:
	var ga_lw: float = maxf(0.055 * s, 2.0)
	draw_polyline(PackedVector2Array([c + Vector2(-0.4, -0.08) * s,
		c + Vector2(0.0, -0.38) * s, c + Vector2(0.4, -0.08) * s]), color, ga_lw * 1.3)
	var ga_cuerpo: Rect2 = Rect2(c + Vector2(-0.28, -0.1) * s, Vector2(0.56, 0.3) * s)
	draw_rect(ga_cuerpo, _dim())
	draw_rect(ga_cuerpo, color, false, ga_lw)
	draw_rect(Rect2(c + Vector2(-0.17, 0.0) * s, Vector2(0.13, 0.2) * s), color)
	draw_circle(c + Vector2(0.0, -0.2) * s, 0.045 * s, color)
	for ga_x in [-0.22, 0.22]:
		draw_line(c + Vector2(ga_x, 0.2) * s, c + Vector2(ga_x, 0.36) * s,
			color, ga_lw)
	draw_line(c + Vector2(-0.1, 0.2) * s, c + Vector2(-0.36, 0.36) * s,
		color, ga_lw)


func _sofa_icon(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s
	var h: float = 0.18 * s






	draw_rect(Rect2(c.x - w, c.y - h * 1.6, w * 2.0, h * 1.1), _dim())
	draw_rect(Rect2(c.x - w, c.y - h * 1.6, w * 2.0, h * 1.1), color, false,
		0.075 * s)
	draw_rect(Rect2(c.x - w, c.y - h * 0.5, w * 2.0, h * 1.4), _dim())
	draw_rect(Rect2(c.x - w, c.y - h * 0.5, w * 2.0, h * 1.4), color, false,
		0.075 * s)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * w -(w * 0.22 if sx > 0.0 else 0.0),
			c.y - h * 0.9, w * 0.22, h * 1.8), color)


func _table_icon(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s

	draw_rect(Rect2(c.x - w, c.y - 0.14 * s, w * 2.0, 0.12 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y - 0.14 * s, w * 2.0, 0.12 * s), color, false,
		0.05 * s)
	for sx in [-1.0, 1.0]:
		draw_line(Vector2(c.x + sx * w * 0.72, c.y - 0.02 * s),
			Vector2(c.x + sx * w * 0.72, c.y + 0.3 * s), color, 0.06 * s)


func _kitchen_icon(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s

	draw_rect(Rect2(c.x - w, c.y - 0.24 * s, w * 2.0, 0.48 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y - 0.24 * s, w * 2.0, 0.48 * s), color, false,
		0.05 * s)
	for sx in [-1.0, 1.0]:
		for sy in [-1.0, 1.0]:
			draw_circle(Vector2(c.x + sx * w * 0.42, c.y + sy * 0.11 * s),
				0.055 * s, color)









func _isla_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c + Vector2(-0.36 * s, -0.24 * s),
		Vector2(0.72 * s, 0.09 * s)), color)


	var is_cu: Rect2 = Rect2(c + Vector2(-0.21 * s, -0.15 * s),
		Vector2(0.42 * s, 0.34 * s))
	draw_rect(is_cu, _dim())
	draw_rect(is_cu, color, false, maxf(0.05 * s, 2.0))


	for is_x in [-1.0, 1.0]:
		var is_bx: float = float(is_x) * 0.3 * s
		draw_circle(c + Vector2(is_bx, -0.06 * s), 0.055 * s, color)
		draw_line(c + Vector2(is_bx, -0.01 * s), c + Vector2(is_bx, 0.24 * s),
			color, maxf(0.05 * s, 2.0))






func _sauna_icon(c: Vector2, s: float) -> void:
	var sa_w: float = 0.34 * s
	draw_rect(Rect2(c.x - sa_w, c.y - 0.34 * s, sa_w * 2.0, 0.68 * s), color, false,
		maxf(0.06 * s, 2.0))


	for sa_i in 2:
		var sa_y: float = c.y - 0.12 * s + 0.18 * s * float(sa_i)
		draw_line(Vector2(c.x - sa_w, sa_y), Vector2(c.x + sa_w, sa_y), _dim(),
			maxf(0.04 * s, 1.0))

	draw_line(Vector2(c.x + 0.08 * s, c.y - 0.34 * s),
		Vector2(c.x + 0.08 * s, c.y + 0.34 * s), color, maxf(0.05 * s, 2.0))

	draw_rect(Rect2(c.x - 0.26 * s, c.y + 0.06 * s, 0.22 * s, 0.28 * s), _dim())
	draw_circle(Vector2(c.x - 0.15 * s, c.y + 0.02 * s), 0.07 * s, color)









func _nevera_icon(c: Vector2, s: float) -> void:
	var nv_w: float = 0.22 * s
	draw_rect(Rect2(c.x - nv_w, c.y - 0.34 * s, nv_w * 2.0, 0.68 * s), _dim())
	draw_rect(Rect2(c.x - nv_w, c.y - 0.34 * s, nv_w * 2.0, 0.68 * s), color, false,
		maxf(0.06 * s, 2.0))

	draw_line(Vector2(c.x - nv_w, c.y - 0.08 * s), Vector2(c.x + nv_w, c.y - 0.08 * s),
		color, maxf(0.06 * s, 2.0))

	draw_line(Vector2(c.x + nv_w * 0.55, c.y - 0.26 * s),
		Vector2(c.x + nv_w * 0.55, c.y - 0.14 * s), color, maxf(0.05 * s, 2.0))
	draw_line(Vector2(c.x + nv_w * 0.55, c.y - 0.02 * s),
		Vector2(c.x + nv_w * 0.55, c.y + 0.16 * s), color, maxf(0.05 * s, 2.0))


func _shirt_icon(c: Vector2, s: float) -> void:
	var w: float = 0.26 * s

	draw_rect(Rect2(c.x - w, c.y - 0.2 * s, w * 2.0, 0.44 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y - 0.2 * s, w * 2.0, 0.44 * s), color, false,
		0.05 * s)
	for sx in [-1.0, 1.0]:
		draw_rect(Rect2(c.x + sx * w -(0.14 * s if sx > 0.0 else 0.0),
			c.y - 0.2 * s, 0.14 * s, 0.2 * s), color, false, 0.04 * s)

	draw_line(Vector2(c.x - w * 0.34, c.y - 0.2 * s),
		Vector2(c.x + w * 0.34, c.y - 0.2 * s), color, 0.06 * s)


func _shelf_icon(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s

	for i in 2:
		var y: float = c.y - 0.16 * s + float(i) * 0.26 * s
		draw_line(Vector2(c.x - w, y), Vector2(c.x + w, y), color, 0.06 * s)
		for k in 3:
			var x: float = c.x - w * 0.6 + float(k) * w * 0.6
			draw_rect(Rect2(x - 0.04 * s, y - 0.13 * s, 0.08 * s, 0.13 * s),
				color, false, 0.035 * s)


func _bath_icon(c: Vector2, s: float) -> void:
	var w: float = 0.3 * s

	draw_rect(Rect2(c.x - w * 0.7, c.y - 0.34 * s, w * 1.4, 0.26 * s), _dim())
	draw_rect(Rect2(c.x - w * 0.7, c.y - 0.34 * s, w * 1.4, 0.26 * s), color,
		false, 0.04 * s)

	draw_line(Vector2(c.x, c.y - 0.04 * s), Vector2(c.x, c.y + 0.04 * s),
		color, 0.05 * s)

	draw_rect(Rect2(c.x - w, c.y + 0.04 * s, w * 2.0, 0.2 * s), _dim())
	draw_rect(Rect2(c.x - w, c.y + 0.04 * s, w * 2.0, 0.2 * s), color,
		false, 0.05 * s)
	draw_rect(Rect2(c.x - w * 0.62, c.y + 0.09 * s, w * 1.24, 0.1 * s), color,
		false, 0.04 * s)

	draw_line(Vector2(c.x, c.y + 0.24 * s), Vector2(c.x, c.y + 0.38 * s),
		color, 0.07 * s)


func _rug_icon(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.24 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)
	draw_rect(Rect2(c.x - w * 0.55, c.y - h * 0.45, w * 1.1, h * 0.9), color,
		false, 0.04 * s)
	for sx in [-1.0, 1.0]:
		for i in 3:
			var y: float = c.y - h * 0.6 + float(i) * h * 0.6
			draw_line(Vector2(c.x + sx * w, y),
				Vector2(c.x + sx *(w + 0.09 * s), y), color, 0.04 * s)



func _plant_icon(c: Vector2, s: float) -> void:
	var base: Vector2 = c + Vector2(0.0, 0.3 * s)
	draw_colored_polygon(PackedVector2Array([
		base + Vector2(-0.16 * s, -0.16 * s), base + Vector2(0.16 * s, -0.16 * s),
		base + Vector2(0.1 * s, 0.1 * s), base + Vector2(-0.1 * s, 0.1 * s)]),
		color)
	draw_line(base + Vector2(0.0, -0.16 * s), c + Vector2(0.0, -0.26 * s),
		color, 0.05 * s)
	for leaf in [Vector2(-0.17, -0.05), Vector2(0.17, -0.12), Vector2(0.0, -0.3)]:
		var p: Vector2 = c + leaf * s
		draw_circle(p, 0.11 * s, _dim())
		draw_arc(p, 0.11 * s, 0.0, TAU, 16, color, 0.04 * s)



func _books_icon(c: Vector2, s: float) -> void:
	var y0: float = c.y + 0.28 * s
	draw_line(Vector2(c.x - 0.36 * s, y0), Vector2(c.x + 0.36 * s, y0),
		color, 0.06 * s)
	draw_rect(Rect2(c.x - 0.3 * s, y0 - 0.48 * s, 0.13 * s, 0.45 * s), color)
	draw_rect(Rect2(c.x - 0.12 * s, y0 - 0.4 * s, 0.13 * s, 0.37 * s), _dim())
	draw_rect(Rect2(c.x - 0.12 * s, y0 - 0.4 * s, 0.13 * s, 0.37 * s), color,
		false, 0.035 * s)

	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x + 0.06 * s, y0 - 0.03 * s),
		Vector2(c.x + 0.3 * s, y0 - 0.44 * s),
		Vector2(c.x + 0.4 * s, y0 - 0.38 * s),
		Vector2(c.x + 0.16 * s, y0 - 0.03 * s)]), color)



func _floor_lamp(c: Vector2, s: float) -> void:
	var y0: float = c.y + 0.34 * s
	draw_line(Vector2(c.x - 0.16 * s, y0), Vector2(c.x + 0.16 * s, y0),
		color, 0.06 * s)
	draw_line(Vector2(c.x, y0), Vector2(c.x, c.y - 0.1 * s), color, 0.05 * s)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.13 * s, -0.34 * s), c + Vector2(0.13 * s, -0.34 * s),
		c + Vector2(0.2 * s, -0.08 * s), c + Vector2(-0.2 * s, -0.08 * s)]),
		color)

	draw_arc(c + Vector2(0.0, -0.04 * s), 0.26 * s, 0.25 * PI, 0.75 * PI, 12,
		_dim(), 0.05 * s)



func _grill(c: Vector2, s: float) -> void:
	var gy: float = c.y + 0.02 * s
	draw_arc(Vector2(c.x, gy), 0.24 * s, 0.0, PI, 20, color, 0.06 * s)
	draw_line(Vector2(c.x - 0.26 * s, gy), Vector2(c.x + 0.26 * s, gy),
		color, 0.055 * s)
	for dx in [-0.14, 0.14]:
		draw_line(Vector2(c.x + dx * s, gy + 0.22 * s),
			Vector2(c.x + dx * s * 0.5, gy + 0.4 * s), color, 0.05 * s)
	for i in 2:
		var p: Vector2 = Vector2(c.x - 0.05 * s + float(i) * 0.12 * s,
			gy - 0.2 * s - float(i) * 0.1 * s)
		draw_arc(p, 0.055 * s, 0.2 * PI, 1.4 * PI, 10, _dim(), 0.04 * s)



func _hot_tub(c: Vector2, s: float) -> void:
	var y0: float = c.y + 0.02 * s
	draw_rect(Rect2(c.x - 0.3 * s, y0, 0.6 * s, 0.26 * s), _dim())
	draw_rect(Rect2(c.x - 0.3 * s, y0, 0.6 * s, 0.26 * s), color,
		false, 0.05 * s)
	draw_line(Vector2(c.x - 0.34 * s, y0), Vector2(c.x + 0.34 * s, y0),
		color, 0.055 * s)
	for dx in [-0.16, 0.0, 0.16]:
		draw_circle(Vector2(c.x + dx * s, y0 + 0.12 * s), 0.035 * s, color)
	for dx in [-0.1, 0.1]:
		draw_arc(Vector2(c.x + dx * s, y0 - 0.14 * s), 0.06 * s,
			0.2 * PI, 1.4 * PI, 10, _dim(), 0.04 * s)



func _cinema(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.32 * s, c.y - 0.34 * s, 0.64 * s, 0.3 * s), _dim())
	draw_rect(Rect2(c.x - 0.32 * s, c.y - 0.34 * s, 0.64 * s, 0.3 * s), color,
		false, 0.05 * s)
	for dx in [-0.16, 0.1]:
		draw_rect(Rect2(c.x + dx * s - 0.06 * s, c.y + 0.1 * s,
			0.12 * s, 0.16 * s), color)
		draw_rect(Rect2(c.x + dx * s - 0.09 * s, c.y + 0.22 * s,
			0.18 * s, 0.08 * s), color)



func _spa_hands(c: Vector2, s: float) -> void:
	var y0: float = c.y + 0.3 * s
	for i in 3:
		var w: float =(0.3 - float(i) * 0.07) * s
		var y: float = y0 - float(i) * 0.15 * s
		draw_rect(Rect2(c.x - w, y - 0.06 * s, w * 2.0, 0.12 * s), color)
	for dx in [-0.1, 0.06]:
		draw_arc(Vector2(c.x + dx * s, c.y - 0.24 * s), 0.07 * s,
			0.2 * PI, 1.4 * PI, 10, _dim(), 0.045 * s)



func _training_pitch(c: Vector2, s: float) -> void:
	var w: float = 0.32 * s
	var h: float = 0.26 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)

	draw_rect(Rect2(c.x - 0.12 * s, c.y - h - 0.07 * s, 0.24 * s, 0.07 * s),
		color)
	draw_rect(Rect2(c.x - 0.18 * s, c.y - h, 0.36 * s, 0.14 * s), color,
		false, 0.04 * s)
	draw_arc(c + Vector2(0.0, h * 0.35), 0.1 * s, PI, TAU, 14, color, 0.04 * s)



func _dog_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.24 * s, c.y - 0.08 * s, 0.4 * s, 0.22 * s), color)
	draw_rect(Rect2(c.x + 0.12 * s, c.y - 0.24 * s, 0.18 * s, 0.18 * s), color)
	draw_rect(Rect2(c.x + 0.26 * s, c.y - 0.16 * s, 0.1 * s, 0.07 * s), color)
	draw_rect(Rect2(c.x + 0.12 * s, c.y - 0.32 * s, 0.06 * s, 0.1 * s), color)
	draw_line(c + Vector2(-0.24 * s, -0.04 * s), c + Vector2(-0.36 * s, -0.2 * s),
		color, 0.06 * s)
	for dx in [-0.18, -0.02, 0.06]:
		draw_rect(Rect2(c.x + dx * s, c.y + 0.14 * s, 0.06 * s, 0.16 * s), color)



func _frames_icon(c: Vector2, s: float) -> void:
	for i in 3:
		var dx: float =(float(i) - 1.0) * 0.26 * s
		var dy: float = -0.06 * s if i == 1 else 0.04 * s
		var r: Rect2 = Rect2(c.x + dx - 0.1 * s, c.y + dy - 0.14 * s,
			0.2 * s, 0.26 * s)
		draw_rect(r, _dim())
		draw_rect(r, color, false, 0.045 * s)
	draw_line(c + Vector2(-0.38 * s, 0.3 * s), c + Vector2(0.38 * s, 0.3 * s),
		_dim(), 0.05 * s)



func _mini_stadium(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.14 * s, c.y - 0.1 * s, 0.28 * s, 0.2 * s), _dim())
	draw_rect(Rect2(c.x - 0.14 * s, c.y - 0.1 * s, 0.28 * s, 0.2 * s), color,
		false, 0.04 * s)
	draw_line(c + Vector2(0.0, -0.1 * s), c + Vector2(0.0, 0.1 * s),
		color, 0.03 * s)
	draw_arc(c, 0.3 * s, PI * 0.15, PI * 0.85, 16, color, 0.07 * s)
	draw_arc(c, 0.3 * s, PI * 1.15, PI * 1.85, 16, color, 0.07 * s)

	for sx in [-1.0, 1.0]:
		draw_line(c + Vector2(sx * 0.18 * s, 0.32 * s),
			c + Vector2(sx * 0.24 * s, 0.44 * s), color, 0.045 * s)



func _arcade_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.36 * s, 0.4 * s, 0.72 * s), _dim())
	draw_rect(Rect2(c.x - 0.2 * s, c.y - 0.36 * s, 0.4 * s, 0.72 * s), color,
		false, 0.05 * s)
	draw_rect(Rect2(c.x - 0.13 * s, c.y - 0.28 * s, 0.26 * s, 0.2 * s), color)
	for dx in [-0.08, 0.06]:
		draw_circle(c + Vector2(dx * s, 0.14 * s), 0.045 * s, color)
	draw_line(c + Vector2(-0.2 * s, 0.28 * s), c + Vector2(0.2 * s, 0.28 * s),
		color, 0.05 * s)



func _pool_icon(c: Vector2, s: float) -> void:
	var r: Rect2 = Rect2(c.x - 0.34 * s, c.y - 0.18 * s, 0.68 * s, 0.38 * s)
	draw_rect(r, _dim())
	draw_rect(r, color, false, 0.05 * s)
	for i in 3:
		var y: float = c.y - 0.06 * s + float(i) * 0.1 * s
		for k in 4:
			var x0: float = c.x - 0.26 * s + float(k) * 0.14 * s
			draw_arc(Vector2(x0 + 0.05 * s, y), 0.05 * s, PI, TAU, 8,
				color, 0.035 * s)
	draw_line(c + Vector2(0.24 * s, -0.3 * s), c + Vector2(0.24 * s, 0.0),
		color, 0.045 * s)
	draw_line(c + Vector2(0.32 * s, -0.3 * s), c + Vector2(0.32 * s, 0.0),
		color, 0.045 * s)



func _bike_icon(c: Vector2, s: float) -> void:
	for sx in [-1.0, 1.0]:
		draw_circle(c + Vector2(sx * 0.22 * s, 0.16 * s), 0.13 * s, _dim())
		draw_arc(c + Vector2(sx * 0.22 * s, 0.16 * s), 0.13 * s, 0.0, TAU, 16,
			color, 0.05 * s)
	draw_rect(Rect2(c.x - 0.16 * s, c.y - 0.08 * s, 0.32 * s, 0.14 * s), color)
	draw_line(c + Vector2(0.1 * s, -0.08 * s), c + Vector2(0.24 * s, -0.26 * s),
		color, 0.05 * s)
	draw_line(c + Vector2(0.16 * s, -0.26 * s), c + Vector2(0.32 * s, -0.26 * s),
		color, 0.05 * s)
	draw_rect(Rect2(c.x - 0.26 * s, c.y - 0.16 * s, 0.14 * s, 0.09 * s), color)

















func _arrow_right(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.34 * s, 0.0), c + Vector2(0.06 * s, 0.0),
		color, maxf(0.11 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.36 * s, 0.0),
		c + Vector2(0.02 * s, -0.26 * s),
		c + Vector2(0.02 * s, 0.26 * s)]), color)





func _coin(c: Vector2, s: float) -> void:
	draw_circle(c, 0.34 * s, color)
	draw_arc(c, 0.2 * s, 0.0, TAU, 20, _dim(), maxf(0.06 * s, 1.0))


















func _pay_card(c: Vector2, s: float) -> void:
	var w: float = 0.34 * s
	var h: float = 0.24 * s
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), _dim())
	draw_rect(Rect2(c.x - w, c.y - h, w * 2.0, h * 2.0), color, false, 0.05 * s)


	draw_rect(Rect2(c.x - w, c.y - h + 0.09 * s, w * 2.0, 0.09 * s), color)


	draw_rect(Rect2(c.x - w + 0.07 * s, c.y + 0.06 * s, 0.15 * s, 0.08 * s), color)





func _loan_arrows(c: Vector2, s: float) -> void:
	var w: float = maxf(0.09 * s, 2.0)

	draw_line(c + Vector2(-0.3 * s, -0.14 * s), c + Vector2(0.14 * s, -0.14 * s),
		color, w)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.34 * s, -0.14 * s),
		c + Vector2(0.1 * s, -0.32 * s),
		c + Vector2(0.1 * s, 0.04 * s)]), color)

	draw_line(c + Vector2(0.3 * s, 0.16 * s), c + Vector2(-0.14 * s, 0.16 * s),
		color, w)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.34 * s, 0.16 * s),
		c + Vector2(-0.1 * s, -0.02 * s),
		c + Vector2(-0.1 * s, 0.34 * s)]), color)




func _sprout(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(0.0, 0.34 * s), c + Vector2(0.0, -0.1 * s),
		color, maxf(0.1 * s, 2.0))

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.02 * s), c + Vector2(-0.3 * s, -0.14 * s),
		c + Vector2(-0.06 * s, -0.26 * s)]), color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.14 * s), c + Vector2(0.3 * s, -0.26 * s),
		c + Vector2(0.04 * s, -0.36 * s)]), color)






func _coin_free(c: Vector2, s: float) -> void:
	draw_arc(c, 0.32 * s, 0.0, TAU, 24, color, maxf(0.09 * s, 2.0))


	draw_line(c + Vector2(-0.4 * s, 0.4 * s), c + Vector2(0.4 * s, -0.4 * s),
		color, maxf(0.11 * s, 2.0))


















func _cuadro_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(0.3 * s, 0.26 * s),
		Vector2(0.6 * s, 0.52 * s)), color, false, maxf(0.07 * s, 2.0))

	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, 0.2 * s), c + Vector2(-0.02 * s, -0.04 * s),
		c + Vector2(0.24 * s, 0.2 * s)]), color)
	draw_circle(c + Vector2(0.14 * s, -0.1 * s), 0.06 * s, _dim())



func _banderines_icon(c: Vector2, s: float) -> void:
	var izq: Vector2 = c + Vector2(-0.34 * s, -0.2 * s)
	var der: Vector2 = c + Vector2(0.34 * s, -0.2 * s)

	var cuerda: PackedVector2Array = PackedVector2Array()
	for i in 9:
		var t: float = float(i) / 8.0
		cuerda.append(izq.lerp(der, t) + Vector2(0.0, sin(t * PI) * 0.12 * s))
	draw_polyline(cuerda, color, maxf(0.05 * s, 2.0))
	for i in 3:
		var t2: float = 0.2 + 0.3 * float(i)
		var p: Vector2 = izq.lerp(der, t2) + Vector2(0.0, sin(t2 * PI) * 0.12 * s)
		draw_colored_polygon(PackedVector2Array([
			p + Vector2(-0.09 * s, 0.0), p + Vector2(0.09 * s, 0.0),
			p + Vector2(0.0, 0.3 * s)]), color if i != 1 else _dim())



func _bufanda_icon(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.3 * s, -0.3 * s), c + Vector2(-0.06 * s, -0.3 * s),
		c + Vector2(0.16 * s, 0.06 * s), c + Vector2(-0.08 * s, 0.06 * s)]),
		color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.3 * s, -0.3 * s), c + Vector2(0.06 * s, -0.3 * s),
		c + Vector2(-0.02 * s, 0.06 * s), c + Vector2(0.22 * s, 0.06 * s)]),
		_dim())
	for i in 2:
		var x: float =(-0.02 + 0.16 * float(i)) * s
		draw_line(c + Vector2(x, 0.06 * s), c + Vector2(x, 0.32 * s),
			color, maxf(0.06 * s, 2.0))



func _tapiz_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.34 * s, -0.32 * s),
		c + Vector2(0.34 * s, -0.32 * s), color, maxf(0.07 * s, 2.0))
	draw_rect(Rect2(c - Vector2(0.26 * s, 0.26 * s),
		Vector2(0.52 * s, 0.58 * s)), color, false, maxf(0.06 * s, 2.0))
	for i in 2:
		var x2: float =(-0.09 + 0.18 * float(i)) * s
		draw_line(c + Vector2(x2, -0.2 * s), c + Vector2(x2, 0.26 * s),
			_dim(), maxf(0.05 * s, 2.0))



func _chimenea_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(0.32 * s, 0.32 * s),
		Vector2(0.64 * s, 0.64 * s)), color, false, maxf(0.07 * s, 2.0))

	draw_line(c + Vector2(-0.32 * s, -0.14 * s),
		c + Vector2(0.32 * s, -0.14 * s), color, maxf(0.08 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.06 * s), c + Vector2(0.14 * s, 0.14 * s),
		c + Vector2(0.0, 0.26 * s), c + Vector2(-0.14 * s, 0.14 * s)]), _dim())



func _plafon_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.3 * s, -0.32 * s),
		c + Vector2(0.3 * s, -0.32 * s), color, maxf(0.06 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.24 * s, -0.1 * s), c + Vector2(0.24 * s, -0.1 * s),
		c + Vector2(0.16 * s, -0.26 * s), c + Vector2(-0.16 * s, -0.26 * s)]),
		color)

	draw_line(c + Vector2(-0.2 * s, 0.02 * s),
		c + Vector2(-0.32 * s, 0.3 * s), _dim(), maxf(0.05 * s, 2.0))
	draw_line(c + Vector2(0.2 * s, 0.02 * s),
		c + Vector2(0.32 * s, 0.3 * s), _dim(), maxf(0.05 * s, 2.0))
	draw_line(c + Vector2(0.0, 0.04 * s), c + Vector2(0.0, 0.32 * s),
		_dim(), maxf(0.05 * s, 2.0))



func _arana_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(0.0, -0.36 * s), c + Vector2(0.0, -0.1 * s),
		color, maxf(0.05 * s, 2.0))
	draw_line(c + Vector2(-0.3 * s, -0.06 * s),
		c + Vector2(0.3 * s, -0.06 * s), color, maxf(0.07 * s, 2.0))
	for i in 3:
		var x3: float =(-0.26 + 0.26 * float(i)) * s
		draw_line(c + Vector2(x3, -0.06 * s), c + Vector2(x3, 0.14 * s),
			color, maxf(0.06 * s, 2.0))
		draw_circle(c + Vector2(x3, 0.22 * s), 0.07 * s, _dim())



func _aplique_icon(c: Vector2, s: float) -> void:

	draw_line(c + Vector2(-0.32 * s, -0.36 * s),
		c + Vector2(-0.32 * s, 0.36 * s), color, maxf(0.07 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.3 * s, 0.1 * s), c + Vector2(0.1 * s, 0.1 * s),
		c + Vector2(0.2 * s, -0.1 * s), c + Vector2(-0.3 * s, -0.1 * s)]),
		color)
	draw_arc(c + Vector2(-0.05 * s, -0.12 * s), 0.24 * s, PI, TAU, 12, _dim(),
		maxf(0.05 * s, 2.0))



func _neon_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(0.34 * s, 0.24 * s),
		Vector2(0.68 * s, 0.48 * s)), _dim(), false, maxf(0.05 * s, 2.0))
	draw_polyline(PackedVector2Array([
		c + Vector2(-0.18 * s, 0.12 * s), c + Vector2(-0.18 * s, -0.12 * s),
		c + Vector2(0.02 * s, 0.12 * s), c + Vector2(0.02 * s, -0.12 * s)]),
		color, maxf(0.07 * s, 2.0))
	draw_circle(c + Vector2(0.18 * s, -0.06 * s), 0.06 * s, color)



func _led_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.34 * s, -0.22 * s),
		c + Vector2(0.34 * s, -0.22 * s), color, maxf(0.09 * s, 2.0))
	for i in 3:
		var x4: float =(-0.22 + 0.22 * float(i)) * s
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(x4 - 0.05 * s, -0.14 * s),
			c + Vector2(x4 + 0.05 * s, -0.14 * s),
			c + Vector2(x4 + 0.12 * s, 0.32 * s),
			c + Vector2(x4 - 0.12 * s, 0.32 * s)]), _dim())



func _macetero_icon(c: Vector2, s: float) -> void:
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.16 * s, 0.1 * s), c + Vector2(0.16 * s, 0.1 * s),
		c + Vector2(0.12 * s, 0.36 * s), c + Vector2(-0.12 * s, 0.36 * s)]),
		color)
	draw_line(c + Vector2(0.0, 0.1 * s), c + Vector2(0.0, -0.2 * s),
		color, maxf(0.05 * s, 2.0))

	for i in 3:
		var y3: float =(-0.04 - 0.14 * float(i)) * s
		var w: float =(0.26 - 0.07 * float(i)) * s
		draw_colored_polygon(PackedVector2Array([
			c + Vector2(0.0, y3 - 0.12 * s), c + Vector2(w, y3),
			c + Vector2(0.0, y3 + 0.06 * s), c + Vector2(- w, y3)]), color)



func _carrito_icon(c: Vector2, s: float) -> void:
	for i in 2:
		var y4: float =(-0.04 + 0.26 * float(i)) * s
		draw_line(c + Vector2(-0.28 * s, y4), c + Vector2(0.28 * s, y4),
			color, maxf(0.06 * s, 2.0))
	for i in 2:
		var x5: float =(-0.24 + 0.48 * float(i)) * s
		draw_line(c + Vector2(x5, -0.04 * s), c + Vector2(x5, 0.28 * s),
			color, maxf(0.05 * s, 2.0))
		draw_circle(c + Vector2(x5, 0.34 * s), 0.06 * s, color)
	draw_rect(Rect2(c + Vector2(-0.05 * s, -0.3 * s),
		Vector2(0.1 * s, 0.26 * s)), color)



func _percha_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(0.0, -0.34 * s), c + Vector2(0.0, 0.26 * s),
		color, maxf(0.06 * s, 2.0))
	draw_line(c + Vector2(-0.2 * s, 0.34 * s), c + Vector2(0.2 * s, 0.34 * s),
		color, maxf(0.06 * s, 2.0))
	draw_line(c + Vector2(0.0, 0.26 * s), c + Vector2(-0.18 * s, 0.34 * s),
		color, maxf(0.05 * s, 2.0))
	draw_line(c + Vector2(0.0, 0.26 * s), c + Vector2(0.18 * s, 0.34 * s),
		color, maxf(0.05 * s, 2.0))

	draw_line(c + Vector2(0.0, -0.26 * s), c + Vector2(-0.22 * s, -0.18 * s),
		color, maxf(0.05 * s, 2.0))
	draw_line(c + Vector2(0.0, -0.2 * s), c + Vector2(0.22 * s, -0.1 * s),
		color, maxf(0.05 * s, 2.0))








func _maletas_icon(c: Vector2, s: float) -> void:

	draw_rect(Rect2(c.x - 0.34 * s, c.y + 0.04 * s, 0.68 * s, 0.3 * s), _dim())
	draw_rect(Rect2(c.x - 0.34 * s, c.y + 0.04 * s, 0.68 * s, 0.3 * s), color,
		false, maxf(0.06 * s, 2.0))


	draw_rect(Rect2(c.x - 0.16 * s, c.y - 0.22 * s, 0.48 * s, 0.26 * s), color,
		false, maxf(0.06 * s, 2.0))


	draw_line(Vector2(c.x, c.y - 0.22 * s), Vector2(c.x, c.y - 0.31 * s),
		color, maxf(0.05 * s, 2.0))
	draw_line(Vector2(c.x + 0.16 * s, c.y - 0.22 * s),
		Vector2(c.x + 0.16 * s, c.y - 0.31 * s), color, maxf(0.05 * s, 2.0))
	draw_line(Vector2(c.x, c.y - 0.31 * s),
		Vector2(c.x + 0.16 * s, c.y - 0.31 * s), color, maxf(0.05 * s, 2.0))



	draw_line(Vector2(c.x - 0.22 * s, c.y + 0.04 * s),
		Vector2(c.x - 0.22 * s, c.y + 0.12 * s), color, maxf(0.04 * s, 1.0))
	draw_rect(Rect2(c.x - 0.28 * s, c.y + 0.12 * s, 0.12 * s, 0.14 * s), color)




func _vinoteca_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(0.26 * s, 0.34 * s),
		Vector2(0.52 * s, 0.68 * s)), color, false, maxf(0.07 * s, 2.0))
	for i in 3:
		var y5: float =(-0.18 + 0.18 * float(i)) * s
		draw_line(c + Vector2(-0.26 * s, y5), c + Vector2(0.26 * s, y5),
			color, maxf(0.05 * s, 2.0))
		draw_circle(c + Vector2(-0.12 * s, y5 - 0.07 * s), 0.045 * s, _dim())
		draw_circle(c + Vector2(0.08 * s, y5 - 0.07 * s), 0.045 * s, _dim())





func _tocador_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c - Vector2(0.2 * s, 0.34 * s),
		Vector2(0.4 * s, 0.34 * s)), color, false, maxf(0.06 * s, 2.0))

	draw_rect(Rect2(c - Vector2(0.13 * s, 0.28 * s),
		Vector2(0.26 * s, 0.22 * s)), _dim())

	draw_line(c + Vector2(-0.34 * s, 0.02 * s),
		c + Vector2(0.34 * s, 0.02 * s), color, maxf(0.07 * s, 2.0))
	for tc_i in 2:
		var tc_x: float =(-0.24 + 0.48 * float(tc_i)) * s
		draw_rect(Rect2(c + Vector2(tc_x - 0.1 * s, 0.06 * s),
			Vector2(0.2 * s, 0.24 * s)), color, false, maxf(0.05 * s, 2.0))





func _despacho_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.34 * s, -0.1 * s),
		c + Vector2(0.34 * s, -0.1 * s), color, maxf(0.08 * s, 2.0))
	for ds_i in 2:
		var ds_bx: float =(-0.28 + 0.56 * float(ds_i)) * s
		draw_line(c + Vector2(ds_bx, -0.1 * s), c + Vector2(ds_bx, 0.32 * s),
			color, maxf(0.06 * s, 2.0))


	for ds_j in 2:
		var ds_fx: float =(0.08 + 0.13 * float(ds_j)) * s
		draw_line(c + Vector2(ds_fx, -0.14 * s),
			c + Vector2(ds_fx,(-0.3 - 0.08 * float(ds_j)) * s), _dim(),
			maxf(0.07 * s, 2.0))

	draw_rect(Rect2(c + Vector2(-0.22 * s, 0.02 * s),
		Vector2(0.26 * s, 0.26 * s)), color, false, maxf(0.06 * s, 2.0))
	draw_circle(c + Vector2(-0.09 * s, 0.15 * s), 0.055 * s, color)






func _barbero_icon(c: Vector2, s: float) -> void:

	draw_line(c + Vector2(-0.1 * s, 0.08 * s),
		c + Vector2(-0.1 * s, -0.3 * s), color, maxf(0.09 * s, 2.0))
	draw_line(c + Vector2(-0.19 * s, -0.3 * s),
		c + Vector2(-0.01 * s, -0.3 * s), color, maxf(0.08 * s, 2.0))

	draw_line(c + Vector2(-0.14 * s, 0.08 * s),
		c + Vector2(0.2 * s, 0.08 * s), color, maxf(0.09 * s, 2.0))
	draw_line(c + Vector2(0.0, 0.08 * s), c + Vector2(0.0, 0.34 * s),
		color, maxf(0.08 * s, 2.0))
	draw_line(c + Vector2(-0.14 * s, 0.34 * s),
		c + Vector2(0.14 * s, 0.34 * s), color, maxf(0.07 * s, 2.0))

	draw_line(c + Vector2(0.14 * s, 0.21 * s),
		c + Vector2(0.34 * s, 0.21 * s), color, maxf(0.07 * s, 2.0))


	for br_i in 3:
		draw_circle(c + Vector2(-0.3 * s,(-0.34 + 0.13 * float(br_i)) * s),
			0.05 * s, _dim())







func _balon_urna_icon(c: Vector2, s: float) -> void:

	draw_arc(c + Vector2(0.0, -0.04 * s), 0.24 * s, PI, TAU, 16, color,
		maxf(0.06 * s, 2.0))
	for bu_x in [-1.0, 1.0]:
		draw_line(c + Vector2(float(bu_x) * 0.24 * s, -0.04 * s),
			c + Vector2(float(bu_x) * 0.24 * s, 0.18 * s), color, maxf(0.06 * s, 2.0))
	_ball(c + Vector2(0.0, 0.02 * s), 0.13 * s)



	draw_rect(Rect2(c.x - 0.3 * s, c.y + 0.18 * s, 0.6 * s, 0.07 * s), color)
	draw_rect(Rect2(c.x - 0.1 * s, c.y + 0.25 * s, 0.2 * s, 0.11 * s), _dim())
	draw_rect(Rect2(c.x - 0.26 * s, c.y + 0.36 * s, 0.52 * s, 0.08 * s), color)









func _estatua_icon(c: Vector2, s: float) -> void:


	draw_rect(Rect2(c.x - 0.28 * s, c.y + 0.3 * s, 0.56 * s, 0.07 * s), color)
	draw_rect(Rect2(c.x - 0.15 * s, c.y + 0.13 * s, 0.3 * s, 0.17 * s), _dim())
	draw_rect(Rect2(c.x - 0.08 * s, c.y + 0.18 * s, 0.16 * s, 0.06 * s), color)
	draw_rect(Rect2(c.x - 0.24 * s, c.y + 0.07 * s, 0.48 * s, 0.06 * s), color)


	draw_circle(Vector2(c.x, c.y - 0.29 * s), 0.075 * s, color)
	draw_rect(Rect2(c.x - 0.07 * s, c.y - 0.22 * s, 0.14 * s, 0.16 * s), color)
	for eb_x in [-1.0, 1.0]:
		draw_line(c + Vector2(float(eb_x) * 0.07 * s, -0.2 * s),
			c + Vector2(float(eb_x) * 0.14 * s, -0.04 * s), color, maxf(0.05 * s, 2.0))
		draw_line(c + Vector2(float(eb_x) * 0.03 * s, -0.06 * s),
			c + Vector2(float(eb_x) * 0.08 * s, 0.07 * s), color, maxf(0.055 * s, 2.0))





func _vitrina_isla_icon(c: Vector2, s: float) -> void:
	var vi_w: float = 0.27 * s
	draw_rect(Rect2(c.x - vi_w, c.y - 0.34 * s, vi_w * 2.0, 0.6 * s), color,
		false, maxf(0.05 * s, 2.0))


	for vi_i in 3:
		var vi_y: float = c.y - 0.16 * s + float(vi_i) * 0.19 * s
		draw_line(Vector2(c.x - vi_w, vi_y), Vector2(c.x + vi_w, vi_y), color,
			maxf(0.04 * s, 1.0))
		draw_rect(Rect2(c.x - 0.05 * s, vi_y - 0.11 * s, 0.1 * s, 0.11 * s),
			_dim())



	draw_rect(Rect2(c.x - vi_w - 0.05 * s, c.y - 0.4 * s,
		(vi_w + 0.05 * s) * 2.0, 0.07 * s), color)
	draw_rect(Rect2(c.x - 0.16 * s, c.y + 0.26 * s, 0.32 * s, 0.09 * s), _dim())
	draw_rect(Rect2(c.x - 0.3 * s, c.y + 0.35 * s, 0.6 * s, 0.08 * s), color)











func _camastro_icon(c: Vector2, s: float) -> void:
	var y0: float = c.y + 0.1 * s
	draw_rect(Rect2(c.x - 0.34 * s, y0, 0.64 * s, 0.1 * s), color)

	draw_colored_polygon(PackedVector2Array([
		Vector2(c.x - 0.34 * s, y0), Vector2(c.x - 0.34 * s, y0 - 0.3 * s),
		Vector2(c.x - 0.1 * s, y0)]), _dim())
	draw_line(Vector2(c.x - 0.34 * s, y0 - 0.3 * s),
		Vector2(c.x - 0.1 * s, y0), color, maxf(0.06 * s, 2.0))
	for dx in [-0.28, 0.24]:
		draw_line(Vector2(c.x + dx * s, y0 + 0.1 * s),
			Vector2(c.x + dx * s, y0 + 0.26 * s), color, maxf(0.05 * s, 2.0))




func _sombrilla_icon(c: Vector2, s: float) -> void:
	var top: Vector2 = c + Vector2(0.0, -0.34 * s)
	draw_colored_polygon(PackedVector2Array([top,
		c + Vector2(0.34 * s, -0.04 * s), c + Vector2(0.0, 0.04 * s),
		c + Vector2(-0.34 * s, -0.04 * s)]), color)
	draw_line(top, c + Vector2(0.0, 0.3 * s), color, maxf(0.055 * s, 2.0))
	draw_line(c + Vector2(-0.16 * s, 0.34 * s), c + Vector2(0.16 * s, 0.34 * s),
		color, maxf(0.07 * s, 2.0))



func _hamaca_icon(c: Vector2, s: float) -> void:
	for dx in [-0.3, 0.3]:
		draw_line(Vector2(c.x + dx * s, c.y - 0.26 * s),
			Vector2(c.x + dx * s, c.y + 0.32 * s), color, maxf(0.055 * s, 2.0))
	var pts: PackedVector2Array = PackedVector2Array()
	for i in 9:
		var t: float = -1.0 + 2.0 * float(i) / 8.0
		pts.append(c + Vector2(t * 0.3 * s,(-0.16 + 0.26 *(1.0 - t * t)) * s))
	draw_polyline(pts, color, maxf(0.075 * s, 2.0))

	for dx2 in [-0.06, 0.06]:
		draw_line(c + Vector2(dx2 * s, 0.1 * s), c + Vector2(dx2 * s, 0.2 * s),
			_dim(), maxf(0.04 * s, 1.0))




func _arbol_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(0.0, 0.04 * s), c + Vector2(0.0, 0.34 * s),
		color, maxf(0.07 * s, 2.0))
	draw_line(c + Vector2(-0.14 * s, 0.34 * s), c + Vector2(0.14 * s, 0.34 * s),
		color, maxf(0.05 * s, 2.0))
	draw_circle(c + Vector2(0.0, -0.18 * s), 0.16 * s, color)
	draw_circle(c + Vector2(-0.16 * s, -0.02 * s), 0.13 * s, color)
	draw_circle(c + Vector2(0.16 * s, -0.02 * s), 0.13 * s, color)




func _farol_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(0.0, 0.02 * s), c + Vector2(0.0, 0.34 * s),
		color, maxf(0.06 * s, 2.0))
	draw_line(c + Vector2(-0.12 * s, 0.34 * s), c + Vector2(0.12 * s, 0.34 * s),
		color, maxf(0.055 * s, 2.0))
	var caja: Rect2 = Rect2(c.x - 0.13 * s, c.y - 0.22 * s, 0.26 * s, 0.24 * s)
	draw_rect(caja, _dim())
	draw_rect(caja, color, false, maxf(0.05 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(-0.18 * s, -0.22 * s), c + Vector2(0.18 * s, -0.22 * s),
		c + Vector2(0.0, -0.34 * s)]), color)
	for dx in [-1.0, 1.0]:
		draw_line(c + Vector2(dx * 0.2 * s, -0.14 * s),
			c + Vector2(dx * 0.3 * s, -0.18 * s), color, maxf(0.045 * s, 1.0))




func _fogata_icon(c: Vector2, s: float) -> void:
	for dx in [-1.0, 1.0]:
		draw_line(c + Vector2(dx * 0.26 * s, 0.3 * s),
			c + Vector2(- dx * 0.14 * s, 0.14 * s), color, maxf(0.065 * s, 2.0))
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.32 * s), c + Vector2(0.18 * s, -0.02 * s),
		c + Vector2(0.0, 0.12 * s), c + Vector2(-0.18 * s, -0.02 * s)]), color)
	draw_colored_polygon(PackedVector2Array([
		c + Vector2(0.0, -0.14 * s), c + Vector2(0.08 * s, 0.0),
		c + Vector2(0.0, 0.08 * s), c + Vector2(-0.08 * s, 0.0)]), _dim())



func _columpio_icon(c: Vector2, s: float) -> void:
	draw_line(c + Vector2(-0.3 * s, -0.3 * s), c + Vector2(0.3 * s, -0.3 * s),
		color, maxf(0.06 * s, 2.0))
	for dx in [-1.0, 1.0]:
		draw_line(c + Vector2(dx * 0.3 * s, -0.3 * s),
			c + Vector2(dx * 0.34 * s, 0.34 * s), color, maxf(0.055 * s, 2.0))
		draw_line(c + Vector2(dx * 0.18 * s, -0.3 * s),
			c + Vector2(dx * 0.18 * s, 0.06 * s), _dim(), maxf(0.04 * s, 1.0))
	draw_rect(Rect2(c.x - 0.22 * s, c.y + 0.06 * s, 0.44 * s, 0.09 * s), color)
	draw_line(c + Vector2(-0.22 * s, 0.06 * s), c + Vector2(-0.22 * s, -0.08 * s),
		color, maxf(0.05 * s, 2.0))




func _helipuerto_icon(c: Vector2, s: float) -> void:
	draw_arc(c, 0.32 * s, 0.0, TAU, 28, color, maxf(0.06 * s, 2.0))
	for dx in [-0.13, 0.13]:
		draw_line(c + Vector2(dx * s, -0.17 * s), c + Vector2(dx * s, 0.17 * s),
			color, maxf(0.07 * s, 2.0))
	draw_line(c + Vector2(-0.13 * s, 0.0), c + Vector2(0.13 * s, 0.0),
		color, maxf(0.07 * s, 2.0))



func _pingpong_icon(c: Vector2, s: float) -> void:
	draw_rect(Rect2(c + Vector2(-0.34, -0.22) * s, Vector2(0.68, 0.44) * s), _dim())
	draw_rect(Rect2(c + Vector2(-0.34, -0.22) * s, Vector2(0.68, 0.44) * s), color, false, maxf(1.0, s * 0.035))
	draw_line(c + Vector2(0, -0.26) * s, c + Vector2(0, 0.26) * s, color, maxf(1.0, s * 0.045))
	draw_circle(c + Vector2(0.2, 0.03) * s, s * 0.1, color)
	draw_line(c + Vector2(0.2, 0.09) * s, c + Vector2(0.2, 0.22) * s, color, maxf(1.0, s * 0.06))
	draw_circle(c + Vector2(-0.17, -0.08) * s, s * 0.035, color)






func _pared_reflejos_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1.0, s * 0.035)
	draw_rect(Rect2(c + Vector2(-0.38, -0.26) * s, Vector2(0.76, 0.52) * s), color, false, w)
	for fila in 2:
		for col in 4:
			var p: Vector2 = c + Vector2(-0.255 + 0.17 * float(col), -0.1 + 0.2 * float(fila)) * s
			if fila == 0 and col == 2:
				draw_circle(p, s * 0.095, _dim())
				draw_circle(p, s * 0.06, color)
			else:
				draw_arc(p, s * 0.055, 0.0, TAU, 14, color, w)






func _memorama_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1.0, s * 0.035)
	var carta := PackedVector2Array([Vector2(-0.14, -0.22) * s, Vector2(0.14, -0.22) * s,
		Vector2(0.14, 0.22) * s, Vector2(-0.14, 0.22) * s])
	draw_set_transform_matrix(Transform2D(-0.14, c + Vector2(-0.18, 0.01) * s))
	draw_colored_polygon(carta, _dim())
	draw_colored_polygon(PackedVector2Array([Vector2(0, -0.1) * s, Vector2(0.07, 0) * s,
		Vector2(0, 0.1) * s, Vector2(-0.07, 0) * s]), color)
	draw_set_transform_matrix(Transform2D(0.14, c + Vector2(0.18, 0.01) * s))
	var borde: PackedVector2Array = carta.duplicate()
	borde.append(carta[0])
	draw_polyline(borde, color, w)
	draw_circle(Vector2.ZERO, s * 0.065, color)
	draw_set_transform_matrix(Transform2D.IDENTITY)



func _posadero_loro_icon(c: Vector2, s: float) -> void:
	var ancho: float = maxf(1.0, s * 0.05)
	draw_line(c + Vector2(0, -0.29) * s, c + Vector2(0, 0.26) * s, color, ancho)
	draw_line(c + Vector2(-0.28, -0.26) * s, c + Vector2(0.28, -0.26) * s, color, ancho)
	draw_line(c + Vector2(-0.25, 0.29) * s, c + Vector2(0.25, 0.29) * s, color, ancho)
	for x in [-0.15, 0.15]:
		draw_line(c + Vector2(0, 0.02) * s, c + Vector2(x, 0.02) * s, color, ancho)
		draw_arc(c + Vector2(x, -0.015) * s, 0.075 * s, 0.0, PI, 12, color, ancho)


func _basket_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1, s * 0.035)
	draw_rect(Rect2(c + Vector2(- 0.34, - 0.32) * s, Vector2(0.68, 0.37) * s), color, false, w)
	draw_rect(Rect2(c + Vector2(- 0.12, - 0.19) * s, Vector2(0.24, 0.17) * s), color, false, w)
	draw_arc(c + Vector2(0, 0.04) * s, s * 0.19, 0, TAU, 24, color, w)
	for x in [- 0.15, 0, 0.15]: draw_line(c + Vector2(x, 0.08) * s, c + Vector2(x * 0.6, 0.31) * s, color, w)
	draw_line(c + Vector2(- 0.09, 0.31) * s, c + Vector2(0.09, 0.31) * s, color, w)

func _reloj_pie_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1, s * 0.035)
	draw_rect(Rect2(c + Vector2(- 0.23, - 0.39) * s, Vector2(0.46, 0.78) * s), color, false, w)
	draw_arc(c + Vector2(0, - 0.19) * s, s * 0.15, 0, TAU, 24, color, w)
	draw_line(c + Vector2(0, - 0.19) * s, c + Vector2(0.08, - 0.25) * s, color, w)
	draw_line(c + Vector2(0, - 0.02) * s, c + Vector2(0, 0.24) * s, color, w)
	draw_circle(c + Vector2(0, 0.24) * s, s * 0.065, color)


func _robot_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1, s * 0.035)
	draw_arc(c, s * 0.31, 0, TAU, 28, color, w)
	draw_arc(c + Vector2(0, - 0.1) * s, s * 0.07, 0, TAU, 12, color, w)
	draw_line(c + Vector2(- 0.12, 0.12) * s, c + Vector2(0.12, 0.12) * s, color, w)
	for i in 3:
		var a: float = TAU * i / 3
		draw_line(c + Vector2(0.23, 0.23) * s, c +(Vector2(0.23, 0.23) + Vector2(cos(a), sin(a)) * 0.13) * s, color, w)

func _holo_icon(c: Vector2, s: float) -> void:
	var w: float = maxf(1, s * 0.035)
	draw_rect(Rect2(c + Vector2(- 0.36, - 0.08) * s, Vector2(0.72, 0.35) * s), color, false, w)
	draw_line(c + Vector2(0, - 0.08) * s, c + Vector2(0, 0.27) * s, color, w)
	for x in [- 0.2, 0, 0.2]:
		draw_circle(c + Vector2(x, - 0.25) * s, s * 0.045, color)
		draw_line(c + Vector2(x, - 0.2) * s, c + Vector2(x, - 0.1) * s, color, w)


func _surf_icon(c: Vector2, s: float) -> void:

	draw_arc(c + Vector2(0.08, - 0.08) * s, s * 0.25, PI * 0.75, TAU * 1.02, 24, color, 2.0, true)
	draw_line(c + Vector2(- 0.38, 0.27) * s, c + Vector2(0.37, 0.27) * s, color, 2.0, true)
	draw_line(c + Vector2(- 0.32, 0.16) * s, c + Vector2(0.25, - 0.02) * s, color, 3.0, true)




func _viento(c: Vector2, s: float) -> void:
	var u: float = s / 24.0
	var o: Vector2 = c - Vector2(12.0, 12.0) * u
	for r in [[2, 7, 14, 2], [16, 5, 2, 2], [2, 12, 18, 2], [20, 10, 2, 2], [2, 17, 11, 2], [13, 19, 2, 2]]:
		draw_rect(Rect2(o + Vector2(r[0], r[1]) * u, Vector2(r[2], r[3]) * u), color)
