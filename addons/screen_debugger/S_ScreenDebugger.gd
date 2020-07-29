extends Node

var _scn:PackedScene = preload("res://addons/screen_debugger/screen.scn")
var label
func _ready():
	var inst = _scn.instance()
	get_tree().root.call_deferred("add_child",inst)
	label = inst.get_node("Control/Panel/Label")
	raise()
	

func _process(delta):
	label.text = str(
		'\n\nGame info',
		'\nCreator: Sonadow DEV',
		'\nName: Sonadow RPG',
		'\nEngine version: ' +str(Engine.get_version_info()),
		'\n\nEngine variables',
		'\nuser data dir' + str(OS.get_user_data_dir()),
		'\ntarget FPS: ' + str(Engine.target_fps),
		'\nFPS: ' + str(Engine.get_frames_per_second()),
		'\n\nGlobals.gd variables',
		'\nselected_character: '+ str(Globals.selected_character),
		'\ncharacter_path: '+ str(Globals.character_path),
		'\ncharacter_position: '+ str(Globals.character_position),
		'\nis_coming_from_house: '+ str(Globals.coming_from_house),
		'\nlast_position_on_world: '+ str(Globals.last_world_position),
		'\nmod_path: '+ str(Globals.mod_path),
		'\nworld: '+ str(Globals.world),
		'\ndebugMode: '+ str(Globals.debugMode),
		'\nwindow_x_resolution: '+ str(Globals.window_x_resolution),
		'\nwindow_y_resolution: '+ str(Globals.window_y_resolution)
	)
