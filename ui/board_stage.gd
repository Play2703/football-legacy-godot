class_name BoardStage
extends SubViewportContainer













































































const PLAYER_HEIGHT_M: float = 1.78
const PLAYER_METRICS: Vector2 = Vector2(65.0, 38.0)


const TIER_CUTS: Array[int] = [25, 50, 75]





const APLAUDE_DESDE: int = 75









const MESA_Y: float = 1.06















const MESA_GRUESO: float = 0.09
const MESA_Z: float = -0.55



const PIE_R: float = 0.2
const PLATO_R: float = 0.62



const GENTE_FUERA: float = 0.15























const FRAME_H: float = 1.26
const CAM_FOV: float = 30.0
const CAM_AIM_Y: float = 1.62










const CAM_Y: float = 1.46










const CAM_YAW: float = 14.0




const CAM_AIM_X: float = 0.45




const SWAY_DEG: float = 1.6
const SWAY_HZ: float = 0.035








const ESCUDO_PX: int = 192





const CAPA_PANEL: float = 0.02
const CAPA_LISTON: float = 0.05
const CAPA_VANO: float = 0.14
const CAPA_MENUDA: float = 0.2

const PARED: Vector2 = Vector2(9.0, 3.8)
const PARED_Z: float = -2.6
const COSTADO_X: float = 2.9

var club: Dictionary = {}
var div: int = 3
var relacion: int = 50
var objetivos: int = 0

var _vp: SubViewport
var _cam: Camera3D
var _world: Node3D
var _luz_nodo: DirectionalLight3D = null
var _t: float = 0.0




static func headless() -> bool:
	return DisplayServer.get_name() == "headless"





static func tier(value: int) -> int:
	var t: int = 0
	for cut in TIER_CUTS:
		if value >= cut:
			t += 1
	return t


func _ready() -> void:
	stretch = true






	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST



	mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_to_group(CareerUi.LIVE_3D_GROUP)
	if headless():
		return
	_vp = SubViewport.new()
	_vp.transparent_bg = false
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS

	_vp.msaa_3d = Viewport.MSAA_DISABLED
	_vp.own_world_3d = true
	_vp.handle_input_locally = false


	UiKit.aplica_escala_3d_sub(_vp, get_viewport())
	add_child(_vp)
	_world = Node3D.new()
	_vp.add_child(_world)
	_build()
	_cam = Camera3D.new()
	_cam.current = true


	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color(0.012, 0.013, 0.022)



	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color(0.42, 0.45, 0.58)
	env.ambient_light_energy = 0.55
	_cam.environment = env
	_vp.add_child(_cam)
	_luz()
	_apply_cam(0.0)



func ok() -> bool:
	return _cam != null and is_instance_valid(_vp)





func set_live(on: bool) -> void:
	if not ok():
		return
	_vp.render_target_update_mode = SubViewport.UPDATE_ALWAYS if on \
			else SubViewport.UPDATE_DISABLED
	set_process(on)









func set_estado(rel: int, objs: int) -> void:
	var r: int = clampi(rel, 0, 100)
	var o: int = maxi(objs, 0)
	if tier(r) == tier(relacion) and (r >= APLAUDE_DESDE) ==(relacion >= APLAUDE_DESDE) \
			and o == objetivos:
		relacion = r
		return
	relacion = r
	objetivos = o
	if not ok():
		return
	_aplica_luz()
	_world.queue_free()
	_world = Node3D.new()
	_vp.add_child(_world)
	_build()


func _process(delta: float) -> void:
	if not ok():
		return
	_t += delta
	_apply_cam(sin(_t * SWAY_HZ * TAU) * SWAY_DEG)


func _apply_cam(yaw_deg: float) -> void:
	var dist: float = FRAME_H * 0.5 / tan(deg_to_rad(CAM_FOV) * 0.5)


	var yaw: float = deg_to_rad(CAM_YAW + yaw_deg)
	_cam.fov = CAM_FOV



	_cam.keep_aspect = Camera3D.KEEP_HEIGHT












	_cam.look_at_from_position(
		Vector3(CAM_AIM_X + sin(yaw) * dist, CAM_Y, MESA_Z + cos(yaw) * dist),
		Vector3(CAM_AIM_X, CAM_AIM_Y, MESA_Z))






func _accent() -> Color:
	if club.is_empty():
		return Color(0.28, 0.45, 0.72)
	return CareerTheme.accent_of(club)






func _lit() -> float:
	return lerpf(0.5, 1.0, float(tier(relacion)) / 3.0)


func _dim(c: Color) -> Color:
	var k: float = _lit()
	return Color(c.r * k, c.g * k, c.b * k, c.a)



















