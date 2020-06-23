extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var regex = RegEx.new()
#var authors = null# regex.sub(',', '\n', true)
#var godot_copyrights_1 = str(Engine.get_copyright_info())
#var godot_copyrights = godot_copyrights_1.replace(',', '\n')
var authors_engine = "---GODOT ENGINE DEVELOPMENT TEAM---\n\n--PROJECT MANAGERS--\n" + str(Engine.get_author_info().project_managers) + '\n\n--LEAD DEVELOPERS--\n' + str(Engine.get_author_info().lead_developers) + '\n\n--FOUNDERS--\n' + str(Engine.get_author_info().founders) + '\n\n--DEVELOPERS--\n' + str(Engine.get_author_info().developers)
var copyright = "[center]\n\nPowered by Sonadow Engine\nSonadow RPG - Copyright 2020 - " + str(OS.get_date().year) + " - Sonadow DEV\nSonadow Engine - Copyright 2020 - " + str(OS.get_date().year) + " - Sonadow DEV[/center]"
var authors_no_bbcode_2 = authors_engine.replace(',', '\n')
var authors_no_bbcode_3 = authors_no_bbcode_2.replace('[', '')
var authors_no_bbcode = authors_no_bbcode_3.replace(']', '')

var authors = '[center]' + str(authors_no_bbcode) + '[/center]'
var text
var file = File.new()
# Called when the node enters the scene tree for the first time.
func _ready():
#	file.open('res://AUTHORS.txt', File.READ)
#	text = file.get_as_text()
#	$RichTextLabel.bbcode_text = text
#	$RichTextLabel.set_text(text)
#	regex.compile(authors_engine)
#	authors = str(regex.sub(',', '\n', true))
	$RichTextLabel.bbcode_text += authors
	$RichTextLabel.bbcode_text += copyright
#	$RichTextLabel.bbcode_text += godot_copyrights
