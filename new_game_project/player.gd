extends RigidBody2D

@export var acceleration:float = 30.0
@export var jump_accel:float = -500.0


func _ready() -> void:
	pass
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("Right"):
		apply_central_impulse(Vector2(acceleration,0.5))
	elif Input.is_action_pressed("Left"):
		apply_central_impulse((Vector2(-acceleration,0.5)))
	elif Input.is_action_just_pressed("Up"):
		apply_central_impulse(Vector2(0, jump_accel))
	else:
		apply_central_impulse(Vector2.ZERO)



























############# WS for scrolling #################
