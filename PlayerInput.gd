extends Node

export (PackedScene) var Bullet

var speed = 180
var rigidBody

func _ready():
	rigidBody = get_node("RigidBody")

func _physics_process(delta):
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
