extends AnimatedSprite2D

var r= randf_range(1,2)

func _ready() -> void:
	if (r<1.5):
		play("poor condition 1")
	elif (r>1.5 and r<2):
		play ("poor condition 2")
		
		
