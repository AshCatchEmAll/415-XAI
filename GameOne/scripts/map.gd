extends Node2D
@onready var animated_sprite = $WhaleAnimation


@export var show_route_one = false
@export var show_route_two = false
@export var show_route_three = false
@export var show_route_four = false


var backgroundMusic: AudioStreamPlayer2D
var musicPosition: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play()
	start_animations()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_one_btn_pressed():
	SceneTransition.change_scene_to_file("res://GameOne/scenes/Scene5.tscn")


func _on_game_two_btn_pressed():
	SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene8.tscn")
	pass # Replace with function body.


func _on_game_three_btn_pressed():
	if(show_route_three==false):return
	pass # Replace with function body.


func _on_game_four_btn_pressed():
	if(show_route_four==false):return
	pass # Replace with function body.


func start_animations():
	if(show_route_one==true):
		%AnimationPlayer.play("location_one")
	if(show_route_two==true):
		%AnimationPlayer.play("location_two")
	if(show_route_three==true):
		%AnimationPlayer.play("location_three")
	if(show_route_four==true):
		%AnimationPlayer.play("location_four")
