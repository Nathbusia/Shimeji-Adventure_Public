extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && body.can_carry:
		body.is_climbing_hori = true
		body.jump_count = 0
		body.grab_wall_sound.play()
		body.velocity.y = 0

	if (body.name == "ShimejiCharacter_Playable_Player2") && body.can_carry:
		body.is_climbing_hori = true
		body.jump_count = 0
		body.grab_wall_sound.play()
		body.velocity.y = 0
		
	if (body.name == "ShimejiCharacter_Playable_Player3") && body.can_carry:
		body.is_climbing_hori = true
		body.jump_count = 0
		body.grab_wall_sound.play()
		body.velocity.y = 0
		
	if (body.name == "ShimejiCharacter_Playable_Player4") && body.can_carry:
		body.is_climbing_hori = true
		body.jump_count = 0
		body.grab_wall_sound.play()
		body.velocity.y = 0

func _on_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && body.can_carry:
		body.is_climbing_hori = false
		
	if (body.name == "ShimejiCharacter_Playable_Player2") && body.can_carry:
		body.is_climbing_hori = false
		
	if (body.name == "ShimejiCharacter_Playable_Player3") && body.can_carry:
		body.is_climbing_hori = false
		
	if (body.name == "ShimejiCharacter_Playable_Player4") && body.can_carry:
		body.is_climbing_hori = false
