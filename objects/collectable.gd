extends Area2D

@export var item_id = 0
var is_collected = false
@onready var player = get_tree().get_first_node_in_group("player")
@onready var level = get_tree().get_first_node_in_group("menu")
@onready var collision_shape_2d = $CollisionShape2D

#Player can currently stack collectibles when the level restarts
#Might want to use an array to keep track and then do something like this:
#func _ready():
	#if self.name found in array:
		#self.queue_free()
func _on_body_entered(body):
	if body == player:
		set_deferred("monitoring", false)
		level.collected_items += 1
		PlayerManager.mark_item_collected(item_id)
		is_collected = true
		PlayerManager.play_game_sfx(PlayerManager.collectible_sfx)
		self.queue_free()

func _ready() -> void:
	if PlayerManager.is_item_collected(item_id):
		print("Collectable", item_id, "already collected, freeing")
		queue_free()
	else:
		print("Collectable", item_id, "is available")
