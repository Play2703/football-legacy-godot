@tool
extends EditorPlugin






















var _export_plugin: PgsExportPlugin


func _enter_tree() -> void:
	_export_plugin = PgsExportPlugin.new()
	add_export_plugin(_export_plugin)


func _exit_tree() -> void:
	remove_export_plugin(_export_plugin)
	_export_plugin = null


class PgsExportPlugin extends EditorExportPlugin:
	const NOMBRE: String = "GodotPlayGameServices"

	const XML: String = "res://android/build/res/values/pgs_game_id.xml"

	func _get_name() -> String:
		return NOMBRE

	func _supports_platform(platform: EditorExportPlatform) -> bool:
		return platform is EditorExportPlatformAndroid



	static func game_id() -> String:
		var s: Script = load("res://autoload/pgs_ids.gd")
		if s == null:
			return ""
		return String(s.get_script_constant_map().get("GAME_ID", "")).strip_edges()

	func _export_begin(features: PackedStringArray, _is_debug: bool, _path: String, _flags: int) -> void:
		if not features.has("android"):
			return
		var id: String = game_id()
		if id.is_empty():


			if FileAccess.file_exists(XML):
				DirAccess.remove_absolute(ProjectSettings.globalize_path(XML))
			print("[PGS] sin Game ID en autoload/pgs_ids.gd: el .aab sale SIN Play Games.")
			return
		var f := FileAccess.open(XML, FileAccess.WRITE)
		if f == null:
			push_error("[PGS] no se pudo escribir %s" % XML)
			return
		f.store_string("<?xml version=\"1.0\" encoding=\"utf-8\"?><resources>"
			+ "<string translatable=\"false\" name=\"game_services_project_id\">%s</string>"
			% id + "</resources>")
		f.close()
		print("[PGS] Game ID %s en el manifiesto." % id)

	func _get_android_libraries(platform: EditorExportPlatform, debug: bool) -> PackedStringArray:
		if not _supports_platform(platform) or game_id().is_empty():
			return PackedStringArray()
		var tipo: String = "debug" if debug else "release"
		return PackedStringArray([NOMBRE + "/bin/%s/%s-%s.aar" % [tipo, NOMBRE, tipo]])

	func _get_android_dependencies(platform: EditorExportPlatform, _debug: bool) -> PackedStringArray:
		if not _supports_platform(platform) or game_id().is_empty():
			return PackedStringArray()
		return PackedStringArray([
			"com.google.code.gson:gson:2.11.0",
			"com.google.android.gms:play-services-games-v2:21.0.0",
		])

	func _get_android_manifest_application_element_contents(platform: EditorExportPlatform, _debug: bool) -> String:
		if not _supports_platform(platform) or game_id().is_empty():
			return ""
		return "<meta-data android:name=\"com.google.android.gms.games.APP_ID\"" \
				+ " android:value=\"@string/game_services_project_id\"/>"
