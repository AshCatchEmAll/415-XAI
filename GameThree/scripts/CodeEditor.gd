extends Control



@onready var animation_player = %AnimationPlayer 

var initial_code = """
#Declaring a list called l
l = [1,2,3,4]


"""



@export var question = "How to write code to find the maximum, minumum, and total values of this list?";
	



@export var comment_lines =[
	"Use inbuilt list function to find max value in the list",
	"Good work! Next task is to find min value in the list",
	"Awesome! Use another inbuilt list function to find sum of all values in the list"
]


@export var snackbar_success_text=[
	'Good ! Max is inbuilt function that gives max of list',
	'Good ! Min is inbuilt function that gives min of list',
	'Good ! Sum is inbuilt function that gives sum of list'
]

# Message to show when all code lines have succesfully been completed
@export var tasks_end_msg = "Good work ! There are many other in built functions in python that can be used on list. Don't be afraid to explore them"


var all_tasks_completed =false;


# Current Line that user is supposed to be solving
var code_line = 0


var current_caret_line = 0


var CodeResultComponent = load("res://GameThree/components/CodeResults.tscn")


var testFailCount = 0

var endpoint = ''
@onready var vbox = %Results/VBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	%TestCount.text = ""
	
	%EditorActions/SubmitBtn.disabled = true
	var codeParser  = get_node("CodeParser")
	codeParser.request_completed.connect(parser_request_completed)
	
	%EditorActions/TestBtn.connect("pressed",Callable(self,"on_test_btn_pressed"))
	%EditorActions/SubmitBtn.connect("pressed",Callable(self,"on_submit_btn_pressed"))





	
	
func _update_code_line():
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_indent_level(line):
	var indent = 0
	while indent < line.length() and line[indent] == ' ':
		indent += 1
	return indent / 2  # Returns the number of indents (assuming each indent is 4 spaces)

	
func _on_enter_pressed():
	
	current_caret_line = %CodeEditorField.get_caret_line()

	





func _on_code_editor_field_text_changed():
	%CodeEditorField.highlight()
	

		


func _on_code_editor_field_gui_input(event):
	pass
	if event is InputEventKey and event.is_pressed():
		if event.get_keycode() == KEY_ENTER:
			print("Executing")
			_on_enter_pressed()
	


func set_initial_code(ic:String):
	%EditorActions/SubmitBtn.visible = true
	%EditorActions/SubmitBtn.disabled = true
	%EditorActions/SubmittedBtn.visible = false
	%Results.visible = false
	%Instructions.visible = true
	%TestCount.visible = false
	clear_vbox_children()
	%CodeEditorField.text = ic
	%CodeEditorField.highlight()



	
func _on_instructions_btn_pressed():
	%TestCount.visible = false
	%Instructions.visible = true
	%Results.visible = false

	


func _on_result_btn_pressed():
	%TestCount.visible = true
	%Instructions.visible = false
	%Results.visible = true



func parser_request_completed(response):
	clear_vbox_children()
	testFailCount = 0
	print("Parser is going crazy")
	print(response)
		
	for i in range(len(response)):
		var node_instance = CodeResultComponent.instantiate()  # Create a new instance of your custom node.
	

		var funcName = ""
		if(response[i].has("function")):
			funcName = response[i]["function"]
		node_instance.setup(str(i+1),response[i]["passed"], str(response[i]["input"]),str(response[i]["expected"]), str(response[i]["output"]),funcName)
		
		if(response[i]["passed"]==false):
			testFailCount = testFailCount + 1
		
		
		vbox.add_child(node_instance)  
	
	var label = Label.new()
	label.set_size(Vector2(100, 200))

	label.modulate = Color(1, 1, 1, 0)
	vbox.add_child(label)
	%TestCount.visible = true
	if testFailCount!=0:
		%EditorActions/SubmitBtn.disabled = true
		%TestCount.add_theme_color_override("font_color",Color(235/255.0, 87/255.0, 87/255.0, 1))
		%TestCount.text = str(testFailCount) + " tests failed"
	else:
		%EditorActions/SubmitBtn.disabled = false
		%TestCount.add_theme_color_override("font_color",Color(67/255.0,181/255.0,147/255.0,1))
		%TestCount.text = "All tests passed"


func on_submit_btn_pressed():
	%EditorActions/SubmitBtn.visible = false
	%EditorActions/SubmittedBtn.visible = true
	
	
func on_test_btn_pressed():
	%Results.visible = true
	%Instructions.visible = false
	%CodeParser.run_code(%CodeEditorField.get_text(),endpoint)


func clear_vbox_children():
	for child in vbox.get_children():
		vbox.remove_child(child)
		child.queue_free()
