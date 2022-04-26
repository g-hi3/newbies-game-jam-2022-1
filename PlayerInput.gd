extends Node

onready var weapon_controller = $WeaponController

var speed = 180
var rigidBody
var pause_singleton

func _ready():
	rigidBody = get_node("RigidBody")
	pause_singleton = get_tree().root.get_child(0).get_node("PauseSingleton")

func _physics_process(delta):
	if pause_singleton.is_paused:
		return
	
	var direction = Vector3(0, 0, 0)
	if Input.is_key_pressed(KEY_W):
		direction.z -= 1
	if Input.is_key_pressed(KEY_S):
		direction.z += 1
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	var velocity = direction * speed * delta
	rigidBody.set_linear_velocity(velocity)
	
	if Input.is_action_pressed("primary_action"):
		weapon_controller.shoot()
