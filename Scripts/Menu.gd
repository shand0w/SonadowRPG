extends Control
var tekst = "Hello World"
var world_scene
var website
var day = OS.get_date().day
var month = OS.get_date().month
onready var easteregg_imgs = [
	'res://Graphics/NewTheFox/1.png',
	'res://Graphics/NewTheFox/2.png',
	'res://Graphics/NewTheFox/3.png',
	'res://Graphics/NewTheFox/4.png',
	'res://Graphics/NewTheFox/5.png',
	'res://Graphics/NewTheFox/6.png',
	'res://Graphics/NewTheFox/7.png',
	'res://Graphics/NewTheFox/8.png',
	'res://Graphics/NewTheFox/9.png',
	'res://Graphics/NewTheFox/10.png',
	'res://Graphics/NewTheFox/11.png',
]
# Called when the node enters the scene tree for the first time.
func _ready():
	if day == 21 and month == 6:
		$IMG_0008.hide()
		load_easterregg_animation()
	elif day == 17 and month == 2:
		$IMG_0008.hide()
		load_easterregg_animation()
	elif day == 25 and month == 3:
		$IMG_0008.hide()
		load_easterregg_animation()
	BackgroundLoad.play_start_transition = true
	get_tree().paused = false
#	$AnimationPlayer.play('end_transition')
	print('Game launched successfully!\n')

func load_easterregg_animation():
	$IMG_0009.texture = load(str(easteregg_imgs[randi()%easteregg_imgs.size()]))
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


func _on_Options2_pressed():
	pass # Replace with function body.
