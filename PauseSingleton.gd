extends Node

var is_paused = false

func _input(event):
	if not is_paused and Input.is_key_pressed(KEY_ESCAPE):
		is_paused = true
		var pause_menu = load("res://Pause Menu.tscn").instance()
		get_node(".").add_child(pause_menu)
