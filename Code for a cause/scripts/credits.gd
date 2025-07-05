extends Control


func _ready():
	hide()

func _on_button_pressed() -> void:
	hide()
	AudioManager.play_button_sound()
