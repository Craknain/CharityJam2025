extends Node

@onready var item_count_label: Label = $CharacterBody2D/CanvasLayer/ItemCountLabel


@onready var pause: Control = $CharacterBody2D/Camera2D/pause




func _input(event):
	if event.is_action_pressed("ui_cancel"): # "ui_cancel" is Esc by default
		pause.show()
		get_tree().paused = true
		
func _process(delta: float) -> void:
	if get_tree().get_nodes_in_group('items').is_empty():
		get_tree().change_scene_to_file("res://scenes/victory_screen.tscn")
	item_count_label.text = "Remaining items : %d" % get_tree().get_nodes_in_group('items').size()
