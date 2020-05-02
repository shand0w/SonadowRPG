extends Control
onready var httprequest = $HTTPRequest
func ready():
	update_check()

func update_check():
#	httprequest.set_download_file('user://index.js')
	httprequest.request("https://www.sonadow-dev.ml/api/", ["user-agent: Mozilla/5.0", "GameName : sonadowrpg"])


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	print(str(result))
	print(str(response_code))
	print(str(headers))
	print(str(body))
