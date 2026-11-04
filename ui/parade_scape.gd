class_name ParadeScape
extends Node3D







































const FAN_H: float = 1.72









const FAN_QUAD: float = 1.5 / 32.0



const CALZADA_HALF: float = 6.2



const ACERA_CERCA: float = -7.2
const ACERA_LEJOS: float = 8.4


const FILAS_Z: Array[float] = [13.5, 24.0, 36.0]



const X_MIN: float = -34.0


const PARADA_Z0: float = 7.35
const PARADA_Z1: float = 8.75
const PARADA_LARGO: float = 3.8
const X_MAX: float = 54.0



const CIERRE_X: float = X_MIN - 6.3












const DIV_CITY: Dictionary = {
	1: {
		"h_min": 17.0, "h_max": 34.0, "ancho": Vector2(5.4, 8.2), "planta": 3.1,
		"luz": 0.58, "balcones": true, "marquesina": true,
		"tint": [Color("6d7688"), Color("828d9f"), Color("9aa5b6")],
	},
	2: {
		"h_min": 10.0, "h_max": 19.0, "ancho": Vector2(5.0, 7.6), "planta": 3.0,
		"luz": 0.44, "balcones": true, "marquesina": false,
		"tint": [Color("7a7466"), Color("8b8578"), Color("a09a8c")],
	},
	3: {
		"h_min": 5.4, "h_max": 10.0, "ancho": Vector2(5.6, 8.8), "planta": 2.9,
		"luz": 0.3, "balcones": false, "marquesina": false,
		"tint": [Color("6f5a4a"), Color("806a58"), Color("948069")],
	},
}





const FACHADA_TONOS: Array[Color] = [Color("cdbb98"), Color("b9785a"), Color("a8a08e"),
	Color("8e9aa6"), Color("d9d2c2"), Color("9c6a52")]

const POSTIGO_TONOS: Array[Color] = [Color("5a4636"), Color("3f4b42")]










const DIV_BUS: Dictionary = {
	1: {
		"largo": 11.6, "ancho": 2.55, "alto": 2.95, "deck": 3.15, "ruedas": 3,
		"cromo": true, "led": true, "carroceria": Color("f0f2f5"),
	},
	2: {
		"largo": 10.5, "ancho": 2.45, "alto": 2.8, "deck": 3.0, "ruedas": 2,
		"cromo": true, "led": false, "carroceria": Color("dfe0e2"),
	},
	3: {



		"largo": 9.4, "ancho": 2.35, "alto": 2.65, "deck": 2.85, "ruedas": 2,
		"cromo": false, "led": false, "carroceria": Color("c6c2b6"),
	},
}








const DIV_CROWD: Dictionary = {
	1: {"cerca": 300, "lejos": 380, "balcon": 110, "filas": 5},
	2: {"cerca": 165, "lejos": 210, "balcon": 55, "filas": 4},
	3: {"cerca": 68, "lejos": 86, "balcon": 0, "filas": 2},
}













const MODO_BUS: int = 0


const BUS_RADIO_MORRO: float = 0.42
const BUS_RADIO_POPA: float = 0.3
const PUERTA_W: float = 1.1
const MODO_BALCON: int = 1




















const PLAZA_Z0: float = -6.0
const PLAZA_Z1: float = 11.6



const PLAZA_X: float = 21.0










const AY_W: float = 23.0
const AY_H: float = 15.5
const AY_PROF: float = 12.0
const BALCON_W: float = 12.6
const BALCON_Y: float = 5.4
const BALCON_VUELO: float = 1.45
const BARANDA_H: float = 0.95



var modo: int = MODO_BUS
var div: int = 1

var fervor: float = 0.0



var fuegos_on: bool = true
var club_a: Color = Color("2e5cff")
var club_b: Color = Color("ffffff")

var crest: Texture2D = null
var _vivo_hecho: bool = false
var _vivo_col: Color = Color.WHITE



var flag: Texture2D = null





var kit_gente: Dictionary = {}




var pais_gente: String = ""

var seed_key: String = "desfile"



var bus: Node3D



var balcon: Node3D
var balcon_z: float = 0.0
var balcon_ancho: float = BALCON_W
var baranda_y: float = 0.0
var deck_y: float = 3.15
var largo_bus: float = 11.0








var alto_panel: float = 0.8

var _mats: Dictionary = {}
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var _cfg_city: Dictionary = {}
var _cfg_bus: Dictionary = {}
var _cfg_crowd: Dictionary = {}


var _lotes: Array[MultiMeshInstance3D] = []

var _caras_gente: Array[Dictionary] = []


var _fuegos: Array[Dictionary] = []


var _fuego_cols: Array[Color] = []

var _tifos_x: Array[Vector2] = []


var _humos: Array[Dictionary] = []


var _tex_suave: Texture2D = null
var _tex_chispa: Texture2D = null



var _suelo_bus: Node3D = null
var _ruedas: Array[Dictionary] = []
var _luces: Array[Dictionary] = []
var _bus_visto: bool = false
var _bus_x_ini: float = 0.0
var _bus_x_ant: float = 0.0
var _bus_t_ant: float = 0.0
var _bus_v: float = 0.0
var _bus_a: float = 0.0


var _confeti: MultiMesh = null
var _confeti_dat: Array[Dictionary] = []

var _parada_gente: Array = [[], []]


func _ready() -> void:
	_rng.seed = hash(seed_key)
	div = clampi(div, 1, 3)
	_cfg_city = DIV_CITY.get(div, DIV_CITY[3])
	_cfg_bus = DIV_BUS.get(div, DIV_BUS[3])
	_cfg_crowd = DIV_CROWD.get(div, DIV_CROWD[3])
	deck_y = float(_cfg_bus["deck"])
	largo_bus = float(_cfg_bus["largo"])
	_calzada()
	_ciudad()
	_farolas()
	_gente()
	if flag != null:
		_banderas()
	if modo == MODO_BALCON:
		_ayuntamiento()
	else:
		_bus()
		_cierre_tumbado()
	if fervor > 0.05:
		_bengalas_y_humo()
	if fuegos_on:
		_fuegos_artificiales()
		if modo == MODO_BUS:
			_confeti_3d()









func _mat(col: Color, emissive: float = 0.0) -> StandardMaterial3D:
	var key: String = "%s|%.2f" % [col.to_html(), emissive]
	if _mats.has(key):
		return _mats[key]
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.roughness = 1.0
	if emissive > 0.0:
		mat.emission_enabled = true
		mat.emission = col
		mat.emission_energy_multiplier = emissive
	_mats[key] = mat
	return mat


func _box(at: Vector3, size: Vector3, col: Color, emissive: float = 0.0,
		into: Node = null) -> MeshInstance3D:
	var m: MeshInstance3D = MeshInstance3D.new()
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emissive)
	m.mesh = box
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(into if into != null else self).add_child(m)
	return m





func _wheel(at: Vector3, radius: float, width: float, col: Color,
		into: Node) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = radius
	cyl.bottom_radius = radius
	cyl.height = width
	cyl.radial_segments = 12
	cyl.rings = 0
	cyl.material = _mat(col)
	m.mesh = cyl
	m.position = at
	m.rotate_x(deg_to_rad(90.0))
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	into.add_child(m)






func _lote_cajas(size: Vector3, puntos: Array[Vector3], col: Color,
		emissive: float = 0.0, into: Node = null) -> void:
	if puntos.is_empty():
		return
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	var box: BoxMesh = BoxMesh.new()
	box.size = size
	box.material = _mat(col, emissive)
	mm.mesh = box
	mm.instance_count = puntos.size()
	for i in puntos.size():
		mm.set_instance_transform(i, Transform3D(Basis(), puntos[i]))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	(into if into != null else self).add_child(mmi)









func _lote_var(puntos: Array[Vector3], tams: Array[Vector3], col: Color,
		emissive: float = 0.0) -> void:
	if puntos.is_empty() or puntos.size() != tams.size():
		return
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	var box: BoxMesh = BoxMesh.new()
	box.size = Vector3.ONE
	box.material = _mat(col, emissive)
	mm.mesh = box
	mm.instance_count = puntos.size()
	for i in puntos.size():
		mm.set_instance_transform(i,
			Transform3D(Basis().scaled(tams[i]), puntos[i]))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(mmi)







func _calzada() -> void:
	var largo: float = X_MAX - X_MIN
	var cx: float =(X_MIN + X_MAX) * 0.5





	if modo == MODO_BALCON:
		_box(Vector3(cx, -0.06, 4.0), Vector3(largo, 0.12, 26.0), Color("7b7264"))



		var losas: Array[Vector3] = []
		var lx: float = X_MIN + 2.0
		while lx < X_MAX:
			var lz: float = -8.0
			while lz < 14.0:
				losas.append(Vector3(lx, 0.015, lz))
				lz += 3.6
			lx += 3.6
		_lote_cajas(Vector3(3.3, 0.05, 3.3), losas, Color("857c6d"))
		return


	_box(Vector3(cx, -0.06, 0.0), Vector3(largo, 0.12, CALZADA_HALF * 2.0),
		Color("34333a"))
	for s: float in [-1.0, 1.0]:
		var z: float = CALZADA_HALF * s
		_box(Vector3(cx, 0.09, z), Vector3(largo, 0.22, 0.42), Color("8f8b84"))

		_box(Vector3(cx, 0.1, z + 2.4 * s), Vector3(largo, 0.2, 4.6),
			Color("7c7871"))

	var rayas: Array[Vector3] = []
	var x: float = X_MIN + 2.0
	while x < X_MAX:
		rayas.append(Vector3(x, 0.02, 0.0))
		x += 4.2
	_lote_cajas(Vector3(2.2, 0.06, 0.16), rayas, Color("c9c4b4"))






