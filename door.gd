extends StaticBody2D

@onready var sfx_unlock = $Unlock
@onready var area_2d = $Area2D


func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	if self.name in %Player.keys_found:
		sfx_unlock.play()
		area_2d.queue_free()

func _on_unlock_finished():
	queue_free()
