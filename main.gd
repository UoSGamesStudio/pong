extends Node
class_name Main

var _non_permanent_nodes := []

func add(node: Node) -> void:
	_non_permanent_nodes.append(node)
	add_child(node)

func clear() -> void:
	for node in _non_permanent_nodes:
		if node != null:
			node.queue_free()
	
	_non_permanent_nodes.clear()

func _ready() -> void:
	Game.set_main_node(self)
