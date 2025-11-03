extends CharacterBody2D

@export_enum("wall", "cieling") var type: String
@export var is_moving = false
@export_enum("left", "right", "down", "up") var facing: String
@export var blinking = false

@onready var caught_player_cam = $CaughtPlayerCam
@onready var sprite_2d = $Sprite2D
@onready var light = $Light
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var player = get_tree().get_first_node_in_group("player")

func _ready():
	match facing:
		"left":
			sprite_2d.frame = 1
			sprite_2d.flip_h = true
			light.position.x = -4
			light.rotation_degrees = 135
		"right":
			sprite_2d.frame = 1
			light.position.x = 4
			light.rotation_degrees = 45
		"down":
			sprite_2d.frame = 0
			light.position.x = 0
			light.rotation_degrees = 90
		"up":
			sprite_2d.frame = 0
			sprite_2d.flip_v = true
			light.position.x = 0
			light.position.y = -8
			light.rotation_degrees = -90
	
	if blinking == true:
		animation_player.play("blink")
func _on_light_body_entered(body):
	if body == player:
		caught_player_cam.play()

func _on_caught_player_cam_finished():
	get_tree().reload_current_scene()
