extends Control













const Carrera := preload("res://features/career/simulador.gd")
const Coche := preload("res://ui/shop_car.gd")
const ModeloCockpit := preload("res://ui/house/simulador_prop.gd")
const MarcoJuego := preload("res://ui/house/juego_marco.gd")

const Detalle := preload("res://features/stadium/exterior_detail.gd")

const ASFALTO: Color = Color("353e4b")
const CAL: Color = Color("e9dfc1")
const ROJO: Color = Color("b75040")
const ARCEN: Color = Color("6b7178")
const GRAVA: Color = Color("cbb68a")
const CESPED: Color = Color("698362")
const TALUD: Color = Color("62805a")
const METAL: Color = Color("c3c8cc")
const POSTE: Color = Color("6d737a")
const HORMIGON: Color = Color("b8b3a7")
const HORMIGON_OSCURO: Color = Color("7e7a72")
const ACERA: Color = Color("a8a498")
const AGUA: Color = Color("4d7f9e")
const ORILLA: Color = Color("c9b98f")


const ALTO_TUNEL: float = 6.5
const ALTO_COLINA: float = 22.0


const ALTO_FRONTON: float = 11.0
const ALA_COLINA: float = 22.0
const RADIO_COLINA: float = 75.0
const COLINA: Color = Color("5f7d55")


const HINCHAS: Array[String] = ["fan_red_idle_01", "fan_red_idle_03", "fan_red_cheer_01",
	"fan_red_cheer_02", "fan_red_cheer_03", "fan_blue_idle_01", "fan_blue_idle_03",
	"fan_blue_cheer_01", "fan_blue_cheer_02", "fan_blue_cheer_04"]
const ALTO_HINCHA: float = 2.1

const VALLAS: Array[float] = [200.0, 236.0, 362.0, 398.0, 570.0, 672.0]
const LAGO: Vector2 = Vector2(78, -13)
const LAGO_RADIOS: Vector2 = Vector2(36, 28)
const RIO_ANCHO: float = 14.0






class BotonVolante extends Control:
	var lado: int = 1
	var pulsado: bool = false
	var llenado: float = 0.0
	func _draw() -> void:
		var placa: StyleBoxFlat = CareerTheme.plate()
		placa.set_corner_radius_all(18)
		if pulsado:
			placa.border_color = CareerTheme.accent()
			placa.set_border_width_all(4)
		draw_style_box(placa, Rect2(Vector2.ZERO, size))
		if llenado > 0.01:
			var tinte: Color = CareerTheme.accent()
			tinte.a = 0.3
			var ancho: float =(size.x - 12.0) * llenado
			draw_rect(Rect2(6.0 if lado > 0 else size.x - 6.0 - ancho, 6.0, ancho, size.y - 12.0), tinte)
		var tinta: Color = CareerTheme.INK_LIGHT if pulsado else CareerTheme.TEXT_DIM
		var centro: Vector2 = size * 0.5
		var alto: float = minf(size.y * 0.2, 36.0)
		for k in 2:
			var punta: float = centro.x + lado *((float(k) - 0.5) * alto * 0.9 + alto * 0.3)
			draw_polyline(PackedVector2Array([Vector2(punta - lado * alto * 0.6, centro.y - alto),
				Vector2(punta, centro.y), Vector2(punta - lado * alto * 0.6, centro.y + alto)]), tinta, 10.0)








class BandaMeta extends Control:
	const ENTRA: float = 0.3
	const SELLO: float = 0.22
	const GOLPE: float = 0.16
	const SALE: float = 1.3
	const FUERA: float = 0.25
	const CUADRO: float = 16.0
	var t: float = -1.0
	var color_banda: Color = CareerTheme.INK_LIGHT
	var palabra: String = ""
	var alto_banda: float = 210.0
	var centro_y: float = 0.36
	func _draw() -> void:
		if t < 0.0 or t > SALE + FUERA:
			return
		var w: float = size.x
		var arriba: float = size.y * centro_y - alto_banda * 0.5
		var sale: float = pow(clampf((t - SALE) / FUERA, 0.0, 1.0), 3.0) * w
		var cortina: float = 1.0 - pow(1.0 - clampf((t + 0.05) / ENTRA, 0.0, 1.0), 5.0)
		var entra: float = 1.0 - pow(1.0 - clampf(t / ENTRA, 0.0, 1.0), 5.0)
		var golpe: float = t - SELLO - GOLPE
		var tiembla := Vector2.ZERO
		if golpe > 0.0 and golpe < 0.2:
			tiembla = Vector2(sin(t * 95.0) * 10.0, cos(t * 70.0) * 6.0) *(1.0 - golpe / 0.2)
		draw_rect(Rect2(- w *(1.0 - cortina) + sale, arriba - 12.0, w, alto_banda + 24.0), CareerTheme.INK_DARK)
		var o := Vector2(- w *(1.0 - entra) + sale, arriba) + tiembla
		draw_rect(Rect2(o, Vector2(w, alto_banda)), color_banda)

		for fila in 4:
			var y: float = o.y +(float(fila) if fila < 2 else float(fila - 4) + alto_banda / CUADRO) * CUADRO
			for i in ceili(w / CUADRO):
				if (i + fila) % 2 == 0:
					draw_rect(Rect2(o.x + i * CUADRO, y, CUADRO, CUADRO), CareerTheme.INK_DARK)

		for k in 5:
			var fase: float = clampf((t - 0.02 * k) /(ENTRA + 0.08), 0.0, 1.0)
			if fase <= 0.0 or fase >= 1.0:
				continue
			var largo: float = w *(0.22 + 0.08 * float(k % 3))
			var raya: Color = CareerTheme.INK_LIGHT
			raya.a = 0.55 *(1.0 - fase)
			var x: float = lerpf(- largo, w, sin(fase * PI * 0.5))
			var y: float = arriba - 40.0 +(alto_banda + 80.0) *(0.1 + 0.2 * float(k))
			draw_rect(Rect2(x, y, largo, 4.0 if k % 2 == 0 else 6.0), raya)
		var alfa: float = clampf((t - SELLO) / 0.06, 0.0, 1.0)
		if alfa <= 0.0 or palabra.is_empty():
			return
		var fuente: Font = get_theme_font("font", "Label")
		var cuerpo: int = CareerTheme.T_SCORE
		var ancho: float = fuente.get_string_size(palabra, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo).x
		var escala: float = minf(1.7,(w - 120.0) / maxf(ancho, 1.0))
		escala *= lerpf(2.6, 1.0, pow(clampf((t - SELLO) / GOLPE, 0.0, 1.0), 2.0))
		draw_set_transform(Vector2(o.x + w * 0.5, o.y + alto_banda * 0.5), 0.0, Vector2(escala, escala))
		var base := Vector2(- ancho * 0.5,(fuente.get_ascent(cuerpo) - fuente.get_descent(cuerpo)) * 0.5)
		var relieve: Color = color_banda.darkened(0.6)
		relieve.a = alfa
		var borde: Color = CareerTheme.INK_DARK
		borde.a = alfa
		for d in [9.0, 6.0, 3.0]:
			draw_string_outline(fuente, base + Vector2(d, d), palabra, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo, 8, borde)
			draw_string(fuente, base + Vector2(d, d), palabra, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo, relieve)
		draw_string_outline(fuente, base, palabra, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo, 8, borde)
		var tinta: Color = CareerTheme.INK_LIGHT
		tinta.a = alfa
		draw_string(fuente, base, palabra, HORIZONTAL_ALIGNMENT_LEFT, -1, cuerpo, tinta)
		draw_set_transform(Vector2.ZERO)


class DiscoMedalla extends Control:
	var claro: Color = CareerTheme.INK_LIGHT
	var oscuro: Color = CareerTheme.TEXT_DIM
	func _draw() -> void:
		var r: float = minf(size.x, size.y) * 0.34
		var c := Vector2(size.x * 0.5, size.y - r - 2.0)
		var cinta: Color = CareerTheme.NAV_PLANTILLA
		for s in [-1.0, 1.0]:
			draw_colored_polygon(PackedVector2Array([Vector2(c.x + s * r * 0.95, 0.0),
				Vector2(c.x + s * r * 0.3, 0.0), Vector2(c.x - s * r * 0.25, c.y - r * 0.5),
				Vector2(c.x + s * r * 0.35, c.y - r * 0.5)]), cinta if s < 0.0 else cinta.darkened(0.3))
		draw_circle(c, r, oscuro)
		draw_circle(c, r * 0.8, claro)
		var estrella := PackedVector2Array()
		for i in 10:
			var a: float = - PI * 0.5 + i * PI / 5.0
			estrella.append(c + Vector2(cos(a), sin(a)) * r *(0.5 if i % 2 == 0 else 0.21))
		draw_colored_polygon(estrella, oscuro)




class MapaRuta extends Control:
	var metros: float = 0.0
	var lateral: float = 0.0
	var fuera: bool = false
	var rival: float = -1.0
	var placa: StyleBoxFlat = CareerTheme.plate()
	var _ruta := PackedVector2Array()
	var _tunel := PackedVector2Array()
	var _caja := Rect2()





	var _puntos: Control
	func _ready() -> void:
		_puntos = Control.new()
		_puntos.name = "Puntos"
		_puntos.mouse_filter = Control.MOUSE_FILTER_IGNORE
		add_child(_puntos)
		_puntos.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		_puntos.draw.connect(_dibujar_puntos)
		resized.connect(queue_redraw)

	func mover(m: float, l: float, f: bool, r: float) -> void:
		if m == metros and l == lateral and f == fuera and r == rival:
			return
		metros = m
		lateral = l
		fuera = f
		rival = r
		if _puntos != null:
			_puntos.queue_redraw()
	func _preparar() -> void:
		for i in 181:
			_ruta.append(Carrera.punto(Carrera.META * i / 180.0))
		var m: float = Carrera.TUNEL.x
		while m <= Carrera.TUNEL.y:
			_tunel.append(Carrera.punto(m))
			m += 5.0
		_caja = Rect2(_ruta[0], Vector2.ZERO)
		for p in _ruta:
			_caja = _caja.expand(p)
	func _a_mapa(p: Vector2) -> Vector2:
		var escala: float = minf((size.x - 30) / _caja.size.x,(size.y - 30) / _caja.size.y)
		return size * 0.5 +(p - _caja.get_center()) * escala
	func _draw() -> void:
		if _ruta.is_empty():
			_preparar()
		draw_style_box(placa, Rect2(Vector2.ZERO, size))
		var agua: Color = CareerTheme.NAV_PLANTILLA
		agua.a = 0.75
		var lago := PackedVector2Array()
		for i in 25:
			var a: float = TAU * i / 24.0
			lago.append(_a_mapa(LAGO + Vector2(cos(a) * LAGO_RADIOS.x, sin(a) * LAGO_RADIOS.y)))
		draw_colored_polygon(lago, agua)
		var rio := PackedVector2Array()
		for z in range(int(LAGO.y), 200, 10):
			rio.append(_a_mapa(Vector2(Carrera.rio_x(float(z)), float(z))))
		draw_polyline(rio, agua, 3.0, true)
		var ruta := PackedVector2Array()
		for p in _ruta:
			ruta.append(_a_mapa(p))
		draw_polyline(ruta, CareerTheme.TEXT_DIM, 9.0, true)
		draw_polyline(ruta, CareerTheme.SURFACE, 5.0, true)

		var tunel := PackedVector2Array()
		for p in _tunel:
			tunel.append(_a_mapa(p))
		draw_polyline(tunel, CareerTheme.TEXT_DIM, 9.0, true)
		for c in Carrera.CONTROLES:
			draw_circle(_a_mapa(Carrera.punto(c)), 5, CareerTheme.TEXT)

		var meta: Vector2 = _a_mapa(Carrera.punto(0.0))
		draw_line(meta - Vector2(8, 0), meta + Vector2(8, 0), CareerTheme.TEXT, 3.0)
		if _puntos != null:
			_puntos.queue_redraw()
	func _dibujar_puntos() -> void:
		if _ruta.is_empty():
			_preparar()
		if rival >= 0.0:
			_puntos.draw_circle(_a_mapa(Carrera.punto(rival)), 6, CareerTheme.TEXT_DIM)
		var yo: Vector3 = Carrera.mundo(metros, lateral)
		_puntos.draw_circle(_a_mapa(Vector2(yo.x, yo.z)), 8, CareerTheme.DANGER if fuera else CareerTheme.accent())

var carrera = Carrera.new()
var coches: Array[String] = []
var elegido: int = 0
var estado: String = "seleccion"
var _pausa_previa: bool = false
var _cerrando: bool = false
var _vp: SubViewport
var _mundo: Node3D
var _cam: Camera3D



var contexto_casa: Dictionary = {}
var _vp_casa: SubViewport
var _cam_casa: Camera3D
var _video_casa: Node3D
var _marco_casa: Transform3D = Transform3D.IDENTITY


var _volante_casa: Node3D
var _margen_ui: MarginContainer
var _coche: Node3D
var _fantasma: Node3D
var _trazo_rival: PackedFloat32Array = PackedFloat32Array()
var _eco: StandardMaterial3D



var _fantasma_malla: ArrayMesh
var _fantasma_centros := PackedVector3Array()
var _fantasma_indices: Array[PackedInt32Array] = []
var _fantasma_orden := PackedInt32Array()
var _fantasma_claves: Array[Vector2] = []
var _nombre: Label
var _mensaje: Label
var _salida: Button
var _inicio: Button
var _pausa: Button
var _anterior: Button
var _siguiente: Button
var _selector: HBoxContainer
var _ficha: VBoxContainer
var _medallas: Array[Label] = []
var _record: Label
var _marcas: Dictionary = {}
var _porticos: Array[MeshInstance3D] = []
var _cam_carril: float = 0.0
var _cam_rumbo: float = 0.0
var _ritmo: float = 0.0










var _monedas_oro: MultiMesh
var _monedas_sello: MultiMesh
var _monedas_vistas := PackedByteArray()
var _monedas_pos := PackedVector3Array()
var _monedas_xf := PackedFloat32Array()
var _monedas_s := PackedFloat32Array()
var _monedas_alto := PackedFloat32Array()

var _moneda_tumbada := Transform3D(Basis.from_euler(Vector3(PI * 0.5, 0, 0)), Vector3.ZERO)


var _telas: Dictionary = {}
var _piezas: Dictionary = {}
var _hinchas: Dictionary = {}
var _hinchas_luz: Dictionary = {}

var _chevrones: Array[Vector2] = []

var _pilas: Array[Vector2] = []
var _rombos: Array[Vector2] = []

var _pilotos: StandardMaterial3D
var _halos: Array[MeshInstance3D] = []
var _luz_freno: OmniLight3D
var _humos: Array[CPUParticles3D] = []
var _llamas: Array[MeshInstance3D] = []
var _frenando: bool = false
var _petardo: float = 0.0



const RODADAS_MAX: int = 1600

const PORTICO_POR_PASAR: Color = Color("427dae")
const PORTICO_PASADO: Color = Color("6ebfa1")
const PORTICO_PERDIDO: Color = Color("bb6659")
const RODADA_TRAMO: float = 0.9
const GOMA: Color = Color("141518")



const BALANCEO: Dictionary = {"coche_compacto": 1.0, "coche_sedan": 1.1, "coche_familiar": 1.3,
	"coche_pickup": 1.6, "coche": 0.8, "coche_muscle": 1.2, "coche_gt": 0.6, "coche_hiper": 0.45}
var _derrape: float = 0.0
var _cola: float = 0.0
var _camino: float = 0.0
var _deslizo: float = 0.0
var _x_previo: float = 0.0
var _balanceo: float = 0.0
var _balanceo_v: float = 0.0
var _cabeceo: float = 0.0
var _cabeceo_v: float = 0.0
var _frenazo: float = 0.0
var _curva_max: float = 0.05
var _eje_delantero: float = 1.3
var _manguetas: Array[Node3D] = []
var _ruedas_atras: Array[Vector3] = []
var _humos_rueda: Array[CPUParticles3D] = []
var _rodadas: MultiMesh
var _rodadas_n: int = 0
var _rodada_ultima: Array = []
var _semaforo: Array[MeshInstance3D] = []
var _luz_on: StandardMaterial3D
var _luz_off: StandardMaterial3D
var _alto_coche: float = 0.0
var _destello_moneda: float = 0.0
var _rayas: Array[Line2D] = []
var _pantalla: SubViewportContainer
var _capa: MarginContainer
var _reloj: Label
var _diferencia: Label
var _hud: Label
var _botin: Label
var _aviso: Label
var _resultado: PanelContainer
var _resultado_scroll: ScrollContainer
var _resultado_titulo: Label
var _resultado_detalle: Label
var _nuevo_record: bool = false

var _nuevos_logros: Array[String] = []
var _mapa: MapaRuta
var _fila: HBoxContainer
var _reinicio: Button
var _cambiar: Button


const ALTO_MANDO: float = 180.0
var _pie: VBoxContainer
var _mando: HBoxContainer
var _izq: BotonVolante
var _der: BotonVolante
var _ambos: Label

var _dedos: Dictionary = {}





const RAMPA_BASE: float = 0.3
const RAMPA_SUBE: float = 3.0




const ZONA_VOLANTE: float = 0.35

const ZONA_GATILLO: float = 0.3
var _lado: int = 0
var _rampa: float = 0.0
var _pulsa_izq: bool = false
var _pulsa_der: bool = false
var _cuenta: float = 0.0
var _ya: float = 0.0
var _aviso_control: float = 0.0
var _texto_control: String = ""
var _estaba_fuera: bool = false







const PARADA_META: float = 45.0
const TARJETA_META: float = 1.2
const BOTONES_META: float = 1.3
const CUENTA_META: float = 1.35
const RECORD_META: float = 1.95
var _meta_t: float = -1.0
var _meta_v: float = 0.0
var _meta_frenada: float = 0.0
var _meta_rumbo: float = 0.0
var _meta_desde: Vector3 = Vector3.ZERO
var _meta_mira: Vector3 = Vector3.ZERO
var _meta_fov: float = 59.0
var _medalla_meta: int = 0
var _pasada: float = 0.0
var _banda: BandaMeta
var _destello: ColorRect
var _disco: DiscoMedalla
var _coche_meta: Label
var _tiempo_meta: Label
var _pastilla: PanelContainer
var _pastilla_texto: Label
var _confeti: CPUParticles3D
var _gradas_hinchas: Array[MultiMeshInstance3D] = []
var _vitores: Dictionary = {}

