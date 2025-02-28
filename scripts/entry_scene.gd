extends Node2D

# Signal emitted when the animation finishes
signal animation_finished

# Reference to all mood sprites
@onready var mood_sprites = {
	"happy": $Happy,
	"ill": $Ill,
	"normal": $Normal,
	"poor": $Poor
}

# Play the entry animation for a specific mood
func play_animation(mood: String, animation_name: String):
	# Hide all sprites first
	for sprite in mood_sprites.values():
		sprite.visible = false
	# Show and play the selected mood's animation
	mood_sprites[mood].visible = true
	mood_sprites[mood].play(animation_name)
	# Connect the animation_finished signal
	mood_sprites[mood].connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_poor_animation_finished() -> void:
	emit_signal("animation_finished")
