extends Node2D

@onready var sfx_got_item = $Gotitem
#keeps track of the keys

func _ready():
	if self.name in %Player.keys_found:
		queue_free()

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	sfx_got_item.play()
	%Player.keys_found.append(self.name)
	print(%Player.keys_found)
	queue_free()
