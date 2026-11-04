extends Node




















var steam: Object = null

var sin_alta: PackedStringArray = PackedStringArray()


func _ready() -> void:
	Achievements.unlocked.connect(_on_unlocked)


	barre.call_deferred()


func _exit_tree() -> void:
	if Achievements.unlocked.is_connected(_on_unlocked):
		Achievements.unlocked.disconnect(_on_unlocked)







func barre() -> int:
	if steam == null:
		return 0
	sin_alta = PackedStringArray()
	var nuevos: int = 0
	for id in Achievements.unlocked_ids():
		if _marca(String(id)):
			nuevos += 1
	if nuevos > 0:
		steam.call("storeStats")
	if not sin_alta.is_empty():
		print("SteamLogros: %d ganados sin dar de alta en Steamworks" % sin_alta.size())
	return nuevos




func _marca(id: String) -> bool:
	var r: Variant = steam.call("getAchievement", id)
	if not (r is Dictionary) or not bool((r as Dictionary).get("ret", false)):
		if not sin_alta.has(id):
			sin_alta.append(id)
		return false
	if bool((r as Dictionary).get("achieved", false)):
		return false
	return bool(steam.call("setAchievement", id))


func _on_unlocked(id: String) -> void:
	if steam != null and _marca(id):
		steam.call("storeStats")
