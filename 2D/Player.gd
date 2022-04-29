extends KinematicBody2D

export (int) var speed = 2

onready var weapon_controller = $WeaponController

var velocity = Vector2()
var pause_singleton

func _ready():
	pause_singleton = get_tree().root.get_child(0).get_node("PauseSingleton")

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
	#velocity = velocity.normalized() * speed
	move_and_collide(velocity * speed)

func _unhandled_input(event):
	if pause_singleton.is_paused:
		return
		
	if event.is_action_pressed("primary_action"):
		weapon_controller.shoot()

func _process(delta):
	$CharCenter.look_at(get_global_mouse_position())
	
	if pause_singleton.is_paused:
		return
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)

func handle_hit():
	print("Player hit") # debug, hit not implemented yet
