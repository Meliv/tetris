extends Block

class_name LBlock

func _init(grid: Grid) -> void:
	super(
		grid,
		Enums.TileColor.Orange,
		[Vector2i(3, 2), Vector2i(4, 2), Vector2i(5, 2), Vector2i(5, 1)]
	)
