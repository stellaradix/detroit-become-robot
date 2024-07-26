extends Node2D


func _on_tutorial_pressed():
	get_tree().change_scene_to_file("res://levels/tutorial_level.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Main/main.tscn")


func _on_rabbit_hole_pressed():
	get_tree().change_scene_to_file("res://levels/level_rabbit_hole.tscn")


func _on_long_brigade_pressed():
	get_tree().change_scene_to_file("res://level_long_brigade.tscn")


func _on_tall_pillar_pressed():
	get_tree().change_scene_to_file("res://levels/level_tall_pillar.tscn")
