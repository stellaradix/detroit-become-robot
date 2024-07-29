extends Button

var clickSFX = preload("res://Sound/Menu/ui_click.wav")
var hoverSFX = preload("res://Sound/Menu/ui_hover.wav")

@onready var audio_stream_player = $AudioStreamPlayer

func _on_pressed():
	audio_stream_player.stream = clickSFX
	audio_stream_player.play()
	call_deferred("quit_game")

func _on_mouse_entered():
	audio_stream_player.stream = hoverSFX
	audio_stream_player.play()
	
func quit_game():
	get_tree().quit()
