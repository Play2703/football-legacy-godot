class_name GorroDuende
extends Sprite3D































const VISTAS: Dictionary = {
	"south": "res://assets/sprites/modular/duende/gorro_duende_south.png",
	"east": "res://assets/sprites/modular/duende/gorro_duende_east.png",
	"west": "res://assets/sprites/modular/duende/gorro_duende_west.png",
	"north": "res://assets/sprites/modular/duende/gorro_duende_north.png",
}


const HACIA_M: float = 0.08
const PARCHES_MAX: int = 400


const NUEVOS_POR_FOTOGRAMA: int = 3

static var _parches: Dictionary = {}
static var _fotograma: int = -1
static var _nuevos: int = 0

var _actor: AnimatedSprite3D
var _rutas: Dictionary = {}
var _piel: Color = KitRecolor.REF_SKIN
var _piel_str: String = ""
var _clave_puesta: String = ""




static func pon(actor: AnimatedSprite3D, rutas: Dictionary) -> GorroDuende:
	if actor == null or not is_instance_valid(actor) or rutas.is_empty():
		return null
	var g: GorroDuende = de(actor)
	if g == null:
		g = GorroDuende.new()
		g._actor = actor
		g.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		g.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		g.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		actor.add_child(g)
		actor.set_meta("gorro_duende", g)
	g._rutas = rutas
	var cfg: Dictionary = actor.get_meta("anim_cfg", actor.get_meta("cara_cfg", {}))
	var piel: Variant = cfg.get("skin", KitRecolor.REF_SKIN)
	g._piel = piel if piel is Color else Color.from_string(String(piel), KitRecolor.REF_SKIN)
	g._piel_str = g._piel.to_html(false)
	g._clave_puesta = ""
	g._sigue()
	return g



static func de(actor: Node) -> GorroDuende:
	if actor == null or not actor.has_meta("gorro_duende"):
		return null
	var g: Variant = actor.get_meta("gorro_duende")
	return g if g is GorroDuende and is_instance_valid(g) else null


func quita() -> void:
	if is_instance_valid(_actor) and de(_actor) == self:
		_actor.remove_meta("gorro_duende")
	queue_free()




static func parche(ruta: String, piel: Color, piel_str: String = "") -> Texture2D:
	var clave: String = ruta + "|" +(piel_str if not piel_str.is_empty() else piel.to_html(false))
	if _parches.has(clave):
		return _parches[clave]
	var out: ImageTexture = null
	var capa: Image = ModularAppearance.pieza_en_cuadro(ruta, VISTAS)
	if capa != null:
		_tine_orejas(capa, piel)
		out = ImageTexture.create_from_image(capa)
	if _parches.size() >= PARCHES_MAX:
		_parches.clear()
	_parches[clave] = out
	return out




static func _tine_orejas(capa: Image, piel: Color) -> void:
	if piel.is_equal_approx(KitRecolor.REF_SKIN):
		return
	var r: Rect2i = capa.get_used_rect()
	for y in range(r.position.y, r.end.y):
		for x in range(r.position.x, r.end.x):
			var c: Color = capa.get_pixel(x, y)
			if c.a > 0.0 and c.r8 > c.g8 and c.v > 0.2:
				capa.set_pixel(x, y, KitRecolor._toned_skin(piel, KitRecolor.REF_SKIN, c))


static func _gasta() -> bool:
	var ahora: int = Engine.get_process_frames()
	if ahora != _fotograma:
		_fotograma = ahora
		_nuevos = 0
	if _nuevos >= NUEVOS_POR_FOTOGRAMA:
		return false
	_nuevos += 1
	return true


func _process(_delta: float) -> void:
	if not is_instance_valid(_actor):
		queue_free()
		return
	_sigue()



func _sigue() -> void:
	if not is_instance_valid(_actor) or not _actor.is_visible_in_tree():
		return
	var rutas: Array = _rutas.get(String(_actor.animation), [])
	var f: int = _actor.frame
	var clave: String = "%s|%d" % [_actor.animation, f]
	if clave != _clave_puesta:
		if f >= rutas.size():
			_clave_puesta = clave
			texture = null
		elif _parches.has(String(rutas[f]) + "|" + _piel_str) or _gasta():
			_clave_puesta = clave
			texture = parche(String(rutas[f]), _piel, _piel_str)
	pixel_size = _actor.pixel_size
	offset = _actor.offset
	centered = _actor.centered
	flip_h = _actor.flip_h
	modulate = _actor.modulate
	var hacia: Vector3 = Vector3.ZERO
	var cam: Camera3D = SceneFade.camara_de(self) if is_inside_tree() else null
	if cam != null:
		var v: Vector3 = cam.global_position - _actor.global_position
		v.y = 0.0
		if v.length_squared() > 0.0001:
			hacia = v.normalized() * HACIA_M

	transform = Transform3D(Basis.IDENTITY, _actor.global_basis.inverse() * hacia)
