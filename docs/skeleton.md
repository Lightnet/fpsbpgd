https://forum.godotengine.org/t/how-to-apply-a-pose-to-a-bone-after-an-animation-in-godot-4/1060

```
var spine = skeleton.find_bone("spine_02")
var pose = skeleton.get_bone_global_pose_no_override(spine)

pose = pose.rotated_local(Vector3.FORWARD, rot)

skeleton.set_bone_global_pose_override(spine, pose, 1.0, true)
```
