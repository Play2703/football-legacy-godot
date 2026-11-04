class_name CaraEncima
extends Sprite3D




















const HACIA_M: float = 0.06
const PARCHES_MAX: int = 600
const PARPADEO_MIN_S: float = 2.5
const PARPADEO_MAX_S: float = 5.0










const NUEVOS_POR_FOTOGRAMA: int = 2

const GRUPO: StringName = &"cara_encima"

static var _parches: Dictionary = {}









static var _fijos: Dictionary = {}
static var _fijos_por_tag: Dictionary = {}
static var _fotograma: int = -1
static var _nuevos: int = 0

var _actor: AnimatedSprite3D
var _rutas: Dictionary = {}
var _cfg: Dictionary = {}
var _cfg_str: String = ""
var _anim: String = ""
var _t: float = 0.0
var _fase: float = 0.0
var _dura: float = 0.0
var _parpadeo: float = 3.0
var _clave_puesta: String = ""
var _cuadro_puesto: String = ""
var _rng := RandomNumberGenerator.new()




static func pon(padre: Node, actor: AnimatedSprite3D, rutas: Dictionary, anim: String,
		dura_s: float) -> CaraEncima:
	if actor == null or not is_instance_valid(actor) or padre == null or rutas.is_empty():
		return null
	var c: CaraEncima = de(actor)
	if c == null:
		c = CaraEncima.new()
		c._actor = actor
		c.billboard = BaseMaterial3D.BILLBOARD_FIXED_Y
		c.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		c.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
		c.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
		c._rng.randomize()









		(actor if actor.is_inside_tree() else padre).add_child(c)
		actor.set_meta("cara_encima", c)

		c.add_to_group(GRUPO)


		actor.frame_changed.connect(c._cambia_cuadro)
		actor.animation_changed.connect(c._cambia_cuadro)
	c._rutas = rutas

	c._cfg = actor.get_meta("anim_cfg", actor.get_meta("cara_cfg", {}))
	c._cfg_str = var_to_str(c._cfg)
	c._anim = anim
	c._t = 0.0
	c._fase = c._rng.randf_range(0.0, Expresiones.BUCLE_S)
	c._dura = dura_s
	c._parpadeo = c._rng.randf_range(PARPADEO_MIN_S, PARPADEO_MAX_S)
	c._sigue()
	return c





static func sigue_todas(arbol: SceneTree) -> void:
	if arbol == null:
		return
	for n in arbol.get_nodes_in_group(GRUPO):
		var c: CaraEncima = n as CaraEncima
		if c != null and not c.is_queued_for_deletion():
			c._sigue()



static func de(actor: Node) -> CaraEncima:
	if actor == null or not actor.has_meta("cara_encima"):
		return null
	var c: Variant = actor.get_meta("cara_encima")
	return c if c is CaraEncima and is_instance_valid(c) else null



func quita() -> void:
	if is_instance_valid(_actor) and de(_actor) == self:
		_actor.remove_meta("cara_encima")
	queue_free()




static func parche(ruta: String, cfg: Dictionary, estado: String,
		cfg_str: String = "") -> Texture2D:
	if estado.is_empty():
		return null
	var clave: String = ruta + "|" +(cfg_str if not cfg_str.is_empty() else var_to_str(cfg)) \
			+ "|" + estado
	if _fijos.has(clave):
		return _fijos[clave]


	if cfg.has("_repe"):
		cfg = cfg.duplicate()
		cfg.erase("_repe")
	if _parches.has(clave):


		var hit: Variant = _parches[clave]
		_parches.erase(clave)
		_parches[clave] = hit
		return hit
	var tex: Texture2D = load(ruta)
	var out: ImageTexture = null
	if tex != null:
		var con: Dictionary = cfg.duplicate()
		con["expresion"] = estado














		var previa: bool = KitRecolor.imagen_en_meta
		KitRecolor.imagen_en_meta = false
		var ta: Texture2D = KitRecolor.apply(tex, cfg)
		var a: Image = _imagen(ta)
		KitRecolor.imagen_en_meta = true
		var tb: Texture2D = KitRecolor.apply(tex, con)
		KitRecolor.imagen_en_meta = previa
		var b: Image = _imagen(tb)
		KitRecolor.suelta(tb)
		if a != null and b != null and a.get_size() == b.get_size():
			var d: Image = _resta(a, b)
			if d != null:
				out = ImageTexture.create_from_image(d)





	while _parches.size() >= PARCHES_MAX:
		for viejo in _parches:
			_parches.erase(viejo)
			break
	_parches[clave] = out
	return out













static func _resta(a: Image, b: Image) -> Image:
	var w: int = a.get_width()
	var h: int = a.get_height()
	var fila: int = w * 4
	var da: PackedByteArray = a.get_data()
	var db: PackedByteArray = b.get_data()
	var out := PackedByteArray()
	var hay: bool = false
	for y in h:
		var o: int = y * fila
		if da.slice(o, o + fila) == db.slice(o, o + fila):
			continue
		if out.is_empty():
			out.resize(w * h * 4)
			out.fill(0)
		for x in w:
			var p: int = o + x * 4
			var vb: int = db.decode_u32(p)
			if vb != da.decode_u32(p):
				out.encode_u32(p, vb|4278190080)
				hay = true
	if not hay:
		return null
	return Image.create_from_data(w, h, false, Image.FORMAT_RGBA8, out)


