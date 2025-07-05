extends ProgressBar

@onready var oxygen_timer: Timer = $"../OxygenTimer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = oxygen_timer.wait_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = oxygen_timer.time_left
