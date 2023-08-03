extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$tree1Animation.play("tree1_animation")
	$tree2Animation.play("tree2_animation")
	$tree3Animation.play("tree3_animation")
	$tree4Animation.play("tree4_animation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	SceneTransition.change_scene_to_file("res://GameSweetFruitForest/scenes/scene3.tscn")
	pass # Replace with function body.
