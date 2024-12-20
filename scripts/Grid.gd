class_name Grid

const SPAWN_POINT: Vector2i = Vector2i(5, 2)
const MAX_Y: int = 24
const MAX_X: int = 10
var _tile_map: TileMapLayer
var _cells: Array = []
	
func _init(tile_map_layer: TileMapLayer) -> void:
	_tile_map = tile_map_layer
	for y in MAX_Y:
		_cells.append([])
		for x in MAX_X:
			_cells[y].append(false)

func cell_occupied(position: Vector2i) -> bool:
	return _cells[position.y][position.x]

func set_tile(old_pos: Vector2i, new_pos: Vector2i, color: Enums.TileColor) -> void:
	if old_pos.y < 4:
		_tile_map.set_cell(old_pos, 3, _get_color(Enums.TileColor.LightGray))
	else:
		_tile_map.set_cell(old_pos, 3, _get_color(Enums.TileColor.Gray))
		
	_tile_map.set_cell(new_pos, 3, _get_color(color))
	
	#_cells[old_pos.y][old_pos.x] = false
	#_cells[new_pos.y][new_pos.x] = true

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
