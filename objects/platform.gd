extends AnimatableBody2D

@export var is_wooden: bool
@onready var collision_shape_2d = $CollisionShape2D
@onready var sprite_2d = $Sprite2D
@onready var player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	if MenuManager.is_changing == false:
		if is_wooden == true:
			sprite_2d.texture = load("res://assets/wood_platform.png")
			if player.is_crouching == true:
				collision_shape_2d.disabled = true
			else:
				collision_shape_2d.disabled = false
		else:
			sprite_2d.texture = load("res://assets/platform.png")
