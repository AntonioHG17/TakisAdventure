extends Control
@onready var conteo_muerte: Label = $TextureRect/ConteoMuerte
@onready var conteo_nivel: Label = $TextureRect/ConteoNivel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	conteo_nivel.text = str(GLOBAL.nivel)
	conteo_muerte.text = str(GLOBAL.death_count)

func cambioNivel():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Assets/Escenas/nivel"+str(GLOBAL.nivel)+".tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	cambioNivel()
