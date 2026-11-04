class_name ShopPhoto
extends MerchIcon



















const LADO: int = 256


const HORNO: int = 512


const SUELA: Color = Color("1b1d24")
const ACERO: Color = Color("c3c7d1")
const ORO: Color = Color("e8b93a")
const BILLETE: Color = Color("4f9a5b")
const FAJA: Color = Color("efe6c8")
const GEMA: Color = Color("4fc3ff")


const BRONCE: Color = Color("d9862f")
const RANURA: Color = Color("9a72e0")


static var _fotos: Dictionary = {}

static var _en_horno: Dictionary = {}

var _raiz: Node3D
var _azar: RandomNumberGenerator = RandomNumberGenerator.new()
var _mats: Dictionary = {}



var _ocupa: float = 0.94
var _al_suelo: bool = false


func _init() -> void:
	super._init()
	size = Vector2i(HORNO, HORNO)








static func rect(host: Node, id: String, lado: float, datos: Dictionary = {}) -> TextureRect:
	var tr: TextureRect = TextureRect.new()
	tr.custom_minimum_size = Vector2(lado, lado)
	tr.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	tr.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	tr.size_flags_vertical = Control.SIZE_SHRINK_CENTER
	tr.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var clave: String = "%s|%s" % [id, str(datos)]
	if _fotos.has(clave):
		tr.texture = _fotos[clave]
		return tr

	if DisplayServer.get_name() == "headless" or host == null or not host.is_inside_tree():
		return tr
	(_al_horno(host, id, datos, clave)["rects"] as Array).append(tr)
	return tr




static func pedir(host: Node, id: String, cb: Callable, datos: Dictionary = {}) -> void:
	var clave: String = "%s|%s" % [id, str(datos)]
	if _fotos.has(clave):
		cb.call(_fotos[clave])
		return
	if DisplayServer.get_name() == "headless" or host == null or not host.is_inside_tree():
		return


	(_al_horno(host, id, datos, clave)["cbs"] as Array).append([host, cb])




static func _al_horno(host: Node, id: String, datos: Dictionary, clave: String) -> Dictionary:
	var h: Dictionary = _en_horno.get(clave, {})
	if not h.is_empty() and is_instance_valid(h.get("vp")):
		return h
	var vp: ShopPhoto = ShopPhoto.new()
	host.add_child(vp)
	vp.montar(id, datos)
	h = {"vp": vp, "rects": [], "cbs": []}
	_en_horno[clave] = h
	vp._hornear(clave)
	return h




static func de_pack(p: Dictionary) -> Array:
	var tipo: String = String(p.get("tipo", ""))
	if tipo == Iap.TIPO_DERECHO:
		return [String(p["id"]), {}]
	if tipo == Iap.TIPO_LOTE:
		var ent: Dictionary = p.get("entrega", {})
		var datos: Dictionary = {"cuanto": int(ent.get("dinero", 0)),
			"puntos": int(ent.get("puntos", 0))}
		var eds: Array = ent.get("ediciones", [])
		if not eds.is_empty():
			datos["color"] = Iap.edicion(String(eds[0])).get("color", ORO)
		return ["monton_lote", datos]
	if tipo == Iap.TIPO_PUNTOS:
		return ["monton", {"puntos": int(p.get("cuanto", 0))}]
	return ["monton", {"cuanto": int(p.get("cuanto", 0)),
		"puntos": int(p.get("puntos_extra", 0))}]



static func tiene_modelo(id: String) -> bool:
	return MODELOS.has(id) or id.begins_with("monton") or id.begins_with("bota_ed") \
			or id.begins_with("estrellas")







const FOTO_HERENCIA: Dictionary = {
	"botas_heredadas": "trueno", "botas_de_oro": "corona", "kit_botas": "barrio",
	"piernas_de_nino": "zenit",
	"el_deportivo": "coche",
	"mano_derecha": "ag2", "el_telefono": "ag3", "kit_agente": "ag1", "fichaje_oro": "ag5",
	"preparador_familia": "fisio", "cuerpo_hierro": "clinica",
	"recomendado": "reunion_tecnico", "ahijado": "reunion_tecnico",
	"cara_anuncio": "camara",
	"patio_familia": "solar", "kit_solar": "solar",
	"el_nueve": "balon", "killer_nato": "balon", "pie_educado": "balon",
	"mano_fria": "balon", "picardia": "balon",
	"el_diez": "camiseta", "sangre_azul": "camiseta_seleccion",
	"con_cartel": "bufanda", "el_que_volvio": "bufanda",
	"prodigio": "trofeo", "hijo_leyenda": "trofeo",
	"kit_cantera": "balon", "kit_cartera": "trofeo",
	"buen_toque": "balon", "pulmones": "bebida", "los_ahorros": "donacion",
	"el_capitan": "cena_capitan", "el_cerebro": "analista", "reloj_abuelo": "reloj",
	"superdotado": "trofeo", "la_fortuna": "donacion",

	"pack_focos": "bufanda", "pack_padrino": "ag5", "pack_dinastia": "donacion",
	"pack_atleta": "fisio", "pack_talento": "balon",
}

static func foto_herencia(id: String) -> String:
	return String(FOTO_HERENCIA.get(id, "trofeo"))


func _hornear(clave: String) -> void:
	await get_tree().process_frame
	await RenderingServer.frame_post_draw
	var img: Image = get_texture().get_image()
	var tex: ImageTexture = null
	if img != null and not img.is_empty():
		tex = ImageTexture.create_from_image(_encuadrar(img))
		_fotos[clave] = tex
	var h: Dictionary = _en_horno.get(clave, {})
	_en_horno.erase(clave)
	for r in h.get("rects", []):
		if is_instance_valid(r):
			(r as TextureRect).texture = tex
	for par in h.get("cbs", []):
		if tex != null and is_instance_valid(par[0]) and (par[1] as Callable).is_valid():
			(par[1] as Callable).call(tex)
	queue_free()




func _encuadrar(img: Image) -> Image:
	var usado: Rect2i = img.get_used_rect()
	if usado.size.x <= 0 or usado.size.y <= 0:
		return img
	var rec: Image = img.get_region(usado)
	var util: float = float(LADO) * clampf(_ocupa, 0.2, 1.0) - 4.0
	var esc: float = util / float(maxi(usado.size.x, usado.size.y))
	rec.resize(maxi(1, int(float(usado.size.x) * esc)), maxi(1, int(float(usado.size.y) * esc)),
		Image.INTERPOLATE_LANCZOS)
	var lienzo: Image = Image.create_empty(LADO, LADO, false, rec.get_format())
	@warning_ignore("integer_division")
	var x: int =(LADO - rec.get_width()) / 2
	@warning_ignore("integer_division")
	var y: int =(LADO - rec.get_height() - 2) if _al_suelo else (LADO - rec.get_height()) / 2
	lienzo.blit_rect(rec, Rect2i(Vector2i.ZERO, rec.get_size()), Vector2i(x, y))
	return lienzo





const MODELOS: Dictionary = {
	"cantera": "_m_bota", "trueno": "_m_bota", "bisturi": "_m_bota", "comba": "_m_bota",
	"eclipse": "_m_bota", "nova": "_m_bota", "zenit": "_m_bota",
	"corona": "_m_bota", "barrio": "_m_bota", "acero": "_m_bota", "orbita": "_m_bota",
	"bebida": "_m_lata", "gel": "_m_gel", "psicologo": "_m_divan", "botellin": "_m_botellin",
	"camara": "_m_capsula", "cena_capitan": "_m_cena", "reunion_tecnico": "_m_pizarra",
	"infiltracion": "_m_jeringa",
	"reloj": "_m_reloj", "donacion": "_m_donacion", "coche": "_m_coche",
	"coche_muscle": "_m_coche", "coche_gt": "_m_coche", "coche_hiper": "_m_coche",
	"coche_compacto": "_m_coche", "coche_sedan": "_m_coche",
	"coche_familiar": "_m_coche", "coche_pickup": "_m_coche",
	"fisio": "_m_camilla", "chef": "_m_chef", "clinica": "_m_clinica", "analista": "_m_monitor",
	"nutricionista": "_m_nutricionista", "entrenador": "_m_entrenador",
	"ag1": "_m_maletin", "ag2": "_m_maletin", "ag3": "_m_maletin", "ag4": "_m_maletin",
	"ag5": "_m_contrato",
	"ventajas_todas": "_m_llave", "doble_paga": "_m_doble_paga", "doble_xp": "_m_doble_xp",
	"pack_leyenda": "_m_pack_leyenda", "cuarta_ranura": "_m_cuarta_ranura",

	"solar": "_m_solar", "balon": "_m_balon", "camiseta": "_m_camiseta",
	"camiseta_seleccion": "_m_camiseta", "bufanda": "_m_bufanda", "trofeo": "_m_trofeo",
}



func montar(id: String, datos: Dictionary = {}) -> void:
	_raiz = Node3D.new()
	add_child(_raiz)
	_azar.seed = hash(id)
	var alto: float = 0.4
	if id.begins_with("monton"):
		alto = _m_monton(int(datos.get("cuanto", 0)), int(datos.get("puntos", 0)),
			datos.get("color", null))
	elif id.begins_with("estrellas"):
		alto = _m_estrellas(int(datos.get("cuanto", 150)))
	elif id.begins_with("bota_ed"):
		alto = _m_bota("edicion", datos)
	elif MODELOS.has(id):
		alto = float(call(String(MODELOS[id]), id, datos))
	else:
		_ball(ORO)
		alto = 0.31

	_make_camera(alto * 1.25)
	_make_lights(Color("6f86c9"))




func _mat(col: Color, rough: float, metal: float, brillo: float = 0.0) -> StandardMaterial3D:

	var k: String = "%s|%.2f|%.2f|%.2f" % [col.to_html(), rough, metal, brillo]
	if _mats.has(k):
		return _mats[k]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	_mats[k] = mat
	mat.albedo_color = col
	mat.roughness = rough



	if metal > 0.5:
		brillo = maxf(brillo, 0.34)
		metal = 0.35
	mat.metallic = metal
	if col.a < 1.0:
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	if brillo > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = brillo
	return mat


func _pon(m: Mesh, mat: StandardMaterial3D, pos: Vector3, rot: Vector3 = Vector3.ZERO,
		padre: Node3D = null) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = m
	mi.material_override = mat
	mi.position = pos
	mi.rotation_degrees = rot
	(padre if padre != null else _raiz).add_child(mi)
	return mi


func _caja(tam: Vector3, col: Color, pos: Vector3, rot: Vector3 = Vector3.ZERO,
		rough: float = 0.7, metal: float = 0.0, padre: Node3D = null,
		brillo: float = 0.0) -> MeshInstance3D:
	var bm: BoxMesh = BoxMesh.new()
	bm.size = tam
	return _pon(bm, _mat(col, rough, metal, brillo), pos, rot, padre)


func _cil(r_arriba: float, r_abajo: float, h: float, col: Color, pos: Vector3,
		rot: Vector3 = Vector3.ZERO, rough: float = 0.6, metal: float = 0.0,
		lados: int = 20, padre: Node3D = null, brillo: float = 0.0) -> MeshInstance3D:
	var cm: CylinderMesh = CylinderMesh.new()
	cm.top_radius = r_arriba
	cm.bottom_radius = r_abajo
	cm.height = h
	cm.radial_segments = lados
	cm.rings = 1
	return _pon(cm, _mat(col, rough, metal, brillo), pos, rot, padre)


func _bola(r: float, col: Color, pos: Vector3, escala: Vector3 = Vector3.ONE,
		rough: float = 0.6, metal: float = 0.0, padre: Node3D = null) -> MeshInstance3D:
	var sm: SphereMesh = SphereMesh.new()
	sm.radius = r
	sm.height = r * 2.0
	sm.radial_segments = 18
	sm.rings = 10
	var mi: MeshInstance3D = _pon(sm, _mat(col, rough, metal), pos, Vector3.ZERO, padre)
	mi.scale = escala
	return mi


func _grupo(pos: Vector3 = Vector3.ZERO, rot: Vector3 = Vector3.ZERO,
		padre: Node3D = null) -> Node3D:
	var g: Node3D = Node3D.new()
	g.position = pos
	g.rotation_degrees = rot
	(padre if padre != null else _raiz).add_child(g)
	return g











const B_LARGO: float = 0.3


const B_YB: float = -0.06
const B_SUELA: float = 0.018
const B_TACO: float = 0.022

const B_E_LOMO: float = 0.9
const B_E_BASE: float = 0.45

