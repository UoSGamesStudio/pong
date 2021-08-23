extends BallReactor

export(NodePath) var _fields_path: NodePath

var _fields: PaddleFields

func _ready() -> void:
	_fields = PaddleHelper.find_fields_from_path(self, _fields_path)

func on_ball_collision(ball_velocity: Vector2, normal: Vector2) -> Vector2:
	# TODO take into account paddle rotation and velocity
	return _fields.body_normal * 15
