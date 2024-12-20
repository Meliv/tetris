extends CharacterBody2D


const SPEED = 2000.0
var last_frame = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	last_frame += delta
	
	if last_frame > 0.3:
		last_frame = 0
	
		var direction := Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = 0

		var direction_y := Input.get_axis("ui_up", "ui_down")
		if direction_y:
			velocity.y = direction_y * SPEED
		else:
			velocity.y = 0
			
		print("X: ", direction, " Y: ", direction_y, " Delta: ", last_frame)

		move_and_slide()
