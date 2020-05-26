extends HTTPRequest
class APIUpdateDownloader extends HTTPRequest:
	signal downloaded
	var download_update_path = 'user://'
	var download_filename = 'assets.pck'
	var download_server = 'https://www.sonadow-dev.ml'
	var download_server_file_path = '/game_data/srpg/'
	func download_update():
		$downloader.set_download_file(str(download_update_path) + str(download_filename))
		$downloader.request(str(download_server) + str(download_server_file_path) + str(download_filename))
	func _on_downloader_request_completed(result, response_code, headers, body):
		emit_signal("downloaded", result, response_code, headers, body)
