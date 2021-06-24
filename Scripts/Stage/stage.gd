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

signal stage_loaded

func _ready():
	for child in get_children():
		if child is GoalArea:
			child.connect("goal_scored", self, "_on_goal_scored")
			
	emit_signal("stage_loaded")

func _on_goal_scored(goal_scorer: GoalScorer, goal_area: GoalArea) -> void:
	print(goal_scorer.points)
