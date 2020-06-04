extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var copyright = "[center]\n\nPowered by Sonadow Engine\nSonadow RPG - Copyright 2020 - " + str(OS.get_date().year) + " - Sonadow DEV\nSonadow Engine - Copyright 2020 - " + str(OS.get_date().year) + " - Sonadow DEV[/center]"
var text
var file = File.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	file.open('res://AUTHORS.txt', File.READ)
	text = file.get_as_text()
	$RichTextLabel.bbcode_text = text
#	$RichTextLabel.set_text(text)
	$RichTextLabel.bbcode_text += copyright
