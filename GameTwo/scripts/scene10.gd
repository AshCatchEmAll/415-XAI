extends Node2D

@onready var red_button = $red_button
@onready var pink_button = $pink_button
@onready var red_jelly = $m_jelly_left
@onready var pink_jelly = $m_jelly_right
@onready var back_button = $back_button
@onready var hint_box = $hint_box
@onready var hint_text = $hint_text
var showRed = func():
	red_jelly.visible = false
	$correct_sound.play()

var showPink = func():
	pink_jelly.visible = false
	$correct_sound.play()

var go_back = func():
	SceneTransition.get_tree().change_scene_to_file("res://GameTwo/scenes/Scene9.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	hint_box.visible = false
	hint_text.visible = false
	red_button.pressed.connect(showRed)
	pink_button.pressed.connect(showPink)
	back_button.pressed.connect(go_back)
	
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pink_jelly.visible == false && red_jelly.visible == false:
<<<<<<< HEAD
		await get_tree().create_timer(1.0).timeout
		SceneTransition.get_tree().change_scene_to_file("res://GameTwo/scenes/scene11.tscn")
=======
		get_tree().change_scene_to_file("res://GameTwo/scenes/scene11.tscn")
>>>>>>> 651252b06639e413e944aa65546e88c4488d329e
	pass


func _on_shell_button_pressed():
	hint_box.visible = true
	hint_text.visible = true
	pass # Replace with function body.


func _on_orange_button_pressed():
	$wrong_sound.play()
	pass # Replace with function body.



func _on_green_button_pressed():
	$wrong_sound.play()
	pass # Replace with function body.


func _on_yellow_button_pressed():
	$wrong_sound.play()
	pass # Replace with function body.


func _on_blue_button_pressed():
	$wrong_sound.play()
	pass # Replace with function body.


func _on_purple_button_pressed():
	$wrong_sound.play()
	pass # Replace with function body.
