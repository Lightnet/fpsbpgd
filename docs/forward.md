
https://stackoverflow.com/questions/48438273/godot-3d-get-forward-vector

var aim = $Player.get_global_transform().basis
var forward = -aim.z
var backward = aim.z
var left = -aim.x
var right = aim.x
