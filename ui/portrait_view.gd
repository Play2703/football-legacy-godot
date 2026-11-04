class_name PortraitView
extends Control
























const SPRITE_BY_ROLE: Dictionary = {
	"dt": "res://assets/sprites/anim/coach_south_00.png",
	"jugador": "res://assets/sprites/players/player_south.png",
	"nemesis": "res://assets/sprites/players/player_south.png",
}



const BUST: Rect2 = Rect2(27, 6, 38, 46)

var _tex: Texture2D
var _frame_color: Color = Color(1, 1, 1, 0.25)





func setup(role: String, who: String, kit: Dictionary = {}) -> void:
	_tex = null
	if who.is_empty():
		queue_redraw()
		return
	var path: String = String(SPRITE_BY_ROLE.get(role, SPRITE_BY_ROLE["jugador"]))
	if not ResourceLoader.exists(path):
		queue_redraw()
		return



	_tex = KitRecolor.apply(load(path), KitRecolor.appearance_for(who, kit))
	_frame_color = CareerTheme.accent_text()
	queue_redraw()


func _draw() -> void:
	if _tex == null:
		return


	var k: float = minf(size.x / BUST.size.x, size.y / BUST.size.y)
	if k >= 1.0:
		k = floorf(k)
	var d: Vector2 = BUST.size * k
	var pos: Vector2 =(size - d) * 0.5
	draw_rect(Rect2(Vector2.ZERO, size), Color(0, 0, 0, 0.35))
	draw_texture_rect_region(_tex, Rect2(pos, d), BUST)
	draw_rect(Rect2(Vector2.ZERO, size), _frame_color, false, 2.0)
