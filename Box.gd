extends Area2D

var BehindBox = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if %Player.is_crouching == true and BehindBox == true:
		%Player.is_invurnable = true
	else:
		%Player.is_invurnable = false

func _on_body_entered(body):
	#testing collision
	if body == %Player:
		var BehindBox = true
		print("You're behind a box")

func _on_body_exited(body):
	if body == %Player:
		var BehindBox = false
		print("You're no longer behind a box")
