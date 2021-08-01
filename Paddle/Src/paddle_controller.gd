extends KinematicBody2D
class_name Paddle

export(NodePath) var _states_parent: NodePath
export var _default_facing_direction := Vector2.UP

onready var _ball_reactor: PaddleBallReactor = $BallCollision/Regular
onready var input: InputNode = $Input

var _fields := PaddleFields.new()
var _states := []

func set_shooting_direction(dir: Vector2) -> void:
	_fields.shooting_direction = dir
	rotation = dir.angle_to(_default_facing_direction)
	rotation = -rotation

func hold_ball(ball: Ball) -> void:
	_fields.held_ball = ball
	
func get_fields() -> PaddleFields:
	return _fields

func _ready() -> void:
	_fields.ball_hold_position = $BallHoldPosition
	_fields.shooting_direction = _default_facing_direction.normalized()
	
	_states = get_children() if _states_parent.is_empty() else get_node(_states_parent).get_children()
	for state in _states:
		state.set_fields(_fields)
		state.set_input(input)

func _process(delta: float) -> void:
	for state in _states:
		state.execute(delta)
		if state.escape_stack_execution:
			break
	
	var collision := move_and_collide(_fields.velocity)
	if collision:
		_fields.velocity = Vector2()
		
	_ball_reactor.velocity = _fields.velocity
