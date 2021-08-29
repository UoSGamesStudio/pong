extends Control
class_name ScoreDisplay

onready var _label: Label = $Label

var player_id := -1

func _ready() -> void:
	MngMatch.connect("scores_updated", self, "_on_scores_updated")
	MngMatch.score_displays.append(self)

func _on_scores_updated() -> void:
	var player: Dictionary = MngMatch.players[player_id]
	if player != null:
		_label.text = str(player.score)
