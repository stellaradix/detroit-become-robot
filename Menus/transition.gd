extends Control

@onready var animation_player = $AnimationPlayer

func animation_finished():
	MenuManager.open_menu()
	MenuManager.close_menu()
	
func _ready():
	if MenuManager.is_changing == false:
		animation_player.play("swipe_off")
	else:
		animation_player.play("swipe_on")
		

func swipe_off_finished():
	MenuManager.remove_transition()
