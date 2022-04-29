extends Node2D

export (PackedScene) var connected_area

func _on_Area2D_body_entered(body):
	get_tree().change_scene(connected_area.resource_path)
