extends Node2D




func _on_yellow_button_pressed():
	var answer = load("res://assets/scene9/jellyfish_father_colored.png")
	var jellyfish_father = get_node("Jellyfish_father")
	jellyfish_father.texture = answer
	$"correct".play()
	


func _on_wrong_button_high_pressed():
	$"wrong".play()
	pass # Replace with function body.


func _on_wrong_button_low_pressed():
	$"wrong".play()
	pass # Replace with function body.