func _ciudad() -> void:
	var tints: Array = _cfg_city["tint"]
	var ancho: Vector2 = _cfg_city["ancho"]
	var planta: float = float(_cfg_city["planta"])
	var luz: float = float(_cfg_city["luz"])
	var on: Array[Vector3] = []
	var off: Array[Vector3] = []
	var balcones: Array[Vector3] = []




	var cornisas: Array[Vector3] = []
	var cornisas_sz: Array[Vector3] = []
	var pilastras: Array[Vector3] = []
	var pilastras_sz: Array[Vector3] = []
	var bajos: Array[Vector3] = []
	var bajos_sz: Array[Vector3] = []
	var azotea: Array[Vector3] = []
	var alero: Array[Vector3] = []
	var alero_sz: Array[Vector3] = []





	var fr: RandomNumberGenerator = RandomNumberGenerator.new()
	fr.seed = hash(seed_key + "|fachada")
	var marcos: Array[Vector3] = []
	var repisas: Array[Vector3] = []
	var postigos: Array = []
	for _t in POSTIGO_TONOS.size():
		var vacio: Array[Vector3] = []
		postigos.append(vacio)
	var losas: Array[Vector3] = []
	var rejas: Array[Vector3] = []
	var barrotes: Array[Vector3] = []
	var pendones: Array[Vector3] = []
	for fila in FILAS_Z.size():
		var z: float = FILAS_Z[fila]
		var tint: Color = tints[mini(fila, tints.size() - 1)]


		var alza: float = 1.0 + float(fila) * 0.35
		var x: float = X_MIN - 6.0
		while x < X_MAX + 6.0:
			var w: float = _rng.randf_range(ancho.x, ancho.y)





			if modo == MODO_BALCON and fila == 0 \
					and absf(x + w * 0.5) < AY_W * 0.5 + 1.0:
				x += w
				continue
			var h: float = _rng.randf_range(float(_cfg_city["h_min"]),
				float(_cfg_city["h_max"])) * alza



			var tono: Color = FACHADA_TONOS[fr.randi() % FACHADA_TONOS.size()]
			var col: Color = tint.lerp(tono, maxf(0.0, 0.45 - float(fila) * 0.12))
			col = col.lerp(Color("5a6070"), 0.1 + float(fila) * 0.16)
			col = col.lerp(club_a, 0.04)
			var postigo: int = fr.randi() % POSTIGO_TONOS.size() \
					if fila <= 1 and fr.randf() < 0.38 else -1
			var vent: Array[Vector3] = []
			var prof: float = 7.0 + _rng.randf() * 4.0
			_box(Vector3(x + w * 0.5, h * 0.5, z + prof * 0.5),
				Vector3(w * 0.97, h, prof), col)



			var cols: int = maxi(1, int(w / 1.9))
			var pisos: int = maxi(1, int((h - 1.4) / planta))
			for p in pisos:
				var wy: float = 1.6 + float(p) * planta
				if wy > h - 0.9:
					break
				for c in cols:
					var wx: float = x +(float(c) + 0.5) *(w / float(cols))
					var at: Vector3 = Vector3(wx, wy, z - 0.02)
					if _rng.randf() < luz:
						on.append(at)
					else:
						off.append(at)



					if fila <= 1 and wy > 2.4:
						vent.append(Vector3(wx, wy, float(p)))



			var con_balcon: Dictionary = {}
			if fila == 0 and bool(_cfg_city["balcones"]):
				for p in range(1, mini(pisos, 6)):
					if _rng.randf() > 0.72:
						continue
					con_balcon[p] = true
					balcones.append(Vector3(x + w * 0.5,
						1.6 + float(p) * planta - 0.5, z - 0.62))




			for v in vent:
				marcos.append(Vector3(v.x, v.y, z - 0.03))
				if postigo >= 0:
					for s: float in [-1.0, 1.0]:
						postigos[postigo].append(Vector3(v.x + 0.66 * s, v.y, z - 0.06))
				if fila == 0 and int(v.z) >= 1 and not con_balcon.has(int(v.z)) \
						and fr.randf() < 0.16:
					losas.append(Vector3(v.x, v.y - 0.8, z - 0.3))
					rejas.append(Vector3(v.x, v.y - 0.27, z - 0.56))
					for b in 5:
						barrotes.append(Vector3(v.x - 0.68 + float(b) * 0.34, v.y - 0.52,
							z - 0.56))
				else:
					repisas.append(Vector3(v.x, v.y - 0.82, z - 0.1))


			if fila == 0 and cols >= 2 and pisos >= 3 and fr.randf() < lerpf(0.18, 0.4, fervor):
				var c: int = 1 + fr.randi() %(cols - 1)
				pendones.append(Vector3(x + float(c) *(w / float(cols)),
					minf(h - 1.2, 1.6 + float(2 + fr.randi() % 2) * planta + 0.5), z))



			if fila == 0 and bool(_cfg_city["marquesina"]):
				_box(Vector3(x + w * 0.5, 2.5, z - 0.3),
					Vector3(w * 0.86, 0.9, 0.3), Color("ffd9a0"), 1.5)



			cornisas.append(Vector3(x + w * 0.5, h + 0.12, z + prof * 0.5))
			cornisas_sz.append(Vector3(w * 1.03, 0.26, prof * 1.03))



			if fila <= 1:
				for c in range(1, cols):


					pilastras.append(Vector3(x + float(c) *(w / float(cols)),
						(2.1 + h) * 0.5, z - 0.03))
					pilastras_sz.append(Vector3(0.22, maxf(1.0, h - 2.1), 0.1))



				bajos.append(Vector3(x + w * 0.5, 1.05, z - 0.06))
				bajos_sz.append(Vector3(w * 0.88, 1.7, 0.12))
				alero.append(Vector3(x + w * 0.5, 1.95, z - 0.12))
				alero_sz.append(Vector3(w * 0.94, 0.22, 0.34))




			if fila == 0 and _rng.randf() < 0.7:
				azotea.append(Vector3(x + w *(0.3 + _rng.randf() * 0.4),
					h + 0.75, z + prof *(0.2 + _rng.randf() * 0.3)))
			x += w
	var tint0: Color = tints[0]


	_lote_var(cornisas, cornisas_sz, tint0.darkened(0.35))
	_lote_var(bajos, bajos_sz, Color("23272e"))
	_lote_var(alero, alero_sz, tint0.darkened(0.45))


	_lote_var(pilastras, pilastras_sz, tint0.darkened(0.18))
	_lote_cajas(Vector3(1.5, 1.5, 1.5), azotea, tint0.darkened(0.5))
	_lote_cajas(Vector3(1.05, 1.5, 0.1), off, Color("2f3b46"))
	_lote_cajas(Vector3(1.05, 1.5, 0.1), on, Color("ffe3b0"), 1.35)
	var piedra: Color = tint0.lerp(Color("e6dfd0"), 0.6)
	_lote_cajas(Vector3(1.29, 1.76, 0.05), marcos, piedra)
	_lote_cajas(Vector3(1.42, 0.09, 0.2), repisas, piedra.darkened(0.08))
	for t in POSTIGO_TONOS.size():
		var pts: Array[Vector3] = postigos[t]
		_lote_cajas(Vector3(0.3, 1.5, 0.05), pts, POSTIGO_TONOS[t])
	_lote_cajas(Vector3(1.5, 0.1, 0.55), losas, tint0.darkened(0.3))
	_lote_cajas(Vector3(1.5, 0.05, 0.05), rejas, Color("2e3136"))
	_lote_cajas(Vector3(0.035, 0.5, 0.035), barrotes, Color("2e3136"))
	_balcones(balcones, tint0)
	_balcon_gente(balcones)
	_tifos()
	_pendones(pendones)
	_cielo()





func _cielo() -> void:
	var lejos: Array[Vector3] = []
	var x: float = X_MIN - 20.0
	while x < X_MAX + 20.0:
		lejos.append(Vector3(x, _rng.randf_range(9.0, 26.0) * 0.5, 62.0))
		x += _rng.randf_range(7.0, 13.0)



	_lote_cajas(Vector3(9.0, 30.0, 8.0), lejos, Color("aab4c6").lerp(club_a, 0.05))
























func _cierre_tumbado() -> void:
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(seed_key + "|cierre")
	var acera: Color = Color("7c7871")




	var x0: float = CIERRE_X + 2.5
	var lt: float = X_MIN - x0
	var ct: float =(X_MIN + x0) * 0.5
	_box(Vector3(ct, -0.06, 0.0), Vector3(lt, 0.12, CALZADA_HALF * 2.0),
		Color("34333a"))
	for s: float in [-1.0, 1.0]:
		var z: float = CALZADA_HALF * s
		_box(Vector3(ct, 0.09, z), Vector3(lt, 0.22, 0.42), Color("8f8b84"))
		_box(Vector3(ct, 0.1, z + 2.4 * s), Vector3(lt, 0.2, 4.6), acera)

	var zf0: float = - CALZADA_HALF - 4.7
	_box(Vector3(CIERRE_X + 1.25, 0.1,(zf0 + FILAS_Z[0]) * 0.5),
		Vector3(2.5, 0.2, FILAS_Z[0] - zf0), acera)





	var xa: float = CIERRE_X - 6.0
	var xb: float = X_MAX + 40.0
	_box(Vector3((xa + xb) * 0.5, 0.1,(zf0 - 40.0) * 0.5),
		Vector3(xb - xa, 0.2, 40.0 + zf0), acera.darkened(0.22))






	var ancho: Vector2 = _cfg_city["ancho"]
	var planta: float = float(_cfg_city["planta"])
	var luz: float = float(_cfg_city["luz"])
	var tint0: Color = _cfg_city["tint"][0]


	var fr: RandomNumberGenerator = RandomNumberGenerator.new()
	fr.seed = hash(seed_key + "|fachada_cierre")
	var cuerpos_t: Array = []
	var cuerpos_t_sz: Array = []
	for _t in FACHADA_TONOS.size():
		var a: Array[Vector3] = []
		var b: Array[Vector3] = []
		cuerpos_t.append(a)
		cuerpos_t_sz.append(b)
	var cornisas: Array[Vector3] = []
	var cornisas_sz: Array[Vector3] = []
	var bajos: Array[Vector3] = []
	var bajos_sz: Array[Vector3] = []
	var alero: Array[Vector3] = []
	var alero_sz: Array[Vector3] = []
	var pilastras: Array[Vector3] = []
	var pilastras_sz: Array[Vector3] = []
	var marquesinas: Array[Vector3] = []
	var marquesinas_sz: Array[Vector3] = []
	var azotea: Array[Vector3] = []
	var on: Array[Vector3] = []
	var off: Array[Vector3] = []
	var xf: float = CIERRE_X


	var z: float = -16.0
	while z < FILAS_Z[2] + 16.0:
		var w: float = rng.randf_range(ancho.x, ancho.y)
		var h: float = rng.randf_range(float(_cfg_city["h_min"]),
			float(_cfg_city["h_max"])) * 1.35
		var prof: float = 7.0 + rng.randf() * 4.0
		var zc: float = z + w * 0.5
		var ti: int = fr.randi() % FACHADA_TONOS.size()
		cuerpos_t[ti].append(Vector3(xf - prof * 0.5, h * 0.5, zc))
		cuerpos_t_sz[ti].append(Vector3(prof, h, w * 0.97))
		cornisas.append(Vector3(xf - prof * 0.5, h + 0.12, zc))
		cornisas_sz.append(Vector3(prof * 1.03, 0.26, w * 1.03))
		bajos.append(Vector3(xf + 0.06, 1.05, zc))
		bajos_sz.append(Vector3(0.12, 1.7, w * 0.88))
		alero.append(Vector3(xf + 0.12, 1.95, zc))
		alero_sz.append(Vector3(0.34, 0.22, w * 0.94))
		if bool(_cfg_city["marquesina"]):
			marquesinas.append(Vector3(xf + 0.3, 2.5, zc))
			marquesinas_sz.append(Vector3(0.3, 0.9, w * 0.86))
		var cols: int = maxi(1, int(w / 1.9))
		var pisos: int = maxi(1, int((h - 1.4) / planta))
		for c in range(1, cols):
			pilastras.append(Vector3(xf + 0.03,(2.1 + h) * 0.5,
				z + float(c) *(w / float(cols))))
			pilastras_sz.append(Vector3(0.1, maxf(1.0, h - 2.1), 0.22))



		for p in pisos:
			var wy: float = 1.6 + float(p) * planta
			if wy > h - 0.9:
				break
			if wy < 2.4:
				continue
			for c in cols:
				var at: Vector3 = Vector3(xf + 0.02, wy,
					z +(float(c) + 0.5) *(w / float(cols)))
				if rng.randf() < luz:
					on.append(at)
				else:
					off.append(at)
		if rng.randf() < 0.7:
			azotea.append(Vector3(xf - prof *(0.2 + rng.randf() * 0.3), h + 0.75,
				z + w *(0.3 + rng.randf() * 0.4)))
		z += w

	for ti in FACHADA_TONOS.size():
		var col: Color = tint0.lerp(FACHADA_TONOS[ti], 0.33).lerp(Color("5a6070"), 0.18) \
				.lerp(club_a, 0.04)
		var pts: Array[Vector3] = cuerpos_t[ti]
		var szs: Array[Vector3] = cuerpos_t_sz[ti]
		_lote_var(pts, szs, col)
	_lote_var(cornisas, cornisas_sz, tint0.darkened(0.35))
	_lote_var(bajos, bajos_sz, Color("23272e"))
	_lote_var(alero, alero_sz, tint0.darkened(0.45))
	_lote_var(pilastras, pilastras_sz, tint0.darkened(0.18))
	_lote_var(marquesinas, marquesinas_sz, Color("ffd9a0"), 1.5)
	_lote_cajas(Vector3(1.5, 1.5, 1.5), azotea, tint0.darkened(0.5))
	_lote_cajas(Vector3(0.1, 1.5, 1.05), off, Color("2f3b46"))
	_lote_cajas(Vector3(0.1, 1.5, 1.05), on, Color("ffe3b0"), 1.35)






func _gente_cierre(lado: int, p: int, np: int, n: int, z0: float, dz: float,
		filas: int) -> Array[Vector3]:
	var out: Array[Vector3] = []
	var xa: float = CIERRE_X + 0.8
	var xb: float = X_MIN + 1.0
	var m: int = int(round(float(n) *(xb - xa) /(X_MAX - X_MIN - 2.0)))
	var rng: RandomNumberGenerator = RandomNumberGenerator.new()
	rng.seed = hash(seed_key) + 977 + lado * 31 + p
	for i in range(p, m, maxi(np, 1)):
		var k: float =(float(i) + rng.randf()) / float(maxi(m, 1))
		var z: float = z0 + float(i % maxi(filas, 1)) * dz + rng.randf_range(-0.2, 0.2)
		out.append(Vector3(lerpf(xa, xb, k), _suelo_acera(z) + FAN_H * 0.5, z))
	return out




