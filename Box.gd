extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#testing collision
	if body == %Player:
		print("You're Hiding!")
	
	
	if body == %Player:
		if %Player.iscrouching() == true:
			%Player.is_invurnable = true
		else:
			%Player.is_invurnable = false
		
