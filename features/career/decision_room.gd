class_name DecisionRoom
extends Node3D






























const CASA: String = "casa"
const CALLE: String = "calle"
const PLATO: String = "plato"










const RESTAURANTE: String = "restaurante"
const BAR: String = "bar"
const GALERIA: String = "galeria"




const INSTALACIONES: String = "instalaciones"






const DESPACHO: String = "despacho"




const TROFEOS: String = "trofeos"





const ASAMBLEA: String = "asamblea"




const YAW: Dictionary = {
	CASA: 128.0, CALLE: 180.0, PLATO: 180.0,




	RESTAURANTE: 132.0, BAR: 138.0, GALERIA: 150.0,


	INSTALACIONES: 180.0,



	DESPACHO: 174.0,



	TROFEOS: 180.0,


	ASAMBLEA: 178.0,
}


const DIST: Dictionary = {
	CASA: 5.6, CALLE: 8.0, PLATO: 6.4,


	RESTAURANTE: 5.2, BAR: 5.4, GALERIA: 6.0,
	INSTALACIONES: 5.2,
	DESPACHO: 5.4,


	TROFEOS: 5.6,

	ASAMBLEA: 6.2,
}


const CONE_TAN: float = 0.194


const C_FLOOR_TILE: Color = Color("2f333b")
const C_WALL: Color = Color("3b4048")
const C_WALL_LOW: Color = Color("2b2f36")
const C_WOOD: Color = Color("9b7748")
const C_METAL: Color = Color("6b727d")
const C_DARK: Color = Color("15181d")
const C_LAMP: Color = Color("dfe6ef")
const C_ASPHALT: Color = Color("22252b")



var kind: String = CASA




var div: int = 2
var club_color: Color = Color("3a6fb5")

var crest: Texture2D = null


var sign_text: String = ""

var _yaw: float = 128.0
var _dist: float = 6.6


func _ready() -> void:
	_yaw = float(YAW.get(kind, 128.0))
	_dist = float(DIST.get(kind, 6.6))
	match kind:
		CALLE:
			_build_calle()
		PLATO:
			_build_plato()
		INSTALACIONES:
			_build_instalaciones()
		DESPACHO:
			_build_despacho()
		TROFEOS:
			_build_trofeos()
		ASAMBLEA:
			_build_asamblea()
		RESTAURANTE:
			_build_restaurante()
		BAR:
			_build_bar()
		GALERIA:
			_build_galeria()
		_:
			_build_casa()







func face() -> float:
	return 180.0 - _yaw



func cone(f: float, r: float) -> Vector3:
	var y: float = deg_to_rad(_yaw)
	var fwd: Vector3 = Vector3(- sin(y), 0.0, cos(y))
	var right: Vector3 = Vector3(- fwd.z, 0.0, fwd.x)
	return fwd * f + right * r



func cone_half_width(f: float) -> float:
	return CONE_TAN *(_dist + f)

































const CONE_TAN_TUMBADO: float = 1.45




func cone_half_width_tumbado(f: float) -> float:
	return CONE_TAN_TUMBADO *(_dist + f)






func _pared_derecha(r: float, f_fondo: float, h: float, c_low: Color = C_WALL_LOW,
		c_high: Color = C_WALL, low: float = 1.1) -> void:
	var desde: float = -(_dist + 4.0)
	var largo: float = f_fondo - desde
	_wall_col(cone(desde + largo * 0.5, r), largo, low, h, 90.0, c_low, c_high)







func _pieza(size: Vector3, f: float, r: float, y: float, col: Color, giro: float = 0.0,
		rough: float = 0.9, a: float = 0.0, d: float = 0.0) -> MeshInstance3D:
	return _pieza_mat(size, f, r, y, _mat(col, rough), giro, a, d)


func _pieza_mat(size: Vector3, f: float, r: float, y: float, mat: Material,
		giro: float = 0.0, a: float = 0.0, d: float = 0.0) -> MeshInstance3D:
	var g: float = deg_to_rad(giro)
	var mi: MeshInstance3D = _box_mat(size, _floor_at(f + a * sin(g) - d * cos(g),
		r + a * cos(g) + d * sin(g), y), mat)
	mi.rotation_degrees.y = face() + giro
	return mi




func _emisivo(col: Color, energia: float) -> StandardMaterial3D:
	var m: StandardMaterial3D = _mat(col, 0.5)
	m.emission_enabled = true
	m.emission = col
	m.emission_energy_multiplier = energia
	return m




func _libreria(f: float, r: float, giro: float, ancho: float, alto: float,
		col: Color) -> void:
	_pieza(Vector3(ancho, alto, 0.04), f, r, alto * 0.5, col.darkened(0.25), giro,
		0.9, 0.0, 0.02)
	for s in [-1.0, 1.0]:
		_pieza(Vector3(0.05, alto, 0.36), f, r, alto * 0.5, col, giro, 0.9,
			s *(ancho * 0.5 - 0.025), 0.18)
	var lomos: Array = [Color("7a3b34"), Color("2f4a6a"), Color("b39a62"),
		Color("3d5a45"), Color("5a4a6e"), Color("c8c2b4")]

	var baldas: int = maxi(2, int(alto / 0.42))
	for i in baldas:
		var y: float = 0.06 + float(i) *(alto - 0.12) / float(baldas - 1)
		_pieza(Vector3(ancho - 0.06, 0.035, 0.34), f, r, y, col, giro, 0.9, 0.0, 0.18)
		if i == baldas - 1:
			continue

		for k in 2:
			var w: float = ancho *(0.34 if (i + k) % 2 == 0 else 0.26)
			var lado: float =(-1.0 if k == 0 else 1.0) *(ancho * 0.5 - 0.06 - w * 0.5)
			var hh: float = 0.26 if (i + k) % 3 == 0 else 0.21
			_pieza(Vector3(w, hh, 0.24), f, r, y + 0.018 + hh * 0.5,
				lomos[(i * 2 + k) % lomos.size()], giro, 0.95, lado, 0.17)




func _planta(f: float, r: float, alto: float = 1.0) -> void:
	_pieza(Vector3(0.42, 0.44, 0.42), f, r, 0.22, Color("7d5a3e"))
	for i in 3:
		var dr: float =(float(i) - 1.0) * 0.2
		_pieza(Vector3(0.34, 0.5 * alto, 0.3), f, r + dr,
			0.5 + 0.25 * alto + float(i % 2) * 0.28 * alto,
			Color("2f4a35").lightened(float(i) * 0.08), 0.0, 0.95)




func _ventana_lateral(f: float, r: float, y: float, ancho: float, alto: float,
		cielo: Color, marco: Color, cortina: Color = Color(0, 0, 0, 0)) -> void:
	_pieza_mat(Vector3(ancho, alto, 0.03), f, r, y, _emisivo(cielo, 0.35), -90.0, 0.0,
		0.09)
	_pieza(Vector3(ancho + 0.1, 0.07, 0.06), f, r, y + alto * 0.5, marco, -90.0, 0.7,
		0.0, 0.11)
	_pieza(Vector3(ancho + 0.1, 0.07, 0.06), f, r, y - alto * 0.5, marco, -90.0, 0.7,
		0.0, 0.11)
	_pieza(Vector3(0.05, alto, 0.06), f, r, y, marco, -90.0, 0.7, 0.0, 0.11)
	_pieza(Vector3(ancho, 0.05, 0.06), f, r, y, marco, -90.0, 0.7, 0.0, 0.11)
	if cortina.a <= 0.0:
		return
	for s in [-1.0, 1.0]:
		_pieza(Vector3(0.34, alto + 0.6, 0.08), f, r, y - 0.15, cortina, -90.0, 0.98,
			s *(ancho * 0.5 + 0.12), 0.16)




















const CASA_H: float = 2.7
const CASA_W: float = 11.0
const CASA_D: float = 9.0
const CASA_TV_F: float = 3.4


const CASA_TV_R: float = -0.95
const CASA_SOFA_F: float = 1.1


const CASA_TV_LIGHT: Color = Color("7fb4ff")


func _build_casa() -> void:
	_interior_light(Color("1c2130"), 1.4, Color("ffd9a8"), CASA_H, [])
	_shell(CASA_W, CASA_D, CASA_H, Color("4a3b2e"))


	var tv: Vector3 = cone(CASA_TV_F, CASA_TV_R)
	tv.y = 1.3
	_boxc(Vector3(2.1, 0.12, 0.1), _floor_at(CASA_TV_F, CASA_TV_R, 0.28), C_DARK, 0.8)
	_boxc(Vector3(2.15, 1.22, 0.08), tv, C_DARK, 0.6)
	var screen: StandardMaterial3D = _mat(CASA_TV_LIGHT, 0.4)
	screen.emission_enabled = true
	screen.emission = CASA_TV_LIGHT
	screen.emission_energy_multiplier = 3.4
	_box_matc(Vector3(1.98, 1.08, 0.02), tv + _depth(0.06), screen)
	var glow: OmniLight3D = OmniLight3D.new()
	glow.position = tv + _depth(0.5)
	glow.position.y = 1.4
	glow.omni_range = 11.0
	glow.light_energy = 3.0
	glow.light_color = CASA_TV_LIGHT
	glow.shadow_enabled = Settings.sombra_permitida()
	add_child(glow)


	var lamp: Vector3 = _floor_at(CASA_TV_F - 0.9, 1.5, 1.5)
	_cyl(0.04, 1.5, lamp, C_METAL, 0.5)
	var shade: StandardMaterial3D = _mat(Color("ffdfae"), 0.6)
	shade.emission_enabled = true
	shade.emission = Color("ffcf8a")
	shade.emission_energy_multiplier = 1.8
	_box_matc(Vector3(0.34, 0.3, 0.34), lamp + Vector3(0.0, 0.85, 0.0), shade)
	var warm: OmniLight3D = OmniLight3D.new()
	warm.position = lamp + Vector3(0.0, 0.85, 0.0)
	warm.omni_range = 7.0
	warm.light_energy = 2.0
	warm.light_color = Color("ffcf8a")
	add_child(warm)
	_casa_sofa()

	_boxc(Vector3(3.4, 0.02, 2.4), _floor_at(CASA_SOFA_F + 0.9, -0.5, 0.01),
		Color("5a4436"), 1.0)
	_casa_tumbado()









func _casa_tumbado() -> void:
	var pared: float = CASA_W * 0.42 - 0.07
	_ventana_lateral(0.7, pared, 1.45, 1.5, 1.3, Color("2a3a5c"),
		C_WOOD.darkened(0.3), Color("6e5546"))
	var tela: Color = Color("4b5260")
	var giro: float = -80.0
	_pieza(Vector3(0.95, 0.42, 0.85), 0.9, 3.55, 0.21, tela, giro, 0.98)
	_pieza(Vector3(0.95, 0.8, 0.2), 0.9, 3.55, 0.7, tela.darkened(0.12), giro, 0.98,
		0.0, -0.38)
	for s in [-1.0, 1.0]:
		_pieza(Vector3(0.2, 0.6, 0.85), 0.9, 3.55, 0.3, tela.darkened(0.2), giro, 0.98,
			s * 0.48)
	_pieza(Vector3(0.36, 0.34, 0.12), 0.9, 3.55, 0.6, club_color.darkened(0.2), giro,
		0.98, 0.18, -0.24)

	_pieza(Vector3(0.45, 0.55, 0.45), 1.55, 4.05, 0.275, C_WOOD.darkened(0.35))
	_cyl(0.03, 0.26, _floor_at(1.55, 4.05, 0.68), C_METAL, 0.5)
	_pieza_mat(Vector3(0.26, 0.2, 0.26), 1.55, 4.05, 0.9, _emisivo(Color("ffcf8a"), 1.6))
	_libreria(2.45, pared, -90.0, 1.3, 2.0, C_WOOD.darkened(0.35))
	_planta(3.35, 4.15, 1.2)








	var fondo: float = CASA_D * 0.42
	_pieza(Vector3(0.9, 0.8, 0.45), fondo - 0.3, -4.05, 0.4, C_WOOD.darkened(0.45))
	_pieza(Vector3(0.22, 0.28, 0.04), fondo - 0.35, -3.82, 0.94, C_DARK.lightened(0.3))
	_cyl(0.07, 0.3, _floor_at(fondo - 0.32, -4.3, 0.95), Color("8a9aae"), 0.4)
	_pieza(Vector3(0.8, 0.7, 0.04), fondo - 0.09, -4.05, 1.75, Color("2b2721"))
	_pieza_mat(Vector3(0.68, 0.58, 0.02), fondo - 0.12, -4.05, 1.75,
		_emisivo(Color("6a7f8e"), 0.25))
	_planta(fondo - 1.15, -4.2, 1.1)





