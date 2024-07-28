extends StaticBody2D

@onready var sfx_unlock = $Unlock
@onready var area_2d = $Area2D
@onready var player = get_tree().get_first_node_in_group("player")

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	if self.name in player.keys_found:
		sfx_unlock.play()
		area_2d.queue_free()

func _on_unlock_finished():
	queue_free()
