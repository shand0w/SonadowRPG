extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_Master_on_toggled(button_pressed):
	AudioServer.set_bus_mute(0, button_pressed)
	$Options/Audio/Master/Master_slider.editable = button_pressed
	$Options/Audio/Music/Music_on.set_pressed(button_pressed)
	$Options/Audio/Music/Music_on.set_disabled(!button_pressed)
	$Options/Audio/SFX/SFX_on.set_pressed(button_pressed)
	$Options/Audio/SFX/SFX_on.set_disabled(!button_pressed)

func _on_Music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)


func _on_Music_on_toggled(button_pressed):
	AudioServer.set_bus_mute(1, button_pressed)
	$Options/Audio/Music/Music_slider.editable = button_pressed


func _on_SFX_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)


func _on_SFX_on_toggled(button_pressed):
	AudioServer.set_bus_mute(2, button_pressed)
	$Options/Audio/SFX/SFX_slider.editable = button_pressed


func _on_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
