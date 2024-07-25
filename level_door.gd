extends Area2D


func _on_body_entered(body):
	#temp door replace with another level in a desired order
	if body == %Player:
		print("player detected")
		get_tree().change_scene_to_file("res://tutorial_level.tscn")
