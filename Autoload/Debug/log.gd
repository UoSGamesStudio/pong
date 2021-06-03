extends Label
class_name DebugLog

export var prefix := ""
export var postfix := ""

func set_info(info_str: String) -> void:
	text = prefix + info_str + postfix
