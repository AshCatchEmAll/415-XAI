extends ColorRect


var loginActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func activate_login():
	%SwitchBtn.text = "Don't have an account? Register here."
	%LoginBtn.visible = true
	%RegisterBtn.visible = false
	%TitleLabel.text = "Welcome Back!"
	
func activate_register():
	%SwitchBtn.text = "Already have an account? Login here."
	%LoginBtn.visible = false
	%RegisterBtn.visible = true
	%TitleLabel.text = "Embark on a new journey"



func _on_switch_btn_pressed():
	loginActive = !loginActive 
	
	if loginActive:
		activate_login()
	else:
		activate_register()
	
	
	
func _on_login_btn_pressed():
	pass



