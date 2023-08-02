extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$tree2Animation.play("tree2_animation")
	$tree4Animation.play("tree4_animation")
	$tree5Animation.play("tree5_animation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	SceneTransition.change_scene_to_file("res://GameSweetFruitForest/scenes/scene27.tscn")
	pass # Replace with function body.


func _on_button_box_3_pressed():
	SceneTransition.change_scene_to_file("res://GameSweetFruitForest/scenes/scene15.tscn")
	pass # Replace with function body.
