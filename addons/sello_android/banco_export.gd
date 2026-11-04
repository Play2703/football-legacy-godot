@tool
extends EditorExportPlugin

















const LOOPS: int = 3


func _get_name() -> String:
	return "BancoTestLab"


func _supports_platform(platform: EditorExportPlatform) -> bool:
	return platform.get_os_name() == "Android"


func _get_android_manifest_activity_element_contents(_platform: EditorExportPlatform,
		_debug: bool) -> String:
	return filtro_test_loop(_features_del_preset())


func _get_android_manifest_application_element_contents(_platform: EditorExportPlatform,
		_debug: bool) -> String:
	return meta_loops(_features_del_preset())


func _features_del_preset() -> String:
	var preset: EditorExportPreset = get_export_preset()
	return preset.get_custom_features() if preset != null else ""



static func es_banco(features: String) -> bool:
	for f in features.split(",", false):
		if f.strip_edges() == "banco":
			return true
	return false



static func filtro_test_loop(features: String) -> String:
	if not es_banco(features):
		return ""
	return ("\n\t\t\t<intent-filter>\n"
		+ "\t\t\t\t<action android:name=\"com.google.intent.action.TEST_LOOP\" />\n"
		+ "\t\t\t\t<category android:name=\"android.intent.category.DEFAULT\" />\n"
		+ "\t\t\t\t<data android:mimeType=\"application/javascript\" />\n"
		+ "\t\t\t</intent-filter>\n")



static func meta_loops(features: String) -> String:
	if not es_banco(features):
		return ""
	return "\n\t\t<meta-data android:name=\"com.google.test.loops\" android:value=\"%d\" />\n" % LOOPS
