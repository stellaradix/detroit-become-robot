extends Control

@onready var animation_player = $AnimationPlayer

func animation_finished():
	MenuManager.switch_menu()

func swipe_off_finished():
	MenuManager.remove_transition()

func _ready():
	MenuManager.connect("menu_closed", _on_menu_closed)
	

func _on_menu_closed():
	animation_player.play("swipe_off")
