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
		if _grid.cell_occupied(p) and !_positions.any(func(x): x == p):
			return false
	
	return true

func move(movement: Vector2i) -> void:
	var new_positions: Array[Vector2i] = []
	for p in _positions:
		var new_p: Vector2i = movement + p
		_grid.set_tile(p, new_p, _color)
		new_positions.append(new_p)
		
	_positions = new_positions

# Obsolete. Should be controlled by the grid
func render() -> void:
	for p: Vector2i in _positions:
		_grid.set_tile(p, p, _color)