func _ready() -> void:
	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	process_mode = Node.PROCESS_MODE_ALWAYS
	_pausa_inicial()
	coches = Carrera.disponibles(Career.lifestyle)
	_construir_ui()
	_construir_pista()
	_montar_en_casa()

	Entrada.mando_perdido.connect(_pausar)
	_elegir(0)

func _pausa_inicial() -> void:
	_pausa_previa = get_tree().paused
	get_tree().paused = true

func _construir_ui() -> void:
	var fondo := ColorRect.new()
	fondo.color = CareerTheme.BG_DEEP
	fondo.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(fondo)
	var margen := MarginContainer.new()
	_margen_ui = margen
	margen.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for lado in ["left", "right", "top", "bottom"]:
		margen.add_theme_constant_override("margin_" + lado, 24)
	add_child(margen)
	var col := VBoxContainer.new()
	col.add_theme_constant_override("separation", 12)


	var donde: BoxContainer = MarcoJuego.montar(margen, col, get_viewport())
	var cabecera := HBoxContainer.new()
	col.add_child(cabecera)
	cabecera.add_theme_constant_override("separation", 12)
	var titulo := _texto(I18n.t("SIMULADOR DE CARRERAS"), CareerTheme.T_DIM)
	titulo.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabecera.add_child(titulo)
	_pausa = _boton(I18n.t("PAUSA"), _pausar)
	_pausa.custom_minimum_size.x = 164
	cabecera.add_child(_pausa)
	_salida = _boton(I18n.t("SALIR"), _cerrar)
	_salida.custom_minimum_size.x = 164
	cabecera.add_child(_salida)
	_selector = HBoxContainer.new()
	_selector.add_theme_constant_override("separation", 14)
	col.add_child(_selector)
	_anterior = _boton("<", func() -> void: _elegir(-1))
	_selector.add_child(_anterior)
	_nombre = _texto("", CareerTheme.T_CARD)
	_nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_nombre.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_selector.add_child(_nombre)
	_siguiente = _boton(">", func() -> void: _elegir(1))
	_selector.add_child(_siguiente)

	_ficha = VBoxContainer.new()
	_ficha.add_theme_constant_override("separation", 8)
	col.add_child(_ficha)
	var medallas := HBoxContainer.new()
	medallas.add_theme_constant_override("separation", 12)
	_ficha.add_child(medallas)
	for nombre in ["ORO", "PLATA", "BRONCE"]:
		_medallas.append(_tarjeta_dato(medallas, I18n.t(nombre)))
	_record = _texto("", CareerTheme.T_DIM)
	_record.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_ficha.add_child(_record)
	var pantalla := SubViewportContainer.new()
	_pantalla = pantalla
	pantalla.clip_contents = true
	pantalla.stretch = true
	pantalla.size_flags_vertical = Control.SIZE_EXPAND_FILL
	pantalla.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	pantalla.custom_minimum_size = Vector2.ZERO
	pantalla.mouse_filter = Control.MOUSE_FILTER_IGNORE
	donde.add_child(pantalla)
	_vp = SubViewport.new()
	_vp.own_world_3d = true
	_vp.size = Vector2i(1016, 1000)
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	pantalla.add_child(_vp)
	for i in 12:
		var linea := Line2D.new()
		linea.width = 2.0
		linea.default_color = CareerTheme.INK_LIGHT
		linea.visible = false
		pantalla.add_child(linea)
		_rayas.append(linea)
	_construir_capa(pantalla)
	_construir_festejo(pantalla)
	_mensaje = _texto("", CareerTheme.T_DIM)
	_mensaje.custom_minimum_size.y = 72


	_mensaje.add_to_group(Entrada.VIVO_GROUP)
	col.add_child(_mensaje)
	_pie = VBoxContainer.new()
	_pie.alignment = BoxContainer.ALIGNMENT_CENTER


	add_child(_pie)
	_pie.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_mando = HBoxContainer.new()
	_mando.add_theme_constant_override("separation", 12)
	_mando.custom_minimum_size.y = ALTO_MANDO
	_mando.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_pie.add_child(_mando)
	_izq = BotonVolante.new()
	_izq.lado = -1
	_der = BotonVolante.new()
	_ambos = _texto(I18n.t("LOS DOS: FRENO"), CareerTheme.T_DIM)
	_ambos.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_ambos.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_ambos.custom_minimum_size = Vector2(170, ALTO_MANDO)
	for pieza in [_izq, _ambos, _der]:
		if pieza is BotonVolante:
			pieza.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			pieza.mouse_filter = Control.MOUSE_FILTER_IGNORE
		_mando.add_child(pieza)
	_fila = HBoxContainer.new()
	_fila.add_theme_constant_override("separation", 14)
	_pie.add_child(_fila)
	_inicio = _boton(I18n.t("CONDUCIR"), _empezar)

	_inicio.set_meta(Entrada.PRIMERO_META, true)
	CareerTheme.style_button(_inicio, CareerTheme.Kind.PRIMARY, CareerTheme.T_BODY)
	_inicio.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_fila.add_child(_inicio)



	_reinicio = CareerUi.accion("reiniciar", I18n.t("REINICIAR"), CareerTheme.NAV_CASA)
	_reinicio.pressed.connect(_reiniciar)
	_fila.add_child(_reinicio)
	_cambiar = CareerUi.accion("coche", I18n.t("CAMBIAR COCHE"), CareerTheme.NAV_CASA)
	_cambiar.pressed.connect(func() -> void: _elegir(0))
	_fila.add_child(_cambiar)
	_pantalla.resized.connect(_ajustar_vista)


func _montar_en_casa() -> void:
	var origen: SubViewport = contexto_casa.get("viewport")
	var prop: Dictionary = contexto_casa.get("prop", {})
	if not is_instance_valid(origen) or prop.get("kind", "") != "simulador" \
			or not prop.get("rect") is Rect2:
		return
	var rect: Rect2 = prop["rect"]
	var centro := Vector3(rect.get_center().x, 0, rect.get_center().y)
	var fabrica: int = int(prop.get("face_fab", House.base_face(prop)))&3
	var giro: int =(int(prop.get("face", fabrica)) - fabrica)&3
	_marco_casa = Transform3D(Basis(Vector3.UP, PI * 0.5 * giro), centro)
	_volante_casa = origen.find_child("SimuladorVolante", true, false) as Node3D


	_pantalla.remove_child(_vp)
	add_child(_vp)
	_vp.size = Vector2i(1536, 354)
	_vp_casa = SubViewport.new()
	_vp_casa.name = "VistaCasaReal"
	_vp_casa.world_3d = origen.find_world_3d()
	_vp_casa.size = Vector2i(1016, 1000)
	_vp_casa.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	_pantalla.add_child(_vp_casa)
	_video_casa = Node3D.new()
	_video_casa.name = "VideoSimuladorTemporal"
	origen.add_child(_video_casa)
	_video_casa.transform = _marco_casa
	for i in [-1, 0, 1]:
		var marco: Dictionary = ModeloCockpit.marco_monitor(i)
		var base: Basis = marco["base"]
		var monitor := MeshInstance3D.new()
		monitor.name = "VideoMonitor%d" % i
		var cuadro := QuadMesh.new()
		cuadro.size = marco["size"]
		monitor.mesh = cuadro
		monitor.position =(marco["centro"] as Vector3) \
				+ base * Vector3(0, 0, float(marco["frente"]))
		monitor.basis = base * Basis(Vector3.UP, PI)
		monitor.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		var material := StandardMaterial3D.new()
		material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		material.albedo_texture = _vp.get_texture()
		material.uv1_scale = Vector3(1.0 / 3.0, 1, 1)


		material.uv1_offset = Vector3(float(1 - i) / 3.0, 0, 0)
		monitor.material_override = material
		_video_casa.add_child(monitor)
	_cam_casa = Camera3D.new()
	_cam_casa.name = "CamaraCockpitCasa"
	_cam_casa.near = 0.03
	_cam_casa.far = 100
	_vp_casa.add_child(_cam_casa)
	_cam_casa.current = true
	_ajustar_vista()


func _ajustar_vista() -> void:
	_ajustar_pie()
	_recortar_seleccion()
	if not is_instance_valid(_pantalla) or _pantalla.size.y <= 0:
		return
	var aspecto: float = _pantalla.size.x / _pantalla.size.y
	if is_instance_valid(_resultado):
		var margen: float = minf(24, _pantalla.size.y * 0.06)
		_resultado.offset_bottom = - margen
		var alto: float = maxf(56, _pantalla.size.y - margen * 2)
		_resultado.offset_top = - margen -(alto if UiKit.es_horizontal() else minf(360, alto))
		_resultado.offset_left = minf(24, _pantalla.size.x * 0.04)
		_resultado.offset_right = - _resultado.offset_left
		_resultado_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED if UiKit.es_horizontal() else ScrollContainer.SCROLL_MODE_AUTO
	if is_instance_valid(_ambos):
		_ambos.custom_minimum_size.x = minf(170, maxf(60, size.x * 0.3))
	if is_instance_valid(_cam_casa):


		var ancho: float = 2.2 if aspecto > 1.35 else 0.74
		var alto: float = maxf(0.55, ancho / maxf(aspecto, 0.2))
		_cam_casa.fov = clampf(rad_to_deg(2 * atan(alto * 0.5)), 30, 100)
		_cam_casa.position = _marco_casa * Vector3(0, 1.31, - 0.28)
		_cam_casa.look_at(_marco_casa * Vector3(0, 1.29, 0.72), Vector3.UP)


	if is_instance_valid(_mapa):
		var compacto: bool = _pantalla.size.x < 700 or _pantalla.size.y < 550
		var bajo: bool = _pantalla.size.y < 140
		var cuerpo: int = CareerTheme.T_DIM if bajo else CareerTheme.T_CARD if compacto else CareerTheme.T_TITLE_MODAL
		var respiro: int = int(minf(18, minf(_pantalla.size.y * 0.06, _pantalla.size.x * 0.03)))
		for lado in ["left", "right", "top", "bottom"]:
			_capa.add_theme_constant_override("margin_" + lado, respiro)
		_mapa.visible = _pantalla.size.y >= 160
		_diferencia.visible = _pantalla.size.y >= 160
		_aviso.visible = _pantalla.size.y >= 220
		_hud.get_parent().visible = _pantalla.size.y >= 130
		_botin.get_parent().visible = _pantalla.size.y >= 130
		_mapa.custom_minimum_size = Vector2(
			minf(300, _pantalla.size.x * 0.3), minf(250, _pantalla.size.y * 0.23))
		_reloj.custom_minimum_size.x = minf(210, _pantalla.size.x * 0.29)
		_reloj.add_theme_font_size_override("font_size", cuerpo)
		_reloj.custom_minimum_size.y = cuerpo * 1.2
		_diferencia.add_theme_font_size_override("font_size", CareerTheme.T_DIM if compacto else CareerTheme.T_BODY)
		_diferencia.custom_minimum_size.y =(CareerTheme.T_DIM if compacto else CareerTheme.T_BODY) * 1.2
		_hud.custom_minimum_size.y = CareerTheme.T_CARD * 1.2
		_botin.custom_minimum_size.y = CareerTheme.T_CARD * 1.2
		_hud.custom_minimum_size.x = minf(_ancho_de(_hud, "888 km/h"), _pantalla.size.x * 0.42)
		_botin.custom_minimum_size.x = minf(_ancho_de(_botin, "88/88"), _pantalla.size.x * 0.25)




func _construir_festejo(pantalla: Control) -> void:
	_destello = ColorRect.new()
	_destello.color = CareerTheme.INK_LIGHT
	_destello.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_destello.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_destello.hide()
	pantalla.add_child(_destello)
	_banda = BandaMeta.new()
	_banda.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_banda.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_banda.hide()
	pantalla.add_child(_banda)
	_resultado = PanelContainer.new()
	_resultado.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_resultado.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_resultado.offset_left = 24
	_resultado.offset_right = -24
	_resultado.offset_top = -24
	_resultado.offset_bottom = -24
	_resultado.grow_vertical = Control.GROW_DIRECTION_BEGIN
	pantalla.add_child(_resultado)


	var tira := DragScroll.new()
	tira.paginar = false
	_resultado_scroll = tira
	_resultado_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	_resultado_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	_resultado.add_child(_resultado_scroll)
	var resumen := VBoxContainer.new()
	resumen.add_theme_constant_override("separation", 6)
	resumen.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_resultado_scroll.add_child(resumen)
	var cabeza := HBoxContainer.new()
	cabeza.add_theme_constant_override("separation", 18)
	resumen.add_child(cabeza)
	_disco = DiscoMedalla.new()
	_disco.custom_minimum_size = Vector2(104, 112)
	_disco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cabeza.add_child(_disco)
	var titulos := VBoxContainer.new()
	titulos.alignment = BoxContainer.ALIGNMENT_CENTER
	titulos.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cabeza.add_child(titulos)
	_resultado_titulo = _texto("", CareerTheme.T_CARD)
	titulos.add_child(_resultado_titulo)
	_coche_meta = _texto("", CareerTheme.T_DIM)
	_coche_meta.add_theme_color_override("font_color", CareerTheme.TEXT_DIM)
	titulos.add_child(_coche_meta)
	_tiempo_meta = _texto("", CareerTheme.T_SCORE)
	_tiempo_meta.add_theme_color_override("font_color", CareerTheme.INK_LIGHT)
	_tiempo_meta.autowrap_mode = TextServer.AUTOWRAP_OFF
	resumen.add_child(_tiempo_meta)
	_pastilla = PanelContainer.new()
	_pastilla.mouse_filter = Control.MOUSE_FILTER_IGNORE


	_pastilla.size_flags_horizontal = Control.SIZE_FILL
	var estilo: StyleBoxFlat = CareerTheme.plate_tinted(CareerTheme.MONEY)
	estilo.set_content_margin_all(12)
	estilo.content_margin_left = 18
	estilo.content_margin_right = 18
	_pastilla.add_theme_stylebox_override("panel", estilo)
	resumen.add_child(_pastilla)
	_pastilla_texto = _texto("", CareerTheme.T_BODY)
	_pastilla_texto.add_theme_color_override("font_color", CareerTheme.MONEY)
	_pastilla_texto.autowrap_mode = TextServer.AUTOWRAP_OFF
	_pastilla.add_child(_pastilla_texto)
	_resultado_detalle = _texto("", CareerTheme.T_DIM)
	_resultado_detalle.add_theme_constant_override("line_spacing", 6)
	resumen.add_child(_resultado_detalle)
	_resultado.hide()

func _construir_capa(pantalla: Control) -> void:


	_capa = MarginContainer.new()
	_capa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_capa.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	for lado in ["left", "right", "top", "bottom"]:
		_capa.add_theme_constant_override("margin_" + lado, 18)
	pantalla.add_child(_capa)
	var pila := VBoxContainer.new()
	pila.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_capa.add_child(pila)
	var arriba := HBoxContainer.new()
	arriba.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(arriba)
	var placa := PanelContainer.new()
	placa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa.add_theme_stylebox_override("panel", _placa_hud())
	placa.size_flags_vertical = Control.SIZE_SHRINK_BEGIN
	arriba.add_child(placa)
	var tiempos := VBoxContainer.new()
	tiempos.add_theme_constant_override("separation", 0)
	placa.add_child(tiempos)
	_reloj = _texto("0.00", CareerTheme.T_TITLE_MODAL)
	_reloj.custom_minimum_size.x = 210
	tiempos.add_child(_reloj)
	_diferencia = _texto("", CareerTheme.T_BODY)
	tiempos.add_child(_diferencia)
	var hueco := Control.new()
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hueco.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	arriba.add_child(hueco)
	_mapa = MapaRuta.new()
	_mapa.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_mapa.clip_contents = true
	_mapa.custom_minimum_size = Vector2(300, 250)
	arriba.add_child(_mapa)
	_aviso = _texto("", CareerTheme.T_TITLE_MODAL)
	_aviso.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	_aviso.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	_aviso.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_aviso.add_theme_color_override("font_outline_color", CareerTheme.BG_DEEP)
	_aviso.add_theme_constant_override("outline_size", 10)
	pila.add_child(_aviso)
	var abajo := HBoxContainer.new()
	abajo.mouse_filter = Control.MOUSE_FILTER_IGNORE
	pila.add_child(abajo)
	var placa_vel := PanelContainer.new()
	placa_vel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa_vel.add_theme_stylebox_override("panel", _placa_hud())
	abajo.add_child(placa_vel)
	_hud = _texto("0 km/h", CareerTheme.T_CARD)
	placa_vel.add_child(_hud)


	_hud.custom_minimum_size.x = _ancho_de(_hud, "888 km/h")
	var hueco_pie := Control.new()
	hueco_pie.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hueco_pie.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	abajo.add_child(hueco_pie)
	var placa_oro := PanelContainer.new()
	placa_oro.mouse_filter = Control.MOUSE_FILTER_IGNORE
	placa_oro.add_theme_stylebox_override("panel", _placa_hud())
	abajo.add_child(placa_oro)
	_botin = _texto("", CareerTheme.T_CARD)
	_botin.add_theme_color_override("font_color", CareerTheme.MONEY)
	_botin.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	placa_oro.add_child(_botin)
	_botin.custom_minimum_size.x = _ancho_de(_botin, "88/88")

func _placa_hud() -> StyleBoxFlat:
	var estilo: StyleBoxFlat = CareerTheme.plate()
	estilo.content_margin_left = 16
	estilo.content_margin_right = 16
	estilo.content_margin_top = 8
	estilo.content_margin_bottom = 8
	estilo.set_corner_radius_all(12)
	return estilo

