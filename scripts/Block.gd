class_name Block

var _positions: Array[Vector2i]
var _grid: Grid
var _color: Enums.TileColor

func _init(grid: Grid, color: Enums.TileColor, spawn_positions: Array[Vector2i]) -> void:
	if self.get_class() == "Block":
		push_error("Cannot instantiate Block class directly")
		return
	
	_grid = grid
	_color = color
	_positions = spawn_positions

func can_move() -> bool:
	for p in _positions:
		if _grid.cell_occupied(p):
			return false
	
	return true

func render() -> void:
	for p: Vector2i in _positions:
		_grid.set_tile(p, _color)
