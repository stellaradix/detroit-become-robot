extends Node

signal menu_closed

var next_menu: String
var old_menu = Node

func set_menu(menu):
	old_menu = get_tree().get_first_node_in_group("menu")
	next_menu = menu
	

func close_menu():
	old_menu.queue_free()
	
	emit_signal("menu_closed")
	
func open_menu():
	var new_menu = load(next_menu).instantiate()
	var mainNode = get_tree().get_first_node_in_group("main")
	mainNode.add_child(new_menu)

func switch_menu():
	open_menu()
	close_menu()

func add_transition():
	var transition = load("res://Menus/transition.tscn").instantiate()
	var mainNode = get_tree().get_first_node_in_group("main")
	if mainNode:
		mainNode.add_child(transition)
	else:
		get_tree().current_scene.add_child(transition)

func remove_transition():
	var transition = get_tree().get_first_node_in_group("transition")
	transition.queue_free()

#on button press, play "swipe on" transition and set NextMenu var to stored button value
#on "swipe on" transition finished, switch menus using NextMenu var
#on old menu close, play "swipe off" transition

