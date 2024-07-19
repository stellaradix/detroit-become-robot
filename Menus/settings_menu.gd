extends Control

func set_bus_volume(bus_index: int, value: float):
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	AudioServer.set_bus_mute(bus_index, value < 0.001)

func _on_volume_slider_volume_changed(value, bus_index):
	set_bus_volume(bus_index, value)
