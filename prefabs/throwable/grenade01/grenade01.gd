extends RigidBody3D

var damage = 50
@onready var radius = $Radius

func _process(delta):
	pass

func _on_fuse_timer_timeout():
	var bodies = radius.get_overlapping_bodies()
	for obj in bodies:
		if obj.is_in_group("Enemy"):
			var rayParams = PhysicsRayQueryParameters3D.create(global_transform.origin,obj.global_transform.origin)
			var result = get_world_3d().direct_space_state.intersect_ray(rayParams)
			if result.collider.is_in_group("Enemy"):
				obj.Enemy_hit(damage)
		if obj.is_in_group("Box"):
			var source = self.global_transform.origin
			obj.Box_hit(source)
	queue_free()
	#pass

func _on_area_3d_body_entered(body):
	pass # Replace with function body.
