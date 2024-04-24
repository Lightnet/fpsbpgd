extends Node
#handle scene data
#var scene3d:Node

func _enter_tree():
	#print("scene:", self)
	SceneData.setLevelScene(self)
	#pass
