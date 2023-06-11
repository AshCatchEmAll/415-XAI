extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	DisplayServer.window_set_size(Vector2i(3520,1958))
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
