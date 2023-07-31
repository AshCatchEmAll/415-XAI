extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$tree4Animation.play("tree4_animation")
	$tree4Animation2.play("tree4_animation")
	$tree4Animation3.play("tree4_animation")
	$tree4Animation4.play("tree4_animation")
	$tree4Animation5.play("tree4_animation")
	$tree4Animation6.play("tree4_animation")
	$tree4Animation7.play("tree4_animation")
	$tree4Animation8.play("tree4_animation")
	$tree4Animation9.play("tree4_animation")
	$tree4Animation10.play("tree4_animation")
	$tree4Animation11.play("tree4_animation")
	$tree4Animation12.play("tree4_animation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	SceneTransition.change_scene_to_file("res://GameFive/scenes/scene28.tscn")
	pass # Replace with function body.
