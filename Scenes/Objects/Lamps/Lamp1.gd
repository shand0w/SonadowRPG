extends Sprite

export var lamp_turned_on:bool = true
export var light_size:float = 1
export var light_energy:float = 1
export var shadow_enabled:bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Lamp_1/Light2D.enabled = lamp_turned_on
	$Lamp_1/Light2D.visible = lamp_turned_on
	$Lamp_1/Light2D.texture_scale = light_size
	$Lamp_1/Light2D.energy = light_energy
	$Lamp_1/Light2D.shadow_enabled = shadow_enabled


func _on_Area2D_body_entered(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		modulate = Color(1, 1, 1, Globals.object_transparency)


func _on_Area2D_body_exited(body):
	if body.name == 'Shadow' or body.name == 'Sonic':
		modulate = Color(1, 1, 1, 1)
