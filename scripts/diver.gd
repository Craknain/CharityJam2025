extends CharacterBody2D

@onready var oxygen_timer: Timer = $Camera2D/OxygenTimer

var MAX_OXYGEN := 30

const SPEED := 300.0

func _ready():
	oxygen_timer.wait_time = MAX_OXYGEN

func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity = direction * SPEED
	move_and_slide()


func _on_oxygen_timer_timeout() -> void:
	print("Dead") # TODO : replace with go to scene Game Over
	
func refill_oxygen(amount: int):
	oxygen_timer.start(min(oxygen_timer.time_left + amount, MAX_OXYGEN))
	
func lose_oxygen(amount: int):
	if oxygen_timer.time_left - amount < 0:
		print("Dead") # TODO: Go to game over page
	oxygen_timer.start(oxygen_timer.time_left - amount)
	
	
