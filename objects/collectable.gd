extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var level = get_tree().get_first_node_in_group("menu")
@onready var audio_stream_player = $AudioStreamPlayer
@onready var collision_shape_2d = $CollisionShape2D

#Player can currently stack collectibles when the level restarts
#Might want to use an array to keep track and then do something like this:
#func _ready():
	#if self.name found in array:
		#self.queue_free()
func _on_body_entered(body):
	if body == player:
		set_deferred("monitoring", false)
		level.collected_items += 1
		audio_stream_player.play()
		self.hide()
		print("level collectables: ", level.collected_items)

func _on_audio_stream_player_finished():
	self.queue_free()
