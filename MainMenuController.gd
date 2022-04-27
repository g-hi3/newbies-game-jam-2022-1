extends VBoxContainer

func _ready():
	get_node("Start Button").grab_focus()

func _on_Start_Button_pressed():
	get_tree().change_scene("res://2D/Level1.tscn")

func _on_Quit_Button_pressed():
	get_tree().quit()
