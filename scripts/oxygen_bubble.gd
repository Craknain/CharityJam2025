extends AnimatedSprite2D

@onready var time_to_live_timer: Timer = $TimeToLiveTimer


func _on_collect_area_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		body.refill_oxygen(5)
		queue_free()


func _on_time_to_live_timer_timeout() -> void:
	queue_free()
