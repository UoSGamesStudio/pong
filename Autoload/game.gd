extends Node
"""
autoload Game
"""

var next_scene: PackedScene

var paddles_scenes := []
var ball_scene: PackedScene

var stage: Stage
var ball: Ball
var paddles := []

func _on_goal_scored(goal_scorer: GoalScorer, goal_area: GoalArea) -> void:
	print(goal_scorer.points)
