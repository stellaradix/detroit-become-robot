extends Node2D

@onready var sfx_got_item = $Gotitem
@onready var area_2d = $Area2D

#keeps track of the keys

func _ready():
	if self.name in %Player.keys_found:
		queue_free()

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	sfx_got_item.play()
	%Player.keys_found.append(self.name)
	print(%Player.keys_found)
	area_2d.queue_free()


func _on_gotitem_finished():
	queue_free()
