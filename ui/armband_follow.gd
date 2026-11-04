extends Sprite3D

























const DX_FRONT: float = 0.27




const DX_SIDE: float = 0.05




const SIDE_SIGN: Dictionary = {"east": 1.0, "west": -1.0}

var _owner_spr: AnimatedSprite3D


var _last: String = ""


func _ready() -> void:
	_owner_spr = get_parent() as AnimatedSprite3D
	set_process(_owner_spr != null)
	_sync()


func _process(_delta: float) -> void:
	_sync()


func _sync() -> void:
	if _owner_spr == null or not is_instance_valid(_owner_spr):
		set_process(false)
		return
	var anim: String = _owner_spr.animation
	if anim == _last:
		return
	_last = anim


	var dx: float = DX_FRONT
	for lado in SIDE_SIGN:
		if anim.ends_with(String(lado)):
			dx = DX_SIDE * float(SIDE_SIGN[lado])
			break
	offset.x = dx / pixel_size
