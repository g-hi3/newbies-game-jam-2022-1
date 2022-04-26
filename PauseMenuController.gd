extends Control

var pause_singleton

func _ready():
	pause_singleton = get_tree().root.get_child(0).get_node("PauseSingleton")

func _on_Continue_Button_pressed():
	pause_singleton.is_paused = false
	queue_free()

func _on_Main_Menu_Button_pressed():
	get_tree().change_scene("res://Main Menu.tscn")

func _on_Quit_Game_Button_pressed():
	get_tree().quit()
