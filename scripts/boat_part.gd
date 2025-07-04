extends RigidBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var delay_animation: Timer = $DelayAnimation
@onready var floating_animation: AnimationPlayer = $FloatingAnimation

var time := 0.0
var frequency : float
var start_pos: Vector2 = get_position()
var amplitude: float


func _ready():
	# Block process so that they don't move
	set_process(false)
	# Set random amplitude, freq, frame and animation delay
	amplitude = randf_range(0.4, 0.6)
	frequency = randf_range(1, 5)
	sprite_2d.frame = randi_range(0, 2)
	delay_animation.wait_time = randf_range(0, 2)
	delay_animation.start()


func _process(delta: float) -> void:
	time += delta * frequency
	position += Vector2(0, sin(time) * 0.5)

func _on_delay_animation_timeout() -> void:
	set_process(true)
