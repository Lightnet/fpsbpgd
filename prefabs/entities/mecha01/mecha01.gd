extends CharacterBody3D

@onready var mech_poses = $male_toon_block01_mecha04/mech_poses

@export var mouse_sensitivity = 0.002
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@export var aceel = 10
@export var CLIMB_SPEED = 4.0
@onready var camera = $Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	#mech_poses["parameters/"]
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	#if inventory_interface.visible:
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	#else:
		#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	pass

func _input(event):
	#print(event.relative.x)
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.005)
		#camera.rotate_x(-event.relative.y * 0.005)
		#camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
	pass

func _physics_process(delta):
	
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	if not is_on_floor():
		velocity.y -= gravity * delta
	#print("input_dir: ",input_dir)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#print("direction: ", direction)
	if direction:
		velocity.x = lerp(velocity.x, direction.x * SPEED, aceel * delta)
		velocity.z = lerp(velocity.z, direction.z * SPEED, aceel * delta)
	else:
		#print("player: ", player)
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		pass

		
	move_and_slide()
	
	
	pass



