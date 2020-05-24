extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir = Directory.new()
var file = File.new()
var configfile = ConfigFile.new()
var mod_folder
var mod_author
var mod_version
var mod_name
var mod_main_scene
func _ready():
	pass # Replace with function body.


func load_mod(path_to_file:String):
	mod_folder = str(path_to_file.get_basename())
	ProjectSettings.load_resource_pack(path_to_file)
	load_mod_information()
	load_main_mod_scene()

func load_mod_information():
	configfile.open('res://' + str(mod_folder) + 'modinfo.cfg')
	mod_author = str(configfile.get_value('info', 'author', 'unkonwn'))
	mod_name = str(configfile.get_value('info', 'name', 'unkonwn'))
	mod_version = str(configfile.get_value('info', 'version', 'unkonwn'))
	mod_main_scene = str(configfile.get_value('info', 'main_scene', ''))

func load_main_mod_scene():
	if not str(mod_main_scene) == '' or str(mod_main_scene) == null:
		get_tree().change_scene(str(mod_main_scene))
