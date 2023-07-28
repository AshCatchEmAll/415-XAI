extends ColorRect

@onready var shell_picked_audio = %ShellPicked
# Called when the node enters the scene tree for the first time.
@onready var fade_in = %FadeInAnimation

var map_scene = preload("res://GameOne/scenes/map.tscn")
var help_label
var game_label

var gl_animation_started = false

var click_label_visible = true

var shell_collected = false

var bounce_animation_played = false

var fade_in_complete = false
func _ready():
	
	help_label = get_node("%help-label")
	game_label = get_node("%game-label")
	help_label.set_visible_ratio(0)
	
	game_label.set_visible_ratio(0)
	fade_in.play("fade_in")
	
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(fade_in_complete==false):
		return
	$shell1.show()
	if help_label.is_typing_animation_done()==true and gl_animation_started==false:
		
		gl_animation_started = true
		
		game_label.set_total_animation_time(0.00636)
		print(game_label.typing_animation_done)
		game_label.start_text_animation(0.5)
	
	if bounce_animation_played==false and click_label_visible == true and help_label.is_typing_animation_done()==true  and game_label.is_typing_animation_done()==true:
		bounce_animation_played = true
		$shell2.hide()
		print("pla")
		%ShellBounce.play("bounce")
	
	if shell_collected == true:
		click_label_visible = true
		get_node("%Click-To-Enter-Panel").visible = true
	


func _on_button_pressed():
	
	get_tree().change_scene_to_file("res://GameOne/scenes/DragDropScene.tscn")





func _on_shellbtn_pressed():
	%shellbtn.disabled = true
	shell_picked_audio.play()
	shell_collected = true
	%ShellFade.play("shell_fade")
	
	await get_tree().create_timer(1.0).timeout
	var params = {
	"show_route_two": true,
	"show_route_one":false
	}
	SceneTransition.change_to_map_scene( params)
	


func _on_shell_fade_animation_finished(anim_name):
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	on_fade_in_complete(anim_name)


func _on_fade_in_animation_animation_finished(anim_name):
	on_fade_in_complete(anim_name)


func on_fade_in_complete(anim_name):
	fade_in_complete = true
#	var custom_cursor = preload("res://assets/cursor.png")
#	Input.set_custom_mouse_cursor(custom_cursor, Input.CURSOR_ARROW, Vector2())
	
	
	help_label.set_total_animation_time(0.006)
	
	help_label.start_text_animation(0.8)


	
func _on_go_to_map_btn_pressed():
	pass
	


