class_name IButton

enum { RELEASED, DOWN, HELD, UP }

var _state : int = RELEASED

func is_down() -> bool:
	return _state == DOWN

func is_held() -> bool:
	return _state == DOWN || _state == HELD

func is_released() -> bool:
	return !self.is_held()
	
func get_state() -> int:
	return _state
	
func update_state(is_down: bool) -> void:
	self.evaluate(is_down, self.is_held())

func evaluate(down_current: bool, down_previous: bool) -> void:
	match [down_current, down_previous]:
		[true, true]:
			_state = HELD
		[true, false]:
			_state = DOWN
		[false, true]:
			_state = UP
		[false, false]:
			_state = RELEASED