func _panel_datos() -> StyleBoxFlat:
	var estilo := StyleBoxFlat.new()
	estilo.bg_color = CareerTheme.SURFACE
	estilo.set_corner_radius_all(16)
	estilo.content_margin_left = 18
	estilo.content_margin_right = 18
	estilo.content_margin_top = 14
	estilo.content_margin_bottom = 14
	return estilo

func _tarjeta_dato(fila: HBoxContainer, titulo: String) -> Label:
	var panel := PanelContainer.new()
	panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	panel.size_flags_stretch_ratio = 1
	panel.add_theme_stylebox_override("panel", _panel_datos())
	fila.add_child(panel)
	var col := VBoxContainer.new()
	panel.add_child(col)
	var nombre := _texto(titulo, CareerTheme.T_DIM)
	nombre.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(nombre)
	var valor := _texto("--", CareerTheme.T_TITLE_MODAL)
	valor.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	col.add_child(valor)
	return valor

func _refrescar_estado_ui() -> void:
	var rodando: bool = estado in ["cuenta", "carrera"]
	var en_pista: bool = rodando or estado == "pausa"
	var meta: bool = estado == "meta"


	_selector.visible = not en_pista and not meta
	_anterior.visible = _selector.visible
	_siguiente.visible = _anterior.visible
	_ficha.visible = estado == "seleccion"
	_pausa.visible = rodando
	_salida.visible = not rodando
	_mando.visible = rodando
	_fila.visible = not rodando
	_inicio.visible = not rodando
	_reinicio.visible = estado == "pausa"
	_cambiar.visible = meta
	_pie.custom_minimum_size.y = ALTO_MANDO if rodando or meta else 0.0
	for boton in [_inicio, _reinicio, _cambiar]:
		boton.custom_minimum_size.y = CareerTheme.BTN_CTA_H if meta else CareerTheme.BTN_ROW_H
	_capa.visible = en_pista
	_mensaje.visible = estado in ["seleccion", "pausa"]
	_resultado.visible = meta
	_banda.visible = meta
	_destello.visible = meta



	Entrada.juego(self, rodando)
	_ajustar_vista()











func _recortar_seleccion() -> void:
	if not is_instance_valid(_ficha) or not is_instance_valid(_mensaje) or size.y <= 0:
		return
	var tumbado: bool = size.x > size.y * 1.2
	var alto_pie: float = ALTO_MANDO if estado in ["cuenta", "carrera", "meta"] else CareerTheme.BTN_ROW_H
	var hueco: float = size.y - 48 - alto_pie - 12
	var filas: float = CareerTheme.BTN_ROW_H * 2 + 24
	var corto: bool = tumbado and estado == "seleccion"
	_ficha.visible = estado == "seleccion" and not (corto and hueco < filas + 72 + 12 + 120)
	_mensaje.visible = estado in ["seleccion", "pausa"] and not (corto and hueco < filas + 72 + 12)


func _ajustar_pie() -> void:
	if not is_instance_valid(_pie) or not is_instance_valid(_margen_ui):
		return



	var alto_pie: float = ALTO_MANDO if estado in ["cuenta", "carrera", "meta"] else CareerTheme.BTN_ROW_H
	var bajo: float = 16 + UiKit.bottom_safe_inset(get_viewport())
	var lado: float = 16 + UiKit.side_safe_inset(get_viewport())
	_pie.offset_left = lado
	_pie.offset_right = - lado
	_pie.offset_top = - bajo - alto_pie
	_pie.offset_bottom = - bajo
	_margen_ui.offset_bottom = - alto_pie - 12



func _ancho_de(l: Label, muestra: String) -> float:
	var fuente: Font = l.get_theme_font("font")
	return ceilf(fuente.get_string_size(muestra, HORIZONTAL_ALIGNMENT_LEFT, -1,
		l.get_theme_font_size("font_size")).x) + 6.0

func _texto(texto: String, tam: int) -> Label:
	var l: Label = CareerUi.plain(tam, CareerTheme.TEXT)
	l.text = texto
	l.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	l.clip_text = true
	l.custom_minimum_size.y = tam * 1.6
	l.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return l

func _boton(texto: String, accion: Callable) -> Button:
	var b := Button.new()
	b.text = texto
	b.custom_minimum_size = Vector2(84, CareerTheme.BTN_ROW_H)
	b.clip_text = true
	CareerTheme.apply_button(b, CareerTheme.Kind.NEUTRAL, CareerTheme.T_DIM)
	if accion.is_valid():
		b.pressed.connect(accion)
	return b




func _ayuda_mando() -> String:
	return Entrada.texto_f(
		"El coche acelera solo. Mantén un botón para girar y los dos a la vez para frenar.",
		"El coche acelera solo. Gira con el stick y frena con {0}.",
		[], [Entrada.boton("fl_avanza")])

func _construir_pista() -> void:






	_mundo = Node3D.new()
	_vp.add_child(_mundo)
	var entorno := WorldEnvironment.new()
	var ambiente := Environment.new()
	ambiente.background_mode = Environment.BG_SKY
	var cielo := Sky.new()
	var cielo_mat := ProceduralSkyMaterial.new()
	cielo_mat.sky_top_color = Color("6099b8")
	cielo_mat.sky_horizon_color = Color("d3e2db")
	cielo_mat.ground_horizon_color = Color("d3e2db")
	cielo_mat.ground_bottom_color = Color("687b59")
	cielo.sky_material = cielo_mat
	ambiente.sky = cielo
	ambiente.fog_enabled = true
	ambiente.fog_light_color = Color("c4d9d0")
	ambiente.fog_density = 0.0013
	ambiente.fog_sky_affect = 0.0
	ambiente.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	ambiente.ambient_light_color = Color("c5d9eb")
	ambiente.ambient_light_energy = 0.5
	entorno.environment = ambiente
	_mundo.add_child(entorno)
	var sol := DirectionalLight3D.new()
	sol.rotation_degrees = Vector3(-48, -28, 0)
	sol.light_energy = 1.1
	sol.shadow_enabled = Settings.sombra_permitida()
	sol.directional_shadow_max_distance = 90.0
	_mundo.add_child(sol)
	_telas.clear()
	_piezas.clear()

	_caja(Vector3(170, - 0.18, -40), Vector3(1600, 0.3, 1600), CESPED)
	_agua()
	_asfalto()
	_bordillos()
	_protecciones()
	_tunel()
	_puente()
	_gradas()
	_volcar_hinchas()
	_boxes()
	_recta_salida()
	_carteles()
	_senales()
	_neumaticos()
	for metros in Carrera.CONTROLES:
		var a: float = Carrera.ancho(metros)
		for lado in [-1.0, 1.0]:
			var poste := _caja(Carrera.mundo(metros, lado *(a + 1.0)) + Vector3.UP * 2.8,
				Vector3(0.35, 5.6, 0.45), Color("e4ded0"))
			poste.rotation.y = - Carrera.rumbo(metros)
		var arco := _caja(Carrera.mundo(metros) + Vector3.UP * 5.5, Vector3(2.0 * a + 2.6, 0.7, 0.6), Color("427dae"))
		arco.rotation.y = - Carrera.rumbo(metros)
		_porticos.append(arco)
	_bosque()
	_montanas()
	_volcar_telas()


	var cajas: Array[Transform3D] = []
	var tonos := PackedColorArray()
	for color in _piezas:
		cajas.append_array(_piezas[color])
		for _i in (_piezas[color] as Array).size():
			tonos.append(color)
	_lote(_cubo(), cajas, tonos, false)
	_telas.clear()
	_piezas.clear()
	_crear_monedas()
	_crear_rodadas()
	_crear_confeti()
	_curva_max = 0.0001
	for metros in range(0, int(Carrera.META)):
		_curva_max = maxf(_curva_max, absf(Carrera.curvatura(float(metros))))
	_cam = Camera3D.new()
	_cam.fov = 58.0

	_cam.far = 1100.0
	_mundo.add_child(_cam)
	_cam.current = true








func _volcar_telas() -> void:
	var vs := PackedVector3Array()
	var ns := PackedVector3Array()
	var cs := PackedColorArray()
	for color in _telas:
		var arr: Array =(_telas[color] as SurfaceTool).commit_to_arrays()
		var v: PackedVector3Array = arr[Mesh.ARRAY_VERTEX]
		var idx: Variant = arr[Mesh.ARRAY_INDEX]


		if idx is PackedInt32Array and not (idx as PackedInt32Array).is_empty():
			var n: PackedVector3Array = arr[Mesh.ARRAY_NORMAL]
			for i in idx:
				vs.append(v[i])
				ns.append(n[i])
				cs.append(color)
			continue
		vs.append_array(v)
		ns.append_array(arr[Mesh.ARRAY_NORMAL])
		var tramo := PackedColorArray()
		tramo.resize(v.size())
		tramo.fill(color)
		cs.append_array(tramo)
	if vs.is_empty():
		return
	var arrs: Array = []
	arrs.resize(Mesh.ARRAY_MAX)
	arrs[Mesh.ARRAY_VERTEX] = vs
	arrs[Mesh.ARRAY_NORMAL] = ns
	arrs[Mesh.ARRAY_COLOR] = cs
	var malla := ArrayMesh.new()
	malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrs)
	var m := MeshInstance3D.new()
	m.name = "Telas"
	m.mesh = malla
	var mat := _material(Color.WHITE)
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.material_override = mat
	_mundo.add_child(m)


func _tela(color: Color) -> SurfaceTool:
	if not _telas.has(color):
		var st := SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		_telas[color] = st
	return _telas[color]



func _cuadro(st: SurfaceTool, a: Vector3, b: Vector3, c: Vector3, d: Vector3) -> void:
	var normal: Vector3 =(b - a).cross(c - a).normalized()
	for p in [a, c, b, b, c, d]:
		st.set_normal(normal)
		st.add_vertex(p)



func _cinta(color: Color, desde: float, hasta: float, lados: Callable, dy: float, paso: float = 2.0) -> void:
	var st: SurfaceTool = _tela(color)
	var n: int = maxi(1, ceili((hasta - desde) / paso))
	var a := Vector3.ZERO
	var b := Vector3.ZERO
	for i in n + 1:
		var m: float = lerpf(desde, hasta, float(i) / n)
		var l: Vector2 = lados.call(m)
		var c: Vector3 = Carrera.mundo(m, l.x) + Vector3.UP * dy
		var d: Vector3 = Carrera.mundo(m, l.y) + Vector3.UP * dy
		if i > 0:
			_cuadro(st, a, b, c, d)
		a = c
		b = d


func _pared(color: Color, desde: float, hasta: float, lado: Callable, y0: float, y1: float, paso: float = 2.0) -> void:
	var st: SurfaceTool = _tela(color)
	var n: int = maxi(1, ceili((hasta - desde) / paso))
	var a := Vector3.ZERO
	var b := Vector3.ZERO
	for i in n + 1:
		var m: float = lerpf(desde, hasta, float(i) / n)
		var base: Vector3 = Carrera.mundo(m, float(lado.call(m)))
		var c: Vector3 = base + Vector3.UP * y0
		var d: Vector3 = base + Vector3.UP * y1
		if i > 0:
			_cuadro(st, a, b, c, d)
		a = c
		b = d



func _pieza(color: Color, centro: Vector3, medida: Vector3, giro: float = 0.0) -> void:
	if not _piezas.has(color):
		var lista: Array[Transform3D] = []
		_piezas[color] = lista
	_piezas[color].append(Transform3D(Basis(Vector3.UP, giro) * Basis.from_scale(medida), centro))



func _pieza_en(color: Color, metros: float, lado: float, alto: float, medida: Vector3) -> void:
	_pieza(color, Carrera.mundo(metros, lado) + Vector3.UP * alto, medida, - Carrera.rumbo(metros))

func _cubo() -> BoxMesh:
	var caja := BoxMesh.new()
	caja.size = Vector3.ONE
	return caja



func _grava(metros: float, signo: float) -> float:
	var s: float = 0.0
	var total: float = 0.0
	for tramo in Carrera.TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		if signo == - signf(float(tramo[1])):
			total = maxf(total, 7.0 * Carrera.zona(metros, s - 5.0, s + largo + 15.0, 10.0))
		s += largo
	return total *(1.0 - Carrera.zona(metros, Carrera.PUENTE.x - Carrera.RAMPA_PUENTE,
		Carrera.PUENTE.y + Carrera.RAMPA_PUENTE, 6.0))


func _barrera(metros: float, signo: float) -> float:
	return signo *(Carrera.ancho(metros) + 2.4 + _grava(metros, signo))



func _asfalto() -> void:
	var meta: float = Carrera.META
	_cinta(ASFALTO, 0.0, meta, func(m: float) -> Vector2:
		return Vector2(- Carrera.ancho(m), Carrera.ancho(m)), 0.01, 1.5)


	for signo in [-1.0, 1.0]:
		_cinta(CAL, 0.0, meta, func(m: float) -> Vector2:
			var a: float = Carrera.ancho(m)
			return Vector2(a - 0.35, a - 0.15) if signo > 0 else Vector2(-(a - 0.15), -(a - 0.35)), 0.02, 1.5)
		_cinta(ARCEN, 0.0, meta, func(m: float) -> Vector2:
			var a: float = Carrera.ancho(m)
			return Vector2(a, a + 1.0) if signo > 0 else Vector2(-(a + 1.0), - a), 0.008, 1.5)

	var s: float = 0.0
	for tramo in Carrera.TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		var fuera: float = - signf(float(tramo[1]))
		_cinta(GRAVA, s - 15.0, s + largo + 25.0, func(m: float) -> Vector2:
			var a: float = Carrera.ancho(m) + 1.0
			var g: float = _grava(m, fuera)
			return Vector2(a, a + g) if fuera > 0 else Vector2(-(a + g), - a), 0.005, 2.0)
		s += largo

	for metros in range(20, int(meta) - 45, 12):
		_pieza_en(CAL, float(metros), 0.0, 0.02, Vector3(0.14, 0.02, 3.0))

func _bordillos() -> void:


	var s: float = 0.0
	for tramo in Carrera.TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		var i: int = 0
		for metros in range(int(s) - 4, int(s + largo) + 6, 2):
			var m: float = float(metros) + 1.0
			for signo in [-1.0, 1.0]:
				var lado: float = signo *(Carrera.ancho(m) + 0.45)
				var largo_pieza: float = 2.0 * maxf(0.2, 1.0 - Carrera.curvatura(m) * lado)
				_pieza_en(ROJO if i % 2 == 0 else CAL, m, lado, 0.03, Vector3(1.1, 0.06, largo_pieza))
			i += 1
		s += largo



func _tramos_valla() -> Dictionary:
	var meta: float = Carrera.META
	return {
		-1.0: [[90.0, Carrera.TUNEL.x - 2.0], [Carrera.TUNEL.y + 2.0, 930.0], [1036.0, meta - 25.0]],
		1.0: [[85.0, Carrera.TUNEL.x - 2.0], [Carrera.TUNEL.y + 2.0, 930.0], [1036.0, meta - 45.0]],
	}

func _protecciones() -> void:

	var tramos: Dictionary = _tramos_valla()
	for signo in tramos:
		for par in tramos[signo]:
			var lado := func(m: float) -> float: return _barrera(m, signo)
			_pared(METAL, par[0], par[1], lado, 0.35, 0.8)
			for metros in range(ceili(par[0]), int(par[1]), 4):
				_pieza_en(POSTE, float(metros), _barrera(float(metros), signo) + signo * 0.12, 0.4, Vector3(0.12, 0.8, 0.12))

func _tunel() -> void:
	var desde: float = Carrera.TUNEL.x
	var hasta: float = Carrera.TUNEL.y
	for signo in [-1.0, 1.0]:
		_pared(HORMIGON, desde, hasta, func(m: float) -> float: return signo *(Carrera.ancho(m) + 1.0), 0.0, ALTO_TUNEL)
		_cinta(ACERA, desde, hasta, func(m: float) -> Vector2:
			var a: float = Carrera.ancho(m)
			return Vector2(a, a + 1.0) if signo > 0 else Vector2(-(a + 1.0), - a), 0.15)
	_cinta(HORMIGON_OSCURO, desde, hasta, func(m: float) -> Vector2:
		var a: float = Carrera.ancho(m) + 1.0
		return Vector2(- a, a), ALTO_TUNEL)


	var lamparas: Array[Transform3D] = []
	for metros in range(int(desde) + 3, int(hasta), 6):
		for signo in [-1.0, 1.0]:
			lamparas.append(Transform3D(Basis(Vector3.UP, - Carrera.rumbo(metros)) * Basis.from_scale(Vector3(0.3, 0.1, 2.2)),
				Carrera.mundo(metros, signo * 2.8) + Vector3.UP *(ALTO_TUNEL - 0.1)))
	_lote(_cubo(), lamparas, Color("ffe2a6"), false, 2.2)

	for metros in [desde, hasta]:
		var a: float = Carrera.ancho(metros) + 1.0
		for signo in [-1.0, 1.0]:
			_pieza_en(HORMIGON, metros, signo *(a + 6.5), 5.5, Vector3(13.0, 11.0, 1.2))
		_pieza_en(HORMIGON, metros, 0.0, ALTO_TUNEL +(11.0 - ALTO_TUNEL) * 0.5, Vector3(2.0 * a, 11.0 - ALTO_TUNEL, 1.2))
		_pieza_en(Color("427dae"), metros, 0.0, ALTO_TUNEL + 1.1, Vector3(2.0 * a + 0.2, 1.0, 1.3))
		_pieza_en(HORMIGON_OSCURO, metros, 0.0, 11.2, Vector3(2.0 * a + 26.4, 0.5, 1.5))


	_colina()
	var largo: float = Carrera.TUNEL.y - Carrera.TUNEL.x
	var media: float = _media_fronton()
	for tramo in [Vector2(- ALA_COLINA, 0.0), Vector2(largo, largo + ALA_COLINA)]:
		for signo in [-1.0, 1.0]:
			var n: int = ceili(ALA_COLINA / 2.0)
			for i in n:
				var u0: float = lerpf(tramo.x, tramo.y, float(i) / n)
				var u1: float = lerpf(tramo.x, tramo.y, float(i + 1) / n)
				var a0: Vector3 = _en_colina(u0, signo * media, true)
				var a1: Vector3 = _en_colina(u1, signo * media, true)
				_cuadro(_tela(HORMIGON), a0, _en_colina(u0, signo * media), a1, _en_colina(u1, signo * media))










