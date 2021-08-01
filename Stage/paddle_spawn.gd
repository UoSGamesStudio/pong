extends Node2D
class_name PaddleSpawn

export(Vector2) var shooting_direction := Vector2.LEFT
export(NodePath) var _goal_area_path: NodePath

var goal_area: GoalArea

func _ready() -> void:
	shooting_direction = shooting_direction.normalized()
	
	if not _goal_area_path.is_empty():
		goal_area = get_node(_goal_area_path)
