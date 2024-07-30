extends StaticBody2D

@onready var sfx_unlock = $Unlock
@onready var area_2d = $Area2D
@onready var sprite_2d = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("player")
@export_enum("red", "blue", "green", "yellow") var card_color: String
@export var door_flip: bool

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
	if door_flip == true:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false

func _on_area_2d_body_entered(_body):
	#keys have to be the same name as the doors they open
	if self.name in player.keys_found:
		sfx_unlock.play()
		area_2d.queue_free()

func _on_unlock_finished():
	queue_free()