func _luz() -> void:
	var sol: DirectionalLight3D = DirectionalLight3D.new()
	sol.shadow_enabled = false
	sol.rotation_degrees = Vector3(-42.0, 28.0, 0.0)
	sol.light_color = Color(1.0, 0.96, 0.88)
	_luz_nodo = sol
	_vp.add_child(sol)
	_aplica_luz()






func _aplica_luz() -> void:
	if _luz_nodo == null or not is_instance_valid(_luz_nodo):
		return
	_luz_nodo.light_energy = lerpf(0.45, 1.15, float(tier(relacion)) / 3.0)



















func _estilo() -> Dictionary:
	match clampi(div, 1, 3):
		1:
			return {
				"gente": 3, "ang": [-34.0, 0.0, 34.0], "mesa_r": 1.7,
				"madera": Color(0.44, 0.31, 0.19), "filo": Color(0.28, 0.19, 0.11),
				"cenefa": true, "lampara": "barra", "mueble": "vitrina",
				"copas": 3, "planta": true, "alfombra": "cenefa",
				"pared": Color(0.3, 0.28, 0.3), "suelo": Color(0.24, 0.22, 0.25),
				"moldura": true, "escudo": 1.05, "marco": Color(0.55, 0.45, 0.26),
				"panel": "boiserie", "silla": "alta", "cortina": true,
				"reloj": true, "mesa_extra": "carpeta",
			}
		2:
			return {
				"gente": 2, "ang": [-21.0, 21.0], "mesa_r": 1.6,
				"madera": Color(0.4, 0.31, 0.21), "filo": Color(0.27, 0.2, 0.13),
				"cenefa": false, "lampara": "plafon", "mueble": "bajo",
				"copas": 1, "planta": false, "alfombra": "lisa",
				"pared": Color(0.28, 0.27, 0.26), "suelo": Color(0.23, 0.22, 0.22),
				"moldura": true, "escudo": 0.82, "marco": Color(0.3, 0.22, 0.14),
				"panel": "dado", "silla": "oficina", "cortina": false,
				"reloj": true, "mesa_extra": "taza",
			}
		_:
			return {
				"gente": 1, "ang": [0.0], "mesa_r": 1.5,



				"madera": Color(0.34, 0.33, 0.31), "filo": Color(0.22, 0.22, 0.21),
				"cenefa": false, "lampara": "bombilla", "mueble": "archivador",
				"copas": 0, "planta": false, "alfombra": "no",
				"pared": Color(0.26, 0.26, 0.24), "suelo": Color(0.21, 0.21, 0.2),
				"moldura": false, "escudo": 0.62, "marco": Color(0.0, 0.0, 0.0, 0.0),
				"panel": "no", "silla": "plegable", "cortina": false,
				"reloj": false, "mesa_extra": "taza",
			}


func _build() -> void:
	var e: Dictionary = _estilo()
	var acc: Color = _accent()



	_ground(Color(e["suelo"]))


	_backdrop(Color(e["pared"]))
	_techo(Color(0.19, 0.18, 0.21))
	_zocalo(bool(e["moldura"]))
	_panelado(e)
	_ventanal()
	if bool(e["cortina"]):
		_cortinas()
	_emblema(e)
	_pared_menuda(e)
	_mueble(e, acc)
	if bool(e["planta"]):
		_planta()
	_alfombra(String(e["alfombra"]), acc)
	_mesa(e, acc)
	_lampara(String(e["lampara"]))
	_sillas(e)
	_papeles(e)
	_servicio(e)
	_mesa_extra(e)
	_junta(e)






func _ventanal() -> void:










	var x: float = -0.75
	if div == 1:
		_quad(Vector2(1.8, 0.95), _dim(Color(0.1, 0.13, 0.24)),
			Vector3(x, 1.72, PARED_Z + CAPA_VANO), Vector3.ZERO, true)



		_box(Vector3(1.96, 0.07, 0.1), Color(0.16, 0.16, 0.19), Vector3(x, 2.23, PARED_Z + CAPA_VANO))
		_box(Vector3(1.96, 0.07, 0.1), Color(0.16, 0.16, 0.19), Vector3(x, 1.21, PARED_Z + CAPA_VANO))
		for sx in [-0.95, 0.95]:
			_box(Vector3(0.07, 1.09, 0.1), Color(0.16, 0.16, 0.19),
				Vector3(x + float(sx), 1.72, PARED_Z + CAPA_VANO))





		var suelo: float = 1.245
		var luces: Array = []
		for t in 5:
			var sd: int = absi(hash("junta_torre%d" % t))
			var alto: float = 0.34 + float(sd % 5) * 0.11
			var ancho: float = 0.26 + float((sd / 7) % 3) * 0.08
			var tx: float = x - 0.68 + float(t) * 0.34
			_quad(Vector2(ancho, alto), Color(0.05, 0.06, 0.11),
				Vector3(tx, suelo + alto * 0.5, PARED_Z + CAPA_VANO + 0.01), Vector3.ZERO, true)


			var filas: int = int(alto / 0.09)
			for f in filas:
				for c in 2:
					if (sd /(f + 2)) % 3 == 0:
						continue
					luces.append(Vector3(tx - 0.06 + float(c) * 0.12,
						suelo + 0.07 + float(f) * 0.09, PARED_Z + CAPA_VANO + 0.02))
		_quads(Vector2(0.05, 0.05), _dim(Color(0.98, 0.88, 0.58)), luces,
			Vector3.ZERO, true)
	else:
		var lamas: Array = []
		for i in 8:
			lamas.append(Vector3(x, 1.32 + float(i) * 0.12, PARED_Z + CAPA_VANO))
		_quads(Vector2(1.8, 0.08), _dim(Color(0.34, 0.33, 0.3)), lamas,
			Vector3.ZERO, true)














