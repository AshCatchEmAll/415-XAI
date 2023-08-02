extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$tree1Animation.play("tree1_animation")
	$tree1Animation2.play("tree1_animation")
	$tree1Animation3.play("tree1_animation")
	$tree1Animation4.play("tree1_animation")
	$tree1Animation5.play("tree1_animation")
	$tree1Animation6.play("tree1_animation")
	$tree1Animation7.play("tree1_animation")
	$tree1Animation8.play("tree1_animation")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_bubble_map_pressed():
	SceneTransition.change_scene_to_file("res://GameSweetFruitForest/scenes/scene26.tscn")
	pass # Replace with function body.
