extends BallReactor
class_name PaddleBallReactor

var velocity := Vector2()

func on_ball_collision(velocity: Vector2, normal: Vector2) -> Vector2:
	return .on_ball_collision(velocity, normal) + self.velocity
