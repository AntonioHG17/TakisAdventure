extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func iniciar_juego():
	get_tree().change_scene_to_file("res://Assets/Escenas/mapa1.tscn")
	

func cerrar_juego():
	get_tree().quit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_boton_creditos_pressed() -> void:
	pass # Replace with function body.


func boton_creditoschidos() -> void:
	pass # Replace with function body.
