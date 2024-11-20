extends Control
@onready var animated_sprite_2d: AnimatedSprite2D = $TextureRect/AnimatedSprite2D
@onready var conteo_nivel: Label = $TextureRect/ConteoNivel
@onready var conteo_muerte: Label = $TextureRect/ConteoMuerte
@onready var dialogo_random: Label = $TextureRect/dialogoRandom
var random_number = randi() % 4 + 1
func _ready() -> void:
	conteo_nivel.text = str(GLOBAL.nivel)
	conteo_muerte.text = str(GLOBAL.death_count)
	
func randomizador():
	randomize()
	if random_number == 1:
		dialogo_random.text = "Los pinchos significan PELIGRO!!"
	if random_number == 2:
		if GLOBAL.death_count > 1:
			dialogo_random.text = "Creo que necesitas un par de manos"
		else:
			dialogo_random.text = "Ten cuidado donde pisas"
	if random_number == 3:
		if GLOBAL.death_count > 1:
			dialogo_random.text = "Conozco a alguien que podria hacerlo mejor"
		else:
			dialogo_random.text = "Que viva la virgen de guadalupe..."
	if random_number == 4:
		dialogo_random.text = "Los tacos no son aprueba de trampas"


func cambioNivel():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Assets/Escenas/mapa"+str(GLOBAL.nivel)+".tscn")
	
func _process(_delta: float) -> void:
	randomizador()
	cambioNivel()
	
	
