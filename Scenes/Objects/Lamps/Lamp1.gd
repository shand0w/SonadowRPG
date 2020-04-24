extends Sprite

export var lamp_turned_on:bool = true
export var light_size:float = 1
export var light_energy:float = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Lamp_1/Light2D.enabled = lamp_turned_on
	$Lamp_1/Light2D.visible = lamp_turned_on
	$Lamp_1/Light2D.texture_scale = light_size
	$Lamp_1/Light2D.energy = light_energy


func _on_Area2D_body_entered(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		modulate = Color(1, 1, 1, 0.5)


func _on_Area2D_body_exited(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		modulate = Color(1, 1, 1, 1)
