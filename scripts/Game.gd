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
	active_block = grid.spawn_block()
	
func _input(event):
	if event.is_action_pressed("ui_down"):
		y_mod = 5
	
	if event.is_action_released("ui_down"):
		y_mod = 1

func _process(delta: float) -> void:
	
	if active_block == null:
		active_block = grid.spawn_block()
	
	move_counter += delta * (DROP_SPEED * y_mod)
	if move_counter > MOVE_COUNTER_MAX:

		var next_move: Vector2i = Vector2i(round(Input.get_axis("ui_left", "ui_right")), 1)
		if active_block.can_move(next_move):
			print("Block can move X and Y: ", next_move)
			active_block.move(next_move)
		elif active_block.can_move(Vector2i(0, 1)): # Vertical move only
			# This seems inefficient. If not X input but 
			# not valid this will be checked twice
			print("Block can move Y: ", Vector2i(0, 1))
			active_block.move(Vector2i(0, 1))
		else:
			print("Block can't move")
			active_block = null

		move_counter = 0
	
	pass
