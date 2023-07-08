extends Node2D

var selected =false
var rest_point
var rest_nodes = []

var current_drop_zone = null


@export var correct_drop_zone = 1

@export var success_msg = "Success msg"
@export var failed_msg = ["failed msg"]
var current_failed_msg = ""
#@onready var fade_out = %FadeOutAnimation
var correct_ans_count = 0

func _ready():
	

	
	rest_nodes = get_tree().get_nodes_in_group("dropzone")
	lerp_to_closest_dropzone()
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_input_event(viewport, event, shape_idx):
	
	if Input.is_action_just_pressed("click"):
		selected= true
		modulate = Color(1,1,1,0.5)
	
		
func _physics_process(delta):
	if selected:
		
		global_position = lerp(global_position, get_global_mouse_position() -Vector2(0.25,0.25), 25 * delta)
		
	else:
		if(rest_point!=null):
			global_position = lerp(global_position, rest_point , 10*delta)
#		lerp_to_closest_dropzone()

func _input(event):
	if event is InputEventMouseButton:
#		
		
		if event.button_index == 1 and not event.pressed:
			print("eventCLicked drad")
			selected = false
			modulate = Color(1,1,1,1)
			lerp_to_closest_dropzone()
	
					
func lerp_to_closest_dropzone():
	var shortest_dist = 10
	var correct_dropzone_selected = false
	var wrong_dropzone_id = 0
	var all_correctly_selected = false
	for child in rest_nodes:
				
				var distance = global_position.distance_to(child.global_position)
				
				if(distance<shortest_dist):
					wrong_dropzone_id = child.id
					if(correct_drop_zone==abs(child.id)):
						correct_dropzone_selected = true
						if(correct_drop_zone==child.id && current_drop_zone.id != correct_drop_zone):
							%success.play()
							child.correctly_selected = true
							
						if(current_drop_zone!=null):
							current_drop_zone.deselect()
						
						child.select()

						current_drop_zone = child
						rest_point = child.global_position
						shortest_dist = distance
#					else:
#						%fail.play()
	if(correct_drop_zone==1):
		print("correct_drop_zone",correct_drop_zone)
		print("correct_dropzone_selected",correct_dropzone_selected)
	if(correct_dropzone_selected==false):
		if(wrong_dropzone_id>0):
			load_random_failed_msg()
			%fail.play()
	if(all_correctly_selected()==true):
		print("ALl done")
		await get_tree().create_timer(1.0).timeout
		SceneTransition.change_scene_to_file("res://GameTwo/scenes/scene22.tscn")
		

func all_correctly_selected():
	for child in rest_nodes:
		if( (child.id > 0) and (child.correctly_selected==false)):
			return false
	return true

func _on_fade_out_animation_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://GameOne/scenes/Scene7.tscn")


func load_random_failed_msg():
	var random_index = randi() % failed_msg.size()
	var random_element = failed_msg[random_index]
	current_failed_msg = random_element
	

func delay(wait_time):
	var timer = Timer.new()
	timer.wait_time = wait_time
	timer.one_shot = true
	add_child(timer)
	timer.start()
	
	
	await timer.timeout
	
	timer.queue_free()