func _emblema(e: Dictionary) -> void:
	var x: float = 1.95
	var lado: float = float(e["escudo"])
	var y: float = 1.74
	var marco: Color = Color(e["marco"])


	if marco.a > 0.0:
		_box(Vector3(lado + 0.16, lado + 0.16, 0.07), marco, Vector3(x, y, PARED_Z + CAPA_VANO))
		_box(Vector3(lado + 0.02, lado + 0.02, 0.05), Color(0.1, 0.1, 0.12),
			Vector3(x, y, PARED_Z + CAPA_VANO + 0.04))
	var tex: Texture2D = _escudo_tex()
	if tex != null:
		_quad_tex(Vector2(lado, lado), tex, Vector3(x, y, PARED_Z + CAPA_VANO + 0.07))


	if marco.a > 0.0:
		_box(Vector3(lado + 0.16, 0.05, 0.08), Color(0.72, 0.6, 0.34),
			Vector3(x, y - lado * 0.5 - 0.2, PARED_Z + CAPA_VANO))





func _escudo_tex() -> Texture2D:
	if club.is_empty():
		return null
	var vp: SubViewport = SubViewport.new()
	vp.size = Vector2i(ESCUDO_PX, ESCUDO_PX)
	vp.transparent_bg = true
	vp.render_target_update_mode = SubViewport.UPDATE_ONCE
	vp.disable_3d = true
	_world.add_child(vp)
	var crest: CrestView = CrestView.new()
	crest.set_anchors_preset(Control.PRESET_FULL_RECT)
	crest.custom_minimum_size = Vector2(ESCUDO_PX, ESCUDO_PX)
	crest.set_team(club)
	vp.add_child(crest)
	return vp.get_texture()


func _mesa(e: Dictionary, acc: Color) -> void:
	var r: float = float(e["mesa_r"])
	var madera: Color = Color(e["madera"])
	var c: Vector3 = Vector3(0.0, 0.0, MESA_Z)


	_cyl(r, MESA_GRUESO, c + Vector3(0.0, MESA_Y, 0.0), madera)



	_cyl(r + 0.015, 0.045, c + Vector3(0.0, MESA_Y - 0.05, 0.0), Color(e["filo"]))





	if bool(e["cenefa"]):
		_cyl(r - 0.1, 0.012, c + Vector3(0.0, MESA_Y + MESA_GRUESO * 0.5, 0.0),
			acc.darkened(0.15))
		_cyl(r - 0.19, 0.014, c + Vector3(0.0, MESA_Y + MESA_GRUESO * 0.5, 0.0), madera)



	_cyl(PIE_R, MESA_Y - 0.12, c + Vector3(0.0,(MESA_Y - 0.12) * 0.5, 0.0),
		Color(e["filo"]).darkened(0.2))
	_cyl(PLATO_R, 0.07, c + Vector3(0.0, 0.035, 0.0), Color(e["filo"]).darkened(0.3))






func _asiento(e: Dictionary, i: int, radio: float) -> Vector3:
	var angs: Array = e["ang"]
	var a: float = deg_to_rad(float(angs[clampi(i, 0, angs.size() - 1)]))
	return Vector3(sin(a) * radio, 0.0, MESA_Z - cos(a) * radio)















func _papeles(e: Dictionary) -> void:
	var y: float = MESA_Y + MESA_GRUESO * 0.5
	var n: int = int(e["gente"])
	var r: float = float(e["mesa_r"])
	for i in mini(objetivos, 5):
		var at: Vector3
		if i < n:
			at = _asiento(e, i, r - 0.34)
		else:


			at = _asiento(e,(i - n) % n, r - 0.85) \
					+ Vector3(0.14 * float(i - n) - 0.1, 0.0, 0.1)
		_hoja(Vector3(at.x, y, at.z), float(i) * 23.0 - 20.0)





