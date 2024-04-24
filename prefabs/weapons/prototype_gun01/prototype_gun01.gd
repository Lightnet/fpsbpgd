extends Node3D


const BULLET = preload("res://prefabs/projectiles/prototype_bullet01/prototype_bullet01.tscn")
@onready var fire_point = $FirePoint

func _ready():
	pass

func _input(_event):
	if Input.is_action_just_pressed("shoot"):
		print("SHOOT...")
		shoot()

#func _process(delta):
	#pass
	
func shoot():
	var b = BULLET.instantiate()
	#add_child(b)
	print("owner: ",owner)
	#get_tree().add_sibling(b)#nope
	#add_sibling(b)
	#call_deferred()
	#print("get_tree():", get_tree().get_root().get_node('main'))
	
	#get_tree().get_root().get_node('main/rooms/level01').add_sibling(b)
	#get_tree().get_root().get_node('main/rooms/level01').add_child(b)
	SceneData.getLevelScene().add_child(b)
	#owner.add_child(b)
	#b.global_position = fire_point.global_position
	#b.rotation = fire_point.rotation
	#owner.add_child(b)
	b.transform = fire_point.global_transform
	#b.global_position = fire_point.global_position
	#b.global_rotation = fire_point.global_rotation
	
	#pass
