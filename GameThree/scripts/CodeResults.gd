extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_test_description(str):
	%testDescription.text = str



func setup(number:String, success:bool, input:String,expectedOutput:String ,description:String, func_name=""):
	%testNumber.text = "Test " + number
	if success==true:
		%sucessStatus.visible = true
		
	else :
		%failedStatus.visible = true
	if func_name!="":
		%funcName.text = "for function " + func_name
		%funcName.visible = true
	%expected.text = expectedOutput
	%testInput.text = input
	%testDescription.text = description
