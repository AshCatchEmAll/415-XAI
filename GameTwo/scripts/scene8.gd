extends Node2D


# Called when the node enters the scene tree for the first time.


func _on_btn_next_pressed():
	get_tree().change_scene_to_file("res://GameTwo/scenes/scene9.tscn")
