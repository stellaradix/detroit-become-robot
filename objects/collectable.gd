extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var level = get_tree().get_first_node_in_group("level")
@onready var audio_stream_player = $AudioStreamPlayer

func _on_body_entered(body):
	if body == player:
		level.items_collected += 1
		audio_stream_player.play()
		self.hide()

func _on_audio_stream_player_finished():
	self.queue_free()
