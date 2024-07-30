extends Node

var is_invurnable = false

var FirstTimeCollect = false
var total_collected_collectables = 0
var total_collectables = 10
var quit_game = false

func bitesfx():
	var Audio = Soundtrack
	Audio.stream = load("res://Sound/SFX/353067__jofae__bite-cartoon-style.R.ogg")
	Audio.play()

func runningsfx():
	var Audio = Soundtrack
	Audio.stream = load("res://Sound/SFX/runningend.ogg")
	Audio.play()
func shakesfx():
	var Audio = Soundtrack
	Audio.stream = load("res://Sound/SFX/shake_end.ogg")
	Audio.play()
func to_main_menu():
	get_tree().change_scene_to_file("res://Menus/title_menu.tscn")
