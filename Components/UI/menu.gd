extends Node

var collected_items: int
@export var total_collectables: int

func _ready():
	MenuManager.add_transition()
	PlayerManager.play_bg_music()
