extends Sprite
export var house_interior:PackedScene
func _on_Area2D_body_entered(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		body.connect('house_dialog_accept', self, 'on_house_dialog_event')
		$House.self_modulate = Color(1, 1, 1, Globals.object_transparency)
		body.show_enter_house_dialog()
		get_tree().paused = true

func _on_Area2D_body_exited(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		$House.self_modulate = Color(1, 1, 1, 1)

func on_house_dialog_event(accepted:bool):
	if accepted:
		get_tree().change_scene(str(house_interior.resource_path))
	else:
		pass
