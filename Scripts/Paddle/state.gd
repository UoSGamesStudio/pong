extends Node
class_name State

var _input: InputNode

func set_input(input: InputNode) -> void:
	_input = input

func execute(delta: float) -> void:
	pass
