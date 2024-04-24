extends Node3D

@onready var timer = $Timer
var canThrow = true
const Grenade = preload("res://prefabs/throwable/grenade01/grenade.tscn")
@onready var fire_point = $fire_point

func _ready():
	pass
	
#func _process(delta):
	#pass
func _physics_process(_delta):
	grenadeThrow()
	#pass
	
func grenadeThrow():
	
	if Input.is_action_just_released("Throw") && canThrow:
		print("throw grenade")
		canThrow = false
		timer.start()
		var grenadeIns = Grenade.instantiate()
		grenadeIns.position = fire_point.global_position
		get_tree().current_scene.add_child(grenadeIns)
		#print(fire_point.global_position)
		
		var force = -10
		var upDirection = 3.5
		
		var playerRoatate = fire_point.global_transform.basis.z.normalized()
		#print(playerRoatate)
		var dir = playerRoatate * force + Vector3(0,upDirection,0)
		#print(dir)
		grenadeIns.apply_central_impulse(dir)
		#grenadeIns.apply_central_impulse(playerRoatate * force * Vector3(0,upDirection,0))
		
	pass


func _on_timer_timeout():
	canThrow = true
	pass
