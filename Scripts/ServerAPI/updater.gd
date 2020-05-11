extends Control
var server_version
var audio_load
var graphics_load
var scripts_load
var scenes_load
var serverapi_load
var silentwolfapi_load
var updater_load
var addons_load
var last_downloading
var new_last_downloading
var current_request_node
var current_ver = 1
var cfile = ConfigFile.new()
var file = File.new()

var data_files = {
	'scripts': 'scripts.pck',
	'audio': 'audio.pck',
	'scenes': 'scenes.pck',
	'graphics': 'graphics.pck',
	'serverapi': 'serverapi.pck',
	'silentwolfapi': 'silentwolfapi.pck',
	'updater': 'updater.pck',
	'addons': 'addons.pck',
}
func _ready():
#	if file.file_exists('user://updater.pck'):
	OS.request_permissions()
	if first_install():
		load_game_data()
	else:
		download_game_data()
func first_install():
	return file.file_exists('user://settings.cfg')

func _process(_delta):
	if not current_request_node == null:
		$Center/Label.text = str(current_request_node.get_downloaded_bytes()) + '/' + str(current_request_node.get_body_size())
	

func download_game_data():
	cfile.load('user://settings.cfg')
	cfile.set_value('Game', 'downloaded_scripts', true)
	cfile.set_value('Game', 'last_downloading', last_downloading)
	cfile.save('user://settings.cfg')
	last_downloading = data_files.scripts
	print('Downloading Game Data...\n')
	print('Downloading scripts...\n')
	$Center/Label.show()
	current_request_node = $Scripts
	$Scripts.set_download_file('user://' + str(data_files.scripts))
	$Scripts.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.scripts))

func _on_Scripts_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.scenes
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_scripts', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading scripts... SUCCESS!\n')
		print('Downloading scenes...\n')
		current_request_node = $Scenes
		$Scenes.set_download_file('user://' + str(data_files.scenes))
		$Scenes.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.scenes))
	else:
		print('Downloading scripts... ERROR!\n')
		$AskForRedownloading.popup_centered()
		

func _on_Scenes_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.audio
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_scenes', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading scenes... SUCCESS!\n')
		print('Downloading audio...\n')
		current_request_node = $Audio
		$Audio.set_download_file('user://' + str(data_files.audio))
		$Audio.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.audio))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading scenes... ERROR!\n')

func _on_Audio_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.graphics
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_audio', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading audio... SUCCESS!\n')
		print('Downloading graphics...\n')
		current_request_node = $Graphics
		$Graphics.set_download_file('user://' + str(data_files.graphics))
		$Graphics.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.graphics))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading audio... ERROR!\n')

func _on_Graphics_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.silentwolfapi
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_graphics', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading grahpics... SUCCESS!\n')
		print('Downloading SilentWolf API...\n')
		current_request_node = $SilentWolfAPI
		$SilentWolfAPI.set_download_file('user://' + str(data_files.silentwolfapi))
		$SilentWolfAPI.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.silentwolfapi))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading graphics... ERROR!\n')

func _on_SilentWolf_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.updater
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_silentwolfapi', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading SilentWolf API... SUCCESS!\n')
		print('Downloading Updater...\n')
		current_request_node = $Updater
		$Updater.set_download_file('user://' + str(data_files.updater))
		$Updater.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.updater))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading SilentWolf API... ERROR!\n')

func _on_Updater_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.serverapi
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_updater', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading Updater... SUCCESS!\n')
		print('Downloading ServerAPI...\n')
		current_request_node = $ServerAPI
		$ServerAPI.set_download_file('user://' + str(data_files.serverapi))
		$ServerAPI.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.serverapi))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading Updater... ERROR!\n')

func _on_ServerAPI_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = data_files.addons
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_serverapi', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.save('user://settings.cfg')
		print('Downloading ServerAPI... SUCCESS!\n')
		print('Downloading addons...\n')
		current_request_node = $Addons
		$Addons.set_download_file('user://' + str(data_files.addons))
		$Addons.request('https://www.sonadow-dev.ml/game_data/srpg/' + str(data_files.addons))
	else:
		$AskForRedownloading.popup_centered()
		print('Downloading ServerAPI... ERROR!\n')

func _on_Addons_request_completed(result, _response_code, _headers, _body):
	if result == 0:
		last_downloading = 'AllDownloaded'
		$Center/DOWNLOADING.set_text('DOWNLOADING...')
		cfile.load('user://settings.cfg')
		cfile.set_value('Game', 'downloaded_addons', true)
		cfile.set_value('Game', 'last_downloading', last_downloading)
		cfile.set_value('Game', 'first_install', true)
		cfile.save('user://settings.cfg')
		current_request_node = null
		print('Downloading Game Data... SUCCESS!\n')
		$AnimationPlayer.stop()
		$Center/DOWNLOADING.hide()
		$Center/Label.hide()
		load_game_data()
	else:
		$AskForRedownloading.popup_centered()


func load_game_data():
	if file.file_exists('user://scripts.pck'):
		scripts_load = ProjectSettings.load_resource_pack('user://' + str(data_files.scripts))
	else:
		error_loading_game_data()
	if file.file_exists('user://scenes.pck'):
		scenes_load = ProjectSettings.load_resource_pack('user://' + str(data_files.scenes))
	else:
		error_loading_game_data()
	if file.file_exists('user://audio.pck'):
		audio_load = ProjectSettings.load_resource_pack('user://' + str(data_files.audio))
	else:
		error_loading_game_data()
	if file.file_exists('user://graphics.pck'):
		graphics_load = ProjectSettings.load_resource_pack('user://' + str(data_files.graphics))
	else:
		error_loading_game_data()
	if file.file_exists('user://serverapi.pck'):
		serverapi_load = ProjectSettings.load_resource_pack('user://' + str(data_files.serverapi))
	else:
		error_loading_game_data()
	if file.file_exists('user://silentwolfapi.pck'):
		silentwolfapi_load = ProjectSettings.load_resource_pack('user://' + str(data_files.silentwolfapi))
	else:
		error_loading_game_data()
	if file.file_exists('user://addons.pck'):
		addons_load = ProjectSettings.load_resource_pack('user://' + str(data_files.addons))
	else:
		error_loading_game_data()
	if scripts_load == false:
		print('Error loading scripts!')
		error_loading_game_data()
	if audio_load == false:
		print('Error loading audio!')
		error_loading_game_data()
	if graphics_load == false:
		print('Error loading graphics!')
		error_loading_game_data()
	if scenes_load == false:
		print('Error loading scenes!')
		error_loading_game_data()
	if serverapi_load == false:
		print('Error loading ServerAPI!')
		error_loading_game_data()
	if silentwolfapi_load == false:
		print('Error loading SilentWolf API!')
		error_loading_game_data()
	if updater_load == false:
		print('Error loading Updater!')
		error_loading_game_data()
	if addons_load == false:
		print('Error loading Addons!')
		error_loading_game_data()
	else:
		get_tree().change_scene("res://Scenes/Intro.tscn")
		print('All resources loaded successfully!')

func error_loading_game_data():
	OS.alert('There has been error loading resources. Game will re-download them again.', 'Error Loading Resources')
	download_game_data()
