extends Control
class_name DbBall

onready var _name: DebugLog = $C/Name
onready var _velocity: DebugLog = $C/Valocity

onready var _main: Main = get_node("/root/Main")
var _ball: Ball

func set_ball(ball: Ball) -> void:
	_ball = ball

func _ready() -> void:
	var main: Main = get_node("/root/Main")
	set_ball(main._ball)

func _process(delta: float) -> void:
	if _main._ball != null:
		_name.set_info(_main._ball.name)
		_velocity.set_info(str(_main._ball.velocity))