func _casa_sofa() -> void:
	var f: float = CASA_SOFA_F
	var mid: float = -0.5
	var col: Color = Color("4b5260")
	_boxc(Vector3(2.5, 0.42, 0.95), _floor_at(f, mid, 0.21), col, 0.98)
	var back: Vector3 = _floor_at(f - 0.42, mid, 0.7)
	_boxc(Vector3(2.5, 0.85, 0.22), back, col.darkened(0.12), 0.98)
	for s in [-1.0, 1.0]:
		_boxc(Vector3(0.24, 0.62, 0.95), _floor_at(f, mid + s * 1.13, 0.31),
			col.darkened(0.2), 0.98)

	_boxc(Vector3(0.42, 0.4, 0.14), _floor_at(f - 0.2, mid - 0.75, 0.62), club_color, 0.98)
	var table: float = f + 1.5
	_boxc(Vector3(1.3, 0.08, 0.66), _floor_at(table, mid, 0.38), C_WOOD.darkened(0.35), 0.9)
	for sx in [-0.55, 0.55]:
		for sz in [-0.25, 0.25]:
			_boxc(Vector3(0.07, 0.36, 0.07),
				_floor_at(table + sz, mid + sx, 0.18), C_DARK, 0.9)
	_boxc(Vector3(0.18, 0.05, 0.11), _floor_at(table, mid + 0.28, 0.45), C_DARK.lightened(0.25), 0.7)














const REST_H: float = 3.4
const REST_W: float = 14.0




const REST_D: float = 16.0














const REST_TABLE_F: float = 2.0
const REST_TABLE_R: float = 0.15
const C_MANTEL: Color = Color("e8e2d4")
const C_VELA: Color = Color("ffb964")


func _build_restaurante() -> void:


	_interior_light(Color("2b1f19"), 1.7, Color("ffc98c"), REST_H, [])
	_shell(REST_W, REST_D, REST_H, Color("46342a"))


	_rest_mesa(REST_TABLE_F, REST_TABLE_R, true, true)




	_rest_mesa(4.3, 1.7, true)
	for m in [[5.5, -1.9], [6.1, 0.4]]:
		_rest_mesa(float(m[0]), float(m[1]), false)







	for l in [[REST_TABLE_F, REST_TABLE_R], [4.3, 1.7], [5.8, -0.6]]:
		_rest_lampara(float(l[0]), float(l[1]))


	_boxc(Vector3(4.2, 1.05, 0.5), _floor_at(6.4, 2.6, 0.52), C_WOOD.darkened(0.5), 0.9)
	_rest_tumbado()








func _rest_tumbado() -> void:
	var pared: float = REST_W * 0.42 - 0.07
	for m in [[1.6, 4.3], [4.0, 4.9], [6.0, 5.0], [2.6, -4.4], [4.8, -4.9]]:
		_rest_mesa(float(m[0]), float(m[1]), false)
	_rest_lampara(1.6, 4.3, false)
	_rest_lampara(2.6, -4.4, false)


	_pieza(Vector3(1.9, 0.9, 0.45), 3.0, pared, 0.45, C_WOOD.darkened(0.5), -90.0,
		0.9, 0.0, 0.25)
	for i in 5:
		var a: float = -0.7 + float(i) * 0.35
		var bot: MeshInstance3D = _pieza(Vector3(0.08, 0.3 if i % 2 == 0 else 0.24,
			0.08), 3.0, pared, 1.05, Color("3a2a2e").lightened(float(i % 3) * 0.12),
			-90.0, 0.5, a, 0.25)
		bot.position.y = 0.9 + bot.mesh.get_aabb().size.y * 0.5
	_pieza(Vector3(1.5, 0.95, 0.04), 3.0, pared, 1.85, C_WOOD.darkened(0.6), -90.0,
		0.9, 0.0, 0.04)
	_pieza_mat(Vector3(1.36, 0.81, 0.02), 3.0, pared, 1.85,
		_emisivo(Color("8f8678"), 0.2), -90.0, 0.0, 0.07)
	_ventana_lateral(0.4, pared, 1.6, 1.4, 1.5, Color("24304a"),
		C_WOOD.darkened(0.55), Color("6a2f2c"))








func _rest_lampara(f: float, r: float, luz_propia: bool = true) -> void:
	var at: Vector3 = _floor_at(f, r, 2.1)
	_cyl(0.015, REST_H - 2.1, _floor_at(f, r,(REST_H + 2.1) * 0.5), C_METAL, 0.5)
	var pant: StandardMaterial3D = _mat(Color("ffd7a0"), 0.5)
	pant.emission_enabled = true
	pant.emission = C_VELA
	pant.emission_energy_multiplier = 2.4
	_put(_cone_mesh(0.3, 0.26), pant, at, Vector3.ZERO, null)
	if not luz_propia:
		return
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = at + Vector3(0.0, -0.25, 0.0)
	luz.omni_range = 6.5
	luz.light_energy = 2.6
	luz.light_color = C_VELA
	add_child(luz)




func _rest_mesa(f: float, r: float, cerca: bool, sombra: bool = false) -> void:
	var col: Color = C_MANTEL if cerca else C_MANTEL.darkened(0.42)
	_cyl(0.62, 0.06, _floor_at(f, r, 0.75), col, 0.95)



	_cyl(0.58, 0.72, _floor_at(f, r, 0.36), col.darkened(0.08), 0.98)
	if not cerca:
		return








	for dr in [-0.26, 0.26]:
		_cyl(0.13, 0.02, _floor_at(f, r + dr, 0.79), col.lightened(0.2), 0.4)


	for dr in [-0.4, 0.4]:
		_cyl(0.045, 0.2, _floor_at(f + 0.2, r + dr, 0.88), Color("cfe0ea"), 0.25)

	var cera: StandardMaterial3D = _mat(C_VELA, 0.4)
	cera.emission_enabled = true
	cera.emission = C_VELA
	cera.emission_energy_multiplier = 3.6
	for dr in [-0.07, 0.07]:
		_box_matc(Vector3(0.05, 0.16, 0.05), _floor_at(f, r + dr, 0.86), cera)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.position = _floor_at(f, r, 1.05)
	luz.omni_range = 5.0
	luz.light_energy = 2.8
	luz.light_color = C_VELA
	luz.shadow_enabled = sombra and Settings.sombra_permitida()
	add_child(luz)













const BAR_H: float = 3.2
const BAR_W: float = 12.0
const BAR_D: float = 9.5

const BAR_F: float = 2.4
const BAR_R: float = -1.55
const BAR_TOP: float = 1.12
const C_BAR_GLOW: Color = Color("6fd0ff")


func _build_bar() -> void:
	_interior_light(Color("1b2434"), 1.5, Color("8fd6ff"), BAR_H, [])
	_shell(BAR_W, BAR_D, BAR_H, Color("2b2430"))



	var giro: float = 24.0
	_barra_pieza(Vector3(5.6, 0.12, 0.9), BAR_F, BAR_R, BAR_TOP, C_WOOD, giro, 0.7)
	_barra_pieza(Vector3(5.6, BAR_TOP - 0.12, 0.72), BAR_F, BAR_R,
		(BAR_TOP - 0.12) * 0.5, club_color.darkened(0.5), giro, 0.95)
	_barra_pieza(Vector3(5.6, 0.05, 0.06), BAR_F + 0.4, BAR_R, 0.18, C_METAL, giro, 0.35)



	var panel: StandardMaterial3D = _mat(C_BAR_GLOW, 0.3)
	panel.emission_enabled = true
	panel.emission = C_BAR_GLOW
	panel.emission_energy_multiplier = 2.8
	var back_f: float = BAR_F + 1.4
	var muro: MeshInstance3D = _box_mat(Vector3(5.4, 1.1, 0.06),
		_floor_at(back_f, BAR_R, 2.15), panel)
	muro.rotation_degrees.y = face() + giro
	for y in [1.62, 2.22]:
		var est: MeshInstance3D = _box(Vector3(5.4, 0.07, 0.3),
			_floor_at(back_f - 0.02, BAR_R, y), C_WOOD.darkened(0.4), 0.9)
		est.rotation_degrees.y = face() + giro
	for i in 10:
		var t: float = -2.2 + float(i) * 0.49
		var alta: bool = i % 3 != 1
		var arriba: bool = i % 2 == 0
		var p: Vector3 = _barra_punto(back_f - 0.06, BAR_R, t, giro)
		p.y =(2.26 if arriba else 1.66) +(0.17 if alta else 0.13)
		_cyl(0.055, 0.34 if alta else 0.26, p,
			Color("2a3a2e").lightened(float(i % 4) * 0.09), 0.5)
	var glow: OmniLight3D = OmniLight3D.new()
	glow.position = _floor_at(back_f - 0.7, BAR_R, 2.0)
	glow.omni_range = 13.0
	glow.light_energy = 2.8
	glow.light_color = C_BAR_GLOW
	glow.shadow_enabled = Settings.sombra_permitida()
	add_child(glow)

	for t in [-1.7, -0.6, 0.9]:
		var at: Vector3 = _barra_punto(BAR_F - 0.95, BAR_R, t, giro)
		_cyl(0.06, 0.72, at + Vector3(0.0, 0.36, 0.0), C_METAL, 0.4)
		_cyl(0.24, 0.1, at + Vector3(0.0, 0.77, 0.0), Color("52343a"), 0.95)

	for t in [-0.15, 0.12]:
		var v: Vector3 = _barra_punto(BAR_F - 0.15, BAR_R, t, giro)
		v.y = BAR_TOP + 0.13
		_cyl(0.05, 0.14, v, Color("d9c07a"), 0.3)


	var col: Vector3 = _floor_at(BAR_F - 0.3, BAR_R + 0.6, BAR_H - 0.75)
	var pant: StandardMaterial3D = _mat(Color("ffd7a0"), 0.5)
	pant.emission_enabled = true
	pant.emission = Color("ffc27e")
	pant.emission_energy_multiplier = 2.2
	_cyl(0.02, 0.7, col + Vector3(0.0, 0.4, 0.0), C_METAL, 0.5)
	_put(_cone_mesh(0.28, 0.26), pant, col, Vector3.ZERO, null)
	var warm: OmniLight3D = OmniLight3D.new()
	warm.position = col
	warm.omni_range = 7.0
	warm.light_energy = 2.4
	warm.light_color = Color("ffc27e")
	add_child(warm)
	_bar_tumbado()








func _bar_tumbado() -> void:
	var pared: float = BAR_W * 0.42 - 0.07
	for m in [[0.7, 3.9], [2.6, 4.3]]:
		var f: float = float(m[0])
		var r: float = float(m[1])
		_cyl(0.05, 1.05, _floor_at(f, r, 0.525), C_METAL, 0.4)
		_cyl(0.32, 0.05, _floor_at(f, r, 1.07), C_WOOD.darkened(0.2), 0.7)
		_cyl(0.22, 0.03, _floor_at(f, r, 0.015), C_METAL.darkened(0.3), 0.5)
		for dr in [-0.55, 0.55]:
			_cyl(0.05, 0.72, _floor_at(f - 0.15, r + dr, 0.36), C_METAL, 0.4)
			_cyl(0.22, 0.1, _floor_at(f - 0.15, r + dr, 0.77), Color("52343a"), 0.95)
		_cyl(0.045, 0.14, _floor_at(f, r - 0.1, 1.165), Color("d9c07a"), 0.3)


	var fondo: float = BAR_D * 0.42
	_pieza(Vector3(0.85, 1.5, 0.55), fondo - 0.55, 4.45, 0.75, Color("3a1f22"), -45.0, 0.6)
	_pieza_mat(Vector3(0.62, 0.6, 0.03), fondo - 0.55, 4.45, 0.95,
		_emisivo(Color("ffb35c"), 1.8), -45.0, 0.0, 0.29)
	_pieza_mat(Vector3(0.7, 0.16, 0.03), fondo - 0.55, 4.45, 1.38,
		_emisivo(club_color.lightened(0.2), 1.4), -45.0, 0.0, 0.29)

	_pieza_mat(Vector3(6.5, 0.05, 0.05), 0.5, pared, 2.55, _emisivo(C_BAR_GLOW, 2.6),
		-90.0, 0.0, 0.08)

	_pieza(Vector3(0.9, 1.2, 0.04), 1.7, pared, 1.75, C_DARK, -90.0, 0.9, 0.0, 0.04)
	_pieza(Vector3(0.78, 1.08, 0.02), 1.7, pared, 1.75, club_color, -90.0, 0.9, 0.0, 0.07)
	_pieza(Vector3(0.78, 0.16, 0.02), 1.7, pared, 1.55, Color("e9e6dd"), -90.0, 0.9,
		0.0, 0.08)






func _barra_punto(f: float, r: float, t: float, giro: float) -> Vector3:
	var a: float = deg_to_rad(giro)
	return _floor_at(f + t * sin(a), r + t * cos(a), 0.0)