const B_T_BOCA: float = 0.46
const B_SUELA_OSC: Color = Color("3b3f4c")


const B_V_TOPE: float = 0.054

const B_ANCHO: Array = [Vector2(0.0, 0.035), Vector2(0.16, 0.041), Vector2(0.38, 0.039),
	Vector2(0.68, 0.05), Vector2(0.86, 0.045), Vector2(1.0, 0.032)]


const B_ALTO: Array = [Vector2(0.0, 0.062), Vector2(0.06, 0.082), Vector2(0.22, 0.088),
	Vector2(0.38, 0.082), Vector2(0.5, 0.05), Vector2(0.64, 0.012), Vector2(0.78, -0.012),
	Vector2(0.9, -0.021), Vector2(1.0, -0.026)]

const B_BOCA: Array = [Vector2(0.0, 0.07), Vector2(0.05, 0.062), Vector2(0.22, 0.048),
	Vector2(0.37, 0.056), Vector2(0.43, 0.075), Vector2(0.46, 0.2)]


const BOTA_LOOK: Dictionary = {
	"eclipse": {"suela": Color("101420"), "tacos": Color("39ffe0"), "talon": Color("39ffe0"), "marca": Color("39ffe0"), "metal": 0.35, "rough": 0.28},
	"nova": {"suela": Color("724ce8"), "tacos": Color("39dfff"), "talon": Color("ff48c6"), "marca": Color("39dfff"), "metal": 0.45, "rough": 0.25},
	"zenit": {"suela": Color("eec566"), "tacos": Color("fff0b2"), "talon": Color("eec566"), "marca": Color("ffe29a"), "metal": 0.6, "rough": 0.25},
	"barrio": {"suela": Color("e8dcc2"), "tacos": Color("e8dcc2"), "talon": Color("e8dcc2"), "marca": Color("e8dcc2")},
	"acero": {"suela": Color("ef8535"), "tacos": ACERO, "talon": Color("ef8535"), "marca": Color("ef8535")},
	"orbita": {"suela": B_SUELA_OSC, "tacos": Color("36d6c5"), "talon": Color("36d6c5"), "marca": Color("36d6c5")},
	"cantera": {"suela": Color("e9e6df"), "tacos": ACERO, "talon": Color("e9e6df")},
	"trueno": {"suela": B_SUELA_OSC, "tacos": Color("ffd23c"), "talon": Color("20222a")},
	"bisturi": {"suela": B_SUELA_OSC, "tacos": Color("35c4d8"), "talon": Color("35c4d8")},
	"comba": {"suela": Color("eef1f6"), "tacos": ACERO, "talon": Color("eef1f6")},
	"corona": {"suela": Color("3a3222"), "tacos": ORO, "talon": Color("fff1b8")},
}






func _m_bota(id: String, datos: Dictionary = {}) -> float:
	var b: Dictionary = Shop.boots_by_id(id)
	var col: Color = datos.get("color", b.get("color", Color("2a2c33")))


	if col.get_luminance() < 0.12:
		col = col.lightened(0.24)
	var oro: bool = id == "corona"
	var claro: bool = col.get_luminance() > 0.6
	var marca: Color = Color("20222a") if claro else Color("f4f4f6")
	var look: Dictionary = BOTA_LOOK.get(id, {})
	var metal: float = float(look.get("metal", 0.75 if oro else 0.05))
	var rough: float = float(look.get("rough", 0.32 if oro else 0.42))
	var g: Node3D = _grupo(Vector3(0.0, 0.0, 0.0), Vector3(0.0, B_GIRO, 0.0))
	_montar_bota(g, col, marca, id, rough, metal)
	return 0.36




const B_GIRO: float = -8.0


func _montar_bota(g: Node3D, col: Color, marca: Color, id: String, rough: float = 0.42,
		metal: float = 0.05) -> void:
	var look: Dictionary = BOTA_LOOK.get(id, {})
	var oscuro: Color = col.darkened(0.35)
	var piel: StandardMaterial3D = _mat(col, rough, metal)
	_b_loft(g, 0, piel)
	_b_loft(g, 1, _mat(look.get("suela", B_SUELA_OSC), 0.75, 0.0))

	for t in [0.1, 0.25, 0.56, 0.7, 0.84]:
		var s: PackedFloat32Array = _b_sec(t)
		for lado in [-1.0, 1.0]:
			_cil(0.0115, 0.0075, B_TACO, look.get("tacos", ACERO),
				Vector3(s[0], B_YB - B_SUELA - B_TACO * 0.5 + 0.002 + s[4], lado * s[1] * 0.6),
				Vector3.ZERO, 0.4, 0.6, 10, g)
	_b_boca(g, col)

	var s1: PackedFloat32Array = _b_sec(0.44)
	var s2: PackedFloat32Array = _b_sec(0.51)
	var rampa: float = atan2((s2[2] + s2[4]) -(s1[2] + s1[4]), s2[0] - s1[0])



	var pie: Vector3 = _b_p(0.47, PI * 0.5) + Vector3(- cos(rampa), - sin(rampa), 0.0) * 0.006 \
			- Vector3(- sin(rampa), cos(rampa), 0.0) * 0.004
	var leng: Node3D = _grupo(pie, Vector3(0.0, 0.0, rad_to_deg(rampa)), g)
	_bola(0.03, oscuro, Vector3.ZERO, Vector3(1.12, 0.22, 0.8), 0.7, 0.0, leng)

	var gar: float = 0.5
	_b_piel(g, [Vector2(0.46, PI * 0.5 - gar), Vector2(0.75, PI * 0.5 - gar * 0.8)],
		[Vector2(0.46, PI * 0.5 + gar), Vector2(0.75, PI * 0.5 + gar * 0.8)],
		_mat(oscuro, 0.8, 0.0), 0.0014, true)
	for i in 5:
		var tc: float = 0.485 + float(i) * 0.054
		_b_piel(g, [Vector2(tc - 0.011, PI * 0.5 - 0.66), Vector2(tc - 0.011, PI * 0.5 + 0.66)],
			[Vector2(tc + 0.011, PI * 0.5 - 0.66), Vector2(tc + 0.011, PI * 0.5 + 0.66)],
			_mat(marca, 0.7, 0.0), 0.0042, true)

	var ca: Array = []
	var cb: Array = []
	for i in 9:
		var tt: float = 0.004 + 0.2 * float(i) / 8.0
		ca.append(Vector2(tt, 0.03))
		cb.append(Vector2(tt, 0.03 + 0.66 *(1.0 - pow(float(i) / 8.0, 1.7))))
	_b_piel(g, ca, cb, _mat(look.get("talon", oscuro), 0.5, metal), 0.0018, false, true)
	_b_marca(g, id, look.get("marca", marca))



func _b_marca(g: Node3D, id: String, marca: Color) -> void:
	match id:
		"eclipse":

			var a: Array = []
			var b: Array = []
			for i in 25:
				var ang: float = PI * 0.35 + PI * 1.3 * float(i) / 24.0
				a.append(Vector2(0.47 + 0.21 * cos(ang), 0.5 + 0.36 * sin(ang)))
				b.append(Vector2(0.52 + 0.17 * cos(ang), 0.5 + 0.29 * sin(ang)))
			_b_piel(g, a, b, _mat(marca, 0.3, 0.3, 0.25))
			for k in 3:
				var v: float = 0.24 + float(k) * 0.18
				_b_piel(g, [Vector2(0.62, v), Vector2(0.86, v + 0.09)],
					[Vector2(0.62, v + 0.045), Vector2(0.86, v + 0.1)], _mat(marca, 0.3, 0.2))
		"nova":

			var cyan := _mat(marca, 0.25, 0.45, 0.15)
			var pink := _mat(Color("ff48c6"), 0.25, 0.45, 0.15)
			_b_piel(g, [Vector2(0.27, 0.5), Vector2(0.49, 0.95)],
				[Vector2(0.49, 0.08), Vector2(0.49, 0.95)], cyan)
			_b_piel(g, [Vector2(0.49, 0.95), Vector2(0.72, 0.5)],
				[Vector2(0.49, 0.08), Vector2(0.72, 0.5)], pink)
			_b_piel(g, [Vector2(0.63, 0.2), Vector2(0.93, 0.32)],
				[Vector2(0.63, 0.13), Vector2(0.93, 0.32)], cyan)
		"zenit":

			var gold := _mat(marca, 0.25, 0.65, 0.12)
			for k in 3:
				var t: float = 0.25 + float(k) * 0.12
				_b_piel(g, [Vector2(t, 0.76), Vector2(t + 0.13, 0.17), Vector2(t + 0.32, 0.64)],
					[Vector2(t + 0.05, 0.8), Vector2(t + 0.16, 0.32), Vector2(t + 0.32, 0.7)], gold)
			_b_piel(g, [Vector2(0.48, 0.64), Vector2(0.54, 0.94), Vector2(0.6, 0.64)],
				[Vector2(0.48, 0.64), Vector2(0.54, 0.49), Vector2(0.6, 0.64)], _mat(Color("ffffff"), 0.2, 0.6))
		"acero":

			for k in 2:
				var t: float = 0.27 + float(k) * 0.19
				_b_piel(g, [Vector2(t, 0.18), Vector2(t + 0.13, 0.48), Vector2(t, 0.78)],
					[Vector2(t + 0.07, 0.18), Vector2(t + 0.2, 0.48), Vector2(t + 0.07, 0.78)], _mat(marca, 0.6, 0.0))
		"orbita":

			var exterior: Array = []
			var interior: Array = []
			for i in 33:
				var ang: float = TAU * float(i) / 32.0
				exterior.append(Vector2(0.49 + 0.24 * cos(ang), 0.49 + 0.31 * sin(ang)))
				interior.append(Vector2(0.49 + 0.19 * cos(ang), 0.49 + 0.23 * sin(ang)))
			_b_piel(g, exterior, interior, _mat(marca, 0.4, 0.0))
		"trueno":

			_b_piel(g, [Vector2(0.49, 0.93), Vector2(0.36, 0.5), Vector2(0.44, 0.5), Vector2(0.31, 0.07)],
				[Vector2(0.57, 0.93), Vector2(0.45, 0.59), Vector2(0.53, 0.59), Vector2(0.31, 0.07)],
				_mat(Color("ffd23c"), 0.5, 0.0, 0.15))
		"bisturi":

			_b_piel(g, [Vector2(0.24, 0.52), Vector2(0.55, 0.44), Vector2(0.9, 0.3)],
				[Vector2(0.24, 0.36), Vector2(0.55, 0.33), Vector2(0.9, 0.3)],
				_mat(Color("35c4d8"), 0.4, 0.0, 0.1))
			_b_piel(g, [Vector2(0.26, 0.27), Vector2(0.55, 0.245), Vector2(0.82, 0.2)],
				[Vector2(0.26, 0.22), Vector2(0.55, 0.2), Vector2(0.82, 0.17)],
				_mat(Color("20222a"), 0.5, 0.0))
		"comba":

			for k in 2:
				var ma: Array = []
				var mb: Array = []
				for i in 13:
					var u: float = float(i) / 12.0
					var v: float = 0.14 + 0.6 * u * u + float(k) * 0.2
					var semi: float =(0.085 if k == 0 else 0.028) * sin(PI * u) + 0.004
					ma.append(Vector2(0.24 + 0.46 * u - float(k) * 0.03, v + semi))
					mb.append(Vector2(0.24 + 0.46 * u - float(k) * 0.03, v - semi))
				_b_piel(g, ma, mb, _mat(marca, 0.5, 0.0))
		"corona":
			var c: StandardMaterial3D = _mat(Color("fff1b8"), 0.3, 0.0, 0.25)
			_b_piel(g, [Vector2(0.23, 0.36), Vector2(0.53, 0.36)], [Vector2(0.23, 0.2), Vector2(0.53, 0.2)], c)
			for k in 3:

				var tc: float = 0.28 + float(k) * 0.1
				var punta: Vector2 = Vector2(tc, 0.9 if k == 1 else 0.74)
				_b_piel(g, [Vector2(tc - 0.05, 0.35), punta], [Vector2(tc + 0.05, 0.35), punta], c)
		_:

			for k in 2:
				var t0: float = 0.27 + float(k) * 0.085
				_b_piel(g, [Vector2(t0, 0.04), Vector2(t0 + 0.13, 0.96)],
					[Vector2(t0 + 0.042, 0.04), Vector2(t0 + 0.172, 0.96)], _mat(marca, 0.6, 0.0))