func _hoja(pos: Vector3, giro: float) -> void:
	_box(Vector3(0.3, 0.006, 0.4), Color(0.9, 0.88, 0.82), pos, giro)
	_box(Vector3(0.3, 0.006, 0.4), Color(0.96, 0.95, 0.91),
		pos + Vector3(0.02, 0.007, -0.015), giro + 7.0)



	_quad(Vector2(0.17, 0.035), Color(0.42, 0.42, 0.45),
		pos + Vector3(0.02, 0.012, -0.02), Vector3(-90.0, giro + 7.0, 0.0), true)





func _servicio(e: Dictionary) -> void:
	var y: float = MESA_Y + MESA_GRUESO * 0.5
	var r: float = float(e["mesa_r"])
	for i in int(e["gente"]):
		var at: Vector3 = _asiento(e, i, r - 0.3)


		_cyl(0.032, 0.085, Vector3(at.x + 0.26, y + 0.043, at.z + 0.04),
			Color(0.6, 0.7, 0.78))


	_cyl(0.05, 0.15, Vector3(0.12, y + 0.075, MESA_Z - 0.3), Color(0.6, 0.72, 0.8))
	_cyl(0.022, 0.05, Vector3(0.12, y + 0.17, MESA_Z - 0.3), Color(0.6, 0.72, 0.8))
























func _junta(e: Dictionary) -> void:
	var aplauden: bool = relacion >= APLAUDE_DESDE
	var ellos: String = "gala_clap_south" if aplauden else "gala_south"
	var cuadros: int = 4 if aplauden else 1
	var ella: String = "mujer_look_gala_clap_south" if aplauden \
			else "mujer_look_gala_idle_south"
	var id: String = String(club.get("id", ""))
	var n: int = int(e["gente"])
	var radio: float = float(e["mesa_r"]) + GENTE_FUERA
	for i in n:


		var puesto: int = i
		var mujer: bool = puesto == 1
		var spr: AnimatedSprite3D = _person(
			ella if mujer else ellos, cuadros,
			_cara_mujer(id) if mujer else _cara_ellos(id, puesto),
			Ceremony.PAREJA_PIXEL if mujer else 0.0)




		var at: Vector3 = _asiento(e, i, radio)
		spr.position = Vector3(at.x, _feet_y(spr), at.z)
		spr.modulate = _dim(Color.WHITE)
		_world.add_child(spr)

































func _cara_ellos(id: String, puesto: int) -> Dictionary:
	var cfg: Dictionary = KitRecolor.appearance_for("junta|%s|%d" % [id, puesto], {})
	for k in ["hair_style", "facial_hair", "hair", "brows"]:
		cfg.erase(k)
	return cfg


func _cara_mujer(id: String) -> Dictionary:
	var sd: int = absi(hash("junta_ella|" + id))
	return KitRecolor.sin_pelirrojo_oscuro({
		"skin": KitRecolor.SKIN_TONES[sd % KitRecolor.SKIN_TONES.size()],
		"hair": KitRecolor.HAIR_COLORS[(sd / 7) % KitRecolor.HAIR_COLORS.size()],
	})









func _zocalo(moldura: bool) -> void:
	var oscuro: Color = Color(0.16, 0.15, 0.17)
	var claro: Color = Color(0.36, 0.34, 0.36)
	_box(Vector3(PARED.x, 0.16, 0.07), oscuro, Vector3(0.0, 0.08, PARED_Z + 0.05))
	if moldura:
		_box(Vector3(PARED.x, 0.09, 0.09), claro,
			Vector3(0.0, PARED.y - 0.1, PARED_Z + 0.06))
	for sx in [- COSTADO_X, COSTADO_X]:
		_box(Vector3(0.07, 0.16, 5.4), oscuro,
			Vector3(float(sx) - signf(float(sx)) * 0.05, 0.08, PARED_Z + 2.7))
		if moldura:
			_box(Vector3(0.09, 0.09, 5.4), claro,
				Vector3(float(sx) - signf(float(sx)) * 0.06, PARED.y - 0.1, PARED_Z + 2.7))
















