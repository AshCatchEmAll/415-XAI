extends "res://GameOne/scripts/TweenText.gd"




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func start_text_animation(audio_pitch:float):
	print("Called from super: ", audio_pitch)
	await delay(1)
	super(audio_pitch)


func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()