func _clave(k: Array, t: float) -> float:
	var n: int = k.size()
	if t <=(k[0] as Vector2).x:
		return (k[0] as Vector2).y
	if t >=(k[n - 1] as Vector2).x:
		return (k[n - 1] as Vector2).y
	var i: int = 0
	while i < n - 2 and t >(k[i + 1] as Vector2).x:
		i += 1
	var p0: Vector2 = k[i]
	var p1: Vector2 = k[i + 1]
	var h: float = p1.x - p0.x
	var u: float =(t - p0.x) / h
	var u2: float = u * u
	var u3: float = u2 * u
	return (2.0 * u3 - 3.0 * u2 + 1.0) * p0.y +(u3 - 2.0 * u2 + u) * h * _pend(k, i) \
			+(-2.0 * u3 + 3.0 * u2) * p1.y +(u3 - u2) * h * _pend(k, i + 1)


func _pend(k: Array, i: int) -> float:
	var a: Vector2 = k[maxi(i - 1, 0)]
	var b: Vector2 = k[mini(i + 1, k.size() - 1)]
	return (b.y - a.y) / maxf(b.x - a.x, 0.0001)



func _b_sec(t: float) -> PackedFloat32Array:


	var ct: float = 1.0
	if t < 0.1:
		ct = sqrt(maxf(0.0, 1.0 - pow((0.1 - t) / 0.1, 2.0)))
	var cp: float = 1.0
	if t > 0.78:
		cp = sqrt(maxf(0.0, 1.0 - pow((t - 0.78) / 0.22, 2.0)))
	var top: float = B_YB +(_clave(B_ALTO, t) - B_YB) * pow(cp, 0.7)

	var sube: float = 0.02 * pow(maxf(0.0,(t - 0.7) / 0.3), 2.0) \
			+ 0.006 * pow(maxf(0.0,(0.12 - t) / 0.12), 2.0)
	return PackedFloat32Array([(t - 0.5) * B_LARGO, _clave(B_ANCHO, t) * ct * cp, top,
		B_YB +(top - B_YB) * 0.38, sube])




func _b_p(t: float, a: float, capa: int = 0) -> Vector3:
	t = clampf(t, 2e-05, 0.99998)
	var s: PackedFloat32Array = _b_sec(t)
	var ca: float = cos(a)
	var sa: float = sin(a)
	if capa == 1:


		var canto: float = B_SUELA * 0.5 * minf(1.0, pow(s[1] / 0.03, 0.6))
		return Vector3(s[0] * 1.025,
			B_YB - canto + 0.001 + canto * signf(sa) * pow(absf(sa), 0.3) + s[4],
			s[1] * 1.06 * signf(ca) * pow(absf(ca), 0.3))
	var e: float = B_E_LOMO if sa >= 0.0 else B_E_BASE
	var y: float = s[3] +((s[2] - s[3]) if sa >= 0.0 else (s[3] - B_YB)) * signf(sa) * pow(absf(sa), e)
	if t < B_T_BOCA:
		y = minf(y, _clave(B_BOCA, t))
	return Vector3(s[0], y + s[4], s[1] * signf(ca) * pow(absf(ca), e))




func _b_n(t: float, a: float, capa: int = 0) -> Vector3:
	t = clampf(t, 2e-05, 0.99998)
	var p: Vector3 = _b_p(t, a, capa)


	var fuera: Vector3 = p -(p + _b_p(t, a + PI, capa)) * 0.5
	var n: Vector3 =(_b_p(t, a + 0.03, capa) - _b_p(t, a - 0.03, capa)).cross(
		_b_p(t + 0.004, a, capa) - _b_p(t - 0.004, a, capa))
	if n.length_squared() < 1e-18:
		return fuera.normalized() if fuera.length_squared() > 1e-18 else Vector3.UP
	n = n.normalized()
	return n if n.dot(fuera) >= 0.0 else - n



func _b_a_boca(t: float) -> float:
	if t >= B_T_BOCA:
		return PI * 0.5
	var s: PackedFloat32Array = _b_sec(clampf(t, 2e-05, 0.99998))
	var corte: float = _clave(B_BOCA, t)
	if corte >= s[2]:
		return PI * 0.5
	return asin(clampf(pow(maxf(corte - s[3], 0.0) / maxf(s[2] - s[3], 0.0001), 1.0 / B_E_LOMO), 0.0, 1.0))



func _b_tv(t: float, v: float) -> Vector2:
	var s: PackedFloat32Array = _b_sec(clampf(t, 2e-05, 0.99998))
	var y: float = lerpf(B_YB, minf(s[2], B_V_TOPE), clampf(v, 0.0, 1.0))
	if y >= s[3]:
		return Vector2(t, asin(clampf(pow((y - s[3]) / maxf(s[2] - s[3], 0.0001), 1.0 / B_E_LOMO), 0.0, 1.0)))
	return Vector2(t, - asin(clampf(pow((s[3] - y) / maxf(s[3] - B_YB, 0.0001), 1.0 / B_E_BASE), 0.0, 1.0)))




func _b_tri(st: SurfaceTool, p: Array, n: Array) -> void:
	var orden: Array = [0, 1, 2]
	var geo: Vector3 =((p[1] as Vector3) -(p[0] as Vector3)).cross((p[2] as Vector3) -(p[0] as Vector3))
	if geo.dot((n[0] as Vector3) +(n[1] as Vector3) +(n[2] as Vector3)) > 0.0:
		orden = [0, 2, 1]
	for i in orden:
		st.set_normal(n[i])
		st.add_vertex(p[i])


func _b_cuad(st: SurfaceTool, p: Array, n: Array) -> void:
	_b_tri(st, [p[0], p[1], p[2]], [n[0], n[1], n[2]])
	_b_tri(st, [p[0], p[2], p[3]], [n[0], n[2], n[3]])




func _b_loft(g: Node3D, capa: int, mat: StandardMaterial3D) -> void:
	var nt: int = 46 if capa == 0 else 30
	var k_lado: int = 9
	var k_boca: int = 6
	var k_base: int = 14 if capa == 0 else 10
	var ps: Array = []
	var ns: Array = []
	var na: int = 0
	for i in nt:

		var t: float = 0.5 - 0.5 * cos(PI * float(i) / float(nt - 1))
		var ab: float = _b_a_boca(t) if capa == 0 else PI * 0.5
		var angs: Array = []
		for j in k_lado:
			angs.append(ab * float(j) / float(k_lado))
		for j in k_boca:
			angs.append(ab +(PI - 2.0 * ab) * float(j) / float(k_boca))
		for j in k_lado:
			angs.append(PI - ab + ab * float(j) / float(k_lado))
		for j in k_base:
			angs.append(PI + PI * float(j) / float(k_base))
		na = angs.size()
		for a in angs:
			ps.append(_b_p(t, a, capa))



			if i == 0 or i == nt - 1:
				ns.append(Vector3.LEFT if i == 0 else Vector3.RIGHT)
			else:
				ns.append(_b_n(t, a, capa))
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for i in nt - 1:
		for j in na:
			var j2: int =(j + 1) % na
			var q: Array = [i * na + j, i * na + j2,(i + 1) * na + j2,(i + 1) * na + j]
			_b_cuad(st, [ps[q[0]], ps[q[1]], ps[q[2]], ps[q[3]]], [ns[q[0]], ns[q[1]], ns[q[2]], ns[q[3]]])
	_pon(st.commit(), mat, Vector3.ZERO, Vector3.ZERO, g)






func _b_piel(g: Node3D, ba: Array, bb: Array, mat: StandardMaterial3D, fuera: float = 0.0022,
		crudo: bool = false, espejo: bool = false) -> void:
	const A_LO: int = 6
	const A_AN: int = 5
	var filas: Array = []
	for i in ba.size() - 1:
		var hasta: int = A_LO +(1 if i == ba.size() - 2 else 0)
		for s in hasta:
			var u: float = float(s) / float(A_LO)
			var pa: Vector2 =(ba[i] as Vector2).lerp(ba[i + 1], u)
			var pb: Vector2 =(bb[i] as Vector2).lerp(bb[i + 1], u)
			var fila: Array = []
			for k in A_AN + 1:
				var q: Vector2 = pa.lerp(pb, float(k) / float(A_AN))
				fila.append(q if crudo else _b_tv(q.x, q.y))
			filas.append(fila)
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for lado in (2 if espejo else 1):
		var ps: Array = []
		var ns: Array = []
		for fila in filas:
			for q in fila:
				var ta: Vector2 = q
				var a: float = ta.y if lado == 0 else PI - ta.y
				var n: Vector3 = _b_n(ta.x, a)
				ps.append(_b_p(ta.x, a) + n * fuera)
				ns.append(n)
		var ancho: int = A_AN + 1
		for i in filas.size() - 1:
			for k in A_AN:
				var q: Array = [i * ancho + k, i * ancho + k + 1,(i + 1) * ancho + k + 1,(i + 1) * ancho + k]
				_b_cuad(st, [ps[q[0]], ps[q[1]], ps[q[2]], ps[q[3]]], [ns[q[0]], ns[q[1]], ns[q[2]], ns[q[3]]])
	_pon(st.commit(), mat, Vector3.ZERO, Vector3.ZERO, g)





func _b_boca(g: Node3D, col: Color) -> void:
	const T0: float = 0.04
	const T1: float = 0.425
	const N: int = 22
	for capa in 2:
		var st: SurfaceTool = SurfaceTool.new()
		st.begin(Mesh.PRIMITIVE_TRIANGLES)
		var izq: Array = []
		var der: Array = []
		for i in N + 1:
			var u: float = float(i) / float(N)
			if capa == 1:
				u *= 0.42
			var t: float = lerpf(T0, T1, u)
			var s: PackedFloat32Array = _b_sec(t)
			var ab: float = _b_a_boca(t)
			var z: float = s[1] * pow(cos(ab), B_E_LOMO) * 0.8 * pow(maxf(sin(PI * u), 0.0), 0.5)
			if capa == 1:

				z *= 0.86 * sqrt(maxf(0.0, 1.0 - pow(u / 0.42, 2.0)))
			var y: float = _clave(B_BOCA, t) + s[4] + 0.0012 + 0.0006 * float(capa)
			izq.append(Vector3(s[0], y, - z))
			der.append(Vector3(s[0], y, z))
		var arr: Array = [Vector3.UP, Vector3.UP, Vector3.UP, Vector3.UP]
		for i in N:
			_b_cuad(st, [izq[i], der[i], der[i + 1], izq[i + 1]], arr)
		_pon(st.commit(), _mat(Color("15161b") if capa == 0 else col.darkened(0.62), 1.0, 0.0),
			Vector3.ZERO, Vector3.ZERO, g)




func _m_lata(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, 0, -10.0))
	_cil(0.06, 0.06, 0.19, Color("2348c7"), Vector3.ZERO, Vector3.ZERO, 0.3, 0.55, 24, g)
	_cil(0.0612, 0.0612, 0.06, Color("ffd23c"), Vector3(0, -0.012, 0), Vector3.ZERO, 0.35, 0.4, 24, g)
	_caja(Vector3(0.05, 0.02, 0.004), Color("20222a"), Vector3(0.01, -0.002, 0.0612), Vector3(0, 0, 38.0), 0.5, 0.0, g)
	_caja(Vector3(0.05, 0.02, 0.004), Color("20222a"), Vector3(0.022, -0.022, 0.0612), Vector3(0, 0, 38.0), 0.5, 0.0, g)
	_cil(0.05, 0.06, 0.014, ACERO, Vector3(0, 0.102, 0), Vector3.ZERO, 0.25, 0.9, 24, g)
	_cil(0.06, 0.052, 0.012, ACERO, Vector3(0, -0.101, 0), Vector3.ZERO, 0.25, 0.9, 24, g)
	_caja(Vector3(0.03, 0.004, 0.018), Color("8d929e"), Vector3(0.006, 0.111, 0.01), Vector3.ZERO, 0.3, 0.9, g)
	return 0.3


