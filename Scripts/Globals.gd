extends Node
var object_transparency = 0.65
var selected_character
var character_path
var next_world
var character_position
var updater_relaunched = false
var cfile = ConfigFile.new()
func save_game():
	cfile.load('user://save.cfg')
	cfile.set_value('savedata', 'character', str(character_path))
	cfile.save('user://save.cfg')
