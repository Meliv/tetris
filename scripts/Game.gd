extends Node

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

@export var drop_speed: float = 25.0
@export var move_counter_max: float = 10.0

var grid: Grid

var active_block: Block

var move_counter: float = 0

var y_mod: int = 1
var x_mod: int = 0
var r_mod: bool = false

func _ready() -> void:
	grid = Grid.new(tile_map_layer)
	active_block = grid.spawn_block()
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		y_mod = 5
	
	if event.is_action_released("ui_down"):
		y_mod = 1
		
	x_mod = round(Input.get_axis("ui_left", "ui_right"))
	
	if event.is_action_pressed("ui_up"):
		r_mod = true
	
func _process(delta: float) -> void:
	
	if active_block == null:
		active_block = grid.spawn_block()
		
	if r_mod:
		active_block.rotate() # Need to check if can rotate and wall kick if able
		r_mod = false
		return
		
	if x_mod != 0 and active_block.can_move(Vector2i(x_mod, 0)):
		active_block.move(Vector2i(x_mod, 0))
		x_mod = 0
	
	move_counter += delta * (drop_speed * y_mod)
	if move_counter > move_counter_max:

		if active_block.can_move(Vector2i(0, 1)):
			active_block.move(Vector2i(0, 1))
		else:
			active_block = null
			grid.clear_lines()

		move_counter = 0
