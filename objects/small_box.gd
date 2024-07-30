extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var collision_shape_2d = $CollisionShape2D


func _process(_delta):
	if MenuManager.is_changing == false:
		if player.is_crouching == true:
			collision_shape_2d.disabled = true
		else:
			collision_shape_2d.disabled = false
