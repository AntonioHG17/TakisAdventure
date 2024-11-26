extends Control

@onready var boton_iniciar: Button = $contenedorBotones/botonIniciar
@onready var boton_continuar: Button = $contenedorBotones/botonContinuar
@onready var boton_creditos: Button = $contenedorBotones/botonCreditos
@onready var boton_salir: Button = $contenedorBotones/botonSalir
@onready var select: AudioStreamPlayer = $contenedorBotones/select

# Lista de botones para navegar
@onready var botones: Array = [boton_continuar, boton_iniciar, boton_creditos, boton_salir]
var boton_actual: int = 0  # Índice del botón actualmente seleccionado

# Código Konami
var codigo_konami: Array = ["ui_up", "ui_up", "ui_down", "ui_down", "ui_left", "ui_right", "ui_left", "ui_right", "B","A"]
var entrada_usuario: Array = []

func _ready() -> void:
	# Enfocar el primer botón al inicio
	boton_iniciar.grab_focus()

func iniciar_juego():
	get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")

func cerrar_juego():
	get_tree().quit()

func mover_en_menu(direccion: int) -> void:
	# Cambiar al siguiente botón según la dirección
	boton_actual += direccion

	# Asegurarse de que el índice esté dentro de los límites
	if boton_actual < 0:
		boton_actual = botones.size() - 1
	elif boton_actual >= botones.size():
		boton_actual = 0

	# Enfocar el nuevo botón
	botones[boton_actual].grab_focus()

	# Reproducir el efecto de sonido
	if not select.is_playing():
		select.play()

# Ejecutar la acción del botón actualmente seleccionado
func activar_boton_seleccionado() -> void:
	botones[boton_actual].emit_signal("pressed")

func palEasterEgg():
	for action in codigo_konami:
		if Input.is_action_just_pressed(action):
			entrada_usuario.append(action)

			# Mantener solo las últimas entradas del mismo tamaño que el código Konami
			if entrada_usuario.size() > codigo_konami.size():
				entrada_usuario.pop_front()

			# Verificar si el código Konami fue ingresado
			if entrada_usuario == codigo_konami:
				print("¡Código Konami activado!")
				activar_easter_egg()
				entrada_usuario.clear()
			break

func activar_easter_egg():
	get_tree().change_scene_to_file("res://Assets/Escenas/Easter_egg.tscn")

func _process(_delta: float) -> void:
	palEasterEgg()

	# Solo permitir la navegación si GLOBAL.seleccion es verdadero
	if GLOBAL.seleccion == true:
		# Navegación hacia arriba
		if Input.is_action_just_pressed("ui_up"):
			mover_en_menu(-1)

		# Navegación hacia abajo
		if Input.is_action_just_pressed("ui_down"):
			mover_en_menu(1)
