extends RigidBody3D

var health = 25

func _ready():
	pass 
	
func _process(delta):
	pass

func Enemy_hit(damage):
	health -= damage
	if health <= 0:
		queue_free()
