class_name PaddleHelper

static func find_fields_from_path(caller: Node, path: NodePath) -> PaddleFields:
	var f_node := caller.get_node(path)
	if f_node.has_method("get_fields"):
		return f_node.get_fields()
	else:
		print("Node %s at NodePath %s doesn't have a get_fields method" % [f_node.name, str(path)])
		return PaddleFields.new()
