extends Area2D


func _on_body_entered(body):
	#temp door replace with another level in a desired order
	if body == %Player:
		get_tree().change_scene_to_file("res://level.tscn")
