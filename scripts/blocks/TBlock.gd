extends Block

class_name TBlock

const INIT_POSITION: Array[Vector2i] = [Vector2i(0, 0), Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, -1)]

var root_position: Vector2i:
	get: return self.positions[0]

func _init(grid: Grid) -> void:
	super(
		grid,
		Enums.TileColor.Purple,
		INIT_POSITION
	)
