extends Node
"""
"""

export(PackedScene) var _scn_main_menu: PackedScene
export(PackedScene) var _scn_match_setup: PackedScene
export(PackedScene) var _scn_pause_menu: PackedScene
export(PackedScene) var _scn_default_hud: PackedScene

const GRP_HUD := "HUD"

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
	
	if get_tree().get_nodes_in_group(GRP_HUD).size() < 0:
		_main.add(_scn_default_hud.instance())
	
	MngMatch.setup_match(stage, paddles, ball)

func add_node(node: Node) -> void:
	_main.add(node)
