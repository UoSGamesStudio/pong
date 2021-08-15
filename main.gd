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
	
	ScnNav.connect("to_main_menu", self, "_on_to_main_menu")
	
	var menu := _starting_menu.instance()
	add_child(menu)

func _clear() -> void:
	for child in get_children():
		child.queue_free()

func _on_proceed_to_next_scene() -> void:
	_clear()
	var next := ScnNav.next_scene.instance()
	ScnNav.next_scene = null
	add_child(next)
	
	if next is Stage:
		var paddles := []
		for ps in MngMatch.paddles_scenes:
			var paddle := ps.instance() as Paddle
			add_child(paddle)
			paddles.append(paddle)
		
		var ball := MngMatch.ball_scene.instance() as Ball
		add_child(ball)
		
		MngMatch.setup_match(next, paddles, ball)

func _on_to_main_menu() -> void:
	ScnNav.next_scene = _starting_menu
	_on_proceed_to_next_scene()
	pass
