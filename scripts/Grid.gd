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
			set_color(Vector2i(x, y), _cells[y][x])

func spawn_block() -> Block:
	var block: Block = TBlock.new(self) # Needs to be randomised
	
	for p in block.positions:
		_cells[p.y][p.x] = block.color
	
	render()
	
	return block
	
func cell_is_occupied(position: Vector2i) -> bool:
	return false

func set_color(position: Vector2i, color: Enums.TileColor):
	_tile_map.set_cell(position, 3, _get_color(color))

func _get_color(color: Enums.TileColor) -> Vector2i:
	var tile: Vector2i
	match color:
		Enums.TileColor.LightBlue: tile = Vector2i(0,0)
		Enums.TileColor.Blue: tile = Vector2i(1,0)
		Enums.TileColor.Orange: tile = Vector2i(2,0)
		Enums.TileColor.Yellow: tile = Vector2i(3,0)
		Enums.TileColor.Green: tile = Vector2i(4,0)
		Enums.TileColor.Purple: tile = Vector2i(5,0)
		Enums.TileColor.Red: tile = Vector2i(6,0)
		Enums.TileColor.Gray: tile = Vector2i(0,1)
		Enums.TileColor.LightGray: tile = Vector2i(1,1)
	return tile
