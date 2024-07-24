extends StaticBody2D

@onready var sfx_unlock = $Unlock

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	if self.name in %Player.keys_found:
		sfx_unlock.play()
		queue_free()
