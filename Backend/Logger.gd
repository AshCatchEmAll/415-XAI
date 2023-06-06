extends Node2D


@export var url = "http://localhost:3000/"
@export var request_headers = {"Content-Type": "application/json"}
@export var request_data = {}

@onready var http_request = %EventLogger



func _ready():
	pass


func send_request(method='GET'):
	var headers = []
	for key in request_headers.keys():
		headers.append("%s: %s" % [key, request_headers[key]])
	
	var data = null
	if method != 'GET':
		data = request_data.to_json()

	http_request.request(url, headers, method, data)

	

func log_score_event(body):
	var headers = []
	for key in request_headers.keys():
		headers.append("%s: %s" % [key, request_headers[key]])
	
	var data = null
	
	data = JSON.stringify(body)
	print("DataL ", data)
	http_request.request(url + "logger/scoreEvent", headers, HTTPClient.METHOD_POST, data)


func _on_event_logger_request_completed(result, response_code, headers, body):
	
	print('Response code: ', response_code)
	if(response_code!=200):
		print('Request Failed')

	print('Request completed!')
	print('Result: ',result)
	print('Body: ',body.get_string_from_utf8())

