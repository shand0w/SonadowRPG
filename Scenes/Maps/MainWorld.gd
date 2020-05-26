extends Node2D


# Declare member variables here. Examples:
# var a = 2
onready var root = $YSort
var character = Globals.selected_character
# Called when the node enters the scene tree for the first time.
func _ready():
	root.add_child(character)
	character.set_owner(root)
	if Globals.coming_from_house == '' or Globals.coming_from_house == null:
		character.set_position($start_position.position)
	else:
		var house_name = str(Globals.coming_from_house)
		var new_pos = get_node(str(house_name) + "_start_position").position
		character.set_position(new_pos)
#	else:
#		print(str(Globals.last_world_position))
#		character.set_position(Globals.last_world_position)
	$AnimationPlayer.play("end_transition")



func _on_Node2D_tree_exiting():
	character.save_last_world_position()
	root.remove_child(character)
