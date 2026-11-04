class_name PokerRoom3D
extends Control

























const FICHA: int = 1000








const CIEGA: int = 4





const MANOS_NOCHE: int = 30
const CIEGA_CADA: int = 10
const CIEGA_PASO: int = 2


const TORNEO_CIEGA_CADA: int = 5



const MANOS_LECTURA: int = 6



const RETOS: Array[String] = ["farol", "arruina", "bote", "color", "positivo"]
const RETO_QUIMICA: float = 3.0

const RETO_BOTE: int = 40







const CARTA_PAPEL: Color = Color("f2efe6")
const CARTA_ROJA: Color = Color("b23a3a")
const CARTA_NEGRA: Color = Color("1c1c20")


const CARTA_DORSO: Color = Color("6d1f28")
const CARTA_DORSO_IN: Color = Color("4a141c")



const FIELTRO: Color = Color("1d5c3a")
const MADERA: Color = Color("46281a")
const SUELO: Color = Color("14100e")










const MESA_R: float = 2.45
const MESA_Y: float = 0.78
const ASIENTO_R: float = 2.85
const CARTAS_R: float = 1.85




const COM_Z: float = 0.45
const MIS_CARTAS_Z: float = 1.25









const NAIPE_LADEO: float = 24.0
const MI_NAIPE_LADEO: float = 46.0










const OJO: Vector3 = Vector3(0.0, 3.0, 2.6)
const MIRA: Vector3 = Vector3(0.0, 1.0, -0.4)















const FOV: float = 47.4



const PIXEL_M: float = 1.78 / 65.0
const PIES_PX: float = 38.0



const SENTADO: float = 0.34



const TRAJE: String = "res://assets/sprites/anim/gala_south_"





const FUENTE: Font = preload("res://assets/fonts/PressStart2P-Regular.ttf")

signal cerrada(saldo: int)

var _mesa: PokerMesa = null
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _fichas_inicio: int = 0


var _mano_n: int = 0
var _mejor_mano: int = 0
var _arruinados: int = 0

var _subidas_yo: int = 0


var _netos: Dictionary = {}
var _reto_hecho: bool = false
var _reto_subio: int = 0
var _reto_lbl: Label = null
var _ronda_lbl: Label = null


var torneo: bool = false

var _invitados: Array = []

var _vp: SubViewport = null
var _mundo: Node3D = null
var _cam: Camera3D = null



var _tablero: Node3D = null

var _gente3d: Array = []










const PASO_SEG: float = 0.85













const VIAJE_MIN: float = 0.34
const VIAJE_MAX: float = 0.5
const VIAJE_PASO: float = 0.05





const VIAJE_FICHAS: int = 7



const COBRO_FICHAS: int = 9
const COBRO_SEG: float = 0.52



var _corriendo: bool = false
var _espera: float = 0.0










var _fichas_npc: Dictionary = {}





var _vuelo: Node3D = null





var _fichas_libres: Array[MeshInstance3D] = []
var _dorsos_libres: Array[Node3D] = []


var _vuelos: Array[Tween] = []




var _foco: MeshInstance3D = null
var _foco_mat: StandardMaterial3D = null
var _foco_tw: Tween = null
var _foco_en: int = -1



var _iconos: Array = []


var _pila_inicio: Array[int] = []

var _hud: VBoxContainer = null
var _bote_lbl: Label = null
var _mis_fichas_lbl: Label = null
var _botones: VBoxContainer = null



var _vistas: int = 0
var _t: float = 0.0



var _m_ficha: CylinderMesh = null




var _m_fichas: Dictionary = {}
var _mat_ficha: StandardMaterial3D = null
var _m_carta: PlaneMesh = null






func _ready() -> void:
	add_to_group(Settings.AHORRO_HOLD_GROUP)



	add_to_group(Entrada.CAPA_GROUP)




func abrir(invitados: Array, fichas: int) -> void:
	_invitados = invitados
	_fichas_inicio = fichas
	_rng.randomize()




	set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	_montar_mundo()
	_montar_hud()
	_nueva_mano()


func _montar_mundo() -> void:
	var caja: SubViewportContainer = SubViewportContainer.new()
	caja.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	caja.stretch = true


	caja.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(caja)
	_vp = SubViewport.new()
	_vp.own_world_3d = true
	_vp.transparent_bg = false
	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS
	caja.add_child(_vp)
	_mundo = Node3D.new()
	_vp.add_child(_mundo)




	var we: WorldEnvironment = WorldEnvironment.new()
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0a0806")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("6b5a44")
	env.ambient_light_energy = 0.55
	we.environment = env
	_mundo.add_child(we)



	var lampara: OmniLight3D = OmniLight3D.new()
	lampara.position = Vector3(0.0, 2.15, -0.1)
	lampara.omni_range = 7.0
	lampara.light_energy = 3.2
	lampara.light_color = Color("ffe9c4")
	lampara.shadow_enabled = false
	_mundo.add_child(lampara)


	var piso: MeshInstance3D = MeshInstance3D.new()
	var pm: PlaneMesh = PlaneMesh.new()
	pm.size = Vector2(14.0, 14.0)
	piso.mesh = pm
	piso.material_override = _mat(SUELO, 1.0)
	_mundo.add_child(piso)

	_montar_mesa()
	_montar_camara()
	_mundo.add_child(_nuevo_tablero())
	_vuelo = Node3D.new()
	_mundo.add_child(_vuelo)
	_montar_foco()







func _montar_foco() -> void:
	_foco = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()




	cm.top_radius = 0.22
	cm.bottom_radius = 0.22
	cm.height = 0.004
	cm.radial_segments = 20
	_foco.mesh = cm
	_foco_mat = _mat(CareerTheme.MONEY, 0.5)


	_foco_mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	_foco_mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	_foco_mat.albedo_color = Color(CareerTheme.MONEY, 0.3)
	_foco.material_override = _foco_mat
	_foco.visible = false
	_mundo.add_child(_foco)




func _montar_mesa() -> void:
	var canto: MeshInstance3D = MeshInstance3D.new()
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = MESA_R + 0.09
	cm.bottom_radius = MESA_R + 0.05
	cm.height = 0.16
	cm.radial_segments = 28
	canto.mesh = cm
	canto.material_override = _mat(MADERA, 0.85)
	canto.position = Vector3(0.0, MESA_Y - 0.1, 0.0)
	_mundo.add_child(canto)

	var tapete: MeshInstance3D = MeshInstance3D.new()
	var tm: CylinderMesh = CylinderMesh.new()
	tm.top_radius = MESA_R
	tm.bottom_radius = MESA_R
	tm.height = 0.04
	tm.radial_segments = 28
	tapete.mesh = tm
	tapete.material_override = _mat(FIELTRO, 1.0)
	tapete.position = Vector3(0.0, MESA_Y, 0.0)
	_mundo.add_child(tapete)



	var pata: MeshInstance3D = MeshInstance3D.new()
	var pmm: CylinderMesh = CylinderMesh.new()
	pmm.top_radius = 0.22
	pmm.bottom_radius = 0.34
	pmm.height = MESA_Y - 0.18
	pmm.radial_segments = 12
	pata.mesh = pmm
	pata.material_override = _mat(MADERA.darkened(0.25), 0.9)
	pata.position = Vector3(0.0,(MESA_Y - 0.18) * 0.5, 0.0)
	_mundo.add_child(pata)


