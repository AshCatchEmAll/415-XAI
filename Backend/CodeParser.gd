extends Node2D

# Don't forget to replace with your server url
var url = "https://41298-3000.2.codesphere.com/"

# The user's Python code, as a string
var python_code = "def find_max(lst):\n\treturn max(lst)"


signal request_completed(response)

func _ready():
	pass


func run_code(code,endpoint):
	var http_request = %HTTPRequest

	# Prepare the POST data, which includes the user's Python code
	var post_data = { "code": code }

	# Convert the dictionary to JSON
	var json_data = JSON.stringify(post_data)

	# Convert the JSON to a PoolByteArray, which is the format that HTTPRequest expects for the POST data
#	var raw_data = json_data.to_utf8()

	# Make the POST request
	http_request.request(url + endpoint, ["Content-Type: application/json"], HTTPClient.METHOD_POST, json_data)

	


func _on_http_request_request_completed(result, response_code, headers, body):
	
	print('Response code: ', response_code)
	if(response_code!=200):
		print('Request Failed')

	print('Request completed!')
	print('Result: ',result)
	print('Body: ',body.get_string_from_utf8())
	
	var json_str = body.get_string_from_utf8()
	var json_parser = JSON.new()
	print(JSON.parse_string(body.get_string_from_utf8()))
	request_completed.emit( JSON.parse_string(body.get_string_from_utf8()))
#	emit_signal("request_completed", body.get_string_from_utf8())
	# Print the response to the console