func _barra_pieza(size: Vector3, f: float, r: float, y: float, col: Color,
		giro: float, rough: float) -> void:
	var mi: MeshInstance3D = _box(size, _floor_at(f, r, y), col, rough)
	mi.rotation_degrees.y = face() + giro




func _cone_mesh(radius: float, height: float) -> CylinderMesh:
	var m: CylinderMesh = CylinderMesh.new()
	m.top_radius = radius * 0.35
	m.bottom_radius = radius
	m.height = height
	m.radial_segments = 12
	m.rings = 1
	return m













const GAL_H: float = 4.0
const GAL_W: float = 13.0
const GAL_D: float = 10.0

const GAL_WALL_F: float = 3.8
const C_GAL_WALL: Color = Color("d9d6cf")


const GAL_CUADROS: Array = [
	[-1.9, 0.9, 1.2, Color("8c3a3f")],
	[-0.55, 1.4, 0.85, Color("2f4f6e")],
	[1.15, 0.75, 1.5, Color("caa14a")],
]


func _build_galeria() -> void:
	_interior_light(Color("c9c6c0"), 1.5, Color("fff4e0"), GAL_H, [])
	_shell(GAL_W, GAL_D, GAL_H, Color("bdb9b1"))



	var muro: MeshInstance3D = _box(Vector3(9.0, GAL_H - 0.2, 0.12),
		cone(GAL_WALL_F, 0.0) + Vector3(0.0,(GAL_H - 0.2) * 0.5, 0.0),
		C_GAL_WALL, 0.95)
	muro.rotation_degrees.y = face()
	for c in GAL_CUADROS:
		_gal_cuadro(float(c[0]), float(c[1]), float(c[2]), c[3])


	var peana: Vector3 = _floor_at(1.7, 1.75, 0.55)
	_boxc(Vector3(0.5, 1.1, 0.5), peana, C_GAL_WALL.darkened(0.06), 0.95)
	_cyl(0.17, 0.44, peana + Vector3(0.0, 0.77, 0.0), Color("7c8894"), 0.35)

	_boxc(Vector3(1.8, 0.12, 0.5), _floor_at(1.2, -1.9, 0.45),
		C_WOOD.darkened(0.25), 0.9)
	for dr in [-0.7, 0.7]:
		_boxc(Vector3(0.12, 0.45, 0.45), _floor_at(1.2, -1.9 + dr, 0.22),
			C_WOOD.darkened(0.4), 0.9)
	_gal_tumbado()









func _gal_tumbado() -> void:
	var der: float = GAL_W * 0.42 - 0.09
	var izq: float = - der
	var fondo: float = GAL_D * 0.42

	var desde: float = -(_dist + 4.0)
	for r in [der, izq]:
		_pieza(Vector3(fondo - desde, GAL_H - 0.1, 0.06),(desde + fondo) * 0.5, r,
			(GAL_H - 0.1) * 0.5, C_GAL_WALL, 90.0, 0.95)

		_boxc(Vector3(1.4, GAL_H - 0.2, 0.12), cone(GAL_WALL_F, signf(r) * 5.0)
			+ Vector3(0.0,(GAL_H - 0.2) * 0.5, 0.0), C_GAL_WALL, 0.95)
	for c in [[0.6, der, -90.0, 1.1, 0.8, Color("4f6b4a")],
			[2.6, der, -90.0, 0.8, 1.25, Color("b8643c")],
			[2.0, izq, 90.0, 1.3, 0.9, Color("6a4f7a")]]:
		var f: float = float(c[0])
		var r: float = float(c[1])
		var g: float = float(c[2])
		var w: float = float(c[3])
		var h: float = float(c[4])
		_pieza(Vector3(w + 0.12, h + 0.12, 0.05), f, r, 1.65, Color("2b2721"), g, 0.85,
			0.0, 0.05)
		_pieza_mat(Vector3(w, h, 0.02), f, r, 1.65, _emisivo(c[5], 0.5), g, 0.0, 0.09)
	var peana: Vector3 = _floor_at(1.4, 4.2, 0.55)
	_boxc(Vector3(0.5, 1.1, 0.5), peana, C_GAL_WALL.darkened(0.06), 0.95)
	_boxc(Vector3(0.22, 0.5, 0.22), peana + Vector3(0.0, 0.8, 0.0), Color("a86f4a"), 0.5)

	for dr in [-0.55, 0.55]:
		_cyl(0.03, 0.9, _floor_at(0.75, 4.2 + dr, 0.45), Color("b8954a"), 0.35)
	_pieza(Vector3(1.1, 0.04, 0.04), 0.75, 4.2, 0.82, Color("8c2f35"), 0.0, 0.9)





func _gal_cuadro(r: float, w: float, h: float, col: Color) -> void:
	var y: float = 1.55 +(0.12 if h < 1.0 else 0.0)
	var at: Vector3 = cone(GAL_WALL_F, r) + Vector3(0.0, y, 0.0)
	var marco: MeshInstance3D = _box(Vector3(w + 0.12, h + 0.12, 0.05),
		at + _depth(0.07), Color("2b2721"), 0.85)
	marco.rotation_degrees.y = face()
	var lienzo: StandardMaterial3D = _mat(col, 0.9)
	lienzo.emission_enabled = true
	lienzo.emission = col
	lienzo.emission_energy_multiplier = 0.5
	var q: MeshInstance3D = _box_mat(Vector3(w, h, 0.02), at + _depth(0.1), lienzo)
	q.rotation_degrees.y = face()


	var foco: SpotLight3D = SpotLight3D.new()
	add_child(foco)
	foco.look_at_from_position(
		cone(GAL_WALL_F - 0.9, r) + Vector3(0.0, GAL_H - 0.25, 0.0), at, Vector3.UP)
	foco.spot_range = 7.0
	foco.spot_angle = 26.0
	foco.light_energy = 3.0
	foco.light_color = Color("fff4e0")












const CALLE_LAMP_H: float = 4.2


func _build_calle() -> void:


	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("141a26")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("36405c")
	env.ambient_light_energy = 0.9
	env.fog_enabled = true
	env.fog_light_color = Color("1a2130")
	env.fog_density = 0.012
	_env(env)

	_box(Vector3(40.0, 0.1, 40.0), Vector3(0.0, -0.05, 0.0), C_ASPHALT, 1.0)
	_box(Vector3(40.0, 0.16, 3.0), _floor_at(2.6, 0.0, 0.08), Color("3a3f47"), 1.0)


	var wall: Vector3 = cone(9.0, 0.0)
	wall.y = 2.6
	_box(Vector3(26.0, 5.2, 0.4), wall, Color("4a4f58"), 0.95)
	var stripe: Vector3 = cone(8.78, 0.0)
	stripe.y = 1.5
	_box(Vector3(26.0, 0.5, 0.05), stripe, club_color.darkened(0.25), 0.9)
	_calle_barriers()
	_calle_bus()


	_calle_lamp(-3.4, true)
	_calle_lamp(3.6)
	_calle_tumbado()










func _calle_tumbado() -> void:

	_box(Vector3(90.0, 0.1, 90.0), Vector3(0.0, -0.06, 0.0), C_ASPHALT, 1.0)
	for s in [-1.0, 1.0]:
		_boxc(Vector3(26.0, 0.16, 3.0), _floor_at(2.6, s * 33.0, 0.08),
			Color("3a3f47"), 1.0)
		var w: Vector3 = cone(9.0, s * 26.0)
		w.y = 2.6
		_boxc(Vector3(26.0, 5.2, 0.4), w, Color("4a4f58"), 0.95)
		var st: Vector3 = cone(8.78, s * 26.0)
		st.y = 1.5
		_boxc(Vector3(26.0, 0.5, 0.05), st, club_color.darkened(0.25), 0.9)




		var g: Vector3 = cone(13.0, s * 19.5)
		g.y = 5.5
		_boxc(Vector3(20.0, 11.0, 6.0), g, Color("2f343d"), 0.95)
		var vis: Vector3 = cone(10.6, s * 19.5)
		vis.y = 11.2
		_boxc(Vector3(21.0, 0.4, 2.2), vis, Color("3d434d"), 0.9)
		for k in 5:
			var b: Vector3 = cone(9.95, s *(11.5 + float(k) * 3.2))
			b.y = 7.0
			_box_matc(Vector3(1.2, 0.5, 0.05), b, _emisivo(Color("ffd9a0"), 0.6))
		var t: Vector3 = cone(14.0, s * 25.0)
		t.y = 8.0
		_boxc(Vector3(0.5, 16.0, 0.5), t, C_METAL.darkened(0.4), 0.8)
		_box_matc(Vector3(3.2, 1.6, 0.3), t + Vector3(0.0, 8.4, 0.0),
			_emisivo(Color("eef3ff"), 2.4))

		for i in 3:
			var r: float = s *(6.0 + float(i) * 2.0)
			var base: Vector3 = _floor_at(2.2, r, 0.55)
			_box(Vector3(1.8, 0.07, 0.05), base, C_METAL, 0.7)
			_box(Vector3(1.8, 0.07, 0.05), base + Vector3(0.0, 0.35, 0.0), C_METAL, 0.7)
			for e in [-0.85, 0.85]:
				_box(Vector3(0.06, 1.1, 0.06), _floor_at(2.2, r + e, 0.55),
					C_METAL.darkened(0.25), 0.7)
		_calle_lamp(s * 10.5, false, 4.0, false)

	var pu: Vector3 = cone(8.75, 8.5)
	pu.y = 1.45
	_boxc(Vector3(2.9, 3.1, 0.1), pu, club_color.darkened(0.35), 0.9)
	_box_matc(Vector3(2.4, 2.8, 0.05), pu + _depth(0.06) + Vector3(0.0, -0.1, 0.0),
		_emisivo(Color("ffe2b0"), 1.2))

	var giro: float = -6.0
	_pieza(Vector3(4.2, 0.85, 1.8), 6.4, 12.0, 0.65, Color("5b6470"), giro, 0.5)
	_pieza(Vector3(2.3, 0.65, 1.62), 6.4, 12.0, 1.38, Color("1a2230"), giro, 0.3, -0.2)
	for a in [-1.35, 1.35]:
		for dd in [-0.85, 0.85]:
			_pieza(Vector3(0.62, 0.62, 0.22), 6.4, 12.0, 0.31, C_DARK, giro, 0.95, a, dd)




func _calle_barriers() -> void:
	var f: float = 2.2
	for i in 5:
		var r: float = -4.0 + float(i) * 2.0
		var base: Vector3 = _floor_at(f, r, 0.55)
		_box(Vector3(1.8, 0.07, 0.05), base, C_METAL, 0.7)
		_box(Vector3(1.8, 0.07, 0.05), base + Vector3(0.0, 0.35, 0.0), C_METAL, 0.7)
		for s in [-0.85, 0.85]:
			_box(Vector3(0.06, 1.1, 0.06), _floor_at(f, r + s, 0.55),
				C_METAL.darkened(0.25), 0.7)





func _calle_bus() -> void:
	var p: Vector3 = cone(7.2, -6.2)
	p.y = 1.6
	var body: MeshInstance3D = _box(Vector3(11.0, 3.0, 2.6), p, club_color.darkened(0.25), 0.85)
	body.rotation_degrees.y = face() + 8.0
	var glass: StandardMaterial3D = _mat(Color("cfe4ff"), 0.35)
	glass.emission_enabled = true
	glass.emission = Color("9fc4ee")
	glass.emission_energy_multiplier = 0.8
	var win: MeshInstance3D = _box_mat(Vector3(10.2, 0.9, 0.06), p + Vector3(0.0, 0.5, 0.0), glass)
	win.rotation_degrees.y = face() + 8.0
	for dx in [-3.6, 3.4]:
		var w: Vector3 = p + Vector3(dx, -1.35, 0.0)
		_cyl(0.45, 0.3, w, C_DARK, 0.95, Vector3(0.0, 0.0, 90.0))









func _calle_lamp(r: float, sombra: bool = false, f: float = 3.4,
		luz_propia: bool = true) -> void:
	var base: Vector3 = _floor_at(f, r, 0.0)
	_cyl(0.09, CALLE_LAMP_H, base + Vector3(0.0, CALLE_LAMP_H * 0.5, 0.0), C_METAL.darkened(0.4), 0.8)
	var head: Vector3 = base + Vector3(0.0, CALLE_LAMP_H, 0.0)
	var bulb: StandardMaterial3D = _mat(Color("ffd9a0"), 0.4)
	bulb.emission_enabled = true
	bulb.emission = Color("ffc271")
	bulb.emission_energy_multiplier = 3.0
	_box_mat(Vector3(0.7, 0.12, 0.34), head, bulb)
	if not luz_propia:
		return
	var l: OmniLight3D = OmniLight3D.new()
	l.position = head + Vector3(0.0, -0.2, 0.0)
	l.omni_range = 16.0
	l.light_energy = 2.6
	l.light_color = Color("ffc271")
	l.shadow_enabled = sombra and Settings.sombra_permitida()
	add_child(l)













