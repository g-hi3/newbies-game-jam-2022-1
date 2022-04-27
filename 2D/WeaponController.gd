extends Node

export(PackedScene) var StartingWeapon
var hand : Position2D
var equipped_weapon : Sprite


func _ready():
	hand = get_parent().find_node("PlayerHand")
	if StartingWeapon:
		equip_weapon(StartingWeapon)
		
		
func equip_weapon(weapon_to_equip : PackedScene):
	if equipped_weapon:
		print("deleting current weapon")
		equipped_weapon.queue_free()
	
	else:
		print("No weapon equipped")
		equipped_weapon = weapon_to_equip.instance()
		hand.add_child(equipped_weapon)
		
func shoot():
	if equipped_weapon:
		equipped_weapon.shoot()
