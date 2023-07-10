extends TextEdit



var comment_color := Color(0.4, 0.4, 0.6, 1) # Blue-grey
var print_color := Color("#166534")
var blue_color :=Color("#55A7F9")


var blue_keywords = ["def", "return","pass","del"]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _draw():
	highlight()
	
func highlight():
	
	_highlight_comment(text)
	_highlight_print_statement(text)
	_highlight_blue_keywords(text)

func _highlight_comment(code):
	var comment_pos = code.find("#")
	if comment_pos != -1:
		syntax_highlighter.add_color_region("#","",comment_color, true)


func _highlight_print_statement(code):
	syntax_highlighter.add_color_region('"','"',print_color, false)


func _highlight_blue_keywords(code):
	for keyword in blue_keywords:
		syntax_highlighter.add_keyword_color(keyword,blue_color)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass
		
func _notification(what):
	if what == NOTIFICATION_VISIBILITY_CHANGED:
		print("DOJD")
		highlight()