func _montar_camara() -> void:
	_cam = Camera3D.new()

	_cam.keep_aspect = Camera3D.KEEP_WIDTH
	_cam.fov = FOV
	_cam.near = 0.05
	_cam.position = OJO
	_cam.look_at_from_position(OJO, MIRA, Vector3.UP)
	_vp.add_child(_cam)


func _mat(c: Color, rug: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = c
	m.roughness = rug
	m.metallic = 0.0
	return m








func _nueva_mano() -> void:
	var gente: Array = []
	if _mesa == null:
		gente.append({"nombre": CareerUi.you_name(), "fichas": _fichas_inicio,
			"caracter": "normal"})
		for g in _invitados:
			gente.append({"nombre": str(g.get("nombre", "?")),
				"fichas": int(g.get("fichas", _fichas_inicio)),
				"caracter": str(g.get("caracter", "normal"))})
	else:
		for j in _mesa.jugadores:
			if int(j["fichas"]) > 0:
				gente.append({"nombre": str(j["nombre"]),
					"fichas": int(j["fichas"]),
					"caracter": str(j["caracter"])})







	var yo_sigue: bool = _mesa == null or int(_mesa.jugadores[0]["fichas"]) > 0
	if not yo_sigue or gente.size() < 2 or (not torneo and _mano_n >= MANOS_NOCHE):




		levantarse(true)
		return
	var reparte: int = 0 if _mesa == null \
			else (_mesa.repartidor + 1) % gente.size()
	var primera: bool = _mesa == null



	_limpiar_vuelo()
	_mano_n += 1
	_mesa = PokerMesa.new()
	_mesa.iniciar(gente, ciega_actual(), _rng, reparte)
	_mesa.lectura_humano = lectura_de_ti()





	if primera or _gente3d.size() != _mesa.jugadores.size() - 1:
		_plantar_gente()
	if _iconos.size() != _mesa.jugadores.size():
		_plantar_iconos()




	_pila_inicio = []
	for j in _mesa.jugadores:
		_pila_inicio.append(int(j["fichas"]) + int(j.get("pagado", 0)))
	_foco_en = -1
	_vistas = 0


	_arrancar_mesa()




	_tras_paso(_foto_vacia())





func lectura_de_ti() -> float:
	if _mano_n <= 5:
		return 0.0
	var tasa: float = float(_subidas_yo) / float(_mano_n - 1)
	return clampf((tasa - 0.35) * 2.5, -1.0, 1.0)




static func reto_de_semana() -> String:
	return RETOS[posmod(Career._house_week_stamp(), RETOS.size())]


static func reto_texto(reto: String) -> String:
	match reto:
		"farol": return I18n.t("RETO: GANA UN BOTE DE FAROL")
		"arruina": return I18n.t("RETO: DEJA A UN RIVAL SIN FICHAS")
		"bote": return I18n.tf("RETO: GANA {0} EN UNA MANO",
			[CareerUi.money(RETO_BOTE * FICHA)])
		"color": return I18n.t("RETO: GANA CON COLOR O MEJOR")
	return I18n.t("RETO: ACABA LA NOCHE GANANDO")




func _mirar_reto() -> void:
	if _reto_hecho or _mesa == null or _pila_inicio.is_empty():
		return
	var yo: Dictionary = _mesa.jugadores[0]
	var gano: int = int(yo["fichas"]) - int(_pila_inicio[0])
	var vivos: int = 0
	for j in _mesa.jugadores:
		if bool(j["activo"]):
			vivos += 1
	var orden: int = _mesa.categoria_de(0)
	var ok: bool = false
	match reto_de_semana():
		"farol": ok = gano > 0 and vivos == 1 and orden == 0
		"arruina": ok = _arruinados > 0
		"bote": ok = gano >= RETO_BOTE
		"color": ok = gano > 0 and vivos > 1 and orden >= 5
		"positivo": ok = _mano_n >= MANOS_NOCHE \
				and int(yo["fichas"]) > _fichas_inicio
	if ok:
		_reto_hecho = true
		_reto_subio = Career.settle_reto_casa("poker", RETO_QUIMICA)
		UiAudio.fanfare(0)






func _anotar_netos() -> void:
	if _pila_inicio.size() != _mesa.jugadores.size():
		return
	var mio: int = int(_mesa.jugadores[0]["fichas"]) - int(_pila_inicio[0])
	if mio == 0:
		return
	var contra: Dictionary = {}
	var total: int = 0
	for i in range(1, _mesa.jugadores.size()):
		var d: int = int(_mesa.jugadores[i]["fichas"]) - int(_pila_inicio[i])

		if (mio > 0 and d < 0) or (mio < 0 and d > 0):
			contra[i] = absi(d)
			total += absi(d)
	if total == 0:
		return
	for i in contra:
		var nombre: String = str(_mesa.jugadores[i]["nombre"])
		var clave: String = str(_fichas_npc.get(nombre, {}).get("clave", nombre))
		var parte: int = int(round(float(mio) * float(contra[i]) / float(total)))
		_netos[clave] = int(_netos.get(clave, 0)) + parte





func ciega_actual() -> int:
	if torneo:
		return CIEGA<<mini(maxi(0, _mano_n - 1) / TORNEO_CIEGA_CADA, 6)
	return CIEGA + CIEGA_PASO *(maxi(0, _mano_n - 1) / CIEGA_CADA)



func campeon() -> bool:
	if not torneo or _mesa == null or int(_mesa.jugadores[0]["fichas"]) <= 0:
		return false
	for i in range(1, _mesa.jugadores.size()):
		if int(_mesa.jugadores[i]["fichas"]) > 0:
			return false
	return true




func _plantar_gente() -> void:
	for g in _gente3d:
		(g["nodo"] as Node3D).queue_free()
	_gente3d = []
	var n: int = _mesa.jugadores.size() - 1
	for i in range(1, _mesa.jugadores.size()):
		var nombre: String = str(_mesa.jugadores[i]["nombre"])
		if not _fichas_npc.has(nombre):
			_fichas_npc[nombre] = Career.poker_ficha(nombre)
		var ficha: Dictionary = _fichas_npc[nombre]
		var raiz: Node3D = Node3D.new()
		var a: float = _angulo_rival(i - 1, n)
		raiz.position = Vector3(sin(a) * ASIENTO_R, 0.0, cos(a) * ASIENTO_R)
		_mundo.add_child(raiz)

		var spr: AnimatedSprite3D = AnimatedSprite3D.new()
		spr.pixel_size = PIXEL_M
		spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD



		spr.sprite_frames = _frames_invitado(
			str(ficha.get("clave", nombre)))
		spr.position = Vector3(0.0, PIES_PX * PIXEL_M - SENTADO, 0.0)
		spr.play("idle")
		raiz.add_child(spr)



		var chapa: Label3D = Label3D.new()
		chapa.font = FUENTE
		chapa.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		chapa.font_size = 30
		chapa.outline_size = 8
		chapa.outline_modulate = Color(0, 0, 0, 0.85)








		chapa.pixel_size = 0.0026 if n <= 3 else 0.0019
		chapa.position = Vector3(0.0, 2.3 - SENTADO, 0.0)
		chapa.modulate = CareerTheme.TEXT
		raiz.add_child(chapa)













		var nat: String = String(ficha.get("nat", ""))
		var bandera: Sprite3D = null
		if not nat.is_empty() and Flags.has(nat):
			bandera = Sprite3D.new()
			bandera.texture = Flags.texture(nat)
			bandera.billboard = BaseMaterial3D.BILLBOARD_ENABLED
			bandera.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST



			bandera.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD




			bandera.pixel_size =(0.36 if n <= 3 else 0.26) / float(Flags.W)
			bandera.position = Vector3(0.0,
				(2.72 if n <= 3 else 2.62) - SENTADO, 0.0)
			raiz.add_child(bandera)



		var gesto: Label3D = Label3D.new()
		gesto.font = FUENTE
		gesto.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		gesto.font_size = 30
		gesto.outline_size = 8
		gesto.outline_modulate = Color(0, 0, 0, 0.9)
		gesto.pixel_size = 0.0032 if n <= 3 else 0.0024
		gesto.position = - raiz.position.normalized() * 0.55 \
				+ Vector3(0.0, 1.5 - SENTADO, 0.0)

		gesto.no_depth_test = true
		gesto.render_priority = 10
		gesto.outline_render_priority = 9
		gesto.visible = false
		raiz.add_child(gesto)
		_gente3d.append({"nodo": raiz, "sprite": spr, "chapa": chapa,
			"bandera": bandera, "gesto": gesto})















func _apellido(nombre: String) -> String:
	var trozos: PackedStringArray = nombre.strip_edges().split(" ", false)
	return nombre if trozos.is_empty() else String(trozos[trozos.size() - 1])


func _angulo_rival(k: int, n: int) -> float:
	return deg_to_rad(132.0 + 96.0 *(float(k) + 0.5) / float(maxi(n, 1)))


func _frames_invitado(nombre: String) -> SpriteFrames:



	var cfg: Dictionary = KitRecolor.appearance_for(nombre, {})
	for k in KitRecolor.TEAM_KEYS:
		cfg.erase(k)
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)
	frames.set_animation_speed("idle", 4.5)
	for i in 4:
		var path: String = "%s%02d.png" % [TRAJE, i]
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), cfg))
	if frames.get_frame_count("idle") == 0:
		var base: String = "res://assets/sprites/players/player_south.png"
		if ResourceLoader.exists(base):
			frames.add_frame("idle", KitRecolor.apply(load(base), cfg))
	return frames