func _mueble(e: Dictionary, acc: Color) -> void:






	var x: float = -2.24
	var z: float = PARED_Z + 0.42
	var kind: String = String(e["mueble"])
	if kind == "archivador":


		_box(Vector3(0.9, 1.45, 0.55), Color(0.34, 0.36, 0.37), Vector3(x, 0.725, z))
		for i in 4:
			_box(Vector3(0.84, 0.02, 0.03), Color(0.22, 0.24, 0.25),
				Vector3(x, 0.2 + float(i) * 0.34, z + 0.28))
			_box(Vector3(0.2, 0.04, 0.04), Color(0.5, 0.52, 0.53),
				Vector3(x, 0.32 + float(i) * 0.34, z + 0.29))
		return
	var alta: bool = kind == "vitrina"
	var cuerpo: float = 1.05 if alta else 0.92
	_box(Vector3(1.15, cuerpo, 0.46), Color(0.21, 0.15, 0.11),
		Vector3(x, cuerpo * 0.5, z))
	_box(Vector3(1.1, 0.04, 0.48), Color(0.31, 0.23, 0.15),
		Vector3(x, cuerpo + 0.04, z))
	if alta:



		_box(Vector3(1.15, 0.86, 0.05), acc.darkened(0.45), Vector3(x, 1.5, z - 0.2))
		for dx in [-0.55, 0.55]:
			_box(Vector3(0.07, 0.86, 0.44), Color(0.19, 0.14, 0.1),
				Vector3(x + float(dx), 1.5, z))
		_box(Vector3(1.28, 0.07, 0.54), Color(0.31, 0.23, 0.15), Vector3(x, 1.96, z))
	var oro: Color = Color(0.82, 0.68, 0.38)
	var copas: int = int(e["copas"])
	for i in copas:
		var tx: float = x +(0.0 if copas == 1 else -0.34 + float(i) * 0.34)
		var alto: float = 0.13 + float(i % 2) * 0.07
		var base_y: float = cuerpo + 0.06
		_cyl(0.055, 0.03, Vector3(tx, base_y, z + 0.02), Color(0.16, 0.12, 0.09))
		_cyl(0.018, alto, Vector3(tx, base_y + 0.02 + alto * 0.5, z + 0.02), oro)
		_cyl(0.052, 0.075, Vector3(tx, base_y + 0.03 + alto, z + 0.02), oro)










func _planta() -> void:



	var at: Vector3 = Vector3(2.18, 0.0, PARED_Z + 1.05)
	_cyl(0.21, 0.4, at + Vector3(0.0, 0.2, 0.0), Color(0.32, 0.26, 0.21))
	_cyl(0.22, 0.06, at + Vector3(0.0, 0.43, 0.0), Color(0.13, 0.11, 0.09))

	_cyl(0.042, 0.44, at + Vector3(0.0, 0.68, 0.0), Color(0.24, 0.2, 0.14))
	for i in 6:
		var g: float = float(i) * 61.0
		var tumbo: float = 26.0 + float(i % 3) * 16.0


		var largo: float = 0.46 + float(i % 2) * 0.14
		_quad(Vector2(0.19, largo), Color(0.15, 0.31, 0.18) if i % 2 == 0 \
				else Color(0.19, 0.38, 0.21),
			at + Vector3(sin(deg_to_rad(g)) * 0.12, 1.06, cos(deg_to_rad(g)) * 0.12),
			Vector3(0.0, g, tumbo))









func _alfombra(modo: String, acc: Color) -> void:
	if modo == "no":
		return
	if modo == "cenefa":
		_cyl(2.75, 0.012, Vector3(0.0, 0.01, MESA_Z), acc.darkened(0.55))
	else:
		_cyl(2.75, 0.012, Vector3(0.0, 0.01, MESA_Z), Color(0.19, 0.18, 0.2))
	_cyl(2.58, 0.014, Vector3(0.0, 0.012, MESA_Z), Color(0.22, 0.2, 0.23))

















func _lampara(modo: String) -> void:
	var y: float = MESA_Y + 0.85
	match modo:
		"barra":
			for dx in [-0.5, 0.5]:
				_box(Vector3(0.02, 1.2, 0.02), Color(0.12, 0.12, 0.13),
					Vector3(float(dx), y + 0.6, MESA_Z))
			_box(Vector3(1.3, 0.09, 0.26), Color(0.2, 0.19, 0.21), Vector3(0.0, y, MESA_Z))
			_box(Vector3(1.18, 0.05, 0.16), Color(1.0, 0.96, 0.84),
				Vector3(0.0, y - 0.06, MESA_Z), 0.0, true)
		"plafon":
			_box(Vector3(0.03, 1.3, 0.03), Color(0.12, 0.12, 0.13),
				Vector3(0.0, y + 0.65, MESA_Z))
			_cyl(0.34, 0.1, Vector3(0.0, y, MESA_Z), Color(0.22, 0.21, 0.22))
			_cyl(0.3, 0.05, Vector3(0.0, y - 0.07, MESA_Z), Color(1.0, 0.95, 0.82))
		_:


			_box(Vector3(0.02, 1.35, 0.02), Color(0.12, 0.12, 0.13),
				Vector3(0.0, y + 0.67, MESA_Z))
			_cyl(0.035, 0.07, Vector3(0.0, y + 0.02, MESA_Z), Color(0.3, 0.29, 0.28))
			_cyl(0.065, 0.11, Vector3(0.0, y - 0.07, MESA_Z), Color(1.0, 0.94, 0.78))
	var foco: OmniLight3D = OmniLight3D.new()
	foco.shadow_enabled = false
	foco.light_color = Color(1.0, 0.94, 0.8)


	foco.light_energy = 1.5 if modo == "barra" else (1.25 if modo == "plafon" else 0.95)
	foco.omni_range = 4.2
	foco.position = Vector3(0.0, y - 0.12, MESA_Z)
	_world.add_child(foco)


















