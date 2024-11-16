extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var speed: float
@export var jump_speed: float
var saludo_reproducido = false
var bloquea_movimiento = true 
var can_jump: bool = false
var pegado_a_pared: bool = false
var rayCastDimension = 12
var rayCastDimensionV = 22
var ignore_horizontal_animation = false
@export var dash_speed: float = 700
@export var dash_duration: float = 0.2
@export var dash_cooldown: float = 0.5
var can_dash: bool = true
var is_dashing: bool = false
var dash_timer: float = 0.0
var dash_cooldown_timer: float = 0.0
var estadoMuerte = false
var nivel: int = 1
func _ready():
	$Ray_Cast_Walls.target_position.x = rayCastDimension
	if not saludo_reproducido:
		animated_sprite_2d.play("Saludo")
		saludo_reproducido = true
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.play("Quieto")
		bloquea_movimiento = false

func movimiento():
	if bloquea_movimiento or is_dashing:
		return
	var horizontal = Input.get_axis("left", "right")
	if pegado_a_pared:
		ignore_horizontal_animation = true
	else:
		ignore_horizontal_animation = false
	
	if horizontal != 0:
		$Ray_Cast_Walls.target_position.x = rayCastDimension
		if Input.is_action_pressed("Run"):
			velocity.x = (speed * horizontal) * 2
			if not ignore_horizontal_animation:
				animated_sprite_2d.play("Correr")
		else:
			velocity.x = speed * horizontal
			if not ignore_horizontal_animation:
				animated_sprite_2d.play("Caminar")
		animated_sprite_2d.flip_h = horizontal < 0
		if horizontal < 0:
			$Ray_Cast_Walls.target_position.x = -rayCastDimension
		if is_dashing:
			return
	else:
		velocity.x = 0
		if not pegado_a_pared:
			animated_sprite_2d.play("Quieto")

func wall_and_jump():
	if $Ray_Cast_Walls.get_collider() and $Ray_Cast_Walls.get_collider().is_in_group("wall_jump"):
		pegado_a_pared = true
		can_jump = true
		if Input.is_action_pressed("Up"):
			if animated_sprite_2d.animation != "Escalar":
				animated_sprite_2d.play("Escalar")
			velocity.y = -speed
		elif Input.is_action_pressed("Down"):
			if animated_sprite_2d.animation != "Escalar":
				animated_sprite_2d.play("Escalar")
			velocity.y = speed
		else:
			animated_sprite_2d.play("Pegado_Pared")
			velocity.y = 0
	else:
		pegado_a_pared = false
		can_jump = false
		
func process_dash(delta):
	if dash_cooldown_timer > 0:
		dash_cooldown_timer -= delta
	
	if Input.is_action_just_pressed("Dash") and can_dash and dash_cooldown_timer <= 0:
		start_dash()
	
	if is_dashing:
		dash_timer -= delta
		if dash_timer <= 0:
			stop_dash()

func start_dash():
	can_dash = false
	is_dashing = true
	dash_timer = dash_duration
	dash_cooldown_timer = dash_cooldown

	var horizontal = Input.get_axis("left", "right")
	if horizontal != 0:
		velocity.x = dash_speed * horizontal
		animated_sprite_2d.flip_h = horizontal < 0
		animated_sprite_2d.play("Dash")
	else:
		velocity.x = 0

func stop_dash():
	is_dashing = false
	velocity.x = 0

func recharge_dash():
	if is_on_floor():
		can_dash = true

func salto():
	if Input.is_action_just_pressed("jump") and (is_on_floor() or pegado_a_pared):
		velocity.y = -jump_speed
		if animated_sprite_2d.animation != "Salto" and pegado_a_pared:
			animated_sprite_2d.play("Salto")
			pegado_a_pared = false
			can_jump = true

func gravedad(delta):
	if not is_on_floor() and not pegado_a_pared:
		velocity.y += gravity * delta
	if estadoMuerte:
		if estadoMuerte:
			velocity.y = 0
			velocity.x = 0

func actualizar_salto():
	if bloquea_movimiento or pegado_a_pared:
		return
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite_2d.play("Salto")
		else:
			animated_sprite_2d.play("Caida")

func muerte():
	if $Ray_Cast_Hazard_Up.get_collider():
		if $Ray_Cast_Hazard_Up.get_collider().is_in_group("Hazards"):
			GLOBAL.death_count += 1
			estadoMuerte = true
			bloquea_movimiento = true
			velocity.y = 0
			velocity.x = 0
			animated_sprite_2d.play("Muerte")
			await get_tree().create_timer(3.0).timeout
			get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")
	if $Ray_Cast_Hazard_Down.get_collider():
		if $Ray_Cast_Hazard_Down.get_collider().is_in_group("Hazards"):
			GLOBAL.death_count += 1
			estadoMuerte = true
			bloquea_movimiento = true
			velocity.y = 0
			velocity.x = 0
			animated_sprite_2d.play("Muerte")
			await get_tree().create_timer(3.0).timeout
			get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")
	if $Ray_Cast_Walls.get_collider():
		if $Ray_Cast_Walls.get_collider().is_in_group("Hazards"):
			GLOBAL.death_count += 1
			estadoMuerte = true
			bloquea_movimiento = true
			velocity.y = 0
			velocity.x = 0
			animated_sprite_2d.play("Muerte")
			await get_tree().create_timer(3.0).timeout
			get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")

func victoria():
	if $Ray_Cast_Walls.get_collider():
		if $Ray_Cast_Walls.get_collider().is_in_group("Meta"):
			# Bloquear movimiento del personaje
			bloquea_movimiento = true
			velocity = Vector2.ZERO

			# Obtener la cámara para ajustar zoom
			var camera = get_node("Camera2D")
			if camera:
				var tween = get_tree().create_tween()
				tween.tween_property(camera, "zoom", Vector2(13, 13), 1.0)  # Zoom a 13 en 1 segundo

			# Reproducir animación de SaludoFinal
			animated_sprite_2d.play("SaludoFinal")
			await get_tree().create_timer(3.0).timeout
			GLOBAL.nivel += 1
			get_tree().change_scene_to_file("res://Assets/Escenas/cambio_nivel.tscn")

func _process(delta):
	if not bloquea_movimiento:
		process_dash(delta) 
		wall_and_jump()
		recharge_dash()
		salto()
		movimiento()
		actualizar_salto()
		muerte()
		victoria()

func _physics_process(delta):
	gravedad(delta)
	move_and_slide()
	
