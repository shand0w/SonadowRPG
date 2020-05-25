extends Control

var assets_load
var assets_run_load
var error_download_load
var permissions
var dir = Directory.new()
var file = File.new()

func _ready():
	permissions = OS.request_permissions()
	if file.file_exists('user://assets.pck'):
		assets_run_load = ProjectSettings.load_resource_pack('user://assets.pck')
		if assets_run_load == false:
			error_loading_assets()
		else:
			get_tree().change_scene("res://Scenes/Intro.tscn")
	else:
		$RequiredAssets.set_download_file('user://assets.pck')
		$RequiredAssets.request('https://www.sonadow-dev.ml/game_data/srpg/assets.pck')
		

func _on_RequiredAssets_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		print('Assets Downloaded Successfully!')
		get_tree().reload_current_scene()
#		assets_load = ProjectSettings.load_resource_pack('user://assets.pck')
#		if assets_load == true:
#			print('Assets Loaded Successfully!')
#			get_tree().change_scene("res://Scenes/Intro.tscn")
#		else:
#			error_loading_assets()
	else:
		OS.alert('Error downloading assets!\n\nGame will launch on currently downloaded version')
		error_download_load = ProjectSettings.load_resource_pack('user://assets.pck')
		if error_download_load == false:
			error_loading_assets()
		else:
			get_tree().change_scene("res://Scenes/Intro.tscn")

func _process(delta):
	if not $RequiredAssets.get_body_size() == -1:
		$Center/Label.set_text(str($RequiredAssets.get_downloaded_bytes()) + '/' + str($RequiredAssets.get_body_size()))

func error_loading_assets():
	dir.open('user://')
	OS.alert('Error loading assets!\n\nGame will download them again if it is possible!')
	dir.remove('user://assets.pck')
	$RequiredAssets.set_download_file('user://assets.pck')
	$RequiredAssets.request('https://www.sonadow-dev.ml/game_data/srpg/assets.pck')
