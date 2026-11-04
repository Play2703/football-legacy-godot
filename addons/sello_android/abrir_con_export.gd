@tool
extends EditorExportPlugin



















const ACTIVIDAD: String = "com.godot.game.AbrirCon"
const TIPOS_VER: PackedStringArray = [
	"application/vnd.footballlegacy.pack", "application/octet-stream",
	"application/zip", "application/x-zip-compressed", "application/json",
]
const TIPOS_COMPARTIR: PackedStringArray = [
	"application/vnd.footballlegacy.pack", "application/octet-stream",
]


func _get_name() -> String:
	return "AbrirConFootballLegacy"


func _supports_platform(platform: EditorExportPlatform) -> bool:
	return platform.get_os_name() == "Android"


func _get_android_manifest_application_element_contents(_platform: EditorExportPlatform,
		_debug: bool) -> String:
	return actividad()






static func actividad() -> String:
	var s: String =("\n\t\t<activity\n"
		+ "\t\t\tandroid:name=\"%s\"\n" % ACTIVIDAD
		+ "\t\t\tandroid:theme=\"@android:style/Theme.Translucent.NoTitleBar\"\n"
		+ "\t\t\tandroid:exported=\"true\"\n"
		+ "\t\t\tandroid:taskAffinity=\"\"\n"
		+ "\t\t\tandroid:excludeFromRecents=\"true\"\n"
		+ "\t\t\tandroid:noHistory=\"true\">\n")
	s += _filtro("android.intent.action.VIEW", TIPOS_VER)
	s += _filtro("android.intent.action.SEND", TIPOS_COMPARTIR)
	return s + "\t\t</activity>\n"


static func _filtro(accion: String, tipos: PackedStringArray) -> String:
	var s: String =("\t\t\t<intent-filter>\n"
		+ "\t\t\t\t<action android:name=\"%s\" />\n" % accion
		+ "\t\t\t\t<category android:name=\"android.intent.category.DEFAULT\" />\n")
	for t in tipos:
		s += "\t\t\t\t<data android:mimeType=\"%s\" />\n" % t
	return s + "\t\t\t</intent-filter>\n"
