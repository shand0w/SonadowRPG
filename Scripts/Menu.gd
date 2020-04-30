extends Control
var tekst = "Hello World"
var world_scene
var website
var music_list:Array = [
	'res://Audio/BGM/014-Theme3.ogg',
#	'res://Audio/BGM/015-Theme4.ogg',
]

# Called when the node enters the scene tree for the first time.
func _ready():
	BackgroundLoad.play_start_transition = true
	get_tree().paused = false
#	$AnimationPlayer.play('end_transition')
	print('Game launched successfully!\n')

func _on_World1_pressed():
	BackgroundLoad.load_scene("res://Scenes/Maps/MainWorld.tscn")


func _on_Options_pressed():
	$Control.popup_centered()


func _on_Quit_pressed():
	get_tree().quit()


func _on_Website_pressed():
	website = OS.shell_open('https://www.sonadow-rpg.ml/')
