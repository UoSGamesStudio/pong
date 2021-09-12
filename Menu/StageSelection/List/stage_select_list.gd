extends Control

export(NodePath) var _pth_stage_preview: NodePath
export(NodePath) var _pth_stage_label: NodePath
export(NodePath) var _pth_list_items_parent: NodePath

var _stage_preview: TextureRect
var _stage_label: Label

var _list_items := []

func _ready() -> void:
	_stage_preview = get_node(_pth_stage_preview)
	_stage_label = get_node(_pth_stage_label)
	var list_items_parent := get_node(_pth_list_items_parent)
	
	var path_start := str(list_items_parent.get_path()) + '/'

	for item in list_items_parent.get_children():
		if item is StageListItem:
			if _list_items.size() != 0:
				var last: Control = _list_items[_list_items.size() - 1]
				last.focus_neighbour_bottom = NodePath(path_start + item.name)
				item.focus_neighbour_top = NodePath(path_start + last.name)
			
			_list_items.append(item)
			item.connect("highlighted", self, "_on_stage_list_item_highlighted")
	
	_list_items[0].grab_focus()

func _on_stage_list_item_highlighted(stage_list_item: StageListItem) -> void:
	_stage_label.text = stage_list_item.stage_name
	_stage_preview.texture = stage_list_item.stage_preview
