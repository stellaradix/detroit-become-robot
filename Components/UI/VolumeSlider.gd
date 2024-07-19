extends Node

signal volume_changed(value, bus_index)

@export var bus_index: int

@onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	var volume_db = AudioServer.get_bus_volume_db(bus_index)
	var volume_linear = db_to_linear(volume_db)
	self.value = volume_linear


func _on_value_changed(value):
	emit_signal("volume_changed", value, bus_index)
	audio_stream_player.play()
