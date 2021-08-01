extends InputNode
class_name TwoPlayerInput

const KB_UP := "_kb_up"
const KB_DOWN := "_kb_down"
const KB_LEFT := "_kb_left"
const KB_RIGHT := "_kb_right"
const KB_DASH := "_kb_dash"
const KB_ATTACK := "_kb_attack"

func _process(delta):
	var control := Vector2()
	
	if Input.is_action_pressed(keyboard_input_index + KB_UP):
		control.y -= 1
	if Input.is_action_pressed(keyboard_input_index + KB_DOWN):
		control.y += 1
	if Input.is_action_pressed(keyboard_input_index + KB_LEFT):
		control.x -= 1
	if Input.is_action_pressed(keyboard_input_index + KB_RIGHT):
		control.x += 1
		
	self._control = control

	self._dash.update_state(Input.is_action_pressed(keyboard_input_index + KB_DASH))
	self._attack.update_state(Input.is_action_pressed(keyboard_input_index + KB_ATTACK))
	