static func _suelo_acera(z: float) -> float:
	return 0.2 if absf(z) >= CALZADA_HALF - 0.21 else 0.0







func _tifos() -> void:
	var n: int = int(round(lerpf(1.0, 6.0, fervor)))
	if div == 3:
		n = maxi(1, n - 2)






	var z: float = FILAS_Z[0] - 0.12
	for i in n:
		var x: float = lerpf(X_MIN + 6.0, X_MAX - 10.0,
			(float(i) + 0.5) / float(n)) + _rng.randf_range(-3.0, 3.0)






		if modo == MODO_BALCON and absf(x) < AY_W * 0.5 + 3.0:
			continue
		var w: float = _rng.randf_range(3.6, 5.6)
		var h: float = _rng.randf_range(3.4, 5.4)
		var top: float = _rng.randf_range(6.5, 11.0)
		_tifos_x.append(Vector2(x - w * 0.5 - 0.8, x + w * 0.5 + 0.8))


		var otro: Color = _segundo()



		_box(Vector3(x, top + 0.1, z - 0.06), Vector3(w * 1.04, 0.16, 0.14),
			Color("2b2b30"))
		var con_escudo: bool = crest != null and i % 2 == 0






		_box(Vector3(x, top - h * 0.5, z), Vector3(w, h, 0.12), club_a)
		if con_escudo:


			for arriba: float in [1.0, -1.0]:
				_box(Vector3(x, top - h * 0.5 + arriba * h * 0.42, z - 0.07),
					Vector3(w * 0.98, h * 0.09, 0.06), otro)






			var spr: Sprite3D = Sprite3D.new()
			spr.texture = crest
			spr.pixel_size = h * 0.62 / float(maxi(crest.get_height(), 1))
			spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
			spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			spr.position = Vector3(x, top - h * 0.5, z - 0.09)
			spr.rotation_degrees = Vector3(0.0, 180.0, 0.0)
			add_child(spr)
			continue


		var franjas: int = 3
		for f in franjas:
			if f % 2 == 1:
				continue
			_box(Vector3(x, top - h *(float(f) + 0.5) / float(franjas), z - 0.07),
				Vector3(w * 0.98, h / float(franjas) * 0.9, 0.06), otro)





func _segundo() -> Color:
	if _contraste(club_a, club_b) > 0.45:
		return club_b
	var v: Color = _vivo(_cfg_bus["carroceria"])
	if _contraste(club_a, v) > 0.45:
		return v
	return Color("23305a") if club_a.get_luminance() > 0.5 else Color("f2efe6")





func _pendones(pos: Array[Vector3]) -> void:
	if pos.is_empty():
		return
	var planta: float = float(_cfg_city["planta"])
	var telas: Array[Vector3] = []
	var telas_sz: Array[Vector3] = []
	var franjas: Array[Vector3] = []
	var franjas_sz: Array[Vector3] = []
	var varales: Array[Vector3] = []
	for p in pos:
		var tapa: bool = false
		for r in _tifos_x:
			if p.x > r.x - 0.6 and p.x < r.y + 0.6:
				tapa = true
				break
		if tapa:
			continue
		var largo: float = clampf(p.y - 3.4, 2.4, planta * 2.0)
		var cy: float = p.y - largo * 0.5
		telas.append(Vector3(p.x, cy, p.z - 0.14))
		telas_sz.append(Vector3(0.62, largo, 0.05))
		franjas.append(Vector3(p.x, cy, p.z - 0.17))
		franjas_sz.append(Vector3(0.2, largo * 0.98, 0.03))
		varales.append(Vector3(p.x, p.y + 0.04, p.z - 0.15))
	_lote_var(telas, telas_sz, club_a)
	_lote_var(franjas, franjas_sz, _segundo())
	_lote_cajas(Vector3(0.8, 0.06, 0.08), varales, Color("2b2b30"))





func _farolas() -> void:
	var paso: float = 11.0 if div == 3 else 8.0
	var x: float = X_MIN + 4.0
	var mastiles: Array[Vector3] = []
	var lamparas: Array[Vector3] = []
	while x < X_MAX:



		if modo == MODO_BALCON and absf(x) < AY_W * 0.5 + 3.0:
			x += paso
			continue
		for s: float in [-1.0, 1.0]:
			var z: float =(CALZADA_HALF + 0.9) * s
			mastiles.append(Vector3(x, 2.1, z))
			lamparas.append(Vector3(x, 4.25, z - 0.5 * s))
		x += paso
	_lote_cajas(Vector3(0.16, 4.2, 0.16), mastiles, Color("41454b"))
	_lote_cajas(Vector3(0.9, 0.18, 0.4), lamparas, Color("ffdca8"), 2.2)









func _banderas() -> void:
	var w: float = float(maxi(flag.get_width(), 1))
	var h: float = float(maxi(flag.get_height(), 1))


	var paso: float =(11.0 if div == 3 else 8.0) * 1.6
	var x: float = X_MIN + 8.0
	while x < X_MAX:
		var alto_m: float = 0.85
		var sp: Sprite3D = Sprite3D.new()
		sp.texture = flag
		sp.pixel_size = alto_m / h
		sp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		sp.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		sp.position = Vector3(x, 3.55, CALZADA_HALF + 0.3)
		sp.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		add_child(sp)
		x += paso


	var n: int = 4 if div == 3 else 6
	for i in n:
		var bx: float = lerpf(X_MIN + 6.0, X_MAX - 6.0,
			(float(i) + 0.5) / float(n)) + _rng.randf_range(-2.0, 2.0)
		var bz: float = ACERA_LEJOS + _rng.randf_range(-0.4, 1.6)
		var poste: float = 3.9

		_box(Vector3(bx, poste * 0.5, bz), Vector3(0.08, poste, 0.08),
			Color("6a6660"))
		var alto_m: float = 1.35
		var ancho_m: float = alto_m * w / h
		var sp: Sprite3D = Sprite3D.new()
		sp.texture = flag
		sp.pixel_size = alto_m / h
		sp.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		sp.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD

		sp.position = Vector3(bx + ancho_m * 0.5, poste - 0.15, bz)
		sp.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		add_child(sp)






















func _lamina(anim: String, idx: int, cara: Dictionary = {}) -> Texture2D:
	var kit: Dictionary = {}
	if kit_gente.has("kit"):
		kit = {"kit": kit_gente["kit"]}
	elif GameState != null:
		var pk: Dictionary = GameState.player_kit()
		if pk.has("kit"):
			kit = {"kit": pk["kit"]}
	var arte: String = String(cara.get("arte", "fan_blue"))
	if arte == "fan_red" and kit.has("kit"):
		kit["red_base"] = true
	if cara.has("skin"):
		kit["skin"] = cara["skin"]
		kit["hair"] = cara["hair"]
	var vistos: int = 0
	for i in range(1, 9):
		var path: String = "res://assets/sprites/crowd/%s_%s_%02d.png" % [arte, anim, i]
		if not ResourceLoader.exists(path):
			continue
		var raw: Texture2D = load(path)
		if not _mira_camara(raw):
			continue
		if vistos == idx:
			return KitRecolor.apply(raw, kit) if not kit.is_empty() else raw
		vistos += 1
	return null








const CARAS_GENTE: int = 6


const CADA_GORRA: int = 3






func _caras() -> Array[Dictionary]:
	if not _caras_gente.is_empty():
		return _caras_gente
	var nat: String = "" if pais_gente.is_empty() else Nations.canon_id(pais_gente)
	var dado: RandomNumberGenerator = RandomNumberGenerator.new()
	dado.seed = hash(seed_key + "|caras|" + pais_gente)
	for i in CARAS_GENTE:
		var cara: Dictionary = KitRecolor.piel_y_pelo(nat, dado)
		cara["arte"] = "fan_red" if i % CADA_GORRA == CADA_GORRA - 1 else "fan_blue"
		_caras_gente.append(cara)
	return _caras_gente







func _laminas_gente(n_poses: int, n_lotes: int) -> Array[Texture2D]:
	var caras: Array[Dictionary] = _caras()
	var out: Array[Texture2D] = []
	for j in n_lotes:
		var cara: Dictionary = caras[j % caras.size()]
		var tex: Texture2D = _lamina("cheer", j % maxi(n_poses, 1), cara)
		if tex == null:
			tex = _lamina("cheer", 0, cara)
		if tex == null:
			tex = _lamina("cheer", 0)
		out.append(tex)
	return out





static func _mira_camara(tex: Texture2D) -> bool:
	var img: Image = tex.get_image()
	if img == null:
		return true
	if img.is_compressed():
		img.decompress()
	var bb: Rect2i = img.get_used_rect()
	if bb.size.y <= 0:
		return true
	var head_bottom: int = bb.position.y + int(bb.size.y * 0.42)
	var eyes: int = 0
	var skin: int = 0
	for y in range(bb.position.y, mini(head_bottom, img.get_height())):
		for x in range(bb.position.x, mini(bb.end.x, img.get_width())):
			var c: Color = img.get_pixel(x, y)
			if c.a < 0.5:
				continue
			if c.v > 0.8 and c.s < 0.25:
				eyes += 1
			var deg: float = c.h * 360.0
			if deg > 3.6 and deg < 36.0 and c.s > 0.15 and c.s < 0.6 and c.v > 0.5:
				skin += 1
	return eyes >= 2 and skin >= 8






func _lote_gente(tex: Texture2D, puntos: Array[Vector3],
		semilla: int) -> MultiMeshInstance3D:
	if tex == null or puntos.is_empty():
		return null
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(tex.get_width(), tex.get_height()) * FAN_QUAD
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = tex
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.billboard_keep_scale = true
	mat.vertex_color_use_as_albedo = true
	quad.material = mat
	mm.mesh = quad
	mm.use_colors = true
	mm.instance_count = puntos.size()
	var tr: RandomNumberGenerator = RandomNumberGenerator.new()
	tr.seed = semilla




	var hr: RandomNumberGenerator = RandomNumberGenerator.new()
	hr.seed = semilla + 7
	var escalas: PackedFloat32Array = PackedFloat32Array()
	var centros: Array[Vector3] = []
	for i in puntos.size():
		var esc: float = hr.randf_range(0.92, 1.07) if modo == MODO_BUS else 1.0
		var at: Vector3 = puntos[i] - Vector3(0.0, FAN_H * 0.5 *(1.0 - esc), 0.0)
		escalas.append(esc)
		centros.append(at)
		mm.set_instance_transform(i, Transform3D(Basis().scaled(Vector3.ONE * esc), at))










		var v: float = tr.randf_range(1.22, 1.55) if modo == MODO_BALCON \
				else tr.randf_range(0.8, 1.06)
		var c: Color = Color(v, v * tr.randf_range(0.96, 1.03),
			v * tr.randf_range(0.95, 1.04))
		if tr.randf() < 0.16:
			c = c.lerp(club_a * 1.7, 0.5)
		mm.set_instance_color(i, c)
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF


	mmi.set_meta("centros", centros)
	mmi.set_meta("escalas", escalas)
	add_child(mmi)
	_lotes.append(mmi)
	if modo == MODO_BUS:
		var manos: Vector3 = _manos(tex)
		if manos.z >= 0.0:
			_bufandas(mmi, tex, manos, centros, escalas, semilla + 11)
	return mmi






static func _manos(tex: Texture2D) -> Vector3:
	var no: Vector3 = Vector3(0.0, 0.0, -1.0)
	if tex == null:
		return no
	var img: Image = tex.get_image()
	if img == null or img.is_empty():
		return no
	if img.is_compressed():
		img.decompress()
	var bb: Rect2i = img.get_used_rect()
	if bb.size.x < 10 or bb.size.y < 10:
		return no
	var tops: Array[int] = []
	for lado in 2:
		var top: int = -1
		for y in range(bb.position.y, bb.end.y):
			for d in 3:
				var xx: int = bb.position.x + d if lado == 0 else bb.end.x - 1 - d
				if img.get_pixel(xx, y).a > 0.5:
					top = y
					break
			if top >= 0:
				break
		tops.append(top)
	if tops[0] < 0 or tops[1] < 0:
		return no
	var fila: int = maxi(tops[0], tops[1])
	if float(fila - bb.position.y) > float(bb.size.y) * 0.28:
		return no
	return Vector3(bb.position.x + 1, bb.end.x - 2, fila)








