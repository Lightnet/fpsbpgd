extends CharacterBody3D
class_name Player

# An enum allows us to keep track of valid states.
enum States {
	IDLE, #use
	ON_GROUND, #use
	IN_AIR, #use
	GLIDING,
	LADDER, #use
	FLY,
}

@onready var camera = $Camera3D

# With a variable that keeps track of the current state, we don't need to add more booleans.
var state: int = States.ON_GROUND
var ladder_array = []

@export var mouse_sensitivity = 0.002
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5
@export var aceel = 10
@export var CLIMB_SPEED = 4.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

#func _input(event):
	"""
	#if event.is_action_pressed("ui_cancel"):
		#Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * mouse_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	"""
	#pass

func _physics_process(_delta):
	"""
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	"""
	pass

func _unhandled_input(_event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	
	#if Input.is_action_just_pressed("inventory"):
		#toggle_inventory.emit()
		
func get_drop_position()->Vector3:
	var direction = -camera.global_transform.basis.z
	return camera.global_position + direction
	#pass

#need this for state else player.move_toward error not found v4.0.1
func _move_toward():
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.z = move_toward(velocity.z, 0, SPEED)
	pass
