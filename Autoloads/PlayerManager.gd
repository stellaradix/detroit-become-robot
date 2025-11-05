extends Node

var is_invurnable = false

var FirstTimeCollect = false
var total_collected_collectables = 0
var total_collectables = 22
var quit_game = false
var collected_item_ids: Array = []

var bite_sfx = "res://Sound/SFX/bite.ogg"
var running_sfx = "res://Sound/SFX/runningend.ogg"
var shake_sfk = "res://Sound/SFX/shake_end.ogg"

var door_sfx = "res://assets/464294__audioway__door-unlocked.wav"
var collectible_sfx = "res://Sound/SFX/pickup.ogg"
var key_sfx = "res://assets/key_get.ogg"

func mark_item_collected(id: int) -> void:
	if id not in collected_item_ids:
		collected_item_ids.append(id)

func is_item_collected(id: int) -> bool:
	return id in collected_item_ids

func play_sfx(file):
	var Audio = SoundPlayer.sfx
	Audio.stream = load(file)
	Audio.play()
	
func play_game_sfx(file):
	var Audio = SoundPlayer.sfx_2
	Audio.stream = load(file)
	Audio.play()

func to_main_menu():
	get_tree().change_scene_to_file("res://Menus/title_menu.tscn")

func play_bg_music():
	var bg_music : Array = []
	for i in range(5):
		var sound = load("res://Sound/Music/music_" + str(i+1) + ".mp3")
		bg_music.append(sound)
	var random_index = randi() % bg_music.size()
	var sound_to_play = bg_music[random_index]
	var Audio = SoundPlayer.music
	Audio.stream = sound_to_play
	Audio.play()
