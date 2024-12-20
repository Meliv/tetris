class_name BlockFactory

static func spawn() -> Block:
	
	var b: int = randi_range(0, 7)
	
	var x: int = 0
	match b:
		0: x = 0
	
