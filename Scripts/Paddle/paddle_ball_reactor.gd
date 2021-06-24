extends BallReactor
class_name PaddleBallReactor

var velocity := Vector2()

func on_ball_collision(vel: Vector2, normal: Vector2) -> Vector2:
	return .on_ball_collision(vel, normal) + velocity
