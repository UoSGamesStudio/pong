extends Node2D
class_name Stage
"""
class Stage
The arena in which the games take place.
Stage scenes should only contain:
- Ball and Player spawn points
- the walls
- the goals
- the camera
- anything visual pertaining to the above
"""

export(Array, NodePath) var _paddle_spawn_paths := []

enum StageType { ONE_V_ONE }
export(StageType) var stage_type: int

var paddle_spawns := []
var goal_areas := []

func _ready():
	for path in _paddle_spawn_paths:
		paddle_spawns.append(get_node(path))
	
	for child in get_children():
		if child is GoalArea:
			goal_areas.append(child)
