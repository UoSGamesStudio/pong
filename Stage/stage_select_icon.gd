extends TextureButton
class_name StageSelectIcon

export(PackedScene) var scn_stage: PackedScene
export(Texture) var stage_preview_image: Texture

signal stage_highlighted(ss_icon)

func _on_button_down():
	emit_signal("stage_highlighted", self)
