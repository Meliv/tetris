extends Node

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const DROP_SPEED: float = 10.0
const MOVE_COUNTER_MAX: float = 10.0

var grid: Grid

var active_block: Block

var move_counter: float = 0

var y_mod: float = 1
var x_mod: float = 0

func _ready() -> void:
	grid = Grid.new(tile_map_layer)
	
	active_block = TBlock.new(grid)
	#active_block.render()
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		y_mod = 5
	
	if event.is_action_released("ui_down"):
		y_mod = 1

func _process(delta: float) -> void:
	
	move_counter += delta * (DROP_SPEED * y_mod)
	if move_counter > MOVE_COUNTER_MAX:

		if active_block.can_move():
			var new_x: int = round(Input.get_axis("ui_left", "ui_right"))
			print(new_x)
			active_block.move(Vector2i(new_x, 1))
		else:
			pass

		'''
		var new_position: Vector2i = Vector2i(new_x, last_position.y+1)
		
		if new_position.y < 24:
			var last_pos_color: Enums.TileColor = Enums.TileColor.Gray
			
			if last_position.y < 4:
				last_pos_color = Enums.TileColor.LightGray
			
			grid.set_tile(last_position, last_pos_color)
			grid.set_tile(new_position, Enums.TileColor.Red)
			last_position = new_position
		'''
		move_counter = 0
	
	pass
