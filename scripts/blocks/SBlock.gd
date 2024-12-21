extends Block

class_name SBlock

func _init(grid: Grid) -> void:
	super(
		grid,
		Enums.TileColor.Red,
		[Vector2i(5, 2), Vector2i(4, 2), Vector2i(4, 1), Vector2i(3, 1)]
	)
