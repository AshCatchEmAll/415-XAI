extends RichTextLabel

var lapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	lapsed += delta
	visible_characters = lapsed/0.05


func _on_bubble_button_pressed():
	await get_tree().create_timer(1.0).timeout
	SceneTransition.change_scene_to_file("res://GameThree/scenes/scene15.tscn")
	pass # Replace with function body.
