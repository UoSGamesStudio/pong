extends State

export(float, 0.0, 10.0) var timeout := 3.0

onready var _timer: Timer = $Timer

var _can_dash := true

func execute(delta: float) -> void:
	if _input == null:
		return
	
	if _input.get_dash().is_down() && _can_dash:
		_can_dash = false
		_timer.start(timeout)


func _on_Timer_timeout():
	_can_dash = true
	print("timeout")
