extends RichTextLabel




# Execute some Python code
var code = ""


var keywords = [
	"and", "as", "assert", "break", "class", "continue",
	"def", "del", "elif", "else", "except", "False", "finally",
	"for", "from", "global", "if", "import", "in", "is", "lambda",
	"None", "nonlocal", "not", "or", "pass", "raise", "return",
	"True", "try", "while", "with", "yield"
]
var color_keyword = Color(0, 0.65, 0.35)
var color_default = Color(1, 1, 1)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_text_changed():
	code = text
	


func _gui_input(event):
	if event is InputEventKey and event.is_pressed() and event.get_keycode() == KEY_ENTER:
		# Perform your desired action here
		var lines = code.split("\n")
		var current_line = lines.size() - 1
		var code_to_validate = lines[current_line]
		highlight_code(code_to_validate)
		print("Enter key pressed")




func verify_code(code: String):
	pass
	
func highlight_code(code: String):
	# Define the basic syntax elements and their corresponding text formatting
	var keywords = ["def", "return", "if", "else"]
	var operators = ["+", "-", "*", "/", "=", "=="]
	var punctuation = [",", ":", "(", ")", "\n"]
	var keyword_color = "#FF0000"
	var operator_color = "#00FF00"
	var punctuation_color = "#0000FF"

	# Split the code into individual lines
	var lines = code.split("\n")

	# Loop through each line of code
	for i in range(lines.size()):
		var line = lines[i]

		# Search for keywords and apply formatting
		for keyword in keywords:
			var pattern = "\\b" + keyword + "\\b"
			var regexp = RegEx.new()
			regexp.compile(pattern)
			var matches = regexp.search_all(line)

			for match in matches:
				line = line.insert(match.end(), "[/color]")
				line = line.insert(match.begin(), "[color=" + keyword_color + "]")

		# Search for operators and apply formatting
		for operator in operators:
			var pattern = "\\" + operator
			var regexp = RegEx.new()
			regexp.compile(pattern)
			var matches = regexp.search_all(line)

			for match in matches:
				line = line.insert(match.end(), "[/color]")
				line = line.insert(match.begin(), "[color=" + operator_color + "]")

		# Search for punctuation and apply formatting
		for punctuation_mark in punctuation:
			var pattern = "\\" + punctuation_mark
			var regexp = RegEx.new()
			regexp.compile(pattern)
			var matches = regexp.search_all(line)

			for match in matches:
				line = line.insert(match.end(), "[/color]")
				line = line.insert(match.begin(), "[color=" + punctuation_color + "]")

		# Add the formatted line to the RichTextLabel
		if i == 0:
			append_text("[code][color=" + punctuation_color + "]" + line + "[/color][/code]")
		else:
			append_text("[code][color=" + punctuation_color + "]" + line + "[/color][/code]")
