extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var collision_shape_2d = $CollisionShape2D
@onready var collision_shape_2d_2 = $CollisionShape2D2
@onready var collision_shape_2d_3 = $CollisionShape2D3
@onready var collision_shape_2d_4 = $CollisionShape2D4


func _process(_delta):
	if MenuManager.is_changing == false:
		if player.is_crouching == true:
			collision_shape_2d.disabled = true
			collision_shape_2d_2.disabled = true
			collision_shape_2d_3.disabled = true
			collision_shape_2d_4.disabled = true
		else:
			collision_shape_2d.disabled = false
			collision_shape_2d_2.disabled = false
			collision_shape_2d_3.disabled = false
			collision_shape_2d_4.disabled = false
