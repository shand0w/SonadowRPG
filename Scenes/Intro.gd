extends Control
var menu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().reload_current_scene()
	if str(OS.get_name()) == 'Android':
		var permissions = OS.request_permissions()
		if permissions:
			print("Permissions granted")


func _on_Timer_timeout():
	menu = get_tree().change_scene("res://Scenes/Menu.tscn")
