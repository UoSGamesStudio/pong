class_name PaddleFields

var shooting_direction: Vector2

var velocity := Vector2()

var held_ball: Ball
var ball_hold_position: Node2D

"""
Animation Fields
To be set by the regular states, to be consumed by the visual states
"""

var anim_has_thrown := false

func reset() -> void:
	velocity = Vector2()