func _nuevo_tablero() -> Node3D:
	_tablero = Node3D.new()
	return _tablero






func _pintar() -> void:
	if _tablero != null:
		_tablero.queue_free()
	_mundo.add_child(_nuevo_tablero())






	_pila(_tablero, _sitio_bote(), _mesa.bote, CareerTheme.MONEY)



	_boton_repartidor()


	var com: Array = _mesa.comunitarias
	for i in com.size():
		var x: float =(float(i) - float(com.size() - 1) * 0.5) * 0.3
		var n: Node3D = _naipe(int(com[i]), true, 0.24, 0.335)
		n.rotation_degrees.x = NAIPE_LADEO
		n.position = Vector3(x, MESA_Y + 0.09, COM_Z)
		_tablero.add_child(n)
		if i >= _vistas:
			_repartir_anim(n, i - _vistas)
	_vistas = maxi(_vistas, com.size())




	var yo: Dictionary = _mesa.jugadores[0]
	var mias: Array = yo["mano"]
	for i in mias.size():
		var n: Node3D = _naipe(int(mias[i]), true, 0.3, 0.42)
		n.rotation_degrees.x = MI_NAIPE_LADEO
		n.position = Vector3(-0.19 + 0.38 * float(i), MESA_Y + 0.2,
			MIS_CARTAS_Z)
		_tablero.add_child(n)









	var destape: bool = _mesa.terminada and _vivos_en_mesa() > 1
	for i in range(1, _mesa.jugadores.size()):
		var j: Dictionary = _mesa.jugadores[i]
		var a: float = _angulo_rival(i - 1, _mesa.jugadores.size() - 1)
		var centro: Vector3 = Vector3(sin(a) * CARTAS_R, MESA_Y + 0.023,
			cos(a) * CARTAS_R)

		if bool(j["activo"]):
			var suyas: Array = j["mano"]
			for k in suyas.size():


				var lado: Vector3 = Vector3(cos(a), 0.0, - sin(a)) \
						*(-0.085 + 0.17 * float(k))
				var n: Node3D = _naipe(int(suyas[k]), destape, 0.17, 0.24)
				n.position = centro + lado + Vector3(0.0, 0.02 if destape else 0.0,
					0.0)
				if destape:



					n.rotation_degrees.x = NAIPE_LADEO
				else:
					n.rotation.y = a + PI
				_tablero.add_child(n)


		_pila(_tablero, _sitio_pila(i), int(j["fichas"]), CareerTheme.TEXT_DIM)

		var g: Dictionary = _gente3d[i - 1]
		var chapa: Label3D = g["chapa"]




		var ficha: Dictionary = _fichas_npc.get(str(j["nombre"]), {})
		chapa.text = "%s\n%s" % [_apellido(str(j["nombre"])),
			CareerUi.money(int(j["fichas"]) * FICHA)]
		if int(ficha.get("ovr", 0)) > 0:
			chapa.text += "\n%s · %s" % [
				I18n.tf("OVR {0}", [str(int(ficha["ovr"]))]),
				str(ficha.get("club", ""))]


		if _mano_n > MANOS_LECTURA:
			chapa.text += "\n" + estilo_de(str(j["caracter"]))

		var clave: String = str(ficha.get("clave", j["nombre"]))
		var deuda: int = Career.poker_cuenta_con(clave) + int(_netos.get(clave, 0))
		if deuda > 0:
			chapa.text += "\n" + I18n.tf("TE DEBE {0}", [CareerUi.money(deuda * FICHA)])
		elif deuda < 0:
			chapa.text += "\n" + I18n.tf("LE DEBES {0}", [CareerUi.money(- deuda * FICHA)])
		var gesto: Label3D = g.get("gesto")
		if gesto != null:
			var t: String = str(j.get("tell", ""))
			gesto.visible = not t.is_empty() and bool(j["activo"]) \
					and not _mesa.terminada
			gesto.text = I18n.t("NERVIOSO") if t == "nervioso" \
					else I18n.t("TRANQUILO")
			gesto.modulate = CareerTheme.DANGER if t == "nervioso" \
					else CareerTheme.TEXT





		if not bool(j["activo"]):
			chapa.modulate = Color(CareerTheme.TEXT_DIM, 0.45)
		elif _mesa.turno == i and not _mesa.terminada:


			chapa.modulate = CareerTheme.MONEY
		else:
			chapa.modulate = CareerTheme.TEXT



		(g["sprite"] as AnimatedSprite3D).modulate = Color(1, 1, 1) \
				if bool(j["activo"]) else Color(0.42, 0.42, 0.46)


		if g.get("bandera") != null:
			(g["bandera"] as Sprite3D).modulate = Color(1, 1, 1) \
					if bool(j["activo"]) else Color(0.42, 0.42, 0.46)


	_pila(_tablero, _sitio_pila(0), int(yo["fichas"]), CareerTheme.MONEY)

	_mover_foco()
	_pintar_iconos()
	_pintar_hud()



