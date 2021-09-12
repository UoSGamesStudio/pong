extends MarginContainer
class_name StageListItem

export(String) var stage_name := "Filler"

export(PackedScene) var scn_stage: PackedScene
export(Texture) var stage_preview: Texture

signal highlighted(stage_list_item)

func _ready() -> void:
	$Label.text = stage_name

func _on_focus_entered():
	emit_signal("highlighted", self)
