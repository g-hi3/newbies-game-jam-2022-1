extends KinematicBody2D

onready var ai = $AI

func _ready():
	ai.initialize(self)

func handle_hit():
	print("Enemy hit") # debug, hit not implemented yet
