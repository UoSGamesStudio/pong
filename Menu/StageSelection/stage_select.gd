extends Control

export(NodePath) var _stage_list_path: NodePath

var _stage_list: StageList

func _ready() -> void:
	_stage_list = get_node(_stage_list_path)
	
	for row in _stage_list.icons:
		for icon in row:
			icon.connect("stage_highlighted", self, "_on_stage_highlighted")

func _on_stage_highlighted(ss_icon: StageSelectIcon) -> void:
	print(ss_icon.name)
