extends Control
class_name DbBall

onready var _name: DebugLog = $C/Name
onready var _position: DebugLog = $C/Position
onready var _velocity: DebugLog = $C/Valocity

var _ball: Ball

const v2_format := "(%.3f, %.3f)"

func set_ball(ball: Ball) -> void:
	_ball = ball

func _process(delta: float) -> void:
	if _ball == null:
		return
	
	_name.set_info(_ball.name)
	_position.set_info(_format_vector2(_ball.position))
	_velocity.set_info(_format_vector2(_ball.velocity))

func _format_vector2(v2: Vector2) -> String:
	return v2_format % [v2.x, v2.y]
