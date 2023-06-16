extends AudioStreamPlayer2D

var backgroundMusic: AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready():
	backgroundMusic = AudioStreamPlayer2D.new()
	add_child(backgroundMusic)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
