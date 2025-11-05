extends StaticBody2D

@onready var interaction_area = $InteractionArea
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
		
	interaction_area.interact = Callable(self, "_on_interact")

func open_door():
	PlayerManager.play_game_sfx(PlayerManager.door_sfx)
	self.queue_free()

func _on_interact():
	if self.name in player.keys_found:
		open_door()
