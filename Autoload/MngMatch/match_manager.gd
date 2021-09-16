extends Node
"""
autoload Game
"""

signal match_setup_finished
signal match_begun
signal scores_updated

signal match_timeout
signal match_finished

export var _default_match_time := 60

onready var _match_timer: Timer = $MatchTimer

var stage: Stage
var ball: Ball

var score_displays := []

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
var in_match := false

var winning_player := {}

func get_match_time_left() -> float:
	return _match_timer.time_left

func setup_match(stage: Stage, paddles: Array, ball: Ball) -> void:
	players.clear()
	self.stage = stage
	self.ball = ball
	
	var smaller := min(paddles.size(), stage.paddle_spawns.size())
	
	for i in range(smaller):
		var paddle := paddles[i] as Paddle
		var spawn := stage.paddle_spawns[i] as PaddleSpawn
		
		var id := i + 1
		paddle.input.set_input_index(id)
		paddle.input.set_process(false)
		paddle.position = spawn.global_position
		paddle.set_shooting_direction(spawn.shooting_direction)
		
		spawn.goal_area.player_id = id
		players[id] = {
			id = id, paddle = paddle, spawn = spawn, goal_area = spawn.goal_area, score = 0
		}
		score_displays[i].player_id = id
	
	paddles[0].hold_ball(ball)
	
	for ga in stage.goal_areas:
		ga.connect("goal_scored", self, "_on_goal_scored")
	
	emit_signal("match_setup_finished")

func begin_match() -> void:
	for player in players.values():
		player.paddle.input.set_process(true)
	
	_match_timer.start(_default_match_time)
	in_match = true
	emit_signal("match_begun")
	
func conclude_match() -> void:
	winning_player = players.values()[0];
	var largest_score: int = players.values()[0].score
	for i in range(1, players.values().size()):
		var score: int = players.values()[i].score
		if score > largest_score:
			winning_player = players[i]
			largest_score = score
	
	emit_signal("match_finished")
	

func _on_goal_scored(goal_scorer: GoalScorer, goal_area: GoalArea) -> void:
	for player in players.values():
		if player.goal_area != goal_area:
			continue
		
		print("%s points scored on Id %s" % [goal_scorer.points, player.id])
		player.score += goal_scorer.points
		emit_signal("scores_updated")
		# Add scores
		_reset_players()
		player.paddle.hold_ball(ball)

func _reset_players() -> void:
	for player in players.values():
		player.paddle.position = player.spawn.global_position
		player.paddle.get_fields().reset()

func _on_MatchTimer_timeout():
	in_match = false
	emit_signal("match_timeout")
