extends RigidBody2D

@export var acceleration:float = 30.0
@export var jump_accel:float = -100.0
@onready var _animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	pass
	

func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("Right"):
		_animated_sprite.play("Walk_Neutral_Right")
		apply_central_impulse(Vector2(acceleration,0.5))
	elif Input.is_action_pressed("Left"):
		_animated_sprite.play("Walk_Neutral_Left")
		apply_central_impulse((Vector2(-acceleration,0.5)))
	elif Input.is_action_just_pressed("Up"):
		_animated_sprite.play("Jump")
		apply_central_impulse(Vector2(0, jump_accel))
	elif Input.is_action_pressed("Down"):
		_animated_sprite.play("Down")
	else:
		apply_central_impulse(Vector2.ZERO)
		_animated_sprite.play("Idle")
