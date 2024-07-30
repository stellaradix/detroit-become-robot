extends Node2D

@onready var sfx_got_item = $Gotitem
@onready var area_2d = $Area2D
@onready var sprite_2d = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("player")
@export_enum("red", "blue", "green", "yellow") var card_color: String

#keeps track of the keys

func _ready():
	match card_color:
		"red":
			sprite_2d.frame = 1
		"blue":
			sprite_2d.frame = 0
		"green":
			sprite_2d.frame = 2
		"yellow":
			sprite_2d.frame = 3
		
	
	
	if self.name in player.keys_found:
		queue_free()

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	sfx_got_item.play()
	player.keys_found.append(self.name)
	print(player.keys_found)
	area_2d.queue_free()


func _on_gotitem_finished():
	queue_free()
