extends Node2D

@onready var question1 = $question_text1
@onready var question2 = $question_text2
@onready var question3 = $question_text3
@onready var question4 = $question_text4

# Called when the node enters the scene tree for the first time.
func _ready():
	$shovelAnimation.play("ShellAnimation")
	question1.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_help_button_pressed():
	pass # Replace with function body.


func _on_barnacle_1_pressed():
	question1.visible = true
	question2.visible = false
	question3.visible = false
	question4.visible = false
	pass # Replace with function body.


func _on_barnacle_2_pressed():
	question1.visible = false
	question2.visible = true
	question3.visible = false
	question4.visible = false
	pass # Replace with function body.


func _on_barnacle_3_pressed():
	question1.visible = false
	question2.visible = false
	question3.visible = true
	question4.visible = false
	pass # Replace with function body.


func _on_barnacle_4_pressed():
	question1.visible = false
	question2.visible = false
	question3.visible = false
	question4.visible = true
	pass # Replace with function body.
