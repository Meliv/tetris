class_name Block

var positions: Array[Vector2i]

var _color: Enums.TileColor
var color: Enums.TileColor:
	get: return _color

func _init(color: Enums.TileColor, spawn_positions: Array[Vector2i]) -> void:
	if self.get_class() == "Block":
		push_error("Cannot instantiate Block object directly")
		return
	
	_color = color
	positions = spawn_positions

'''
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

'''
