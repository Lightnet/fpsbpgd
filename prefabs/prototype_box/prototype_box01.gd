extends RigidBody3D

var force = 35

func Box_hit(source):
	apply_central_impulse((global_transform.origin - source).normalized() * force )
