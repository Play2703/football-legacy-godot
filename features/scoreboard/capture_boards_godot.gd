extends SceneTree

func _init() -> void:
	var runner = Node.new()
	runner.set_script(preload("res://features/scoreboard/capture_runner.gd"))
	root.add_child(runner)
