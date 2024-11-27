extends Node


# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_action_pressed("stop"):
		get_tree().paused = not get_tree().paused
	elif event is InputEventJoypadButton and event.button_index == JOY_BUTTON_START and event.pressed:
		get_tree().paused = not get_tree().paused