func _bufandas(lote: MultiMeshInstance3D, tex: Texture2D, manos: Vector3,
		centros: Array[Vector3], escalas: PackedFloat32Array, semilla: int) -> void:
	var br: RandomNumberGenerator = RandomNumberGenerator.new()
	br.seed = semilla
	var elegidos: Array[int] = []
	for i in centros.size():
		if br.randf() < lerpf(0.22, 0.5, fervor):
			elegidos.append(i)
	if elegidos.is_empty():
		return
	var ancho_px: int = int(manos.y - manos.x) + 3
	var img: Image = Image.create(ancho_px, 3, false, Image.FORMAT_RGBA8)
	var a: Color = club_a.darkened(0.08)
	var b: Color = _segundo().darkened(0.08)
	for x in ancho_px:
		for y in 3:
			img.set_pixel(x, y, a if (x / 3) % 2 == 0 else b)
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(ancho_px, 3) * FAN_QUAD
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.billboard_mode = BaseMaterial3D.BILLBOARD_FIXED_Y
	mat.billboard_keep_scale = true
	quad.material = mat
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = quad
	mm.instance_count = elegidos.size()


	var dx: float =((manos.x + manos.y) * 0.5 + 0.5 - float(tex.get_width()) * 0.5) * FAN_QUAD
	var dy: float =(float(tex.get_height()) * 0.5 - manos.z - 1.5) * FAN_QUAD
	for k in elegidos.size():
		var i: int = elegidos[k]
		var e: float = escalas[i]
		mm.set_instance_transform(k, Transform3D(Basis().scaled(Vector3.ONE * e),
			centros[i] + Vector3(dx * e, dy * e, 0.04)))
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = mm
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	lote.add_child(mmi)







func _gente() -> void:
	if modo == MODO_BALCON:





		_gente_plaza(_laminas_gente(4, CARAS_GENTE * 2))
		return


	var poses: Array[Texture2D] = _laminas_gente(4, CARAS_GENTE)
	var np: int = poses.size()



	var huecos: Array[Vector2] = _huecos_acera()
	var paradas: Array[float] = _paradas()
	var filas: int = int(_cfg_crowd["filas"])


	var extra: float = 1.0 + fervor * 0.45
	for lado in 2:
		var cerca: bool = lado == 0
		var llave: String = "cerca" if cerca else "lejos"





		var n: int = int(float(_cfg_crowd[llave]) * extra *(0.7 if cerca else 1.0))
		var z0: float = ACERA_CERCA if cerca else ACERA_LEJOS








		var dz: float = 0.55 if cerca else 0.62
		for p in np:
			var puntos: Array[Vector3] = []
			for i in range(p, n, np):
				var fila: int = i % filas



				var k: float =(float(i) + _rng.randf()) / float(maxi(n, 1))
				var x: float = lerpf(X_MIN + 1.0, X_MAX - 1.0, k)
				var z: float = z0 + float(fila) * dz + _rng.randf_range(-0.2, 0.2)

				if cerca and _en_tramo(x, huecos):
					continue
				if not cerca and z < PARADA_Z1 + 0.2 and _en_parada(x, paradas):
					continue



				puntos.append(Vector3(x, _suelo_acera(z) + FAN_H * 0.5, z))




			puntos.append_array(_gente_cierre(lado, p, np, n, z0, dz, filas))
			_lote_gente(poses[p], puntos, hash(seed_key) + lado * 31 + p)


	for j in 2:
		var pts: Array[Vector3] = []
		pts.assign(_parada_gente[j])
		_lote_gente(poses[mini(2 + j, np - 1)], pts, hash(seed_key) + 4021 + j)




func _huecos_acera() -> Array[Vector2]:
	var hr: RandomNumberGenerator = RandomNumberGenerator.new()
	hr.seed = hash(seed_key + "|huecos")
	var out: Array[Vector2] = []
	var x: float = X_MIN + 3.0
	while x < X_MAX:


		x += hr.randf_range(7.0, 12.0) * lerpf(1.0, 1.7, fervor)
		var w: float = hr.randf_range(1.6, 2.6) * lerpf(1.0, 0.6, fervor)
		out.append(Vector2(x, x + w))
		x += w
	return out


func _en_tramo(x: float, tramos: Array[Vector2]) -> bool:
	for t in tramos:
		if x > t.x and x < t.y:
			return true
	return false


func _en_parada(x: float, paradas: Array[float]) -> bool:
	for c in paradas:
		if absf(x - c) < PARADA_LARGO * 0.5 + 0.3:
			return true
	return false






func _paradas() -> Array[float]:
	var pr: RandomNumberGenerator = RandomNumberGenerator.new()
	pr.seed = hash(seed_key + "|paradas")
	var paso: float = 11.0 if div == 3 else 8.0
	var candidatas: Array[float] = []
	var k: int = 0
	while true:
		var c: float = X_MIN + 4.0 + paso *(float(k) + 0.5)
		k += 1
		if c > 34.0:
			break
		if c > -14.0:
			candidatas.append(c)
	var out: Array[float] = []
	var n: int = 2 if div == 3 else 3
	while out.size() < n and not candidatas.is_empty():
		var c: float = candidatas.pop_at(pr.randi() % candidatas.size())
		var lejos: bool = true
		for o in out:
			if absf(o - c) < paso * 1.5:
				lejos = false
		if lejos:
			out.append(c)
	var zc: float =(PARADA_Z0 + PARADA_Z1) * 0.5
	var fondo: float = PARADA_Z1 - PARADA_Z0
	var metal: Color = Color("3a3f46")
	var arriba: Array = _parada_gente
	for c in out:
		_box(Vector3(c, 2.55, zc - 0.05), Vector3(PARADA_LARGO + 0.2, 0.1, fondo + 0.2), metal)
		_box(Vector3(c, 1.38, PARADA_Z1 - 0.04), Vector3(PARADA_LARGO, 2.2, 0.04),
			Color("5f7a92"), 0.15)
		_box(Vector3(c - PARADA_LARGO * 0.5 + 0.02, 1.38, zc), Vector3(0.04, 2.2, fondo - 0.1),
			Color("5f7a92"), 0.15)
		for sx: float in [-1.0, 1.0]:
			_box(Vector3(c + PARADA_LARGO * 0.5 * sx, 1.25, PARADA_Z1 - 0.08),
				Vector3(0.08, 2.5, 0.08), metal)
		_box(Vector3(c - 0.3, 0.62, PARADA_Z1 - 0.3), Vector3(1.9, 0.07, 0.4), metal)


		_box(Vector3(c + PARADA_LARGO * 0.5 - 0.68, 1.3, zc + 0.1), Vector3(1.1, 1.75, 0.12),
			Color("f3ead6"), 1.1)
		_box(Vector3(c + PARADA_LARGO * 0.5 - 0.68, 0.72, zc + 0.03), Vector3(1.12, 0.32, 0.04),
			club_a, 0.6)

		var cuantos: int = 2 + pr.randi() % 2 + int(round(fervor * 2.0))
		for j in cuantos:
			var px: float = c + lerpf(-1.4, 1.4,(float(j) + 0.5) / float(cuantos)) \
					+ pr.randf_range(-0.2, 0.2)

			arriba[j % 2].append(Vector3(px, 2.62 + FAN_H * 0.5, zc + pr.randf_range(-0.25, 0.2)))
	return out

















func _gente_plaza(poses: Array[Texture2D]) -> void:
	var np: int = maxi(poses.size(), 1)



	var n: int = int((float(_cfg_crowd["cerca"]) + float(_cfg_crowd["lejos"]))
		*(1.0 + fervor * 0.45))
	for p in np:
		var puntos: Array[Vector3] = []
		for i in range(p, n, np):



			var k: float =(float(i) + _rng.randf()) / float(maxi(n, 1))
			var x: float = lerpf(- PLAZA_X, PLAZA_X, k)
			var z: float = lerpf(PLAZA_Z0, PLAZA_Z1, sqrt(_rng.randf()))

			puntos.append(Vector3(x, FAN_H * 0.5, z))
		_lote_gente(poses[p], puntos, hash(seed_key) + 613 + p)





















func _ayuntamiento() -> void:
	var zf: float = FILAS_Z[0]
	var piedra: Color = Color("c9bda6").lerp(club_a, 0.05)
	var sombra: Color = piedra.darkened(0.3)


	balcon = Node3D.new()
	balcon.position = Vector3(0.0, BALCON_Y, zf - BALCON_VUELO)
	add_child(balcon)
	balcon_z = zf - BALCON_VUELO
	balcon_ancho = BALCON_W
	baranda_y = BALCON_Y + BARANDA_H


	_box(Vector3(0.0, AY_H * 0.5, zf + AY_PROF * 0.5),
		Vector3(AY_W, AY_H, AY_PROF), piedra)



	_box(Vector3(0.0, 2.45, zf - 0.16), Vector3(AY_W * 0.99, 4.9, 0.34),
		piedra.darkened(0.1))
	var juntas: Array[Vector3] = []
	var jy: float = 0.66
	while jy < 4.85:
		juntas.append(Vector3(0.0, jy, zf - 0.34))
		jy += 0.66
	_lote_cajas(Vector3(AY_W * 0.99, 0.07, 0.06), juntas, sombra)


	_box(Vector3(0.0, 5.06, zf - 0.3), Vector3(AY_W, 0.26, 0.62), sombra)


	_box(Vector3(0.0, 2.0, zf - 0.36), Vector3(3.6, 4.1, 0.16),
		piedra.darkened(0.18))
	_box(Vector3(0.0, 1.85, zf - 0.44), Vector3(3.0, 3.7, 0.14),
		Color("2a231c"))
	for s2: float in [-1.0, 1.0]:

		_box(Vector3(2.6 * s2, 3.34, zf - 0.3), Vector3(0.08, 0.08, 0.34),
			piedra.darkened(0.45))
		_box(Vector3(2.6 * s2, 3.06, zf - 0.44), Vector3(0.26, 0.4, 0.26),
			Color("ffd9a0"), 2.0)





	var vent: Array[Vector3] = []
	var puerta_v: Array[Vector3] = []
	var marcos: Array[Vector3] = []
	for i in 7:
		var vx: float =(float(i) - 3.0) * 2.9
		if absf(vx) < 3.6:
			puerta_v.append(Vector3(vx, BALCON_Y + 1.35, zf - 0.1))
			marcos.append(Vector3(vx, BALCON_Y + 1.35, zf - 0.04))
		else:
			vent.append(Vector3(vx, BALCON_Y + 1.55, zf - 0.1))
			marcos.append(Vector3(vx, BALCON_Y + 1.55, zf - 0.04))


	_lote_cajas(Vector3(1.55, 3.3, 0.1), vent, Color("ffe0ac"), 1.5)
	_lote_cajas(Vector3(1.65, 2.9, 0.1), puerta_v, Color("ffe0ac"), 1.6)
	_lote_cajas(Vector3(1.92, 3.62, 0.06), marcos, sombra)

	var pil: Array[Vector3] = []
	for i in 8:
		pil.append(Vector3((float(i) - 3.5) * 2.9,(5.3 + AY_H) * 0.5, zf - 0.08))
	_lote_cajas(Vector3(0.42, AY_H - 5.3, 0.16), pil, piedra.darkened(0.06))


	_box(Vector3(0.0, AY_H + 0.22, zf + AY_PROF * 0.5),
		Vector3(AY_W * 1.05, 0.52, AY_PROF * 1.04), sombra)
	_reloj(Vector3(0.0, AY_H + 2.6, zf + 1.4), piedra, sombra)


	var zc: float = zf - BALCON_VUELO * 0.5


	_box(Vector3(0.0, BALCON_Y - 0.11, zc), Vector3(BALCON_W, 0.22, BALCON_VUELO),
		sombra)
	var mensulas: Array[Vector3] = []
	for i in 6:
		mensulas.append(Vector3((float(i) - 2.5) * 2.4, BALCON_Y - 0.46,
			zf - BALCON_VUELO * 0.35))
	_lote_cajas(Vector3(0.26, 0.5, BALCON_VUELO * 0.7), mensulas, sombra)


	var zb: float = zf - BALCON_VUELO + 0.09
	_box(Vector3(0.0, BALCON_Y + 0.09, zb), Vector3(BALCON_W, 0.18, 0.2), piedra)
	var bal: Array[Vector3] = []
	var bx: float = - BALCON_W * 0.5 + 0.16
	while bx < BALCON_W * 0.5 - 0.1:
		bal.append(Vector3(bx, BALCON_Y + 0.5, zb))
		bx += 0.3
	_lote_cajas(Vector3(0.11, 0.62, 0.11), bal, piedra.lightened(0.06))
	_box(Vector3(0.0, baranda_y - 0.07, zb), Vector3(BALCON_W + 0.14, 0.14, 0.26),
		piedra)

	for s2: float in [-1.0, 1.0]:
		_box(Vector3((BALCON_W * 0.5 + 0.16) * s2, BALCON_Y + 0.48, zc),
			Vector3(0.32, 1.1, BALCON_VUELO), piedra)
	_box(Vector3(0.0, BALCON_Y + 3.9, zf - 0.42), Vector3(BALCON_W + 0.9, 0.28, 0.72),
		sombra)










	_box(Vector3(0.0, BALCON_Y + 0.24, zb - 0.13), Vector3(BALCON_W * 0.94, 0.78, 0.06),
		club_a)





	_box(Vector3(0.0, BALCON_Y - 0.09, zb - 0.16),
		Vector3(BALCON_W * 0.94, 0.14, 0.05), club_b)










	for s2: float in [-1.0, 1.0]:
		_box(Vector3(6.1 * s2, 3.45, zf - 0.36), Vector3(1.35, 3.6, 0.06),
			club_a if s2 < 0.0 else club_b)


		_box(Vector3(6.1 * s2, 5.3, zf - 0.4), Vector3(1.45, 0.14, 0.14),
			sombra)
	var guirnalda_a: Array[Vector3] = []
	var guirnalda_b: Array[Vector3] = []
	var gx: float = - AY_W * 0.5 + 0.7
	var gi: int = 0
	while gx < AY_W * 0.5 - 0.5:

		var kg: float =(gx + AY_W * 0.5) / AY_W
		var gy: float = 4.72 - sin(kg * PI) * 0.22
		(guirnalda_a if gi % 2 == 0 else guirnalda_b).append(Vector3(gx, gy, zf - 0.34))
		gx += 0.62
		gi += 1
	_lote_cajas(Vector3(0.3, 0.34, 0.04), guirnalda_a, club_a)
	_lote_cajas(Vector3(0.3, 0.34, 0.04), guirnalda_b, club_b)


	if crest != null:
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = crest
		spr.pixel_size = 2.6 / float(maxi(crest.get_height(), 1))


		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		spr.position = Vector3(0.0, BALCON_Y + 5.55, zf - 0.3)
		spr.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		add_child(spr)

	if flag != null:
		_box(Vector3(-3.6, AY_H + 2.6, zf + 1.4), Vector3(0.12, 5.0, 0.12),
			Color("6d6a63"))
		var fl: Sprite3D = Sprite3D.new()
		fl.texture = flag
		fl.pixel_size = 1.25 / float(maxi(flag.get_height(), 1))
		fl.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		fl.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		fl.position = Vector3(-2.55, AY_H + 4.35, zf + 1.34)
		fl.rotation_degrees = Vector3(0.0, 180.0, 0.0)
		add_child(fl)






