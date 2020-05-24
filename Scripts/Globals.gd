extends Node
var coming_from_house:String
var object_transparency = 0.65
var selected_character
var character_path
var next_world
var character_position
var last_world_position = Vector2(0,0)
var cfile = ConfigFile.new()
var file =  File.new()
var mod_path = str(OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)) + 'Sonadow RPG/Mods/mod.pck'
func _ready():
	if file.file_exists(mod_path):
		Modloader.load_mod(mod_path)
func save_game():
	cfile.load('user://save.cfg')
	cfile.set_value('savedata', 'character', str(character_path))
	cfile.set_value('savedata', 'last_world_position_y', last_world_position.y)
	cfile.set_value('savedata', 'last_world_position_x', last_world_position.x)
	cfile.save('user://save.cfg')

func return_log_values():
	var log_call = {
		'Globals.object_transparency: ': str(object_transparency),
		'Globals.selected_character: ': str(selected_character),
		'Globals.character_path: ': str(character_path),
		'Globals.next_world: ': str(next_world),
		'Globals.character_position: ': str(character_position),
		'Globals.last_world_position: ': str(last_world_position),
		}
	return log_call