const PLATO_H: float = 4.4


func _build_plato() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("07080b")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = Color("28324a")
	env.ambient_light_energy = 1.15
	env.glow_enabled = true
	env.glow_bloom = 0.1
	env.glow_hdr_threshold = 1.0
	env.glow_intensity = 0.6
	_env(env)


	_box(Vector3(24.0, 0.1, 24.0), Vector3(0.0, -0.05, 0.0), Color("1a1d24"), 0.45)
	_plato_cyclorama()
	_plato_desk()


	_plato_beam(-2.2, true)
	_plato_beam(2.4)
	_plato_tumbado()










func _plato_tumbado() -> void:
	_box(Vector3(50.0, 0.1, 50.0), Vector3(0.0, -0.06, 0.0), Color("1a1d24"), 0.45)


	var telon: Vector3 = cone(6.2, 0.0)
	telon.y = 4.0
	_boxc(Vector3(40.0, 8.0, 0.2), telon, Color("15171d"), 1.0)
	_pared_derecha(9.5, 6.2, 8.0, Color("1c1f27"), Color("23272f"), 0.3)
	var desde: float = -(_dist + 4.0)
	var largo: float = 6.2 - desde
	_wall_col(cone(desde + largo * 0.5, -9.5), largo, 0.3, 8.0, 90.0, Color("1c1f27"),
		Color("23272f"))


	var lente: StandardMaterial3D = _emisivo(Color("dbe8ff"), 1.6)
	for s in [-1.0, 1.0]:
		var tr: Vector3 = cone(2.6, s * 7.2)
		tr.y = PLATO_H + 0.35
		_boxc(Vector3(5.4, 0.22, 0.22), tr, C_METAL.darkened(0.3), 0.6)
		_boxc(Vector3(5.4, 0.22, 0.22), tr + _depth(-1.6), C_METAL.darkened(0.3), 0.6)
		for k in 3:
			var rr: float = s *(5.2 + float(k) * 1.7)
			_pieza(Vector3(0.36, 0.4, 0.36), 2.6, rr, PLATO_H + 0.05, C_DARK)
			_pieza_mat(Vector3(0.26, 0.04, 0.26), 2.6, rr, PLATO_H - 0.16, lente)

	_plato_camara(0.4, 4.6, -100.0)
	_plato_camara(3.2, 6.4, -62.0)


	_pieza(Vector3(3.4, 2.1, 0.12), 3.6, -7.6, 2.3, C_DARK, 55.0, 0.6)
	_pieza_mat(Vector3(3.2, 1.9, 0.04), 3.6, -7.6, 2.3,
		_emisivo(club_color.darkened(0.35), 0.5), 55.0, 0.0, 0.07)
	_pieza(Vector3(0.12, 1.25, 0.12), 3.6, -7.6, 0.62, C_METAL.darkened(0.4), 55.0)





func _plato_camara(f: float, r: float, giro: float) -> void:
	var cuerpo: Color = Color("2a2e36")
	_pieza(Vector3(0.9, 0.08, 0.12), f, r, 0.08, C_DARK, giro)
	_pieza(Vector3(0.12, 0.08, 0.9), f, r, 0.08, C_DARK, giro)
	_pieza(Vector3(0.1, 1.2, 0.1), f, r, 0.68, C_METAL.darkened(0.3), giro, 0.6)
	_pieza(Vector3(0.42, 0.42, 0.72), f, r, 1.48, cuerpo, giro, 0.6)
	_pieza(Vector3(0.26, 0.26, 0.34), f, r, 1.48, C_DARK, giro, 0.4, 0.0, 0.52)
	_pieza_mat(Vector3(0.3, 0.22, 0.04), f, r, 1.5, _emisivo(Color("6fa8e6"), 0.9),
		giro, 0.0, -0.38)
	_pieza_mat(Vector3(0.08, 0.06, 0.08), f, r, 1.73, _emisivo(Color("ff3b30"), 2.2),
		giro, 0.0, 0.2)





func _plato_cyclorama() -> void:
	for s in [-1.0, 1.0]:
		var p: Vector3 = cone(5.2, s * 3.0)
		p.y = 2.2
		var pano: MeshInstance3D = _box(Vector3(6.4, 4.4, 0.15), p,
			Color("2f3a52"), 0.9)
		pano.rotation_degrees.y = face() - s * 14.0
	var band: Vector3 = cone(5.0, 0.0)
	band.y = 1.1
	_box(Vector3(9.0, 0.5, 0.06), band, club_color.darkened(0.15), 0.8)
	if sign_text.is_empty():
		return


	var img: Image = Image.create(256, 48, false, Image.FORMAT_RGBA8)
	img.fill(Color(0, 0, 0, 0))
	var px: int = 4
	while px > 1 and PixelText.text_width(sign_text, px) > 248:
		px -= 1
	PixelText.draw_text(img,(256 - PixelText.text_width(sign_text, px)) / 2,
		(48 - PixelText.GLYPH_H * px) / 2, sign_text, Color("eaf0ff"), px)
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(5.0, 0.94)
	quad.mesh = qm
	quad.material_override = mat
	var lp: Vector3 = cone(4.9, 0.0)


	lp.y = 2.15
	quad.position = lp
	quad.rotation_degrees.y = face()
	add_child(quad)





func _plato_desk() -> void:
	var f: float = 2.0
	var r: float = 1.9
	_box(Vector3(2.4, 0.1, 1.0), _floor_at(f, r, 0.95), Color("2b3040"), 0.6)
	_box(Vector3(2.2, 0.85, 0.06), _floor_at(f - 0.45, r, 0.48), club_color.darkened(0.2), 0.8)
	var mon: StandardMaterial3D = _mat(Color("9fc4ee"), 0.35)
	mon.emission_enabled = true
	mon.emission = Color("6fa8e6")
	mon.emission_energy_multiplier = 2.0
	for dx in [-0.55, 0.55]:
		_box_mat(Vector3(0.6, 0.36, 0.03), _floor_at(f - 0.3, r + dx, 1.2), mon)





func _plato_beam(r: float, sombra: bool = false) -> void:
	var top: Vector3 = cone(2.6, r)
	top.y = PLATO_H
	var floor_p: Vector3 = _floor_at(1.2, r * 0.55, 0.0)
	_box(Vector3(0.5, 0.3, 0.5), top + Vector3(0.0, 0.2, 0.0), C_DARK, 0.8)
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	m.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	m.blend_mode = BaseMaterial3D.BLEND_MODE_ADD
	m.cull_mode = BaseMaterial3D.CULL_DISABLED
	m.albedo_color = Color(0.86, 0.92, 1.0, 0.07)
	var cyl: CylinderMesh = CylinderMesh.new()
	cyl.top_radius = 0.22
	cyl.bottom_radius = 1.5
	cyl.height = top.distance_to(floor_p)
	cyl.radial_segments = 12
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = cyl
	mi.material_override = m
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	mi.position =(top + floor_p) * 0.5
	var dir: Vector3 =(floor_p - top).normalized()
	var axis: Vector3 = Vector3.UP.cross(dir)
	if axis.length() > 0.0001:
		mi.rotate(axis.normalized(), Vector3.UP.angle_to(dir))
	add_child(mi)
	var l: SpotLight3D = SpotLight3D.new()
	l.position = top
	l.look_at_from_position(top, floor_p)
	l.spot_range = 14.0
	l.spot_angle = 34.0
	l.light_energy = 4.6
	l.light_color = Color("dbe8ff")
	l.shadow_enabled = sombra and Settings.sombra_permitida()
	add_child(l)






func _shell(w: float, d: float, h: float, floor_col: Color) -> void:


	_box(Vector3(w, 0.1, d), Vector3(0.0, -0.05, 0.0), floor_col, 1.0)
	_box(Vector3(w, 0.1, d), Vector3(0.0, h + 0.05, 0.0), C_DARK, 1.0)






	var lado: float = maxf(maxf(w, d), 40.0)
	_box(Vector3(lado, 0.1, lado), Vector3(0.0, -0.08, 0.0), floor_col, 1.0)
	_box(Vector3(lado, 0.1, lado), Vector3(0.0, h + 0.11, 0.0), C_DARK, 1.0)
	var low: float = 1.1







	_wall(cone(d * 0.42, 0.0), w, low, h, 0.0)
	_wall(cone(d * 0.22, - w * 0.42), d * 0.75, low, h, 90.0)


	_pared_derecha(w * 0.42, d * 0.42, h)


func _wall(at: Vector3, length: float, low: float, h: float, turn: float) -> void:
	_wall_col(at, length, low, h, turn, C_WALL_LOW, C_WALL)





func _wall_col(at: Vector3, length: float, low: float, h: float, turn: float,
		c_low: Color, c_high: Color) -> void:
	var a: MeshInstance3D = _box(Vector3(length, low, 0.14),
		at + Vector3(0.0, low * 0.5, 0.0), c_low, 0.95)
	a.rotation_degrees.y = face() + turn
	var b: MeshInstance3D = _box(Vector3(length, h - low, 0.14),
		at + Vector3(0.0, low +(h - low) * 0.5, 0.0), c_high, 0.95)
	b.rotation_degrees.y = face() + turn




func _interior_light(bg: Color, energy: float, lamp_col: Color, h: float,
		lamps: Array, lamp_energy: float = 2.4) -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = bg
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = bg.lightened(0.25)
	env.ambient_light_energy = energy
	env.glow_enabled = true
	env.glow_bloom = 0.0
	env.glow_hdr_threshold = 1.1
	env.glow_intensity = 0.5
	_env(env)
	for i in lamps.size():
		var p: Vector3 = cone(float(lamps[i][0]), float(lamps[i][1]))
		p.y = h - 0.35
		var l: OmniLight3D = OmniLight3D.new()
		l.position = p
		l.omni_range = 16.0
		l.light_energy = lamp_energy
		l.light_color = lamp_col


		l.shadow_enabled = i == 0 and Settings.sombra_permitida()
		add_child(l)
		var m: StandardMaterial3D = _mat(C_LAMP, 0.4)
		m.emission_enabled = true
		m.emission = lamp_col
		m.emission_energy_multiplier = 2.2
		var tube: Vector3 = p
		tube.y = h - 0.14
		_box_mat(Vector3(2.4, 0.09, 0.28), tube, m)