func _media_fronton() -> float:
	return Carrera.ancho(Carrera.TUNEL.x) + 14.0


func _plano_colina(u: float, s: float) -> Vector2:
	var o: Vector2 = Carrera.punto(Carrera.TUNEL.x)
	var eje: Vector2 =(Carrera.punto(Carrera.TUNEL.y) - o).normalized()
	return o + eje * u + Vector2(- eje.y, eje.x) * s



func _en_colina(u: float, s: float, suelo: bool = false) -> Vector3:
	var p: Vector2 = _plano_colina(u, s)
	return Vector3(p.x,(0.0 if suelo else _alto_colina_us(u, s)) - 0.05, p.y)




func _alto_colina_us(u: float, s: float) -> float:
	var largo: float = Carrera.TUNEL.y - Carrera.TUNEL.x
	if (u < 0.0 or u > largo) and absf(s) < _media_fronton():
		return 0.0
	var du: float =(u - largo * 0.5) /(largo * 0.5 + ALA_COLINA)
	var ds: float = s / RADIO_COLINA
	var cupula: float = ALTO_COLINA * maxf(0.0, 1.0 - du * du - ds * ds)
	return minf(cupula, ALTO_FRONTON + 0.35 * minf(u, largo - u))



func _alto_colina(p: Vector2) -> float:
	var o: Vector2 = Carrera.punto(Carrera.TUNEL.x)
	var eje: Vector2 =(Carrera.punto(Carrera.TUNEL.y) - o).normalized()
	return _alto_colina_us((p - o).dot(eje),(p - o).dot(Vector2(- eje.y, eje.x)))


func _en_trinchera(p: Vector2) -> bool:
	var o: Vector2 = Carrera.punto(Carrera.TUNEL.x)
	var eje: Vector2 =(Carrera.punto(Carrera.TUNEL.y) - o).normalized()
	var u: float =(p - o).dot(eje)
	var largo: float = Carrera.TUNEL.y - Carrera.TUNEL.x
	return absf((p - o).dot(Vector2(- eje.y, eje.x))) < _media_fronton() + 2.0 \
			and ((u > - ALA_COLINA - 2.0 and u < 0.0) or (u > largo and u < largo + ALA_COLINA + 2.0))



func _colina() -> void:
	var largo: float = Carrera.TUNEL.y - Carrera.TUNEL.x
	var media: float = _media_fronton()
	var us: PackedFloat32Array = _cortes(- ALA_COLINA, largo + ALA_COLINA, 4.0, [0.0, largo])
	var ss: PackedFloat32Array = _cortes(- RADIO_COLINA, RADIO_COLINA, 4.0, [- media, media])
	var st: SurfaceTool = _tela(COLINA)
	for i in us.size() - 1:
		for j in ss.size() - 1:
			var uc: float =(us[i] + us[i + 1]) * 0.5
			if (uc < 0.0 or uc > largo) and absf((ss[j] + ss[j + 1]) * 0.5) < media:
				continue
			var a: Vector3 = _en_colina(us[i], ss[j])
			var b: Vector3 = _en_colina(us[i], ss[j + 1])
			var c: Vector3 = _en_colina(us[i + 1], ss[j])
			var d: Vector3 = _en_colina(us[i + 1], ss[j + 1])
			if maxf(maxf(a.y, b.y), maxf(c.y, d.y)) <= 0.0:
				continue
			_cuadro(st, a, b, c, d)


func _cortes(desde: float, hasta: float, paso: float, fijos: Array) -> PackedFloat32Array:
	var puntos: Array[float] = [desde, hasta]
	for f in fijos:
		puntos.append(float(f))
	puntos.sort()
	var cortes := PackedFloat32Array()
	for k in puntos.size() - 1:
		var n: int = maxi(1, ceili((puntos[k + 1] - puntos[k]) / paso))
		for i in n:
			cortes.append(lerpf(puntos[k], puntos[k + 1], float(i) / n))
	cortes.append(hasta)
	return cortes

func _puente() -> void:
	var desde: float = Carrera.PUENTE.x - Carrera.RAMPA_PUENTE
	var hasta: float = Carrera.PUENTE.y + Carrera.RAMPA_PUENTE
	for signo in [-1.0, 1.0]:
		_cinta(ACERA, desde - 6.0, hasta + 6.0, func(m: float) -> Vector2:
			var a: float = Carrera.ancho(m)
			return Vector2(a, a + 1.0) if signo > 0 else Vector2(-(a + 1.0), - a), 0.12)
		var borde := func(m: float) -> float: return signo *(Carrera.ancho(m) + 1.0)
		_pared(HORMIGON, desde - 6.0, hasta + 6.0, borde, 0.0, 1.0)
		_pared(POSTE, desde - 6.0, hasta + 6.0, borde, 1.0, 1.12)

		_pared(HORMIGON_OSCURO, Carrera.PUENTE.x - 6.0, Carrera.PUENTE.y + 6.0, borde, -1.1, 0.0)

		for rampa in [[desde, Carrera.PUENTE.x], [Carrera.PUENTE.y, hasta]]:
			var st: SurfaceTool = _tela(TALUD)
			var n: int = ceili((rampa[1] - rampa[0]) / 2.0)
			var a := Vector3.ZERO
			var b := Vector3.ZERO
			for i in n + 1:
				var m: float = lerpf(rampa[0], rampa[1], float(i) / n)
				var arriba: Vector3 = Carrera.mundo(m, signo *(Carrera.ancho(m) + 1.0))
				var abajo: Vector3 = Carrera.mundo(m, signo *(Carrera.ancho(m) + 1.0 + 2.2 * Carrera.altura(m)))
				abajo.y = - 0.02
				if i > 0:
					_cuadro(st, a, b, arriba, abajo)
				a = arriba
				b = abajo

	_cinta(HORMIGON_OSCURO, Carrera.PUENTE.x - 6.0, Carrera.PUENTE.y + 6.0, func(m: float) -> Vector2:
		var a: float = Carrera.ancho(m) + 1.0
		return Vector2(- a, a), -1.1)
	var alto: float = Carrera.ALTURA_PUENTE
	var ancho: float = 2.0 *(Carrera.ANCHO + 1.0 + 2.2 * alto + 0.5)
	for metros in [Carrera.PUENTE.x - 1.5, Carrera.PUENTE.y + 1.5]:
		var base: Vector3 = Carrera.mundo(metros)
		_pieza(HORMIGON, Vector3(base.x,(alto - 0.1) * 0.5, base.z), Vector3(ancho, alto - 0.1, 3.0), - Carrera.rumbo(metros))
	for metros in [Carrera.PUENTE.x + 7.0, Carrera.PUENTE.y - 7.0]:
		for signo in [-1.0, 1.0]:
			var base: Vector3 = Carrera.mundo(metros, signo * 3.5)
			var tope: float = alto - 1.1
			_pieza(HORMIGON, Vector3(base.x,(tope - 0.5) * 0.5, base.z), Vector3(1.1, tope + 0.5, 1.1), - Carrera.rumbo(metros))

func _agua() -> void:

	var agua := _material(AGUA)
	agua.roughness = 0.15
	agua.metallic = 0.25
	var orilla: SurfaceTool = _tela(ORILLA)
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var previo: Array[Vector3] = []
	for z in range(int(LAGO.y) + 20, 360, 6):
		var x: float = Carrera.rio_x(float(z))
		var siguiente: float = Carrera.rio_x(float(z) + 1.0)
		var lateral := Vector2(1.0, -(siguiente - x)).normalized()
		var centro := Vector3(x, 0, float(z))
		var fila: Array[Vector3] = []
		for d in [- RIO_ANCHO * 0.5 - 2.2, - RIO_ANCHO * 0.5, RIO_ANCHO * 0.5, RIO_ANCHO * 0.5 + 2.2]:
			fila.append(centro + Vector3(lateral.x, 0, lateral.y) * d)
		if not previo.is_empty():
			_cuadro(orilla, previo[0] + Vector3.UP * - 0.005, previo[1] + Vector3.UP * - 0.005,
				fila[0] + Vector3.UP * - 0.005, fila[1] + Vector3.UP * - 0.005)
			_cuadro(st, previo[1], previo[2], fila[1], fila[2])
			_cuadro(orilla, previo[2] + Vector3.UP * - 0.005, previo[3] + Vector3.UP * - 0.005,
				fila[2] + Vector3.UP * - 0.005, fila[3] + Vector3.UP * - 0.005)
		previo = fila
	var rio := MeshInstance3D.new()
	rio.mesh = st.commit()
	agua.cull_mode = BaseMaterial3D.CULL_DISABLED
	rio.material_override = agua
	_mundo.add_child(rio)
	for par in [[LAGO_RADIOS + Vector2(3.5, 3.5), ORILLA, - 0.01], [LAGO_RADIOS, AGUA, 0.0]]:
		var disco := MeshInstance3D.new()
		var cilindro := CylinderMesh.new()
		cilindro.top_radius = 1.0
		cilindro.bottom_radius = 1.0
		cilindro.height = 0.04
		cilindro.radial_segments = 48
		disco.mesh = cilindro
		disco.material_override = agua if par[1] == AGUA else _material(par[1])
		disco.position = Vector3(LAGO.x, par[2], LAGO.y)
		disco.scale = Vector3(par[0].x, 1.0, par[0].y)
		_mundo.add_child(disco)

	_pieza(Color("8a6a4a"), Vector3(LAGO.x + LAGO_RADIOS.x - 3.0, 0.18, LAGO.y), Vector3(9.0, 0.18, 2.2))

func _gradas() -> void:


	_grada(-20.0, 86.0, -1.0, Carrera.ANCHO_SALIDA + 3.2, 7, true)
	_grada(472.0, 544.0, -1.0, Carrera.ANCHO_HORQUILLA + 11.0, 4, false)
	var a: float = Carrera.ANCHO_SALIDA
	_pieza_en(Color("e8e2d0"), 32.5, -(a + 2.6), 0.6, Vector3(0.3, 1.2, 115.0))
	var marcas: Array[Color] = [Color("427dae"), Color("b75040"), Color("e3b23c"), Color("2f3440"), Color("6ebfa1")]
	var k: int = 0
	for metros in range(-22, 88, 7):
		_pieza_en(marcas[k % marcas.size()], float(metros) + 3.0, -(a + 2.43), 0.62, Vector3(0.06, 0.85, 6.0))
		k += 1








func _grada(desde: float, hasta: float, signo: float, dist: float, filas: int, techo: bool) -> void:
	var rng := RandomNumberGenerator.new()
	rng.seed = int(desde * 13.0) + 71
	var metros: float = desde
	while metros < hasta:
		var m: float = metros + 1.5
		var giro: float = - Carrera.rumbo(m)
		for fila in filas:
			var lado: float = signo *(dist + 1.6 * fila + 0.8)
			var largo: float = 3.05 * maxf(0.2, 1.0 - Carrera.curvatura(m) * lado)
			var alto: float = 1.0 + fila
			var base: Vector3 = Carrera.mundo(m, lado)
			_pieza(HORMIGON if fila % 2 == 0 else Color("a09c92"), Vector3(base.x, alto * 0.5, base.z),
				Vector3(1.6, alto, largo), giro)
			for p in 4:
				if rng.randf() < 0.12:
					continue
				var hueco: float =(float(p) - 1.5) / 4.0 * largo
				var sitio: Vector3 = base + Vector3(sin(- giro), 0, - cos(- giro)) * hueco \
						+ Vector3(cos(- giro), 0, sin(- giro)) * rng.randf_range(- 0.25, 0.25)
				var postura: String = HINCHAS[rng.randi() % HINCHAS.size()]
				if not _hinchas.has(postura):
					var lista: Array[Transform3D] = []
					_hinchas[postura] = lista
					_hinchas_luz[postura] = PackedFloat32Array()
				_hinchas[postura].append(Transform3D(Basis.from_scale(Vector3.ONE * rng.randf_range(0.9, 1.06)),
					Vector3(sitio.x, alto, sitio.z)))

				_hinchas_luz[postura].append(rng.randf_range(0.72, 0.86) if techo else rng.randf_range(0.88, 1.0))
		if techo:
			var fondo: float = signo *(dist + 1.6 * filas + 0.2)
			var atras: Vector3 = Carrera.mundo(m, fondo)
			_pieza(HORMIGON_OSCURO, Vector3(atras.x, 6.0, atras.z), Vector3(0.4, 12.0, 3.05), giro)
			var cubierta: Vector3 = Carrera.mundo(m, signo *(dist + 0.8 * filas))
			_pieza(Color("d9d4c8"), Vector3(cubierta.x, 12.2, cubierta.z), Vector3(1.6 * filas + 2.0, 0.35, 3.05), giro)
		metros += 3.0





func _volcar_hinchas() -> void:
	var cuadro := QuadMesh.new()
	cuadro.size = Vector2(ALTO_HINCHA, ALTO_HINCHA)

	cuadro.center_offset = Vector3(0, ALTO_HINCHA *(0.5 - 6.0 / 48.0), 0)
	for postura in _hinchas:
		var poses: Array[Transform3D] = _hinchas[postura]
		var luces: PackedFloat32Array = _hinchas_luz[postura]
		var lote := MultiMesh.new()
		lote.transform_format = MultiMesh.TRANSFORM_3D
		lote.use_colors = true
		lote.mesh = cuadro
		lote.instance_count = poses.size()
		for i in poses.size():
			lote.set_instance_transform(i, poses[i])
			lote.set_instance_color(i, Color(luces[i], luces[i], luces[i]))
		var mat := StandardMaterial3D.new()
		mat.albedo_texture = load("res://assets/sprites/crowd/%s.png" % postura)
		mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
		mat.alpha_scissor_threshold = 0.5
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
		mat.billboard_keep_scale = true
		mat.vertex_color_use_as_albedo = true
		mat.vertex_color_is_srgb = true
		var nodo := MultiMeshInstance3D.new()
		nodo.name = "Hinchas_" + postura
		nodo.multimesh = lote
		nodo.material_override = mat
		nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		nodo.set_meta("textura", mat.albedo_texture)
		nodo.set_meta("rojo", postura.begins_with("fan_red"))
		_mundo.add_child(nodo)
		_gradas_hinchas.append(nodo)
	_hinchas.clear()
	_hinchas_luz.clear()

func _boxes() -> void:


	var a: float = Carrera.ANCHO_SALIDA
	_pieza_en(Color("e8e2d0"), 20.0, a + 2.6, 0.55, Vector3(0.3, 1.1, 130.0))
	_cinta(Color("454d59"), -45.0, 85.0, func(_m: float) -> Vector2: return Vector2(a + 2.9, a + 9.9), 0.006)
	_pieza_en(Color("d9d4c8"), 20.0, a + 15.0, 3.5, Vector3(10.0, 7.0, 120.0))
	_pieza_en(HORMIGON_OSCURO, 20.0, a + 15.0, 7.2, Vector3(10.4, 0.4, 120.4))
	var equipos: Array[Color] = [Color("b75040"), Color("427dae"), Color("e3b23c"), Color("6ebfa1"), Color("d46a9e"), Color("2f3440")]
	var k: int = 0
	for metros in range(-36, 78, 8):
		_pieza_en(Color("2b3038"), float(metros), a + 9.95, 1.8, Vector3(0.12, 3.6, 5.6))
		_pieza_en(equipos[k % equipos.size()], float(metros), a + 9.93, 4.4, Vector3(0.14, 0.6, 5.6))
		k += 1
	_pieza_en(Color("d9d4c8"), -14.0, a + 14.0, 7.5, Vector3(9.0, 15.0, 11.0))
	_pieza_en(Color("38506a"), -14.0, a + 14.0, 12.5, Vector3(9.2, 2.2, 11.2))

func _recta_salida() -> void:
	var a: float = Carrera.ANCHO_SALIDA

	for casilla in int(2.0 * a):
		for fila in 2:
			_pieza_en(CAL if (casilla + fila) % 2 == 0 else Color("222733"), 0.25 - fila * 0.5,
				- a + 0.5 + casilla, 0.045, Vector3(1.0, 0.025, 0.5))

	for puesto in 4:
		var metros: float = Carrera.META - 8.0 - 8.0 * puesto
		var lado: float = -3.0 if puesto % 2 == 0 else 3.0
		_pieza_en(CAL, metros, lado, 0.03, Vector3(2.4, 0.02, 0.18))
		_pieza_en(CAL, metros + 0.8, lado - 1.1 * signf(lado), 0.03, Vector3(0.18, 0.02, 1.6))


	var metros_portico: float = 4.0
	for signo in [-1.0, 1.0]:
		_pieza_en(Color("2f3440"), metros_portico, signo *(a + 1.6), 3.7, Vector3(0.5, 7.4, 0.5))
	_pieza_en(Color("2f3440"), metros_portico, 0.0, 7.4, Vector3(2.0 * a + 3.7, 1.0, 0.8))
	_pieza_en(Color("1a1d24"), metros_portico, 0.0, 6.6, Vector3(7.0, 1.4, 0.35))
	_luz_on = _material(Color("ff3b30"))
	_luz_on.emission_enabled = true
	_luz_on.emission = Color("ff3b30")
	_luz_on.emission_energy_multiplier = 3.0
	_luz_off = _material(Color("3a1c1c"))
	_semaforo.clear()
	for i in 5:
		var luz := _caja(Carrera.mundo(metros_portico - 0.25, -2.4 + 1.2 * i) + Vector3.UP * 6.6,
			Vector3(0.8, 0.8, 0.3), Color("3a1c1c"))
		luz.material_override = _luz_off
		_semaforo.append(luz)

