extends Control

@onready var settings: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_back_pressed() -> void:
	
	settings.hide()


func _on_apply_pressed() -> void:
	
	AudioServer.set_bus_volume_db(0, linear_to_db($ColorRect/audio_options/VBoxContainer/SFXbar.value))
	AudioServer.set_bus_volume_db(1, linear_to_db($ColorRect/audio_options/VBoxContainer/SFXbar.value))
	AudioServer.set_bus_volume_db(2, linear_to_db($ColorRect/audio_options/VBoxContainer/SFXbar.value))
