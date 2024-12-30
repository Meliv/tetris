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
	for p in positions:
		var is_self: bool = p+move in positions
		if (_grid.cell_is_out_of_bounds(p+move) or _grid.cell_is_occupied(p+move)) and not is_self:
			return false
	
	return true
	
func move(movement: Vector2i) -> void:
	var new_positions: Array[Vector2i] = []
	
	# Clear first then draw. Stops individual
	# blocks in shape overwriting eachother
	for p in positions:
		_grid.clear_cell(p)
	
	for p in positions:
		_grid.set_color(p + movement, color)
		new_positions.append(p + movement)
		
	positions = new_positions
	_grid.render()
	
static func random(grid: Grid) -> Block:
	var block: Block
	var random = RandomNumberGenerator.new()
	match random.randi_range(0, 6):
		Enums.BlockType.I: block = IBlock.new(grid)
		Enums.BlockType.L: block = LBlock.new(grid)
		Enums.BlockType.O: block = OBlock.new(grid)
		Enums.BlockType.R: block = RBlock.new(grid)
		Enums.BlockType.S: block = SBlock.new(grid)
		Enums.BlockType.T: block = TBlock.new(grid)
		Enums.BlockType.Z: block = ZBlock.new(grid)
	
	return block
