extends Node2D


@export var speed = 200.0

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	
	move_local_x(-(mouse_position.x))
	move_local_y(mouse_position.y)
