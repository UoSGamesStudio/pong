extends Node
"""
"""

export(PackedScene) var _scn_main_menu: PackedScene
export(PackedScene) var _scn_match_setup: PackedScene

var _main_node: Node = null

func set_main_node(node: Node) -> void:
	if _main_node != null:
		return
	
	_main_node = node
	to_main_menu()

func to_main_menu() -> void:
	_clear_main()
#	var menu := _scn_main_menu.instance()
	_main_node.add_child(_scn_main_menu.instance())

func to_match_setup() -> void:
	_clear_main()
#	var setup := _scn_match_setup.instance()
	_main_node.add_child(_scn_match_setup.instance())

func to_stage(scn_stage: PackedScene, scn_ball: PackedScene, scn_paddles: Array) -> void:
	_clear_main()
	var stage := scn_stage.instance()
	var ball := scn_ball.instance()
	var paddles := []
	for p in scn_paddles:
		paddles.append(p.instance())
	
	_main_node.add_child(stage)
	_main_node.add_child(ball)
	for p in paddles:
		_main_node.add_child(p)
	
	MngMatch.setup_match(stage, paddles, ball)

func add_node(node: Node) -> void:
	_main_node.add_child(node)

func _clear_main() -> void:
	for child in _main_node.get_children():
		child.queue_free()
