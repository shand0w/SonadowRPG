tool
extends EditorPlugin
var dock = preload("res://addons/srpgmodcreator/srpgmodplugin.tscn").instance()

func _enter_tree():
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BL, dock)


func _exit_tree():
	remove_control_from_docks(dock)
	dock.free()
