extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node('AnimationPlayer').play("WhaleAndMap")
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_texture_button_pressed():
	
#	Click.play()
#
#	SceneTransition.change_scene_to_file("res://GameOne/scenes/map.tscn")
	pass
	


func _on_go_to_scene_four_btn_pressed():
	Click.play()

	SceneTransition.change_scene_to_file("res://GameOne/scenes/map.tscn")
