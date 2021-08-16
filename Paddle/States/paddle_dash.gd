extends PaddleState

export(float, 2.0, 50.0) var _dash_speed := 19.0
export(float, 0.0, 2.0) var timeout := 0.2

onready var _timer: Timer = $Timer

var _dash_vector: Vector2
var _can_dash := true
#var _dashing := false

func execute(delta: float) -> void:
	if not _can_dash: # For now we assume we are dashing
		_fields.velocity = _fields.dash_vector * _dash_speed
		return

	if _input == null:
		return
	
	if _input.get_dash().is_down():
		_can_dash = false
		_fields.dash_vector = _input.get_control()
		_fields.is_dashing = true
		_timer.start(timeout)
		escape_stack_execution = true


func _on_Timer_timeout():
	_can_dash = true
	_fields.is_dashing = false
	_fields.dash_vector = Vector2()
	escape_stack_execution = false
