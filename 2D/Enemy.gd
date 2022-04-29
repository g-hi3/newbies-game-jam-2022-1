extends KinematicBody2D

onready var ai = $AI

func _ready():
	pass # Replace with function body.

func handle_hit():
	print("Enemy hit") # debug, hit not implemented yet
