extends Area2D

export var speed : int = 50

onready var direction : Vector2 = Vector2.ZERO
var aim : Vector2 = Vector2.ZERO
const KILL_TIME = 2
var timer = 0

func _ready():
	aim = get_global_mouse_position()
	direction = self.global_position.direction_to(aim).normalized()
	print(speed)


func _physics_process(delta):
	if direction != Vector2.ZERO:
		var velocity = direction * speed
		global_position += velocity
		
	
	timer += delta
	if timer > KILL_TIME:
		queue_free()


func _on_Bullet_body_entered(body: Node):
	if body.has_method("handle_hit"):
		body.handle_hit()
		queue_free()
