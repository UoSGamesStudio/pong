extends Control
class_name MatchCountdown

onready var anim_player: AnimationPlayer = $AnimationPlayer

signal countdown_over

var _is_playing := false

func play() -> void:
	anim_player.play("countdown")
	_is_playing = true

func _on_animation_finished(_anim_name):
	if _is_playing:
		_is_playing = false
		emit_signal("countdown_over")
