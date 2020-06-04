extends Node

var _scn:PackedScene = preload("res://addons/screen_debugger/screen.scn")
var label:Label
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
		'\ntarget FPS: ' + str(Engine.target_fps),
		'\nFPS: ' + str(Engine.get_frames_per_second()),
		'\n\nGlobals.gd variables',
		'\nselected_character: '+ str(Globals.selected_character),
		'\ncharacter_path: '+ str(Globals.character_path),
		'\ncharacter_position: '+ str(Globals.character_position),
		'\nis_coming_from_house: '+ str(Globals.coming_from_house),
		'\nlast_position_on_world: '+ str(Globals.last_world_position),
		'\nmod_path: '+ str(Globals.mod_path),
		'\nnext_world: '+ str(Globals.next_world),
		'\ndebugMode: '+ str(Globals.debugMode)
	)
