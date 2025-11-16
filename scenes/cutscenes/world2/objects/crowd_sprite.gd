extends AnimatedSprite2D

var colors = [Color(1.0, 0.34, 0.34, 1.0),
		Color(0.38, 1.0, 0.38, 1.0),
		Color(1.0, 0.671, 0.38, 1.0),
		Color(1.0, 0.976, 0.38, 1.0),
		Color(0.835, 0.38, 1.0, 1.0),
		Color(0.588, 0.38, 1.0, 1.0),
		Color(0.328, 0.156, 0.398, 1.0),
		Color(0.242, 0.503, 1.0, 1.0),
		Color(0.703, 0.322, 0.115, 1.0),
		Color(0.863, 0.347, 0.48, 1.0),
		Color(0.404, 0.891, 0.571, 1.0),
		Color(0.633, 0.69, 1.0, 1.0),
		Color(0.34, 0.34, 1.0, 1.0)]

func _ready():
	randomize()
	modulate = colors[randi() % colors.size()]
