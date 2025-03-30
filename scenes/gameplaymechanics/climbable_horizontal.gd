extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		body.is_climbing_hori = true
		body.jump_count = 0
		body.grab_wall_sound.play()
		body.velocity.y = 0


func _on_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable"):
		body.is_climbing_hori = false
