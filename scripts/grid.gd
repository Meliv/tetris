class_name Grid

var _tile_map: TileMapLayer
	
func _init(tile_map_layer: TileMapLayer) -> void:
	_tile_map = tile_map_layer

func set_tile(position: Vector2i, color: Enums.TileColor) -> void:
	_tile_map.set_cell(position, 3, get_color(color))

func get_color(color: Enums.TileColor) -> Vector2i:
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
