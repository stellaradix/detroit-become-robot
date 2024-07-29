extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D

func _on_body_entered(body):
	#testing collision
	if body == player:
		sprite_2d.self_modulate = Color(1, 1, 1, 0.75)

func _on_body_exited(body):
	if body == player:
		sprite_2d.self_modulate = Color(1, 1, 1, 1)

func _process(_delta):
	if player.is_crouching == true:
		collision_shape_2d.disabled = true
	else:
		collision_shape_2d.disabled = false
