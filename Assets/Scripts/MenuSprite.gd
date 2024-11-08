extends AnimatedSprite2D

@onready var contenedor_botones: VBoxContainer = $"../contenedorBotones"

func _ready() -> void:
	# Crear el tween para mover el AnimatedSprite2D
	var tweenPosicion = get_tree().create_tween()
	tweenPosicion.tween_property(self, "position", Vector2(position.x, 350), 2.0)
	# Conectar el final del tween del AnimatedSprite2D a la función animarMenu
	tweenPosicion.finished.connect(animarMenu)

func animarMenu():
	# Reproducir la animación "Running"
	self.play("Running")
	if self.animation_finished:
		var tweenBotones = get_tree().create_tween()
		tweenBotones.tween_property(contenedor_botones, "position", Vector2(contenedor_botones.position.x, 450), 2.0)

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
