tool
extends EditorPlugin
var dock

func _enter_tree():
	var dock = preload("res://addons/srpgmodcreator/srpgmodplugin.tscn").instance()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, dock)


func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()
