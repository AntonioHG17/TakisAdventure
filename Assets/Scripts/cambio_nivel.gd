extends Control
@onready var animated_sprite_2d: AnimatedSprite2D = $TextureRect/AnimatedSprite2D
@onready var conteo_nivel: Label = $TextureRect/ConteoNivel
@onready var conteo_muerte: Label = $TextureRect/ConteoMuerte
@onready var dialogo_random: Label = $TextureRect/dialogoRandom
var random_number = randi() % 18 + 1
func _ready() -> void:
	conteo_nivel.text = str(GLOBAL.nivel)
	conteo_muerte.text = str(GLOBAL.death_count)
	
func randomizador():
	randomize()
	if random_number == 1:
		dialogo_random.text = "Los pinchos significan PELIGRO!!"
	if random_number == 2:
		dialogo_random.text = "Ten cuidado donde pisas"
	if random_number == 3:
		dialogo_random.text = "Los tacos no son aprueba de trampas"
	if random_number == 4:
		dialogo_random.text = "¿Podrías intentar prender la pantalla?"
		
	if random_number == 5:
		dialogo_random.text = "Ya dejaste jugar a tu hermanito, ahora inténtalo tu"
	if random_number == 6:
		dialogo_random.text = "Has considerado buscar algo que se te de bien?"
	if random_number == 7:
		dialogo_random.text = "Necesitas una mano?, o tal vez dos?"
	if random_number == 8:
		dialogo_random.text = "Si tan solo los dueños ganarán dinero por cada fallo que cometes..."
		
	if random_number == 9:
		dialogo_random.text = "¿Crees que deberíamos implementar un modo asistencia?"
	if random_number == 10:
		dialogo_random.text = "La siguiente vez deberias intentarlo por lo menos"
	if random_number == 11:
		dialogo_random.text = "El encargado de audio puso más esmero que tu en este intento"
	if random_number == 12:
		
		dialogo_random.text = "Tranquilo, seguro fue un miss click"
	if random_number == 13:
		dialogo_random.text = "Tienes tanta habilidad como yo presupuesto"
	if random_number == 14:
		dialogo_random.text = "Las muertes no son necesarias para ningún logro"
		
	if random_number == 15:
		dialogo_random.text = "Menos mal que no agregamos límite de vidas"
	if random_number == 16:
		dialogo_random.text = "Debería existir algún tutorial para esto"
	if random_number == 17:
		dialogo_random.text = "Cuál es tu genero de videojuegos favorito?, plataformeros seguro que no"
	if random_number == 18:
		dialogo_random.text = "El primer paso es el más importante, pero no debes quedarte ahí"
func cambioNivel():
	await get_tree().create_timer(3.0).timeout
	get_tree().change_scene_to_file("res://Assets/Escenas/nivel"+str(GLOBAL.nivel)+".tscn")
	
func _process(_delta: float) -> void:
	randomizador()
	cambioNivel()
	
	
