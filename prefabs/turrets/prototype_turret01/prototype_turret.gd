extends Node3D

@export var node_3d:Node3D
@onready var Turret_Pitch = $Node3D/base/pitch
@onready var Fire_Point = $Node3D/base/pitch/point
const PH_PROJECTILE = preload("res://prefabs/projectiles/prototype_projectile01/prototype_projectile01.tscn")

func _ready():
	pass

func _input(event):
	#if Input.is_action_just_pressed("shoot"):
		#print("SHOOT...")
		#shoot()
	pass
	
func _process(_delta):
	var hit = ScreenPointToRay()
	#print(hit)
	if hit != Vector3.ZERO:
		node_3d.position = hit
		Turret_Pitch.look_at(hit, Vector3.UP)
	pass

func shoot():
	var b = PH_PROJECTILE.instantiate()
	add_child(b)
	#b.transform = fire_point.transform
	b.global_position = Fire_Point.global_position
	b.rotation = Turret_Pitch.rotation
	#pass

func ScreenPointToRay():
	var spaceState = get_world_3d().direct_space_state
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	var rayOrigin = camera.project_ray_origin(mousePos)
	var rayEnd  = rayOrigin + camera.project_ray_normal(mousePos) * 2000
	
	var params = PhysicsRayQueryParameters3D.new()
	#params.from = rayOrigin + Vector3.UP# not right but point the dir
	params.from = rayOrigin
	params.to = rayEnd
	#params.exclude = []
	var rayArray = spaceState.intersect_ray(params)
	#print(rayArray)
	if rayArray.has("position"):
		return rayArray["position"]
	return Vector3.ZERO