static func estilo_de(caracter: String) -> String:
	match caracter:
		"roca": return I18n.t("PRUDENTE")
		"loco": return I18n.t("KAMIKAZE")
		"farol": return I18n.t("FAROLERO")
	return I18n.t("EQUILIBRADO")





func _pila(padre: Node3D, at: Vector3, cuanto: int, tinte: Color) -> void:
	if cuanto <= 0:
		return
	if _m_ficha == null:
		_m_ficha = CylinderMesh.new()
		_m_ficha.top_radius = 0.058
		_m_ficha.bottom_radius = 0.058
		_m_ficha.height = 0.018
		_m_ficha.radial_segments = 10
	var torres: int = clampi(int(ceil(float(cuanto) / 40.0)), 1, 3)
	var alto: int = clampi(int(round(float(cuanto) / float(torres) / 8.0)), 1, 6)
	var malla: ArrayMesh = _malla_ficha_de(tinte)
	for t in torres:
		for k in alto:
			var f: MeshInstance3D = MeshInstance3D.new()
			f.mesh = malla
			f.material_override = _mat_ficha


			f.rotation.y = float((k * 7 + t * 3) % 12) * 0.37
			f.position = at + Vector3(float(t) * 0.13, 0.019 * float(k), 0.0)
			padre.add_child(f)





func _naipe(c: int, cara: bool, ancho: float, alto: float) -> Node3D:
	var raiz: Node3D = Node3D.new()
	if _m_carta == null:
		_m_carta = PlaneMesh.new()
		_m_carta.size = Vector2(1.0, 1.0)
	var papel: MeshInstance3D = MeshInstance3D.new()
	papel.mesh = _m_carta
	papel.scale = Vector3(ancho, 1.0, alto)
	var mp: StandardMaterial3D = _mat(CARTA_PAPEL if cara else CARTA_DORSO, 0.9)
	mp.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	papel.material_override = mp
	raiz.add_child(papel)
	if cara:
		var l: Label3D = Label3D.new()
		l.font = FUENTE
		l.text = Poker.carta_nombre(c)
		l.font_size = 64





		l.pixel_size = ancho * 0.86 /(float(maxi(l.text.length(), 1)) * 64.0)
		l.modulate = CARTA_ROJA if Poker.palo_de(c) in [1, 2] else CARTA_NEGRA
		l.billboard = BaseMaterial3D.BILLBOARD_DISABLED
		l.rotation_degrees.x = -90.0
		l.position = Vector3(0.0, 0.0015, 0.0)
		l.no_depth_test = false
		raiz.add_child(l)
	else:
		var dentro: MeshInstance3D = MeshInstance3D.new()
		dentro.mesh = _m_carta
		dentro.scale = Vector3(ancho * 0.66, 1.0, alto * 0.74)
		var md: StandardMaterial3D = _mat(CARTA_DORSO_IN, 0.9)
		md.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		dentro.material_override = md
		dentro.position = Vector3(0.0, 0.0015, 0.0)
		raiz.add_child(dentro)
	return raiz





func _repartir_anim(n: Node3D, orden: int) -> void:
	var fin: Vector3 = n.position
	n.position = fin + Vector3(0.0, 0.25, -0.55)
	n.scale = Vector3(0.6, 0.6, 0.6)
	var tw: Tween = create_tween().set_parallel(true)
	var d: float = 0.12 * float(orden)
	tw.tween_property(n, "position", fin, 0.26).set_delay(d) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(n, "scale", Vector3.ONE, 0.26).set_delay(d) \
			.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
















func _sitio_bote() -> Vector3:
	return Vector3(-0.95, MESA_Y + 0.02, COM_Z + 0.3)


func _sitio_pila(i: int) -> Vector3:
	if i == 0:
		return Vector3(0.95, MESA_Y + 0.02, MIS_CARTAS_Z - 0.25)
	var a: float = _angulo_rival(i - 1, _mesa.jugadores.size() - 1)
	return Vector3(sin(a) * CARTAS_R * 0.62, MESA_Y + 0.02,
		cos(a) * CARTAS_R * 0.62)




func _vivos_en_mesa() -> int:
	var n: int = 0
	for j in _mesa.jugadores:
		if bool(j["activo"]):
			n += 1
	return n



const FICHA_R: float = 0.058
const FICHA_H: float = 0.018
const FICHA_GAJOS: int = 24







func _malla_ficha_de(tinte: Color) -> ArrayMesh:
	var clave: String = tinte.to_html(false)
	if _m_fichas.has(clave):
		return _m_fichas[clave]
	if _mat_ficha == null:
		_mat_ficha = _mat(Color.WHITE, 0.55)
		_mat_ficha.vertex_color_use_as_albedo = true


		_mat_ficha.cull_mode = BaseMaterial3D.CULL_DISABLED
	var blanco: Color = Color("f2ede2")
	var centro: Color = tinte.lightened(0.18)
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var h: float = FICHA_H * 0.5
	for g in FICHA_GAJOS:
		var a0: float = TAU * float(g) / float(FICHA_GAJOS)
		var a1: float = TAU * float(g + 1) / float(FICHA_GAJOS)
		var d0: Vector3 = Vector3(cos(a0), 0.0, sin(a0))
		var d1: Vector3 = Vector3(cos(a1), 0.0, sin(a1))

		var c_canto: Color = blanco if g % 4 < 2 else tinte
		var p00: Vector3 = d0 * FICHA_R + Vector3(0, - h, 0)
		var p01: Vector3 = d0 * FICHA_R + Vector3(0, h, 0)
		var p10: Vector3 = d1 * FICHA_R + Vector3(0, - h, 0)
		var p11: Vector3 = d1 * FICHA_R + Vector3(0, h, 0)
		for v in [[p00, d0], [p01, d0], [p11, d1], [p00, d0], [p11, d1], [p10, d1]]:
			st.set_color(c_canto)
			st.set_normal(v[1])
			st.add_vertex(v[0])

		for lado in [1.0, -1.0]:
			var y: Vector3 = Vector3(0, h * lado, 0)
			var n: Vector3 = Vector3(0, lado, 0)
			var bandas: Array = [[0.0, 0.48, centro], [0.48, 0.58, blanco],
				[0.58, 0.8, tinte], [0.8, 1.0, blanco if g % 4 < 2 else tinte]]
			for b in bandas:
				var r0: float = float(b[0]) * FICHA_R
				var r1: float = float(b[1]) * FICHA_R
				var q: Array = [d0 * r0 + y, d0 * r1 + y, d1 * r1 + y, d1 * r0 + y]
				var tri: Array = [q[0], q[1], q[2], q[0], q[2], q[3]]
				if lado < 0.0:
					tri.reverse()
				for v in tri:
					st.set_color(b[2])
					st.set_normal(n)
					st.add_vertex(v)
	var malla: ArrayMesh = st.commit()
	_m_fichas[clave] = malla
	return malla