func _reloj(at: Vector3, piedra: Color, sombra: Color) -> void:
	_box(at, Vector3(4.6, 4.0, 4.6), piedra)
	_box(at + Vector3(0.0, 2.1, 0.0), Vector3(5.0, 0.3, 5.0), sombra)

	var techo: MeshInstance3D = MeshInstance3D.new()
	var cono: CylinderMesh = CylinderMesh.new()
	cono.top_radius = 0.0
	cono.bottom_radius = 3.4
	cono.height = 2.6
	cono.radial_segments = 4
	cono.rings = 0
	cono.material = _mat(sombra.darkened(0.15))
	techo.mesh = cono
	techo.position = at + Vector3(0.0, 3.55, 0.0)
	techo.rotation_degrees = Vector3(0.0, 45.0, 0.0)
	techo.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(techo)

	var zc: float = -2.34
	_box(at + Vector3(0.0, 0.3, zc + 0.04), Vector3(2.3, 2.3, 0.14), sombra)
	_box(at + Vector3(0.0, 0.3, zc), Vector3(1.9, 1.9, 0.12),
		Color("fff0c8"), 1.4)


	for aguja: Array in [[0.62, 0.1, -108.0], [0.86, 0.07, 42.0]]:
		var eje: Node3D = Node3D.new()
		eje.position = at + Vector3(0.0, 0.3, zc - 0.08)
		eje.rotation_degrees = Vector3(0.0, 0.0, float(aguja[2]))
		add_child(eje)
		_box(Vector3(0.0, float(aguja[0]) * 0.5, 0.0),
			Vector3(float(aguja[1]), float(aguja[0]), 0.05),
			Color("2b2620"), 0.0, eje)














func _balcones(pos: Array[Vector3], tint: Color) -> void:
	if pos.is_empty():
		return
	var suelo: Array[Vector3] = []
	var baranda: Array[Vector3] = []
	var machon: Array[Vector3] = []
	var dintel: Array[Vector3] = []
	var telas: Array[Vector3] = []
	for b in pos:
		suelo.append(b)


		baranda.append(b + Vector3(0.0, 0.32, -0.42))
		for s: float in [-1.0, 1.0]:
			machon.append(b + Vector3(1.02 * s, 0.32, -0.16))
		dintel.append(b + Vector3(0.0, 2.15, 0.18))
		if _rng.randf() < lerpf(0.15, 0.75, fervor):
			telas.append(b + Vector3(0.0, 0.02, -0.47))
	_lote_cajas(Vector3(2.2, 0.14, 1.05), suelo, tint.darkened(0.42))
	_lote_cajas(Vector3(2.2, 0.52, 0.09), baranda, Color("54595f"))
	_lote_cajas(Vector3(0.14, 0.56, 0.95), machon, tint.darkened(0.3))
	_lote_cajas(Vector3(2.3, 0.16, 0.55), dintel, tint.darkened(0.5))

	_lote_cajas(Vector3(2.05, 0.46, 0.06), telas, club_a)






func _balcon_gente(balcones: Array[Vector3]) -> void:
	var n: int = int(_cfg_crowd["balcon"])
	if n <= 0 or balcones.is_empty():
		return


	var texs: Array[Texture2D] = _laminas_gente(1, 3)
	var lotes: Array = []
	for j in texs.size():
		var vacio: Array[Vector3] = []
		lotes.append(vacio)
	for i in n:
		var b: Vector3 = balcones[_rng.randi() % balcones.size()]


		lotes[i % texs.size()].append(b + Vector3(_rng.randf_range(-0.72, 0.72),
			0.07 + 0.86, -0.24))



	if modo == MODO_BUS:
		var er: RandomNumberGenerator = RandomNumberGenerator.new()
		er.seed = hash(seed_key + "|balcon_extra")
		var extra: int = int(round(float(n) * 0.35 * clampf((fervor - 0.25) / 0.75, 0.0, 1.0)))
		for i in extra:
			var b: Vector3 = balcones[er.randi() % balcones.size()]
			lotes[(n + i) % texs.size()].append(b + Vector3(er.randf_range(-0.72, 0.72),
				0.07 + 0.86, -0.24))
	for j in texs.size():
		_lote_gente(texs[j], lotes[j], hash(seed_key) + 977 + j)










func _bengalas_y_humo() -> void:





	var n: int = int(round(lerpf(6.0, 30.0, fervor)))
	if div == 3:
		n = int(round(float(n) * 0.66))
	var otro: Color = _segundo()
	for i in n:
		var x: float = _rng.randf_range(X_MIN + 4.0, X_MAX - 4.0)
		var alto: bool = _rng.randf() < 0.4 and int(_cfg_crowd["balcon"]) > 0
		var y: float = _rng.randf_range(5.0, 12.0) if alto else 1.5
		var z: float = ACERA_LEJOS + _rng.randf_range(0.0, 2.0)







		if modo == MODO_BALCON:
			if absf(x) < AY_W * 0.5 + 2.0:
				continue
			alto = false
			y = 1.4
			z = _rng.randf_range(PLAZA_Z0 + 2.0, PLAZA_Z1)


		var col: Color = [club_a, otro, Color("ff5a2a")][i % 3]


		_box(Vector3(x, y, z), Vector3(0.22, 0.22, 0.22), col.lightened(0.35),
			3.6 if modo == MODO_BALCON else 6.0)





		var ancho: float = _rng.randf_range(2.4, 4.2)
		var sube: float = _rng.randf_range(3.0, 5.5)
		var fase: float = _rng.randf()
		var humo: Color = col.lerp(Color("d9d6d2"), 0.3)
		for k in 3:
			var q: MeshInstance3D = MeshInstance3D.new()
			var quad: QuadMesh = QuadMesh.new()
			quad.size = Vector2.ONE * ancho * 0.62
			var mat: StandardMaterial3D = StandardMaterial3D.new()
			mat.albedo_texture = _suave()
			mat.albedo_color = Color(humo.r, humo.g, humo.b, 0.0)
			mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
			mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
			mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
			mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED
			mat.billboard_keep_scale = true
			quad.material = mat
			q.mesh = quad
			q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
			add_child(q)
			var h: Dictionary = {"nodo": q, "mat": mat, "x": x, "y": y, "z": z,
				"sube": sube, "per": 3.4, "fase": fase + float(k) / 3.0,
				"deriva": 0.5 if i % 2 == 0 else -0.5}
			_humos.append(h)
			_humo_pon(h, 0.0)





func _humo_pon(h: Dictionary, t: float) -> void:
	var ph: float = fposmod(t / float(h["per"]) + float(h["fase"]), 1.0)
	var q: MeshInstance3D = h["nodo"]
	q.position = Vector3(float(h["x"]) + float(h["deriva"]) * ph,
		float(h["y"]) + 0.4 + ph * float(h["sube"]), float(h["z"]))
	q.scale = Vector3.ONE * lerpf(0.55, 1.6, ph)
	var mat: StandardMaterial3D = h["mat"]
	var c: Color = mat.albedo_color
	mat.albedo_color = Color(c.r, c.g, c.b, 0.5 * pow(sin(ph * PI), 0.7) *(1.0 - 0.35 * ph))



func _chispa() -> Texture2D:
	if _tex_chispa != null:
		return _tex_chispa
	var g: Gradient = Gradient.new()
	g.offsets = PackedFloat32Array([0.0, 0.22, 0.55, 1.0])
	g.colors = PackedColorArray([Color(1, 1, 1, 1), Color(1, 1, 1, 0.9),
		Color(1, 1, 1, 0.16), Color(1, 1, 1, 0)])
	var t: GradientTexture2D = GradientTexture2D.new()
	t.gradient = g
	t.width = 32
	t.height = 32
	t.fill = GradientTexture2D.FILL_RADIAL
	t.fill_from = Vector2(0.5, 0.5)
	t.fill_to = Vector2(0.5, 0.0)
	_tex_chispa = t
	return t




func _suave() -> Texture2D:
	if _tex_suave != null:
		return _tex_suave
	var g: Gradient = Gradient.new()
	g.offsets = PackedFloat32Array([0.0, 0.45, 1.0])
	g.colors = PackedColorArray([Color(1, 1, 1, 1), Color(1, 1, 1, 0.5), Color(1, 1, 1, 0)])
	var t: GradientTexture2D = GradientTexture2D.new()
	t.gradient = g
	t.width = 64
	t.height = 64
	t.fill = GradientTexture2D.FILL_RADIAL
	t.fill_from = Vector2(0.5, 0.5)
	t.fill_to = Vector2(0.5, 0.0)
	_tex_suave = t
	return t

















const FUEGO_CHISPAS: int = 16

