extends Area2D

var BehindBox = false

@onready var sprite_2d = $Sprite2D
@onready var label = $Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if %Player.is_crouching == true and BehindBox == true:
		%Player.is_invurnable = true
		label.show()

	else:
		%Player.is_invurnable = false
		label.hide()
			

func _on_body_entered(body):
	#testing collision
	if body == %Player:
		BehindBox = true
		sprite_2d.self_modulate = Color(1, 1, 1, 0.75)
		print("You're behind a box")

func _on_body_exited(body):
	if body == %Player:
		BehindBox = false
		sprite_2d.self_modulate = Color(1, 1, 1, 1)
		print("You're no longer behind a box")
