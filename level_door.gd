extends Area2D

@export var level_path: String
@onready var player = get_tree().get_first_node_in_group("player")
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String
@onready var level = get_tree().get_first_node_in_group("menu")

func _process(_delta):
	if InteractionManager.dialogue_is_open == false and DialogueState.dialogue_status == "level_end":
		DialogueState.dialogue_status = "level_begin"
		MenuManager.switch_menu(level_path)
		
func _on_body_entered(body):
	PlayerManager.total_collected_collectables += level.collected_items
	print("total collected collectables: ", PlayerManager.total_collected_collectables , "/ ", PlayerManager.total_collectables)
	if body == player and dialogue_resource:
		print("player detected")
		$"../DialogueCover".show()
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		InteractionManager.dialogue_is_open = true
	elif body == player and dialogue_resource == null:
		MenuManager.switch_menu(level_path)

