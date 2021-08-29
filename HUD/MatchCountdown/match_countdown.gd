extends Control
class_name MatchCountdown

onready var anim_player: AnimationPlayer = $AnimationPlayer

signal countdown_over

var _is_playing := false

func _ready() -> void:
	MngMatch.connect("match_setup_finished", self, "_on_match_setup_finished")

func play() -> void:
	anim_player.play("countdown")
	_is_playing = true

func _on_match_setup_finished() -> void:
	anim_player.play("countdown")
	_is_playing = true

func _on_animation_finished(_anim_name):
	if _is_playing:
		_is_playing = false
		MngMatch.begin_match()
