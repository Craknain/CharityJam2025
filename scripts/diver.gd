extends CharacterBody2D

@onready var oxygen_timer: Timer = $Camera2D/OxygenTimer
@onready var i_frame: AnimationPlayer = $iFrame
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var MAX_OXYGEN := 30

const SPEED := 150.0

func _ready():
	oxygen_timer.wait_time = MAX_OXYGEN

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	rotation = global_position.angle_to_point(direction + global_position)
	if rotation > PI/2 or rotation < -PI/2:
		animated_sprite_2d.flip_v = true
	else:
		animated_sprite_2d.flip_v = false
	velocity = direction * SPEED
	move_and_slide()


func _on_oxygen_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/defeat_screen.tscn")
	
func refill_oxygen(amount: int):
	oxygen_timer.start(min(oxygen_timer.time_left + amount, MAX_OXYGEN))
	
func lose_oxygen(amount: int):
	if oxygen_timer.time_left - amount < 0:
		print("Dead") # TODO: Go to game over page
	oxygen_timer.start(oxygen_timer.time_left - amount)
	get_hit()

func _on_surface_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		refill_oxygen(MAX_OXYGEN)
		oxygen_timer.paused = true

func _on_surface_body_exited(body: Node2D) -> void:
	if body.is_in_group('player'):
		oxygen_timer.paused = false
		
func get_hit():
	i_frame.play("iFrame")
	
