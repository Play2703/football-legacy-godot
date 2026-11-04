class_name StrikeZones
extends Control












































const SEP: float = 30.0



const PERDON: float = 1.15
















const VELO_A: float = 0.62
const ZONA_A: float = 0.72




const U_LADO: float = 0.55



const R_SUCIO: float = 0.95


const R_NUCLEO: float = 0.3


const FRANJAS: int = 40









const ARTE: float =(16.0 - 3.0) / 16.0







const TICK_AIRE: float = 7.0
const FADE_IN: float = 0.3
const FADE_OUT: float = 0.22

var _center: Vector2 = Vector2.ZERO
var _radius: float = 0.0
var _activo: bool = false
var _tw: Tween = null

var _alta: Label = null
var _baja: Label = null
var _izq: Label = null
var _der: Label = null
var _pie: Label = null


var _salto: Rect2 = Rect2()


func _ready() -> void:

	mouse_filter = Control.MOUSE_FILTER_IGNORE
	set_anchors_preset(Control.PRESET_FULL_RECT)
	visible = false
	modulate.a = 0.0



	_alta = _rotulo(I18n.t(Tutorial.STRIKE_ZONA_ALTA), CareerTheme.T_BODY,
		color_zona(&"alta"))
	_baja = _rotulo(I18n.t(Tutorial.STRIKE_ZONA_BAJA), CareerTheme.T_BODY,
		color_zona(&"baja"))
	_izq = _rotulo(I18n.t(Tutorial.STRIKE_ZONA_LADO), CareerTheme.T_BODY,
		color_zona(&"lado"))
	_der = _rotulo(I18n.t(Tutorial.STRIKE_ZONA_LADO), CareerTheme.T_BODY,
		color_zona(&"lado"))
	_pie = _rotulo(I18n.t(Tutorial.STRIKE_TIP), CareerTheme.T_DIM, CareerTheme.TEXT)






func _rotulo(texto: String, px: int, col: Color) -> Label:
	var l: Label = CareerUi.plain(px, col)
	l.text = CareerTheme.deaccent(texto)
	l.add_theme_constant_override("outline_size", 6)
	l.add_theme_color_override("font_outline_color", CareerTheme.BG_DEEP)
	l.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	add_child(l)
	l.reset_size()
	return l





func set_ball(center: Vector2, radius: float) -> void:
	_center = center
	_radius = radius
	if radius <= 1.0:
		return
	_coloca()
	queue_redraw()












const RUMBOS: Dictionary = {
	"alta": Vector2(-0.72, -0.7),
	"baja": Vector2(0.0, 1.0),
	"izq": Vector2(-1.0, 0.0),
	"der": Vector2(1.0, 0.0),
}


func _coloca() -> void:
	var r: float = _radius * PERDON + SEP
	_pon_en(_alta, RUMBOS["alta"], r)
	_pon_en(_baja, RUMBOS["baja"], r)
	_pon_en(_izq, RUMBOS["izq"], r)
	_pon_en(_der, RUMBOS["der"], r)
	_esquiva_aviso()
















const AVISO_AIRE: float = 8.0


func _esquiva_aviso() -> void:
	_salto = Rect2()
	if not UiKit.es_horizontal() or not get_parent() is MatchHud:
		return
	var aviso: Rect2 =(get_parent() as MatchHud).caja_aviso()
	if aviso.size.x <= 0.0:
		return
	var aire: Rect2 = aviso.grow(AVISO_AIRE)
	if not (aire.intersects(_baja.get_rect()) or aire.intersects(_pie.get_rect())):
		return
	_salto = aviso
	_pon(_baja, Vector2(_center.x, aviso.end.y + SEP + _baja.size.y * 0.5))
	_pon(_pie, Vector2(_center.x, _baja.position.y + _baja.size.y + _pie.size.y))











func _pon_en(l: Label, rumbo: Vector2, r: float) -> void:
	var d: Vector2 = rumbo.normalized()
	var soporte: float = absf(d.x) * l.size.x * 0.5 + absf(d.y) * l.size.y * 0.5
	_pon(l, _center + d *(r + soporte))


	_pon(_pie, Vector2(_center.x, _baja.position.y + _baja.size.y + _pie.size.y))


func _pon(l: Label, centro: Vector2) -> void:
	l.position = centro - l.size * 0.5


