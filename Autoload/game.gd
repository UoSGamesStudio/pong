extends Node
"""
"""

export(PackedScene) var _scn_main_menu: PackedScene
export(PackedScene) var _scn_match_setup: PackedScene
export(PackedScene) var _scn_pause_menu: PackedScene

var _main: Main = null

func set_main_node(node: Node) -> void:
	if _main != null:
		return
	
	_main = node
	to_main_menu()

func to_main_menu() -> void:
	_main.clear()
#	var menu := _scn_main_menu.instance()
	_main.add(_scn_main_menu.instance())

func to_match_setup() -> void:
	_main.clear()
#	var setup := _scn_match_setup.instance()
	_main.add(_scn_match_setup.instance())

func to_stage(scn_stage: PackedScene, scn_ball: PackedScene, scn_paddles: Array) -> void:
	_main.clear()
	var stage := scn_stage.instance()
	var ball := scn_ball.instance()
	var paddles := []
	for p in scn_paddles:
		paddles.append(p.instance())
	
	_main.add(stage)
	_main.add(ball)
	for p in paddles:
		_main.add(p)
	
	MngMatch.setup_match(stage, paddles, ball)
	var cvs_hud := CanvasLayer.new()
	cvs_hud.layer = 1
	cvs_hud.add_child(stage.scn_hud.instance())
	
	var cvs_pause := CanvasLayer.new()
	cvs_pause.layer = 2
	cvs_pause.add_child(_scn_pause_menu.instance())
	
	_main.add(cvs_hud)
	_main.add(cvs_pause)

func add_node(node: Node) -> void:
	_main.add(node)
