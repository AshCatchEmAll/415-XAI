extends AnimatedSprite2D

var speed=5
func _process(delta):
	rotation = clamp(rotation, -0.2, 0.2)
	rotation+=speed*delta
