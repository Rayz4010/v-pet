extends AnimatedSprite2D
var r= randf_range(0,1)
func _ready() -> void:
	if (r<0.9):
		play("ill 1")
	else:
		play("ill 2")
		
		
