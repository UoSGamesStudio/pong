extends Node
"""
autoload Game
"""

signal scores_updated

var paddles_scenes := []
var ball_scene: PackedScene

var stage: Stage
var ball: Ball

"""
An array containing dictionaries of player information
{
	id: The player id and input id
	paddle: The player paddle
	spawn: the paddle spawn
	goal_area: the player's goal area
}
"""
var players := {}

var scores := {}

func setup_match(stage: Stage, paddles: Array, ball: Ball) -> void:
	self.stage = stage
	self.ball = ball
	
	var smaller := min(paddles.size(), stage.paddle_spawns.size())
	
	for i in range(smaller):
		var paddle := paddles[i] as Paddle
		var spawn := stage.paddle_spawns[i] as PaddleSpawn
		
		var id := i + 1
		paddle.input.set_input_index(id)
		paddle.position = spawn.global_position
		paddle.set_shooting_direction(spawn.shooting_direction)
		
		players[id] = {
			id = id, paddle = paddle, spawn = spawn, goal_area = spawn.goal_area
		}
		scores[spawn.goal_area] = { id = id, score = 0 }
		
	
	self.paddles[0].hold_ball(ball)
	
	for ga in stage.goal_areas:
		ga.connect("goal_scored", self, "_on_goal_scored")

func _on_goal_scored(goal_scorer: GoalScorer, goal_area: GoalArea) -> void:
	for player in players.values():
		if player.goal_area != goal_area:
			continue
		
		print("%s points scored on Id %s" % [goal_scorer.points, player.id])
		scores[goal_area].score += goal_scorer.points
		emit_signal("scores_updated")
		# Add scores
		_reset_players()
		player.paddle.hold_ball(ball)

func _reset_players() -> void:
	for player in players.values():
		player.paddle.position = player.spawn.global_position
