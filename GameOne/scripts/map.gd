extends Node2D
@onready var animated_sprite = $WhaleAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
