extends Sprite2D


var time := 0.0
var frequency : float = 5
var start_pos: Vector2 = get_position()
var amplitude: float = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	frame = randi_range(0,2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += delta * frequency
	position += Vector2(0, sin(time) * 0.5)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
