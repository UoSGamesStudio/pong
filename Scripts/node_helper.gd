class_name ExNode

static func get_all_children(node: Node) -> Array:
	if node.get_child_count() == 0:
		return []
	
	var children := []
	for child in node.get_children():
		children.append(child)
		children.append_array(get_all_children(child))
	
	return children
