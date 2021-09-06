extends Control

onready var _anim: AnimationPlayer = $AnimationPlayer

var _is_playing := false

func _ready() -> void:
	MngMatch.connect("match_timeout", self, "_on_match_timeout")

func _on_match_timeout() -> void:
	_anim.play("time")
	_is_playing = true
	visible = true

func _on_animation_finished(anim_name):
	if _is_playing:
		_is_playing = false
		MngMatch.conclude_match()
		visible = false
