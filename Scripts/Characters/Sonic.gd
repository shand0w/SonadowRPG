extends KinematicBody2D
signal house_dialog_accept

# Called when the node enters the scene tree for the first time.
func _ready():
	if str(OS.get_name()) == "Android":
		$Camera2D.zoom = Vector2(0.5, 0.5)
	else:
		$Camera2D.zoom = Vector2(1, 1)

func _physics_process(_delta):
	if Input.is_action_pressed("ui_down"):
		position.y += 1
		$AnimationPlayer.play("down")
	if Input.is_action_pressed("ui_up"):
		position.y -= 1
		$AnimationPlayer.play("up")
	if Input.is_action_pressed("ui_right"):
		position.x += 1
		$AnimationPlayer.play("right")
	if Input.is_action_pressed("ui_left"):
		position.x -= 1
		$AnimationPlayer.play("left")
	if Input.is_action_just_released('ui_left'):
		$AnimationPlayer.stop()
		$Sprite.frame = 8
	if Input.is_action_just_released('ui_right'):
		$AnimationPlayer.stop()
		$Sprite.frame = 1
	if Input.is_action_just_released('ui_up'):
		$AnimationPlayer.stop()
		$Sprite.frame = 16
	if Input.is_action_just_released('ui_down'):
		$AnimationPlayer.stop()
		$Sprite.frame = 13

func show_enter_house_dialog():
	$CanvasLayer/HouseDialog.popup_centered()


func _on_HouseDialog_confirmed():
	get_tree().paused = false
	emit_signal("house_dialog_accept", true)


func _on_HouseDialog_popup_hide():
	get_tree().paused = false
	emit_signal("house_dialog_accept", false)