func _fuegos_artificiales() -> void:
	_fuego_cols = [club_a, Color("ffd54a"), Color("ffffff"), Color("ff6a3a")]


	var n: int = int(round(lerpf(3.0, 8.0, fervor)))
	if div == 3:
		n = maxi(2, n - 2)
	for i in n:
		var nodo: Node3D = Node3D.new()
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
		mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
		mat.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
		mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
		mat.billboard_mode = BaseMaterial3D.BILLBOARD_ENABLED



		mat.albedo_texture = _chispa()
		mat.albedo_color = Color(1, 1, 1, 0)



		for c in FUEGO_CHISPAS:
			var ang: float = TAU * float(c) / float(FUEGO_CHISPAS)

			var r: float = 0.82 + _rng.randf() * 0.36



			for k in 3:
				var q: MeshInstance3D = MeshInstance3D.new()
				var quad: QuadMesh = QuadMesh.new()
				quad.size = Vector2.ONE * 0.62 *(1.0 - 0.26 * float(k))
				quad.material = mat
				q.mesh = quad
				var rk: float = r *(1.0 - 0.12 * float(k))
				q.position = Vector3(cos(ang) * rk, sin(ang) * rk, 0.0)
				q.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
				nodo.add_child(q)
		add_child(nodo)
		var rng2: RandomNumberGenerator = RandomNumberGenerator.new()
		rng2.seed = hash(seed_key) + i * 97
		_fuegos.append({
			"nodo": nodo, "mat": mat, "rng": rng2,

			"period": rng2.randf_range(1.9, 3.1),
			"offset": rng2.randf() * 3.0,
			"cycle": -1, "base_y": 0.0,
		})




func _fuego_reinicia(f: Dictionary) -> void:
	var rng2: RandomNumberGenerator = f["rng"]
	var x: float = rng2.randf_range(X_MIN + 6.0, X_MAX - 6.0)










	var y: float = rng2.randf_range(10.0, 18.0)
	var z: float = rng2.randf_range(6.0, 14.0)
	f["base_y"] = y
	var nodo: Node3D = f["nodo"]
	nodo.position = Vector3(x, y, z)
	var col: Color = _fuego_cols[rng2.randi() % _fuego_cols.size()]
	var mat: StandardMaterial3D = f["mat"]


	var claro: Color = col.lerp(Color.WHITE, 0.4)
	mat.albedo_color = Color(claro.r, claro.g, claro.b, 0.0)
	mat.emission_enabled = true
	mat.emission = claro
	mat.emission_energy_multiplier = 3.0









const CONFETI_N: int = 240
const CONFETI_ALTO: float = 11.5

func _confeti_3d() -> void:
	var cr: RandomNumberGenerator = RandomNumberGenerator.new()
	cr.seed = hash(seed_key + "|confeti")
	var cols: Array[Color] = [club_a, _segundo(), Color("ffd54a"), Color("f4f1ea")]
	var quad: QuadMesh = QuadMesh.new()
	quad.size = Vector2(0.11, 0.15)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.cull_mode = BaseMaterial3D.CULL_DISABLED
	mat.vertex_color_use_as_albedo = true
	quad.material = mat
	_confeti = MultiMesh.new()
	_confeti.transform_format = MultiMesh.TRANSFORM_3D
	_confeti.use_colors = true
	_confeti.mesh = quad

	var n: int = int(round(lerpf(float(CONFETI_N) * 0.55, float(CONFETI_N), fervor)))
	_confeti.instance_count = n
	for i in n:
		var eje: Vector3 = Vector3(cr.randf() - 0.5, cr.randf() - 0.5, cr.randf() - 0.5)
		_confeti_dat.append({
			"x": cr.randf_range(-10.0, 12.0), "z": cr.randf_range(-3.5, 5.5),
			"vel": cr.randf_range(0.8, 1.3), "fase": cr.randf(),
			"giro": cr.randf_range(3.0, 7.0), "eje": eje.normalized() if eje.length() > 0.05
				else Vector3.UP,
			"ciclo": -1, "bx": 0.0,
		})
		_confeti.set_instance_color(i, cols[i % cols.size()])
	var mmi: MultiMeshInstance3D = MultiMeshInstance3D.new()
	mmi.multimesh = _confeti
	mmi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	add_child(mmi)
	_tick_confeti(0.0)


func _tick_confeti(t: float) -> void:
	if _confeti == null:
		return
	var bx: float = bus.position.x if bus != null and is_instance_valid(bus) else 0.0
	for i in _confeti_dat.size():
		var d: Dictionary = _confeti_dat[i]
		var raw: float = t * float(d["vel"]) / CONFETI_ALTO + float(d["fase"])
		var cyc: int = int(floor(raw))
		if cyc != int(d["ciclo"]):


			d["ciclo"] = cyc
			d["bx"] = bx + fposmod(float(d["x"]) + float(cyc) * 7.3, 22.0) - 10.0
		var ph: float = raw - float(cyc)
		var fa: float = float(d["fase"]) * TAU
		var at: Vector3 = Vector3(float(d["bx"]) + sin(t * 1.3 + fa) * 0.45,
			CONFETI_ALTO - ph *(CONFETI_ALTO - 0.1),
			float(d["z"]) + cos(t * 1.1 + fa) * 0.3)
		_confeti.set_instance_transform(i,
			Transform3D(Basis(d["eje"], t * float(d["giro"]) + fa), at))































func _bus() -> void:
	bus = Node3D.new()
	add_child(bus)


	_suelo_bus = Node3D.new()
	bus.add_child(_suelo_bus)
	var L: float = largo_bus
	var W: float = float(_cfg_bus["ancho"])
	var carro: Color = _cfg_bus["carroceria"]
	var cromo: bool = bool(_cfg_bus["cromo"])
	var vivo: Color = _vivo(carro)
	var claro: Color = club_b if vivo == club_a else club_a
	var deck: float = float(_cfg_bus["deck"])
	var r: float = 0.52
	var rf: float = BUS_RADIO_MORRO
	var rr: float = BUS_RADIO_POPA
	var vidrio: Color = Color("27384a")
	var brillo: Color = Color("6d8eae")
	var goma: Color = Color("2a2d33")



	var techo: float = deck - 0.18
	var win_lo: float = 1.3
	var franja: float = clampf((techo - win_lo) * 0.25, 0.3, 0.42)
	var win_hi: float = techo - franja
	var luna_lo: float = 1.02
	var ejes: Array[float] = _ejes(L)

	_redondo(L - 0.5, 0.14, 0.34, W - 0.26, rf - 0.1, rr - 0.1, Color("1d1f24"))
	_redondo(L + 0.02, 0.32, 0.46, W + 0.02, rf + 0.01, rr + 0.01, goma)


	_redondo(L, 0.46, luna_lo, W, rf, rr, carro)
	_redondo(L, luna_lo, win_hi, W, rf, rr, carro, vidrio)
	_redondo(L, win_hi, techo, W, rf, rr, vivo)
	_redondo(L, techo, deck, W, rf, rr, carro.darkened(0.12))


	_redondo(L + 0.02, win_hi - 0.01, win_hi + 0.04, W + 0.02, rf + 0.01, rr + 0.01, claro)
	_redondo(L + 0.02, 0.62, 0.7, W + 0.02, rf + 0.01, rr + 0.01, vivo)
	if cromo:

		_redondo(L + 0.02, win_lo - 0.06, win_lo - 0.02, W + 0.02, rf + 0.01, rr + 0.01,
			Color("d8dde4"))
	var puertas: Array[Vector2] = _puertas_x(L, ejes)
	_ventanas(L, W, win_lo, win_hi, vidrio, brillo, puertas)
	_morro(L, W, luna_lo, win_hi, techo, vidrio, brillo, goma, vivo)
	_popa(L, W, win_lo, win_hi, vidrio, goma)










	var panel_h: float = alto_panel
	_aro(L, W, deck + panel_h * 0.5, panel_h, 0.1, vivo)


	_aro(L, W, deck + panel_h + 0.05, 0.1, 0.16, claro)


	_aro(L, W, deck + 0.16, 0.09, 0.12, claro)
	_guirnalda(L, W, deck + panel_h - 0.07, vivo)



	var ancho_m: float = W - 2.0 * rf + 0.3
	var mampara: MeshInstance3D = _box(Vector3(L * 0.5 - 0.1, deck + panel_h + 0.26, 0.0),
		Vector3(0.04, 0.4, ancho_m), vidrio.lightened(0.15), 0.2, bus)
	mampara.rotation.z = deg_to_rad(14.0)
	var filo: MeshInstance3D = _box(Vector3(L * 0.5 - 0.15, deck + panel_h + 0.46, 0.0),
		Vector3(0.06, 0.05, ancho_m), claro, 0.0, bus)
	filo.rotation.z = deg_to_rad(14.0)
	if crest != null:









		for s: float in [-1.0, 1.0]:
			var esc: Sprite3D = Sprite3D.new()
			esc.texture = crest
			esc.pixel_size =(alto_panel * 0.78) / float(maxi(crest.get_height(), 1))
			esc.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
			esc.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
			esc.position = Vector3(L * 0.3 * s, deck + alto_panel * 0.5,
				(W * 0.5 + 0.03) * s)

			esc.rotation_degrees = Vector3(0.0, 180.0 if s < 0.0 else 0.0, 0.0)
			bus.add_child(esc)
	for ex in ejes:
		for s: float in [-1.0, 1.0]:



			_paso_rueda(ex, r,(W * 0.5 + 0.008) * s)
		_eje(Vector3(ex, r, 0.0), r, W * 0.5, 0.26)


	_sombra(Vector3(0.0, 0.0, 0.0), L + 1.6, W + 1.4, 0.62)
	_escolta()






func _eje(at: Vector3, r: float, media: float, ancho: float) -> void:
	var piv: Node3D = Node3D.new()
	piv.position = at
	_suelo_bus.add_child(piv)
	var tuercas: Array[Vector3] = []
	for s: float in [-1.0, 1.0]:
		_wheel(Vector3(0.0, 0.0,(media - ancho * 0.38) * s), r, ancho, Color("1b1c20"), piv)
		_wheel(Vector3(0.0, 0.0,(media + 0.01) * s), r * 0.58, 0.06, Color("9aa0a8"), piv)

		_wheel(Vector3(0.0, 0.0,(media + 0.03) * s), r * 0.22, 0.04, Color("3a3e45"), piv)
		for k in 5:
			var a: float = TAU * float(k) / 5.0
			tuercas.append(Vector3(cos(a) * r * 0.4, sin(a) * r * 0.4,(media + 0.045) * s))
	_lote_cajas(Vector3(r * 0.13, r * 0.13, 0.03), tuercas, Color("2a2c31"), 0.0, piv)
	_ruedas.append({"nodo": piv, "r": r})




func _sombra(at: Vector3, lx: float, lz: float, fuerza: float) -> void:
	var iw: int = 96
	var ih: int = maxi(8, int(round(96.0 * lz / lx)))
	var img: Image = Image.create(iw, ih, false, Image.FORMAT_RGBA8)
	var borde: float = minf(0.9, lz * 0.3)
	for j in ih:
		for i in iw:
			var px: float =((float(i) + 0.5) / float(iw) - 0.5) * lx
			var pz: float =((float(j) + 0.5) / float(ih) - 0.5) * lz
			var dx: float = maxf(absf(px) -(lx * 0.5 - borde), 0.0)
			var dz: float = maxf(absf(pz) -(lz * 0.5 - borde), 0.0)
			var d: float = sqrt(dx * dx + dz * dz) / borde
			img.set_pixel(i, j, Color(0, 0, 0, fuerza *(1.0 - smoothstep(0.0, 1.0, d))))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	mat.depth_draw_mode = BaseMaterial3D.DEPTH_DRAW_DISABLED
	var plano: PlaneMesh = PlaneMesh.new()
	plano.size = Vector2(lx, lz)
	plano.material = mat
	var m: MeshInstance3D = MeshInstance3D.new()
	m.mesh = plano


	m.position = at + Vector3(0.0, 0.062, 0.0)
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	_suelo_bus.add_child(m)






