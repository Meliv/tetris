extends Node

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const DROP_SPEED: float = 10.0

var last_position: Vector2i = Vector2i(0,0)
var move_counter: float = 0
var move_counter_max: float = 10.0

var speed_mod: float = 1
var x_mod: float = 0

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("ui_down"):
		speed_mod = 5
	
	if event.is_action_released("ui_down"):
		speed_mod = 1

func _ready() -> void:
	_set_tile(last_position, TileColor.Red)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	move_counter += delta * (DROP_SPEED * speed_mod)
	
	if move_counter > move_counter_max:
		
		x_mod = roundf(Input.get_axis("ui_left", "ui_right"))
		
		var new_position: Vector2i = Vector2i(clampf(last_position.x + x_mod, 0, 9), last_position.y+1)
		
		if new_position.y < 24:
			# Stop from going off bottom of screen
			
			var last_pos_color: TileColor = TileColor.Gray
			
			if last_position.y < 4:
				last_pos_color = TileColor.LightGray
			
			_set_tile(last_position, last_pos_color)
			_set_tile(new_position, TileColor.Red)
			last_position = new_position
			move_counter = 0
	
	pass
	
func _set_tile(position: Vector2i, color: TileColor) -> void:
	tile_map_layer.set_cell(position, 3, _get_color(color))

func _get_color(color: TileColor) -> Vector2i:
	var tile: Vector2i
	match color:
		TileColor.LightBlue: tile = Vector2i(0,0)
		TileColor.Blue: tile = Vector2i(1,0)
		TileColor.Orange: tile = Vector2i(2,0)
		TileColor.Yellow: tile = Vector2i(3,0)
		TileColor.Green: tile = Vector2i(4,0)
		TileColor.Purple: tile = Vector2i(5,0)
		TileColor.Red: tile = Vector2i(6,0)
		TileColor.Gray: tile = Vector2i(0,1)
		TileColor.LightGray: tile = Vector2i(1,1)
	return tile
	
enum TileColor {
	LightBlue,
	Blue,
	Orange,
	Yellow,
	Green,
	Purple,
	Red,
	Gray,
	LightGray
}
