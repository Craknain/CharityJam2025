extends Node2D


@onready var initial_pos: Vector2 = self.get_global_position()

@onready var bottom_ray: RayCast2D = $BottomRay
@onready var middle_ray: RayCast2D = $MiddleRay
@onready var top_ray: RayCast2D = $TopRay
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var agression_timer: Timer = $AgressionTimer

@onready var rays: Array[RayCast2D] = [top_ray, middle_ray, bottom_ray]

var target: Node2D = null
var going_back: bool = false

var SPEED: int = 50

var direction: Vector2 = Vector2(-1,0)

func _ready() -> void:
	animated_sprite_2d.play("idle")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	for ray in rays:
		if ray.is_colliding() and ray.get_collider().is_in_group("player"):
			target = ray.get_collider()
			break


func _process(delta: float) -> void:
	# Detected player and tries to attack him
	if target:
		animated_sprite_2d.play("agressive")
		direction = position.direction_to(target.position)
		rotation = global_position.angle_to_point(target.global_position)
		if !animated_sprite_2d.flip_h:
			animated_sprite_2d.flip_v = true if (rotation < PI/2 and rotation > -PI/2) else false
			rotation += PI
		else:
			animated_sprite_2d.flip_v = true if (rotation > PI/2 or rotation < -PI/2) else false
		
		global_position += direction * SPEED * delta
		
		# Went too far from his initial location
		if global_position.distance_to(initial_pos) > 100:
			target = null
			going_back= true
			animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
			
	# Quickly goes back to its initial location
	elif going_back:
		animated_sprite_2d.play("idle")
		direction = global_position.direction_to(initial_pos)
		rotation = global_position.angle_to_point(initial_pos)
		global_position = global_position.move_toward(initial_pos, delta * SPEED * 2)
		if !animated_sprite_2d.flip_h:
			animated_sprite_2d.flip_v = true if (rotation < PI/2 and rotation > -PI/2) else false
			rotation += PI
		else:
			animated_sprite_2d.flip_v = true if (rotation > PI/2 or rotation < -PI/2) else false
		if global_position == initial_pos:
			going_back = false
			rotation = 0
			animated_sprite_2d.flip_h = false
			animated_sprite_2d.flip_v = false
			direction = Vector2(-1,0)
	
	else:
		if global_position.x - initial_pos.x > 100:
			direction = Vector2(-1, 0)
			animated_sprite_2d.flip_v = false
			rotation = 0
		if global_position.x - initial_pos.x < -100:
			direction = Vector2(1, 0)
			animated_sprite_2d.flip_v = true
			rotation = PI
		global_position += direction * SPEED * delta
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.lose_oxygen(5)
		for ray in rays:
			ray.enabled = false
		animated_sprite_2d.play("idle")
		if target:
			target = null
			going_back = true
			agression_timer.start()


func _on_agression_timer_timeout() -> void:
	for ray in rays:
		ray.enabled = true
	
