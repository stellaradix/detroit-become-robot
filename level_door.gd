extends Area2D

@export var level_scene: String
var DialogueFinished = false
@onready var player = get_tree().get_first_node_in_group("player")
@export var dialogue_resource: DialogueResource
@export var tutorial_level = "res://tutorial_level.dialogue"

func _process(_delta):
	if DialogueFinished == true:
		print("dialogue finished")
		get_tree().change_scene_to_file(level_scene)
		DialogueFinished = false
		
func _on_body_entered(body):
	if body == player:
		print("player detected")
		#doesnt work put this back if u need the level door to work again: get_tree().change_scene_to_file(level_scene)
		DialogueManager.show_dialogue_balloon(dialogue_resource.tutorial_level)
