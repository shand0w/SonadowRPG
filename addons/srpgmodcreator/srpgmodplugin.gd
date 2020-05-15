extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir = Directory.new()
var cfile = ConfigFile.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func free():
	queue_free()

func _on_CreateMod_pressed():
	if not dir.dir_exists('res://' + str($"SonadowRPG Mod Creator/name".text)):
		dir.make_dir('res://' + str($"SonadowRPG Mod Creator/name".text))
	cfile.load('res://' + str($"SonadowRPG Mod Creator/name".text) + '/modinfo.cfg')
	cfile.set_value('info', 'name', $"SonadowRPG Mod Creator/name".text)
	cfile.set_value('info', 'version', $"SonadowRPG Mod Creator/version".text)
	cfile.set_value('info', 'author', $"SonadowRPG Mod Creator/author".text)
	cfile.set_value('info', 'main_scene', $"SonadowRPG Mod Creator/main_scene".text)
	cfile.save('res://' + str($"SonadowRPG Mod Creator/name".text) + '/modinfo.cfg')