func _panelado(e: Dictionary) -> void:
	var z: float = PARED_Z + CAPA_PANEL
	match String(e["panel"]):
		"boiserie":
			_box(Vector3(PARED.x, 1.15, 0.03), Color(0.25, 0.18, 0.12),
				Vector3(0.0, 1.72, z))
			for y in [1.15, 2.3]:
				_box(Vector3(PARED.x, 0.07, 0.05), Color(0.34, 0.25, 0.16),
					Vector3(0.0, float(y), PARED_Z + CAPA_LISTON))
			var juntas: Array = []
			for i in 10:
				juntas.append(Vector3(-4.05 + float(i) * 0.9, 1.72,
					PARED_Z + CAPA_LISTON + 0.01))
			_quads(Vector2(0.025, 1.1), Color(0.17, 0.12, 0.08), juntas)
		"dado":
			_box(Vector3(PARED.x, 1.45, 0.03), Color(0.23, 0.23, 0.22),
				Vector3(0.0, 0.725, z))
			_box(Vector3(PARED.x, 0.06, 0.05), Color(0.38, 0.37, 0.35),
				Vector3(0.0, 1.45, PARED_Z + CAPA_LISTON))
		_:


			_quads(Vector2(0.7, 0.55), Color(0.31, 0.3, 0.27),
				[Vector3(-0.3, 2.05, z + 0.02), Vector3(1.15, 1.45, z + 0.02)], Vector3.ZERO, true)






func _cortinas() -> void:



	var x: float = -0.75
	var z: float = PARED_Z + CAPA_VANO + 0.06


	_cyl(0.035, 2.4, Vector3(x, 2.36, z), Color(0.38, 0.31, 0.2),
		Vector3(0.0, 0.0, 90.0))





	for lado in [-1.0, 1.0]:
		for i in 3:
			_box(Vector3(0.12, 1.25, 0.09), Color(0.3, 0.17, 0.15).lightened(0.06 * float(i)),
				Vector3(x + float(lado) *(0.98 + float(i) * 0.11), 1.7, z))





func _pared_menuda(e: Dictionary) -> void:
	var z: float = PARED_Z + CAPA_MENUDA
	if bool(e["reloj"]):








		var rx: float = 1.1
		_cyl(0.19, 0.05, Vector3(rx, 2.1, z), Color(0.2, 0.19, 0.2),
			Vector3(90.0, 0.0, 0.0))
		_cyl(0.155, 0.055, Vector3(rx, 2.1, z + 0.01), Color(0.9, 0.88, 0.82),
			Vector3(90.0, 0.0, 0.0))

		_quad(Vector2(0.022, 0.11), Color(0.15, 0.15, 0.16), Vector3(rx, 2.14, z + 0.05),
			Vector3.ZERO, true)
		_quad(Vector2(0.09, 0.022), Color(0.15, 0.15, 0.16), Vector3(rx + 0.035, 2.1, z + 0.05),
			Vector3.ZERO, true)











	var cuadro_x: float = 0.64
	var cuadro_y: float = 2.1
	match String(e["panel"]):
		"boiserie":
			_box(Vector3(0.34, 0.28, 0.05), Color(0.5, 0.41, 0.24),
				Vector3(cuadro_x, cuadro_y, z))
			_quad(Vector2(0.27, 0.21), Color(0.34, 0.39, 0.46),
				Vector3(cuadro_x, cuadro_y, z + 0.04), Vector3.ZERO, true)
		"dado":
			_box(Vector3(0.32, 0.26, 0.05), Color(0.28, 0.21, 0.14),
				Vector3(cuadro_x, cuadro_y, z))
			_quad(Vector2(0.26, 0.2), Color(0.34, 0.39, 0.46),
				Vector3(cuadro_x, cuadro_y, z + 0.04), Vector3.ZERO, true)
		_:



			_quad(Vector2(0.24, 0.34), _accent().darkened(0.2),
				Vector3(0.58, 1.74, z), Vector3(0.0, 0.0, 7.0), true)
			_quad(Vector2(0.24, 0.06), Color(0.85, 0.82, 0.74),
				Vector3(0.58, 1.89, z + 0.01), Vector3(0.0, 0.0, 7.0), true)
			_quad(Vector2(0.1, 0.1), _accent().darkened(0.45),
				Vector3(0.6, 1.55, z + 0.01), Vector3(0.0, 0.0, 45.0), true)



















