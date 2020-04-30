extends WindowDialog
var save_file = ConfigFile.new()
var file = File.new()
func _ready():
	load_settings()
	set_process(false)
func _process(_delta):
	save_file.set_value('Audio', 'master_bus_volume', str($Options/Audio/Master/Master_slider.value))
	save_file.set_value('Audio', 'master_bus_enabled', str($Options/Audio/Master/Master_on.pressed))
	save_file.set_value('Audio', 'music_bus_volume', str($Options/Audio/Music/Music_slider.value))
	save_file.set_value('Audio', 'music_bus_enabled', str($Options/Audio/Music/Music_on.pressed))
	save_file.set_value('Audio', 'sfx_bus_volume', str($Options/Audio/SFX/SFX_slider.value))
	save_file.set_value('Audio', 'sfx_bus_enabled', str($Options/Audio/SFX/SFX_on.pressed))
	save_file.set_value('Graphics', 'fullscreen', str($Options/Graphics/Fullscreen.pressed))
	save_file.set_value('Graphics', 'vsync_enabled', str($Options/Graphics/VSync.pressed))
	save_file.set_value('Graphics', 'vsync_via_compositor', str($Options/Graphics/VSync.pressed))
	save_file.save('user://settings.cfg')
	hide()
	set_process(false)
func load_settings():
	if file.file_exists('user://settings.cfg'):
		save_file.load('user://settings.cfg')
		$Options/Audio/Master/Master_slider.set_value(float(save_file.get_value('Audio', 'master_bus_volume')))
		$Options/Audio/Master/Master_on.set_pressed(bool(str(save_file.get_value('Audio', 'master_bus_enabled'))))
		$Options/Audio/Music/Music_slider.set_value(float(save_file.get_value('Audio', 'music_bus_volume')))
		$Options/Audio/Music/Music_on.set_pressed(bool(str(save_file.get_value('Audio', 'music_bus_enabled'))))
		$Options/Audio/SFX/SFX_slider.set_value(float(save_file.get_value('Audio', 'sfx_bus_volume')))
		$Options/Audio/SFX/SFX_on.set_pressed(bool(str(save_file.get_value('Audio', 'sfx_bus_enabled'))))
#		OS.window_fullscreen = bool(str(save_file.get_value('Graphics', 'fullscreen')))
#		$Options/Graphics/Fullscreen.pressed = bool(str(save_file.get_value('Graphics', 'fullscreen', false)))
		$Options/Graphics/VSync.pressed = bool(str(save_file.get_value('Graphics', 'vsync_enabled')))
	else:
		pass
func _on_Master_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_Master_on_toggled(button_pressed):
	AudioServer.set_bus_mute(0, !button_pressed)
	$Options/Audio/Master/Master_slider.editable = button_pressed
	$Options/Audio/Music/Music_on.set_pressed(button_pressed)
	$Options/Audio/Music/Music_on.set_disabled(!button_pressed)
	$Options/Audio/SFX/SFX_on.set_pressed(button_pressed)
	$Options/Audio/SFX/SFX_on.set_disabled(!button_pressed)

func _on_Music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value)
	AudioServer.set_bus_volume_db(3, value)

func _on_Music_on_toggled(button_pressed):
	AudioServer.set_bus_mute(1, !button_pressed)
	$Options/Audio/Music/Music_slider.editable = button_pressed


func _on_SFX_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value)


func _on_SFX_on_toggled(button_pressed):
	AudioServer.set_bus_mute(2, !button_pressed)
	$Options/Audio/SFX/SFX_slider.editable = button_pressed


func _on_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed


func _on_SAVE_pressed():
	set_process(true)


func _on_VSync_toggled(button_pressed):
	OS.vsync_enabled = button_pressed
	OS.vsync_via_compositor = button_pressed