func _m_gel(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, 0, 24.0))
	_cil(0.046, 0.05, 0.17, Color("f2f4f7"), Vector3.ZERO, Vector3.ZERO, 0.45, 0.0, 22, g)
	_cil(0.0472, 0.0505, 0.056, Color("1fa7b8"), Vector3(0, -0.02, 0), Vector3.ZERO, 0.45, 0.0, 22, g)
	_caja(Vector3(0.104, 0.03, 0.012), Color("dfe3ea"), Vector3(0, 0.098, 0), Vector3.ZERO, 0.5, 0.1, g)
	_cil(0.032, 0.032, 0.014, Color("dfe3ea"), Vector3(0, -0.091, 0), Vector3.ZERO, 0.5, 0.0, 16, g)
	_cil(0.026, 0.03, 0.044, Color("1fa7b8"), Vector3(0, -0.118, 0), Vector3.ZERO, 0.5, 0.0, 16, g)

	_caja(Vector3(0.03, 0.01, 0.004), Color("f2f4f7"), Vector3(0, -0.02, 0.0508), Vector3.ZERO, 0.5, 0.0, g)
	_caja(Vector3(0.01, 0.03, 0.004), Color("f2f4f7"), Vector3(0, -0.02, 0.0508), Vector3.ZERO, 0.5, 0.0, g)
	return 0.34


func _m_divan(_id: String, _d: Dictionary) -> float:
	var cuero: Color = Color("7a4a2e")
	var g: Node3D = _grupo(Vector3(0, -0.02, 0), Vector3(0, -22.0, 0))
	_caja(Vector3(0.36, 0.05, 0.14), cuero, Vector3(0, 0, 0), Vector3.ZERO, 0.55, 0.0, g)
	_caja(Vector3(0.13, 0.046, 0.14), cuero.lightened(0.08), Vector3(-0.14, 0.052, 0), Vector3(0, 0, -30.0), 0.55, 0.0, g)
	_cil(0.03, 0.03, 0.14, cuero.lightened(0.14), Vector3(-0.19, 0.098, 0), Vector3(90.0, 0, 0), 0.5, 0.0, 14, g)
	for k in 5:
		_bola(0.007, cuero.darkened(0.4), Vector3(-0.06 + float(k) * 0.055, 0.026, 0.035), Vector3.ONE, 0.5, 0.0, g)
		_bola(0.007, cuero.darkened(0.4), Vector3(-0.06 + float(k) * 0.055, 0.026, -0.035), Vector3.ONE, 0.5, 0.0, g)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_cil(0.01, 0.007, 0.05, Color("2c2019"), Vector3(sx * 0.155, -0.05, sz * 0.052), Vector3.ZERO, 0.6, 0.1, 8, g)

	_caja(Vector3(0.07, 0.008, 0.09), Color("f1ead6"), Vector3(0.09, 0.03, 0.0), Vector3(0, 18.0, 0), 0.8, 0.0, g)
	_caja(Vector3(0.006, 0.006, 0.08), Color("d33c3c"), Vector3(0.06, 0.036, 0.01), Vector3(0, 40.0, 0), 0.5, 0.0, g)
	return 0.4


func _m_botellin(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.01, 0), Vector3(0, 0, -8.0))
	_cil(0.05, 0.05, 0.16, Color(0.35, 0.72, 0.95, 0.92), Vector3(0, -0.03, 0), Vector3.ZERO, 0.2, 0.1, 22, g)
	_cil(0.0512, 0.0512, 0.06, Color("f2f4f7"), Vector3(0, -0.035, 0), Vector3.ZERO, 0.5, 0.0, 22, g)
	_caja(Vector3(0.046, 0.012, 0.004), Color("ff7a1a"), Vector3(0.0, -0.035, 0.0515), Vector3(0, 0, -14.0), 0.5, 0.0, g)
	_cil(0.03, 0.05, 0.04, Color(0.35, 0.72, 0.95, 0.92), Vector3(0, 0.07, 0), Vector3.ZERO, 0.2, 0.1, 22, g)
	_cil(0.033, 0.033, 0.03, Color("20222a"), Vector3(0, 0.104, 0), Vector3.ZERO, 0.5, 0.0, 18, g)
	_cil(0.013, 0.016, 0.026, Color("ff7a1a"), Vector3(0, 0.131, 0), Vector3.ZERO, 0.5, 0.0, 12, g)
	return 0.34


func _m_capsula(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(0, -24.0, 0))
	var cap: CapsuleMesh = CapsuleMesh.new()
	cap.radius = 0.085
	cap.height = 0.4
	cap.radial_segments = 22
	cap.rings = 8
	_pon(cap, _mat(Color("eef1f6"), 0.3, 0.2), Vector3(0, 0.02, 0), Vector3(0, 0, 90.0), g)

	var ven: CapsuleMesh = CapsuleMesh.new()
	ven.radius = 0.07
	ven.height = 0.3
	ven.radial_segments = 18
	ven.rings = 6
	_pon(ven, _mat(Color("49d2f2"), 0.15, 0.2, 0.9), Vector3(0.0, 0.046, 0.03), Vector3(0, 0, 90.0), g)
	for sx in [-1.0, 1.0]:
		_cil(0.0875, 0.0875, 0.022, Color("3b6fd1"), Vector3(sx * 0.105, 0.02, 0), Vector3(0, 0, 90.0), 0.4, 0.3, 22, g)
		_caja(Vector3(0.05, 0.04, 0.17), Color("3a3d46"), Vector3(sx * 0.12, -0.08, 0), Vector3.ZERO, 0.6, 0.2, g)
	_caja(Vector3(0.06, 0.07, 0.05), Color("3a3d46"), Vector3(0.23, -0.03, 0.05), Vector3.ZERO, 0.6, 0.2, g)
	_caja(Vector3(0.04, 0.026, 0.004), Color("7bf29a"), Vector3(0.23, -0.01, 0.076), Vector3.ZERO, 0.4, 0.0, g, 1.2)
	return 0.46


func _m_cena(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.01, 0), Vector3(38.0, 0, 0))
	_cil(0.15, 0.12, 0.016, Color("f4f4f6"), Vector3.ZERO, Vector3.ZERO, 0.25, 0.0, 28, g)
	_cil(0.108, 0.108, 0.018, Color("e1e4ea"), Vector3(0, 0.001, 0), Vector3.ZERO, 0.3, 0.0, 28, g)
	_bola(0.055, Color("8a4a2b"), Vector3(-0.02, 0.022, 0.01), Vector3(1.25, 0.36, 0.9), 0.7, 0.0, g)
	_caja(Vector3(0.08, 0.004, 0.008), Color("55281a"), Vector3(-0.02, 0.041, 0.0), Vector3(0, 30.0, 0), 0.7, 0.0, g)
	_caja(Vector3(0.08, 0.004, 0.008), Color("55281a"), Vector3(-0.02, 0.041, 0.02), Vector3(0, 30.0, 0), 0.7, 0.0, g)
	for p in [Vector3(0.06, 0.022, -0.03), Vector3(0.075, 0.02, 0.005), Vector3(0.052, 0.02, 0.04)]:
		_bola(0.02, Color("5aa845"), p, Vector3(1, 0.8, 1), 0.8, 0.0, g)
	_bola(0.016, Color("e0482a"), Vector3(0.03, 0.02, 0.062), Vector3.ONE, 0.4, 0.0, g)

	_caja(Vector3(0.012, 0.004, 0.2), ACERO, Vector3(0.185, 0.0, 0.0), Vector3.ZERO, 0.25, 0.9, g)
	_caja(Vector3(0.02, 0.004, 0.09), ACERO, Vector3(0.185, 0.0, -0.06), Vector3.ZERO, 0.25, 0.9, g)
	_caja(Vector3(0.01, 0.004, 0.2), ACERO, Vector3(-0.185, 0.0, 0.0), Vector3.ZERO, 0.25, 0.9, g)
	for k in 3:
		_caja(Vector3(0.005, 0.004, 0.05), ACERO, Vector3(-0.195 + float(k) * 0.01, 0.0, -0.11), Vector3.ZERO, 0.25, 0.9, g)
	return 0.42


func _m_pizarra(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(-8.0, 30.0, 0))
	_caja(Vector3(0.33, 0.23, 0.014), Color("c9ccd4"), Vector3.ZERO, Vector3.ZERO, 0.4, 0.5, g)
	_caja(Vector3(0.306, 0.206, 0.016), Color("2f8a4c"), Vector3(0, 0, 0.001), Vector3.ZERO, 0.8, 0.0, g)
	var raya: Color = Color("f4f4f6")
	var z: float = 0.0095
	_caja(Vector3(0.004, 0.206, 0.002), raya, Vector3(0, 0, z), Vector3.ZERO, 0.8, 0.0, g)
	_cil(0.034, 0.034, 0.002, raya, Vector3(0, 0, z), Vector3(90.0, 0, 0), 0.8, 0.0, 20, g)
	_cil(0.03, 0.03, 0.003, Color("2f8a4c"), Vector3(0, 0, z), Vector3(90.0, 0, 0), 0.8, 0.0, 20, g)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.004, 0.1, 0.002), raya, Vector3(sx * 0.11, 0, z), Vector3.ZERO, 0.8, 0.0, g)
		_caja(Vector3(0.044, 0.004, 0.002), raya, Vector3(sx * 0.131, 0.05, z), Vector3.ZERO, 0.8, 0.0, g)
		_caja(Vector3(0.044, 0.004, 0.002), raya, Vector3(sx * 0.131, -0.05, z), Vector3.ZERO, 0.8, 0.0, g)

	for p in [Vector2(-0.1, 0.05), Vector2(-0.07, -0.04), Vector2(-0.03, 0.02), Vector2(-0.12, -0.01)]:
		_cil(0.012, 0.012, 0.008, Color("3b6fd1"), Vector3(p.x, p.y, z + 0.004), Vector3(90.0, 0, 0), 0.4, 0.1, 12, g)
	for p in [Vector2(0.09, 0.04), Vector2(0.06, -0.05), Vector2(0.11, -0.02)]:
		_cil(0.012, 0.012, 0.008, Color("e0482a"), Vector3(p.x, p.y, z + 0.004), Vector3(90.0, 0, 0), 0.4, 0.1, 12, g)
	_caja(Vector3(0.09, 0.006, 0.002), Color("ffd23c"), Vector3(0.02, 0.045, z + 0.002), Vector3(0, 0, 24.0), 0.6, 0.0, g)

	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.012, 0.3, 0.012), Color("585d69"), Vector3(sx * 0.12, -0.09, -0.02), Vector3(8.0, 0, 0), 0.5, 0.5, g)
	return 0.44


func _m_jeringa(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0.0, 0.0, 0), Vector3(0, 0, -42.0))
	_cil(0.024, 0.024, 0.17, Color(0.92, 0.96, 1.0, 0.55), Vector3.ZERO, Vector3.ZERO, 0.1, 0.1, 18, g)
	_cil(0.02, 0.02, 0.09, Color("ff9a3c"), Vector3(0, 0.036, 0), Vector3.ZERO, 0.3, 0.0, 18, g, 0.4)
	_cil(0.021, 0.021, 0.012, Color("20222a"), Vector3(0, -0.012, 0), Vector3.ZERO, 0.6, 0.0, 14, g)
	for k in 5:
		_caja(Vector3(0.02, 0.003, 0.002), Color("20222a"), Vector3(0.0, -0.06 + float(k) * 0.028, 0.0245), Vector3.ZERO, 0.6, 0.0, g)
	_cil(0.044, 0.044, 0.008, Color("dfe3ea"), Vector3(0, -0.088, 0), Vector3.ZERO, 0.4, 0.0, 18, g)
	_cil(0.007, 0.007, 0.09, Color("dfe3ea"), Vector3(0, -0.134, 0), Vector3.ZERO, 0.4, 0.0, 10, g)
	_cil(0.03, 0.03, 0.01, Color("dfe3ea"), Vector3(0, -0.182, 0), Vector3.ZERO, 0.4, 0.0, 16, g)
	_cil(0.006, 0.014, 0.026, Color("1fa7b8"), Vector3(0, 0.098, 0), Vector3.ZERO, 0.4, 0.0, 12, g)
	_cil(0.0025, 0.0025, 0.09, ACERO, Vector3(0, 0.155, 0), Vector3.ZERO, 0.2, 0.95, 8, g)
	return 0.42




