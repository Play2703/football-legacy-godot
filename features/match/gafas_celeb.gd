class_name GafasCeleb
extends Sprite3D

# Óculos escuros durante comemorações de gol (ETAPA 4e.16 - C16)
# Renderiza os óculos com o mesmo billboard, offset, escala e orientação do jogador,
# sendo removido imediatamente ao término do festejo.

const GAFAS_FRONT: String = "res://assets/sprites/acc/gafas.png"
const GAFAS_EAST: String = "res://assets/sprites/acc/gafas_east.png"
const GAFAS_WEST: String = "res://assets/sprites/acc/gafas_west.png"

static var _tex_front: Texture2D = null
static var _tex_east: Texture2D = null
static var _tex_west: Texture2D = null

var _actor: Node3D = null

static func tex_front() -> Texture2D:
	if _tex_front == null and ResourceLoader.exists(GAFAS_FRONT):
		_tex_front = load(GAFAS_FRONT)
	return _tex_front

static func tex_east() -> Texture2D:
	if _tex_east == null and ResourceLoader.exists(GAFAS_EAST):
		_tex_east = load(GAFAS_EAST)
	return _tex_east

static func tex_west() -> Texture2D:
	if _tex_west == null and ResourceLoader.exists(GAFAS_WEST):
		_tex_west = load(GAFAS_WEST)
	return _tex_west

static func pon(actor: Node3D) -> GafasCeleb:
	if actor == null or not is_instance_valid(actor):
		return null
	var ya: GafasCeleb = de(actor)
	if ya != null:
		return ya
	var g: GafasCeleb = GafasCeleb.new()
	g.name = "GafasCeleb"
	g._actor = actor
	if actor is SpriteBase3D:
		var sb: SpriteBase3D = actor as SpriteBase3D
		g.billboard = sb.billboard
		g.pixel_size = sb.pixel_size
		g.offset = sb.offset
		g.centered = sb.centered
	else:
		g.billboard = BaseMaterial3D.BILLBOARD_ENABLED
	g.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	g.alpha_cut = SpriteBase3D.ALPHA_CUT_DISCARD
	g.render_priority = 5
	g.cast_shadow = GeometryInstance3D.SHADOW_CASTING_SETTING_OFF
	g.texture = tex_front()
	actor.add_child(g)
	actor.set_meta("gafas_celeb", g)
	g._atualiza()
	return g

static func de(actor: Node) -> GafasCeleb:
	if actor == null or not is_instance_valid(actor) or not actor.has_meta("gafas_celeb"):
		return null
	var g: Variant = actor.get_meta("gafas_celeb")
	return g as GafasCeleb if is_instance_valid(g) else null

func quita() -> void:
	if is_instance_valid(_actor) and de(_actor) == self:
		_actor.remove_meta("gafas_celeb")
	queue_free()

func _notification(what: int) -> void:
	if what == NOTIFICATION_PREDELETE or what == NOTIFICATION_EXIT_TREE:
		if is_instance_valid(_actor) and de(_actor) == self:
			_actor.remove_meta("gafas_celeb")

static func quita_de(actor: Node) -> void:
	var g: GafasCeleb = de(actor)
	if g != null and is_instance_valid(g):
		g.quita()

func _process(_delta: float) -> void:
	if not is_instance_valid(_actor):
		queue_free()
		return
	_atualiza()

func _atualiza() -> void:
	if not is_instance_valid(_actor) or not _actor.is_visible_in_tree():
		visible = false
		return
	if _actor is SpriteBase3D:
		var sb: SpriteBase3D = _actor as SpriteBase3D
		pixel_size = sb.pixel_size
		offset = sb.offset
		centered = sb.centered
		modulate = sb.modulate
		billboard = sb.billboard

	var anim: String = ""
	if _actor is AnimatedSprite3D:
		anim = String((_actor as AnimatedSprite3D).animation)
	elif _actor.has_method("get_animation"):
		anim = String(_actor.call("get_animation"))

	if anim.ends_with("north") or anim.ends_with("_back"):
		visible = false
		return

	visible = true
	if anim.ends_with("east"):
		texture = tex_east()
		flip_h = false
	elif anim.ends_with("west"):
		texture = tex_west()
		flip_h = false
	else:
		texture = tex_front()
		if _actor is SpriteBase3D:
			flip_h = (_actor as SpriteBase3D).flip_h