func _sillas(e: Dictionary) -> void:
	var radio: float = float(e["mesa_r"]) + GENTE_FUERA + 0.3
	var modo: String = String(e["silla"])
	for i in int(e["gente"]):
		var at: Vector3 = _asiento(e, i, radio)


		var giro: float = float((e["ang"] as Array)[i])
		match modo:
			"alta":
				_box(Vector3(0.94, 0.62, 0.09), Color(0.14, 0.11, 0.1),
					Vector3(at.x, 1.1, at.z), giro)


				for k in 2:
					_box(Vector3(0.88, 0.02, 0.11), Color(0.09, 0.07, 0.07),
						Vector3(at.x, 0.96 + float(k) * 0.2, at.z), giro)


				_box(Vector3(0.96, 0.05, 0.11), Color(0.42, 0.34, 0.2),
					Vector3(at.x, 1.42, at.z), giro)
			"oficina":
				_box(Vector3(0.86, 0.5, 0.08), Color(0.17, 0.17, 0.19),
					Vector3(at.x, 1.12, at.z), giro)
				_box(Vector3(0.88, 0.04, 0.1), Color(0.26, 0.26, 0.29),
					Vector3(at.x, 1.39, at.z), giro)
			_:


				for k in 2:
					_box(Vector3(0.76, 0.08, 0.05), Color(0.3, 0.31, 0.32),
						Vector3(at.x, 1.14 + float(k) * 0.2, at.z), giro)






func _mesa_extra(e: Dictionary) -> void:
	var y: float = MESA_Y + MESA_GRUESO * 0.5
	var r: float = float(e["mesa_r"])
	var at: Vector3 = _asiento(e, 0, r - 0.62)
	if String(e["mesa_extra"]) == "carpeta":
		_box(Vector3(0.36, 0.05, 0.46), Color(0.24, 0.14, 0.11),
			Vector3(at.x - 0.3, y + 0.025, at.z + 0.24), -14.0)
		_box(Vector3(0.3, 0.012, 0.4), Color(0.86, 0.83, 0.76),
			Vector3(at.x - 0.28, y + 0.056, at.z + 0.22), -14.0)


		_box(Vector3(0.14, 0.014, 0.014), Color(0.78, 0.64, 0.34),
			Vector3(at.x - 0.24, y + 0.07, at.z + 0.3), 24.0)
	else:
		_cyl(0.045, 0.09, Vector3(at.x - 0.34, y + 0.045, at.z + 0.2),
			Color(0.8, 0.78, 0.72))


		_box(Vector3(0.05, 0.05, 0.015), Color(0.8, 0.78, 0.72),
			Vector3(at.x - 0.28, y + 0.05, at.z + 0.2))


	for i in int(e["gente"]):
		var p: Vector3 = _asiento(e, i, r - 0.34)
		_box(Vector3(0.11, 0.011, 0.011), Color(0.16, 0.16, 0.18),
			Vector3(p.x - 0.19, y + 0.008, p.z + 0.06), 18.0)







func _ground(col: Color) -> void:
	_quad(Vector2(12.0, 10.0), col, Vector3(0.0, 0.0, -1.0),
		Vector3(-90.0, 0.0, 0.0))







func _techo(col: Color) -> void:
	_quad(Vector2(12.0, 10.0), col, Vector3(0.0, PARED.y, -1.0),
		Vector3(90.0, 0.0, 0.0))




func _backdrop(col: Color) -> void:
	_quad(PARED, col, Vector3(0.0, PARED.y * 0.5, PARED_Z))




	for sx in [- COSTADO_X, COSTADO_X]:
		_quad(Vector2(5.4, PARED.y), col,
			Vector3(float(sx), PARED.y * 0.5, PARED_Z + 2.7),
			Vector3(0.0, 90.0 * signf(- float(sx)), 0.0))






func _person(anim: String, frame_count: int, look: Dictionary,
		px: float = 0.0) -> AnimatedSprite3D:
	var spr: AnimatedSprite3D = AnimatedSprite3D.new()
	spr.pixel_size = px if px > 0.0 else PLAYER_HEIGHT_M / PLAYER_METRICS.x
	spr.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	spr.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	spr.sprite_frames = _frames("res://assets/sprites/anim/%s_%%02d.png" % anim,
		frame_count, look)
	spr.play("idle")
	return spr




