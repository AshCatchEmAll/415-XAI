extends Marker2D


# Rest dropzones had negative id
# Answer dropzones have positive id
# For example if rest drop zone is -1, corresponding drop zone id will be 1
@export var id = 1

var is_selected = false

# True when user is actively dragging an object
var is_seeking = false

var correctly_selected = false
func _draw():
	draw_circle(Vector2.ZERO, 10, Color.BLANCHED_ALMOND)
#	pass


	
func select():
#	for child in get_tree().get_nodes_in_group("dropzone"):
#		child.deselect()
	is_selected = true
	modulate = Color(1,1,1,0)


	

func deselect():
	is_selected = false
	modulate = Color.WHITE
#	pass

	

func set_seeking(val:bool):
	is_seeking = val
	


func _on_area_2d_mouse_entered():
	
#	if(is_seeking):
	var pale_green_transparent = Color.PALE_GREEN
	pale_green_transparent.a = 0.9
	modulate = pale_green_transparent
	


func _on_droparea_mouse_exited():
	modulate = Color.WHITE
	if(is_selected==true): 
		select()
	else:
		deselect()
