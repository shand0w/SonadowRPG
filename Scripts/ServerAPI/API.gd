extends HTTPRequest

class Server extends HTTPRequest:
	const multiplayer_port = 80
	const normal_port = 80
	signal downloaded
	signal uploaded
	const server_adress = 'https://www.sonadow-dev.ml'
	const server_api_adress = "https://api-sonadowrpg.herokuapp.com/"

	func get_server_adress():
		return server_adress
#		var peer = NetworkedMultiplayerPeer.new()
#		var enet = NetworkedMultiplayerENet.new()
#		var wss = WebSocketServer.new()
#		var wsc = WebSocketClient.new()
#		var wsmp = WebSocketMultiplayerPeer.new()
#		var wsp = WebSocketPeer.new()
#		peer.get_packet_peer()
#		enet
#		enet.get_peer_address(1)
#		IP.
##		wsmp.get_connection_status()

	func get_server_ip_adress():
#		return IP.resolve_hostname(server_adress)
		pass

	func download_file_from_server(path_to_file:String, download_path_file:String):
		connect("request_completed", self, "on_file_downloaded")
		set_download_file(download_path_file)

		request(Server.server_adress + '/'+ str(path_to_file))
	func on_file_downloaded(result, response_code, headers, body):
		emit_signal("downloaded", result, response_code, headers, body)

	func upload_file_to_server(path_to_file_on_disk:String, patch_to_file_on_server:String):
		connect("request_completed", self, "on_file_uploaded")
		###### SOME CODE HERE - TO DO!#############

	func on_file_uploaded(result, response_code, headers, body):
		emit_signal("uploaded", result, response_code, headers, body)


#class ServerUpdateDownloader extends HTTPRequest:
#	signal downloaded
#	func download_update():
#		connect("request_completed", self, "_on_request_completed")
#		set_download_file("user://assets.pck")
#		request("https://www.sonadow-dev.ml/game_data/srpg/assets.pck")
#
#	func _on_request_completed(result, response_code, headers, body):
#		emit_signal("downloaded", result, response_code, headers, body)

class ServerMultiplayerLobby extends NetworkedMultiplayerENet:
	var adress = Server.new().get_server_ip_adress()

	func create_game_server():
		create_server(Server.multiplayer_port)

	func create_game_client():
		create_client(adress, Server.multiplayer_port)

class ServerAuth extends Server:
	func login_player(login:String, password:String, password_confirmation:String):
		var logged_in_successfull
		var http = HTTPClient.new()
		var err = http.connect_to_host(server_api_adress, normal_port)
		assert(err == OK)
		while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
			http.poll()
			print("Connecting..")
			OS.delay_msec(500)
			
		assert(http.get_status() == HTTPClient.STATUS_CONNECTED)
			
#			var body = http.query_string_from_dict({
#				'user': {
#					'handle': login, 
#					'password': password, 
#					'password_confirmation': password_confirmation
#				}
#			})
		var body = str("user[handle]=", login, "&user[password]=", password, "&user[password_confirmation]=", password_confirmation)
		
		http.request(
			HTTPClient.METHOD_POST, 
			'/users.json', 
			["Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(body.length())], 
			body
		)
		
#		current_index += 1
		return logged_in_successfull

	func register_player(login:String, password:String, password_confirmation:String):
		var logged_in_successfull
		var http = HTTPClient.new()
		var err = http.connect_to_host(server_api_adress, normal_port)
		assert(err == OK)

		while http.get_status() == HTTPClient.STATUS_CONNECTING or http.get_status() == HTTPClient.STATUS_RESOLVING:
			http.poll()
			print("Connecting..")
			OS.delay_msec(500)
			
		assert(http.get_status() == HTTPClient.STATUS_CONNECTED)
			
#			var body = http.query_string_from_dict({
#				'user': {
#					'handle': login, 
#					'password': password, 
#					'password_confirmation': password_confirmation
#				}
#			})
		var body = str("user[handle]=", login, "&user[password]=", password, "&user[password_confirmation]=", password_confirmation)
		
		http.request(
			HTTPClient.METHOD_POST, 
			'/users.json', 
			["Content-Type: application/x-www-form-urlencoded", "Content-Length: " + str(body.length())], 
			body
		)
		
#		current_index += 1
		return logged_in_successfull

#	func send_verif_code():
#		var accepted = true
#		return accepted
