extends Node2D

@onready var ill= $ill
@onready var happy= $happy
@onready var normal= $normal
@onready var poor_condition= $"poor condition"


func happy_idle():
	happy._ready()

func ill_idle():
	ill._ready()
	
func normal_idle():
	normal._ready()

func poor_condition_idle():
	poor_condition._ready()
	
