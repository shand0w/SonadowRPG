extends Control
var tekst = "Hello World"
var world_scene
var website
# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundLoad.play_start_transition = true
	get_tree().paused = false
#	$AnimationPlayer.play('end_transition')
	print('Game launched successfully!\n')

func _on_World1_pressed():
	Globals.world = "res://Scenes/Maps/MainWorld.tscn"
	if Globals.selected_character == null:
		$CharacterSelect.popup_centered()
	else:
		BackgroundLoad.load_scene(str(Globals.next_world))


func _on_Options_pressed():
	$Control.popup_centered()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Website_pressed():
	website = OS.shell_open('https://www.sonadow-rpg.ml/')
