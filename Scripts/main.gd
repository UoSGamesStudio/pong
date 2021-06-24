extends Node
class_name Main
"""
class Main
Manages the lifetime of the game.
Responsible for loading and unloading stages, the players and the ball.
"""

func _ready():
	SignalTower.emit_signal("stage_loaded")


func _load_game() -> void:
	# First, we load the stage
	
	# Next, we load the players
	
	# Finally we load the ball
	pass
