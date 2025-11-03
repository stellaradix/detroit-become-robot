extends Node

signal door_opened

var spoken_to = false
var dialogue_status: String
var key_obtained = false
var door_status = "closed"
var first_time_collect = false

func open_door():
	if key_obtained == true and door_status == "closed":
		emit_signal("door_opened")
