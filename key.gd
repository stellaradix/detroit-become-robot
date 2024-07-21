extends Node2D

#keeps track of the keys

func _ready():
	if self.name in %Player.keys_found:
		queue_free()

func _on_area_2d_body_entered(body):
	#keys have to be the same name as the doors they open
	%Player.keys_found.append(self.name)
	print(%Player.keys_found)
	queue_free()
