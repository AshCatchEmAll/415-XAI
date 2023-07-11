extends Node2D

@onready var question1 = $question_text1
@onready var question2 = $question_text2
@onready var question3 = $question_text3
@onready var question4 = $question_text4
@onready var q1solved = false
@onready var q2solved = false
@onready var q3solved = false
@onready var q4solved = false
# Called when the node enters the scene tree for the first time.



func _ready():
	$shovelAnimation.play("ShellAnimation")
	question1.visible = true
	setup_editor_one()

	
	

	

	
	
	
	

	
	
func setup_editor_one():
	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use slice notation in [color=green]python[/color] for tuple to reverse the given tuple


• [color=red]Do not[/color] change the function names or delete the functions
• [color=light_blue]Return[/color] reversed tuple from the function

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def reverse_tuple(tpl):
	pass


""")
	%CodeEditor/Instructions.text = instructions

	%CodeEditor.endpoint = "turtle_game/q2"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q1_submit"))

func setup_editor_two():
	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use an inbuilt function in [color=green]python[/color] for lists to find max , min and total (sum of all values) of the list.


• [color=red]Do not[/color] change the function name or delete the functions
• [color=light_blue]Return[/color] max value from [i]find_max[/i] , return min value from [i]find_min[/i] and return sum value from [i]find_total[/i]

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def find_max(lst):
	#edit function body
	#return max value
	return lst

def find_min(lst):
	pass


def find_total(lst):
	pass


""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "turtle_game/q1"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q2_submit"))


func setup_editor_three():
	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use an inbuilt function in [color=green]python[/color] for dictionaries to delete keys in 'k2' and 'k3' in the given dictionary d.

[code] 
	d = {
		k1 : "val1",
		k2 : "val2",
		k3 : "val3"
	}
[/code]


• [color=red]Do not[/color] change the function name or delete the functions 
• [color=light_blue]Return[/color] updated dictionary d from the delete_keys function

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def delete_keys(d):
	#keys to delete are k2 and k3
	pass

""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "turtle_game/q3"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q3_submit"))


func setup_editor_four():
	
	var instructions = """[b][color=orange]Instruction[/color][/b]

Use an inbuilt function in [color=green]python[/color] for sets to perform intersection operation.


For guidance here's one example of intersection operation : 
	
Given two sets 
[code] 
	a = {1, 2, 3, 4, 5}
	b =  {4, 5, 6, 7, 8}
[/code]

Intersection operation between a and b will be : 
[code] 
	{4, 5}
[/code]

• [color=red]Do not[/color] change the function name or delete the functions 
• [color=light_blue]Return[/color] the intersection output from [color=light_pink]intersect_sets[/color] function

If you setup everything properly , all tests will pass !"""


	%CodeEditor.set_initial_code("""
#Do not remove this function
def intersect_sets(setA,setB):
	pass

""")
	%CodeEditor/Instructions.text = instructions
	%CodeEditor.endpoint = "turtle_game/q4"
	%CodeEditor/EditorActions/SubmitBtn.connect("pressed",Callable(self,"q4_submit"))

func q1_submit():
	print("Yup in here")
	q1solved =true
	
func q2_submit():
	print("Yup in here")
	q2solved =true
	
func q3_submit():
	print("Yup in here")
	q3solved =true

func q4_submit():
	print("Yup in here")
	q4solved =true
	
	%NextBtn.visible = true
	%AnimationPlayer.play("btn_bounce")
	%AnimationPlayer.play_backwards("btn_bounce")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_help_button_pressed():
	pass # Replace with function body.


func _on_barnacle_1_pressed():

	if q1solved == true:
		pass
	else:
		
		question1.visible = true
		question2.visible = false
		question3.visible = false
		question4.visible = false
	pass # Replace with function body.


func _on_barnacle_2_pressed():
	if q2solved == true:
		return
	if q1solved == true:
		setup_editor_two()
		question1.visible = false
		question2.visible = true
		question3.visible = false
		question4.visible = false
	pass # Replace with function body.


func _on_barnacle_3_pressed():
	if q3solved == true:
		return
	if q2solved == true:
		setup_editor_three()
		question1.visible = false
		question2.visible = false
		question3.visible = true
		question4.visible = false
	pass # Replace with function body.


func _on_barnacle_4_pressed():
	if q4solved == true:
		return
	if q3solved == true:
		setup_editor_four()
		question1.visible = false
		question2.visible = false
		question3.visible = false
		question4.visible = true
	pass # Replace with function body.



func switch_editor(editor_number):
	
	#Scene 16 (tuple reverse)
	%CodeEditor1.set_visible(false)

	#Scene 15 (sum, max , min , list)
	%CodeEditor2.set_visible(false)
	
	#Scene 17
	
	
	#Scene 18
	
	
	match editor_number:
		1:
			%CodeEditor1.set_visible(true)
			%CodeEditor1.call_deferred("highlight")
			
		2:
			%CodeEditor2.set_visible(true)
			%CodeEditor2.call_deferred("highlight")
			


func _on_next_btn_pressed():
	if q4solved==true:
		get_tree().change_scene_to_file("res://GameThree/scenes/scene19.tscn")
