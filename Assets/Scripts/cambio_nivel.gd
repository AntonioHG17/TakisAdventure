extends Control
@onready var animated_sprite_2d: AnimatedSprite2D = $TextureRect/AnimatedSprite2D
@onready var conteo_nivel: Label = $TextureRect/ConteoNivel
@onready var conteo_muerte: Label = $TextureRect/ConteoMuerte
func _ready() -> void:
	animated_sprite_2d.play("Correr")
	conteo_nivel.text = str(GLOBAL.nivel)
	conteo_muerte.text = str(GLOBAL.death_count)

func cambioNivel():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Assets/Escenas/mapa"+str(GLOBAL.nivel)+".tscn")
	
func _process(_delta: float) -> void:
	cambioNivel()
	
