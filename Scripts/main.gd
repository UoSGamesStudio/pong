extends Node
class_name Main
"""
class Main
Manages the lifetime of the game.
Responsible for loading and unloading stages, the players and the ball.
"""

export(PackedScene) var _starting_menu: PackedScene

onready var _paddles: Paddle = $PaddleController
onready var _stage: Stage = $DevStage001
var _ball: Ball

func _ready():
	SignalTower.emit_signal("stage_loaded")
	
	$PaddleController.hold_ball($Ball)
	
	_stage.set_paddles([_paddles])

func _load_game() -> void:
	# First, we load the stage
	
	# Next, we load the players
	
	# Finally we load the ball
	pass
