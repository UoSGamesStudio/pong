extends TextureButton
class_name StageSelectIcon

export(PackedScene) var scn_stage: PackedScene
export(Texture) var stage_preview_image: Texture

signal stage_highlighted(ss_icon)
signal stage_selected(ss_icon)

var _just_focused := false

func _on_focus_entered():
	_just_focused = true
	emit_signal("stage_highlighted", self)

func _on_button_down():
	if _just_focused:
		_just_focused = false
		return
	emit_signal("stage_selected", self)
