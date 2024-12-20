class_name Block

var positions: Array[Vector2i]

var _grid: Grid

var _color: Enums.TileColor
var color: Enums.TileColor:
	get: return _color

func _init(grid: Grid, color: Enums.TileColor, spawn_positions: Array[Vector2i]) -> void:
	if self.get_class() == "Block":
		push_error("Cannot instantiate Block object directly")
		return
	
	_grid = grid
	_color = color
	positions = spawn_positions

func can_move(move: Vector2i) -> bool:
	
	'''
	Need to check the following:
		1. Not overflowing the grid vertically
		2. Not overflowing the grid horizontally
		3. Able to move horizontally
		4. Able to move vertically
		
		Consider an I block falling down a single empty column
		If you move left, you hit a wall. But there's still space
		to fall vertically down. So we can discard the X movement,
		but the Y movement is still valid and can be applied
		
		We need to feed that back to the logic so it can move the
		block appropriately
	'''
	
	
	for p in positions:
		var is_self: bool = p+move in positions
		if (_grid.cell_is_out_of_bounds(p+move) or _grid.cell_is_occupied(p+move)) and not is_self:
			return false
	
	return true
	
func move(movement: Vector2i) -> void:
	var new_positions: Array[Vector2i] = []
	for p in positions:
		_grid.set_color(p + movement, color)
		_grid.clear_cell(p)
		new_positions.append(p + movement)
	positions = new_positions
	_grid.render()

'''
func move(movement: Vector2i) -> void:
	var new_positions: Array[Vector2i] = []
	for p in _positions:
		var new_p: Vector2i = movement + p
		_grid.set_tile(p, new_p, _color)
		new_positions.append(new_p)
		
	_positions = new_positions

'''
