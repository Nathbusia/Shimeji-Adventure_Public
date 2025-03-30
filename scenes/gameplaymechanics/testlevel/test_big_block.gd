extends RigidBody2D
@onready var button: RigidBody2D = $"../Button"

const SCROLL_VELOCITY = 600.0

func _process(delta: float) -> void:
	if button.pressed:
		linear_velocity = Vector2(0, -SCROLL_VELOCITY) 
	else:
		linear_velocity = Vector2(0, SCROLL_VELOCITY) 
