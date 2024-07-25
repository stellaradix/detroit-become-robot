extends CharacterBody2D

#right = 1
#left = -1
var direction = -1

#used to move light accorsing to direction of enemy
@onready var light_pivot = $lightPivot

@onready var caught_player = $CaughtPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	#flips sprite if direction changed
	
	#if direction == 1:
	#$animatedsprite.flip_h = true
	
	#Checks floor to not walk off edges
	$FloorChecker.position.x = $CollisionShape2D.get_shape().size.x * direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	
	#swaps direction if theres a wall or no floor
	if is_on_wall() or not $FloorChecker.is_colliding():
		direction = direction * -1
		#$animatedsprite.flip_h = not $animatedsprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.get_shape().size.x * direction
		light_pivot.rotation_degrees += 180
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	move_and_slide()
	

func _on_light_body_entered(body):
	if body == %Player:
		#checks if the player is behind a box and crouching
		if %Player.is_invurnable == true:
			print("The Guard can't see you!")
		else:
			#sound not playing cuz scene loads before sound can fully play
			caught_player.play()
			print("Ouch! A guard!")

func _on_caught_player_finished():
	get_tree().reload_current_scene()
