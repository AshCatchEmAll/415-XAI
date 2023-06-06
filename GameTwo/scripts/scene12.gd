extends Node2D

@onready var greenButton = $greenButton
@onready var orangeButton = $orangeButton
@onready var greenHalfJelly = $GreenHalfJellyFish
@onready var orangeHalfJelly = $OrangeHalfJellyFish
@onready var back_button = $backButton
@onready var helpDialogBox = $helpDialogBox
@onready var errorDialogBox = $errorDialogBox

# Called when the node enters the scene tree for the first time.
func _ready():
	$shellAnimation.play("ShellAnimation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_back_button_pressed():
	Click.play()
	SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene11.tscn")
	pass # Replace with function body.


func _on_green_button_pressed():
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		if greenHalfJelly.visible == false:
			Success.play()
			greenHalfJelly.visible = true
		else: 
			errorDialogBox.visible = true
		#print Error dialog
	pass # Replace with function body.


func _on_orange_button_pressed():
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		if greenHalfJelly.visible == true && orangeHalfJelly.visible == false:
			Success.play()
			orangeHalfJelly.visible = true
			await get_tree().create_timer(1.0).timeout
			Click.play()
			SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene13.tscn")
		else:
			errorDialogBox.visible = true
		#print Error dialog
	pass # Replace with function body.


func _on_red_button_pressed():
	# print Error dialog
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		Wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_pink_button_pressed():
	# print Error dialog
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		Wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_yellow_button_pressed():
	# print Error dialog
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		Wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_blue_button_pressed():
	# print Error dialog
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		Wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_purple_button_pressed():
	# print Error dialog
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		Wrong.play()
		errorDialogBox.visible = true
	pass # Replace with function body.


func _on_texture_button_pressed():
	# dialog box of Help
	if errorDialogBox.visible != true && helpDialogBox.visible != true:
		helpDialogBox.visible = true
	pass # Replace with function body.


func _on_help_dialog_button_pressed():
	helpDialogBox.visible = false
	pass # Replace with function body.



func _on_close_dialog_button_pressed():
	errorDialogBox.visible = false
	pass # Replace with function body.



func _on_color_button_pressed():
	$colorOptions.play("allColors")
	pass # Replace with function body.