func _escolta() -> void:
	var rojo: StandardMaterial3D = _mat_luz(Color("ff3030"))
	var azul: StandardMaterial3D = _mat_luz(Color("3f7bff"))
	var morro: float = largo_bus * 0.5
	_coche_policia(Vector3(morro + 4.2, 0.0, -1.35), rojo, azul)
	_coche_policia(Vector3(morro + 9.6, 0.0, 1.25), azul, rojo)







	_furgon_policia(Vector3(- morro + 2.1, 0.0, - float(_cfg_bus["ancho"]) * 0.5 - 1.18), rojo, azul)


func _mat_luz(col: Color) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = col
	mat.emission_enabled = true
	mat.emission = col
	mat.emission_energy_multiplier = 0.4
	_luces.append({"mat": mat, "fase": 0.0 if _luces.size() % 2 == 0 else PI})
	return mat


func _coche_policia(at: Vector3, luz_a: StandardMaterial3D, luz_b: StandardMaterial3D) -> void:
	var coche: Node3D = Node3D.new()
	coche.position = at
	_suelo_bus.add_child(coche)
	var blanco: Color = Color("eceef0")
	var banda: Color = Color("1f4fbf")
	var vidrio: Color = Color("27323d")
	var r: float = 0.33
	_box(Vector3(0.0, 0.62, 0.0), Vector3(4.5, 0.62, 1.8), blanco, 0.0, coche)
	_box(Vector3(0.0, 0.72, 0.0), Vector3(4.52, 0.17, 1.82), banda, 0.0, coche)

	for s: float in [-1.0, 1.0]:
		_box(Vector3(2.27 * s, 0.42, 0.0), Vector3(0.1, 0.22, 1.76), Color("2a2d33"), 0.0, coche)

	_box(Vector3(-0.25, 1.2, 0.0), Vector3(2.3, 0.52, 1.6), vidrio, 0.15, coche)
	_box(Vector3(-0.25, 1.48, 0.0), Vector3(2.1, 0.06, 1.56), blanco, 0.0, coche)

	for px: float in [-1.36, -0.25, 0.86]:
		_box(Vector3(px, 1.2, 0.0), Vector3(0.1, 0.52, 1.62), blanco, 0.0, coche)

	_box(Vector3(-0.25, 1.55, 0.0), Vector3(1.0, 0.07, 1.0), Color("2a2d33"), 0.0, coche)
	for k in 2:
		var luz: MeshInstance3D = MeshInstance3D.new()
		var caja: BoxMesh = BoxMesh.new()
		caja.size = Vector3(0.44, 0.12, 0.9)
		caja.material = luz_a if k == 0 else luz_b
		luz.mesh = caja
		luz.position = Vector3(-0.25 +(0.24 if k == 0 else -0.24), 1.64, 0.0)
		luz.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		coche.add_child(luz)

	for s: float in [-1.0, 1.0]:
		_box(Vector3(2.26, 0.74, 0.62 * s), Vector3(0.04, 0.12, 0.34), Color("fff0c8"), 1.6, coche)
		_box(Vector3(-2.26, 0.74, 0.66 * s), Vector3(0.04, 0.12, 0.26), Color("d02a2a"), 1.0, coche)
	for ex: float in [1.45, -1.45]:
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(ex, r, 0.0)
		coche.add_child(piv)
		var tuercas: Array[Vector3] = []
		for s: float in [-1.0, 1.0]:
			_wheel(Vector3(0.0, 0.0, 0.82 * s), r, 0.22, Color("1b1c20"), piv)
			_wheel(Vector3(0.0, 0.0, 0.93 * s), r * 0.6, 0.02, Color("b4b9c0"), piv)
			for k in 5:
				var a: float = TAU * float(k) / 5.0
				tuercas.append(Vector3(cos(a) * r * 0.36, sin(a) * r * 0.36, 0.945 * s))
		_lote_cajas(Vector3(0.05, 0.05, 0.02), tuercas, Color("3a3e45"), 0.0, piv)
		_ruedas.append({"nodo": piv, "r": r})
	_sombra(at, 5.2, 2.4, 0.55)





func _furgon_policia(at: Vector3, luz_a: StandardMaterial3D, luz_b: StandardMaterial3D) -> void:
	var f: Node3D = Node3D.new()
	f.position = at
	_suelo_bus.add_child(f)
	var blanco: Color = Color("eceef0")
	var banda: Color = Color("1f4fbf")
	var vidrio: Color = Color("27323d")
	var r: float = 0.38

	_box(Vector3(-0.45, 1.42, 0.0), Vector3(4.1, 1.96, 2.0), blanco, 0.0, f)
	_box(Vector3(2.05, 0.88, 0.0), Vector3(0.9, 0.88, 1.96), blanco, 0.0, f)


	var luna: MeshInstance3D = _box(Vector3(2.0, 1.83, 0.0), Vector3(1.33, 0.06, 1.86),
		vidrio, 0.15, f)
	luna.rotation.z = -0.925
	_box(Vector3(1.8, 1.565, 0.0), Vector3(0.4, 0.53, 1.97), vidrio, 0.15, f)
	_box(Vector3(2.1, 1.43, 0.0), Vector3(0.2, 0.26, 1.97), vidrio, 0.15, f)

	_box(Vector3(-0.45, 1.72, 0.0), Vector3(3.5, 0.42, 2.02), vidrio, 0.15, f)
	for px: float in [-1.35, -0.15]:
		_box(Vector3(px, 1.72, 0.0), Vector3(0.1, 0.42, 2.03), Color(blanco), 0.0, f)


	_box(Vector3(-0.45, 0.98, 0.0), Vector3(4.12, 0.16, 2.012), banda, 0.0, f)
	_box(Vector3(2.05, 0.98, 0.0), Vector3(0.92, 0.16, 1.972), banda, 0.0, f)
	var cuadros: Array[Vector3] = []
	for c in 19:
		for fila in 2:
			if (c + fila) % 2 == 0:
				cuadros.append(Vector3(-2.4 + 0.1 + 0.2 * float(c), 2.03 + 0.11 * float(fila), 0.0))
	_lote_cajas(Vector3(0.2, 0.11, 2.012), cuadros, banda, 0.0, f)

	for s: float in [-1.0, 1.0]:
		_box(Vector3(2.52 * s, 0.55, 0.0), Vector3(0.08, 0.24, 1.9), Color("2a2d33"), 0.0, f)
		_box(Vector3(2.51, 1.12, 0.68 * s), Vector3(0.04, 0.14, 0.34), Color("fff0c8"), 1.6, f)
		_box(Vector3(-2.51, 1.1, 0.8 * s), Vector3(0.04, 0.3, 0.2), Color("d02a2a"), 1.0, f)

	_box(Vector3(-0.1, 2.43, 0.0), Vector3(1.5, 0.06, 1.3), Color("2a2d33"), 0.0, f)
	for k in 2:
		var luz: MeshInstance3D = MeshInstance3D.new()
		var caja: BoxMesh = BoxMesh.new()
		caja.size = Vector3(0.7, 0.14, 1.2)
		caja.material = luz_a if k == 0 else luz_b
		luz.mesh = caja
		luz.position = Vector3(-0.1 +(0.37 if k == 0 else -0.37), 2.53, 0.0)
		luz.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		f.add_child(luz)
	for ex: float in [1.7, -1.55]:
		var piv: Node3D = Node3D.new()
		piv.position = Vector3(ex, r, 0.0)
		f.add_child(piv)
		var tuercas: Array[Vector3] = []
		for s: float in [-1.0, 1.0]:
			_wheel(Vector3(0.0, 0.0, 0.92 * s), r, 0.22, Color("1b1c20"), piv)
			_wheel(Vector3(0.0, 0.0, 1.03 * s), r * 0.6, 0.02, Color("b4b9c0"), piv)
			for k in 5:
				var a: float = TAU * float(k) / 5.0
				tuercas.append(Vector3(cos(a) * r * 0.36, sin(a) * r * 0.36, 1.045 * s))
		_lote_cajas(Vector3(0.05, 0.05, 0.02), tuercas, Color("3a3e45"), 0.0, piv)
		_ruedas.append({"nodo": piv, "r": r})
	_sombra(at, 5.6, 2.6, 0.55)








func _tick_bus(t: float) -> void:
	if bus == null or not is_instance_valid(bus):
		return
	var x: float = bus.position.x
	if not _bus_visto:
		_bus_visto = true
		_bus_x_ini = x
		_bus_x_ant = x
		_bus_t_ant = t
	var dt: float = t - _bus_t_ant
	if dt > 0.0001:
		var v: float =(x - _bus_x_ant) / dt


		_bus_a = lerpf(_bus_a,(v - _bus_v) / dt, clampf(dt * 6.0, 0.0, 1.0))
		_bus_v = v
		_bus_x_ant = x
		_bus_t_ant = t
	for rd in _ruedas:
		var piv: Node3D = rd["nodo"]
		piv.rotation.z = -(x - _bus_x_ini) / float(rd["r"])
	var rapido: float = clampf(absf(_bus_v) / 4.0, 0.0, 1.0)
	var cabeceo: float = clampf(_bus_a * 0.006, -0.008, 0.008) \
			+ sin(t * 7.3) * 0.0012 * rapido
	bus.rotation.z = cabeceo
	bus.position.y = absf(cabeceo) * largo_bus * 0.5 \
			+(0.5 + 0.5 * sin(t * 9.1)) * 0.008 * rapido
	_suelo_bus.transform = Transform3D(bus.basis.inverse(),
		bus.basis.inverse() * Vector3(0.0, - bus.position.y, 0.0))
	for l in _luces:
		var mat: StandardMaterial3D = l["mat"]
		var on: bool = sin(t * 9.0 + float(l["fase"])) > 0.0
		mat.emission_energy_multiplier = 4.0 if on else 0.35





func _ejes(L: float) -> Array[float]:
	var delante: float = L * 0.5 - clampf(L * 0.2, 1.9, 2.3)
	var detras: float = -(L * 0.5 - clampf(L * 0.25, 2.3, 2.6))
	if int(_cfg_bus["ruedas"]) >= 3:
		return [delante, detras + 0.62, detras - 0.62]
	return [delante, detras]






func _vivo(carro: Color) -> Color:
	if _vivo_hecho:
		return _vivo_col
	_vivo_hecho = true
	_vivo_col = Color("23305a")
	for col: Color in [club_a, club_b]:
		if _contraste(col, carro) > 0.45:
			_vivo_col = col
			return _vivo_col
	var del_escudo: Variant = _tono_escudo()
	if del_escudo != null:
		_vivo_col = del_escudo
	return _vivo_col


func _contraste(a: Color, b: Color) -> float:
	return Vector3(a.r - b.r, a.g - b.g, a.b - b.b).length()




func _tono_escudo() -> Variant:
	if crest == null:
		return null
	var img: Image = crest.get_image()
	if img == null or img.is_empty():
		return null
	if img.is_compressed():
		img.decompress()
	var cajones: Array = []
	for _i in 12:
		cajones.append([0, Vector3.ZERO])
	var paso: int = maxi(img.get_width() / 64, 1)
	for y in range(0, img.get_height(), paso):
		for x in range(0, img.get_width(), paso):
			var p: Color = img.get_pixel(x, y)
			if p.a < 0.5 or p.s < 0.35 or p.v < 0.2:
				continue
			var k: Array = cajones[int(p.h * 12.0) % 12]
			k[0] += 1
			k[1] += Vector3(p.r, p.g, p.b)
	var mejor: Array = cajones[0]
	for k: Array in cajones:
		if int(k[0]) > int(mejor[0]):
			mejor = k
	if int(mejor[0]) < 8:
		return null
	var m: Vector3 = mejor[1] / float(mejor[0])
	var col: Color = Color(m.x, m.y, m.z)
	if col.v > 0.75:
		col.v = 0.75
	return col





