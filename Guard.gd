extends CharacterBody2D

@export var move_speed = 50

#right = 1
#left = -1
var direction = 1
var moving = true
var already_turned = false
#used to move light according to direction of enemy
@onready var light_pivot = $lightPivot
@onready var caught_player = $CaughtPlayer
@onready var turn_timer = $TurnTimer
@onready var sprite = $sprite
@onready var player = get_tree().get_first_node_in_group("player")

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
	if already_turned == false and (is_on_wall() or not $FloorChecker.is_colliding()):
		moving = false
		already_turned = true
		direction = direction * -1
		#$animatedsprite.flip_h = not $animatedsprite.flip_h
		$FloorChecker.position.x = $CollisionShape2D.get_shape().size.x * direction
		turn_timer.start()
	
	if turn_timer.is_stopped():
		already_turned = false
		
	if moving == true:
		velocity.y += 20
		velocity.x = move_speed * direction
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	

func _on_light_body_entered(body):
	if body == player and PlayerManager.is_invurnable == true:
		print("The Guard can't see you!")
	elif body == player and PlayerManager.is_invurnable == false:
		caught_player.play()
		print("Ouch! A guard!")

func _on_caught_player_finished():
	get_tree().reload_current_scene()


func _on_turn_timer_timeout():
	sprite.flip_h = not sprite.flip_h
	moving = true
	print("timer timeout ", light_pivot.rotation_degrees)
	if light_pivot.rotation_degrees > 0:
		light_pivot.rotation_degrees = -202.5
		print("flip left ", light_pivot.rotation_degrees)
	elif light_pivot.rotation_degrees < 0:
		light_pivot.rotation_degrees = 22.5
		print("flip right ", light_pivot.rotation_degrees)
