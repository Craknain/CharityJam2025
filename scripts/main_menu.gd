extends Control

@onready var credits: Control = $credits
@onready var settings: Control = $settings


func _ready() -> void:
	pass # Replace with function body.


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_options_pressed() -> void:
	settings.show()


func _on_credits_pressed() -> void:
	credits.show()


func _on_quit_pressed() -> void:
	get_tree().quit()
