class_name Block

var positions: Array[Vector2i]

var _grid: Grid

var _color: Enums.TileColor
var color: Enums.TileColor:
	get: return _color

func _init(grid: Grid, block_color: Enums.TileColor, spawn_positions: Array[Vector2i]) -> void:
	if self.get_class() == "Block":
		push_error("Cannot instantiate Block object directly")
		return
	
	_grid = grid
	_color = block_color
	
	for p in spawn_positions:
		positions.append(p + grid.SPAWN_POINT)

func can_move(destination: Vector2i) -> bool:
	for p in positions:
		var is_self: bool = p + destination in positions
		if (_grid.cell_is_out_of_bounds(p + destination) or _grid.cell_is_occupied(p + destination)) and not is_self:
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
	
func rotate() -> void:
	var new_positions: Array[Vector2i] = []

	for p in positions:
		_grid.clear_cell(p)

	for p in positions:
		var adjusted_root = p - self.root_position
		var rotated_pos = Vector2i(-adjusted_root.y, adjusted_root.x) + self.root_position
		_grid.set_color(rotated_pos, color)
		new_positions.append(rotated_pos)

	positions = new_positions
	_grid.render()

static func random(grid: Grid) -> Block:
	var block: Block
	var gen = RandomNumberGenerator.new()
	match gen.randi_range(0, 6):
		Enums.BlockType.I: block = IBlock.new(grid)
		Enums.BlockType.L: block = LBlock.new(grid)
		Enums.BlockType.O: block = OBlock.new(grid)
		Enums.BlockType.R: block = RBlock.new(grid)
		Enums.BlockType.S: block = SBlock.new(grid)
		Enums.BlockType.T: block = TBlock.new(grid)
		Enums.BlockType.Z: block = ZBlock.new(grid)
	
	return block
