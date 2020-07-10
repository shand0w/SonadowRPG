extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dlc_list = Globals.dlcs
var selected_item_index
var dlcfname = Globals.dlc_name_list
# Called when the node enters the scene tree for the first time.
func _ready():
	check_dlcs()


func check_dlcs():
	for dlc_name in dlc_list:
		$VBoxContainer/dlcs.add_item(dlc_name)



func _on_dlcs_item_selected(index):
	selected_item_index = index
	$VBoxContainer/HBoxContainer/RemoveDLC.disabled = false


func _on_dlcs_nothing_selected():
	selected_item_index = null
	$VBoxContainer/HBoxContainer/RemoveDLC.disabled = true


func _on_RemoveDLC_pressed():
	var item_name = $VBoxContainer/dlcs.get_item_text(selected_item_index)
	var dir = Directory.new()
	dir.open('user://dlcs/')
	var file_name = dlcfname.get(str(item_name))
	dir.remove(str(file_name) + '.pck')
	$VBoxContainer/dlcs.remove_item(selected_item_index)
	reload_dlcs()

func reload_dlcs():
	Globals.dlcs.clear()
	Globals.dlc_name_list.clear()
	Globals.worlds.clear()
	Globals.new_characters.clear()
	preload('res://Scripts/ServerAPI/dlc_loader.gd').new()._ready()
#	get_tree().reload_current_scene()
