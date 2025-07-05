extends CharacterBody2D

@onready var oxygen_timer: Timer = $Camera2D/OxygenTimer


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
	velocity = direction * SPEED
	move_and_slide()


func _on_oxygen_timer_timeout() -> void:
	print("Dead") # TODO : replace with go to scene Game Over
	
func refill_oxygen(amount: int):
	oxygen_timer.start(oxygen_timer.time_left + amount)
	