func _carteles() -> void:


	var marcas: Array[Color] = [Color("427dae"), Color("b75040"), Color("e3b23c"), Color("6ebfa1")]
	var k: int = 0
	for metros in VALLAS:
		var lado: float = _barrera(metros, -1.0) - 1.4
		_pieza_en(marcas[k % marcas.size()], metros, lado, 1.8, Vector3(0.25, 2.2, 7.0))
		_pieza_en(CAL, metros, lado + 0.02, 1.6, Vector3(0.27, 0.35, 7.0))
		for signo in [-1.0, 1.0]:
			_pieza_en(POSTE, metros + signo * 2.8, lado, 0.35, Vector3(0.15, 0.7, 0.15))
		k += 1












func _senales() -> void:
	_chevrones.clear()
	_rombos.clear()
	var s: float = 0.0
	for tramo in Carrera.TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		var giro: float = float(tramo[1])
		var fuera: float = - signf(giro)
		if float(tramo[0]) >= 100.0:
			for rayas in [3, 2, 1]:
				var metros: float = s - 25.0 * rayas
				if not _sitio_libre(metros, -1.0) or not _sitio_libre(metros, 1.0):
					continue
				for signo in [-1.0, 1.0]:
					var lado: float = signo *(Carrera.ancho(metros) + 1.8)
					_pieza_en(Color("2d5fa0"), metros, lado, 1.2, Vector3(1.2, 1.4, 0.15))
					_pieza_en(POSTE, metros, lado, 0.25, Vector3(0.12, 0.5, 0.12))
					for r in rayas:
						_pieza_en(CAL, metros - 0.05, lado, 0.75 +(r + 1) * 1.1 /(rayas + 1), Vector3(0.9, 0.12, 0.17))


		var aviso: float = s -(90.0 if float(tramo[0]) >= 100.0 else minf(45.0, float(tramo[0]) * 0.66))
		if float(tramo[0]) >= 20.0 and _sitio_libre(aviso, fuera):
			_rombo(aviso, fuera *(Carrera.ancho(aviso) + 1.8), signf(giro))
		if absf(giro) >= 35.0:
			var metros: float = s + largo * 0.12
			while metros < s + largo * 0.92:
				if _sitio_libre(metros, fuera):
					_chevron(metros, _barrera(metros, fuera) + fuera * 1.35, signf(giro))
				metros += 9.0
		s += largo




func _sitio_libre(metros: float, signo: float) -> bool:
	if metros > Carrera.TUNEL.x - ALA_COLINA - 4.0 and metros < Carrera.TUNEL.y + 4.0:
		return false
	if metros > Carrera.PUENTE.x - Carrera.RAMPA_PUENTE - 6.0 and metros < Carrera.PUENTE.y + Carrera.RAMPA_PUENTE + 6.0:
		return false
	for otro in Carrera.CONTROLES:
		if absf(metros - otro) < 6.0:
			return false
	for otro in VALLAS:
		if signo < 0.0 and absf(metros - otro) < 6.0:
			return false
	return true






func _placa(color: Color, metros: float, lado: float, alto: float, centro: Vector2, medida: Vector3,
		angulo: float, espejo: float = 1.0, delante: float = 0.0) -> void:
	var r: float = Carrera.rumbo(metros)
	var marcha := Vector3(sin(r), 0, - cos(r))
	var derecha := Vector3(cos(r), 0, sin(r))
	if espejo < 0.0:
		centro.x = - centro.x
		angulo = PI - angulo
	var largo: Vector3 = derecha * cos(angulo) + Vector3.UP * sin(angulo)
	var grueso: Vector3 = - derecha * sin(angulo) + Vector3.UP * cos(angulo)
	var sitio: Vector3 = Carrera.mundo(metros, lado) + Vector3.UP * alto \
			+ derecha * centro.x + Vector3.UP * centro.y - marcha * delante
	if not _piezas.has(color):
		var lista: Array[Transform3D] = []
		_piezas[color] = lista
	_piezas[color].append(Transform3D(Basis(largo * medida.x, grueso * medida.y, - marcha * medida.z), sitio))




func _chevron(metros: float, lado: float, hacia: float) -> void:
	_chevrones.append(Vector2(metros, lado))
	for pata in [- 0.8, 0.8]:
		_pieza_en(POSTE, metros, lado + pata, 0.75, Vector3(0.12, 1.5, 0.12))
	_placa(ROJO, metros, lado, 2.3, Vector2.ZERO, Vector3(2.4, 1.6, 0.1), 0.0)
	for arriba in [1.0, -1.0]:
		_placa(CAL, metros, lado, 2.3, Vector2(0, 0.23 * arriba), Vector3(0.9, 0.24, 0.03),
			atan2(- 0.26 * arriba, 0.42), hacia, 0.065)



func _rombo(metros: float, lado: float, hacia: float) -> void:
	_rombos.append(Vector2(metros, lado))
	var negro := Color("2f3440")
	_pieza_en(POSTE, metros, lado, 0.8, Vector3(0.1, 1.6, 0.1))
	_placa(negro, metros, lado, 2.1, Vector2.ZERO, Vector3(1.08, 1.08, 0.06), PI * 0.25)
	_placa(Color("e3b23c"), metros, lado, 2.1, Vector2.ZERO, Vector3(0.94, 0.94, 0.06), PI * 0.25, 1.0, 0.02)

	_placa(negro, metros, lado, 2.1, Vector2(0, - 0.15), Vector3(0.34, 0.1, 0.03), PI * 0.5, hacia, 0.05)
	_placa(negro, metros, lado, 2.1, Vector2(0.08, 0.09), Vector3(0.26, 0.1, 0.03), PI * 0.25, hacia, 0.05)
	for ala in [-1.0, 1.0]:
		var d: float = PI * 0.25 + PI + ala * 0.6
		_placa(negro, metros, lado, 2.1, Vector2(0.17, 0.18) + Vector2(cos(d), sin(d)) * 0.08,
			Vector3(0.17, 0.09, 0.03), d, hacia, 0.05)





func _neumaticos() -> void:
	var poses: Array[Transform3D] = []
	var colores := PackedColorArray()
	var vallas: Dictionary = _tramos_valla()
	var s: float = 0.0
	for tramo in Carrera.TRAMOS:
		s += float(tramo[0])
		var largo: float = float(tramo[2])
		var fuera: float = - signf(float(tramo[1]))
		if absf(float(tramo[1])) >= 60.0:
			var i: int = 0
			var metros: float = s - 4.0
			while metros < s + largo + 12.0:
				var con_valla: bool = vallas[fuera].any(func(par: Array) -> bool:
					return metros > float(par[0]) + 1.0 and metros < float(par[1]) - 1.0)
				if con_valla and _sitio_libre(metros, fuera):
					var base: Vector3 = Carrera.mundo(metros, _barrera(metros, fuera) - fuera * 0.42)
					var giro := Basis(Vector3.UP, - Carrera.rumbo(metros) + float(i) * 0.7)
					for piso in 3:
						poses.append(Transform3D(giro, base + Vector3.UP *(0.13 + piso * 0.26)))
						colores.append((ROJO if i % 2 == 0 else CAL) if piso == 2 else Color("1d2025"))
					_pilas.append(Vector2(metros, fuera))
					i += 1
				metros += 0.62
		s += largo
	var rueda := CylinderMesh.new()
	rueda.top_radius = 0.3
	rueda.bottom_radius = 0.3
	rueda.height = 0.25
	rueda.radial_segments = 8
	rueda.rings = 1
	_lote(rueda, poses, colores, false)

func _crear_monedas() -> void:
	var forma := CylinderMesh.new()
	forma.top_radius = 0.58
	forma.bottom_radius = 0.58
	forma.height = 0.16
	forma.radial_segments = 16
	var oro := _material(Color("f9bf35"))
	oro.metallic = 0.55
	oro.roughness = 0.3
	oro.emission_enabled = true
	oro.emission = Color("e9a920")
	oro.emission_energy_multiplier = 0.35
	var sello := CylinderMesh.new()
	sello.top_radius = 0.37
	sello.bottom_radius = 0.37
	sello.height = 0.18
	sello.radial_segments = 12
	var relieve := _material(Color("ffe5a0"))
	_monedas_s.clear()
	_monedas_alto.clear()
	_monedas_pos.clear()
	var trazado: Array[Vector2] = Carrera.trazado_monedas()
	for punto in trazado:
		var donde: Vector3 = Carrera.mundo(punto.y, punto.x) + Vector3.UP * 1.05
		_monedas_pos.append(donde)
		_monedas_s.append(punto.y)
		_monedas_alto.append(donde.y)
	_monedas_vistas.resize(trazado.size())
	_monedas_vistas.fill(0)
	_monedas_xf.resize(trazado.size() * 12)
	_monedas_xf.fill(0.0)


	var lotes: Array[MultiMesh] = []
	for par in [[forma, oro], [sello, relieve]]:
		var mm := MultiMesh.new()
		mm.transform_format = MultiMesh.TRANSFORM_3D
		mm.mesh = par[0]
		mm.instance_count = trazado.size()
		mm.visible_instance_count = 0
		var lote := MultiMeshInstance3D.new()
		lote.name = "Monedas"
		lote.multimesh = mm
		lote.material_override = par[1]
		_mundo.add_child(lote)
		lotes.append(mm)
	_monedas_oro = lotes[0]
	_monedas_sello = lotes[1]


func moneda_visible(i: int) -> bool:
	return i >= 0 and i < _monedas_vistas.size() and _monedas_vistas[i] == 1

func _bosque() -> void:




	var ocupado: Dictionary = {}
	var metros: float = 0.0
	while metros < Carrera.META:
		_marcar(ocupado, Carrera.punto(metros), Carrera.ancho(metros) + 5.0
			+ maxf(_grava(metros, -1.0), _grava(metros, 1.0)))
		metros += 3.0
	for m in range(-60, 96, 5):
		for signo in [-1.0, 1.0]:
			var p: Vector3 = Carrera.mundo(float(m), signo * 17.0)
			_marcar(ocupado, Vector2(p.x, p.z), 16.0)
	for m in range(466, 552, 5):
		var p: Vector3 = Carrera.mundo(float(m), -(Carrera.ANCHO_HORQUILLA + 15.0))
		_marcar(ocupado, Vector2(p.x, p.z), 9.0)
	for z in range(int(LAGO.y) + 10, 360, 4):
		_marcar(ocupado, Vector2(Carrera.rio_x(float(z)), float(z)), RIO_ANCHO * 0.5 + 6.0)
	for cx in range(-12, 13):
		for cz in range(-12, 13):
			var p := LAGO + Vector2(cx, cz) * 4.0
			if ((p - LAGO) /(LAGO_RADIOS + Vector2(6, 6))).length() <= 1.0:
				_marcar(ocupado, p, 3.0)
	var rng := RandomNumberGenerator.new()
	rng.seed = 8472
	var sitios: Array[Vector2] = []
	metros = 0.0
	while metros < Carrera.META:
		for signo in [-1.0, 1.0]:
			var p: Vector2 = Carrera.punto(metros) + Carrera.normal(metros) * signo \
					*(Carrera.ancho(metros) + rng.randf_range(11.0, 36.0))
			sitios.append(p)
		metros += 7.0
	for i in 520:
		sitios.append(Vector2(rng.randf_range(-170.0, 510.0), rng.randf_range(-340.0, 260.0)))
	var troncos: Dictionary = {}
	var copas: Dictionary = {}
	var pinos: Dictionary = {}
	for p in sitios:
		if ocupado.has(Vector2i(floori(p.x / 5.0), floori(p.y / 5.0))) or _en_trinchera(p):
			continue
		var y: float = _alto_colina(p)
		var escala: float = rng.randf_range(0.8, 1.5)
		var zona := Vector2i(floori(p.x / 160.0), floori(p.y / 160.0))
		for lote in [troncos, copas, pinos]:
			if not lote.has(zona):
				var lista: Array[Transform3D] = []
				lote[zona] = lista
		troncos[zona].append(Transform3D(Basis.from_scale(Vector3(0.4, 3.1, 0.4) * escala),
			Vector3(p.x, y + 1.55 * escala, p.y)))
		if rng.randf() < 0.45 or y > 0.0:
			for nivel in 3:
				var ancho: float =(3.5 - nivel * 0.8) * escala
				pinos[zona].append(Transform3D(Basis.from_scale(Vector3(ancho, 2.8 * escala, ancho)),
					Vector3(p.x, y +(2.8 + nivel * 1.35) * escala, p.y)))
		else:
			for nivel in 2:
				var ancho: float = rng.randf_range(3.0, 4.2) * escala
				copas[zona].append(Transform3D(Basis.from_scale(Vector3(ancho, 2.9 * escala, ancho)),
					Vector3(p.x + rng.randf_range(- 0.7, 0.7), y +(3.2 + nivel * 1.0) * escala, p.y + rng.randf_range(- 0.6, 0.6))))
	var tronco := CylinderMesh.new()
	tronco.top_radius = 0.35
	tronco.bottom_radius = 0.5
	tronco.height = 1
	tronco.radial_segments = 6
	var copa := SphereMesh.new()
	copa.radius = 0.5
	copa.height = 1
	copa.radial_segments = 8
	copa.rings = 4
	var pino := CylinderMesh.new()
	pino.top_radius = 0
	pino.bottom_radius = 0.5
	pino.height = 1
	pino.radial_segments = 7

	for zona in troncos:
		_lote(tronco, troncos[zona], Color("735644"), true)
		_lote(copa, copas[zona], Color("53804e"), true)
		_lote(pino, pinos[zona], Color("315c50"), true)

func _marcar(ocupado: Dictionary, centro: Vector2, radio: float) -> void:
	var r: int = ceili(radio / 5.0)
	var c := Vector2i(floori(centro.x / 5.0), floori(centro.y / 5.0))
	for i in range(- r, r + 1):
		for j in range(- r, r + 1):
			if Vector2(i, j).length() * 5.0 <= radio + 3.6:
				ocupado[c + Vector2i(i, j)] = true

func _montanas() -> void:

	var rng := RandomNumberGenerator.new()
	rng.seed = 3301
	var centro: Vector2 = Vector2(171, -43)
	var montes: Array[Transform3D] = []
	var nieve: Array[Transform3D] = []
	for i in 18:
		var angulo: float = TAU * i / 18.0 + rng.randf_range(- 0.08, 0.08)
		var p: Vector2 = centro + Vector2(cos(angulo), sin(angulo)) * rng.randf_range(520.0, 640.0)
		var alto: float = rng.randf_range(80.0, 175.0)
		var radio: float = rng.randf_range(110.0, 170.0)
		montes.append(Transform3D(Basis.from_scale(Vector3(2.0 * radio, alto, 2.0 * radio)), Vector3(p.x, alto * 0.5 - 6.0, p.y)))
		if alto > 125.0:
			nieve.append(Transform3D(Basis.from_scale(Vector3(0.56 * radio, 0.28 * alto, 0.56 * radio)),
				Vector3(p.x, alto - 6.0 - 0.14 * alto + 0.4, p.y)))
	var cono := CylinderMesh.new()
	cono.top_radius = 0
	cono.bottom_radius = 0.5
	cono.height = 1
	cono.radial_segments = 9
	_lote(cono, montes, Color("7d8f93"), true)
	_lote(cono, nieve, Color("eef2f2"), false)



func _lote(malla: Mesh, poses: Array[Transform3D], colores: Variant, variar: bool, brillo: float = 0.0) -> void:
	if poses.is_empty():
		return
	var lote := MultiMesh.new()
	lote.transform_format = MultiMesh.TRANSFORM_3D
	lote.use_colors = true
	lote.mesh = malla
	lote.instance_count = poses.size()
	for i in poses.size():
		lote.set_instance_transform(i, poses[i])
		var color: Color = colores[i] if colores is PackedColorArray else colores
		lote.set_instance_color(i, color.lightened(float(i % 5) * 0.035) if variar else color)
	var nodo := MultiMeshInstance3D.new()
	nodo.multimesh = lote
	var mat := _material(Color.WHITE)
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	if brillo > 0.0:
		mat.emission_enabled = true
		mat.emission = colores if colores is Color else Color.WHITE
		mat.emission_energy_multiplier = brillo
	nodo.material_override = mat
	_mundo.add_child(nodo)

func _material(color: Color) -> StandardMaterial3D:
	var mat := StandardMaterial3D.new()
	mat.albedo_color = color
	mat.roughness = 0.9
	return mat

func _caja(pos: Vector3, medida: Vector3, color: Color) -> MeshInstance3D:
	var m := MeshInstance3D.new()
	var caja := BoxMesh.new()
	caja.size = medida
	m.mesh = caja
	m.material_override = _material(color)
	m.position = pos
	_mundo.add_child(m)
	return m

func _elegir(paso: int) -> void:
	if estado in ["cuenta", "carrera", "pausa"]:
		return
	_salir_de_meta()
	coches = Carrera.disponibles(Career.lifestyle)
	var tiene: bool = Career.house_extras.has("simulador")
	_inicio.disabled = coches.is_empty() or not tiene
	_anterior.disabled = coches.size() < 2
	_siguiente.disabled = coches.size() < 2
	estado = "seleccion"
	_refrescar_estado_ui()
	if coches.is_empty() or not tiene:
		_nombre.text = I18n.t("SIN COCHES")
		_mensaje.text = I18n.t("Compra el simulador en CASA > COCHERA. Incluye un compacto para jugar.")
		_record.text = ""
		for etiqueta in _medallas:
			etiqueta.text = "--"
		if is_instance_valid(_coche):
			_coche.queue_free()
		_camara()
		return
	elegido = posmod(elegido + paso, coches.size())
	var id: String = coches[elegido]
	_nombre.text = I18n.t(String(Shop.lifestyle_by_id(id)["name"]))
	carrera.iniciar(id, Career.lifestyle, tiene)
	_inicio.text = I18n.t("CONDUCIR")
	_mensaje.text = _ayuda_mando()
	if id == Carrera.COCHE_INCLUIDO and not Career.lifestyle.has(id):
		_mensaje.text += "\n" + I18n.t("Compacto incluido sólo para jugar. Tus compras desbloquean más coches.")
	_pintar_ficha()
	_cam_carril = 0.0
	_cam_rumbo = Carrera.rumbo(0.0)
	_ritmo = 0.0
	_destello_moneda = 0.0
	if is_instance_valid(_coche):
		_coche.free()
	if is_instance_valid(_fantasma):
		_fantasma.free()
	var perfil: String = String(Shop.lifestyle_by_id(id)["modelo"])
	var fabrica = Coche.new()


	fabrica.copias_cpu = true
	_coche = fabrica.montar(_mundo, perfil, 90.0)
	_coche.scale = Vector3.ONE
	_alto_coche = float(Coche.PERFILES[perfil]["rueda"]) - 0.51
	_equipar(fabrica, perfil)
	_calmar()
	_actualizar()
	_refrescar_estado_ui()







