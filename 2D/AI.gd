extends Node2D

signal state_changed(new_state)

enum State {
	PATROL,
	ENGAGE
}

onready var weapon_controller = get_parent().get_node("WeaponController")
onready var player_detection_zone = $PlayerDetectionZone
onready var char_center = get_parent().get_node("CharCenter")

var current_state : int= State.PATROL setget set_state
var player = null 
var actor = null

func _process(delta):
	match current_state:
		State.PATROL:
			pass
		State.ENGAGE:
			if player != null: # and weapon != null
				actor.rotation = actor.global_position.direction_to(player.global_position).angle()
				weapon_controller.shoot()
			else:
				print("In the engage state but no player")
		_:
			print("Error: found a state for our enemy that should not exist")

func initialize(actor):
	self.actor = actor

func set_state(new_state : int):
	if new_state == current_state:
		return
	current_state = new_state
	emit_signal("state_changed", current_state)

func _on_PlayerDetectionZone_body_entered(body):
	if body.is_in_group("player"):
		set_state(State.ENGAGE)
		player = body
