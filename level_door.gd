extends Area2D

@export var level_scene: String
@onready var player = get_tree().get_first_node_in_group("player")
@export var dialogue_resource: DialogueResource

func _process(_delta):
	if InteractionManager.dialogue_is_open == false and DialogueState.dialogue_status == "level_end":
		DialogueState.dialogue_status = "level_begin"
		get_tree().change_scene_to_file(level_scene)
		
func _on_body_entered(body):
	if body == player and dialogue_resource:
		print("player detected")
		#doesnt work put this back if u need the level door to work again: get_tree().change_scene_to_file(level_scene)
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		InteractionManager.dialogue_is_open = true
	elif body == player and dialogue_resource == null:
		get_tree().change_scene_to_file(level_scene)