func _boton_repartidor() -> void:
	if _m_ficha == null:
		_malla_ficha()
	var at: Vector3 = _sitio_pila(_mesa.repartidor)
	var hacia: Vector3 = Vector3(at.x, 0.0, at.z)
	if hacia.length() > 0.01:
		at -= hacia.normalized() * 0.26
	var d: MeshInstance3D = MeshInstance3D.new()
	d.mesh = _m_ficha
	d.scale = Vector3(1.15, 0.6, 1.15)
	var m: StandardMaterial3D = _mat(Color("efe7d8"), 0.4)
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	d.material_override = m
	d.position = at
	_tablero.add_child(d)


func _malla_ficha() -> void:
	_m_ficha = CylinderMesh.new()
	_m_ficha.top_radius = 0.058
	_m_ficha.bottom_radius = 0.058
	_m_ficha.height = 0.018
	_m_ficha.radial_segments = 10






func _foto_mesa() -> Dictionary:
	var pagado: Array[int] = []
	var fichas: Array[int] = []
	var activo: Array[bool] = []
	for j in _mesa.jugadores:
		pagado.append(int(j.get("pagado", 0)))
		fichas.append(int(j["fichas"]))
		activo.append(bool(j["activo"]))
	return {"pagado": pagado, "fichas": fichas, "activo": activo,
		"fin": _mesa.terminada}




func _foto_vacia() -> Dictionary:
	var pagado: Array[int] = []
	var fichas: Array[int] = []
	var activo: Array[bool] = []
	for _j in _mesa.jugadores:
		pagado.append(0)
		fichas.append(0)
		activo.append(true)
	return {"pagado": pagado, "fichas": fichas, "activo": activo, "fin": false}




func _tras_paso(antes: Dictionary) -> void:
	if _mesa == null or _vuelo == null:
		return
	var pag: Array = antes["pagado"]
	var act: Array = antes["activo"]
	var fic: Array = antes["fichas"]
	var n: int = mini(_mesa.jugadores.size(), pag.size())
	for i in n:
		var j: Dictionary = _mesa.jugadores[i]


		var puso: int = int(j.get("pagado", 0)) - int(pag[i])
		if puso > 0:
			_volar_fichas(_sitio_pila(i), _sitio_bote(), puso,
				CareerTheme.MONEY if i == 0 else CareerTheme.TEXT_DIM,
				VIAJE_FICHAS, VIAJE_MIN, VIAJE_MAX)


		if bool(act[i]) and not bool(j["activo"]):
			_tirar_cartas(i)





	if _mesa.terminada and not bool(antes["fin"]):


		if not _pila_inicio.is_empty():
			_mejor_mano = maxi(_mejor_mano,
				int(_mesa.jugadores[0]["fichas"]) - int(_pila_inicio[0]))

		var gane: bool = not _pila_inicio.is_empty() \
				and int(_mesa.jugadores[0]["fichas"]) > int(_pila_inicio[0])
		for i in range(1, _mesa.jugadores.size()):
			if gane and int(_mesa.jugadores[i]["fichas"]) <= 0:
				_arruinados += 1
		_anotar_netos()
		_mirar_reto()
		for i in n:
			var cobra: int = int(_mesa.jugadores[i]["fichas"]) - int(fic[i])
			if cobra > 0:
				_volar_fichas(_sitio_bote(), _sitio_pila(i), cobra,
					CareerTheme.MONEY, COBRO_FICHAS, COBRO_SEG, COBRO_SEG)












func _volar_fichas(a: Vector3, b: Vector3, cuanto: int, tinte: Color,
		tope: int, dmin: float, dmax: float) -> void:
	var frac: float = clampf(float(cuanto) / float(CIEGA * 10), 0.0, 1.0)
	var cuantas: int = clampi(1 + int(floor(float(cuanto) / float(maxi(CIEGA, 1)))),
		1, tope)
	var alto: float = 0.1 + 0.2 * frac
	var dur: float = lerpf(dmin, dmax, frac)
	for k in cuantas:
		var f: MeshInstance3D = _ficha_vuelo(tinte)


		var desvio: Vector3 = Vector3(_rng.randf_range(-0.07, 0.07), 0.0,
			_rng.randf_range(-0.07, 0.07))
		var salida: Vector3 = a + desvio + Vector3(0.0, 0.02 * float(k), 0.0)
		var llegada: Vector3 = b + Vector3(_rng.randf_range(-0.09, 0.09),
			0.019 * float(k), _rng.randf_range(-0.09, 0.09))
		f.position = salida
		var tw: Tween = create_tween()
		_vuelos.append(tw)
		tw.tween_method(_paso_ficha.bind(f, salida, llegada, alto,
			_rng.randf_range(-4.0, 4.0)), 0.0, 1.0, dur) \
					.set_delay(VIAJE_PASO * float(k)) \
					.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tw.tween_callback(_soltar_ficha.bind(f))





func _paso_ficha(t: float, f: MeshInstance3D, a: Vector3, b: Vector3,
		alto: float, giro: float) -> void:
	if not is_instance_valid(f):
		return


	f.position = a.lerp(b, t) + Vector3(0.0, sin(t * PI) * alto, 0.0)
	f.rotation.z = giro * t


func _ficha_vuelo(tinte: Color) -> MeshInstance3D:
	if _m_ficha == null:
		_malla_ficha()
	var f: MeshInstance3D = null
	if not _fichas_libres.is_empty():
		f = _fichas_libres.pop_back()
	else:
		f = MeshInstance3D.new()
		f.mesh = _m_ficha
		_vuelo.add_child(f)
	f.mesh = _malla_ficha_de(tinte)
	f.material_override = _mat_ficha
	f.rotation = Vector3.ZERO
	f.visible = true
	return f


func _soltar_ficha(f: MeshInstance3D) -> void:
	if not is_instance_valid(f):
		return
	f.visible = false
	if not _fichas_libres.has(f):
		_fichas_libres.append(f)






func _tirar_cartas(i: int) -> void:
	var a: float = _angulo_rival(i - 1, _mesa.jugadores.size() - 1) if i > 0 else 0.0
	var centro: Vector3 = Vector3(sin(a) * CARTAS_R, MESA_Y + 0.03,
		cos(a) * CARTAS_R) if i > 0 \
				else Vector3(0.0, MESA_Y + 0.2, MIS_CARTAS_Z)




	var muck: Vector3 = Vector3(0.62, MESA_Y + 0.026, COM_Z + 0.14)
	for k in 2:
		var lado: Vector3 = Vector3(cos(a), 0.0, - sin(a)) *(-0.085 + 0.17 * float(k))
		var c: Node3D = _dorso_vuelo()
		c.position = centro + lado
		c.rotation = Vector3(0.0, a + PI, 0.0)
		var fin: Vector3 = muck + Vector3(_rng.randf_range(-0.06, 0.06), 0.004 * k,
			_rng.randf_range(-0.05, 0.05))
		var tw: Tween = create_tween()
		_vuelos.append(tw)


		tw.tween_property(c, "position", fin, 0.38).set_delay(0.07 * float(k)) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
		tw.parallel().tween_property(c, "rotation:y", a + PI + _rng.randf_range(
			-0.9, 0.9), 0.38).set_delay(0.07 * float(k))
		tw.tween_callback(_soltar_dorso.bind(c))