func _m_reloj(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(-12.0, 30.0, -14.0))
	var correa: Color = Color("3a2418")
	_caja(Vector3(0.076, 0.13, 0.012), correa, Vector3(0, 0.118, -0.012), Vector3(18.0, 0, 0), 0.6, 0.0, g)
	_caja(Vector3(0.076, 0.13, 0.012), correa, Vector3(0, -0.118, -0.012), Vector3(-18.0, 0, 0), 0.6, 0.0, g)
	_caja(Vector3(0.09, 0.016, 0.018), ORO, Vector3(0, -0.15, -0.018), Vector3(-18.0, 0, 0), 0.25, 0.9, g)
	_cil(0.078, 0.078, 0.03, ORO, Vector3.ZERO, Vector3(90.0, 0, 0), 0.22, 0.95, 28, g)
	_cil(0.064, 0.064, 0.032, Color("12244d"), Vector3(0, 0, 0.001), Vector3(90.0, 0, 0), 0.2, 0.3, 28, g)
	for k in 12:
		var a: float = TAU * float(k) / 12.0
		_caja(Vector3(0.004, 0.012 if k % 3 == 0 else 0.007, 0.002), Color("fff1b8"),
			Vector3(sin(a) * 0.054, cos(a) * 0.054, 0.018), Vector3(0, 0, - rad_to_deg(a)), 0.3, 0.8, g)
	_caja(Vector3(0.005, 0.04, 0.002), Color("fff1b8"), Vector3(0.0, 0.018, 0.019), Vector3.ZERO, 0.3, 0.8, g)
	_caja(Vector3(0.004, 0.03, 0.002), Color("fff1b8"), Vector3(0.011, -0.006, 0.019), Vector3(0, 0, -118.0), 0.3, 0.8, g)
	_cil(0.006, 0.006, 0.004, ORO, Vector3(0, 0, 0.02), Vector3(90.0, 0, 0), 0.3, 0.9, 10, g)
	_cil(0.01, 0.01, 0.016, ORO, Vector3(0.086, 0, 0), Vector3(0, 0, 90.0), 0.25, 0.9, 10, g)
	return 0.42


func _m_donacion(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.03, 0), Vector3(0, -26.0, 0))
	_caja(Vector3(0.2, 0.17, 0.15), Color("f1ead6"), Vector3.ZERO, Vector3.ZERO, 0.7, 0.0, g)
	_caja(Vector3(0.214, 0.026, 0.164), Color("d9cfae"), Vector3(0, 0.092, 0), Vector3.ZERO, 0.7, 0.0, g)
	_caja(Vector3(0.09, 0.004, 0.016), SUELA, Vector3(0, 0.106, 0), Vector3.ZERO, 0.9, 0.0, g)
	_cil(0.044, 0.044, 0.008, ORO, Vector3(0.0, 0.132, 0), Vector3(90.0, 90.0, 0), 0.25, 0.9, 20, g)

	var rojo: Color = Color("e0566a")
	var z: float = 0.076
	_bola(0.026, rojo, Vector3(-0.022, 0.012, z), Vector3(1, 1, 0.35), 0.5, 0.0, g)
	_bola(0.026, rojo, Vector3(0.022, 0.012, z), Vector3(1, 1, 0.35), 0.5, 0.0, g)
	_caja(Vector3(0.05, 0.05, 0.014), rojo, Vector3(0, -0.012, z), Vector3(0, 0, 45.0), 0.5, 0.0, g)
	return 0.38


func _m_coche(id: String, datos: Dictionary) -> float:


	var modelo: String = String(Shop.lifestyle_by_id(id).get("modelo", "deportivo"))
	preload("res://ui/shop_car.gd").new().montar(_raiz,
		String(datos.get("modelo", modelo)), float(datos.get("giro", -8.0)))
	return 0.46




func _m_camilla(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(0, -26.0, 0))
	_caja(Vector3(0.36, 0.034, 0.15), Color("2aa7a0"), Vector3(0, 0.03, 0), Vector3.ZERO, 0.6, 0.0, g)
	_caja(Vector3(0.09, 0.03, 0.13), Color("35c4bb"), Vector3(-0.16, 0.064, 0), Vector3(0, 0, -16.0), 0.6, 0.0, g)
	_caja(Vector3(0.34, 0.012, 0.134), Color("d5d9e0"), Vector3(0, 0.008, 0), Vector3.ZERO, 0.4, 0.6, g)
	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_caja(Vector3(0.014, 0.14, 0.014), ACERO, Vector3(sx * 0.15, -0.066, sz * 0.058), Vector3.ZERO, 0.3, 0.8, g)
		_caja(Vector3(0.01, 0.01, 0.12), ACERO, Vector3(sx * 0.15, -0.09, 0), Vector3.ZERO, 0.3, 0.8, g)

	_cil(0.026, 0.026, 0.11, Color("f4f4f6"), Vector3(0.09, 0.073, 0.0), Vector3(90.0, 0, 0), 0.9, 0.0, 14, g)
	_cil(0.016, 0.018, 0.05, Color("ffb648"), Vector3(-0.02, 0.072, 0.03), Vector3.ZERO, 0.2, 0.1, 12, g)
	_cil(0.008, 0.008, 0.016, SUELA, Vector3(-0.02, 0.104, 0.03), Vector3.ZERO, 0.5, 0.0, 10, g)
	return 0.42





func _m_chef(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0.03, -0.05, 0), Vector3(0, -26.0, 0))

	_cil(0.165, 0.15, 0.018, Color("9a6a3e"), Vector3.ZERO, Vector3.ZERO, 0.7, 0.0, 28, g)


	_cil(0.13, 0.13, 0.008, ACERO, Vector3(0, 0.011, 0), Vector3.ZERO, 0.2, 0.9, 28, g)
	_cil(0.085, 0.125, 0.06, ACERO, Vector3(0, 0.044, 0), Vector3.ZERO, 0.18, 0.9, 28, g)
	_bola(0.086, ACERO, Vector3(0, 0.074, 0), Vector3(1.0, 0.62, 1.0), 0.18, 0.9, g)
	_cil(0.006, 0.006, 0.016, ACERO, Vector3(0, 0.132, 0), Vector3.ZERO, 0.25, 0.9, 10, g)
	_bola(0.017, ACERO, Vector3(0, 0.146, 0), Vector3(1.0, 0.8, 1.0), 0.2, 0.9, g)

	var blanco: Color = Color("fbfbfd")
	var t: Node3D = _grupo(Vector3(-0.215, 0.03, -0.04), Vector3(0, 0, 8.0), g)
	_cil(0.058, 0.056, 0.06, blanco, Vector3.ZERO, Vector3.ZERO, 0.9, 0.0, 20, t)
	_bola(0.074, blanco, Vector3(0, 0.074, 0), Vector3(1.0, 0.72, 1.0), 0.95, 0.0, t)
	for k in 6:
		var a: float = TAU * float(k) / 6.0
		_bola(0.036, blanco, Vector3(cos(a) * 0.048, 0.064, sin(a) * 0.048),
			Vector3.ONE, 0.95, 0.0, t)
	return 0.42




func _m_nutricionista(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0.02, -0.04, 0), Vector3(0, -24.0, 0))

	var t: Node3D = _grupo(Vector3(0.03, 0.0, -0.02), Vector3(-62.0, 0, 0), g)
	_caja(Vector3(0.2, 0.27, 0.01), Color("9a6a3e"), Vector3.ZERO, Vector3.ZERO, 0.7, 0.0, t)
	_caja(Vector3(0.17, 0.225, 0.004), Color("f7f5f0"), Vector3(0, -0.012, 0.007), Vector3.ZERO, 0.9, 0.0, t)
	for k in 5:
		_caja(Vector3(0.12 - float(k % 2) * 0.03, 0.008, 0.002), Color("8a949a"),
			Vector3(-0.012, 0.06 - float(k) * 0.034, 0.01), Vector3.ZERO, 0.8, 0.0, t)
	_caja(Vector3(0.08, 0.028, 0.018), ACERO, Vector3(0, 0.128, 0.012), Vector3.ZERO, 0.25, 0.9, t)

	var m: Node3D = _grupo(Vector3(-0.175, 0.02, 0.06), Vector3.ZERO, g)
	_bola(0.062, Color("7cc242"), Vector3.ZERO, Vector3(1.0, 0.9, 1.0), 0.45, 0.0, m)
	_cil(0.005, 0.006, 0.03, Color("5a3a1e"), Vector3(0, 0.062, 0), Vector3(0, 0, 10.0), 0.8, 0.0, 8, m)
	_bola(0.018, Color("3f8a2a"), Vector3(0.018, 0.07, 0), Vector3(1.0, 0.35, 0.6), 0.6, 0.0, m)

	_cil(0.05, 0.05, 0.026, Color("f2c94c"), Vector3(0.15, -0.03, 0.11), Vector3.ZERO, 0.5, 0.0, 24, g)
	_cil(0.018, 0.018, 0.028, Color("c79a2a"), Vector3(0.15, -0.03, 0.11), Vector3.ZERO, 0.5, 0.0, 16, g)
	_caja(Vector3(0.09, 0.004, 0.018), Color("f2c94c"), Vector3(0.08, -0.041, 0.15), Vector3(0, 30.0, 0), 0.5, 0.0, g)
	return 0.44



func _m_entrenador(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0.0, -0.03, 0), Vector3(0, -20.0, 0))

	var c: Node3D = _grupo(Vector3(0.08, 0.03, 0), Vector3(62.0, 0, 0), g)
	_cil(0.11, 0.11, 0.034, ACERO, Vector3.ZERO, Vector3.ZERO, 0.25, 0.9, 32, c)
	_cil(0.094, 0.094, 0.036, Color("f7f5f0"), Vector3.ZERO, Vector3.ZERO, 0.8, 0.0, 32, c)
	for k in 12:
		var a: float = TAU * float(k) / 12.0
		_caja(Vector3(0.006, 0.004, 0.016 if k % 3 == 0 else 0.009), Color("20222a"),
			Vector3(sin(a) * 0.08, 0.019, cos(a) * 0.08), Vector3(0, rad_to_deg(a), 0), 0.8, 0.0, c)
	_caja(Vector3(0.005, 0.004, 0.07), Color("c1121f"), Vector3(0.012, 0.021, -0.028), Vector3(0, 25.0, 0), 0.6, 0.0, c)
	_cil(0.014, 0.014, 0.03, ACERO, Vector3(0, 0, -0.124), Vector3(90.0, 0, 0), 0.25, 0.9, 12, c)
	_cil(0.022, 0.022, 0.012, ACERO, Vector3(0, 0, -0.145), Vector3(90.0, 0, 0), 0.25, 0.9, 12, c)



	var s: Node3D = _grupo(Vector3(-0.16, -0.005, 0.07), Vector3(0, 12.0, 0), g)
	_cil(0.042, 0.042, 0.04, ACERO, Vector3.ZERO, Vector3(90.0, 0, 0), 0.2, 0.95, 24, s)
	_caja(Vector3(0.08, 0.03, 0.04), ACERO, Vector3(0.052, 0.027, 0), Vector3.ZERO, 0.2, 0.95, s)
	_caja(Vector3(0.022, 0.01, 0.042), Color("20222a"), Vector3(0.018, 0.043, 0), Vector3.ZERO, 0.8, 0.0, s)
	_cil(0.012, 0.012, 0.01, ACERO, Vector3(-0.04, 0.03, 0), Vector3(90.0, 0, 0), 0.3, 0.9, 12, s)
	for k in 9:
		var a2: float = PI * 0.95 + PI * 1.3 * float(k) / 8.0
		_cil(0.007, 0.007, 0.042, Color("c1121f"),
			Vector3(-0.14 + cos(a2) * 0.085, -0.04, 0.15 + sin(a2) * 0.05),
			Vector3(90.0, rad_to_deg(- a2), 0), 0.8, 0.0, 8, g)
	return 0.44


func _m_clinica(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.03, 0), Vector3(0, -30.0, 0))
	_caja(Vector3(0.3, 0.2, 0.2), Color("eef1f6"), Vector3.ZERO, Vector3.ZERO, 0.7, 0.0, g)
	_caja(Vector3(0.32, 0.022, 0.22), Color("3b6fd1"), Vector3(0, 0.11, 0), Vector3.ZERO, 0.5, 0.1, g)
	_caja(Vector3(0.34, 0.016, 0.24), Color("585d69"), Vector3(0, -0.106, 0), Vector3.ZERO, 0.8, 0.0, g)
	var z: float = 0.101
	_caja(Vector3(0.056, 0.1, 0.006), Color("20304f"), Vector3(0, -0.05, z), Vector3.ZERO, 0.2, 0.3, g)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.06, 0.05, 0.006), Color("7fd8f2"), Vector3(sx * 0.095, -0.03, z), Vector3.ZERO, 0.2, 0.0, g, 0.8)
		_caja(Vector3(0.06, 0.04, 0.006), Color("7fd8f2"), Vector3(sx * 0.095, 0.05, z), Vector3.ZERO, 0.2, 0.0, g, 0.8)
	for k in 2:
		_caja(Vector3(0.006, 0.04, 0.05), Color("7fd8f2"), Vector3(0.151, 0.04, -0.04 + float(k) * 0.08), Vector3.ZERO, 0.2, 0.0, g, 0.8)

	_caja(Vector3(0.09, 0.09, 0.012), Color("f4f4f6"), Vector3(0, 0.17, 0.06), Vector3.ZERO, 0.6, 0.0, g)
	_caja(Vector3(0.06, 0.02, 0.016), Color("1fa7b8"), Vector3(0, 0.17, 0.06), Vector3.ZERO, 0.5, 0.0, g, 0.5)
	_caja(Vector3(0.02, 0.06, 0.016), Color("1fa7b8"), Vector3(0, 0.17, 0.06), Vector3.ZERO, 0.5, 0.0, g, 0.5)
	return 0.46


