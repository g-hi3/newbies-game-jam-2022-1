extends KinematicBody2D

export (int) var speed = 200

onready var weapon_controller = $WeaponController

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _unhandled_input(event):
	if event.is_action_pressed("primary_action"):
		weapon_controller.shoot()

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

