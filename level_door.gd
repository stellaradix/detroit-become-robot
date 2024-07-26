extends Area2D

@export var level_scene: String

@onready var player = get_tree().get_first_node_in_group("player")

func _on_body_entered(body):
	#temp door replace with another level in a desired order
	if body == player:
		print("player detected")
		get_tree().change_scene_to_file(level_scene)