func _redondo(largo: float, y0: float, y1: float, ancho: float, rf: float, rr: float,
		col: Color, frente: Variant = null) -> void:
	var h: float = y1 - y0
	var y: float =(y0 + y1) * 0.5
	var x0: float = - largo * 0.5 + rr
	var x1: float = largo * 0.5 - rf
	var cf: Color = frente if frente != null else col
	var ef: float = 0.12 if frente != null else 0.0
	_box(Vector3((x0 + x1) * 0.5, y, 0.0), Vector3(x1 - x0, h, ancho), col, 0.0, bus)
	_box(Vector3(x1 + rf * 0.5, y, 0.0), Vector3(rf, h, ancho - 2.0 * rf), cf, ef, bus)
	_box(Vector3(x0 - rr * 0.5, y, 0.0), Vector3(rr, h, ancho - 2.0 * rr), col, 0.0, bus)
	for s: float in [-1.0, 1.0]:
		_columna(Vector3(x1, y, s *(ancho * 0.5 - rf)), rf, h, cf, ef)
		_columna(Vector3(x0, y, s *(ancho * 0.5 - rr)), rr, h, col, 0.0)


func _columna(at: Vector3, radio: float, alto: float, col: Color, emissive: float) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = radio
	cyl.bottom_radius = radio
	cyl.height = alto
	cyl.radial_segments = 20
	cyl.rings = 0
	cyl.material = _mat(col, emissive)
	m.mesh = cyl
	m.position = at
	m.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	bus.add_child(m)





func _aro(largo: float, ancho: float, y: float, alto: float, grueso: float,
		col: Color) -> void:
	var rf: float = BUS_RADIO_MORRO
	var rr: float = BUS_RADIO_POPA
	var x0: float = - largo * 0.5 + rr
	var x1: float = largo * 0.5 - rf
	var zc: float = ancho * 0.5 - 0.04
	for s: float in [-1.0, 1.0]:
		_box(Vector3((x0 + x1) * 0.5, y, zc * s), Vector3(x1 - x0, alto, grueso), col, 0.0, bus)
	_box(Vector3(largo * 0.5 - 0.04, y, 0.0), Vector3(grueso, alto, ancho - 2.0 * rf),
		col, 0.0, bus)
	_box(Vector3(- largo * 0.5 + 0.04, y, 0.0), Vector3(grueso, alto, ancho - 2.0 * rr),
		col, 0.0, bus)
	for sx: float in [-1.0, 1.0]:
		var rad: float = rf if sx > 0.0 else rr
		for sz: float in [-1.0, 1.0]:
			var c: Vector2 = Vector2(x1 if sx > 0.0 else x0, sz *(ancho * 0.5 - rad))
			var medio: float = atan2(sz, sx)
			_arco(c, rad - 0.04, medio - PI * 0.25, medio + PI * 0.25, y, alto, grueso, col)



func _arco(c: Vector2, rad: float, a0: float, a1: float, y: float, alto: float,
		grueso: float, col: Color) -> void:
	var n: int = 4
	for i in n:
		var a: float = lerpf(a0, a1, float(i) / float(n))
		var b: float = lerpf(a0, a1, float(i + 1) / float(n))
		var p: Vector2 = c + Vector2(cos(a), sin(a)) * rad
		var q: Vector2 = c + Vector2(cos(b), sin(b)) * rad
		var m: Vector2 =(p + q) * 0.5
		var d: Vector2 = q - p
		var k: MeshInstance3D = _box(Vector3(m.x, y, m.y),
			Vector3(d.length() + grueso * 0.5, alto, grueso), col, 0.0, bus)
		k.rotation.y = - atan2(d.y, d.x)





func _paso_rueda(ex: float, r: float, z: float) -> void:
	_wheel(Vector3(ex, r, z), r + 0.12, 0.02, Color("0d0e11"), bus)





func _ventanas(L: float, W: float, win_lo: float, win_hi: float, vidrio: Color,
		brillo: Color, puertas: Array[Vector2]) -> void:
	var xa: float = - L * 0.5 + BUS_RADIO_POPA + 0.25
	var xb: float = L * 0.5 - BUS_RADIO_MORRO - 0.14
	var n: int = maxi(int(round((xb - xa) / 1.2)), 3)
	var paso: float =(xb - xa) / float(n)
	var ancho_luna: float = paso - 0.14
	var lunas: Array[Vector3] = []
	var brillos: Array[Vector3] = []
	for s: float in [-1.0, 1.0]:
		for i in n:
			var x: float = xa + paso *(float(i) + 0.5)
			if s > 0.0 and _en_puerta(x, ancho_luna, puertas):
				continue
			lunas.append(Vector3(x,(win_lo + win_hi) * 0.5,(W * 0.5 + 0.012) * s))
			brillos.append(Vector3(x, win_hi - 0.07,(W * 0.5 + 0.024) * s))
	_lote_cajas(Vector3(ancho_luna, win_hi - win_lo, 0.02), lunas, vidrio, 0.12, bus)
	_lote_cajas(Vector3(ancho_luna, 0.06, 0.01), brillos, brillo, 0.35, bus)

	for p in puertas:
		var z: float = W * 0.5
		_box(Vector3(p.x,(0.36 + win_hi) * 0.5, z + 0.008),
			Vector3(p.y, win_hi - 0.36, 0.02), Color("30343b"), 0.0, bus)
		for h: float in [-1.0, 1.0]:
			_box(Vector3(p.x + h * p.y * 0.25,(0.48 + win_hi - 0.06) * 0.5, z + 0.02),
				Vector3(p.y * 0.5 - 0.08, win_hi - 0.06 - 0.48, 0.02), vidrio, 0.12, bus)





func _puertas_x(L: float, ejes: Array[float]) -> Array[Vector2]:
	var x0: float = ejes[0] + 0.52 + 0.16
	var x1: float = L * 0.5 - BUS_RADIO_MORRO - 0.04
	var w: float = minf(PUERTA_W, x1 - x0)
	var xs: Array[Vector2] = [Vector2(x1 - w * 0.5, w)]
	if L > 10.0:
		xs.append(Vector2((ejes[0] + ejes[1]) * 0.5, PUERTA_W))
	return xs


func _en_puerta(x: float, ancho_luna: float, puertas: Array[Vector2]) -> bool:
	for p in puertas:
		if absf(x - p.x) <(p.y + ancho_luna) * 0.5 + 0.04:
			return true
	return false






func _morro(L: float, W: float, luna_lo: float, win_hi: float, techo: float,
		vidrio: Color, brillo: Color, goma: Color, vivo: Color) -> void:
	var x: float = L * 0.5
	var tapa: float = W - 2.0 * BUS_RADIO_MORRO
	_box(Vector3(x + 0.006,(luna_lo + win_hi) * 0.5, 0.0),
		Vector3(0.02, win_hi - luna_lo, 0.05), goma, 0.0, bus)
	_box(Vector3(x + 0.008, win_hi - 0.08, 0.0), Vector3(0.01, 0.06, tapa),
		brillo, 0.35, bus)
	for s: float in [-1.0, 1.0]:
		var esc: MeshInstance3D = _box(Vector3(x + 0.012, luna_lo + 0.26, s * tapa * 0.22),
			Vector3(0.01, 0.03, tapa * 0.4), goma, 0.0, bus)
		esc.rotation.x = deg_to_rad(16.0) * s



	var alto_f: float = techo - win_hi
	_box(Vector3(x + 0.008,(win_hi + techo) * 0.5, 0.0),
		Vector3(0.02, alto_f * 0.66, tapa * 0.9), Color("15161a"), 0.0, bus)
	if bool(_cfg_bus["led"]):
		_box(Vector3(x + 0.02,(win_hi + techo) * 0.5, 0.0),
			Vector3(0.01, alto_f * 0.36, tapa * 0.76), vivo.lightened(0.3), 3.0, bus)
	for s: float in [-1.0, 1.0]:

		_box(Vector3(x + 0.01, 0.74, s *(tapa * 0.5 - 0.16)),
			Vector3(0.03, 0.13, 0.3), Color("fff2cf"), 2.6, bus)
		_box(Vector3(x + 0.01, 0.74, s *(tapa * 0.5 + 0.04)),
			Vector3(0.03, 0.1, 0.08), Color("ffb347"), 1.6, bus)


		var brazo: MeshInstance3D = _box(Vector3(x + 0.12, win_hi - 0.02,
			(W * 0.5 - 0.1) * s), Vector3(0.4, 0.05, 0.05), Color("2a2d33"), 0.0, bus)
		brazo.rotation.y = deg_to_rad(-30.0) * s
		_box(Vector3(x + 0.3, win_hi - 0.22,(W * 0.5 + 0.02) * s),
			Vector3(0.07, 0.38, 0.16), Color("2a2d33"), 0.0, bus)
	_box(Vector3(x + 0.01, 0.74, 0.0), Vector3(0.03, 0.11, tapa * 0.34),
		Color("3a3e45"), 0.0, bus)
	_box(Vector3(x + 0.04, 0.56, 0.0), Vector3(0.02, 0.11, 0.5), Color("e8e8e0"),
		0.2, bus)
	_box(Vector3(x + 0.03, 0.4, 0.0), Vector3(0.08, 0.16, tapa + 0.2), goma, 0.0, bus)





func _popa(L: float, W: float, win_lo: float, win_hi: float, vidrio: Color,
		goma: Color) -> void:
	var x: float = - L * 0.5
	var tapa: float = W - 2.0 * BUS_RADIO_POPA
	_box(Vector3(x - 0.008,(win_lo + 0.45 + win_hi) * 0.5, 0.0),
		Vector3(0.02, win_hi - win_lo - 0.45, tapa - 0.2), vidrio, 0.12, bus)
	for s: float in [-1.0, 1.0]:
		_box(Vector3(x - 0.01, 1.05, s *(tapa * 0.5 - 0.04)),
			Vector3(0.03, 0.62, 0.1), Color("ff5a4a"), 1.8, bus)
	for i in 3:
		_box(Vector3(x - 0.01, 0.8 + float(i) * 0.11, 0.0),
			Vector3(0.03, 0.05, tapa * 0.55), Color("3a3e45"), 0.0, bus)
	_box(Vector3(x - 0.04, 0.56, 0.0), Vector3(0.02, 0.11, 0.5), Color("e8e8e0"),
		0.2, bus)
	_box(Vector3(x - 0.03, 0.4, 0.0), Vector3(0.08, 0.16, tapa + 0.2), goma, 0.0, bus)




func _guirnalda(L: float, W: float, y: float, vivo: Color) -> void:
	var calidas: Array[Vector3] = []
	var club: Array[Vector3] = []
	var x0: float = - L * 0.5 + BUS_RADIO_POPA + 0.2
	var x1: float = L * 0.5 - BUS_RADIO_MORRO - 0.2
	var n: int = int((x1 - x0) / 0.55)
	for s: float in [-1.0, 1.0]:
		for i in n + 1:
			var p: Vector3 = Vector3(x0 + float(i) * 0.55, y,(W * 0.5 + 0.03) * s)
			(calidas if i % 2 == 0 else club).append(p)
	_lote_cajas(Vector3(0.08, 0.08, 0.04), calidas, Color("fff2cf"), 2.2, bus)
	_lote_cajas(Vector3(0.08, 0.08, 0.04), club, vivo.lightened(0.35), 2.2, bus)










func tick(t: float) -> void:
	_tick_bus(t)
	for h in _humos:
		_humo_pon(h, t)
	_tick_confeti(t)











	for i in _lotes.size():
		var mmi: MultiMeshInstance3D = _lotes[i]
		if not is_instance_valid(mmi):
			continue


		var vel: float = 4.4 + float(i) * 0.7
		mmi.position.y = absf(sin(t * vel + float(i) * 1.7)) * 0.24




	for f in _fuegos:
		var nodo: Node3D = f["nodo"]
		if not is_instance_valid(nodo):
			continue
		var period: float = float(f["period"])
		var raw: float =(t + float(f["offset"])) / period
		var cyc: int = int(raw)
		var ph: float = raw - float(cyc)
		if cyc != int(f["cycle"]):
			f["cycle"] = cyc
			_fuego_reinicia(f)


		var abre: float = 1.0 - pow(1.0 - ph, 2.2)
		var escala: float = lerpf(0.25, 4.8, abre)
		nodo.scale = Vector3(escala, escala, escala)
		nodo.position.y = float(f["base_y"]) - ph * ph * 3.2
		var mat: StandardMaterial3D = f["mat"]



		var a: float = 1.0 if ph < 0.22 else clampf(1.0 -(ph - 0.22) / 0.6, 0.0, 1.0)
		var c: Color = mat.albedo_color
		mat.albedo_color = Color(c.r, c.g, c.b, a * 0.95)
