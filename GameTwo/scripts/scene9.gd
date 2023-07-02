extends Node2D

@onready var errorDialogBox = $errorDialogBox



func _on_yellow_button_pressed():
	var answer = load("res://assets/scene9/jellyfish_father_colored.png")
	var jellyfish_father = get_node("Jellyfish_father")
	jellyfish_father.texture = answer
	$correct.play()
	await get_tree().create_timer(1.0).timeout
	SceneTransition.change_scene_to_file("res://GameTwo/scenes/Scene10.tscn")
	


func _on_wrong_button_high_pressed():
	if errorDialogBox.visible != true:
		$wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_wrong_button_low_pressed():
	if errorDialogBox.visible != true:
		$wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_close_dialog_button_pressed():
	errorDialogBox.visible = false
	pass # Replace with function body.


func _on_shell_button_pressed():
	$hint_player.play("hintAnimation")
	pass # Replace with function body.
