extends StaticBody2D

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	if self.name in %Player.keys_found:
		queue_free()
