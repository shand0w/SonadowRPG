extends Area2D
export var house_name:String = ''
var pos = self.get_position_in_parent()
export var house_interior:PackedScene
func _on_Area2D_body_entered(body):
	pos = self.get_position_in_parent()
	Globals.last_world_position = $start_position.position
	if body.name == 'Shadow' or body.name == 'Sonic':
		Globals.coming_from_house = house_name
		body.connect('house_dialog_accept', self, 'on_house_dialog_event')
		body.show_enter_house_dialog()
		body.save_last_world_position()
		get_tree().paused = true

func _on_Area2D_body_exited(body):
	pass

func on_house_dialog_event(accepted:bool):
	if accepted:
		get_tree().change_scene(str(house_interior.resource_path))
	else:
		pass


func _on_FullHouse_body_exited(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		$House.self_modulate = Color(1, 1, 1, 1)

func _on_FullHouse_body_entered(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		$House.self_modulate = Color(1, 1, 1, Globals.object_transparency)