func _wall_crest(d: float, y: float, w: float) -> void:
	if crest == null or w <= 0.0:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = w / float(maxi(crest.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var p: Vector3 = cone(d * 0.42 - 0.1, -2.6)
	p.y = y
	spr.position = p
	spr.rotation_degrees.y = face()
	add_child(spr)


















const INST_H: float = 3.0

const INST_WALL_F: float = 4.0
const INST_BOARD_F: float = 3.92


const INST_BOARD_R: float = -0.46
const INST_BOARD_W: float = 1.46
const INST_BOARD_H: float = 1.38
const INST_BOARD_Y: float = 1.4
const C_CORK: Color = Color("b08b52")
const C_PAPER: Color = Color("edeadf")









var list_title: String = ""
var list_rows: Array = []


var list_mark: int = -1


var list_mark_bad: bool = false

var mood: float = 0.0


func _build_instalaciones() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("0a0c10")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

	env.ambient_light_color = Color("4a566c").lerp(Color("242c3a"), mood)
	env.ambient_light_energy = lerpf(1.75, 0.95, mood)
	env.glow_enabled = true
	env.glow_bloom = 0.08
	env.glow_hdr_threshold = 1.0
	env.glow_intensity = 0.45
	_env(env)


	_box(Vector3(20.0, 0.1, 20.0), Vector3(0.0, -0.05, 0.0),
		C_FLOOR_TILE.lightened(0.12), 0.7)
	var back: Vector3 = cone(INST_WALL_F, 0.0)
	back.y = INST_H * 0.5
	_boxc(Vector3(11.0, INST_H, 0.2), back, C_WALL, 0.95)


	var skirt: Vector3 = cone(INST_WALL_F - 0.12, 0.0)
	skirt.y = 0.26
	_boxc(Vector3(11.0, 0.52, 0.06), skirt, club_color.darkened(0.3), 0.9)
	var side: Vector3 = cone(1.6, -3.1)
	side.y = INST_H * 0.5
	var wall_l: MeshInstance3D = _box(Vector3(0.2, INST_H, 9.0), side, C_WALL_LOW, 0.95)
	wall_l.rotation_degrees.y = face()
	_inst_board()
	_inst_props()
	_inst_tube()
	_inst_crest()
	_inst_tumbado()










func _inst_tumbado() -> void:
	var zocalo: Color = club_color.darkened(0.3)
	_pared_derecha(4.0, INST_WALL_F, INST_H, zocalo, C_WALL_LOW, 0.52)
	var desde: float = -(_dist + 4.0)
	var largo: float = -2.9 - desde
	var izq: Vector3 = cone(desde + largo * 0.5, -3.1)
	izq.y = INST_H * 0.5
	_boxc(Vector3(0.2, INST_H, largo), izq, C_WALL_LOW, 0.95)

	_box(Vector3(40.0, 0.1, 40.0), Vector3(0.0, INST_H + 0.05, 0.0), Color("2a2e35"), 0.95)

	_pieza(Vector3(1.1, 2.15, 0.06), 2.0, 4.0, 1.075, Color("4d5562"), -90.0, 0.8, 0.0, 0.13)
	_pieza(Vector3(1.26, 2.25, 0.05), 2.0, 4.0, 1.125, C_METAL.darkened(0.2), -90.0, 0.6,
		0.0, 0.11)
	_pieza_mat(Vector3(0.36, 0.5, 0.02), 2.0, 4.0, 1.6, _emisivo(Color("f2f6ff"), 0.9),
		-90.0, 0.0, 0.17)
	_pieza(Vector3(0.16, 0.05, 0.08), 2.0, 4.0, 1.0, C_METAL, -90.0, 0.4, -0.4, 0.19)

	_pieza(Vector3(0.2, 0.55, 0.2), 3.35, 4.0, 1.0, Color("b8322a"), -90.0, 0.6, 0.0, 0.22)
	_pieza(Vector3(0.3, 0.3, 0.02), 3.35, 4.0, 1.55, C_PAPER, -90.0, 0.8, 0.0, 0.12)

	for lado in [[0.2, 4.0, -90.0], [0.9, -3.1, 90.0]]:
		var f: float = lado[0]
		var r: float = lado[1]
		var giro: float = lado[2]
		_pieza(Vector3(1.8, 0.06, 0.4), f, r, 0.46, C_WOOD, giro, 0.8, 0.0, 0.32)
		for a in [-0.75, 0.75]:
			_pieza(Vector3(0.06, 0.44, 0.36), f, r, 0.22, C_METAL.darkened(0.3), giro,
				0.6, a, 0.32)


	for i in 3:
		var f: float = -0.9 + float(i) * 1.25
		_pieza(Vector3(0.95, 0.66, 0.04), f, -3.1, 1.75, C_DARK, 90.0, 0.8, 0.0, 0.12)
		_pieza(Vector3(0.83, 0.54, 0.02), f, -3.1, 1.75,
			club_color.darkened(0.45 + 0.08 * float(i)), 90.0, 0.9, 0.0, 0.145)








func _inst_board() -> void:
	var at: Vector3 = cone(INST_BOARD_F, INST_BOARD_R)
	at.y = INST_BOARD_Y

	_boxc(Vector3(INST_BOARD_W + 0.1, INST_BOARD_H + 0.1, 0.06), at, C_METAL, 0.55)
	_boxc(Vector3(INST_BOARD_W, INST_BOARD_H, 0.04), at + _depth(0.035), C_CORK, 0.95)


	for spec in [[-0.62, 0.52, -7.0], [0.62, 0.54, 6.0], [0.64, -0.5, -4.0]]:
		var p: Vector3 = at + _depth(0.05)
		var off: Vector3 = cone(0.0, float(spec[0]))
		p += off
		p.y += float(spec[1])
		var sheet: MeshInstance3D = _boxc(Vector3(0.3, 0.4, 0.006), p,
			C_PAPER.darkened(0.12), 0.95)
		sheet.rotation_degrees.z = float(spec[2])
	_inst_list(at + _depth(0.06))







func _inst_list(at: Vector3) -> void:




	var w: int = 212
	var h: int = 300
	var img: Image = Image.create(w, h, false, Image.FORMAT_RGBA8)
	img.fill(C_PAPER)
	var y: int = 9
	if not list_title.is_empty():
		var tpx: int = 3
		while tpx > 1 and PixelText.text_width(list_title, tpx) > w - 16:
			tpx -= 1
		PixelText.draw_text(img,(w - PixelText.text_width(list_title, tpx)) / 2, y,
			list_title, Color("2a2f38"), tpx)
		y += PixelText.GLYPH_H * tpx + 5

		for x in range(9, w - 9):
			img.set_pixel(x, y, Color("8d939c"))
		y += 6
	var px: int = 2



	var row_h: int = PixelText.GLYPH_H * px + 2
	for i in list_rows.size():
		if y + row_h > h - 5:
			break
		var row: Dictionary = list_rows[i]
		var left: String = String(row.get("left", ""))
		var right: String = String(row.get("right", ""))
		if bool(row.get("head", false)):


			PixelText.draw_text(img,(w - PixelText.text_width(left, px)) / 2, y + 1,
				left, Color("6b7280"), px)
			for x in range(9, w - 9):
				img.set_pixel(x, y + row_h - 1, Color("c3c7cd"))
			y += row_h + 1
			continue
		if i == list_mark:


			var band: Color =(Color("b6402f") if list_mark_bad
				else club_color).lerp(C_PAPER, 0.35)
			for by in range(y - 1, mini(y + row_h - 1, h)):
				for bx in range(7, w - 7):
					img.set_pixel(bx, by, band)
		var ink: Color = Color("14181e") if i == list_mark else Color("3d434d")
		PixelText.draw_text(img, 12, y, left, ink, px)
		if not right.is_empty():


			PixelText.draw_text(img, w - 12 - PixelText.text_width(right, px), y,
				right, ink, px)
		y += row_h
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()

	qm.size = Vector2(0.88, 0.88 * float(h) / float(w))
	quad.mesh = qm
	quad.material_override = mat
	quad.position = at + cone(0.0, -0.02)
	quad.rotation_degrees.y = face()
	add_child(quad)





func _inst_props() -> void:
	var base: Vector3 = cone(3.15, -1.32)


	for i in 3:
		var p: Vector3 = base
		p.y = 0.1 + float(i) * 0.13
		_cyl(0.19 - float(i) * 0.02, 0.13, p, Color("d8622a"), 0.9)
	var jug: Vector3 = cone(3.35, -1.02)
	jug.y = 0.42
	_cyl(0.17, 0.84, jug, Color("2e6fa8"), 0.6)
	var cap: Vector3 = jug
	cap.y = 0.9
	_cyl(0.1, 0.12, cap, C_LAMP, 0.5)

	var bin: Vector3 = cone(2.35, -1.22)
	bin.y = 0.22
	_boxc(Vector3(0.62, 0.44, 0.48), bin, C_METAL.darkened(0.25), 0.9)
	for i in 3:
		var b: Vector3 = bin + cone(0.0, -0.18 + float(i) * 0.18)
		b.y = 0.52
		var ball: MeshInstance3D = MeshInstance3D.new()
		var sm: SphereMesh = SphereMesh.new()
		sm.radius = 0.11
		sm.height = 0.22
		sm.radial_segments = 10
		sm.rings = 6
		ball.mesh = sm
		ball.material_override = _mat(C_PAPER, 0.8)
		ball.position = b
		add_child(ball)





func _inst_tube() -> void:
	var tint: Color = Color("f2f6ff").lerp(Color("9fb6d8"), mood)
	var at: Vector3 = cone(2.9, 0.0)
	at.y = INST_H - 0.28
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = tint
	mat.emission_enabled = true
	mat.emission = tint
	mat.emission_energy_multiplier = lerpf(1.9, 0.85, mood)
	_box_matc(Vector3(2.4, 0.08, 0.14), at, mat)
	var lamp: OmniLight3D = OmniLight3D.new()
	lamp.light_color = tint
	lamp.light_energy = lerpf(4.4, 2.1, mood)
	lamp.omni_range = 9.0
	lamp.position = at + Vector3(0.0, -0.3, 0.0)
	lamp.shadow_enabled = Settings.sombra_permitida()
	add_child(lamp)





func _inst_crest() -> void:
	if crest == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = 0.62 / float(maxi(crest.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var p: Vector3 = cone(INST_WALL_F - 0.14, 1.16)
	p.y = 1.86
	spr.position = p
	spr.rotation_degrees.y = face()
	add_child(spr)
























const DESP_WALL_F: float = 5.0
const DESP_DESK_F: float = 3.1
const C_DESK: Color = Color("55402c")
const C_GLASS: Color = Color("0b1018")


func _build_despacho() -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("06070a")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


	env.ambient_light_color = Color("3a3327")
	env.ambient_light_energy = 1.05
	env.glow_enabled = true
	env.glow_bloom = 0.12
	env.glow_hdr_threshold = 0.95
	env.glow_intensity = 0.55
	_env(env)


	_box(Vector3(20.0, 0.1, 20.0), Vector3(0.0, -0.05, 0.0), Color("1c1a18"), 0.95)
	_desp_walls()
	_desp_window()
	_desp_desk()
	_desp_vitrina()
	_desp_lamp()
	_desp_tumbado()










func _desp_tumbado() -> void:
	var madera: Color = C_WOOD.darkened(0.55)
	_pared_derecha(4.6, DESP_WALL_F, 3.8, madera, C_WALL, 0.68)

	var desde: float = -(_dist + 4.0)
	var largo: float = -1.2 - desde
	var izq: Vector3 = cone(desde + largo * 0.5, -3.4)
	izq.y = 1.9
	_boxc(Vector3(0.2, 3.8, largo), izq, C_WALL_LOW, 0.95)










	_box(Vector3(40.0, 0.1, 40.0), Vector3(0.0, 3.85, 0.0), Color("1e1913"), 0.95)


	_pieza(Vector3(20.0, 0.12, 0.1), DESP_WALL_F - 0.15, 0.0, 3.74, C_WOOD.darkened(0.45),
		0.0, 0.8)


	_ventana_lateral(0.9, 4.6, 2.05, 2.4, 1.9, Color("141c2a"), C_METAL.darkened(0.35))
	var ciudad: StandardMaterial3D = _emisivo(Color("ffdca4"), 0.85)
	for l in [Vector3(-0.9, 2.5, 0.1), Vector3(-0.5, 1.7, 0.12), Vector3(-0.2, 2.75, 0.08),
			Vector3(0.3, 2.2, 0.11), Vector3(0.65, 1.55, 0.09), Vector3(0.9, 2.6, 0.12),
			Vector3(-0.75, 1.35, 0.08), Vector3(0.45, 2.85, 0.1)]:
		_pieza_mat(Vector3(l.z, 0.12, 0.02), 0.9, 4.6, l.y, ciudad, -90.0, l.x, 0.115)

	var piel: Color = Color("3b2a20")
	_pieza(Vector3(2.1, 0.42, 0.85), 0.9, 4.6, 0.21, piel, -90.0, 0.6, 0.0, 0.52)
	_pieza(Vector3(2.1, 0.8, 0.22), 0.9, 4.6, 0.5, piel.darkened(0.15), -90.0, 0.6, 0.0, 0.2)
	for a in [-1.0, 1.0]:
		_pieza(Vector3(0.2, 0.62, 0.85), 0.9, 4.6, 0.31, piel.darkened(0.1), -90.0, 0.6,
			a * 1.0, 0.52)





	_pieza(Vector3(1.1, 0.06, 0.45), 0.9, 3.25, 0.42, C_DESK, -90.0, 0.55)
	for a in [-0.45, 0.45]:
		_pieza(Vector3(0.06, 0.39, 0.36), 0.9, 3.25, 0.195, C_DESK.darkened(0.3), -90.0,
			0.9, a)
	_libreria(3.3, 4.6, -90.0, 1.4, 2.2, C_DESK)
	_planta(4.45, 4.1, 1.1)
	_desp_tumbado_izq()












func _desp_tumbado_izq() -> void:
	var r: float = -3.4
	var giro: float = 90.0

	var mueble: Color = C_DESK.lightened(0.08)
	_pieza(Vector3(1.8, 0.8, 0.45), 1.0, r, 0.4, mueble, giro, 0.8, 0.0, 0.33)
	_pieza(Vector3(1.86, 0.04, 0.49), 1.0, r, 0.82, mueble.lightened(0.12), giro, 0.5, 0.0,
		0.33)
	for a in [-0.6, 0.0, 0.6]:
		_pieza(Vector3(0.22, 0.03, 0.03), 1.0, r, 0.6, Color("b8954a"), giro, 0.35, a, 0.57)

	for k in 2:
		var f: float = 0.45 + float(k) * 1.15
		_pieza(Vector3(0.95, 0.66, 0.04), f, r, 1.75, C_DARK, giro, 0.8, 0.0, 0.12)
		_pieza(Vector3(0.83, 0.54, 0.02), f, r, 1.75,
			club_color.darkened(0.35 + 0.1 * float(k)), giro, 0.9, 0.0, 0.145)


		for fila in 2:
			_pieza(Vector3(0.7 - 0.08 * float(fila), 0.11, 0.02), f, r,
				1.66 + 0.15 * float(fila), C_DARK.lightened(0.12 + 0.1 * float(fila)),
				giro, 0.9, 0.0, 0.152)

		_pieza(Vector3(0.83, 0.1, 0.02), f, r, 1.53, C_PAPER.darkened(0.35), giro, 0.9,
			0.0, 0.15)

	var ban: MeshInstance3D = _pieza(Vector3(0.36, 0.36, 0.02), -0.45, r, 1.85, club_color,
		giro, 0.9, 0.0, 0.12)
	ban.rotate_object_local(Vector3(0.0, 0.0, 1.0), deg_to_rad(45.0))
	_pieza(Vector3(0.6, 0.03, 0.03), -0.45, r, 2.1, C_METAL, giro, 0.4, 0.0, 0.13)

	var pp: Vector3 = _floor_at(-1.9, -2.95, 0.9)
	_cyl(0.025, 1.8, pp, C_DESK.darkened(0.2), 0.6)
	_cyl(0.2, 0.04, _floor_at(-1.9, -2.95, 0.02), C_DESK.darkened(0.3), 0.6)
	_pieza(Vector3(0.38, 0.85, 0.22), -1.9, -2.95, 1.25, Color("3a3a40"), giro, 0.95)




func _desp_walls() -> void:
	var back: Vector3 = cone(DESP_WALL_F, 0.0)
	back.y = 1.9
	_boxc(Vector3(12.0, 3.8, 0.2), back, C_WALL, 0.95)
	var zocalo: Vector3 = cone(DESP_WALL_F - 0.12, 0.0)
	zocalo.y = 0.34
	_boxc(Vector3(12.0, 0.68, 0.06), zocalo, C_WOOD.darkened(0.55), 0.9)

	var side: Vector3 = cone(DESP_WALL_F - 3.0, -3.4)
	side.y = 1.9
	var w: MeshInstance3D = _box(Vector3(0.2, 3.8, 6.4), side, C_WALL_LOW, 0.95)
	w.rotation_degrees.y = face()





func _desp_window() -> void:
	var p: Vector3 = cone(DESP_WALL_F - 0.14, 2.15)
	p.y = 2.0
	_boxc(Vector3(3.4, 2.4, 0.05), p, C_GLASS, 0.25)


	for r in [-1.7, 0.0, 1.7]:
		var m: Vector3 = cone(DESP_WALL_F - 0.16, 2.15 + r)
		m.y = 2.0
		_boxc(Vector3(0.09, 2.4, 0.07), m, C_METAL.darkened(0.35), 0.7)
	var t: Vector3 = cone(DESP_WALL_F - 0.16, 2.15)
	t.y = 2.0
	_boxc(Vector3(3.4, 0.09, 0.07), t, C_METAL.darkened(0.35), 0.7)








	var luces: Array = [
		Vector3(-1.42, 2.62, 0.1), Vector3(-1.18, 2.3, 0.08),
		Vector3(-1.25, 1.86, 0.12), Vector3(-0.92, 2.74, 0.09),
		Vector3(-0.86, 2.08, 0.14), Vector3(-0.6, 1.62, 0.1),
		Vector3(-0.44, 2.44, 0.11), Vector3(-0.18, 1.94, 0.08),
		Vector3(-0.05, 2.86, 0.13), Vector3(0.22, 2.22, 0.09),
		Vector3(0.35, 1.7, 0.12), Vector3(0.58, 2.58, 0.1),
		Vector3(0.74, 2.02, 0.08), Vector3(0.96, 1.5, 0.11),
		Vector3(1.1, 2.36, 0.09), Vector3(1.32, 1.88, 0.13),
		Vector3(1.44, 2.7, 0.08), Vector3(1.2, 3.02, 0.1),
	]
	for raw in luces:

		var l: Vector3 = raw as Vector3
		var q: Vector3 = cone(DESP_WALL_F - 0.19, 2.15 + l.x)
		q.y = l.y
		var mat: StandardMaterial3D = StandardMaterial3D.new()
		mat.albedo_color = Color("f2d79a")
		mat.emission_enabled = true
		mat.emission = Color("ffdca4")


		mat.emission_energy_multiplier = 0.85
		_box_matc(Vector3(l.z, 0.14, 0.03), q, mat)





func _desp_desk() -> void:
	var top: Vector3 = cone(DESP_DESK_F, 0.0)
	top.y = 0.76
	_boxc(Vector3(3.6, 0.09, 1.15), top, C_DESK, 0.55)
	var faldon: Vector3 = cone(DESP_DESK_F - 0.5, 0.0)
	faldon.y = 0.38



	_boxc(Vector3(3.3, 0.7, 0.06), faldon, club_color.darkened(0.12), 0.85)
	for r in [-1.55, 1.55]:
		var pata: Vector3 = cone(DESP_DESK_F, r)
		pata.y = 0.36
		_boxc(Vector3(0.16, 0.72, 0.9), pata, C_DESK.darkened(0.45), 0.7)


	var papel: Vector3 = cone(DESP_DESK_F - 0.18, -0.35)
	papel.y = 0.815
	_boxc(Vector3(0.42, 0.012, 0.58), papel, Color("e9e6dd"), 0.9)
	var papel2: Vector3 = cone(DESP_DESK_F - 0.1, -0.28)
	papel2.y = 0.822
	var p2: MeshInstance3D = _boxc(Vector3(0.42, 0.012, 0.58), papel2,
		Color("dedbd0"), 0.9)
	p2.rotation_degrees.y = face() + 9.0
	_cyl(0.012, 0.17, _floor_at(DESP_DESK_F - 0.24, -0.05, 0.83), C_DARK, 0.35,
		Vector3(0.0, 0.0, 74.0))





	var sill: Vector3 = cone(DESP_DESK_F + 0.85, -1.05)
	sill.y = 0.5
	_boxc(Vector3(0.85, 1.0, 0.14), sill, Color("232830"), 0.85)










func _desp_vitrina() -> void:

	var base: Vector3 = cone(DESP_WALL_F - 0.55, -2.15)
	base.y = 0.42
	_boxc(Vector3(1.3, 0.84, 0.5), base, C_WOOD.darkened(0.55), 0.85)
	if crest == null:
		return
	var panel: Vector3 = cone(DESP_WALL_F - 0.15, -1.35)
	panel.y = 2.05
	_boxc(Vector3(1.05, 1.25, 0.05), panel, club_color.darkened(0.55), 0.9)
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = 0.78 / float(maxi(crest.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var p: Vector3 = cone(DESP_WALL_F - 0.2, -1.35)
	p.y = 2.05
	spr.position = p
	spr.rotation_degrees.y = face()
	add_child(spr)




func _desp_lamp() -> void:
	var pie: Vector3 = cone(DESP_DESK_F - 0.1, 1.35)
	pie.y = 0.86
	_cyl(0.04, 0.2, pie, C_METAL, 0.5)
	var tulipa: Vector3 = cone(DESP_DESK_F - 0.1, 1.35)
	tulipa.y = 1.02
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_color = Color("d8c48a")
	mat.emission_enabled = true
	mat.emission = Color("ffd89a")
	mat.emission_energy_multiplier = 1.1
	_box_matc(Vector3(0.34, 0.2, 0.34), tulipa, mat)
	var luz: OmniLight3D = OmniLight3D.new()
	luz.light_color = Color("ffd6a0")
	luz.light_energy = 2.4
	luz.omni_range = 6.0
	var lp: Vector3 = cone(DESP_DESK_F - 0.3, 0.9)
	lp.y = 1.5
	luz.position = lp
	add_child(luz)























const ASAM_WALL_F: float = 6.6
const ASAM_TARIMA_F: float = 4.0

const ASAM_TARIMA_H: float = 1.0

const ASAM_MESA_F: float = 4.75
const ASAM_JUNTA_F: float = 5.3
const ASAM_JUNTA_R: Array[float] = [-1.45, 0.0, 1.45]

const ASAM_PANTALLA_R: float = 1.0
const ASAM_ESCUDO_R: float = -1.5
const ASAM_ALTO_CARTEL: float = 3.5
const C_PARQUET: Color = Color("4a3524")


func _build_asamblea() -> void:



	_interior_light(Color("1e1a16"), 1.5, Color("ffe2b8"), 6.0,
		[[ASAM_MESA_F, 0.0], [1.6, -3.0], [1.6, 3.0]], 2.2)
	_box(Vector3(30.0, 0.1, 30.0), Vector3(0.0, -0.05, 0.0), C_PARQUET, 0.85)
	_asam_paredes()
	_asam_tarima()
	_asam_mesa()
	_asam_telon()
	_asam_pantalla()




func _asam_paredes() -> void:
	var back: Vector3 = cone(ASAM_WALL_F, 0.0)
	back.y = 3.0
	_boxc(Vector3(26.0, 6.0, 0.2), back, C_WALL, 0.95)
	var zocalo: Vector3 = cone(ASAM_WALL_F - 0.12, 0.0)
	zocalo.y = 0.5
	_boxc(Vector3(26.0, 1.0, 0.06), zocalo, C_WOOD.darkened(0.55), 0.9)






	_box(Vector3(40.0, 0.1, 40.0), Vector3(0.0, 6.05, 0.0), Color("2b2620"), 0.95)
	for s in [-1.0, 1.0]:
		var side: Vector3 = cone(2.4, s * 9.0)
		side.y = 3.0
		var w: MeshInstance3D = _box(Vector3(0.2, 6.0, 8.6), side, C_WALL_LOW, 0.95)
		w.rotation_degrees.y = face()


		for k in 2:
			var r: float = s *(5.2 + float(k) * 1.9)
			var pan: Vector3 = cone(ASAM_WALL_F - 0.14, r)
			pan.y = 3.4
			_boxc(Vector3(1.1, 2.8, 0.04), pan, club_color.darkened(0.2), 0.9)
			var franja: Vector3 = cone(ASAM_WALL_F - 0.17, r)
			franja.y = 3.4
			_boxc(Vector3(1.1, 0.32, 0.03), franja, Color("e9e6dd"), 0.9)




func _asam_tarima() -> void:
	var fondo: float = ASAM_WALL_F - ASAM_TARIMA_F
	var c: Vector3 = cone(ASAM_TARIMA_F + fondo * 0.5, 0.0)
	c.y = ASAM_TARIMA_H * 0.5
	_boxc(Vector3(10.5, ASAM_TARIMA_H, fondo), c, C_WOOD.darkened(0.3), 0.8)
	var frente: Vector3 = cone(ASAM_TARIMA_F - 0.02, 0.0)
	frente.y = ASAM_TARIMA_H * 0.5
	_boxc(Vector3(10.5, ASAM_TARIMA_H, 0.04), frente, C_DARK.lightened(0.08), 0.9)
	for i in 2:
		var esc: Vector3 = cone(ASAM_TARIMA_F - 0.3 - float(i) * 0.3, 4.4)
		esc.y = ASAM_TARIMA_H *(0.66 - float(i) * 0.33) * 0.5
		_boxc(Vector3(1.4, ASAM_TARIMA_H *(0.66 - float(i) * 0.33), 0.3), esc,
			C_WOOD.darkened(0.4), 0.85)





func _asam_mesa() -> void:
	var y0: float = ASAM_TARIMA_H
	var top: Vector3 = cone(ASAM_MESA_F, 0.0)
	top.y = y0 + 0.76
	_boxc(Vector3(5.0, 0.08, 0.9), top, C_DESK, 0.55)
	var faldon: Vector3 = cone(ASAM_MESA_F - 0.46, 0.0)
	faldon.y = y0 + 0.38
	_boxc(Vector3(5.0, 0.76, 0.05), faldon, club_color.darkened(0.12), 0.85)
	for r in ASAM_JUNTA_R:
		var mic: Vector3 = cone(ASAM_MESA_F - 0.22, r)
		mic.y = y0 + 0.92
		_cyl(0.018, 0.26, mic, C_DARK, 0.4)
		var papel: Vector3 = cone(ASAM_MESA_F - 0.05, r - 0.42)
		papel.y = y0 + 0.81
		_boxc(Vector3(0.32, 0.012, 0.44), papel, Color("e9e6dd"), 0.9)




func _asam_telon() -> void:
	var tel: Vector3 = cone(ASAM_WALL_F - 0.12, 0.0)
	tel.y = ASAM_TARIMA_H + 2.3
	_boxc(Vector3(7.6, 4.6, 0.05), tel, club_color.darkened(0.55), 0.9)
	if crest == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = 1.15 / float(maxi(crest.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var p: Vector3 = cone(ASAM_WALL_F - 0.18, ASAM_ESCUDO_R)
	p.y = ASAM_ALTO_CARTEL
	spr.position = p
	spr.rotation_degrees.y = face()
	add_child(spr)






func _asam_pantalla() -> void:
	var p: Vector3 = cone(ASAM_WALL_F - 0.2, ASAM_PANTALLA_R)
	p.y = ASAM_ALTO_CARTEL
	_boxc(Vector3(2.7, 1.5, 0.08), p, C_DARK, 0.5)
	if sign_text.is_empty():
		return
	var pct: int = clampi(sign_text.to_int(), 0, 100)
	var img: Image = Image.create(240, 128, false, Image.FORMAT_RGBA8)
	img.fill(Color("0b1018"))
	var px: int = 7
	while px > 1 and PixelText.text_width(sign_text, px) > 220:
		px -= 1
	PixelText.draw_text(img,(240 - PixelText.text_width(sign_text, px)) / 2, 14,
		sign_text, Color("eaf0ff"), px)



	var x0: int = 18
	var ancho: int = 204
	var corte: int = x0 + int(round(float(ancho) * float(pct) / 100.0))
	img.fill_rect(Rect2i(x0, 86, ancho, 24), Color("3a4150"))
	img.fill_rect(Rect2i(x0, 86, corte - x0, 24), club_color.lightened(0.25))
	var mat: StandardMaterial3D = StandardMaterial3D.new()
	mat.albedo_texture = ImageTexture.create_from_image(img)
	mat.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	var quad: MeshInstance3D = MeshInstance3D.new()
	var qm: QuadMesh = QuadMesh.new()
	qm.size = Vector2(2.5, 1.33)
	quad.mesh = qm
	quad.material_override = mat
	var q: Vector3 = cone(ASAM_WALL_F - 0.25, ASAM_PANTALLA_R)
	q.y = ASAM_ALTO_CARTEL
	quad.position = q
	quad.rotation_degrees.y = face()
	add_child(quad)








func _depth(m: float) -> Vector3:
	var y: float = deg_to_rad(_yaw)
	return Vector3(sin(y), 0.0, - cos(y)) * m


func _floor_at(f: float, r: float, y: float) -> Vector3:
	var p: Vector3 = cone(f, r)
	p.y = y
	return p


func _env(env: Environment) -> void:
	var we: WorldEnvironment = WorldEnvironment.new()
	we.environment = env
	add_child(we)


func _mat(col: Color, rough: float = 0.9) -> StandardMaterial3D:
	var m: StandardMaterial3D = StandardMaterial3D.new()
	m.albedo_color = col
	m.roughness = clampf(rough, 0.0, 1.0)
	m.metallic = 0.35 if rough < 0.5 else 0.0
	return m






func _boxc(size: Vector3, pos: Vector3, col: Color, rough: float = 0.9) -> MeshInstance3D:
	var mi: MeshInstance3D = _box(size, pos, col, rough)
	mi.rotation_degrees.y = face()
	return mi


func _box_matc(size: Vector3, pos: Vector3, mat: Material) -> MeshInstance3D:
	var mi: MeshInstance3D = _box_mat(size, pos, mat)
	mi.rotation_degrees.y = face()
	return mi


func _box(size: Vector3, pos: Vector3, col: Color, rough: float = 0.9,
		parent: Node3D = null) -> MeshInstance3D:
	return _box_mat(size, pos, _mat(col, rough), parent)


func _box_mat(size: Vector3, pos: Vector3, mat: Material,
		parent: Node3D = null) -> MeshInstance3D:
	var mesh: BoxMesh = BoxMesh.new()
	mesh.size = size
	return _put(mesh, mat, pos, Vector3.ZERO, parent)


func _cyl(radius: float, height: float, pos: Vector3, col: Color,
		rough: float = 0.9, rot: Vector3 = Vector3.ZERO,
		parent: Node3D = null) -> MeshInstance3D:
	var mesh: CylinderMesh = CylinderMesh.new()
	mesh.top_radius = radius
	mesh.bottom_radius = radius
	mesh.height = height
	mesh.radial_segments = 12
	mesh.rings = 1
	return _put(mesh, _mat(col, rough), pos, rot, parent)


func _put(mesh: Mesh, mat: Material, pos: Vector3, rot: Vector3,
		parent: Node3D) -> MeshInstance3D:
	var mi: MeshInstance3D = MeshInstance3D.new()
	mi.mesh = mesh
	mi.material_override = mat
	mi.position = pos
	mi.rotation_degrees = rot
	mi.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_ON
	if parent != null:
		parent.add_child(mi)
	else:
		add_child(mi)
	return mi





























const C_TROF_WALL: Color = Color("525a68")
const C_TROF_FLOOR: Color = Color("31363f")




const C_TROF_NICHO: Color = Color("8e99a6")
const C_TROF_LUZ: Color = Color("efe7d2")
const C_TROF_REPISA: Color = Color("59616e")




const C_PRENSA_WALL: Color = Color("6d6b63")
const C_PRENSA_FLOOR: Color = Color("3a3d47")
const C_PRENSA_ZOCALO: Color = Color("4a463e")
const C_BLOQUE: Color = Color("6a6a63")
const C_BLOQUE_JUNTA: Color = Color("55554f")
const C_CEMENTO: Color = Color("4a4a46")
const C_TAQUILLA: Color = Color("4b5b66")
const C_TUBO: Color = Color("dfe9f2")




const TROF_WALL_F: float = 2.6





const TROF_NICHO_DX: float = 0.92
const TROF_NICHOS: int = 9
const TROF_NICHO_W: float = 0.72
const TROF_NICHO_H: float = 1.02



const TROF_REPISA_Y: float = 1.35



var nichos: Array[Vector3] = []


func _build_trofeos() -> void:
	var cat: int = clampi(div, 1, 3)
	_trof_env(cat)
	_trof_suelo(cat)
	match cat:
		1:
			_trof_paredes_museo()
			_trof_vitrinas()
		2:
			_trof_paredes_lisas(C_PRENSA_WALL, C_PRENSA_ZOCALO)
			_trof_sala_prensa()
		_:
			_trof_paredes_bloque()
			_trof_pasillo()
	_trof_tumbado(cat)







func _trof_env(cat: int) -> void:
	var env: Environment = Environment.new()
	env.background_mode = Environment.BG_COLOR
	env.background_color = Color("05060a")
	env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	env.ambient_light_color = [Color("4a5461"), Color("4a5461"),
		Color("55524a"), Color("3e4740")][cat]
	env.ambient_light_energy = [5.4, 5.4, 4.6, 3.4][cat]
	env.glow_enabled = true
	env.glow_bloom = [0.16, 0.16, 0.1, 0.06][cat]
	env.glow_hdr_threshold = 0.9
	env.glow_intensity = [0.7, 0.7, 0.45, 0.3][cat]
	_env(env)






func _trof_suelo(cat: int) -> void:
	var col: Color = [C_TROF_FLOOR, C_TROF_FLOOR, C_PRENSA_FLOOR, C_CEMENTO][cat]
	var rug: float = [0.3, 0.3, 0.85, 0.95][cat]
	_box(Vector3(24.0, 0.1, 24.0), Vector3(0.0, -0.05, 0.0), col, rug)
	if cat == 1:



		var brillo: Vector3 = cone(TROF_WALL_F - 1.1, 0.0)
		brillo.y = 0.012
		_boxc(Vector3(16.0, 0.02, 2.0), brillo, C_TROF_FLOOR.lightened(0.16), 0.25)
	elif cat == 3:



		var raya: Vector3 = cone(TROF_WALL_F - 1.35, 0.0)
		raya.y = 0.012
		_boxc(Vector3(16.0, 0.02, 0.12), raya, Color("8a7b3a"), 0.9)






func _trof_paredes_museo() -> void:
	_trof_fondo(C_TROF_WALL, C_TROF_WALL.darkened(0.45))
	var corn: Vector3 = cone(TROF_WALL_F - 0.12, 0.0)
	corn.y = TROF_REPISA_Y + TROF_NICHO_H + 0.16
	_boxc(Vector3(16.0, 0.1, 0.06), corn, C_TROF_LUZ, 0.2)
	_trof_lateral(C_TROF_WALL.darkened(0.3))




func _trof_paredes_lisas(col: Color, zocalo: Color) -> void:
	_trof_fondo(col, zocalo)
	_trof_lateral(col.darkened(0.3))





func _trof_paredes_bloque() -> void:
	_trof_fondo(C_BLOQUE, C_BLOQUE.darkened(0.35))
	for i in 5:
		var j: Vector3 = cone(TROF_WALL_F - 0.11, 0.0)
		j.y = 0.55 + float(i) * 0.62
		_boxc(Vector3(16.0, 0.035, 0.04), j, C_BLOQUE_JUNTA, 0.95)
	_trof_lateral(C_BLOQUE.darkened(0.25))





func _trof_fondo(col: Color, zocalo: Color) -> void:
	var back: Vector3 = cone(TROF_WALL_F, 0.0)
	back.y = 1.95
	_boxc(Vector3(16.0, 3.9, 0.2), back, col, 0.9)
	var zoc: Vector3 = cone(TROF_WALL_F - 0.11, 0.0)
	zoc.y = 0.19
	_boxc(Vector3(16.0, 0.38, 0.06), zoc, zocalo, 0.85)


func _trof_lateral(col: Color) -> void:
	var side: Vector3 = cone(TROF_WALL_F - 2.6, -3.1)
	side.y = 1.95
	var w: MeshInstance3D = _box(Vector3(0.2, 3.9, 5.4), side, col, 0.9)
	w.rotation_degrees.y = face()





func _trof_vitrinas() -> void:
	nichos.clear()
	var medio: float = float(TROF_NICHOS - 1) * 0.5
	for i in TROF_NICHOS:
		var r: float =(float(i) - medio) * TROF_NICHO_DX
		var hueco: Vector3 = cone(TROF_WALL_F - 0.13, r)
		hueco.y = TROF_REPISA_Y + TROF_NICHO_H * 0.5
		_boxc(Vector3(TROF_NICHO_W, TROF_NICHO_H, 0.05), hueco, C_TROF_NICHO, 0.95)
		var repisa: Vector3 = cone(TROF_WALL_F - 0.28, r)
		repisa.y = TROF_REPISA_Y - 0.03
		_boxc(Vector3(TROF_NICHO_W + 0.06, 0.06, 0.32), repisa, C_TROF_REPISA, 0.4)


		var placa: Vector3 = cone(TROF_WALL_F - 0.14, r)
		placa.y = TROF_REPISA_Y - 0.19
		_boxc(Vector3(TROF_NICHO_W * 0.62, 0.09, 0.04), placa,
			C_TROF_REPISA.lightened(0.2), 0.5)


		var sitio: Vector3 = cone(TROF_WALL_F - 0.3, r)
		sitio.y = TROF_REPISA_Y
		nichos.append(sitio)





func _trof_sala_prensa() -> void:
	nichos.clear()
	var fondo: Vector3 = cone(TROF_WALL_F - 0.13, 0.0)
	fondo.y = 1.85
	_boxc(Vector3(1.9, 1.9, 0.05), fondo, club_color.darkened(0.45), 0.9)
	if crest != null:
		var spr: Sprite3D = Sprite3D.new()
		spr.texture = crest
		spr.pixel_size = 1.3 / float(maxi(crest.get_width(), 1))
		spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		var p: Vector3 = cone(TROF_WALL_F - 0.19, 0.0)
		p.y = 1.85
		spr.position = p
		spr.rotation_degrees.y = face()
		add_child(spr)



	for r in [-2.05, 2.05]:
		var cart: Vector3 = cone(TROF_WALL_F - 0.13, r)
		cart.y = 1.9
		_boxc(Vector3(1.25, 0.85, 0.05), cart, Color("cfcabd"), 0.9)
		_boxc(Vector3(1.35, 0.95, 0.03), cone(TROF_WALL_F - 0.1, r)
			+ Vector3(0.0, 1.9, 0.0), C_PRENSA_ZOCALO.darkened(0.2), 0.9)
	_trof_planta(-2.9)





func _trof_pasillo() -> void:
	nichos.clear()


	var tubo: Vector3 = cone(TROF_WALL_F - 0.9, 0.0)
	tubo.y = 2.62
	_boxc(Vector3(2.6, 0.09, 0.14), tubo, C_TUBO, 0.15)
	_boxc(Vector3(2.8, 0.07, 0.2), tubo + Vector3(0.0, 0.11, 0.0),
		C_CEMENTO.lightened(0.1), 0.9)


	var taq: Vector3 = cone(TROF_WALL_F - 0.42, -1.75)
	taq.y = 0.95
	_boxc(Vector3(1.1, 1.9, 0.42), taq, C_TAQUILLA, 0.8)
	_boxc(Vector3(0.03, 1.9, 0.44), taq, C_TAQUILLA.darkened(0.45), 0.8)
	for i in 3:
		var rej: Vector3 = cone(TROF_WALL_F - 0.62, -1.75)
		rej.y = 1.62 + float(i) * 0.09
		_boxc(Vector3(0.86, 0.03, 0.03), rej, C_TAQUILLA.darkened(0.5), 0.9)

	var banco: Vector3 = cone(TROF_WALL_F - 0.55, 1.95)
	banco.y = 0.46
	_boxc(Vector3(1.9, 0.09, 0.42), banco, C_WOOD.darkened(0.4), 0.9)
	for r in [1.2, 2.7]:
		var pata: Vector3 = cone(TROF_WALL_F - 0.55, r)
		pata.y = 0.22
		_boxc(Vector3(0.08, 0.44, 0.36), pata, C_TAQUILLA.darkened(0.35), 0.9)





func _trof_planta(r: float) -> void:
	var base: Vector3 = cone(TROF_WALL_F - 0.5, r)
	base.y = 0.22
	_boxc(Vector3(0.42, 0.44, 0.42), base, Color("7d5a3e"), 0.9)
	for i in 3:
		var h: Vector3 = cone(TROF_WALL_F - 0.5, r +(float(i) - 1.0) * 0.22)
		h.y = 0.72 + float(i % 2) * 0.28
		_boxc(Vector3(0.34, 0.5, 0.3), h, Color("2f4a35").lightened(float(i) * 0.08),
			0.95)
























const TROF_DER: float = 4.6
const TROF_IZQ: float = -3.1


func _trof_tumbado(cat: int) -> void:



	var liso: Color = [C_TROF_WALL, C_TROF_WALL, C_PRENSA_WALL, C_BLOQUE][cat].darkened(
		[0.3, 0.3, 0.3, 0.25][cat])
	var zocalo: Color = [C_TROF_WALL.darkened(0.45), C_TROF_WALL.darkened(0.45),
		C_PRENSA_ZOCALO, C_BLOQUE.darkened(0.35)][cat]
	_pared_derecha(TROF_DER, TROF_WALL_F, 3.9, zocalo, liso, 0.38)
	_pieza(Vector3(5.2, 0.38, 0.04), 0.0, TROF_IZQ, 0.19, zocalo, 90.0, 0.85, 0.0, 0.11)
	match cat:
		1:
			_trof_tumbado_museo()
		2:
			_trof_tumbado_prensa()
		_:
			_trof_tumbado_pasillo()





func _trof_tumbado_museo() -> void:
	var y_corn: float = TROF_REPISA_Y + TROF_NICHO_H + 0.16
	for lado in [[TROF_IZQ, 90.0, 0.13], [TROF_DER, -90.0, 0.1]]:
		var r: float = lado[0]
		var giro: float = lado[1]
		var d: float = lado[2]
		_pieza(Vector3(4.1, 0.1, 0.06), 0.5, r, y_corn, C_TROF_LUZ, giro, 0.2, 0.0, d)
		_trof_estandarte(1.45 if r > 0.0 else 0.55, r, giro, d)
	_trof_camiseta_marco(-0.6, TROF_IZQ, 90.0, 0.12)
	_trof_camiseta_marco(1.7, TROF_IZQ, 90.0, 0.12)
	_trof_camiseta_marco(0.15, TROF_DER, -90.0, 0.09)


	var oro: Color = Color("c9a24a")
	for f in [-1.2, 0.3, 1.8]:
		_cyl(0.035, 0.9, _floor_at(f, -2.55, 0.45), oro, 0.35)
		_cyl(0.14, 0.04, _floor_at(f, -2.55, 0.02), oro.darkened(0.3), 0.4)
	for f in [-0.45, 1.05]:
		_pieza(Vector3(0.03, 0.03, 1.5), f, -2.55, 0.84, Color("7a1f24"), 0.0, 0.9)

	_pieza(Vector3(0.5, 1.0, 0.5), 0.9, 3.8, 0.5, C_TROF_REPISA.lightened(0.15), 0.0, 0.4)
	_pieza(Vector3(0.58, 0.05, 0.58), 0.9, 3.8, 1.02, C_TROF_REPISA, 0.0, 0.3)
	var bola: SphereMesh = SphereMesh.new()
	bola.radius = 0.12
	bola.height = 0.24
	bola.radial_segments = 12
	bola.rings = 6
	_put(bola, _mat(Color("e9e4d8"), 0.6), _floor_at(0.9, 3.8, 1.17), Vector3.ZERO, null)





func _trof_tumbado_prensa() -> void:
	for i in 3:
		var f: float = -1.0 + float(i) * 1.25



		_pieza(Vector3(0.95, 0.66, 0.04), f, TROF_IZQ, 1.85, C_PRENSA_ZOCALO.darkened(0.3),
			90.0, 0.8, 0.0, 0.12)
		_pieza(Vector3(0.83, 0.54, 0.02), f, TROF_IZQ, 1.85,
			club_color.darkened(0.1 + 0.08 * float(i)), 90.0, 0.9, 0.0, 0.145)
		_pieza(Vector3(0.75, 0.1, 0.01), f, TROF_IZQ, 1.71, C_PAPER.darkened(0.25), 90.0,
			0.9, 0.0, 0.16)

	for f in [0.45, 1.15]:
		_pieza(Vector3(0.44, 0.04, 0.42), f, TROF_IZQ, 0.46, Color("3b3f48"), 90.0, 0.8,
			0.0, 0.45)
		_pieza(Vector3(0.44, 0.42, 0.04), f, TROF_IZQ, 0.7, Color("3b3f48"), 90.0, 0.8,
			0.0, 0.25)
		for a in [-0.2, 0.2]:
			_pieza(Vector3(0.03, 0.46, 0.38), f, TROF_IZQ, 0.23, C_METAL.darkened(0.3),
				90.0, 0.6, a, 0.45)
	_plato_camara(1.35, 3.55, -112.0)

	_pieza(Vector3(0.36, 1.0, 0.36), 2.15, 4.15, 0.5, Color("d6d4cc"), 0.0, 0.7)
	_cyl(0.15, 0.42, _floor_at(2.15, 4.15, 1.21), Color("5d8fb8"), 0.3)

	_pieza(Vector3(1.35, 0.95, 0.03), 0.6, TROF_DER, 1.9, C_PRENSA_ZOCALO.darkened(0.2),
		-90.0, 0.9, 0.0, 0.09)
	_pieza(Vector3(1.25, 0.85, 0.05), 0.6, TROF_DER, 1.9, Color("cfcabd"), -90.0, 0.9,
		0.0, 0.11)






func _trof_tumbado_pasillo() -> void:
	var junta: Color = C_BLOQUE_JUNTA
	var tubo: Color = C_METAL.darkened(0.2)
	for lado in [[TROF_IZQ, 90.0, 0.11, 0.0], [TROF_DER, -90.0, 0.08, -0.05]]:
		var r: float = lado[0]
		var giro: float = lado[1]
		var d: float = lado[2]
		var f: float = lado[3]
		for i in 5:
			_pieza(Vector3(5.3, 0.035, 0.04), f, r, 0.55 + float(i) * 0.62, junta, giro,
				0.95, 0.0, d)
		_pieza(Vector3(5.3, 0.08, 0.08), f, r, 3.05, tubo, giro, 0.6, 0.0, d + 0.1)

	var taq: float = 3.5
	_pieza(Vector3(1.1, 1.9, 0.42), TROF_WALL_F - 0.42, taq, 0.95, C_TAQUILLA, 0.0, 0.8)
	_pieza(Vector3(0.03, 1.9, 0.44), TROF_WALL_F - 0.42, taq, 0.95,
		C_TAQUILLA.darkened(0.45), 0.0, 0.8)
	for i in 3:
		_pieza(Vector3(0.86, 0.03, 0.03), TROF_WALL_F - 0.62, taq, 1.62 + float(i) * 0.09,
			C_TAQUILLA.darkened(0.5), 0.0, 0.9)

	_pieza(Vector3(1.1, 2.15, 0.06), 0.95, TROF_DER, 1.075, Color("4d5562"), -90.0, 0.8,
		0.0, 0.1)
	_pieza(Vector3(1.26, 2.25, 0.05), 0.95, TROF_DER, 1.125, C_METAL.darkened(0.2), -90.0,
		0.6, 0.0, 0.08)
	_pieza_mat(Vector3(0.36, 0.5, 0.02), 0.95, TROF_DER, 1.6, _emisivo(Color("f2f6ff"), 0.9),
		-90.0, 0.0, 0.14)
	_pieza(Vector3(0.16, 0.05, 0.08), 0.95, TROF_DER, 1.0, C_METAL, -90.0, 0.4, -0.4, 0.16)

	_pieza(Vector3(1.1, 0.8, 0.04), 0.2, TROF_IZQ, 1.6, C_CORK.darkened(0.2), 90.0, 0.95,
		0.0, 0.12)
	for k in 3:
		_pieza(Vector3(0.24, 0.32, 0.01), 0.2, TROF_IZQ, 1.62 + 0.06 * float(k % 2),
			C_PAPER.darkened(0.15), 90.0, 0.9, -0.33 + 0.33 * float(k), 0.145)

	_pieza(Vector3(0.2, 0.55, 0.2), 1.55, TROF_IZQ, 0.9, Color("b8322a"), 90.0, 0.6, 0.0,
		0.2)
	_pieza(Vector3(0.3, 0.3, 0.02), 1.55, TROF_IZQ, 1.45, C_PAPER.darkened(0.2), 90.0, 0.8,
		0.0, 0.11)
	_pieza(Vector3(0.7, 0.7, 0.18), -1.0, TROF_IZQ, 1.35, Color("8e2a24"), 90.0, 0.7, 0.0,
		0.18)
	_pieza(Vector3(0.5, 0.5, 0.02), -1.0, TROF_IZQ, 1.35, Color("c9cfd6"), 90.0, 0.3, 0.0,
		0.275)












func _trof_camiseta_marco(f: float, r: float, giro: float, d: float) -> void:
	_pieza(Vector3(0.95, 1.15, 0.05), f, r, 1.75, C_TROF_REPISA.lightened(0.25), giro,
		0.5, 0.0, d)
	var fondo: Color = Color("232a36") if club_color.get_luminance() > 0.45 \
			else Color("a8a397")
	_pieza(Vector3(0.83, 1.03, 0.02), f, r, 1.75, fondo, giro, 0.9, 0.0, d + 0.03)
	var vivo: Color = club_color.darkened(0.35) if club_color.get_luminance() > 0.45 \
			else club_color.lightened(0.35)

	_pieza(Vector3(0.46, 0.6, 0.02), f, r, 1.66, club_color, giro, 0.9, 0.0, d + 0.045)
	_pieza(Vector3(0.46, 0.04, 0.02), f, r, 1.38, vivo, giro, 0.9, 0.0, d + 0.05)


	for s in [-1.0, 1.0]:
		var manga: MeshInstance3D = _pieza(Vector3(0.24, 0.17, 0.02), f, r, 1.85, club_color,
			giro, 0.9, s * 0.25, d + 0.044)
		manga.rotate_object_local(Vector3(0.0, 0.0, 1.0), deg_to_rad(-32.0 * s))
		var puno: MeshInstance3D = _pieza(Vector3(0.05, 0.17, 0.02), f, r, 1.786, vivo,
			giro, 0.9, s * 0.352, d + 0.05)
		puno.rotate_object_local(Vector3(0.0, 0.0, 1.0), deg_to_rad(-32.0 * s))


	var tirilla: MeshInstance3D = _pieza(Vector3(0.15, 0.15, 0.02), f, r, 1.96, vivo,
		giro, 0.9, 0.0, d + 0.05)
	tirilla.rotate_object_local(Vector3(0.0, 0.0, 1.0), deg_to_rad(45.0))
	var pico: MeshInstance3D = _pieza(Vector3(0.11, 0.11, 0.02), f, r, 1.975, fondo,
		giro, 0.9, 0.0, d + 0.055)
	pico.rotate_object_local(Vector3(0.0, 0.0, 1.0), deg_to_rad(45.0))




func _trof_estandarte(f: float, r: float, giro: float, d: float) -> void:
	_pieza(Vector3(0.84, 0.04, 0.04), f, r, 2.78, C_METAL, giro, 0.4, 0.0, d + 0.05)
	_pieza(Vector3(0.72, 1.55, 0.02), f, r, 1.98, club_color.darkened(0.25), giro, 0.95,
		0.0, d + 0.04)
	_pieza(Vector3(0.72, 0.14, 0.025), f, r, 1.27, club_color.darkened(0.5), giro, 0.95,
		0.0, d + 0.045)
	if crest == null:
		return
	var spr: Sprite3D = Sprite3D.new()
	spr.texture = crest
	spr.pixel_size = 0.5 / float(maxi(crest.get_width(), 1))
	spr.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	spr.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	var g: float = deg_to_rad(giro)
	spr.position = _floor_at(f -(d + 0.06) * cos(g), r +(d + 0.06) * sin(g), 2.1)
	spr.rotation_degrees.y = face() + giro
	add_child(spr)
