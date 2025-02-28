# pet.gd
extends Node2D

# Mood enum (same as before)
enum Mood { HAPPY, ILL, NORMAL, POOR }

# Map moods to their entry/idle animations
var mood_animations = {
	Mood.HAPPY: {
		"entry": ["happy_entry_1", "happy_entry_2"],
		"idle": ["happy_idle_1", "happy_idle_2", "happy_idle_3"]
	},
	Mood.ILL: {
		"entry": ["ill_entry"],
		"idle": ["ill_idle_1", "ill_idle_2"]
	},
	Mood.NORMAL: {
		"entry": ["normal_entry_1", "normal_entry_2"],
		"idle": ["normal_idle_1", "normal_idle_2", "normal_idle_3"]
	},
	Mood.POOR: {
		"entry": ["poor_entry"],
		"idle": ["poor_idle_1", "poor_idle_2"]
	}
}

var current_mood: Mood = Mood.NORMAL
var current_entry_scene: Node
var current_idle_scene: Node

@onready var animation_container: Node2D = $AnimationContainer

func _ready():
	play_entry_animation()

# Play a random entry animation for the current mood
func play_entry_animation():
	# Load the entry scene
	var entry_scene = preload("res://scenes/entry_scene.tscn").instantiate()
	animation_container.add_child(entry_scene)
	current_entry_scene = entry_scene

	# Connect to the animation_finished signal
	entry_scene.connect("animation_finished", Callable(self, "_on_entry_animation_finished"))

	# Play a random entry animation
	var mood_key = Mood.keys()[current_mood].to_lower()
	var entry_animations = mood_animations[current_mood]["entry"]
	var random_entry = entry_animations[randi() % entry_animations.size()]
	entry_scene.play_animation(mood_key, random_entry)

# Transition to idle after entry animation finishes
func _on_entry_animation_finished():
	# Remove the entry scene
	current_entry_scene.queue_free()

	# Load and play the idle scene
	var idle_scene = preload("res://scenes/idle_scene.tscn").instantiate()
	animation_container.add_child(idle_scene)
	current_idle_scene = idle_scene

	# Play a random idle animation
	var mood_key = Mood.keys()[current_mood].to_lower()
	var idle_animations = mood_animations[current_mood]["idle"]
	var random_idle = idle_animations[randi() % idle_animations.size()]
	idle_scene.play_animation(mood_key, random_idle)

# Update the pet's mood (e.g., based on stats)
func update_mood(new_mood: Mood):
	current_mood = new_mood
	# Restart the animation sequence
	if current_idle_scene:
		current_idle_scene.queue_free()
	play_entry_animation()
