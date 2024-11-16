extends Control
@onready var boton_iniciar: Button = $contenedorBotones/botonIniciar
@onready var boton_continuar: Button = $contenedorBotones/botonContinuar
@onready var boton_creditos: Button = $contenedorBotones/botonCreditos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	boton_iniciar.grab_focus()

func iniciar_juego():
	get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")
	

func cerrar_juego():
	get_tree().quit()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_boton_creditos_pressed() -> void:
	pass # Replace with function body.


func boton_creditoschidos() -> void:
	pass # Replace with function body.
