extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	## need to be verified
	var params = {
   
	"show_route_two": false,
	"show_route_one":false,
	"show_route_three":false,
	"show_route_four": true
	}
	SceneTransition.change_to_map_scene( params)
	pass # Replace with function body.
