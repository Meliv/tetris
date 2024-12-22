extends Block

class_name OBlock

func _init(grid: Grid) -> void:
	super(
		grid,
		Enums.TileColor.Yellow,
		[Vector2i(4, 2), Vector2i(5, 2), Vector2i(4, 1), Vector2i(5, 1)]
	)
