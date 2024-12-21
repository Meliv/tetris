extends Block

class_name ZBlock

func _init(grid: Grid) -> void:
	super(
		grid,
		Enums.TileColor.Green,
		[Vector2i(3, 2), Vector2i(4, 2), Vector2i(4, 1), Vector2i(5, 1)]
	)
