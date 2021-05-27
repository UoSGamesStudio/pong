extends Node
class_name InputNode
"""
A base class for all input nodes
Should not be used itself
"""

export(String, "1", "2") var keyboard_input_index := "1"

const IButton := preload("res://Scripts/Input/i_button.gd")

onready var _dash := IButton.new()
onready var _attack := IButton.new()

var _control : Vector2

func get_control() -> Vector2:
	return _control
	
func get_dash():
	return _dash
	
func get_attack():
	return _attack
