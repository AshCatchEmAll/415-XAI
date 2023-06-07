extends Node2D

@onready var red_button = $red_button
@onready var pink_button = $pink_button
@onready var red_jelly = $m_jelly_left
@onready var pink_jelly = $m_jelly_right
@onready var back_button = $back_button

var showRed = func():
	red_jelly.visible = false

var showPink = func():
	pink_jelly.visible = false

var go_back = func():
	get_tree().change_scene_to_file("res://GameTwo/scenes/Scene9.tscn")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	red_button.pressed.connect(showRed)
	pink_button.pressed.connect(showPink)
	back_button.pressed.connect(go_back)
	
	pass # Replace with function body.


		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pink_jelly.visible == false && red_jelly.visible == false:
		get_tree().change_scene_to_file("res://GameTwo/scenes/scene11.tscn")
	pass
