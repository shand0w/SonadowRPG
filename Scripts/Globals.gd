extends Node
signal debugModeSet
var debugMode = false
var coming_from_house = ''
var object_transparency = 0.65
var selected_character
var character_path
var world
var game_hour = 10 #seconds
var window_x_resolution = 1024
var window_y_resolution = 600
var character_position
var last_world_position = Vector2(0,0)
var cfile = ConfigFile.new()
var file =  File.new()
var timer = Timer.new()
var hour
var gc_mode
var mod_path = str(OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)) + '/Sonadow RPG/Mods/mod.pck'
func _ready():
	set_process(false)
	timer.wait_time = game_hour
	timer.connect("timeout", self, "on_timer_timeout")
#	if str(OS.get_name()) == 'Android':
#		debugMode = false
#	emit_signal("debugModeSet", debugMode)
	if file.file_exists(mod_path):
		Modloader.load_mod(mod_path)
func save_game():
	cfile.load('user://save.cfg')
	cfile.set_value('savedata', 'character', str(character_path))
	cfile.set_value('savedata', 'last_world_position_y', last_world_position.y)
	cfile.set_value('savedata', 'last_world_position_x', last_world_position.x)
	cfile.set_value('savedata', 'world', str(world))
	cfile.set_value('savedata', 'time', str(hour))
	cfile.save('user://save.cfg')
func set_day_night_mode(mode:String):
	gc_mode = mode
	if mode == 'realtime':
#		hour = OS.get_time().hour
		set_process(true)
	if mode == 'gametime':
		timer.start()

func _process(_delta):
	hour = OS.get_time().hour

func on_timer_timeout():
	hour += 1
func set_variable(variable, value):
	set(variable, value)

func apply_custom_resolution():
	OS.set_window_size(Vector2(window_x_resolution, window_y_resolution))
