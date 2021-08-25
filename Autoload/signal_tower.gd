extends Node
"""
autolaod SignalTower
A Hub for major signals to get fired through
Reserved for general signals only
"""


func _ready() -> void:
	print(self.name)

signal proceed_to_next_scene
