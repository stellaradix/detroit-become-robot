extends Label

func _ready():
	text = "Collectables: %d / %d" % [PlayerManager.total_collected_collectables, PlayerManager.total_collectables]