func _equipar(fabrica: RefCounted, perfil: String) -> void:
	_pilotos = fabrica.piloto
	_halos.clear()
	_humos.clear()
	_llamas.clear()
	_frenando = false
	_petardo = 0.0
	var halo := QuadMesh.new()
	halo.size = Vector2(0.85, 0.85)
	var halo_mat := StandardMaterial3D.new()
	halo_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	halo_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	halo_mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	halo_mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
	halo_mat.albedo_color = Color(1.0, 0.16, 0.2, 0.85)
	halo_mat.albedo_texture = _degradado_redondo()
	for punto in fabrica.pilotos_en:
		var h := MeshInstance3D.new()
		h.name = "HaloFreno"
		h.mesh = halo
		h.material_override = halo_mat
		h.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		h.position = punto + Vector3(- 0.08, 0, 0)
		h.visible = false
		_coche.add_child(h)
		_halos.append(h)
	var ini: Vector4 =(Coche.PERFILES[perfil]["cuerpo"] as Array)[0]
	_luz_freno = OmniLight3D.new()
	_luz_freno.name = "LuzFreno"
	_luz_freno.light_color = Color("ff2a3a")
	_luz_freno.light_energy = 2.2
	_luz_freno.omni_range = 5.0
	_luz_freno.position = Vector3(ini.x - 0.8, 0.6, 0)
	_luz_freno.visible = false
	_coche.add_child(_luz_freno)


	var tubos: Array[Vector3] = []
	match perfil:
		"compacto", "sedan", "familiar", "pickup":
			tubos = [Vector3(ini.x - 0.03, 0.27, - 0.5)]
		"hiper":
			tubos = [Vector3(ini.x - 0.02, 0.38, - 0.13), Vector3(ini.x - 0.02, 0.38, 0.13)]
		"muscle":
			tubos = [Vector3(ini.x - 0.03, 0.27, - 0.6), Vector3(ini.x - 0.03, 0.27, 0.6)]
		_:
			tubos = [Vector3(ini.x - 0.03, 0.27, - 0.44), Vector3(ini.x - 0.03, 0.27, 0.44)]
	var cromo := StandardMaterial3D.new()
	cromo.albedo_color = Color("9aa2ab")
	cromo.metallic = 0.6
	cromo.roughness = 0.3
	var hollin := StandardMaterial3D.new()
	hollin.albedo_color = Color("16181c")
	var fuego := StandardMaterial3D.new()
	fuego.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	fuego.albedo_color = Color("ffb347")
	var tubo_malla := CylinderMesh.new()
	tubo_malla.top_radius = 0.06
	tubo_malla.bottom_radius = 0.06
	tubo_malla.height = 0.28
	tubo_malla.radial_segments = 12
	var boca := CylinderMesh.new()
	boca.top_radius = 0.042
	boca.bottom_radius = 0.042
	boca.height = 0.02
	boca.radial_segments = 12
	var llama_malla := SphereMesh.new()
	llama_malla.radius = 0.5
	llama_malla.height = 1.0
	llama_malla.radial_segments = 8
	llama_malla.rings = 4
	for tubo in tubos:
		var punta: Vector3 = tubo - Vector3(0.14, 0, 0)
		for pieza in [[tubo_malla, cromo, tubo], [boca, hollin, punta - Vector3(0.002, 0, 0)]]:
			var m := MeshInstance3D.new()
			m.name = "Escape"
			m.mesh = pieza[0]
			m.material_override = pieza[1]
			m.position = pieza[2]
			m.rotation.z = PI * 0.5
			_coche.add_child(m)
		var llama := MeshInstance3D.new()
		llama.name = "Petardeo"
		llama.mesh = llama_malla
		llama.material_override = fuego
		llama.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		llama.position = punta - Vector3(0.15, 0, 0)
		llama.scale = Vector3(0.34, 0.15, 0.15)
		llama.visible = false
		_coche.add_child(llama)
		_llamas.append(llama)
		var humo := _humo()
		humo.position = punta - Vector3(0.04, 0, 0)
		_coche.add_child(humo)
		_humos.append(humo)
	_montar_ruedas(perfil)
	_fundir_coche()







func _montar_ruedas(perfil: String) -> void:
	_manguetas.clear()
	_ruedas_atras.clear()
	_humos_rueda.clear()
	var ejes: Vector2 = Coche.PERFILES[perfil]["ejes"]
	var radio: float = float(Coche.PERFILES[perfil]["rueda"])
	_eje_delantero = ejes.y
	var hijos: Array[Node] = _coche.get_children()
	for k in hijos.size():
		var neumatico := hijos[k] as MeshInstance3D
		if neumatico == null or not neumatico.mesh is TorusMesh:
			continue
		if absf(neumatico.position.x - ejes.y) < 0.05:
			var piezas: Array[Node3D] = []
			for j in range(k, mini(k + 16, hijos.size())):
				var pieza := hijos[j] as MeshInstance3D
				if pieza == null:
					break
				piezas.append(pieza)
				if pieza.mesh is CylinderMesh and (pieza.mesh as CylinderMesh).top_radius < radio * 0.2:
					break
			var mangueta := Node3D.new()
			mangueta.name = "Mangueta"
			mangueta.position = Vector3(ejes.y, 0.51, neumatico.position.z)
			_coche.add_child(mangueta)
			for pieza in piezas:
				var donde: Transform3D = pieza.transform
				_coche.remove_child(pieza)
				mangueta.add_child(pieza)
				pieza.transform = mangueta.transform.affine_inverse() * donde
			_manguetas.append(mangueta)
		elif absf(neumatico.position.x - ejes.x) < 0.05:
			var pisa := Vector3(ejes.x, 0.51 - radio, neumatico.position.z)
			_ruedas_atras.append(pisa)
			var goma := _humo()
			goma.name = "HumoRueda"
			goma.amount = 22
			goma.lifetime = 1.1
			goma.direction = Vector3(-1, 0.7, 0)
			goma.spread = 35.0
			goma.initial_velocity_min = 0.6
			goma.initial_velocity_max = 1.6
			goma.gravity = Vector3(0, 0.6, 0)
			var velo := Gradient.new()
			velo.offsets = PackedFloat32Array([0.0, 0.15, 1.0])
			velo.colors = PackedColorArray([Color(0.86, 0.86, 0.88, 0), Color(0.82, 0.82, 0.84, 0.55), Color(0.9, 0.9, 0.92, 0)])
			goma.color_ramp = velo
			(goma.mesh as QuadMesh).size = Vector2(0.95, 0.95)
			goma.position = pisa + Vector3(0, 0.25, 0)
			_coche.add_child(goma)
			_humos_rueda.append(goma)
	_rodada_ultima.resize(_ruedas_atras.size())
	_rodada_ultima.fill(null)












func _fundir_coche() -> void:
	var fijas: Array[MeshInstance3D] = []
	for hijo in _coche.get_children():
		var pieza := hijo as MeshInstance3D
		if pieza != null and not _halos.has(pieza) and not _llamas.has(pieza):
			fijas.append(pieza)
	_fundir(_coche, fijas, "CocheFundido")
	for mangueta in _manguetas:
		var piezas: Array[MeshInstance3D] = []
		for hijo in mangueta.get_children():
			if hijo is MeshInstance3D:
				piezas.append(hijo)
		var rueda: MeshInstance3D = _fundir(mangueta, piezas, "RuedaFundida")
		if rueda != null:
			mangueta.move_child(rueda, 0)








static func _fundir(raiz: Node3D, piezas: Array[MeshInstance3D], nombre: String,
		unico: Material = null, tramos_out: Array = []) -> MeshInstance3D:
	var por_mat: Dictionary = {}
	var fundidas: Array[MeshInstance3D] = []
	var sombra: int = -1
	for pieza in piezas:
		var mat: Material = unico if unico != null else pieza.material_override
		var mesh: Mesh = pieza.mesh
		if mat == null or mesh == null or not pieza.visible or pieza.get_child_count() > 0 \
				or (sombra >= 0 and int(pieza.cast_shadow) != sombra) \
				or (not mesh is PrimitiveMesh and not mesh.has_meta(Detalle.META_ARRAYS)):
			continue
		var tramos: Array = []
		for s in mesh.get_surface_count():
			var arr: Array = Detalle.arrays_de(mesh, s)
			if arr.is_empty() or (mesh is ArrayMesh
					and (mesh as ArrayMesh).surface_get_primitive_type(s) != Mesh.PRIMITIVE_TRIANGLES):
				tramos.clear()
				break
			tramos.append(arr)
		if tramos.is_empty():
			continue
		sombra = int(pieza.cast_shadow)
		var t: Transform3D = pieza.transform
		var padre: Node = pieza.get_parent()
		while padre != raiz and padre is Node3D:
			t =(padre as Node3D).transform * t
			padre = padre.get_parent()
		if not por_mat.has(mat):
			por_mat[mat] = [PackedVector3Array(), PackedVector3Array(), PackedInt32Array()]
		var g: Array = por_mat[mat]
		var giro_n: Basis = t.basis.inverse().transposed()
		var espejo: bool = t.basis.determinant() < 0.0

		var gv: PackedVector3Array = g[0]
		var gn: PackedVector3Array = g[1]
		var gi: PackedInt32Array = g[2]
		var desde: int = gi.size()
		for arr in tramos:
			var vs: PackedVector3Array = arr[Mesh.ARRAY_VERTEX]
			var ns: Variant = arr[Mesh.ARRAY_NORMAL]
			var con_n: bool = ns is PackedVector3Array and (ns as PackedVector3Array).size() == vs.size()
			var base: int = gv.size()
			for i in vs.size():
				gv.append(t * vs[i])
				gn.append((giro_n *(ns as PackedVector3Array)[i]).normalized() if con_n else Vector3.UP)
			var idx: PackedInt32Array = PackedInt32Array(range(vs.size()))
			if arr[Mesh.ARRAY_INDEX] is PackedInt32Array and not (arr[Mesh.ARRAY_INDEX] as PackedInt32Array).is_empty():
				idx = arr[Mesh.ARRAY_INDEX]
			for i in range(0, idx.size() - 2, 3):
				gi.append(base + idx[i])
				gi.append(base + idx[i +(2 if espejo else 1)])
				gi.append(base + idx[i +(1 if espejo else 2)])
		g[0] = gv
		g[1] = gn
		g[2] = gi


		tramos_out.append([(t * mesh.get_aabb()).get_center(), gi.slice(desde)])
		fundidas.append(pieza)
	if fundidas.size() < 2:
		tramos_out.clear()
		return null
	var malla := ArrayMesh.new()
	for mat in por_mat:
		var g: Array = por_mat[mat]
		var arrs: Array = []
		arrs.resize(Mesh.ARRAY_MAX)
		arrs[Mesh.ARRAY_VERTEX] = g[0]
		arrs[Mesh.ARRAY_NORMAL] = g[1]
		arrs[Mesh.ARRAY_INDEX] = g[2]
		malla.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrs)
		malla.surface_set_material(malla.get_surface_count() - 1, mat)
	var junta := MeshInstance3D.new()
	junta.name = nombre
	junta.mesh = malla
	junta.cast_shadow = sombra as GeometryInstance3D.ShadowCastingSetting
	raiz.add_child(junta)
	for pieza in fundidas:
		pieza.free()
	return junta



func _humo() -> CPUParticles3D:
	var humo := CPUParticles3D.new()
	humo.name = "Humo"
	humo.amount = 16
	humo.lifetime = 0.8
	humo.local_coords = false
	humo.emitting = false
	humo.randomness = 0.4
	humo.direction = Vector3(-1, 0.25, 0)
	humo.spread = 14.0
	humo.initial_velocity_min = 1.2
	humo.initial_velocity_max = 2.4
	humo.gravity = Vector3(0, 1.1, 0)
	humo.damping_min = 1.5
	humo.damping_max = 2.5
	humo.scale_amount_min = 0.7
	humo.scale_amount_max = 1.1
	var crece := Curve.new()
	crece.max_value = 3.0
	crece.add_point(Vector2(0, 0.35))
	crece.add_point(Vector2(1, 2.4))
	humo.scale_amount_curve = crece
	var velo := Gradient.new()
	velo.offsets = PackedFloat32Array([0.0, 0.2, 1.0])
	velo.colors = PackedColorArray([Color(0.7, 0.71, 0.74, 0), Color(0.6, 0.62, 0.66, 0.5), Color(0.76, 0.76, 0.78, 0)])
	humo.color_ramp = velo
	var bocanada := QuadMesh.new()
	bocanada.size = Vector2(0.5, 0.5)
	var mat := StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	mat.vertex_color_use_as_albedo = true
	mat.albedo_texture = _degradado_redondo()
	bocanada.material = mat
	humo.mesh = bocanada
	return humo


func _degradado_redondo() -> GradientTexture2D:
	var degradado := Gradient.new()
	degradado.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
	degradado.colors = PackedColorArray([Color(1, 1, 1, 1), Color(1, 1, 1, 0.45), Color(1, 1, 1, 0)])
	var tex := GradientTexture2D.new()
	tex.gradient = degradado
	tex.fill = GradientTexture2D.FILL_RADIAL
	tex.fill_from = Vector2(0.5, 0.5)
	tex.fill_to = Vector2(1.0, 0.5)
	tex.width = 64
	tex.height = 64
	return tex



func _luces(frena: bool, dt: float) -> void:
	if frena != _frenando:
		if frena and carrera.velocidad > 28.0:
			_petardo = 0.09
			_frenazo = 0.45
		_frenando = frena
		if _pilotos != null:
			_pilotos.emission_energy_multiplier = 4.5 if frena else 0.7
			_pilotos.albedo_color = Color("ff3d55") if frena else Color("ed1738")
		for h in _halos:
			h.visible = frena
		if is_instance_valid(_luz_freno):
			_luz_freno.visible = frena
	_petardo = maxf(0.0, _petardo - dt)
	for llama in _llamas:
		llama.visible = _petardo > 0.0
	var punta: float = float(Carrera.PERFILES.get(carrera.coche, [40.0])[0])
	var humea: bool = estado == "carrera" and not frena and carrera.velocidad < punta * 0.7
	for humo in _humos:
		if humo.emitting != humea:
			humo.emitting = humea








func _derrapar(dt: float, frena: bool) -> void:
	var paso: float = minf(dt, 0.1)
	if paso <= 0.0:
		return
	var v: float = carrera.velocidad
	var punta: float = float(Carrera.PERFILES.get(carrera.coche, [40.0])[0])
	var relativa: float = clampf(v / punta, 0.0, 1.2)
	var curva: float = Carrera.curvatura(carrera.distancia)
	var lanzado: float = clampf((relativa - 0.3) / 0.4, 0.0, 1.0)
	var pide_curva: float = absf(curva) / _curva_max * relativa * relativa
	var exigencia: float = maxf(absf(carrera.volante) * lanzado, pide_curva) * Carrera.soltura(carrera.coche)
	var objetivo: float = clampf((exigencia - 0.5) / 0.4, 0.0, 1.0) *(0.4 if carrera.fuera else 1.0)
	_derrape = lerpf(_derrape, objetivo, 1.0 - exp(-(8.0 if objetivo > _derrape else 2.5) * paso))
	var hacia: float = signf(carrera.volante) if absf(carrera.volante) > 0.15 else signf(curva)
	_cola = lerpf(_cola, _derrape * 0.38 * hacia, 1.0 - exp(-7.0 * paso))
	_deslizo = lerpf(_deslizo,(carrera.x - _x_previo) / paso, 1.0 - exp(-10.0 * paso))
	_x_previo = carrera.x
	_camino = atan2(_deslizo, maxf(v, 4.0))
	_frenazo = maxf(0.0, _frenazo - paso)
	var carga: float = clampf(carrera.volante * lanzado + signf(curva) * pide_curva, -1.0, 1.0)
	var empuje: float = -1.0 if frena and v > 3.0 else (0.6 if v < punta * 0.95 else 0.0)
	var blando: float = float(BALANCEO.get(carrera.coche, 1.0))
	var n: int = ceili(paso * 120.0)
	var h: float = paso / float(n)
	for _i in n:
		_balanceo_v +=((- carga * 0.075 * blando - _balanceo) * 110.0 - _balanceo_v * 12.0) * h
		_balanceo += _balanceo_v * h
		_cabeceo_v +=((empuje * 0.03 - _cabeceo) * 90.0 - _cabeceo_v * 11.0) * h
		_cabeceo += _cabeceo_v * h
	var humea: bool = _derrape > 0.45 and not carrera.fuera and v > 12.0
	for goma in _humos_rueda:
		if goma.emitting != humea:
			goma.emitting = humea





func _posar_coche() -> void:

	var metros: float = carrera.distancia + _pasada
	var r: float = Carrera.rumbo(metros)
	var marcha := Vector3(sin(r), 0, - cos(r))
	var derecha := Vector3(cos(r), 0, sin(r))
	var pendiente: float =(Carrera.altura(metros + 1.0) - Carrera.altura(metros - 1.0)) * 0.5
	_coche.position = Carrera.mundo(metros, carrera.x) + Vector3.UP * _alto_coche \
			+(marcha *(1.0 - cos(_cola)) - derecha * sin(_cola)) * _eje_delantero
	_coche.rotation = Vector3(_balanceo, PI * 0.5 - r - _camino - _cola, atan(pendiente) + _cabeceo)
	var volante: float = carrera.volante if estado == "carrera" else 0.0
	var ruedas: float = volante *(1.0 - 1.6 * _derrape)
	for mangueta in _manguetas:
		mangueta.rotation.y = - ruedas * 0.42


	if is_instance_valid(_volante_casa):
		ModeloCockpit.girar_volante(_volante_casa, ruedas)