func _m_monitor(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.02, 0), Vector3(-4.0, 30.0, 0))
	_caja(Vector3(0.34, 0.21, 0.018), Color("20222a"), Vector3.ZERO, Vector3.ZERO, 0.4, 0.3, g)
	_caja(Vector3(0.318, 0.188, 0.004), Color("10305a"), Vector3(0, 0, 0.0095), Vector3.ZERO, 0.2, 0.0, g, 0.7)
	var z: float = 0.0125

	_caja(Vector3(0.14, 0.15, 0.002), Color("2f8a4c"), Vector3(-0.075, 0.0, z), Vector3.ZERO, 0.5, 0.0, g, 0.5)
	_caja(Vector3(0.003, 0.15, 0.003), Color("f4f4f6"), Vector3(-0.075, 0.0, z + 0.001), Vector3.ZERO, 0.5, 0.0, g, 0.6)
	_caja(Vector3(0.05, 0.07, 0.003), Color("f4f4f6"), Vector3(-0.122, 0.0, z + 0.001), Vector3.ZERO, 0.5, 0.0, g, 0.6)
	_caja(Vector3(0.044, 0.064, 0.004), Color("2f8a4c"), Vector3(-0.12, 0.0, z + 0.001), Vector3.ZERO, 0.5, 0.0, g, 0.5)
	for p in [Vector2(-0.05, 0.04), Vector2(-0.09, -0.03), Vector2(-0.03, -0.04)]:
		_cil(0.008, 0.008, 0.004, Color("ffd23c"), Vector3(p.x, p.y, z + 0.002), Vector3(90.0, 0, 0), 0.4, 0.0, 10, g, 1.0)
	var alturas: Array = [0.04, 0.07, 0.055, 0.1, 0.125]
	for k in alturas.size():
		var h: float = float(alturas[k])
		_caja(Vector3(0.018, h, 0.003), Color("49d2f2"), Vector3(0.02 + float(k) * 0.028, -0.075 + h * 0.5, z), Vector3.ZERO, 0.4, 0.0, g, 1.1)
	_caja(Vector3(0.03, 0.08, 0.016), Color("585d69"), Vector3(0, -0.14, -0.01), Vector3.ZERO, 0.4, 0.6, g)
	_caja(Vector3(0.15, 0.012, 0.09), Color("585d69"), Vector3(0, -0.182, 0.0), Vector3.ZERO, 0.4, 0.6, g)
	return 0.46




func _m_maletin(id: String, _d: Dictionary) -> float:
	var nivel: int = clampi(int(id.substr(2)), 1, 4)
	var pieles: Array = [Color("8a5a35"), Color("23252d"), Color("aeb4c0"), ORO]
	var col: Color = pieles[nivel - 1]
	var metal: float = float([0.0, 0.1, 0.85, 0.9][nivel - 1])
	var rough: float = float([0.6, 0.45, 0.3, 0.25][nivel - 1])
	var herraje: Color = ACERO if nivel == 4 else ORO
	var g: Node3D = _grupo(Vector3(-0.02 if nivel > 1 else 0.0, 0.0, 0), Vector3(0, -24.0, 0))
	_caja(Vector3(0.3, 0.19, 0.08), col, Vector3.ZERO, Vector3.ZERO, rough, metal, g)
	_caja(Vector3(0.304, 0.008, 0.084), col.darkened(0.45), Vector3(0, 0.03, 0), Vector3.ZERO, rough, metal, g)
	for sx in [-1.0, 1.0]:
		_caja(Vector3(0.03, 0.036, 0.01), herraje, Vector3(sx * 0.085, 0.03, 0.042), Vector3.ZERO, 0.25, 0.9, g)
		_caja(Vector3(0.012, 0.036, 0.012), col.darkened(0.3), Vector3(sx * 0.046, 0.112, 0), Vector3.ZERO, rough, metal, g)
		_caja(Vector3(0.036, 0.036, 0.086), col.darkened(0.3), Vector3(sx * 0.134, -0.079, 0), Vector3.ZERO, rough, metal, g)
	_caja(Vector3(0.104, 0.014, 0.016), col.darkened(0.3), Vector3(0, 0.134, 0), Vector3.ZERO, rough, metal, g)
	for k in nivel - 1:
		_pila_monedas(g, Vector3(0.2 + float(k % 2) * 0.03, -0.095, 0.06 - float(k) * 0.06), 4 + k * 3)
	return 0.42


func _m_contrato(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(-14.0, 26.0, -6.0))
	_caja(Vector3(0.25, 0.33, 0.006), Color("f6f1e2"), Vector3.ZERO, Vector3.ZERO, 0.85, 0.0, g)
	_caja(Vector3(0.25, 0.33, 0.006), Color("e6dfca"), Vector3(0.012, -0.01, -0.008), Vector3(0, 0, 3.0), 0.85, 0.0, g)
	_caja(Vector3(0.15, 0.016, 0.002), Color("20222a"), Vector3(-0.03, 0.13, 0.004), Vector3.ZERO, 0.8, 0.0, g)
	for k in 6:
		_caja(Vector3(0.2 if k % 3 != 2 else 0.13, 0.007, 0.002), Color("8d929e"),
			Vector3(0.0 if k % 3 != 2 else -0.035, 0.09 - float(k) * 0.028, 0.004), Vector3.ZERO, 0.8, 0.0, g)

	_caja(Vector3(0.09, 0.005, 0.002), Color("1b3f9c"), Vector3(-0.05, -0.105, 0.004), Vector3(0, 0, 9.0), 0.6, 0.0, g)
	_caja(Vector3(0.04, 0.005, 0.002), Color("1b3f9c"), Vector3(-0.01, -0.112, 0.004), Vector3(0, 0, -20.0), 0.6, 0.0, g)
	_cil(0.034, 0.034, 0.01, ORO, Vector3(0.075, -0.105, 0.008), Vector3(90.0, 0, 0), 0.25, 0.9, 16, g)
	_cil(0.022, 0.022, 0.012, Color("fff1b8"), Vector3(0.075, -0.105, 0.01), Vector3(90.0, 0, 0), 0.25, 0.9, 5, g)
	var pl: Node3D = _grupo(Vector3(0.06, 0.01, 0.03), Vector3(0, 0, -38.0), g)
	_cil(0.009, 0.009, 0.2, Color("14161c"), Vector3.ZERO, Vector3.ZERO, 0.3, 0.4, 10, pl)
	_cil(0.001, 0.009, 0.036, ORO, Vector3(0, -0.118, 0), Vector3.ZERO, 0.25, 0.9, 10, pl)
	_cil(0.0095, 0.0095, 0.012, ORO, Vector3(0, 0.03, 0), Vector3.ZERO, 0.25, 0.9, 10, pl)
	return 0.46



func _m_llave(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0.0, 0.0, 0), Vector3(-6.0, 26.0, -40.0))
	var aro: TorusMesh = TorusMesh.new()
	aro.inner_radius = 0.042
	aro.outer_radius = 0.074
	aro.rings = 24
	aro.ring_segments = 12
	_pon(aro, _mat(ORO, 0.22, 0.95), Vector3(0, 0.13, 0), Vector3(90.0, 0, 0), g)
	_cil(0.016, 0.016, 0.25, ORO, Vector3(0, -0.06, 0), Vector3.ZERO, 0.22, 0.95, 14, g)
	_cil(0.024, 0.024, 0.016, ORO, Vector3(0, 0.06, 0), Vector3.ZERO, 0.22, 0.95, 14, g)
	_caja(Vector3(0.06, 0.026, 0.018), ORO, Vector3(0.036, -0.16, 0), Vector3.ZERO, 0.22, 0.95, g)
	_caja(Vector3(0.042, 0.022, 0.018), ORO, Vector3(0.028, -0.118, 0), Vector3.ZERO, 0.22, 0.95, g)
	_gema(g, Vector3(0, 0.13, 0.0), 0.026, Color("ff5d7a"))
	return 0.46









func _m_doble_paga(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -10.0, 0))
	const PISOS: int = 4
	for lado in [-1.0, 1.0]:
		var torre: Node3D = _grupo(Vector3(float(lado) * 0.082, 0.0, -0.03 * float(lado)),
			Vector3.ZERO, g)
		for p in PISOS:
			_fajo(torre, Vector3(0.0, 0.015 + float(p) * 0.031, 0.0), _azar.randf_range(-4.0, 4.0))
		_lingote(torre, Vector3(0.0, 0.015 + float(PISOS) * 0.031, 0.0), 0.0)
	_al_suelo = true
	_ocupa = 0.94
	g.position.y = -0.09
	return 0.46









func _m_doble_xp(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -10.0, 0))
	for lado in [-1.0, 1.0]:
		var r: Node3D = _grupo(Vector3(float(lado) * 0.088, 0.0, -0.03 * float(lado)),
			Vector3.ZERO, g)
		_cil(0.05, 0.064, 0.026, SUELA.lightened(0.16), Vector3(0, 0.013, 0), Vector3.ZERO,
			0.9, 0.0, 9, r)
		_cristal(r, Vector3(0.0, 0.02, 0.0), 0.03, 0.15, Vector3(0, 0, 0))
		_cristal(r, Vector3(-0.03, 0.02, 0.01), 0.021, 0.09, Vector3(8.0, 0, 24.0))
		_cristal(r, Vector3(0.032, 0.02, -0.006), 0.019, 0.075, Vector3(-6.0, 0, -22.0))
		_gema(r, Vector3(0.01, 0.04, 0.05), 0.016)
	_al_suelo = true
	_ocupa = 0.94
	g.position.y = -0.09
	return 0.46







func _m_pack_leyenda(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -10.0, 0))
	_caja(Vector3(0.33, 0.024, 0.12), SUELA.lightened(0.12), Vector3(0, 0.012, 0),
		Vector3.ZERO, 0.85, 0.0, g)
	_caja(Vector3(0.336, 0.008, 0.126), BRONCE, Vector3(0, 0.026, 0), Vector3.ZERO, 0.3, 0.9, g)
	var torre: Node3D = _grupo(Vector3(-0.08, 0.03, 0.0), Vector3.ZERO, g)
	const PISOS: int = 4
	for p in PISOS:
		_fajo(torre, Vector3(0.0, 0.015 + float(p) * 0.031, 0.0), _azar.randf_range(-4.0, 4.0))
	_lingote(torre, Vector3(0.0, 0.015 + float(PISOS) * 0.031, 0.0), 0.0)
	var r: Node3D = _grupo(Vector3(0.084, 0.03, 0.0), Vector3.ZERO, g)
	_cristal(r, Vector3(0.0, 0.0, 0.0), 0.03, 0.15, Vector3(0, 0, 0))
	_cristal(r, Vector3(-0.03, 0.0, 0.01), 0.021, 0.09, Vector3(8.0, 0, 24.0))
	_cristal(r, Vector3(0.032, 0.0, -0.006), 0.019, 0.075, Vector3(-6.0, 0, -22.0))
	_gema(r, Vector3(0.01, 0.02, 0.044), 0.016)
	_al_suelo = true
	_ocupa = 0.94
	g.position.y = -0.09
	return 0.46







