extends MeshInstance

export(NodePath) onready var camera = get_node(camera)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event is InputEventMouseButton:
		var mouse_position = get_viewport().get_mouse_position()
		var world_position = camera.project_position(mouse_position)
