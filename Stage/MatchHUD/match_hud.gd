extends MarginContainer
class_name MatchHUD

export(Array, NodePath) var _label_paths: Array

var _score_labels := {}
var _scores: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	MngMatch.connect("scores_updated", self, "_on_scores_updated")
	MngMatch.connect("match_begun", self, "_on_match_begun")


func _on_match_begun() -> void:
	var i_label := 0
	for score in MngMatch.scores.values():
		var label: Label = get_node(_label_paths[i_label])
		label.text = str(score.score)
		_score_labels[score.id] = label
		i_label += 1

func _on_scores_updated() -> void:
	for score in MngMatch.scores.values():
		_score_labels[score.id].text = str(score.score)
