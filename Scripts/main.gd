extends Node
class_name Main
"""
class Main
Manages the lifetime of the game.
Responsible for loading and unloading stages, the players and the ball.
"""

var _paddles := []
var _stage: Stage
var _ball: Ball

func _ready():
	SignalTower.emit_signal("stage_loaded")
	
	$PaddleController.hold_ball($Ball)

func _load_game() -> void:
	# First, we load the stage
	
	# Next, we load the players
	
	# Finally we load the ball
	pass
