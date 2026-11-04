class_name OffsideFlag
extends RefCounted



























const FRAME_PATH: String = "res://assets/sprites/anim/linesman_south_%02d.png"
const FRAME_N: int = 11












static func frames(cfg: Dictionary = {}) -> SpriteFrames:
	var loaded: Array = []
	for i in range(FRAME_N):
		var path: String = FRAME_PATH % i
		if ResourceLoader.exists(path):
			loaded.append(KitRecolor.apply(load(path), cfg))
	var sf: SpriteFrames = SpriteFrames.new()
	sf.add_animation("signal")
	sf.set_animation_loop("signal", true)
	sf.set_animation_speed("signal", 9.0)
	if loaded.is_empty():
		return sf

	var last: int = loaded.size() - 1
	for i in range(loaded.size()):
		sf.add_frame("signal", loaded[i])
	for _hold in range(3):
		sf.add_frame("signal", loaded[last])
	for i in range(last - 1, 0, -1):
		sf.add_frame("signal", loaded[i])
	return sf








static func cycle_seconds(sf: SpriteFrames = null) -> float:
	if sf == null:
		sf = frames()
	if not sf.has_animation("signal"):
		return 0.0
	var n: int = sf.get_frame_count("signal")
	var fps: float = sf.get_animation_speed("signal")
	if n <= 0 or fps <= 0.0:
		return 0.0

	return float(n) / fps
