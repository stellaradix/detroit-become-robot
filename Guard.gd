extends CharacterBody2D

#right = 1
#left = -1
var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	#flips sprite if direction changed
	
	#if direction == 1:
	#$animatedsprite.flip_h = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#swaps direction if theres a wall
	if is_on_wall():
		direction = direction * -1
		#$animatedsprite.flip_h = not $animatedsprite.flip_h
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	move_and_slide()
	
	
