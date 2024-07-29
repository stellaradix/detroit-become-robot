extends AudioStreamPlayer

var footstep_sounds : Array = []

func _ready():
	for i in range(4):
		var sound = load("res://Sound/SFX/footstep" + str(i+1) + ".wav")
		footstep_sounds.append(sound)

func play_footstep():
	var random_index = randi() % footstep_sounds.size()
	var sound_to_play = footstep_sounds[random_index]
	var audio_player = AudioStreamPlayer.new()
	audio_player.stream = sound_to_play
	add_child(audio_player)
	audio_player.play()