static func _imagen(t: Texture2D) -> Image:
	if t == null:
		return null
	var im: Image = KitRecolor.imagen_de(t)
	if im == null:
		im = t.get_image()
	if im != null and im.is_compressed():
		im = im.duplicate()
		im.decompress()
	if im != null and im.get_format() != Image.FORMAT_RGBA8:
		im = im.duplicate()
		im.convert(Image.FORMAT_RGBA8)
	return im


func _process(delta: float) -> void:
	if not is_instance_valid(_actor):
		queue_free()
		return
	_t += delta
	if _dura > 0.0 and _t >= _dura:
		quita()
		return
	_parpadeo -= delta
	if _parpadeo < - Expresiones.PASO_S:
		_parpadeo = _rng.randf_range(PARPADEO_MIN_S, PARPADEO_MAX_S)
	_sigue()




func estado() -> String:
	var e: String = Expresiones.estado_en(_anim, _t + _fase)
	if _parpadeo <= 0.0:
		var p: Dictionary = Expresiones.partes(e)
		if p["ojos"] == "-":
			p["ojos"] = "cerrados"
			e = "%s:%s:%s:%d:%s" % [p["ceja"], p["boca"], p["ojos"], p["lagrima"],
				"1" if p["mejilla"] else "0"]
	return e







func _cambia_cuadro() -> void:
	if texture != null and is_instance_valid(_actor) \
			and _cuadro_puesto != "%s|%d" % [_actor.animation, _actor.frame]:
		texture = null
		_clave_puesta = ""
		_cuadro_puesto = ""




func _cabe(rutas: Array, f: int, estado: String, tope: int = NUEVOS_POR_FOTOGRAMA) -> bool:
	return f >= rutas.size() or listo(String(rutas[f]), _cfg_str, estado) or gasta(tope)




static func listo(ruta: String, cfg_str: String, estado: String) -> bool:
	var clave: String = ruta + "|" + cfg_str + "|" + estado
	return estado.is_empty() or _fijos.has(clave) or _parches.has(clave)





static func fija(tag: String, parches: Dictionary) -> void:
	var e: Variant = _fijos_por_tag.get(tag)
	if e is Array:
		e[1] = int(e[1]) + 1
	else:
		_fijos_por_tag[tag] = [parches.keys(), 1]
	for k in parches:
		_fijos[k] = parches[k]



static func suelta_fijos(tag: String) -> void:
	var e: Variant = _fijos_por_tag.get(tag)
	if not (e is Array):
		return
	e[1] = int(e[1]) - 1
	if int(e[1]) > 0:
		return
	for k in e[0]:
		_fijos.erase(k)
	_fijos_por_tag.erase(tag)



static func fijos_vivos() -> int:
	return _fijos_por_tag.size()



static func queda(tope: int = NUEVOS_POR_FOTOGRAMA) -> bool:
	if Engine.get_process_frames() != _fotograma:
		return tope > 0
	return _nuevos < tope




static func gasta(tope: int = NUEVOS_POR_FOTOGRAMA) -> bool:
	var ahora: int = Engine.get_process_frames()
	if ahora != _fotograma:
		_fotograma = ahora
		_nuevos = 0
	if _nuevos >= tope:
		return false
	_nuevos += 1
	return true









static func agota() -> void:
	_fotograma = Engine.get_process_frames()
	_nuevos = NUEVOS_POR_FOTOGRAMA



















func _sigue() -> void:
	if not is_instance_valid(_actor):
		return
	visible = _actor.is_visible_in_tree()
	if not visible:
		return
	var rutas: Array = _rutas.get(String(_actor.animation), [])
	var f: int = _actor.frame
	var estado: String = estado()
	var cuadro: String = "%s|%d" % [_actor.animation, f]
	var clave: String = cuadro + "|" + estado
	if clave != _clave_puesta:












		var mismo: bool = cuadro == _cuadro_puesto
		if _cabe(rutas, f, estado, 1 if mismo else NUEVOS_POR_FOTOGRAMA):
			_clave_puesta = clave
			_cuadro_puesto = cuadro
			texture = parche(String(rutas[f]), _cfg, estado, _cfg_str) if f < rutas.size() else null
		elif not mismo and texture != null:


			texture = null
			_clave_puesta = ""
			_cuadro_puesto = ""

	var cam: Camera3D = SceneFade.camara_de(self) if is_inside_tree() else null
	if cam != null and cam.cull_mask == 0:
		return
	pixel_size = _actor.pixel_size
	offset = _actor.offset
	centered = _actor.centered
	flip_h = _actor.flip_h
	modulate = _actor.modulate
	var hacia: Vector3 = Vector3.ZERO
	if cam != null:
		var v: Vector3 = cam.global_position - _actor.global_position
		v.y = 0.0
		if v.length_squared() > 0.0001:
			hacia = v.normalized() * HACIA_M
	if get_parent() == _actor:

		transform = Transform3D(Basis.IDENTITY, _actor.global_basis.inverse() * hacia)
	else:
		global_transform = Transform3D(_actor.global_transform.basis, _actor.global_position + hacia)
