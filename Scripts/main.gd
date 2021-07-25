extends Node
class_name Main
"""
class Main
Manages the lifetime of the game.
Responsible for loading and unloading stages, the players and the ball.
"""

export(PackedScene) var _starting_menu: PackedScene


func _ready():
	SignalTower.connect("proceed_to_next_scene", self, "_on_proceed_to_next_scene")
	
	var menu := _starting_menu.instance()
	add_child(menu)

func _clear() -> void:
	for child in get_children():
		child.queue_free()

func _load_game() -> void:
	# First, we load the stage
	
	# Next, we load the players
	
	# Finally we load the ball
	pass

func _on_proceed_to_next_scene() -> void:
	_clear()
	var next := Game.next_scene.instance()
	add_child(next)
	
	
	if next is Stage:
		var paddles := []
		for ps in Game.paddles_scenes:
			var paddle := ps.instance() as Paddle
			add_child(paddle)
			paddles.append(paddle)
		
		next.set_paddles(paddles)
		
