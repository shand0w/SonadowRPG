extends Node

var _scn:PackedScene = preload("res://addons/screen_debugger/screen.scn")
var label:Label
func _ready():
	raise()
	var inst = _scn.instance()
	get_tree().root.call_deferred("add_child",inst)
	label = inst.get_node("Panel/Label")

func _process(delta):
	label.text = str(
		'\nselected_character: '+ str(Globals.selected_character),
		'\ncharacter_path: '+ str(Globals.character_path),
		'\ncharacter_position: '+ str(Globals.character_position),
		'\nis_coming_from_house: '+ str(Globals.coming_from_house),
		'\nlast_position_on_world: '+ str(Globals.last_world_position),
		'\nmod_path: '+ str(Globals.mod_path),
		'\nnext_world: '+ str(Globals.next_world),
		'\ndebugMode: '+ str(Globals.debugMode)
	)