func _dorso_vuelo() -> Node3D:
	var c: Node3D = null
	if not _dorsos_libres.is_empty():
		c = _dorsos_libres.pop_back()
	else:


		c = _naipe(0, false, 0.17, 0.24)
		_vuelo.add_child(c)
	c.visible = true
	return c


func _soltar_dorso(c: Node3D) -> void:
	if not is_instance_valid(c):
		return
	c.visible = false
	if not _dorsos_libres.has(c):
		_dorsos_libres.append(c)



func _limpiar_vuelo() -> void:
	for tw in _vuelos:
		if tw != null and tw.is_valid():
			tw.kill()
	_vuelos = []
	if _vuelo == null:
		return
	for hijo in _vuelo.get_children():
		(hijo as Node3D).visible = false
		if hijo is MeshInstance3D:
			if not _fichas_libres.has(hijo):
				_fichas_libres.append(hijo)
		elif not _dorsos_libres.has(hijo):
			_dorsos_libres.append(hijo)





func _mover_foco() -> void:
	if _foco == null:
		return
	var quien: int = -1 if _mesa.terminada else _mesa.turno
	_foco.visible = quien >= 0
	if quien < 0:
		_foco_en = -1
		return
	var at: Vector3 = _sitio_pila(quien) + Vector3(0.0, 0.001, 0.0)
	if _foco_en < 0:
		_foco.position = at
	elif _foco_en != quien:
		if _foco_tw != null and _foco_tw.is_valid():
			_foco_tw.kill()
		_foco_tw = create_tween()
		_foco_tw.tween_property(_foco, "position", at, 0.28) \
				.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	_foco_en = quien
















const ICONO_PX: int = 96
const ICONO_M: float = 0.3

func _plantar_iconos() -> void:
	for it in _iconos:
		(it["spr"] as Node3D).queue_free()
	_iconos = []
	for i in _mesa.jugadores.size():
		var vp: SubViewport = SubViewport.new()
		vp.size = Vector2i(ICONO_PX, ICONO_PX)
		vp.transparent_bg = true
		vp.disable_3d = true


		vp.render_target_update_mode = SubViewport.UPDATE_ONCE
		var ic: MenuIcon = MenuIcon.new()
		ic.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
		vp.add_child(ic)
		add_child(vp)
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = vp.get_texture()
		spr.billboard = BaseMaterial3D.BILLBOARD_ENABLED
		spr.transparent = true
		spr.shaded = false
		spr.pixel_size = ICONO_M / float(ICONO_PX)
		spr.visible = false
		_mundo.add_child(spr)
		_iconos.append({"vp": vp, "icono": ic, "spr": spr, "que": ""})




func _pintar_iconos() -> void:
	if _iconos.size() != _mesa.jugadores.size():
		return
	for i in _mesa.jugadores.size():
		var j: Dictionary = _mesa.jugadores[i]
		var que: String = ""
		var col: Color = CareerTheme.MONEY
		if _mesa.terminada:
			var saldo: int = int(j["fichas"]) - int(_pila_inicio[i]) \
					if i < _pila_inicio.size() else 0
			if int(j["fichas"]) <= 0:




				que = "puerta"
				col = CareerTheme.DANGER
			elif saldo > 0:
				que = "ficha"
			elif saldo < 0:
				que = "ficha"
				col = CareerTheme.DANGER
		elif not bool(j["activo"]):
			que = "cerrar"
			col = CareerTheme.DANGER
		elif bool(j["todo_dentro"]):
			que = "potencia"
		elif int(j["fichas"]) <= 0:
			que = "ficha_vacia"
			col = CareerTheme.DANGER
		elif _mesa.turno == i:
			que = "reloj"
		var it: Dictionary = _iconos[i]
		var spr: Sprite3D = it["spr"]
		spr.visible = not que.is_empty()
		if que.is_empty():
			it["que"] = ""
			continue







		var at: Vector3 = _sitio_pila(i)
		var hacia: Vector3 = Vector3(at.x, 0.0, at.z)
		if hacia.length() > 0.01:
			at -= hacia.normalized() * 0.4
		spr.position = at + Vector3(0.0, 0.26, 0.0)
		var sello: String = "%s|%s" % [que, col.to_html(false)]
		if str(it["que"]) != sello:
			(it["icono"] as MenuIcon).setup(que, col)
			(it["vp"] as SubViewport).render_target_update_mode = \
					SubViewport.UPDATE_ONCE
			it["que"] = sello






func _montar_hud() -> void:
	_hud = VBoxContainer.new()
	_hud.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	_hud.add_theme_constant_override("separation", 10)
	_hud.offset_left = 24
	_hud.offset_right = -24
	_hud.offset_top = 40
	_hud.offset_bottom = -40
	_hud.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(_hud)



	if UiKit.es_horizontal():
		CareerUi.apply_safe_area(_hud, get_viewport())
		CareerUi.columna_centrada(_hud, get_viewport())

	var tit: Label = CareerUi.plain(CareerTheme.T_HEAD, CareerTheme.TEXT)





	tit.text = I18n.t("MESA DE POQUER")
	tit.clip_text = true
	_hud.add_child(tit)
	_bote_lbl = CareerUi.plain(CareerTheme.T_MONEY, CareerTheme.MONEY)
	_bote_lbl.clip_text = true
	_hud.add_child(_bote_lbl)


	_ronda_lbl = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT_DIM)
	_ronda_lbl.clip_text = true
	_hud.add_child(_ronda_lbl)
	_reto_lbl = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT_DIM)
	_reto_lbl.clip_text = true
	_hud.add_child(_reto_lbl)

	var hueco: Control = Control.new()
	hueco.size_flags_vertical = Control.SIZE_EXPAND_FILL
	hueco.mouse_filter = Control.MOUSE_FILTER_IGNORE
	_hud.add_child(hueco)








	_mis_fichas_lbl = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT)
	_mis_fichas_lbl.clip_text = true
	_hud.add_child(_mis_fichas_lbl)
	_botones = VBoxContainer.new()
	_botones.add_theme_constant_override("separation", 10)
	_hud.add_child(_botones)


