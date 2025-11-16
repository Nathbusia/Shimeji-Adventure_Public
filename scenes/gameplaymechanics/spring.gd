extends RigidBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var spring_big: AudioStreamPlayer2D = $SpringBig
@onready var spring_small: AudioStreamPlayer2D = $SpringSmall


func _ready() -> void:
	freeze = true

func _on_spring_trigger_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			body.bounce()
			animated_sprite_2d.play("boing")
			if body.is_fastfalling:
				spring_big.play()
				body.sfx_slam_dash_land.stop()
				body.sfx_slam_dash_end.stop()
			else:
				spring_small.play()
				
		else:
			return
	if (body.name == "ShimejiCharacter_Playable_Player2"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			body.bounce()
			animated_sprite_2d.play("boing")
			if body.is_fastfalling:
				spring_big.play()
				body.sfx_slam_dash_land.stop()
				body.sfx_slam_dash_end.stop()
			else:
				spring_small.play()
				
		else:
			return
	if (body.name == "ShimejiCharacter_Playable_Player3"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			body.bounce()
			animated_sprite_2d.play("boing")
			if body.is_fastfalling:
				spring_big.play()
				body.sfx_slam_dash_land.stop()
				body.sfx_slam_dash_end.stop()
			else:
				spring_small.play()
				
		else:
			return
	if (body.name == "ShimejiCharacter_Playable_Player4"):
		var y_delta = position.y - body.position.y
		print(y_delta)
		if (y_delta > 50):
			body.bounce()
			animated_sprite_2d.play("boing")
			if body.is_fastfalling:
				spring_big.play()
				body.sfx_slam_dash_land.stop()
				body.sfx_slam_dash_end.stop()
			else:
				spring_small.play()
				
		else:
			return
