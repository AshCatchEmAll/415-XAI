extends Panel

@export var message:String = "This is a snackbar message"
@export var success_color:Color = Color.GREEN
@export var failure_color:Color = Color.RED

@onready var label = $SnackbarLabel

var num_open_snackbars = 0
# Sets the snackbar message and color depending on success
func set_snackbar(success, msg):
	message = msg
	
	label.text = message
	if success:
		success_color.a = 0.2
		%SnackbarBorder.color = success_color
		
	else:
#		self.modulate = failure_color
		%SnackbarBorder.color = failure_color.a8


func set_text(text:String):
	label.text = text

func _on_close_toast_btn_pressed():
	self.hide()



func show_snackbar():
	num_open_snackbars = num_open_snackbars + 1
	self.show()
	await delay(4)
	num_open_snackbars = num_open_snackbars -1
	if(num_open_snackbars ==0):
		self.hide()
	
func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()
