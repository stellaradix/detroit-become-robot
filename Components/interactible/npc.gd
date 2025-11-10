extends StaticBody2D

@onready var interaction_area = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func action():
	DialogueManager.show_dialogue_balloon(interaction_area.dialogue_resource, interaction_area.dialogue_start)
	InteractionManager.dialogue_is_open = true

func _on_interact():
	action()