func _pintar_hud() -> void:
	_bote_lbl.text = I18n.tf("BOTE: {0}", [CareerUi.money(_mesa.bote * FICHA)])
	if torneo:
		_ronda_lbl.text = I18n.tf("TORNEO · MANO {0} · CIEGA {1}", [str(_mano_n),
			CareerUi.money(_mesa.ciega * FICHA)])
	else:
		_ronda_lbl.text = I18n.tf("MANO {0}/{1} · CIEGA {2}", [str(_mano_n),
			str(MANOS_NOCHE), CareerUi.money(_mesa.ciega * FICHA)])
	if _reto_hecho:
		_reto_lbl.text = I18n.tf("RETO CUMPLIDO · QUIMICA +{0}", [_reto_subio]) \
				if _reto_subio > 0 else I18n.t("RETO CUMPLIDO")
		_reto_lbl.add_theme_color_override("font_color", CareerTheme.MONEY)
	elif Career.reto_casa_cobrado("poker"):
		_reto_lbl.text = I18n.t("RETO DE LA SEMANA: HECHO")
	else:
		_reto_lbl.text = reto_texto(reto_de_semana())
	_mis_fichas_lbl.text = I18n.tf("TUS FICHAS: {0}",
		[CareerUi.money(int(_mesa.jugadores[0]["fichas"]) * FICHA)])
	for c in _botones.get_children():
		c.queue_free()
	if _mesa.terminada:
		_botones_fin()
	else:
		_botones_turno()



		_botones.add_child(_boton_levantarse())


func _boton(txt: String, kind: int, alto: int) -> Button:
	var b: Button = Button.new()
	b.custom_minimum_size = Vector2(0, alto)
	b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	b.clip_text = true
	b.text = txt
	CareerTheme.apply_button(b, kind, 20)
	return b





const ICONO_BOTON_PX: int = 28
var _iconos_accion: Dictionary = {}


func _icono_accion(a: int) -> Texture2D:
	if _iconos_accion.has(a):
		return _iconos_accion[a]
	var img: Image = Image.create(ICONO_BOTON_PX, ICONO_BOTON_PX, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var n: float = float(ICONO_BOTON_PX)
	match a:
		PokerMesa.RETIRARSE:
			_trazo(img, Vector2(0.22, 0.22) * n, Vector2(0.78, 0.78) * n, 0.09 * n)
			_trazo(img, Vector2(0.78, 0.22) * n, Vector2(0.22, 0.78) * n, 0.09 * n)
		PokerMesa.PASAR:
			_trazo(img, Vector2(0.18, 0.52) * n, Vector2(0.42, 0.76) * n, 0.09 * n)
			_trazo(img, Vector2(0.42, 0.76) * n, Vector2(0.84, 0.26) * n, 0.09 * n)
		PokerMesa.IGUALAR:
			_ficha_px(img, Vector2(0.5, 0.5) * n, 0.34 * n)
		_:
			_ficha_px(img, Vector2(0.38, 0.6) * n, 0.27 * n)
			_ficha_px(img, Vector2(0.62, 0.4) * n, 0.27 * n)
	var t: ImageTexture = ImageTexture.create_from_image(img)
	_iconos_accion[a] = t
	return t



func _trazo(img: Image, a: Vector2, b: Vector2, grosor: float) -> void:
	for y in img.get_height():
		for x in img.get_width():
			var p: Vector2 = Vector2(x + 0.5, y + 0.5)
			var ab: Vector2 = b - a
			var t: float = clampf((p - a).dot(ab) / ab.length_squared(), 0.0, 1.0)
			if p.distance_to(a + ab * t) <= grosor * 0.5:
				img.set_pixel(x, y, Color.WHITE)




func _ficha_px(img: Image, c: Vector2, r: float) -> void:
	for y in img.get_height():
		for x in img.get_width():
			var d: float = Vector2(x + 0.5, y + 0.5).distance_to(c)
			if d <= r:
				var hueco: bool = d > r * 0.52 and d < r * 0.68
				img.set_pixel(x, y, Color(0, 0, 0, 0) if hueco else Color.WHITE)


func _botones_turno() -> void:





	if _corriendo:
		return
	var acciones: Array[int] = _mesa.acciones()
	if _mesa.turno != 0 or acciones.is_empty():


		var seguir: Button = _boton(I18n.t("SEGUIR"), CareerTheme.Kind.PRIMARY, 96)
		seguir.pressed.connect(func() -> void: seguir_ia())
		_botones.add_child(seguir)
		return
	var turno: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.MONEY)
	turno.text = I18n.t("TU TURNO")
	_botones.add_child(turno)


	var jugada: String = _mesa.nombre_jugada(0)
	if not jugada.is_empty():
		var tienes: Label = CareerUi.plain(CareerTheme.T_BODY, CareerTheme.TEXT)
		tienes.text = I18n.tf("TIENES: {0}", [jugada])
		tienes.clip_text = true
		_botones.add_child(tienes)
	_botones.add_child(_rango())
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	_botones.add_child(fila)
	for a in acciones:
		var txt: String = ""
		match a:
			PokerMesa.RETIRARSE: txt = I18n.t("RETIRARSE")
			PokerMesa.PASAR: txt = I18n.t("PASAR")
			PokerMesa.IGUALAR:
				var yo_i: Dictionary = _mesa.jugadores[0]
				var falta_i: int = mini(maxi(0, _mesa.apuesta - int(yo_i["apostado"])),
					int(yo_i["fichas"]))
				txt = I18n.tf("IGUALAR {0}", [CareerUi.money(falta_i * FICHA)])
			PokerMesa.SUBIR:




				var yo: Dictionary = _mesa.jugadores[0]
				var tope: int = int(yo["fichas"]) + int(yo["apostado"])
				var sube: int = _mesa.subida_minima()
				txt = I18n.tf("TODO DENTRO ({0})",
					[CareerUi.money(sube * FICHA)]) if sube >= tope \
							else I18n.tf("SUBIR A {0}", [CareerUi.money(sube * FICHA)])


		var kind: int = CareerTheme.Kind.NEUTRAL
		if a == PokerMesa.SUBIR:
			kind = CareerTheme.Kind.PRIMARY
		elif a == PokerMesa.RETIRARSE:
			kind = CareerTheme.Kind.WARN
		var b: Button = _boton(txt, kind, 96)


		b.add_theme_font_size_override("font_size", CareerTheme.T_DIM)
		b.icon = _icono_accion(a)
		b.add_theme_color_override("icon_normal_color", b.get_theme_color("font_color"))
		b.add_theme_color_override("icon_pressed_color", b.get_theme_color("font_color"))
		b.add_theme_color_override("icon_hover_color", b.get_theme_color("font_color"))
		b.pressed.connect(pulsar.bind(a))



		if a == PokerMesa.PASAR or a == PokerMesa.IGUALAR:
			b.set_meta(Entrada.PRIMERO_META, true)
		fila.add_child(b)
	if acciones.has(PokerMesa.SUBIR):
		_fila_subidas()












