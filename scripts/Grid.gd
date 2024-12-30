class_name Grid

const SPAWN_POINT: Vector2i = Vector2i(5, 2)
const MAX_Y: int = 24
const MAX_X: int = 10
var _tile_map: TileMapLayer
var _cells: Array = []
	
func _init(tile_map_layer: TileMapLayer) -> void:
	_tile_map = tile_map_layer
	
	for y in MAX_Y:
		var row = []
		_cells.append(row)
		for x in MAX_X:
			if y < 4:
				row.append(Enums.TileColor.LightGray)
			else:
				row.append(Enums.TileColor.Gray)
				
	render()

func render() -> void:
	for y in _cells.size():
		for x in _cells[y].size():
			_tile_map.set_cell(Vector2i(x, y), 3, _get_color(_cells[y][x]))

func spawn_block() -> Block:
	#var block: Block = Block.random(self) # Needs to be randomised
	var block: Block = ZBlock.new(self) # Needs to be randomised
	
	for p in block.positions:
		# Can this just be an array of Vectors?
		# Or a dictionary of Vectors?
		_cells[p.y][p.x] = block.color
	
	render()
	
	return block
	
func cell_is_occupied(position: Vector2i) -> bool:
	if _cells[position.y][position.x] in [Enums.TileColor.LightGray, Enums.TileColor.Gray]:
		return false
	
	return true
	
func cell_is_out_of_bounds(position: Vector2i) -> bool:
	if position.y >= 24:
		return true
	if position.x < 0 or position.x > 9:
		return true
	
	return false
	
func clear_cell(position: Vector2i):
	if position.y > 3:
		_cells[position.y][position.x] = Enums.TileColor.Gray
	else:
		_cells[position.y][position.x] = Enums.TileColor.LightGray

func set_color(position: Vector2i, color: Enums.TileColor):
	_cells[position.y][position.x] = color

func _get_color(color: Enums.TileColor) -> Vector2i:
	var tile: Vector2i
	match color:
		Enums.TileColor.LightBlue: tile = Vector2i(0, 0)
		Enums.TileColor.Blue: tile = Vector2i(1, 0)
		Enums.TileColor.Orange: tile = Vector2i(2, 0)
		Enums.TileColor.Yellow: tile = Vector2i(3, 0)
		Enums.TileColor.Green: tile = Vector2i(4, 0)
		Enums.TileColor.Purple: tile = Vector2i(5, 0)
		Enums.TileColor.Red: tile = Vector2i(6, 0)
		Enums.TileColor.Gray: tile = Vector2i(0, 1)
		Enums.TileColor.LightGray: tile = Vector2i(1, 1)
	return tile
