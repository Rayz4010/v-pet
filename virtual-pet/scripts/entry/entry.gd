extends CharacterBody2D

@onready var happy=$happy
@onready var ill=$ill
@onready var normal=$normal
@onready var poor_condition=$poor_condition

func happy_entry():
	happy._ready()
	
func ill_entry():
	ill._ready()
	
func normal_entry():
	normal._ready()
	
func poor_condition_entry():
	poor_condition._ready()
	
