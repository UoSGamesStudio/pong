extends Node
class_name InputNode
"""
A base class for all input nodes
Should not be used itself
"""

export(String, "1", "2") var keyboard_input_index := "1"

onready var _dash := IButton.new()
onready var _attack := IButton.new()

var _control : Vector2

func set_input_index(index: int) -> void:
	keyboard_input_index = str(index)

func get_control() -> Vector2:
	return _control
	
func get_dash():
	return _dash
	
func get_attack():
	return _attack
