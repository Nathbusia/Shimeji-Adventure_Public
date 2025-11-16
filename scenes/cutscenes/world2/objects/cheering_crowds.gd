extends Node2D
@onready var crowd_sprite: AnimatedSprite2D = $CrowdSprite

func ready():
	crowd_sprite.modulate = Color(rand_value(), rand_value(), rand_value())
	
func rand_value() -> float:
	var value = randf_range(0.0, 1.0)
	return value