func _m_cuarta_ranura(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -8.0, 0))
	const ALTO: float = 0.15
	const ANCHO: float = 0.102
	var franjas: Array = [Color("3aa7c9"), Color("d46a9e"), Color("6a8fd6")]
	for k in 4:
		var abre: float =(float(k) - 1.5) * 15.0

		var pie: Node3D = _grupo(Vector3((float(k) - 1.5) * 0.04, 0.0, float(k) * 0.01),
			Vector3(0, 0, - abre), g)
		var nueva: bool = k == 3
		var cuerpo: Color = RANURA if nueva else Color("2b3242")
		_caja(Vector3(ANCHO, ALTO, 0.007), cuerpo, Vector3(0, ALTO * 0.5, 0), Vector3.ZERO,
			0.45, 0.0, pie, 0.35 if nueva else 0.0)
		if nueva:

			_caja(Vector3(0.05, 0.013, 0.004), Color.WHITE, Vector3(0, ALTO * 0.52, 0.0055),
				Vector3.ZERO, 0.4, 0.0, pie, 0.6)
			_caja(Vector3(0.013, 0.05, 0.004), Color.WHITE, Vector3(0, ALTO * 0.52, 0.0055),
				Vector3.ZERO, 0.4, 0.0, pie, 0.6)
		else:

			_caja(Vector3(ANCHO, 0.028, 0.004), franjas[k], Vector3(0, ALTO - 0.02, 0.0055),
				Vector3.ZERO, 0.5, 0.0, pie, 0.25)
			for f in 2:
				_caja(Vector3(ANCHO *(0.62 - 0.18 * float(f)), 0.01, 0.004), ACERO.darkened(0.25),
					Vector3(- ANCHO * 0.12, ALTO * 0.5 - float(f) * 0.024, 0.0055),
					Vector3.ZERO, 0.6, 0.0, pie)
	_al_suelo = true
	_ocupa = 0.9
	g.position.y = -0.09
	return 0.46




func _cristal(padre: Node3D, pos: Vector3, r: float, h: float, rot: Vector3) -> void:
	var c: Node3D = _grupo(pos, rot, padre)
	_cil(r, r * 1.08, h, GEMA, Vector3(0, h * 0.5, 0), Vector3.ZERO, 0.12, 0.35, 6, c, 0.5)
	_cil(0.0, r, r * 1.7, GEMA.lightened(0.22), Vector3(0, h + r * 0.85, 0), Vector3.ZERO,
		0.12, 0.35, 6, c, 0.62)






func _estrella(padre: Node3D, pos: Vector3, r: float, col: Color, rot: Vector3 = Vector3.ZERO,
		grosor: float = 0.014) -> void:
	var st: SurfaceTool = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	var pts: Array = []
	for k in 10:
		var a: float = - PI / 2.0 + TAU * float(k) / 10.0
		var rr: float = r if k % 2 == 0 else r * 0.42
		pts.append(Vector2(cos(a) * rr, sin(a) * rr))
	for lado in [1.0, -1.0]:
		var z: float = grosor * 0.5 * lado
		for k in 10:
			var a: Vector2 = pts[k]
			var b: Vector2 = pts[(k + 1) % 10]
			st.set_normal(Vector3(0, 0, lado))
			if lado > 0.0:
				st.add_vertex(Vector3(0, 0, z));st.add_vertex(Vector3(b.x, b.y, z));st.add_vertex(Vector3(a.x, a.y, z))
			else:
				st.add_vertex(Vector3(0, 0, z));st.add_vertex(Vector3(a.x, a.y, z));st.add_vertex(Vector3(b.x, b.y, z))

	for k in 10:
		var a: Vector2 = pts[k]
		var b: Vector2 = pts[(k + 1) % 10]
		var n3: Vector3 = Vector3(b.y - a.y, a.x - b.x, 0).normalized()
		var zf: float = grosor * 0.5
		st.set_normal(n3)
		st.add_vertex(Vector3(a.x, a.y, zf));st.add_vertex(Vector3(b.x, b.y, - zf));st.add_vertex(Vector3(b.x, b.y, zf))
		st.add_vertex(Vector3(a.x, a.y, zf));st.add_vertex(Vector3(a.x, a.y, - zf));st.add_vertex(Vector3(b.x, b.y, - zf))
	_pon(st.commit(), _mat(col, 0.22, 0.95), pos, rot, padre)




func _m_estrellas(cuanto: int) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -16.0, 0))
	var t: float = clampf(log(maxf(float(cuanto), 150.0) / 150.0) / log(2800.0 / 150.0), 0.0, 1.0)
	var n: int = 3 + int(round(t * 9.0))
	var bronce: Color = Color("c98a3a")
	_cil(0.19, 0.2, 0.028, Color("2b2f3a"), Vector3(0, 0.014, 0), Vector3.ZERO, 0.4, 0.4, 28, g)
	_cil(0.175, 0.175, 0.006, bronce, Vector3(0, 0.031, 0), Vector3.ZERO, 0.25, 0.9, 28, g)

	for k in n:
		var a: float = TAU * float(k) / float(n) + 0.4
		var rad: float = 0.1 + 0.04 * float(k % 2)
		var r: float = 0.03 + 0.012 * float(k % 3)
		_estrella(g, Vector3(cos(a) * rad, 0.034 + r * 0.5 + float(k % 2) * 0.01, sin(a) * rad), r,
			ORO if k % 3 else ORO.lightened(0.15), Vector3(-90.0 + _azar.randf_range(-14.0, 14.0), rad_to_deg(a), 0))
	var grande: float = lerpf(0.075, 0.115, t)
	_estrella(g, Vector3(0, 0.034 + grande, 0), grande, ORO, Vector3(0, 20.0, 0), 0.026)
	_al_suelo = true
	_ocupa = lerpf(0.72, 1.0, t)
	g.position.y = -0.14
	return maxf(ALTO_MIN, 0.36 + grande * 1.6)



func _m_solar(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.04, 0), Vector3(0, -28.0, 0))
	_caja(Vector3(0.36, 0.04, 0.3), Color("5a3d24"), Vector3(0, -0.02, 0), Vector3.ZERO, 0.9, 0.0, g)
	_caja(Vector3(0.36, 0.016, 0.3), Color("4f8d3a"), Vector3(0, 0.008, 0), Vector3.ZERO, 0.85, 0.0, g)

	for sx in [-1.0, 1.0]:
		for sz in [-1.0, 1.0]:
			_cil(0.008, 0.008, 0.07, Color("c9b48a"), Vector3(sx * 0.165, 0.045, sz * 0.135), Vector3.ZERO, 0.8, 0.0, 8, g)
	_caja(Vector3(0.33, 0.004, 0.004), FAJA, Vector3(0, 0.07, 0.135), Vector3.ZERO, 0.8, 0.0, g)
	_caja(Vector3(0.33, 0.004, 0.004), FAJA, Vector3(0, 0.07, -0.135), Vector3.ZERO, 0.8, 0.0, g)
	_caja(Vector3(0.004, 0.004, 0.27), FAJA, Vector3(0.165, 0.07, 0), Vector3.ZERO, 0.8, 0.0, g)
	_caja(Vector3(0.004, 0.004, 0.27), FAJA, Vector3(-0.165, 0.07, 0), Vector3.ZERO, 0.8, 0.0, g)

	_cil(0.007, 0.007, 0.13, Color("8a6a44"), Vector3(-0.1, 0.075, 0.09), Vector3.ZERO, 0.8, 0.0, 8, g)
	_caja(Vector3(0.11, 0.06, 0.008), FAJA, Vector3(-0.1, 0.14, 0.092), Vector3(0, 8.0, 0), 0.7, 0.0, g)
	_caja(Vector3(0.07, 0.008, 0.002), Color("d94a4a"), Vector3(-0.1, 0.146, 0.097), Vector3(0, 8.0, 0), 0.7, 0.0, g)
	_caja(Vector3(0.05, 0.006, 0.002), SUELA, Vector3(-0.1, 0.13, 0.097), Vector3(0, 8.0, 0), 0.7, 0.0, g)

	_cil(0.014, 0.018, 0.11, Color("6b4a2a"), Vector3(0.1, 0.07, -0.07), Vector3.ZERO, 0.8, 0.0, 10, g)
	_bola(0.07, Color("3f7a2f"), Vector3(0.1, 0.165, -0.07), Vector3(1, 0.9, 1), 0.85, 0.0, g)
	_bola(0.048, Color("4c8f38"), Vector3(0.135, 0.19, -0.045), Vector3.ONE, 0.85, 0.0, g)
	_bola(0.044, Color("3a7030"), Vector3(0.065, 0.195, -0.1), Vector3.ONE, 0.85, 0.0, g)
	return 0.46




func _m_balon(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(-10.0, 24.0, 0))
	var r: float = 0.15
	_bola(r, Color("f2f2ee"), Vector3.ZERO, Vector3.ONE, 0.45, 0.0, g)
	var phi: float =(1.0 + sqrt(5.0)) / 2.0
	var dirs: Array = []
	for a in [-1.0, 1.0]:
		for b in [-1.0, 1.0]:
			dirs.append(Vector3(0, a, b * phi).normalized())
			dirs.append(Vector3(a, b * phi, 0).normalized())
			dirs.append(Vector3(b * phi, 0, a).normalized())
	for d in dirs:
		var pos: Vector3 =(d as Vector3) *(r * 0.985)
		var cm: CylinderMesh = CylinderMesh.new()
		cm.top_radius = 0.052
		cm.bottom_radius = 0.052
		cm.height = 0.01
		cm.radial_segments = 5
		var mi: MeshInstance3D = _pon(cm, _mat(Color("1b1d24"), 0.5, 0.0), pos, Vector3.ZERO, g)

		var up: Vector3 = d as Vector3
		var ref: Vector3 = Vector3.RIGHT if absf(up.dot(Vector3.RIGHT)) < 0.9 else Vector3.FORWARD
		var x: Vector3 = ref.cross(up).normalized()
		var z: Vector3 = up.cross(x).normalized()
		mi.transform.basis = Basis(x, up, z)
	return 0.42




func _m_camiseta(id: String, _d: Dictionary) -> float:
	var sel: bool = id == "camiseta_seleccion"
	var col: Color = Color("1f4fb0") if sel else Color("c9302c")
	var vivo: Color = ORO if sel else Color("f2f2ee")
	var g: Node3D = _grupo(Vector3(0, -0.01, 0), Vector3(0, 18.0, 0))
	_caja(Vector3(0.22, 0.26, 0.06), col, Vector3.ZERO, Vector3.ZERO, 0.75, 0.0, g)
	_caja(Vector3(0.09, 0.09, 0.058), col, Vector3(-0.148, 0.085, 0), Vector3(0, 0, 28.0), 0.75, 0.0, g)
	_caja(Vector3(0.09, 0.09, 0.058), col, Vector3(0.148, 0.085, 0), Vector3(0, 0, -28.0), 0.75, 0.0, g)
	_caja(Vector3(0.024, 0.09, 0.06), vivo, Vector3(-0.182, 0.07, 0), Vector3(0, 0, 28.0), 0.75, 0.0, g)
	_caja(Vector3(0.024, 0.09, 0.06), vivo, Vector3(0.182, 0.07, 0), Vector3(0, 0, -28.0), 0.75, 0.0, g)
	_caja(Vector3(0.1, 0.018, 0.064), vivo, Vector3(0, 0.126, 0), Vector3.ZERO, 0.75, 0.0, g)
	_caja(Vector3(0.01, 0.04, 0.064), vivo, Vector3(-0.03, 0.1, 0), Vector3(0, 0, 25.0), 0.75, 0.0, g)
	_caja(Vector3(0.01, 0.04, 0.064), vivo, Vector3(0.03, 0.1, 0), Vector3(0, 0, -25.0), 0.75, 0.0, g)
	if sel:
		_caja(Vector3(0.036, 0.262, 0.002), vivo, Vector3(0.0, 0.0, 0.031), Vector3(0, 0, 22.0), 0.7, 0.0, g)
	else:

		_caja(Vector3(0.016, 0.08, 0.003), vivo, Vector3(-0.034, -0.02, 0.031), Vector3.ZERO, 0.7, 0.0, g)
		for e in [[Vector3(0.05, 0.014, 0.003), Vector3(0.026, 0.017, 0.031)],
				[Vector3(0.05, 0.014, 0.003), Vector3(0.026, -0.057, 0.031)],
				[Vector3(0.014, 0.078, 0.003), Vector3(0.008, -0.02, 0.031)],
				[Vector3(0.014, 0.078, 0.003), Vector3(0.044, -0.02, 0.031)]]:
			_caja(e[0], vivo, e[1], Vector3.ZERO, 0.7, 0.0, g)
	return 0.42



func _m_bufanda(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, 0.0, 0), Vector3(-30.0, -20.0, 0))
	var a: Color = Color("c9302c")
	var b: Color = Color("f2f2ee")

	for tramo in [[Vector3(-0.055, 0, 0), 10.0], [Vector3(0.055, 0, 0.012), -10.0]]:
		var t: Node3D = _grupo(tramo[0], Vector3(0, 0, float(tramo[1])), g)
		for k in 7:
			_caja(Vector3(0.08, 0.058, 0.018), a if k % 2 == 0 else b,
				Vector3(0, 0.174 - float(k) * 0.058, 0), Vector3.ZERO, 0.85, 0.0, t)
		for f in 5:
			_caja(Vector3(0.008, 0.03, 0.008), a, Vector3(-0.03 + float(f) * 0.015, -0.045, 0), Vector3.ZERO, 0.85, 0.0, t)
	return 0.44



