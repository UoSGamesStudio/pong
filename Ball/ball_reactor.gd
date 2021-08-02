extends StaticBody2D
class_name BallReactor

var user_id: int

func on_ball_collision(velocity: Vector2, normal: Vector2) -> Vector2:
	return velocity.bounce(normal)
