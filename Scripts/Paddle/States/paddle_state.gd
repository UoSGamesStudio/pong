extends Node
class_name PaddleState

var escape_stack_execution := false

var _fields: PaddleFields
var _input: InputNode

func set_fields(fields: PaddleFields) -> void:
	_fields = fields

func set_input(input: InputNode) -> void:
	_input = input

func execute(_delta: float) -> void:
	pass