func _m_trofeo(_id: String, _d: Dictionary) -> float:
	var g: Node3D = _grupo(Vector3(0, -0.02, 0), Vector3(0, -22.0, 0))
	_caja(Vector3(0.2, 0.04, 0.2), Color("1b1d24"), Vector3(0, -0.19, 0), Vector3.ZERO, 0.35, 0.3, g)
	_caja(Vector3(0.09, 0.022, 0.004), ORO, Vector3(0, -0.19, 0.102), Vector3.ZERO, 0.25, 0.9, g)
	_cil(0.026, 0.062, 0.03, ORO, Vector3(0, -0.155, 0), Vector3.ZERO, 0.22, 0.95, 20, g)
	_cil(0.016, 0.016, 0.07, ORO, Vector3(0, -0.105, 0), Vector3.ZERO, 0.22, 0.95, 12, g)
	_cil(0.03, 0.012, 0.03, ORO, Vector3(0, -0.06, 0), Vector3.ZERO, 0.22, 0.95, 20, g)
	_cil(0.11, 0.04, 0.19, ORO, Vector3(0, 0.05, 0), Vector3.ZERO, 0.22, 0.95, 24, g)
	_cil(0.114, 0.114, 0.014, ORO.lightened(0.15), Vector3(0, 0.15, 0), Vector3.ZERO, 0.22, 0.95, 24, g)
	for sx in [-1.0, 1.0]:
		var asa: TorusMesh = TorusMesh.new()
		asa.inner_radius = 0.036
		asa.outer_radius = 0.052
		asa.rings = 20
		asa.ring_segments = 10
		_pon(asa, _mat(ORO, 0.22, 0.95), Vector3(sx * 0.13, 0.06, 0), Vector3(0, 0, 0), g)
	_estrella(g, Vector3(0, 0.055, 0.106), 0.036, ORO.lightened(0.25), Vector3.ZERO, 0.006)
	return 0.48





func _fajo(padre: Node3D, pos: Vector3, giro: float, vuelco: float = 0.0) -> void:
	var f: Node3D = _grupo(pos, Vector3(0, giro, vuelco), padre)
	_caja(Vector3(0.11, 0.03, 0.052), BILLETE, Vector3.ZERO, Vector3.ZERO, 0.8, 0.0, f)
	_caja(Vector3(0.024, 0.031, 0.053), FAJA, Vector3.ZERO, Vector3.ZERO, 0.8, 0.0, f)


func _pila_monedas(padre: Node3D, base: Vector3, n: int) -> void:
	for k in n:
		_cil(0.026, 0.026, 0.009, ORO if k % 2 == 0 else ORO.lightened(0.18),
			base + Vector3(_azar.randf_range(-0.003, 0.003), 0.005 + float(k) * 0.0092,
			_azar.randf_range(-0.003, 0.003)), Vector3.ZERO, 0.25, 0.9, 14, padre)


func _lingote(padre: Node3D, pos: Vector3, giro: float) -> void:
	var l: Node3D = _grupo(pos, Vector3(0, giro, 0), padre)
	_caja(Vector3(0.112, 0.03, 0.052), ORO, Vector3.ZERO, Vector3.ZERO, 0.2, 0.95, l)
	_caja(Vector3(0.094, 0.01, 0.038), ORO.lightened(0.2), Vector3(0, 0.02, 0), Vector3.ZERO, 0.2, 0.95, l)



func _gema(padre: Node3D, pos: Vector3, r: float, col: Color = GEMA,
		giro: Vector3 = Vector3.ZERO) -> void:
	var gm: Node3D = _grupo(pos, giro, padre)
	_cil(0.0, r, r * 1.25, col, Vector3(0, r * 0.625, 0), Vector3.ZERO, 0.12, 0.35, 4, gm, 0.55)
	_cil(r, 0.0, r * 0.9, col.darkened(0.18), Vector3(0, - r * 0.45, 0), Vector3.ZERO, 0.12, 0.35, 4, gm, 0.4)











func _montana(padre: Node3D, cuanto: int, hueco: bool = false) -> Vector2:
	var nivel: float = clampf(log(maxf(float(cuanto), 100000.0) / 100000.0) / log(10.0), 0.0, 2.6)
	var base: int = 2 + int(nivel * 1.25 + 0.1)
	var pisos: int = int(round(2.0 + nivel * 4.6))
	var de_oro: int = 4 if cuanto >= 20000000 else (2 if cuanto >= 5000000 else 0)
	var y: float = 0.0
	for p in pisos:
		var n: int = maxi(1, int(ceil(float(base) *(1.0 - float(p) / float(pisos)))))
		var n_sig: int = maxi(1, int(ceil(float(base) *(1.0 - float(p + 1) / float(pisos)))))
		var fondo: int = maxi(1, n * 2 - 1)
		var asoma: bool = n_sig < n or p == pisos - 1

		var piso: Node3D = _grupo(Vector3(0, y + 0.015, 0), Vector3(0, 90.0 if p % 2 == 1 else 0.0, 0), padre)
		for i in n:
			for j in fondo:
				if not (asoma or i == 0 or i == n - 1 or j == 0 or j == fondo - 1):
					continue
				var pos: Vector3 = Vector3((float(i) - float(n - 1) * 0.5) * 0.116, 0.0,
					(float(j) - float(fondo - 1) * 0.5) * 0.057)
				pos += Vector3(_azar.randf_range(-0.005, 0.005), 0.0, _azar.randf_range(-0.003, 0.003))
				if p >= pisos - de_oro:
					_lingote(piso, pos, _azar.randf_range(-4.0, 4.0))
				else:
					_fajo(piso, pos, _azar.randf_range(-5.0, 5.0))
		y += 0.031
	var medio: float = float(base) * 0.059




	var a_min: float = 0.75 if hueco else -0.45
	for k in base + 1:
		var a: float = lerpf(maxf(a_min, -0.15), PI * 0.5 + 0.15, float(k) / float(base))
		var d: float = _borde(medio, a) + 0.06 + _azar.randf_range(0.0, 0.03)
		_fajo(padre, Vector3(cos(a) * d, 0.022, sin(a) * d), _azar.randf_range(0.0, 180.0),
			_azar.randf_range(10.0, 24.0))
	for k in base * 2 - 1:
		var a2: float = lerpf(a_min, PI * 0.5 + 0.45,(float(k) + 0.5) / float(base * 2 - 1))
		var d2: float = _borde(medio, a2) + 0.135 + _azar.randf_range(0.0, 0.03)
		if cuanto >= 20000000 and k % 3 == 1:
			_lingote(padre, Vector3(cos(a2) * d2, 0.015, sin(a2) * d2), _azar.randf_range(0.0, 180.0))
		else:
			_pila_monedas(padre, Vector3(cos(a2) * d2, 0.0, sin(a2) * d2), 2 +((k * 5 + pisos) %(3 + base)))
	for k in 3 + base * 2:
		var a3: float = _azar.randf_range(a_min, PI * 0.5 + 0.5)
		var d3: float = _borde(medio, a3) + _azar.randf_range(0.09, 0.19)
		_cil(0.026, 0.026, 0.009, ORO, Vector3(cos(a3) * d3, 0.005, sin(a3) * d3),
			Vector3(_azar.randf_range(-8.0, 8.0), 0, _azar.randf_range(-8.0, 8.0)), 0.25, 0.9, 14, padre)
	return Vector2(medio * 1.42 + 0.13, y)




func _borde(m: float, a: float) -> float:
	return m / maxf(absf(cos(a)), absf(sin(a)))







func _tumulo(padre: Node3D, puntos: int) -> Vector2:
	var pisos: int = clampi(2 + int(log(maxf(float(puntos), 12.0) / 12.0) / log(2.9) + 0.01), 2, 6)
	var paso: float = 0.05
	for p in pisos:
		var radio: float = float(pisos - 1 - p) * paso
		var n: int = maxi(1, int(round(TAU * radio / 0.06)))
		var cima: bool = p == pisos - 1
		for k in n:
			var a: float = TAU * float(k) / float(n) + float(p) * 0.7
			var r: float = 0.046 if cima else _azar.randf_range(0.029, 0.036)
			var tinte: Color = GEMA.lerp(Color("b58cff"), 0.55) if (k + p * 2) % 5 == 3 else GEMA
			_gema(padre, Vector3(cos(a) * radio, 0.03 + float(p) * 0.043, sin(a) * radio), r,
				Color("ffffff").lerp(GEMA, 0.35) if cima else tinte,
				Vector3(_azar.randf_range(-16.0, 16.0), _azar.randf_range(0.0, 90.0), _azar.randf_range(-16.0, 16.0)))

	for k in pisos + 1:
		var a2: float = _azar.randf_range(-0.9, PI * 0.5 + 0.9)
		var d: float = float(pisos - 1) * paso + _azar.randf_range(0.065, 0.105)
		_gema(padre, Vector3(cos(a2) * d, 0.018, sin(a2) * d), _azar.randf_range(0.018, 0.024), GEMA,
			Vector3(_azar.randf_range(40.0, 80.0), _azar.randf_range(0.0, 90.0), 0.0))
	return Vector2(float(pisos - 1) * paso + 0.13, float(pisos) * 0.043 + 0.09)






const ALTO_MIN: float = 0.5

func _m_monton(cuanto: int, puntos: int, color_bota: Variant) -> float:
	var g: Node3D = _grupo(Vector3.ZERO, Vector3(0, -18.0, 0))
	var medio: float = 0.1
	var alto_pila: float = 0.0
	var x_dinero: float = 0.0
	if cuanto > 0 and puntos > 0:
		var izq: Node3D = _grupo(Vector3.ZERO, Vector3.ZERO, g)
		var der: Node3D = _grupo(Vector3.ZERO, Vector3.ZERO, g)
		var a: Vector2 = _montana(izq, cuanto, true)
		var b: Vector2 = _tumulo(der, puntos)


		var nucleo: float =(a.x - 0.13) / 1.42
		var nucleo_g: float = b.x - 0.13
		der.position = Vector3(nucleo + nucleo_g * 0.6 + 0.07, 0.0, nucleo * 0.35 + 0.05)
		medio = a.x + nucleo_g + 0.1
		alto_pila = maxf(a.y, b.y)
		if color_bota is Color:
			alto_pila = a.y
	elif puntos > 0:
		var t: Vector2 = _tumulo(g, puntos)
		medio = t.x
		alto_pila = t.y
	elif cuanto > 0:
		var m: Vector2 = _montana(g, cuanto)
		medio = m.x
		alto_pila = m.y
	if color_bota is Color:
		var col: Color = color_bota
		var claro: bool = col.get_luminance() > 0.6
		if cuanto <= 0:


			_cil(0.172, 0.186, 0.03, Color("2b2f3a"), Vector3(0, 0.015, 0), Vector3.ZERO, 0.4, 0.4, 28, g)
			_cil(0.16, 0.16, 0.006, ORO, Vector3(0, 0.032, 0), Vector3.ZERO, 0.25, 0.9, 28, g)
			alto_pila = 0.034
			medio = 0.19

		var bota: Node3D = _grupo(Vector3(x_dinero, alto_pila +(0.086 if cuanto > 0 else 0.1), 0.0),
			Vector3(0, B_GIRO + 18.0, 0), g)
		_montar_bota(bota, col, Color("20222a") if claro else Color("f4f4f6"),
			"corona" if col.is_equal_approx(Iap.edicion("oro").get("color", ORO)) else "edicion",
			0.4, 0.3)
		alto_pila += 0.2

	_al_suelo = true
	if not (color_bota is Color) and not (cuanto > 0 and puntos > 0):
		var t_esc: float = clampf(log(maxf(float(cuanto), 250000.0) / 250000.0) / log(100.0), 0.0, 1.0) \
				if cuanto > 0 else clampf(log(maxf(float(puntos), 12.0) / 12.0) / log(25.0), 0.0, 1.0)
		_ocupa = lerpf(0.66, 1.0, t_esc)
	else:
		_ocupa = 1.0

	g.position.y = - alto_pila * 0.5
	return maxf(ALTO_MIN, maxf(medio * 2.0, alto_pila * 1.35) + 0.06)
