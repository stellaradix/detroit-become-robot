extends Node

var is_invurnable = false

var FirstTimeCollect = false
var total_collected_collectables = 0
var total_collectables = 10
var quit_game = false

var bite_sfx = "res://Sound/SFX/bite.ogg"
var running_sfx = "res://Sound/SFX/runningend.ogg"
var shake_sfk = "res://Sound/SFX/shake_end.ogg"

func play_sfx(file):
	var Audio = Soundtrack
	Audio.stream = load(file)
	Audio.play()
func to_main_menu():
	get_tree().change_scene_to_file("res://Menus/title_menu.tscn")

func play_bg_music():
	var bg_music : Array = []
	for i in range(2):
		var sound = load("res://Sound/Music/music_" + str(i+1) + ".mp3")
		bg_music.append(sound)
	var random_index = randi() % bg_music.size()
	var sound_to_play = bg_music[random_index]
	var Audio = Soundtrack
	Audio.stream = sound_to_play
	Audio.play()
