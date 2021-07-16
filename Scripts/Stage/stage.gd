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

var _paddle_spawns := []

signal stage_loaded

func _ready():
	for child in get_children():
		if child is GoalArea:
			child.connect("goal_scored", self, "_on_goal_scored")
			
	emit_signal("stage_loaded")
	
	for path in _paddle_spawn_paths:
		_paddle_spawns.append(get_node(path))
	
func set_paddles(paddles: Array) -> void:
	var smaller := min(paddles.size(), _paddle_spawns.size())
	for i in range(smaller):
		var paddle := paddles[i] as Paddle
		var spawn := _paddle_spawns[i] as PaddleSpawn
		
		paddle.position = spawn.global_position
		paddle.set_shooting_direction(spawn.shooting_direction)

func _on_goal_scored(goal_scorer: GoalScorer, goal_area: GoalArea) -> void:
	print(goal_scorer.points)
