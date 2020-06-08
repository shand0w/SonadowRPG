extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func after_selecting_player():
	BackgroundLoad.load_scene(str(Globals.world))

func _on_Shadow_pressed():
	Globals.character_path = "res://Scenes/Characters/Shadow.tscn"
	Globals.selected_character = preload("res://Scenes/Characters/Shadow.tscn").instance()
	after_selecting_player()

func _on_Sonic_pressed():
	Globals.character_path = "res://Scenes/Characters/Sonic.tscn"
	Globals.selected_character = preload("res://Scenes/Characters/Sonic.tscn").instance()
	after_selecting_player()
