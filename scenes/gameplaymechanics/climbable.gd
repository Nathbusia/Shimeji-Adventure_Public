extends Area2D
@onready var shimeji_character_playable: CharacterBody2D = $"../ShimejiCharacter_Playable"
@onready var shimeji_character_playable_player_2: CharacterBody2D = $"../ShimejiCharacter_Playable_Player2"
@onready var shimeji_character_playable_player_3: CharacterBody2D = $"../ShimejiCharacter_Playable_Player3"
@onready var shimeji_character_playable_player_4: CharacterBody2D = $"../ShimejiCharacter_Playable_Player4"

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = true
		body.jump_count = 0
		body.can_jump = true
		body.grab_wall_sound.play()
		body.velocity.x = 0

	if (body.name == "ShimejiCharacter_Playable_Player2") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = true
		body.jump_count = 0
		body.can_jump = true
		body.grab_wall_sound.play()
		body.velocity.x = 0

	if (body.name == "ShimejiCharacter_Playable_Player3") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = true
		body.jump_count = 0
		body.can_jump = true
		body.grab_wall_sound.play()
		body.velocity.x = 0

	if (body.name == "ShimejiCharacter_Playable_Player4") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = true
		body.jump_count = 0
		body.can_jump = true
		body.grab_wall_sound.play()
		body.velocity.x = 0

func _on_body_exited(body: Node2D) -> void:
	if (body.name == "ShimejiCharacter_Playable") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = false

	if (body.name == "ShimejiCharacter_Playable_Player2") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = false

	if (body.name == "ShimejiCharacter_Playable_Player3") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = false

	if (body.name == "ShimejiCharacter_Playable_Player4") && not body.is_fastfalling && body.can_carry:
		body.is_climbing = false
