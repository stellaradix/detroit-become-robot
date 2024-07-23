extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var interact: Callable = func():
	pass

func _on_body_entered(_body):
	InteractionManager.register_area(self)

func _on_body_exited(_body):
	InteractionManager.unregister_area(self)
