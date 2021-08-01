extends Area2D
class_name GoalArea

signal goal_scored(goal_scorer, goal_area)

func _on_GoalArea_body_entered(body: Node) -> void:
	if body.has_method("get_goal_scorer"):
		emit_signal("goal_scored", body.get_goal_scorer(), self)
