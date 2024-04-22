extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var  speed = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var aim = get_global_transform().basis
	position = position - (aim.z * speed) * delta
	
	pass
