extends Node2D


var attacked_monster = preload("res://assets/sweet_fruit_forest/monster_attacked.png")
var shield = preload("res://assets/sweet_fruit_forest/protective_shield.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	%AnimationPlayer.play("time")
	setup_editor_one()
	scene_one_setup()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func scene_one_setup():
	%Instruction.text = "The following two floating point are respectively the height and weight of the sour fruit monster. How to write the corresponding decimal form according to the exponential form of these two floating point?"
	%Time_Label.text = "Pay attention to the time! You're almost getting the acid barrier magic!​"
	%Example_Label.text = "Example of a floating point number is 0.9293423127"

func scene_two_setup():
	%Instruction.text = "There are too many floating point decimals just converted. How to write code to round the height and weight of the cranberry to three decimal places?"
	%Time_Label.text = "Pay attention to the time! You're almost getting the Shield magic!​"
	%Example_Label.text = "Rounding 4.123123 upto 3 decimal points would be 4.123"
	
func scene_three_setup():
	%Instruction.text = "Now that the height and weight of the sour fruit monster are known, complete the code to output the BMI value of the sour fruit monster and keep the result to two decimal places, so that the sour juice rebound can completely defeat the sour fruit monster"
	%Time_Label.text = "Come on. You're about to completely defeat it​"
	%Example_Label.text = "Formula for BMI is \n[weight / (height * height)]"
	
func setup_success_one():
	%SucessPanel/Label.text = "Good job! You have successfully obtained the Acid Barrier Magic! The health of the sour fruit monster has been reduced!​"
	%SucessPanel/success_image.texture = attacked_monster


func setup_success_two():
	%SucessPanel/Label.text = "Congratulations on obtaining the protective cover magic, which can completely block the corrosion of acid juice"
	%SucessPanel/success_image.texture = shield


func setup_editor_one():

	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use [color=green]python[/color] to convert from floating point exponential form to decimal form in a set amount of time, gaining sour juice blocking magic that slows the corrosive effects of the sour juice.


• [color=red]Do not[/color] change the function name or delete the functions
• [color=light_blue]Return[/color] decimal form of height and weight from both functions

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def decimal_form_weight(fh):
	#edit function body
	#return decimal of fh
	pass

def decimal_form_height(fw):
	#edit function body
	#return decimal of fw
	pass

""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "/fruit_forest/q1"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q1_submit"))



func setup_editor_two():
	
	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use [color=green]python[/color] to round height and weight to 3 decimal places.


• [color=red]Do not[/color] change the function name or delete the functions
• [color=light_blue]Return[/color] height and weight rounded up to three decimal places from both functions respectively

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def round_weight(dh):
	#edit function body
	#return rounded up to 3
	return dh

def round_height(dw):
	#edit function body
	#return rounded up to 3
	return dw

""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "/fruit_forest/q2"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q2_submit"))


func setup_editor_three():

	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use [color=green]python[/color] to find bmi using weight and height. Keep the result to two decimal places.


• [color=red]Do not[/color] change the function name or delete the functions
• [color=light_blue]Return[/color] bmi from the function (2 decimal places)

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def bmi(h, w):
	#edit function body
	#return bmi (2 decimal places)
	pass


""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "/fruit_forest/q3"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q3_submit"))


func q1_submit():
	print("q1 submit")
	%AnimationPlayer.pause()
	setup_success_one()
	
	%SucessPanel.visible = true
	await delay(4)
	setup_editor_two()
	scene_two_setup()
	%SucessPanel.visible = false
	%AnimationPlayer.stop()
	%AnimationPlayer.play("time")
	%CodeEditor/EditorActions/SubmitBtn.disconnect("pressed",Callable(self,"q1_submit"))

func q2_submit():
	print("q2 submit")
	%AnimationPlayer.pause()
	setup_success_two()
	
	%SucessPanel.visible = true
	await delay(4)
	setup_editor_three()
	scene_three_setup()
	%SucessPanel.visible = false
	%AnimationPlayer.stop()
	%AnimationPlayer.play("time")
	%CodeEditor/EditorActions/SubmitBtn.disconnect("pressed",Callable(self,"q2_submit"))
	


func q3_submit():
	%AnimationPlayer.pause()
	%SucessPanel.visible = false
	await delay(4)
	#Transition to next scene
	print("Done")
	return

func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()
