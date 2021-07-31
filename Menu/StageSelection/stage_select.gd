extends Control

export(NodePath) var _stage_list_path: NodePath
export(NodePath) var _stage_display_path: NodePath

onready var _anim_player: AnimationPlayer = $AnimationPlayer

var _stage_list: StageList
var _stage_preview: TextureRect

func _ready() -> void:
	_stage_list = get_node(_stage_list_path)
	_stage_preview = get_node(_stage_display_path)
	
	for row in _stage_list.icons:
		for icon in row:
			icon.connect("stage_highlighted", self, "_on_stage_highlighted")
			icon.connect("stage_selected", self, "_on_stage_selected")

func _on_stage_highlighted(ss_icon: StageSelectIcon) -> void:
	print(ss_icon.name)
	_stage_preview.texture = ss_icon.stage_preview_image
	_anim_player.play("stage_preview_popin")

func _on_stage_selected(ss_icon: StageSelectIcon) -> void:
	print(ss_icon.name + "select")