func _calmar() -> void:
	_derrape = 0.0
	_cola = 0.0
	_camino = 0.0
	_deslizo = 0.0
	_x_previo = carrera.x
	_balanceo = 0.0
	_balanceo_v = 0.0
	_cabeceo = 0.0
	_cabeceo_v = 0.0
	_frenazo = 0.0
	for goma in _humos_rueda:
		goma.emitting = false
	_rodada_ultima.fill(null)





func _rodar() -> void:
	if _rodadas == null or not is_instance_valid(_coche):
		return
	var marca: float = maxf(_derrape, 0.55 if _frenazo > 0.0 else 0.0)
	var pisa: bool = estado == "carrera" and marca > 0.3 and not carrera.fuera and carrera.velocidad > 8.0
	for i in _ruedas_atras.size():
		if not pisa:
			_rodada_ultima[i] = null
			continue


		var punto: Vector3 = _coche.transform * _ruedas_atras[i]
		punto.y = Carrera.altura(carrera.distancia + _ruedas_atras[i].x)
		if _rodada_ultima[i] == null:
			_rodada_ultima[i] = punto
			continue
		var tramo: Vector3 = punto -(_rodada_ultima[i] as Vector3)
		if tramo.length() < RODADA_TRAMO:
			continue
		if tramo.length() < 6.0:
			var ranura: int = _rodadas_n % RODADAS_MAX
			_rodadas.set_instance_transform(ranura, _tira(_rodada_ultima[i], punto))
			_rodadas.set_instance_color(ranura, Color(GOMA, 0.2 + 0.5 * marca))
			_rodadas_n += 1
			_rodadas.visible_instance_count = mini(_rodadas_n, RODADAS_MAX)
		_rodada_ultima[i] = punto



static func _tira(desde: Vector3, hasta: Vector3) -> Transform3D:
	var tramo: Vector3 = hasta - desde
	return Transform3D(Basis(tramo, Vector3.UP, tramo.cross(Vector3.UP).normalized() * 0.22),
		(desde + hasta) * 0.5 + Vector3.UP * 0.03)

func _crear_rodadas() -> void:
	var tira := PlaneMesh.new()
	tira.size = Vector2.ONE
	_rodadas = MultiMesh.new()
	_rodadas.transform_format = MultiMesh.TRANSFORM_3D
	_rodadas.use_colors = true
	_rodadas.mesh = tira
	_rodadas.instance_count = RODADAS_MAX
	_rodadas.visible_instance_count = 0
	var mat := StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.vertex_color_use_as_albedo = true


	mat.vertex_color_is_srgb = true
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	var nodo := MultiMeshInstance3D.new()
	nodo.name = "Rodadas"
	nodo.multimesh = _rodadas
	nodo.material_override = mat
	nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_mundo.add_child(nodo)



func _crear_confeti() -> void:
	_confeti = CPUParticles3D.new()
	_confeti.name = "Confeti"
	_confeti.emitting = false
	_confeti.one_shot = true
	_confeti.amount = 260
	_confeti.lifetime = 4.0
	_confeti.explosiveness = 0.55
	_confeti.emission_shape = CPUParticles3D.EMISSION_SHAPE_BOX
	_confeti.emission_box_extents = Vector3(4.0, 0.5, 4.0)
	_confeti.direction = Vector3.UP
	_confeti.spread = 70.0
	_confeti.initial_velocity_min = 2.0
	_confeti.initial_velocity_max = 5.5
	_confeti.gravity = Vector3(0, -3.2, 0)
	_confeti.damping_min = 0.8
	_confeti.damping_max = 1.6
	_confeti.angle_min = -180.0
	_confeti.angle_max = 180.0
	_confeti.angular_velocity_min = -420.0
	_confeti.angular_velocity_max = 420.0
	_confeti.scale_amount_min = 0.7
	_confeti.scale_amount_max = 1.2
	var papel := QuadMesh.new()
	papel.size = Vector2(0.2, 0.12)
	var mat := StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.vertex_color_use_as_albedo = true
	mat.vertex_color_is_srgb = true
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_PARTICLES
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	papel.material = mat
	_confeti.mesh = papel
	_confeti.visible = false
	_mundo.add_child(_confeti)



func _lanzar_confeti(sitio: Vector3, medalla: Color) -> void:
	var colores := Gradient.new()
	colores.interpolation_mode = Gradient.GRADIENT_INTERPOLATE_CONSTANT
	colores.offsets = PackedFloat32Array([0.0, 0.4, 0.6, 0.8])
	colores.colors = PackedColorArray([medalla, medalla.lightened(0.35), CareerTheme.accent(),
		CareerTheme.NAV_PLANTILLA])
	_confeti.color_initial_ramp = colores
	_confeti.position = sitio
	_confeti.visible = true
	_confeti.restart()

func _borrar_rodadas() -> void:
	_rodadas_n = 0
	if _rodadas != null:
		_rodadas.visible_instance_count = 0
	_rodada_ultima.fill(null)

func _pintar_ficha() -> void:
	var id: String = carrera.coche
	var mejor: float = float(Settings.simulador_best.get(id, 0.0))
	var ganada: int = Carrera.medalla_de(id, mejor)
	for i in _medallas.size():
		var nivel: int = 3 - i
		_medallas[i].text = "%d s" % int(Carrera.umbral(id, nivel))

		_medallas[i].add_theme_color_override("font_color",
			CareerTheme.MONEY if ganada >= nivel else CareerTheme.TEXT_DIM)
	_record.text = I18n.tf("TU RÉCORD: {0} s", ["%.2f" % mejor]) if mejor > 0 else I18n.t("SIN RÉCORD TODAVÍA")
	if mejor > 0 and Settings.simulador_fantasma.has(id):
		_record.text += " · " + I18n.t("CORRES CONTRA TU FANTASMA")

func _empezar() -> void:
	if coches.is_empty() or not Career.house_extras.has("simulador") \
			or not Carrera.disponibles(Career.lifestyle).has(coches[elegido]):
		estado = "seleccion"
		_elegir(0)
		return
	if estado == "pausa":

		_cuenta = 1.0
		estado = "cuenta"
	elif estado not in ["carrera", "cuenta"]:
		if coches.is_empty() or not carrera.iniciar(coches[elegido], Career.lifestyle,
				Career.house_extras.has("simulador")):
			_elegir(0)
			return
		estado = "cuenta"
		_cuenta = 3.0
		_cam_carril = 0.0
		_cam_rumbo = Carrera.rumbo(0.0)
		_ritmo = 0.0
		_destello_moneda = 0.0
		_nuevo_record = false
		_nuevos_logros.clear()
		_aviso_control = 0.0
		_texto_control = ""
		_diferencia.text = ""
		_estaba_fuera = false
		_salir_de_meta()
		_borrar_rodadas()
		_calmar()
		_montar_fantasma()
	_limpiar_mandos()
	_inicio.disabled = true
	_anterior.disabled = true
	_siguiente.disabled = true
	_refrescar_estado_ui()
	_actualizar()

func _montar_fantasma() -> void:
	_trazo_rival = PackedFloat32Array(Settings.simulador_fantasma.get(carrera.coche, PackedFloat32Array()))
	if not Carrera.trazo_valido(_trazo_rival):
		_trazo_rival = PackedFloat32Array()
	if _trazo_rival.is_empty():
		if is_instance_valid(_fantasma):
			_fantasma.hide()
		return
	var perfil: String = String(Shop.lifestyle_by_id(carrera.coche)["modelo"])
	if not is_instance_valid(_fantasma):
		var fabrica = Coche.new()
		fabrica.copias_cpu = true
		_fantasma = fabrica.montar(_mundo, perfil, 90.0)
		_fantasma.name = "Fantasma"
		_fantasma.scale = Vector3.ONE
		_fantasma.position.y = float(Coche.PERFILES[perfil]["rueda"]) - 0.51
		_translucido(_fantasma)


		var piezas: Array[MeshInstance3D] = []
		for hijo in _fantasma.get_children():
			if hijo is MeshInstance3D:
				piezas.append(hijo)
		var tramos: Array = []
		var junta: MeshInstance3D = _fundir(_fantasma, piezas, "FantasmaFundido", _eco, tramos)
		_fantasma_malla = null
		_fantasma_centros.clear()
		_fantasma_indices.clear()
		_fantasma_orden.clear()
		_fantasma_claves.clear()


		if junta != null and (junta.mesh as ArrayMesh).surface_get_array_len(0) < 65535:
			_fantasma_malla = junta.mesh
			for k in tramos.size():
				_fantasma_centros.append(tramos[k][0])
				_fantasma_indices.append(tramos[k][1])
				_fantasma_orden.append(k)
				_fantasma_claves.append(Vector2.ZERO)
	_fantasma.show()

func _translucido(nodo: Node) -> void:


	if _eco == null:
		_eco = StandardMaterial3D.new()
		_eco.albedo_color = Color(0.62, 0.83, 1.0, 0.4)
		_eco.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		_eco.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_ALWAYS
		_eco.emission_enabled = true
		_eco.emission = Color(0.35, 0.6, 0.9)
		_eco.emission_energy_multiplier = 0.4
	if nodo is GeometryInstance3D:
		nodo.material_override = _eco
		nodo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	for hijo in nodo.get_children():
		_translucido(hijo)

func _pausar() -> void:
	if estado not in ["carrera", "cuenta"]:
		return
	estado = "pausa"
	_limpiar_mandos()
	_inicio.disabled = false
	_inicio.text = I18n.t("CONTINUAR")
	_mensaje.text = I18n.t("PAUSA")
	_aviso.text = ""
	_refrescar_estado_ui()
	for linea in _rayas:
		linea.visible = false

func _limpiar_mandos() -> void:
	_dedos.clear()
	_lado = 0
	_rampa = 0.0
	_pulsa_izq = false
	_pulsa_der = false
	_pintar_mando()

func _reiniciar() -> void:
	if estado not in ["pausa", "meta"]: return
	estado = "seleccion"
	_empezar()




func _lado_de(pos: Vector2) -> int:
	if not _mando.is_visible_in_tree():
		return 0
	if _izq.get_global_rect().grow_individual(40, 40, 0, 40).has_point(pos):
		return -1
	if _der.get_global_rect().grow_individual(0, 40, 40, 40).has_point(pos):
		return 1
	return 0

func _input(ev: InputEvent) -> void:
	if ev is InputEventJoypadButton and _mando_rodando(ev):
		return
	if ev is InputEventKey and ev.pressed and not ev.echo and ev.keycode == KEY_ESCAPE:
		get_viewport().set_input_as_handled()
		_pausar() if estado in ["carrera", "cuenta"] else _cerrar()
		return
	if estado not in ["carrera", "cuenta"]: return
	if ev is InputEventScreenTouch:
		if ev.pressed:

			var lado: int = _lado_de(ev.position)
			if lado == 0:
				return
			_dedos[ev.index] = lado
		elif _dedos.has(ev.index):
			_dedos.erase(ev.index)
		else:
			return
		get_viewport().set_input_as_handled()
	elif ev is InputEventScreenDrag and _dedos.has(ev.index):

		var lado: int = _lado_de(ev.position)
		if lado != 0:
			_dedos[ev.index] = lado
		get_viewport().set_input_as_handled()






func _mando_rodando(ev: InputEventJoypadButton) -> bool:
	if ev.is_action_pressed("fl_pausa"):
		if estado in ["carrera", "cuenta"]:
			_pausar()
		elif estado == "pausa":
			_empezar()
		else:
			return false
		get_viewport().set_input_as_handled()
		return true
	if estado in ["carrera", "cuenta"] and (ev.is_action("fl_atras")
			or ev.is_action("fl_avanza") or ev.is_action("fl_toque")):
		get_viewport().set_input_as_handled()
		return true
	return false


func _notification(que: int) -> void:
	if que == NOTIFICATION_APPLICATION_FOCUS_OUT or que == NOTIFICATION_APPLICATION_PAUSED:
		_pausar()




func _mandos(dt: float = 0.0) -> Dictionary:
	_pulsa_izq = Input.is_physical_key_pressed(KEY_LEFT) or Input.is_physical_key_pressed(KEY_A) \
			or _dedos.values().has(-1)
	_pulsa_der = Input.is_physical_key_pressed(KEY_RIGHT) or Input.is_physical_key_pressed(KEY_D) \
			or _dedos.values().has(1)
	var freno_tecla: bool = Input.is_physical_key_pressed(KEY_DOWN) or Input.is_physical_key_pressed(KEY_S)
	if Entrada.hay_mando():


		var ex: float = Entrada.eje(true).x
		_pulsa_izq = _pulsa_izq or ex < - ZONA_VOLANTE or Input.is_action_pressed("ui_left")
		_pulsa_der = _pulsa_der or ex > ZONA_VOLANTE or Input.is_action_pressed("ui_right")
		freno_tecla = freno_tecla or Input.is_action_pressed("fl_avanza") \
				or Input.is_action_pressed("fl_atras") or Input.is_action_pressed("fl_toque") \
				or Input.get_joy_axis(Entrada.dispositivo, JOY_AXIS_TRIGGER_LEFT) > ZONA_GATILLO \
				or Input.get_joy_axis(Entrada.dispositivo, JOY_AXIS_TRIGGER_RIGHT) > ZONA_GATILLO
	var ambos: bool = _pulsa_izq and _pulsa_der
	var lado: int = _lado if ambos else (-1 if _pulsa_izq else (1 if _pulsa_der else 0))
	if lado != _lado:
		_lado = lado
		_rampa = RAMPA_BASE if lado != 0 else 0.0
	elif lado != 0:
		_rampa = minf(1.0, _rampa + RAMPA_SUBE * dt)
	return {"direccion": float(_lado) * _rampa, "freno": ambos or freno_tecla}


func _pintar_mando() -> void:
	if _izq == null:
		return


	for par in [[_izq, _pulsa_izq, clampf(- carrera.volante, 0.0, 1.0)],
			[_der, _pulsa_der, clampf(carrera.volante, 0.0, 1.0)]]:
		var boton: BotonVolante = par[0]
		if boton.pulsado != par[1] or boton.llenado != par[2]:
			boton.pulsado = par[1]
			boton.llenado = par[2]
			boton.queue_redraw()
	var tinta: Color = CareerTheme.INK_LIGHT if _pulsa_izq and _pulsa_der else CareerTheme.TEXT_DIM
	if not _ambos.has_theme_color_override("font_color") or _ambos.get_theme_color("font_color") != tinta:
		_ambos.add_theme_color_override("font_color", tinta)

func _process(dt: float) -> void:
	if estado == "cuenta":
		_contar(dt)
		return
	if estado == "meta":
		_celebrar(dt)
		return
	if estado != "carrera":
		return
	var mandos: Dictionary = _mandos(dt)
	var puntos_antes: int = carrera.puntos
	var controles_antes: int = carrera.controles.size()
	carrera.avanzar(dt, float(mandos["direccion"]), bool(mandos["freno"]))
	_luces(bool(mandos["freno"]), dt)
	_derrapar(dt, bool(mandos["freno"]))
	_pintar_mando()
	_ya = maxf(0.0, _ya - dt)
	_aviso_control = maxf(0, _aviso_control - dt)
	if carrera.controles.size() > controles_antes:
		_cruzar_control(carrera.controles.size() - 1)
	if carrera.fuera and not _estaba_fuera:
		UiAudio.haptic(30)
	_estaba_fuera = carrera.fuera
	_destello_moneda = maxf(0.0, _destello_moneda - dt)
	if carrera.puntos > puntos_antes:
		_destello_moneda = 0.35
	_ritmo = lerpf(_ritmo, clampf(carrera.velocidad / 72.0, 0, 1), 1.0 - exp(-4.0 * minf(dt, 0.1)))
	var suave: float = 1.0 - exp(-7.0 * minf(dt, 0.1))
	_cam_carril = lerpf(_cam_carril, carrera.carril() * 0.7, suave)
	_cam_rumbo = lerp_angle(_cam_rumbo, Carrera.rumbo(carrera.distancia + 6.0), 1.0 - exp(-5.0 * minf(dt, 0.1)))
	_actualizar()
	_rodar()
	_actualizar_rafagas()
	if carrera.terminado:
		_finalizar()

func _contar(dt: float) -> void:
	var antes: int = ceili(_cuenta)
	_cuenta -= dt

	_luces(true, dt)
	_mandos()
	_pintar_mando()
	if ceili(_cuenta) != antes:
		UiAudio.haptic(12)
	if _cuenta <= 0.0:
		estado = "carrera"
		_ya = 0.7
		_refrescar_estado_ui()
	_actualizar()

func _cruzar_control(i: int) -> void:
	_aviso_control = 2.0
	UiAudio.haptic(15)
	var parcial: float = carrera.tiempos_control[i]
	_texto_control = I18n.tf("CONTROL {0} · {1} s", [str(i + 1), "%.2f" % parcial])
	if not carrera.controles[i]:
		_texto_control = I18n.t("CONTROL PERDIDO · PUEDES REINICIAR EN PAUSA")
		return
	var rival: float = Carrera.tiempo_fantasma(_trazo_rival, Carrera.CONTROLES[i])
	if rival > 0.0:
		_diferencia.text = _delta(parcial - rival)
		_diferencia.add_theme_color_override("font_color",
			CareerTheme.DANGER if parcial > rival else CareerTheme.TEXT)
		_texto_control += "\n" + _diferencia.text

func _delta(segundos: float) -> String:
	return ("+" if segundos > 0 else "-") + "%.2f s" % absf(segundos)

