extends Node2D

@onready var purple_button = $purple_button
@onready var purple_jelly = $m_jelly_purple
@onready var no_color_jelly = $m_jelly_uncolored
@onready var back_button = $back_button
@onready var hint_box = $hint_box
@onready var hint_text = $hint_text
@onready var errorDialogBox = $errorDialogBox
var showPurple = func():
	no_color_jelly.visible = false
	purple_jelly.visible = true
	$correct_sound.play()


var go_back = func():
	SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene10.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	hint_box.visible = false
	hint_text.visible = false
	purple_button.pressed.connect(showPurple)
	back_button.pressed.connect(go_back)
	errorDialogBox.visible = false
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if no_color_jelly.visible == false && purple_jelly.visible == true:
		await get_tree().create_timer(1.0).timeout
		SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene12.tscn")
	pass


func _on_shell_button_pressed():
	hint_box.visible = true
	hint_text.visible = true
	pass # Replace with function body.


func _on_orange_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_red_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_green_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_pink_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_yellow_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_blue_button_pressed():
	if errorDialogBox.visible != true:
		$wrong_sound.play()
		errorDialogBox.visible = true
	pass # Replace with function body.
	
func _on_close_dialog_button_pressed():
	errorDialogBox.visible = false
	pass # Replace with function body.
