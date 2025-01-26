extends AnimatedSprite2D

var r= randi_range(1,2)

func _ready() -> void:
	if (r==1):
		play("happy 1")
	elif (r==2):
		play("happy 2")