func _fila_subidas() -> void:
	var yo: Dictionary = _mesa.jugadores[0]
	var falta: int = maxi(0, _mesa.apuesta - int(yo["apostado"]))
	var tope: int = int(yo["fichas"]) + int(yo["apostado"])
	var minimo: int = _mesa.subida_minima()
	if minimo >= tope:
		return
	var bote_ref: int = _mesa.bote + falta
	var tallas: Array = [
		["½ BOTE {0}", int(yo["apostado"]) + falta + int(bote_ref / 2.0)],
		["BOTE {0}", int(yo["apostado"]) + falta + bote_ref],
		["TODO {0}", tope]]
	var fila: HBoxContainer = HBoxContainer.new()
	fila.add_theme_constant_override("separation", 10)
	var vistos: Array[int] = [minimo]
	for t in tallas:
		var monto: int = clampi(int(t[1]), minimo, tope)
		if vistos.has(monto):
			continue
		vistos.append(monto)
		var b: Button = _boton(I18n.tf(String(t[0]),
			[CareerUi.money(monto * FICHA)]), CareerTheme.Kind.NEUTRAL, 84)




		CareerTheme.apply_button_peldano(b, CareerTheme.MONEY, false, CareerTheme.T_DIM)
		b.icon = _icono_accion(PokerMesa.SUBIR)
		b.pressed.connect(pulsar.bind(PokerMesa.SUBIR, monto))
		fila.add_child(b)
	if fila.get_child_count() > 0:
		_botones.add_child(fila)
	else:
		fila.free()












func _rango() -> Control:
	var yo: Dictionary = _mesa.jugadores[0]
	var falta: int = maxi(0, _mesa.apuesta - int(yo["apostado"]))
	var tope: int = int(yo["fichas"]) + int(yo["apostado"])
	var col: VBoxContainer = VBoxContainer.new()
	col.add_theme_constant_override("separation", 2)
	var l1: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	l1.text = I18n.tf("CIEGA {0} · PARA IGUALAR {1}",
		[CareerUi.money(CIEGA * FICHA), CareerUi.money(falta * FICHA)])
	l1.clip_text = true
	col.add_child(l1)
	var l2: Label = CareerUi.plain(CareerTheme.T_CAPTION, CareerTheme.TEXT_DIM)
	l2.text = I18n.tf("SUBIDA MINIMA {0} · TODO DENTRO {1}",
		[CareerUi.money(_mesa.subida_minima() * FICHA),
		CareerUi.money(tope * FICHA)])
	l2.clip_text = true
	col.add_child(l2)
	return col


func _botones_fin() -> void:
	_botones.add_child(_cuenta_de_la_noche())
	if campeon():

		var gana: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.MONEY)
		gana.text = I18n.t("¡CAMPEÓN DEL TORNEO!")
		gana.clip_text = true
		_botones.add_child(gana)
		_botones.add_child(_boton_levantarse())
		return
	if not torneo and _mano_n >= MANOS_NOCHE:

		var fin: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT)
		fin.text = I18n.t("ULTIMA MANO DE LA NOCHE")
		fin.clip_text = true
		_botones.add_child(fin)
		if _mejor_mano > 0:
			var mejor: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.MONEY)
			mejor.text = I18n.tf("MEJOR MANO: {0}",
				["+" + CareerUi.money(_mejor_mano * FICHA)])
			mejor.clip_text = true
			_botones.add_child(mejor)
		if _arruinados > 0:
			var arr: Label = CareerUi.plain(CareerTheme.T_VALUE, CareerTheme.TEXT)
			arr.text = I18n.tf("ARRUINASTE A {0}", [str(_arruinados)])
			arr.clip_text = true
			_botones.add_child(arr)
		_botones.add_child(_boton_levantarse())
		return




	if int(_mesa.jugadores[0]["fichas"]) > 0:
		var otra: Button = _boton(I18n.t("OTRA MANO"), CareerTheme.Kind.PRIMARY, 96)
		otra.pressed.connect(func() -> void: _nueva_mano())
		_botones.add_child(otra)
	_botones.add_child(_boton_levantarse())








func _cuenta_de_la_noche() -> Label:
	var saldo: int =(int(_mesa.jugadores[0]["fichas"]) - _fichas_inicio) * FICHA
	var l: Label = CareerUi.plain(CareerTheme.T_VALUE,
		CareerTheme.MONEY if saldo >= 0 else CareerTheme.DANGER)
	l.text = I18n.tf("ESTA NOCHE: {0}", ["%s%s" % ["+" if saldo >= 0 else "−",
		CareerUi.money(absi(saldo))]])
	l.clip_text = true
	return l






func _boton_levantarse() -> Button:
	var puede: bool = puede_levantarse()
	var b: Button = _boton(I18n.t("LEVANTARSE DE LA MESA") if puede \
			else I18n.t("TERMINA LA MANO PARA LEVANTARTE"),
		CareerTheme.Kind.GHOST, 88)
	b.disabled = not puede
	if puede:
		b.pressed.connect(func() -> void: levantarse())
	return b












func pulsar(accion: int, monto: int = 0) -> void:




	if _mesa == null or _mesa.terminada or _corriendo:
		return
	UiAudio.click()



	var antes: Dictionary = _foto_mesa()
	if accion == PokerMesa.SUBIR:
		_subidas_yo += 1
	_mesa.actuar(accion, maxi(monto, _mesa.subida_minima()))
	_arrancar_mesa()
	_tras_paso(antes)






func _arrancar_mesa() -> void:
	_corriendo = _mesa != null and not _mesa.terminada and _mesa.turno != 0
	_espera = PASO_SEG
	_pintar()




func paso_mesa() -> bool:
	if _mesa == null or _mesa.terminada:
		_corriendo = false
		return false
	var antes: Dictionary = _foto_mesa()
	var hubo: bool = _mesa.paso_ia()
	_espera = PASO_SEG
	if not hubo or _mesa.terminada or _mesa.turno == 0:
		_corriendo = false
	_pintar()
	_tras_paso(antes)
	return hubo





func seguir_ia() -> void:
	if _mesa == null or _mesa.terminada:
		return
	UiAudio.click()
	if not paso_mesa():
		return
	_corriendo = _mesa != null and not _mesa.terminada and _mesa.turno != 0


func otra_mano() -> void:
	_nueva_mano()


















func puede_levantarse() -> bool:
	if _mesa == null or _mesa.jugadores.is_empty() or _mesa.terminada:
		return true
	var yo: Dictionary = _mesa.jugadores[0]
	return int(yo["fichas"]) <= 0 and not bool(yo["activo"])








func levantarse(forzado: bool = false) -> void:



	if not forzado and not puede_levantarse():
		return
	var final: int = 0
	if _mesa != null and not _mesa.jugadores.is_empty():
		final = int(_mesa.jugadores[0]["fichas"])
	var saldo: int =(final - _fichas_inicio) * FICHA
	Career.poker_anota(_netos)
	cerrada.emit(saldo)
	queue_free()




func _process(delta: float) -> void:


	if _corriendo:
		_espera -= delta
		if _espera <= 0.0:
			paso_mesa()
	if _cam == null:
		return
	_t += delta



	if _foco != null and _foco.visible:
		var p: float = 0.5 + 0.5 * sin(_t * 3.4)
		_foco.scale = Vector3.ONE *(0.94 + 0.1 * p)
		_foco_mat.albedo_color = Color(CareerTheme.MONEY, 0.2 + 0.2 * p)
	var ojo: Vector3 = OJO + Vector3(sin(_t * 0.55) * 0.012,
		sin(_t * 0.9) * 0.008, 0.0)
	_cam.look_at_from_position(ojo, MIRA, Vector3.UP)
