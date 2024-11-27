extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func juegoTerminado():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Assets/Escenas/menu_2.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	juegoTerminado()
