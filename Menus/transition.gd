extends Control

@onready var animation_player = $AnimationPlayer

func animation_finished():
	if get_tree().get_first_node_in_group("main"):
		MenuManager.switch_menu()
	else:
		animation_player.play("swipe_off")
		get_tree().reload_current_scene()

func swipe_off_finished():
	MenuManager.remove_transition()

func _ready():
	MenuManager.connect("menu_closed", _on_menu_closed)
	

func _on_menu_closed():
	animation_player.play("swipe_off")
