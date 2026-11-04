class_name PlayerAvatar
extends Control









const PLAYER_TEX: Texture2D = preload("res://assets/sprites/players/player_south.png")


















const BUST: Rect2 = Rect2(28, 17, 37, 46)


















const BUST_CLOSE: Rect2 = Rect2(35, 17, 23, 30)

























































const BUST_TORSO: Rect2 = Rect2(33, 12, 27, 38)





const PIEZA_MIN: Vector2 = Vector2(3.0, 3.0)
const MARCA_MIN: Vector2 = Vector2(6.0, 3.0)







const REDUCIDAS_MAX: int = 48
static var _reducidas: Dictionary = {}
static var _orden_reducidas: Array[String] = []

var _tex: Texture2D







var chrome: bool = true





var bust: Rect2 = BUST










var club: Dictionary = {}

















const EJE_HOJA: Dictionary = {"keeper_south": -1.0, "coach_south_00": -1.0}


var _hoja: Texture2D
var _escudo: Texture2D
var _marca: Texture2D
var _marca_fab: Texture2D









func set_look(cfg: Dictionary, sheet: Texture2D = null) -> void:
	_hoja = sheet if sheet != null else PLAYER_TEX
	_tex = KitRecolor.apply(_hoja, _con_escudo(cfg))
	queue_redraw()


func _draw() -> void:
	if _tex == null:
		return


	var b: Rect2 = _recorte()
	var k: float = minf(size.x / b.size.x, size.y / b.size.y)
	if k >= 1.0:
		k = floorf(k)
	var d: Vector2 = b.size * k
	var pos: Vector2 =(size - d) * 0.5
	if chrome:
		draw_rect(Rect2(Vector2.ZERO, size), Color(0, 0, 0, 0.3))
	draw_texture_rect_region(_tex, Rect2(pos, d), b)




	_huecos()
	_pinta(_escudo, _esc_r, pos, k, b)
	_pinta(_marca, _pat_r, pos, k, b)
	_pinta(_marca_fab, _fab_r, pos, k, b)

	if chrome:
		draw_rect(Rect2(Vector2.ZERO, size), CareerTheme.accent_text(), false, 2.0)



























func _con_escudo(cfg: Dictionary) -> Dictionary:
	_escudo = null
	_marca = null
	_marca_fab = null
	var id: String = String(club.get("id", ""))
	if id.is_empty():
		return cfg
	_huecos()
	var out: Dictionary = cfg


	var epoca: bool = bool(cfg.get("retro", false))
	var clave: String = CrestLogos.key_of(club)
	if CrestLogos.has(clave) and _esc_r.size.x > 0.0:
		var esc: Texture2D = CrestLogos.texture(clave, epoca)
		if esc != null:
			out = cfg.duplicate()
			out["crest_logo"] = clave
			_escudo = esc



	var marca: Texture2D = SponsorLogos.for_team(id, epoca)
	if marca != null and _pat_r.size.x > 0.0:
		_marca = Pecho.marca_para(marca, out, "pat")



	var fab: Texture2D = KitBrands.for_team(id, epoca, int(cfg.get("kit_slot", 0)))
	if fab != null and _fab_r.size.x > 0.0:
		_marca_fab = Pecho.marca_para(fab, out, "fab")
	return out











var _esc_r: Rect2 = Rect2()
var _pat_r: Rect2 = Rect2()
var _fab_r: Rect2 = Rect2()
var _bust_calc: Rect2 = Rect2(-1, -1, -1, -1)
var _hoja_calc: Texture2D

func _huecos() -> void:



	var b: Rect2 = _recorte()
	if _bust_calc == b and _hoja_calc == _hoja:
		return
	_bust_calc = b
	_hoja_calc = _hoja
	var r: Dictionary = Pecho.rects_base(_base())
	_esc_r = _cabe(b.intersection(r.get("esc", Rect2())), PIEZA_MIN)
	if _esc_r.size.x <= 0.0:






		_esc_r = _cabe(b.intersection(
			Rect2(KitRecolor.crest_patch_rect(_hoja))), PIEZA_MIN)



	_pat_r = _cabe(b.intersection(r.get("pat", Rect2())), MARCA_MIN)



	_fab_r = _cabe(b.intersection(r.get("fab", Rect2())), PIEZA_MIN)





func _recorte() -> Rect2:
	var dx: float = float(EJE_HOJA.get(_base(), 0.0))
	if is_zero_approx(dx):
		return bust
	return Rect2(bust.position + Vector2(dx, 0.0), bust.size)




func _cabe(v: Rect2, minimo: Vector2) -> Rect2:
	return v if v.size.x >= minimo.x and v.size.y >= minimo.y else Rect2()




func _base() -> String:
	if _hoja == null or _hoja.resource_path.is_empty():
		return "player_south"
	return _hoja.resource_path.get_file().get_basename()





func _pinta(tex: Texture2D, hueco: Rect2, pos: Vector2, k: float, rec: Rect2) -> void:
	if tex == null or hueco.size.x <= 0.0:
		return
	var ts: Vector2 = tex.get_size()
	if ts.x <= 0.0 or ts.y <= 0.0:
		return
	var e: float = minf(hueco.size.x / ts.x, hueco.size.y / ts.y) * k
	var d: Vector2i = Vector2i(maxi(1, roundi(ts.x * e)), maxi(1, roundi(ts.y * e)))
	var c: Vector2 = pos +(hueco.position + hueco.size * 0.5 - rec.position) * k



	draw_texture_rect(_reducida(tex, d), Rect2((c - Vector2(d) * 0.5).round(),
		Vector2(d)), false)



















static func _reducida(tex: Texture2D, px: Vector2i) -> Texture2D:
	var ts: Vector2i = Vector2i(tex.get_size())



	if ts.x <= px.x and ts.y <= px.y:
		return tex
	var clave: String = "%d|%dx%d" % [tex.get_instance_id(), px.x, px.y]
	if _reducidas.has(clave):
		return _reducidas[clave]
	var img: Image = tex.get_image()
	if img == null:
		return tex
	img = img.duplicate()
	if img.is_compressed():
		img.decompress()
	img.resize(px.x, px.y, Image.INTERPOLATE_LANCZOS)
	var out: ImageTexture = ImageTexture.create_from_image(img)
	_reducidas[clave] = out
	_orden_reducidas.append(clave)



	if _orden_reducidas.size() > REDUCIDAS_MAX:
		_reducidas.erase(_orden_reducidas.pop_front())
	return out