func enciende() -> void:
	if _activo:
		return
	_activo = true
	visible = true
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(self, "modulate:a", 1.0, FADE_IN).set_trans(Tween.TRANS_SINE)





func apaga() -> void:
	if not _activo:
		return
	_activo = false
	if _tw != null and _tw.is_valid():
		_tw.kill()
	_tw = create_tween()
	_tw.set_ignore_time_scale(true)
	_tw.tween_property(self, "modulate:a", 0.0, FADE_OUT).set_trans(Tween.TRANS_SINE)
	_tw.tween_callback(func() -> void: visible = false)

















static func color_zona(cual: StringName) -> Color:
	match cual:
		&"alta":
			return CareerTheme.NAV_PAPEL
		&"baja":
			return CareerTheme.NAV_YO
		&"lado":
			return CareerTheme.NAV_MUNDO
		&"sucio":
			return CareerTheme.DANGER
		_:
			return CareerTheme.TEXT


func _draw() -> void:
	if _radius <= 1.0:
		return
	_pinta_mapa()



	for t in rayitas():
		var a: Vector2 = t[0]
		var b: Vector2 = t[1]
		draw_line(a + Vector2(0.0, 2.0), b + Vector2(0.0, 2.0),
			Color(CareerTheme.BG_DEEP, 0.55), 5.0)
		draw_line(a, b, Color(CareerTheme.TEXT, 0.9), 3.0)






func rayitas() -> Array:
	var out: Array = []
	for clave in RUMBOS:
		var d: Vector2 =(RUMBOS[clave] as Vector2).normalized()
		var a: Vector2 = _center + d *(_radius * PERDON + TICK_AIRE)
		if clave == "baja" and _salto.size.x > 0.0:
			if a.y < _salto.position.y - TICK_AIRE:
				out.append([a, Vector2(a.x, _salto.position.y - TICK_AIRE), clave])
			out.append([Vector2(a.x, _salto.end.y + TICK_AIRE),
				Vector2(a.x, _baja.position.y - TICK_AIRE), clave])
			continue
		out.append([a, _center + d *(_radius * PERDON + SEP - TICK_AIRE), clave])
	return out






func _pinta_mapa() -> void:
	var r: float = _radius * ARTE
	var paso: float =(r * 2.0) / float(FRANJAS)
	for i in FRANJAS:
		var y0: float = - r + float(i) * paso
		var y1: float = y0 + paso








		var yb: float = y0 if absf(y0) > absf(y1) else y1
		var media: float = sqrt(maxf(r * r - yb * yb, 0.0))
		if media <= 0.5:
			continue
		var arriba: bool =(y0 + y1) * 0.5 < 0.0
		var centro_col: Color = color_zona(&"alta" if arriba else &"baja")
		var lado: float = U_LADO * r

		var mc: float = minf(media, lado)
		_franja(- mc, mc, y0, y1, centro_col)



		if media > lado:
			_franja(- media, - lado, y0, y1, color_zona(&"lado"))
			_franja(lado, media, y0, y1, color_zona(&"lado"))



	var ancho: float = r *(1.0 - R_SUCIO) + 3.0
	var medio: float = r *(R_SUCIO + 1.0) * 0.5
	var abre: float = acos(U_LADO)
	for base in [0.0, PI]:
		draw_arc(_center, medio, base - abre, base + abre, 24,
			Color(CareerTheme.BG_DEEP, 0.7), ancho + 4.0)
		draw_arc(_center, medio, base - abre, base + abre, 24,
			Color(color_zona(&"sucio"), 0.95), ancho)



	draw_circle(_center, r * R_NUCLEO, Color(CareerTheme.TEXT, 0.16))
	draw_arc(_center, r * R_NUCLEO, 0.0, TAU, 40, Color(CareerTheme.BG_DEEP, 0.6), 7.0)
	draw_arc(_center, r * R_NUCLEO, 0.0, TAU, 40, Color(CareerTheme.TEXT, 0.95), 4.0)



	draw_line(_center - Vector2(r, 0.0), _center + Vector2(r, 0.0),
		Color(CareerTheme.BG_DEEP, 0.5), 3.0)





func _franja(x0: float, x1: float, y0: float, y1: float, col: Color) -> void:
	var rc: Rect2 = Rect2(_center.x + x0, _center.y + y0, x1 - x0, y1 - y0)
	draw_rect(rc, Color(CareerTheme.BG_DEEP, VELO_A), true)
	draw_rect(rc, Color(col, ZONA_A), true)
