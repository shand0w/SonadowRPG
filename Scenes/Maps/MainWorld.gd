extends Node2D


# Declare member variables here. Examples:
# var a = 2
onready var root = $YSort
var character = Globals.selected_character
# Called when the node enters the scene tree for the first time.
func _ready():
	root.add_child(character)
	character.set_owner(root)
	$AnimationPlayer.play("end_transition")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Node2D_tree_exiting():
	root.remove_child(character)
