extends CharacterBody2D

#right = 1
#left = -1
var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	#flips sprite if direction changed
	
	#if direction == 1:
	#$animatedsprite.flip_h = true
	
	#Checks floor to not walk off edges
	$FloorChecker.position.x = $CollisionShape2D.get_shape().size.x * direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	#swaps direction if theres a wall or no floor
	if is_on_wall() or not $FloorChecker.is_colliding():
		direction = direction * -1
		#$animatedsprite.flip_h = not $animatedsprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.get_shape().size.x * direction
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	move_and_slide()
	
	


func _on_light_body_entered(body):
	#not detecting player
	#its detecting the ledge as a player?
	if body == $".":
		print("ouch")