func _frames(pattern: String, frame_count: int, look: Dictionary) -> SpriteFrames:
	var frames: SpriteFrames = SpriteFrames.new()
	frames.add_animation("idle")
	frames.set_animation_loop("idle", true)


	frames.set_animation_speed("idle", 3.5)
	for i in frame_count:
		var path: String = pattern % i
		if ResourceLoader.exists(path):
			frames.add_frame("idle", KitRecolor.apply(load(path), look))
	if frames.get_frame_count("idle") == 0:
		frames.add_frame("idle", _blank())
	return frames


func _blank() -> Texture2D:
	return ImageTexture.create_from_image(
		Image.create(2, 2, false, Image.FORMAT_RGBA8))



func _feet_y(spr: AnimatedSprite3D) -> float:
	var tex: Texture2D = spr.sprite_frames.get_frame_texture("idle", 0)
	if tex == null:
		return PLAYER_METRICS.y * spr.pixel_size
	var img: Image = tex.get_image()
	if img == null:
		return PLAYER_METRICS.y * spr.pixel_size
	if img.is_compressed():
		img.decompress()
	var used: Rect2i = img.get_used_rect()
	if used.size.y <= 0:
		return PLAYER_METRICS.y * spr.pixel_size
	var pad_bottom: float = float(img.get_height() - used.end.y)
	return (float(img.get_height()) * 0.5 - pad_bottom) * spr.pixel_size


func _quad(qsize: Vector2, col: Color, pos: Vector3,
		rot_deg: Vector3 = Vector3.ZERO, plano: bool = false) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	m.mesh = mesh
	m.material_override = _mat(col, plano)
	m.position = pos
	m.rotation_degrees = rot_deg
	_world.add_child(m)


func _box(bsize: Vector3, col: Color, pos: Vector3, rot_y: float = 0.0,
		plano: bool = false) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = bsize
	m.mesh = mesh
	m.material_override = _mat(col, plano)
	m.position = pos
	m.rotation_degrees.y = rot_y
	_world.add_child(m)








func _cyl(radius: float, height: float, pos: Vector3, col: Color,
		rot_deg: Vector3 = Vector3.ZERO) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = height
	mesh.radial_segments = 24
	mesh.rings = 1
	m.mesh = mesh
	m.material_override = _mat(col)
	m.position = pos



	m.rotation_degrees = rot_deg
	_world.add_child(m)







func _boxes(bsize: Vector3, col: Color, positions: Array) -> void:
	if positions.is_empty():
		return



	if positions.size() == 1:
		_box(bsize, col, positions[0])
		return
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = bsize
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = positions.size()
	for i in positions.size():
		mm.set_instance_transform(i, Transform3D(Basis(), positions[i]))
	var inst: MultiMeshInstance3D = MultiMeshInstance3D.new()
	inst.multimesh = mm
	inst.material_override = _mat(col)
	_world.add_child(inst)





func _quads(qsize: Vector2, col: Color, positions: Array,
		rot_deg: Vector3 = Vector3.ZERO, plano: bool = false) -> void:
	if positions.is_empty():
		return
	if positions.size() == 1:
		_quad(qsize, col, positions[0], rot_deg, plano)
		return
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	var mm: MultiMesh = MultiMesh.new()
	mm.transform_format = MultiMesh.TRANSFORM_3D
	mm.mesh = mesh
	mm.instance_count = positions.size()
	var basis: Basis = Basis.from_euler(Vector3(
		deg_to_rad(rot_deg.x), deg_to_rad(rot_deg.y), deg_to_rad(rot_deg.z)))
	for i in positions.size():
		mm.set_instance_transform(i, Transform3D(basis, positions[i]))
	var inst: MultiMeshInstance3D = MultiMeshInstance3D.new()
	inst.multimesh = mm
	inst.material_override = _mat(col, plano)
	_world.add_child(inst)















func _quad_tex(qsize: Vector2, tex: Texture2D, pos: Vector3) -> void:
	var m: MeshInstance3D = MeshInstance3D.new()
	var mesh: QuadMesh = QuadMesh.new()
	mesh.size = qsize
	m.mesh = mesh
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_texture = tex
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA_SCISSOR
	mat.alpha_scissor_threshold = 0.5
	m.mesh.material = mat
	m.position = pos
	_world.add_child(m)


func _mat(col: Color, plano: bool = false) -> StandardMaterial3D:
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	if plano:
		mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.albedo_color = col
	mat.roughness = 1.0
	mat.metallic = 0.0
	return mat
