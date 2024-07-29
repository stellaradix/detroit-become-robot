extends Node

signal menu_closed

var next_menu: String
var is_changing = false

func set_menu(menu):
	next_menu = menu	

func close_menu():
	get_tree().unload_current_scene()
	
	is_changing = false
	
	emit_signal("menu_closed")
	
func open_menu():
	get_tree().change_scene_to_file(next_menu)

func switch_menu(menu):
	is_changing = true
	set_menu(menu)
	add_transition()

func add_transition():
	var transition = load("res://Menus/transition.tscn").instantiate()
	get_tree().current_scene.add_child(transition)

func remove_transition():
	var transition = get_tree().get_first_node_in_group("transition")
	transition.queue_free()
