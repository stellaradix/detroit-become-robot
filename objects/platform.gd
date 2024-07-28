extends AnimatableBody2D

@onready var collision_shape_2d = $CollisionShape2D
@onready var player = get_tree().get_first_node_in_group("player")

func _process(_delta):
	if player.is_crouching == true:
		collision_shape_2d.disabled = true
	else:
		collision_shape_2d.disabled = false
