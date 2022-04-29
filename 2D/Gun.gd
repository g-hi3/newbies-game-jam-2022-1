extends Sprite

export(PackedScene) var Bullet

onready var rof_timer : Timer = $Timer
onready var weapon_direction : Position2D = $WeaponDirection
var can_shoot = true

export var muzzle_speed = 30
export var millis_between_shots = 100

func _ready():
	rof_timer.wait_time = millis_between_shots / 1000.0

func _process(delta):
	pass

func shoot():
	if can_shoot:
		var new_bullet = Bullet.instance()
		if new_bullet.has_method("set_bullet_direction"):
			new_bullet.global_position = $Muzzle.global_position
			new_bullet.speed = muzzle_speed
			var aim = weapon_direction.global_position
			var scene_root = get_tree().get_root().get_children()[0]
			scene_root.add_child(new_bullet)
			var direction = new_bullet.global_position.direction_to(aim).normalized()
			new_bullet.set_bullet_direction(direction)
#		print("pew!")
			can_shoot = false
			rof_timer.start()

func _on_Timer_timeout():
#	print("You can shoot again")
	can_shoot = true
