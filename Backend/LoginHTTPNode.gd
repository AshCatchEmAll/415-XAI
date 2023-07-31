extends HTTPRequest

var server_url = "https://nodejs-xai-server.onrender.com/auth/"





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _ready():
	%AuthScreen/LoginBtn.connect("pressed",Callable(self,"_on_login_btn_pressed"))
	%AuthScreen/RegisterBtn.connect("pressed",Callable(self,"_on_register_btn_pressed"))
	pass


func login(email, password):
	print("Ligin here")
	var url = server_url+"login/"
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({"email": email, "password": password})
	%HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, body)

func register(email, password):
	
	var url = server_url+"register/"
	var headers = ["Content-Type: application/json"]
	var body = JSON.stringify({"email": email, "password": password})
	%HTTPRequest.request(url, headers, HTTPClient.METHOD_POST, body)



func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if(response_code==200):
		print('Request completed!')
		print('Result: ',result)
		print('Body: ',json)
		Logger.current_token = json["token"]
		get_tree().change_scene_to_file("res://GameOne/scenes/scene1.tscn")
	else:
		%AuthScreen/%ResponseLabel.visible = true
		%AuthScreen/%ResponseLabel.text = "Something went wrong with authentication request"



func _on_login_btn_pressed():
	var e = %AuthScreen/Email.text
	var p = %AuthScreen/Password.text
	
	login(e,p)


func _on_register_btn_pressed():
	print("ishjad")
	var e = %AuthScreen/Email.text
	var p = %AuthScreen/Password.text
	register(e,p)
