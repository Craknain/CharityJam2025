extends Node

@onready var music: AudioStreamPlayer = $Music
@onready var sfx: AudioStreamPlayer = $SFX


func _ready():
	pass # Replace with function body.

func play_button_sound():
	sfx.play()
	
func play_music_sound():
	music.play()
	
