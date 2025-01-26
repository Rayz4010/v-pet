extends AnimatedSprite2D

var r= randi_range(1,3)
func _ready() -> void:
	if (r==1):
		play ("happy_1")
	elif (r==2):
		play("happy 2")
	else:
		play("happy 3")
