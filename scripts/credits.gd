extends Control

@onready var credits: Control = $"."


func _ready() -> void:
	pass # Replace with function body.





func _on_text_pressed() -> void:
	OS.shell_open("https://github.com/ACh-K/Cubic-11")


func _on_theme_pressed() -> void:
	OS.shell_open("https://itch.io/queue/c/1473270/themes-for-godot-games?game_id=1091572")

func _on_member_4_pressed() -> void:
	OS.shell_open("https://freesound.org/people/Robinhood76/")


func _on_member_3_pressed() -> void:
	OS.shell_open("https://chibiparty.itch.io/")


func _on_member_2_pressed() -> void:
	OS.shell_open("https://itch.io/profile/craknain")

func _on_member_1_pressed() -> void:
	OS.shell_open("https://thebugmaker.itch.io/")


func _on_back_pressed() -> void:
	credits.hide()


func _on_link_button_pressed() -> void:
	OS.shell_open("https://freesound.org/people/DAN2008/sounds/789772/")
