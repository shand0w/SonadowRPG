extends Control
var tekst = "Hello World"
var world_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	print('Game launched successfully!\n')
func _on_HelloWorldButton_pressed():
	#Metoda 1
	print('Metoda 1\nHello World')
	#Metoda 2
	print('Metoda 2\n' + tekst + '\n')


func _on_World1_pressed():
	world_scene = get_tree().change_scene("res://Scenes/Maps/MainWorld.tscn")


func _on_Options_pressed():
	$Control.popup_centered()


func _on_Quit_pressed():
	get_tree().quit()
