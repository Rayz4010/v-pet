# idle_scene.gd
extends Node2D

# Reference to all mood sprites
@onready var mood_sprites = {
	"happy": $Happy,
	"ill": $Ill,
	"normal": $Normal,
	"poor": $Poor
}

# Play the idle animation for a specific mood
func play_animation(mood: String, animation_name: String):
	# Hide all sprites first
	for sprite in mood_sprites.values():
		sprite.visible = false
	# Show and play the selected mood's animation
	mood_sprites[mood].visible = true
	mood_sprites[mood].play(animation_name)
