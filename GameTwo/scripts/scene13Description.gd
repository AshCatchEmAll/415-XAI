extends RichTextLabel

var lapsed = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	lapsed += delta
	visible_characters = lapsed/0.05
