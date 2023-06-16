extends Node2D


var backgroundMusic: AudioStreamPlayer2D
var musicPosition: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
#	DisplayServer.window_set_size(Vector2i(3520,1958))
	backgroundMusic = get_node("/root/BgMusic")
	await delay(3)
	get_tree().change_scene_to_file("res://GameOne/scenes/scene2.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()


func _on_texture_button_toggled(bgm_button):
	if backgroundMusic.playing:
		musicPosition = backgroundMusic.get_playback_position();
		backgroundMusic.stop()
		print("the music:", musicPosition)
	else:
		backgroundMusic.play(musicPosition)
	
	pass