func _finalizar() -> void:
	if estado != "carrera" or not carrera.terminado:
		return
	estado = "meta"
	_limpiar_mandos()
	_meta_v = carrera.velocidad
	carrera.velocidad = 0.0
	_marcas[carrera.coche] = minf(float(_marcas.get(carrera.coche, INF)), carrera.tiempo)
	var previo: float = float(Settings.simulador_best.get(carrera.coche, 0.0))
	var valida: bool = carrera.controles.count(true) == Carrera.CONTROLES.size()
	Settings.contar_vuelta_simulador(carrera.coche, valida, carrera.puntos, carrera.vuelta_limpia(),
		not carrera.freno_usado)
	if valida:
		_nuevo_record = Settings.registrar_simulador(carrera.coche, carrera.tiempo,
			carrera.controles.count(true), carrera.objetivo_cumplido(), carrera.trazo)
	_nuevos_logros = Achievements.revisar_simulador()
	var medalla: int = carrera.medalla()
	_medalla_meta = medalla


	var claro: Color = [CareerTheme.INK_LIGHT, TrophyIcon.BRONZE, TrophyIcon.SILVER, TrophyIcon.GOLD][medalla]
	var oscuro: Color = [CareerTheme.TEXT_DIM, TrophyIcon.BRONZE_D, TrophyIcon.SILVER_D, TrophyIcon.GOLD_D][medalla]
	_resultado_titulo.text = I18n.t(["SIN MEDALLA", "MEDALLA DE BRONCE", "MEDALLA DE PLATA", "MEDALLA DE ORO"][medalla])
	_resultado_titulo.add_theme_color_override("font_color", claro if medalla > 0 else CareerTheme.TEXT)
	_resultado.add_theme_stylebox_override("panel", CareerTheme.plate_edged(claro))
	_disco.visible = medalla > 0
	_disco.claro = claro
	_disco.oscuro = oscuro
	_disco.queue_redraw()
	_coche_meta.text = _nombre.text


	_banda.color_banda = claro if medalla > 0 else CareerTheme.accent()
	_banda.palabra = I18n.t(["¡META!", "¡BRONCE!", "¡PLATA!", "¡ORO!"][medalla])
	var lineas: Array[String] = [I18n.tf("MONEDAS {0}/{1}", [str(carrera.puntos), str(_monedas_s.size())])]
	_pastilla.visible = _nuevo_record
	if _nuevo_record:
		_pastilla_texto.text = I18n.t("NUEVO RÉCORD DE TIEMPO")
		if previo > 0:
			_pastilla_texto.text += " · " + _delta(carrera.tiempo - previo)
	elif previo > 0 and valida:
		lineas.append(I18n.tf("TU RÉCORD: {0} s", ["%.2f" % previo]) + " · " + _delta(carrera.tiempo - previo))
	if not valida:
		lineas.append(I18n.t("Sin récord: faltaron controles."))
	elif medalla < 3:
		lineas.append(I18n.tf("SIGUIENTE MEDALLA: {0} s", [str(int(Carrera.umbral(carrera.coche, medalla + 1)))]))
	for id in _nuevos_logros:
		lineas.append(I18n.tf("LOGRO: {0}", [CareerTheme.caps(I18n.t(String(Achievements.by_id(id).get("name", ""))))]))
	_resultado_detalle.text = "\n".join(PackedStringArray(lineas))
	_resultado_detalle.custom_minimum_size.y =(ceilf(CareerTheme.T_DIM * 1.6) + 6.0) * lineas.size()
	_inicio.text = I18n.t("OTRA CARRERA")
	_anterior.disabled = coches.size() < 2
	_siguiente.disabled = coches.size() < 2
	for linea in _rayas:
		linea.visible = false
	if is_instance_valid(_fantasma):
		_fantasma.hide()
	for goma in _humos_rueda:
		goma.emitting = false
	_rodada_ultima.fill(null)


	var coche: Vector3 = Carrera.mundo(carrera.distancia, carrera.x) + Vector3.UP * 0.9
	_meta_desde = _cam.position - coche
	_meta_mira = _cam.position - _cam.basis.z * 24.0 - coche
	_meta_fov = _cam.fov
	_meta_rumbo = _cam_rumbo
	_meta_frenada = clampf(_meta_v * _meta_v /(2.0 * PARADA_META), 7.0, 40.0)
	_pasada = 0.0
	_meta_t = 0.0
	_pintar_ficha()
	_refrescar_estado_ui()
	_pintar_festejo()
	_actualizar()



func _celebrar(dt: float) -> void:
	var paso: float = minf(dt, 0.1)
	var antes: float = _meta_t
	_meta_t += paso
	var golpe: float = BandaMeta.SELLO + BandaMeta.GOLPE
	if antes < golpe and _meta_t >= golpe:
		UiAudio.haptic(40)
		if _medalla_meta > 0:
			var parada: float = _pasada + _meta_v * _meta_v /(2.0 * _meta_frenada)



			_lanzar_confeti(Carrera.mundo(carrera.distancia + parada, carrera.x - 5.0) + Vector3.UP * 7.0,
				_banda.color_banda)
	if _nuevo_record and antes < RECORD_META and _meta_t >= RECORD_META:
		UiAudio.haptic(20)
	if _meta_v > 0.0:
		_pasada += _meta_v * paso
		_meta_v = maxf(0.0, _meta_v - _meta_frenada * paso)
	_luces(_meta_v > 0.5, paso)
	_asentar(paso)
	_vitorear()
	_pintar_festejo()
	_actualizar()



func _asentar(paso: float) -> void:
	if paso <= 0.0:
		return
	var empuje: float = -1.0 if _meta_v > 0.5 else 0.0
	var n: int = ceili(paso * 120.0)
	var h: float = paso / float(n)
	for _i in n:
		_balanceo_v +=(- _balanceo * 110.0 - _balanceo_v * 12.0) * h
		_balanceo += _balanceo_v * h
		_cabeceo_v +=((empuje * 0.03 - _cabeceo) * 90.0 - _cabeceo_v * 11.0) * h
		_cabeceo += _cabeceo_v * h
	var k: float = 1.0 - exp(-5.0 * paso)
	_cola = lerpf(_cola, 0.0, k)
	_camino = lerpf(_camino, 0.0, k)
	_derrape = lerpf(_derrape, 0.0, k)



func _vitorear() -> void:
	if _vitores.is_empty():
		for color in ["red", "blue"]:
			var cuadros: Array[Texture2D] = []
			for k in 4:
				cuadros.append(load("res://assets/sprites/crowd/fan_%s_cheer_%02d.png" % [color, k + 1]))
			_vitores[color] = cuadros
	var fuerza: float = lerpf(1.0, 0.4, clampf((_meta_t - 4.0) / 1.5, 0.0, 1.0))
	for i in _gradas_hinchas.size():
		var nodo: MultiMeshInstance3D = _gradas_hinchas[i]
		var cuadros: Array = _vitores["red" if bool(nodo.get_meta("rojo")) else "blue"]
		(nodo.material_override as StandardMaterial3D).albedo_texture = \
				cuadros[(i + int(_meta_t * 7.0)) % cuadros.size()]
		nodo.position.y = absf(sin(_meta_t * 9.0 + i * 1.3)) * 0.25 * fuerza

func _calmar_hinchas() -> void:
	for nodo in _gradas_hinchas:
		(nodo.material_override as StandardMaterial3D).albedo_texture = nodo.get_meta("textura")
		nodo.position.y = 0.0


func _salir_de_meta() -> void:
	if _meta_t < 0.0:
		return
	_meta_t = -1.0
	_meta_v = 0.0
	_pasada = 0.0
	_fila.modulate.a = 1.0
	_cambiar.disabled = false
	_calmar_hinchas()
	if _confeti != null:
		_confeti.visible = false
		_confeti.emitting = false


func _pintar_festejo() -> void:
	var t: float = _meta_t
	_banda.t = t
	_banda.queue_redraw()
	_destello.modulate.a = 0.45 *(1.0 - clampf(t / 0.22, 0.0, 1.0))
	var tarjeta: float = t - TARJETA_META
	_resultado.modulate.a = clampf(tarjeta / 0.18, 0.0, 1.0)
	_resultado.pivot_offset = _resultado.size * 0.5
	_resultado.scale = Vector2.ONE * lerpf(0.8, 1.0, _rebote(clampf(tarjeta / 0.3, 0.0, 1.0)))

	var cuenta: float = 1.0 - pow(1.0 - clampf((t - CUENTA_META) / 0.55, 0.0, 1.0), 5.0)
	_tiempo_meta.text = "%.2f s" %(carrera.tiempo * cuenta)
	if _pastilla.visible:
		_pastilla.pivot_offset = _pastilla.size * 0.5
		_pastilla.scale = Vector2.ONE * maxf(0.01, _rebote(clampf((t - RECORD_META) / 0.3, 0.0, 1.0)))


	_fila.modulate.a = clampf((t - BOTONES_META) / 0.25, 0.0, 1.0)
	_inicio.disabled = t < BOTONES_META
	_cambiar.disabled = _inicio.disabled


static func _rebote(x: float) -> float:
	return 1.0 + 2.70158 * pow(x - 1.0, 3.0) + 1.70158 * pow(x - 1.0, 2.0)

func _actualizar() -> void:
	_hud.text = "%d km/h" % roundi(carrera.velocidad * 3.6)
	_reloj.text = "%.2f" % carrera.tiempo
	_botin.text = "%d/%d" % [carrera.puntos, _monedas_s.size()]
	_aviso.text = _texto_aviso()

	var grito: bool = estado == "cuenta" or (estado == "carrera" and _ya > 0)


	var tam_aviso: int = CareerTheme.T_HUD_VS if grito else CareerTheme.T_HUD_ROTULO
	if not _aviso.has_theme_font_size_override("font_size") or _aviso.get_theme_font_size("font_size") != tam_aviso:
		_aviso.add_theme_font_size_override("font_size", tam_aviso)
	_mapa.mover(carrera.distancia, carrera.x, carrera.fuera, Carrera.fantasma_en(_trazo_rival, carrera.tiempo).x \
			if not _trazo_rival.is_empty() and estado in ["cuenta", "carrera", "pausa"] else -1.0)
	_botin.modulate = CareerTheme.INK_LIGHT if _destello_moneda <= 0 else CareerTheme.MONEY.lightened(0.5)
	_mover_monedas()
	for i in _porticos.size():
		var mat := _porticos[i].material_override as StandardMaterial3D
		var tono: Color = PORTICO_POR_PASAR if i >= carrera.controles.size() else (
			PORTICO_PASADO if carrera.controles[i] else PORTICO_PERDIDO)

		if mat.albedo_color != tono:
			mat.albedo_color = tono
	if is_instance_valid(_coche):
		_posar_coche()
	_pintar_semaforo()
	_mover_fantasma()
	_camara()




func _mover_monedas() -> void:
	if _monedas_oro == null:
		return
	_monedas_vistas.fill(0)
	var desde: float = carrera.distancia - 1
	var hasta: float = carrera.distancia + 190
	var i: int = _monedas_s.bsearch(desde)
	while i > 0 and _monedas_s[i - 1] >= desde:
		i -= 1
	var n: int = 0
	while i < _monedas_s.size() and _monedas_s[i] <= hasta:
		var recogida: bool = i < carrera.recogidas.size() and carrera.recogidas[i]
		if not recogida and _monedas_s[i] >= desde:

			var pos: Vector3 = _monedas_pos[i]
			pos.y = _monedas_alto[i] + sin(carrera.tiempo * 3.0 + i) * 0.13
			var xf: Transform3D = Transform3D(Basis.from_euler(Vector3(0, carrera.tiempo * 2.5 + i * 0.35, 0)), pos) \
					* _moneda_tumbada



			var o: int = n * 12
			for f in 3:
				_monedas_xf[o + f * 4] = xf.basis.x[f]
				_monedas_xf[o + f * 4 + 1] = xf.basis.y[f]
				_monedas_xf[o + f * 4 + 2] = xf.basis.z[f]
				_monedas_xf[o + f * 4 + 3] = xf.origin[f]
			_monedas_vistas[i] = 1
			n += 1
		i += 1
	_monedas_oro.buffer = _monedas_xf
	_monedas_sello.buffer = _monedas_xf
	_monedas_oro.visible_instance_count = n
	_monedas_sello.visible_instance_count = n

func _texto_aviso() -> String:
	if estado == "cuenta":
		return str(maxi(1, ceili(_cuenta)))
	if estado != "carrera":
		return ""
	if _ya > 0:
		return I18n.t("¡YA!")
	if carrera.fuera:
		return I18n.t("FUERA DEL ASFALTO: VUELVE A LA PISTA")
	if _aviso_control > 0 and not _texto_control.is_empty():
		return _texto_control
	var limite: float = 72.0
	for anticipacion in [10.0, 25.0, 40.0]:
		limite = minf(limite, Carrera.velocidad_curva(carrera.distancia + anticipacion, carrera.coche))
	if carrera.velocidad > limite:
		return I18n.t("CURVA CERRADA: FRENA")
	return ""

func _mover_fantasma() -> void:
	if not is_instance_valid(_fantasma) or _trazo_rival.is_empty():
		return
	var fin: float = _trazo_rival[_trazo_rival.size() - 3]
	_fantasma.visible = estado in ["cuenta", "carrera", "pausa"] and carrera.tiempo <= fin
	if not _fantasma.visible:
		return
	var p: Vector2 = Carrera.fantasma_en(_trazo_rival, carrera.tiempo)


	var alfa: float = 0.4 * clampf((absf(p.x - carrera.distancia) - 4.0) / 8.0, 0.0, 1.0)
	_eco.albedo_color.a = alfa
	_fantasma.visible = alfa > 0.01
	_posar(_fantasma, p.x, p.y, 0.0)




func _posar(nodo: Node3D, metros: float, lado: float, giro: float) -> void:
	nodo.position = Carrera.mundo(metros, lado) + Vector3.UP * _alto_coche
	var pendiente: float =(Carrera.altura(metros + 1.0) - Carrera.altura(metros - 1.0)) * 0.5
	nodo.rotation = Vector3(0.0, PI * 0.5 - Carrera.rumbo(metros) - giro, atan(pendiente))

func _pintar_semaforo() -> void:


	var encendidas: int = 0
	if estado == "cuenta":
		encendidas = clampi(6 - ceili(_cuenta / 0.6), 1, 5)
	for i in _semaforo.size():
		var luz: Material = _luz_on if i < encendidas else _luz_off

		if _semaforo[i].material_override != luz:
			_semaforo[i].material_override = luz

func _camara() -> void:
	if estado == "meta" and _meta_t >= 0.0:
		_camara_meta()
		return


	var d: float = carrera.distancia
	var adelante := Vector3(sin(_cam_rumbo), 0, - cos(_cam_rumbo))
	var base: Vector3 = Carrera.mundo(d, _cam_carril)
	_cam.fov = lerpf(59.0, 77.0, _ritmo)
	_cam.position = base - adelante * lerpf(10.5, 8.4, _ritmo) + Vector3.UP * lerpf(5.0, 3.4, _ritmo)
	_cam.look_at(base + adelante * 23.0 + Vector3.UP * 0.8)
	_ordenar_fantasma()









func _ordenar_fantasma() -> void:
	if _fantasma_malla == null or not is_instance_valid(_fantasma) or not _fantasma.visible:
		return
	var ojo: Vector3 = _fantasma.global_transform.affine_inverse() * _cam.global_position
	for k in _fantasma_centros.size():


		_fantasma_claves[k] = Vector2(- _fantasma_centros[k].distance_to(ojo), k)
	_fantasma_claves.sort()
	var igual: bool = true
	for k in _fantasma_claves.size():
		var pieza: int = int(_fantasma_claves[k].y)
		if _fantasma_orden[k] != pieza:
			igual = false
			_fantasma_orden[k] = pieza
	if igual:
		return
	var indices := PackedInt32Array()
	for pieza in _fantasma_orden:
		indices.append_array(_fantasma_indices[pieza])


	var dos_bytes := Image.create_from_data(indices.size(), 1, false, Image.FORMAT_RGBA8,
		indices.to_byte_array())
	dos_bytes.convert(Image.FORMAT_RG8)
	RenderingServer.mesh_surface_update_index_region(_fantasma_malla.get_rid(), 0, 0, dos_bytes.get_data())





func _camara_meta() -> void:
	var coche: Vector3 = Carrera.mundo(carrera.distancia + _pasada, carrera.x) + Vector3.UP * 0.9
	var e: float = smoothstep(0.0, 1.4, _meta_t)
	var barrido: float = smoothstep(0.0, 2.8, _meta_t) * 2.35 + sin(maxf(0.0, _meta_t - 2.8) * 0.3) * 0.3
	var ang: float = _meta_rumbo + PI - barrido
	var orbita: Vector3 = Vector3(sin(ang), 0.0, - cos(ang)) * 8.0 + Vector3.UP * 3.2
	_cam.fov = lerpf(_meta_fov, 50.0, e)
	_cam.position = coche + _meta_desde.lerp(orbita, e)
	_cam.look_at(coche + _meta_mira.lerp(Vector3.DOWN, e))

func _actualizar_rafagas() -> void:

	var fuerza: float = clampf((carrera.velocidad - 25.0) / 47.0, 0, 1)
	var tam: Vector2 = _pantalla.size
	var centro: Vector2 = tam * Vector2(0.5, 0.4)
	for i in _rayas.size():
		var linea: Line2D = _rayas[i]
		linea.visible = fuerza > 0.02

		if not linea.visible:
			continue
		var fase: float = fposmod(carrera.tiempo *(1.2 + fuerza) + i * 0.173, 1.0)
		var extremo := Vector2((-0.1 if i % 2 == 0 else 1.1) * tam.x,(0.15 + float(i % 6) * 0.18) * tam.y)
		var inicio: Vector2 = centro.lerp(extremo, 0.8 + fase * 0.25)
		linea.points = PackedVector2Array([inicio, centro.lerp(extremo, 0.88 + fase * 0.25 + fuerza * 0.1)])
		linea.modulate.a = fuerza * 0.2 *(1.0 - fase)

func _cerrar() -> void:
	if _cerrando:
		return
	_cerrando = true
	queue_free()

func _exit_tree() -> void:
	if is_instance_valid(_video_casa):
		_video_casa.free()
	if is_instance_valid(_volante_casa):
		ModeloCockpit.girar_volante(_volante_casa, 0.0)
	var arbol: SceneTree = get_tree()
	if arbol != null:
		arbol.paused = _pausa_previa
