extends Control

func quit_game():
	get_tree().quit()


func _on_level_select_pressed():
	MenuManager.add_transition()
	get_tree().change_scene_to_file("res://level_select.tscn")


func _on_credits_pressed():
	MenuManager.add_transition()
	get_tree().change_scene_to_file("res://credits.tscn")
