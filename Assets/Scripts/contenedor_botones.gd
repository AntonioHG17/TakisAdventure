extends VBoxContainer

@onready var button: Button = $botonContinuar
@onready var button_2: Button = $botonIniciar
@onready var button_3: Button = $botonCreditos
@onready var button_4: Button = $botonSalir

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.add_theme_color_override("font_color",Color(0.541,0.674,0.0588))
	button.add_theme_color_override("font_hover_color",Color(0.568,0.756,0.352))
	button.add_theme_color_override("font_pressed_color",Color(0.541,0.674,0.0588))
	button.add_theme_color_override("font_focus_color",Color(0.541,0.674,0.0588))
	
	button_2.add_theme_color_override("font_color",Color(0.541,0.674,0.0588))
	button_2.add_theme_color_override("font_hover_color",Color(0.568,0.756,0.352))
	button_2.add_theme_color_override("font_pressed_color",Color(0.541,0.674,0.0588))
	button_2.add_theme_color_override("font_focus_color",Color(0.541,0.674,0.0588))
	
	button_3.add_theme_color_override("font_color",Color(0.541,0.674,0.0588))
	button_3.add_theme_color_override("font_hover_color",Color(0.568,0.756,0.352))
	button_3.add_theme_color_override("font_pressed_color",Color(0.541,0.674,0.0588))
	button_3.add_theme_color_override("font_focus_color",Color(0.541,0.674,0.0588))
	
	button_4.add_theme_color_override("font_color",Color(0.541,0.674,0.0588))
	button_4.add_theme_color_override("font_hover_color",Color(0.568,0.756,0.352))
	button_4.add_theme_color_override("font_pressed_color",Color(0.541,0.674,0.0588))
	button_4.add_theme_color_override("font_focus_color",Color(0.541,0.674,0.0588))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
