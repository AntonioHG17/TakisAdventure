extends VideoStreamPlayer

@onready var video_god: VideoStreamPlayer = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	video_god.play()
	pass # Replace with function body.

func video_finalizado():
	get_tree().change_scene_to_file("res://Assets/Escenas/menu_2.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
