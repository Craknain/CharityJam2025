extends Node



@onready var pause: Control = $CharacterBody2D/Camera2D/pause



func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"): # "ui_cancel" is Esc by default
		pause.show()
		get_tree().paused = true
