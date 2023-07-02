extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("jellyFishAnimation")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	Click.play()
	var params = {
   
	"show_route_two": false,
	"show_route_one":false,
	"show_route_three": true
	}
	SceneTransition.change_to_map_scene( params)
	pass # Replace with function body.
