extends AnimatedSprite2D

@onready var contenedor_botones: VBoxContainer = $"../contenedorBotones"

func _ready() -> void:
	# Crear el tween para mover el AnimatedSprite2D
	var tween_posicion = get_tree().create_tween()
	tween_posicion.tween_property(self, "position", Vector2(position.x, 350), 2.0)
	
	# Conectar el final del tween del AnimatedSprite2D a la función animar_menu
	tween_posicion.finished.connect(animar_menu)

func animar_menu():
	# Reproducir la animación "Running"
	self.play("Running")
	if self.animation_finished:
		# Crear el tween para mover los botones
		var tween_botones = get_tree().create_tween()
		tween_botones.tween_property(contenedor_botones, "position", Vector2(contenedor_botones.position.x, 450), 2.0)
		
		# Conectar el final del tween de botones a activar la variable global
		tween_botones.finished.connect(activar_seleccion)

func activar_seleccion():
	# Establecer la variable global cuando termine el tween
	GLOBAL.seleccion = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
