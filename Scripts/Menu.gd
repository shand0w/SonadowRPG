extends Control
var tekst = "Hello World"
var world_scene
var website

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Game launched successfully!\n')

func _on_World1_pressed():
	BackgroundLoad.load_scene("res://Scenes/Maps/MainWorld.tscn")


func _on_Options_pressed():
	$Control.popup_centered()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Website_pressed():
	website = OS.shell_open('https://www.sonadow-rpg.ml/')
