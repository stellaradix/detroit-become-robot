extends Area2D

var BehindBox = false

@onready var player = get_tree().get_first_node_in_group("player")

@onready var sprite_2d = $Sprite2D
@onready var label = $Label
@onready var collision_shape_2d = $CollisionShape2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.is_crouching == true:
	
		if BehindBox == true:
			PlayerManager.is_invurnable = true
			label.show()
		else:
			PlayerManager.is_invurnable = false
			label.hide()
	
		collision_shape_2d.disabled = true
	else:
		collision_shape_2d.disabled = false
			

func _on_body_entered(body):
	#testing collision
	if body == player:
		BehindBox = true
		sprite_2d.self_modulate = Color(1, 1, 1, 0.75)
		print("You're behind a box")

func _on_body_exited(body):
	if body == player:
		BehindBox = false
		sprite_2d.self_modulate = Color(1, 1, 1, 1)
		print("You're no longer behind a box")
