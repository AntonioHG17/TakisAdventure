extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func boton_creditoschidos():
	get_tree().change_scene_to_file("res://Assets/Escenas/takii_referencia.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
