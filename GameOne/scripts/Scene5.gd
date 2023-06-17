extends ColorRect


# Called when the node enters the scene tree for the first time.
@onready var fade_in = %FadeInAnimation
var help_label
var game_label

var gl_animation_started = false

var click_label_visible = true

var shell_collected = false

var bounce_animation_played = false

var fade_in_complete = false
func _ready():
#	DisplayServer.window_set_size(Vector2i(3520,1958))
	help_label = get_node("%help-label")
	game_label = get_node("%game-label")
	help_label.set_visible_ratio(0)
	
	game_label.set_visible_ratio(0)
	fade_in.play("fade_in")
	
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(fade_in_complete==false):
		return

	if help_label.is_typing_animation_done()==true and gl_animation_started==false:
		
		gl_animation_started = true
		
		game_label.set_total_animation_time(0.00636)
		print(game_label.typing_animation_done)
		game_label.start_text_animation(0.8)
	
	if gl_animation_started == true && game_label.is_typing_animation_done()==true:
		click_label_visible = false
		get_node("%Click-To-Enter-Panel").visible = false
	



func _on_button_pressed():
	
	SceneTransition.change_scene_to_file("res://GameOne/scenes/DragDropScene.tscn")






	


func _on_shell_fade_animation_finished(anim_name):
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	on_fade_in_complete(anim_name)


func _on_fade_in_animation_animation_finished(anim_name):
	on_fade_in_complete(anim_name)


func on_fade_in_complete(anim_name):
	fade_in_complete = true
#	var custom_cursor = preload("res://assets/cursor.png")
#	Input.set_custom_mouse_cursor(custom_cursor, Input.CURSOR_ARROW, Vector2(50,50))
	
	
	help_label.set_total_animation_time(0.0059)
	
	help_label.start_text_animation(0.8)
