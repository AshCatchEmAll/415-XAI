extends Label

var text_speed = 0.002

var typing_animation_done = false

var total_time:float = 1.0

var play_typing_sound = true
@onready var audio = %Scene5Keyboard

func start_text_animation(audio_pitch:float):
	
	self.set_visible_ratio(0)  # But make it invisible
	start_typing_text(audio_pitch)
#
func start_typing_text(audio_pitch:float):
	print("called")
	if play_typing_sound==true:
		audio.seek(0.6) 
		audio.pitch_scale =audio_pitch
		audio.play()
	var time_passed = 0.0
	while time_passed < total_time:
		
		self.set_visible_ratio(self.get_visible_ratio() + text_speed)
		time_passed+= text_speed * get_process_delta_time()
		await delay(text_speed)
	self.visible_ratio = 1.0  # Ensure that the text is fully visible
	if play_typing_sound==true:
		audio.stop()
	typing_animation_done = true

func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()

func is_typing_animation_done():
	return typing_animation_done


func set_total_animation_time(val:float):
	total_time = val
