@tool
extends EditorPlugin














var _export: EditorExportPlugin
var _banco: EditorExportPlugin
var _abrir: EditorExportPlugin


func _enter_tree() -> void:
	_export = preload("sello_android_export.gd").new()
	add_export_plugin(_export)
	_banco = preload("banco_export.gd").new()
	add_export_plugin(_banco)
	_abrir = preload("abrir_con_export.gd").new()
	add_export_plugin(_abrir)


func _exit_tree() -> void:
	remove_export_plugin(_export)
	remove_export_plugin(_banco)
	remove_export_plugin(_abrir)
	_export = null
	_banco = null
	_abrir = null
