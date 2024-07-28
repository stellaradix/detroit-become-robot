extends StaticBody2D

@onready var player = get_tree().get_first_node_in_group("player")
@onready var animation_player = $AnimationPlayer

func _on_area_2d_body_entered(body):
	if body == player:
		player.velocity.y = -650
		animation_player.play("spring")
