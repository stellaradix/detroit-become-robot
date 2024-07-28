extends Area2D

@onready var player = get_tree().get_first_node_in_group("player")

func _on_body_entered(body):
	if body == player:
		get_tree().reload_current_scene()
