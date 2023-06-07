extends Node2D

@onready var purple_button = $purple_button
@onready var purple_jelly = $m_jelly_purple
@onready var no_color_jelly = $m_jelly_uncolored
@onready var back_button = $back_button

var showPurple = func():
	no_color_jelly.visible = false
	purple_jelly.visible = true


var go_back = func():
	get_tree().change_scene_to_file("res://GameTwo/scenes/scene10.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	purple_button.pressed.connect(showPurple)
	back_button.pressed.connect(go_back)
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if no_color_jelly.visible == false && purple_jelly.visible == true:
		get_tree().change_scene_to_file("res://GameTwo/scenes/scene12.tscn")
	pass
